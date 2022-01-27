import 'package:expenseplanner/models/achat.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class AchatList extends StatelessWidget {
  AchatList(this._achats, this._appelTodeleteAchat);

  final List<Achat> _achats;
  final Function _appelTodeleteAchat;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 300,
      child: _achats.isEmpty
          ? Column(
              children: [
                Text('Pas d' 'achats !'),
                SizedBox(
                  height: 30,
                ),
                Container(
                    height: 200,
                    child: Image.asset(
                      'assets/img/waiting.png',
                      fit: BoxFit.cover,
                    )),
              ],
            )
          : ListView.builder(
              itemCount: _achats.length,
              itemBuilder: (ctx, index) {
                return Card(
                  elevation: 5,
                  margin: EdgeInsets.symmetric(
                    vertical: 8,
                    horizontal: 5,
                  ),
                  child: ListTile(
                    leading: CircleAvatar(
                      radius: 30,
                      child: Padding(
                        padding: EdgeInsets.all(6),
                        child: FittedBox(
                          child: Text(
                            '${_achats[index].amount.toStringAsFixed(2)} DT',
                          ),
                        ),
                      ),
                    ),
                    title: Text(_achats[index].title),
                    subtitle:
                        Text(DateFormat.yMMMd().format(_achats[index].date)),
                    trailing: IconButton(
                      icon: Icon(Icons.delete),
                      color: Theme.of(context).errorColor,
                      onPressed: () => _appelTodeleteAchat(_achats[index].id),
                    ),
                  ),
                  // Row(
                  //   children: [
                  //     Container(
                  //       margin: EdgeInsets.symmetric(
                  //         horizontal: 15,
                  //         vertical: 10,
                  //       ),
                  //       padding: EdgeInsets.all(10),
                  //       decoration: BoxDecoration(
                  //         border: Border.all(
                  //           width: 2,
                  //           color:
                  //               Theme.of(context).primaryColor, //Colors.purple,
                  //         ),
                  //       ),
                  //       child: Text(
                  //         '${_achats[index].amount.toStringAsFixed(2)} DT',
                  //         style: TextStyle(
                  //           fontWeight: FontWeight.bold,
                  //           fontSize: 20,
                  //           color:
                  //               Theme.of(context).primaryColor, //Colors.purple,
                  //         ),
                  //       ),
                  //     ),
                  //     Column(
                  //       crossAxisAlignment: CrossAxisAlignment.start,
                  //       children: [
                  //         Text(
                  //           _achats[index].title,
                  //           style: TextStyle(
                  //             fontWeight: FontWeight.bold,
                  //             fontSize: 16,
                  //           ),
                  //         ),
                  //         Text(
                  //           DateFormat.yMMMd().format(_achats[index].date),
                  //           style: TextStyle(
                  //             fontWeight: FontWeight.bold,
                  //             fontSize: 14,
                  //             color: Colors.grey,
                  //           ),
                  //         ),
                  //       ],
                  //     ),
                  //   ],
                  // ),
                );
              },
            ),
    );
  }
}
