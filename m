Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id EFAE7A203B3
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 28 Jan 2025 06:03:19 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-3.v29.lw.sourceforge.com)
	by sfs-ml-3.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1tcdkn-0004RG-JQ;
	Tue, 28 Jan 2025 05:03:13 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-3.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <pr-tracker-bot@kernel.org>) id 1tcdkm-0004R9-Kd
 for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 28 Jan 2025 05:03:12 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Cc:To:Date:Message-Id:References:In-Reply-To:From:
 Subject:Sender:Reply-To:MIME-Version:Content-Type:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=yR/vl8pga+rBQIO4MfI0v2HEIXfItxAAl1EO3UOBTWg=; b=jNP+qZ1TF6aeSWpKSs/r9/WuxT
 WdW75M/aBO6MFkpEFqEUKOEMVRzjA4pKtAyZ/GehYUPk9iNr5yslgDAVV0k8lPxyMRU2dJtfvNXUa
 X3jOIXlrU0riyL1hzX2G0GfWMXqeKUwmueXj1tyrn3z6O0D11Dt3ZCNpFLA5TQgGaNII=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Cc:To:Date:Message-Id:References:In-Reply-To:From:Subject:Sender:Reply-To
 :MIME-Version:Content-Type:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=yR/vl8pga+rBQIO4MfI0v2HEIXfItxAAl1EO3UOBTWg=; b=FOsUtfvc4jDqsEcsIyyCmFAofq
 tOM2IpwZCGa1aY/IW8QEWEzWAmhlYK04BhUxPSf7QXeF83iacX93YcGyv/oT5AnnsnJVj60JKyR+x
 Yf/JiyCjGCyLNYehiL1R9Ejz4Jg6sRVzYDaBk4ZChy/Ee2aUZIHMoB2SANQwI/jLVhbc=;
Received: from dfw.source.kernel.org ([139.178.84.217])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1tcdkl-0000zj-Ee for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 28 Jan 2025 05:03:11 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id F209E5C5B4C;
 Tue, 28 Jan 2025 05:02:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C2077C4CED3;
 Tue, 28 Jan 2025 05:03:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1738040580;
 bh=H8eI3XBuNttWgjFhlz4MkptWkShukMztxL9eeBAhp1U=;
 h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
 b=KVKWwQfVzWjBK35scHNGtdI8RMcC4WpUEe8hT93K1OZZ7rp4Bvrm6iAt19QAqlGEs
 AyR1L3D3yXEsDjGZw39cK/gR+5LBwfK8cMWVYMDfZLpGgmTDWUBA3rR+PraJ59BgWD
 kfAY60jagMKwwaVdrFsmz2hYPntndhoJQ+HC4H4NEKrpty1HI81N7IXSFY+hyhlgdO
 wcxWUTS527oNcbPU2bPbpnlDnrIkGwx0YikRIvBpk8X3df0CnDAQvnb44CsIbF9m0E
 6OMWVMnYl19VS/rDr9I4cqltGYPg/ZmTULDPT9WjltZJtvZkVohGKZLlIKPejtbUvm
 emeLxUEDYpKTA==
Received: from [10.30.226.235] (localhost [IPv6:::1])
 by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id
 AE762380AA63; Tue, 28 Jan 2025 05:03:27 +0000 (UTC)
In-Reply-To: <Z5hYrgYwNJuaPFF1@google.com>
References: <Z5hYrgYwNJuaPFF1@google.com>
X-PR-Tracked-List-Id: <linux-f2fs-devel.lists.sourceforge.net>
X-PR-Tracked-Message-Id: <Z5hYrgYwNJuaPFF1@google.com>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/jaegeuk/f2fs.git
 tags/f2fs-for-6.14-rc1
X-PR-Tracked-Commit-Id: 03511e936916873bf880e6678c98d5fb59c19742
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 6d61a53dd6f55405ebcaea6ee38d1ab5a8856c2c
Message-Id: <173804060621.3640214.17350292578124658591.pr-tracker-bot@kernel.org>
Date: Tue, 28 Jan 2025 05:03:26 +0000
To: Jaegeuk Kim via Linux-f2fs-devel <linux-f2fs-devel@lists.sourceforge.net>
X-Spam-Score: -6.5 (------)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  The pull request you sent on Tue, 28 Jan 2025 04:10:22 +0000:
 > git://git.kernel.org/pub/scm/linux/kernel/git/jaegeuk/f2fs.git
 tags/f2fs-for-6.14-rc1 has been merged into torvalds/linux.git:
 https://git.kernel.org/torvalds/c/6d61a53dd6f55405ebcaea6ee38d1ab5a8856c2c
 Content analysis details:   (-6.5 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [139.178.84.217 listed in list.dnswl.org]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 RCVD_IN_VALIDITY_SAFE_BLOCKED RBL: ADMINISTRATOR NOTICE: The
 query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [139.178.84.217 listed in sa-accredit.habeas.com]
 0.0 RCVD_IN_VALIDITY_RPBL_BLOCKED RBL: ADMINISTRATOR NOTICE: The
 query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [139.178.84.217 listed in bl.score.senderscore.com]
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.0 T_SCC_BODY_TEXT_LINE   No description available.
 -1.3 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1tcdkl-0000zj-Ee
Subject: Re: [f2fs-dev] [GIT PULL] f2fs update for 6.14-rc1
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

The pull request you sent on Tue, 28 Jan 2025 04:10:22 +0000:

> git://git.kernel.org/pub/scm/linux/kernel/git/jaegeuk/f2fs.git tags/f2fs-for-6.14-rc1

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/6d61a53dd6f55405ebcaea6ee38d1ab5a8856c2c

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
