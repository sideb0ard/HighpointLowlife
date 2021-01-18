PFont futm;


String highpoint_lowlife[] = {"HIGHPOINT", "LOWLIFE"};
int cur_word_idx = 1;

int[] cur_word_char_idx = {};

int frameNum = 0;

int num_steps = 0;
int step_width = 0;
int cur_step = 0;
int sort_step = 0;

boolean shouldShuffle = false;
int[][] display_steps;


void setup() {
  size(900, 900);

  futm = createFont("Futura-Bold", 32);
  textFont(futm);

  frameRate(1);
}

void draw() {
  background(204);


  //print("STEP:", step, " FRANENUM:", frameNum, " FMOD:", (frameNum+1) % step, "\n");

  if (frameNum == 0) { 
    shouldShuffle = true;
    //print("SHOULD DUF!\n");
  }
  if (shouldShuffle) {

    cur_word_idx = (cur_word_idx + 1) % highpoint_lowlife.length;

    num_steps = highpoint_lowlife[cur_word_idx].length();
    cur_word_char_idx = new int [num_steps];
    for (int i = 0; i < num_steps; i++)
    {
      cur_word_char_idx[i] = i;
    }


    step_width = width / num_steps;

    display_steps= new int [num_steps][num_steps];

    shuffle(cur_word_char_idx);
    arrayCopy(cur_word_char_idx, display_steps[0]);
    //print("AAIGHT< SHUFFLED:\n");
    printNums(cur_word_char_idx);
    mergeSort(0, cur_word_char_idx.length - 1);

    sort_step = 0;
    cur_step = 0;

    shouldShuffle = false;
  };


  //print("BOOM\n");
  for (int i = 0; i < num_steps; i++) {
    if (i <= frameNum) {
      //print("FRAMENUM:", i, "\n");
      for (int j = 0; j < cur_word_char_idx.length; j++) {
        text(highpoint_lowlife[cur_word_idx].charAt(display_steps[i][j]), j*step_width+30, i*step_width+50);
      }
    }
  }

  frameNum = frameCount % cur_word_char_idx.length;
  print("FRAMENUm:", frameNum, "\n");
}
