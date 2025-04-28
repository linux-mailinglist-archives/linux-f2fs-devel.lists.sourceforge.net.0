Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id B3DDBA9FD2C
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 29 Apr 2025 00:41:01 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:To:In-Reply-To:References:Date:Message-Id:
	MIME-Version:Sender:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=sOJdGbH/K8C1efk0f1pMHYlu07OcHoUujCkvEGYFlWE=; b=bx+bClu0HyUuy+MY8UeqwmW7oM
	x9ZNnQYlEvPgd6rwv+9KJSpB+AuF4jX+L13hE6vxX90ziTA3eUQ6wMQ92thNsom5Tt6GgXxWLbLXi
	eG0MRkh66Zjr+zj3nvMs00RrRmKezZp9QdM0d+/4817nsupQUqA9xWPa81Z9WYAXSpYA=;
Received: from [127.0.0.1] (helo=sfs-ml-3.v29.lw.sourceforge.com)
	by sfs-ml-3.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1u9X9j-0005hc-Uw;
	Mon, 28 Apr 2025 22:40:55 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-3.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <patchwork-bot+f2fs@kernel.org>) id 1u9X9W-0005gx-Vq
 for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 28 Apr 2025 22:40:42 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Cc:To:In-Reply-To:References:Date:Message-Id:From:
 Subject:Content-Transfer-Encoding:MIME-Version:Content-Type:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=Bt9J8DRdRhAV+yTbybC4//CKCADHmJqBJNulF/vL0pM=; b=GhsoelZRabQYmgzZOyy9AGgrFb
 Sip9wP7efRKF2O5t8SeB0rSpg0zAxq8ES5AozziwiW6fJ74eeP1F+M9emlc3tjLQ66eVdYiqLDIgN
 aYkk46WwoksbEoMH2R/l/Kl4pVn7Po8UJOQJFqtMT5yxdbcpf0B0voZnSPECedvsaC5E=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ; h=Cc:To:In-Reply-To:References:Date:Message-Id:From:Subject:
 Content-Transfer-Encoding:MIME-Version:Content-Type:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=Bt9J8DRdRhAV+yTbybC4//CKCADHmJqBJNulF/vL0pM=; b=D1zWpaCOpGRewm6bIf+wYcE8As
 XCCoM5IuPYFfTKUrBTr14c0ym69yRTGl1u+L4Jaty7Zz8vM/2ugPYEKSVPIpcQvd0it8v9wPa+ttt
 aEAKgMIc6O45DkT7ixJYAN2L3CGzhRt8GmUNB/Pb+4TqkkWoEjYRtSSmKUmXOo/+f7YU=;
Received: from sea.source.kernel.org ([172.234.252.31])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1u9X9H-0002KO-7P for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 28 Apr 2025 22:40:42 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id 9500D4A8D1
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Mon, 28 Apr 2025 22:40:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 95727C4CEE4;
 Mon, 28 Apr 2025 22:40:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1745880016;
 bh=BFR43jbgHotYY1eutbh4BBrxebdbMJ29xjEmR45iP/M=;
 h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
 b=gnsMzU6ouEJDEXlU0SfMnpQH9Dwre4NjybN2lFvke/koLw3n/hC1EQ1TIN8UASbVL
 RnRwsSrNCeAnnSQ6MEd2d50OxKZiFZDOfM2nTxjH7zUrzh+/OgsvwfQfrehWWdhHIa
 PXsykTwY9uxIqsqYZMZNJ89z0lHWqh/xU17z5DwsGC5x63CMABdb4JKAonn/7xQptc
 eRQ5QDDKeCy2xvMraQU/eEM7eWN38Xi/7ihMtaaM4InWj1AipOFIopR0afbT99eYp6
 oj4BWJ9UQEfOv9xgHTyjegcCEpj/JMpSW8KPmsKpolbJAQqXm816Kha5C5/fI1AlyD
 vbf3nPEweKaIQ==
Received: from [10.30.226.235] (localhost [IPv6:::1])
 by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id
 ADB013822D43; Mon, 28 Apr 2025 22:40:56 +0000 (UTC)
MIME-Version: 1.0
Message-Id: <174588005523.1067750.16774699673521378545.git-patchwork-notify@kernel.org>
Date: Mon, 28 Apr 2025 22:40:55 +0000
References: <20250414105520.729616-1-chao@kernel.org>
In-Reply-To: <20250414105520.729616-1-chao@kernel.org>
To: Chao Yu <chao@kernel.org>
X-Spam-Score: -0.7 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  Hello: This patch was applied to jaegeuk/f2fs.git (dev) by
 Jaegeuk Kim <jaegeuk@kernel.org>: On Mon, 14 Apr 2025 18:55:20 +0800 you
 wrote: > w/ below testcase, resize will generate a corrupted image which >
 contains inconsistent metadata, so when mounting such image, it > will trigger
 kernel [...] 
 Content analysis details:   (-0.7 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 0.0 RCVD_IN_VALIDITY_SAFE_BLOCKED RBL: ADMINISTRATOR NOTICE: The
 query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [172.234.252.31 listed in sa-accredit.habeas.com]
 0.0 RCVD_IN_VALIDITY_RPBL_BLOCKED RBL: ADMINISTRATOR NOTICE: The
 query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [172.234.252.31 listed in bl.score.senderscore.com]
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.5 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1u9X9H-0002KO-7P
Subject: Re: [f2fs-dev] [PATCH] f2fs: fix to do sanity check on
 sit_bitmap_size
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
Cc: jaegeuk@kernel.org, linux-kernel@vger.kernel.org, stable@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

Hello:

This patch was applied to jaegeuk/f2fs.git (dev)
by Jaegeuk Kim <jaegeuk@kernel.org>:

On Mon, 14 Apr 2025 18:55:20 +0800 you wrote:
> w/ below testcase, resize will generate a corrupted image which
> contains inconsistent metadata, so when mounting such image, it
> will trigger kernel panic:
> 
> touch img
> truncate -s $((512*1024*1024*1024)) img
> mkfs.f2fs -f img $((256*1024*1024))
> resize.f2fs -s -i img -t $((1024*1024*1024))
> mount img /mnt/f2fs
> 
> [...]

Here is the summary with links:
  - [f2fs-dev] f2fs: fix to do sanity check on sit_bitmap_size
    https://git.kernel.org/jaegeuk/f2fs/c/5db0d252c64e

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html




_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
