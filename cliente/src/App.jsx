import React from 'react';
import { BrowserRouter as Router, Routes, Route, Link } from 'react-router-dom';
import Home from './pages/Home';
import Register from './pages/Register';
import Onboarding from './pages/Onboarding';

function App() {
  return (
    <Router>
      <nav style={{ padding: '15px', background: '#333', color: '#fff', display: 'flex', gap: '15px' }}>
        <Link to="/" style={{ color: '#fff', textDecoration: 'none' }}>Inicio</Link>
        <Link to="/register" style={{ color: '#fff', textDecoration: 'none' }}>Registrarse</Link>
      </nav>

      <Routes>
        <Route path="/" element={<Home />} />
        <Route path="/register" element={<Register />} />
        <Route path="/onboarding" element={<Onboarding />} />
      </Routes>
    </Router>
  );
}

export default App;