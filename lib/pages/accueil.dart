import 'package:flutter/material.dart';
import 'package:responsive_grid/responsive_grid.dart';
//import 'dart:ui';

class MapremierePage extends StatefulWidget {
  const MapremierePage({super.key});

  @override
  State<MapremierePage> createState() => _MapremierePageState();
}

class _MapremierePageState extends State<MapremierePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.amber,
        title: const Text("Vos émissions de streaming"),
        centerTitle: true,
        elevation: 4.0,
        leading: IconButton(
          icon: Icon(Icons.search),
          onPressed: () {
            print("Rechercher");
          },
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.list),
            tooltip: "Liste des émissions",
            onPressed: () {
              print('Liste des émissions');
            },
          ),
        ],
      ),
      //corps de l'application
      body: const Padding(
        padding: EdgeInsets.all(8.0),
        child: PartieGrilleImage(),
      ),
      //pied de page de l'application
      bottomNavigationBar: BottomNavigationBar(
        //backgroundColor: const Color.fromARGB(255, 230, 56, 137),
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home, color: Colors.amber),
            label: 'Accueil',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.search, color: Colors.amber),
            label: 'Recherche',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person, color: Colors.amber),
            label: 'Profil',
          ),
        ],
      ),
    );
  }
}

class IdentificationStreaming extends StatelessWidget {
  final String chaineRadio;
  final String imageStream;
  final String nomStream;
  final String tagStream;

  const IdentificationStreaming({
    super.key,
    required this.tagStream,
    required this.imageStream,
    required this.nomStream,
    required this.chaineRadio,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        final historique = _getHistoriquePourEmission(nomStream);
        final description = _getDescriptionPourEmission(nomStream);

        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (_) => AlbumStreaming(
              tagStream: tagStream,
              imageStream: imageStream,
              nomStream: nomStream,
              chaineRadio: chaineRadio,
              description: description,
              historique: historique,
            ),
          ),
        );
      },
      child: Container(
        margin: const EdgeInsets.all(6),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12),
          boxShadow: [
            BoxShadow(
              color: Colors.grey,
              spreadRadius: 2,
              blurRadius: 5,
              offset: const Offset(0, 3),
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Hero(
              tag: tagStream,
              child: ClipRRect(
                borderRadius: const BorderRadius.vertical(
                  top: Radius.circular(12),
                ),
                child: Image.asset(
                  imageStream,
                  fit: BoxFit.cover,
                  width: double.infinity,
                  height: 120,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    nomStream,
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    chaineRadio,
                    style: TextStyle(fontSize: 14, color: Colors.grey.shade600),
                  ),
                ],
              ),
            ),
          ],
        ),
        //ild: ,
      ),
    );
  }

  //simulation de description unique pour chaque emission
  String _getDescriptionPourEmission(String nom) {
    switch (nom) {
      case 'Matin Libre':
        return "L'émission qui démarre votre journée avec des analyses et de la bonne humeur.";
      case 'Jeunesse Dorée':
        return "Une tribune dynamique dédiée à la jeunesse et à ses aspirations.";
      case 'Bénin Révélé':
        return "Découverte des talents, innovations et initiatives qui font briller le Bénin.";
      case 'Au Crépuscule':
        return "Détente, poésie et confidences à la tombée du jour.";
      case 'Documentaires':
        return "Explorez le monde avec nos documentaires exclusifs.";
      case 'Au coeur du Vodoun':
        return "Immersion dans les traditions et les mystères du Vodoun.";
      case 'AROBA BABA ITAN':
        return "Les histoires et légendes ancestrales contées par les sages.";
      case 'L\'étudiant Noir':
        return "Une émission éducative qui met en lumière la vie universitaire africaine.";
      case 'Peace FM':
        return "L'émission d'actualité internationale et de paix dans le monde.";
      default:
        return "Une émission passionnante à découvrir.";
    }
  }

  // Historique spécifique à chaque émission
  List<Map<String, String>> _getHistoriquePourEmission(String nom) {
    switch (nom) {
      case 'Matin Libre':
        return [
          {"date": "10/10/2025", "titre": "Matin Libre - Actu & Politique"},
          {"date": "09/10/2025", "titre": "Matin Libre - Décryptage"},
        ];
      case 'Jeunesse Dorée':
        return [
          {"date": "11/10/2025", "titre": "Jeunesse Dorée - Leadership"},
          {"date": "10/10/2025", "titre": "Jeunesse Dorée - Éducation & Futur"},
        ];
      case 'Bénin Révélé':
        return [
          {"date": "10/10/2025", "titre": "Bénin Révélé - Innovation Locale"},
          {"date": "09/10/2025", "titre": "Bénin Révélé - Culture & Héritage"},
        ];
      case 'Au Crépuscule':
        return [
          {"date": "11/10/2025", "titre": "Au Crépuscule - Poésie du Soir"},
          {"date": "10/10/2025", "titre": "Au Crépuscule - Paroles d’Auteurs"},
        ];
      case 'Documentaires':
        return [
          {"date": "08/10/2025", "titre": "Documentaire - Le Nil Mystique"},
          {"date": "07/10/2025", "titre": "Documentaire - Forêts du Dahomey"},
        ];
      case 'Au coeur du Vodoun':
        return [
          {"date": "09/10/2025", "titre": "Vodoun - Les Rites sacrés"},
          {"date": "08/10/2025", "titre": "Vodoun - Les Symboles cachés"},
        ];
      default:
        return [
          {"date": "10/10/2025", "titre": "Diffusion spéciale"},
          {"date": "09/10/2025", "titre": "Diffusion exclusive"},
        ];
    }
  }
}

