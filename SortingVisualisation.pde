
float[] values;

int i = 0;
int j = 0;

//choose which search algo you want to use:
final int mode = 3;

void setup() {
    size(500, 300);
    values = new float[width];
    for (int i = 0; i < values.length; i++) {
        values[i] = random(height);
    }
}

void draw() {
    background(0);
    
    if (mode == 1) bubbleSort();
    else if (mode == 2) selecetionSort();
    else if (mode == 3) insertionSort();
    
    
    for (int i = 0; i < values.length;i++) {
        stroke(255);
        line(i, height, i , height - values[i]);
        
    }
}

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

void selecetionSort() {
    if (i < values.length) {
        
        //find minimum
        int min_index = minimum(values, i);
        //put it at right place
        swap(values, i++, min_index);
        //System.out.println("swapped value "+i+" with "+min_index);
    } else {
        println("finished");
        noLoop();
    }
    
}

void bubbleSort() {
    
    if (i < values.length) {
        
        for (int j = 0; j < values.length - i - 1;j++) {
            float a = values[j];
            float b = values[j + 1];
            if (a > b) {
                swap(values, j, j + 1);
            }
        }
        
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

//returns an index, which has to be swapped with the i-th position
int minimum(float[] input, int start) {
    int min_index =  start;
    
    for (int i = start; i < values.length - 1;i++) {
        if (values[i] < values[min_index]) min_index = i;
    }
    
    return min_index;
    
}


