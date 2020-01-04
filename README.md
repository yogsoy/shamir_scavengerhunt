# shamir_scavengerhunt
Scavenger hunts using Shamir's Secret Sharing Scheme

##Prerequisites
* You should know how Shamir's Secret Sharing Scheme (SSSS) works
* `ssss`
* `qrencode`

##Generation
`generate.sh` allows easy generation of scavenger hunt items.
It takes input in the form of command-line options or interactivity.
Command-line options are:
* -n, --name
	* Name of hunt (generated hunts are put in folders by the format of NAME_YYYY_MM)
* -k, --key
	* "key" for hunt - the output message from combined shares (objectives)
* -o, --objectives
	* Number of objectives to be generated
* -t, --threshold
	* Minimum number of objectives required to win the hunt
Either all or none of these options must be supplied. If none are supplied, interactive input will be used.

##Structure
Once a hunt has been created, it will be put in a folder within the current directory. For example a hunt with the name "hunter2", created in February of 2020 (5 objectives):
* hunter2_2020-02
	* **qr**
		* 1.png
		* 2.png
		* 3.png
		* 4.png
		* 5.png
	* key
	* objectives
