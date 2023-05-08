const { MedicalAppointmentController } = require('../controllers/medical-appointment.controller');
const { validateSchema } = require('../middlewares/data-validation.middleware');
const { create } = require('../schemas/medical-appointment.schema');
const router = require('express').Router();

const medAppController = new MedicalAppointmentController();

router.get('/', medAppController.getAll.bind(medAppController));
router.get('/:id', medAppController.getOne.bind(medAppController));
router.post('/', validateSchema(create), medAppController.create.bind(medAppController));
router.put('/:id', medAppController.update.bind(medAppController));
router.delete('/:id', medAppController.deleteOne.bind(medAppController));

module.exports = router;
