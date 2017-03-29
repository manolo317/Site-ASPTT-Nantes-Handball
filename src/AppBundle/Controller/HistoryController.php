<?php

namespace AppBundle\Controller;

use Sensio\Bundle\FrameworkExtraBundle\Configuration\Route;
use Symfony\Bundle\FrameworkBundle\Controller\Controller;
use Symfony\Component\HttpFoundation\Request;
use InfoBundle\Entity\History;
use Sensio\Bundle\FrameworkExtraBundle\Configuration\ParamConverter;




class HistoryController extends Controller
{
  public function viewAction()
  {
    $em = $this->getDoctrine()->getManager();

    $histories = $em->getRepository('InfoBundle:History')->findAll();

    return $this->render('AppBundle:page:history.html.twig', ['histories' => $histories]);
  }
}
