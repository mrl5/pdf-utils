# ToDo list

## Software
* [ ] Determine OS
* [ ] Check for dependencies
    * [ ] Dependencies stored in JSON
	    * [ ] Dependency name (e.g. Ghostscript)
		* [ ] Dependency minimum version
		* [ ] Dependency maximum version (optional field)
		* [ ] Known locations of dependency (OS dependant)
	* [ ] If dependency is absent, ask user for a /path/to/dependency
	* [ ] Check for dependencies versions
	* [ ] Create aliases of dependencies
		* [ ] `python` for Python3
		* [ ] `gs` for Ghostscript
* [ ] Translate bash scripts to Python
	* [ ] merge-pdf.sh
	* [ ] split-pdf.sh
	* [ ] watermark-pdf.sh
	* [ ] stamp-pdf.sh
* [ ] Feature to check if input.pdf exists
* [ ] Feature to check if output.pdf exists
	* [ ] Ask to overwrite
	* [ ] If not, modify name
* [ ] Feature to modify scripts in *postscript/* directory
* [ ] Create CLI
	* [ ] Ask for action
	* [ ] Get parameters (e.g. watermark text)
	* [ ] Settings management
		* [ ] Paths to dependencies
		* [ ] Watermark options etc.
		* [ ] Default output directory
		* [ ] Default PDF viewer (to open fresh output.pdf)
