Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id B5EBCCAEE49
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 09 Dec 2025 05:34:24 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:
	MIME-Version:Cc:Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive
	:List-Unsubscribe:List-Id:Subject:To:Date:Message-Id:References:In-Reply-To:
	Sender:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=vVYdonablfSmaF8qV+iL9cCcy8tkGWuuj7edNcsCfK4=; b=ijhGTxTIBI/RdRCUeLL55wgy5P
	R5PazxsqP4YFctSFFzIsd+Jm7yoIFlGJG2ty1PfOT7aXYzQL0hGZM2XmPYEZvpUR/99pshLuU+E1K
	2TFe/CLclsiRaOMR+jcOAIGVeco66Rt0jbatXEhUUWsbtuopxVgaBG5IUqEko3CvmYnk=;
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1vSpQM-0007Y9-T8;
	Tue, 09 Dec 2025 04:34:06 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <pr-tracker-bot@kernel.org>) id 1vSpQL-0007Y2-0m
 for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 09 Dec 2025 04:34:05 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Cc:To:Date:Message-Id:References:In-Reply-To:From:
 Subject:Sender:Reply-To:MIME-Version:Content-Type:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=T/1NlRgv6RFM6QBd2JFqN9DXqPblN8NlBqFL8Tiomis=; b=mus6G1jGRzSlwv9BcNm88TpVvg
 97Ii+d6biOgiCrVpt11BouRp7ARaKRh283JggE1iwjIZwp3HpQOkmxO5vKiSEuWdjgPtY7FoyUOoW
 +gY4WXvsbvkwHDsTmBESeNTJ55M8Gn/5tGHHO0xPtYip44/ENuBEtffWcC9VEq+KAaYI=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Cc:To:Date:Message-Id:References:In-Reply-To:From:Subject:Sender:Reply-To
 :MIME-Version:Content-Type:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=T/1NlRgv6RFM6QBd2JFqN9DXqPblN8NlBqFL8Tiomis=; b=hxFchuxXl/6eahrdtUEXtPVYxl
 kHAtFoFcGHiTLswPDzupn0lYciWhSHNX4FrLcFkj0geRqnJV3tC+vz98nHcOKHki4QNiiB9VT9DyW
 S7XAZF6cFAF3P8ijE50FLGZagLSQga0r3Hb10b5O7djJHveyvKthuhurf8TYEM1Q7PwA=;
Received: from tor.source.kernel.org ([172.105.4.254])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1vSpQK-000407-D8 for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 09 Dec 2025 04:34:04 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id A058B60176;
 Tue,  9 Dec 2025 04:33:53 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 55BCDC4CEF5;
 Tue,  9 Dec 2025 04:33:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1765254833;
 bh=n+s2buWIS7gFE7By8TVkfks887L/f/7jJNYN4G9Urfk=;
 h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
 b=EEaIF9gAWRPC9kxmWasDodpYgLVuHI2dtgLXgjv70GO2dj9x0d+SD9JRsvf50oYam
 w4cs+Bh7duwmfP55wxrqc/Yp4iQzGM2s4T+HkSvc8zSBdbupQSfpzh+x9zBtuH40oB
 Zanelzuq2Oedh8Ym852A3a80CG2Rh68x2ZLCGG8YXIB/I8yJHJ16gVxOptYDS/Sbvw
 7VKux51smKgNr/8ppuXUO6k0ujcDrb190IR3cMnvFn0io23hEiaaAHlNTWzEE4gCwV
 lC8AIrZfbUyMKnNZeaQGYT76HCXApOAmhV8B4XTZwXjfILWn5jEvEGeCekbk+g0+Os
 3ri8paeiaYX9Q==
Received: from [10.30.226.235] (localhost [IPv6:::1])
 by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id
 F316C3808200; Tue,  9 Dec 2025 04:30:49 +0000 (UTC)
In-Reply-To: <aTc4QJ9A-0qKfBzM@google.com>
References: <aTc4QJ9A-0qKfBzM@google.com>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <aTc4QJ9A-0qKfBzM@google.com>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/jaegeuk/f2fs.git
 tags/f2fs-for-6.19-rc1
X-PR-Tracked-Commit-Id: 76ee7fd6af6851ef78016139bd727057ba467c4e
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: cb015814f8b6eebcbb8e46e111d108892c5e6821
Message-Id: <176525464858.3790430.2535725715911739725.pr-tracker-bot@kernel.org>
Date: Tue, 09 Dec 2025 04:30:48 +0000
To: Jaegeuk Kim <jaegeuk@kernel.org>
X-Spam-Score: 0.8 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-1.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  The pull request you sent on Mon, 8 Dec 2025 20:42:40 +0000:
 > git://git.kernel.org/pub/scm/linux/kernel/git/jaegeuk/f2fs.git
 tags/f2fs-for-6.19-rc1 has been merged into torvalds/linux.git:
 https://git.kernel.org/torvalds/c/cb015814f8b6eebcbb8e46e111d108892c5e6821
 Content analysis details:   (0.8 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 1.0 RCVD_IN_UCE2           RBL: IP Subnet Listed in UCEPROTECT Level 2
 [172.105.4.254 listed in dnsbl-2.uceprotect.net]
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1vSpQK-000407-D8
Subject: Re: [f2fs-dev] [GIT PULL] f2fs for 6.19-rc1
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

The pull request you sent on Mon, 8 Dec 2025 20:42:40 +0000:

> git://git.kernel.org/pub/scm/linux/kernel/git/jaegeuk/f2fs.git tags/f2fs-for-6.19-rc1

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/cb015814f8b6eebcbb8e46e111d108892c5e6821

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
