-- Exemplo de consultas a base de dados

-- Exemplo de consulta
-- se retirar o comentário
-- da problema ao criar o banco na linha de comando
-- listar espécies (nome científico) de todos os sistemas
 -- select id_sistema, nome_cientifico, posicao_especie
	-- from sistema
	-- natural join sistema_especie
	-- natural join especie_vegetal;


-- consulta com o nome popular.
-- Pegando o primeiro resultado do nome popular
-- Outros bancos aceitam usar o first como função agregadora.
-- no SQLite é preciso buscar coluna com o menor ROWID
--
-- select id_sistema, nome_pop, nome_cientifico, posicao_especie
-- 	from sistema
-- 	natural join sistema_especie
-- 	natural join especie_vegetal
-- 	natural join nome_popular
-- 	group by id_sistema, nome_cientifico, posicao_especie
-- 	having min(nome_popular.ROWID)

-- Procura de sistema com espécie vegetal específica por nome popular
-- select id_sistema, nome
--  	from sistema
-- 	natural join sistema_especie
-- 	natural join especie_vegetal
-- 	natural join nome_popular
-- 	where nome_pop = 'umbu'

-- busca sistema por nome popular de espécia - usando nome popular alternativo
-- select id_sistema, nome
--  	from sistema
-- 	natural join sistema_especie
-- 	natural join especie_vegetal
-- 	natural join nome_popular
-- 	where nome_pop = 'deserto-verde'
