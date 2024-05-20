package email;

import java.util.List;
import java.util.Scanner;
import emaillist.dao.EmaillistDao;
import emaillist.vo.EmaillistVo;

public class EmaillistApp {
  private static Scanner scanner = new Scanner(System.in);
  private static EmaillistDao emaillistDao = new EmaillistDao();

  public static void main(String[] args) {
    while (true) {
      System.out.print("(l)ist (d)elete (i)nsert (q)uit > ");
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

    if (scanner != null) {
      scanner.close();
    }
  }

  private static void doInsert() {
    System.out.print("성:");
    String firstName = scanner.nextLine();

    System.out.print("이름:");
    String lastName = scanner.nextLine();

    System.out.print("이메일:");
    String email = scanner.nextLine();

    EmaillistVo vo = new EmaillistVo();
    vo.setFirstName(firstName);
    vo.setLastName(lastName);
    vo.setEmail(email);

    emaillistDao.insert(vo);

    doList(); // 들어갔는지 체크 -> 이후 워크벤치에서 쿼리때려보면 들어간거 확인 가능

  }

  private static void doDelete() {
    System.out.print("이메일:");
    String email = scanner.nextLine();

    emaillistDao.deleteByEmail(email);

    doList(); // 삭제되었는지 체크
  }

  // list들이 테이블에 존재하고, 하나의 row를 vo에 담고
  // [vo, vo, vo]를 어플리케이션 화면단에서 뿌려주면 됨.
  private static void doList() {
    List<EmaillistVo> list = emaillistDao.findAll();
    for (EmaillistVo vo : list) {
      System.out.println(vo.getFirstName() + " " + vo.getLastName() + ":" + vo.getEmail());
    }
  }

}
