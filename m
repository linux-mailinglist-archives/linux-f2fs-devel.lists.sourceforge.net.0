Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id B7BCD72D104
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 12 Jun 2023 22:50:35 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1q8oUi-0000W8-Gp;
	Mon, 12 Jun 2023 20:50:32 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <patchwork-bot+f2fs@kernel.org>) id 1q8oUe-0000Vv-CG
 for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 12 Jun 2023 20:50:29 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Cc:To:In-Reply-To:References:Date:Message-Id:From:
 Subject:Content-Transfer-Encoding:MIME-Version:Content-Type:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=X+t8lkxlr/rAQAjUvfTjOfyWgykklUrp17OQBiArSFM=; b=kuhkKVgXDAYq5Y0RfJTLs2IJ8x
 n6rcJtaFMPLVmnrBZML8Soubgg9OjOSLghQHabEHliH0DykxXdqu1RlF38MBnHKUNOW2jrmWmSIeC
 RJsdXqoRJzj3p2SGzqtv5rJ7tVBlaCHsYiQwNUTsJtg95URrplgdWdQsaxFA8mTc6SK0=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ; h=Cc:To:In-Reply-To:References:Date:Message-Id:From:Subject:
 Content-Transfer-Encoding:MIME-Version:Content-Type:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=X+t8lkxlr/rAQAjUvfTjOfyWgykklUrp17OQBiArSFM=; b=hEMLh6s9Xrd8w78PCXQ38Nqpk6
 UIUuUJ/vdOtkG9bE02Zo6VLeUR3flVkOPSEYft8QHHavMMu0WO0eQH4MkUJvO8wS14/j64VAn/g3H
 9J1EGS013h5JIT1PRlugmhH9H9g4draJHgpRghLMjpyveagEtdJuo2FdH0m7hP6w9KvA=;
Received: from dfw.source.kernel.org ([139.178.84.217])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1q8oUe-0013OQ-7U for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 12 Jun 2023 20:50:28 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id D185362174
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Mon, 12 Jun 2023 20:50:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 41FEDC4339B;
 Mon, 12 Jun 2023 20:50:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1686603022;
 bh=u2/UkIhdf3DGxsdKdPni953WmZ7Tsrt6n89M2makI5s=;
 h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
 b=P4zdWrJ7I9ncv/xIsWpCfy1UOAmt34YqvBUf4TkPb4hI8MqHFKhcMkpXthRBW5ztu
 s7WkJrNKbp1i4awNH27GK1JFL0r/iNkGsNojanTitv9FyK9QDLo1tWrcAPf5qBISn6
 tr1Q8t8d/nCDQDDTr+NeiWzx8OpBonyfBgdUTawPVvQxFcp6s1jnduzpJdyZ0KLox3
 OLyW6ejA9EIfj3Ydq1bdDw2+tlczWcRCk1a1OFbOei/SCDEtpZmztb1zY0BSQYMspu
 4bv+11U777r4lNkMRIbfRogZJTAavvOmV5QN8p0HD55GirdTZphaFZfUwlTJG4z+rz
 rulesEWwo3zhw==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org
 (localhost.localdomain [127.0.0.1])
 by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id
 1DA9FC395F3; Mon, 12 Jun 2023 20:50:22 +0000 (UTC)
MIME-Version: 1.0
From: patchwork-bot+f2fs@kernel.org
Message-Id: <168660302211.10168.11054570964013825555.git-patchwork-notify@kernel.org>
Date: Mon, 12 Jun 2023 20:50:22 +0000
References: <20230529104709.2560779-1-chao@kernel.org>
In-Reply-To: <20230529104709.2560779-1-chao@kernel.org>
To: Chao Yu <chao@kernel.org>
X-Spam-Score: -5.2 (-----)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  Hello: This patch was applied to jaegeuk/f2fs.git (dev) by
 Jaegeuk Kim <jaegeuk@kernel.org>: On Mon, 29 May 2023 18:47:09 +0800 you
 wrote: > Compression option in inode should not be changed after they have
 > been used, however, it may happen in below race case: > > Thread A Thread
 B > - f2fs [...] 
 Content analysis details:   (-5.2 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [139.178.84.217 listed in list.dnswl.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid -0.0 T_SCC_BODY_TEXT_LINE   No description available.
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1q8oUe-0013OQ-7U
Subject: Re: [f2fs-dev] [PATCH v2] f2fs: fix to avoid mmap vs
 set_compress_option case
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

On Mon, 29 May 2023 18:47:09 +0800 you wrote:
> Compression option in inode should not be changed after they have
> been used, however, it may happen in below race case:
> 
> Thread A				Thread B
> - f2fs_ioc_set_compress_option
>  - check f2fs_is_mmap_file()
>  - check get_dirty_pages()
>  - check F2FS_HAS_BLOCKS()
> 					- f2fs_file_mmap
> 					 - set_inode_flag(FI_MMAP_FILE)
> 					- fault
> 					 - do_page_mkwrite
> 					  - f2fs_vm_page_mkwrite
> 					  - f2fs_get_block_locked
> 					 - fault_dirty_shared_page
> 					  - set_page_dirty
>  - update i_compress_algorithm
>  - update i_log_cluster_size
>  - update i_cluster_size
> 
> [...]

Here is the summary with links:
  - [f2fs-dev,v2] f2fs: fix to avoid mmap vs set_compress_option case
    https://git.kernel.org/jaegeuk/f2fs/c/4286ee3e6efe

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html




_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
