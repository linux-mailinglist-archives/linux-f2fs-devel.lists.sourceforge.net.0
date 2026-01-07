Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 853BBCFBD92
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 07 Jan 2026 04:33:53 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:To:In-Reply-To:References:Date:Message-Id:
	MIME-Version:Sender:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+Bil4e0MRk+wlzpYg+wCB3CCy+/zOTz7l+eFvOjaxXw=; b=hR6ip2oOswAFPkaYu/LlGDDYNS
	mnjSZUbTXfVRzQ31SYv8IQvTvHKPqiyO8ossR4UFFnGfSWcoat8fHeJWj89ye+i4VdBqxgJW4vgwP
	XMQY6zneRJOzyZAqCZsQuxqv24YVu3bJej1ChwXPfZkEvJDMPYVGNKAVExCqo6jCH8sw=;
Received: from [127.0.0.1] (helo=sfs-ml-3.v29.lw.sourceforge.com)
	by sfs-ml-3.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1vdKIr-0006pK-UB;
	Wed, 07 Jan 2026 03:33:45 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-3.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <patchwork-bot+f2fs@kernel.org>) id 1vdKIq-0006pE-5x
 for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 07 Jan 2026 03:33:44 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Cc:To:In-Reply-To:References:Date:Message-Id:From:
 Subject:Content-Transfer-Encoding:MIME-Version:Content-Type:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=jZlkUJ0fNgI6DRsRajhqs+PCTxJHIcKs8F9hpv8mhDI=; b=TizZRoJiSQT28jKatAt9vb+d/l
 N4+MmgbgJ63aNby++LtjUrH4RtOSy9Wia4HbhTBOQLcwAk/OIyDdKbQwPdcy27QwqAtiU7kRPol8n
 wP1ycn+HlKgzNP8zU1PBeUyjsX13LTzK5r/0G3EU/VaQq5D6S1f/sipvAnVnifx0IJKU=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ; h=Cc:To:In-Reply-To:References:Date:Message-Id:From:Subject:
 Content-Transfer-Encoding:MIME-Version:Content-Type:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=jZlkUJ0fNgI6DRsRajhqs+PCTxJHIcKs8F9hpv8mhDI=; b=J+X2Iqm2FKxxb9uhFXOU4vMTdH
 ypjZmH++GT4YCas5geQ8NrymbIS0a1KTuMPJ7fXE8ZrxRumeZMfIPgNPGaapNdxN3XOotcvKKBQdT
 Ey451Vi7ElrAMxPMp8QYTvCJmdsCd6+w2JXIF6vlpCncDwiUdeS9TWv/Kpp8SfPfkS0U=;
Received: from tor.source.kernel.org ([172.105.4.254])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1vdKIp-0004Xu-MX for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 07 Jan 2026 03:33:44 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 240FF60141;
 Wed,  7 Jan 2026 03:33:38 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D0298C4CEF7;
 Wed,  7 Jan 2026 03:33:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1767756817;
 bh=d/UjRsAiBGfKR+QybRPg1W0kCdRY/JDBOHEsrfQeOFQ=;
 h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
 b=aFc+5S+tlKvK7pwuVUsy2zuhC9EX2FO2oeQrMmSdmoeelf8xAbtMn1XUyDrBQzzbX
 mqGeVrZ4VL4zSoh7TljVEHtCAeW58djSk5oMsc01uUxp4HU/RJ1yUBtd1HWGPQfOfH
 qsayLjOeQ+8+mjE/WeWrqYsqF/pLaThA68blfHER+BQ3kBDxgDBBDyJGFAZH4/uL75
 8w6wkv5mVfucWgij4DIkm8WbbXe0lUGfJ2ccGTcx0wluB5Dbp2JF4nHfxRMSJsvPw7
 QnDJ7ls9Ncg3XRGhKjvmFeTyYp+A9H62smCWfE04rbadNJ5lQawLiaq5cJ4W5xXlJ3
 okahtIJsboe6A==
Received: from [10.30.226.235] (localhost [IPv6:::1])
 by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id
 785D3380CEF5; Wed,  7 Jan 2026 03:30:16 +0000 (UTC)
MIME-Version: 1.0
Message-Id: <176775661502.2218650.16626451247711229213.git-patchwork-notify@kernel.org>
Date: Wed, 07 Jan 2026 03:30:15 +0000
References: <20251219025104.12256-1-chao@kernel.org>
In-Reply-To: <20251219025104.12256-1-chao@kernel.org>
To: Chao Yu <chao@kernel.org>
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-1.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  Hello: This patch was applied to jaegeuk/f2fs.git (dev) by
 Jaegeuk Kim <jaegeuk@kernel.org>: On Fri, 19 Dec 2025 10:51:04 +0800 you
 wrote: > As Zhiguo reported, nat entry of quota inode could be corrupted:
 > > "ino/block_addr=NULL_ADDR in nid=4 entry" > > We'd better to do sanity
 check on quo [...] 
 Content analysis details:   (-0.2 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1vdKIp-0004Xu-MX
Subject: Re: [f2fs-dev] [PATCH] f2fs: fix to do sanity check on nat entry of
 quota inode
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
From: patchwork-bot+f2fs--- via Linux-f2fs-devel
 <linux-f2fs-devel@lists.sourceforge.net>
Reply-To: patchwork-bot+f2fs@kernel.org
Cc: jaegeuk@kernel.org, zhiguo.niu@unisoc.com, linux-kernel@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

Hello:

This patch was applied to jaegeuk/f2fs.git (dev)
by Jaegeuk Kim <jaegeuk@kernel.org>:

On Fri, 19 Dec 2025 10:51:04 +0800 you wrote:
> As Zhiguo reported, nat entry of quota inode could be corrupted:
> 
> "ino/block_addr=NULL_ADDR in nid=4 entry"
> 
> We'd better to do sanity check on quota inode to detect and record
> nat.blk_addr inconsistency, so that we can have a chance to repair
> it w/ later fsck.
> 
> [...]

Here is the summary with links:
  - [f2fs-dev] f2fs: fix to do sanity check on nat entry of quota inode
    https://git.kernel.org/jaegeuk/f2fs/c/3cb396a2c790

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html




_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
