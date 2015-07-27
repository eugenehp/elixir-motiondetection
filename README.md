Motiondetection
===============

Elixir based motion detection application using libjpeg. Comparing pixel differences and provides with a output rate of the changes.

Compile and run
==============
`./run.sh` from your Terminal

Output
==============
```
Interactive Elixir (1.0.5) - press Ctrl+C to exit (type h() ENTER for help)
iex(1)> Motiondetection.init
:ok
iex(2)> Motiondetection.test "test_images"
Doing compare_two_files with `1.jpg` and `2.jpg`
Comparison result is 1.5046296296296297e-5
Doing compare_two_files with `2.jpg` and `3.jpg`
Comparison result is 0.03755118312757202
Doing compare_two_files with `3.jpg` and `4.jpg`
Comparison result is 0.0188369341563786
Doing compare_two_files with `4.jpg` and `5.jpg`
Comparison result is 0.02012692901234568
Doing compare_two_files with `5.jpg` and `6.jpg`
Comparison result is 0.04197710905349794
Doing compare_two_files with `6.jpg` and `7.jpg`
Comparison result is 3.690843621399177e-5
```
