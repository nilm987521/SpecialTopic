package net.ddns.iiiedug02.model.service;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import net.ddns.iiiedug02.model.bean.ShoppingCart;
import net.ddns.iiiedug02.model.repository.ShoppingCartRepository;

@Service
public class ShoppingCartService {

  @Autowired
  private ShoppingCartRepository shoppingCartRepository;

  public List<ShoppingCart> findByUid(int uid) {
    return shoppingCartRepository.findByUid(uid);
  }

  public void deleteById(int uid) {
    shoppingCartRepository.deleteById(uid);
  }

  public ShoppingCart save(ShoppingCart sc) {
    if (null == shoppingCartRepository.findByUidAndClassBean(sc.getUid(), sc.getClassBean())) {
      shoppingCartRepository.save(sc);
      return shoppingCartRepository.findByUidAndClassBean(sc.getUid(), sc.getClassBean());
    }
    return null;
  }
}
