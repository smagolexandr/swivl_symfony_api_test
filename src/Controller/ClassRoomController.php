<?php


namespace App\Controller;

use App\Entity\ClassRoom;
use Knp\Component\Pager\PaginatorInterface;
use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\HttpFoundation\Request;
use Symfony\Component\Routing\Annotation\Route;
use Symfony\Component\Serializer\SerializerInterface;
use Symfony\Component\Validator\Validator\ValidatorInterface;

/**
 * @Route("/api/classroom")
 */
class ClassRoomController extends AbstractController
{
    private PaginatorInterface $paginator;
    private SerializerInterface $serializer;
    private ValidatorInterface $validator;

    public function __construct(
        PaginatorInterface $paginator,
        SerializerInterface $serializer,
        ValidatorInterface $validator
    ) {
        $this->paginator = $paginator;
        $this->serializer = $serializer;
        $this->validator = $validator;
    }

    /**
     * @Route("", methods={"GET"})
     */
    public function listAction(Request $request)
    {
        return $this->json(
            $this->paginator->paginate(
                $this->getDoctrine()->getRepository(ClassRoom::class)->findAllQuery(),
                $request->query->get('page', 1)
            )
        );
    }

    /**
     * @Route("/{id}", methods={"GET"})
     */
    public function showAction(ClassRoom $classRoom)
    {
        return $this->json($classRoom);
    }

    /**
     * @Route("/new", methods={"POST"})
     */
    public function newAction(Request $request)
    {
        try {
            $classroom = $this->serializer->deserialize($request->getContent(), ClassRoom::class, 'json');
        } catch (\Exception $e) {
            // log exception
            return $this->json([], 400);
        }
        $errors = $this->validator->validate($classroom);
        $messages = [];
        if (count($errors) > 0) {
            foreach ($errors as $violation) {
                $messages[$violation->getPropertyPath()] = $violation->getMessage();
            }

            return $this->json($messages, 400);
        }

        $this->getDoctrine()->getManager()->persist($classroom);
        $this->getDoctrine()->getManager()->flush();

        return $this->json($classroom, 200);
    }

    /**
     * @Route("/{id}/change-status", methods={"PATCH"})
     */
    public function changeStatusAction(ClassRoom $classRoom)
    {
        $classRoom->setEnabled(!$classRoom->isEnabled());
        $this->getDoctrine()->getManager()->flush();

        return $this->json($classRoom);
    }

    /**
     * @Route("/{id}/edit", methods={"PUT"})
     */
    public function editAction(ClassRoom $classRoom, Request $request)
    {
        try {
            $classRoomObj = $this->serializer->deserialize($request->getContent(), ClassRoom::class, 'json');
        } catch (\Exception $e) {
            // log exception
            return $this->json([], 400);
        }

        if ($classRoomObj->getName()) {
            $classRoom->setName($classRoomObj->getName());
        }
        if ($classRoomObj->isEnabled() !== $classRoom->isEnabled()) {
            $classRoom->setEnabled($classRoomObj->isEnabled());
        }
        $errors = $this->validator->validate($classRoom);

        $messages = [];
        if (count($errors) > 0) {
            foreach ($errors as $violation) {
                $messages[$violation->getPropertyPath()] = $violation->getMessage();
            }

            return $this->json($messages, 400);
        }
        $this->getDoctrine()->getManager()->flush();

        return $this->json($classRoom, 200);
    }

    /**
     * @Route("/{id}/delete", methods={"DELETE"})
     */
    public function deleteAction(ClassRoom $classRoom)
    {
        $this->getDoctrine()->getManager()->remove($classRoom);
        $this->getDoctrine()->getManager()->flush();

        return $this->json([], 200);
    }
}