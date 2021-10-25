public class QuickSort{
    //I want to visualize the partitioning Part
    //Idea: Do the whole algo in a tmp array and then visualize it on the real one
    HashMap<Integer, Partition> map = new HashMap<Integer,Partition>();
    int cnt = 0;
    float[] tmpvalues = new float[values.length];

    public QuickSort(){
        for(int k = 0; k<values.length;k++){
            tmpvalues[k] = values[k];
        }

        recquickSort(0, values.length-1);
        printMap();
    }

    void quickSort(){
        realpartition(map.get(i++));
    }

    void recquickSort(int low, int high){

        if (low < high){
            
            int pi = partition(low, high);
            map.put(cnt++, new Partition(low, high, pi));

            recquickSort(low, pi - 1);
            recquickSort(pi + 1, high);
        }

    }

    void realpartition(Partition partition){
        int low = partition.low;
        int high = partition.high;
        
        float pivot = values[high]; 
        int i = low - 1; 
    
        for(int j = low; j <= high - 1; j++){

            if (values[j] < pivot) {
                i++; 
                swap(values, i, j);
            }
        }
        swap(values, i + 1, high);
    }

    int partition(int low, int high){

        float pivot = tmpvalues[high]; 
        int i = low - 1; 
    
        for(int j = low; j <= high - 1; j++){

            if (tmpvalues[j] < pivot) {
                i++; 
                swap(tmpvalues, i, j);
            }
        }
        swap(tmpvalues, i + 1, high);
        return (i + 1);
    }

    void swap(float[] arr, int a, int b) {
        float tmp = arr[a];
        arr[a] = arr[b];
        arr[b] = tmp;
    }

    void printMap(){
        for (int name: map.keySet()) {
            String key = ""+name;
            Partition value = map.get(name);
            System.out.print(key+", ");
            System.out.print(value.toString());
            System.out.println();
        }
    }
}

public class Partition{
    int low;
    int high;
    float pi;
    public Partition(int low,int high, float pi){
        this.low = low;
        this.high = high;
        this.pi = pi;
    }

    String toString(){
        return "("+low+", "+high+", "+pi+")";
    }

}