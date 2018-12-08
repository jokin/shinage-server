<?php
declare(strict_types=1);

/*
 * Copyright 2018 by Michael Zapf.
 * Licensed under MIT. See file /LICENSE.
 */

namespace App\Security\Voters;

use App\Entity\Presentation;
use App\Service\ScreenAssociation;
use Symfony\Component\Security\Core\Authentication\Token\TokenInterface;
use Symfony\Component\Security\Core\Authorization\Voter\Voter;

class PresentationVoter extends Voter
{
    public function __construct(ScreenAssociation $screenAssociation)
    {
        $this->screenAssociation = $screenAssociation;
    }

    /**
     * {@inheritdoc}
     */
    protected function supports($attribute, $subject)
    {
        return $subject instanceof Presentation;
    }

    /**
     * @param Presentation $subject
     *
     * {@inheritdoc}
     */
    protected function voteOnAttribute($attribute, $subject, TokenInterface $token)
    {
        $owner = $subject->getOwner();
        $user = $token->getUser();

        if ($owner === $user) {
            return true;
        }

        if (in_array($owner, $user->getOrganizations())) {
            return true;
        }

        return false;
    }
}
