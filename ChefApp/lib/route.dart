import 'package:chefapp/features/auth/screens/login_screen.dart';
import 'package:flutter/material.dart';
import 'package:routemaster/routemaster.dart';
import 'package:chefapp/features/home/screen/homescreen.dart';
import 'package:chefapp/features/sugestoes/screen/sugestoes.dart';
import 'package:chefapp/features/sugestoes/screen/visualizar_sugestoes.dart';
import 'package:chefapp/features/refeicoes/refeicoes.dart';
import 'package:chefapp/features/categorias/categorias.dart';
import 'package:chefapp/features/chefs/chefs.dart';
import 'package:chefapp/features/perfil/screens/perfil_screen.dart';
import 'package:chefapp/features/perfil/screens/perfil_editar.dart';
import 'features/estatisticas/chef_com_mais_seguidores.dart';
import 'features/estatisticas/prato_mais_gostos.dart';
import 'features/perfil/screens/guardados_perfil.dart';
import 'features/perfil/screens/see_aseguir.dart';
import 'features/perfil/screens/see_seguidores.dart';
import 'features/publicacao/publicacao_chefs.dart';
import 'features/publicacao/publicacao_recentes.dart';
import 'features/receita/screen/criar_receita.dart';
import 'features/receita/screen/receita_solo.dart';

final loggedOutRoute = RouteMap(routes: {
  '/': (_) => const MaterialPage(child: LoginScreen()),
});

final loggedInRoute = RouteMap(routes: {
  '/': (_) => const MaterialPage(child: HomeScreen()),
  '/sugestoes': (_) => const MaterialPage(child: Sugestao()),
  '/visualizar_sugestoes': (_) =>
      const MaterialPage(child: VisualizarSugestao()),
  //'/refeicoes': (_) =>   MaterialPage(child: Refeicoes(indexTipo: indexTipo)),
  '/refeicoes/:indexTipo': (routeData) => MaterialPage(
        child: Refeicoes(
          indexTipo: int.parse(routeData.pathParameters['indexTipo']!),
        ),
      ),
  '/categorias/:indexTipo': (routeData) => MaterialPage(
    child: Categorias(
      indexTipo: int.parse(routeData.pathParameters['indexTipo']!),
    ),),
  '/chefs': (_) => const MaterialPage(child: Chefs()),
  '/perfil/:uid': (routeData) => MaterialPage(
          child: UserProfileScreen(
        uid: routeData.pathParameters['uid']!,
      )),
  '/editar-perfil/:uid': (routeData) => MaterialPage(
        child: EditProfileScreen(
          uid: routeData.pathParameters['uid']!,
        ),
      ),
  '/criarreceita': (_) => const MaterialPage(child: Criarreceita()),
  '/receitasolo/:uid/:receita': (routeData) => MaterialPage(
        child: ReceitaSolo(
          uid: routeData.pathParameters['uid']!,
          idreceita: routeData.pathParameters['receita']!,
        ),
      ),
  '/perfilguardar': (_) => const MaterialPage(child: GuardadosPerfil()),
  '/publicacaorecentes': (_) => const MaterialPage(child: PublicaoRecentes()),
  // '/estatisticas': (_) => const MaterialPage(child: Estatisticas()),
  '/pratomaislikes': (_) => const MaterialPage(child: PratoMaisLikes()),
  '/chefmaisseguidores': (_) =>
      const MaterialPage(child: ChefsComMaisSeguidores()),
  '/publicacaoSeguidores': (_) => const MaterialPage(child: PublicaoSeguidores()),
    '/seeSeguidores': (_) => const MaterialPage(child: SeeSeguidores()),
    '/aSeguir': (_) => const MaterialPage(child: ASeguir()),

  });
