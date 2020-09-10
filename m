Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id D604826513C
	for <lists+linux-f2fs-devel@lfdr.de>; Thu, 10 Sep 2020 22:49:47 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1kGTVm-0007dU-4c; Thu, 10 Sep 2020 20:49:42 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <pr-tracker-bot@kernel.org>) id 1kGTVl-0007dJ-CG
 for linux-f2fs-devel@lists.sourceforge.net; Thu, 10 Sep 2020 20:49:41 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Cc:To:Date:Message-Id:References:In-Reply-To:From:
 Subject:Sender:Reply-To:MIME-Version:Content-Type:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=x09k+J9CyrnUphCV9944m5PR+SBeUvG7u42JRmoHUw8=; b=DZNw5ZpDHr+Zx+lsNd6nk/vsPM
 4ailDOxIsYKvUpfo4bJMrX9CWYaotH48U4wqpjOvuyYe9NeryN5QDaWv1YpwKgm4TBlCyJ8BJcvtJ
 1sLHpaWQDyKza1j4p3uhmicLEuyRv3wsbV0d18NkatwH5aqfYjLVfaeE1ejB/WeiGTH8=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Cc:To:Date:Message-Id:References:In-Reply-To:From:Subject:Sender:Reply-To
 :MIME-Version:Content-Type:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=x09k+J9CyrnUphCV9944m5PR+SBeUvG7u42JRmoHUw8=; b=ghncMqfd9ytb1iLVBmnxZtoSYs
 KhvBVjquU9ZZST9i54nXWCPpjPj7fEHP2IED9icMEZ3MmYYIKmnMsOBRD4HTQEZCj66SMaUHLZilm
 snNppqwUJB8zS3VQEgJK1kBuHOxaUAE0Sn1i89dvTYDe80IhqFtzGcstcQeuBI/Mxz3M=;
Received: from mail.kernel.org ([198.145.29.99])
 by sfi-mx-3.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1kGTVh-002YPA-2Y
 for linux-f2fs-devel@lists.sourceforge.net; Thu, 10 Sep 2020 20:49:41 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1599770965;
 bh=sh4tYz2XGeutw14hUnEZiKhsUeX5DqUcMULH8ctetks=;
 h=From:In-Reply-To:References:Date:To:Cc:From;
 b=JY7fUognR2ZFz9rVvYpGYJNeWvf1+MwdG+ehsq1b7I1hAJ3E+SrW6btfy+jf+jEqx
 t8kzceY5y+vW0LGsVFhax/rRhwqM1oxDbx7e/uzW1Bdd/T9gYX/W7f02VPuVQK2i3Y
 VwZTEQXL/UFxYs7XdDo+zcyDnMDQCSFKyTuFcbac=
From: pr-tracker-bot@kernel.org
In-Reply-To: <20200910140241.GA487602@google.com>
References: <20200910140241.GA487602@google.com>
X-PR-Tracked-List-Id: <linux-f2fs-devel.lists.sourceforge.net>
X-PR-Tracked-Message-Id: <20200910140241.GA487602@google.com>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/jaegeuk/f2fs.git
 tags/f2fs-for-5.9-rc5
X-PR-Tracked-Commit-Id: 20d0a107fb35f37578b919f62bd474d6d358d579
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 581cb3a26baf846ee9636214afaa5333919875b1
Message-Id: <159977096501.3136.1605508877327581662.pr-tracker-bot@kernel.org>
Date: Thu, 10 Sep 2020 20:49:25 +0000
To: Jaegeuk Kim <jaegeuk@kernel.org>
X-Spam-Score: -0.1 (/)
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
X-Headers-End: 1kGTVh-002YPA-2Y
Subject: Re: [f2fs-dev] [GIT PULL] small bug fixes for 5.9
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

The pull request you sent on Thu, 10 Sep 2020 07:02:41 -0700:

> git://git.kernel.org/pub/scm/linux/kernel/git/jaegeuk/f2fs.git tags/f2fs-for-5.9-rc5

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/581cb3a26baf846ee9636214afaa5333919875b1

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
