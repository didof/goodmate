import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:flutter_architecture_scaffold/features/dashboard/presentation/screens/sections/first_access/create_flat/provider/entities.dart';

class BadgeIcon extends StatelessWidget {
  final Either<InvalidField, PartyLengthType> value;
  final ThemeData theme;
  final double hideBadgeAt;
  final IconData icon;
  BadgeIcon(
    this.value, {
    @required this.theme,
    this.hideBadgeAt = 2,
    this.icon = Icons.people_outline,
  });

  @override
  Widget build(BuildContext context) {
    return value.fold((l) {
      return const Icon(Icons.error_outline);
    }, (r) {
      return LayoutBuilder(
        builder: (context, constraints) {
          return Stack(
            children: [
              CircleAvatar(
                backgroundColor: theme.primaryColor,
                child: Icon(
                  icon,
                  color: theme.accentColor,
                ),
              ),
              if (r.value > hideBadgeAt)
                Positioned(
                  top: 0,
                  right: 0,
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15.0),
                      color: theme.accentColor,
                    ),
                    width: constraints.maxWidth / 2,
                    height: constraints.maxHeight / 2,
                    child: Text(
                      r.value.round().toString(),
                      style: TextStyle(color: Colors.black),
                      textAlign: TextAlign.center,
                    ),
                  ),
                )
            ],
          );
        },
      );
    });
  }
}
