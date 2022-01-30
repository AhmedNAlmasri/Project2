import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter_ecommerce_ui_kit/models/product_layout.dart';
import 'package:provider/provider.dart';
import 'providers/store_provider.dart';
import 'edit_products.dart';

// ignore: must_be_immutable

class Admin extends StatelessWidget {
  static const routename = '/admin';
  var index = 0;

  @override
  Widget build(BuildContext context) {
    // final _storeprov = Provider.of<StoreContent>(context);
    final itemsList = Provider.of<StoreContent>(context).storeContent;
    // void removeItem(int i, String name) {
    //   setState(() {
    //     itemsList[i].removeWhere((element) => element.name == name);
    //   });
    // }

    return Scaffold(
      appBar: AppBar(
        title: Text('Admin page'),
        actions: [
          IconButton(
              onPressed: () {
                Navigator.pushNamed(context, EditProducts.routename);
              },
              icon: Icon(Icons.edit))
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            ListAdmin(itemsList: itemsList, index: 0),
            ListAdmin(itemsList: itemsList, index: 1),
            ListAdmin(itemsList: itemsList, index: 2),
            ListAdmin(itemsList: itemsList, index: 3),
          ],
        ),
      ),
    );
  }
}

class ListAdmin extends StatefulWidget {
  const ListAdmin({
    Key? key,
    required this.itemsList,
    required this.index,
  }) : super(key: key);

  final List<List<ProductLayout>> itemsList;
  final int index;

  @override
  State<ListAdmin> createState() => _ListAdminState();
}

class _ListAdminState extends State<ListAdmin> {
  @override
  void removeItem(int i, String name) {
    setState(() {
      widget.itemsList[i].removeWhere((element) => element.name == name);
    });
  }

  Widget build(BuildContext context) {
    return ListView.builder(
      physics: NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      itemCount: widget.itemsList[widget.index].length,
      itemBuilder: (ctx, i) {
        return ListTile(
          subtitle: Row(
            children: [
              Text(widget.itemsList[widget.index][i].price.toString() + '\$'),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  widget.itemsList[widget.index][i].prevPrice.toString() + '\$',
                  style: TextStyle(
                    decoration: TextDecoration.lineThrough,
                  ),
                ),
              ),
            ],
          ),
          leading: Image.network(
            widget.itemsList[widget.index][i].img,
          ),
          title: Text(widget.itemsList[widget.index][i].name),
          trailing: IconButton(
            icon: Icon(
              Icons.delete,
              color: Colors.red,
            ),
            onPressed: () {
              removeItem(widget.index, widget.itemsList[widget.index][i].name);
            },
          ),
        );
      }, //build
    );
  }
}
