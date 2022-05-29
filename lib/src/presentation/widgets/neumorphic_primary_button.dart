import 'package:flutter_neumorphic/flutter_neumorphic.dart';

class NeumorphicPrimaryButton extends StatelessWidget {
  const NeumorphicPrimaryButton({
    this.onPress,
    required this.icon,
    super.key,
  });
  final Function()? onPress;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return NeumorphicButton(
      onPressed: onPress,
      style: NeumorphicStyle(
        shape: NeumorphicShape.concave,
        depth: 5,
        shadowLightColor: Theme.of(context).brightness == Brightness.light
            ? null
            : const Color(0xff413E43),
        shadowDarkColor: Theme.of(context).brightness == Brightness.light
            ? null
            : Colors.black,
        color: Theme.of(context).primaryColor.withOpacity(0.1),
      ),
      child: NeumorphicIcon(
        icon,
        style: NeumorphicStyle(
          disableDepth: Theme.of(context).brightness != Brightness.light,
          color: Theme.of(context).primaryColor,
        ),
      ),
    );
  }
}
