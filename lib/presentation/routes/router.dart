import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:test_delosi_app/presentation/overview/overview_page.dart';

final GoRouter goRouter = GoRouter(
  routes: <RouteBase>[
    GoRoute(
      path: '/',
      builder: (BuildContext context, GoRouterState state) {
        return const OverviewPage();
      },
    ),
  ],
);
