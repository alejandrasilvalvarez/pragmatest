part of com.pragmatest.app.catdetail.presentation.pages;

class CatDetail extends StatefulWidget {
  const CatDetail({super.key});

  @override
  State<CatDetail> createState() => _CatDetailState();
}

class _CatDetailState extends State<CatDetail> {
  late CatModel cat;
  @override
  void initState() {
    cat = Get.arguments;
    super.initState();
  }

  @override
  Widget build(BuildContext context) => Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          leading: IconButton(
            onPressed: Get.back,
            icon: const Icon(
              Icons.arrow_back_ios,
            ),
          ),
          surfaceTintColor: Colors.white,
          backgroundColor: Colors.white,
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 16,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                cat.name ?? '',
                style: const TextStyle(
                  fontSize: 32,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(
                height: 8,
              ),
              Text(
                cat.origin ?? '',
                style: const TextStyle(
                  fontSize: 24,
                ),
              ),
              const SizedBox(
                height: 12,
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height / 3,
                child: Center(
                  child: CachedNetworkImage(
                    imageUrl:
                        'https://cdn2.thecatapi.com/images/${cat.referenceImageId}.jpg',
                    placeholder: (BuildContext context, String url) =>
                        const Center(
                      child: CircularProgressIndicator(),
                    ),
                    errorWidget:
                        (BuildContext context, String url, Object error) =>
                            Column(
                      children: <Widget>[
                        WarningMessage(
                          message: 'error_loading_image'.tr,
                          isError: false,
                        ),
                      ],
                    ),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              const SizedBox(
                height: 12,
              ),
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      const SizedBox(
                        height: 12,
                      ),
                      Text(
                        cat.description ?? '',
                      ),
                      const SizedBox(
                        height: 12,
                      ),
                      HabilityCard(
                        hability: 'intelligence'.tr,
                        habilityDesc: 'intelectual_level'.tr,
                        level: (cat.intelligence ?? 0) > 3
                            ? 1
                            : (cat.intelligence ?? 0) < 3
                                ? 3
                                : 2,
                        value: '${cat.intelligence}',
                        onTap: () async {
                          await showDialog(
                            context: context,
                            builder: (BuildContext ctx) {
                              Future<void>.delayed(const Duration(seconds: 4),
                                  () {
                                Navigator.of(ctx).pop(true);
                              });

                              return AlertDialog(
                                content: SizedBox(
                                  
                                  child: Image.asset(
                                    (cat.intelligence ?? 0) > 3
                                        ? 'assets/images/genius_cat.gif'
                                        : 'assets/images/low_intelligence.gif',
                                    height: 200,
                                    
                                  ),
                                ),
                              );
                            },
                          );
                        },
                      ),
                      const SizedBox(
                        height: 12,
                      ),
                      HabilityCard(
                        hability: 'affection_level'.tr,
                        habilityDesc: 'affection_level_desc'.tr,
                        level: (cat.affectionLevel ?? 0) > 3
                            ? 1
                            : (cat.affectionLevel ?? 0) < 3
                                ? 3
                                : 2,
                        value: '${cat.affectionLevel}',
                        onTap: () {},
                      ),
                      const SizedBox(
                        height: 12,
                      ),
                      HabilityCard(
                        hability: 'dog_friendly'.tr,
                        habilityDesc: 'dog_friendly_desc'.tr,
                        level: (cat.dogFriendly ?? 0) > 3
                            ? 1
                            : (cat.dogFriendly ?? 0) < 3
                                ? 3
                                : 2,
                        value: '${cat.dogFriendly}',
                        onTap: () {},
                      ),
                      const SizedBox(
                        height: 12,
                      ),
                      HabilityCard(
                        hability: 'energy_level'.tr,
                        habilityDesc: 'energy_level_desc'.tr,
                        level: (cat.energyLevel ?? 0) > 3
                            ? 1
                            : (cat.energyLevel ?? 0) < 3
                                ? 3
                                : 2,
                        value: '${cat.energyLevel}',
                        onTap: () {},
                      ),
                      const SizedBox(
                        height: 12,
                      ),
                      const SizedBox(
                        height: 12,
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      );
}
