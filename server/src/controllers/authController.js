const pool = require('../config/db');
const bcrypt = require('bcryptjs');

const registrarUsuario = async (req, res) => {
  const { email, password } = req.body;

  if (!email || !password) {
    return res.status(400).json({ mensaje: 'El correo y la contraseña son obligatorios.' });
  }

  if (password.length < 6) {
    return res.status(400).json({ mensaje: 'La contraseña debe tener al menos 6 caracteres.' });
  }

  try {
    const [existente] = await pool.query('SELECT * FROM usuarios WHERE correo = ?', [email]);
    if (existente.length > 0) {
      return res.status(400).json({ mensaje: 'El correo electrónico ya está registrado.' });
    }

    const salt = await bcrypt.genSalt(10);
    const hashedPassword = await bcrypt.hash(password, salt);

    const [resultado] = await pool.query(
      'INSERT INTO usuarios (correo, contrasena) VALUES (?, ?)',
      [email, hashedPassword]
    );

    res.status(201).json({
      mensaje: 'Cuenta creada con éxito',
      id_usuario: resultado.insertId
    });
  } catch (error) {
    console.error('Error al registrar usuario:', error);
    res.status(500).json({ mensaje: 'Error en el servidor al intentar registrar el usuario.' });
  }
};

module.exports = { registrarUsuario };