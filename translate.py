import os

class Translator():
    def __init__(self, models_dir):
        self.models = {}
        self.models_dir = models_dir

    def translate(self, source, target, text):
        from DocumentReader import DocumentReader
        import wikipedia
        import re
        searchText = text
        bannedWords = ['what is', "what are", 'who is', "who are", 'where is',"where are", "when is",  "where are", "what does", "how is", "how are", "how does", "how did"]
        for i in bannedWords: 
            searchText = re.sub(i + "\s*", '', searchText, flags = re.I)
        
        question = text + "?"
        reader = DocumentReader("NeuML/bert-small-cord19qa") 
        results = wikipedia.search(searchText)
        if len(results) > 0:
            print(results[0])
            page = wikipedia.page(results[0])
            print(f"Top wiki result: {page.url}")
            text = page.content
            reader.tokenize(question, text)
            return "Question:{} \nTop wiki result: {}\n{}".format(question,page.url,reader.get_answer())
        return "I don't know"