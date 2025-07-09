Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 20B54AFF08D
	for <lists+linux-f2fs-devel@lfdr.de>; Wed,  9 Jul 2025 20:10:13 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:To:In-Reply-To:References:Date:Message-Id:
	MIME-Version:Sender:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=lED2vfvY+S6W193iDtXi+Fc8/YJhLqLsW2Ma+9fm+v8=; b=FTw/xTXaz/OVSj+Eed3g0qcMdi
	LlFwgCbAbV4kl54Gaq6e52gXlc7uEjNKq4Yin6/6DVD8tyhGfzFB/PXH4QMdMgvDR1wJfr0pA1X2J
	mAeH4xFa37Tbg3h6ZIePXYyQ6dx8dTZMK6hb2YQvO3LJKq50Y+fFwLNxuRvWUiFrNCT0=;
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1uZZFD-0004C9-Uf;
	Wed, 09 Jul 2025 18:10:11 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <patchwork-bot+f2fs@kernel.org>) id 1uZZFC-0004Bz-Hg
 for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 09 Jul 2025 18:10:10 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Cc:To:In-Reply-To:References:Date:Message-Id:From:
 Subject:Content-Transfer-Encoding:MIME-Version:Content-Type:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=ZJUn0mlx3yudp/ZBhf3Ak7yCi1VQSO/xCEwmiXULySg=; b=cnZ2gW8JD1N47U2nj455YEfz8d
 nm8ETZZPn7Z6S+0ikJL6WyRD2fJUjT7GvviAhfSiCCsv9JAFo13chLD60ye9/kBM29iO5ZHiEs0vh
 XUnNL4bgEDmAZ8uT9llr8yJhoBFnGtZwnnYk3Egn/S/OIAU99HBYVXGK+1ROOF0GuuYM=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ; h=Cc:To:In-Reply-To:References:Date:Message-Id:From:Subject:
 Content-Transfer-Encoding:MIME-Version:Content-Type:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=ZJUn0mlx3yudp/ZBhf3Ak7yCi1VQSO/xCEwmiXULySg=; b=bjmLc7UgvX0E2CnHNzbZ8tFEXR
 33UP/4rADDwwiAS/EHMf1GM9PXcACCZqHz5xASvVYSc6xGG2UeLnOrfnVlX9J98Bzxko6nzuv1JtD
 MDtuUuolZ1OAN9dCz/EHJaDQExat6VG3AW1DHCwXr66UO16j9u3UjpCqg9uAd1J/toe0=;
Received: from sea.source.kernel.org ([172.234.252.31])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1uZZFC-000154-38 for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 09 Jul 2025 18:10:10 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id CB61446CF7
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Wed,  9 Jul 2025 18:09:59 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AF5D0C4CEF4;
 Wed,  9 Jul 2025 18:09:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1752084599;
 bh=TToFJF7a6cjpVJcvV/eyMdLrXl8Is6qU2qXyp4GSavQ=;
 h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
 b=P74L/i5PzRxQlIUkWsTC3QCH+cN05KSbq2rbXhsCF+vrrJIy3ZNP5K7aPcQV9vPyM
 S9kQ+k/lOLrkpwPbd76+XKzuknLVdcqV9+avFj58gOdMmKTzk7CukrOq5a4pxz87df
 iRAzw6PTjvESV7+7veYM6xvEBtbN1vNjCUcqg2WwfUyG2OnSJ34Iudlfo4hEYoBaQW
 HwS7Glm9DKJU3jcdnhCw0mlu/BcVROt4zaP0KFIB/2wMUCALaHDohXtG5d2/EIjiCx
 sbbrhTn0ZqD9nfnOsFgq/DQntwF/Li/+vvmKfUrLzCvmJVfYzmSV6+TZ1ixeAUHT8u
 2aMDzqxq0M/Vw==
Received: from [10.30.226.235] (localhost [IPv6:::1])
 by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id
 72196380DBEE; Wed,  9 Jul 2025 18:10:23 +0000 (UTC)
MIME-Version: 1.0
Message-Id: <175208462203.806926.11617556974013999350.git-patchwork-notify@kernel.org>
Date: Wed, 09 Jul 2025 18:10:22 +0000
References: <20250708095339.3079788-1-chao@kernel.org>
In-Reply-To: <20250708095339.3079788-1-chao@kernel.org>
To: Chao Yu <chao@kernel.org>
X-Spam-Score: -0.3 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-2.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  Hello: This patch was applied to jaegeuk/f2fs.git (dev) by
 Jaegeuk Kim <jaegeuk@kernel.org>: On Tue, 8 Jul 2025 17:53:39 +0800 you wrote:
 > syzbot reported an UAF issue as below: [1] [2] > > [1]
 https://syzkaller.appspot.com/text?tag=CrashReport&x=16594c60580000
 > > ========================== [...] 
 Content analysis details:   (-0.3 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1uZZFC-000154-38
Subject: Re: [f2fs-dev] [PATCH v2] f2fs: fix to avoid UAF in
 f2fs_sync_inode_meta()
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

On Tue,  8 Jul 2025 17:53:39 +0800 you wrote:
> syzbot reported an UAF issue as below: [1] [2]
> 
> [1] https://syzkaller.appspot.com/text?tag=CrashReport&x=16594c60580000
> 
> ==================================================================
> BUG: KASAN: use-after-free in __list_del_entry_valid+0xa6/0x130 lib/list_debug.c:62
> Read of size 8 at addr ffff888100567dc8 by task kworker/u4:0/8
> 
> [...]

Here is the summary with links:
  - [f2fs-dev,v2] f2fs: fix to avoid UAF in f2fs_sync_inode_meta()
    https://git.kernel.org/jaegeuk/f2fs/c/7c30d7993013

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html




_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
