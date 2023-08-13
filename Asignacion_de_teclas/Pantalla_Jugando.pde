void dibujaJugando() {
  bananaX -= 2;
  barrilX -= 3;
//Contron de colision banana//
  if (dist(bananaX, 200, monoX, monoY) < 50) {
    score++;
    bananaX = width + 100;
  }

  if (bananaX <= -100) {
    bananaX = width + int(random(100, 500));
  }

  xFondo = xFondo + VxFondo;

  int imgFondoH = imgFondo.height;
  int imgFondoW = imgFondo.width;
  color[] px = imgFondo.pixels;
  loadPixels();
  imgFondo.loadPixels();
  for (int i = 0, y = 0; y < height; ++y) {
    int yimgFondo = Math.floorMod(y, imgFondoH);
    for (int x = 0; x < width; ++x, ++i) {
      int ximgFondo = Math.floorMod(x + xFondo, imgFondoW);
      int iimgFondo = ximgFondo + yimgFondo * imgFondoW;
      pixels[i] = px[iimgFondo];
    }
  }
  updatePixels();

  if (enElAire) {
    monoVelY += gravedad;
    monoY += monoVelY;

    imgKong = kongSalta;

    if (monoY >= 350) {
      monoY = 350;
      monoVelY = 0;
      enElAire = false;

    }
  }

  pushMatrix();
  image(banana, bananaX, 200);

  tiempo = tiempo + 1;
  if (tiempo % 12 == 0) {
    if (camina1 == true) {
      camina1 = false;
      imgKong = kongCamina1;
    } else {
      camina1 = true;
      imgKong = kongCamina2;
    }
  }

  image(imgKong, monoX, monoY);

  image(barril, barrilX, 390);
  fill(125, 200, 0);
  textSize(40);
  text("Score: " + score, 60, 100);
  text("Vidas: " + vidas, 900, 100);
  popMatrix();
//Restablece la banana"
  if (bananaX <= -100) {
    bananaX = 1000;
  }
  //Restablece el barril//
  if (barrilX <= -100) {
    barrilX = 1000;
  }
//Contron de colision barril//
  if (dist(monoX, monoY, barrilX, 390) < 50) {
    vidas--;
    barrilX = width + int(random(100, 500));
    if (vidas <= 0) {
      juegoEstado = 'o';
    }
  }
}
