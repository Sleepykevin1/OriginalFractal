int depth = 0;
int maxDepth = 6;

void setup() {
  size(400, 400);
  background(240);
}

void draw() {
  background(240);
  translate(width / 2, height / 2);
  fractalRose(0, 0, 80, depth);
}

void mousePressed() {
  depth = (depth + 1) % (maxDepth + 1);
}

void fractalRose(float x, float y, float size, int level) {
  if (level == 0) {
    fill(220, 0, 50, 150); // Deep red rose color
    noStroke();
    for (float angle = 0; angle < TWO_PI; angle += PI / 6) {
      float petalX = x + cos(angle) * size * 0.3;
      float petalY = y + sin(angle) * size * 0.3;
      ellipse(petalX, petalY, size * 0.8, size);
    }
    return;
  }

  for (int i = 0; i < 6; i++) {
    float angle = radians(i * 60 + level * 5); 
    float newX = x + cos(angle) * size * 0.4;
    float newY = y + sin(angle) * size * 0.4;
    
    fractalRose(newX, newY, size * 0.7, level - 1);
  }
}
