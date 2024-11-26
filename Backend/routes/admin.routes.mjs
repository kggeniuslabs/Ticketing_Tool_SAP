import express from "express";
import {
  getAllInternalCount,
  getAllTickets,
  getAmIdBasedTicketFetch,
  getAvailableServices,
  getClientCompanyCount,
  getClientDetails,
  getClientServices,
  getDomainFilteredTickets,
  getInternalDetails,
  getTicketsCountAndStatus
} from "../controllers/admin.controller.mjs";

const router = express.Router();

router.get("/client-services", getClientServices);
router.get("/available-services/:clientId", getAvailableServices);

// Admin Dashboard
router.get("/ticketdetails", getTicketsCountAndStatus);
router.get("/getalltickets", getAllTickets);

router.get('/getClientCompanyCount',getClientCompanyCount)
router.get("/getallclient", getClientDetails);

router.get('/getallinternalcount', getAllInternalCount)
router.get("/getallinternal", getInternalDetails);

router.get('/getalldomaintickets',getDomainFilteredTickets)
router.get('/getAmIdBasedTicketFetch/:am_id',getAmIdBasedTicketFetch)


export default router;
