Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 602BB7E10C7
	for <lists+linux-f2fs-devel@lfdr.de>; Sat,  4 Nov 2023 20:39:36 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1qzMUT-0001WM-ON;
	Sat, 04 Nov 2023 19:39:29 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <pr-tracker-bot@kernel.org>) id 1qzMUS-0001WB-45
 for linux-f2fs-devel@lists.sourceforge.net;
 Sat, 04 Nov 2023 19:39:28 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Cc:To:Date:Message-Id:References:In-Reply-To:From:
 Subject:Sender:Reply-To:MIME-Version:Content-Type:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=ovSF76QGOgmW0kwPmtsUJ4CCPXsF0BhS/UvX1ibEyWo=; b=Hp9GZXeXc3Qe5oOyjNn4PIapu4
 k31hBdrPNY57sLtsx5i3ywg94HxXCUFcD0/z35VfL2OtvEApMDJTYNz25lutlC0cMNTbi2RQOUzVf
 wZ84LsDJe+sqX0gXWRncV4Tgjy+JKxzmZ56tHgz7s47h7iNritYkIohakpezloo12hKU=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Cc:To:Date:Message-Id:References:In-Reply-To:From:Subject:Sender:Reply-To
 :MIME-Version:Content-Type:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=ovSF76QGOgmW0kwPmtsUJ4CCPXsF0BhS/UvX1ibEyWo=; b=dMTc00zulfYJZt7sJBibn+qjOn
 G6o463VV+ZLiG8Mq4/xMPAT9fuNdmKqxp3FRH/tUDZK9oWpBm9D615Ln4cMiYS3rUdcvC8jckF89D
 w0hRNS5YZUi8QIKdfz/fHLvLynoydt/gTb1qqDkVGnoQEwjPNJgfwwchbSISolnCYpFg=;
Received: from dfw.source.kernel.org ([139.178.84.217])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1qzMUQ-0005eP-2I for linux-f2fs-devel@lists.sourceforge.net;
 Sat, 04 Nov 2023 19:39:28 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 047CD60BBA;
 Sat,  4 Nov 2023 19:39:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 83D88C433CB;
 Sat,  4 Nov 2023 19:39:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1699126756;
 bh=6npM8jiNedjVjYxnDVV6oGnIIsmn8/OnctvkCFveI8o=;
 h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
 b=Up8wWSIxy8iBogY1IkuQcDkoZ+9JNrMy/+JCjkwAdxklswhfKjiGtWHOgAgcPi6QX
 SFgGfCJy6/5vdZUjAfFpeJgkcz6Qz+1sLPCEZnpBbzrUunoYYui2ABCZ8c8apG79Wp
 703wWK5nacDLfbtaHvjDPEuyio1FCCmVhTqQ1AOAJY41JiHsLqGJsln4pLFAFhpZZi
 0KNEr/xleV4Xr7NVrUg1w4UIpdDHgwJ3tLMgQYDUpcYyutFwaiKUP377ZpTSBfZRxa
 axBa1VboJNWc41BEeMB6qrx84hkDTrcgarL1VNsS7vAFuk+m75SMHORkRUrrerjASs
 x4UuCN1TyBxhg==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org
 (localhost.localdomain [127.0.0.1])
 by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id
 6BE68EAB08A; Sat,  4 Nov 2023 19:39:16 +0000 (UTC)
From: pr-tracker-bot@kernel.org
In-Reply-To: <ZUaVqCoMnLi7bV6P@google.com>
References: <ZUaVqCoMnLi7bV6P@google.com>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <ZUaVqCoMnLi7bV6P@google.com>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/jaegeuk/f2fs.git
 tags/f2fs-for-6.7-rc1
X-PR-Tracked-Commit-Id: 1e7bef5f90ed69d903768d78369f251b77e5d2f5
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: aea6bf908d730b01bd264a8821159db9463c111c
Message-Id: <169912675643.21555.2499024044009023704.pr-tracker-bot@kernel.org>
Date: Sat, 04 Nov 2023 19:39:16 +0000
To: Jaegeuk Kim <jaegeuk@kernel.org>
X-Spam-Score: -5.8 (-----)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  The pull request you sent on Sat, 4 Nov 2023 12:04:08 -0700:
 > git://git.kernel.org/pub/scm/linux/kernel/git/jaegeuk/f2fs.git
 tags/f2fs-for-6.7-rc1 has been merged into torvalds/linux.git:
 https://git.kernel.org/torvalds/c/aea6bf908d730b01bd264a8821159db9463c111c
 Content analysis details:   (-5.8 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [139.178.84.217 listed in list.dnswl.org]
 -0.0 T_SCC_BODY_TEXT_LINE   No description available.
 -0.6 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1qzMUQ-0005eP-2I
Subject: Re: [f2fs-dev] [GIT PULL] f2fs update for 6.7
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

The pull request you sent on Sat, 4 Nov 2023 12:04:08 -0700:

> git://git.kernel.org/pub/scm/linux/kernel/git/jaegeuk/f2fs.git tags/f2fs-for-6.7-rc1

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/aea6bf908d730b01bd264a8821159db9463c111c

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
