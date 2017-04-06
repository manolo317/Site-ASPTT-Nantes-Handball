<?php

namespace InfoBundle\Controller;

use InfoBundle\Entity\FairPlay;
use Symfony\Bundle\FrameworkBundle\Controller\Controller;
use Symfony\Component\HttpFoundation\Request;

/**
 * Fairplay controller.
 *
 */
class FairPlayController extends Controller
{
    /**
     * Lists all fairPlay entities.
     *
     */
    public function indexAction()
    {
        $em = $this->getDoctrine()->getManager();

        $fairPlays = $em->getRepository('InfoBundle:FairPlay')->findAll();

        return $this->render('AppBundle:Admin/Fairplay:index.html.twig', array(
            'fairPlays' => $fairPlays,
        ));
    }

    /**
     * Finds and displays a fairPlay entity.
     *
     */
    public function showAction(FairPlay $fairPlay)
    {

        return $this->render('AppBundle:Admin/Fairplay:show.html.twig', array(
            'fairPlay' => $fairPlay
        ));
    }

    /**
     * Displays a form to edit an existing fairPlay entity.
     *
     */
    public function editAction(Request $request, FairPlay $fairPlay)
    {
        $editForm = $this->createForm('InfoBundle\Form\FairPlayType', $fairPlay);
        $editForm->handleRequest($request);

        if ($editForm->isSubmitted() && $editForm->isValid()) {
            $this->getDoctrine()->getManager()->flush();

            return $this->redirectToRoute('admin_fairplay_edit', array('id' => $fairPlay->getId()));
        }

        return $this->render('AppBundle:Admin/Fairplay:edit.html.twig', array(
            'fairPlay' => $fairPlay,
            'edit_form' => $editForm->createView(),
        ));
    }

}