class PartieGrilleImage extends StatelessWidget {
  const PartieGrilleImage({super.key});

  @override
  Widget build(BuildContext context) {
    return ResponsiveGridList(
      desiredItemWidth: 150,
      minSpacing: 10,
      children: const [
        IdentificationStreaming(
          tagStream: 'stream1',
          imageStream: 'assets/images/emission1.jpeg',
          nomStream: 'Matin Libre',
          chaineRadio: 'Canal 3 Radio',
        ),
        IdentificationStreaming(
          tagStream: 'stream2',
          imageStream: 'assets/images/emission2.jpeg',
          nomStream: 'Jeunesse Dorée',
          chaineRadio: 'E-Radio BENIN',
        ),
        IdentificationStreaming(
          tagStream: 'stream3',
          imageStream: 'assets/images/emission3.jpeg',
          nomStream: 'Bénin Revelé',
          chaineRadio: 'SRTB Radio',
        ),
        IdentificationStreaming(
          tagStream: 'stream4',
          imageStream: 'assets/images/emission4.jpeg',
          nomStream: 'Au Crépuscule',
          chaineRadio: 'Radio Soleil',
        ),
        IdentificationStreaming(
          tagStream: 'stream5',
          imageStream: 'assets/images/emission5.jpeg',
          nomStream: 'Documentaires',
          chaineRadio: 'BENIN TV Radio',
        ),
        IdentificationStreaming(
          tagStream: 'stream6',
          imageStream: 'assets/images/emission6.jpeg',
          nomStream: 'Au coeur du Vodoun',
          chaineRadio: 'A+ BENIN',
        ),
        IdentificationStreaming(
          tagStream: 'stream7',
          imageStream: 'assets/images/emission1.jpeg',
          nomStream: 'AROBA BABA ITAN',
          chaineRadio: 'Radio ALAKETU',
        ),
        IdentificationStreaming(
          tagStream: 'stream8',
          imageStream: 'assets/images/dantokpa.jpeg',
          nomStream: 'Matin Libre',
          chaineRadio: 'Canal 3 Radio',
        ),
        IdentificationStreaming(
          tagStream: 'stream9',
          imageStream: 'assets/images/emission1.jpeg',
          nomStream:
              'L'
              'étudiant Noir',
          chaineRadio: 'Radio UNIVERS',
        ),
        IdentificationStreaming(
          tagStream: 'stream10',
          imageStream: 'assets/images/emission1.jpeg',
          nomStream: 'Peace FM',
          chaineRadio: 'Actualité Monde',
        ),
      ],
    );
  }
}

// class AlbumStreaming extends StatelessWidget {
//   final String tagStream;
//   final String imageStream;
//   final String nomStream;
//   final String chaineRadio;

