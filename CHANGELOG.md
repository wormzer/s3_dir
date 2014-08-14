s3_dir CHANGELOG
================

v1.2.0 (2014-08-14)
-------------------

* Do all testing with mock instead of depending on a private external s3 bucket.

v1.1.0 (2014-07-21)
-------------------

* README cleanup
* LICENSE and maintainer info clarified
* Clean up testing situation
    - ChefSpec test
    - Serverspec integration tests
* Fix FC016 by adding a default action to LWRP
* Fix dependency on et_fog to properly resolve
* Add default values for `s3_dir` attributes
* Fix issue with mode attribute and implicit conversion b/t strings/integers

v1.0.1 (2014-06-23)
-------------------

* Real README
* File mode parsing to make directories

v0.1.0 (2014-06-23)
--------------------

* Initial release of s3_dir
