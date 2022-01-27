import 'package:flutter/widgets.dart';
import './models/achat.dart';
import 'package:flutter/material.dart';

import 'widgets/achat_list.dart';
import 'widgets/achat_ajout.dart';

class HomePage extends StatefulWidget {
  HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool _showChart = true;

  final List<Achat> _achats = [
    // Achat(id: 't1', title: 'Shoes', amount: 66.5, date: DateTime.now()),
    // Achat(id: 't2', title: 'Groceries', amount: 27.3, date: DateTime.now()),
    // Achat(id: 't3', title: 'Tel', amount: 750, date: DateTime.now()),
    // Achat(id: 't4', title: 'Watch', amount: 219.99, date: DateTime.now()),
  ];

  void _ajoutAchat(String aTitle, double aQte, DateTime aDate) {
    final newAchat = Achat(
      title: aTitle,
      amount: aQte,
      date: aDate,
      id: aDate.toString(),
    );

    setState(() {
      _achats.add(newAchat);
    });
  }

  void _deleteAchat(String id) {
    setState(() {
      _achats.removeWhere((achat) => achat.id == id);
    });
  }

  void _showScreenSize() {
    print(
        'Taille écran : ${MediaQuery.of(context).size.width.toStringAsFixed(2)} x ${MediaQuery.of(context).size.height.toStringAsFixed(2)}');
  }

  void _showAjoutAchatModal(BuildContext ctx) {
    showModalBottomSheet(
        context: ctx,
        builder: (_) {
          return GestureDetector(
            child: AchatAjout(_ajoutAchat),
            behavior: HitTestBehavior.opaque,
            onTap: () {},
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Expense Planner'),
        actions: [
          IconButton(
            onPressed: () {},
            icon: Icon(Icons.add),
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('Show chart'),
                Switch(
                  value: _showChart,
                  onChanged: (val) {
                    setState(() {
                      _showChart = val;
                    });
                  },
                ),
              ],
            ),
            _showChart ? ChartWidget() : Container(),
            // AchatAjout(_ajoutAchat),
            AchatList(_achats, _deleteAchat),
          ],
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: FloatingActionButton(
        child: Icon(
          Icons.add,
        ),
        onPressed: () {
          _showScreenSize();
          _showAjoutAchatModal(context);
        },
      ),
    );
  }
}

class ChartWidget extends StatelessWidget {
  const ChartWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 40,
      child: Card(
        color: Colors.amber,
        child: Text('CHART'),
      ),
    );
  }
}
