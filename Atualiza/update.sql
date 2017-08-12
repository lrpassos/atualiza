update detcupom set det_ean = 3602827052384 where det_ean = 22761;
update detcupom set det_ean = 3000001004394 where det_ean = 10043;
update detcupom set det_ean = 3000001880349 where det_ean = 18803;
update detcupom set det_ean = 3000001193692 where det_ean = 11936;
update detcupom set det_ean = 7894474002638 where det_ean = 19014;
update detcupom set det_ean = 3000001693406 where det_ean = 16934;
update detcupom set det_ean = 3000001693581 where det_ean = 16935;
update detcupom set det_ean = 7894904015078 where det_ean = 54160;
update detcupom set det_ean = 7898146710647 where det_ean = 47646;
update detcupom set det_ean = 7898146710630 where det_ean = 47645;
update detcupom set det_ean = 3000002673179 where det_ean = 26731;
update detcupom set det_ean = 3000002325306 where det_ean = 23253;
update detcupom set det_ean = 3000002069460 where det_ean = 20694;
update detcupom set det_ean = 7896082500230 where det_ean = 12389;
update detcupom set det_ean = 3000001670612 where det_ean = 16706;
update detcupom set det_ean = 7896005806241 where det_ean = 61642;
update detcupom set det_ean = 7898490164660 where det_ean = 62407;
update detcupom set det_ean = 3000003404307 where det_ean = 34043;
update detcupom set det_ean = 7898296880054 where det_ean = 64276;
update detcupom set det_ean = 7898935435027 where det_ean = 46075;
update detcupom set det_ean = 3000001578642 where det_ean = 15786;
update detcupom set det_ean = 3000001518907 where det_ean = 15189;  

If @@error = 0
  COMMIT TRANSACTION
Else
  ROLLBACK TRANSACTION



exit