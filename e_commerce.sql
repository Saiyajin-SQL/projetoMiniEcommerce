/****************** PROJETO MINI E-COMMERCE ******************/

/*

        -- Bem Vindos Sayajins --

⣿⣿⠿⠿⠿⠿⣿⣷⣂⠄⠄⠄⠄⠄⠄⠈⢷⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿
⣷⡾⠯⠉⠉⠉⠉⠚⠑⠄⡀⠄⠄⠄⠄⠄⠈⠻⠿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿
⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⡀⠄⠄⠄⠄⠄⠄⠄⠄⠉⠻⣿⣿⣿⣿⣿⣿⣿⣿⣿
⠄⠄⠄⠄⠄⠄⠄⠄⠄⢀⠎⠄⠄⣀⡀⠄⠄⠄⠄⠄⠄⠄⠘⠋⠉⠉⠉⠉⠭⠿⣿
⡀⠄⠄⠄⠄⠄⠄⠄⠄⡇⠄⣠⣾⣳⠁⠄⠄⢺⡆⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄
⣿⣷⡦⠄⠄⠄⠄⠄⢠⠃⢰⣿⣯⣿⡁⢔⡒⣶⣯⡄⢀⢄⡄⠄⠄⠄⠄⠄⣀⣤⣶
⠓⠄⠄⠄⠄⠄⠸⠄⢀⣤⢘⣿⣿⣷⣷⣿⠛⣾⣿⣿⣆⠾⣷⠄⠄⠄⠄⢀⣀⣼⣿             
⠄⠄⠄⠄⠄⠄⠄⠑⢘⣿⢰⡟⣿⣿⣷⣫⣭⣿⣾⣿⣿⣴⠏⠄⠄⢀⣺⣿⣿⣿⣿
⣿⣿⣿⣿⣷⠶⠄⠄⠄⠹⣮⣹⡘⠛⠿⣫⣾⣿⣿⣿⡇⠑⢤⣶⣿⣿⣿⣿⣿⣿⣿
⣿⣿⣿⣯⣤⣤⣤⣤⣀⣀⡹⣿⣿⣷⣯⣽⣿⣿⡿⣋⣴⡀⠈⣿⣿⣿⣿⣿⣿⣿⣿
⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣾⣝⡻⢿⣿⡿⠋⡒⣾⣿⣧⢰⢿⣿⣿⣿⣿⣿⣿⣿
⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⡿⠃⣏⣟⣼⢋⡾⣿⣿⣿⣘⣔⠙⠿⠿⠿⣿⣿⣿
⣿⣿⣿⣿⣿⣿⣿⣿⣿⠿⠿⣛⡵⣻⠿⠟⠁⠛⠰⠿⢿⠿⡛⠉⠄⠄⢀⠄⠉⠉⢉
⣿⣿⣿⣿⡿⢟⠩⠉⣠⣴⣶⢆⣴⡶⠿⠟⠛⠋⠉⠩⠄⠉⢀⠠⠂⠈⠄⠐⠄⠄⠄



-- Canal Sayajin SQL    >> https://www.youtube.com/channel/UC6aR2nPTkD6GECmEjQBEWtQ
-- Github               >> https://github.com/Sayajin-SQL
-- Email                >> sayajinsql@outloook.com

.
.
.
.
.
.
.
.
.
.
.
.
.
*/




--------- SUMÁRIO --------------------

-- 1. Modelagem
-- 2. Criação de tabelas
-- 3. Insert
-- 4. Update
-- 5. Delete
-- 6. Select | Views
-- 7. Funções
-- 8. Triggers
-- 9. Procedimentos Armazenados
-- 10. Cursores
-- 11. Joins
-- 12. Controle de Usuários



-- --------------- MODELO RELACIONAL ------------------------

-- 1. Entidades 

/*

    -- 1.1 Produto      (Forte)
    -- 1.2 Cliente      (Forte)
    -- 1.3 Pedido       (Fraca)
    -- 1.4 Carrinho     (Associativa)



     PRODUTO --N---N-- PEDIDO -N---1- CLIENTE  
                 |
                 |
              CARRINHO


*/


-- --------------- TABELAS ------------------------

-- 1 - Produto --                                                                           

    -- 1.1 - ID -- PK
    -- 1.2 - Nome
    -- 1.3 - Preço
    -- 1.4 - Custo
    -- 1.5 - Estoque

    /* Tabela */

CREATE TABLE tbl_produto (

    id_produto          INT                 NOT NULL        ,
    nome_produto        VARCHAR2  (50)      NOT NULL        ,
    preco_produto       DECIMAL   (9,2)     NOT NULL        ,
    custo_produto       DECIMAL   (9,2)     NOT NULL        ,
    estoque_produto     INT                     NULL        ,

    CONSTRAINT      pk_id_produto         PRIMARY KEY     (id_produto)      

)
;

    /* Sequência */

CREATE SEQUENCE sq_id_produto
START WITH      1
INCREMENT BY    1
CACHE           20
;

    /* Informações */

select 
    column_name, data_type,data_precision,data_scale,data_length
from   
    user_tab_columns
where  
    table_name = UPPER('tbl_produto')
    ;

-- ------------------------ // ------------------------

-- 2 - Cliente --

    -- 2.1 - ID -- PK
    -- 2.2 - Nome
    -- 2.3 - Sobrenome
    -- 2.4 - Sexo -- CK
    -- 2.5 - Nascimento
    -- 2.6 - Celular -- U | CK
    -- 2.7 - Email -- U

    /* Tabela */

CREATE TABLE tbl_cliente (

    id_cliente          INT                 NOT NULL        ,
    nome_cliente        VARCHAR2  (50)      NOT NULL        ,
    sobrenome_cliente   VARCHAR2  (80)      NOT NULL        ,
    sexo_cliente        CHAR       (1)      NOT NULL        ,
    nascimento_cliente  DATE                NOT NULL        ,
    celular_cliente     CHAR      (14)      NOT NULL        ,
    email_cliente       VARCHAR2  (80)      NOT NULL        ,

    CONSTRAINT      pk_id_cliente         PRIMARY KEY     (id_cliente)                  ,
    CONSTRAINT      u_celular_cliente     UNIQUE          (celular_cliente)             ,
    CONSTRAINT      u_email_cliente       UNIQUE          (email_cliente)               ,
    CONSTRAINT      ck_sexo               CHECK           (sexo_cliente in ('M','F'))   , 
    CONSTRAINT      ck_celular            CHECK           (REGEXP_LIKE (celular_cliente,'[(][0-9][0-9][)][9][0-9][0-9][0-9][0-9][-][0-9][0-9][0-9][0-9]'))   
)
;


    /* Sequência */

CREATE SEQUENCE sq_id_cliente
START WITH      1
INCREMENT BY    1
CACHE           20
;

    /* Informações */

select 
    column_name, data_type,data_precision,data_scale,data_length
from   
    user_tab_columns
where  
    table_name = UPPER('tbl_cliente')
    ;

-- ------------------------ // ------------------------

-- 3 - Pedido --

    -- 3.1 - ID -- PK
    -- 3.2 - ID do Cliente -- FK
    -- 3.3 - Situação do pagamento -- CK
    -- 3.4 - Data


    /* Tabela */

CREATE TABLE tbl_pedido (

    id_pedido           INT                 NOT NULL        ,
    id_cliente          INT                 NOT NULL        ,
    situacao_pag        CHAR       (1)          NULL        ,
    data_pedido         DATE                NOT NULL        ,

    CONSTRAINT      pk_id_pedido          PRIMARY KEY     (id_pedido)                  ,
    CONSTRAINT      fk_id_cliente         FOREIGN KEY     (id_cliente)
        REFERENCES  tbl_cliente (id_cliente) ON DELETE CASCADE                          ,
    CONSTRAINT      ck_situacao_pag       CHECK           (situacao_pag = 'P')   
)
;

    /* Sequência */

CREATE SEQUENCE seq_id_pedido
START WITH      1
INCREMENT BY    1
CACHE           20
;

    /* Informações */

select 
    column_name, data_type,data_precision,data_scale,data_length
from   
    user_tab_columns
where  
    table_name = UPPER('tbl_pedido')
    ;

-- ------------------------ // ------------------------

-- 4 - Carrinho --

    -- 4.1 - ID do Pedido -- PK | FK 
    -- 4.2 - ID do Produto -- PK | FK
    -- 4.3 - Qnt do Produto -- CK
    -- 4.4 - Custo do Produto
    -- 4.5 - Preço do Produto

    /* Tabela */

CREATE TABLE tbl_carrinho (

    id_pedido          INT                 NOT NULL        ,
    id_produto         INT                 NOT NULL        ,
    qnt_Produto        INT                 NOT NULL        ,
    preco_produto      DECIMAL   (9,2)     NOT NULL        ,
    custo_produto      DECIMAL   (9,2)     NOT NULL        ,

    CONSTRAINT      pk_id_pedido_carrinho          PRIMARY KEY     (id_pedido,id_produto)                  ,

    CONSTRAINT      fk_id_pedido_carrinho         FOREIGN KEY     (id_pedido)
        REFERENCES  tbl_pedido (id_pedido) ON DELETE CASCADE                                                ,
    
    CONSTRAINT      fk_id_produto_carrinho         FOREIGN KEY     (id_produto)
        REFERENCES  tbl_produto (id_produto) ON DELETE CASCADE                                              ,
    
    CONSTRAINT      ck_qnt_Produto       CHECK           (qnt_Produto > 0)   
)
;


    /* Informações */

