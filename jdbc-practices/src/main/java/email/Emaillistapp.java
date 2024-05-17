package email;

import java.util.Scanner;

public class Emaillistapp {

  public static void main(String[] args) {
    Scanner scanner = new Scanner(System.in);

    while (true) {
      System.out.println("(l)ist (d)elete (i)nsert (q)uit > ");
      String command = scanner.nextLine();


      // controller도 되고 view도 되는 사용자의 요청을 받는 부분 (아래 if-else문)
      if ("l".equals(command)) {
        doList();
      } else if ("d".equals(command)) {
        doDelete();
      } else if ("i".equals(command)) {
        doInsert();
      } else if ("q".equals(command)) {
        break;
      }
    }

    scanner.close();

  }

  private static void doInsert() {
    System.out.println("doInsert");

  }

  private static void doDelete() {
    System.out.println("doDelete");

  }

  // list들이 테이블에 존재하고, 하나의 row를 vo에 담고
  // [vo, vo, vo]를 어플리케이션 화면단에서 뿌려주면 됨.
  private static void doList() {
    System.out.println("doList");

  }

}
