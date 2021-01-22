-- Script para inserir dados no banco
-- e testar algumas consultas

-- Inserindo valores no banco
INSERT INTO [especie_vegetal] ([id_especie],[nome_cientifico],[estrato], [exigencia_fert], [ciclo], [alimento_humano], [medicinal],[bioma_caract])
VALUES
(1, 'Zea Mays', 'alto', 'media/alta', 'semestral', 'sim', 'nao', 'indet'),
(2, 'Cajanus cajon', 'alto', 'media', 'bianual', 'sim', 'sim', 'cerrado/caatinga'),
(3, 'Crotalaria sp', 'emergente', 'media', 'anual', 'nao', 'sim', 'cerrado/caatinga'),
(4, 'Gliricidia Sepium', 'alto', 'alta', 'perene', 'nao', 'sim', 'cerrado/caatinga');

INSERT INTO [nome_popular] ([id_nome_pop],[id_especie],[nome_pop])
VALUES
(1, 1, 'milho'),
(2, 2, 'feijao guandu'),
(3, 2, 'guandu'),
(4, 2, 'feijao de arvore'),
(5, 3, 'crotalaria'),
(6, 3, 'crotalaria juncea'),
(7, 4, 'gliricidia'),
(8, 4, 'coiote'),
(9, 4, 'madre de cacau'),
(10, 4, 'mata raton');

INSERT INTO [sistema] ([id_sistema],[descricao],[complexidade], [referencias], [cartilha])
VALUES
(1, 'Sistema consorciado de milho como cultura principal, guandu junto com milho na linha, crotalaria como cultura de entrelinha e gliricidia como planta adubadora', 'Complexidade nivel 2: 2L,1E,1A', 'Sistema Santa Brígida – Tecnologia Embrapa: Consorciação de Milho com Leguminosas, EFEITO DA Gliricidia sepium SOBRE
NUTRIENTES DO SOLO, MICROCLIMA E
PRODUTIVIDADE DO MILHO EM SISTEMA
AGROFLORESTAL NO AGRESTE PARAIBANO', 'cartilha 1');

INSERT INTO [sistema_especie] ([id_sistema_especie],[id_sistema],[id_especie],[funcao_planta],[espacamento_entreplantas],[espacamento_entrelinhas])
VALUES
(1, 1, 1, 'cultura principal', '0,2', '1,0'),
(2, 1, 2, 'consorcio-linha', 'nd', 'nd'),
(3, 1, 3, 'consorcio-entrelinha', 'nd', 'nd'),
(4, 1, 4, 'consorcio-adubadora', 'nd', 'nd');


-- Exemplo de consulta
-- se retirar o comentário
-- da problema ao criar o banco na linha de comando
 -- select id_sistema, nome_cientifico, funcao_planta
	-- from sistema
	-- natural join sistema_especie
	-- natural join especie_vegetal;


-- consulta com o nome popular.
-- Pegando o primeiro resultado do nome popular
-- Outros bancos aceitam usar o first como função agregadora.
-- no SQLite é preciso buscar coluna com o menor ROWID
--
-- select id_sistema, nome_pop, nome_cientifico, funcao_planta
-- 	from sistema
-- 	natural join sistema_especie
-- 	natural join especie_vegetal
-- 	natural join nome_popular
-- 	group by id_sistema, nome_cientifico, funcao_planta
-- 	having min(nome_popular.ROWID)
