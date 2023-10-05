import 'package:flutter/material.dart';
import 'package:food_tracker/utils/tab_controller.dart';
import 'package:food_tracker/widgets/dropdown_button.dart';

class AddFoodTab {
  final String name;
  final Color color;

  const AddFoodTab({
    required this.name,
    required this.color,
  });
}

class JournalAddFoodScreen extends StatefulWidget {
  final String meal;

  const JournalAddFoodScreen({
    super.key,
    required this.meal,
  });

  @override
  State<JournalAddFoodScreen> createState() => _JournalAddFoodScreenState();
}

class _JournalAddFoodScreenState extends State<JournalAddFoodScreen>
    with TickerProviderStateMixin {
  final _formKey = GlobalKey<FormState>();
  late TabController _tabController;
  late Color _indicatorColor;

  late String _meal;

  final List<String> _meals = [
    "Petit-déjeuner",
    "Déjeuner",
    "Dîner",
    "Collation",
  ];

  final List<AddFoodTab> _tabNames = [
    const AddFoodTab(name: "Tous", color: Colors.blue),
    const AddFoodTab(name: "Mes repas", color: Colors.deepPurple),
    const AddFoodTab(name: "Mes aliments", color: Colors.green),
    const AddFoodTab(name: "Mes recettes", color: Colors.orange),
  ];

  @override
  void initState() {
    super.initState();
    _meal = widget.meal;
    _tabController = TabController(length: _tabNames.length, vsync: this);
    _indicatorColor = _tabNames[_tabController.index].color;

    TabControllerHandler tabControllerHanlder = TabControllerHandler(
      _tabController,
      handler: (index) {
        if (index == null) {
          return;
        }

        setState(() {
          _indicatorColor = _tabNames[index].color;
        });
      },
    );

    _tabController.animation!
        .addListener(tabControllerHanlder.handleColorChange);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(color: Colors.white),
        backgroundColor: Colors.blueGrey,
        title: Center(
          child: Form(
            key: _formKey,
            child: SizedBox(
              width: 155,
              child: AppDropdownButtonFormField(
                  items: _meals,
                  value: _meal,
                  onChanged: (newValue) {
                    setState(() {
                      _meal = newValue!;
                    });
                  }),
            ),
          ),
        ),
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(120.0),
          child: Container(
            decoration: const BoxDecoration(
              color: Colors.white,
            ),
            child: Column(
              children: [
                const SizedBox(height: 20.0),
                Container(
                  width: 350,
                  decoration: BoxDecoration(
                    border: Border.all(
                      width: 2.0,
                      color: Colors.blue,
                    ),
                    borderRadius: const BorderRadius.all(
                      Radius.circular(30.0),
                    ),
                  ),
                  child: TextFormField(
                    decoration: const InputDecoration(
                        hintText: "Rechercher un aliment",
                        prefixIcon: Icon(Icons.search),
                        border: InputBorder.none),
                  ),
                ),
                TabBar(
                  labelColor: _indicatorColor,
                  indicatorColor: _indicatorColor,
                  controller: _tabController,
                  tabAlignment: TabAlignment.center,
                  tabs: _tabNames
                      .map(
                        (tabName) => Tab(
                          child: Text(
                            tabName.name,
                            style: const TextStyle(
                              fontSize: 12.0,
                            ),
                          ),
                        ),
                      )
                      .toList(),
                )
              ],
            ),
          ),
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: _tabNames
            .map(
              (tabName) => Center(
                child: Text(tabName.name),
              ),
            )
            .toList(),
      ),
    );
  }
}
