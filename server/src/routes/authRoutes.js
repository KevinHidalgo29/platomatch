const express = require('express');
const router = express.Router();
const { registrarUsuario } = require('../controllers/authController');

router.post('/register', registrarUsuario);

// IMPORTANTE: Asegúrate de tener esta línea al final
module.exports = router;