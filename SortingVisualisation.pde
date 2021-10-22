float[] values;
HashMap<Float,Integer> val2index;

int i = 0;
int j = 0;

//choose which search algo you want to use:
final int mode = 2;

boolean contains(float[] values, float key){
    for(int i = 0; i<values.length;i++){
        if(values[i] == key){
            //System.out.println("gugu hi ha mach nomal");
            return true;}
        
    }
    return false;
}

void setup() {
    size(1000, 600);
    values = new float[width];
    float tmp;
    for (int i = 0; i < values.length; i++) {
        values[i] = random(height);
    }
    val2index = new HashMap<Float, Integer>();

    for(int i = 0; i<values.length;i++){
        val2index.put(values[i], i);

    }

    makeHeap(values);

}

void draw() {
    background(0);
    
    if (mode == 1) bubbleSort();
    else if (mode == 2) selecetionSort();
    else if (mode == 3) insertionSort();
    
    
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