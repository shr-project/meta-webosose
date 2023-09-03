# Backport changes from:
# https://lists.openembedded.org/g/openembedded-devel/message/104697

EXTRA_OESCONS += "--use-hardware-crc32=${@bb.utils.contains('TUNE_FEATURES', 'crc', 'on', 'off', d)}"
