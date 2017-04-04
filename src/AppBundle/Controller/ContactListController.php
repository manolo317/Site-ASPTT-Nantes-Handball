<?php
/**
 * Created by PhpStorm.
 * User: Emmanuel
 * Date: 29/03/2017
 * Time: 14:38
 */

namespace AppBundle\Controller;
use Sensio\Bundle\FrameworkExtraBundle\Configuration\Route;
use Symfony\Bundle\FrameworkBundle\Controller\Controller;
use Symfony\Component\HttpFoundation\Request;


class ContactListController extends Controller
{
    public function listContactAction(Request $request)
    {
        // affichage de la liste des contacts administratifs
        $em = $this->getDoctrine()->getManager();
        $users = $em->getRepository('UserBundle:User')
            ->findAll(); //récupération de tous les membres du club
        return $this->render('AppBundle:page/annexes:contact_list.html.twig', ['users' => $users]);
    }
}