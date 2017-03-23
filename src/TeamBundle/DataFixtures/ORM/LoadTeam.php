<?php
/**
 * Created by PhpStorm.
 * User: Emmanuel
 * Date: 17/03/2017
 * Time: 22:08
 */

namespace TeamBundle\DataFixtures\ORM;
use Doctrine\Common\DataFixtures\FixtureInterface;
use Doctrine\Common\Persistence\ObjectManager;
use TeamBundle\Entity\Team;
use TeamBundle\Entity\Category;


class LoadTeam implements FixtureInterface
{
    // Dans l'argument de la méthode load, l'objet $manager est l'EntityManager
    public function load(ObjectManager $manager){

        // je récupère les catégories
        $em = $this->getDoctrine()->getManager();
        $senior = $em->getRepository('TeamBundle:Category')->find(1);
        $junior = $em->getRepository('TeamBundle:Category')->find(2);
        $kids = $em->getRepository('TeamBundle:Category')->find(3);
        $loisirs = $em->getRepository('TeamBundle:Category')->find(4);

        $seniorTeams = [
            "SM1",
            "SM2",
            "SM3",
            "SF1",
            "SF2"
        ];
        $juniorTeams = [
            "-20F",
            "-18M",
            "-16M",
            "-16M2",
            "-16F",
            "-14M",
            "-14M2",
            "-14F"
        ];
        $kidsTeams = [
            "-12M",
            "-12M2",
            "-12F",
            "-11 Mixte",
            "-10 Mixte",
            "-10 Mixte 2",
            "Mini-hand"
        ];
        $loisirsTeams =[
            "Loisirs Masculine",
            "Loisirs Féminine"
        ];

        foreach ($seniorTeams as $team) {
            // On crée la catégorie
            $newTeam = new Team();
            $newTeam->setName($team);
            $newTeam->setLevel("Excellence Région");
            $newTeam->setCategory($senior);
            $newTeam->setPalmares("lien page palmares");
            $newTeam->setRanking("http://www.ff-handball.org/competitions/championnats-regionaux/pays-de-la-loire.html?tx_obladygesthand_pi1[saison_id]=10&tx_obladygesthand_pi1[competition_id]=23132&tx_obladygesthand_pi1[phase_id]=52745&tx_obladygesthand_pi1[groupe_id]=74151&tx_obladygesthand_pi1[mode]=single_phase&cHash=c4087eb2f587f7645d08d97d2b2c1af9");

            // On la persiste
            $manager->persist($newTeam);
        }
    }

}