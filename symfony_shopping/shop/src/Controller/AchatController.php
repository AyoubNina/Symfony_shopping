<?php

namespace App\Controller;
use App\Entity\Achat;

use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\HttpFoundation\Session\SessionInterface;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\HttpFoundation\Request;
use Symfony\Component\Routing\Annotation\Route;
use App\Repository\ProduitRepository;
use App\Repository\AchatRepository;



class AchatController extends AbstractController
{
    /**
     * @Route("/achat", name="achat_save")
     */
    public function save(SessionInterface $session, ProduitRepository $produitRepository, AchatRepository $achatRepository): Response
    {
        $entityManager = $this->getDoctrine()->getManager();
        $panier = $session->get('panier',[]);
        $achat=$achatRepository->findOneByIdUtilisateurMax($this->getUser()->getId());
        foreach ($panier as $id_produit => $quantity) 
        {   
            $achat_ligne = new Achat();
            $achat_ligne->setIdUtilisateur($this->getUser()->getId());
            $achat_ligne->setIdProduit($id_produit);
            $achat_ligne->setQuantite($quantity);
            $produit=$produitRepository->find($id_produit);
            $achat_ligne->setPrix($produit->getPrix());
            $achat_ligne->setNumero($achat->getNumero() +1);


            $entityManager->persist($achat_ligne);
            $entityManager->flush();
        }
       
        $session->set('panier',[]);
        return $this->redirectToRoute('afficher');
    }

}
