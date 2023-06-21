import 'package:chefapp/core/common/loader.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:chefapp/features/sugestoes/controller_sugestoes/controller_sugestoes.dart';
import 'package:routemaster/routemaster.dart';

class Sugestao extends ConsumerStatefulWidget {
  const Sugestao({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _SugestaoState();
}

class _SugestaoState extends ConsumerState<Sugestao> {
  String _suggestion = "";
  void _submitSuggestion() {
    createSugestao();
    setState(() {
      _suggestion = "";
    });
   Routemaster.of(context).pop;
  // print('peq');
   //print(pop);
  }

  void createSugestao() {
    ref
        .read(sugestaoControllerProvider.notifier)
        .createSugestao(_suggestion, context);
  }

  @override
  Widget build(BuildContext context) {
    final isLoading = ref.watch(sugestaoControllerProvider);
    return Scaffold(
      appBar: AppBar(title: const Text('Sugestões')),
      //drawer: const Drawwer(),
      body: isLoading
          ? const Loader()
          : Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  const Text(
                    "Tem alguma sugestão para melhorar o aplicativo? Conte-nos abaixo!",
                    style: TextStyle(fontSize: 20),
                  ),
                  const SizedBox(height: 16.0),
                  TextField(
                    maxLines: 5,
                    decoration: const InputDecoration(
                      hintText: "Digite aqui a sua sugestão",
                      border: OutlineInputBorder(),
                    ),
                    onChanged: (value) {
                      setState(() {
                        _suggestion = value;
                      });
                    },
                  ),
                  const SizedBox(height: 16.0),
                  ElevatedButton(
                    onPressed: _suggestion.isEmpty ? null : _submitSuggestion ,
                    child: const Text("Enviar sugestão"),
                  ),
                  ElevatedButton(
                    child: const Text("Visualizar Sugestões"),
                    onPressed: () {
                      Routemaster.of(context).push('/visualizar_sugestoes');
                    },
                  ),
                ],
              ),
            ),
    );
  }
}
