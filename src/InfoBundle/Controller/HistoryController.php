<?php

namespace InfoBundle\Controller;

use InfoBundle\Entity\History;
use Symfony\Bundle\FrameworkBundle\Controller\Controller;
use Symfony\Component\HttpFoundation\Request;

/**
 * History controller.
 *
 */
class HistoryController extends Controller
{
    /**
     * Lists all history entities.
     *
     */
    public function indexAction()
    {
        $em = $this->getDoctrine()->getManager();

        $histories = $em->getRepository('InfoBundle:History')->findAll();

        return $this->render('AppBundle:Admin/History:index.html.twig', array(
            'histories' => $histories,
        ));
    }

    /**
     * Finds and displays a history entity.
     *
     */
    public function showAction(History $history)
    {

        return $this->render('AppBundle:Admin/History:show.html.twig', array(
            'history' => $history,
        ));
    }

    /**
     * Displays a form to edit an existing history entity.
     *
     */
    public function editAction(Request $request, History $history)
    {
        $editForm = $this->createForm('InfoBundle\Form\HistoryType', $history);
        $editForm->handleRequest($request);

        if ($editForm->isSubmitted() && $editForm->isValid()) {
            $this->getDoctrine()->getManager()->flush();

            return $this->redirectToRoute('admin_history_edit', array('id' => $history->getId()));
        }

        return $this->render('AppBundle:Admin/History:edit.html.twig', array(
            'history' => $history,
            'edit_form' => $editForm->createView(),
        ));
    }
}
