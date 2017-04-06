<?php
/**
 * Created by PhpStorm.
 * User: Emmanuel
 * Date: 30/03/2017
 * Time: 12:14
 */

namespace AppBundle\Controller;

use Sensio\Bundle\FrameworkExtraBundle\Configuration\Route;
use Symfony\Bundle\FrameworkBundle\Controller\Controller;
use Symfony\Component\HttpFoundation\Request;

class PlaceListController extends Controller
{

    public function listPlaceAction(Request $request)
    {
        // Page liste des gymnases
        $em = $this->getDoctrine()->getManager();
        $places = $em->getRepository('PlaceBundle:Place')
            ->findAll(); // récupération de tous les gymnases
        return $this->render('AppBundle:page/annexes:place_list.html.twig', ['places' => $places]);
    }
}