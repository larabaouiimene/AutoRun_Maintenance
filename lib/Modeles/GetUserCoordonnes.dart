class User {
  final String? nom;
  final String? prenom;
  final String? email;
  final String? num_tel;
  final String? mdp;

  const User({
    required this.nom,
    required this.prenom,
    required this.email,
    required this.num_tel,
    required this.mdp,
  });

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      nom: json['nom'],
      prenom: json['prenom'],
      email: json['email'],
      num_tel: json['num_tel'],
      mdp: json['mdp'],
    );
  }
  SetUser() {}
}
