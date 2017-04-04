<?php
/**
 * Created by PhpStorm.
 * User: Emmanuel
 * Date: 27/03/2017
 * Time: 21:15
 */

namespace AppBundle\Controller;

use Sensio\Bundle\FrameworkExtraBundle\Configuration\Route;
use Symfony\Bundle\FrameworkBundle\Controller\Controller;
use Symfony\Component\HttpFoundation\Request;


class AdminController extends Controller
{
    public function indexAction(Request $request)
    {
        // affichage de la page d'accueil admin
        return $this->render('AppBundle:Admin:index.html.twig');
    }

    public function menuAction()
    {
        // affichage de la navbar de l'espace admin
        return $this->render('AppBundle:Admin:admin_navbar.html.twig');
    }
}