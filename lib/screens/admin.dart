import 'package:flutter/material.dart';

enum Page { dashboard, manage }

class Admin extends StatefulWidget {
  const Admin({super.key});

  @override
  State<Admin> createState() => _AdminState();
}

class _AdminState extends State<Admin> {
  Page selectedPage = Page.dashboard;
  MaterialColor active = Colors.red;
  MaterialColor notActive = Colors.grey;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Row(
            children: [
              Expanded(
                child: TextButton.icon(
                  onPressed: () {
                    setState(() {
                      selectedPage = Page.dashboard;
                    });
                  },
                  icon: Icon(
                    Icons.dashboard,
                    color: selectedPage == Page.dashboard ? active : notActive,
                  ),
                  label: const Text("Dashboard"),
                ),
              ),
              Expanded(
                child: TextButton.icon(
                  onPressed: () {
                    setState(() {
                      selectedPage = Page.manage;
                    });
                  },
                  icon: Icon(
                    Icons.sort,
                    color: selectedPage == Page.dashboard ? active : notActive,
                  ),
                  label: const Text("Manage"),
                ),
              ),
            ],
          ),
          elevation: 0.0,
          backgroundColor: Colors.white,
        ),
        body: loadScreen());
  }

  Widget loadScreen() {
    switch (selectedPage) {
      case Page.dashboard:
        return Column(
          children: [
            ListTile(
              subtitle: TextButton.icon(
                onPressed: null,
                icon: const Icon(
                  Icons.attach_money,
                  size: 30.0,
                  color: Colors.green,
                ),
                label: const Text(
                  '12.000',
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 30.0, color: Colors.green),
                ),
              ),
              title: const Text(
                'Revenue',
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 24.0, color: Colors.grey),
              ),
            ),
            Expanded(
                child: GridView(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2),
              children: [
                Padding(
                  padding: const EdgeInsets.all(18.0),
                  child: Card(
                      child: ListTile(
                    title: TextButton.icon(
                      onPressed: null,
                      icon: const Icon(Icons.people_outline),
                      label: const Text("Users"),
                    ),
                    subtitle: Text(
                      '7',
                      textAlign: TextAlign.center,
                      style: TextStyle(color: active, fontSize: 60),
                    ),
                  )),
                ),
                Padding(
                  padding: const EdgeInsets.all(18.0),
                  child: Card(
                      child: ListTile(
                    title: TextButton.icon(
                      onPressed: null,
                      icon: const Icon(Icons.category),
                      label: const Text("Categories"),
                    ),
                    subtitle: Text(
                      '23',
                      textAlign: TextAlign.center,
                      style: TextStyle(color: active, fontSize: 60),
                    ),
                  )),
                ),
                Padding(
                  padding: const EdgeInsets.all(22.0),
                  child: Card(
                      child: ListTile(
                    title: TextButton.icon(
                      onPressed: () {},
                      icon: const Icon(Icons.track_changes),
                      label: const Text("Products"),
                    ),
                    subtitle: Text(
                      '120',
                      textAlign: TextAlign.center,
                      style: TextStyle(color: active, fontSize: 60),
                    ),
                  )),
                ),
                Padding(
                  padding: const EdgeInsets.all(22.0),
                  child: Card(
                      child: ListTile(
                    title: TextButton.icon(
                      onPressed: () {},
                      icon: const Icon(Icons.tag_faces),
                      label: const Text("Sold"),
                    ),
                    subtitle: Text(
                      '23',
                      textAlign: TextAlign.center,
                      style: TextStyle(color: active, fontSize: 60),
                    ),
                  )),
                ),
                Padding(
                  padding: const EdgeInsets.all(22.0),
                  child: Card(
                      child: ListTile(
                    title: TextButton.icon(
                      onPressed: () {},
                      icon: const Icon(Icons.shopping_cart),
                      label: const Text("Orders"),
                    ),
                    subtitle: Text(
                      '5',
                      textAlign: TextAlign.center,
                      style: TextStyle(color: active, fontSize: 60),
                    ),
                  )),
                ),
                Padding(
                  padding: const EdgeInsets.all(22.0),
                  child: Card(
                      child: ListTile(
                    title: TextButton.icon(
                      onPressed: () {},
                      icon: const Icon(Icons.close),
                      label: const Text("Return"),
                    ),
                    subtitle: Text(
                      '0',
                      textAlign: TextAlign.center,
                      style: TextStyle(color: active, fontSize: 60),
                    ),
                  )),
                ),
              ],
            ))
          ],
        );
      case Page.manage:
        return ListView(
          children: [
            ListTile(
              leading: const Icon(Icons.add),
              title: const Text("Add Product"),
              onTap: () {},
            ),
            const Divider(),
            ListTile(
              leading: const Icon(Icons.change_history),
              title: const Text("Products List"),
              onTap: () {},
            ),
            const Divider(),
            ListTile(
              leading: const Icon(Icons.add_circle),
              title: const Text("Add Category"),
              onTap: () {},
            ),
            const Divider(),
            ListTile(
              leading: const Icon(Icons.category),
              title: const Text("Category list"),
              onTap: () {},
            ),
            const Divider(),
            ListTile(
              leading: const Icon(Icons.add_circle_outline),
              title: const Text("Add Brand"),
              onTap: () {},
            ),
            const Divider(),
            ListTile(
              leading: const Icon(Icons.library_books),
              title: const Text("Brand List"),
              onTap: () {},
            ),
          ],
        );
      default:
        return Container();
    }
  }
}
