import 'package:scalefinderapp/objects/accords.dart';
import 'package:scalefinderapp/objects/modeclass.dart';

import 'noteclass.dart';

class gamme {
  final String libelle;
  final Note root;
  final Mode mode;
  List<Note> notes = [];
  List<Accords> accords = [];

  gamme(this.libelle, this.root, this.mode, List<Note> gammeChromatique) {
    this._constructGamme(gammeChromatique);
    this._constructChords();
  }

  _constructChords() {
    var tab1 = this.notes;
    var clonedAndDoubleNotesTab = this.notes + this.notes;
    for (var idxNote = 0; idxNote < this.notes.length; idxNote++) {

      List<Note> chordNotes = [clonedAndDoubleNotesTab[idxNote], clonedAndDoubleNotesTab[idxNote + 2], clonedAndDoubleNotesTab[idxNote + 4], clonedAndDoubleNotesTab[idxNote + 6]];

      accords.add(new Accords(chordNotes, idxNote));
    }
  }
  _constructGamme(gammeChromatique) {
    var ton = this.root.ton;
    for (var i = 0; i < this.mode.ecarts.length; i++) {

      this.notes.add(gammeChromatique.firstWhere((element) => element.ton == ton));
      ton += this.mode.ecarts[i];
    }
  }
}