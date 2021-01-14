PFont futm;

//1. Slow it down
//2. how many letters in each word
//3. Divide Width by number
//4. randomize letters
//5. Each frame the algorithm moves once and prints updated array


String highpoint = "HIGHPOINT";
int[] highpoint_idx = {0, 1, 2, 3, 4, 5, 6, 7, 8};

String lowlife = "LOWLIFE";
int[] lowlife_idx = {0, 1, 2, 3, 4, 5, 6};

int frameNum = 0;
int step = 0;

boolean shouldShuffle = false;
int[][] highpoint_steps; //


void setup() {
  size(900, 900);
  futm = createFont("Futura-Bold", 32);
  textFont(futm);
  frameRate(1);
  step = width / highpoint.length();
  highpoint_steps= new int [highpoint.length()][highpoint.length()];
}

void draw() {
  background(204);


  //print("STEP:", step, " FRANENUM:", frameNum, " FMOD:", (frameNum+1) % step, "\n");

  if (frameNum == 0) { 
    shouldShuffle = true;
  }
  if (shouldShuffle) {
    for (int i= 0; i < highpoint.length(); i++) {
      println("HPLL_STEPS:", i);
      printNums(highpoint_steps[i]);
      for (int j= 0; j < highpoint.length(); j++) {
        print("STEPS:[i]", i, "[j]:", j, " VAL:", highpoint_steps[i][j], "\n");
        
      }
      //int[] highpoint_idx_copy = new int[highpoint_idx.length];
      
      arrayCopy(highpoint_idx, highpoint_steps[i]);
      shuffle(highpoint_steps[i]);
      print("COPY2!\n");
      printNums(highpoint_steps[i]);
     
  
    }
    shuffle(highpoint_idx); 
    shouldShuffle = false;
  };



  for (int i = 0; i < step; i++) {
    if (i <= frameNum) {
      //print("STEP:!", i, "\n");
      for (int j = 0; j < highpoint.length(); j++) {
        //print("I:", i, " J:", j, " CHAR:", highpoint.charAt(highpoint_idx[j]), "\n");
        text(highpoint.charAt(highpoint_steps[i][j]), j*step+30, i*step+50);
      }
    }
  }

  frameNum = frameCount % highpoint.length();
  printNums(highpoint_idx);
}
