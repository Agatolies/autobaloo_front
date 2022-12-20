import 'package:autobaloo/views/pages/account_page.dart';
import 'package:autobaloo/views/pages/admin_page.dart';
import 'package:autobaloo/views/pages/car_detail_page.dart';
import 'package:autobaloo/views/pages/catalog_page.dart';
import 'package:autobaloo/views/pages/created_account_page.dart';
import 'package:autobaloo/views/pages/error_screen_page.dart';
import 'package:autobaloo/views/pages/home_page.dart';
import 'package:autobaloo/views/pages/login_page.dart';
import 'package:autobaloo/views/pages/order_confirmation_page.dart';
import 'package:autobaloo/views/pages/order_page.dart';
import 'package:autobaloo/views/pages/register_page.dart';
import 'package:autobaloo/views/pages/rent_cancellation_page.dart';
import 'package:autobaloo/views/pages/rent_confirmation_page.dart';
import 'package:autobaloo/views/pages/rent_page.dart';
import 'package:autobaloo/views/pages/road_test_cancellation_page.dart';
import 'package:autobaloo/views/pages/road_test_confirmation_page.dart';
import 'package:autobaloo/views/pages/road_test_page.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class AutoBalooRouter {
  AutoBalooRouter();

  late final router = GoRouter(
    debugLogDiagnostics: true,
    initialLocation: '/',
    routes: [
      GoRoute(
          name: 'home',
          path: '/',
          pageBuilder: (context, state) {
            return MaterialPage<void>(
                key: state.pageKey, child: const HomePage());
          },
          routes: [
            GoRoute(
              name: 'login',
              path: 'login',
              pageBuilder: (context, state) {
                return MaterialPage<void>(
                    key: state.pageKey, child: const LoginPage());
              },
            ),
            GoRoute(
              name: 'register',
              path: 'register',
              pageBuilder: (context, state) {
                return MaterialPage<void>(
                    key: state.pageKey, child: const RegisterPage());
              },
            ),
            GoRoute(
              name: 'catalog',
              path: 'catalog',
              pageBuilder: (context, state) {
                return MaterialPage<void>(
                    key: state.pageKey, child: CatalogPage());
              },
            ),
            GoRoute(
              name: 'car-detail',
              path: 'car-detail/:id',
              pageBuilder: (context, state) {
                return MaterialPage<void>(
                    key: state.pageKey,
                    child: CarDetailPage(id: state.params['id']!));
              },
            ),
            GoRoute(
              name: 'created-account',
              path: 'created-account',
              pageBuilder: (context, state) {
                return MaterialPage<void>(
                    key: state.pageKey, child: const CreatedAccountPage());
              },
            ),
            GoRoute(
              name: 'reset-password',
              path: 'reset-password',
              pageBuilder: (context, state) {
                return MaterialPage<void>(
                    key: state.pageKey, child: const ErrorScreenPage());
              },
            ),
            GoRoute(
              name: 'rent',
              path: 'rent',
              pageBuilder: (context, state) {
                return MaterialPage<void>(
                    key: state.pageKey, child: const RentPage());
              },
            ),
            GoRoute(
              name: 'order',
              path: 'order',
              pageBuilder: (context, state) {
                return MaterialPage<void>(
                    key: state.pageKey, child: const OrderPage());
              },
            ),
            GoRoute(
              name: 'account',
              path: 'account',
              pageBuilder: (context, state) {
                return MaterialPage<void>(
                    key: state.pageKey, child: const AccountPage());
              },
            ),
            GoRoute(
              name: 'admin',
              path: 'admin',
              pageBuilder: (context, state) {
                return MaterialPage<void>(
                    key: state.pageKey, child: const AdminPage());
              },
            ),
            GoRoute(
              name: 'error-screen',
              path: 'error-screen',
              pageBuilder: (context, state) {
                return MaterialPage<void>(
                    key: state.pageKey, child: const ErrorScreenPage());
              },
            ),
            GoRoute(
              name: 'order-confirmation',
              path: 'order-confirmation',
              pageBuilder: (context, state) {
                return MaterialPage<void>(
                    key: state.pageKey, child: const OrderConfirmationPage());
              },
            ),
            GoRoute(
              name: 'rent-cancellation',
              path: 'rent-cancellation',
              pageBuilder: (context, state) {
                return MaterialPage<void>(
                    key: state.pageKey, child: const RentCancellationPage());
              },
            ),
            GoRoute(
              name: 'rent-confirmation',
              path: 'rent-confirmation',
              pageBuilder: (context, state) {
                return MaterialPage<void>(
                    key: state.pageKey, child: const RentConfirmationPage());
              },
            ),
            GoRoute(
              name: 'road-test-cancellation',
              path: 'road-test-cancellation',
              pageBuilder: (context, state) {
                return MaterialPage<void>(
                    key: state.pageKey, child: const RoadTestCancellationPage());
              },
            ),
            GoRoute(
              name: 'road-test-confirmation',
              path: 'road-test-confirmation',
              pageBuilder: (context, state) {
                return MaterialPage<void>(
                    key: state.pageKey, child: const RoadTestConfirmationPage());
              },
            ),
            GoRoute(
              name: 'road-test',
              path: 'road-test',
              pageBuilder: (context, state) {
                return MaterialPage<void>(
                    key: state.pageKey, child: const RoadTestPage());
              },
            ),
          ]),
    ],
    errorBuilder: (context, state) => ErrorScreenPage(error: state.error),
  );
}
