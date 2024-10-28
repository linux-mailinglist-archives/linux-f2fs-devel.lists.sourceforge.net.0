Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id CDAC79B37E2
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 28 Oct 2024 18:40:55 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1t5TjZ-0006a2-0e;
	Mon, 28 Oct 2024 17:40:53 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <patchwork-bot+f2fs@kernel.org>) id 1t5TjX-0006Zn-NM
 for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 28 Oct 2024 17:40:51 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Cc:To:In-Reply-To:References:Date:Message-Id:From:
 Subject:Content-Transfer-Encoding:MIME-Version:Content-Type:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=DtceajjdqrB9GpooweyjprIhbYebjP+TV/Wb8LsnbCA=; b=aytbrPTXYl8/Qn7/IEDmdkZ9z2
 dPxVG1SzpQsI93d9QjwWPUfFZzGq2uIei/FHrk22l0gZCVMdADzaFVCl49yBE6EjmnBBsdJyX0njS
 tVS9HQ1tPmOBqaH10/5w5kdurF3F0hp9X+wu47qY41EI0M2QSAxLEwAD/ciLeDClyG1E=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ; h=Cc:To:In-Reply-To:References:Date:Message-Id:From:Subject:
 Content-Transfer-Encoding:MIME-Version:Content-Type:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=DtceajjdqrB9GpooweyjprIhbYebjP+TV/Wb8LsnbCA=; b=QIGmPfF/osn3vPAydew8E9P0pI
 8c4AB/aSvwRbn+viWl1DDcEnV3oE1Lf5ByYkwaQDQGxobXZRpXB580HUHwXxbz4cO6u2hs+oL+V1X
 zbO9THyiFwVnUJCrRn6/ecZfwZHYC8db3vXVwjQ/qk3xnIIJ1cYEOPRfegxURhNwJhZE=;
Received: from nyc.source.kernel.org ([147.75.193.91])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1t5TjX-0005I2-4b for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 28 Oct 2024 17:40:51 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id 6DB8AA42A3F;
 Mon, 28 Oct 2024 17:38:49 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C73A0C4CEC7;
 Mon, 28 Oct 2024 17:40:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1730137244;
 bh=oAVSG+yB+cyj+s/3SUnyZYVkU1Bj4kmt6Y62HezNCAU=;
 h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
 b=tXtXkxVpMOitrzx6nsiKVDmRlFsSzBrJvWquk3T/YquntvpfvnyzZ8A5AqcFi2UUT
 0Z8dqwpX6tSuOZxxKWa+dZ5ZT1mktkzjIIfejG9hlmTiOOBEfxv4tZtNfLGKRsMFkw
 PEjDrQxrvsIiqJkAXik/VeJxWARVZ9ckR5CTCwV8pKAidesMpVI6jTAKKc+eNYGFQK
 Ez9w8bqwrPk7Oi0LhskCD9vrhFJPZdHwXo6diaCvcql/sgNt2vV0SrflXzEZRG4ayN
 aHzVYna2MNFKdhNv4RInL0knnmfWltnqjRb3kQW6fjaZAx5R9cNrvb6q22ZtJ6E5Ho
 ke8Bfy02HRexA==
Received: from [10.30.226.235] (localhost [IPv6:::1])
 by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id
 70CC2380AC1C; Mon, 28 Oct 2024 17:40:53 +0000 (UTC)
MIME-Version: 1.0
Message-Id: <173013725198.126843.18427648602595118258.git-patchwork-notify@kernel.org>
Date: Mon, 28 Oct 2024 17:40:51 +0000
References: <20241021023147.1774412-1-weilongping@oppo.com>
In-Reply-To: <20241021023147.1774412-1-weilongping@oppo.com>
To: LongPing Wei <weilongping@oppo.com>
X-Spam-Score: -0.6 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  Hello: This patch was applied to jaegeuk/f2fs.git (dev) by
 Jaegeuk Kim <jaegeuk@kernel.org>: On Mon, 21 Oct 2024 10:31:47 +0800 you
 wrote: > This f2fs_bug_on was introduced by commit 2c1905042c8c ("f2fs: check
 > segment type in __f2fs_replace_block") when there were only 6 curseg types.
 > Aft [...] 
 Content analysis details:   (-0.6 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.4 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1t5TjX-0005I2-4b
Subject: Re: [f2fs-dev] [PATCH v2] f2fs: fix the wrong f2fs_bug_on condition
 in f2fs_do_replace_block
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
Cc: jaegeuk@kernel.org, linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

Hello:

This patch was applied to jaegeuk/f2fs.git (dev)
by Jaegeuk Kim <jaegeuk@kernel.org>:

On Mon, 21 Oct 2024 10:31:47 +0800 you wrote:
> This f2fs_bug_on was introduced by commit 2c1905042c8c ("f2fs: check
> segment type in __f2fs_replace_block") when there were only 6 curseg types.
> After commit d0b9e42ab615 ("f2fs: introduce inmem curseg") was introduced,
> the condition should be changed to checking curseg->seg_type.
> 
> Fixes: d0b9e42ab615 ("f2fs: introduce inmem curseg")
> Signed-off-by: LongPing Wei <weilongping@oppo.com>
> 
> [...]

Here is the summary with links:
  - [f2fs-dev,v2] f2fs: fix the wrong f2fs_bug_on condition in f2fs_do_replace_block
    https://git.kernel.org/jaegeuk/f2fs/c/522e5de97dc1

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html




_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
