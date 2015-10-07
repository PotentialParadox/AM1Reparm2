import threading
from queue import Queue
import genetic_tools as gt


class Thread:

    def __init__(self, job):
        self.lock = threading.Lock()
        self.q = Queue()
        self.nproc = job.nproc
        self.number_steps = job.number_steps

    def threader(self, thread_number):
        while True:
            job_data = self.q.get()
            gt.mutate(job_data, thread_number)
            self.q.task_done()

    def thread_evolve(self, job):
        for x in range(self.number_steps):
            t = threading.Thread(target=self.threader, args=(x,))
            t.daemon = True
            t.start()

        for _ in range(self.nproc):
            self.q.put(job)

        self.q.join()





