Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 79E29966AEE
	for <lists+linux-f2fs-devel@lfdr.de>; Fri, 30 Aug 2024 22:52:08 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1sk8bG-0000mn-Hz;
	Fri, 30 Aug 2024 20:52:07 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <patchwork-bot+f2fs@kernel.org>) id 1sk8bB-0000lz-Je
 for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 30 Aug 2024 20:52:02 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Cc:To:In-Reply-To:References:Date:Message-Id:From:
 Subject:Content-Transfer-Encoding:MIME-Version:Content-Type:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=VxeQnXo+jBqLwwdZjb+gSXGVOW/VVGrBGe2A4S2gQbY=; b=lGt8kgszE5hm6/fqIxqk+tnu/r
 9Ydx5vkou061choaYlvY9gkhY01aHQASdb+cwmWoicp4xd7Q4dXFZyCmKfIa71BJm/tMuNgPkCDhX
 kqmVRkNu3zJ8UHJS/dbWEhergTl6arj6nY/gDGk+nbwNN7V8GoIVk9Maa0mJXCepiTto=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ; h=Cc:To:In-Reply-To:References:Date:Message-Id:From:Subject:
 Content-Transfer-Encoding:MIME-Version:Content-Type:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=VxeQnXo+jBqLwwdZjb+gSXGVOW/VVGrBGe2A4S2gQbY=; b=DJlhbGQB3/QdRvsteki2dqzmjG
 wcgZb5xSV3ikppWnn2+BKxMxqbVv21898ZtCnmAMiIilsLbbonwWJfphD3D9O44rqnlhaI0IZInK9
 oPo7+Fv7goU2IVFF19kEQ1UIuCiJC57WljnFO2WXHH+QCvRSwCH5k6NaKPNg8uuGf8QE=;
Received: from nyc.source.kernel.org ([147.75.193.91])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1sk8bB-0005nl-LF for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 30 Aug 2024 20:52:02 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id 034A9A41AC6;
 Fri, 30 Aug 2024 20:51:49 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C6F36C4CEC2;
 Fri, 30 Aug 2024 20:51:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1725051115;
 bh=seyHgsgjSd2j/gVtth38oABy1nAbTglTqEUNZWZsVL4=;
 h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
 b=tL9Ib4BxiAq8ybgzttePFesimvwxSl6hh1bs65fyTVOOiPSGnSd8Q7hmVbGX+FRVi
 PzjAIsJFbJwQ3A6QxoU/LeKO0sO/ZxYwG/ObgvpOKg6YA2TB89g+/XQYmB3mGvpNo0
 SlEqw8C2+bbNjpgCfYk+6rZFbB0w3zmiX8Kko40rkrFgIretrgsyHv1RHCllXMuAm+
 sFc9rwVH6QqRbJBs7I3CvEOi89ITiH0XB/kNB94GdJWI6TzQutHP/DnRaetuSxMj+G
 Zq+Lmz/XfJDiFvov1QHi/KJAfeXMYUo5grSzEM9IavrQKQuRBsFI1u+WFX+FpfktYn
 a+t0bvPpxk9dg==
Received: from [10.30.226.235] (localhost [IPv6:::1])
 by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id
 70D2D3809A80; Fri, 30 Aug 2024 20:51:57 +0000 (UTC)
MIME-Version: 1.0
Message-Id: <172505111601.2712133.11182331571148597127.git-patchwork-notify@kernel.org>
Date: Fri, 30 Aug 2024 20:51:56 +0000
References: <20240813073244.9052-1-youngjin.gil@samsung.com>
In-Reply-To: <20240813073244.9052-1-youngjin.gil@samsung.com>
To: Yeongjin Gil <youngjin.gil@samsung.com>
X-Spam-Score: -5.2 (-----)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  Hello: This patch was applied to jaegeuk/f2fs.git (dev) by
 Jaegeuk Kim <jaegeuk@kernel.org>: On Tue, 13 Aug 2024 16:32:44 +0900 you
 wrote: > The i_pino in f2fs_inode_info has the previous parent's i_ino when
 inode > was renamed, which may cause f2fs_ioc_start_atomic_write to fail.
 > If file_w [...] 
 Content analysis details:   (-5.2 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 RCVD_IN_VALIDITY_CERTIFIED_BLOCKED RBL: ADMINISTRATOR NOTICE:
 The query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [147.75.193.91 listed in sa-accredit.habeas.com]
 0.0 RCVD_IN_VALIDITY_RPBL_BLOCKED RBL: ADMINISTRATOR NOTICE: The
 query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [147.75.193.91 listed in bl.score.senderscore.com]
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [147.75.193.91 listed in list.dnswl.org]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.0 T_SCC_BODY_TEXT_LINE   No description available.
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1sk8bB-0005nl-LF
Subject: Re: [f2fs-dev] [PATCH] f2fs: Create COW inode from parent dentry
 for atomic write
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
Cc: daehojeong@google.com, linux-kernel@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net, jaegeuk@kernel.org,
 sj1557.seo@samsung.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

Hello:

This patch was applied to jaegeuk/f2fs.git (dev)
by Jaegeuk Kim <jaegeuk@kernel.org>:

On Tue, 13 Aug 2024 16:32:44 +0900 you wrote:
> The i_pino in f2fs_inode_info has the previous parent's i_ino when inode
> was renamed, which may cause f2fs_ioc_start_atomic_write to fail.
> If file_wrong_pino is true and i_nlink is 1, then to find a valid pino,
> we should refer to the dentry from inode.
> 
> To resolve this issue, let's get parent inode using parent dentry
> directly.
> 
> [...]

Here is the summary with links:
  - [f2fs-dev] f2fs: Create COW inode from parent dentry for atomic write
    https://git.kernel.org/jaegeuk/f2fs/c/8c1b787938fd

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html




_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
