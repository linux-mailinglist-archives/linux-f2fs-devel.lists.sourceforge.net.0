Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id C32C48A4366
	for <lists+linux-f2fs-devel@lfdr.de>; Sun, 14 Apr 2024 17:33:04 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1rw1qp-0004pY-9H;
	Sun, 14 Apr 2024 15:33:03 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <patchwork-bot+f2fs@kernel.org>) id 1rw1qo-0004pF-8I
 for linux-f2fs-devel@lists.sourceforge.net;
 Sun, 14 Apr 2024 15:33:02 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Cc:To:In-Reply-To:References:Date:Message-Id:From:
 Subject:Content-Transfer-Encoding:MIME-Version:Content-Type:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=ExKzsLTivNtnnrFz8r/yvq3j1Jn6eoaLNBe+1qY0uMo=; b=UK+u48YuFdhLo0th0mW8o9qrIc
 KvTGA7yCgR5UrwQvPtjjaHe9XWJZxlTmfn+1Y7uZCJ9axGVrIA1MCHmPHoKXR9pXF+1OS5btov/Ya
 m3LvqQ9kEJ4TQIGIxcixh8//NazTU2HT1neI4KhcDAZ7NmqaKQMXrgrYkc5uvDyuR/8I=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ; h=Cc:To:In-Reply-To:References:Date:Message-Id:From:Subject:
 Content-Transfer-Encoding:MIME-Version:Content-Type:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=ExKzsLTivNtnnrFz8r/yvq3j1Jn6eoaLNBe+1qY0uMo=; b=YorMl42SwNSiDnBBxMNq8meVAj
 v2Mu5CbQmUsxgeyk9VIcetpScdlVl72vSMlc3C54VqKXmP7aP8YXV7EykNeNVJoRvUK1S3BuTd9EQ
 tUJmM6YB7dn8DItObileKGACYOajRk8PdtNskB8K9+dG4bRWZFQxg3xbNphTilfhN+Vs=;
Received: from dfw.source.kernel.org ([139.178.84.217])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1rw1qn-0003XU-NE for linux-f2fs-devel@lists.sourceforge.net;
 Sun, 14 Apr 2024 15:33:02 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 88ED760B98;
 Sun, 14 Apr 2024 15:32:46 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 85571C4AF4D;
 Sun, 14 Apr 2024 15:32:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1713108765;
 bh=Nq3NlHtxi8rvfgNbkSAh4DaAAJW8IF5KEUOEpD4s3qM=;
 h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
 b=pQfimu3oZuJOYZZZ4vviipCEbG7l8+Dq62nBa+BXxQ5b0RVm1HEBIu/tsiEPs0pSY
 OrrJZmqNMxpNWD0dG+vdzK7vVXv7xq7qmfblr7MxvRWmfPTW4wyxW7dZqMDpPvO3hQ
 gGwXyCYT8EwX3QuODm48po/PJJW6kO2FAqClPO+8JrHVysS6wVClj7HuTGfvvz41V1
 eqaZpf2Bfq1VrzBRCt3oF79gun+rSj7iMKP9jT81VNE3Ilq6JghTi8tRgCetEzhuJ5
 VQXQl05v7TU00Q2cMc776UgtgHUlMxwLTvDBKMDNdI286D4AtvTWQnzSnoL1W+sej6
 B07hckn2BHdfQ==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org
 (localhost.localdomain [127.0.0.1])
 by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id
 7ACCFDF7857; Sun, 14 Apr 2024 15:32:45 +0000 (UTC)
MIME-Version: 1.0
From: patchwork-bot+f2fs@kernel.org
Message-Id: <171310876549.3156.14230955021108259973.git-patchwork-notify@kernel.org>
Date: Sun, 14 Apr 2024 15:32:45 +0000
References: <20240411183753.2417792-1-daeho43@gmail.com>
In-Reply-To: <20240411183753.2417792-1-daeho43@gmail.com>
To: Daeho Jeong <daeho43@gmail.com>
X-Spam-Score: -7.3 (-------)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  Hello: This patch was applied to jaegeuk/f2fs.git (dev) by
 Jaegeuk Kim <jaegeuk@kernel.org>: On Thu, 11 Apr 2024 11:37:53 -0700 you
 wrote: > From: Daeho Jeong <daehojeong@google.com> > > Since the allocation
 happens in conventional LU for zoned storage, we > can allow direct io for
 that. > > [...] 
 Content analysis details:   (-7.3 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [139.178.84.217 listed in list.dnswl.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -2.1 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1rw1qn-0003XU-NE
Subject: Re: [f2fs-dev] [PATCH 2/2] f2fs: allow direct io of pinned files
 for zoned storage
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
Cc: daehojeong@google.com, kernel-team@android.com,
 linux-kernel@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

Hello:

This patch was applied to jaegeuk/f2fs.git (dev)
by Jaegeuk Kim <jaegeuk@kernel.org>:

On Thu, 11 Apr 2024 11:37:53 -0700 you wrote:
> From: Daeho Jeong <daehojeong@google.com>
> 
> Since the allocation happens in conventional LU for zoned storage, we
> can allow direct io for that.
> 
> Signed-off-by: Daeho Jeong <daehojeong@google.com>
> 
> [...]

Here is the summary with links:
  - [f2fs-dev,2/2] f2fs: allow direct io of pinned files for zoned storage
    https://git.kernel.org/jaegeuk/f2fs/c/b2cf5a1ff236

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html




_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
