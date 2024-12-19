# Copyright (c) 2024 LG Electronics, Inc.

SUMMARY = "A loctool plugin that knows how to process qml files"
# WARNING: the following LICENSE and LIC_FILES_CHKSUM values are best guesses - it is
# your responsibility to verify that the values are complete and correct.
#
# NOTE: multiple licenses have been detected; they have been separated with &
# in the LICENSE value for now since it is a reasonable assumption that all
# of the licenses apply. If instead there is a choice between the multiple
# licenses then you should change the value to separate the licenses with |
# instead of &. If there is any doubt, check the accompanying documentation
# to determine which situation is applicable.
LICENSE = "Apache-2.0 & ISC & MIT & BSD-3-Clause & Python-2.0"
LIC_FILES_CHKSUM = "file://LICENSE;md5=86d3f3a95c324c9479bd8986968f4327 \
                    file://node_modules/@types/hast/LICENSE;md5=d4a904ca135bb7bc912156fee12726f0 \
                    file://node_modules/@types/mdast/LICENSE;md5=d4a904ca135bb7bc912156fee12726f0 \
                    file://node_modules/@types/parse5/LICENSE;md5=d4a904ca135bb7bc912156fee12726f0 \
                    file://node_modules/@types/unist/LICENSE;md5=d4a904ca135bb7bc912156fee12726f0 \
                    file://node_modules/array-buffer-byte-length/LICENSE;md5=03c1a46f1c5121c7eb2cd13d6cb56831 \
                    file://node_modules/array.prototype.reduce/LICENSE;md5=375dc7ca936a14e9c29418d5263bd066 \
                    file://node_modules/arraybuffer.prototype.slice/LICENSE;md5=968ec55067e4739372aa780aab6b3f11 \
                    file://node_modules/available-typed-arrays/LICENSE;md5=838b75dc6028daf3e04e57871b7ad3ed \
                    file://node_modules/bail/license;md5=91fb5297439b32d9cd49df8a2484d3eb \
                    file://node_modules/braces/LICENSE;md5=0f64900f8f30e53054962c9f1fc3205b \
                    file://node_modules/build-gradle-reader/LICENSE;md5=e3fc50a88d0a364313df4b21ef20c29e \
                    file://node_modules/call-bind/LICENSE;md5=0eb2c73daa0ecf037cbdf3d0bb0c98d5 \
                    file://node_modules/ccount/license;md5=91fb5297439b32d9cd49df8a2484d3eb \
                    file://node_modules/character-entities-html4/license;md5=91fb5297439b32d9cd49df8a2484d3eb \
                    file://node_modules/character-entities-legacy/license;md5=91fb5297439b32d9cd49df8a2484d3eb \
                    file://node_modules/character-entities/license;md5=91fb5297439b32d9cd49df8a2484d3eb \
                    file://node_modules/character-reference-invalid/license;md5=91fb5297439b32d9cd49df8a2484d3eb \
                    file://node_modules/cldr-segmentation/LICENSE;md5=e6a59ad15bc9bda803327d372c987aeb \
                    file://node_modules/collapse-white-space/license;md5=91fb5297439b32d9cd49df8a2484d3eb \
                    file://node_modules/comma-separated-tokens/license;md5=8e9f707ac01af145c36ef2adde15d7e4 \
                    file://node_modules/data-view-buffer/LICENSE;md5=06aae85028f50ba69e6f83b6c9402b26 \
                    file://node_modules/data-view-byte-length/LICENSE;md5=8fe23ea421aaf9f9d687709f6a6a09b7 \
                    file://node_modules/data-view-byte-offset/LICENSE;md5=8fe23ea421aaf9f9d687709f6a6a09b7 \
                    file://node_modules/date-format/LICENSE;md5=11e69b4aa865a34554aefa2958c837cf \
                    file://node_modules/debug/LICENSE;md5=d85a365580888e9ee0a01fb53e8e9bf0 \
                    file://node_modules/deep-assign/license;md5=a12ebca0510a773644101a99a867d210 \
                    file://node_modules/define-data-property/LICENSE;md5=06aae85028f50ba69e6f83b6c9402b26 \
                    file://node_modules/define-properties/LICENSE;md5=53ffc646fdb83e45279cfe7105e5157b \
                    file://node_modules/denque/LICENSE;md5=f49b524d140e2dcf1b437d9185172531 \
                    file://node_modules/es-abstract/LICENSE;md5=8eddf3932f9ef22313648669213a2e4b \
                    file://node_modules/es-array-method-boxes-properly/LICENSE;md5=375dc7ca936a14e9c29418d5263bd066 \
                    file://node_modules/es-define-property/LICENSE;md5=8fe23ea421aaf9f9d687709f6a6a09b7 \
                    file://node_modules/es-errors/LICENSE;md5=8fe23ea421aaf9f9d687709f6a6a09b7 \
                    file://node_modules/es-object-atoms/LICENSE;md5=8fe23ea421aaf9f9d687709f6a6a09b7 \
                    file://node_modules/es-set-tostringtag/LICENSE;md5=92e9d482d23fb5be48580cb5e3d82a22 \
                    file://node_modules/es-to-primitive/LICENSE;md5=5db8fa3e421a3211e6a3dc68544da455 \
                    file://node_modules/extend/LICENSE;md5=33d9f7a91df276ec16aa941032ee1476 \
                    file://node_modules/fault/license;md5=91fb5297439b32d9cd49df8a2484d3eb \
                    file://node_modules/fill-range/LICENSE;md5=0f64900f8f30e53054962c9f1fc3205b \
                    file://node_modules/flatted/LICENSE;md5=73d317079e156478653d02207ca984da \
                    file://node_modules/for-each/LICENSE;md5=726a37665a35c687bf935f1503efee20 \
                    file://node_modules/fs-extra/LICENSE;md5=ea817882455c03503f7d014a8f54f095 \
                    file://node_modules/function-bind/LICENSE;md5=e7417c1a8ad83f88bcac21ad440d48b2 \
                    file://node_modules/function.prototype.name/LICENSE;md5=7d84e54df3d29e3cbd74b7368b844db4 \
                    file://node_modules/functions-have-names/LICENSE;md5=375dc7ca936a14e9c29418d5263bd066 \
                    file://node_modules/generate-function/LICENSE;md5=9befe7026bf915886cd566a98117c80e \
                    file://node_modules/get-intrinsic/LICENSE;md5=0eb2c73daa0ecf037cbdf3d0bb0c98d5 \
                    file://node_modules/get-symbol-description/LICENSE;md5=a026b78b6909aa5e21d77709fb6b5156 \
                    file://node_modules/globalthis/LICENSE;md5=7d84e54df3d29e3cbd74b7368b844db4 \
                    file://node_modules/gopd/LICENSE;md5=8478c87d16770f6d32a4578c475d3930 \
                    file://node_modules/graceful-fs/LICENSE;md5=163972d49c2f7a3d3b687aeb48e9e3c9 \
                    file://node_modules/has-bigints/LICENSE;md5=375dc7ca936a14e9c29418d5263bd066 \
                    file://node_modules/has-property-descriptors/LICENSE;md5=d237eac07663bde2409de740ba75ec97 \
                    file://node_modules/has-proto/LICENSE;md5=d237eac07663bde2409de740ba75ec97 \
                    file://node_modules/has-symbols/LICENSE;md5=afee57a289508ed4df3456667778aaf6 \
                    file://node_modules/has-tostringtag/LICENSE;md5=a026b78b6909aa5e21d77709fb6b5156 \
                    file://node_modules/hasown/LICENSE;md5=19283ee92f78c91154834571c1f05a94 \
                    file://node_modules/hast-to-hyperscript/license;md5=8e9f707ac01af145c36ef2adde15d7e4 \
                    file://node_modules/hast-util-from-parse5/license;md5=8e9f707ac01af145c36ef2adde15d7e4 \
                    file://node_modules/hast-util-parse-selector/license;md5=8e9f707ac01af145c36ef2adde15d7e4 \
                    file://node_modules/hast-util-raw/license;md5=8e9f707ac01af145c36ef2adde15d7e4 \
                    file://node_modules/hast-util-to-parse5/license;md5=8e9f707ac01af145c36ef2adde15d7e4 \
                    file://node_modules/hastscript/license;md5=8e9f707ac01af145c36ef2adde15d7e4 \
                    file://node_modules/he/LICENSE-MIT.txt;md5=ee9bd8b835cfcd512dd644540dd96987 \
                    file://node_modules/highlight.js/LICENSE;md5=1536cfb4c71fcc69423296231a64c1c4 \
                    file://node_modules/html-parser/LICENSE;md5=b45f46767d6a24a08670f5c29d6963e1 \
                    file://node_modules/html-void-elements/license;md5=8e9f707ac01af145c36ef2adde15d7e4 \
                    file://node_modules/iconv-lite/LICENSE;md5=f942263d98f0d75e0e0101884e86261d \
                    file://node_modules/ilib-loctool-webos-ts-resource/LICENSE;md5=86d3f3a95c324c9479bd8986968f4327 \
                    file://node_modules/ilib-tree-node/LICENSE;md5=86d3f3a95c324c9479bd8986968f4327 \
                    file://node_modules/ilib/LICENSE;md5=3b83ef96387f14655fc854ddc3c6bd57 \
                    file://node_modules/inherits/LICENSE;md5=5b2ef2247af6d355ae9d9f988092d470 \
                    file://node_modules/internal-slot/LICENSE;md5=375dc7ca936a14e9c29418d5263bd066 \
                    file://node_modules/is-alphabetical/license;md5=8e9f707ac01af145c36ef2adde15d7e4 \
                    file://node_modules/is-alphanumeric/license;md5=bfcc9617a965b5c995c74a0993d31c9c \
                    file://node_modules/is-alphanumerical/license;md5=8e9f707ac01af145c36ef2adde15d7e4 \
                    file://node_modules/is-array-buffer/LICENSE;md5=db2b446565e5f8d6041d1c10fb307510 \
                    file://node_modules/is-async-function/LICENSE;md5=1774bb38ea33e65bacbceefde978d961 \
                    file://node_modules/is-bigint/LICENSE;md5=291be6f19f64188a89ffd5180aea06f7 \
                    file://node_modules/is-boolean-object/LICENSE;md5=5db8fa3e421a3211e6a3dc68544da455 \
                    file://node_modules/is-buffer/LICENSE;md5=badd5e91c737e7ffdf10b40c1f907761 \
                    file://node_modules/is-callable/LICENSE;md5=5db8fa3e421a3211e6a3dc68544da455 \
                    file://node_modules/is-data-view/LICENSE;md5=7b5e8558141b64e8475183ea02f2de77 \
                    file://node_modules/is-date-object/LICENSE;md5=5db8fa3e421a3211e6a3dc68544da455 \
                    file://node_modules/is-decimal/license;md5=8e9f707ac01af145c36ef2adde15d7e4 \
                    file://node_modules/is-finalizationregistry/LICENSE;md5=838b75dc6028daf3e04e57871b7ad3ed \
                    file://node_modules/is-generator-function/LICENSE;md5=d22b3eb619d81197fd4f3ca47c2c1ea5 \
                    file://node_modules/is-hexadecimal/license;md5=8e9f707ac01af145c36ef2adde15d7e4 \
                    file://node_modules/is-map/LICENSE;md5=c18cc44449ec61c93b216bf74e6c4fa4 \
                    file://node_modules/is-negative-zero/LICENSE;md5=d22b3eb619d81197fd4f3ca47c2c1ea5 \
                    file://node_modules/is-number-object/LICENSE;md5=5db8fa3e421a3211e6a3dc68544da455 \
                    file://node_modules/is-number/LICENSE;md5=0f64900f8f30e53054962c9f1fc3205b \
                    file://node_modules/is-obj/license;md5=a12ebca0510a773644101a99a867d210 \
                    file://node_modules/is-plain-obj/license;md5=915042b5df33c31a6db2b37eadaa00e3 \
                    file://node_modules/is-property/LICENSE;md5=34aed54d1454553d81a843e946b173a0 \
                    file://node_modules/is-regex/LICENSE;md5=d22b3eb619d81197fd4f3ca47c2c1ea5 \
                    file://node_modules/is-set/LICENSE;md5=c18cc44449ec61c93b216bf74e6c4fa4 \
                    file://node_modules/is-shared-array-buffer/LICENSE;md5=a026b78b6909aa5e21d77709fb6b5156 \
                    file://node_modules/is-string/LICENSE;md5=5db8fa3e421a3211e6a3dc68544da455 \
                    file://node_modules/is-symbol/LICENSE;md5=5db8fa3e421a3211e6a3dc68544da455 \
                    file://node_modules/is-typed-array/LICENSE;md5=5db8fa3e421a3211e6a3dc68544da455 \
                    file://node_modules/is-weakmap/LICENSE;md5=c18cc44449ec61c93b216bf74e6c4fa4 \
                    file://node_modules/is-weakref/LICENSE;md5=838b75dc6028daf3e04e57871b7ad3ed \
                    file://node_modules/is-weakset/LICENSE;md5=c18cc44449ec61c93b216bf74e6c4fa4 \
                    file://node_modules/is-whitespace-character/license;md5=8e9f707ac01af145c36ef2adde15d7e4 \
                    file://node_modules/is-word-character/license;md5=8e9f707ac01af145c36ef2adde15d7e4 \
                    file://node_modules/isarray/LICENSE;md5=a5df515ef062cc3affd8c0ae59c059ec \
                    file://node_modules/js-stl/Docs/assets/vendor/prettify/COPYING;md5=3b83ef96387f14655fc854ddc3c6bd57 \
                    file://node_modules/jsonfile/LICENSE;md5=423f377ade95936f6fe009b1c137bfdb \
                    file://node_modules/loctool/LICENSE.txt;md5=578915003022e6b28128e6696dddbb46 \
                    file://node_modules/loctool/node_modules/argparse/LICENSE;md5=203a6dbc802ee896020a47161e759642 \
                    file://node_modules/loctool/node_modules/js-yaml/LICENSE;md5=effd621a9bf5d72d6a7e6ef819bf3afb \
                    file://node_modules/log4js/LICENSE;md5=8a7df09be5dd1002c10a82f81acd84aa \
                    file://node_modules/long/LICENSE;md5=3b83ef96387f14655fc854ddc3c6bd57 \
                    file://node_modules/longest-streak/license;md5=7e5307a85144ae88c8ce8eb803918a97 \
                    file://node_modules/lowlight/license;md5=8e9f707ac01af145c36ef2adde15d7e4 \
                    file://node_modules/markdown-escapes/license;md5=8e9f707ac01af145c36ef2adde15d7e4 \
                    file://node_modules/markdown-table/license;md5=f94eeeb01d2350e09cda730abca93641 \
                    file://node_modules/mdast-util-compact/license;md5=8e9f707ac01af145c36ef2adde15d7e4 \
                    file://node_modules/mdast-util-definitions/license;md5=8e580608fef28eaa1f447c3841cc0733 \
                    file://node_modules/mdast-util-to-hast/license;md5=8e9f707ac01af145c36ef2adde15d7e4 \
                    file://node_modules/mdurl/LICENSE;md5=4dd6bce4f4fc62f6f51f603c406c145b \
                    file://node_modules/message-accumulator/LICENSE;md5=86d3f3a95c324c9479bd8986968f4327 \
                    file://node_modules/micromatch/LICENSE;md5=0f64900f8f30e53054962c9f1fc3205b \
                    file://node_modules/ms/license.md;md5=2b8bc52ae6b7ba58e1629deabd53986f \
                    file://node_modules/mysql2/License;md5=2a1f909a00f4153f872e06a19956a8a5 \
                    file://node_modules/mysql2/node_modules/lru-cache/LICENSE;md5=28b53f8938bb3cf7c37ed8ac5e7d233e \
                    file://node_modules/mysql2/typings/mysql/LICENSE.txt;md5=241c728bb6ff867879b0df611bc5c94e \
                    file://node_modules/named-placeholders/LICENSE;md5=9eb95c00b28c13174dfe2e22dc1d662b \
                    file://node_modules/named-placeholders/node_modules/lru-cache/LICENSE;md5=28b53f8938bb3cf7c37ed8ac5e7d233e \
                    file://node_modules/object-inspect/LICENSE;md5=288162f1d1bfa064f127f2b42d2a656f \
                    file://node_modules/object-keys/LICENSE;md5=0026e638d7d5c5f2768864ce0074f8ad \
                    file://node_modules/object.assign/LICENSE;md5=2b439ca9e99134dee172a7cc6d989174 \
                    file://node_modules/object.getownpropertydescriptors/LICENSE;md5=5db8fa3e421a3211e6a3dc68544da455 \
                    file://node_modules/opencc-js/LICENSE;md5=881bb03ef9bbd3caa694111d9b226861 \
                    file://node_modules/parse-entities/license;md5=7e5307a85144ae88c8ce8eb803918a97 \
                    file://node_modules/parse5/LICENSE;md5=179850e04995d6fceaf64f2dd2a851b0 \
                    file://node_modules/picomatch/LICENSE;md5=abd0e25891525eb13d5a794f550a6ee4 \
                    file://node_modules/possible-typed-array-names/LICENSE;md5=8fe23ea421aaf9f9d687709f6a6a09b7 \
                    file://node_modules/property-information/license;md5=7e5307a85144ae88c8ce8eb803918a97 \
                    file://node_modules/readline-sync/LICENSE;md5=e0c9fdd2afdaf135c1be9365364458cc \
                    file://node_modules/reflect.getprototypeof/LICENSE;md5=4a5df9eef7ae72ab8074089b14feb76d \
                    file://node_modules/regexp.prototype.flags/LICENSE;md5=6009913822e586406a8cf459157e868a \
                    file://node_modules/rehype-raw/license;md5=8e9f707ac01af145c36ef2adde15d7e4 \
                    file://node_modules/remark-frontmatter/license;md5=0bbc76ececabc0216b618cfbe4d0c0e3 \
                    file://node_modules/remark-highlight.js/license;md5=119b7c1d3bf9672cf7837de980eae189 \
                    file://node_modules/remark-rehype/license;md5=8e9f707ac01af145c36ef2adde15d7e4 \
                    file://node_modules/repeat-string/LICENSE;md5=fad3c8b9c04b365012f3d6821f2dda61 \
                    file://node_modules/rfdc/LICENSE;md5=fc2ea1f4c58a804909742c8eadede5ea \
                    file://node_modules/safe-array-concat/LICENSE;md5=06aae85028f50ba69e6f83b6c9402b26 \
                    file://node_modules/safe-regex-test/LICENSE;md5=8478c87d16770f6d32a4578c475d3930 \
                    file://node_modules/safer-buffer/LICENSE;md5=3baebc2a17b8f5bff04882cd0dc0f76e \
                    file://node_modules/sax/LICENSE;md5=5f49410228c16917dacc5eab921004cb \
                    file://node_modules/seq-queue/LICENSE;md5=ab20e4d6c4aa87d64dbb115954206d60 \
                    file://node_modules/set-function-length/LICENSE;md5=19283ee92f78c91154834571c1f05a94 \
                    file://node_modules/set-function-name/LICENSE;md5=19283ee92f78c91154834571c1f05a94 \
                    file://node_modules/side-channel/LICENSE;md5=375dc7ca936a14e9c29418d5263bd066 \
                    file://node_modules/space-separated-tokens/license;md5=8e9f707ac01af145c36ef2adde15d7e4 \
                    file://node_modules/sqlstring/LICENSE;md5=7aa505292e2636a9e59d4d3f258f4819 \
                    file://node_modules/state-toggle/license;md5=8e9f707ac01af145c36ef2adde15d7e4 \
                    file://node_modules/streamroller/LICENSE;md5=11e69b4aa865a34554aefa2958c837cf \
                    file://node_modules/string.prototype.trim/LICENSE;md5=6475e27670715f30f712326eeb195e93 \
                    file://node_modules/string.prototype.trimend/LICENSE;md5=1e241a19d2d112b1db1a5c1c23216939 \
                    file://node_modules/string.prototype.trimstart/LICENSE;md5=1e241a19d2d112b1db1a5c1c23216939 \
                    file://node_modules/stringify-entities/license;md5=7e5307a85144ae88c8ce8eb803918a97 \
                    file://node_modules/style-to-object/LICENSE;md5=7257d2dd064752cfaf8f94f7d06adfe5 \
                    file://node_modules/to-regex-range/LICENSE;md5=b561e0a423bedc9d9ca9c8c67d40abb9 \
                    file://node_modules/trim-trailing-lines/license;md5=7e5307a85144ae88c8ce8eb803918a97 \
                    file://node_modules/trough/license;md5=b280acbcf1c2e5ef4ceb6852568d9961 \
                    file://node_modules/typed-array-buffer/LICENSE;md5=06aae85028f50ba69e6f83b6c9402b26 \
                    file://node_modules/typed-array-byte-length/LICENSE;md5=838b75dc6028daf3e04e57871b7ad3ed \
                    file://node_modules/typed-array-byte-offset/LICENSE;md5=838b75dc6028daf3e04e57871b7ad3ed \
                    file://node_modules/typed-array-length/LICENSE;md5=838b75dc6028daf3e04e57871b7ad3ed \
                    file://node_modules/unbox-primitive/LICENSE;md5=375dc7ca936a14e9c29418d5263bd066 \
                    file://node_modules/unherit/license;md5=82fd7b0a70b89a370d3bcef312cfd54d \
                    file://node_modules/unified/license;md5=82fd7b0a70b89a370d3bcef312cfd54d \
                    file://node_modules/unist-builder/license;md5=5c6d04216634ead01656739311803951 \
                    file://node_modules/unist-util-filter/license;md5=a320e5b1aa9084c9b52db096dc5eee7f \
                    file://node_modules/unist-util-generated/license;md5=8e9f707ac01af145c36ef2adde15d7e4 \
                    file://node_modules/unist-util-is/license;md5=129a18b8487c2727a4ae7d7e2ad7b231 \
                    file://node_modules/unist-util-position/license;md5=91fb5297439b32d9cd49df8a2484d3eb \
                    file://node_modules/unist-util-remove-position/license;md5=8e9f707ac01af145c36ef2adde15d7e4 \
                    file://node_modules/unist-util-stringify-position/license;md5=8e9f707ac01af145c36ef2adde15d7e4 \
                    file://node_modules/unist-util-visit-parents/license;md5=8e9f707ac01af145c36ef2adde15d7e4 \
                    file://node_modules/unist-util-visit/license;md5=91fb5297439b32d9cd49df8a2484d3eb \
                    file://node_modules/universalify/LICENSE;md5=a734c6ad6e37a515025ac5e8e90ef786 \
                    file://node_modules/utfstring/LICENSE;md5=e6a59ad15bc9bda803327d372c987aeb \
                    file://node_modules/util.promisify/LICENSE;md5=6d43a54b4c07faa1f0c5e6bb6abebf42 \
                    file://node_modules/vfile-location/license;md5=8e9f707ac01af145c36ef2adde15d7e4 \
                    file://node_modules/vfile-message/license;md5=0bbc76ececabc0216b618cfbe4d0c0e3 \
                    file://node_modules/vfile/license;md5=82fd7b0a70b89a370d3bcef312cfd54d \
                    file://node_modules/web-namespaces/license;md5=8e9f707ac01af145c36ef2adde15d7e4 \
                    file://node_modules/which-boxed-primitive/LICENSE;md5=375dc7ca936a14e9c29418d5263bd066 \
                    file://node_modules/which-builtin-type/LICENSE;md5=2655eb5ec397f90434cf160efa0f19e3 \
                    file://node_modules/which-collection/LICENSE;md5=c18cc44449ec61c93b216bf74e6c4fa4 \
                    file://node_modules/which-typed-array/LICENSE;md5=5db8fa3e421a3211e6a3dc68544da455 \
                    file://node_modules/xml-js/LICENSE;md5=7500faf5d0f9d9fa8a6846c3a9d4d2df \
                    file://node_modules/xtend/LICENSE;md5=66787c5cd698a0b30b358c7e30f500ca \
                    file://node_modules/zwitch/license;md5=8e9f707ac01af145c36ef2adde15d7e4 \
                    file://node_modules/format/Readme.md;md5=e95d850da88b7fc097ee6e8735c3a5e1 \
                    file://node_modules/inline-style-parser/README.md;md5=ce0d60642986a7f9382194dc7b31d032 \
                    file://node_modules/js-stl/README.md;md5=aa4c8148c918ef9b294bc81099709cc4 \
                    file://node_modules/pretty-data/README.md;md5=cb335af5033fff681cde255b64c6999a \
                    file://node_modules/remark-parse/readme.md;md5=243ca2f0bbeaac3a68a620d60f6179be \
                    file://node_modules/remark-stringify/readme.md;md5=b2c281f29b7c2bbd045f0ce0841c2965 \
                    file://node_modules/trim/Readme.md;md5=02b5cafabbfea43766351a03a75bda3a"

