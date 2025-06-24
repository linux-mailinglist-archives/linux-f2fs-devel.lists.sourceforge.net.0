Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id D8BCAAE58B6
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 24 Jun 2025 02:40:57 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:To:In-Reply-To:References:Date:Message-Id:
	MIME-Version:Sender:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=eIyXaqvYIHcaDoVGc9qLIEDP8Ca2hq1UqsOYKTc2fOM=; b=PNpjt/1ZkHPC+dJkNYSc+5QlfR
	bBw5rdVJdtERZORoHf3hota6HpHY+v3jP54HvOr+fi3KOqTEKEjcBlvn56bnXmFeB09ed4xQ0ni97
	AvVwbGQ6thMbqlwgnuRuoAnIXLj+96bqoC/Ml2H95RdDJDx8pbjjSxkk3k0JAvF65dOU=;
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1uTria-0002OR-Mz;
	Tue, 24 Jun 2025 00:40:56 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <patchwork-bot+f2fs@kernel.org>) id 1uTriQ-0002Nh-A0
 for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 24 Jun 2025 00:40:46 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Cc:To:In-Reply-To:References:Date:Message-Id:From:
 Subject:Content-Transfer-Encoding:MIME-Version:Content-Type:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=dIVREXd/6UfVJS7iN8rGUW36M8IvDm0yhP7k4tXKAHs=; b=O3CvN2x9FVgs6t9OipnWROCWOt
 g8YgKys8Bs78QceqhP1Dl4auVKP+d8XS8yMkS2QGzOUIYyjNbZpnF02cTBlV7O0UzEe2rH2W43mEk
 tB0YZTLBnU0QsTvs7PU5jtKJcSkbjzH/ALWseOC+mfE9D+vwsFFUchOXMnCobYG5r9hM=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ; h=Cc:To:In-Reply-To:References:Date:Message-Id:From:Subject:
 Content-Transfer-Encoding:MIME-Version:Content-Type:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=dIVREXd/6UfVJS7iN8rGUW36M8IvDm0yhP7k4tXKAHs=; b=DARSEzZbKUXyBijMtiVunNFhxL
 KU744GScOM/BIRpgOduwI3nnBVnz2LmmqFCUxlyGbkixKL+q2sIEvmj2mBXj1LKsi0coicXKWKY5I
 6ZlvUMiRjze5yebQsEB68jLJnMBK8fmXF3sgO9ISO6bb1qibTBdlUpAmRhxpASK2O8J4=;
Received: from tor.source.kernel.org ([172.105.4.254])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1uTriP-0006zF-PK for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 24 Jun 2025 00:40:46 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id F158A627CA;
 Tue, 24 Jun 2025 00:40:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A6A8BC4CEEF;
 Tue, 24 Jun 2025 00:40:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1750725634;
 bh=1QaGdT1B3rkESvxrLYFCDis8gtHomEyLyKP9dJD4WTc=;
 h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
 b=SiqjhOvfP/t9KHGcnRs/HkQukfOxDwgi3xvScwaH9kDQQEtXY/cVAlLwSZr0irtUJ
 9F2JoSZMSoxNCvNq6jTq2piUP+JZJRdk8Wp5glKrQNah054f9mHBt8J75aj4MyMKF7
 Ibx5+JOn/Hn60uzg8o+rVVLCpoJfflYEBJ4aTLuKhcU2FfU/i5FkoJZV013wSjiDFO
 rOCMZk2a+Gnhyn2O7bBjXAQl7D+b42uLpr8+LvTZG9MWiBXDwkFlf2DcZv7g/xxIKW
 iehPqJCW420ZPvcDTkOieqoUZDm3+ymbTgKNeA8S8qOcpcDYQS/xOZA8IAFZEBdFrd
 O7//jb24whb6w==
Received: from [10.30.226.235] (localhost [IPv6:::1])
 by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id
 EAF4A39FEB7D; Tue, 24 Jun 2025 00:41:02 +0000 (UTC)
MIME-Version: 1.0
Message-Id: <175072566148.3346761.3757288798816544278.git-patchwork-notify@kernel.org>
Date: Tue, 24 Jun 2025 00:41:01 +0000
References: <1749779445-29125-1-git-send-email-zhiguo.niu@unisoc.com>
In-Reply-To: <1749779445-29125-1-git-send-email-zhiguo.niu@unisoc.com>
To: Zhiguo Niu <zhiguo.niu@unisoc.com>
X-Spam-Score: -0.3 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-1.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: Hello: This series was applied to jaegeuk/f2fs.git (dev) by
 Jaegeuk Kim <jaegeuk@kernel.org>: On Fri, 13 Jun 2025 09:50:44 +0800 you
 wrote: > No logic changes, just cleanup and prepare for fixing the UAF issue
 > in f2fs_free_dic. > > Signed-off-by: Zhiguo Niu <zhiguo.niu@unisoc.com>
 > Signed-o [...] 
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
X-Headers-End: 1uTriP-0006zF-PK
Subject: Re: [f2fs-dev] [PATCH 1/2] f2fs: compress: change the first
 parameter of page_array_{alloc, free} to sbi
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
Cc: ke.wang@unisoc.com, linux-kernel@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net, baocong.liu@unisoc.com,
 jaegeuk@kernel.org, Hao_hao.Wang@unisoc.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

Hello:

This series was applied to jaegeuk/f2fs.git (dev)
by Jaegeuk Kim <jaegeuk@kernel.org>:

On Fri, 13 Jun 2025 09:50:44 +0800 you wrote:
> No logic changes, just cleanup and prepare for fixing the UAF issue
> in f2fs_free_dic.
> 
> Signed-off-by: Zhiguo Niu <zhiguo.niu@unisoc.com>
> Signed-off-by: Baocong Liu <baocong.liu@unisoc.com>
> ---
>  fs/f2fs/compress.c | 40 ++++++++++++++++++++--------------------
>  1 file changed, 20 insertions(+), 20 deletions(-)

Here is the summary with links:
  - [f2fs-dev,1/2] f2fs: compress: change the first parameter of page_array_{alloc, free} to sbi
    https://git.kernel.org/jaegeuk/f2fs/c/8e2a9b656474
  - [f2fs-dev,2/2] f2fs: compress: fix UAF of f2fs_inode_info in f2fs_free_dic
    https://git.kernel.org/jaegeuk/f2fs/c/39868685c2a9

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html




_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
