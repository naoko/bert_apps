from bert_serving.client import BertClient
import numpy as np
from termcolor import colored

prefix_q = '##### **Q:** '
prefix_a = '##### **A:** '
topk = 3
bc = BertClient()

with open('faq-jpn.md') as fp:
    questions = [v.replace(prefix_q, '').strip() for v in fp if v.strip() and v.startswith(prefix_q)]
    fp.seek(0)
    answers = [v.replace(prefix_a, '').strip() for v in fp if v.strip() and v.startswith(prefix_a)]
    print('%d questions loaded, avg. len of %d' % (len(questions), np.mean([len(d.split()) for d in questions])))
    doc_vecs = bc.encode(questions)
    assert len(questions) == len(answers)


while True:
    query = input('your question: ')
    query_vec = bc.encode([query])[0]
    # compute normalized dot product as score
    score = np.sum(query_vec * doc_vecs, axis=1) / np.linalg.norm(doc_vecs, axis=1)
    topk_idx = np.argsort(score)[::-1][:topk]
    for idx in topk_idx:
        print(f"> {colored(score[idx], 'cyan')}\t{colored(questions[idx], 'yellow')}")
    if score[topk_idx[0]] < 10:
        print(colored("Answer: sorry, I'm not trained to answer the question yet.", 'green'))
    else:
        print(colored(f"Answer: {answers[topk_idx[0]]}", 'green'))
