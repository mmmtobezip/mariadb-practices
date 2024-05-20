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
public class AuthorDaoTest {
  private static int count = 0;
  private static AuthorDao authorDao = new AuthorDao();
  private static AuthorVo mockAuthorVo = new AuthorVo();

  @BeforeAll
  public static void setUp() {
    count = authorDao.findAll().size(); // findAll()로 나온 list의 size
  }

  @Test
  @Order(1)
  public void testInsert() {
    AuthorVo vo = new AuthorVo();
    mockAuthorVo.setName("칼세이건");
    authorDao.insert(mockAuthorVo);

    System.out.println(mockAuthorVo); // AuthorVo의 toString으로 값 가져옴
    assertNotNull(mockAuthorVo.getNo());
  }

  @Test
  @Order(2)
  public void testFindAll() {
    assertEquals(count + 1, authorDao.findAll().size());
  }

  @AfterAll
  public static void cleanUp() {
    authorDao.deleteByNo(mockAuthorVo.getNo()); // no값은 vo.setName("")에서 셋팅됨.
  }

}
