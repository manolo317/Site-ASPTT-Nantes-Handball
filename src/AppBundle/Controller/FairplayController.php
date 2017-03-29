<?php

namespace AppBundle\Controller;

use Sensio\Bundle\FrameworkExtraBundle\Configuration\Route;
use Symfony\Bundle\FrameworkBundle\Controller\Controller;
use Symfony\Component\HttpFoundation\Request;
use InfoBundle\Entity\FairPlay;
use Sensio\Bundle\FrameworkExtraBundle\Configuration\ParamConverter;




class FairplayController extends Controller
{
  public function viewAction()
  {
    $em = $this->getDoctrine()->getManager();

    $fairPlays = $em->getRepository('InfoBundle:FairPlay')->findAll();

    return $this->render('AppBundle:page:fairplay.html.twig', ['fairPlays' => $fairPlays]);
  }
}
