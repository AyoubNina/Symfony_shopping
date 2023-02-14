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

class PanierController extends AbstractController
{
   
     /**
     * @Route("/panier", name="panier")
     */
    public function panier(SessionInterface $session, ProduitRepository $produitRepository)
    {
        if ($this->getUser() != null) {
            $panier = $session->get('panier',[]);

            $panierWithData = [];

            foreach($panier as $id => $quantity){
                $panierWithData[] = [
                    'produit' => $produitRepository->find($id),
                    'quantity' => $quantity
                ];
            }
            
            $total = 0;

            foreach($panierWithData as $item) {
                $totalItem = $item['produit']->getPrix() * $item['quantity'];
                $total += $totalItem;
            }
            //passage au twig
            return $this->render('panier/panier.html.twig', [
                'items' => $panierWithData,
                'total' => $total
            ]);
        } else {
            return $this->redirectToRoute("app_login"); 
        }
    }


     /**
     * @Route("/panier/add/{id}", name="panier_add")
     */
    public function add($id, SessionInterface $session )
    {
       if ($this->getUser() != null) {
        $panier = $session->get('panier', []);
        
        if(!empty($panier[$id])){
                $panier[$id]++;
            } else {
                $panier[$id] = 1;
            }

        $session ->set('panier', $panier);
            
        return $this->redirectToRoute("panier");
       } else {
        return $this->redirectToRoute("app_login"); 
       }

    }
    /**
     * @Route("/panier/remove/{id}", name="panier_remove")
     */
    public function remove($id, SessionInterface $session )
    {
        $panier = $session->get('panier', []);
       
        unset($panier[$id]);
      
        $session->set('panier', $panier);
        return $this->redirectToRoute("panier");

    }

    /**
     * @Route("/delete/{id}", name="panier_delete")
     */
    public function delete($id, SessionInterface $session)
    {
        // On récupère le panier actuel
        $panier = $session->get("panier", []);

        if (!empty($panier[$id])) {
            if ($panier[$id] > 1) {
                $panier[$id]--;
            } else {
                $panier[$id] = 0;
            }
        }

        // On sauvegarde dans la session
        $session->set("panier", $panier);
        return $this->redirectToRoute("panier");
    }



    
}
