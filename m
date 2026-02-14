Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id sNnIKli2kGn5cQEAu9opvQ
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	for <lists+linux-f2fs-devel@lfdr.de>; Sat, 14 Feb 2026 18:52:24 +0100
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 635DA13CA66
	for <lists+linux-f2fs-devel@lfdr.de>; Sat, 14 Feb 2026 18:52:24 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:
	MIME-Version:Cc:Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive
	:List-Unsubscribe:List-Id:Subject:To:Date:Message-Id:References:In-Reply-To:
	Sender:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=kgEAM8Jsoob7K0L1+Rpord6+6pXdnxNNyLrLk6cdS8M=; b=m4IhdvY7yT+R5CwlD+XiKZ3ROT
	pLru39S/+Gabp83UXCezTMXS3zQD0R/5Lfk516Vzda7quweN0UoCFf1nCfnaEPt7RROL0VwEaKtcB
	VdoWlJVGIJu/VGNT9Lto1Qt+406Vm9iKyaVNuf58/LHxXWcFCTorW8gQbEeYBzjp3e24=;
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1vrJoX-0001iC-2y;
	Sat, 14 Feb 2026 17:52:17 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <pr-tracker-bot@kernel.org>) id 1vrJoV-0001i4-Bt
 for linux-f2fs-devel@lists.sourceforge.net;
 Sat, 14 Feb 2026 17:52:15 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Cc:To:Date:Message-Id:References:In-Reply-To:From:
 Subject:Sender:Reply-To:MIME-Version:Content-Type:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=pAZeJDoq9jKKYbgmo+NG29Dc3S/DX9d1PfOPg5v3Rcw=; b=AiYNDck5OyWSnVecO7AkpajVOs
 tcYayWPCVyKmzD1dnq1UFyDAA7ytJTxUgjY5/qa0wBetAHja2mvwTu4gWXTKCm/mpHwMXf4E+o8ZR
 OymeAiOkwcYPNtIfVByv8qtjBhij1MuA0bSAovMKuMKao0J2g3VcV3ZFVUwWEC/XmWvY=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Cc:To:Date:Message-Id:References:In-Reply-To:From:Subject:Sender:Reply-To
 :MIME-Version:Content-Type:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=pAZeJDoq9jKKYbgmo+NG29Dc3S/DX9d1PfOPg5v3Rcw=; b=B1PPsyo8t7RGZOKs9QD7fQegmV
 9J84nZIaKaJd7CbVgWAyhNSapUNUz8djmJWSjeWJiax09vn5jT6L8nAr3TVWe65aLHgf8ojxH+xN6
 YH4uBClcFJiHwWaqNJaVegIHWxVGuxN6JKQFvK+kbHAE9huAWCX4NpEmFFs/9R4LWjf0=;
Received: from sea.source.kernel.org ([172.234.252.31])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1vrJoU-0005Mp-Kn for linux-f2fs-devel@lists.sourceforge.net;
 Sat, 14 Feb 2026 17:52:15 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id 1F52E43AB6;
 Sat, 14 Feb 2026 17:52:09 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F0A33C16AAE;
 Sat, 14 Feb 2026 17:52:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1771091529;
 bh=qzaIwz+h83OUx9RLLADQ5QisACBiSoMil1a1Cd9pwRE=;
 h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
 b=Pdun8Z526WbDSHqg1rdGpGwOW51uRhy8EiGTxNcqn6j3Qh7mCaOEv7+3DXt5C3c3V
 nFNq28gCBS06cSvMXgutqPFbQxvgOvxEfn5ILC1+sNysK3y1FC0Fp9J1lYL85cn+tN
 g/JrR7gRvdHObTs3I607jbiokvwG6TLeoWcTmJ9QmcB/xc6W3hQvKXumhH42CqMa26
 ZumCayil2d3+Ja6iXECyxjhLwmeMumxNhcPoM44dpZ6WAI7rNNGYWuW9b57LyzPO67
 +49cKg+wcWN311sv49g+Dso61eAQN14Lf5bEYotj/wS28tnjnozIYjWG9c18FoBw78
 NI78wS4wAefiA==
Received: from [10.30.226.235] (localhost [IPv6:::1])
 by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id
 855EB3930904; Sat, 14 Feb 2026 17:52:03 +0000 (UTC)
In-Reply-To: <aY_h1URe0wsXKl84@google.com>
References: <aY_h1URe0wsXKl84@google.com>
X-PR-Tracked-List-Id: <linux-f2fs-devel.lists.sourceforge.net>
X-PR-Tracked-Message-Id: <aY_h1URe0wsXKl84@google.com>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/jaegeuk/f2fs.git
 tags/f2fs-for-7.0-rc1
X-PR-Tracked-Commit-Id: 52190933c37a96164b271f3f30c16099d9eb8c09
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 3e48a11675c50698374d4ac596fb506736eb1c53
Message-Id: <177109152225.2854784.15105552613870410078.pr-tracker-bot@kernel.org>
Date: Sat, 14 Feb 2026 17:52:02 +0000
To: Jaegeuk Kim via Linux-f2fs-devel <linux-f2fs-devel@lists.sourceforge.net>
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-1.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  The pull request you sent on Sat, 14 Feb 2026 02:45:41 +0000:
 > git://git.kernel.org/pub/scm/linux/kernel/git/jaegeuk/f2fs.git
 tags/f2fs-for-7.0-rc1 has been merged into torvalds/linux.git:
 https://git.kernel.org/torvalds/c/3e48a11675c50698374d4ac596fb506736eb1c53
 Content analysis details:   (-0.2 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1vrJoU-0005Mp-Kn
Subject: Re: [f2fs-dev] [GIT PULL] f2fs update for 7.0-rc1
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
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-8.21 / 15.00];
	WHITELIST_DMARC(-7.00)[sourceforge.net:D:+];
	DMARC_POLICY_ALLOW_WITH_FAILURES(-0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:216.105.38.7:c];
	R_DKIM_ALLOW(-0.20)[lists.sourceforge.net:s=beta];
	MAILLIST(-0.20)[mailman];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_ALL(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FROM_HAS_DN(0.00)[];
	DMARC_POLICY_ALLOW(0.00)[lists.sourceforge.net,none];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_MIXED(0.00)[];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	R_DKIM_REJECT(0.00)[sourceforge.net:s=x,sf.net:s=x,kernel.org:s=k20201202];
	REPLYTO_DOM_NEQ_TO_DOM(0.00)[];
	DKIM_TRACE(0.00)[lists.sourceforge.net:+,sourceforge.net:-,sf.net:-,kernel.org:-];
	TAGGED_RCPT(0.00)[linux-f2fs-devel];
	RCVD_COUNT_FIVE(0.00)[6];
	FROM_NEQ_ENVFROM(0.00)[linux-f2fs-devel@lists.sourceforge.net,linux-f2fs-devel-bounces@lists.sourceforge.net];
	REPLYTO_DOM_NEQ_FROM_DOM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:11320, ipnet:216.105.32.0/21, country:US];
	HAS_REPLYTO(0.00)[pr-tracker-bot@kernel.org];
	RCPT_COUNT_THREE(0.00)[4];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.sourceforge.net:rdns,lists.sourceforge.net:helo,lists.sourceforge.net:dkim]
X-Rspamd-Queue-Id: 635DA13CA66
X-Rspamd-Action: no action

The pull request you sent on Sat, 14 Feb 2026 02:45:41 +0000:

> git://git.kernel.org/pub/scm/linux/kernel/git/jaegeuk/f2fs.git tags/f2fs-for-7.0-rc1

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/3e48a11675c50698374d4ac596fb506736eb1c53

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
