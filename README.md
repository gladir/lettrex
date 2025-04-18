# lettrex
Liste de commandes pour la littérature écrit en Pascal  (Turbo Pascal ou Free Pascal).

<h2>Liste des fichiers</h3>

Voici la liste des différents fichiers proposés dans lettrex :

<table>
  <tr>
    <th>Nom</th>
    <th>Description</th>
  </tr>
  <tr>
      <td><b>ABBREV.PAS</b></td>
      <td>Cette commande permet d'indiquer le nom complet d'une abréviation.</td>
  </tr>  
  <tr>
      <td><b>DEFNAME.PAS</b></td>
      <td>Cette commande permet d'indiquer la signification d'un nom propre.</td>
  </tr>
  <tr>
      <td><b>FINDCITY.PAS</b></td>
      <td>Cette commande permet de détecter les villes mentionnées dans un texte.</td>
  </tr>
  <tr>
      <td><b>FINDCTRY.PAS</b></td>
    <td>Cette commande permet de détecter les pays mentionnées dans un texte.</td>
  </tr>
		<tr>
			<td><b>FMT.PAS</b></td>
			<td>Cette commande permet de reformater le texte de paragraphe.</td>
		</tr>	
  <tr>
      <td><b>FINDNAME.PAS</b></td>
      <td>Cette commande permet de détecter les nom propres mentionnées dans un texte.</td>
  </tr>
  <tr>
	<td><b>HYPHEN.PAS</b></td>
        <td>Cette commande permet de rechercher les mots avec des traits-union. Cette commande est inspiré de la commande UNIX.</td>
  </tr>
  <tr>
  	<td><b>PREFIX.PAS</b></td>
	<td>Cette commande permet de connaitre le préfixe (avec son origine grecque, latine ou francaise) du mot spécifié.</td>
  </tr> 
  <tr>
	<td><b>QUI.PAS</b></td>
	<td>Cette commande permet de remplacer un mot QUI par un participe présent.</td>
  </tr>
  <tr>
  	<td><b>QUOTES.PAS</b></td>
	<td>Cette commande permet de rechercher des citations célèbres.</td>
  </tr>
  <tr>
  	<td><b>SUFFIX.PAS</b></td>
	<td>Cette commande permet de connaitre le suffixe (avec son origine grecque, latine ou francaise) du mot spécifié.</td>
  </tr>
  <tr>
	<td><b>VERBS.PAS</b></td>
	<td>Cette commande permet d'afficher les conjugaisons d'un verbe.</td>
  </tr>
  <tr>
  	<td><b>VOWELS.PAS</b></td>
	<td>Cette commande permet d'indiquer les voyelles mentionné dans un texte.</td> 
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
