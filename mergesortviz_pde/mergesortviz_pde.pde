PFont futm;
PFont futmB;


int cur_word_idx = 1;

int[] cur_word_char_idx = {};

int frameNum = 0;

int num_steps = 100;
int step_width = 0;
int cur_step = 0;
int sort_step = 0;
int stroke_weight = 1;
boolean finished = false;
boolean paused = false;
int pause_timer = 0;
int modr = 2;
int rand_len = 100;

int sort_algo = 0;

int[][] display_steps;


void reset_steps()
{
  cur_word_char_idx = new int [num_steps];
  for (int i = 0; i < num_steps; i++)
  {
    //cur_word_char_idx[i] = i;
    cur_word_char_idx[i] = int(random(rand_len));
    rand_len  =rand_len + 30;
    if (rand_len > 350) {
      rand_len = 90;
    }
  }



  display_steps= new int [num_steps][num_steps];


  arrayCopy(cur_word_char_idx, display_steps[0]);
  shuffle(cur_word_char_idx);
  print("AAIGHT< SHUFFLED:\n");
  printNums(cur_word_char_idx);

  if (sort_algo == 0) {
    print("MERGESORT!");
    mergeSort(0, cur_word_char_idx.length - 1);
  } else {
    print("SELECTION-SORT!");
    selectionSort();
  }
  sort_algo = 1 - sort_algo;

  sort_step = 0;
  cur_step = 0;
}

void setup() {
  size(900, 900);

  futm = createFont("Futura", 32);
  futmB = createFont("Futura-Bold", 32);
  textFont(futm);

  step_width = width / num_steps;

  reset_steps();


  //shuffle(cur_word_char_idx);
  frameRate(25);
}


void draw() {
  background(255);
  stroke(126);

  for (int i = 0; i < num_steps; i++) {
    strokeWeight(3+modr*4);
    stroke(0);
    if (cur_step == i) {
      strokeWeight(5+modr*3);
      stroke(0, 255, 0);
    }
    int ii = (i*modr) % num_steps;
    line(i*step_width+5, height, i*step_width+5, display_steps[cur_step][ii]* step_width);
  }


  if (pause_timer < frameCount) {

    cur_step = cur_step + 1;

    if (cur_step >= num_steps) {
      cur_step = 0;
      reset_steps();
      pause_timer = frameCount + 7;
      print("FRAME IS:", frameCount);
      modr = (modr + 1) % 7;
    }
  }
  saveFrame("output/sel_sortHPLL_####.png");
}
