import 'package:flutter/material.dart';
import 'package:my_shop_app/data/listing_model.dart';
import 'package:my_shop_app/detail/detail_page.dart';

class ShopListItem extends StatelessWidget {
  const ShopListItem({
    required this.model,
    Key? key,
  }) : super(key: key);

  final ListingModel model;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: AspectRatio(
        aspectRatio: 1,
        child: Hero(
          tag: "myAnimation${model.id}",
          child: Image.network(model.image),
        ),
      ),
      title: Text(model.title),
      subtitle: Text(
        model.description,
        maxLines: 2,
        overflow: TextOverflow.ellipsis,
      ),
      onTap: () {
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) {
              return DetailPage(model);
            },
          ),
        );
      },
    );
  }
}
