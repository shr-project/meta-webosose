# backport fix from:
# https://lists.openembedded.org/g/openembedded-devel/message/85110
EXTRA_OEMAKE += "INSTALL_LIB=${baselib}"
