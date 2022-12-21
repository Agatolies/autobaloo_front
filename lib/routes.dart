import 'package:autobaloo/auth_gate.dart';
import 'package:autobaloo/views/components/autobaloo_logo.dart';
import 'package:autobaloo/views/pages/account_page.dart';
import 'package:autobaloo/views/pages/admin_page.dart';
import 'package:autobaloo/views/pages/car_detail_page.dart';
import 'package:autobaloo/views/pages/catalog_page.dart';
import 'package:autobaloo/views/pages/created_account_page.dart';
import 'package:autobaloo/views/pages/error_screen_page.dart';
import 'package:autobaloo/views/pages/home_page.dart';
import 'package:autobaloo/views/pages/order_confirmation_page.dart';
import 'package:autobaloo/views/pages/order_page.dart';
import 'package:autobaloo/views/pages/rent_cancellation_page.dart';
import 'package:autobaloo/views/pages/rent_confirmation_page.dart';
import 'package:autobaloo/views/pages/rent_page.dart';
import 'package:autobaloo/views/pages/road_test_cancellation_page.dart';
import 'package:autobaloo/views/pages/road_test_confirmation_page.dart';
import 'package:autobaloo/views/pages/road_test_page.dart';
import 'package:flutter/material.dart';
import 'package:flutterfire_ui/auth.dart';
import 'package:go_router/go_router.dart';

final GlobalKey<NavigatorState> _rootNavigatorKey =
    GlobalKey<NavigatorState>(debugLabel: 'root');

class AutoBalooRouter {
  AutoBalooRouter();

  late final router = GoRouter(
    navigatorKey: _rootNavigatorKey,
    debugLogDiagnostics: true,
    initialLocation: '/',
    routes: _routes,
    errorBuilder: _errorBuilder,
  );

  final List<RouteBase> _routes = [
    GoRoute(
      name: 'home',
      path: '/',
      pageBuilder: (context, state) {
        return MaterialPage<HomePage>(
            key: state.pageKey, child: const HomePage());
      },
    ),
    GoRoute(
        name: 'catalog',
        path: '/catalog',
        pageBuilder: (context, state) {
          return MaterialPage<CatalogPage>(
              key: state.pageKey, child: CatalogPage());
        },
        routes: [
          GoRoute(
              name: 'car-detail',
              path: 'car-detail/:id',
              pageBuilder: (context, state) {
                final id = state.params['id']!;

                return MaterialPage<CarDetailPage>(
                    key: state.pageKey, child: CarDetailPage(carId: id));
              },
              routes: [
                GoRoute(
                    name: 'rent',
                    path: 'rent',
                    pageBuilder: (context, state) {
                      final String carId = state.params['id']!;

                      return MaterialPage<void>(
                          key: state.pageKey,
                          child: AuthGate(child: RentPage(carId: carId)));
                    },
                    routes: [
                      GoRoute(
                        name: 'rent-cancellation',
                        path: 'cancellation',
                        pageBuilder: (context, state) {
                          return MaterialPage<void>(
                              key: state.pageKey,
                              child: const RentCancellationPage());
                        },
                      ),
                      GoRoute(
                        name: 'rent-confirmation',
                        path: 'confirmation',
                        pageBuilder: (context, state) {
                          return MaterialPage<void>(
                              key: state.pageKey,
                              child: const RentConfirmationPage());
                        },
                      ),
                    ]),
                GoRoute(
                    name: 'order',
                    path: 'order',
                    pageBuilder: (context, state) {
                      final String carId = state.params['id'] ?? '1';

                      return MaterialPage<void>(
                          key: state.pageKey,
                          child: AuthGate(child: OrderPage(carId: carId)));
                    },
                    routes: [
                      GoRoute(
                        name: 'order-confirmation',
                        path: 'order-confirmation',
                        pageBuilder: (context, state) {
                          return MaterialPage<OrderConfirmationPage>(
                              key: state.pageKey,
                              child: const OrderConfirmationPage());
                        },
                      ),
                    ]),
              ])
        ]),
    GoRoute(
      name: 'profile',
      path: '/profile',
      pageBuilder: (context, state) {
        return MaterialPage<ProfileScreen>(
            child: AuthGate(
          child: ProfileScreen(
              appBar: AppBar(
                elevation: 0,
                title: const AutoBalooLogo(),
                backgroundColor: Colors.teal.shade300,
              ),
              actions: [
                SignedOutAction((context) {
                  Navigator.of(context).pop();
                }),
              ],
              children: [
                const Divider(),
                Padding(
                  padding: const EdgeInsets.all(2),
                  child: Container(
                    constraints: const BoxConstraints(maxWidth: 400),
                    child: AspectRatio(
                      aspectRatio: 1,
                      child: Image.asset('images/ab-ambiant1.png'),
                    ),
                  ),
                ),
              ]),
        ));
      },
    ),
    GoRoute(
        name: 'account',
        path: '/account',
        pageBuilder: (context, state) {
          return MaterialPage<AccountPage>(
              key: state.pageKey, child: const AccountPage());
        },
        routes: [
          GoRoute(
            name: 'created-account',
            path: 'created-account',
            pageBuilder: (context, state) {
              return MaterialPage<CreatedAccountPage>(
                  key: state.pageKey, child: const CreatedAccountPage());
            },
          ),
        ]),
    GoRoute(
      name: 'admin',
      path: '/admin',
      pageBuilder: (context, state) {
        return MaterialPage<AdminPage>(
            key: state.pageKey, child: const AdminPage());
      },
    ),
    GoRoute(
      name: 'error-screen',
      path: '/error-screen',
      pageBuilder: (context, state) {
        return MaterialPage<ErrorScreenPage>(
            key: state.pageKey, child: const ErrorScreenPage());
      },
    ),
    GoRoute(
        name: 'road-test',
        path: '/road-test',
        pageBuilder: (context, state) {
          return MaterialPage<RoadTestPage>(
              key: state.pageKey, child: const RoadTestPage());
        },
        routes: [
          GoRoute(
            name: 'road-test-cancellation',
            path: 'cancellation',
            pageBuilder: (context, state) {
              return MaterialPage<RoadTestCancellationPage>(
                  key: state.pageKey, child: const RoadTestCancellationPage());
            },
          ),
          GoRoute(
            name: 'road-test-confirmation',
            path: 'confirmation',
            pageBuilder: (context, state) {
              return MaterialPage<RoadTestConfirmationPage>(
                  key: state.pageKey, child: const RoadTestConfirmationPage());
            },
          ),
        ]),
  ];

  Widget _errorBuilder(context, state) =>
      ErrorScreenPage(key: state.pageKey, error: state.error);
}
