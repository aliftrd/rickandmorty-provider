class Pagination {
  final int count;
  final int pages;
  final String? next;
  final String? prev;

  const Pagination({
    required this.count,
    required this.pages,
    this.next,
    this.prev,
  });

  bool get hasNext => next != null;

  bool get hasPrev => prev != null;
}
