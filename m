Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B7EF731F9F
	for <lists+linux-f2fs-devel@lfdr.de>; Thu, 15 Jun 2023 20:00:45 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1q9rH1-0005Cb-LL;
	Thu, 15 Jun 2023 18:00:44 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <patchwork-bot+f2fs@kernel.org>) id 1q9rGq-0005CT-LC
 for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 15 Jun 2023 18:00:33 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Cc:To:In-Reply-To:References:Date:Message-Id:From:
 Subject:Content-Transfer-Encoding:MIME-Version:Content-Type:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=u3/3FCHnxSGzppySyQFQtfuUvYcmo3XpwA87+5z7jSM=; b=YEObDx8xEgu/0DzIPqasA92fIZ
 9t5AXDgcL3d353jn/fCz0Eu9Dw77YwGkR/X0rjUi2x3s5IPo7AEFF9gIoHmotIcNFCx2mxg7Qh3aU
 GNdQeJQTDz7W8OiJBbj6eCZrotqT9dPdbXBLLprFkJRlaLBTJqUZY8ZrByKPUOUPPAsA=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ; h=Cc:To:In-Reply-To:References:Date:Message-Id:From:Subject:
 Content-Transfer-Encoding:MIME-Version:Content-Type:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=u3/3FCHnxSGzppySyQFQtfuUvYcmo3XpwA87+5z7jSM=; b=MjgabMfjbTLauafhv5jdIwN1mp
 MwQcTOHKuCiyWUWk1t6rzCKPJII7g27FrGfOAwpFimzlPrtK+JgDsDW267PyRkEcVBYEeiUMsC0FB
 EHoIgpQzhPfxDOTLrJ4/+HfITirm52h2NW7njWsq0F6Aukfot5GfH+wEluocm2R5g8oE=;
Received: from dfw.source.kernel.org ([139.178.84.217])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1q9rGo-00063P-LM for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 15 Jun 2023 18:00:31 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 3EF68623DB
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Thu, 15 Jun 2023 18:00:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 29C06C433CB;
 Thu, 15 Jun 2023 18:00:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1686852023;
 bh=Imb3WG7QI8cil1kPmzmNUNmJVrOdNvIhZQQyApYC8nw=;
 h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
 b=XJPmGYRrUIzmrBfArHQF8Ry4unq7pMbbzC03vCvsSD/ZQSoFQTv7rme0Fj8eNEvo0
 yoj8Vrm1GHG0cdlnVnahueux46kBFlj+gBZUL9mTGeCHywFbnsSfsCcayOhb6MjZgX
 czLOu7hxuOgZQATOMUH7s7c1PfAFXf+vfXlXM/ycDjLS+YQH3IpgVPr3Ku/Lzg7Gwr
 0K349CUhNh9ApEE+yieYrsytVck60j4Tyhp6rzQu/MpmTDqkOI76qS0H94eHalbFDj
 Pz9zYYKZNYqLnGT4iVRxdY8xp+9qL7n/oFOdd4U2uCIolzKMHs2NOJCbU+kmXHjYly
 PHWRawnPYcj5w==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org
 (localhost.localdomain [127.0.0.1])
 by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id
 03F78C395E0; Thu, 15 Jun 2023 18:00:23 +0000 (UTC)
MIME-Version: 1.0
From: patchwork-bot+f2fs@kernel.org
Message-Id: <168685202301.7502.14081948087591121398.git-patchwork-notify@kernel.org>
Date: Thu, 15 Jun 2023 18:00:23 +0000
References: <20230613233940.3643362-1-jaegeuk@kernel.org>
In-Reply-To: <20230613233940.3643362-1-jaegeuk@kernel.org>
To: Jaegeuk Kim <jaegeuk@kernel.org>
X-Spam-Score: -5.9 (-----)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  Hello: This patch was applied to jaegeuk/f2fs.git (dev) by
 Jaegeuk Kim <jaegeuk@kernel.org>: On Tue, 13 Jun 2023 16:39:40 -0700 you
 wrote: > This reverts commit 27161f13e3c3 "f2fs: avoid race in between read
 xattr & write xattr". > > That introduced a deadlock case: > > Thread #1:
 > > [122554 [...] 
 Content analysis details:   (-5.9 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [139.178.84.217 listed in list.dnswl.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid -0.7 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1q9rGo-00063P-LM
Subject: Re: [f2fs-dev] [PATCH] f2fs: remove i_xattr_sem to avoid deadlock
 and fix the original issue
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
Cc: linux-kernel@vger.kernel.org, stable@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

Hello:

This patch was applied to jaegeuk/f2fs.git (dev)
by Jaegeuk Kim <jaegeuk@kernel.org>:

On Tue, 13 Jun 2023 16:39:40 -0700 you wrote:
> This reverts commit 27161f13e3c3 "f2fs: avoid race in between read xattr & write xattr".
> 
> That introduced a deadlock case:
> 
> Thread #1:
> 
> [122554.641906][   T92]  f2fs_getxattr+0xd4/0x5fc
>     -> waiting for f2fs_down_read(&F2FS_I(inode)->i_xattr_sem);
> 
> [...]

Here is the summary with links:
  - [f2fs-dev] f2fs: remove i_xattr_sem to avoid deadlock and fix the original issue
    https://git.kernel.org/jaegeuk/f2fs/c/c1ac6e02b5fc

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html




_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
