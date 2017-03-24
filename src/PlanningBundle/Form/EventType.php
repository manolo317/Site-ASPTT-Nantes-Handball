<?php

namespace PlanningBundle\Form;

use Symfony\Component\Form\AbstractType;
use Symfony\Component\Form\FormBuilderInterface;
use Symfony\Component\OptionsResolver\OptionsResolver;
use TeamBundle\Entity\Team;
use Symfony\Bridge\Doctrine\Form\Type\EntityType;
use Symfony\Component\Form\Extension\Core\Type\TimeType;
use Symfony\Component\Form\Extension\Core\Type;




class EventType extends AbstractType
{
    /**
     * {@inheritdoc}
     */
    public function buildForm(FormBuilderInterface $builder, array $options)
    {
        $builder
            ->add('opponent')
            ->add('hour', TimeType::class, [
                'placeholder' => [
                    'hour' => 'Hour',
                    'minute' => 'Minute',
                ]
            ])
            ->add('date', EntityType::class, [
                'class' => 'PlanningBundle:Date',
                'choice_label' => 'slug',
                'multiple'     => false,
                'expanded'     => false,
            ])
            ->add('team', EntityType::class, [
                'class' => 'TeamBundle:Team',
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
            'data_class' => 'PlanningBundle\Entity\Event'
        ));
    }

    /**
     * {@inheritdoc}
     */
    public function getBlockPrefix()
    {
        return 'planningbundle_event';
    }


}
