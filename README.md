# shamir_scavengerhunt
Scavenger hunts using Shamir's Secret Sharing Scheme

## Prerequisites
* You should know how Shamir's Secret Sharing Scheme (SSSS) works (I highly recommend [Matt Parker's video](https://youtu.be/K54ildEW9-Q) on the subject)
* `ssss` (a GNU utility for splitting and combining keys using SSSS)
* `qrencode`
* `montage` (`imagemagick` suite)

## Hunt Generation
`generate.sh` allows easy generation of scavenger hunt items.
It takes input in the form of command-line options or interactivity.
Required options can be omitted and will be interactively requested (marked with `*`).
Command-line options are:
* -n, --name [name] *
	* Name of hunt (generated hunts are put in folders by the format of NAME_YYYY_MM)
* -k, --key [key] *
	* "key" for hunt - the output message from combined shares (objectives)
* -o, --objectives [count] *
	* Number of objectives to be generated
* -t, --threshold [count] *
	* Minimum number of objectives required to win the hunt
* -p, --print [printer name]
	* if this is present the QR codes will be printed to the specified printer. Otherwise, they can be manually printed or displayed using the image files generated.

## File Structure
Once a hunt has been created, it will be put in a folder within the current directory. For example a hunt with the name "hunter2", created in February of 2020 (5 objectives):
* hunter2_2020-02
	* qr/
		* 1.png
		* 2.png
		* 3.png
		* 4.png
		* 5.png
		* all.png
	* key
	* objectives

## Mobile Apps

### Android
Once the android app has been installed from the provided APK, usage should be intuitive.
1. Open the app.
2. If any previous objectives (scans) are present on the main screen, tap the `[Delete All]` button in the top right.
3. Enter threshold value in the labelled text box (default 5).
4. Scan objective codes with the `[Scan QR Code]` button in the top left. If there is an error, you may require a compatible QR reading app - I personally use [Binary Eye](https://github.com/markusfisch/BinaryEye) by Markus Fisch.
	* If a code has already been scanned and is in the list, a message will show mentioning as such.
	* To remove a scanned entry, tap on it in the list to select it, and hit the `[Delete]` button in the bottom right.
5. Once the threshold of objectives has been reached, the scan counter will turn green and the `[Finish]` button will become active. Tap this, and there will be a short pause until the result (goal text) is shown.
	* ***This pause is because in the most current version, the app uses what is effectively an online API (hijacks [pointatinfinity's SSSS demo site](http://point-at-infinity.org/ssss/demo.html)). This means that the app is currently not fully usable offline.***
6. On the result screen is a selectable *(and editable)* text box containing the output of the combination. Press the `[New Hunt]` button at the bottom of the screen to remove all scans and reset the threshold.
