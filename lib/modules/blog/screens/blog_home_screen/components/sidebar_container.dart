import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:new_flutter_assignment/providers/const_provider.dart';

class SidebarContainer extends HookWidget {
  final String title;
  final Widget child;
  const SidebarContainer({
    Key? key,
    required this.title,
    required this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final constants = useProvider(constantsProvider);
    return Container(
      padding: EdgeInsets.all(constants.kDefaultPadding),
      width: double.infinity,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.all(
          Radius.circular(constants.kDefaultPadding / 4),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: TextStyle(
              color: constants.kDarkBlackColor,
              fontWeight: FontWeight.w600,
            ),
          ),
          SizedBox(height: constants.kDefaultPadding / 2), //10
          child,
        ],
      ),
    );
  }
}
