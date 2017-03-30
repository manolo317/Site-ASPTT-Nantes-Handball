<?php

namespace PlanningBundle\Form;

use PlanningBundle\Repository\DayRepository;
use Symfony\Component\Form\AbstractType;
use Symfony\Component\Form\FormBuilderInterface;
use Symfony\Component\OptionsResolver\OptionsResolver;
use Symfony\Bridge\Doctrine\Form\Type\EntityType;
use Symfony\Component\Form\Extension\Core\Type\TimeType;

class TrainingType extends AbstractType
{
    /**
     * {@inheritdoc}
     */
    public function buildForm(FormBuilderInterface $builder, array $options)
    {
        $builder
            ->add('hour', TimeType::class, [
                'placeholder' => [
                    'hour' => 'Hour',
                    'minute' => 'Minute',
                ]
            ])
            ->add('day', EntityType::class, [
                'class' => 'PlanningBundle:Day',
                'choice_label' => 'name',
                'multiple'     => false,
                'expanded'     => false,
                'query_builder' => function(DayRepository $repository) {
                    return $repository->createQueryBuilder('d')
                        ->orderBy('d.id', 'ASC');
                }
            ])
            ->add('team', EntityType::class, [
                'class' => 'TeamBundle:Team',
                'choice_label' => 'name',
                'multiple'     => false,
                'expanded'     => false,
            ])
            ->add('place', EntityType::class, [
                'class' => 'PlaceBundle:Place',
                'choice_label' => 'name',
                'multiple'     => false,
                'expanded'     => false,
            ])
            ;
    }
    
    /**
     * {@inheritdoc}
     */
    public function configureOptions(OptionsResolver $resolver)
    {
        $resolver->setDefaults(array(
            'data_class' => 'PlanningBundle\Entity\Training'
        ));
    }

    /**
     * {@inheritdoc}
     */
    public function getBlockPrefix()
    {
        return 'planningbundle_training';
    }


}
