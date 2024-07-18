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
              ? const Color.fromARGB(255, 228, 255, 207)
              : level == 2
                  ? const Color.fromARGB(255, 255, 241, 207)
                  : const Color.fromARGB(255, 255, 213, 207),
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
                        ? const Color.fromARGB(255, 148, 206, 55)
                        : level == 2
                            ? const Color.fromARGB(255, 251, 181, 75)
                            : const Color.fromARGB(255, 251, 96, 75),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: const Padding(
                    padding: EdgeInsets.all(8),
                    child: Icon(
                      Icons.lightbulb,
                      color: Colors.white,
                      size: 32,
                    ),
                  ),
                ),
                const SizedBox(
                  width: 12,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      hability,
                      style: const TextStyle(
                        color: Color.fromARGB(255, 49, 49, 49),
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                      ),
                    ),
                    SizedBox(
                      width: MediaQuery.of(context).size.width - 160,
                      child: Text(
                        habilityDesc,
                        style: const TextStyle(
                          color: Color.fromARGB(255, 49, 49, 49),
                        ),
                      ),
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(24, 4, 4, 4),
                  child: Text(
                    value,
                    style: const TextStyle(
                      color: Color.fromARGB(255, 89, 89, 89),
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
