Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E5738A4364
	for <lists+linux-f2fs-devel@lfdr.de>; Sun, 14 Apr 2024 17:33:04 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-3.v29.lw.sourceforge.com)
	by sfs-ml-3.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1rw1qo-0005re-HE;
	Sun, 14 Apr 2024 15:33:02 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-3.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <patchwork-bot+f2fs@kernel.org>) id 1rw1qm-0005qw-3m
 for linux-f2fs-devel@lists.sourceforge.net;
 Sun, 14 Apr 2024 15:33:00 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Cc:To:In-Reply-To:References:Date:Message-Id:From:
 Subject:Content-Transfer-Encoding:MIME-Version:Content-Type:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=srLPix37mAy/WG+stCfh0jISusTj3X1jQ3SA04XsN20=; b=iU3sY6nHa9avsIesQbx2B/kRqB
 IovI6GBjB6PsJOf0JRvF1kehViA/EGX8fjjiQ34WqpEBoHqhp1lAd4C36OuM1GHIsbslkj2GFBPTC
 frO01QzG+EzAWTiRaRPOZonFM9sphj2boVousICExZZxXR2uVp3BVfoT3NDZDs7FkjAs=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ; h=Cc:To:In-Reply-To:References:Date:Message-Id:From:Subject:
 Content-Transfer-Encoding:MIME-Version:Content-Type:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=srLPix37mAy/WG+stCfh0jISusTj3X1jQ3SA04XsN20=; b=Vo7yiVu6IKL0uq2IFdYQqWyH7Z
 Oena6ESSUFdDxY5ZLijolcFrVUdqhOeLEL0BxyyPJISd+Bs1fDg3HKePYeP3Z1Ubsv8UKaY/C/5fj
 5LdNM0+mvqnTzcGxParWrougyTgpe6oPwm/de2Wvbp1OD0oa8XZdlCnheSVpTMrtfMV0=;
Received: from sin.source.kernel.org ([145.40.73.55])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1rw1qk-0003Wi-W7 for linux-f2fs-devel@lists.sourceforge.net;
 Sun, 14 Apr 2024 15:33:00 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id E1EF9CE0979;
 Sun, 14 Apr 2024 15:32:46 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 776BDC4AF1A;
 Sun, 14 Apr 2024 15:32:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1713108765;
 bh=aCUWzSW3nnOCWJY6Wih6C6rNM9RCw6Fje6P5C4uUrFU=;
 h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
 b=iKhHZbrH4yK4TpodU1SaUctxEHf4l2i9OPpl24g2y42r+srMG32IQb7O15I5WwA5O
 stfQvJK7KCywmrOcCPogx1ETwr+wuyAJJClGyyiidm/oip4xwXO1VKGCKbvrZUS7gb
 XhK1h0/Xw5Z098phPN6yoTFsUYoHq9ORfit6yziXZ0j7a16ECyaNYxI0YbJZzD39+m
 30OLMmoftHwUN2Y3Vs8FGbZ8TwZh5paVwpXobfut3a3QWUbbHi5d5209OKoe2Bvl9i
 4nCnV9j+IzXpRlx0aFXHpfem0YjJ7FI2rwQCXFPdFj3wDIGx/pU7cfBQF9fwAFOMes
 7Atl7NguR11Zw==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org
 (localhost.localdomain [127.0.0.1])
 by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id
 68FD9C43140; Sun, 14 Apr 2024 15:32:45 +0000 (UTC)
MIME-Version: 1.0
From: patchwork-bot+f2fs@kernel.org
Message-Id: <171310876541.3156.7562582983890566171.git-patchwork-notify@kernel.org>
Date: Sun, 14 Apr 2024 15:32:45 +0000
References: <20240322145955.2959257-1-chao@kernel.org>
In-Reply-To: <20240322145955.2959257-1-chao@kernel.org>
To: Chao Yu <chao@kernel.org>
X-Spam-Score: -2.3 (--)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  Hello: This patch was applied to jaegeuk/f2fs.git (dev) by
 Jaegeuk Kim <jaegeuk@kernel.org>: On Fri, 22 Mar 2024 22:59:55 +0800 you
 wrote: > As Roman Smirnov reported as below: > > " > There is a possible bug
 in f2fs_truncate_inode_blocks(): > > if (err < 0 && err != -ENOENT) > goto
 fail; > . [...] 
 Content analysis details:   (-2.3 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 RCVD_IN_DNSWL_BLOCKED  RBL: ADMINISTRATOR NOTICE: The query to
 DNSWL was blocked.  See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [145.40.73.55 listed in list.dnswl.org]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -2.1 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1rw1qk-0003Wi-W7
Subject: Re: [f2fs-dev] [PATCH] f2fs: fix to detect inconsistent nat entry
 during truncation
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
Cc: jaegeuk@kernel.org, linux-f2fs-devel@lists.sourceforge.net,
 linux-kernel@vger.kernel.org, r.smirnov@omp.ru
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

Hello:

This patch was applied to jaegeuk/f2fs.git (dev)
by Jaegeuk Kim <jaegeuk@kernel.org>:

On Fri, 22 Mar 2024 22:59:55 +0800 you wrote:
> As Roman Smirnov reported as below:
> 
> "
> There is a possible bug in f2fs_truncate_inode_blocks():
> 
>     if (err < 0 && err != -ENOENT)
>     			goto fail;
>         ...
>         offset[1] = 0;
>         offset[0]++;
>         nofs += err;
> 
> [...]

Here is the summary with links:
  - [f2fs-dev] f2fs: fix to detect inconsistent nat entry during truncation
    https://git.kernel.org/jaegeuk/f2fs/c/92c556ed6318

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html




_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
