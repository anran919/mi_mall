import 'package:flutter/material.dart';
import 'package:flutter_swiper_view/flutter_swiper_view.dart';
import 'package:get/get.dart';
import 'package:mi_mall/app/models/product_model_model.dart';
import 'package:mi_mall/app/services/keep_alive.dart';
import 'package:mi_mall/app/services/screen_adapter.dart';
import 'package:mi_mall/fonts/ali.dart';
import '../controllers/home_controller.dart';
import '../widget/recommend.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return KeepAliveWrapper(
        child: Scaffold(
      body: Stack(
        children: [
          _contentView(),
          _appBar(),
        ],
      ),
    ));
  }

  Widget _appBar() {
    return Positioned(
        left: 0,
        right: 0,
        top: 0,
        child: Obx(() => AppBar(
              actions: [
                IconButton(onPressed: () {}, icon: const Icon(Icons.qr_code)),
                IconButton(
                    onPressed: () {},
                    icon: const Icon(Icons.messenger_outline)),
              ],
              leading: controller.flag.value
                  ? Container()
                  : const Padding(
                      padding: EdgeInsets.only(left: 10),
                      child: Icon(
                        AliIcon.logo,
                        color: Colors.orange,
                      ),
                    ),
              leadingWidth: controller.flag.value
                  ? ScreenAdapter.width(7)
                  : ScreenAdapter.width(80),
              foregroundColor: Colors.white,
              title: AnimatedContainer(
                duration: const Duration(milliseconds: 300),
                width: controller.flag.value
                    ? ScreenAdapter.width(800)
                    : ScreenAdapter.width(620),
                height: ScreenAdapter.height(80),
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(15)),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Padding(
                          padding:
                              EdgeInsets.only(left: ScreenAdapter.width(15)),
                          child: Icon(
                            Icons.search,
                            color: Colors.grey[300],
                          ),
                        ),
                        Padding(
                          padding:
                              EdgeInsets.only(left: ScreenAdapter.width(20)),
                          child: Text(
                            "Xbox 360",
                            style: TextStyle(
                                fontSize: ScreenAdapter.fontSize(35),
                                color: Colors.grey[300]),
                          ),
                        )
                      ],
                    ),
                    Padding(
                      padding: EdgeInsets.only(right: ScreenAdapter.width(30)),
                      child: Icon(
                        Icons.settings_overscan_sharp,
                        color: Colors.grey[300],
                      ),
                    )
                  ],
                ),
              ),
              backgroundColor: controller.flag.value
                  ? Colors.orange
                  : const Color(0x1205000A),
              elevation: 0,
              centerTitle: true,
            )));
  }

  Widget _contentView() {
    return Positioned(
        left: 0,
        right: 0,
        bottom: 0,
        top: -ScreenAdapter.height(60),
        child: ListView(
          children: [
            _focusSwiper(),
            // _indemnifyView(),
            _hotSwiper(),
            _bannerView(),
            _hotGoods(),
            const RecommendView()
          ],
        ));
  }

  Widget _hotGoodsItem(ProductItem item) {
    var url = "https://xiaomi.itying.com/${item.pic}";
    return Expanded(
      flex: 1,
      child: Padding(
        padding: EdgeInsets.all(ScreenAdapter.height(10)),
        child: Container(
          decoration: BoxDecoration(
              // color: const Color(0xF8F8F8FF),
              color: Colors.grey[200],
              borderRadius: BorderRadius.circular(ScreenAdapter.width(10))),
          child: Row(
            children: [
              Expanded(
                  flex: 2,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "${item.title}",
                        style: const TextStyle(fontWeight: FontWeight.bold),
                      ),
                      Text(
                        "${item.subTitle}",
                        style: TextStyle(fontSize: ScreenAdapter.fontSize(30)),
                      ),
                      Text(
                        "${item.price}",
                        style: TextStyle(
                            fontSize: ScreenAdapter.fontSize(32),
                            fontWeight: FontWeight.w400,
                            color: Colors.grey),
                      ),
                    ],
                  )),
              Expanded(
                  flex: 1,
                  child: Container(
                    decoration: BoxDecoration(
                      image: DecorationImage(
                          fit: BoxFit.cover,
                          image: NetworkImage(url.replaceAll('\\', '/'))),
                      borderRadius: BorderRadius.only(
                          topRight: Radius.circular(ScreenAdapter.width(10)),
                          bottomRight:
                              Radius.circular(ScreenAdapter.width(10))),
                    ),
                  ))
            ],
          ),
        ),
      ),
    );
  }

  Widget _hotGoods() {
    return Obx(() => Padding(
      padding: EdgeInsets.only(
          left: ScreenAdapter.height(30), right: ScreenAdapter.height(20)),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "热销甄选",
                style: TextStyle(
                    fontSize: ScreenAdapter.fontSize(46),
                    fontWeight: FontWeight.bold),
              ),
              Text(
                "更多手机推荐 >",
                style: TextStyle(
                    fontSize: ScreenAdapter.fontSize(36), color: Colors.grey),
              ),
            ],
          ),
          SizedBox(
            height: ScreenAdapter.height(30),
          ),
          Row(
            children: [
              Expanded(
                  flex: 1,
                  child: Container(
                    decoration: BoxDecoration(
                        borderRadius:
                        BorderRadius.circular(ScreenAdapter.width(10)),
                        color: Colors.grey[200]),
                    height: ScreenAdapter.height(730),
                    child: Swiper(
                      itemCount: 3,
                      itemBuilder: (context, index) {
                        return Container(
                          decoration: BoxDecoration(
                              borderRadius: const BorderRadius.only(
                                  bottomLeft: Radius.circular(10),
                                  bottomRight: Radius.circular(10)),
                              image: DecorationImage(
                                  fit: BoxFit.cover,
                                  image: NetworkImage(
                                    "https://www.itying.com/images/b_focus0${index + 1}.png",
                                  ))),
                        );
                      },
                      pagination: const SwiperPagination(
                          builder: SwiperPagination.rect),
                      autoplay: true,
                    ),
                  )),
              Expanded(
                  flex: 1,
                  child: SizedBox(
                    height: ScreenAdapter.height(738),
                    child: Column(
                        children: controller.hotList
                            .map((product) => _hotGoodsItem(product))
                            .toList()),
                  ))
            ],
          )
        ],
      ),
    ));
  }

  Widget _bannerView() {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(ScreenAdapter.width(15)),
            image: const DecorationImage(
                image: AssetImage('assets/images/banner_1.png'),
                fit: BoxFit.cover)),
        height: ScreenAdapter.height(400),
      ),
    );
  }

  Widget _hotSwiper() {
    return Obx(() => SizedBox(
          width: ScreenAdapter.width(1080),
          height: ScreenAdapter.height(470),
          child: Swiper(
            itemCount: controller.categoryItems.length ~/ 10,
            itemBuilder: (context, index) {
              return GridView.builder(
                  itemCount: 10,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 5,
                      crossAxisSpacing: ScreenAdapter.width(10),
                      mainAxisSpacing: ScreenAdapter.height(10)),
                  itemBuilder: (context, i) {
                    String pic =
                        "https://xiaomi.itying.com/${controller.categoryItems[index * 10 + i].pic}";
                    return Column(
                      children: [
                        Container(
                          alignment: Alignment.center,
                          height: ScreenAdapter.height(140),
                          width: ScreenAdapter.width(140),
                          child: Image.network(
                            pic.replaceAll('\\', '/'),
                            fit: BoxFit.cover,
                          ),
                        ),
                        Padding(
                          padding:
                              EdgeInsets.only(top: ScreenAdapter.height(4)),
                          child: Text(
                            "${controller.categoryItems[index * 10 + i].title}",
                            style:
                                TextStyle(fontSize: ScreenAdapter.fontSize(32)),
                          ),
                        )
                      ],
                    );
                  });
            },
            pagination: const SwiperPagination(builder: SwiperPagination.rect),
            autoplay: true,
          ),
        ));
  }

  // 服务保障
  Widget _indemnifyView() {
    return Container(
      padding: EdgeInsets.all(ScreenAdapter.height(20)),
      height: ScreenAdapter.height(100),
      width: ScreenAdapter.width(1080),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Row(
            children: [
              Icon(
                Icons.check_circle_outline,
                color: Colors.grey[400],
                size: 20 ,
              ),
              Text(
                '官方商城',
                style: TextStyle(color: Colors.grey[600]),
              )
            ],
          ),
          Row(
            children: [
              Icon(
                Icons.check_circle_outline,
                color: Colors.grey[400],
                size: 20 ,
              ),
              Text(
                '后顾无忧',
                style: TextStyle(color: Colors.grey[600]),
              )
            ],
          ),
          Row(
            children: [
              Icon(
                Icons.check_circle_outline,
                color: Colors.grey[400],
                size: 20 ,
              ),
              Text(
                '资质证照',
                style: TextStyle(color: Colors.grey[600]),
              )
            ],
          ),
        ],
      ),
    );
  }

  Widget _focusSwiper() {
    return Obx(() => SizedBox(
      width: ScreenAdapter.width(1080),
      height: ScreenAdapter.height(680),
      child: Swiper(
        itemCount: controller.swiperItems.length,
        itemBuilder: (context, index) {
          String pic =
              "https://xiaomi.itying.com/${controller.swiperItems[index]['pic']}";
          // return Image.asset(controller.swiperItems[index],fit: BoxFit.cover,);
          return Image.network(
            pic.replaceAll("\\", '/'),
            fit: BoxFit.cover,
          );
        },
        pagination: const SwiperPagination(builder: SwiperPagination.rect),
        autoplay: true,
      ),
    ));
  }
}
