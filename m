Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 767E4A5E01D
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 12 Mar 2025 16:20:48 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1tsNsx-0005sy-B5;
	Wed, 12 Mar 2025 15:20:43 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <patchwork-bot+f2fs@kernel.org>) id 1tsNsi-0005sS-JM
 for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 12 Mar 2025 15:20:29 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Cc:To:In-Reply-To:References:Date:Message-Id:From:
 Subject:Content-Transfer-Encoding:MIME-Version:Content-Type:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=ycpfepEXBGyzltSZS0cgBKNN2QjWVMOoT9hJeOKGKUc=; b=WKBzkGNxTBhi4jXdbntGv/Y1T8
 hR3HYDUfnQhRGMGvXy+NySaOA682N3YlYyUpkqOqxAUV6b5vxgwtuny0OAqjWpFdPjHstil/SOi9A
 TPbCjFCBlzsSCGq9SKpuCW9O4ZYHFIHq9s8x3BfCpGlWBs3TqKzAxWK4F3q2ZlQ7rQSI=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ; h=Cc:To:In-Reply-To:References:Date:Message-Id:From:Subject:
 Content-Transfer-Encoding:MIME-Version:Content-Type:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=ycpfepEXBGyzltSZS0cgBKNN2QjWVMOoT9hJeOKGKUc=; b=jWmZSFVPdyd7BGwt+/4tYTrA6J
 f8xaG4n8pZW0rBJpKa1zhxKHm8TNd0/EYUIVvk7bjbsSm32Tk9wVNS3INV1IabKSMojXYkXblIbyx
 tbQPhVE+kfwIeojgh3rbHoCI6Aangj+aZ+gZ/H1IHUpoIo8p4FmheI7rfvGmCvjjS00I=;
Received: from nyc.source.kernel.org ([147.75.193.91])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1tsNsQ-0006x5-O2 for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 12 Mar 2025 15:20:21 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id 059CBA441D1
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Wed, 12 Mar 2025 15:14:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 96BC1C4CEDD;
 Wed, 12 Mar 2025 15:19:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1741792799;
 bh=IxlcF8BZP06JVhdofL8W/C0CQCL3FTai5k9b9g87Tnw=;
 h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
 b=JxvmRpLZnuI4PFTLQTjOt8GyFaujiPyHJZ1dNdx9+LLyc6P7AAV2SLzojTlGvyyVu
 Y3vzDZPRcTM/Y96vY/ni9fDF9sDHcaLBuUCzjLsA8JDLtocInj7M6gi3pu4wU6O1TP
 pDNKnxvNc2J8fJyn1sjjEeciYGDCtZ3bq6i0D8mzKGs4ZJ6+Jivs2IvKxi9o8ZNkkG
 Zat6u9poaSOImz9GktANikOHug3StTn9DmOG0j3va0WFtRlfNJhciqiLe5iT7G2zuo
 DQ0+DqFr9vhS+Zn1jnoFl0C0nv43zcxVTG2swQ0iwMvSd8kXqi0lu+zmqN+vaAox8o
 5ZKYq5zgDgINA==
Received: from [10.30.226.235] (localhost [IPv6:::1])
 by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id
 33EB5380DBE4; Wed, 12 Mar 2025 15:20:34 +0000 (UTC)
MIME-Version: 1.0
Message-Id: <174179283306.831874.2260893071160537539.git-patchwork-notify@kernel.org>
Date: Wed, 12 Mar 2025 15:20:33 +0000
References: <20250312090125.4014447-1-chao@kernel.org>
In-Reply-To: <20250312090125.4014447-1-chao@kernel.org>
To: Chao Yu <chao@kernel.org>
X-Spam-Score: -2.5 (--)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  Hello: This patch was applied to jaegeuk/f2fs.git (dev) by
 Jaegeuk Kim <jaegeuk@kernel.org>: On Wed, 12 Mar 2025 17:01:25 +0800 you
 wrote: > If checkpoint is disabled, GC can not reclaim any segments, we need
 > to detect such condition and bail out from fallocate() of a pinfile, >
 rather than [...] 
 Content analysis details:   (-2.5 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -2.3 RCVD_IN_DNSWL_MED      RBL: Sender listed at https://www.dnswl.org/,
 medium trust [147.75.193.91 listed in list.dnswl.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 0.0 RCVD_IN_VALIDITY_RPBL_BLOCKED RBL: ADMINISTRATOR NOTICE: The
 query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [147.75.193.91 listed in bl.score.senderscore.com]
 0.0 RCVD_IN_VALIDITY_CERTIFIED_BLOCKED RBL: ADMINISTRATOR NOTICE:
 The query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [147.75.193.91 listed in sa-accredit.habeas.com]
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1tsNsQ-0006x5-O2
Subject: Re: [f2fs-dev] [PATCH] f2fs: fix to avoid running out of free
 segments
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

On Wed, 12 Mar 2025 17:01:25 +0800 you wrote:
> If checkpoint is disabled, GC can not reclaim any segments, we need
> to detect such condition and bail out from fallocate() of a pinfile,
> rather than letting allocator running out of free segment, which may
> cause f2fs to be shutdown.
> 
> reproducer:
> mkfs.f2fs -f /dev/vda 16777216
> mount -o checkpoint=disable:10% /dev/vda /mnt/f2fs
> for ((i=0;i<4096;i++)) do { dd if=/dev/zero of=/mnt/f2fs/$i bs=1M count=1; } done
> sync
> for ((i=0;i<4096;i+=2)) do { rm /mnt/f2fs/$i; } done
> sync
> touch /mnt/f2fs/pinfile
> f2fs_io pinfile set /mnt/f2fs/pinfile
> f2fs_io fallocate 0 0 4201644032 /mnt/f2fs/pinfile
> 
> [...]

Here is the summary with links:
  - [f2fs-dev] f2fs: fix to avoid running out of free segments
    https://git.kernel.org/jaegeuk/f2fs/c/f7f8932ca6bb

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html




_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
