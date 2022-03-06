import 'package:flutter/material.dart';

class NewTransaction extends StatefulWidget {
  //const New_transaction({Key? key}) : super(key: key);
  final void Function(String, double) addNew;

  NewTransaction({required this.addNew});

  @override
  State<NewTransaction> createState() => _NewTransactionState();
}

class _NewTransactionState extends State<NewTransaction> {
  final titleController = TextEditingController();

  final amountController = TextEditingController();

  void submitForm() {
    final enteredTitle = titleController.text;
    final enteredAmount = double.tryParse(amountController.text);
    if (enteredTitle.isEmpty || enteredAmount! <= 0) return;
    widget.addNew(titleController.text, double.parse(amountController.text));
    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Container(
        padding: EdgeInsets.all(10),
        child: Column(crossAxisAlignment: CrossAxisAlignment.end, children: [
          TextField(
            decoration: InputDecoration(labelText: 'Title'),
            controller: titleController,
          ),
          TextField(
            onSubmitted: (_) => submitForm(),
            decoration: InputDecoration(labelText: 'Amount'),
            controller: amountController,
            keyboardType: TextInputType.numberWithOptions(decimal: true),
          ),
          TextButton(
            onPressed: submitForm,
            child: Text('Valider'),
            style: TextButton.styleFrom(
                primary: Colors.deepPurple,
                textStyle: TextStyle(
                    color: Colors.purple,
                    fontWeight: FontWeight.bold,
                    fontSize: 15)),
          )
        ]),
      ),
    );
  }
}
