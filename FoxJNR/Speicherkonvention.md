# SPEICHERKONVENTIONEN</br>
## Levelauswahl</br>
Zu speichernde Daten unter: user://saves/levels.save</br>
* Hier wird für jedes Level ein Bool abgespeichert
* True, wenn das Level abgeschlossen ist, False, wenn nicht.</br>
Bedingungen, wann ein Level betretbar ist, wird über Code gelöst:</br>
z.B. Wenn Lvl1 und Lvl2 erledigt -> Dann betretbar usw.</br>
** SCOPE: Global</br></br>
*** FORMAT: {level_id}:{0/1}

## Collectables</br>
Zu speichernde Daten unter: user://saves/collectables.save</br>
* Hier werden Daten zu den einzigartigen Collectables der Levels gespeichert</br>
Mit diesen Daten werden die Collectables in Levels ausgegraut</br>
und die Collectables im Museum ausgestellt</br>
** SCOPE: Museum, Global</br>
*** FORMAT: {collectable_id}:{0/1}

## Positionen von Objekten</br>
Zu speichernde Daten unter: user://saves/{level_id}/{scene}_objects.save</br>
* X und Y Koordinaten der beweglichen Objekte.</br>
* Status, z.B. "gedrückt" bei Knöpfen.</br>
** SCOPE: Level</br>
*** FORMAT: {object_id}.{Variablename}:{value}</br>

## Dynamische Position für Spieler</br>
Zu speichernde Daten unter: user://saves/player.save
* Hier wird die Spielerposition beim Verlassen der Szene für die nächste</br>
* Szene zwischengespeichert.</br>
* Beim Betreten einer neuen Szene wird die Datei ausgelesen und geleert,</br>
* woraufhin die Spielerposition gesetzt wird.</br>
** SCOPE: Temporary
*** FORMAT:</br>
*** {xValue}
*** {yValue}