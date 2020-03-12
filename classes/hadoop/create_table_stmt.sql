-- DDL: Data Definition Language --

-- create common table
CREATE TABLE financial_network
(
cnpj_origem int, 
cnpj_destino int, 
vlr decimal(36,2), 
qtd bigint, 
referencia int
);

-- create compressed 
CREATE TABLE financial_network
(
cnpj_origem int, 
cnpj_destino int, 
vlr decimal(36,2), 
qtd bigint, 
referencia int
)
STORED AS PARQUET;

-- create partitioned
set hive.exec.dynamic.partition.mode=nonstrict;

CREATE TABLE financial_network_partitioned
(
cnpj_origem int, 
cnpj_destino int, 
vlr decimal(36,2), 
qtd bigint
)
PARTITIONED BY (referencia int);

-- create partitioned AND bucketed.
set hive.enforce.bucketing = true;

CREATE TABLE financial_network
(
cnpj_origem int, 
cnpj_destino int, 
vlr decimal(36,2), 
qtd bigint
)
PARTITIONED BY (referencia int)
CLUSTERED BY (cnpj_origem) INTO 8 BUCKETS;




-- DML: Data Manipulation Language --

-- Inserting into a partitioned table.
-- dynamically
INSERT INTO financial_network_partitioned PARTITION(referencia) AS 
SELECT cnpj_origem,
	   cnpj_destino,
	   vlr,
	   qtd,
	   referencia
  FROM financial_network;

-- manually
INSERT INTO financial_network_partitioned PARTITION(referencia=2019) AS 
SELECT cnpj_origem,
	   cnpj_destino,
	   vlr,
	   qtd
  FROM financial_network WHERE referencia=2019;


