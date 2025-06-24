Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 761CDAE58B3
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 24 Jun 2025 02:40:57 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:To:In-Reply-To:References:Date:Message-Id:
	MIME-Version:Sender:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=USG3rvAEuV+0peGT0u3aPty+FcinaYARU8CmIob3phE=; b=Ieqbv43Mizi4qpdp7kXdDNw6Xs
	R9Wpiy1Idj+2PxgNVk8lbGKaaLPXTaisN9yILBMAoZt33htE/MZOICryWLZUVUlmv/xCP3vLFN3Ki
	zrhFhyUPidbAmuorOSGNwxYUS9/HclmUKJbHgVCfQvtIueiNRdJsEW/CQFtIT3Hm9BlQ=;
Received: from [127.0.0.1] (helo=sfs-ml-3.v29.lw.sourceforge.com)
	by sfs-ml-3.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1uTriX-0005gl-Nx;
	Tue, 24 Jun 2025 00:40:53 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-3.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <patchwork-bot+f2fs@kernel.org>) id 1uTriM-0005gP-4z
 for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 24 Jun 2025 00:40:42 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Cc:To:In-Reply-To:References:Date:Message-Id:From:
 Subject:Content-Transfer-Encoding:MIME-Version:Content-Type:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=JhIzg7IzeRx0eJiMA4rfy7f5q6Ny3o/hPa+RufO4Ql0=; b=JCa7CIiS7REyGyNSi+U5BsZefP
 sQuFFt+Qqh68vqix5d4B0SRDI3eyYPJ+J4Jof+wIbuhFmNCpsasnRogZoByAlttD/P6DYUU84Lgko
 EMNK0qHb4BgFUDKEExXB0vae/ouCiQc9huwbVR5HbsT+x9qoXiuXNnh9kEg7e/EoLYHc=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ; h=Cc:To:In-Reply-To:References:Date:Message-Id:From:Subject:
 Content-Transfer-Encoding:MIME-Version:Content-Type:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=JhIzg7IzeRx0eJiMA4rfy7f5q6Ny3o/hPa+RufO4Ql0=; b=Gl+wgFh6pKiZnkxIdBbtf5CDN/
 IcSg+Lq636f8IdvX6BpeCkCoB383M8+6w64VYuQgnKApskU4CT0AOnM98R8TD43+DOPt2WsE6SZ28
 ORAeEOA/QUmZROEd7Q7K/rWt9sQrViNsUH/TmQZzrcsHRtb5Qq2EdLUmybOnLlbK3zFo=;
Received: from nyc.source.kernel.org ([147.75.193.91])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1uTriL-0006yX-MY for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 24 Jun 2025 00:40:42 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id 0802FA51330
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Tue, 24 Jun 2025 00:40:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A8F3FC4CEEA;
 Tue, 24 Jun 2025 00:40:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1750725630;
 bh=w3sB/FWB8UBbQCbXByGpeZ5sAhquoadRiHzXW3UWkI4=;
 h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
 b=JqB0aNaYV/FpjQehU4DA/AY2E8KTHPg/D6oM52w1ulDlQZ7sLxkd0hsVDXQ/lDzDd
 lqxHDyZlrjHlOoIfqTk0U9hlkA3aA/KSq/06ypnrTdOjwjtLbgHG5gF28DE5xi9b4j
 bwAfR+8tdSs8pAze7x/9vbJt4jIB5TVvshv3IWrdxR+RMCkoTEiYxlydPYA1pOuv7g
 b8Bcq23zhbdjS/UYveQxgD92J2rWKZP2OaagTkDaOLsZAl1hi76VjvRbHT9NfqOti9
 4yRwkCjcG5d6ourqEyhTgtRfo5r8LldPSFuk5D79OwVf9bb824ws2z+9ESRwNcHGwS
 nXhlBDxsXRdnQ==
Received: from [10.30.226.235] (localhost [IPv6:::1])
 by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id
 EAC8339FEB7D; Tue, 24 Jun 2025 00:40:58 +0000 (UTC)
MIME-Version: 1.0
Message-Id: <175072565749.3346761.771322544902669081.git-patchwork-notify@kernel.org>
Date: Tue, 24 Jun 2025 00:40:57 +0000
References: <20250610031315.1067993-1-chao@kernel.org>
In-Reply-To: <20250610031315.1067993-1-chao@kernel.org>
To: Chao Yu <chao@kernel.org>
X-Spam-Score: -0.3 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-1.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  Hello: This patch was applied to jaegeuk/f2fs.git (dev) by
 Jaegeuk Kim <jaegeuk@kernel.org>: On Tue, 10 Jun 2025 11:13:15 +0800 you
 wrote: > F2FS-fs (dm-55): access invalid blkaddr:972878540 > Call trace: >
 dump_backtrace+0xec/0x128 > show_stack+0x18/0x28 > dump_stack_lvl+0x40/0x88
 > dump_sta [...] 
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
X-Headers-End: 1uTriL-0006yX-MY
Subject: Re: [f2fs-dev] [PATCH] f2fs: do sanity check on fio.new_blkaddr in
 do_write_page()
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

On Tue, 10 Jun 2025 11:13:15 +0800 you wrote:
> F2FS-fs (dm-55): access invalid blkaddr:972878540
> Call trace:
>  dump_backtrace+0xec/0x128
>  show_stack+0x18/0x28
>  dump_stack_lvl+0x40/0x88
>  dump_stack+0x18/0x24
>  __f2fs_is_valid_blkaddr+0x360/0x3b4
>  f2fs_is_valid_blkaddr+0x10/0x20
>  f2fs_get_node_info+0x21c/0x60c
>  __write_node_page+0x15c/0x734
>  f2fs_sync_node_pages+0x4f8/0x700
>  f2fs_write_checkpoint+0x4a8/0x99c
>  __checkpoint_and_complete_reqs+0x7c/0x20c
>  issue_checkpoint_thread+0x4c/0xd8
>  kthread+0x11c/0x1b0
>  ret_from_fork+0x10/0x20
> 
> [...]

Here is the summary with links:
  - [f2fs-dev] f2fs: do sanity check on fio.new_blkaddr in do_write_page()
    https://git.kernel.org/jaegeuk/f2fs/c/70b6e8500431

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html




_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
