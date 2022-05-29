import 'package:flutter_neumorphic/flutter_neumorphic.dart';

class PrimarySwitch extends StatefulWidget {
  const PrimarySwitch({
    this.onChanged,
    required this.initValue,
    super.key,
  });
  final ValueChanged<bool>? onChanged;
  final bool initValue;

  @override
  State<PrimarySwitch> createState() => _PrimarySwitchState();
}

class _PrimarySwitchState extends State<PrimarySwitch> {
  bool active = false;

  @override
  void initState() {
    super.initState();
    active = widget.initValue;
  }

  @override
  Widget build(BuildContext context) {
    return NeumorphicSwitch(
      height: 25,
      style: NeumorphicSwitchStyle(
        activeThumbColor: Theme.of(context).primaryColor,
        activeTrackColor: Theme.of(context).primaryColor.withOpacity(0.2),
      ),
      onChanged: (bool value) {
        widget.onChanged?.call(value);
        setState(() {
          active = value;
        });
      },
      value: active,
    );
  }
}
