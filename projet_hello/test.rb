require "google_drive"

# Crée une session. Cela incitera les informations d' identification via la ligne de commande pour la 
# première fois et enregistrez - le config.json fichier pour des usages ultérieurs. 
# Voir ce document pour savoir comment créer config.json: 
# https://github.com/gimite/google-drive-ruby/blob/master/doc/authorization.md
session = GoogleDrive::Session.from_config("config.json")

# Obtient la liste des fichiers distants.
session.files.each do |file|
  p file.title
end

# Télécharge un fichier local.
session.upload_from_file("hello.txt", "hello.txt", convert: false)

# Téléchargements dans un fichier local.
file = session.file_by_title("hello.txt")
file.download_to_file("hello.txt")

# Met à jour le contenu du fichier distant.
file.update_from_file("hello.txt")