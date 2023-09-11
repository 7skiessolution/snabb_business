import 'package:flutter/material.dart';
import 'package:snabb_business/screen/debit/add_debit_credit.dart';
import 'package:snabb_business/utils/color.dart';

class DebitfloatingButton extends StatefulWidget {
  const DebitfloatingButton({
    super.key,
  });

  @override
  // ignore: library_private_types_in_public_api
  _DebitfloatingButtonState createState() => _DebitfloatingButtonState();
}

class _DebitfloatingButtonState extends State<DebitfloatingButton>
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
                      builder: (context) =>
                          AddCreditDebitScreen(balanceType: "Debit"),
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
                    builder: (context) =>
                        AddCreditDebitScreen(balanceType: "Credit"),
                  ));
            },
            heroTag: null,
            backgroundColor: Colors.green,
            child: const Icon(Icons.add),
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
