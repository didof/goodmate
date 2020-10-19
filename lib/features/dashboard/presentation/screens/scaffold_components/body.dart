import 'package:flutter/material.dart';
import 'package:flutter_architecture_scaffold/core/providers/authenticated_user.dart';
import 'package:flutter_architecture_scaffold/core/utils/bloc_dispatchers.dart';
import 'package:flutter_architecture_scaffold/core/utils/show_snackbars.dart';
import 'package:flutter_architecture_scaffold/features/dashboard/presentation/bloc/current_user_info_bloc.dart';
import 'package:flutter_architecture_scaffold/features/dashboard/presentation/bloc/current_user_info_widgets.dart';
import 'package:flutter_architecture_scaffold/features/dashboard/presentation/screens/sections/all_features/all_features_screen.dart';
import 'package:flutter_architecture_scaffold/features/dashboard/presentation/screens/sections/first_access/first_access_section.dart';
import 'package:flutter_architecture_scaffold/widgets/Waiting.dart';
import 'package:provider/provider.dart';

class DashboardBody extends StatelessWidget {
  const DashboardBody({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CurrentUserInfoConsumer(
      listener: (context, state) {
        if (state.runtimeType is CloudError) {
          showErrorSnackbarFromCloudErrorState(
            context: context,
            state: state,
          );
        }
      },
      builder: (context, state) {
        switch (state.runtimeType) {
          // ? setup
          case CloudConnectToCloud:
            return _ConnectingToCloud();

          // ? loading
          case CloudWaiting:
            return WaitingMessage(message: (state as CloudWaiting).message);

          // * Success
          case CloudSuccessButFirstAccess:
            return FirstAccessSection();
          case CloudSuccessAndAlreadyTenantIn:
            return AllFeaturesScreen();

          // ! Error
          case CloudError:
          default:
            return _Error();
        }
      },
    );
  }
}

class _ConnectingToCloud extends StatefulWidget {
  const _ConnectingToCloud({Key key}) : super(key: key);

  @override
  __ConnectingToCloudState createState() => __ConnectingToCloudState();
}

class __ConnectingToCloudState extends State<_ConnectingToCloud> {
  @override
  void initState() {
    super.initState();
    Future.delayed(Duration.zero, () {
      final String uid =
          Provider.of<AuthenticatedUser>(context, listen: false).uid;
      if (uid == null || uid.isEmpty) {
        throw UnimplementedError(
            '[DashobardScreen] this should never be thrown');
      }
      dispatchCurrentUserInfoEvent(
        context,
        event: TriggerRetrieveUser(
          id: uid,
          localFirst: true,
        ),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const LinearProgressIndicator(),
          const Expanded(
            child: const Center(
              child: const Text(
                  'Checking if you already participate to some flat.'),
            ),
          ),
        ],
      ),
    );
  }
}

class _Error extends StatelessWidget {
  const _Error({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final String uid =
        Provider.of<AuthenticatedUser>(context, listen: false).uid;
    return Column(
      children: [
        Text('Something went orribly wrong.'),
        FlatButton(
          child: Text(
            'Please, fix this.',
          ),
          onPressed: () => dispatchCurrentUserInfoEvent(
            context,
            event: TriggerRetrieveUser(id: uid),
          ),
        )
      ],
    );
  }
}
