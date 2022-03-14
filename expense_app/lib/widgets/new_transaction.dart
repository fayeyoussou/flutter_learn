import 'package:expense_app/models/achat_produit.dart';
import 'package:flutter/material.dart';

class NewTransaction extends StatefulWidget {
  //const New_transaction({Key? key}) : super(key: key);
  //final void Function(String, double) addNew;
  final void Function() addNew;
  final List<AchatProduit> achatProduit;

  NewTransaction({required this.addNew, required this.achatProduit});

  @override
  State<NewTransaction> createState() => _NewTransactionState();
}

class _NewTransactionState extends State<NewTransaction> {
  final titleController = TextEditingController();

  final amountController = TextEditingController();
  List<TextEditingController> controller = [];

  void submitForm() {
    final enteredTitle = titleController.text;
    final enteredAmount = double.tryParse(amountController.text);
    if (enteredTitle.isEmpty || enteredAmount! <= 0) return;
    widget.addNew();
    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    for (var i = 0; i < widget.achatProduit.length; i++) {
      controller.add(TextEditingController());
      controller[i].text = widget.achatProduit[i].getQuantite == 0
          ? ""
          : widget.achatProduit[i].getQuantite.toString();
    }
    return Container(
      height: 350,
      child: ListView.builder(
        itemBuilder: (context, index) {
          if (widget.achatProduit.length > index)
            return Card(
              margin: EdgeInsets.symmetric(vertical: 8, horizontal: 5),
              child: ListTile(
                leading: CircleAvatar(
                  radius: 30,
                  child: Padding(
                      padding: EdgeInsets.all(5),
                      child: FittedBox(
                          child: Text(
                              '${((widget.achatProduit[index].produit?.getPrix)! / 1000).toStringAsFixed(2)}K'))),
                ),
                title: Text(
                  '${widget.achatProduit[index].produit?.getNom}',
                  style: Theme.of(context).textTheme.bodyText1,
                ),
                subtitle: Row(
                  children: [
                    TextField(
                      controller: controller[index],
                    ),
                    IconButton(
                        onPressed: () {
                          widget.achatProduit
                              .remove(widget.achatProduit[index]);
                        },
                        icon: Icon(Icons.delete))
                  ],
                ),
              ),
            );
          else
            return IconButton(onPressed: (){
              
            }, icon: Icon(Icons.shopping_bag));
        },
        itemCount: widget.achatProduit.length + 1,
      ),
    );
  }
}
