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
int maximum(int end) {
    int max_index =  end;
    
    for (int i = 0; i <= end;i++) {
        if (values[i] > values[max_index]) max_index = i;
    }
    
    return max_index;
    
}


/*--------MaxHeap implementation -------*/
    private float[] heap;
	private int size;


    public void makeHeap(float[] input){
		size = 0;
		heap = new float[input.length];
        for(float val:input) insert(val);
    }

	private int parent(int pos) { return ((pos-1)/2); }

	private int leftChild(int pos) { return (2 * pos + 1); }

	private int rightChild(int pos){return (2 * pos + 2);}

	private boolean isLeaf(int pos){  
		if (2*pos+1 >= size) {
			return true;
		}
		return false;
	}
    
	private void swap(int fpos, int spos){
		float tmp;
		tmp = heap[fpos];
		heap[fpos] = heap[spos];
		heap[spos] = tmp;
	}


	private void maxheapify(int pos){

        
		if (isLeaf(pos)){
			return;}


		if (heap[pos] < heap[leftChild(pos)] || heap[pos] < heap[rightChild(pos)]) {

            
			if (heap[leftChild(pos)] > heap[rightChild(pos)]) {
                
				swap(pos, leftChild(pos));
				maxheapify(leftChild(pos));
			}
			else {
                
				swap(pos, rightChild(pos));
				maxheapify(rightChild(pos));
			}
		}
	}

	public void insert(float element){
		heap[size] = element;
		int current = size;
        size++;
		while (heap[current] > heap[parent(current)] && parent(current)!=0) {
			swap(current, parent(current));
			current = parent(current);
		}
        maxheapify(0);
	}

	public float extractMax(){

		float popped = heap[0];
		heap[0] = heap[size-1];
        size--;
        
		maxheapify(0);
		return popped;
	} 

    public void print(){
        System.out.println("size of heap: "+size);
        for (int i = 0; i < size / 2; i++) {

            if((2*i+2)>=size){
                System.out.print(
                " PARENT : " + heap[i]
                + " LEFT CHILD : " + heap[2 * i + 1]);
            System.out.println();
            } else{

            System.out.print(
                " PARENT : " + heap[i]
                + " LEFT CHILD : " + heap[2 * i + 1]
                + " RIGHT CHILD :" + heap[2 * i + 2]);
            System.out.println();
        }
        }
    }

    /*---End of MaxHeap Implementation*/

    

