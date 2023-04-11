Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F5466DE1BC
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 11 Apr 2023 19:00:31 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-3.v29.lw.sourceforge.com)
	by sfs-ml-3.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1pmHM6-0007AG-Vj;
	Tue, 11 Apr 2023 17:00:30 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-3.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <patchwork-bot+f2fs@kernel.org>) id 1pmHM3-0007A9-BB
 for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 11 Apr 2023 17:00:26 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Cc:To:In-Reply-To:References:Date:Message-Id:From:
 Subject:Content-Transfer-Encoding:MIME-Version:Content-Type:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=EgLyCGE0GANNPAZWOgDBacnT2TAELr0s+9mqZh9nNac=; b=HNX6lCdjKbYwIrp5fTzV5kghUq
 TlvmAw4XSOiQB+Yo6jmXgg6yg4fHTtpBuMoIcF9qbz1rOtfuu/u35MQWoG/G2UicvZEhzlAjEOO7L
 FE8RfYCs1Qgs0SbnkjEjqGKt/t+Yn7pqe9P6EijteiQ9ByQ9gO/P0w6I01WvGloTjeX4=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ; h=Cc:To:In-Reply-To:References:Date:Message-Id:From:Subject:
 Content-Transfer-Encoding:MIME-Version:Content-Type:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=EgLyCGE0GANNPAZWOgDBacnT2TAELr0s+9mqZh9nNac=; b=E1WBDlrLoeHUV5R0e/l8kmbSEH
 Yf6yCPznCFZ2rF2suN/CCIo+jvjNAc6ejzzFqUHnl664J5Bx1TFZQctChyrBN0JiqHtox3048O2n6
 ASZyJZnD0GYeTibNNQUqSU5xtKLvjf1T2P8hOPkxZqjtq4aBPp7/vaFANKlkVO6FfvNM=;
Received: from dfw.source.kernel.org ([139.178.84.217])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1pmHM1-004G73-TS for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 11 Apr 2023 17:00:26 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 867D562998
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Tue, 11 Apr 2023 17:00:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id E715EC4339B;
 Tue, 11 Apr 2023 17:00:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1681232419;
 bh=rIUcju8/EDwKVpm25ybPyuxz+Uf6Zu5FcwGold4D7j8=;
 h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
 b=MYp9ShmwvBsxA7bxmx7Vf9CoTJBkrJrH7U/T2mGR1mQBEkRGEsrsk2/HtyYv+Ae2b
 c66vxWp9F0MCRI0FPMZSN8+E+diMYTWol8sRpzqliTECQc5N5GskJzNtPQbyYdCNcX
 /5SdbUpAW5xIRdXi9wqzTClBwOKSyubKVOLOISG0FqqXjRmv7xkJh5h39kWcyFLzZh
 UqKFM+tKodhTN6J+j0kYnvNgbZwAMVPDhFsncwE77WpCZQXRDtbeKzcnhDCNGjy6xH
 XtCay7tTIDf9yxmvlUTnPnq2f+ZQZoHunpVMuXQH9dOS0/gjm7sbz16ep4nZdcbKNz
 LcVUIGWbOAotg==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org
 (localhost.localdomain [127.0.0.1])
 by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id
 BC615C395C3; Tue, 11 Apr 2023 17:00:19 +0000 (UTC)
MIME-Version: 1.0
From: patchwork-bot+f2fs@kernel.org
Message-Id: <168123241976.4928.5772798816044756759.git-patchwork-notify@kernel.org>
Date: Tue, 11 Apr 2023 17:00:19 +0000
References: <20230410021402.1833220-1-chao@kernel.org>
In-Reply-To: <20230410021402.1833220-1-chao@kernel.org>
To: Chao Yu <chao@kernel.org>
X-Spam-Score: -5.2 (-----)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  Hello: This patch was applied to jaegeuk/f2fs.git (dev) by
 Jaegeuk Kim <jaegeuk@kernel.org>: On Mon, 10 Apr 2023 10:14:02 +0800 you
 wrote: > xfstest generic/019 reports a bug: > > kernel BUG at
 mm/filemap.c:1619!
 > RIP: 0010:folio_end_writeback+0x8a/0x90 > Call Trace: >
 end_page_writeback+0x1 [...] 
 Content analysis details:   (-5.2 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [139.178.84.217 listed in list.dnswl.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1pmHM1-004G73-TS
Subject: Re: [f2fs-dev] [PATCH] f2fs: fix to avoid use-after-free for cached
 IPU bio
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
Cc: jaegeuk@kernel.org, linux-kernel@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

Hello:

This patch was applied to jaegeuk/f2fs.git (dev)
by Jaegeuk Kim <jaegeuk@kernel.org>:

On Mon, 10 Apr 2023 10:14:02 +0800 you wrote:
> xfstest generic/019 reports a bug:
> 
> kernel BUG at mm/filemap.c:1619!
> RIP: 0010:folio_end_writeback+0x8a/0x90
> Call Trace:
>  end_page_writeback+0x1c/0x60
>  f2fs_write_end_io+0x199/0x420
>  bio_endio+0x104/0x180
>  submit_bio_noacct+0xa5/0x510
>  submit_bio+0x48/0x80
>  f2fs_submit_write_bio+0x35/0x300
>  f2fs_submit_merged_ipu_write+0x2a0/0x2b0
>  f2fs_write_single_data_page+0x838/0x8b0
>  f2fs_write_cache_pages+0x379/0xa30
>  f2fs_write_data_pages+0x30c/0x340
>  do_writepages+0xd8/0x1b0
>  __writeback_single_inode+0x44/0x370
>  writeback_sb_inodes+0x233/0x4d0
>  __writeback_inodes_wb+0x56/0xf0
>  wb_writeback+0x1dd/0x2d0
>  wb_workfn+0x367/0x4a0
>  process_one_work+0x21d/0x430
>  worker_thread+0x4e/0x3c0
>  kthread+0x103/0x130
>  ret_from_fork+0x2c/0x50
> 
> [...]

Here is the summary with links:
  - [f2fs-dev] f2fs: fix to avoid use-after-free for cached IPU bio
    https://git.kernel.org/jaegeuk/f2fs/c/5cdb422c8391

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html




_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
