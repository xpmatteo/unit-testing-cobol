
Demo of how to test-drive a Cobol routine.

You will find here some end-to-end tests written in Bash, and unit tests written in Cobol.

I am a total newbie with Cobol.  I looked CobolUnit, but I don't understand how it works.  I hoped I could write a generic xUnit library, but it's too difficult, so I reduced my ambition.  I hoped I could write a generic ASSERT-EQUALS reusable routine, but it's too difficult for me, so I reduced my ambition.

The main difficulty is that in Cobol, an external routine works on fixed-size inputs.  There is no way that I understand to define a routine that will work with arbitrary-length strings.

My conclusion is that you *can* test-drive Cobol code, but it requires some sweat and duplication (and this seems to be the constant refrain as I learn Cobol).  You write a test program for each routine that you want to test.  Inside that test program, you call the routine under test with varying parameters.  And you write custom assertion code for the routine that you want to test.  Sigh.


# Requirements

Install GnuCobol.  You will also need a Bash shell.


# Build it with

    script/build.sh

# Test it with

    script/hello-test.sh

# Run it with

    ./hello Sailor

