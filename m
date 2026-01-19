Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 56EACD3AAC9
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 19 Jan 2026 14:54:31 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:To:In-Reply-To:References:Date:Message-Id:
	MIME-Version:Sender:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Jqz2/O2J5Je4JCWPmSpSp9v2y9xxjjqRNCjctLg+B1s=; b=BaMEen0i41sJoNOntlN9IPBJ2M
	CW4KprP/Y08rOGcE56/KuIeMRv+T6OMzN8vn8IB76Tkh5Rfpxs+8y65hwj9G/NS/w7RfDTMzT0HxK
	+d+vAQOSiYC5iMJhxHXOEqW67leuTkuGGHwCFkFfuacdcLvt5D+rlmBV8Dg/xEj7TEYY=;
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1vhpiA-0004ba-1k;
	Mon, 19 Jan 2026 13:54:30 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <patchwork-bot+f2fs@kernel.org>) id 1vhpi7-0004bT-QD
 for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 19 Jan 2026 13:54:27 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Cc:To:In-Reply-To:References:Date:Message-Id:From:
 Subject:Content-Transfer-Encoding:MIME-Version:Content-Type:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=RZzlHTdVJGVZAxiPgcPhPfn0qFObfiKfqGXc8yuD85s=; b=Af5SABPI8rorUT3Yk9m4fyHucA
 fRiQZ5wF3paRjq8VA6gxHU1UW75i+hE24btUxarbBZyM6UidHJcekNB4K5nrqPol+9ScxhthNGZxq
 PRwfe9xowgIdXq4IyFRP751YOhKCg4T1yw4JMkXAZruyP7sSaSVcwHAC/91mh8KrJ72U=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ; h=Cc:To:In-Reply-To:References:Date:Message-Id:From:Subject:
 Content-Transfer-Encoding:MIME-Version:Content-Type:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=RZzlHTdVJGVZAxiPgcPhPfn0qFObfiKfqGXc8yuD85s=; b=kKa8xyn753hcbr+8+osT2eu7pi
 asF2f0fsu1AZR1tdgX+dqJRDAkP1hQKGIoKVOSIOFW3fQfu6Cb70CZ7zh+hf0iBlI0qrrxTI0QZmT
 6wklvEG5MtVTWIEC66kFJezV0q9VAl7Pa1f1sqniY5IenQP91IyUPaZOLdOokVSjOng4=;
Received: from sea.source.kernel.org ([172.234.252.31])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1vhpi7-0005r6-B1 for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 19 Jan 2026 13:54:27 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id 1250F43E36;
 Mon, 19 Jan 2026 13:54:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E5F8CC116C6;
 Mon, 19 Jan 2026 13:54:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1768830856;
 bh=UCcrN4g6ZzXkM+5m+tcl3ItNF1NqqQRbwaKWqRbYiTU=;
 h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
 b=HOiIoxtPlW2BzrowwYkgGoD8a5bqRa3Ypp+vPcZHy3xAtBBZVjlR+bIEsRjGe9Gur
 ZE2UFjYD8jGRC/PLeczC67h7+u+pkHzNpOPK2N5YobLAc4yscWEN2NyjBcQgyULcUo
 EKRKaGMoHThjwzlHojVS6xGSsBrUG8+rt0P4iMcBu4yuHb/FoOaO0DsHqkLfWd+9B2
 Ic6rZFoUfi1JUYXRyNsnkOauuJimxS4LQe71DpB0HhBHIfPU7OhB7UYTeeXAd0zsE1
 vy9VL1dmH+vauUsXvER836BRrkEQkXicLUKeEcGPCRmP+vF9zQVNa3IwM4VQpsuGyy
 d2wvRTGR84XDA==
Received: from [10.30.226.235] (localhost [IPv6:::1])
 by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id
 F28B93A54A38; Mon, 19 Jan 2026 13:50:47 +0000 (UTC)
MIME-Version: 1.0
Message-Id: <176883064677.1419958.15115865034651314152.git-patchwork-notify@kernel.org>
Date: Mon, 19 Jan 2026 13:50:46 +0000
References: <20260107112218.1789-1-chao@kernel.org>
In-Reply-To: <20260107112218.1789-1-chao@kernel.org>
To: Chao Yu <chao@kernel.org>
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-1.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  Hello: This patch was applied to jaegeuk/f2fs.git (dev) by
 Jaegeuk Kim <jaegeuk@kernel.org>: On Wed, 7 Jan 2026 19:22:18 +0800 you wrote:
 > As syzbot reported an use-after-free issue in f2fs_write_end_io(). > >
 It is caused by below race condition: > > loop device umount > - worker_thread
 > - [...] 
 Content analysis details:   (-0.2 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1vhpi7-0005r6-B1
Subject: Re: [f2fs-dev] [PATCH] f2fs: fix to avoid UAF in f2fs_write_end_io()
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
Cc: syzbot+b4444e3c972a7a124187@syzkaller.appspotmail.com, jaegeuk@kernel.org,
 linux-f2fs-devel@lists.sourceforge.net, stable@kernel.org,
 linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

Hello:

This patch was applied to jaegeuk/f2fs.git (dev)
by Jaegeuk Kim <jaegeuk@kernel.org>:

On Wed,  7 Jan 2026 19:22:18 +0800 you wrote:
> As syzbot reported an use-after-free issue in f2fs_write_end_io().
> 
> It is caused by below race condition:
> 
> loop device				umount
> - worker_thread
>  - loop_process_work
>   - do_req_filebacked
>    - lo_rw_aio
>     - lo_rw_aio_complete
>      - blk_mq_end_request
>       - blk_update_request
>        - f2fs_write_end_io
>         - dec_page_count
>         - folio_end_writeback
> 					- kill_f2fs_super
> 					 - kill_block_super
> 					  - f2fs_put_super
> 					 : free(sbi)
>        : get_pages(, F2FS_WB_CP_DATA)
>          accessed sbi which is freed
> 
> [...]

Here is the summary with links:
  - [f2fs-dev] f2fs: fix to avoid UAF in f2fs_write_end_io()
    https://git.kernel.org/jaegeuk/f2fs/c/ce2739e482bc

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html




_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
