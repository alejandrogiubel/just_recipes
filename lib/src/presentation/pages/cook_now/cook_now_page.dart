import 'package:flutter/material.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:just_recipes/src/presentation/widgets/neumorphic_container.dart';
import 'package:just_recipes/src/presentation/widgets/neumorphic_primary_button.dart';
import 'package:neon_circular_timer/neon_circular_timer.dart';

class CookNowPage extends StatefulWidget {
  const CookNowPage({super.key});

  @override
  State<CookNowPage> createState() => _CookNowPageState();
}

class _CookNowPageState extends State<CookNowPage> {
  final timerController = CountDownController();
  bool initialPlay = true;
  bool isPlaying = false;
  Duration initialDuration = Duration.zero;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Cook time'),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 20, horizontal: 10),
                child: NeumorphicContainer(
                  child: Padding(
                    padding: const EdgeInsets.all(10),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: const [
                        Text('Tip of the day'),
                        SizedBox(height: 10),
                        Text('You can use Goldfish to make an ice cream cone.'),
                        Text(
                            'Chef, activist, and Studio ATAO-founder Jenny Dorsey made Banana-Rum Ice Cream in Cheddar-Cracker Cones, and our lives will never be the same.'),
                      ],
                    ),
                  ),
                ),
              ),
              GestureDetector(
                onTap: () {
                  if (!isPlaying && initialDuration.inMinutes < 59) {
                    if (initialDuration.inMinutes == 55) {
                      setState(() {
                        initialDuration += const Duration(minutes: 4);
                        timerController
                          ..restart(duration: initialDuration.inSeconds)
                          ..pause();
                      });
                    } else {
                      setState(() {
                        initialDuration += const Duration(minutes: 5);
                        timerController
                          ..restart(duration: initialDuration.inSeconds)
                          ..pause();
                      });
                    }
                  } else if (!isPlaying) {
                    setState(() {
                      initialDuration = Duration.zero;
                      timerController
                        ..restart(duration: initialDuration.inSeconds)
                        ..pause();
                    });
                  }
                },
                child: NeonCircularTimer(
                  width: 200,
                  duration: initialDuration.inSeconds,
                  backgroudColor: Theme.of(context).scaffoldBackgroundColor,
                  outerStrokeColor:
                      Theme.of(context).brightness == Brightness.dark
                          ? Theme.of(context).primaryColor.withOpacity(0.1)
                          : Colors.white,
                  controller: timerController,
                  isReverse: true,
                  autoStart: false,
                  innerFillGradient: LinearGradient(
                    colors: [
                      Theme.of(context).primaryColor.withOpacity(0.5),
                      Theme.of(context).primaryColor,
                    ],
                  ),
                  neonGradient: LinearGradient(
                    colors: [
                      Theme.of(context).primaryColor.withOpacity(0.5),
                      Theme.of(context).primaryColor,
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 40),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  NeumorphicPrimaryButton(
                    onPress: initialDuration != Duration.zero
                        ? () {
                            if (initialPlay) {
                              timerController.start();
                            } else {
                              timerController.resume();
                            }
                            isPlaying = true;
                            initialPlay = false;
                          }
                        : null,
                    icon: FontAwesomeIcons.play,
                  ),
                  NeumorphicPrimaryButton(
                    onPress: initialDuration != Duration.zero
                        ? () {
                            timerController.pause();
                            isPlaying = false;
                          }
                        : null,
                    icon: FontAwesomeIcons.pause,
                  ),
                  NeumorphicPrimaryButton(
                    onPress: initialDuration != Duration.zero
                        ? () {
                            timerController.restart();
                            isPlaying = true;
                          }
                        : null,
                    icon: FontAwesomeIcons.repeat,
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
