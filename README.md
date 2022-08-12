# lettrex
Liste de commandes pour la littérature écrit en Pascal

<h2>Liste des fichiers</h3>

Voici la liste des différents fichiers proposés dans lettrex :

<table>
  <tr>
    <th>Nom</th>
    <th>Description</th>
  </tr>
  <tr>
      <td><b>FINDCITY.PAS</b></td>
      <td>Cette commande permet de détecter les villes mentionnées dans un texte.</td>
  </tr>
  <tr>
      <td><b>FINDCTRY.PAS</b></td>
    <td>Cette commande permet de détecter les pays mentionnées dans un texte.</td>
  <tr>
      <td><b>FINDNAME.PAS</b></td>
      <td>Cette commande permet de détecter les nom propres mentionnées dans un texte.</td>
  </tr>
  <tr>
	<td><b>HYPHEN.PAS</b></td>
        <td>Cette commande permet de rechercher les mots avec des traits-union. Cette commande est inspiré de la commande UNIX.</td>
  </tr>
  <tr>
  	<td><b>SUFFIX.PAS</b></td>
	<td>Cette commande permet de connaitre le suffixe (avec son origine grecque, latine ou francaise) du mot spécifié.</td>
  </tr>
  <tr>
	<td><b>VERBS.PAS</b></td>
	<td>Ce paramètre permet d'afficher les conjuguaisons d'un verbe.</td>
  </tr>
 </table>

<h2>Compilation</h2>
	
Les fichiers Pascal n'ont aucune dépendances, il suffit de télécharger le fichier désiré et de le compiler avec Free Pascal avec la syntaxe de commande  :

<pre><b>fpc</b> <i>LEFICHIER.PAS</i></pre>
	
Sinon, vous pouvez également le compiler avec le Turbo Pascal à l'aide de la syntaxe de commande suivante :	

<pre><b>tpc</b> <i>LEFICHIER.PAS</i></pre>
	
Par exemple, si vous voulez compiler VERBS.PAS, vous devrez tapez la commande suivante :

<pre><b>fpc</b> VERBS.PAS</pre>

<h2>Licence</h2>
<ul>
 <li>Le code source est publié sous la licence <a href="https://github.com/gladir/lettrex/blob/main/LICENSE">MIT</a>.</li>
 <li>Le paquet original est publié sous la licence <a href="https://github.com/gladir/lettrex/blob/main/LICENSE">MIT</a>.</li>
</ul>
