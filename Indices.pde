public class Indices{
    int start;
    int mid;
    int end;

    public Indices(int start, int mid, int end){
        this.start = start;
        this.mid = mid;
        this.end = end;
    }

    String toString(){
        return "(s: "+start+", m: "+mid+", e: "+end+")";
    }
}