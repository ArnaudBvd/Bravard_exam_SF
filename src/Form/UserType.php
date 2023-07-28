<?php

namespace App\Form;

use App\Entity\User;
use Symfony\Component\Form\AbstractType;
use Symfony\Component\Form\Extension\Core\Type\PasswordType;
use Symfony\Component\Form\Extension\Core\Type\TextType;
use Symfony\Component\Form\FormBuilderInterface;
use Symfony\Component\OptionsResolver\OptionsResolver;
use Symfony\Component\Validator\Constraints\Length;
use Symfony\Component\Validator\Constraints\NotBlank;
use Symfony\Component\Validator\Constraints\Regex;

class UserType extends AbstractType
{
    public function buildForm(FormBuilderInterface $builder, array $options): void
    {
        $builder
            ->add('email')

            ->add('password', PasswordType::class, [
                'label' => 'Mot de passe',               
            ]) 

            ->add('firstname', TextType::class, [
                'label' => 'Prénom',
            ])

            ->add('lastname', TextType::class, [
                'label' => 'Nom',
            ])

            ->add('photo')

            ->add('sector', TextType::class, [
                'label' => 'Secteur d\'activité',
            ])

            ->add('contract', TextType::class, [
                'label' => 'Type de contrat',
            ])

            ->add('release_date')
        ;
    }

    public function configureOptions(OptionsResolver $resolver): void
    {
        $resolver->setDefaults([
            'data_class' => User::class,
        ]);
    }
}