select 
    column_name, data_type,data_precision,data_scale,data_length
from   
    user_tab_columns
where  
    table_name = UPPER('tbl_carrinho')
    ;





-- --------------- INSERT ------------------------

-- Produtos --

-- Inserindo produtos --

-- Produto 1 --

-- Informações --

-- ID       : 1
-- Nome     : Produto_1
-- Preço    : R$ 99,99
-- Custo    : R$ 50,99
-- Estoque  : 10 unid

-- SQL --

INSERT INTO 
    ADMIN.TBL_PRODUTO (ID_PRODUTO,NOME_PRODUTO,PRECO_PRODUTO,CUSTO_PRODUTO,ESTOQUE_PRODUTO) 
VALUES 
    (sq_id_produto.nextval,'Produto_1',99.99,50.99,10);

-- Produto 2 --

-- Informações --

-- ID       : 2
-- Nome     : Produto_2
-- Preço    : R$ 199,99
-- Custo    : R$ 150,99
-- Estoque  : 5 unid

-- SQL --

INSERT INTO 
    ADMIN.TBL_PRODUTO (ID_PRODUTO,NOME_PRODUTO,PRECO_PRODUTO,CUSTO_PRODUTO,ESTOQUE_PRODUTO) 
VALUES 
    (sq_id_produto.nextval,'Produto_2',199.99,150.99,5);

-- Produto 3 --

-- Informações --

-- ID       : 3
-- Nome     : Produto_3
-- Preço    : R$ 299,99
-- Custo    : R$ 250,99
-- Estoque  : 6 unid

INSERT INTO 
    ADMIN.TBL_PRODUTO (ID_PRODUTO,NOME_PRODUTO,PRECO_PRODUTO,CUSTO_PRODUTO,ESTOQUE_PRODUTO) 
VALUES 
    (sq_id_produto.nextval,'Produto_3',299.99,250.99,6);

-- Produto 4 --

-- Informações --

-- ID       : 4
-- Nome     : Produto_4
-- Preço    : R$ 399,99
-- Custo    : R$ 200,99
-- Estoque  : 5 unid

-- SQL --

INSERT INTO 
    ADMIN.TBL_PRODUTO (ID_PRODUTO,NOME_PRODUTO,PRECO_PRODUTO,CUSTO_PRODUTO,ESTOQUE_PRODUTO) 
VALUES 
    (sq_id_produto.nextval,'Produto_4',399.99,200.99,5);

-- Produto 5 --

-- Informações --

-- ID       : 5
-- Nome     : Produto_5
-- Preço    : R$ 259,99
-- Custo    : R$ 230,99
-- Estoque  : 0 unid

-- SQL --

INSERT INTO 
    ADMIN.TBL_PRODUTO (ID_PRODUTO,NOME_PRODUTO,PRECO_PRODUTO,CUSTO_PRODUTO,ESTOQUE_PRODUTO) 
VALUES 
    (sq_id_produto.nextval,'Produto_5',259.99,230.99,NULL);


-- Comitando inserts --

COMMIT;

-- Retornando tabela --

SELECT * FROM tbl_produto ORDER BY id_Produto;


-- ------------------------ // ------------------------

-- Cliente --

-- Inserindo clientes --

-- Cliente 1 --

INSERT INTO 
    ADMIN.TBL_CLIENTE (ID_CLIENTE,NOME_CLIENTE,SOBRENOME_CLIENTE,SEXO_CLIENTE,NASCIMENTO_CLIENTE,CELULAR_CLIENTE,EMAIL_CLIENTE) 
VALUES 
    (sq_id_cliente.nextval,'Cliente_1','Sobrenome_2','M',TO_DATE('1979-06-04','YYYY-MM-DD'),'(99)99999-9999','Cliente01@xxxx.com');

-- Cliente 2 --

INSERT INTO 
    ADMIN.TBL_CLIENTE (ID_CLIENTE,NOME_CLIENTE,SOBRENOME_CLIENTE,SEXO_CLIENTE,NASCIMENTO_CLIENTE,CELULAR_CLIENTE,EMAIL_CLIENTE) 
VALUES 
    (sq_id_cliente.nextval,'Cliente_2','Sobrenome_2','F',TO_DATE('1969-12-09','YYYY-MM-DD'),'(99)99999-9990','Cliente02@xxxx.com');

-- Cliente 3 --

INSERT INTO 
    ADMIN.TBL_CLIENTE (ID_CLIENTE,NOME_CLIENTE,SOBRENOME_CLIENTE,SEXO_CLIENTE,NASCIMENTO_CLIENTE,CELULAR_CLIENTE,EMAIL_CLIENTE) 
VALUES 
    (sq_id_cliente.nextval,'Cliente_3','Sobrenome_3','M',TO_DATE('1999-11-11','YYYY-MM-DD'),'(99)99999-9991','Cliente03@xxxx.com');

-- Cliente 4 --

INSERT INTO 
    ADMIN.TBL_CLIENTE (ID_CLIENTE,NOME_CLIENTE,SOBRENOME_CLIENTE,SEXO_CLIENTE,NASCIMENTO_CLIENTE,CELULAR_CLIENTE,EMAIL_CLIENTE) 
VALUES 
    (sq_id_cliente.nextval,'Cliente_4','Sobrenome_4','F',TO_DATE('1987-05-01','YYYY-MM-DD'),'(99)99999-9992','Cliente04@xxxx.com');

-- Cliente 5 --

INSERT INTO 
    ADMIN.TBL_CLIENTE (ID_CLIENTE,NOME_CLIENTE,SOBRENOME_CLIENTE,SEXO_CLIENTE,NASCIMENTO_CLIENTE,CELULAR_CLIENTE,EMAIL_CLIENTE) 
VALUES 
    (sq_id_cliente.nextval,'Cliente_5','Sobrenome_5','M',TO_DATE('19-12-1995','dd-mm-yyyy'),'(99)99999-9993','Cliente05@xxxx.com');

-- Comitando inserts --

COMMIT;

-- Retornando tabela de clientes --

SELECT * FROM tbl_cliente ORDER BY id_cliente;

-- ------------------------ // ------------------------

-- Pedido + Carrinho --

-- Pedido 01 -- Pendente --

INSERT INTO 
    ADMIN.TBL_PEDIDO (ID_PEDIDO,ID_CLIENTE,SITUACAO_PAG,DATA_PEDIDO) 
VALUES (
    seq_id_pedido.nextval,
    1,
    NULL,
    CURRENT_DATE + 1)
    ;

-- Adicionando produto 1 | 2 unid  --

INSERT INTO 
    ADMIN.TBL_CARRINHO (ID_PEDIDO,ID_PRODUTO,QNT_PRODUTO,PRECO_PRODUTO,CUSTO_PRODUTO) 
VALUES (
    1,
    1,
    2,
    (SELECT PRECO_PRODUTO FROM tbl_produto WHERE id_produto = 1),
    (SELECT CUSTO_PRODUTO FROM tbl_produto WHERE id_produto = 1))
    ;

-- Comitando inserts --

COMMIT;

-- Retornando tabela de pedidos e carrinho --

SELECT * FROM tbl_pedido    ORDER BY id_pedido;
SELECT * FROM tbl_carrinho  ORDER BY id_pedido;

-- ------------------------ // ------------------------

-- Pedido 02 -- Pago --

INSERT INTO 
    ADMIN.TBL_PEDIDO (ID_PEDIDO,ID_CLIENTE,SITUACAO_PAG,DATA_PEDIDO) 
VALUES (
    seq_id_pedido.nextval,
    2,
    'P',
    CURRENT_DATE + 2)
    ;

-- Adicionando produto 3 | 3 unid  --

INSERT INTO 
    ADMIN.TBL_CARRINHO (ID_PEDIDO,ID_PRODUTO,QNT_PRODUTO,PRECO_PRODUTO,CUSTO_PRODUTO) 
VALUES (
    2,
    3,
    3,
    (SELECT PRECO_PRODUTO FROM tbl_produto WHERE id_produto = 2),
    (SELECT CUSTO_PRODUTO FROM tbl_produto WHERE id_produto = 2))
    ;

-- Adicionando produto 4 | 1 unid  --

INSERT INTO 
    ADMIN.TBL_CARRINHO (ID_PEDIDO,ID_PRODUTO,QNT_PRODUTO,PRECO_PRODUTO,CUSTO_PRODUTO) 
VALUES (
    2,
    4,
    1,
    (SELECT PRECO_PRODUTO FROM tbl_produto WHERE id_produto = 4),
    (SELECT CUSTO_PRODUTO FROM tbl_produto WHERE id_produto = 4))
    ;

-- Comitando inserts --

COMMIT;

-- Retornando tabela de pedidos e carrinho --

SELECT * FROM tbl_pedido    ORDER BY id_pedido;
SELECT * FROM tbl_carrinho  ORDER BY id_pedido;


-- ------------------------ // ------------------------

-- Pedido 03 -- Pago --

INSERT INTO 
    ADMIN.TBL_PEDIDO (ID_PEDIDO,ID_CLIENTE,SITUACAO_PAG,DATA_PEDIDO) 
