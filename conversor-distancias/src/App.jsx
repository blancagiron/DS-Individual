// Alumna: Blanca Girón Ricoy 

import { useState } from 'react';
import './App.css';
import { Adaptador } from './Adaptador';
import { ServicioLA } from './ServicioLA';
// App.jsx es el cliente -> usa el adaptador para convertir las millas a kilómetros sin tener que modificar el código del servicio de LA


function App() {
  // variables de estado
  const [millas, setMillas] = useState(""); // distancia en millas, introducida por el usuario
  const [kilometros, setKilometros] = useState(""); // resultado de la conversión

  const convertirDistancia = () => {
    if (millas !== "" && millas > 0) { // si millas no está vacío
      const servicioLA = new ServicioLA(parseFloat(millas)); // instanciar el servicio de LA y almacenar la distancia en millas
      const adaptador = new Adaptador(servicioLA); // instanciar el adaptador y pasarle el servicio de LA
      setKilometros(adaptador.getDistanciaKm()); // se guarda el resultado 
    }
  };

  return (
    <div className="flex flex-col md:flex-row items-center justify-center min-h-screen bg-gray-100">
      {/* izquierda: Título e información */}
      <div className="w-full md:w-1/2 p-8 flex flex-col items-center">
        <div className="bg-red-400 w-full px-4 py-2 mb-4 w-64">
          <span className="text-black text-xl ">Conversor: Millas a Kilómetros</span>
        </div>
        <h1 className="text-6xl font-bold text-black mb-4">Servicio Geográfico</h1>
        <p className="text-lg text-gray-700">
          Adaptamos las distancias proporcionadas por la app de navegación de Los Ángeles para que sean
          compatibles con el sistema de información geográfica en España.
        </p>
        <div className="mt-4 flex justify-center md:justify-start">
          <img src="/localizacion.svg" alt="Mapa de conexión" className="w-32 h-auto" />
        </div>
      </div>

      {/* derecha: Conversión */}
      <div className="w-full md:w-1/2 p-8 flex flex-col items-center">
        <div className="w-full max-w-md">
          {/* Millas */}
          <h2 className="text-3xl font-medium text-black mb-4">Distancia desde Los Ángeles</h2>
          <div className="bg-white rounded-3xl p-4 mb-6 shadow-md">
            <input
              type="number"
              placeholder="Ingrese millas"
              value={millas}
              onChange={(e) => setMillas(e.target.value)}
              className="w-full p-4 outline-none text-xl bg-transparent"
              min = "0"
            />
          </div>
          <p className="text-sm text-gray-600 mb-4">Distancia en millas enviada por la aplicación de navegación.</p>

          {/* btn */}
          <button
            onClick={convertirDistancia}
            className="w-full bg-red-400 text-white rounded-full py-4 mb-6 text-xl font-medium shadow-md transition"
          >
            Convertir
          </button>

          {/* Km */}
          <h2 className="text-3xl font-medium text-black mb-4">Distancia Convertida para España</h2>
          <div className="bg-white rounded-3xl p-4 shadow-md">
            <p className="text-2xl p-4">{kilometros || "0.00"} km</p>
          </div>
          <p className="text-sm text-gray-600 mt-4">Distancia convertida a kilómetros para el sistema de España.</p>
        </div>
      </div>
    </div>
  );
}

export default App;
