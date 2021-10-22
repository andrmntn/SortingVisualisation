public class SelectionSort{
    HashMap<Float,Integer> val2index;
    MaxHeap maxHeap = new MaxHeap();

    public SelectionSort(){

        val2index = new HashMap<Float, Integer>();

        for(int i = 0; i<values.length;i++){
            val2index.put(values[i], i);
        }

        maxHeap.makeHeap(values);

    }

    void selectionSort() {
        
        
        if (i < values.length) {
            
            //find maximum
            
            //---uncomment next line for linear maximum
            //int max_index = maximum(values.length-1-i);
            //--------
            
            //---comment next line for linear maximum
            float max = maxHeap.extractMax();
            int max_index = findIndex(max);
            //------------

            //put it at right place
            val2index.put(values[values.length-i-1], max_index);
            val2index.put(values[max_index], values.length-i-1);
            swap(values, values.length-1-i, max_index);
            i++;
            
        } else {
            println("finished");
            noLoop();
        }
        
    }

    void swap(float[] arr, int a, int b) {
        float tmp = arr[a];
        arr[a] = arr[b];
        arr[b] = tmp;
    }

    public int findIndex(float key){
        return val2index.get(key);
    }

    //returns an index, which has to be swapped with the i-th position
    int maximum(int end) {
        int max_index =  end;
        
        for (int i = 0; i <= end;i++) {
            if (values[i] > values[max_index]) max_index = i;
        }
        
        return max_index;
        
    }
}