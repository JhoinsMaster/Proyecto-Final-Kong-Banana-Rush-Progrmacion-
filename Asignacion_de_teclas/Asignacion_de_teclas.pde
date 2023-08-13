void keyPressed() {
  if (juegoEstado == 'i' && key == 'p') {
    juegoEstado = 'p';
    score = 0;
    vidas = 3;
  } else if (juegoEstado == 'o' && key == 'r') {
    juegoEstado = 'i';
  }

  if (juegoEstado == 'p') {
    if (key == 'w' || key == 'W') {
      if (!enElAire) {
        monoVelY = -15;
        enElAire = true;
      }
    }
  }
}
