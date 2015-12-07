import threading
from queue import Queue
import genetic_tools as gt


class Thread:

    def __init__(self, job):
        self.lock = threading.Lock()
        self.file_name = job.file_name
        self.q = Queue()
        self.q1 = Queue()
        self.ngeom = job.ngeom
        self.nproc = job.nproc
        self.number_steps = job.number_steps
        self.exitFlag = 0

    def threader(self, thread_number):
        while True:
            thread_info = self.q1.get()
            gt.mutate(thread_info[0], thread_info[1])
            self.lock.acquire()
            # fout = open(self.file_name + ".out", 'a')
            # fout.write(self.file_name + "_" + str(thread_info[1])
                       # + " complete\n")
            # fout.close()
            self.lock.release()
            self.q1.task_done()

    def thread_evolve(self, job):
        self.q1 = Queue(self.ngeom)
        for x in range(self.nproc):
            t = threading.Thread(target=self.threader, args=(x,))
            t.setDaemon(True)
            t.start()
        for i in range(self.ngeom):
            thread_info = (job, i)
            self.q1.put(thread_info)
        self.q1.join()

    def init(self, thread_number):
        while True:
            thread_info = self.q.get()
            gt.init_run(thread_info[0], thread_info[1])
            self.q.task_done()

    def thread_init(self, job):
        self.q = Queue(self.ngeom)
        for x in range(self.nproc):
            t = threading.Thread(target=self.init, args=(x,))
            t.setDaemon(True)
            t.start()
        for i in range(self.ngeom):
            thread_info = (job, i)
            self.q.put(thread_info)
        self.q.join()
