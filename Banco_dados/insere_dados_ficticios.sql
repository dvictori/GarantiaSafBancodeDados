-- Script para inserir dados no banco
-- e testar algumas consultas
-- dados são fictícios e podem conter erros

-- Inserindo valores no banco
INSERT INTO especie_vegetal (id_especie, nome_cientifico, estrato, resiliencia, ciclo_min, ciclo_max,
alimento_humano, medicinal, bioma_caract)
VALUES
(1, 'Zea mays', 'emergente', 1, 90, 120, 'sim', 'nao', null),
(2, 'Vigna unguiculata', 'alto', 2, 90, 90, NULL, NULL, NULL),
(3, 'Cajanus cajon', 'alto', 2, 180, 540, 'sim', 'sim', 'Cerrado / caatinga'),
(4, 'Phaseolos vulgaris', 'baixo', 2, 80, 90, 'sim', 'não', NULL),
(5, 'Crotalaria juncea', 'emergente', 2, 120, 120, 'não', 'sim', 'Cerrado / caatinga'),
(6, 'Megathyrsus maximus', 'médio', 2, 180, 180, NULL, NULL, NULL),
(7, 'Phaseolos vulgaris', 'baixo', 2, 50, 80, 'sim', 'nao', NULL),
(8, 'Vicia faba', 'médio', 2, 100, 240, 'sim', 'não', NULL),
(9, 'Gossypium hirstum', 'alto', 2, 140, 180, 'não', 'não', NULL),
(10, 'Crotalaria spectabilis', 'emergente', 2, 120, 120, 'não', 'não', NULL),
(11, 'Manihot esculenta', 'alto', 3, 180, 720, 'sim', 'não', NULL),
(12, 'Anadenanthera macrocarpa', 'emergente', 3, 1095, 1095, NULL, NULL, NULL),
(13, 'Leucaena leucocephala', 'alto', 3, 360, 360, 'não', NULL, NULL),
(14, 'Licania rigida', 'medio', 3, 1095, 1095, NULL, NULL, NULL),
(15, 'Arachis hypogaea', 'baixo', 3, 180, 180, NULL, NULL, NULL),
(16, 'Ananas comosus', 'baixo', 3, 360, 360, NULL, NULL, NULL),
(17, 'Amburana cearensis', 'alto', 3, 1095, 1095, NULL, NULL, NULL),
(18, 'Agave sisalana', 'baixo', 3, 1095, 2920, NULL, NULL, NULL),
(19, 'Cereus jamacaru', 'alto', 3, 1095, 1095, NULL, NULL, NULL),
(20, 'Spondias tuberosa', 'medio', 3, 2920, 2920, NULL, NULL, NULL);


INSERT INTO nome_popular (id_nome_pop, id_especie, nome_pop)
VALUES
(1, 1, 'milho'),
(2, 2, 'feijao de corda'),
(3, 2, 'feijao caupi'),
(4, 2, 'feijao fradinho'),
(5, 3, 'feijao guandu'),
(6, 3, 'guandu'),
(7, 3, 'feijao de arvore'),
(8, 4, 'feijao faseolo'),
(9, 4, 'feijao de arranque'),
(10, 4, 'feijao carioca'),
(11, 4, 'feijao preto'),
(12, 5, 'crotalaria'),
(13, 5, 'crotalaria juncea'),
(14, 6, 'campim mombaça'),
(15, 6, 'mombaça'),
(16, 7, 'vagem rasteira'),
(17, 8, 'fava'),
(18, 8, 'feijao manteiga'),
(19, 8, 'feijao espadinho'),
(20, 8, 'feijao favona'),
(21, 8, 'feijao verde'),
(22, 9, 'algodao'),
(23, 10, 'crotalaria'),
(24, 10, 'crotalaria spectabilis'),
(25, 11, 'mandioca'),
(26, 11, 'macaxeira'),
(27, 11, 'aipim'),
(28, 12, 'angico'),
(29, 12, 'arapiraca'),
(30, 12, 'curupai'),
(31, 13, 'leucena'),
(32, 13, 'arvore-do-conflito'),
(33, 13, 'deserto-verde'),
(34, 14, 'oiticica'),
(35, 15, 'amendoim'),
(36, 16, 'abacaxi'),
(37, 17, 'emburana-de-cheiro'),
(38, 17, 'emburana'),
(39, 17, 'imburana'),
(40, 18, 'sisal'),
(41, 18, 'agave'),
(42, 19, 'mandacaru'),
(43, 20, 'umbu');

INSERT INTO sistema (id_sistema, nome, descricao, complexidade, referencias, cartilha)
VALUES
(1, 'SAF Nova Olinda (CE): Milho, Fava, Vagem', 'Milho e fava são intercalados nas linhas, com 0,5 m entre plantas e 1,5 m entre linhas.
Vagem (feijão de arranque) nas entrelinhas, com espaçamento de 0,3 m', 'baixa', 'Artigo SAF Nova Olinda (CE)', 'cartilha 1'),
(2, 'Milho, Angico, Leucena, Fava, Umbu, Amendoim e Abacaxi', 'Linha central composta por sequencia de Angico, Umbu, Leucena, Umbu, com espaçamento de 1,5 m entre árvores.
  Linhas secundárias com milho e fava intercalados, com 0,5 m de espaçamento entre plantas e distntes 0,75 m da linha central.
  Bordaduras com 3 linhas contínuas de Amendoim, Abacaxi e Amendoim. Espaçamento entre plantas e entre linhas de 0,5 m',
'alta', 'SAF CNPC Documentos 130', 'cartilha 2');

INSERT INTO sistema_especie (id_sistema_especie, id_sistema, id_especie, posicao_especie,
  espacamento_entreplantas, espacamento_entrelinhas)
VALUES
(1, 1, 1, 'linha', 1, 1.5),
(2, 1, 8, 'linha', 1, 1.5),
(3, 1, 7, 'entrelinha', 0.3, 0.3),
(4, 2, 1, 'linha 2', 1, 1.5),
(5, 2, 8, 'linha 2', 1, 1.5),
(6, 2, 12, 'linha 1', 6, 3),
(7, 2, 13, 'linha 1', 6, 3),
(8, 2, 20, 'linha 1', 3, 3),
(9, 2, 15, 'bordadura', 0.5, 0.5),
(10, 2, 16, 'bordadura', 0.5, NULL);
