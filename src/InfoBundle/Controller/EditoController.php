<?php

namespace InfoBundle\Controller;

use InfoBundle\Entity\Edito;
use Symfony\Bundle\FrameworkBundle\Controller\Controller;
use Sensio\Bundle\FrameworkExtraBundle\Configuration\Method;
use Sensio\Bundle\FrameworkExtraBundle\Configuration\Route;use Symfony\Component\HttpFoundation\Request;

/**
 * Edito controller.
 *
 * @Route("edito")
 */
class EditoController extends Controller
{
    /**
     * Lists all edito entities.
     *
     * @Route("/", name="admin_edito_index")
     * @Method("GET")
     */
    public function indexAction()
    {
        $em = $this->getDoctrine()->getManager();

        $editos = $em->getRepository('InfoBundle:Edito')->findAll();

        return $this->render('AppBundle:Admin/Edito:index.html.twig', array(
            'editos' => $editos,
        ));
    }

    /**
     * Finds and displays a edito entity.
     *
     * @Route("/{id}", name="admin_edito_show")
     * @Method("GET")
     */
    public function showAction(Edito $edito)
    {

        return $this->render('AppBundle:Admin/Edito:show.html.twig', array(
            'edito' => $edito
        ));
    }

    /**
     * Displays a form to edit an existing edito entity.
     *
     * @Route("/{id}/edit", name="admin_edito_edit")
     * @Method({"GET", "POST"})
     */
    public function editAction(Request $request, Edito $edito)
    {
        $editForm = $this->createForm('InfoBundle\Form\EditoType', $edito);
        $editForm->handleRequest($request);

        if ($editForm->isSubmitted() && $editForm->isValid()) {
            $this->getDoctrine()->getManager()->flush();

            return $this->redirectToRoute('admin_edito_edit', array('id' => $edito->getId()));
        }

        return $this->render('AppBundle:Admin/Edito:edit.html.twig', array(
            'edito' => $edito,
            'edit_form' => $editForm->createView()
        ));
    }

}
