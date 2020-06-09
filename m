Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 742921F465E
	for <lists+linux-f2fs-devel@lfdr.de>; Tue,  9 Jun 2020 20:35:45 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1jij64-0005Rk-Ha; Tue, 09 Jun 2020 18:35:40 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <pr-tracker-bot@kernel.org>) id 1jij63-0005RV-1s
 for linux-f2fs-devel@lists.sourceforge.net; Tue, 09 Jun 2020 18:35:39 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Cc:To:Date:Message-Id:References:In-Reply-To:From:
 Subject:Sender:Reply-To:MIME-Version:Content-Type:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=ZF/yx3pChqGKeLtRteya+Zmo7kyfjlS4nb51PpTFGqk=; b=FFH9sJUL9pmbwW3LAuqEVEze/F
 hhDLCM1qY6F5PbaCUeozntQKB5fJjr/IcmZF4lFHorTvtnTX8bRc0OJBNGcgA2GgvTaWjwyLHSuJe
 QJBXxSVD4lPuI34VijP4DVOn3+wf4lnvSwJZk2iWooZf+8BdqtwBPSd4FKmhV2UBYzGA=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Cc:To:Date:Message-Id:References:In-Reply-To:From:Subject:Sender:Reply-To
 :MIME-Version:Content-Type:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=ZF/yx3pChqGKeLtRteya+Zmo7kyfjlS4nb51PpTFGqk=; b=jNAGXXglb62DhbZX234GwYqU/B
 aY4Xk66awyyz1ckRbP5jmCgo83LrkEgSHxYRWL6LCDx85DmfMKfr83kiRA2KTydtxw+W17Y4veSoC
 iWiwQgkDRJn2mRtpkOdQKw74tHmMuIwf0Ex7U9s4Pj9LA7h130D1PRonSiAY4n5SoLbA=;
Received: from mail.kernel.org ([198.145.29.99])
 by sfi-mx-4.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1jij5y-000G8m-6C
 for linux-f2fs-devel@lists.sourceforge.net; Tue, 09 Jun 2020 18:35:38 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1591727724;
 bh=qhY+jtDr7eGsdtq/KDAUivjzemoTiVK0XkiET1MON44=;
 h=From:In-Reply-To:References:Date:To:Cc:From;
 b=dpV8+DRzDqLXNKYku543i6f97gTekyIwRdhghnG1DsfVYLkCHo3NgnG0KcHyLZ6YW
 SMYQ1riEEmwD1yFbmx9jtWYqTdU1G69lmbGSj6cdqv2Vr2Iqw3KeEoZAuC07EhIjts
 VtEN+fwFtMZvfClNOsASynONb54VTgcyPuVUeMEY=
From: pr-tracker-bot@kernel.org
In-Reply-To: <20200609145544.GA171717@google.com>
References: <20200609145544.GA171717@google.com>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <20200609145544.GA171717@google.com>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/jaegeuk/f2fs.git
 tags/f2fs-for-5.8
X-PR-Tracked-Commit-Id: b7b911d59dacb47511a1e604bbfa901beb108305
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 42612e7763315cf5d43c4422781e75f9ee57597a
Message-Id: <159172772393.12427.4644781740736919074.pr-tracker-bot@kernel.org>
Date: Tue, 09 Jun 2020 18:35:23 +0000
To: Jaegeuk Kim <jaegeuk@kernel.org>
X-Spam-Score: -0.6 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - Whitelisted High sender
 -0.5 AWL AWL: Adjusted score from AWL reputation of From: address
X-Headers-End: 1jij5y-000G8m-6C
Subject: Re: [f2fs-dev] [GIT PULL] f2fs for 5.8-rc1
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

The pull request you sent on Tue, 9 Jun 2020 07:55:44 -0700:

> git://git.kernel.org/pub/scm/linux/kernel/git/jaegeuk/f2fs.git tags/f2fs-for-5.8

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/42612e7763315cf5d43c4422781e75f9ee57597a

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.wiki.kernel.org/userdoc/prtracker


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
