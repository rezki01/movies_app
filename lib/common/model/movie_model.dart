import 'package:movies_app/common/common.dart';

class MovieModel {
  final String? image;
  final String? title;
  final String? about;

  MovieModel({
    this.image,
    this.title,
    this.about,
  });

  factory MovieModel.fromMap(Map<String, dynamic> map) {
    return MovieModel(
      image: map['image'],
      title: map['title'],
      about: map['about'],
    );
  }

  static List<MovieModel> dummies = [
    MovieModel(
      image: AssetPath.drStrange,
      title: 'Doctor Strange The Multiverse',
      about: "From DC Comics comes the Suicide Squad, an antihero team of incarcerated supervillains who act as deniable assets for the United States government, undertaking high-risk black ops missions in exchange for commuted prison sentences.",
    ),
    MovieModel(
      image: AssetPath.dumbledore,
      title: 'Fantastic Beasts: The Secrets of Dumbledore',
      about: "Fantastic Beasts: The Secrets of Dumbledore is a 2022 fantasy film directed by David Yates from a screenplay by J. K. Rowling and Steve Kloves, based on a screenplay by Rowling. It is the sequel to Fantastic Beasts: The Crimes of Grindelwald (2018), the third instalment in the Fantastic Beasts film series and the eleventh overall in the Wizarding World franchise. The film features an ensemble cast that includes Eddie Redmayne, Jude Law, Ezra Miller, Dan Fogler, Alison Sudol, Callum Turner, Jessica Williams, Katherine Waterston, and Mads Mikkelsen. Set several years after the events of its predecessor, the film sees Albus Dumbledore tasking Newt Scamander and his allies with a mission that takes them into the heart of dark wizard Gellert Grindelwald's army.",
    ),
    MovieModel(
      image: AssetPath.dogAventura,
      title: 'Dog Aventura De Uma Vida',
      about: "Briggs, a US Army soldier, is assigned to take Lulu, a Belgian Malinois military dog, along the Pacific Coast in hopes of arriving at a fellow soldier's funeral on time.",
    ),
    MovieModel(
      image: AssetPath.sonic,
      title: 'Sonic The Hedgehog 2',
      about: "Sonic the Hedgehog 2[b] is a 2022 action-adventure comedy film based on the video game series published by Sega, and the sequel to Sonic the Hedgehog (2020). Directed by Jeff Fowler and written by Pat Casey, Josh Miller, and John Whittington, the film stars Ben Schwartz, Jim Carrey, James Marsden, Tika Sumpter, Natasha Rothwell, Adam Pally, Lee Majdoub, and Colleen O'Shaughnessey reprising their roles, with Idris Elba and Shemar Moore joining the cast. In the film, after settling in Green Hills, Sonic tries to prove himself as a hero, but his big test comes when the dastardly Doctor Robotnik returns, alongside his new rival, Knuckles the Echidna, in search of the Master Emerald. Sonic teams up with his own sidekick Tails to embark on a journey to find the emerald before Robotnik does.",
    ),
    MovieModel(
      image: AssetPath.cidadePerdida,
      title: 'The Lost City (A Cidade Perdida)',
      about: "The Lost City[5] is a 2022 American action-adventure comedy film directed by the Nee brothers, who co-wrote the screenplay with Oren Uziel and Dana Fox, based on a story by Seth Gordon.[6] Starring Sandra Bullock, Channing Tatum, Daniel Radcliffe, Da'Vine Joy Randolph and Brad Pitt, the film follows a romance novelist and her cover model, who must escape a billionaire who wants her to find a lost ancient burial chamber described in one of her books.",
    ),
   MovieModel(
      image: AssetPath.avengers,
      title: 'Avengers: Endgame',
     about: "Avengers: Endgame is a 2019 American superhero film based on the Marvel Comics superhero team the Avengers. Produced by Marvel Studios and distributed by Walt Disney Studios Motion Pictures, it is the direct sequel to Avengers: Infinity War (2018) and the 22nd film in the Marvel Cinematic Universe (MCU). Directed by Anthony and Joe Russo and written by Christopher Markus and Stephen McFeely, the film features an ensemble cast including Robert Downey Jr., Chris Evans, Mark Ruffalo, Chris Hemsworth, Scarlett Johansson, Jeremy Renner, Don Cheadle, Paul Rudd, Brie Larson, Karen Gillan, Danai Gurira, Benedict Wong, Jon Favreau, Bradley Cooper, Gwyneth Paltrow, and Josh Brolin. In the film, the surviving members of the Avengers and their allies attempt to reverse Thanos's actions in Infinity War.",
    ),
  ];
}
