package parking;

import java.util.Scanner;

public class ParkingLot {

	private Scanner sc;
	private String name;
	private Car[] cars;
	private int idx;
	 
	
	public ParkingLot(String name) {
		this.name=name;
		cars = new Car[10];
		sc = new Scanner(System.in);
	}
		
	public void addCar() {
			System.out.println("현재 등록된 차량" + idx + "대");
		if(idx == cars.length) {
			System.out.println("더 이상 차량 등록이 불가능합니다.");
			return;
		}
		System.out.print("차량번호 >>>");
		String carNo =sc.nextLine();
		System.out.print("모델  >>> ");
		String model = sc.nextLine();
		Car car = new Car(carNo, model);
		cars[idx++] = car;
		System.out.println("차량번호" + carNo + "차량이 등록되었습니다.");
		
	}
		
	
	public void deleteCar() {
		if(idx == 0) {
			System.out.println("등록된 차량이 없습니다.");
			return;
		}
		System.out.println("===차량삭제===");
		System.out.print("삭제할 차량의 번호 >>> ");
		String carNo = sc.next(); 
		for(int i = 0; i < idx; i++) {
			if(cars[i].getCarNo().equals(carNo)) {
				System.arraycopy(cars, i + 1, cars, i, idx - i -1);
				cars[--idx] = null;
				System.out.println("차량 번호가 " + (carNo) + "인 차를 삭제했습니다.");
				return;
			}
		}
		System.out.println("차량 번호가" + carNo + "인 차는 없습니다.");
	}
	
	
	public void printAllCars() {
		
		if(idx == 0) {
			System.out.println("등록된 차량이 한 대도 없습니다.");
			return;
			
		}
		System.out.println(name + " 차량목록");
		for(int i = 0; i < idx; i++) {
			System.out.println(cars[i]);
		}
		
	}
	
	
	public void manage() {
		
		while(true) {
			System.out.println("1.추가 2.삭제 3.전체 0.종료 >>> ");
			int choice = sc.nextInt();
			sc.nextLine();
			switch(choice) {
			case 1 : addCar(); break;
			case 2 : deleteCar(); break;
			case 3 : printAllCars(); break;
			case 0 : System.out.println("ParkingLot 프로그램을 종료합니다. 감사합니다.");
			return;
			default : System.out.println("존재하지 않는 메뉴입니다.");
			
			}
		}
	}
	
}
			
		
	
	
	
			

