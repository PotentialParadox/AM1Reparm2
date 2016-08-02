class Evaluator:
    def __init__(self, hlt_outputs=None):
        goal = hlt_outputs

    def eval(self, part):
        answer = 0
        for i, s in enumerate(part):
            answer += pow(s - self.goal[i], 2)
        return answer,
