package my.scope;

public class Counter {
	private int num;
	
	public Counter() {
		System.out.println("Counter() 생성자가 호출되었습니다.");
	}
	
	public void setCount(int i) {
		num += i;
	}
	public int getCount() {
		return num;
	}
}
