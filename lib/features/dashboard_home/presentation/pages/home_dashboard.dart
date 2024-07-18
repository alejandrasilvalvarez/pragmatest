part of com.pragmatest.app.dashboardhome.presentation.pages;

class LandingPage extends StatefulWidget {
  const LandingPage({super.key});

  @override
  State<LandingPage> createState() => _LandingPageState();
}

class _LandingPageState extends State<LandingPage> {
  DashboardBloc dashboardBloc = sl<DashboardBloc>();
  @override
  void initState() {
    super.initState();
    dashboardBloc.add(const FetchCatsList());
  }

  @override
  Widget build(BuildContext context) => Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Theme.of(context).colorScheme.onPrimary,
          surfaceTintColor: Colors.white,
          toolbarHeight: 160,
          title: Center(
            child: Column(
              children: <Widget>[
                Text('cat_breeds'.tr),
                const SizedBox(height: 4),
                const CommonInput(),
              ],
            ),
          ),
        ),
        body: SingleChildScrollView(
          child: BlocBuilder<DashboardBloc, DashboardState>(
            bloc: dashboardBloc,
            builder: (BuildContext context, DashboardState state) {
              if (state is DashboardStateLoading) {
                return const Center(child: CircularProgressIndicator());
              } else if (state is DashboardStateSuccessful) {
                return Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    ...state.info.map(
                      (CatModel e) => CatbreedCard(
                        catbreed: e.name ?? '',
                        country: e.origin ?? '',
                        intelligence: '${e.intelligence}',
                        imageReference: e.referenceImageId??'',
                      ),
                    ),
                  ],
                );
              } else if (state is DashboardStateError) {
                return WarningMessage(
                  message: state.errorMessage,
                  isError: true,
                );
              } else {
                return WarningMessage(
                  message: 'default_error'.tr,
                  isError: true,
                );
              }
            },
          ),
        ),
      );
}
