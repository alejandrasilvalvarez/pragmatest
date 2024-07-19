part of com.pragmatest.app.dashboardhome.presentation.pages;

class LandingPage extends StatefulWidget {
  const LandingPage({super.key});

  @override
  State<LandingPage> createState() => _LandingPageState();
}

class _LandingPageState extends State<LandingPage> {
  DashboardBloc dashboardBloc = sl<DashboardBloc>();
  List<CatModel> catsTotal = <CatModel>[];
  @override
  void initState() {
    super.initState();
    dashboardBloc.add(const FetchCatsList());
  }

  @override
  Widget build(BuildContext context) => Scaffold(
        backgroundColor: Colors.white[0],
        appBar: AppBar(
          backgroundColor: Theme.of(context).colorScheme.onPrimary,
          surfaceTintColor: Colors.white[0],
          toolbarHeight: 160,
          title: Center(
            child: Column(
              children: <Widget>[
                Text('cat_breeds'.tr),
                Spacing.spacingV4,
                CommonInput(
                  onChanged: (String value) {
                    dashboardBloc.add(
                      FilterCatsList(
                        catsListTotal: catsTotal,
                        nameToFilter: value,
                      ),
                    );
                  },
                ),
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
                catsTotal = state.catsListTotal;
                return Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    if (state.catsListToShow.isEmpty)
                      WarningMessage(
                        message: 'not_cats_on_filter'.tr,
                        isError: false,
                      ),
                    ...state.catsListToShow.map(
                      (CatModel e) => CatbreedCard(
                        catbreed: e.name ?? '',
                        country: e.origin ?? '',
                        intelligence: '${e.intelligence}',
                        imageReference: e.referenceImageId ?? '',
                        onTapCard: () {
                          Get.toNamed('detail_page', arguments: e);
                        },
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
