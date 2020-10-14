import 'package:flutter/material.dart';
import 'package:flutter_architecture_scaffold/core/bloc_providers_methods.dart';
import 'package:flutter_architecture_scaffold/features/dashboard/presentation/screens/sections/first_access/create_flat/bloc/create_flat_bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CreateFlat extends StatefulWidget {
  const CreateFlat({Key key}) : super(key: key);

  @override
  _CreateFlatState createState() => _CreateFlatState();
}

class _CreateFlatState extends State<CreateFlat> {
  PageController _pageController;
  TextEditingController _nameController;
  FocusNode _nameFocusNode;

  @override
  void initState() {
    _pageController = PageController(initialPage: 0);
    _nameController = TextEditingController();
    _nameFocusNode = FocusNode();

    super.initState();
  }

  @override
  void dispose() {
    // page controller
    _pageController.dispose();

    // text editing controllers
    _nameController.dispose();

    // focus node
    _nameFocusNode.dispose();
    super.dispose();
  }

  void shiftTo(int index) {
    _pageController.animateToPage(
      index,
      duration: Duration(seconds: 1),
      curve: Curves.easeInOut,
    );
  }

  void requestFocus(FocusNode focusNode) {
    focusNode.requestFocus();
  }

  void doTasks(List<Function> tasks) {
    tasks.forEach((t) => t());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Create a Flat'),
      ),
      body: BlocProvider(
        create: (context) => CreateFlatBloc(),
        child: Builder(
          builder: (context) {
            return BlocListener<CreateFlatBloc, CreateFlatState>(
              listener: (context, state) {
                if (state is CreateFlatPageState) {
                  if (state is CreateFlatFirst)
                    doTasks([
                      () => shiftTo(0),
                      () => requestFocus(_nameFocusNode),
                    ]);
                  if (state is CreateFlatSecond) shiftTo(1);
                  if (state is CreateFlatThird) shiftTo(2);
                }
              },
              child: PageView(
                controller: _pageController,
                scrollDirection: Axis.vertical,
                children: [
                  _FirstStep(
                    nameController: _nameController,
                  ),
                  _SecondStep(),
                  _ThirdStep(),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}

class _FirstStep extends StatelessWidget {
  final TextEditingController nameController;
  const _FirstStep({
    Key key,
    @required this.nameController,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(32.0),
      child: Column(
        children: [
          const Text('Create a Flat'),
          const Text('[Explanation]'),
          TextField(
            decoration: InputDecoration(
              labelText: 'flat name',
              icon: Icon(Icons.home),
            ),
            controller: nameController,
            onEditingComplete: () {
              dispatchCreateFlatEvent(
                context: context,
                event: TriggerNameChoosen(),
              );
            },
          ),
          FlatButton.icon(
            onPressed: null,
            icon: Icon(Icons.home),
            label: Text('Make it happen!'),
          ),
        ],
      ),
    );
  }
}

class _SecondStep extends StatefulWidget {
  const _SecondStep({Key key}) : super(key: key);

  @override
  __SecondStepState createState() => __SecondStepState();
}

class __SecondStepState extends State<_SecondStep> {
  double persons;

  @override
  void initState() {
    persons = 3;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(32.0),
      child: Column(
        children: [
          const Text('2 - How many persons?'),
          Slider(
            value: persons,
            onChanged: (double newPersons) {
              setState(() {
                persons = newPersons;
              });
            },
            onChangeEnd: (value) {
              dispatchCreateFlatEvent(
                context: context,
                event: TriggerPartyLengthChoosen(),
              );
            },
            min: 2,
            max: 10,
            divisions: 8,
            label: '${persons.floor()}',
          ),
        ],
      ),
    );
  }
}

class _ThirdStep extends StatelessWidget {
  const _ThirdStep({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(32.0),
      child: Column(
        children: [
          const Text('3'),
          const Text('[Explanation]'),
        ],
      ),
    );
  }
}
