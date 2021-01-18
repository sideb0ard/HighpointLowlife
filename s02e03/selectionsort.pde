void swap(int x, int y)  
{  
  int temp = cur_word_char_idx[x];  
  cur_word_char_idx[x] =   cur_word_char_idx[y];
  cur_word_char_idx[y] = temp;
}  

void selectionSort()  
{  
  int min_idx;  
  int word_len = cur_word_char_idx.length;

  // One by one move boundary of unsorted subarray  
  for (int i = 0; i < word_len-1; i++)  
  {  
    // Find the minimum element in unsorted array  
    min_idx = i;  
    for (int j = i+1; j < word_len; j++)  
      if (cur_word_char_idx[j] < cur_word_char_idx[min_idx])  
        min_idx = j;  

    // Swap the found minimum element with the first element  
    swap(min_idx, i);
    printNums(cur_word_char_idx);
    arrayCopy(cur_word_char_idx, display_steps[++sort_step]);
  }
}
