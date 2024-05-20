import 'package:bloc/bloc.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:teste_dev_pleno/modules/home/domain/domain.dart';

part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  final IHomeRepository _repository;
  HomeCubit(this._repository) : super(HomeInitial());

  List<PersonEntity> _personList = [];
  int _currentPage = 1;

  PagingController<int, PersonEntity> pagingController =
      PagingController(firstPageKey: 1);

  Future<void> init() async {
    try {
      emit(HomeLoading());
      await initPaging();
      emit(HomeLoaded(_personList));
    } catch (e) {
      emit(HomeError(e.toString()));
    }
  }

  Future<void> initPaging() async {
    pagingController.addPageRequestListener((pageKey) async {
      await _fetchPage(_currentPage);
    });
  }

  Future<void> _fetchPage(int pageKey) async {
    try {
      _personList = await loadCharacters(pageKey);
      final isLastPage = _personList.length < 10;
      emit(HomeLoaded(_personList));

      if (isLastPage) {
        pagingController.appendLastPage(_personList);
      } else {
        _currentPage = pageKey + 1;
        pagingController.appendPage(_personList, _currentPage);
      }
    } catch (error) {
      pagingController.error = error;
    }
  }

  Future<List<PersonEntity>> loadCharacters(int page) async {
    try {
      return await _repository.getCharacters(page: page);
    } catch (e) {
      throw Exception();
    }
  }

  Future<void> refresh() async {
    _personList = [];
    _currentPage = 1;
    pagingController.refresh();
  }
}
