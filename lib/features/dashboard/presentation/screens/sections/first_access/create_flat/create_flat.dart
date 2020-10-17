import 'package:flutter/material.dart';
import 'package:flutter_architecture_scaffold/core/utils/bloc_dispatchers.dart';
import 'package:flutter_architecture_scaffold/core/utils/focus_nodes_methods.dart';
import 'package:flutter_architecture_scaffold/features/dashboard/presentation/screens/sections/first_access/create_flat/bloc/create_flat_bloc.dart';
import 'package:flutter_architecture_scaffold/features/dashboard/presentation/screens/sections/first_access/create_flat/bloc/create_flat_bloc_widgets.dart';
import 'package:flutter_architecture_scaffold/features/dashboard/presentation/screens/sections/first_access/create_flat/steps/first_step.dart';
import 'package:flutter_architecture_scaffold/features/dashboard/presentation/screens/sections/first_access/create_flat/steps/second_step.dart';
import 'package:flutter_architecture_scaffold/features/dashboard/presentation/screens/sections/first_access/create_flat/steps/third_step.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:flutter_architecture_scaffold/core/utils/extensions.dart';

enum FocusOn {
  None,
  Name,
  PartyLength,
}

enum Enabled {
  None,
  Name,
  PartyLength,
}

enum Step {
  None,
  First,
  Second,
  Third,
}

class CreateFlat extends StatefulWidget {
  const CreateFlat({Key key}) : super(key: key);

  @override
  _CreateFlatState createState() => _CreateFlatState();
}

class _CreateFlatState extends State<CreateFlat> {
  // page controller
  PageController _pageController;

  // text editing controllers
  TextEditingController _nameController;

  Map<String, FocusNode> focusNodes;

  @override
  void initState() {
    _pageController = PageController(initialPage: 0);

    // text editing controllers
    _nameController = TextEditingController();

    focusNodes = buildMapOfFocusNodes(['name', 'partyLength']);
    super.initState();
  }

  @override
  void dispose() {
    _pageController.dispose();

    _nameController.dispose();

    focusNodes.forEach((_, node) => node.dispose());
    super.dispose();
  }

  final PreferredSizeWidget appBar = AppBar(
    title: const Text('Create a Flat'),
  );

  /// at this moment, this function will be called only for [CreateFlatPageState]
  void execTask(CreateFlatPageState state) {
    switch (state.runtimeType) {
      case CreateFlatFirst:
        print('received [CreateFlatFirst]{confirm:${state.runtimeType}}');
        switch (state.focusOn) {
          case FocusOn.Name:
            print('with [FocusOn.Name]{confirm:${state.focusOn}}');
            [
              () => allLooseFocus(focusNodes),
              () => requestFocus(focusNodes['name']),
            ].execAll();
            break;
          case FocusOn.PartyLength:
            print('with [FocusOn.PartyLength]{confirm:${state.focusOn}}');
            [
              () => allLooseFocus(focusNodes),
              () => requestFocus(focusNodes['partyLength']),
            ].execAll();
            break;
          case FocusOn.None:
          default:
            print('with [FocusOn.None]{confirm:${state.focusOn}}');
        }
        break;
    }
    if (state.closeSoftKeyboard) FocusScope.of(context).unfocus();
    if (state.requestFocus) _shiftTo(state.fabDestinationStep, _pageController);
  }

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    return CreateFlatBlocPack(
      listener: (context, state) {
        if (state is CreateFlatPageState) execTask(state);
      },
      child: Scaffold(
        appBar: appBar,
        body: PageView(
          controller: _pageController,
          scrollDirection: Axis.vertical,
          children: [
            FirstStep(
              appBarHeight: appBar.preferredSize.height,
              nameController: _nameController,
              partyLengthFocusNode: focusNodes['partyLength'],
            ),
            SecondStep(),
            ThirdStep(),
          ],
        ),
        floatingActionButton: CreateFlatBuilder(
          builder: (context, state) {
            if (state.fabDestinationStep == Step.None)
              return Container(width: 0, height: 0);
            return FloatingActionButton(
              child: const Icon(Icons.keyboard_arrow_down),
              backgroundColor: theme.accentColor,
              splashColor: theme.primaryColor,
              onPressed: () {
                dispatchCreateFlatEvent(
                  context: context,
                  event: TriggerShiftToStep(state.fabDestinationStep),
                );
              },
            );
          },
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      ),
    );
  }
}

void _shiftTo(Step step, PageController pageController) {
  int index;
  switch (step) {
    case Step.First:
      index = 0;
      break;
    case Step.Second:
      index = 1;
      break;
    case Step.Third:
      index = 2;
      break;
    case Step.None:
    default:
      return;
  }

  pageController.animateToPage(
    index,
    duration: Duration(seconds: 1),
    curve: Curves.easeInOut,
  );
}
