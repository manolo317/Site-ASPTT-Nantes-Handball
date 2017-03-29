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
     * Creates a new fairPlay entity.
     *
     */
    public function newAction(Request $request)
    {
        $fairPlay = new Fairplay();
        $form = $this->createForm('InfoBundle\Form\FairPlayType', $fairPlay);
        $form->handleRequest($request);

        if ($form->isSubmitted() && $form->isValid()) {
            $em = $this->getDoctrine()->getManager();
            $em->persist($fairPlay);
            $em->flush();

            return $this->redirectToRoute('fairplay_show', array('id' => $fairPlay->getId()));
        }

        return $this->render('AppBundle:Admin/Fairplay:new.html.twig', array(
            'fairPlay' => $fairPlay,
            'form' => $form->createView(),
        ));
    }

    /**
     * Finds and displays a fairPlay entity.
     *
     */
    public function showAction(FairPlay $fairPlay)
    {
        $deleteForm = $this->createDeleteForm($fairPlay);

        return $this->render('AppBundle:Admin/Fairplay:show.html.twig', array(
            'fairPlay' => $fairPlay,
            'delete_form' => $deleteForm->createView(),
        ));
    }

    /**
     * Displays a form to edit an existing fairPlay entity.
     *
     */
    public function editAction(Request $request, FairPlay $fairPlay)
    {
        $deleteForm = $this->createDeleteForm($fairPlay);
        $editForm = $this->createForm('InfoBundle\Form\FairPlayType', $fairPlay);
        $editForm->handleRequest($request);

        if ($editForm->isSubmitted() && $editForm->isValid()) {
            $this->getDoctrine()->getManager()->flush();

            return $this->redirectToRoute('fairplay_edit', array('id' => $fairPlay->getId()));
        }

        return $this->render('AppBundle:Admin/Fairplay:edit.html.twig', array(
            'fairPlay' => $fairPlay,
            'edit_form' => $editForm->createView(),
            'delete_form' => $deleteForm->createView(),
        ));
    }

    /**
     * Deletes a fairPlay entity.
     *
     */
    public function deleteAction(Request $request, FairPlay $fairPlay)
    {
        $form = $this->createDeleteForm($fairPlay);
        $form->handleRequest($request);

        if ($form->isSubmitted() && $form->isValid()) {
            $em = $this->getDoctrine()->getManager();
            $em->remove($fairPlay);
            $em->flush();
        }

        return $this->redirectToRoute('fairplay_index');
    }

    /**
     * Creates a form to delete a fairPlay entity.
     *
     * @param FairPlay $fairPlay The fairPlay entity
     *
     * @return \Symfony\Component\Form\Form The form
     */
    private function createDeleteForm(FairPlay $fairPlay)
    {
        return $this->createFormBuilder()
            ->setAction($this->generateUrl('fairplay_delete', array('id' => $fairPlay->getId())))
            ->setMethod('DELETE')
            ->getForm()
        ;
    }
}
