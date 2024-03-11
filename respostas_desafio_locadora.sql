# ==============| RESPOSTAS |==============

#1)Listar todos os carros disponíveis na concessionária.
select * from automovel
where aut_status = 'Disponível';



#2)Contar o número total de carros de uma determinada marca.
select count(*) as total_de_carros, mar_nome as narca
from automovel
join modelo on aut_fk_modelo = mod_id
join marca on mod_fk_marca = mar_id
where mod_fk_marca = 2;



#3)Calcular a média de preço dos carros disponíveis.
select avg(preco_venda) as media_preco_venda
from automovel;



#4)Encontrar o carro mais caro na concessionária.
select max(preco_venda) as valor_carro_mais_caro, aut_placa as PLACA, mod_nome as MODELO, mar_nome as MARCA
from automovel
join modelo on mod_id = aut_fk_modelo
join marca on mar_id = mod_fk_marca;



#5)Identificar o número total de carros vendidos no mês.
select count(*) as TOTAL_VENDIDOS_MES_MARÇO
from vendas_automovel
join vendas on ven_id = venaut_fk_vendas
join automovel on aut_id = venaut_fk_automovel
where aut_status = 'Vendido' and extract(month from vendas.ven_data_compra) = 03;



#6)Calcular o lucro total da concessionária no mês.
select sum(rec_valor) as LUCRO_TOTAL_MARÇO
from recebimento
where extract(month from rec_data) = 03;



#7)Identificar o vendedor que mais vendeu carros no mês.
select ven_nome
from vendedor
where vend_id in;

select count(venaut_id) as QUANT_VENDAS_REALIZADAS, vend_nome
from vendas_automovel
join vendas on venaut_fk_vendas = ven_id
join vendedor on ven_fk_vendedor = vend_id
where ven_id = venaut_fk_vendas and vend_id = ven_fk_vendedor
group by vend_nome
;

#8)Encontrar os clientes que mais compraram carros na concessionária.

#9)Identificar os carros mais vendidos por categoria (por exemplo, SUVs, sedans, etc.).

#10)Encontrar o mês com o maior número de vendas.
