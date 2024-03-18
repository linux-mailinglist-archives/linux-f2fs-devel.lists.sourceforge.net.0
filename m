Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A60E87F059
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 18 Mar 2024 20:21:45 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1rmIYC-0007yN-Ml;
	Mon, 18 Mar 2024 19:21:37 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <pr-tracker-bot@kernel.org>) id 1rmIYA-0007yD-LD
 for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 18 Mar 2024 19:21:34 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Cc:To:Date:Message-Id:References:In-Reply-To:From:
 Subject:Sender:Reply-To:MIME-Version:Content-Type:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=E8xY9rekMIL0a4yCuCxcKRLFoJgwX8QrsHmZZZSMP/g=; b=DAmcavIRf+UNO4JKrBYQhT97oJ
 8Cw/qUOlg9umnqDopNyfYsHiXxhRrJ0da560jjZQIIsYhHZzNbhZ/tnoKv0pXplZU9n01+u4repwH
 5ICJoBGwGvdYNEp0Xe8x38KWdizCKMrq7QG+d+BqqjdUkn5gG/IRZnbeplQtsFAzwhVA=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Cc:To:Date:Message-Id:References:In-Reply-To:From:Subject:Sender:Reply-To
 :MIME-Version:Content-Type:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=E8xY9rekMIL0a4yCuCxcKRLFoJgwX8QrsHmZZZSMP/g=; b=eU1R2SgU8QOYskFsGm5F5XIfjs
 CpdH1zmF3OnOfwke3vc875DhWgJE8wrRmCBDZqGXeREzOwuzydXkUmJ0DyhEfoj4TdWDCsijs/hOD
 2y/J7wFOxIy7r8gon/oyE65l7zIzhh2MdNgzBiGHI7tfI4rYURIBjfKmHT3wbYPkVmN4=;
Received: from sin.source.kernel.org ([145.40.73.55])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1rmIY0-0003oy-61 for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 18 Mar 2024 19:21:34 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id 4A21DCE0B31;
 Mon, 18 Mar 2024 19:21:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 89199C433C7;
 Mon, 18 Mar 2024 19:21:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1710789678;
 bh=jjtbHMlq2RBk4POjZ3Q4hQPW2sWuY9zYox2ybK6TpHc=;
 h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
 b=KIp1g4XNa4FGTYTZ9hqNOIgm09JuhMZytSPjWV+f4lG+WyCj078M83b3szs3zkzC1
 434PVqd87eXhFaTv4JcmYN43NSvt2JJyj22vU7lzHTN+entRUOI9CHGEkfQ818fDiT
 DcttANSiGGmBGNw/usKSIbej/yTqDBcauqvxSqji5EbQWzhEgMiL815mBkCMmpEHCT
 WFGot4TzgDDwx/88vw/Qlre8rjBcQQLqLNwhGtaGGt0U/cO0rKVFjFBZA6UwyK3nv3
 95ZChntokLl8kcJSAd3k7SbQ8Y4WJEf3YSFuxQXFbKsb6L6MakfsBTO9q0rEQdBiId
 HfilIplAqzJzQ==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org
 (localhost.localdomain [127.0.0.1])
 by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id
 7A2FE17B6474; Mon, 18 Mar 2024 19:21:18 +0000 (UTC)
From: pr-tracker-bot@kernel.org
In-Reply-To: <ZfiBt0gRe_Elp7hE@google.com>
References: <ZfiBt0gRe_Elp7hE@google.com>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <ZfiBt0gRe_Elp7hE@google.com>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/jaegeuk/f2fs.git
 tags/f2fs-for-6.9-rc1
X-PR-Tracked-Commit-Id: eb70d5a6c932d9d23f4bb3e7b83782c21ac4b064
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: c5d9ab85ebf3a42d5127ffdedf9094325465e852
Message-Id: <171078967849.17817.6127983227768532199.pr-tracker-bot@kernel.org>
Date: Mon, 18 Mar 2024 19:21:18 +0000
To: Jaegeuk Kim <jaegeuk@kernel.org>
X-Spam-Score: -2.9 (--)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  The pull request you sent on Mon, 18 Mar 2024 11:02:31 -0700:
 > git://git.kernel.org/pub/scm/linux/kernel/git/jaegeuk/f2fs.git
 tags/f2fs-for-6.9-rc1 has been merged into torvalds/linux.git:
 https://git.kernel.org/torvalds/c/c5d9ab85ebf3a42d5127ffdedf9094325465e852
 Content analysis details:   (-2.9 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -2.3 RCVD_IN_DNSWL_MED      RBL: Sender listed at https://www.dnswl.org/,
 medium trust [145.40.73.55 listed in list.dnswl.org]
 -0.0 T_SCC_BODY_TEXT_LINE   No description available.
 -0.4 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1rmIY0-0003oy-61
Subject: Re: [f2fs-dev] [GIT PULL] f2fs update for 6.9-rc1
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

The pull request you sent on Mon, 18 Mar 2024 11:02:31 -0700:

> git://git.kernel.org/pub/scm/linux/kernel/git/jaegeuk/f2fs.git tags/f2fs-for-6.9-rc1

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/c5d9ab85ebf3a42d5127ffdedf9094325465e852

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
