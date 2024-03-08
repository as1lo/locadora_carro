
create table forma_pagamento (
	pag_id int primary key auto_increment,
    pag_nome varchar(50) not null
);

create table recebimento (
	rec_id int primary key auto_increment,
    rec_fk_forma_pagamento int not null,
    rec_fk_vendas int not null,
    rec_fk_aluguel int not null,
    rec_data date not null,
    rec_valor float(10,2) not null
);

alter table recebimento add foreign key (rec_fk_forma_pagamento)
references forma_pagamento (pag_id);

alter table recebimento add foreign key (rec_fk_vendas)
references vendas (ven_id);

alter table recebimento add foreign key (rec_fk_aluguel)
references aluguel (alu_id);

create table modelo (
	mod_id int primary key auto_increment,
	mod_nome varchar(50),
	mod_fk_marca int
);

alter table modelo add foreign key (mod_fk_marca)
references marca(mar_id);

create table marca (
	mar_id int primary key auto_increment,
    mar_nome varchar(50)
);

create table aluguel_automovel (
	aluaut_id int primary key auto_increment,
    aluaut_fk_aluguel int not null,
    aluaut_fk_automovel int not null,
    aluaut_valor float(10,2),
    aluaut_km_retirada int
);

alter table aluguel_automovel add foreign key (aluaut_fk_automovel)
references automovel(aut_id);

alter table aluguel_automovel add foreign key (aluaut_fk_aluguel)
references aluguel(alu_id);

create table aluguel (
	alu_id int primary key auto_increment,
    alu_data_retirada date,
    alu_data_entrega date,
    alu_fk_forma_pagamento int,
    alu_total float(10,2) not null,
    alu_parcelas int not null,
    alu_obs_entrega varchar(200),
    alu_fk_cliente int not null,
    alu_fk_vendedor int not null
);

alter table aluguel add foreign key (alu_fk_forma_pagamento)
references forma_pagamento(pag_id);

alter table aluguel add foreign key (alu_fk_cliente)
references cliente(cli_id);

alter table aluguel add foreign key (alu_fk_vendedor)
references vendedor (vend_id);

create table vendas_automovel (
	venaut_id int primary key auto_increment,
    venaut_fk_vendas int not null,
    venaut_fk_automovel int not null,
    venaut_data_retirada date not null,
    venaut_valor float(10,2)
);

alter table vendas_automovel add foreign key (venaut_fk_automovel)
references automovel(aut_id);

alter table vendas_automovel add foreign key (venaut_fk_vendas)
references vendas (ven_id);

create table vendas (
	ven_id int primary key auto_increment,
    ven_situacao varchar(50) not null,
    ven_data_compra date,
    ven_fk_forma_pagamento int,
    ven_total float(10,2) not null,
    ven_parcelas int not null,
    ven_entrada float,
    ven_fk_cliente int not null,
    ven_fk_vendedor int not null
);

alter table vendas add foreign key (ven_fk_cliente)
references cliente(aut_id);

alter table vendas add foreign key (ven_fk_vendedor)
references vendedor(vend_id);

create table cliente (
	cli_id int primary key auto_increment,
    cli_nome varchar(100) not null,
    cli_contato varchar(50) not null,
    cli_cpf varchar(50) not null,
    cli_cep varchar(50),
    cli_cidade varchar(50),
    cli_rua varchar(50),
    cli_bairro varchar(50),
    cli_numero int,
    cli_cnh varchar(50)
    );

create table automovel (
	aut_id int primary key auto_increment,
	aut_tipo_automovel varchar(50) not null,
    aut_categoria varchar(50),
    aut_placa varchar(10) not null,
    aut_fk_modelo int not null,
    aut_cor varchar(50) not null,
    aut_observacao varchar(200),
    aut_fabricacao date,
    aut_fk_fornecedor int not null
);

alter table automovel add foreign key (aut_fk_fornecedor)
references fornecedor(for_id);

alter table automovel add foreign key (aut_fk_modelo)
references modelo(mod_id);

create table vendedor (
	vend_id int primary key auto_increment,
    vend_nome varchar(50) not null,
    vend_cpf varchar(20) not null,
	vend_cep varchar(50) not null,
    vend_cidade varchar(50),
    vend_rua varchar(50),
    vend_bairro varchar(50),
    vend_numero int,
    vend_contato varchar(15) not null,
    vend_comissao float(10,2)
);

create table fornecedor (
	for_id int primary key auto_increment,
    for_nome varchar(100) not null,
    for_cnpj varchar(20) not null,
    for_contato varchar(20),
    for_cep varchar(50),
    for_pais varchar(50),
    for_cidade varchar(50),
    for_estado varchar(50),
    for_rua varchar(50),
    for_bairro varchar(50),
    for_numero varchar(50)
);


insert into cliente(cli_nome, cli_contato, cli_cpf, cli_cep, cli_cidade, cli_rua, cli_bairro, cli_numero, cli_cnh)
values ('Aislan Mota de Oliveira', '75992289795', '09513368513', '44009144', 'Feira de Santana', 'E', 'Calumbi', '10', '7846542');

insert into cliente(cli_nome, cli_contato, cli_cpf, cli_cep, cli_cidade, cli_rua, cli_bairro, cli_numero, cli_cnh)
values ('Zubeia', '40028922', '98127304', '09170342', 'Feira de Santana', 'C', 'Muchila', '12', '8273920');

update cliente
set cli_logradouro = 'Cam. B5'
where cli_id = 2;

insert into marca (mar_nome)
values ('Fiat');

insert into marca(mar_nome)
values ('Citroen');


insert into fornecedor(for_nome, for_cnpj, for_contato, for_cep, for_pais, for_cidade, for_estado, for_rua, for_bairro, for_numero)
values ('Radar Veículos Multimarcas', '0938871892', '75992289795', '234234512', 'Brasil', 'Uberaba', 'MG', '45Z', 'Frinho', '23');
