set linesize 500
set pagesize 0
set feed off
spool \\192.168.2.101\C$\Pricer\PFIFiles\DataFiles\hiper_sao_paulo_update.i1


select '0001'||' '||ean_cod_ean|| 								   			-- CODIGO EAN
' '||'5 0 '||'|'||ncc_descricao||'|'|| 								   			-- DESCRICAO SECAO
' '||'6 0 '||'|'||git_secao||'|'|| 								   			-- CODIGO DA SECAO
' '||'7 0 '||'|'||lpad(git_descricao,35,' ')||'|'|| 						   			-- DESCRICAO PRODUTO
' '||'10 0 '||'|'||git_tpo_emb_venda||'|'|| 										-- EMBALGEM PRODUTO
' '||'23 0 '||'|'||trunc(f_calcstpr(2,git_cod_item,'1'||to_char(sysdate ,'yymmdd'),1),0)||
rpad(ltrim(mod(f_calcstpr(2,git_cod_item,'1'||to_char(sysdate ,'yymmdd'),1),1),'.'),2,'0') ||'|'|| 			-- PRECO NORMAL
' '||'25 0 '||'|'||trunc(f_calcstpr(3,git_cod_item,'1'||to_char(sysdate ,'yymmdd'),1),0)||
rpad(ltrim(mod(f_calcstpr(3,git_cod_item,'1'||to_char(sysdate ,'yymmdd'),1),1),'.'),2,'0') ||'|'|| 			-- PRECO PROMOCAO
' '||'50 0 '||'|'||trunc(a1.get_estoque,0)||'|'||' '|| 						   			--ESTOQUE DA LOJA
' '||'101 0 '||'|'||git_cod_item||'-'||git_digito||'|'||' '|| 					   			-- CODIGO DO PRODUTO
' '||'102 0 '||'|'||decode(git_dat_sai_lin,0,' ','*')||'|'||' '|| 				   			-- DATA SAIDA DE LINHA
' '||'103 0 '||'|'||a1.get_estq_troca||'|'||' '||						  			-- ESTOQUE PADRAO
' '||'104 0 '||'|'||a1.get_tot_falta/100||'|'||' '|| 						   			-- PERCENTUAL DE REPOSICAO
' '||'105 0 '||'|'||git_emb_for||'|'||' '|| 										-- EMBALGEM FORNECEDOR
' '||'106 0 '||'|'||trunc(a1.get_vend_acum_ano,0)||rpad(ltrim(mod(a1.get_vend_acum_ano,1),'.'),2,'0')||'|'||' '|| 	-- COBERTURA
' '||'107 0 '||'|'||lpad(a1.get_dt_ult_ent,6,'0')||'|'||' '|| 								-- DATA DE ULTIMA ENTRADA
' '||'108 0 '||'|'||trunc(a1.get_estoque/decode(a1.get_vend_acum_ano,0,0.1,a1.get_vend_acum_ano),0)||'|'||' '|| 	-- SAIDA MEDIA
' '||'110 0 '||'|'||replace(to_char(round(a1.get_cus_ult_ent,2),'FM999999999990D00'),'.','')||'|'|| 			-- CUSTO DE ULTIMA ENTRADA
' '||'111 0 '||'|'||replace(to_char(round(a1.get_cus_ult_ent_bru/100,2),'FM999999999990D00'),'.','') ||'|'|| 		-- PRECO DE ULTIMA ENTRADA
' '||decode(f_calcstpr(3,git_cod_item,'1'||to_char(sysdate ,'yymmdd'),1),0,'121 0 |NORMAL|','121 0 |PROMO|')||
' '||'112 0 '||'|'||(select sum(get_estoque) from aa2cestq  where
 			get_cod_produto=git_cod_item||git_digito and
			git_sis_abast =10 )||'|'||','  									-- ESTOQUE TOTAL
from aa3citem,aa2cestq a1,aa3cnvcc,aa3ccean 
where a1.get_cod_produto=git_cod_item||git_digito 
and ean_cod_pro_alt = git_cod_item||git_digito
and git_sis_abast = 10 
and git_dat_sai_lin = 0 
and git_secao=ncc_secao and ncc_grupo=0 and ncc_subgrupo=0 and
length(ean_cod_ean) <= 13 and
a1.get_cod_local=19;


spool off;

quit;

temkg k