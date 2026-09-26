import React from 'react';

function Onboarding() {
  return (
    <div style={{ maxWidth: '600px', margin: '50px auto', textAlign: 'center', fontFamily: 'sans-serif' }}>
      <h2>🌱 ¡Bienvenido a PlatoMatch!</h2>
      <p>Configuración inicial de tu perfil alimentario y restricciones de salud.</p>
      <div style={{ padding: '20px', background: '#f4f4f4', borderRadius: '8px', marginTop: '20px' }}>
        <p><em>Próximamente: Selección de alergias, dietas y preferencias de ingredientes.</em></p>
      </div>
    </div>
  );
}

export default Onboarding;