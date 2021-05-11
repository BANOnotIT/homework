/\.(rb|jbuilder)$|Gemfile/ {
	print "." $0
	print "[source,ruby]"
	print "----"
	print "include::" $0 "[]"
	print "----"
	print ""
}
/\.js$/ {
	print "." $0
	print "[source,javascript]"
	print "----"
	print "include::" $0 "[]"
	print "----"
	print ""
}
/\.erb$/ {
	print "." $0
	print "[source,erb]"
	print "----"
	print "include::" $0 "[]"
	print "----"
	print ""
}
/\.erb$/ {
	print "." $0
	print "[source,erb]"
	print "----"
	print "include::" $0 "[]"
	print "----"
	print ""
}
/\.json$/ {
	print "." $0
	print "[source,json]"
	print "----"
	print "include::" $0 "[]"
	print "----"
	print ""
}
/\.yml$/ {
	print "." $0
	print "[source,yaml]"
	print "----"
	print "include::" $0 "[]"
	print "----"
	print ""
}
/\.scss$/ {
	print "." $0
	print "[source,css]"
	print "----"
	print "include::" $0 "[]"
	print "----"
	print ""
}
