void selecetionSort() {
    
    
    if (i < values.length) {
        
        //find maximum
        
        //---uncomment next line for linear maximum
        //int max_index = maximum(values.length-1-i);
        //--------
        
        //---comment next line for linear maximum
        float max = extractMax();
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