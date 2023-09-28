import 'package:get/get.dart';
import '../model/OnBoardingModel.dart';
import '../repository/on_boarding_repo.dart';

class OnBoardingController extends GetxController implements GetxService {


  List<OnBoardingModel> _onBoardingList = [];
  int _selectedIndex = 0;
  OnBoardingRepo onboardingRepo = OnBoardingRepo();

  List<OnBoardingModel> get onBoardingList => _onBoardingList;
  int get selectedIndex => _selectedIndex;

  void changeSelectIndex(int index) {
    _selectedIndex = index;
    update();
  }

  void getOnBoardingList() async {
    Response response = await onboardingRepo.getOnBoardingList();
    if (response.statusCode == 200) {
      _onBoardingList = [];
      _onBoardingList.addAll(response.body);
    } else {

    }
    update();
  }
}
