float[] values;

BubbleSort bubbleSort;
SelectionSort selectionSort;
InsertionSort insertionSort;
MergeSort mergeSort;

int i = 0;
int j = 0;

//choose which search algo you want to use:
final int mode = 4;

boolean contains(float[] values, float key){
    for(int i = 0; i<values.length;i++){
        if(values[i] == key){
            return true;}
        
    }
    return false;
}

void setup() {
    size(1000, 600);
    values = new float[width];

    for (int i = 0; i < values.length; i++) {
        values[i] = random(height);
    }
    
    
    bubbleSort = new BubbleSort();
    selectionSort = new SelectionSort();
    insertionSort = new InsertionSort();
    mergeSort = new MergeSort();


}

void draw() {
    background(0);
    
    if (mode == 1) bubbleSort.bubbleSort();
    else if (mode == 2) selectionSort.selectionSort();
    else if (mode == 3) insertionSort.insertionSort();
    else if (mode == 4) mergeSort.mergeSort();
    
    
    for (int i = 0; i < values.length;i++) {
        stroke(255);
        //for(int j = 0 ; j<100;j++){
        line(i, height, i , height - values[i]);
        //}
    }

   //sleep(3000);

}
public static void sleep(int someDelay) {
   try {
      Thread.sleep(someDelay);
   } 
   catch (InterruptedException e) {
      Thread.currentThread().interrupt();
   }
}