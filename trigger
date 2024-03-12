
create trigger trg_status_venda_vendido after insert
on vendas_automovel
for each row
update automovel
set aut_status = 'Vendido'
where aut_id = new.venaut_fk_automovel;

create trigger trg_status_venda_disponivel after delete
on vendas_automovel
for each row
update automovel
set aut_status = 'Disponível'
where aut_id = old.venaut_fk_automovel;



# ALUGUEL-------------------------------------
create trigger trg_status_aluguel_insert after insert
on aluguel_automovel 
for each row
update automovel
set aut_status = 'Alugado'
where aut_id = new.aluaut_fk_automovel;

create trigger trg_status_aluguel_delete after delete
on aluguel_automovel
for each row
update automovel
set aut_status = 'Disponível'
where aut_id = old.aluaut_fk_automovel;

create trigger trg_status_aluguel_update after update
on aluguel
for each row
update automovel
set aut_status = 'Disponível'
where aut_id = (
select aluaut_fk_automovel
from aluguel_automovel
join aluguel on alu_id = aluaut_fk_aluguel
where alu_id = aluaut_fk_aluguel and alu_status = 'Devolvido' 
);
-- -----------------------------------

