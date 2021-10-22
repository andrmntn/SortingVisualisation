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