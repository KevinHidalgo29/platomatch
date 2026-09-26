import axios from 'axios';

// Configuración base de Axios para comunicarse con el Backend
const API = axios.create({
  baseURL: 'http://localhost:5000/api',
});

export default API;