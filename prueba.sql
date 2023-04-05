SELECT CICLISTA.Nombre_Ciclista, CICLISTA.Nombre_Equipo, LLEVA.Numero_De_Etapa  FROM CICLISTA, LLEVA WHERE Codigo_Jersey = 6 AND LLEVA.Dorsal_Ciclista=CICLISTA.Dorsal;
