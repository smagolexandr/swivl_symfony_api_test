<?php

namespace App\DataFixtures;

use App\Entity\ClassRoom;
use Doctrine\Bundle\FixturesBundle\Fixture;
use Doctrine\Persistence\ObjectManager;

class AppFixtures extends Fixture
{
    public function load(ObjectManager $manager)
    {
        // create 20 products! Bam!
        for ($i = 0; $i < 20; $i++) {
            $classRoom = new ClassRoom();
            $classRoom->setName('room '.$i);
            $classRoom->setEnabled(mt_rand(0, 1));
            $manager->persist($classRoom);
        }
        // $product = new Product();
        // $manager->persist($product);

        $manager->flush();
    }
}
