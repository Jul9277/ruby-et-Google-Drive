require 'bundler'
Bundler.require
 
# Authenticate a session with your Service Account
session = GoogleDrive::Session.from_service_account_key("../client_secret.json")
 
# Get the spreadsheet by its title
spreadsheet = session.spreadsheet_by_title("Copie de Legislators 2017")
# Get the first worksheet
worksheet = spreadsheet.worksheets.first
# Print out the first 6 columns of each row
worksheet.rows.each { |row| puts row.first(6).join(" | ") }
=begin
#1.Insérer une ligne de donnée avec la méthode insert_row au dessus de la ligne qu'on fournit(ici la ligne 2).
#Cela va insérer une seule. ligne au-dessus de la première ligne de données.
worksheet.insert_rows(2, [["Hello!", "This", "was", "inserted", "via", "Ruby"]])
worksheet.save

#2.Pour insérer une ligne au bas de toutes les lignes existantes, utilisez la num_rows methode
worksheet.insert_rows(worksheet.num_rows + 1, [["Hello!", "This", "was", "inserted", "at", "the", "bottom"]])
worksheet.save


#3. Pour référencer la cellule par numéro de ligne de colonne.
worksheet[2, 1] = "Updated!"
worksheet.save
=end

# Pour utiliser le nom de la cellule
worksheet["A2"] = "Updated again!"
worksheet.save

#4. Pour supprimer des lignes, vous devez indiquer le numéro de ligne et le nombre de lignes que vous souhaitez supprimer.
worksheet.delete_rows(2, 1)
worksheet.save
