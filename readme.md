# Progetto-ASW-2018
Repository per il progetto del corso di Architettura dei sistemi software dell'università Roma Tre:

Sperimentazione della continuous delivery con Jenkins

Sviluppatori:
- Lorenzo Guidaldi
- Davide Soldani
- Andrea Serrecchia
- Giorgia Marini

Software necessari per l'esecuzione dell'ambiente:
- virtualbox
- vagrant
- git

L'ambiente è avviabile posizionandosi col terminale nella cartella "environment" e avviando lo script run-all.sh

Una volta completato il processto automatico di provisioning dell'ambiente, saranno attive due macchine virtuali:
- devVm, in cui è contenuto un repository git locale con un semplice progetto spring boot (con gradle)
- jenkinsVm, in cui è installato docker ed è avviato un container jenkins

Istruzioni per accedere al repository di devVm:
- vagrant up devVm
- clonare l'indirizzo ssh://vagrant@192.168.0.160/home/asw/dev-git/.git, password=vagrant

Per controllare lo stato della repository di devVm:
- da SSH: git ls-tree --full-tree -r HEAD

Indirizzo dell'istanza jenkins del container:
localhost:8089

Funzionamento:
- Clonare il repository di devVm
- Effettuare modifiche al progetto clonato
- Effettuare commit e push delle modifiche al repository di devVm
- A questo punto l'istanza jenkins contenuta nel container docker della macchina virtuale jenkinsVm si attiverà, effettuerà build e test dell'applicazione all'interno di devVm e la rilascerà in un nuovo container docker all'interno della macchina jenkinsVm

Nota: l'istanza jenkins è settata di default per attiverarsi in ogni caso ogni 10 minuti (sia che sia stato effettuata una modifica al repository di devVm che no).

