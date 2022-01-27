import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class AchatAjout extends StatefulWidget {
  final Function _appelToAddAchat;

  AchatAjout(this._appelToAddAchat);

  @override
  State<AchatAjout> createState() => _AchatAjoutState();
}

class _AchatAjoutState extends State<AchatAjout> {
  final _titleController = TextEditingController();
  final _qteController = TextEditingController();
  DateTime _dateChoisi = DateTime.now();

  void _afficherDatePicker() {
    showDatePicker(
            context: context,
            initialDate: DateTime.now(),
            firstDate: DateTime(2022),
            lastDate: DateTime.now())
        .then((chosenDate) {
      if (chosenDate == null) {
        return;
      }

      setState(() {
        _dateChoisi = chosenDate;

        print(DateFormat.yMd().format(_dateChoisi));
        // print(_dateChoisi);
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10),
      child: Card(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            TextField(
              decoration: InputDecoration(labelText: 'Titre'),
              controller: _titleController,
            ),
            TextField(
              decoration: InputDecoration(labelText: 'Quantité'),
              controller: _qteController,
              keyboardType: TextInputType.number,
            ),
            Container(
              child: Row(
                // crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  // Text('date achat'),
                  Text(_dateChoisi == null
                      ? 'date achat'
                      : DateFormat.yMMMd().format(
                          _dateChoisi)), //DateFormat.yMd().format(_dateChoisi)),
                  TextButton.icon(
                    onPressed: _afficherDatePicker,
                    icon: Icon(Icons.date_range),
                    label: Text('Choisir date'),
                  )
                ],
              ),
            ),
            TextButton.icon(
              icon: Icon(Icons.add_task),
              label: Text('Ajout Achat'),
              style: TextButton.styleFrom(
                primary: Colors.white,
                backgroundColor: Colors.teal,
              ),
              onPressed: () {
                if (_titleController.text.isEmpty ||
                    _qteController.text.isEmpty ||
                    double.parse(_qteController.text) <= 0 ||
                    _dateChoisi == null) {
                  return;
                }
                widget._appelToAddAchat(
                  _titleController.text,
                  double.parse(_qteController.text),
                  _dateChoisi,
                );
                Navigator.pop(context);
              },
            )
          ],
        ),
      ),
    );
  }
}
