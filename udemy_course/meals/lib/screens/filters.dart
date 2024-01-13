import 'package:flutter/material.dart';
// import 'package:meals/screens/tabs.dart';
// import 'package:meals/widgets/main_drawer.dart';

enum Filter {
  glutenFree,
  lactoseFree,
  vegetarian,
  vegan
}

class FiltersScreen extends StatefulWidget {
  const FiltersScreen({super.key, required this.currentFilters});

  final Map<Filter, bool> currentFilters;

  @override
  State<FiltersScreen> createState() => _FiltersScreenState();
}

class _FiltersScreenState extends State<FiltersScreen> {

  var _glutenFreeFilter = false;
  var _lactoseFreeFilter = false;
  var _vegFilter = false;
  var _veganFilter = false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _glutenFreeFilter = widget.currentFilters[Filter.glutenFree]!;
    _lactoseFreeFilter = widget.currentFilters[Filter.lactoseFree]!;
    _veganFilter = widget.currentFilters[Filter.vegan]!;
    _vegFilter = widget.currentFilters[Filter.vegetarian]!;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Your filters"),
      ),
      // drawer: MainDrawer(onSelectScreen: (identifier){
      //   Navigator.of(context).pop();
      //   if(identifier == 'meals'){
      //     Navigator.of(context).push(MaterialPageRoute(builder: (ctx)=> const TabsScreen()));
      //   }
      // }),
      body: WillPopScope(
        onWillPop: () async{
          Navigator.of(context).pop({
            Filter.glutenFree: _glutenFreeFilter,
            Filter.lactoseFree: _lactoseFreeFilter,
            Filter.vegetarian: _vegFilter,
            Filter.vegan: _veganFilter
          });
          return false;
        },
        child: Column(
          children: [
            SwitchListTile(
              value: _glutenFreeFilter,
              onChanged: (isChecked){
                setState(() {
                  _glutenFreeFilter = isChecked;
                });
              },
              title: Text("Glutten-free", style: Theme.of(context).textTheme.titleLarge!.copyWith(color: Theme.of(context).colorScheme.onBackground),),
              subtitle: Text('Only include gluten-free meals', style: Theme.of(context).textTheme.labelMedium!.copyWith(color: Theme.of(context).colorScheme.onBackground),),
              activeColor: Theme.of(context).colorScheme.tertiary,
              contentPadding: const EdgeInsets.only(left: 34, right: 22),
            ),
            SwitchListTile(
              value: _lactoseFreeFilter,
              onChanged: (isChecked){
                setState(() {
                  _lactoseFreeFilter = isChecked;
                });
              },
              title: Text("Lactose-free", style: Theme.of(context).textTheme.titleLarge!.copyWith(color: Theme.of(context).colorScheme.onBackground),),
              subtitle: Text('Only include lactose-free meals', style: Theme.of(context).textTheme.labelMedium!.copyWith(color: Theme.of(context).colorScheme.onBackground),),
              activeColor: Theme.of(context).colorScheme.tertiary,
              contentPadding: const EdgeInsets.only(left: 34, right: 22),
            ),
            SwitchListTile(
              value: _vegFilter,
              onChanged: (isChecked){
                setState(() {
                  _vegFilter = isChecked;
                });
              },
              title: Text("Vegetarian meals", style: Theme.of(context).textTheme.titleLarge!.copyWith(color: Theme.of(context).colorScheme.onBackground),),
              subtitle: Text('Only include vegetarian meals', style: Theme.of(context).textTheme.labelMedium!.copyWith(color: Theme.of(context).colorScheme.onBackground),),
              activeColor: Theme.of(context).colorScheme.tertiary,
              contentPadding: const EdgeInsets.only(left: 34, right: 22),
            ),
            SwitchListTile(
              value: _veganFilter,
              onChanged: (isChecked){
                setState(() {
                  _veganFilter = isChecked;
                });
              },
              title: Text("Vegan meals", style: Theme.of(context).textTheme.titleLarge!.copyWith(color: Theme.of(context).colorScheme.onBackground),),
              subtitle: Text('Only include vegan meals', style: Theme.of(context).textTheme.labelMedium!.copyWith(color: Theme.of(context).colorScheme.onBackground),),
              activeColor: Theme.of(context).colorScheme.tertiary,
              contentPadding: const EdgeInsets.only(left: 34, right: 22),
            )
          ],
        ),
      ),
    );
  }
}