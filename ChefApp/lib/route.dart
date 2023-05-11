//loggedOut
//loggedIn

import 'package:chefapp/features/auth/screens/login_screen.dart';
import 'package:flutter/material.dart';
import 'package:routemaster/routemaster.dart';
import 'package:chefapp/features/home/screen/homescreen.dart';
import 'package:chefapp/features/sugestoes/sugestoes.dart';
import 'package:chefapp/features/sugestoes/visualizar_sugestoes.dart';
import 'package:chefapp/features/refeicoes/refeicoes_screen.dart';
import 'package:chefapp/features/categorias/categorias.dart';
import 'package:chefapp/features/chefs/chefs.dart';




final loggedOutRoute = RouteMap(routes: {
  '/': (_) => const MaterialPage(child: LoginScreen()),
});

final loggedInRoute = RouteMap(routes: {
  '/': (_) => const MaterialPage(child: HomeScreen()),
  '/sugestoes': (_) => const MaterialPage(child: Sugestao()),
  '/visualizar_sugestoes': (_) =>
      const MaterialPage(child: VisualizarSugestao()),
  '/refeicoes': (_) =>
      const MaterialPage(child: Refeicoes()),
  '/categorias': (_) =>
      const MaterialPage(child: Categorias()),
  '/chefs': (_) =>
      const MaterialPage(child: Chefs()),
});
