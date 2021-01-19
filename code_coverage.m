import matlab.unittest.TestSuite
import matlab.unittest.TestRunner
import matlab.unittest.plugins.CodeCoveragePlugin


suite = TestSuite.fromFolder('test');
runner = TestRunner.withTextOutput;
runner.addPlugin(CodeCoveragePlugin.forFolder('bspline','IncludingSubfolders',true))
result = runner.run(suite);