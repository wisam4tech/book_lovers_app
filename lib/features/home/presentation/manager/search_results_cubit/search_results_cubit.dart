import 'package:bookly_app/features/home/data/models/book_model/book_model.dart';
import 'package:bookly_app/features/home/data/repos/home_repo.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'search_results_state.dart';

class SearchResultsCubit extends Cubit<SearchResultsState> {
  SearchResultsCubit(
    this.homeRepo,
    this.books,
  ) : super(SearchResultsInitial());
  final HomeRepo homeRepo;
  final BookModel books;

  Future<void> fetchSearchResults({required String title}) async {
    emit(SearchResultsLoading());
    var result = await homeRepo.fetchSearchResults(title: title);
    result.fold(
      (failure) {
        emit(SearchResultsFailure(failure.errMessage));
      },
      (books) {
        emit(SearchResultsSuccess(books));
      },
    );
  }
}
