import 'package:flutter/material.dart';
import 'package:snabb_business/screen/transaction_schedule/add_expesnse_schedule.dart';
import 'package:snabb_business/screen/transaction_schedule/add_purchase_schedule.dart';
import 'package:snabb_business/screen/transaction_schedule/add_sale-schedule.dart';
import 'package:snabb_business/utils/color.dart';

import '../screen/debit/AddCredit.dart';
import '../screen/debit/AddDebit.dart';

class TransactionSechduleButton extends StatefulWidget {
  const TransactionSechduleButton({
    super.key,
  });

  @override
  // ignore: library_private_types_in_public_api
  _TransactionSechduleButtonState createState() =>
      _TransactionSechduleButtonState();
}

class _TransactionSechduleButtonState extends State<TransactionSechduleButton>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> _animation;

  bool _isExpanded = false;

  @override
  void initState() {
    super.initState();

    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 300),
    );

    _animation = Tween<double>(
      begin: 0,
      end: 1,
    ).animate(_animationController);
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  void _toggleExpanded() {
    setState(() {
      _isExpanded = !_isExpanded;

      if (_isExpanded) {
        _animationController.forward();
      } else {
        _animationController.reverse();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        if (_isExpanded)
          if (_isExpanded)
            FloatingActionButton(
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => AddSaleTransaction(),
                    ));
              },
              heroTag: null,
              backgroundColor: Colors.red,
              child: const ImageIcon(AssetImage("images/minus.png")),
            ),
        if (_isExpanded) const SizedBox(height: 5),
        if (_isExpanded) const SizedBox(height: 10),
        if (_isExpanded)
          FloatingActionButton(
            onPressed: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => AddPurchaseTransaction(),
                  ));
            },
            heroTag: null,
            backgroundColor: Colors.green,
            child: const Icon(Icons.add),
          ),
        if (_isExpanded) const SizedBox(height: 10),
        if (_isExpanded)
          FloatingActionButton(
            onPressed: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => AddExpenseTransaction(),
                  ));
            },
            heroTag: null,
            backgroundColor: Colors.green,
            child: const Icon(Icons.turn_sharp_left_sharp),
          ),
        const SizedBox(height: 10),
        Padding(
          padding: const EdgeInsets.only(bottom: 40),
          child: SizedBox(
              height: 60,
              width: 60,
              child: FittedBox(
                  child: FloatingActionButton(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(40)),
                backgroundColor: red,
                onPressed: _toggleExpanded,
                child: AnimatedIcon(
                  icon: AnimatedIcons.add_event,
                  progress: _animation,
                ),
              ))),
        ),
      ],
    );
  }
}
