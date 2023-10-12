import 'package:flutter/material.dart';
import 'package:snabb_business/screen/expense/expense.dart';
import 'package:snabb_business/screen/purchase/purchase.dart';
import 'package:snabb_business/screen/sale/Sale.dart';
import 'package:snabb_business/utils/color.dart';

Widget float1() {
  return ClipOval(
    child: Container(
      height: 62,
      width: 62,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        border: Border.all(
            color: backgroundColor!, width: 8), // Customize border color
      ),
      child: FloatingActionButton(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(50)),
        onPressed: () {},

        tooltip: 'First button',
        backgroundColor: Colors.red,
        child: Image.asset("images/minus.png"), // Change background color
      ),
    ),
  );
}

Widget float2() {
  return ClipOval(
    child: Container(
      height: 62,
      width: 62,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        border: Border.all(
            color: backgroundColor!, width: 8), // Customize border color
      ),
      child: FloatingActionButton(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(50)),
        onPressed: () {
          // Perform action for float1 button
          print('Float 1 Pressed');
        },

        tooltip: 'First button',
        backgroundColor: Colors.red,
        child: Icon(
          Icons.add,
          color: white,
          size: 30,
        ), // Change background color
      ),
    ),
  );
}

class ExpandableFloatingActionButton extends StatefulWidget {
  const ExpandableFloatingActionButton({
    super.key,
  });

  @override
  _ExpandableFloatingActionButtonState createState() =>
      _ExpandableFloatingActionButtonState();
}

class _ExpandableFloatingActionButtonState
    extends State<ExpandableFloatingActionButton>
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
                      builder: (context) => const SaleScreen(),
                    ));
              },
              heroTag: "saleTag",
              backgroundColor: greencolor,
              child: const Icon(Icons.add),
            ),
        if (_isExpanded) const SizedBox(height: 5),
        if (_isExpanded)
          FloatingActionButton(
            onPressed: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const ExpenseScreen(),
                  ));
            },
            heroTag: "expenseTag",
            backgroundColor: expensecolor,
            child: const ImageIcon(AssetImage("images/minus.png")),
          ),
        if (_isExpanded) const SizedBox(height: 10),
        if (_isExpanded)
          FloatingActionButton(
            onPressed: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const Purchasescreen(),
                  ));
            },
            heroTag: "purchaseTag",
            backgroundColor: blue,
            child: const ImageIcon(AssetImage("images/minus.png")),
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
                backgroundColor: gold,
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
