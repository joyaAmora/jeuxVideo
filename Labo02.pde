int currentTime;
int previousTime;
int deltaTime;
boolean showPortals = true;
Circle boxing;
PVector location = new PVector(mouseX, mouseY);

Portal portalA, portalB;

boolean debug = true;

ArrayList<Mover> flock;

void setup () {
  size (800, 600);
  currentTime = millis();
  previousTime = millis();

  
  flock = new ArrayList<Mover>();
  
  portalA = new Portal();
  portalB = new Portal();
  
  portalA.getCircle().fillColor = color (200,0,100);
  portalB.getCircle().fillColor = color (100,0,200);
    
  portalA.getCircle();
  portalB.getCircle();
  
  while(portalA.getCircle().isCollidingCircle(portalB.getCircle())){
    portalA = new Portal();
  }
  
    boxing = new Circle(location.x, location.y, 5);
    Mover m = new Mover(new PVector(random(0, width), random(0, height)), new PVector(random (-5, 5), random(-5, 5)), boxing);
    m.fillColor = color(255, 0, random(255));
    flock.add(m);    

  if(showPortals) {
    portalA.display();
    portalB.display();
    }
}


void draw () {
  currentTime = millis();
  deltaTime = currentTime - previousTime;
  previousTime = currentTime;
  
  update(deltaTime);
  display();  
}

void mousePressed() {
  if(mousePressed){
    boxing = new Circle(location.x, location.y, 5);
    Mover m = new Mover(new PVector(random(0, width), random(0, height)), new PVector(random (-5, 5), random(-5, 5)), boxing);
    m.fillColor = color(0, random(255), random(255));
    
    flock.add(m);
  }
}

void keyPressed() {
  if(key == 'r') {
    showPortals = true;
    setup();
  }
  if(key == ' ') {
    if(showPortals) {
      showPortals = false;
    }
    else
    {
      showPortals = true;
    }
  }
}

/***
  The calculations should go here
*/
void update(int delta) {
  
  for (Mover m : flock) {
    m.update(delta);
    
    if(showPortals) {
     if(m.getCircle().isCollidingCircle(portalA.getCircle())) {
       float offsetX = m.location.x - portalA.getCircle().location.x;
       float offsetY = m.location.y - portalA.getCircle().location.y;
       
       m.location.x = portalB.getCircle().location.x-offsetX;
       m.location.y = portalB.getCircle().location.y-offsetY;
     }
     else if(m.getCircle().isCollidingCircle(portalB.getCircle())) {
       float offsetX = m.location.x - portalB.getCircle().location.x;
       float offsetY = m.location.y - portalB.getCircle().location.y;
       
       m.location.x = portalA.getCircle().location.x-offsetX;
       m.location.y = portalA.getCircle().location.y-offsetY;
     }
    }
  } 
}

/***
  The rendering should go here
*/
void display () {
  background(0);
  
  for (Mover m : flock) {
    m.display();
    m.getCircle().display();
  }
  if(showPortals) {
    portalA.display();
    portalB.display();
    }
}
