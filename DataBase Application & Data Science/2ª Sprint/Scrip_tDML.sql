--Populando T_AISB_PARCEIROS_NEGOCIOS
insert into t_aisb_parceiros_negocios values(100, 'Cleiton Rasta',  TO_DATE('10/05/2022','DD/MM/YYYY'), 
                                                TO_DATE('10/03/2023','DD/MM/YYYY'), 95831661000175);
insert into t_aisb_parceiros_negocios values(101, 'Roupas legais',  TO_DATE('22/02/2022','DD/MM/YYYY'), 
                                                TO_DATE('','DD/MM/YYYY'), 28160686000105);
insert into t_aisb_parceiros_negocios values(102, 'Garfield',  TO_DATE('09/12/2021','DD/MM/YYYY'), 
                                                TO_DATE('21/02/2023','DD/MM/YYYY'), 22211739000185);
insert into t_aisb_parceiros_negocios values(103, 'Kotlin Dois',  TO_DATE('30/07/2017','DD/MM/YYYY'), 
                                                TO_DATE('03/05/2020','DD/MM/YYYY'), 49181554000121);
insert into t_aisb_parceiros_negocios values(104, 'Dellacer',  TO_DATE('22/05/2020','DD/MM/YYYY'), 
                                                TO_DATE('22/11/2022','DD/MM/YYYY'), 58359222000185);
insert into t_aisb_parceiros_negocios values(105, 'Couto Esportes',  TO_DATE('13/06/2021','DD/MM/YYYY'), 
                                                TO_DATE('01/01/2023','DD/MM/YYYY'), 29539514000100);
insert into t_aisb_parceiros_negocios values(106, 'Meca',  TO_DATE('24/01/2022','DD/MM/YYYY'), 
                                                TO_DATE('24/12/2022','DD/MM/YYYY'), 33547947000176);
insert into t_aisb_parceiros_negocios values(107, 'Paif',  TO_DATE('31/12/2020','DD/MM/YYYY'), 
                                                TO_DATE('30/08/2022','DD/MM/YYYY'), 52234883000106);
insert into t_aisb_parceiros_negocios values(108, 'Mongo',  TO_DATE('16/06/2016','DD/MM/YYYY'), 
                                                TO_DATE('28/02/2018','DD/MM/YYYY'), 11751264000101);
insert into t_aisb_parceiros_negocios values(109, 'Exclamação',  TO_DATE('20/02/2020','DD/MM/YYYY'), 
                                                TO_DATE('15/05/2021','DD/MM/YYYY'), 12218899000100);
commit;                                                  
                                                
--Populando T_AISB_USUARIO
insert into t_aisb_usuario values(100000, 'H', 'Enzo Bento', 44187038108, 17022490, TO_DATE('30/07/2003','DD/MM/YYYY'));
insert into t_aisb_usuario values(100001, 'M', 'Giulia Guedes', 28928875269, 64049815, TO_DATE('12/02/2002','DD/MM/YYYY'));
insert into t_aisb_usuario values(100002, 'M', 'Lourdes Santos', 22654215296, 56909440, TO_DATE('31/12/1990','DD/MM/YYYY'));
insert into t_aisb_usuario values(100003, 'NB', 'Victor Mendes', 52136277650, 69911460, TO_DATE('09/12/2003','DD/MM/YYYY'));
insert into t_aisb_usuario values(100004, 'M', 'Glória Maria', 38875303304, 34710040, TO_DATE('21/09/1998','DD/MM/YYYY'));
insert into t_aisb_usuario values(100005, 'H', 'Mathes Felipe', 45147765565, 65606660, TO_DATE('24/01/1990','DD/MM/YYYY'));
insert into t_aisb_usuario values(100006, 'H', 'Henry Rodrigues', 26025840296, 65040110, TO_DATE('22/05/2002','DD/MM/YYYY'));
insert into t_aisb_usuario values(100007, 'H', 'João Carlos', 63638173232, 77826474, TO_DATE('30/07/2003','DD/MM/YYYY'));
insert into t_aisb_usuario values(100008, 'M', 'Cármen Dias', 62438480351, 29055355, TO_DATE('30/07/2003','DD/MM/YYYY'));
insert into t_aisb_usuario values(100009, 'H', 'Lucas Fernandes', 18363724858, 68911045, TO_DATE('30/07/2003','DD/MM/YYYY'));

--Populando T_AISB_FUNCIONARIO
insert into t_aisb_funcionario values(120, 'Valerio Durães', 'duraesvalerio@gmail.com', 100);
insert into t_aisb_funcionario values(121, 'Marcos Belutti', 'marcosebelutti@gmail.com', 101);
insert into t_aisb_funcionario values(122, 'Matheus Cauan', 'matheusecauan@gmail.com', 102);
insert into t_aisb_funcionario values(123, 'Luan Santana', 'lu.santana@gmail.com', 103);
insert into t_aisb_funcionario values(124, 'Victor Matheus', 'matheusvictor@gmail.com', 104);
insert into t_aisb_funcionario values(125, 'Karol Dantas', 'karol.dantas@gmail.com', 105);
insert into t_aisb_funcionario values(126, 'Gustavo Lima', 'gustavolima@gmail.com', 106);
insert into t_aisb_funcionario values(127, 'Gizele Almeida', 'gizelealmeida@gmail.com', 107);
insert into t_aisb_funcionario values(128, 'Ana Castelo', 'anacastelo@gmail.com', 108);
insert into t_aisb_funcionario values(129, 'Cleide Santos', 'cleidesanto@gmail.com, 109');
commit;

