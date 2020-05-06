void setup() {
    size(1000, 1000);
    background(0);
}

float x = 500;
float y = 500;
int r = 180;
int randomRange = 10;

void draw() {
    fill(0, 10);
    noStroke();
    rect(0, 0, 1000, 1000);

    x = x + random(-randomRange, randomRange);
    y = y + random(-randomRange, randomRange);

    for (int i = 0; i < 10; ++i) {
        noFill();
        stroke(random(255), random(255), random(255));
        ellipse(x + random(-randomRange, randomRange), y + random(-randomRange, randomRange), r, r);
    }
}