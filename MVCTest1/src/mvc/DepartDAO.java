package mvc;

import java.util.ArrayList;
import java.util.List;

public class DepartDAO {
	public List<String> advice(String depart) {
		List<String> advice = new ArrayList<>();
		switch (depart) {
		case "kor":
			advice.add("국문학을 공부하는 학과");
			advice.add("국어를 매우 잘해야 한다.");
			break;
		case "eng":
			advice.add("영문학을 공부하는 학과");
			advice.add("영어를 매우 잘해야 한다.");
			break;
		case "mat":
			advice.add("수학을 공부하는 학과");
			advice.add("수학을 매우 잘해야 한다.");
			break;
		case "com":
			advice.add("컴퓨터를 공부하는 학과");
			advice.add("컴퓨터를 매우 잘해야 한다.");
			break;
		}
		return advice;
	}
}
