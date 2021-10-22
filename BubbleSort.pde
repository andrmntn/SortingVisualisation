
public class BubbleSort{

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
}