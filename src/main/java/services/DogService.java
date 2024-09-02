package services;

import entities.Dog;
import repositories.DogRepository;
import utils.exception.NotFoundException;

import java.time.LocalDate;
import java.util.List;

public class DogService {
    private final DogRepository dogRepository;

    public DogService() {
        this.dogRepository = new DogRepository();
    }

    public Dog create(String name, String breed, LocalDate birthDate) {
        Dog dog = Dog.builder()
                .name(name).breed(breed).birthDate(birthDate)
                .build();

        return dogRepository.createOrUpdate(dog);
    }

    public Dog update(int id, String name, String breed, LocalDate birthDate){

        Dog dog = dogRepository.findById(id);

        if (dog == null) throw new NotFoundException("Dog#" + id + " not Found");

        dog.setName(name);
        dog.setBreed(breed);
        dog.setBirthDate(birthDate);
        return dogRepository.createOrUpdate(dog);

    }

    public boolean delete (int id) {
        Dog dog = dogRepository.findById(id);
        if (dog == null) throw new NotFoundException("Dog#" + id + " not Found");
        return dogRepository.delete(dog);

    }

    public Dog findById (int id) {
        Dog dog = dogRepository.findById(id);
        if(dog == null) throw new NotFoundException("Dog#" + id + " not Found");
        return dog;
    }

    public List<Dog> findAll () {
        return dogRepository.findAll();
    }
}
