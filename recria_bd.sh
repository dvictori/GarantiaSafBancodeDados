#!/usr/bin/env bash
rm bd_garantia_safra.sqlite
sqlite3 bd_garantia_safra.sqlite < Banco_dados/cria_banco_praticas_GS.sql
sqlite3 bd_garantia_safra.sqlite < Banco_dados/insere_dados_ficticios.sql
