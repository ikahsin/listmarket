import 'package:flutter/material.dart';
import 'package:untitled21/productPage.dart';


void main() {
  runApp(MyApp());
}

final List<String> ImageContent = [
  'https://ichip.ru/images/cache/2023/9/19/widen_960_crop_956_700_0_0_q90_786652_83141802c768a66bee751887c.jpeg',
  'https://ichip.ru/images/cache/2023/9/19/widen_960_crop_956_700_0_0_q90_786672_d3c8a84c7a371b11879943bbd.jpeg',
  'https://ichip.ru/images/cache/2023/9/19/widen_960_crop_956_700_0_0_q90_786692_1b2ed99411219d0700cdc78e8.jpeg',
  'https://ichip.ru/images/cache/2023/9/19/widen_960_crop_956_700_0_0_q90_786702_4d2eaf2687ef5dfbfa7b38498.jpeg',
  'https://ichip.ru/images/cache/2023/9/19/widen_960_crop_956_700_0_0_q90_786682_70f377f997cab99a559d25f40.jpeg',
  'https://ichip.ru/images/cache/2023/9/19/widen_960_crop_956_700_0_0_q90_786712_10db6a940bfaaff6760227108.jpeg',
  'https://ichip.ru/images/cache/2023/9/19/widen_960_crop_956_700_0_0_q90_786722_95174dbc8babfd6872a4a3a90.jpeg',
  'https://ichip.ru/images/cache/2023/9/19/widen_960_crop_956_700_0_0_q90_786732_31de005eaec2222b5dcbd0bed.jpeg',
  'https://ichip.ru/images/cache/2023/9/19/widen_960_crop_956_700_0_0_q90_786742_4595e8d04e5287300cb47fb30.jpeg',
  'https://ichip.ru/images/cache/2023/9/19/widen_960_crop_956_700_0_0_q90_786752_f5f9d59907b9856b4b26c7561.jpeg',
];

final List<String> TextContent = [
  'iPhone 1',
  'iPhone 3G',
  'iPhone 3GS',
  'iPhone 4',
  'iPhone 4s',
  'iPhone 5',
  'iPhone 5c',
  'iPhone 5S',
  'iPhone 6 / 6 Plus',
  'iPhone SE',
];

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Hapka'),
          backgroundColor: Colors.white,
        ),
        backgroundColor: Colors.lightGreenAccent,
        body: ProductGrid(),
      ),
    );
  }
}


class ProductGrid extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GridView.count(
      crossAxisCount: 2,
      mainAxisSpacing: 8.0,
      crossAxisSpacing: 8.0,
      children: List.generate(ImageContent.length, (index) {
        return ProductCard(
          imageUrl: ImageContent[index],
          productName: TextContent[index],
        );
      }),
    );
  }
}


class ProductCard extends StatelessWidget {
  final String imageUrl;
  final String productName;

  ProductCard({required this.imageUrl, required this.productName});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: EdgeInsets.all(8.0),
        child: Column(
          children:[
            Image.network(imageUrl, width: 100, height: 100,),
            Text(productName),
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => ProductDetailsPage(
                      ImageContent: imageUrl,
                      TextContent: productName,
                    ),
                  ),
                );
              },
              child: Text('название'),
            )
          ],
        ),
      ),
    );
  }
}