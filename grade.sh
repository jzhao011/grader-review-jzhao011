CPATH='.:../lib/hamcrest-core-1.3.jar:../lib/junit-4.13.2.jar'

rm -rf student-submission
rm -rf grading-area

mkdir grading-area

git clone $1 student-submission
echo 'Finished cloning'

if [[ -f student-submission/ListExamples.java ]]
then
    echo "Found Files"
    cp student-submission/ListExamples.java grading-area/ListExamples.java
    cp TestListExamples.java grading-area/TestListExamples.java
else
    echo "ListExamples.java not found"
    exit 1
fi

cd grading-area
javac -cp $CPATH *.java

if [[ $? -ne 0 ]]
then
    echo "Program failed to compile"
    exit 1
fi

java -cp $CPATH org.junit.runner.JUnitCore TestListExamples > junit-output.txt

if [[ $(grep FAILURES junit-output.txt) == "" ]]
then
    TESTSRUN=$(grep -Eo "([0-9]+ tests)" junit-output.txt | grep -Eo "[0-9]+")
    echo $TESTSRUN/$TESTSRUN Succeeded
else
    TESTSRUN=$(grep -Eo "Tests run: [0-9]+" junit-output.txt | grep -Eo "[0-9]+")
    FAILURES=$(grep -Eo "Failures: [0-9]+" junit-output.txt | grep -Eo "[0-9]+")

    echo $(($TESTSRUN-$FAILURES))/$TESTSRUN Succeeded
fi

# Draw a picture/take notes on the directory structure that's set up after
# getting to this point

# Then, add here code to compile and run, and do any post-processing of the
# tests
