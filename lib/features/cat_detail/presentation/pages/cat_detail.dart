part of com.pragmatest.app.catdetail.presentation.pages;

class CatDetail extends StatefulWidget {
  const CatDetail({super.key});

  @override
  State<CatDetail> createState() => _CatDetailState();
}

class _CatDetailState extends State<CatDetail> {
  @override
  Widget build(BuildContext context) => Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          title: Text('name_race'.tr),
          leading: IconButton(
            onPressed: Get.back,
            icon: const Icon(
              Icons.arrow_back_ios,
            ),
          ),
          surfaceTintColor: Colors.white,
        ),
        body: Column(
          children: <Widget>[
            Text('espacio para la imagen'),
            SingleChildScrollView(
              child: Column(
                children: [
                  Text('descripción de la raza'),
                ],
              ),
            )
          ],
        ),
      );
}
