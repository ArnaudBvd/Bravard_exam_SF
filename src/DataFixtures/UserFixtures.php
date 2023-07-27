<?php

namespace App\DataFixtures;

use App\Entity\User;
use Doctrine\Bundle\FixturesBundle\Fixture;
use Doctrine\Persistence\ObjectManager;
use Symfony\Component\PasswordHasher\Hasher\UserPasswordHasherInterface;

class UserFixtures extends Fixture
{
    private $hasher;
 
    public function __construct(UserPasswordHasherInterface $hasher)
    {
        $this->hasher = $hasher;
    }

    public function load(ObjectManager $manager): void
    {
        $Admin = new User();
        $Admin->setFirstname("Arnaud");
        $Admin->setLastname("Bravard");
        $Admin->setEmail("rh@humanbooster.com");
        $encodedPassword = $this->hasher->hashPassword($Admin, "rh123@");
        $Admin->setPassword($encodedPassword);
        $Admin->setRoles(["ROLE_RH"]);
        $Admin->setSector("RH");
        $Admin->setContract("CDI");
        
        $manager->persist($Admin);

        $manager->flush();
    }
}
