Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 6948D8A435C
	for <lists+linux-f2fs-devel@lfdr.de>; Sun, 14 Apr 2024 17:33:02 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1rw1qh-0004oO-K6;
	Sun, 14 Apr 2024 15:32:55 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <patchwork-bot+f2fs@kernel.org>) id 1rw1qf-0004oH-Gy
 for linux-f2fs-devel@lists.sourceforge.net;
 Sun, 14 Apr 2024 15:32:53 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Cc:To:In-Reply-To:References:Date:Message-Id:From:
 Subject:Content-Transfer-Encoding:MIME-Version:Content-Type:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=yde9HFoT6WFTxm6FlRqHCub404/hp2XtX+IjEruqxnA=; b=HWRKw3lDD3riGrPtMTB4HcWA9w
 i4NGnSHhU594xELMu9WIUNA+0W8ssKXUTAujT6o4uVPsqcMWBN+yvId/M7wk8mUNneQQqWfrZsmf8
 Qu+dwlp/88EeoachGQQRIi2TOsFH6V799TYgC+zbY3ID5Y17x/LvhtemqOJ1IRYsmSvs=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ; h=Cc:To:In-Reply-To:References:Date:Message-Id:From:Subject:
 Content-Transfer-Encoding:MIME-Version:Content-Type:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=yde9HFoT6WFTxm6FlRqHCub404/hp2XtX+IjEruqxnA=; b=AcgmPUVc1tFOZ9uI9DdBDamKdO
 7K1Z6y+tv/UIrPb6S2Bjddald4wRt+/4l1ZparPe+QjGOsuRXepi1H4Ddry1Ng5exCiyM0Mh1VERE
 Sr5K7Sed0EF0AO1ODXlbycascD5l0Ca2OkWOmzlnM5ZUehKg7+k2CejB1ChDzQrpsnCM=;
Received: from sin.source.kernel.org ([145.40.73.55])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1rw1qe-0003Vn-QV for linux-f2fs-devel@lists.sourceforge.net;
 Sun, 14 Apr 2024 15:32:53 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id 56AEBCE095C
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Sun, 14 Apr 2024 15:32:46 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 46AB1C4AF07;
 Sun, 14 Apr 2024 15:32:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1713108765;
 bh=i8hC/qYdO20bTDFXhf1UZr6iGIZ79ePp+iQi/dhLKic=;
 h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
 b=diGEszRY6aqfAL6yojlRjG5f1kWvpK0fp2xVwVHCr+/6ywC7miiqzHxLFRDn7Gb63
 mE7jCoA03+fFXEd4FSZZBPPpvdUwBE6tt4phpMSCz+mp5XHxPkhSPKFSCk3qAD5d7u
 F8amcKppqmg+AE/LMSqqqN6oVkYHa92AmSYEZ2Tl/I3tutLm4fk9vVQBwbOsLf9UTu
 Q71gsX7ugdXO6vcSvKrnxGnw2JLVmcKykdoMCKhnbCcHt1cXqNejCyGOqQxc1pgDoK
 4HTJxjLbD+jOSwNcwZmiWsAZvAX8u308kklNFd6bvWyEbIDtrucPfAzK9Tyb6sJg7X
 v3lntI2ycZ73g==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org
 (localhost.localdomain [127.0.0.1])
 by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id
 2BA43C54BD2; Sun, 14 Apr 2024 15:32:45 +0000 (UTC)
MIME-Version: 1.0
From: patchwork-bot+f2fs@kernel.org
Message-Id: <171310876517.3156.14366722531397621692.git-patchwork-notify@kernel.org>
Date: Sun, 14 Apr 2024 15:32:45 +0000
References: <20240403142420.2042498-1-chao@kernel.org>
In-Reply-To: <20240403142420.2042498-1-chao@kernel.org>
To: Chao Yu <chao@kernel.org>
X-Spam-Score: -2.3 (--)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: Hello: This series was applied to jaegeuk/f2fs.git (dev) by
 Jaegeuk Kim <jaegeuk@kernel.org>: On Wed, 3 Apr 2024 22:24:19 +0800 you wrote:
 > compress and pinfile flag should be checked after inode lock held to >
 avoid race condition, fix it. > > Fixes: 4c8ff7095bef ("f2fs: support data
 compres [...] 
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
X-Headers-End: 1rw1qe-0003Vn-QV
Subject: Re: [f2fs-dev] [PATCH 1/2] f2fs: fix to relocate check condition in
 f2fs_fallocate()
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
Cc: jaegeuk@kernel.org, linux-kernel@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

Hello:

This series was applied to jaegeuk/f2fs.git (dev)
by Jaegeuk Kim <jaegeuk@kernel.org>:

On Wed,  3 Apr 2024 22:24:19 +0800 you wrote:
> compress and pinfile flag should be checked after inode lock held to
> avoid race condition, fix it.
> 
> Fixes: 4c8ff7095bef ("f2fs: support data compression")
> Fixes: 5fed0be8583f ("f2fs: do not allow partial truncation on pinned file")
> Signed-off-by: Chao Yu <chao@kernel.org>
> 
> [...]

Here is the summary with links:
  - [f2fs-dev,1/2] f2fs: fix to relocate check condition in f2fs_fallocate()
    https://git.kernel.org/jaegeuk/f2fs/c/278a6253a673
  - [f2fs-dev,2/2] f2fs: fix to check pinfile flag in f2fs_move_file_range()
    https://git.kernel.org/jaegeuk/f2fs/c/e07230da0500

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html




_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
