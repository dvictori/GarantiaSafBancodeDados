-- tabela dos sistemas
CREATE TABLE sistema (
  id_sistema INTEGER PRIMARY KEY NOT NULL,
  nome TEXT,
  descricao TEXT,
  complexidade TEXT,
  referencias TEXT,
  cartilha TEXT
);

CREATE TABLE sistema_midia (
  id_midia INTEGER PRIMARY KEY NOT NULL,
  id_sistema INTEGER,
  tipo INTEGER,
  arquivo TEXT,
  FOREIGN key(id_sistema) REFERENCES sistema(id_sistema)
);

-- quais espécies vegetais entram em cada sistema
CREATE TABLE sistema_especie (
  id_sistema_especie INTEGER PRIMARY KEY NOT NULL,
  id_sistema INTEGER,
  id_especie INTEGER,
  posicao_especie TEXT,
  espacamento_entreplantas REAL,
  espacamento_entrelinhas REAL,
  FOREIGN KEY("id_especie") REFERENCES "especie_vegetal"("id_especie") ON DELETE NO ACTION,
  FOREIGN KEY("id_sistema") REFERENCES "sistema"("id_sistema") ON DELETE NO ACTION
);

CREATE TABLE especie_vegetal (
  id_especie INTEGER PRIMARY KEY NOT NULL,
  nome_cientifico TEXT,
  estrato TEXT,
  resiliencia INTEGER,
  ciclo_min INTEGER,
  ciclo_max INTEGER,
  alimento_humano TEXT,
  medicinal TEXT,
  bioma_caract TEXT
);

CREATE TABLE nome_popular (
  id_nome_pop INTEGER PRIMARY KEY NOT NULL,
  id_especie INTEGER NOT NULL,
  nome_pop TEXT NOT NULL,
  FOREIGN KEY(id_especie) REFERENCES especie_vegetal(id_especie) ON DELETE NO ACTION
);

-- pragas que atacam as especies vegetais
CREATE TABLE praga (
  id_praga INTEGER PRIMARY KEY NOT NULL,
  praga_cientifico TEXT,
  descricao_praga TEXT,
  descricao_sintoma TEXT,
  foto TEXT -- será que não é possível ter só uma tabela de midia
);

CREATE TABLE praga_pop (
  id_praga_pop INTEGER PRIMARY KEY NOT NULL,
  id_praga INTEGER,
  praga_pop TEXT,
  FOREIGN KEY(id_praga) REFERENCES praga(id_praga) ON DELETE NO ACTION
);

CREATE TABLE praga_especie (
  id INTEGER PRIMARY KEY NOT NULL,
  id_praga INTEGER,
  id_especie INTEGER,
  FOREIGN KEY (id_praga) REFERENCES praga(id_praga),
  FOREIGN KEY (id_especie) REFERENCES especie_vegetal(id_especie)
);

CREATE TABLE controle_praga (
  id_ctrl_biologico INTEGER PRIMARY KEY NOT NULL,
  id_praga INTEGER,
  insumo_ctrl TEXT,
  descricao_crtl TEXT,
  biologico INTEGER, -- bolean?
  FOREIGN KEY(id_praga) REFERENCES praga(id_praga) ON DELETE NO ACTION
);

-- sistema pode ter animais
CREATE TABLE sistema_animal (
  id_sistema_animal INTEGER PRIMARY KEY NOT NULL,
  id_sistema INTEGER,
  id_animal INTEGER,
  funcao_animal,
  ciclo,
  FOREIGN KEY(id_sistema) REFERENCES sistema(id_sistema),
  FOREIGN KEY(id_animal) REFERENCES animal(id_animal)
);

-- não sei se precisa detalhar nome cientifico
CREATE TABLE animal (
  id_animal INTEGER PRIMARY KEY NOT NULL,
  nome TEXT,
  raca TEXT,
  exigencia_alimentacao TEXT
);

