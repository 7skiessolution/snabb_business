// ignore_for_file: library_private_types_in_public_api

import 'package:flutter/material.dart';
import 'package:snabb_business/screen/schedule_transaction/add_Schedule_income.dart';
import 'package:snabb_business/utils/color.dart';

class ScheduleFB extends StatefulWidget {
  final num balance;
  final num snabbWallet;
  const ScheduleFB(
      {super.key, required this.balance, required this.snabbWallet});

  @override
  _ScheduleFBState createState() => _ScheduleFBState();
}

class _ScheduleFBState extends State<ScheduleFB>
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
      mainAxisAlignment: MainAxisAlignment.end,
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        if (_isExpanded)
          FloatingActionButton(
            heroTag: "Sincome",
            onPressed: () {
              Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => ScheduleIncome(income: false),
              ));
            },
            backgroundColor: Colors.red,
            child: const ImageIcon(AssetImage("assets/images/minus.png")),
          ),
        if (_isExpanded) const SizedBox(height: 16),
        if (_isExpanded)
          FloatingActionButton(
            heroTag: "SExpanse",
            onPressed: () {
              Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => ScheduleIncome(income: true),
              ));
            },
            backgroundColor: Colors.green,
            child: const Icon(Icons.add),
          ),
        const SizedBox(height: 16),
        Padding(
          padding: const EdgeInsets.only(bottom: 40),
          child: SizedBox(
              height: 60,
              width: 60,
              child: FittedBox(
                  child: FloatingActionButton(
                backgroundColor: darkblue,
                onPressed: _toggleExpanded,
                // shape: RoundedRectangleBorder(
                //   borderRadius: BorderRadius.circular(40.0),
                // ),

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
