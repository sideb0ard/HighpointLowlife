void shuffle(int[] a)
{
  int temp;
  int pick;

  println("Shuffling...");
  for (int i=0; i<a.length; i++)
  {
    temp = a[i];
    pick  = (int)random(a.length);
    //print("PICK!", pick);
    a[i] = a[pick];
    a[pick]= temp;
  }
}
