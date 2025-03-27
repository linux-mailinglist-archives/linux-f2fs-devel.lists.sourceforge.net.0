Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 4ECF8A73F75
	for <lists+linux-f2fs-devel@lfdr.de>; Thu, 27 Mar 2025 21:47:52 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1txu8d-0007jN-K4;
	Thu, 27 Mar 2025 20:47:44 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <pr-tracker-bot@kernel.org>) id 1txu8c-0007jE-2e
 for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 27 Mar 2025 20:47:42 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Cc:To:Date:Message-Id:References:In-Reply-To:From:
 Subject:Sender:Reply-To:MIME-Version:Content-Type:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=bt7ZX8kocrQ1OPVZPLAPwtfdurbWIisdWoCO0dz0FR8=; b=iQFcfvAql6woBbTWBEVw1qm8px
 1eHV5s2b3Rn+DZ4zw1pLv/3wLiVOjic9ihr5UmhTx/55cb417OoBd3F9wvlf1VxPGkySzewNTowTq
 HGNWbTsv0zWXFnJTO8seOwst/UjG6wOIpQvAJ4BhpSuzxa40ClUHt3Rh/41/U1y9nMIU=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Cc:To:Date:Message-Id:References:In-Reply-To:From:Subject:Sender:Reply-To
 :MIME-Version:Content-Type:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=bt7ZX8kocrQ1OPVZPLAPwtfdurbWIisdWoCO0dz0FR8=; b=A3CiB6QA5LQPiOM5/nF/VJqltu
 C7Oc9lB5NvKq9U+GSHq+nXVNQTVjfxNwi5DkPbL8OUQ+DkVb6QI/FQ3AEulcliHUrp7pG2TVcbExI
 23yxhhiIGVxBFNJIBq8fZYe/O4pSfM+Y+H/sGNHgZ7DxyQadMVh6u2xvtfzt57THy4a0=;
Received: from tor.source.kernel.org ([172.105.4.254])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1txu8W-00079K-Ua for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 27 Mar 2025 20:47:42 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 1565761129;
 Thu, 27 Mar 2025 20:47:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DD14AC4CEDD;
 Thu, 27 Mar 2025 20:47:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1743108445;
 bh=1vJHvbLf7GnYjrNgYCdvuKjiT2OzP1MC3jAoQv4Sv4s=;
 h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
 b=bLrGhjt0vRm0tGfPosWYQ2Sr5aSLSw2cUr2vtEz5kNlyEBQgssv1ZqvxmZ2MxiDM7
 /QXsI06o2DrymlQGyrbqhibsZOxrhN9awFAV//BID1d82uAJ8WtPt4Cijn1UC4bUXl
 qrQmms6UTri9w/ubzbjHD2imrsqEUXWp3l1FUBTLqA26tWDRx/D1tmAZ+zHVpGQvA9
 yjIYVX29Kwl3NyPDrtpCPjYH6PethUliI7eVYyGj6oIDmrjqlacGP3TpO8x76EerF0
 5NBdS/C4GGNugvxpbmQtryXYVc2arTCJbpVjZ2urGQgtdGQi4dmyltE7OLoICa3e1g
 NwOQ+ZnmEbZjw==
Received: from [10.30.226.235] (localhost [IPv6:::1])
 by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id
 71192380AAFD; Thu, 27 Mar 2025 20:48:03 +0000 (UTC)
In-Reply-To: <Z-GPopTYCOl0hjp3@google.com>
References: <Z-GPopTYCOl0hjp3@google.com>
X-PR-Tracked-List-Id: <linux-f2fs-devel.lists.sourceforge.net>
X-PR-Tracked-Message-Id: <Z-GPopTYCOl0hjp3@google.com>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/jaegeuk/f2fs.git
 tags/f2fs-for-6.15-rc1
X-PR-Tracked-Commit-Id: 21263d035ff21fa0ccf79adba20bab9cd8cca0f2
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 81d8e5e2132215d21f2cddffcd2b16d08c0389fa
Message-Id: <174310848190.2212788.8676129059384367865.pr-tracker-bot@kernel.org>
Date: Thu, 27 Mar 2025 20:48:01 +0000
To: Jaegeuk Kim via Linux-f2fs-devel <linux-f2fs-devel@lists.sourceforge.net>
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  The pull request you sent on Mon, 24 Mar 2025 17:00:18 +0000:
 > git://git.kernel.org/pub/scm/linux/kernel/git/jaegeuk/f2fs.git
 tags/f2fs-for-6.15-rc1 has been merged into torvalds/linux.git:
 https://git.kernel.org/torvalds/c/81d8e5e2132215d21f2cddffcd2b16d08c0389fa
 Content analysis details:   (-0.2 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.0 RCVD_IN_VALIDITY_RPBL_BLOCKED RBL: ADMINISTRATOR NOTICE: The
 query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [172.105.4.254 listed in bl.score.senderscore.com]
 0.0 RCVD_IN_VALIDITY_SAFE_BLOCKED RBL: ADMINISTRATOR NOTICE: The
 query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [172.105.4.254 listed in sa-trusted.bondedsender.org]
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1txu8W-00079K-Ua
Subject: Re: [f2fs-dev] [GIT PULL] f2fs update for 6.15-rc1
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
From: pr-tracker-bot--- via Linux-f2fs-devel
 <linux-f2fs-devel@lists.sourceforge.net>
Reply-To: pr-tracker-bot@kernel.org
Cc: Linus Torvalds <torvalds@linux-foundation.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Linux F2FS Dev Mailing List <linux-f2fs-devel@lists.sourceforge.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

The pull request you sent on Mon, 24 Mar 2025 17:00:18 +0000:

> git://git.kernel.org/pub/scm/linux/kernel/git/jaegeuk/f2fs.git tags/f2fs-for-6.15-rc1

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/81d8e5e2132215d21f2cddffcd2b16d08c0389fa

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
