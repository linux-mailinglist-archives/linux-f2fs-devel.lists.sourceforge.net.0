Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id C9D9D539A45
	for <lists+linux-f2fs-devel@lfdr.de>; Wed,  1 Jun 2022 02:07:08 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.94.2)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1nwBt9-0007j4-2p; Wed, 01 Jun 2022 00:07:01 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <pr-tracker-bot@kernel.org>) id 1nwBt8-0007im-IK
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 01 Jun 2022 00:07:01 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Cc:To:Date:Message-Id:References:In-Reply-To:From:
 Subject:Sender:Reply-To:MIME-Version:Content-Type:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=tjPhEJQ7U4+lrPqPqU9oOurm3+Jx2gidlhjvWQVd7tA=; b=SkMQCCBlm1UIp3S3KsTdhNGJDF
 1Q1udBjkSLIV2thrn0+HtlT6kyF8CEs+3/ovp4OtGZJSC77heuL9aibOb8OGm9sPgHEsHH9Oi/YmX
 wIaGVIBEi7EIlt/B76EbkWNC8JJ4pu0kKwcQDEtP8DBa4trq3C7Hj4bJkZWS1hxbgPu8=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Cc:To:Date:Message-Id:References:In-Reply-To:From:Subject:Sender:Reply-To
 :MIME-Version:Content-Type:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=tjPhEJQ7U4+lrPqPqU9oOurm3+Jx2gidlhjvWQVd7tA=; b=WrL7pkYmNOKt9lJD4WjJr/cxG1
 MKamk2a1yA7VJH1VbOh5uIfeeuyDv4rVGtSPcJB5hLZWNVwjmQiRYO2cSWKPK6Q9AsTPIIM6NR7V0
 0lFBCd1/5EMiFnP60myvon8c4fs1eT5kOU0BOb++KbyRSCuuWN4frrnHRLqD0qU3pXbw=;
Received: from dfw.source.kernel.org ([139.178.84.217])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.94.2)
 id 1nwBt3-00DTI8-NM
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 01 Jun 2022 00:07:01 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 7EBFB614B4;
 Wed,  1 Jun 2022 00:06:47 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id E3AB4C385A9;
 Wed,  1 Jun 2022 00:06:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1654042006;
 bh=RiVUJJLunPlLqWnhgLpalKLVOijp1W5uMB+tbZrPNac=;
 h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
 b=d9bJ+xV/inPblrTPSCKtRFUUzEJ1Aq8uavUzaBWZaGpbel7YNL8nhTvIVDl9jDp0o
 UttHbQpoqMDnkiJV3NJqaCSYRjMOsYKnq+GjXSNu9hN4oWyzaBYa7m0tDabnt5N/M8
 1p/cMdG9x4Qcb13qmPfp/vEYgtXYBFogMhrGdRs21yZPC8Pzoi71ISAVxhhQXH/vNp
 4FO3Jw9angXYp7zLLxYRhWgXiImst0dWvjN1qm5OOm5Fi/y9b1vPgqarr+DWP0YYFu
 KlrcmG7e3ACNcNHd0BqvD1TTbs0QYjrWoipCSJ5RA3nzSf8FE7E2AOHNsBTI6U1jYP
 3e+k0Gl3TlhLg==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org
 (localhost.localdomain [127.0.0.1])
 by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id
 CF3E8F0383D; Wed,  1 Jun 2022 00:06:46 +0000 (UTC)
From: pr-tracker-bot@kernel.org
In-Reply-To: <YpaCSoxxcWCqo8FQ@google.com>
References: <YpaCSoxxcWCqo8FQ@google.com>
X-PR-Tracked-List-Id: <linux-f2fs-devel.lists.sourceforge.net>
X-PR-Tracked-Message-Id: <YpaCSoxxcWCqo8FQ@google.com>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/jaegeuk/f2fs.git
 tags/f2fs-for-5.19-rc1
X-PR-Tracked-Commit-Id: 2d1fe8a86bf5e0663866fd0da83c2af1e1b0e362
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 1501f707d2b24316b41d45bdc95a73bc8cc8dd49
Message-Id: <165404200684.13836.6267424984494989209.pr-tracker-bot@kernel.org>
Date: Wed, 01 Jun 2022 00:06:46 +0000
To: Jaegeuk Kim <jaegeuk@kernel.org>
X-Spam-Score: -5.9 (-----)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  The pull request you sent on Tue, 31 May 2022 14:02:02 -0700:
 > git://git.kernel.org/pub/scm/linux/kernel/git/jaegeuk/f2fs.git
 tags/f2fs-for-5.19-rc1 has been merged into torvalds/linux.git:
 https://git.kernel.org/torvalds/c/1501f707d2b24316b41d45bdc95a73bc8cc8dd49
 Content analysis details:   (-5.9 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [139.178.84.217 listed in list.dnswl.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.7 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1nwBt3-00DTI8-NM
Subject: Re: [f2fs-dev] [GIT PULL] f2fs for 5.19
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

The pull request you sent on Tue, 31 May 2022 14:02:02 -0700:

> git://git.kernel.org/pub/scm/linux/kernel/git/jaegeuk/f2fs.git tags/f2fs-for-5.19-rc1

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/1501f707d2b24316b41d45bdc95a73bc8cc8dd49

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
