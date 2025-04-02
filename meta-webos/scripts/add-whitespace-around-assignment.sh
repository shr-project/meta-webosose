#!/bin/bash

# https://lists.openembedded.org/g/bitbake-devel/message/17508

LOG=$1

# it's a bit silly and simple but resolved 99% of the issues in layers I'm using
grep WARNING:.*whitespace.around.the.assignment $LOG | sort -u | while read LINE; do
    # there could be 2 paths as in:
    # WARNING: meta-webos/recipes-core/packagegroups/packagegroup-core-tools-profile.bbappend:10 has a lack of whitespace around the assignment: 'LTTNGTOOLS:no-lttng= ""'
    # WARNING: oe-core/meta/recipes-core/packagegroups/packagegroup-core-tools-profile.bb: meta-webos/recipes-core/packagegroups/packagegroup-core-tools-profile.bbappend:10 has a lack of whitespace around the assignment: 'LTTNGTOOLS:no-lttng= ""'
    # but some global files will be shown only once e.g.:
    # WARNING: meta-foo/conf/layer.conf:10 has a lack of whitespace around the assignment: 'BBFILE_PATTERN_meta-foo:= "^${LAYERDIR}/"'
    # the paths are full, I've just stripped the TOPDIR prefix
    # always take the one with lineno which is what we want to change

    f=`echo $LINE | sed "s/^WARNING: \([^:]*: \)*\([^:]\+\):\([0-9]\+\) has a lack of whitespace around the assignment: '\(.*\)'$/\2/g"`
    #l=`echo $LINE | sed "s/^WARNING: \([^:]*: \)*\([^:]\+\):\([0-9]\+\) has a lack of whitespace around the assignment: '\(.*\)'$/\3/g"`
    p=`echo $LINE | sed "s/^WARNING: \([^:]*: \)*\([^:]\+\):\([0-9]\+\) has a lack of whitespace around the assignment: '\(.*\)'$/\4/g"`

    if [ ! -f "$f" ] ; then
        echo "ERROR: failed to parse filename from $LINE"
        continue
    fi

    for o in ??= ?= += =+ := \\\\.= =\\\\. =; do
        # replace only first one found to avoid adding space in ??= (when doing ?=) or += (when doing =)
        if echo $p | grep -qG "[^ ]$o" || echo $p | grep -qG "$o[^ ]"; then
            pp=$(echo $p | sed "s/ *$o */ $o /g; s/^'//g; s/'$//g")
            echo "sed -i 's@$p@$pp@g' $f"
            # some cases might have ^ like in "^${LAYERDIR}/", so use e.g. @ to convert them,
            # but @ is often used in ${@..} so pick a character not used in the WARNINGs you got.

            # there are some other limitations as well as some patterns might have ' or " in them
            # or both typically with ${@..}, e.g. one of mine:
            # 'WEBOS_SUBMISSION_NUMBER="${@ '${WEBOS_SUBMISSION}'.split('.')[-1] }"'
            # either fix those manually or with manual sed matching just a part of it.

            # another case where this won't work are variables with line breaks e.g.:
            # 'CXXFLAGS +="     -I${STAGING_INCDIR}/media-resource-calculator-clang     -I${STAGING_INCDIR}/cbe "'
            # is triggered on recipe which has:
            # CXXFLAGS +=" \
            #    -I${STAGING_INCDIR}/media-resource-calculator-clang \
            #    -I${STAGING_INCDIR}/cbe \
            # "
            # and the regexp again doesn't work

            # it also doesn't work well on cases like:
            # 'EXTRA_OEMAKE="BUILDTAGS=''"'
            # often used in meta-virtualization where only first = should have spaces around

            # sed -i 's^'"$p"'^'"$pp"'^g' $f
            # sed -i 's@'"$p"'@'"$pp"'@g' $f
            sed -i 's&'"$p"'&'"$pp"'&g' $f
            break;
        fi
    done
done