VALUES (
    seq_id_pedido.nextval,
    5,
    'P',
    CURRENT_DATE + 4)
    ;

-- Adicionando produto 1 | 1 unid --

INSERT INTO 
    ADMIN.TBL_CARRINHO (ID_PEDIDO,ID_PRODUTO,QNT_PRODUTO,PRECO_PRODUTO,CUSTO_PRODUTO) 
VALUES (
    3,
    1,
    1,
    (SELECT PRECO_PRODUTO FROM tbl_produto WHERE id_produto = 1),
    (SELECT CUSTO_PRODUTO FROM tbl_produto WHERE id_produto = 1))
    ;

-- Adicionando produto 4 | 1 unid  --

INSERT INTO 
    ADMIN.TBL_CARRINHO (ID_PEDIDO,ID_PRODUTO,QNT_PRODUTO,PRECO_PRODUTO,CUSTO_PRODUTO) 
VALUES (
    3,
    4,
    1,
    (SELECT PRECO_PRODUTO FROM tbl_produto WHERE id_produto = 4),
    (SELECT CUSTO_PRODUTO FROM tbl_produto WHERE id_produto = 4))
    ;


-- Comitando inserts --

COMMIT;

-- Retornando tabela de pedidos e carrinho --

SELECT * FROM tbl_pedido    ORDER BY id_pedido;
SELECT * FROM tbl_carrinho  ORDER BY id_pedido;



-- --------------- UPDATE ------------------------

-- Atualizar saída de estoque --

-- Simulando trigger de saída de estoque --

-- Pedido 01 >> produto 1 | 2 unid

SELECT id_produto,estoque_produto FROM tbl_produto  WHERE id_produto = 1 ;

UPDATE 
    tbl_produto
SET
    ESTOQUE_PRODUTO = ESTOQUE_PRODUTO - 2
WHERE
    ID_PRODUTO = 1
    ;

COMMIT ;

-- ------------------------ // ------------------------

-- Pedido 02 >> produto 3 | 3 unid + produto 4 | 1 unid --

SELECT id_produto,estoque_produto FROM tbl_produto  WHERE id_produto in (3,4) ;

UPDATE 
    tbl_produto
SET
    ESTOQUE_PRODUTO = ESTOQUE_PRODUTO - 3
WHERE
    ID_PRODUTO = 3
    ;

UPDATE 
    tbl_produto
SET
    ESTOQUE_PRODUTO = ESTOQUE_PRODUTO - 1
WHERE
    ID_PRODUTO = 4
    ;

COMMIT ;

-- ------------------------ // ------------------------

-- Pedido 03 >> produto 1 | 1 unid + produto 4 | 1 unid --

SELECT id_produto,estoque_produto FROM tbl_produto  WHERE id_produto in (1,4) ;

UPDATE 
    tbl_produto
SET
    ESTOQUE_PRODUTO = ESTOQUE_PRODUTO - 1
WHERE
    ID_PRODUTO = 1
    ;

UPDATE 
    tbl_produto
SET
    ESTOQUE_PRODUTO = ESTOQUE_PRODUTO - 1
WHERE
    ID_PRODUTO = 4
    ;

COMMIT ;



-- --------------- DELETE ------------------------

-- Cancelando um pedido  --

-- Pedidos Pendentes - Pedido 01  --

-- Verificar pedidos pendentes  --

SELECT 
    * 
FROM 
    tbl_Pedido 
WHERE 
    SITUACAO_PAG IS NULL 
    ;

-- ------------------------ // ------------------------

-- Verificar qnt no carrinho do pedido 01 --

SELECT 
    ID_PEDIDO,
    ID_PRODUTO,
    QNT_PRODUTO 
FROM 
    tbl_carrinho 
WHERE 
    id_pedido = 1 
    ; 

-- ------------------------ // ------------------------

-- Verificar qnt de estoque do produto 01 --

SELECT 
    ID_PRODUTO,
    ESTOQUE_PRODUTO 
FROM 
    tbl_produto 
WHERE 
    ID_PRODUTO = 1 
    ;

-- ------------------------ // ------------------------

-- Cancelar pedido 01 --

DELETE FROM tbl_pedido WHERE ID_PEDIDO = 1 ;

COMMIT ;

-- ------------------------ // ------------------------

-- Simulando trigger de entrada de estoque --

-- Registrar entrada estoque -- Produto 01 | 2 unid --

UPDATE 
    tbl_produto
SET
    ESTOQUE_PRODUTO = ESTOQUE_PRODUTO + 2
WHERE
    ID_PRODUTO = 1
    ;

COMMIT ;



-- --------------- VIEW ------------------------


--- CREATE OR REPLACE VIEW vw_tbl_produto AS
SELECT
    ID_PRODUTO                              AS  "ID"        ,
    NOME_PRODUTO                            AS  "Nome"      ,
    PRECO_PRODUTO                           AS  "Preço"     ,  
    CUSTO_PRODUTO                           AS  "Custo"     ,
    (PRECO_PRODUTO - CUSTO_PRODUTO)         AS "Faturamento",
    NVL(ESTOQUE_PRODUTO,0)                  AS  "Estoque"
FROM
    ADMIN.TBL_PRODUTO
ORDER BY
    id_produto
    ;

-- Tabela Produto | View Tabela Produto --

SELECT * FROM tbl_produto ORDER BY id_Produto;

SELECT * FROM vw_tbl_produto;

-- ------------------------ // ------------------------


-- CREATE OR REPLACE VIEW vw_tbl_cliente AS
SELECT
    ID_CLIENTE                                      AS  "ID"            ,
    NOME_CLIENTE                                    AS  "Nome"          ,
    SOBRENOME_CLIENTE                               AS  "Sobrenome"     ,
    CASE SEXO_CLIENTE
        WHEN 'M' THEN 'Masculino'
        WHEN 'F' THEN 'Feminino'
        END                                         AS  "Gênero"        ,
    TO_CHAR(NASCIMENTO_CLIENTE,'dd-mm-yyyy')        AS  "Nascimento"    ,
    trunc((months_between(sysdate, to_date(NASCIMENTO_CLIENTE,'dd/mm/yyyy')))/12) AS "Idade",
    CELULAR_CLIENTE                                 AS  "Celular"       ,
    EMAIL_CLIENTE                                   AS  "Email"
FROM
    ADMIN.TBL_CLIENTE
ORDER BY
    ID_CLIENTE
    ;

    -- Tabela Cliente | View Tabela Cliente --

SELECT * FROM tbl_cliente ORDER BY id_cliente;

SELECT * FROM vw_tbl_cliente;


-- ------------------------ // ------------------------


-- CREATE OR REPLACE VIEW vw_tbl_pedido AS
SELECT
    ID_PEDIDO                               AS  "Nº Pedido",
    ID_CLIENTE                              AS  "ID do Cliente",
    CASE 
        WHEN SITUACAO_PAG IS NULL THEN 'Pendente' 
        ELSE                            'Pago' 
        END                                 AS  "Situação",
    TO_CHAR(DATA_PEDIDO,'dd-mm-YYYY')       AS  "Data"
FROM
    ADMIN.TBL_PEDIDO
ORDER BY
    ID_PEDIDO
    ;

-- Tabela Pedido | View Tabela Pedido -- 

SELECT * FROM tbl_pedido ORDER BY  id_pedido;

SELECT * FROM vw_tbl_pedido;

-- ------------------------ // ------------------------

-- CREATE OR REPLACE VIEW vw_tbl_carrinho AS
SELECT
    ID_PEDIDO                                                       AS  "Nº do Pedido"      ,
    ID_PRODUTO                                                      AS  "Id do Produto"     ,
    QNT_PRODUTO                                                     AS  "Quantidade"        ,
    PRECO_PRODUTO                                                   AS  "Preço Unitário"    ,
    CUSTO_PRODUTO                                                   AS  "Custo Unitário"    ,
    CUSTO_PRODUTO*QNT_PRODUTO                                       AS  "Custo Total"       ,
    PRECO_PRODUTO*QNT_PRODUTO                                       AS  "Preço Total"       ,
    (PRECO_PRODUTO*QNT_PRODUTO)-(CUSTO_PRODUTO*QNT_PRODUTO)         AS  "Faturamento Total"       
FROM
    ADMIN.TBL_CARRINHO
ORDER BY
    ID_PEDIDO
    ;

-- Tabela Carrinho | View Tabela Carrinho -- 

SELECT * FROM tbl_carrinho ORDER BY id_pedido ;

SELECT * FROM vw_tbl_carrinho;

-- ------------------------ // ------------------------

-- Pedido + Carrinho --

--CREATE OR REPLACE VIEW vw_tbl_resumo_pedido AS
SELECT
    P1.ID_PEDIDO                               AS  "Nº Pedido"           ,
    SUM(C1.QNT_PRODUTO)                        AS  "Quantidade"          ,
    SUM(C1.PRECO_PRODUTO*C1.QNT_PRODUTO)            AS  "Preço Total"         ,
    CASE 
        WHEN P1.SITUACAO_PAG IS NULL THEN 'Pendente' 
        ELSE                            'Pago' 
        END                                    AS  "Situação"          ,
    TO_CHAR(P1.DATA_PEDIDO,'dd-mm-yyyy')       AS  "Data"

FROM
    ADMIN.TBL_PEDIDO    P1
