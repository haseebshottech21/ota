import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:ota/model/project_model.dart';
import 'package:ota/repo/project_repository.dart';
import '../data/response/api_response.dart';
import '../utils/utils.dart';
import 'package:intl/intl.dart';

class ProjectViewModel with ChangeNotifier {
  final _projectRepo = ProjectRepository();

  String formattedDate = '';
  TextEditingController projectTitleController = TextEditingController();
  TextEditingController projectDetailController = TextEditingController();
  DateTime selectedDate = DateTime.now();

  selectTitleController(TextEditingController controller) {
    projectTitleController.text = controller.text;
    notifyListeners();
  }

  selectDetailController(TextEditingController controller) {
    projectDetailController.text = controller.text;
    notifyListeners();
  }

  Future<void> selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
        context: context,
        initialDate: selectedDate,
        firstDate: DateTime(2015, 8),
        lastDate: DateTime(2101));
    if (picked != null && picked != selectedDate) {
      // setState(() {
      selectedDate = picked;
      formattedDate = DateFormat('yy-MM-dd').format(selectedDate);
      notifyListeners();
      // });
    }
  }

  fieldsClear() {
    projectTitleController.clear();
    projectDetailController.clear();
    formattedDate = '';
  }

  bool _loading = false;
  bool get loading => _loading;
  setLoad(bool status) {
    _loading = status;
    notifyListeners();
  }

  ApiResponse<ProjectListModel> projectList = ApiResponse.loading();
  ApiResponse<Project> projectDetail = ApiResponse.loading();
  // Project get selectProject => _selectProject;

  // ALL PROJECTS
  setProjectList(ApiResponse<ProjectListModel> response) {
    projectList = response;
    // print(projectList.data!.project!.length);
    WidgetsBinding.instance.addPostFrameCallback((_) {
      notifyListeners();
    });
  }

  Future<void> fetchProjectsListApi() async {
    setProjectList(ApiResponse.loading());
    _projectRepo.fetchProjectsList().then((value) {
      setProjectList(ApiResponse.completed(value));
    }).onError((error, stackTrace) {
      setProjectList(ApiResponse.error(error.toString()));
    });
  }

  // SHOW PROJECT DETAIL
  setProjectDetail(ApiResponse<Project> response) {
    projectDetail = response;

    WidgetsBinding.instance.addPostFrameCallback((_) {
      notifyListeners();
    });
    // print('detail :  ' + projectDetail.data!.projectName);
  }

  Future<void> fetchProjectDetailApi({
    required String projectId,
  }) async {
    // setLoad(true);
    // var response = await _projectRepo.fetchProjectsDetail(projectId: projectId);
    // print(response);
    // setProjectDetail(response);

    setProjectDetail(ApiResponse.loading());
    _projectRepo.fetchProjectsDetail(projectId: projectId).then((value) {
      setProjectDetail(ApiResponse.completed(value));
    }).onError((error, stackTrace) {
      setProjectDetail(ApiResponse.error(error.toString()));
    });
  }

  // CREATE PROJECT
  Future<void> createProjectApi(
    dynamic data,
    // Function clearFields,
    BuildContext context,
  ) async {
    setLoad(true);
    _projectRepo.createProject(data).then((value) {
      Future.delayed(const Duration(seconds: 1)).then(
        (value) {
          setLoad(false);
          if (kDebugMode) {
            print(value.toString());
            fieldsClear();
            // clearFields();
            // Navigator.of(context).push(
            //   CustomPageRouter(
            //     child: const MyHome(),
            //     direction: AxisDirection.left,
            //   ),
            // );
            // Navigator.pushNamed(context, RouteName.login);
            Navigator.of(context).pop();
            Utils.loadingFlushBarMessage(
              'Project Created Successfully!',
              context,
              color: Colors.green,
            );
            // Navigator.of(context).pushNamedAndRemoveUntil(
            //   RouteName.home,
            //   (route) => false,
            // );
          }
        },
      );
    }).onError((error, stackTrace) {
      setLoad(false);
      Utils.errorFlushBarMessage(error.toString(), context);
      if (kDebugMode) {
        print(error.toString());
      }
    });
  }
}
