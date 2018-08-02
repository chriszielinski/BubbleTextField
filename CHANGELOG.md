## Master

##### Breaking

* None.

##### Enhancements

* Added support for some `NSTextViewDelegate` methods. Namely,
	* `textView(_ textView: NSTextView, shouldSelectCandidateAt index: Int) -> Bool`
	* `textView(_ textView: NSTextView, shouldChangeTextIn affectedCharRange: NSRange, replacementString: String?) -> Bool`
	* `textView(_ view: NSTextView, didCheckTextIn range: NSRange, types checkingTypes: NSTextCheckingTypes, options: [NSSpellChecker.OptionKey : Any] = [:], results: [NSTextCheckingResult], orthography: NSOrthography, wordCount: Int) -> [NSTextCheckingResult]`

##### Bug Fixes

* None.

## 0.0.2

##### Breaking

* None.

##### Enhancements

* Add `isContinuousSpellCheckingEnabled`. Support `NSTextView` continuous spell checking.  
  [Chris Zielinski](https://github.com/chriszielinski)

##### Bug Fixes

* None.