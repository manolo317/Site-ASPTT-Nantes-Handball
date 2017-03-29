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

        return $this->render('AppBundle:page:contact_list.html.twig');
    }
}