Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F35065C6B7
	for <lists+linux-f2fs-devel@lfdr.de>; Tue,  3 Jan 2023 19:50:31 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1pCmMj-0002Ua-Iy;
	Tue, 03 Jan 2023 18:50:25 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <patchwork-bot+f2fs@kernel.org>) id 1pCmMi-0002UU-To
 for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 03 Jan 2023 18:50:24 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Cc:To:In-Reply-To:References:Date:Message-Id:From:
 Subject:Content-Transfer-Encoding:MIME-Version:Content-Type:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=q+h3vgnfXMDmPE0j9kS1fnDW6c1CVGsX2/CLfw+rdHw=; b=efMfgr4JAbHerI5LipQ5fVWtwm
 AMtNyllGlRRIgkZpJU3Ry6TuP0PUTUbVqCBTJznFIgA0XsrJ+4lPT7kENlrrTydl+pctoaU7v0S5C
 i2/jU9Wh03CBBoeT/TjDw+xMATOCF3kq20BS4mlzzoSNjFWt6AE/c+BXO8e8oziMph+g=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ; h=Cc:To:In-Reply-To:References:Date:Message-Id:From:Subject:
 Content-Transfer-Encoding:MIME-Version:Content-Type:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=q+h3vgnfXMDmPE0j9kS1fnDW6c1CVGsX2/CLfw+rdHw=; b=Nog1jTiixEELw73dkzAkC5dEXM
 jcmRDAku/Kreb538N1vASPURb+Y+7IEzOzsR5r42kVOkj2npvWan819Sg4oe/7yYsxg5sfMEQTqoz
 muI9pEOdJX1AbK7KqONoN4Qys6QYFrAszNL1YI8zNEiiqFMBkK7k3yvv+nt/qn2/YTco=;
Received: from ams.source.kernel.org ([145.40.68.75])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1pCmMi-0003vq-7v for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 03 Jan 2023 18:50:24 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id EF55BB810AB
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Tue,  3 Jan 2023 18:50:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 9B0A7C433F1;
 Tue,  3 Jan 2023 18:50:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1672771816;
 bh=sWG9rZzpm0Uy4RsyJFum58ghvV4r6+MVa47kFQe/yhY=;
 h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
 b=DyVkDAEfyYJAVG4YCa99Q0P5eGgeWPsv2HMIJtQIiIQlMrCqlI8oIo9YFPjj1w3Us
 78qyOpGXRs4uIncH4KO2jN1iSIKXhku3G7EhaAwkqHZm2TinS3Dnd+K0xXYulqBGjL
 1eptToGegMpyf85KxkoMWX4Ik6hsP80lYLRTz3Au3L9SiNcTTr9TlqKNMGIZtnG6ut
 75oP1+cUYHdJ5IkphJgzzArFm4kZ8Od8CZOW3nVPqJSxgEwGWgeqs/9myyDcTlXDPA
 wCoSeF9xtqValf9JE0TBwXU082b3Q5Ecjo9KJoOWuxZgGn3KHpubtTvqpzkodszLo9
 WIvmTzHSZ+l/Q==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org
 (localhost.localdomain [127.0.0.1])
 by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id
 74EA3E5724B; Tue,  3 Jan 2023 18:50:16 +0000 (UTC)
MIME-Version: 1.0
From: patchwork-bot+f2fs@kernel.org
Message-Id: <167277181647.18849.14412830382084760443.git-patchwork-notify@kernel.org>
Date: Tue, 03 Jan 2023 18:50:16 +0000
References: <20221222235458.957816-1-jaegeuk@kernel.org>
In-Reply-To: <20221222235458.957816-1-jaegeuk@kernel.org>
To: Jaegeuk Kim <jaegeuk@kernel.org>
X-Spam-Score: -5.2 (-----)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  Hello: This patch was applied to jaegeuk/f2fs.git (dev) by
 Jaegeuk Kim <jaegeuk@kernel.org>: On Thu, 22 Dec 2022 15:54:58 -0800 you
 wrote: > This patch avoids the below panic. > > pc :
 __lookup_extent_tree+0xd8/0x760
 > lr : f2fs_do_write_data_page+0x104/0x87c > sp : ffffffc010cbb3c0 > x29:
 ff [...] 
 Content analysis details:   (-5.2 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [145.40.68.75 listed in list.dnswl.org]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1pCmMi-0003vq-7v
Subject: Re: [f2fs-dev] [PATCH] f2fs: let's avoid panic if extent_tree is
 not created
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
Cc: linux-kernel@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

Hello:

This patch was applied to jaegeuk/f2fs.git (dev)
by Jaegeuk Kim <jaegeuk@kernel.org>:

On Thu, 22 Dec 2022 15:54:58 -0800 you wrote:
> This patch avoids the below panic.
> 
> pc : __lookup_extent_tree+0xd8/0x760
> lr : f2fs_do_write_data_page+0x104/0x87c
> sp : ffffffc010cbb3c0
> x29: ffffffc010cbb3e0 x28: 0000000000000000
> x27: ffffff8803e7f020 x26: ffffff8803e7ed40
> x25: ffffff8803e7f020 x24: ffffffc010cbb460
> x23: ffffffc010cbb480 x22: 0000000000000000
> x21: 0000000000000000 x20: ffffffff22e90900
> x19: 0000000000000000 x18: ffffffc010c5d080
> x17: 0000000000000000 x16: 0000000000000020
> x15: ffffffdb1acdbb88 x14: ffffff888759e2b0
> x13: 0000000000000000 x12: ffffff802da49000
> x11: 000000000a001200 x10: ffffff8803e7ed40
> x9 : ffffff8023195800 x8 : ffffff802da49078
> x7 : 0000000000000001 x6 : 0000000000000000
> x5 : 0000000000000006 x4 : ffffffc010cbba28
> x3 : 0000000000000000 x2 : ffffffc010cbb480
> x1 : 0000000000000000 x0 : ffffff8803e7ed40
> Call trace:
>  __lookup_extent_tree+0xd8/0x760
>  f2fs_do_write_data_page+0x104/0x87c
>  f2fs_write_single_data_page+0x420/0xb60
>  f2fs_write_cache_pages+0x418/0xb1c
>  __f2fs_write_data_pages+0x428/0x58c
>  f2fs_write_data_pages+0x30/0x40
>  do_writepages+0x88/0x190
>  __writeback_single_inode+0x48/0x448
>  writeback_sb_inodes+0x468/0x9e8
>  __writeback_inodes_wb+0xb8/0x2a4
>  wb_writeback+0x33c/0x740
>  wb_do_writeback+0x2b4/0x400
>  wb_workfn+0xe4/0x34c
>  process_one_work+0x24c/0x5bc
>  worker_thread+0x3e8/0xa50
>  kthread+0x150/0x1b4
> 
> [...]

Here is the summary with links:
  - [f2fs-dev] f2fs: let's avoid panic if extent_tree is not created
    https://git.kernel.org/jaegeux/f2fs/c/df9d44b645b8

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html




_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
