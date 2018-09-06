package main;

import java.io.IOException;
import java.util.Scanner;

import main.CsvFileLoader.CsvFileContainer;

public class ConsoleWorker {

	private final Scanner scan;
	private final String path;
	private CsvFile csvFile;

	private ConsoleWorker() {
		scan = new Scanner(System.in);
		System.out.println("������� ���� � ����� � �������");
		path = scan.nextLine();
		showFiles();
	}

	public void showFiles() {
		CsvFileLoader csvFileLoader = new CsvFileLoader(path);
		CsvFileContainer csvFileContainer = csvFileLoader.getCsvFileContainer();
		csvFileContainer.getFiles().forEach(System.out::println);
		int currentFile = scan.nextInt();
		csvFileContainer.setindexCurrentFile(currentFile);
		csvFile = csvFileContainer.getCurrentCsvFile();
		if (csvFile == null) {
			System.out.println("������ ����� �� ����������, �������� ������ ����!");
			showFiles();
		}
		try {
			showFirstLevel();
		} catch (IOException e) {
			e.printStackTrace();
		}
	}

	public void showFirstLevel() throws IOException {
		System.out.println(
				"0 - ������� ���� ����\n1 - ������� ����� �����\n2 - �������� �������\n3 - �������� ������ �������� ��������\n4 - ������� ������ ����\n5 - ������� �������");
		switch (scan.nextInt()) {
		case 0: {
			showLevel0();
		}
		case 1: {
			showLevel1();
		}
		case 2: {
			showLevel2();
		}
		case 3: {
			showLevel3();
		}
		case 4: {
			showFiles();
		}
		case 5: {
			System.out.println("������� ������ ��������\n");
			int index = scan.nextInt();
			csvFile.showHeader();
			System.out.println(csvFile.getItemByIndex(index) + "\n");
			showFirstLevel();
		}
		}
	}

	public void showLevel0() throws IOException {
		System.out.println();
		csvFile.show();
		System.out.println("\n��� ����������� ����� ������� ������� �");
		while (((char) System.in.read()) == 'b') {
			showFirstLevel();
		}
	}

	public void showLevel1() throws IOException {
		System.out.println();
		csvFile.showCurrentItems();
		System.out.println("+ - ��������� ��������\n- - ������� ��������\nb - �����");
		int intKey;
		while ((intKey = System.in.read()) != -1) {
			switch ((char) intKey) {
			case '+': {
				csvFile.next();
				showLevel1();
			}
			case '-': {
				csvFile.prev();
				showLevel1();
			}
			case 'b':
				showFirstLevel();
			}
		}
	}

	public void showLevel2() throws IOException {
		System.out.println("\n������� ����� �������");
		int newDifference = scan.nextInt();
		csvFile.setDifference(newDifference);
		showFirstLevel();
	}

	public void showLevel3() throws IOException {
		System.out.println("\n������� ����� ������� ��������");
		int newCurrentItem = scan.nextInt();
		csvFile.setCurrentItem(newCurrentItem);
		showFirstLevel();
	}

	public static void main(String... args) {
		new ConsoleWorker();
	}

}
