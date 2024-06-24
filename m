Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 98F90915594
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 24 Jun 2024 19:40:51 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-3.v29.lw.sourceforge.com)
	by sfs-ml-3.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1sLngH-0004Iv-Op;
	Mon, 24 Jun 2024 17:40:41 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-3.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <patchwork-bot+f2fs@kernel.org>) id 1sLngF-0004Ip-Ve
 for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 24 Jun 2024 17:40:39 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Cc:To:In-Reply-To:References:Date:Message-Id:From:
 Subject:Content-Transfer-Encoding:MIME-Version:Content-Type:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=pAGYVWze2bAloo5z0K/TKnx4xVR3y/T9b6qdRSyUCqc=; b=a9FGCnj4OkPXNv8dkkNM3XKbdd
 2OPwC1kSBiuZcO7RcEkFwTxD/rp7kBwFbBktcUmQt5k5ITNpijttZJFQl6n8kYGEMWi1IdcO6+qDa
 HESRZZ450b5FTHueLanjhGVysQFTAF1gwBgPiXbNLGRJ6my9vzIbqpX8o1/Vhf6jI7b0=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ; h=Cc:To:In-Reply-To:References:Date:Message-Id:From:Subject:
 Content-Transfer-Encoding:MIME-Version:Content-Type:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=pAGYVWze2bAloo5z0K/TKnx4xVR3y/T9b6qdRSyUCqc=; b=D8ugIEAuBGTKwBW6LMqUwFH+IH
 Iu+H0p66hhU1tJHeCfXc/85gNh6xzrTx9qWhC0OcLq3CKUqlg+RXMmurZmIiaOshfm5VwHHyuA+Lx
 aaWKCMLupUuGsV4+XKHHKHSbDvWEZKKPZTkIKmtqAM7msV72ewk2MXQGusKGFcobwNSY=;
Received: from sin.source.kernel.org ([145.40.73.55])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1sLngF-00023v-BD for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 24 Jun 2024 17:40:39 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id D3081CE134F
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Mon, 24 Jun 2024 17:40:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 07D57C32789;
 Mon, 24 Jun 2024 17:40:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1719250831;
 bh=cVZguKETeKIYSegRsLSDsF+ocn6kUtTa2dnkN7qny8k=;
 h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
 b=CPavk1N/CfgB5i6aKmd98eXP58YRJCznv0VMuBaHiSlqNPERXtcr5gKjJ4jJcv+49
 y1e1lYJ7BmNcr/IKlKU0Yu6n/FFldPUegW/xd4bindRky6ec3uL2OxiSAbbuBg2/zo
 RssF/NSP7BFMPL6k6wA8yUuiQBTBtWemwyaMI8ObZtGZnB2geY/Q61aeR1h+stBjck
 km1+cva12wyZ8ShxfawpeOSeH9ZAHIVy2vJyDM4GUNRCcgNa2LkCNJiRqLeHvwiWgK
 0/ppXqXkVmUjJQURzK4hfNT01ZXDb2a2b2tmmQAlGSL/uScAIDd6V05lGmFk4SNlQ4
 Ww37vgtplBjyA==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org
 (localhost.localdomain [127.0.0.1])
 by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id
 D89D1C43612; Mon, 24 Jun 2024 17:40:30 +0000 (UTC)
MIME-Version: 1.0
From: patchwork-bot+f2fs@kernel.org
Message-Id: <171925083088.4247.5859176757737434245.git-patchwork-notify@kernel.org>
Date: Mon, 24 Jun 2024 17:40:30 +0000
References: <20240618022334.1576056-1-jaegeuk@kernel.org>
In-Reply-To: <20240618022334.1576056-1-jaegeuk@kernel.org>
To: Jaegeuk Kim <jaegeuk@kernel.org>
X-Spam-Score: -0.4 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  Hello: This patch was applied to jaegeuk/f2fs.git (dev) by
 Jaegeuk Kim <jaegeuk@kernel.org>: On Tue, 18 Jun 2024 02:23:34 +0000 you
 wrote: > mkdir /mnt/test/comp > f2fs_io setflags compression /mnt/test/comp
 > dd if=/dev/zero of=/mnt/test/comp/testfile bs=16k count=1 > truncate --size
 13 /mnt [...] 
 Content analysis details:   (-0.4 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 RCVD_IN_VALIDITY_CERTIFIED_BLOCKED RBL: ADMINISTRATOR NOTICE:
 The query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [145.40.73.55 listed in sa-accredit.habeas.com]
 0.0 RCVD_IN_VALIDITY_RPBL_BLOCKED RBL: ADMINISTRATOR NOTICE: The
 query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [145.40.73.55 listed in bl.score.senderscore.com]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid -0.2 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1sLngF-00023v-BD
Subject: Re: [f2fs-dev] [PATCH] f2fs: assign CURSEG_ALL_DATA_ATGC if blkaddr
 is valid
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
Cc: linux-kernel@vger.kernel.org, stable@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

Hello:

This patch was applied to jaegeuk/f2fs.git (dev)
by Jaegeuk Kim <jaegeuk@kernel.org>:

On Tue, 18 Jun 2024 02:23:34 +0000 you wrote:
> mkdir /mnt/test/comp
> f2fs_io setflags compression /mnt/test/comp
> dd if=/dev/zero of=/mnt/test/comp/testfile bs=16k count=1
> truncate --size 13 /mnt/test/comp/testfile
> 
> In the above scenario, we can get a BUG_ON.
>  kernel BUG at fs/f2fs/segment.c:3589!
>  Call Trace:
>   do_write_page+0x78/0x390 [f2fs]
>   f2fs_outplace_write_data+0x62/0xb0 [f2fs]
>   f2fs_do_write_data_page+0x275/0x740 [f2fs]
>   f2fs_write_single_data_page+0x1dc/0x8f0 [f2fs]
>   f2fs_write_multi_pages+0x1e5/0xae0 [f2fs]
>   f2fs_write_cache_pages+0xab1/0xc60 [f2fs]
>   f2fs_write_data_pages+0x2d8/0x330 [f2fs]
>   do_writepages+0xcf/0x270
>   __writeback_single_inode+0x44/0x350
>   writeback_sb_inodes+0x242/0x530
>   __writeback_inodes_wb+0x54/0xf0
>   wb_writeback+0x192/0x310
>   wb_workfn+0x30d/0x400
> 
> [...]

Here is the summary with links:
  - [f2fs-dev] f2fs: assign CURSEG_ALL_DATA_ATGC if blkaddr is valid
    https://git.kernel.org/jaegeuk/f2fs/c/8cb1f4080dd9

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html




_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
