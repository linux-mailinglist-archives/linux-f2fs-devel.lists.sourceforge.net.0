Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 53B1FADF8DA
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 18 Jun 2025 23:39:48 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:To:In-Reply-To:References:Date:Message-Id:
	MIME-Version:Sender:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=8Q/C+LFZi8/GGGCAsiCqnWchFYzy4lrmMRFbN2CjCoA=; b=T1hYTmWj+pkXR3do/owvRW5PrT
	BHoI4JtJ3/+hQYOtKQ2fH6aK8G8s2i8AwYDPAsERLVtsAx4V4eVMgjlosGwUZxCRXTq5mltAp5ICZ
	M8ecBzZsRxq1p15v44MPhx1jw0Ebauh/fNOP8+WudqszuioEeTpGKb+TIWjVZfD4lHIg=;
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1uS0VW-0000Lm-8Z;
	Wed, 18 Jun 2025 21:39:46 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <patchwork-bot+f2fs@kernel.org>) id 1uS0VU-0000Le-98
 for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 18 Jun 2025 21:39:44 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Cc:To:In-Reply-To:References:Date:Message-Id:From:
 Subject:Content-Transfer-Encoding:MIME-Version:Content-Type:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=aFXW57g/TTbED1LLbm0xdIoZo24VXs6Ne5Xt+ESb1ZM=; b=Hkn13b2QB76mm0J5JU7h5pF2wp
 kZq9FVLi6Yu6O1Y6GBxdhcJyAZOawXX4DZhku6K7bfgzC/0ky2odAFqIN2SBQlxppebnw75FjLA5m
 iHVLbICJONZEkic9QCs8dM+l51y1DtARfwvP/27n8seNrNWx4rmsDN99stfPRizcYvvo=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ; h=Cc:To:In-Reply-To:References:Date:Message-Id:From:Subject:
 Content-Transfer-Encoding:MIME-Version:Content-Type:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=aFXW57g/TTbED1LLbm0xdIoZo24VXs6Ne5Xt+ESb1ZM=; b=MVZMZeNAOjnWlVGmkD888k37Mz
 ooP3skXyvVF+GDYQsos4zB4kdr/NvdDYmEg3c4fXE9xfonxSYM1hwqbjyI912MM/QlYsUtFyFyTEZ
 BaZkI9tKCQkCRKBIroIiBue0KSySxhmlC6LZPy541y4hM7WIG9k0LCOSijKtFZmbqmIk=;
Received: from nyc.source.kernel.org ([147.75.193.91])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1uS0VT-0006BT-Ox for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 18 Jun 2025 21:39:44 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id 1F685A4DA8C;
 Wed, 18 Jun 2025 21:39:38 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B182DC4CEE7;
 Wed, 18 Jun 2025 21:39:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1750282777;
 bh=hY/QMmnFyygQgDp6Hym88UYb9L8M8LHxSoMzGuUR88Q=;
 h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
 b=EJhzb4XvKjDMpaOigxAtiMHwKC+kHZtGPgvRhkQcD+J05GiqY4OGb3CFNazA+mvai
 Z43iAHg2Lkhf7QOEDG3W3DKAITpsKv1COPxVWIKqjExLrHvjZqlSi6ojC/G3qjnhep
 k0ryuM2Bg2LQjIZN2GjW6/Wpq83457FbmqlkQiymAbOXKnWX5nHmQniAxABT/oNGpb
 mhvVOK62csmQd/WjLiSvSF8/L9z6SMpomLsoN4+r7PhqVAEyW8zcDn5bwr2pI3YtDy
 J17G0jY6UJ8vfT3q9tJ43Jdz90IIP0LcrzNnOm3uyct1Qflrw/6iE7JG5NTihMloxu
 ACFRx0dBr76zQ==
Received: from [10.30.226.235] (localhost [IPv6:::1])
 by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id
 33AD93806649; Wed, 18 Jun 2025 21:40:07 +0000 (UTC)
MIME-Version: 1.0
Message-Id: <175028280599.266369.3803881518609217106.git-patchwork-notify@kernel.org>
Date: Wed, 18 Jun 2025 21:40:05 +0000
References: <20250601002709.4094344-1-willy@infradead.org>
In-Reply-To: <20250601002709.4094344-1-willy@infradead.org>
To: Matthew Wilcox <willy@infradead.org>
X-Spam-Score: -0.3 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-1.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  Hello: This patch was applied to jaegeuk/f2fs.git (dev) by
 Jaegeuk Kim <jaegeuk@kernel.org>: On Sun, 1 Jun 2025 01:26:54 +0100 you wrote:
 > This conversion moved the folio_unlock() to inside __write_node_folio(),
 > but missed one caller so we had a double-unlock on this path. > > Cc:
 Christop [...] 
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
X-Headers-End: 1uS0VT-0006BT-Ox
Subject: Re: [f2fs-dev] [PATCH] f2fs: Fix __write_node_folio() conversion
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
Cc: linux-fsdevel@vger.kernel.org, jaegeuk@kernel.org,
 syzbot+c0dc46208750f063d0e0@syzkaller.appspotmail.com, hch@lst.de,
 linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

Hello:

This patch was applied to jaegeuk/f2fs.git (dev)
by Jaegeuk Kim <jaegeuk@kernel.org>:

On Sun,  1 Jun 2025 01:26:54 +0100 you wrote:
> This conversion moved the folio_unlock() to inside __write_node_folio(),
> but missed one caller so we had a double-unlock on this path.
> 
> Cc: Christoph Hellwig <hch@lst.de>
> Cc: Chao Yu <chao@kernel.org>
> Cc: Jaegeuk Kim <jaegeuk@kernel.org>
> Reported-by: syzbot+c0dc46208750f063d0e0@syzkaller.appspotmail.com
> Fixes: 80f31d2a7e5f (f2fs: return bool from __write_node_folio)
> Signed-off-by: Matthew Wilcox (Oracle) <willy@infradead.org>
> 
> [...]

Here is the summary with links:
  - [f2fs-dev] f2fs: Fix __write_node_folio() conversion
    https://git.kernel.org/jaegeuk/f2fs/c/6dea74e454c2

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html




_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
