import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:new_flutter_assignment/providers/const_provider.dart';

class CustomIconButton extends HookWidget {
  final IconData icon;
  CustomIconButton({Key? key, required this.icon}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _constants = useProvider(constantsProvider);
    return IconButton(
      icon: FaIcon(
        icon,
        size: _constants.kDefaultPadding,
      ),
      onPressed: () {},
    );
  }
}
