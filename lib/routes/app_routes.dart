import 'package:get/get.dart';
import 'package:thikdr/ui/home/home.dart';

class AppRoutes {
  static String loginPageScreen = '/login_page_screen';

  static String selectUserTypeScreen = '/select_user_type_screen';

  static String contractorFromScreen = '/contractor_from_screen';

  static String labourFromScreen = '/labour_from_screen';

  static String homeUiForContractorScreen = '/home_ui_for_contractor_screen';

  static String receivedScreen = '/received_screen';

  static String received1Screen = '/received1_screen';

  static String addPartyScreen = '/add_party_screen';

  static String addAttendanceScreen = '/add_attendance_screen';

  static String leadsDetailsScreen = '/leads_details_screen';

  static String estimateScreen = '/estimate_screen';

  static String estimateDetailsScreen = '/estimate_details_screen';

  static String estimateQuotationScreen = '/estimate_quotation_screen';

  static String itemsToEstimateScreen = '/items_to_estimate_screen';

  static String estimateQuotation1Screen = '/estimate_quotation1_screen';

  static String estimateQuotation2Screen = '/estimate_quotation2_screen';

  static String addProductScreen = '/add_product_screen';

  static String addProduct1Screen = '/add_product1_screen';

  static String materialLibraryScreen = '/material_library_screen';

  static String usedScreen = '/used_screen';

  static String received2Screen = '/received2_screen';

  static String photoScreen = '/photo_screen';

  static String taskUi1Screen = '/task_ui1_screen';

  static String productsItems1Screen = '/products_items1_screen';

  static String payment2Screen = '/payment2_screen';

  static String ongingProject1Screen = '/onging_project1_screen';

  static String leads1Screen = '/leads1_screen';

  static String myLeads1Screen = '/my_leads1_screen';

  static String appNavigationScreen = '/app_navigation_screen';

  static String initialRoute = '/initialRoute';

  static List<GetPage> pages = [

    GetPage(
      name: homeUiForContractorScreen,
      page: () => HomePage(),
      bindings: [
        //HomeUiForContractorBinding(),
      ],
    ),
  ];
}
