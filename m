Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id DEA34BAAB19
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 30 Sep 2025 00:30:51 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:To:In-Reply-To:References:Date:Message-Id:
	MIME-Version:Sender:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=S3oTfZbcOAPvjCNhmoKUODlaAee6nP8LP++qlKWTvAY=; b=FXFa1VNq0GzsN/KEo+if7ifbwC
	ZtCI+bfTe/5nApt27siexM16e0W3xW9ETrWaNCPEoRWYvZXqlnyKwDCpfXzTS3BVewK6rOi1g0ALp
	Ni5gLWf4bA7QHNPplCuQRs8biD0eSVAoxsv2QAOErsIimUzvVuieTOhNUf7E/HuPRG0w=;
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1v3MOP-00034k-Tm;
	Mon, 29 Sep 2025 22:30:50 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <patchwork-bot+f2fs@kernel.org>) id 1v3MOM-00033k-8G
 for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 29 Sep 2025 22:30:47 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Cc:To:In-Reply-To:References:Date:Message-Id:From:
 Subject:Content-Transfer-Encoding:MIME-Version:Content-Type:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=IfulDWyivqZXcDY8O1dgd1kwyAiF1WArkFcC5zgsMmk=; b=JpH5PREayHhgAFRNqJS8oQfkJH
 aXZ9xnqv1kia5VlEWC3GeLeXKVRpfGVRlF9skQVTWMMaTUwgSktwNyWJUCCHFv6Io6oB5YRv+dtmB
 3c7crvDmMh3SwdgqwtazX4pd6bjv3OBCAZjWU9VBvCt/jsoPJ5Xq2oKTgyyuxS3fMq6E=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ; h=Cc:To:In-Reply-To:References:Date:Message-Id:From:Subject:
 Content-Transfer-Encoding:MIME-Version:Content-Type:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=IfulDWyivqZXcDY8O1dgd1kwyAiF1WArkFcC5zgsMmk=; b=QImidmt6MTtqzu6kmaUhXzCSwp
 cnNuo7VmQiKg3rGP36Vk+pFvLao1r4uS1SIdVZeXMsTbyv9ED/fJ1n2EFTN3f98od+mtyp2C/S+tm
 A/dxSfWX4XP4JihaGeSGJyPhgyhwk1zpSMxQ18/zZSYzULnBnUFOf3MRGupdW0noNP1I=;
Received: from tor.source.kernel.org ([172.105.4.254])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1v3MOM-0005OH-E7 for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 29 Sep 2025 22:30:46 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id BF17960276
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Mon, 29 Sep 2025 22:30:35 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7324FC113D0;
 Mon, 29 Sep 2025 22:30:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1759185035;
 bh=d9/rikFCFtg6s/2UoH48/W95qCDKZSprAcAWJzLDrIA=;
 h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
 b=CaXvzESqE0+QYJCyPTb1+okKXr0E3Hf43q1Sb7lFeutSQuf+8wykT9FgYH96lihaF
 8etGBcKl9Ww4/9LD5nHdZZXPWexskRYTTCP6B6i494Kcbq+C4PtwmqdyRMwRbrFr+8
 Np4rSeL7VQOC4TnjCspFCLVcwDidcWtTCspebS5iKWSqKvlpIl8dbVd6TXOpa8Q0pt
 EiLUqVS35gZPprdJdPqf1geh5CPdFVmUz/C9eqMEQGi4gH38vKXgdUkX+OLv8EjpgZ
 nizWK0xde/HMmQV+fobf9FRw/8PO+1M2DEEOvtRFFHQWnLzRI5mJ3xLKtAZkLYEOXq
 rAMJ7MpK6L3EA==
Received: from [10.30.226.235] (localhost [IPv6:::1])
 by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id
 33C4439D0C1A; Mon, 29 Sep 2025 22:30:30 +0000 (UTC)
MIME-Version: 1.0
Message-Id: <175918502899.1733438.7787562060460882934.git-patchwork-notify@kernel.org>
Date: Mon, 29 Sep 2025 22:30:28 +0000
References: <20250916024709.4062265-1-chao@kernel.org>
In-Reply-To: <20250916024709.4062265-1-chao@kernel.org>
To: Chao Yu <chao@kernel.org>
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-2.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  Hello: This patch was applied to jaegeuk/f2fs.git (dev) by
 Jaegeuk Kim <jaegeuk@kernel.org>: On Tue, 16 Sep 2025 10:47:09 +0800 you
 wrote: > f2fs_zero_post_eof_page() may cuase more overhead due to
 invalidate_lock
 > and page lookup, change as below to mitigate its overhead: > - check new_size
 [...] Content analysis details:   (-0.2 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1v3MOM-0005OH-E7
Subject: Re: [f2fs-dev] [PATCH v2] f2fs: fix to mitigate overhead of
 f2fs_zero_post_eof_page()
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
Cc: jaegeuk@kernel.org, linux-kernel@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

Hello:

This patch was applied to jaegeuk/f2fs.git (dev)
by Jaegeuk Kim <jaegeuk@kernel.org>:

On Tue, 16 Sep 2025 10:47:09 +0800 you wrote:
> f2fs_zero_post_eof_page() may cuase more overhead due to invalidate_lock
> and page lookup, change as below to mitigate its overhead:
> - check new_size before grabbing invalidate_lock
> - lookup and invalidate pages only in range of [old_size, new_size]
> 
> Fixes: ba8dac350faf ("f2fs: fix to zero post-eof page")
> Signed-off-by: Chao Yu <chao@kernel.org>
> 
> [...]

Here is the summary with links:
  - [f2fs-dev,v2] f2fs: fix to mitigate overhead of f2fs_zero_post_eof_page()
    https://git.kernel.org/jaegeuk/f2fs/c/c2f7c32b2540

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html




_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
