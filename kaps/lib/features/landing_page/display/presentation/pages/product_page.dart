import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:kaps/features/landing_page/display/domain/entites/entities.dart';
import 'package:http/http.dart' as http;

class ProductPage extends StatefulWidget {
  const ProductPage({super.key});

  @override
  State<ProductPage> createState() => _ProductPageState();
}

class _ProductPageState extends State<ProductPage> {
  Future<ImageProvider> _loadImage(String imageUrl) async {
    try {
      final response = await http.get(Uri.parse(imageUrl));
      if (response.statusCode == 200) {
        return NetworkImage(imageUrl, scale: 1.0);
      } else {
        throw Exception('Failed to load image');
      }
    } catch (e) {
      return AssetImage('assets/images/kaps_splash.png');
    }
  }

  @override
  Widget build(BuildContext context) {
    final double Sheight = MediaQuery.of(context).size.height;
    final double Swidth = MediaQuery.of(context).size.width;
    final ProductEntity product =
        ModalRoute.of(context)?.settings.arguments as ProductEntity;
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: Sheight * 0.5,
              width: Swidth,
              child: ClipRRect(
                borderRadius: BorderRadius.only(
                  bottomRight: Radius.circular(50),
                ),
                child: FutureBuilder<ImageProvider>(
                  future: _loadImage(
                      "https://kaps-api.purposeblacketh.com/" + product.file),
                  builder: (BuildContext context,
                      AsyncSnapshot<ImageProvider> snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return Center(
                          child:
                              CircularProgressIndicator()); // Show a loading indicator while waiting
                    } else if (snapshot.hasError) {
                      return Image.asset(
                        'assets/images/kaps_splash.png',
                        width: double.infinity,
                        fit: BoxFit.fill,
                      );
                    } else {
                      return Image(
                        image: snapshot.data ??
                            AssetImage('assets/images/kaps_splash.png'),
                        width: double.infinity,
                        fit: BoxFit.fill,
                      );
                    }
                  },
                ),
              ),
            ),
            Container(
              width: Swidth,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(50),
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(product.productdescription),
              ),
            )
          ],
        ),
      ),
    );
  }
}
