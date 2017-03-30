<?php

namespace PlanningBundle\Controller;

use PlanningBundle\Entity\Training;
use Symfony\Bundle\FrameworkBundle\Controller\Controller;
use Sensio\Bundle\FrameworkExtraBundle\Configuration\Method;
use Sensio\Bundle\FrameworkExtraBundle\Configuration\Route;
use Symfony\Component\HttpFoundation\Request;

/**
 * Training controller.
 *
 * @Route("training")
 */
class TrainingController extends Controller
{
    /**
     * Lists all training entities.
     *
     * @Route("/", name="admin_training_index")
     * @Method("GET")
     */
    public function indexAction()
    {
        $em = $this->getDoctrine()->getManager();

        $days = $em->getRepository('PlanningBundle:Day')->findAllOrderedByDay();

        return $this->render('AppBundle:Admin/Training:index.html.twig', array(
            'days' => $days,
        ));
    }

    /**
     * Creates a new training entity.
     *
     * @Route("/new", name="admin_training_new")
     * @Method({"GET", "POST"})
     */
    public function newAction(Request $request)
    {
        $training = new Training();
        $form = $this->createForm('PlanningBundle\Form\TrainingType', $training);
        $form->handleRequest($request);

        if ($form->isSubmitted() && $form->isValid()) {
            $em = $this->getDoctrine()->getManager();
            $em->persist($training);
            $em->flush();

            return $this->redirectToRoute('admin_training_show', array('id' => $training->getId()));
        }

        return $this->render('AppBundle:Admin/Training:new.html.twig', array(
            'training' => $training,
            'form' => $form->createView(),
        ));
    }

    /**
     * Finds and displays a training entity.
     *
     * @Route("/{id}", name="admin_training_show")
     * @Method("GET")
     */
    public function showAction(Training $training)
    {
        $deleteForm = $this->createDeleteForm($training);

        return $this->render('AppBundle:Admin/Training:show.html.twig', array(
            'training' => $training,
            'delete_form' => $deleteForm->createView(),
        ));
    }

    /**
     * Displays a form to edit an existing training entity.
     *
     * @Route("/{id}/edit", name="admin_training_edit")
     * @Method({"GET", "POST"})
     */
    public function editAction(Request $request, Training $training)
    {
        $deleteForm = $this->createDeleteForm($training);
        $editForm = $this->createForm('PlanningBundle\Form\TrainingType', $training);
        $editForm->handleRequest($request);

        if ($editForm->isSubmitted() && $editForm->isValid()) {
            $this->getDoctrine()->getManager()->flush();

            return $this->redirectToRoute('admin_training_edit', array('id' => $training->getId()));
        }

        return $this->render('AppBundle:Admin/Training:edit.html.twig', array(
            'training' => $training,
            'edit_form' => $editForm->createView(),
            'delete_form' => $deleteForm->createView(),
        ));
    }

    /**
     * Deletes a training entity.
     *
     * @Route("/{id}", name="admin_training_delete")
     * @Method("DELETE")
     */
    public function deleteAction(Request $request, Training $training)
    {
        $form = $this->createDeleteForm($training);
        $form->handleRequest($request);

        if ($form->isSubmitted() && $form->isValid()) {
            $em = $this->getDoctrine()->getManager();
            $em->remove($training);
            $em->flush();
        }

        return $this->redirectToRoute('admin_training_index');
    }

    /**
     * Creates a form to delete a training entity.
     *
     * @param Training $training The training entity
     *
     * @return \Symfony\Component\Form\Form The form
     */
    private function createDeleteForm(Training $training)
    {
        return $this->createFormBuilder()
            ->setAction($this->generateUrl('admin_training_delete', array('id' => $training->getId())))
            ->setMethod('DELETE')
            ->getForm()
        ;
    }
}
