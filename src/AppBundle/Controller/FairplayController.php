<?php

namespace AppBundle\Controller;

use Sensio\Bundle\FrameworkExtraBundle\Configuration\Route;
use Symfony\Bundle\FrameworkBundle\Controller\Controller;
use Symfony\Component\HttpFoundation\Request;
use InfoBundle\Entity\FairPlay;
use Sensio\Bundle\FrameworkExtraBundle\Configuration\ParamConverter;




class FairplayController extends Controller
{
    public function viewAction(Request $request)
    {
        // Page Charte du Club
        $em = $this->getDoctrine()->getManager();

        $fairplay = $em->getRepository('InfoBundle:FairPlay')->findOneById(1);

        return $this->render('AppBundle:page/annexes:fairplay.html.twig', ['fairplay' => $fairplay]);
    }
}
