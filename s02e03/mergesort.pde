void printNums(int []nums) {
  for (int i = 0; i < nums.length; i++ )
  {
    print(nums[i], " ");
  }
  println();
}

void merge(int []nums, int start, int end, int mid) {
  
}

void merge_sort(int []nums, int start, int end) {
  if (end > start) {
    int mid = (start + end) / 2;
    merge_sort(nums, mid + 1, end);
    merge_sort(nums, start, mid);
    merge(nums, start, end, mid);
  }
}
