part of 'search_results_cubit.dart';

abstract class SearchResultsState extends Equatable {
  const SearchResultsState();

  @override
  List<Object> get props => [];
}

class SearchResultsInitial extends SearchResultsState {}

class SearchResultsLoading extends SearchResultsState {}

class SearchResultsSuccess extends SearchResultsState {
  final List<BookModel> books;

  const SearchResultsSuccess(this.books);
}

class SearchResultsFailure extends SearchResultsState {
  final String errMessage;

  const SearchResultsFailure(this.errMessage);
}