INNER JOIN 
    ADMIN.TBL_CARRINHO  C1
ON
    P1.ID_PEDIDO = C1.ID_PEDIDO
GROUP BY
    P1.ID_PEDIDO,P1.SITUACAO_PAG,P1.DATA_PEDIDO
ORDER BY
    P1.ID_PEDIDO
    ;

SELECT * FROM vw_tbl_resumo_pedido;

-- ------------------------ // ------------------------

-- Faturamento pedidos --

-- CREATE OR REPLACE VIEW vw_tbl_faturamento_pedido AS
SELECT
    ID_PEDIDO                                                           AS  "Nº do Pedido"      ,
    SUM(QNT_PRODUTO)                                                    AS  "Quantidade"        ,
    SUM(CUSTO_PRODUTO*QNT_PRODUTO)                                      AS  "Custo Total"       ,
    SUM(PRECO_PRODUTO*QNT_PRODUTO)                                      AS  "Lucro Total"       ,
    SUM((PRECO_PRODUTO*QNT_PRODUTO)-(CUSTO_PRODUTO*QNT_PRODUTO))        AS  "Faturamento Total"       
FROM
    ADMIN.TBL_CARRINHO
GROUP BY
    ID_PEDIDO
ORDER BY
    ID_PEDIDO
    ;

SELECT * FROM vw_tbl_faturamento_pedido;



-- --------------- INPUT | OUTPUT ------------------------

-- Retornando quantidade de produto no estoque --

SET SERVEROUTPUT ON ;

ACCEPT v_idproduto PROMPT 'Digite o id do Produto';

DECLARE 
    v_idDigitado INT            ;
    vnomeProduto VARCHAR2(50)   ;
    vqntEstoque  INT            ;
BEGIN

    v_idDigitado := &v_idproduto;

    SELECT NOME_PRODUTO,ESTOQUE_PRODUTO INTO vnomeProduto,vqntEstoque FROM TBL_PRODUTO WHERE ID_PRODUTO = v_idDigitado;

    DBMS_OUTPUT.PUT_LINE('O '||vnomeProduto||' contém '||vqntEstoque||' unidades no estoque.');

    EXCEPTION
        WHEN NO_DATA_FOUND THEN DBMS_OUTPUT.PUT_LINE('Produto não cadastrado');

END;
/

-- --------------- FUNCTION ------------------------

-- Retornar estoque do produto --
-- Parâmetro -- id do produto --

CREATE OR REPLACE FUNCTION FUNC_RETORNAR_ESTOQUE(v_idProduto IN NUMBER)
RETURN NUMBER 
    IS 
        v_qnt_produto NUMBER;
BEGIN

    SELECT ESTOQUE_PRODUTO INTO v_qnt_produto FROM TBL_PRODUTO WHERE ID_PRODUTO = v_idProduto ;

    RETURN v_qnt_produto;

END;
/

SELECT FUNC_RETORNAR_ESTOQUE(1) "Estoque" FROM DUAL;


-- --------------- TRIGGER ------------------------

-- Controlar saída e entrada do estoque --

-- Entrada no estoque | Delete | Produto | Tabela carrinho  

CREATE OR REPLACE TRIGGER TRG_ENTRADA_ESTOQUE
AFTER DELETE ON TBL_CARRINHO
FOR EACH ROW
BEGIN
    
    UPDATE TBL_PRODUTO SET ESTOQUE_PRODUTO = ESTOQUE_PRODUTO + :OLD.QNT_PRODUTO WHERE ID_PRODUTO = :OLD.ID_PRODUTO;

END;

-- ------------------------ // -----------------------------------

-- Saída no estoque | Insert | Produto | Tabela carrinho  

CREATE OR REPLACE TRIGGER TRG_SAIDA_ESTOQUE
AFTER INSERT ON TBL_CARRINHO
FOR EACH ROW
BEGIN
    
    UPDATE TBL_PRODUTO SET ESTOQUE_PRODUTO = ESTOQUE_PRODUTO - :NEW.QNT_PRODUTO WHERE ID_PRODUTO = :NEW.ID_PRODUTO;

END;

-- ------------------------ // -----------------------------------

-- Saída ou Entrada no estoque | Update | Produto | Tabela carrinho 

CREATE OR REPLACE TRIGGER TRG_ENTRADA_SAIDA_ESTOQUE
AFTER UPDATE ON TBL_CARRINHO
FOR EACH ROW
DECLARE
    v_diferenca INT;
BEGIN
    IF :NEW.QNT_PRODUTO > :OLD.QNT_PRODUTO THEN
        v_diferenca:=:NEW.QNT_PRODUTO-:OLD.QNT_PRODUTO;
        -- Valor novo > antigo
        UPDATE TBL_PRODUTO SET ESTOQUE_PRODUTO = ESTOQUE_PRODUTO - v_diferenca WHERE ID_PRODUTO = :NEW.ID_PRODUTO;
    ELSIF :NEW.QNT_PRODUTO < :OLD.QNT_PRODUTO THEN
         v_diferenca:=:OLD.QNT_PRODUTO-:NEW.QNT_PRODUTO;
        -- Valor novo < antigo
        UPDATE TBL_PRODUTO SET ESTOQUE_PRODUTO = ESTOQUE_PRODUTO + v_diferenca WHERE ID_PRODUTO = :OLD.ID_PRODUTO;
    END IF;

END;

-- ------------------------ // -----------------------------------

-- Saída e Entrada no estoque | Insert ou Update ou delete | Produto | Tabela carrinho 

CREATE OR REPLACE TRIGGER TRG_CONTROLE_ESTOQUE
AFTER INSERT OR UPDATE OR DELETE ON TBL_CARRINHO
FOR EACH ROW
DECLARE
    v_diferenca INT;
BEGIN

    IF INSERTING THEN

        UPDATE TBL_PRODUTO SET ESTOQUE_PRODUTO = ESTOQUE_PRODUTO - :NEW.QNT_PRODUTO WHERE ID_PRODUTO = :NEW.ID_PRODUTO;

    ELSIF UPDATING THEN

        IF :NEW.QNT_PRODUTO > :OLD.QNT_PRODUTO THEN
            v_diferenca:=:NEW.QNT_PRODUTO-:OLD.QNT_PRODUTO;
            -- Valor novo > antigo
            UPDATE TBL_PRODUTO SET ESTOQUE_PRODUTO = ESTOQUE_PRODUTO - v_diferenca WHERE ID_PRODUTO = :NEW.ID_PRODUTO;
        ELSIF :NEW.QNT_PRODUTO < :OLD.QNT_PRODUTO THEN
            v_diferenca:=:OLD.QNT_PRODUTO-:NEW.QNT_PRODUTO;
            -- Valor novo < antigo
            UPDATE TBL_PRODUTO SET ESTOQUE_PRODUTO = ESTOQUE_PRODUTO + v_diferenca WHERE ID_PRODUTO = :OLD.ID_PRODUTO;
        END IF;

    ELSIF DELETING THEN

        UPDATE TBL_PRODUTO SET ESTOQUE_PRODUTO = ESTOQUE_PRODUTO - :NEW.QNT_PRODUTO WHERE ID_PRODUTO = :NEW.ID_PRODUTO;

    END IF;

END;


-- Testando Triggers --

-- Estoque Produto 01 -- 58 unidades --

SELECT ESTOQUE_PRODUTO FROM TBL_PRODUTO WHERE ID_PRODUTO = 1;

-- Carrinho -- 4 unidades --

SELECT * FROM TBL_CARRINHO WHERE ID_PRODUTO = 1;

-- Update -- Carinho -- Retirando 1 unidade --

UPDATE 
    TBL_CARRINHO
SET
    QNT_PRODUTO = QNT_PRODUTO - 1
WHERE 
    ID_PRODUTO = 1
    ;

-- Update -- Carinho -- Adicionando 1 unidade --

UPDATE 
    TBL_CARRINHO
SET
    QNT_PRODUTO = QNT_PRODUTO + 1
WHERE 
    ID_PRODUTO = 1
    ;


-- ------------------------------------------------


-- --------------- PROCEDIMENTOS ------------------------

-- Criando procedimentos armazenados --
-- Procedimentos para inserir registros --
-- Procedimentos para coamndos DML nas tabelas | Aplicação --


-- Sequencias --

SELECT SEQ_ID_PEDIDO.CURRVAL FROM DUAL; -- Atual

SELECT SEQ_ID_PEDIDO.NEXTVAL FROM DUAL; -- Próxima

-- Procedimento para retornar uma tabela usando cursor

CREATE OR REPLACE PROCEDURE SP_RETORNAR_TABELA(v_consulta      IN VARCHAR2)
IS
    cursor_                 SYS_REFCURSOR       ;   -- cursor de retorno
BEGIN

    OPEN cursor_ FOR v_consulta; -- Mensagem de retorno --
    DBMS_SQL.RETURN_RESULT(cursor_); -- retornar mensagem --    
    IF cursor_ %ISOPEN THEN -- Verificar se o cursor está aberto --
        CLOSE cursor_; -- Fechar cursor --
    END IF;

END;

-- Executando

EXEC SP_RETORNAR_TABELA('SELECT * FROM TBL_PRODUTO');

-- ------------------------ // ------------------------

-- Procedimento Zerar tabelas --

