require  " google_drive "

# Crée une session. Cela incitera les informations d' identification via la ligne de commande pour la 
# première fois et enregistrez - le config.json fichier pour des usages ultérieurs. 
# Voir ce document pour savoir comment créer config.json: 
# https://github.com/gimite/google-drive-ruby/blob/master/doc/authorization.md 
session =  GoogleDrive :: Session .from_config ( " config .json " )

# Première feuille de calcul de 
# https://docs.google.com/spreadsheet/ccc?key=pz7XtlQC-PYx-jrVMJErTcg 
# Ou https://docs.google.com/a/someone.com/spreadsheets/d/pz7XtlQC- PYx-jrVMJErTcg / edit? Usp = lecteur_web 
ws = session.spreadsheet_by_key ( " pz7XtlQC-PYx-jrVMJErTcg " ) .worksheets [ 0 ]

# Obtient le contenu de la cellule A2. 
p ws [ 2 , 1 ]   # ==> "hoge"

# Change le contenu des cellules. 
# Les modifications ne sont pas envoyées au serveur avant d'appeler ws.save (). 
ws [ 2 , 1 ] =  " foo " 
ws [ 2 , 2 ] =  " barre "
ws.save

# Vide toutes les cellules. 
( 1 ..ws.num_rows) .chaque faire | rangée |
  ( 1 ..ws.num_cols) .chaque chose | col |
    p ws [row, col]
   end 
end

# Encore une autre façon de le faire. 
p ws.rows   # ==> [["fuga", ""], ["foo", "barre]]

# Recharge la feuille de calcul pour obtenir les modifications d'autres clients. 
ws.reload