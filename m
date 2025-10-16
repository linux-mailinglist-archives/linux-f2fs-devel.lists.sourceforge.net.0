Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 37051BE4FCD
	for <lists+linux-f2fs-devel@lfdr.de>; Thu, 16 Oct 2025 20:07:00 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:
	MIME-Version:Cc:Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive
	:List-Unsubscribe:List-Id:Subject:To:Date:Message-Id:References:In-Reply-To:
	Sender:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+1/NTTtor5UbdfmC/PZMm0GtzKyfMyJCN8Bp2QKgh1A=; b=mZZogfnso9+jSxBgU+fTNzlxVn
	uzMtQUZgpxCDEWWnXZEmvLV7Xh5MrHj0eJe/+ryb8zDMh9QvakWoX1kqko/DR2xqsZ1vI56CX0oLN
	X2uPuSQPWkh3Fd+Qpfm6re7QMq4YPJvDfCO6fri8jo12DSbxwFi7JdSH832Kf5Xajq9Q=;
Received: from [127.0.0.1] (helo=sfs-ml-3.v29.lw.sourceforge.com)
	by sfs-ml-3.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1v9SNK-0008Qm-SU;
	Thu, 16 Oct 2025 18:06:54 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-3.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <pr-tracker-bot@kernel.org>) id 1v9SNJ-0008Qe-Hk
 for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 16 Oct 2025 18:06:53 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Cc:To:Date:Message-Id:References:In-Reply-To:From:
 Subject:Sender:Reply-To:MIME-Version:Content-Type:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=8P4gbUCim2q+dKGv7qwvNT1I2WZN2TnRpSnbiQ84Ung=; b=SMi5s/6XOrEJRz7VAh2C2dPKiO
 emqZv2ykMi5upQrKCCk8FmlciRD/zoGjKC+X4AC15glQXi/SN/Wo+nc8MXoGreI+tXxURKKIiloyA
 6LonX8+MSf0d3VtMd+Mi3VfFCut0uLWtU2Iecmw4BBm5qUyaml6nZouiSHaLJsFwuLSk=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Cc:To:Date:Message-Id:References:In-Reply-To:From:Subject:Sender:Reply-To
 :MIME-Version:Content-Type:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=8P4gbUCim2q+dKGv7qwvNT1I2WZN2TnRpSnbiQ84Ung=; b=fp04ESMtBKn39+WtM0Id3D44VE
 jcvzCiu7LANj1K4NfWf9z7d02qJE2EXnPiXa/ggb+lQrtzZ4iYeeIJRZ00IxUEzO7O+ygtGdwzZI0
 w44SsAus2Q8UwvG8SBxLcx6vocZ+5BJWF+MehO/X+CxUhVx6eqwrBbfUODzMZJObEzbQ=;
Received: from sea.source.kernel.org ([172.234.252.31])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1v9SNJ-0000dr-1M for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 16 Oct 2025 18:06:53 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id A37BE4A326;
 Thu, 16 Oct 2025 18:06:47 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 84B4DC4CEFB;
 Thu, 16 Oct 2025 18:06:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1760638007;
 bh=NmIJPFoVfA+biPTVKZIu2PbbMkoT83obfU/u/bHal+w=;
 h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
 b=Umb3rAWRZbdlIgFdW983R8t5kireFSG3dgEUAxSObNshXzb1ETiRSZUbXfZSsHZOY
 lTCYmkcTm1lqgRvbBxw1WKgZwkF2j1ySziLP2w180M5UaGnCF7A0sNueg3Euuy5WNG
 dMSwLeydVxSTCwObSZC88dy4sGwE3nUHV0OwNRiTr/2OiL8wk8evjeT4oQbunv10aW
 TocVWYX1mEYA8gpzEuCFo8eDbfrfOEU57RsT/gkcl1tM70xP+XGjvNZFWywcJMNWce
 6YIIQLDKl0sOGoCGCOozbf89W9+rGvdGQzkhOZJTAt21uzJk2CyCrDsopNEYbBp0+/
 geGicbzmrH4iQ==
Received: from [10.30.226.235] (localhost [IPv6:::1])
 by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id
 EB035383C261; Thu, 16 Oct 2025 18:06:32 +0000 (UTC)
In-Reply-To: <aPEt2-u8J16L9Xnk@google.com>
References: <aPEt2-u8J16L9Xnk@google.com>
X-PR-Tracked-List-Id: <linux-f2fs-devel.lists.sourceforge.net>
X-PR-Tracked-Message-Id: <aPEt2-u8J16L9Xnk@google.com>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/jaegeuk/f2fs.git
 tags/f2fs-fix-6.18-rc2
X-PR-Tracked-Commit-Id: 9d5c4f5c7a2c7677e1b3942772122b032c265aae
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 98ac9cc4b4452ed7e714eddc8c90ac4ae5da1a09
Message-Id: <176063799160.1846882.1529334845631175747.pr-tracker-bot@kernel.org>
Date: Thu, 16 Oct 2025 18:06:31 +0000
To: Jaegeuk Kim via Linux-f2fs-devel <linux-f2fs-devel@lists.sourceforge.net>
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-2.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  The pull request you sent on Thu, 16 Oct 2025 17:39:39 +0000:
 > git://git.kernel.org/pub/scm/linux/kernel/git/jaegeuk/f2fs.git
 tags/f2fs-fix-6.18-rc2 has been merged into torvalds/linux.git:
 https://git.kernel.org/torvalds/c/98ac9cc4b4452ed7e714eddc8c90ac4ae5da1a09
 Content analysis details:   (-0.2 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 RCVD_IN_DNSWL_BLOCKED  RBL: ADMINISTRATOR NOTICE: The query to DNSWL
 was blocked.  See
 http://wiki.apache.org/spamassassin/DnsBlocklists#DnsBlocklists-dnsbl-block
 for more information. [172.234.252.31 listed in list.dnswl.org]
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1v9SNJ-0000dr-1M
Subject: Re: [f2fs-dev] [GIT PULL] f2fs fix for 6.18-rc2
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

The pull request you sent on Thu, 16 Oct 2025 17:39:39 +0000:

> git://git.kernel.org/pub/scm/linux/kernel/git/jaegeuk/f2fs.git tags/f2fs-fix-6.18-rc2

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/98ac9cc4b4452ed7e714eddc8c90ac4ae5da1a09

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
