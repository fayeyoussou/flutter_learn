import 'package:flutter/material.dart';
class New_transaction extends StatelessWidget {
  const New_transaction({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final titleController = TextEditingController();
    final amountController = TextEditingController();
    return Card(
              child: Container(
                padding: EdgeInsets.all(10),
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
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
                          print(amountController.text);
                          print(titleController.text);
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
            )
            ;
  }
}