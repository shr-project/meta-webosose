
# FIXME-buildpaths!!!
# [WRP-10883] buildpath QA issues
# http://gecko.lge.com:8000/Errors/Details/895273
# ERROR: QA Issue: File /usr/lib/python3.12/site-packages/pydantic_core/_pydantic_core.cpython-312-aarch64-linux-gnu.so in package python3-pydantic-core contains reference to TMPDIR [buildpaths]
ERROR_QA:remove = "buildpaths"
WARN_QA:append = " buildpaths"
