Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 10B77373387
	for <lists+linux-f2fs-devel@lfdr.de>; Wed,  5 May 2021 03:17:33 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.92.3)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1le6AF-000739-Tl; Wed, 05 May 2021 01:17:23 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.3)
 (envelope-from <pr-tracker-bot@kernel.org>) id 1le6AD-00072z-SC
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 05 May 2021 01:17:21 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Cc:To:Date:Message-Id:References:In-Reply-To:From:
 Subject:Sender:Reply-To:MIME-Version:Content-Type:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=OcFXTRHDZ+ZoKwR4tsPHObG0TlLat9eZXj+Z0oni8Xc=; b=WDynU5FJ0XA+77Xpi0aKHtvZBr
 P93MRVZaYILX0ldft2fnFrSj2KuEtUEpu4nxbi07k2QQRJcyi0UtwQac/0IyiRDSisUd7z8xr9e91
 gONAvYe9ZJAj6uZU4EGXi2vFfS8wLD1Joa/NoRp8gJxpR+l8JHPHwr56OueT9SHRGhCk=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Cc:To:Date:Message-Id:References:In-Reply-To:From:Subject:Sender:Reply-To
 :MIME-Version:Content-Type:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=OcFXTRHDZ+ZoKwR4tsPHObG0TlLat9eZXj+Z0oni8Xc=; b=LVysJprENPmc5lOXnjabMEe7cN
 dMLHKYVPyjvn4QV/sVb/xxA4peUsd0vvzJGg+9XWLjy4lgpqEK+9+DLeVXmBfvVUHc9EPqmcU2mG1
 +kBqM2qjBSxoh2DYefWgc1nIIiTRwkdqIjufFxrBrv3yqbcwKPf08GouDNUuG4b7s+Z0=;
Received: from mail.kernel.org ([198.145.29.99])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1le6AA-00FnWJ-Ig
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 05 May 2021 01:17:22 +0000
Received: by mail.kernel.org (Postfix) with ESMTPS id F0376613C4;
 Wed,  5 May 2021 01:17:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1620177429;
 bh=FqlzZPpO0Sup6WQF/MP9sdmkrnH6+QkILTYxQZy1ErI=;
 h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
 b=dtWcAWm5RiuxZZDI/731vBpx2InjqBNNbLA1Eho3FfDGBzYsPLr/fs+RfoYnh6lSJ
 K0F0uX0Y7Qy/rxPg+ZaxMv3g8S/CCGzQijUjAoy96YBvLF19OQv+rPnLtQRr2LZxnX
 gXhJ+nGpoJV7HY/nM/iat5gpX2GwWt/JL+cccG76a4HUN35DCEWGeOSjz4YVgh0s4R
 m0PPytuW4KX1zziYuE/H/TYaPZwsIlt6t/DE6i5wZ1RKhBEbxo2gFuipYNL6C3klbh
 aXLUyWU+JJE2RnNkm6VFz5UNNsMPAYCVLDHfnAiuBsMDeJGc77oU1JosAwxgNm1NAr
 t/t3pOtOnjyiA==
Received: from pdx-korg-docbuild-2.ci.codeaurora.org (localhost.localdomain
 [127.0.0.1])
 by pdx-korg-docbuild-2.ci.codeaurora.org (Postfix) with ESMTP id E89BD609E9;
 Wed,  5 May 2021 01:17:08 +0000 (UTC)
From: pr-tracker-bot@kernel.org
In-Reply-To: <YJCGSeyA7XoNcyZT@google.com>
References: <YJCGSeyA7XoNcyZT@google.com>
X-PR-Tracked-List-Id: <linux-f2fs-devel.lists.sourceforge.net>
X-PR-Tracked-Message-Id: <YJCGSeyA7XoNcyZT@google.com>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/jaegeuk/f2fs.git
 tags/f2fs-for-5.13-rc1
X-PR-Tracked-Commit-Id: 9557727876674893d35940fddbd03d3b505e7ed8
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: d0195c7d7af6a456c37f4b4b2df5528f10714482
Message-Id: <162017742894.16566.9409108512793318888.pr-tracker-bot@kernel.org>
Date: Wed, 05 May 2021 01:17:08 +0000
To: Jaegeuk Kim <jaegeuk@kernel.org>
X-Spam-Score: -0.8 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.7 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1le6AA-00FnWJ-Ig
Subject: Re: [f2fs-dev] [GIT PULL] f2fs update for 5.13-rc1
X-BeenThere: linux-f2fs-devel@lists.sourceforge.net
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <linux-f2fs-devel.lists.sourceforge.net>
List-Unsubscribe: <https://lists.sourceforge.net/lists/options/linux-f2fs-devel>, 
 <mailto:linux-f2fs-devel-request@lists.sourceforge.net?subject=unsubscribe>
List-Archive: <http://sourceforge.net/mailarchive/forum.php?forum_name=linux-f2fs-devel>
List-Post: <mailto:linux-f2fs-devel@lists.sourceforge.net>
List-Help: <mailto:linux-f2fs-devel-request@lists.sourceforge.net?subject=help>
List-Subscribe: <https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel>, 
 <mailto:linux-f2fs-devel-request@lists.sourceforge.net?subject=subscribe>
Cc: Linus Torvalds <torvalds@linux-foundation.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Linux F2FS Dev Mailing List <linux-f2fs-devel@lists.sourceforge.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

The pull request you sent on Mon, 3 May 2021 16:24:57 -0700:

> git://git.kernel.org/pub/scm/linux/kernel/git/jaegeuk/f2fs.git tags/f2fs-for-5.13-rc1

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/d0195c7d7af6a456c37f4b4b2df5528f10714482

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
