public class InsertionSort{
    void insertionSort() {
        if (i < values.length && i!= 0) {
            
            //find right place
            float key = values[i];
            int k = binarySearch(values, key, 0, i - 1);
            
            //make place by moving all consecutive elements to the right
            for (int j = i - 1; j >= k; j--) {
                values[j + 1] = values[j];
            }
            
            values[k] = key;
            
            i++;
            
        } else if (i == 0) {
            i++;
        } else{
            println("finished");
            noLoop();
        }
        
    }

    //returns the index of the insertin spot in the array
    int binarySearch(float[] values,float key, int start, int end) {
        if (start > end) {
            return start;
        }
        int mid = start + (end - start) / 2;
        if (key == values[mid])
            return mid + 1;
        if (key > values[mid])
            return binarySearch(values, key, mid + 1, end);
        return binarySearch(values, key, start, mid - 1);
        
    }
}