CREATE OR REPLACE PROCEDURE SP_ZERAR_TABELA
(
                                                v_seq_name      in  VARCHAR2    ,
                                                v_nome_tabela   in  VARCHAR2
)

IS
    v_valor_seq         NUMBER          ;
    cursor_             SYS_REFCURSOR   ;
    
BEGIN
    EXECUTE IMMEDIATE
    'DELETE FROM ' || v_nome_tabela;
    EXECUTE IMMEDIATE
    'SELECT ' || v_seq_name || ' .NEXTVAL FROM DUAL' INTO v_valor_seq;

    EXECUTE IMMEDIATE
    'ALTER SEQUENCE ' || v_seq_name || ' INCREMENT BY -' || v_valor_seq || ' MINVALUE 0';

    EXECUTE IMMEDIATE
    'SELECT ' || v_seq_name || ' .NEXTVAL FROM DUAL' INTO v_valor_seq;

    EXECUTE IMMEDIATE
    'ALTER SEQUENCE ' || v_seq_name || ' INCREMENT BY 1 MINVALUE 0';

    SP_RETORNAR_TABELA('SELECT ''Tabela ' || v_nome_tabela || ' Zerada'' "Retorno" FROM DUAL');

END;
/

-- Limpar tabelas

EXEC SP_ZERAR_TABELA('SEQ_ID_PEDIDO','TBL_PEDIDO');
EXEC SP_ZERAR_TABELA('SQ_ID_CLIENTE','TBL_CLIENTE');
EXEC SP_ZERAR_TABELA('SQ_ID_PRODUTO','TBL_PRODUTO');

-- ------------------------ // ------------------------


-- ---------- Procedimentos para inserir registros --------------------------------

-- Procedimento Inserir produtos --

-- Passar como parâmetro o nº de registros a serem inseridos --

CREATE OR REPLACE PROCEDURE SP_INSERIR_PRODUTOS(v_registros_inseridos IN NUMBER)
IS
    v_idProduto             INT                 ;   -- id do produto
    v_nomeProduto           VARCHAR2    (50)    ;   -- nome do produto
    v_precoProduto          NUMBER      (9,2)   ;   -- preço do produto
    v_custoProduto          NUMBER      (9,2)   ;   -- custo do produto
    v_estoque               INT                 ;   -- estoque do produto
    cursor_                 SYS_REFCURSOR       ;   -- cursor de retorno
    v_SQLERRM               VARCHAR2    (100)   ;   -- mensagem de erro
    v_SQLCODE               VARCHAR2    (30)    ;   -- código de erro

