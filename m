Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id DE94D9D69C0
	for <lists+linux-f2fs-devel@lfdr.de>; Sat, 23 Nov 2024 16:50:53 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1tEsPC-0002dq-RO;
	Sat, 23 Nov 2024 15:50:42 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <patchwork-bot+f2fs@kernel.org>) id 1tEsP8-0002dh-Uu
 for linux-f2fs-devel@lists.sourceforge.net;
 Sat, 23 Nov 2024 15:50:38 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Cc:To:In-Reply-To:References:Date:Message-Id:From:
 Subject:Content-Transfer-Encoding:MIME-Version:Content-Type:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=DfZHbvaszgPdumfdTfGQChwPMsrE+vrkIxYqBszVN9E=; b=iKJKtHBWysLTTE2kEdrc5PTn8T
 RKp6BqSBvaMeUXNvJRTvW1irvMzTv246pp0i8PyUJVtptuDs9xkNXLKl0KQsa6gYbK80MHuL6VTW8
 c9JowNvAt93uEjV6CiEwNXmPMQE2eGuPA+XbjSCEJFwDdJ6q5MB7GDyUunci2o6Pnugc=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ; h=Cc:To:In-Reply-To:References:Date:Message-Id:From:Subject:
 Content-Transfer-Encoding:MIME-Version:Content-Type:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=DfZHbvaszgPdumfdTfGQChwPMsrE+vrkIxYqBszVN9E=; b=lSUe2KCCSAyh1BtCDUjmbBgaFF
 zrVXjouPPlAediYjQW4gcvgQI7sok5aHVMaTFjx5zmkIJMYuoYneAyzMqjKxkbwOQqPzz7mv29a0s
 LLKquLDyWD+ZjreDT4uiFe4PszJ0S/MgP0I8rng8RseVZhpQ+a7pGfb2BQG1wIXlUXvc=;
Received: from nyc.source.kernel.org ([147.75.193.91])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1tEsP8-0004MA-7m for linux-f2fs-devel@lists.sourceforge.net;
 Sat, 23 Nov 2024 15:50:38 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id 653FAA403D5;
 Sat, 23 Nov 2024 15:48:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 409A3C4CECF;
 Sat, 23 Nov 2024 15:50:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1732377027;
 bh=dtotHtOLZEq4lFv92Zs9oG8yEKOiZLjVNbIt8QDq6S4=;
 h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
 b=XFn77zh3+fKJRnqfBMpa8VOwmAIdyJTcc55zi6Ym8eVzq7ssSHin6oYHya/4+Vg38
 pv/YlZ4JcUDMAI2VWSX+hEyMSjw7s1NjEiCriTcuwmbS/SRw/VRJ+iXGQwFdcQQg/B
 OFSHikjPoNxGkIFNEBduB0AnnAXjJ08KF1isbncjYqtCCZV2sP3mvE9sxrG6Wc6PFe
 PHJncKY7URC0aZUv4RRch0OWnDa5/d5ZySz4Na1vsfIVzFbTkd8Fssp59P0PvGSQKV
 CkEQhzfiuK8boka32L2Gy9jC//o+HEPIuOvc9Ak5Uohp/RUWUBnzqqAE4N6EOlrHRn
 ePJBBe6/cXkYw==
Received: from [10.30.226.235] (localhost [IPv6:::1])
 by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id
 ADBA13809A06; Sat, 23 Nov 2024 15:50:40 +0000 (UTC)
MIME-Version: 1.0
Message-Id: <173237703949.3018181.7264272337903464166.git-patchwork-notify@kernel.org>
Date: Sat, 23 Nov 2024 15:50:39 +0000
References: <20241122065005.3772987-1-chao@kernel.org>
In-Reply-To: <20241122065005.3772987-1-chao@kernel.org>
To: Chao Yu <chao@kernel.org>
X-Spam-Score: -2.6 (--)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: Hello: This series was applied to jaegeuk/f2fs.git (dev) by
 Jaegeuk Kim <jaegeuk@kernel.org>: On Fri, 22 Nov 2024 14:50:04 +0800 you
 wrote: > We use rwlock to protect core structure data of extent tree during
 > its shrink, however, if there is a huge number of extent nodes in > extent
 tree, du [...] 
 Content analysis details:   (-2.6 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 RCVD_IN_VALIDITY_RPBL_BLOCKED RBL: ADMINISTRATOR NOTICE: The
 query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [147.75.193.91 listed in bl.score.senderscore.com]
 0.0 RCVD_IN_VALIDITY_SAFE_BLOCKED RBL: ADMINISTRATOR NOTICE: The
 query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [147.75.193.91 listed in sa-trusted.bondedsender.org]
 -2.3 RCVD_IN_DNSWL_MED      RBL: Sender listed at https://www.dnswl.org/,
 medium trust [147.75.193.91 listed in list.dnswl.org]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1tEsP8-0004MA-7m
Subject: Re: [f2fs-dev] [PATCH v2 1/2] f2fs: fix to shrink read extent node
 in batches
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
Cc: xiuhong.wang@unisoc.com, jaegeuk@kernel.org, zhiguo.niu@unisoc.com,
 linux-kernel@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

Hello:

This series was applied to jaegeuk/f2fs.git (dev)
by Jaegeuk Kim <jaegeuk@kernel.org>:

On Fri, 22 Nov 2024 14:50:04 +0800 you wrote:
> We use rwlock to protect core structure data of extent tree during
> its shrink, however, if there is a huge number of extent nodes in
> extent tree, during shrink of extent tree, it may hold rwlock for
> a very long time, which may trigger kernel hang issue.
> 
> This patch fixes to shrink read extent node in batches, so that,
> critical region of the rwlock can be shrunk to avoid its extreme
> long time hold.
> 
> [...]

Here is the summary with links:
  - [f2fs-dev,v2,1/2] f2fs: fix to shrink read extent node in batches
    https://git.kernel.org/jaegeuk/f2fs/c/3fc5d5a182f6
  - [f2fs-dev,v2,2/2] f2fs: add a sysfs node to limit max read extent count per-inode
    https://git.kernel.org/jaegeuk/f2fs/c/009a8241a8e5

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html




_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
