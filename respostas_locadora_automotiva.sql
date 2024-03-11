# ==============| RESPOSTAS |==============

#1)Listar todos os carros disponíveis na concessionária.
select * from automovel
where aut_status = 'Disponível';



#2)Contar o número total de carros de uma determinada marca.
select count(*) as QUANT_CARROS, mar_nome as MARCA
from automovel
join modelo on aut_fk_modelo = mod_id
join marca on mod_fk_marca = mar_id
group by mar_nome;



#3)Calcular a média de preço dos carros disponíveis.
select avg(preco_venda) as media_preco_venda
from automovel;



#4)Encontrar o carro mais caro na concessionária.
select max(preco_venda) as valor_carro_mais_caro, aut_placa as PLACA, mod_nome as MODELO, mar_nome as MARCA
from automovel
join modelo on mod_id = aut_fk_modelo
join marca on mar_id = mod_fk_marca;



#5)Identificar o número total de carros vendidos no mês.
select count(*) as TOTAL_VENDIDOS, extract(month from ven_data_compra) as MÊS
from vendas_automovel
join vendas on ven_id = venaut_fk_vendas
join automovel on aut_id = venaut_fk_automovel
where aut_status = 'Vendido'
group by ven_data_compra
order by ven_data_compra desc;



#6)Calcular o lucro total da concessionária no mês.
select sum(preco_venda - custo_compra) as LUCRO_TOTAL, extract(month from ven_data_compra) as MÊS
from vendas_automovel
join vendas on ven_id = venaut_fk_vendas
join automovel on aut_id = venaut_fk_automovel
where venaut_fk_automovel = aut_id
group by ven_data_compra
order by ven_data_compra desc;



#7)Identificar o vendedor que mais vendeu carros no mês.
select count(venaut_id) as QUANT_VENDAS_REALIZADAS, vend_nome
from vendas_automovel
join vendas on venaut_fk_vendas = ven_id
join vendedor on ven_fk_vendedor = vend_id
group by vend_nome
order by count(venaut_id) desc
;



#8)Encontrar os clientes que mais compraram carros na concessionária.
select count(venaut_id) as CLIENTES_MAIS_COMPRARAM, cli_nome
from vendas_automovel
join vendas on ven_id = venaut_fk_vendas
join cliente on cli_id = ven_fk_cliente
group by cli_nome
order by count(venaut_id) desc;




#9)Identificar os carros mais vendidos por categoria (por exemplo, SUVs, sedans, etc.).
select count(venaut_id) as QUANT_VENDIDOS, aut_categoria
from vendas_automovel
join automovel on venaut_fk_automovel = aut_id
group by aut_categoria
order by count(venaut_id) desc;



#10)Encontrar o mês com o maior número de vendas.
select count(ven_id) as QUANT_VENDAS, extract(month from ven_data_compra) as MÊS
from vendas
group by ven_data_compra
order by count(ven_id) desc;


