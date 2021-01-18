void printNums(int []nums) {
  for (int i = 0; i < nums.length; i++ )
  {
    print(nums[i], " ");
  }
  println();
}

void merge(int start, int end, int mid) {

  int left_size = mid - start + 1;
  int[] left = new int[left_size];
  arrayCopy(cur_word_char_idx, start, left, 0, left_size);

  int right_size = end - mid;
  int[] right = new int[end - mid];
  arrayCopy(cur_word_char_idx, mid+1, right, 0, right_size);

  int left_idx = 0;
  int right_idx = 0;
  int nums_idx = start;
  while (nums_idx < end) {
    while (left_idx < left_size && right_idx < right_size) {
      if (left[left_idx] < right[right_idx])
        cur_word_char_idx[nums_idx] = left[left_idx++];
      else
        cur_word_char_idx[nums_idx] = right[right_idx++];
      nums_idx++;
    }
    while (left_idx < left_size) cur_word_char_idx[nums_idx++] = left[left_idx++];
    while (right_idx < right_size) cur_word_char_idx[nums_idx++] = right[right_idx++];
  }
}

void mergeSort(int start, int end) {

  if (end > start) {

    int mid = (start + end) / 2;

    mergeSort(start, mid);
    mergeSort(mid + 1, end);
    merge(start, end, mid);
    printNums(cur_word_char_idx);
    arrayCopy(cur_word_char_idx, display_steps[++sort_step]);
  }
}