//   const AlbumStreaming({
//     required this.tagStream,
//     required this.imageStream,
//     required this.nomStream,
//     required this.chaineRadio,
//     super.key,
//   });

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text(nomStream),
//         backgroundColor: const Color(0xFFFFC107),
//         foregroundColor: Colors.black,
//       ),
//       body: Column(
//         children: [
//           Hero(
//             tag: tagStream,
//             child: Image.asset(
//               imageStream,
//               width: double.infinity,
//               height: 250,
//               fit: BoxFit.cover,
//             ),
//           ),
//           const SizedBox(height: 20),
//           Text(
//             nomStream,
//             style: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
//           ),
//           const SizedBox(height: 20),
//           Text(
//             chaineRadio,
//             style: TextStyle(fontSize: 18, color: Colors.grey.shade600),
//           ),
//         ],
//       ),
//     );
//   }
// }

/////
class AlbumStreaming extends StatelessWidget {
  const AlbumStreaming({
    super.key,
    required this.tagStream,
    required this.imageStream,
    required this.nomStream,
    required this.chaineRadio,
    required this.description,
    required this.historique,
  });

  final String chaineRadio;
  final String imageStream;
  final String nomStream;
  final String tagStream;
  final String description;
  final List<Map<String, String>> historique;

  @override
  Widget build(BuildContext context) {
    //final random = Random();
    return Scaffold(
      body: Stack(
        children: [
          // Image de fond avec Hero transition
          Hero(
            tag: tagStream,
            child: Image.asset(
              imageStream,
              fit: BoxFit.cover,
              height: 600.0,
              width: double.infinity,
            ),
          ),

          // Overlay de couleur sombre pour lisibilité
          // ignore: deprecated_member_use
          Container(color: Colors.black.withOpacity(0.5)),

          // Contenu principal
          SafeArea(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Barre d'appbar manuelle avec bouton retour
                Row(
                  children: [
                    IconButton(
                      icon: const Icon(Icons.arrow_back, color: Colors.white),
                      onPressed: () => Navigator.pop(context),
                    ),
                    Expanded(
                      child: Container(
                        color: Colors.blueAccent,
                        padding: EdgeInsets.all(20.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text(
                              nomStream,
                              style: const TextStyle(
                                fontSize: 22,
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                              ),
                              overflow: TextOverflow.ellipsis,
                            ),
                            Text(
                              chaineRadio,
                              style: TextStyle(
                                fontSize: 16,
                                color: const Color.fromARGB(255, 238, 4, 4),
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(width: 48), // pour équilibrer la symétrie
                  ],
                ),
                const SizedBox(height: 40),
                //Image en grand
                ClipRRect(
                  borderRadius: BorderRadius.circular(16),
                  child: Image.asset(
                    imageStream,
                    height: 300,
                    width: 400,
                    fit: BoxFit.cover,
                  ),
                ),
                const SizedBox(height: 20),
                // 📝 Description
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  //child: Card(
                  //color: Colors.amber,
                  child: Text(
                    description,
                    style: const TextStyle(
                      color: Colors.amber,
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
                //),
                const SizedBox(height: 20),
                // Liste des diffusions
                Expanded(
                  child: Container(
                    decoration: const BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.vertical(
                        top: Radius.circular(24),
                      ),
                    ),
                    padding: const EdgeInsets.all(16.0),
                    child: ListView.builder(
                      itemCount: historique.length,
                      itemBuilder: (context, index) {
                        final item = historique[index];
                        return Container(
                          margin: const EdgeInsets.symmetric(vertical: 8),
                          decoration: BoxDecoration(
                            color: Colors.grey.shade100,
                            borderRadius: BorderRadius.circular(12),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.grey.shade600,
                                blurRadius: 4,
                                offset: const Offset(0, 2),
                              ),
                            ],
                          ),
                          child: ListTile(
                            leading: const Icon(
                              Icons.volume_up_rounded,
                              color: Colors.amber,
                              size: 30,
                            ),
                            title: Text(
                              item['titre']!,
                              style: const TextStyle(
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            subtitle: Text(
                              "Diffusé le  ${item['date']}",
                              style: TextStyle(color: Colors.grey.shade700),
                            ),
                            trailing: Icon(
                              Icons.play_circle_fill_rounded,
                              color: Colors.amber.shade700,
                              size: 36,
                            ),
                            onTap: () {
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(
                                  backgroundColor: Colors.blueAccent,
                                  content: Text(
                                    'Lecture de "${item['titre']}"..',
                                  ),
                                ),
                              );
                            },
                          ),
                        );
                      },
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
