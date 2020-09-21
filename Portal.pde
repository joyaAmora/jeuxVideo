class Portal {
  Circle c;
 
  Portal () {
    float x, y, radius;

    x = random(100,700);
    y = random(100, 500);
    radius = 75;
    c = new Circle(x, y, radius);

  }


  Portal (Circle _c) {
    c = _c;
  }

  void setCircle (Circle _c) {
    c = _c;
  }

  Circle getCircle () {
    return c;
  }

  void display () {
    c.display();
  }
}
