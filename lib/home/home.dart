import 'package:flutter/material.dart';
import 'package:my_shop_app/application/ApiService.dart';
import 'package:my_shop_app/data/listing_model.dart';
import 'package:my_shop_app/home/shop_list_item.dart';

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text("My Shop App")),
        body: FutureBuilder<List<ListingModel>>(
          future: ApiService.getListings(),
          builder: (context, snapshot) {
            if(snapshot.connectionState != ConnectionState.done) {
              return const Center(child: CircularProgressIndicator.adaptive());
            }

            final listings = snapshot.data;
            if(listings == null) {
              return const Center(child: Text("No listing available"));
            }

            return ListView.builder(
              itemCount: listings.length,
              itemBuilder: (context, index) {
                return ShopListItem(model: listings[index]);
              },
            );
          }
        ));
  }
}
