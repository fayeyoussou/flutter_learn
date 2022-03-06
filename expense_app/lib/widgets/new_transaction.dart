import 'package:flutter/material.dart';

class NewTransaction extends StatelessWidget {
  //const New_transaction({Key? key}) : super(key: key);
  final void Function(String, double) addNew;
  const NewTransaction({required this.addNew});
  @override
  Widget build(BuildContext context) {
    final titleController = TextEditingController();
    final amountController = TextEditingController();
    return Card(
      child: Container(
        padding: EdgeInsets.all(10),
        child: Column(crossAxisAlignment: CrossAxisAlignment.end, children: [
          TextField(
            decoration: InputDecoration(labelText: 'Title'),
            controller: titleController,
          ),
          TextField(
            decoration: InputDecoration(labelText: 'Amount'),
            controller: amountController,
          ),
          TextButton(
            onPressed: () {
              addNew(titleController.text, double.parse(amountController.text));
            },
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
