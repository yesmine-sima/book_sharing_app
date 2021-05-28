import 'post_model.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

Future<List<ProductModel>> fetchProducts() async {
  String url = "http://192.168.0.104/books/ads_post.php";
  final resz = await http.get(url);
  return productModelFromJson(resz.body);
}

class AdsPost extends StatefulWidget {
  @override
  _AdsPostState createState() => _AdsPostState();
}

class _AdsPostState extends State<AdsPost> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("All Ads Show"),
      ),
      body: Container(
        child: FutureBuilder(
          future: fetchProducts(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return ListView.builder(
                itemCount: snapshot.data.length,
                shrinkWrap: true,
                itemBuilder: (BuildContext context, index) {
                  ProductModel product = snapshot.data[index];
                  return Padding(
                    padding:
                        EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
                    child: Card(
                        elevation: 2.0,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(16.0),
                        ),
                        child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              ClipRRect(
                                  child: Image.network('${product.bookPhoto}'),
                                  borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(16.0),
                                    topRight: Radius.circular(16.0),
                                  )),
                              Padding(
                                  padding: EdgeInsets.all(16.0),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        '${product.bookName}'.toUpperCase(),
                                        
                                        style:
                                            // ignore: deprecated_member_use
                                            Theme.of(context).textTheme.title,
                                      ),
                                      SizedBox(height: 16.0),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text('${product.bookPrice}' + 'TK'),
                                          Text('${product.meetLoc}'),
                                          Text('${product.postCreated}'),
                                        ],
                                      )
                                    ],
                                  ))
                            ])),
                  );
                },
              );
            }
            return Center(child: CircularProgressIndicator());
          },
        ),
      ),
    );
  }
}
