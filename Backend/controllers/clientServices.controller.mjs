import db from "../config/db.config.mjs"; // Adjust the path as needed

// Controller function to add client services
export const addClientService = async (req, res) => {
  const { service_id, subdivision_id, am_id, client_id } =
    req.body.selectedSubdivisions[0];

  try {
    // Validate required fields
    if (!service_id || !subdivision_id || !am_id || !client_id) {
      return res.status(400).json({ error: "All fields are required." });
    }

    // Insert into client_services table
    const insertQuery = `
      INSERT INTO client_services (client_id, service_id, subdivision_id, am_id)
      VALUES (?, ?, ?, ?)
    `;

    const result = await new Promise((resolve, reject) => {
      db.query(
        insertQuery,
        [client_id, service_id, subdivision_id, am_id],
        (err, results) => {
          if (err) return reject(err);
          resolve(results);
        }
      );
    });

    // Respond with success message and inserted record ID
    res.status(201).json({
      message: "Client service added successfully",
      client_service_id: result.insertId, // The ID of the inserted record
    });
  } catch (error) {
    console.error("Error adding client service:", error);
    res
      .status(500)
      .json({ error: "Server error. Failed to add client service." });
  }
};

export const getServices = (req, res) => {
  const query = `
    SELECT s.service_id, s.service_name, sd.subdivision_id, sd.am_id, sd.service_id AS subdivision_service_id, sd.description FROM services s JOIN subdivisions sd ON s.service_id = sd.service_id ORDER BY s.service_id;`;

  db.query(query, (err, results) => {
    if (err) {
      console.error("Error fetching services:", err);
      return res.status(500).json({ error: "Internal Server Error" });
    }

    console.log("Raw Results:", results); // Debug: Check raw results

    // Transform the results into a structured JSON format
    const servicesMap = {};
    results.forEach((row) => {
      if (!servicesMap[row.service_id]) {
        servicesMap[row.service_id] = {
          service_name: row.service_name,
          subdivisions: [],
        };
      }

      // Push all relevant subdivision details to the subdivisions array
      servicesMap[row.service_id].subdivisions.push({
        subdivision_id: row.subdivision_id,
        am_id: row.am_id,
        service_id: row.subdivision_service_id,
        description: row.description,
      });
    });

    // Convert the map to an array for the final response
    const services = Object.keys(servicesMap).map((key) => ({
      service_id: parseInt(key, 10),
      service_name: servicesMap[key].service_name,
      subdivisions: servicesMap[key].subdivisions,
    }));

    console.log("Structured Services:", services); // Debug: Check structured services

    res.json(services);
  });
};

export const getClientServices = (req, res) => {
  const { client_id } = req.params;

  const query = `
    SELECT
      cs.client_service_id,
      s.service_id,
      s.service_name,
      sd.subdivision_id,
      sd.subdivision_name
    FROM
      client_services cs
    JOIN
      services s ON cs.service_id = s.service_id
    LEFT JOIN
      subdivisions sd ON cs.subdivision_id = sd.subdivision_id
    WHERE
      cs.client_id = ?
  `;

  db.query(query, [client_id], (err, results) => {
    if (err) {
      return res.status(500).send(err);
    }
    if (results.length === 0) {
      return res.status(404).send("No services found for the client.");
    }

    const services = {};
    results.forEach((row) => {
      if (!services[row.service_id]) {
        services[row.service_id] = {
          service_id: row.service_id,
          service_name: row.service_name,
          subdivisions: [],
        };
      }
      if (row.subdivision_id) {
        services[row.service_id].subdivisions.push({
          subdivision_id: row.subdivision_id,
          subdivision_name: row.subdivision_name,
        });
      }
    });

    res.status(200).json(Object.values(services));
  });
};