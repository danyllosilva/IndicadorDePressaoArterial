class Paciente {
  int id;
  String nome;
  String perfil;
  String sexo;
  String cpf;
  int idade;
  String dtNascimento;
  String endereco;
  String telefone;
 
  Paciente(this.nome, this.perfil, this.sexo, this.cpf, this.idade, this.dtNascimento, this.endereco, this.telefone);

  Map<String, dynamic> toMap() {
    var map = <String, dynamic>{
      'id': this.id,
      'nome': this.nome,
      'perfil': this.perfil,
      'sexo': this.sexo,
      'cpf': this.cpf,
      'idade': this.idade,
      'dtNascimento': this.dtNascimento,
      'endereco': this.endereco,
      'telefone': this.telefone
    };
    return map;
  }
 
  Paciente.fromMap(Map<String, dynamic> map) {
    id = map['id'];
    nome = map['nome'];
    perfil = map['perfil'];
    sexo = map['sexo'];
    cpf = map['cpf'];
    idade = map['idade'];
    dtNascimento = map['dtNascimento'];
    endereco = map['endereco'];
    telefone = map['telefone'];
  }
}