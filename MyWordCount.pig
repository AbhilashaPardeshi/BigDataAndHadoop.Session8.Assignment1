dataset = load '/abhilasha/pig/WordCount.txt';
tokenizedData = FOREACH dataset GENERATE FLATTEN(TOKENIZE((chararray)$0)) as word;
distinctWords = GROUP  tokenizedData by word;
countOfWords = FOREACH distinctWords GENERATE group,COUNT(tokenizedData); 
dump countOfWords;

