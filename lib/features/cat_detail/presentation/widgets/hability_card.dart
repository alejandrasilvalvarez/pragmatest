part of com.pragmatest.app.catdetail.presentation.widgets;

class HabilityCard extends StatelessWidget {
  const HabilityCard({
    required this.hability,
    required this.habilityDesc,
    required this.level,
    required this.value,
    required this.onTap,
    super.key,
  });

  final String hability;
  final String habilityDesc;
  final String value;
  final int level;
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) => DecoratedBox(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          color: level == 1
              ? Colors.greenBrand[5]
              : level == 2
                  ? Colors.orangeBrand[5]
                  : Colors.redBrand[5],
        ),
        child: GestureDetector(
          onTap: onTap,
          child: Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 8,
              vertical: 4,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                DecoratedBox(
                  decoration: BoxDecoration(
                    color: level == 1
                        ? Colors.greenBrand[30]
                        : level == 2
                            ? Colors.orangeBrand[30]
                            : Colors.redBrand[30],
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(8),
                    child: Icon(
                      Icons.lightbulb,
                      color: Colors.white[0],
                      size: 32,
                    ),
                  ),
                ),
                const SizedBox(
                  width: 12,
                ),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      const SizedBox(
                        height: 4,
                      ),
                      Text(
                        hability,
                        style: TextStyle(
                          color: Colors.grey[30],
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                        ),
                      ),
                      Text(
                        habilityDesc,
                        style: TextStyle(
                          color: Colors.grey[30],
                        ),
                      ),
                      const SizedBox(
                        height: 4,
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(24, 4, 12, 4),
                  child: Text(
                    value,
                    style: TextStyle(
                      color: Colors.grey[20],
                      fontWeight: FontWeight.bold,
                      fontSize: 24,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      );
}
