%main programm
clear all;
loader;

population = reshape(initial_population, population_size, number_of_bits,1);
index = 1;

fitness(:,1) = fitness_evaluation(population(:,:,index),fitness_function); 
overallfitness(index)=sum(fitness(:,1));

while index < maximum_iteration %stop_condition, add test on fitness
    
    parents = selection(1, population(:,:,index),number_of_parents,fitness(:,index));
    new_generation = reproduction(parents, crossover_type, 32, population_size); %todo crossover_rate
    new_generation_mutated = mutation(new_generation, mutation_rate);
    population( :, :,index+1) = new_generation_mutated;
    fitness(:,index+1) = fitness_evaluation(population(:,:,index+1), fitness_function);
    
    overallfitness(index+1)=sum(fitness(:,index+1));
    
    index = index + 1;
   
end

plot(overallfitness)
%display_output(pop)