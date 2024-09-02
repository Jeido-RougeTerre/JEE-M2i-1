package repositories;

import entities.Dog;

public class DogRepository extends BaseRepository<Dog> {
    public DogRepository() {
        super(Dog.class);
    }

}
