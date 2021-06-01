import 'noteclass.dart';

class Accords {
  final List<Note> listeDeNote;
  final int position;

  String libelle;
  String mode;
  Accords(this.listeDeNote, this.position){
    this._getMode();
  }

  _getMode() {
    var note2 = this.listeDeNote[1].ton;
    var note1 = this.listeDeNote[0].ton;
    if (note2 < note1)
      note2 += 6;
    var ecart = note2 - note1;

    if (ecart == 2)
      mode = 'majeur';
    else if (ecart == 1.5 )
      mode = 'mineur';
    else
      mode = ecart.toString();
  }



}