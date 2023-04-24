Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 462EB6ED41C
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 24 Apr 2023 20:10:34 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1pr0dz-0003pf-Hg;
	Mon, 24 Apr 2023 18:10:31 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <patchwork-bot+f2fs@kernel.org>) id 1pr0dv-0003pY-6t
 for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 24 Apr 2023 18:10:27 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Cc:To:In-Reply-To:References:Date:Message-Id:From:
 Subject:Content-Transfer-Encoding:MIME-Version:Content-Type:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=igj9tFQdNIlZoYy+lGHPqPUHVO8NGYOL9v0mkHyZFb8=; b=VeHjaG5lcYZLDVH7pGNttOzmcl
 j0CPkWMfx8MkTfhsdLxjVR+KCj9WfA1c5ASfrPxSg2PreEGG/EnpS0unv/E2xKVJEjTFIEd0FFKyb
 dlmU8YHxvpsvxGRTjqFZ2jxt/nxSicxxg375JtXkC83VSqtajEmivLaGqUF7gaBwbMmU=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ; h=Cc:To:In-Reply-To:References:Date:Message-Id:From:Subject:
 Content-Transfer-Encoding:MIME-Version:Content-Type:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=igj9tFQdNIlZoYy+lGHPqPUHVO8NGYOL9v0mkHyZFb8=; b=MTD+zH+e6NvGnKcNRbbEBWoGRz
 DIJCC+2iy/YJfEIDQsfddeUT7+8XWQXkwxAtaYsr2DlNasHDsph7uRXMYQLO1gXkU+ZdnnccjdFCU
 lPK2ixqBVf2KktzfYR9t6/+T4jG5JCsVBPtYHmCOyO3uxQrTxAC6PGyMJVLpb5biwRO0=;
Received: from dfw.source.kernel.org ([139.178.84.217])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1pr0du-0006QA-0D for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 24 Apr 2023 18:10:27 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id A0611627FB;
 Mon, 24 Apr 2023 18:10:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 9694BC4339C;
 Mon, 24 Apr 2023 18:10:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1682359819;
 bh=K9tNHJzMGBqsZycX/xsTz73dgSOGSW5hOL6e8j1XH9A=;
 h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
 b=gePJThZsgqSjZHL+qhbsoACUtLJUrJVkMxJq8Z1ZIMrhiNxJVFeTyuiPAWYnBq4XG
 ixU3Zcw91ucVX/T4WUTmQO4jKuHFXChTbuxEySoAf3VcFHfe7Wrf8halgzNogf1pUW
 F1QveXsnu5YLomXK2mKPpU757eJPXC5nTXVQ4+YsCTdrvQc36/n0xGXYfFmmM5CUJW
 DwMMZNQMcNmv3Rjqlk+wkHumwQKXuSxuGsEz6saDr1MKxMcBu8QjItJLWuw+0kH9sU
 5SJJ6BjvlXXtNqM8D2K09iUuQUKUzmEQUEGDS3GRgOFWt6DOVAJAKq4QvD167c//Ya
 QQayw6qmtpquA==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org
 (localhost.localdomain [127.0.0.1])
 by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id
 73FA0E4508E; Mon, 24 Apr 2023 18:10:19 +0000 (UTC)
MIME-Version: 1.0
From: patchwork-bot+f2fs@kernel.org
Message-Id: <168235981947.17900.2626518679840712384.git-patchwork-notify@kernel.org>
Date: Mon, 24 Apr 2023 18:10:19 +0000
References: <20230424154348.22885-1-daeho43@gmail.com>
In-Reply-To: <20230424154348.22885-1-daeho43@gmail.com>
To: Daeho Jeong <daeho43@gmail.com>
X-Spam-Score: -5.4 (-----)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  Hello: This patch was applied to jaegeuk/f2fs.git (dev) by
 Jaegeuk Kim <jaegeuk@kernel.org>: On Mon, 24 Apr 2023 08:43:48 -0700 you
 wrote: > From: Daeho Jeong <daehojeong@google.com> > > Need to use cow inode
 data content instead of the one in the original > inode, when we try to write
 the al [...] 
 Content analysis details:   (-5.4 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [139.178.84.217 listed in list.dnswl.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.0 T_SCC_BODY_TEXT_LINE   No description available.
 -0.2 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1pr0du-0006QA-0D
Subject: Re: [f2fs-dev] [PATCH] f2fs: use cow inode data when updating
 atomic write
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

On Mon, 24 Apr 2023 08:43:48 -0700 you wrote:
> From: Daeho Jeong <daehojeong@google.com>
> 
> Need to use cow inode data content instead of the one in the original
> inode, when we try to write the already updated atomic write files.
> 
> Fixes: 3db1de0e582c ("f2fs: change the current atomic write way")
> Signed-off-by: Daeho Jeong <daehojeong@google.com>
> 
> [...]

Here is the summary with links:
  - [f2fs-dev] f2fs: use cow inode data when updating atomic write
    https://git.kernel.org/jaegeuk/f2fs/c/591fc34e1f98

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html




_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
