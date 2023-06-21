import 'dart:io';
import 'package:chefapp/core/utils.dart';
import 'package:chefapp/core/common/error.dart';
import 'package:chefapp/core/common/loader.dart';
import 'package:chefapp/core/constants/constants.dart';
import 'package:chefapp/features/auth/controleer/auth_controller.dart';
import 'package:chefapp/features/perfil/perfil_controler/perfil_controler.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:dotted_border/dotted_border.dart';

class EditProfileScreen extends ConsumerStatefulWidget {
  final String uid;
  const EditProfileScreen({super.key, required this.uid});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _EditProfileScreenState();
}

class _EditProfileScreenState extends ConsumerState<EditProfileScreen> {
  File? bannerFile;
  File? profileFile;
  late TextEditingController
      nameController; // para aparecer o nome do usuario no text
  late TextEditingController descricaoController;
  @override
  void initState() {
    // ver para que serve isto
    super.initState();
    nameController = TextEditingController(
        text: ref
            .read(userProvider)!
            .name); // para aparecer o nome do usuario no text
    descricaoController =
        TextEditingController(text: ref.read(userProvider)!.descricao);
  }

  @override
  void dispose() {
    // ver para que serve isto
    super.dispose();
    nameController.dispose();
    descricaoController.dispose();
  }

  void selectBannerImage() async {
    final res = await pickImage();
    if (res != null) {
      setState(() {
        bannerFile = File(res.files.first
            .path!); // tirar o caminho do ficheiro e criar um novo ficheiro
      });
    }
  }

  void selectProfileImage() async {
    final res = await pickImage();
    if (res != null) {
      setState(() {
        profileFile = File(res.files.first
            .path!); // tirar o caminho do ficheiro e criar um novo ficheiro
      });
    }
  }

  void save() {
    ref.read(perfilControllerProvider.notifier).editProfile(
        profileFile: profileFile,
        bannerFile: bannerFile,
        context: context,
        name: nameController.text.trim(),
        descricao: descricaoController.text.trim());
  }

  @override
  Widget build(BuildContext context) {
    final isloading = ref.watch(perfilControllerProvider);
    return ref.watch(getUserDataProvider(widget.uid)).when(
          data: (user) => Scaffold(
            appBar: AppBar(
              title: const Text('Editar Perfil'),
              centerTitle: false,
              actions: [
                TextButton(
                  onPressed: save,
                  child: const Text(
                    'Save',
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                ),
              ],
            ),
            body: isloading ? const Loader() : Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(children: [
                SizedBox(
                  // SizedBox pode ser usada para dar mais espaçoes entre widgets ou para definir o tamanho de um certo widget
                  height: 200,
                  child: Stack(
                    // coloca widget denro de widget, o segundo widget é o que fica dentro do outro
                    children: [
                      GestureDetector(
                        onTap: selectBannerImage,
                        child: DottedBorder(
                          radius: const Radius.circular(100),
                          dashPattern: const [
                            10,
                            4
                          ], // faz com que os ricos sejam maiores
                          strokeCap: StrokeCap.round,
                          borderType: BorderType.Rect,
                          child: Container(
                              width: double.infinity,
                              height: 150,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: bannerFile != null
                                  ? Image.file(bannerFile!)
                                  : user.banner.isEmpty ||
                                          user.banner == Constants.bannerDefault
                                      ? // se a imagem for nula que nao é suposto ou se for a iamgem defaul
                                      const Center(
                                          child: Icon(
                                            Icons.camera_alt_outlined,
                                            size: 70,
                                          ),
                                        )
                                      : Image.network(user.banner)),
                        ),
                      ),
                      Positioned(
                        bottom: 20,
                        left: 20,
                        child: GestureDetector(
                          onTap: selectProfileImage,
                          child: profileFile != null
                              ? CircleAvatar(
                                  backgroundImage: FileImage(profileFile!),
                                  radius: 32,
                                )
                              : CircleAvatar(
                                  backgroundImage:
                                      NetworkImage(user.profilePic),
                                  radius: 32,
                                ),
                        ),
                      )
                    ],
                  ),
                ),
                TextField(
                  controller: nameController,
                  decoration: InputDecoration(
                    filled: true,
                    hintText: 'Name',
                    focusedBorder: OutlineInputBorder(
                      borderSide: const BorderSide(color: Colors.blue),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    border: InputBorder.none,
                    contentPadding: const EdgeInsets.all(18),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                TextField(
                  controller: descricaoController,
                  decoration: InputDecoration(
                    filled: true,
                    hintText: 'Descrição',
                    focusedBorder: OutlineInputBorder(
                      borderSide: const BorderSide(color: Colors.blue),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    
                    border: InputBorder.none,
                    contentPadding: const EdgeInsets.all(18),
                  ),
                ),
                
              ]),
            ),
          ),
          loading: () => const Loader(),
          error: (error, stackTrace) => ErrorText(
            error: error.toString(),
          ),
        );
  }
}
