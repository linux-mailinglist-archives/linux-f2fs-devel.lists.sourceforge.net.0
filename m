Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id CEAA66AEB22
	for <lists+linux-f2fs-devel@lfdr.de>; Tue,  7 Mar 2023 18:40:42 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1pZbIl-00033D-Iy;
	Tue, 07 Mar 2023 17:40:40 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <patchwork-bot+f2fs@kernel.org>) id 1pZbIi-000331-Uc
 for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 07 Mar 2023 17:40:38 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Cc:To:In-Reply-To:References:Date:Message-Id:From:
 Subject:Content-Transfer-Encoding:MIME-Version:Content-Type:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=4denxN2IvwfPs6ASWis2rzcx3wLh2NEEAYmfBHsDSTE=; b=FuZnKFiljYOC5LmVnEG/yCIOrz
 fQOOjFMTRF8sQHXQ1vuW3ERpi3BlpZVhjxZJO4rW4en/znNghCpJIzOZBrGZCZJhN3MBpBn91/gSt
 z9pNqms4vBGuOUWL61n1cpSjwlBc9CJZhZw2U9wv5CNrSzBzZO7SgMfiOmJKMWaFpKIY=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ; h=Cc:To:In-Reply-To:References:Date:Message-Id:From:Subject:
 Content-Transfer-Encoding:MIME-Version:Content-Type:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=4denxN2IvwfPs6ASWis2rzcx3wLh2NEEAYmfBHsDSTE=; b=Hv9H31E0IMp69nSzYdnct7uUKX
 sZ6XaonQDoDoSGC+yu7KsSf2Y6FO11ezMHPnZLZOVYAwana06DNSltbn7XVrVHClRDivSJzOZBJVB
 RsG7fkqaI0XA6dUNqRvdnVulpTeZNy4xLaZSmHzeEpa8O6yy4w5NoG6foNI3PAkCnm4w=;
Received: from dfw.source.kernel.org ([139.178.84.217])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1pZbIb-0001Kk-KM for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 07 Mar 2023 17:40:35 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 06EA56151B;
 Tue,  7 Mar 2023 17:40:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id CCA6BC433A7;
 Tue,  7 Mar 2023 17:40:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1678210824;
 bh=/xkqGNJ4VHBP+p2CoqdnBE4IC+f3MlVqqhOfFRd6CUk=;
 h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
 b=D2jOWm0luzts5v/YERrgmPCYhKyXyhHGuq68V0XQ080ZyCCCnUCuAejRQ515bpVOu
 2VeTqhK3DlaByXJKeCHqG6W5Z86bFLJIXmRCddm/H4NM6dh96VVLz/gqek0mLXrYVz
 hC0tJFwac+b4cHL7Iq8tWI00mMCOX58N+hRnP7/CSHylPdT/WRDerBMgBuvmaEirYp
 9TqHrJCWrSykWUg7ZgzVRppzqFnKAKa746Ft8LqWtu/uLNroCM6cA6Ua1TnsgqeIvQ
 463qa0hOT4bUCLr08mc8J66peFmru1jGUjgoTg3p2OPcFjWhyFkK99+1HySnddZ0V+
 JTSjcGngPSuNQ==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org
 (localhost.localdomain [127.0.0.1])
 by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id
 BAA16E61B63; Tue,  7 Mar 2023 17:40:24 +0000 (UTC)
MIME-Version: 1.0
From: patchwork-bot+f2fs@kernel.org
Message-Id: <167821082476.1693.14172428859403665467.git-patchwork-notify@kernel.org>
Date: Tue, 07 Mar 2023 17:40:24 +0000
References: <20230223012513.1781735-1-lizetao1@huawei.com>
In-Reply-To: <20230223012513.1781735-1-lizetao1@huawei.com>
To: Li Zetao <lizetao1@huawei.com>
X-Spam-Score: -5.9 (-----)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  Hello: This patch was applied to jaegeuk/f2fs.git (dev) by
 Jaegeuk Kim <jaegeuk@kernel.org>: On Thu, 23 Feb 2023 01:25:13 +0000 you
 wrote: > After commit 26b5a079197c ("f2fs: cleanup dirty pages if recover
 failed"), > f2fs_sync_inode_meta() is only used in checkpoint.c,
 so > f2fs_sync_inode_m [...] 
 Content analysis details:   (-5.9 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [139.178.84.217 listed in list.dnswl.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid -0.7 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1pZbIb-0001Kk-KM
Subject: Re: [f2fs-dev] [PATCH -next] f2fs: make f2fs_sync_inode_meta()
 static
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

This patch was applied to jaegeuk/f2fs.git (dev)
by Jaegeuk Kim <jaegeuk@kernel.org>:

On Thu, 23 Feb 2023 01:25:13 +0000 you wrote:
> After commit 26b5a079197c ("f2fs: cleanup dirty pages if recover failed"),
> f2fs_sync_inode_meta() is only used in checkpoint.c, so
> f2fs_sync_inode_meta() should only be visible inside. Delete the
> declaration in the header file and change f2fs_sync_inode_meta()
> to static.
> 
> Signed-off-by: Li Zetao <lizetao1@huawei.com>
> 
> [...]

Here is the summary with links:
  - [f2fs-dev,-next] f2fs: make f2fs_sync_inode_meta() static
    https://git.kernel.org/jaegeuk/f2fs/c/e6bd5463fce0

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html




_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