--Populando T_AISB_RECOMENDACAO
insert into t_aisb_recomendacao values(100010, 100000, TO_DATE('03/05/2023','DD/MM/YYYY'), '');
insert into t_aisb_recomendacao values(100011, 100001, TO_DATE('01/02/2022','DD/MM/YYYY'), '');
insert into t_aisb_recomendacao values(100012, 100002, TO_DATE('10/11/2021','DD/MM/YYYY'), '');
insert into t_aisb_recomendacao values(100013, 100003, TO_DATE('28/09/2020','DD/MM/YYYY'), '');
insert into t_aisb_recomendacao values(100014, 100004, TO_DATE('30/07/2021','DD/MM/YYYY'), '');
insert into t_aisb_recomendacao values(100015, 100005, TO_DATE('14/08/2022','DD/MM/YYYY'), '');
insert into t_aisb_recomendacao values(100016, 100006, TO_DATE('12/01/2023','DD/MM/YYYY'), '');
insert into t_aisb_recomendacao values(100017, 100007, TO_DATE('23/09/2022','DD/MM/YYYY'), '');
insert into t_aisb_recomendacao values(100018, 100008, TO_DATE('11/10/2021','DD/MM/YYYY'), '');
insert into t_aisb_recomendacao values(100019, 100009, TO_DATE('08/03/2019','DD/MM/YYYY'), '');

--Populando T_AISB_PRODUTO
insert into t_aisb_produto values(140, 100010, 'Teclado', 'Teclado Mecânico', 399.99, 'Teclado Mecânico Branco HyperX', 'Periféricos');
insert into t_aisb_produto values(141, 100011, 'Camisa', 'Camisa Social', 199.99, 'Camisa Social Listrada', 'Vestimentas');
insert into t_aisb_produto values(142, 100012, 'Lasanha', 'Lasanha Bolonhesa', 29.99, 'Lasanha Bolonhesa', 'Periféricos');
insert into t_aisb_produto values(143, 100013, 'Televisão', 'Televisão LG', 1999.99, 'Televisão LG LED 49" 4K', 'Eletrônicos');
insert into t_aisb_produto values(144, 100014, 'Notebook', 'Notebook Acer', 2399.99, 'Notebook Acer com Touchscreen', 'Eletrônicos');
insert into t_aisb_produto values(145, 100015, 'Bola', 'Bola de Futebol', 99.99, 'Bola de Futebol', 'Artigos Esportivos');
insert into t_aisb_produto values(146, 100016, 'Carro', 'M240i', 299000.00, 'BMW M 240i Gasolina Automático', 'Veículos');
insert into t_aisb_produto values(147, 100017, 'Monitor', 'Monitor Gamer', 1499.99, 'Monitor Gamer 23" 144hz 1ms', 'Monitor');
insert into t_aisb_produto values(148, 100018, 'Calça', 'Calça Cargo', 399.99, 'Calça Cargo Preta', 'Vestimentas');
insert into t_aisb_produto values(149, 100019, 'Arroz', 'Arroz 5kg', 23.99, 'Arroz Camil 5kg', 'Condimento');

--Populando T_AISB_TRANSAÇÕES
insert into t_aisb_transacoes values(150, 100000, 100, 140, 1, 399.99, 69097585, TO_DATE('03/05/2023','DD/MM/YYYY'));
insert into t_aisb_transacoes values(151, 100001, 101, 141, 0, 199.99, 17022490, TO_DATE('01/02/2022','DD/MM/YYYY'));
insert into t_aisb_transacoes values(152, 100002, 102, 142, 1, 29.99, 64049815, TO_DATE('10/11/2021','DD/MM/YYYY'));
insert into t_aisb_transacoes values(153, 100003, 103, 143, 0, 1999.99, 56909440, TO_DATE('28/09/2020','DD/MM/YYYY'));
insert into t_aisb_transacoes values(154, 100004, 104, 144, 0, 2399.99, 69911460, TO_DATE('30/07/2021','DD/MM/YYYY'));
insert into t_aisb_transacoes values(155, 100005, 105, 145, 1, 99.99, 34710040, TO_DATE('14/08/2022','DD/MM/YYYY'));
insert into t_aisb_transacoes values(156, 100006, 106, 146, 1, 299000.00, 65606660, TO_DATE('12/01/2023','DD/MM/YYYY'));
insert into t_aisb_transacoes values(157, 100007, 107, 147, 1, 1499.99, 65040110, TO_DATE('23/09/2022','DD/MM/YYYY'));
insert into t_aisb_transacoes values(158, 100008, 108, 148, 0, 399.99, 77826474, TO_DATE('11/10/2021','DD/MM/YYYY'));
insert into t_aisb_transacoes values(159, 100009, 109, 149, 1, 239.99, 29055355, TO_DATE('08/03/2019','DD/MM/YYYY'));     





