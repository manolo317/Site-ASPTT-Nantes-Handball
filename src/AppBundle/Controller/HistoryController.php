<?php

namespace AppBundle\Controller;

use Sensio\Bundle\FrameworkExtraBundle\Configuration\Route;
use Symfony\Bundle\FrameworkBundle\Controller\Controller;
use Symfony\Component\HttpFoundation\Request;
use InfoBundle\Entity\History;
use Sensio\Bundle\FrameworkExtraBundle\Configuration\ParamConverter;




class HistoryController extends Controller
{
    public function viewAction(Request $request)
    {
        // Page Histoire du club
        $em = $this->getDoctrine()->getManager();

        $history = $em->getRepository('InfoBundle:History')->findOneById(1);

        return $this->render('AppBundle:page/annexes:history.html.twig', ['history' => $history]);
    }
}
