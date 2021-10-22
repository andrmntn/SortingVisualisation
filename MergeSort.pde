class MergeSort{
    HashMap<Integer, Indices> list = new HashMap<Integer,Indices>();

    int cnt = 0;

    public MergeSort(){
        init(0, values.length-1);
        cnt = 0;
    }

    void printMap(){
        for (int name: list.keySet()) {
            String key = ""+name;
            Indices value = list.get(name);
            System.out.print(key+", ");
            System.out.print(value.toString());
            System.out.println();
        }
    }


    void init(int start, int end){

        if(start < end){
            int mid = (end+start)/2;
            init(start, mid);
            init(mid+1, end);
            list.put(cnt++, new Indices(start, mid, end));
        }
        return;
    }

    void mergeSort(){
        if (cnt == list.size()) noLoop();

        Indices entry = list.get(cnt++);
        int start = entry.start;
        int mid = entry.mid;
        int end = entry.end;

        float[] tmp = merge(start, mid, end);

        //edit here if you want nicer visualisation

        for(int i = start;i<=end;i++) values[i] = tmp[i-start];
    }

    float[] merge(int start, int mid, int end){
        float[] tmp = new float[end-start+1];

        int cnt = 0;
        int i = start;
        int j = mid+1;

        while(i<=mid && j <=end){

            if(values[i]<=values[j]){
                tmp[cnt] = values[i];
                i++;
            }else{
                tmp[cnt] = values[j];
                j++;
            }
            cnt++;
        }

        for(int k = i; k<=mid;k++){
            tmp[cnt] = values[k];
            cnt++;
        }

        for(int k = j; k<=end;k++){
            tmp[cnt] = values[k];
            cnt++;
        }

        return tmp;



    }
}