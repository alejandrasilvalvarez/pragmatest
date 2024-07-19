part of com.pragmatest.app.dashboardhome.presentation.widgets;

class CatbreedCard extends StatefulWidget {
  const CatbreedCard({
    required this.catbreed,
    required this.country,
    required this.intelligence,
    required this.imageReference,
    required this.onTapCard,
    Key? key,
  }) : super(key: key);

  final String catbreed;
  final String country;
  final String intelligence;
  final String imageReference;
  final void Function()? onTapCard;

  @override
  State<CatbreedCard> createState() => _CatbreedCardState();
}

class _CatbreedCardState extends State<CatbreedCard> {
  @override
  Widget build(BuildContext context) => Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: UILayout.large,
          vertical: UILayout.small,
        ),
        child: Card(
          color: Colors.white[0],
          surfaceTintColor: Colors.white[0],
          elevation: 0.5,
          shape: RoundedRectangleBorder(
            side: BorderSide(
              color: Colors.purpleBrand[10]!,
              width: 1,
            ),
            borderRadius: BorderRadius.circular(UILayout.small),
          ),
          child: SizedBox(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.width - 54,
            child: Stack(
              children: <Widget>[
                Center(
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(UILayout.small),
                    child: AspectRatio(
                      aspectRatio: 1,
                      child: CachedNetworkImage(
                        imageUrl:
                            'https://cdn2.thecatapi.com/images/${widget.imageReference}.jpg',
                        placeholder: (BuildContext context, String url) =>
                            const Center(
                          child: CircularProgressIndicator(),
                        ),
                        errorWidget:
                            (BuildContext context, String url, Object error) =>
                                Center(
                          child: Text(
                            'error_loading_image'.tr,
                          ),
                        ),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.all(UILayout.medium),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          const SizedBox.shrink(),
                          GestureDetector(
                            onTap: widget.onTapCard,
                            child: DecoratedBox(
                              decoration: BoxDecoration(
                                color: Colors.purpleBrand[30],
                                borderRadius: BorderRadius.circular(16),
                              ),
                              child: Padding(
                                padding: const EdgeInsets.symmetric(
                                  horizontal: UILayout.small,
                                  vertical: UILayout.xsmall,
                                ),
                                child: Text(
                                  'view_more'.tr,
                                  style: TextStyle(
                                    fontSize: UILayout.medium,
                                    color: Colors.white[0],
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    DecoratedBox(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        color: Colors.purpleBrand[20],
                      ),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                          horizontal: UILayout.medium,
                          vertical: UILayout.small,
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Text(
                              widget.catbreed,
                              style: TextStyle(
                                fontSize: UILayout.large,
                                fontWeight: FontWeight.bold,
                                color: Colors.white[0],
                              ),
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: <Widget>[
                                Row(
                                  children: <Widget>[
                                    Icon(
                                      Icons.location_city,
                                      color: Colors.white[0],
                                    ),
                                    Text(
                                      widget.country,
                                      style: TextStyle(
                                        fontSize: UILayout.medium,
                                        color: Colors.white[0],
                                      ),
                                    ),
                                  ],
                                ),
                                Row(
                                  children: <Widget>[
                                    Icon(
                                      Icons.lightbulb,
                                      color: Colors.white[0],
                                    ),
                                    Text(
                                      widget.intelligence,
                                      style: TextStyle(
                                        fontSize: UILayout.medium,
                                        color: Colors.white[0],
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      );
}
