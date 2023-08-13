void draw() {
  switch (juegoEstado) {
    case 'i':
      dibujaInicio();
      break;
    case 'p':
      dibujaJugando();
      break;
    case 'o':
      dibujaGameOver();
      break;
  }
}
