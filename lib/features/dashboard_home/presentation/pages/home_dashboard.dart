part of com.pragmatest.app.dashboardhome.presentation.pages;

class LandingPage extends StatefulWidget {
  const LandingPage({super.key});

  @override
  State<LandingPage> createState() => _LandingPageState();
}

class _LandingPageState extends State<LandingPage> {
  @override
  Widget build(BuildContext context) => Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Theme.of(context).colorScheme.onPrimary,
          surfaceTintColor: Colors.white,
          toolbarHeight: 160,
          title: const Center(
            child: Column(
              children: <Widget>[
                Text('Catbreeds'),
                SizedBox(height: 4),
                CommonInput(),
              ],
            ),
          ),
        ),
        body: const SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              CatbreedCard(
                catbreed: 'Mestizo',
                country: 'Colombia',
                intelligence: '10',
              ),
              SizedBox(height: 8),
            ],
          ),
        ),
      );
}
