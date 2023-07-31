<?php

namespace App\Command;

use Doctrine\ORM\EntityManagerInterface;
use Symfony\Component\Console\Attribute\AsCommand;
use Symfony\Component\Console\Command\Command;
use Symfony\Component\Console\Input\InputArgument;
use Symfony\Component\Console\Input\InputInterface;
use Symfony\Component\Console\Input\InputOption;
use Symfony\Component\Console\Output\OutputInterface;
use Symfony\Component\Console\Style\SymfonyStyle;
use App\Entity\User;

#[AsCommand(
    name: 'FinishedContract',
    description: 'Supprime les comptes dont le contrat est fini',
)]
class FinishedContract extends Command
{
    private $entityManager;
    public function __construct(EntityManagerInterface $entityManager)
    {
        $this->entityManager = $entityManager;
        parent::__construct();
    }

    protected function execute(InputInterface $input, OutputInterface $output)
    {
        $repository = $this->entityManager->getRepository(User::class);
        $currentDate = new \DateTime();

        $terminatedAccounts = $repository->createQueryBuilder('user')
            ->where('user.release_date <= :currentDate')
            ->setParameter('currentDate', $currentDate)
            ->getQuery()
            ->getResult();

        foreach ($terminatedAccounts as $account) {
            $this->entityManager->remove($account);
        }

        $this->entityManager->flush();

        $output->writeln('Tous les comptes dont le contrat est terminé ont été supprimé.');

        return Command::SUCCESS;
    }
}
