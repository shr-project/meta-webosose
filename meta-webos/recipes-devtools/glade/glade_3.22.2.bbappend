# http://gecko.lge.com:8000/Errors/Details/832869
# glade-3.22.2/gladeui/glade-widget.c:1822:36: error: assignment to 'GtkWidget *' {aka 'struct _GtkWidget *'} from incompatible pointer type 'GObject *' {aka 'struct _GObject *'} [-Wincompatible-pointer-types]
# glade-3.22.2/gladeui/glade-command.c:920:23: error: assignment to 'GladeProperty *' {aka 'struct _GladeProperty *'} from incompatible pointer type 'GObject *' {aka 'struct _GObject *'} [-Wincompatible-pointer-types]
# glade-3.22.2/gladeui/glade-command.c:1253:21: error: assignment to 'GladeWidget *' {aka 'struct _GladeWidget *'} from incompatible pointer type 'GObject *' {aka 'struct _GObject *'} [-Wincompatible-pointer-types]
# glade-3.22.2/gladeui/glade-command.c:1419:21: error: assignment to 'GladeWidget *' {aka 'struct _GladeWidget *'} from incompatible pointer type 'GObject *' {aka 'struct _GObject *'} [-Wincompatible-pointer-types]
CFLAGS += "-Wno-error=incompatible-pointer-types"
