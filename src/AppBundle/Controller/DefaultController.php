<?php

namespace AppBundle\Controller;

use Sensio\Bundle\FrameworkExtraBundle\Configuration\Route;
use Symfony\Bundle\FrameworkBundle\Controller\Controller;
use Symfony\Component\HttpFoundation\Request;
use TeamBundle\Entity\Team;



class DefaultController extends Controller
{
    /**
     * @Route("/", name="homepage")
     */
    public function indexAction(Request $request)
    {
        // replace this example code with whatever you need
        return $this->render('AppBundle:page:index.html.twig');
    }

    public function menuAction()
    {

        //on récupère chaque catégorie
        $em = $this->getDoctrine()->getManager();
        $senior = $em->getRepository('TeamBundle:Category')
            ->findOneByName('Senior');
        $junior = $em->getRepository('TeamBundle:Category')
            ->findOneByName('Jeunes');
        $kids = $em->getRepository('TeamBundle:Category')
            ->findOneByName('Enfants');
        $loisirs = $em->getRepository('TeamBundle:Category')
            ->findOneByName('Loisirs');

        //puis la liste des équipes par catégorie pour construire le menu des équipes
        $repository = $em->getRepository('TeamBundle:Team');
        $seniorTeams = $repository->getTeamsByCategory($senior);
        $juniorTeams = $repository->getTeamsByCategory($junior);
        $kidsTeams = $repository->getTeamsByCategory($kids);
        $loisirsTeams = $repository->getTeamsByCategory($loisirs);

        return $this->render('AppBundle::navbar.html.twig', ['senior' => $senior,
                                                             'jeunes' => $junior,
                                                             'kids' => $kids,
                                                             'loisirs' => $loisirs,
                                                             'seniorTeams' => $seniorTeams,
                                                             'juniorTeams' => $juniorTeams,
                                                             'kidsTeams' => $kidsTeams,
                                                             'loisirsTeams' => $loisirsTeams]);
    }

}
