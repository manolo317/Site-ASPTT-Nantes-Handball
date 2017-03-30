<?php
/**
 * Created by PhpStorm.
 * User: Emmanuel
 * Date: 25/03/2017
 * Time: 18:07
 */

namespace AppBundle\Controller;

use Sensio\Bundle\FrameworkExtraBundle\Configuration\Route;
use Symfony\Bundle\FrameworkBundle\Controller\Controller;
use Symfony\Component\HttpFoundation\Request;
use Symfony\Component\Form\Extension\Core\Type\FormType;
use Symfony\Component\Form\Extension\Core\Type\SubmitType;
use TeamBundle\Entity\Team;
use PlanningBundle\Entity\DateEvent;
use Symfony\Bridge\Doctrine\Form\Type\EntityType;


class PlanningController extends Controller
{
    public function indexAction()
    {
        return $this->render('AppBundle:page/planning:index.html.twig');
    }
    
    public function annualPlanningAction(Request $request)
    {
        $em = $this->getDoctrine()->getManager();
        // On crée un objet Team
        $team = new Team();

        // Je créé un formulaire avec mes entités Team pour filtrer
        $form = $this->get('form.factory')->createBuilder(FormType::class, $team)
            ->add('name', EntityType::class, [
                'class' => 'TeamBundle:Team',
                'choice_label' => 'name',
                'multiple'     => false,
                'expanded'     => false,
            ])
            ->add('filtrer',      SubmitType::class)
            ->getForm()
        ;

        // Si la requête est en POST
        if ($request->isMethod('POST')) {
            // On fait le lien Requête <-> Formulaire
            $form->handleRequest($request);            //je récupère mon instance de Team qui est dans l'attribut "name" de mon formulaire
            $team = $team->getName();

            return $this->render('AppBundle:page/planning:annual_planning.html.twig', [
                'team' => $team,
                'form' => $form->createView()
            ]);

        }
        // je récupère tous mes DateEvents classés par date
        $dates = $em->getRepository('PlanningBundle:DateEvent')->findAllOrderedByDate();

        return $this->render('AppBundle:page/planning:annual_planning.html.twig', [
            'dates' => $dates,
            'form' => $form->createView()
        ]);
    }
    
    public function weekendPlanningAction()
    {
        $em = $this->getDoctrine()->getManager();

        // j'instancie un objet Datetime à la date d'aujourd'hui
        $now = new \DateTime();
        // je récupère les deux dates du prochain week-end
        $dates = $em->getRepository('PlanningBundle:DateEvent')->findWeekend($now);

        return $this->render('AppBundle:page/planning:weekend_planning.html.twig', [
            'dates' => $dates,
        ]);
    }

    public function trainingPlanningAction()
    {
        $em = $this->getDoctrine()->getManager();

        // je récupère les jours et les entrainements associés
        $days = $em->getRepository('PlanningBundle:Day')->findAllOrderedByDay();

        return $this->render('AppBundle:page/planning:training_planning.html.twig', [
            'days' => $days,
        ]);
    }

}