PR = "r0"


SRC_URI = " \
    npm://registry.npmjs.org/;package=ilib-loctool-webos-qml;version=${PV} \
    npmsw://${THISDIR}/${BPN}/npm-shrinkwrap.json \
"

S = "${WORKDIR}/npm"

RDEPENDS:${PN} = "loctool-native"
DEPENDS = "ilib-loctool-webos-ts-resource-native"

inherit npm
inherit native

do_configure[noexec] = "1"
do_compile[noexec] = "1"

do_install() {
    install -d ${D}${base_prefix}/opt/js-loctool/node_modules/${BPN}
    cp -R --no-dereference --preserve=mode,links -v ${S}/* ${D}${base_prefix}/opt/js-loctool/node_modules/${BPN}
}

SYSROOT_DIRS += "${base_prefix}/opt"

LICENSE:${PN} = "Apache-2.0"
LICENSE:${PN}-types-hast = "MIT"
LICENSE:${PN}-types-mdast = "MIT"
LICENSE:${PN}-types-parse5 = "MIT"
LICENSE:${PN}-types-unist = "MIT"
LICENSE:${PN}-array-buffer-byte-length = "MIT"
LICENSE:${PN}-arrayprototypereduce = "MIT"
LICENSE:${PN}-arraybufferprototypeslice = "MIT"
LICENSE:${PN}-available-typed-arrays = "MIT"
LICENSE:${PN}-bail = "MIT"
LICENSE:${PN}-braces = "MIT"
LICENSE:${PN}-build-gradle-reader = "Apache-2.0"
LICENSE:${PN}-call-bind = "MIT"
LICENSE:${PN}-ccount = "MIT"
LICENSE:${PN}-character-entities = "MIT"
LICENSE:${PN}-character-entities-html4 = "MIT"
LICENSE:${PN}-character-entities-legacy = "MIT"
LICENSE:${PN}-character-reference-invalid = "MIT"
LICENSE:${PN}-cldr-segmentation = "MIT"
LICENSE:${PN}-collapse-white-space = "MIT"
LICENSE:${PN}-comma-separated-tokens = "MIT"
LICENSE:${PN}-data-view-buffer = "MIT"
LICENSE:${PN}-data-view-byte-length = "MIT"
LICENSE:${PN}-data-view-byte-offset = "MIT"
LICENSE:${PN}-date-format = "MIT"
LICENSE:${PN}-debug = "MIT"
LICENSE:${PN}-deep-assign = "MIT"
LICENSE:${PN}-define-data-property = "MIT"
LICENSE:${PN}-define-properties = "MIT"
LICENSE:${PN}-denque = "Apache-2.0"
LICENSE:${PN}-es-abstract = "MIT"
LICENSE:${PN}-es-array-method-boxes-properly = "MIT"
LICENSE:${PN}-es-define-property = "MIT"
LICENSE:${PN}-es-errors = "MIT"
LICENSE:${PN}-es-object-atoms = "MIT"
LICENSE:${PN}-es-set-tostringtag = "MIT"
LICENSE:${PN}-es-to-primitive = "MIT"
LICENSE:${PN}-extend = "MIT"
LICENSE:${PN}-fault = "MIT"
LICENSE:${PN}-fill-range = "MIT"
LICENSE:${PN}-flatted = "ISC"
LICENSE:${PN}-for-each = "MIT"
LICENSE:${PN}-format = "Apache-2.0"
LICENSE:${PN}-fs-extra = "MIT"
LICENSE:${PN}-function-bind = "MIT"
LICENSE:${PN}-functionprototypename = "MIT"
LICENSE:${PN}-functions-have-names = "MIT"
LICENSE:${PN}-generate-function = "MIT"
LICENSE:${PN}-get-intrinsic = "MIT"
LICENSE:${PN}-get-symbol-description = "MIT"
LICENSE:${PN}-globalthis = "MIT"
LICENSE:${PN}-gopd = "MIT"
LICENSE:${PN}-graceful-fs = "ISC"
LICENSE:${PN}-has-bigints = "MIT"
LICENSE:${PN}-has-property-descriptors = "MIT"
LICENSE:${PN}-has-proto = "MIT"
LICENSE:${PN}-has-symbols = "MIT"
LICENSE:${PN}-has-tostringtag = "MIT"
LICENSE:${PN}-hasown = "MIT"
LICENSE:${PN}-hast-to-hyperscript = "MIT"
LICENSE:${PN}-hast-util-from-parse5 = "MIT"
LICENSE:${PN}-hast-util-parse-selector = "MIT"
LICENSE:${PN}-hast-util-raw = "MIT"
LICENSE:${PN}-hast-util-to-parse5 = "MIT"
LICENSE:${PN}-hastscript = "MIT"
LICENSE:${PN}-he = "MIT"
LICENSE:${PN}-highlightjs = "BSD-3-Clause"
LICENSE:${PN}-html-parser = "MIT"
LICENSE:${PN}-html-void-elements = "MIT"
LICENSE:${PN}-iconv-lite = "MIT"
LICENSE:${PN}-ilib = "Apache-2.0"
LICENSE:${PN}-ilib-loctool-webos-ts-resource = "Apache-2.0"
LICENSE:${PN}-ilib-tree-node = "Apache-2.0"
LICENSE:${PN}-inherits = "ISC"
LICENSE:${PN}-inline-style-parser = "MIT"
LICENSE:${PN}-internal-slot = "MIT"
LICENSE:${PN}-is-alphabetical = "MIT"
LICENSE:${PN}-is-alphanumeric = "MIT"
LICENSE:${PN}-is-alphanumerical = "MIT"
LICENSE:${PN}-is-array-buffer = "MIT"
LICENSE:${PN}-is-async-function = "MIT"
LICENSE:${PN}-is-bigint = "MIT"
LICENSE:${PN}-is-boolean-object = "MIT"
LICENSE:${PN}-is-buffer = "MIT"
LICENSE:${PN}-is-callable = "MIT"
LICENSE:${PN}-is-data-view = "MIT"
LICENSE:${PN}-is-date-object = "MIT"
LICENSE:${PN}-is-decimal = "MIT"
LICENSE:${PN}-is-finalizationregistry = "MIT"
LICENSE:${PN}-is-generator-function = "MIT"
LICENSE:${PN}-is-hexadecimal = "MIT"
LICENSE:${PN}-is-map = "MIT"
LICENSE:${PN}-is-negative-zero = "MIT"
LICENSE:${PN}-is-number = "MIT"
LICENSE:${PN}-is-number-object = "MIT"
LICENSE:${PN}-is-obj = "MIT"
LICENSE:${PN}-is-plain-obj = "MIT"
LICENSE:${PN}-is-property = "MIT"
LICENSE:${PN}-is-regex = "MIT"
LICENSE:${PN}-is-set = "MIT"
LICENSE:${PN}-is-shared-array-buffer = "MIT"
LICENSE:${PN}-is-string = "MIT"
LICENSE:${PN}-is-symbol = "MIT"
LICENSE:${PN}-is-typed-array = "MIT"
LICENSE:${PN}-is-weakmap = "MIT"
LICENSE:${PN}-is-weakref = "MIT"
LICENSE:${PN}-is-weakset = "MIT"
LICENSE:${PN}-is-whitespace-character = "MIT"
LICENSE:${PN}-is-word-character = "MIT"
LICENSE:${PN}-isarray = "MIT"
LICENSE:${PN}-js-stl = "MIT"
LICENSE:${PN}-jsonfile = "MIT"
LICENSE:${PN}-loctool-argparse = "Python-2.0"
LICENSE:${PN}-loctool-js-yaml = "MIT"
LICENSE:${PN}-loctool = "Apache-2.0"
LICENSE:${PN}-log4js = "Apache-2.0"
LICENSE:${PN}-long = "Apache-2.0"
LICENSE:${PN}-longest-streak = "MIT"
LICENSE:${PN}-lowlight = "MIT"
LICENSE:${PN}-markdown-escapes = "MIT"
LICENSE:${PN}-markdown-table = "MIT"
LICENSE:${PN}-mdast-util-compact = "MIT"
LICENSE:${PN}-mdast-util-definitions = "MIT"
LICENSE:${PN}-mdast-util-to-hast = "MIT"
LICENSE:${PN}-mdurl = "MIT"
LICENSE:${PN}-message-accumulator = "Apache-2.0"
LICENSE:${PN}-micromatch = "MIT"
LICENSE:${PN}-ms = "MIT"
LICENSE:${PN}-mysql2-lru-cache = "ISC"
LICENSE:${PN}-mysql2 = "ISC & MIT"
LICENSE:${PN}-named-placeholders-lru-cache = "ISC"
LICENSE:${PN}-named-placeholders = "MIT"
LICENSE:${PN}-object-inspect = "MIT"
LICENSE:${PN}-object-keys = "MIT"
LICENSE:${PN}-objectassign = "MIT"
LICENSE:${PN}-objectgetownpropertydescriptors = "MIT"
LICENSE:${PN}-opencc-js = "MIT"
LICENSE:${PN}-parse-entities = "MIT"
LICENSE:${PN}-parse5 = "MIT"
LICENSE:${PN}-picomatch = "MIT"
LICENSE:${PN}-possible-typed-array-names = "MIT"
LICENSE:${PN}-pretty-data = "MIT"
LICENSE:${PN}-property-information = "MIT"
LICENSE:${PN}-readline-sync = "MIT"
LICENSE:${PN}-reflectgetprototypeof = "MIT"
LICENSE:${PN}-regexpprototypeflags = "MIT"
LICENSE:${PN}-rehype-raw = "MIT"
LICENSE:${PN}-remark-frontmatter = "MIT"
LICENSE:${PN}-remark-highlightjs = "MIT"
LICENSE:${PN}-remark-parse = "MIT"
LICENSE:${PN}-remark-rehype = "MIT"
LICENSE:${PN}-remark-stringify = "MIT"
LICENSE:${PN}-repeat-string = "MIT"
LICENSE:${PN}-rfdc = "MIT"
LICENSE:${PN}-safe-array-concat = "MIT"
LICENSE:${PN}-safe-regex-test = "MIT"
LICENSE:${PN}-safer-buffer = "MIT"
LICENSE:${PN}-sax = "ISC"
LICENSE:${PN}-seq-queue = "MIT"
LICENSE:${PN}-set-function-length = "MIT"
LICENSE:${PN}-set-function-name = "MIT"
LICENSE:${PN}-side-channel = "MIT"
LICENSE:${PN}-space-separated-tokens = "MIT"
LICENSE:${PN}-sqlstring = "MIT"
LICENSE:${PN}-state-toggle = "MIT"
LICENSE:${PN}-streamroller = "MIT"
LICENSE:${PN}-stringprototypetrim = "MIT"
LICENSE:${PN}-stringprototypetrimend = "MIT"
LICENSE:${PN}-stringprototypetrimstart = "MIT"
LICENSE:${PN}-stringify-entities = "MIT"
LICENSE:${PN}-style-to-object = "MIT"
LICENSE:${PN}-to-regex-range = "MIT"
LICENSE:${PN}-trim = "MIT"
LICENSE:${PN}-trim-trailing-lines = "MIT"
LICENSE:${PN}-trough = "MIT"
LICENSE:${PN}-typed-array-buffer = "MIT"
LICENSE:${PN}-typed-array-byte-length = "MIT"
LICENSE:${PN}-typed-array-byte-offset = "MIT"
LICENSE:${PN}-typed-array-length = "MIT"
LICENSE:${PN}-unbox-primitive = "MIT"
LICENSE:${PN}-unherit = "MIT"
LICENSE:${PN}-unified = "MIT"
LICENSE:${PN}-unist-builder = "MIT"
LICENSE:${PN}-unist-util-filter = "MIT"
LICENSE:${PN}-unist-util-generated = "MIT"
LICENSE:${PN}-unist-util-is = "MIT"
LICENSE:${PN}-unist-util-position = "MIT"
LICENSE:${PN}-unist-util-remove-position = "MIT"
LICENSE:${PN}-unist-util-stringify-position = "MIT"
LICENSE:${PN}-unist-util-visit = "MIT"
LICENSE:${PN}-unist-util-visit-parents = "MIT"
LICENSE:${PN}-universalify = "MIT"
LICENSE:${PN}-utfstring = "MIT"
LICENSE:${PN}-utilpromisify = "MIT"
LICENSE:${PN}-vfile = "MIT"
LICENSE:${PN}-vfile-location = "MIT"
LICENSE:${PN}-vfile-message = "MIT"
LICENSE:${PN}-web-namespaces = "MIT"
LICENSE:${PN}-which-boxed-primitive = "MIT"
LICENSE:${PN}-which-builtin-type = "MIT"
LICENSE:${PN}-which-collection = "MIT"
LICENSE:${PN}-which-typed-array = "MIT"
LICENSE:${PN}-xml-js = "MIT"
LICENSE:${PN}-xtend = "MIT"
LICENSE:${PN}-zwitch = "MIT"
