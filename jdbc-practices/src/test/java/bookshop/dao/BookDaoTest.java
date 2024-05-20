package bookshop.dao;

import static org.junit.jupiter.api.Assertions.assertEquals;
import static org.junit.jupiter.api.Assertions.assertNotNull;
import org.junit.jupiter.api.AfterAll;
import org.junit.jupiter.api.BeforeAll;
import org.junit.jupiter.api.MethodOrderer;
import org.junit.jupiter.api.Order;
import org.junit.jupiter.api.Test;
import org.junit.jupiter.api.TestMethodOrder;
import bookshop.vo.AuthorVo;

@TestMethodOrder(MethodOrderer.OrderAnnotation.class)
public class BookDaoTest {
  private static int count = 0;
  private static AuthorDao authorDao = new AuthorDao();
  private static BookVo mockBookVo = new BookVo();
  private static AuthorVo mockAuthorVo = new AuthorVo();
  private static BookDao bookDao = new BookDao();


  @BeforeAll
  public static void setUp() {
    // insert()
    mockAuthorVo.setName("칼세이건");
    authorDao.insert(mockAuthorVo); // mockAuthorVo에 값 세팅

    count = bookDao.findAll().size();
  }

  @Test
  @Order(1)
  public void testInsert() { // vo를 만들고 title, author_no 값 세팅
    mockBookVo.setTitle("코스모스");
    mockBookVo.setAuthorNo(mockAuthorVo.getNo());

    bookDao.insert(mockBookVo);

    assertNotNull(mockBookVo.getNo());
  }

  @Test
  @Order(2)
  public void testFindAll() {
    assertEquals(count + 1, bookDao.findAll().size());

  }

  @Test
  @Order(3)
  public void testUpdate() {
    assertEquals(1, bookDao.update(mockBookVo.getNo(), "대여중")); // 대여중 상태가 아님.
  }


  @AfterAll
  public static void cleanUp() {
    bookDao.deleteByNo(mockBookVo.getNo());
    authorDao.deleteByNo(mockAuthorVo.getNo()); // mockAuthorVo의 author_no는 author의 no를 참조하므로 삭제가
                                                // 안됨.
  }
}