CREATE TABLE patogeno (
  id_patogeno INTEGER PRIMARY KEY NOT NULL,
  id_animal INTEGER,
  nome_cientifico TEXT,
  descricao TEXT,
  sintoma TEXT,
  foto TEXT,
  FOREIGN KEY(id_animal) REFERENCES animal(id_animal)
);

CREATE TABLE patogeno_pop (
  id_patogeno_pop INTEGER PRIMARY KEY NOT NULL,
  id_patogeno INTEGER,
  nome_popular TEXT,
  FOREIGN KEY(id_patogeno) REFERENCES patogeno(id_patogeno) ON DELETE NO ACTION
);

CREATE TABLE controle_patogeno (
  id_ctrl INTEGER PRIMARY KEY NOT NULL,
  id_patogeno INTEGER,
  insumo_ctrl TEXT,
  descricao_crtl TEXT,
  biologico INTEGER, -- bolean?
  FOREIGN KEY(id_patogeno) REFERENCES patogeno(id_patogeno) ON DELETE NO ACTION
);

-- manejo de cultivo
CREATE TABLE sitema_manejo_cultivo (
  id INTEGER PRIMARY KEY NOT NULL,
  id_sistema INTEGER,
  id_manejo_cultivo INTEGER,
  epoca INTEGER,
  FOREIGN KEY(id_sistema) REFERENCES sistema(id_sistema),
  FOREIGN KEY(id_manejo_cultivo) REFERENCES manejo_cultivo(id)
);

CREATE TABLE manejo_cultivo (
  id INTEGER PRIMARY KEY NOT NULL,
  tipo TEXT,
  descricao_manejo TEXT,
  epoca INTEGER,
  periodicidade INTEGER,
  duracao_operacao INTEGER
);

-- manejo do solo
CREATE TABLE sistema_manejo_solo (
  id INTEGER PRIMARY KEY NOT NULL,
  id_sistema INTEGER,
  id_manejo_solo INTEGER,
  epoca INTEGER,
  FOREIGN KEY(id_sistema) REFERENCES sistema(id_sistema),
  FOREIGN KEY(id_manejo_solo) REFERENCES manejo_solo(id)
);

CREATE TABLE manejo_solo (
  id INTEGER PRIMARY KEY NOT NULL,
  tipo TEXT,
  descricao TEXT,
  implemento TEXT,
  insumo TEXT,
  correcao TEXT
);

-- solos que o sistema pode ser implantado
CREATE TABLE sistema_solo (
  id INTEGER PRIMARY KEY NOT NULL,
  id_sistema INTEGER,
  id_solo INTEGER,
  FOREIGN KEY(id_sistema) REFERENCES sistema(id_sistema),
  FOREIGN KEY(id_solo) REFERENCES solo(id)
);

CREATE TABLE solo (
  id INTEGER PRIMARY KEY NOT NULL,
  tipo_solo TEXT,
  granulometria TEXT,
  acidez TEXT,
  retencao_agua TEXT,
  potencialidades TEXT,
  deficiencias TEXT,
  classe_zarc INTEGER
);

-- ZARC - identifica época de plantio
-- da cultura principal do sistema
-- Considera risco de 20%.
-- Se município não tiver janela, vai p/ risco de 30%

CREATE TABLE zarc (
  id INTEGER PRIMARY KEY NOT NULL,
  id_sistema INTEGER,
  id_solo INTEGER,
  id_municipio INTEGER,
  inicio_plantio INTEGER,
  fim_plantio INTEGER,
  FOREIGN KEY(id_sistema) REFERENCES sistema(id_sistema),
  FOREIGN KEY(id_solo) REFERENCES solo(id),
  FOREIGN KEY(id_municipio) REFERENCES municipio(geocodigo)
);

CREATE TABLE municipio (
  geocodigo INTEGER PRIMARY KEY NOT NULL,
  nome TEXT,
  uf TEXT,
  bioma TEXT,
  geometria TEXT -- depois vira geom
);
