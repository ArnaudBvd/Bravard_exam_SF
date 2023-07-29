<?php

namespace App\Form;

use App\Entity\User;
use Symfony\Component\Form\AbstractType;
use Symfony\Component\Form\Extension\Core\Type\DateType;
use Symfony\Component\Form\Extension\Core\Type\EmailType;
use Symfony\Component\Form\Extension\Core\Type\PasswordType;
use Symfony\Component\Form\Extension\Core\Type\TextType;
use Symfony\Component\Form\FormBuilderInterface;
use Symfony\Component\OptionsResolver\OptionsResolver;


class UserType extends AbstractType
{
    public function buildForm(FormBuilderInterface $builder, array $options): void
    {
        $builder
            ->add('email', EmailType::class, [
                'attr' => [
                    'placeholder' => "Veuillez saisir un email",
                ]
            ])

            ->add('password', PasswordType::class, [
                'label' => 'Mot de passe',
                'attr' => [
                    'placeholder' => "Veuillez saisir un mot de passe",
                ]                           
            ]) 

            ->add('firstname', TextType::class, [
                'label' => 'Prénom',
                'attr' => [
                    'placeholder' => "Veuillez saisir un prénom",
                ]  
            ])

            ->add('lastname', TextType::class, [
                'label' => 'Nom',
                'attr' => [
                    'placeholder' => "Veuillez saisir un nom",
                ]  
            ])

            ->add('photo')

            ->add('sector', TextType::class, [
                'label' => 'Secteur d\'activité',
                'attr' => [
                    'placeholder' => "Veuillez saisir un secteur d'activité",
                ]  
            ])

            ->add('contract', TextType::class, [
                'label' => 'Type de contrat',
                'attr' => [
                    'placeholder' => "Veuillez saisir un type de contrat",                                        
                ]  
            ])

            ->add('release_date', DateType::class, [
                'label' => 'Date de fin de contrat',
                'required' => false,
                'format' => 'dd-MM-yyyy',                  
            ])
        ;
    }

    public function configureOptions(OptionsResolver $resolver): void
    {
        $resolver->setDefaults([
            'data_class' => User::class,
        ]);
    }
}
