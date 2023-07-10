<?php

namespace App\Controller;

use App\Entity\Options;
use App\Repository\OptionsRepository;
use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\HttpFoundation\JsonResponse;
use Symfony\Component\HttpFoundation\Request;
use Symfony\Component\Routing\Annotation\Route;
use Symfony\Component\Serializer\SerializerInterface;
use Symfony\Component\Validator\Validator\ValidatorInterface;

#[Route('/api/options')]
class OptionsController extends AbstractController
{

    public function __construct(private OptionsRepository $optrep)
    {

    }
    #[Route(methods: 'GET')]
    public function All(): JsonResponse
    {
        return $this->json($this->optrep->findAll());
    }


    #[Route('/{id}', methods: 'GET')]
    public function one(int $id): JsonResponse
    {
        $options = $this->optrep->findById($id);
        if ($options == null) {
            return $this->json('Resource Not Found', 404);

        }
        return $this->json($options);
    }


    #[Route('/{id}', methods: 'DELETE')]
    public function delete(int $id): JsonResponse
    {
        $options = $this->optrep->findById($id);
        if ($options == null) {
            return $this->json('Resource Not Found', 404);

        }
        $this->optrep->delete($id);

        return $this->json(null, 204);
    }


    #[Route(methods: 'POST')]
    public function add(Request $request, SerializerInterface $serializer, ValidatorInterface $validator)
    {
        
        try {
            $options = $serializer->deserialize($request->getContent(), Options::class, 'json');
        } catch (\Exception $error) {
            return $this->json('Invalid body', 400);
        }
        $errors = $validator->validate($options);
        if ($errors->count() > 0) {
            return $this->json(['errors' => $errors], 400);
        }
        $this->optrep->persist($options);

        return $this->json($options, 201);
    }



    #[Route('/{id}', methods: 'PATCH')]
    public function update(int $id, Request $request, SerializerInterface $serializer, ValidatorInterface $validator)
    {
        $options = $this->optrep->findById($id);
        if ($options == null) {
            return $this->json('Resource Not Found', 404);
        }
        try {
            $serializer->deserialize($request->getContent(), Options::class, 'json', [
                'object_to_populate' => $options
            ]);

        } catch (\Exception $error) {

            return $this->json('Invalid body', 400);
        }
        $errors = $validator->validate($options);

        if ($errors->count() > 0) {
            return $this->json(['errors' => $errors], 400);
        }

        $this->optrep->update($options);
        return $this->json($options, 201);


    }
    #[Route('/product/{id}', methods: 'GET')]
    public function findProduct($id): JsonResponse
    {
        return $this->json($this->optrep->findByProduct($id));
    }
}
