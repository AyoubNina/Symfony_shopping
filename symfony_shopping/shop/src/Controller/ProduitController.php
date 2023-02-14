<?php

namespace App\Controller;
use App\Entity\Produit;
use App\Entity\Contact;
use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\HttpFoundation\Session\SessionInterface;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\HttpFoundation\Request;
use Symfony\Component\Routing\Annotation\Route;
use App\Repository\ProduitRepository;



class ProduitController extends AbstractController
{   //pour afficher la page vide
     /**
     * @Route("/produit/ajouter", name="ajouter")
     */
    public function ajouter(Request $request): Response
    {
        return $this->render('produit/ajouter.html.twig');
    }
    //pour remplir la base de données
    /**
     * @Route("/produit/ajouter_bd", name="ajouter_bd")
     */
    public function ajouter_bd(Request $request): Response
    {
        $id=$request->get('id');
        $code=$request->get('code', 0);
        $label=$request->get('label', '');
        $image= $request->get('image', '');
        $description=$request->get('description', '');
        $prix=$request->get('prix', 0.0);


        $entityManager = $this->getDoctrine()->getManager();
        $produit = new Produit();
        $produit->setCode($code);
        $produit->setLabel($label);
        $produit->setImage($image);
        $produit->setDescription($description);
        $produit->setPrix($prix);

        $entityManager->persist($produit);
        $entityManager->flush();

        return $this->redirectToRoute('lister');
    }


      //afficher la liste des produits à l'administrateur
    /**
     * @Route("/produit/lister", name="lister")
     */
    public function lister(): Response
    {  
        //appelle à tous les articles en utilisant this(controller)je vais appeler doctrine bd, et lui demander
        // de charger une repository qui correspant a mes produits puis appeler la methode findAll et je met 
        //le resultat dans la variable
        $repo = $this->getDoctrine()->getRepository(Produit::class);
        $produits = $repo->findAll(); 

        // dd($produits);
       
        return $this->render('produit/lister.html.twig', [
            'items'=>$produits,
        ]);
    }



    //pour afficher le formilaire d'un produit à partir de son ID
    /**
     * @Route("/produit/editer", name="editer")
     */
    public function editer(Request $request): Response
    {
        $repo = $this->getDoctrine()->getRepository(Produit::class);
        $produit = $repo->findOneById($request->get('id_editer')); 
        return $this->render('produit/editer.html.twig', [
            'produit' => $produit,
        ]);
    }
    //pour editer la base de donnée avec les nouvelles informations
     /**
     * @Route("/produit/editer_bd", name="editer_bd")
     */
    public function editer_bd(Request $request): Response
    {
        $id=$request->get('id');
      
        $code=$request->get('code', 0);
        $label=$request->get('label', '');
        $image= $request->get('image', '');
        $description=$request->get('description', '');
        $prix=$request->get('prix', 0.0);


        $entityManager = $this->getDoctrine()->getManager();
        $repo = $this->getDoctrine()->getRepository(Produit::class);
        $produit = $repo->findOneById($id);

        $produit->setCode($code);
        $produit->setLabel($label);
        if ($image != null) {
            $produit->setImage($image);
        }
        $produit->setDescription($description);
        $produit->setPrix($prix);

        $entityManager->persist($produit);
        $entityManager->flush();

        return $this->redirectToRoute('lister');
    }

    /**
     * @Route("/produit/supprimer", name="supprimer")
     */
    public function supprimer(Request $request): Response
    {
        $repo = $this->getDoctrine()->getRepository(Produit::class);
        $produit = $repo->findOneById($request->get('id_supprimer'));
        $entityManager = $this->getDoctrine()->getManager();
        $entityManager->remove($produit);
        $entityManager->flush($produit);
        return $this->redirectToRoute('lister');
    }
  





    // -----  frontend

     /**
     * @Route("/produit/afficher", name="afficher")
     */
    public function afficher(Request $request): Response
    {  
        //appelle à tous les articles en utilisant this(controller)je vais appeler doctrine bd, et lui demander
        // de charger une repository qui correspant a mes produits puis appeler la methode findAll et je met 
        //le resultat dans la variable
        $repo = $this->getDoctrine()->getRepository(Produit::class);
        $produit=$repo->findAll();
        return $this->render('produit/afficher.html.twig', [
            'items'=>$produit
        ]);
    }

}
