package mvc;

import java.util.ArrayList;
import java.util.List;

public class DepartDAO {
	public List<String> advice(String depart) {
		List<String> advice = new ArrayList<>();
		switch (depart) {
		case "kor":
			advice.add("�������� �����ϴ� �а�");
			advice.add("��� �ſ� ���ؾ� �Ѵ�.");
			break;
		case "eng":
			advice.add("�������� �����ϴ� �а�");
			advice.add("��� �ſ� ���ؾ� �Ѵ�.");
			break;
		case "mat":
			advice.add("������ �����ϴ� �а�");
			advice.add("������ �ſ� ���ؾ� �Ѵ�.");
			break;
		case "com":
			advice.add("��ǻ�͸� �����ϴ� �а�");
			advice.add("��ǻ�͸� �ſ� ���ؾ� �Ѵ�.");
			break;
		}
		return advice;
	}
}
