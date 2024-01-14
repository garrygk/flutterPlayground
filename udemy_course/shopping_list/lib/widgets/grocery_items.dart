import 'package:flutter/material.dart';
import 'package:shopping_list/data/dummy_items.dart';
import 'package:shopping_list/models/grocery_item.dart';
import 'package:shopping_list/widgets/new_item.dart';

class GroceryItems extends StatefulWidget {
  const GroceryItems({super.key});

  @override
  State<GroceryItems> createState() => _GroceryItemsState();
}

class _GroceryItemsState extends State<GroceryItems> {

  final List<GroceryItem> _groceryItem = [];

  void _addItem() async {
    final newItem = await Navigator.of(context).push<GroceryItem>(
      MaterialPageRoute(
        builder: (ctx) => const NewItem(),
      ),
    );

    if (newItem == null) {
      return;
    }
    setState(() {
      _groceryItem.add(newItem);
    });
  }

  void _removeItem(GroceryItem item){
    setState(() {
      _groceryItem.remove(item);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Your Groceries"),
        actions: [
          IconButton(
            onPressed: _addItem,
            icon: const Icon(Icons.add))
        ],
      ),
      body: _groceryItem.isNotEmpty ? ListView.builder(
      itemCount: _groceryItem.length,
      itemBuilder: (ctx, index) => Dismissible(
        key: ValueKey(_groceryItem[index]),
        background: Container(
          color: Theme.of(context).colorScheme.error.withOpacity(.75),
        ),
        child: ListTile(
          title: Text(_groceryItem[index].name),
          leading: Container(
            width: 24,
            height: 24,
            color: _groceryItem[index].category.color,
          ),
          trailing: Text(_groceryItem[index].quantity.toString(), style: const TextStyle(fontSize: 15),),
        ),
        onDismissed: (direction){
          _removeItem(_groceryItem[index]);
        },
      )
    ) : Center(
      child: Text(
        "Nothing to show. \n Add new items!",
        style: Theme.of(context).textTheme.headlineLarge,
      ),
    )
    );
  }
}