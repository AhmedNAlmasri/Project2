import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import '../models/product_layout.dart';

class StoreContent with ChangeNotifier {
  List<List<ProductLayout>> storeContent = [
    [
      ProductLayout(
          'zara buttons shirt',
          'https://www.hellomagazine.com/imagenes/fashion/celebrity-style/2020010982912/amanda-holden-blue-zara-top-instagram/0-399-618/zara-top-z.jpg',
          15.99,
          50.99,
          false,
          0),
      ProductLayout(
          'zara blue shirt',
          'https://www.hellomagazine.com/imagenes/fashion/celebrity-style/2020010982912/amanda-holden-blue-zara-top-instagram/0-399-618/zara-top-z.jpg',
          15.99,
          65.99,
          false,
          0),
      ProductLayout(
          'zara grey mens shirt',
          'https://cdn.shopify.com/s/files/1/0752/6435/products/IMG_0005_2.jpg?v=1634377223',
          15.99,
          55,
          false,
          0),
      ProductLayout(
          'zara green shirt',
          'https://images.asos-media.com/products/new-look-long-sleeve-muscle-fit-oxford-shirt-in-khaki/200545390-1-khaki?\$n_480w\$&wid=476&fit=constrain',
          15.99,
          25.5,
          false,
          0),
      ProductLayout(
          'zara check shirt',
          'https://assetscdn1.paytm.com/images/catalog/product/A/AP/APPSUR-T-MEN-COPATE2956072B022AAD/1586406885432_0..jpg?imwidth=282&impolicy=hq',
          15.99,
          55,
          false,
          0),
    ],
    [
      ProductLayout(
          'adidas white shirt',
          'https://rukminim1.flixcart.com/image/800/960/jn97frk0/t-shirt/7/b/p/m-ce1415white-adidas-original-imaf9zdfhjhhygef.jpeg?q=50',
          // 'https://i8.amplience.net/i/jpl/jd_454926_a?qlt=92&w=600&h=765&v=1&fmt=auto',
          15.99,
          50,
          false,
          0),
      ProductLayout(
          'adidas red shirt',
          'https://assets.adidas.com/images/w_383,h_383,f_auto,q_auto:sensitive,fl_lossy,c_fill,g_auto/3bcfb6bd1282449abcbaad6b00dc6d9b_9366/adicolor-classics-trefoil-t-shirt-%E2%80%93-grosse-grossen.jpg',
          99.99,
          209.99,
          false,
          0),
      ProductLayout(
          'pink adidas shirt',
          'https://assets.adidas.com/images/w_383,h_383,f_auto,q_auto:sensitive,fl_lossy,c_fill,g_auto/0f9ade5e7b154709b709ad0b008cb136_9366/adicolor-classics-trefoil-t-shirt.jpg',
          99.99,
          209.99,
          false,
          0),
      ProductLayout(
          'grey adidas shirt',
          'https://assets.adidas.com/images/w_383,h_383,f_auto,q_auto:sensitive,fl_lossy,c_fill,g_auto/35e687afff864631ac4fad0b0082553d_9366/adicolor-classics-trefoil-tee.jpg',
          99.99,
          220.99,
          false,
          0),
    ],
    [
      ProductLayout(
          'H&M shirt',
          'https://static.zara.net/photos///2021/I/0/2/p/5588/472/800/12/w/199/5588472800_2_1_1.jpg?ts=1626290312272',
          15.99,
          29.99,
          false,
          0),
      ProductLayout(
          'H&M black shirt',
          'https://static.zara.net/photos///2021/I/0/2/p/5588/472/800/12/w/199/5588472800_2_1_1.jpg?ts=1626290312272',
          15.99,
          99.99,
          false,
          0),
    ],
    [
      ProductLayout(
          'Red Nike Shirt',
          'https://static.nike.com/a/images/t_PDP_1280_v1/f_auto,q_auto:eco/73507444-25f7-4be0-ad71-45576c5bcf89/sportswear-mens-t-shirt-MK2TR1.png',
          15.99,
          29.99,
          false,
          0),
      ProductLayout(
        'white "nike" shirt',
        'https://i8.amplience.net/i/jpl/jd_454926_a?qlt=92&w=600&h=765&v=1&fmt=auto',
        15.99,
        29.99,
        false,
        0,
      )
    ],
  ];
  void addItem(
    int place,
    String name,
    String image,
    double price,
    int quantity,
    double prev,
    bool isFav,
  ) {
    storeContent[place].add(ProductLayout(name, image, price, prev, isFav, 0));
    notifyListeners();
    //  storeContent .add(ProductLayout(name, image, price, prev, isFav, quantity++));
  }
  // void addItem(int place, ProductLayout items) {
  //   storeContent[place].add(items);
  //   notifyListeners();
  // }

  void removeProduct(int place, String id) {
    storeContent[place].removeWhere((element) => element.name == id);
    notifyListeners();
  }
}
