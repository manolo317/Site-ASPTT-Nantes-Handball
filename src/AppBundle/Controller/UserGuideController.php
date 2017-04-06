<?php
/**
 * Created by PhpStorm.
 * User: Emmanuel
 * Date: 04/04/2017
 * Time: 14:06
 */

namespace AppBundle\Controller;

use Sensio\Bundle\FrameworkExtraBundle\Configuration\Route;
use Symfony\Bundle\FrameworkBundle\Controller\Controller;
use Symfony\Component\HttpFoundation\Request;

class UserGuideController extends Controller
{

    public function indexAction()
    {
        return $this->render('AppBundle:Admin/Guide:index.html.twig');
    }

    public function addDateAction()
    {
        return $this->render('AppBundle:Admin/Guide:add_date.html.twig');
    }

    public function addEventAction()
    {
        return $this->render('AppBundle:Admin/Guide:add_event.html.twig');
    }

    public function editEventAction()
    {
        return $this->render('AppBundle:Admin/Guide:edit_event.html.twig');
    }

    public function addTrainingAction()
    {
        return $this->render('AppBundle:Admin/Guide:add_training.html.twig');
    }

    public function editTrainingAction()
    {
        return $this->render('AppBundle:Admin/Guide:edit_training.html.twig');
    }

    public function addTeamAction()
    {
        return $this->render('AppBundle:Admin/Guide:add_team.html.twig');
    }

    public function editTeamAction()
    {
        return $this->render('AppBundle:Admin/Guide:edit_team.html.twig');
    }

    public function addUserAction()
    {
        return $this->render('AppBundle:Admin/Guide:add_user.html.twig');
    }

    public function editUserAction()
    {
        return $this->render('AppBundle:Admin/Guide:edit_user.html.twig');
    }

    public function addPositionAction()
    {
        return $this->render('AppBundle:Admin/Guide:add_position.html.twig');
    }

    public function addPostAction()
    {
        return $this->render('AppBundle:Admin/Guide:add_post.html.twig');
    }

    public function editPostAction()
    {
        return $this->render('AppBundle:Admin/Guide:edit_post.html.twig');
    }

    public function editHistoryAction()
    {
        return $this->render('AppBundle:Admin/Guide:edit_history.html.twig');
    }

    public function editFairplayAction()
    {
        return $this->render('AppBundle:Admin/Guide:edit_fairplay.html.twig');
    }

    public function editEditoAction()
    {
        return $this->render('AppBundle:Admin/Guide:edit_edito.html.twig');
    }

    public function editPlaceAction()
    {
        return $this->render('AppBundle:Admin/Guide:edit_place.html.twig');
    }
}