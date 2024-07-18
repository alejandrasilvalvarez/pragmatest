part of com.pragmatest.app.dashboardhome.presentation.widgets;

class CatbreedCard extends StatefulWidget {
  const CatbreedCard({
    required this.catbreed,
    required this.country,
    required this.intelligence,
    Key? key,
  }) : super(key: key);

  final String catbreed;
  final String country;
  final String intelligence;

  @override
  State<CatbreedCard> createState() => _CatbreedCardState();
}

class _CatbreedCardState extends State<CatbreedCard> {
  @override
  Widget build(BuildContext context) => Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 20,
          vertical: 6,
        ),
        child: Card(
          color: Colors.white,
          surfaceTintColor: Colors.white,
          elevation: 0.5,
          shape: RoundedRectangleBorder(
            side: const BorderSide(
              color: Color(0xFF5C6B7A),
              width: 1,
            ),
            borderRadius: BorderRadius.circular(10),
          ),
          child: SizedBox(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.width - 48,
            child: Stack(
              children: <Widget>[
                Center(
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: AspectRatio(
                      aspectRatio: 1,
                      child: Image.network(
                        'https://comunidad.retorn.com/wp-content/uploads/2018/09/gatitos.jpg',
                        fit: BoxFit.cover,
                        errorBuilder: (
                          BuildContext context,
                          Object error,
                          StackTrace? stackTrace,
                        ) =>
                            const Text(
                          'Failed to load image',
                        ),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(
                    vertical: 12,
                    horizontal: 16,
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Text(
                            widget.catbreed,
                            style: const TextStyle(
                              fontSize: 16,
                            ),
                          ),
                          GestureDetector(
                            onTap: () {
                             Get.toNamed('detail_page');
                            },
                            child: const Text(
                              'Ver Más',
                              style: TextStyle(
                                fontSize: 16,
                                color: Color(0xFF0081FF),
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Text(
                            widget.country,
                            style: const TextStyle(
                              fontSize: 16,
                            ),
                          ),
                          Text(
                            widget.intelligence,
                            style: const TextStyle(
                              fontSize: 16,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      );
}
