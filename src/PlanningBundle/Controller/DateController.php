<?php

namespace PlanningBundle\Controller;

use PlanningBundle\Entity\DateEvent;
use Symfony\Bundle\FrameworkBundle\Controller\Controller;
use Sensio\Bundle\FrameworkExtraBundle\Configuration\Method;
use Sensio\Bundle\FrameworkExtraBundle\Configuration\Route;
use Symfony\Component\HttpFoundation\Request;

/**
 * DateEvent controller.
 *
 * @Route("date")
 */
class DateController extends Controller
{
    /**
     * Lists all date entities.
     *
     * @Route("/", name="admin_date_index")
     * @Method("GET")
     */
    public function indexAction()
    {
        $em = $this->getDoctrine()->getManager();

        $dates = $em->getRepository('PlanningBundle:DateEvent')->findAllOrderedByDate();

        return $this->render('AppBundle:Admin/Date:index.html.twig', array(
            'dates' => $dates,
        ));
    }

    /**
     * Creates a new date entity.
     *
     * @Route("/new", name="admin_date_new")
     * @Method({"GET", "POST"})
     */
    public function newAction(Request $request)
    {
        $date = new DateEvent();
        $form = $this->createForm('PlanningBundle\Form\DateEventType', $date);
        $form->handleRequest($request);

        if ($form->isSubmitted() && $form->isValid()) {
            $em = $this->getDoctrine()->getManager();
            $em->persist($date);
            $em->flush();

            return $this->redirectToRoute('admin_date_show', array('id' => $date->getId()));
        }

        return $this->render('AppBundle:Admin/Date:new.html.twig', array(
            'date' => $date,
            'form' => $form->createView(),
        ));
    }

    /**
     * Finds and displays a date entity.
     *
     * @Route("/{id}", name="admin_date_show")
     * @Method("GET")
     */
    public function showAction(DateEvent $date)
    {
        $deleteForm = $this->createDeleteForm($date);

        return $this->render('AppBundle:Admin/Date:show.html.twig', array(
            'date' => $date,
            'delete_form' => $deleteForm->createView(),
        ));
    }

    /**
     * Deletes a date entity.
     *
     * @Route("/{id}", name="admin_date_delete")
     * @Method("DELETE")
     */
    public function deleteAction(Request $request, DateEvent $date)
    {
        $form = $this->createDeleteForm($date);
        $form->handleRequest($request);

        if ($form->isSubmitted() && $form->isValid()) {
            $em = $this->getDoctrine()->getManager();
            $em->remove($date);
            $em->flush();
        }

        return $this->redirectToRoute('admin_date_index');
    }

    /**
     * Creates a form to delete a date entity.
     *
     * @param DateEvent $date The date entity
     *
     * @return \Symfony\Component\Form\Form The form
     */
    private function createDeleteForm(DateEvent $date)
    {
        return $this->createFormBuilder()
            ->setAction($this->generateUrl('admin_date_delete', array('id' => $date->getId())))
            ->setMethod('DELETE')
            ->getForm()
        ;
    }
}
