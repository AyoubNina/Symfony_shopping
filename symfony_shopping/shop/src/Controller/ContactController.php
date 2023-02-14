<?php

namespace App\Controller;
use App\Entity\Contact;
use Symfony\Component\HttpFoundation\Request;
use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\Routing\Annotation\Route;

class ContactController extends AbstractController
{
    /**
     * @Route("/contact/contact", name="contact_affichage")
     */
    public function contact(Request $request): Response
    {
        return $this->render('contact/contact.html.twig');
    }

    /**
     * @Route("/contact/contact_bd", name="contact_bd")
     */
    public function contact_bd(Request $request): Response
    {

        $nom=$request->get('nom');
        $prenom=$request->get('prenom');
        $email= $request->get('email');
        $message=$request->get('message');


        $entityManager = $this->getDoctrine()->getManager();
        $contact = new Contact();

        $contact->setNom($nom);
        $contact->setPrenom($prenom);
        $contact->setEmail($email);
        $contact->setMessage($message);

        $entityManager->persist($contact);
        $entityManager->flush();

        return $this->redirectToRoute("contact_affichage");
    }


     /**
     * @Route("/contact/listemessage", name="listemessage")
     */
    public function listemessage(Request $request): Response
    {  
        //appelle à tous les messsages en utilisant this(controller)je vais appeler doctrine bd, et lui demander
        // de charger une repository qui correspant a mes contatct puis appeler la methode findAll et je met 
        //le resultat dans la variable
        $repo = $this->getDoctrine()->getRepository(Contact::class);
        $contacts=$repo->findAll();
        return $this->render('contact/listemessage.html.twig', [
            'contacts'=>$contacts
        ]);
    }
     /**
     * @Route("/contact/supprimer", name="contact_supprimer")
     */
    public function supprimer(Request $request): Response
    {
        $repo = $this->getDoctrine()->getRepository(Contact::class);
        $contact = $repo->findOneById($request->get('id_supprimer'));
        $entityManager = $this->getDoctrine()->getManager();
        $entityManager->remove($contact);
        $entityManager->flush($contact);
        return $this->redirectToRoute('listemessage');
    }


}
