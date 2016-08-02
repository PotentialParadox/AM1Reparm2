import random
import math
from evaluation import Evaluator
from generator import generator
from mutate import mutateset
from deap import base
from deap import creator
from deap import tools
from reparm_input import ReparmInput
from parameter_group import ParameterGroup
from gaussian import run_gaussian
from gaussian_input import GaussianInput
from gaussian_output import GaussianOutput

#############################################
#         BEGIN USER INPUT
#############################################

# Number of Generation
NGEN = 1000
# PopulationSize
PSIZE = 10
# Crossover Probability
CXPB = 0.5
# Mutation Probability
MUTPB = 0.5
initial_list = [200.45, 3.8, 6.89, 20, 43, 5]
goal = [6, 6, 6, 6, 6, 6, 6]
eval = Evaluator(goal)

#############################################
#         END USER INPUT
#############################################


creator.create("FitnessMax", base.Fitness, weights=(-1.0,))
creator.create("ParamSet", list, fitness=creator.FitnessMax, best=None)

toolbox = base.Toolbox()
toolbox.register("individual", generator, initial_list, 0.05)
toolbox.register("population", tools.initRepeat, list, toolbox.individual)
toolbox.register("mate", tools.cxTwoPoint)
toolbox.register("mutate", mutateset, pert=0.04, chance=0.1)
toolbox.register("select", tools.selTournament, tournsize=3)
toolbox.register("evaluate", eval.eval)

pop = toolbox.population(n=PSIZE)

best = None

#############################################
#         Begin Genetic Algorithm
#############################################
# for g in range(NGEN):
#     offspring = toolbox.select(pop, len(pop))
#     offspring = list(map(toolbox.clone, offspring))
#     for child1, child2 in zip(offspring[::2], offspring[1::2]):
#         if random.random() < CXPB:
#             toolbox.mate(child1, child2)
#             del child1.fitness.values
#             del child2.fitness.values
#     for mutant in offspring:
#         if random.random() < MUTPB:
#             toolbox.mutate(mutant)
#             del mutant.fitness.values
#     invalid_ind = [ind for ind in offspring if not ind.fitness.valid]
#     fitnesses = map(toolbox.evaluate, invalid_ind)
#     for ind, fit in zip(invalid_ind, fitnesses):
#         ind.fitness.values = fit
#     pop[:] = offspring
# print(pop[1])
#############################################
#         End Genetic Algorithm
#############################################

#############################################
#         Begin Particle Simulation
#############################################
# for g in range(NGEN):
#     for part in pop:
#         part.fitness.values = toolbox.evaluate(part)
#         if not part.best or part.best.fitness < part.fitness:
#             part.best = creator.ParamSet(part)
#             part.best.fitness.values = part.fitness.values
#         if not best or best.fitness < part.fitness:
#             best = creator.ParamSet(part)
#             best.fitness.values = part.fitness.values
#     for part in pop:
#         toolbox.mutate(part)
#     print(best, "with fitness", best.fitness)
#############################################
#         End Particle Simulation
#############################################

fin = open("reparm.in", 'r')
file = fin.read()
reparm_in = ReparmInput(file)
print(reparm_in.survival_chance)
