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
    imageUrl: 'https://resources.ninghao.org/images/candy-shop.jpg',
    tip: 'Global',
  ),
  Post(
    title: 'InfrastructureDistrict Mobility Engineer',
    author: 'Saul',
    imageUrl: 'https://resources.ninghao.org/images/childhood-in-a-picture.jpg',
    tip: 'IV',
  ),
  Post(
    title: 'Nyasia Bradtke',
    author: 'Mr.',
    imageUrl: 'https://resources.ninghao.org/images/contained.jpg',
    tip: 'Applications',
  )
];
