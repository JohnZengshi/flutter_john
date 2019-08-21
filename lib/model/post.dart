class Post {
  const Post({
    this.title,
    this.author,
    this.imageUrl,
    this.tip,
  });
  final String title;
  final String author;
  final String imageUrl;
  final String tip;
}

final List<Post> posts = [
  Post(
    title: 'Candy Shop',
    author: 'Johann',
    imageUrl: 'http://lorempixel.com/640/480/animals',
    tip: 'Global',
  ),
  Post(
    title: 'InfrastructureDistrict Mobility Engineer',
    author: 'Saul',
    imageUrl: 'http://lorempixel.com/640/480/business',
    tip: 'IV',
  ),
  Post(
    title: 'Nyasia Bradtke',
    author: 'Mr.',
    imageUrl: 'http://lorempixel.com/640/480/food',
    tip: 'Applications',
  )
];
