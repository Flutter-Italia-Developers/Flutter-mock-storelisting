import 'package:flutter/material.dart';

import '../data/listing_model.dart';

class DetailPage extends StatelessWidget {
  const DetailPage(this.model, {Key? key}) : super(key: key);

  final ListingModel model;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(model.title)),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Hero(
            tag: "myAnimation${model.id}",
            child: Image.network(
              model.image,
              height: 200,
              fit: BoxFit.cover,
              alignment: Alignment.topCenter,
            ),
          ),
          Expanded(
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Text(model.description),
              ),
            ),
          ),
        ],
      ),
      bottomNavigationBar: BottomAppBar(
        child: Container(
          padding: const EdgeInsets.all(16.0),
          child: Row(
            children: [
              Text(
                "Price €${model.price.toStringAsFixed(2)}",
                style: Theme.of(context).textTheme.headline6,
              ),
              const Spacer(),
              Text(
                "Rate ${model.rating.rate} (${model.rating.count})",
                style: Theme.of(context).textTheme.caption,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
