import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:shopping_list/data/categories.dart';
import 'package:shopping_list/data/dummy_items.dart';
import 'package:shopping_list/models/category.dart';
import 'package:shopping_list/models/grocery_item.dart';
import 'package:shopping_list/widgets/new_item.dart';

import 'package:http/http.dart' as http;

class GroceryItems extends StatefulWidget {
  const GroceryItems({super.key});

  @override
  State<GroceryItems> createState() => _GroceryItemsState();
}

class _GroceryItemsState extends State<GroceryItems> {
  List<GroceryItem> _groceryItem = [];

  var _isLoading = true;
  String? _error;

  void _loadItems() async {
    final url = Uri.https('flutter-prep-6b32e-default-rtdb.firebaseio.com', 'shopping-list.json');

    // try {
    // } catch(error){}

    final response = await http.get(url);

    if(response.statusCode >= 400){
      setState(() {
        _error = "Failed to fetch data. Please try again later.";
      });
    }

    if(response.body == "null"){
      setState(() {
        _isLoading = false;
      });
      return;
    }

    final Map<String, dynamic> listData = json.decode(response.body);
    final List<GroceryItem> loadedItems = [];

    for (final item in listData.entries){
      final finalCategory = categories.entries.firstWhere((catItem) => catItem.value.name == item.value['category']).value;

      loadedItems.add(GroceryItem(
        id: item.key,
        name: item.value['name'],
        quantity: item.value['quantity'],
        category: finalCategory
      ));
    }
    
    setState(() {
      _groceryItem = loadedItems;
      _isLoading = false;
    });

  }

  @override
  void initState() {
    super.initState();
    _loadItems();
  }


  void _addItem() async {
    final newItem = await Navigator.of(context).push<GroceryItem>(
      MaterialPageRoute(
        builder: (ctx) => const NewItem(),
      ),
    );

    if(newItem == null){
      return;
    }

    setState(() {
      _groceryItem.add(newItem);
    });

  }

  void _removeItem(GroceryItem item) async {
    final index = _groceryItem.indexOf(item);
    setState(() {
      _groceryItem.remove(item);
    });

    final url = Uri.https('flutter-prep-6b32e-default-rtdb.firebaseio.com', 'shopping-list/${item.id}.json');

    final response = await http.delete(url);

    if(response.statusCode >= 400){
      setState(() {
        _groceryItem.insert(index, item);
      });
    }

  }

  @override
  Widget build(BuildContext context) {

    Widget content = const Center(child: Text("No items added yet."),);

    if(_isLoading){
      content = const Center(child: CircularProgressIndicator(),);
    }

    if(_groceryItem.isNotEmpty){
      content = ListView.builder(
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
      );
    }

    if(_error != null){
      content = Center(child: Text(_error!),);
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text("Your Groceries"),
        actions: [
          IconButton(
            onPressed: _addItem,
            icon: const Icon(Icons.add))
        ],
      ),
      body: content 
    );
  }
}