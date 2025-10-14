import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:portfolio/features/aboutme/presentation/aboutme_page.dart';
import 'package:portfolio/features/blog/presentation/blog_page.dart';
import 'package:portfolio/features/contactme/presentation/contactMe_page.dart';
import 'package:portfolio/features/project/presentation/project_page.dart';
import 'package:portfolio/features/home/presentation/home_page.dart';

class AppRoutes {
  static const home = '/';
  static const projects = '/projects';
  static const blogs = '/Blogs';
  static const aboutme = '/AboutMe';
  static const contactme = '/ContactMe';
}

class AppRoute {
  static final router = GoRouter(
    routes: [
      GoRoute(
        path: AppRoutes.home,
        pageBuilder: (context, state) => NoTransitionPage(child: HomePage()),
      ), // GoRoute
      GoRoute(
        path: AppRoutes.projects,
        pageBuilder: (context, state) => NoTransitionPage(child: ProjectPage()),
      ), // GoRoute
      GoRoute(
        path: AppRoutes.blogs,
        pageBuilder: (context, state) => NoTransitionPage(child: BlogPage()),
      ), // GoRoute
      GoRoute(
        path: AppRoutes.aboutme,
        pageBuilder: (context, state) => NoTransitionPage(child: AboutPage()),
      ),
      GoRoute(
        path: AppRoutes.contactme,
        pageBuilder:
            (context, state) => NoTransitionPage(child: ContactmePage()),
      ),

      // GoRoute
    ],
  ); // GoRouter
}
