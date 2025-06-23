Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id A079CAE5554
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 24 Jun 2025 00:10:20 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:
	MIME-Version:Cc:Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive
	:List-Unsubscribe:List-Id:Subject:To:Date:Message-Id:References:In-Reply-To:
	Sender:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=780hoFH1ngKUQFcQlYUmvBG6jLHZr/riyq8AzBzj2cM=; b=MFUfYkzbGMfWeBClRMKVo1e1k1
	czmRFSh4zk2rVGmcqJa+lkjf2OhZFNLtzPLCw1/flNdvwnQiamzYQhFn7c/PsGio+xX21XxH4tu7A
	qbOwezZIOAt9KU+9LFU8fugBdbBNOT5sQLtk8uwZRYtP/cDopq9IwfmrfWm5OvOUthgg=;
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1uTpMc-0004u6-Kd;
	Mon, 23 Jun 2025 22:10:06 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <pr-tracker-bot@kernel.org>) id 1uTpMb-0004tz-4K
 for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 23 Jun 2025 22:10:05 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Cc:To:Date:Message-Id:References:In-Reply-To:From:
 Subject:Sender:Reply-To:MIME-Version:Content-Type:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=H3BdZcal6B8FfykJJ9rcBOm/fWkFP19pRJYXCEsuXss=; b=kGaEiGRqFkkXX0DAuRFzuEoeSE
 9X7+0C1u3jm3mLxf2wfINppyptY2xpSFHKmdIJULI9IYyG2y4oMhFyBox/44NFUp4qVMYqNBDI5/d
 ASkMSW3LTD7Mxh5x2prSHAMvRiTAQzWEqh6cPYMfag/2M5fDu015O/vvdOlnehcswN/E=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Cc:To:Date:Message-Id:References:In-Reply-To:From:Subject:Sender:Reply-To
 :MIME-Version:Content-Type:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=H3BdZcal6B8FfykJJ9rcBOm/fWkFP19pRJYXCEsuXss=; b=TpwrQ7JeX+lKhzbPDy1U+agOLE
 3HNdkmJjSG8L1lhNEMPjiYHZknXoq2d/UzXi9NN76houL1+Lq0+OIHiU/5k11m2F7OfQuPvUp/pQg
 8hnoGaw3eFzJ8djBPK2ZY3VM+BQhcLRhk5h1YT/Ek6ZYpKKvX3zY3FpRo69/7GMBCsC8=;
Received: from tor.source.kernel.org ([172.105.4.254])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1uTpMa-0005E0-Jd for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 23 Jun 2025 22:10:05 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id E5BA761C72;
 Mon, 23 Jun 2025 22:09:53 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 99613C4CEED;
 Mon, 23 Jun 2025 22:09:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1750716593;
 bh=XHJhIO+Sq7wskSiBWJWy7xT3OdEvJ70rAZtPX8g5+PA=;
 h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
 b=PTozAnqgfWMHcbEX8p4aR5vC1fadB8uj3WGhwdfDUFGN0P87Kv/KSiIwQAgyc9D6g
 /6/GKFH7S2LUpTwEWc6E6zDubgz52D7NpUtpBM7MCSQ35S01XscZavOBvS3pFN0arf
 yIw4DSbps2bIAspHnTeGsmonDyRY+mNHrBpaFRYQ3rmT7NK/D0WWjGdL6+pRtk9FY1
 KNqZwitayUACfF0A0UKVsHh54JFi31IjT8JSgjygIRtUiqLOOhr6TiUGU2X/+mu+v1
 N3NivpTYBvikv7pEQEwVrt73imadBZWddEv2VG/91fDM8j4Cnf27HHx0S8HstQKK3C
 MR3MgYt5CXERA==
Received: from [10.30.226.235] (localhost [IPv6:::1])
 by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id
 E794B39FEB7E; Mon, 23 Jun 2025 22:10:21 +0000 (UTC)
In-Reply-To: <aFmZKyrDBDzTzs4Q@google.com>
References: <aFmZKyrDBDzTzs4Q@google.com>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <aFmZKyrDBDzTzs4Q@google.com>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/jaegeuk/f2fs.git
 tags/f2fs-for-6.16-rc4
X-PR-Tracked-Commit-Id: ba8dac350faf16afc129ce6303ca4feaf083ccb1
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: cb0de0e220d2233a84a2ff1afb8ffba7597d02fa
Message-Id: <175071662074.3311076.9481880447185959769.pr-tracker-bot@kernel.org>
Date: Mon, 23 Jun 2025 22:10:20 +0000
To: Jaegeuk Kim <jaegeuk@kernel.org>
X-Spam-Score: -0.3 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-1.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  The pull request you sent on Mon, 23 Jun 2025 18:12:59 +0000:
 > git://git.kernel.org/pub/scm/linux/kernel/git/jaegeuk/f2fs.git
 tags/f2fs-for-6.16-rc4 has been merged into torvalds/linux.git:
 https://git.kernel.org/torvalds/c/cb0de0e220d2233a84a2ff1afb8ffba7597d02fa
 Content analysis details:   (-0.3 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1uTpMa-0005E0-Jd
Subject: Re: [f2fs-dev] [GIT PULL] f2fs fixes for 6.16-rc4
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

The pull request you sent on Mon, 23 Jun 2025 18:12:59 +0000:

> git://git.kernel.org/pub/scm/linux/kernel/git/jaegeuk/f2fs.git tags/f2fs-for-6.16-rc4

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/cb0de0e220d2233a84a2ff1afb8ffba7597d02fa

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
