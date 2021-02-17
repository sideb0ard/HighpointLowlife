
float circle_width = 10;
int circle_offset = 100;
int flash_dur_frames = 50;
int flash_end_frame = 0;
boolean flash_on = false;
boolean is_green = false;

PFont futm;
PFont futmSmall;
PFont futmB;

float frame_mod = 2;

void setup()
{
  size(1200, 1200);
  background(0, 0, 0);


  futm = createFont("Futura", 94);
  futmSmall = createFont("Futura", 64);
  futmB = createFont("Futura-Bold", 96);
  textFont(futmB);
  fill(255, 255, 255);
}

void draw()
{
  int midpoint = height / 2;
  int circle_center_x = width / 2;
  int circle_center_y = midpoint + circle_offset;

  fill(0, 0, 0);
  textFont(futmB);
  text("highpointlowlife", 60, circle_center_y);

  if (frameCount % 10 == 1) {
    circle_width -= 23 + int(random(74));

    if (circle_width/2 < circle_offset) {
      flash_end_frame = frameCount + flash_dur_frames;
      flash_on = true;
      background(0, 0, 0);
      circle_width = circle_center_y* 3;
    }
  }
  if (frameCount > flash_end_frame && flash_on) {
    flash_on = false;
    print("FLASH FLASE AT ", frameCount, "\n");
  }

  //if (flash_on && started) {
  if (flash_on) {
    textFont(futmB);
    background(0, 0, 0);
    is_green = false;
    fill(255, 255, 255);
    //text("highpointlowlife", 60 + int(random(10)), circle_center_y);
    text("highpointlowlife", 60, circle_center_y);
    textFont(futmSmall);
    text("radioshow", 590, circle_center_y+60);
  } else {
    noFill();

    if (!is_green) {
      background(0, 0, 0);
      fill(0, 255, 0);
      is_green = true;
    }
    circle(circle_center_x, circle_center_y, circle_width);
    textFont(futmB);
    text("highpointlowlife", 60, circle_center_y);
    textFont(futmSmall);
    text("radioshow", 590, circle_center_y+60);
  }
  saveFrame("output/sel_sortHPLL_####.png"); 
}
