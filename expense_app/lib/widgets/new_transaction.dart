import 'package:expense_app/models/achat_produit.dart';
import 'package:flutter/material.dart';

class NewTransaction extends StatefulWidget {
  //const New_transaction({Key? key}) : super(key: key);
  final void Function(String, double) addNew;
  final List<AchatProduit> achatProduit;

  NewTransaction({required this.addNew,required this.achatProduit});

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
    return Container(
      height: 100,
      child: Text(widget.achatProduit[0].id.toString())
    );
  }
}
