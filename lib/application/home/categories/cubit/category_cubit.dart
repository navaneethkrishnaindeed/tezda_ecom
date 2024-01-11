import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:tezda_ecom/application/home/home_controller.dart';
import 'package:tezda_ecom/infrastructure/products_repository/i_repo.dart';

part 'category_state.dart';
part 'category_cubit.freezed.dart';

class CategoryCubit extends Cubit<CategoryState> {
  CategoryCubit() : super(CategoryState.initial());
  getCategoryList() async {
    IProductRepo repository = IProductRepo();
    var categories = await repository.getAllCategories();
    HomeController.categories.value = categories;
    print(categories);
  }
}