BEGIN

    -- Deletar registros da tabela + resetar sequencia --

    SP_ZERAR_TABELA('SQ_ID_PRODUTO','TBL_PRODUTO');

    -- Inserir registros --

    FOR CONT IN 1..v_registros_inseridos LOOP

        v_nomeProduto   := 'Produto ' || CONT                                   ;
        v_custoProduto  :=  ROUND(DBMS_RANDOM.VALUE*100,2)                      ;
        v_precoProduto  :=  v_custoProduto + ROUND(DBMS_RANDOM.VALUE*10,2)      ;
        v_estoque       :=  ROUND(DBMS_RANDOM.VALUE*100)                        ;

        INSERT INTO 
            ADMIN.TBL_PRODUTO (ID_PRODUTO,NOME_PRODUTO,PRECO_PRODUTO,CUSTO_PRODUTO,ESTOQUE_PRODUTO) 
        VALUES  
            (sq_id_produto.nextval,v_nomeProduto,v_precoProduto,v_custoProduto,v_estoque);

    END LOOP;

    -- Commit --

    IF SQLCODE = 0 THEN
        COMMIT;
        SP_RETORNAR_TABELA('SELECT ''Dados inseridos com sucesso'' FROM DUAL'); -- Retornar mensagem
        SP_RETORNAR_TABELA('SELECT * FROM TBL_PRODUTO ORDER BY ID_PRODUTO'); -- Retornar tabela

    END IF;

    -- Tratamento de erro --

    EXCEPTION
    WHEN OTHERS THEN

        v_SQLERRM:=SQLERRM;
        v_SQLCODE:=SQLCODE;

        SP_RETORNAR_TABELA('SELECT ''Código: ' || v_SQLCODE || '| Mensagem: ' || v_SQLERRM ||''' "Retorno" FROM DUAL'); -- Retornar mensagem
        

        ROLLBACK;

END;
/

-- Executar procedimento --

ALTER TRIGGER TRG_CONTROLE_ESTOQUE DISABLE; -- Inativar trigger

EXEC SP_INSERIR_PRODUTOS(50);

ALTER TRIGGER TRG_CONTROLE_ESTOQUE ENABLE; -- ativar trigger


-- ------------------------ // ------------------------

-- Procedimento Inserir Clientes --

-- Passar como parâmetro o nº de registros a serem inseridos --

CREATE OR REPLACE PROCEDURE SP_INSERIR_CLIENTES(v_registros_inseridos IN NUMBER)
IS
    v_idCliente             INT                 ;   -- id do cliente
    v_nomeCliente           VARCHAR2    (50)    ;   -- nome do cliente
    v_sobrenomeCliente      VARCHAR2    (80)    ;   -- sobrenome do cliente
    v_generoCliente         CHAR         (1)    ;   -- genero do cliente
    v_nascCliente           DATE                ;   -- nascimento do cliente
    v_celularCliente        CHAR        (14)    ;   -- celular do cliente
    v_emailCliente          VARCHAR2    (80)    ;   -- email do cliente

    cursor_                 SYS_REFCURSOR       ;   -- cursor de retorno
    v_SQLERRM               VARCHAR2    (100)   ;   -- mensagem de erro
    v_SQLCODE               VARCHAR2    (30)    ;   -- código de erro

BEGIN

    -- Deletar registros da tabela + resetar sequencia --

    SP_ZERAR_TABELA('SQ_ID_CLIENTE','TBL_CLIENTE');

    -- Inserir registros --

    FOR CONT IN 1..v_registros_inseridos LOOP

        v_nomeCliente           := 'Cliente '   || CONT                                   ;
        v_sobrenomeCliente      := 'Sobrenome ' || CONT                                   ;
        v_emailCliente          := 'Cliente '   || CONT || '@xxxx.com'                                  ;
        v_nascCliente           :=  ADD_MONTHS(SYSDATE,(DBMS_RANDOM.VALUE(500,1000))*-1)  ; 
        v_celularCliente        :=  '('||ROUND(DBMS_RANDOM.VALUE(10,50))||')9'||ROUND(DBMS_RANDOM.VALUE(1000,9999))||'-'||ROUND(DBMS_RANDOM.VALUE(1000,9999));

        IF MOD(ROUND(DBMS_RANDOM.VALUE*20),2) = 0 THEN

            v_generoCliente :='M';

        ELSE

             v_generoCliente :='F';

        END IF;

        INSERT INTO 
            ADMIN.TBL_CLIENTE (ID_CLIENTE,NOME_CLIENTE,SOBRENOME_CLIENTE,SEXO_CLIENTE,NASCIMENTO_CLIENTE,CELULAR_CLIENTE,EMAIL_CLIENTE) 
        VALUES 
            (
            sq_id_cliente.nextval,
            v_nomeCliente,
            v_sobrenomeCliente,
            v_generoCliente,
            v_nascCliente,
            v_celularCliente,
            v_emailCliente
            );

    END LOOP;

    -- Commit --

    IF SQLCODE = 0 THEN
        COMMIT;
        SP_RETORNAR_TABELA('SELECT ''Dados inseridos com sucesso'' FROM DUAL'); -- Retornar mensagem
        SP_RETORNAR_TABELA('SELECT * FROM TBL_CLIENTE ORDER BY ID_CLIENTE'); -- Retornar tabela
    END IF;

    -- Tratamento de erro --

    EXCEPTION
    WHEN OTHERS THEN

        v_SQLERRM:=SQLERRM;
        v_SQLCODE:=SQLCODE;

        SP_RETORNAR_TABELA('SELECT ''Código: ' || v_SQLCODE || '| Mensagem: ' || v_SQLERRM ||''' "Retorno" FROM DUAL'); -- Retornar mensagem

        ROLLBACK;

END;
/

-- Executar procedimento --

EXEC SP_INSERIR_CLIENTES(50);


-- ------------------------ // ------------------------


-- Procedimento Inserir Pedidos --

-- Passar como parâmetro o nº de registros a serem inseridos --

CREATE OR REPLACE PROCEDURE SP_INSERIR_PEDIDOS(v_registros_inseridos IN NUMBER)
IS
    v_idPedido              INT                 ;   -- id do pedido
    v_idCliente             INT                 ;   -- id do cliente
    v_situacaoPedido        CHAR         (1)    ;   -- situação do pedido
    v_dataPedido            DATE                ;   -- data do pedido
    
    v_idProduto             INT                 ;   -- id do produto
    v_qntProduto            INT                 ;   -- quantidade do produto
    v_precoProduto          DECIMAL     (9,2)   ;   -- preço do produto
    v_custoProduto          DECIMAL     (9,2)   ;   -- custo do produto

    cursor_                 SYS_REFCURSOR       ;   -- cursor de retorno
    v_SQLERRM               VARCHAR2    (100)   ;   -- mensagem de erro
    v_SQLCODE               VARCHAR2    (30)    ;   -- código de erro

BEGIN

    -- Deletar registros da tabela + resetar sequencia --

    SP_ZERAR_TABELA('SEQ_ID_PEDIDO','TBL_PEDIDO');


    -- Inserir registros --

    FOR CONT IN 1..v_registros_inseridos LOOP
        
        SELECT ID_CLIENTE INTO v_idCliente FROM (SELECT ID_CLIENTE FROM tbl_cliente ORDER BY dbms_random.value) WHERE rownum = 1;

        v_dataPedido            :=  SYSDATE-dbms_random.value(1,1000)                                  ; 
        
        SELECT ID_PRODUTO,ESTOQUE_PRODUTO INTO v_idProduto,v_qntProduto FROM (SELECT ID_PRODUTO,ESTOQUE_PRODUTO FROM tbl_produto WHERE ESTOQUE_PRODUTO > 0 ORDER BY dbms_random.value)  WHERE rownum = 1 ;

        v_qntProduto := dbms_random.value(1,v_qntProduto);

        SELECT PRECO_PRODUTO,CUSTO_PRODUTO INTO v_precoProduto,v_custoProduto FROM tbl_produto WHERE ID_PRODUTO = v_idProduto;

        IF MOD(ROUND(DBMS_RANDOM.VALUE*20),2) = 0 THEN

            v_situacaoPedido :='P';

        ELSE

             v_situacaoPedido :=NULL;

        END IF;

        INSERT INTO 
            ADMIN.TBL_PEDIDO (ID_PEDIDO,ID_CLIENTE,SITUACAO_PAG,DATA_PEDIDO) 
        VALUES (
            seq_id_pedido.nextval,
            v_idCliente,
            v_situacaoPedido,
            v_dataPedido);

        INSERT INTO 
            ADMIN.TBL_CARRINHO (ID_PEDIDO,ID_PRODUTO,QNT_PRODUTO,PRECO_PRODUTO,CUSTO_PRODUTO) 
        VALUES (
            seq_id_pedido.CURRVAL,
            v_idProduto,
            v_qntProduto,
            v_precoProduto,
            v_custoProduto);

        --UPDATE TBL_PRODUTO SET ESTOQUE_PRODUTO = ESTOQUE_PRODUTO - v_qntProduto WHERE ID_PRODUTO = v_idProduto;
            
    END LOOP;

    -- Commit --

    IF SQLCODE = 0 THEN
        COMMIT;
        SP_RETORNAR_TABELA('SELECT ''Dados inseridos com sucesso'' FROM DUAL'); -- Retornar mensagem
        SP_RETORNAR_TABELA('SELECT * FROM TBL_PEDIDO ORDER BY ID_PEDIDO'); -- Retornar tabela
        SP_RETORNAR_TABELA('SELECT * FROM TBL_CARRINHO ORDER BY ID_PEDIDO'); -- Retornar tabela
    END IF;

    -- Tratamento de erro --

    EXCEPTION
    WHEN OTHERS THEN

        v_SQLERRM:=SQLERRM;
        v_SQLCODE:=SQLCODE;

        SP_RETORNAR_TABELA('SELECT ''Código: ' || v_SQLCODE || '| Mensagem: ' || v_SQLERRM ||''' "Retorno" FROM DUAL'); -- Retornar mensagem

        ROLLBACK;

END;
/

-- Executar procedimento --

EXEC SP_INSERIR_PEDIDOS(50);



-- ------------------------ // ------------------------


-- ---------- Procedimentos para a aplicação --------------------------------

-- Criando procedimentos armazenados
-- Procedimentos para comandos DML nas tabelas | Aplicação
-- Insert (I) | Update (U) | Delete (D)


-- --------------------------------------------- // ----------------------------------------------


-- Procedimentos Produtos --


CREATE OR REPLACE PROCEDURE SP_PROCEDIMENTOS_PRODUTOS
(                                                       v_procedimento      IN VARCHAR2         , -- Tipo de procedimento >> Insert (I) | Update (U) | Delete (D)
                                                        v_idProduto         IN NUMBER           , -- id do produto
                                                        v_nomeProduto       IN VARCHAR2         , -- nome do produto
                                                        v_precoProduto      IN DECIMAL          , -- preço do produto
                                                        v_custoProduto      IN DECIMAL          , -- custo do produto
                                                        v_estoqueProduto    IN NUMBER             -- estoque do produto
                                                        
)
IS
    v_registros              INT                 ;   -- qnt de registros retornados

    cursor_                 SYS_REFCURSOR       ;   -- cursor de retorno
    v_SQLERRM               VARCHAR2    (100)   ;   -- mensagem de erro
    v_SQLCODE               VARCHAR2    (30)    ;   -- código de erro
    v_msgRetorno            VARCHAR2    (100)   ;   -- Mensagem de retorno

    -- EXCEPTION --

    v_camposObrigatorios    EXCEPTION; -- Campos obrigatórios
    v_idObrigatorio         EXCEPTION; -- ID obrigatório
    v_idExiste              EXCEPTION; -- Verificar se o ID existe
    v_procedimentoIncorreto EXCEPTION; -- Erro tipo de procedimento
    v_valoresNegativos      EXCEPTION; -- Valores Negativos
    v_precoMaiorCusto       EXCEPTION; -- Preço maior que o custo

BEGIN

    -- Verificações básicas --

    IF v_procedimento NOT IN ('I','U','D') OR v_procedimento IS NULL THEN -- Verificar se o procedimento está correto

        RAISE v_procedimentoIncorreto; -- ERRO 

    END IF;

    -- DML --

    CASE 

        WHEN v_procedimento IN ('I','U') THEN -- Insert or update

            IF v_nomeProduto IS NULL OR v_precoProduto IS NULL OR v_custoProduto IS NULL THEN

                RAISE v_camposObrigatorios; -- ERRO 

            ELSIF v_idProduto IS NULL AND v_procedimento = 'U'  THEN -- Verificar o id do produto

                RAISE v_idObrigatorio; -- ERRO 

            ELSIF v_precoProduto <=0 OR v_custoProduto <= 0 OR v_estoqueProduto <0 THEN -- Verificar se o preço ,custo e estoque são maiores que 0

                RAISE v_valoresNegativos; -- ERRO 

            ELSIF v_precoProduto <= v_custoProduto THEN -- Verificar se o preço é maior que o custo

                RAISE v_precoMaiorCusto; -- ERRO 

            END IF;

        
            IF v_procedimento = 'I' THEN -- Insert --

                INSERT INTO 
                    ADMIN.TBL_PRODUTO (ID_PRODUTO,NOME_PRODUTO,PRECO_PRODUTO,CUSTO_PRODUTO,ESTOQUE_PRODUTO) 
                VALUES 
                    (sq_id_produto.nextval,v_nomeProduto,v_precoProduto,v_custoProduto,NULLIF(v_estoqueProduto,0))
                    ;

                v_msgRetorno := 'Produto cadastrado com sucesso' ; -- Mensagem de retorno

            ELSIF v_procedimento = 'U' THEN -- Update --

                SELECT COUNT(ID_PRODUTO) INTO v_registros FROM TBL_PRODUTO WHERE ID_PRODUTO = v_idProduto; -- Retornar qnt de id

                IF v_registros = 0 THEN -- Verificar se existe o produto
                    RAISE v_idExiste; -- erro
                END IF;

                UPDATE 
                    ADMIN.TBL_PRODUTO 
                SET 
                    NOME_PRODUTO        =   v_nomeProduto   ,
                    PRECO_PRODUTO       =   v_precoProduto  ,
                    CUSTO_PRODUTO       =   v_custoProduto  ,
                    ESTOQUE_PRODUTO     =   NULLIF(v_estoqueProduto,0)
                WHERE
                    ID_PRODUTO = v_idProduto
                    ;

                v_msgRetorno := 'Produto alterado com sucesso' ; -- Mensagem de retorno

            END IF;

        WHEN v_procedimento = 'D' THEN -- delete

            IF v_idProduto IS NULL  THEN -- Verificar o id do produto

                RAISE v_idObrigatorio; -- ERRO 

            ELSE

                SELECT COUNT(ID_PRODUTO) INTO v_registros FROM TBL_PRODUTO WHERE ID_PRODUTO = v_idProduto; -- Retornar qnt de id

                IF v_registros = 0 THEN -- Verificar se existe o produto
                    RAISE v_idExiste; -- erro
                END IF;

                 DELETE FROM 
                    ADMIN.TBL_PRODUTO 
                WHERE
                    ID_PRODUTO = v_idProduto
                    ;

                v_msgRetorno := 'Produto excluído com sucesso' ; -- Mensagem de retorno
                

            END IF;

    
    END CASE;

    -- Commit --

    IF SQLCODE = 0 THEN -- Verificar se deu erro --

        COMMIT; -- Comitar --

        SP_RETORNAR_TABELA('SELECT ''' || v_msgRetorno ||''' "Retorno" FROM DUAL');
        SP_RETORNAR_TABELA('SELECT * FROM TBL_PRODUTO ORDER BY ID_PRODUTO');

    END IF;


    -- Tratamento de erro --

    EXCEPTION

    WHEN v_procedimentoIncorreto THEN -- Erro no tipo de procedimento
        v_msgRetorno := 'Procedimento válido: Insert (I) | Update (U) | Delete (D)' ; -- Mensagem de retorno
        SP_RETORNAR_TABELA('SELECT ''' || v_msgRetorno ||''' "Retorno" FROM DUAL'); -- Retornar mensagem

    WHEN v_camposObrigatorios THEN -- Campos obrigatórios
        v_msgRetorno := 'Campos Obrigatórios: Nome | Preço | Custo ' ; -- Mensagem de retorno
       SP_RETORNAR_TABELA('SELECT ''' || v_msgRetorno ||''' "Retorno" FROM DUAL'); -- Retornar mensagem

    WHEN v_idObrigatorio THEN -- id nulo
        v_msgRetorno := 'É necessário informar o ID do produto para realizar alterações e exclusões' ; -- Mensagem de retorno
        SP_RETORNAR_TABELA('SELECT ''' || v_msgRetorno ||''' "Retorno" FROM DUAL'); -- Retornar mensagem

    WHEN v_valoresNegativos THEN -- preço ou custo ou estoque menores ou igual a 0
        v_msgRetorno := 'O preço e custo devem ser maiores que 0 e o estoque maior ou igual a 0' ; -- Mensagem de retorno
        SP_RETORNAR_TABELA('SELECT ''' || v_msgRetorno ||''' "Retorno" FROM DUAL'); -- Retornar mensagem

    WHEN v_precoMaiorCusto THEN -- preço maior custo
        v_msgRetorno := 'O preço deve ser maior que o custo' ; -- Mensagem de retorno
        SP_RETORNAR_TABELA('SELECT ''' || v_msgRetorno ||''' "Retorno" FROM DUAL'); -- Retornar mensagem

    WHEN v_idExiste THEN -- Verificar se o id existe
        v_msgRetorno := 'Produto não cadastrado' ; -- Mensagem de retorno
        SP_RETORNAR_TABELA('SELECT ''' || v_msgRetorno ||''' "Retorno" FROM DUAL'); -- Retornar mensagem

    WHEN OTHERS THEN -- Outro erro

        v_SQLERRM := SQLERRM ;
        v_SQLCODE := SQLCODE ;

        v_msgRetorno := 'Nª do erro: ' || v_SQLCODE || ' | Mensagem: ' || v_SQLERRM ; -- Mensagem de retorno
        SP_RETORNAR_TABELA('SELECT ''' || v_msgRetorno ||''' "Retorno" FROM DUAL'); -- Retornar mensagem
        ROLLBACK; -- Rollback

    

END;
/


-- Executar comando --

-- Insert --

EXEC SP_PROCEDIMENTOS_PRODUTOS('I',NULL,'Produto ZYZZ',170.99,150.99,1);

-- Update --

EXEC SP_PROCEDIMENTOS_PRODUTOS('U',52,'Produto Zysnei',170.99,150.99,1);

-- Delete --

EXEC SP_PROCEDIMENTOS_PRODUTOS('D',52,NULL,NULL,NULL,NULL);


-- --------------------------------------------- // ----------------------------------------------


-- Procedimentos Clientes --

CREATE TABLE tbl_cliente (

    id_cliente          INT                 NOT NULL        ,
    nome_cliente        VARCHAR2  (50)      NOT NULL        ,
    sobrenome_cliente   VARCHAR2  (80)      NOT NULL        ,
    sexo_cliente        CHAR       (1)      NOT NULL        ,
    nascimento_cliente  DATE                NOT NULL        ,
    celular_cliente     CHAR      (14)      NOT NULL        ,
    email_cliente       VARCHAR2  (80)      NOT NULL        ,

    CONSTRAINT      pk_id_cliente         PRIMARY KEY     (id_cliente)                  ,
    CONSTRAINT      u_celular_cliente     UNIQUE          (celular_cliente)             ,
    CONSTRAINT      u_email_cliente       UNIQUE          (email_cliente)               ,
    CONSTRAINT      ck_sexo               CHECK           (sexo_cliente in ('M','F'))   , 
    CONSTRAINT      ck_celular            CHECK           (REGEXP_LIKE (celular_cliente,'[(][0-9][0-9][)][9][0-9][0-9][0-9][0-9][-][0-9][0-9][0-9][0-9]'))   
)
;

CREATE OR REPLACE PROCEDURE SP_PROCEDIMENTOS_CLIENTES
(                                                       v_procedimento      IN VARCHAR2         , -- Tipo de procedimento >> Insert (I) | Update (U) | Delete (D)
                                                        v_idCliente         IN NUMBER           , -- id do cliente
                                                        v_nomeCliente       IN VARCHAR2         , -- nome do cliente
                                                        v_sobrenomeCliente  IN VARCHAR2         , -- sobrenome do cliente
                                                        v_generoCliente     IN VARCHAR2         , -- genero do cliente
                                                        v_nascimentoCliente IN DATE             , -- nascimento do cliente
                                                        v_sobrenomeCliente  IN VARCHAR2         , -- sobrenome do cliente
                                                        v_generoCliente     IN VARCHAR2          -- genero do cliente
                                                        
)
IS
    v_registros              INT                 ;   -- qnt de registros retornados

    cursor_                 SYS_REFCURSOR       ;   -- cursor de retorno
    v_SQLERRM               VARCHAR2    (100)   ;   -- mensagem de erro
    v_SQLCODE               VARCHAR2    (30)    ;   -- código de erro
    v_msgRetorno            VARCHAR2    (100)   ;   -- Mensagem de retorno

    -- EXCEPTION --

    v_camposObrigatorios    EXCEPTION; -- Campos obrigatórios
    v_idObrigatorio         EXCEPTION; -- ID obrigatório
    v_idExiste              EXCEPTION; -- Verificar se o ID existe
    v_procedimentoIncorreto EXCEPTION; -- Erro tipo de procedimento
    v_valoresNegativos      EXCEPTION; -- Valores Negativos
    v_precoMaiorCusto       EXCEPTION; -- Preço maior que o custo

BEGIN

    -- Verificações básicas --

    IF v_procedimento NOT IN ('I','U','D') OR v_procedimento IS NULL THEN -- Verificar se o procedimento está correto

        RAISE v_procedimentoIncorreto; -- ERRO 

    END IF;

    -- DML --

    CASE 

        WHEN v_procedimento IN ('I','U') THEN -- Insert or update

            IF v_nomeProduto IS NULL OR v_precoProduto IS NULL OR v_custoProduto IS NULL THEN

                RAISE v_camposObrigatorios; -- ERRO 

            ELSIF v_idProduto IS NULL AND v_procedimento = 'U'  THEN -- Verificar o id do produto

                RAISE v_idObrigatorio; -- ERRO 

            ELSIF v_precoProduto <=0 OR v_custoProduto <= 0 OR v_estoqueProduto <0 THEN -- Verificar se o preço ,custo e estoque são maiores que 0

                RAISE v_valoresNegativos; -- ERRO 

            ELSIF v_precoProduto <= v_custoProduto THEN -- Verificar se o preço é maior que o custo

                RAISE v_precoMaiorCusto; -- ERRO 

            END IF;

        
            IF v_procedimento = 'I' THEN -- Insert --

                INSERT INTO 
                    ADMIN.TBL_PRODUTO (ID_PRODUTO,NOME_PRODUTO,PRECO_PRODUTO,CUSTO_PRODUTO,ESTOQUE_PRODUTO) 
                VALUES 
                    (sq_id_produto.nextval,v_nomeProduto,v_precoProduto,v_custoProduto,NULLIF(v_estoqueProduto,0))
                    ;

                v_msgRetorno := 'Produto cadastrado com sucesso' ; -- Mensagem de retorno

            ELSIF v_procedimento = 'U' THEN -- Update --

                SELECT COUNT(ID_PRODUTO) INTO v_registros FROM TBL_PRODUTO WHERE ID_PRODUTO = v_idProduto; -- Retornar qnt de id

                IF v_registros = 0 THEN -- Verificar se existe o produto
                    RAISE v_idExiste; -- erro
                END IF;

                UPDATE 
                    ADMIN.TBL_PRODUTO 
                SET 
                    NOME_PRODUTO        =   v_nomeProduto   ,
                    PRECO_PRODUTO       =   v_precoProduto  ,
                    CUSTO_PRODUTO       =   v_custoProduto  ,
                    ESTOQUE_PRODUTO     =   NULLIF(v_estoqueProduto,0)
                WHERE
                    ID_PRODUTO = v_idProduto
                    ;

                v_msgRetorno := 'Produto alterado com sucesso' ; -- Mensagem de retorno

            END IF;

        WHEN v_procedimento = 'D' THEN -- delete

            IF v_idProduto IS NULL  THEN -- Verificar o id do produto

                RAISE v_idObrigatorio; -- ERRO 

            ELSE

                SELECT COUNT(ID_PRODUTO) INTO v_registros FROM TBL_PRODUTO WHERE ID_PRODUTO = v_idProduto; -- Retornar qnt de id

                IF v_registros = 0 THEN -- Verificar se existe o produto
                    RAISE v_idExiste; -- erro
                END IF;

                 DELETE FROM 
                    ADMIN.TBL_PRODUTO 
                WHERE
                    ID_PRODUTO = v_idProduto
                    ;

                v_msgRetorno := 'Produto excluído com sucesso' ; -- Mensagem de retorno
                

            END IF;

    
    END CASE;

    -- Commit --

    IF SQLCODE = 0 THEN -- Verificar se deu erro --

        COMMIT; -- Comitar --

        SP_RETORNAR_TABELA('SELECT ''' || v_msgRetorno ||''' "Retorno" FROM DUAL');
        SP_RETORNAR_TABELA('SELECT * FROM TBL_PRODUTO ORDER BY ID_PRODUTO');

    END IF;


    -- Tratamento de erro --

    EXCEPTION

    WHEN v_procedimentoIncorreto THEN -- Erro no tipo de procedimento
        v_msgRetorno := 'Procedimento válido: Insert (I) | Update (U) | Delete (D)' ; -- Mensagem de retorno
        SP_RETORNAR_TABELA('SELECT ''' || v_msgRetorno ||''' "Retorno" FROM DUAL'); -- Retornar mensagem

    WHEN v_camposObrigatorios THEN -- Campos obrigatórios
        v_msgRetorno := 'Campos Obrigatórios: Nome | Preço | Custo ' ; -- Mensagem de retorno
       SP_RETORNAR_TABELA('SELECT ''' || v_msgRetorno ||''' "Retorno" FROM DUAL'); -- Retornar mensagem

    WHEN v_idObrigatorio THEN -- id nulo
        v_msgRetorno := 'É necessário informar o ID do produto para realizar alterações e exclusões' ; -- Mensagem de retorno
        SP_RETORNAR_TABELA('SELECT ''' || v_msgRetorno ||''' "Retorno" FROM DUAL'); -- Retornar mensagem

    WHEN v_valoresNegativos THEN -- preço ou custo ou estoque menores ou igual a 0
        v_msgRetorno := 'O preço e custo devem ser maiores que 0 e o estoque maior ou igual a 0' ; -- Mensagem de retorno
        SP_RETORNAR_TABELA('SELECT ''' || v_msgRetorno ||''' "Retorno" FROM DUAL'); -- Retornar mensagem

    WHEN v_precoMaiorCusto THEN -- preço maior custo
        v_msgRetorno := 'O preço deve ser maior que o custo' ; -- Mensagem de retorno
        SP_RETORNAR_TABELA('SELECT ''' || v_msgRetorno ||''' "Retorno" FROM DUAL'); -- Retornar mensagem

    WHEN v_idExiste THEN -- Verificar se o id existe
        v_msgRetorno := 'Produto não cadastrado' ; -- Mensagem de retorno
        SP_RETORNAR_TABELA('SELECT ''' || v_msgRetorno ||''' "Retorno" FROM DUAL'); -- Retornar mensagem

    WHEN OTHERS THEN -- Outro erro

        v_SQLERRM := SQLERRM ;
        v_SQLCODE := SQLCODE ;

        v_msgRetorno := 'Nª do erro: ' || v_SQLCODE || ' | Mensagem: ' || v_SQLERRM ; -- Mensagem de retorno
        SP_RETORNAR_TABELA('SELECT ''' || v_msgRetorno ||''' "Retorno" FROM DUAL'); -- Retornar mensagem
        ROLLBACK; -- Rollback

    

END;
/


-- Executar comando --

-- Insert --

EXEC SP_PROCEDIMENTOS_PRODUTOS('I',NULL,'Produto ZYZZ',170.99,150.99,1);

-- Update --

EXEC SP_PROCEDIMENTOS_PRODUTOS('U',52,'Produto Zysnei',170.99,150.99,1);

-- Delete --

EXEC SP_PROCEDIMENTOS_PRODUTOS('D',52,NULL,NULL,NULL,NULL);






-- --------------------------------------------- // ----------------------------------------------


-- Procedimentos Pedidos --






-- ---------------------------------------------------------------------------


-- --------------- CURSOR ------------------------

-- View Resumo dos pedidos --

SELECT * FROM vw_tbl_resumo_pedido WHERE "Situação" = 'Pendente' ORDER BY TO_DATE("Data");

-- Imprimir na tela todos os pedidos pendentes --

SET SERVEROUTPUT ON

DECLARE
    v_idPedido      INT             ;
    v_qntProduto    INT             ;
    v_Total         DECIMAL(9,2)    ;
    v_situacao      VARCHAR(8)      ;
    v_data          DATE            ;

    CURSOR v_cursor 
    IS
        SELECT * FROM vw_tbl_resumo_pedido WHERE "Situação" = 'Pendente' ORDER BY TO_DATE("Data");

BEGIN

    OPEN v_cursor;

    LOOP
        FETCH v_cursor INTO v_idPedido,v_qntProduto,v_Total,v_situacao,v_data;
        EXIT WHEN v_cursor%NOTFOUND;
        DBMS_OUTPUT.PUT_LINE('Pedido: ' || v_idPedido);
        DBMS_OUTPUT.PUT_LINE('Qnt: ' || v_qntProduto || ' unid');
        DBMS_OUTPUT.PUT_LINE('Valor: R$' || v_Total);
        DBMS_OUTPUT.PUT_LINE('Situação: ' || v_situacao);
        DBMS_OUTPUT.PUT_LINE('Data: ' || TO_CHAR(v_data,'dd-mm-yyyy'));
        DBMS_OUTPUT.PUT_LINE('------------------------------------------');
    END LOOP;

    CLOSE v_cursor;
END;


-- -----------------------------------------------


-- --------------- JOINS ------------------------

-- Criando consultas avançadas --

-- Top 10 Clientes que mais realizaram pedidos --

SELECT * FROM (

SELECT
    C1.ID_CLIENTE                                               AS      "ID Cliente"            ,
    C1.NOME_CLIENTE || ' ' || C1.SOBRENOME_CLIENTE              AS      "Nome Completo"         ,
    SUM((SELECT 
        COUNT(ID_PEDIDO) 
    FROM 
        TBL_PEDIDO 
    WHERE 
        ID_CLIENTE = C1.ID_CLIENTE))                             AS       "Total de pedidos"

FROM
    TBL_CLIENTE C1
INNER JOIN
    TBL_PEDIDO P1
ON
    C1.ID_CLIENTE = P1.ID_CLIENTE
GROUP BY
    C1.ID_CLIENTE,C1.NOME_CLIENTE || ' ' || C1.SOBRENOME_CLIENTE
ORDER BY
    "Total de pedidos" DESC

) 

WHERE ROWNUM <= 10

;

-- Top 10 Produtos mais vendidos --

-- Top 10 Produtos com maior faturamento --

-- Top 10 clientes com mais pedidos pendentes --

-- Produtos zerados no estoque --

-- Produto com maior custo --

-- Produto com maior faturamento --

-- Faturamento Mensal --

-- Mês com maior faturamento --

-- Mês com menor faturamento --

-- Mês com maior prejuízo --

-- -----------------------------------------------





-- --------------- USUÁRIOS ------------------------

-- Criando usuários para a equipe de desenvolvimento --

/* Usuários */

-- Atual

SELECT USER FROM DUAL;

-- Criando usuário desenvolvedor

CREATE USER user_dev_01
  IDENTIFIED BY Userdev0123456;

-- Verificando se foi criado

select *
from dba_users
where username = 'USER_DEV_01';

-- Grant

GRANT CREATE SESSION                            TO USER_DEV_01;
GRANT SELECT            ON ADMIN.tbl_produto    TO USER_DEV_01;

-- Revoke

REVOKE SELECT            ON ADMIN.tbl_produto    FROM USER_DEV_01;

-- Verificando Privilégios

SELECT * FROM dba_sys_privs     WHERE grantee   = 'USER_DEV_01';
SELECT * FROM dba_role_privs    WHERE grantee   = 'USER_DEV_01';
SELECT * FROM dba_tab_privs     WHERE grantee   = 'USER_DEV_01';

/* Desenvolvedor da aplicação */

-- Visualizar tabelas

SELECT tablespace_name, table_name, owner 
FROM all_tables
WHERE OWNER = 'ADMIN';

-- Visualizar Privilégios

SELECT * FROM user_tab_privs     WHERE grantee   = 'USER_DEV_01';


-- ------------------- // ---------------------------------------

-- --------------- TAREFAS ------------------------

-- 1. Revisar o código
-- 2. Criar procedimentos para cliente
-- 3. Criar procedimentos para produto
-- 4. Criar consultas avançadas


-- --------------- RASCUNHO ------------------------


-- Aleatório --

ALTER SESSION SET NLS_DATE_FORMAT = 'DD-MM-YYYY';

SELECT * FROM (SELECT * FROM tbl_cliente ORDER BY dbms_random.value) WHERE rownum = 1;   

SELECT  
       TO_DATE(TO_CHAR(ADD_MONTHS(SYSDATE,(DBMS_RANDOM.VALUE(500,1000))*-1),'dd-mm-yyyy'),'dd-mm-YYYY') 
FROM DUAL
;

SELECT ROUND(to_char(sysdate, 'yyyy')-DBMS_RANDOM.VALUE*20) FROM DUAL;

SELECT 
    '('||ROUND(DBMS_RANDOM.VALUE(10,50))||')9'||ROUND(DBMS_RANDOM.VALUE(1000,9999))||'-'||ROUND(DBMS_RANDOM.VALUE(1000,9999)) 
FROM DUAL;

-- '(99)99999-9999'


SELECT LENGTH('') "Sem trim",NVL(LENGTH(TRIM('')),0) "Com trim" FROM DUAL;