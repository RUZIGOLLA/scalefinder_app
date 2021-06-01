import 'package:scalefinderapp/objects/modeclass.dart';
import 'package:scalefinderapp/objects/noteclass.dart';

List<Note> createListNote() {
  List<Note> listeDesNotes = [
    Note('C', 0.0),
    Note('C#', 0.5),
    Note('D', 1.0),
    Note('D#', 1.5),
    Note('E', 2.0),
    Note('F', 2.5),
    Note('F#', 3),
    Note('G', 3.5),
    Note('G#', 4),
    Note('A', 4.5),
    Note('A#', 5),
    Note('B', 5.5),
    Note('C', 6.0),
    Note('C#', 6.5),
    Note('D', 7.0),
    Note('D#', 7.5),
    Note('E', 8.0),
    Note('F', 8.5),
    Note('F#', 9),
    Note('G', 9.5),
    Note('G#', 10),
    Note('A', 10.5),
    Note('A#', 11),
    Note('B', 11.5),
  ];
  return listeDesNotes;
}

List<Mode> createListMode(List<Note> gammeChromatique) {
  List<Mode> listDesModes = [
    Mode('Ionien', gammeChromatique.firstWhere((note) => note.libelle == 'C'), [
      1, 1, 0.5, 1, 1, 1, 0.5
    ], 'Majeur'),
    Mode('Dorien', gammeChromatique.firstWhere((note) => note.libelle == 'D'), [
      1, 0.5, 1, 1, 1, 0.5, 1
    ], 'Mineur'),
    Mode('Phrygien', gammeChromatique.firstWhere((note) => note.libelle == 'E'), [
      0.5, 1, 1, 1, 0.5, 1, 1
    ], ''),
    Mode('Lydien', gammeChromatique.firstWhere((note) => note.libelle == 'F'), [
      1, 1, 1, 0.5, 1, 1, 0.5
    ], ''),
    Mode('Myxolydien', gammeChromatique.firstWhere((note) => note.libelle == 'G'), [
      1, 1, 0.5, 1, 1, 0.5, 1
    ], ''),
    Mode('Eolien', gammeChromatique.firstWhere((note) => note.libelle == 'A'), [
      1, 0.5, 1, 1, 0.5, 1, 1
    ], 'Mineur naturel'),
    Mode('Locrien', gammeChromatique.firstWhere((note) => note.libelle == 'B'), [
      0.5, 1, 1, 0.5, 1, 1, 1
    ], ''),
  ];
  return listDesModes;
}