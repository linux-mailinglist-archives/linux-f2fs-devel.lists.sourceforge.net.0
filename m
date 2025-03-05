Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id AE24CA4F9B3
	for <lists+linux-f2fs-devel@lfdr.de>; Wed,  5 Mar 2025 10:16:48 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1tpkrt-0000NM-ET;
	Wed, 05 Mar 2025 09:16:45 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <chao@kernel.org>) id 1tpkro-0000NC-FW
 for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 05 Mar 2025 09:16:40 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 From:References:To:Subject:Cc:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=3Yo6bye2FShW/iKAVk48q12jl7rm0SVn5LQLD1kmIsM=; b=NFO+l2T+Gp/Uu4CCSL4KtHvkfr
 Opq+arFQTOO4/aUKVfDUdEgv0DAGJgtKVEq7NFh/VUdhuXEUzW91Riu0qSTJ16xGUL1185JreDasc
 k0WkGSDrTKwOb+1Gvbr3EP+9HyaUdOMm6P4HGuHIiLFvJAyN2fjx5q/Ikudge2owuMvE=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:To:
 Subject:Cc:MIME-Version:Date:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=3Yo6bye2FShW/iKAVk48q12jl7rm0SVn5LQLD1kmIsM=; b=I9IuaYY7naxpwjeonPcXVpXW1T
 nPJB9AKee6920zjSLI0gvr20LTHzph0HR0h1u8p2zKCUYZDg4CWFtaQqFiXeX2vXVu5vHDLVdc6ij
 pQngZNMepZQeTedebjJd6n5I4SfHZOpsCEZ72eGyb/9kEc3leVokO6Y3d8qfrW9yy11Y=;
Received: from nyc.source.kernel.org ([147.75.193.91])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1tpkro-0000jF-2r for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 05 Mar 2025 09:16:40 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id 90F4CA45218;
 Wed,  5 Mar 2025 09:10:58 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E0479C4CEE2;
 Wed,  5 Mar 2025 09:16:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1741166189;
 bh=kJfhrOkYBZK257yyh7KPJtYTba5DWjhEPU1ijD/QhwE=;
 h=Date:Cc:Subject:To:References:From:In-Reply-To:From;
 b=eSyL9xcrA7P7YdahqoF3nfZyKoTGnSQrPbOKz0CpsOlsDlhavhc+lFN/DPQXKR9k9
 JDMyhb0b6FCEXM8DGG/3J694oVM4JSZQ4+iJ5iaTeKnsnDHBYqJVYc9E228feEdwsa
 FN+Z4sEweoBZOhbXlNLZXHAJ0YzSUPFONOmq2JnrCkeoKcOL9V5vWT/6j6um9NtkvA
 Kegbbs5fPqPfJpxCPus+R21HM+Xa9P38UsFEJDnMuSfxfoSRV/AneESBuyVYDoLnqF
 +o+NNOCmpVrho2c0HeH65AwTx1KnzkpJ3knvxoXZ6oC7HdVmcBzW6UBwj8yNEi/YSs
 p51U3hkSgEDpA==
Message-ID: <9be24599-39de-4440-bd49-8f0629fa8a2b@kernel.org>
Date: Wed, 5 Mar 2025 17:16:25 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: jaegeuk@kernel.org
References: <20250224102923.93758-1-chao@kernel.org>
Content-Language: en-US
In-Reply-To: <20250224102923.93758-1-chao@kernel.org>
X-Spam-Score: -2.5 (--)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  Jaegeuk, missed to check this patch? On 2/24/25 18:29, Chao
 Yu wrote: > syzbot reports a f2fs bug as below: > > F2FS-fs (loop3): Stopped
 filesystem due to reason: 7 > kworker/u8:7: attempt to access beyond end
 of device > BUG: unable to [...] 
 Content analysis details:   (-2.5 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -2.3 RCVD_IN_DNSWL_MED      RBL: Sender listed at https://www.dnswl.org/,
 medium trust [147.75.193.91 listed in list.dnswl.org]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 0.0 RCVD_IN_VALIDITY_SAFE_BLOCKED RBL: ADMINISTRATOR NOTICE: The
 query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [147.75.193.91 listed in sa-accredit.habeas.com]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 RCVD_IN_VALIDITY_RPBL_BLOCKED RBL: ADMINISTRATOR NOTICE: The
 query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [147.75.193.91 listed in bl.score.senderscore.com]
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1tpkro-0000jF-2r
Subject: Re: [f2fs-dev] [PATCH v2] f2fs: fix to avoid accessing
 uninitialized curseg
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
From: Chao Yu via Linux-f2fs-devel <linux-f2fs-devel@lists.sourceforge.net>
Reply-To: Chao Yu <chao@kernel.org>
Cc: linux-kernel@vger.kernel.org,
 syzbot+b6b347b7a4ea1b2e29b6@syzkaller.appspotmail.com,
 linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

Jaegeuk, missed to check this patch?

On 2/24/25 18:29, Chao Yu wrote:
> syzbot reports a f2fs bug as below:
> 
> F2FS-fs (loop3): Stopped filesystem due to reason: 7
> kworker/u8:7: attempt to access beyond end of device
> BUG: unable to handle page fault for address: ffffed1604ea3dfa
> RIP: 0010:get_ckpt_valid_blocks fs/f2fs/segment.h:361 [inline]
> RIP: 0010:has_curseg_enough_space fs/f2fs/segment.h:570 [inline]
> RIP: 0010:__get_secs_required fs/f2fs/segment.h:620 [inline]
> RIP: 0010:has_not_enough_free_secs fs/f2fs/segment.h:633 [inline]
> RIP: 0010:has_enough_free_secs+0x575/0x1660 fs/f2fs/segment.h:649
>  <TASK>
>  f2fs_is_checkpoint_ready fs/f2fs/segment.h:671 [inline]
>  f2fs_write_inode+0x425/0x540 fs/f2fs/inode.c:791
>  write_inode fs/fs-writeback.c:1525 [inline]
>  __writeback_single_inode+0x708/0x10d0 fs/fs-writeback.c:1745
>  writeback_sb_inodes+0x820/0x1360 fs/fs-writeback.c:1976
>  wb_writeback+0x413/0xb80 fs/fs-writeback.c:2156
>  wb_do_writeback fs/fs-writeback.c:2303 [inline]
>  wb_workfn+0x410/0x1080 fs/fs-writeback.c:2343
>  process_one_work kernel/workqueue.c:3236 [inline]
>  process_scheduled_works+0xa66/0x1840 kernel/workqueue.c:3317
>  worker_thread+0x870/0xd30 kernel/workqueue.c:3398
>  kthread+0x7a9/0x920 kernel/kthread.c:464
>  ret_from_fork+0x4b/0x80 arch/x86/kernel/process.c:148
>  ret_from_fork_asm+0x1a/0x30 arch/x86/entry/entry_64.S:244
> 
> Commit 8b10d3653735 ("f2fs: introduce FAULT_NO_SEGMENT") allows to trigger
> no free segment fault in allocator, then it will update curseg->segno to
> NULL_SEGNO, though, CP_ERROR_FLAG has been set, f2fs_write_inode() missed
> to check the flag, and access invalid curseg->segno directly in below call
> path, then resulting in panic:
> 
> - f2fs_write_inode
>  - f2fs_is_checkpoint_ready
>   - has_enough_free_secs
>    - has_not_enough_free_secs
>     - __get_secs_required
>      - has_curseg_enough_space
>       - get_ckpt_valid_blocks
>       : access invalid curseg->segno
> 
> To avoid this issue, let's:
> - check CP_ERROR_FLAG flag in prior to f2fs_is_checkpoint_ready() in
> f2fs_write_inode().
> - in has_curseg_enough_space(), save curseg->segno into a temp variable,
> and verify its validation before use.
> 
> Fixes: 8b10d3653735 ("f2fs: introduce FAULT_NO_SEGMENT")
> Reported-by: syzbot+b6b347b7a4ea1b2e29b6@syzkaller.appspotmail.com
> Closes: https://lore.kernel.org/all/67973c2b.050a0220.11b1bb.0089.GAE@google.com
> Signed-off-by: Chao Yu <chao@kernel.org>
> ---
> v2:
> - get rid of potential blocking on curseg_mutex
>  fs/f2fs/inode.c   | 7 +++++++
>  fs/f2fs/segment.h | 9 ++++++++-
>  2 files changed, 15 insertions(+), 1 deletion(-)
> 
> diff --git a/fs/f2fs/inode.c b/fs/f2fs/inode.c
> index d6ad7810df69..6aec752ac098 100644
> --- a/fs/f2fs/inode.c
> +++ b/fs/f2fs/inode.c
> @@ -793,6 +793,13 @@ int f2fs_write_inode(struct inode *inode, struct writeback_control *wbc)
>  		!is_inode_flag_set(inode, FI_DIRTY_INODE))
>  		return 0;
>  
> +	/*
> +	 * no need to update inode page, ultimately f2fs_evict_inode() will
> +	 * clear dirty status of inode.
> +	 */
> +	if (f2fs_cp_error(sbi))
> +		return -EIO;
> +
>  	if (!f2fs_is_checkpoint_ready(sbi)) {
>  		f2fs_mark_inode_dirty_sync(inode, true);
>  		return -ENOSPC;
> diff --git a/fs/f2fs/segment.h b/fs/f2fs/segment.h
> index 943be4f1d6d2..0465dc00b349 100644
> --- a/fs/f2fs/segment.h
> +++ b/fs/f2fs/segment.h
> @@ -559,13 +559,16 @@ static inline bool has_curseg_enough_space(struct f2fs_sb_info *sbi,
>  			unsigned int node_blocks, unsigned int data_blocks,
>  			unsigned int dent_blocks)
>  {
> -
>  	unsigned int segno, left_blocks, blocks;
>  	int i;
>  
>  	/* check current data/node sections in the worst case. */
>  	for (i = CURSEG_HOT_DATA; i < NR_PERSISTENT_LOG; i++) {
>  		segno = CURSEG_I(sbi, i)->segno;
> +
> +		if (unlikely(segno == NULL_SEGNO))
> +			return false;
> +
>  		left_blocks = CAP_BLKS_PER_SEC(sbi) -
>  				get_ckpt_valid_blocks(sbi, segno, true);
>  
> @@ -576,6 +579,10 @@ static inline bool has_curseg_enough_space(struct f2fs_sb_info *sbi,
>  
>  	/* check current data section for dentry blocks. */
>  	segno = CURSEG_I(sbi, CURSEG_HOT_DATA)->segno;
> +
> +	if (unlikely(segno == NULL_SEGNO))
> +		return false;
> +
>  	left_blocks = CAP_BLKS_PER_SEC(sbi) -
>  			get_ckpt_valid_blocks(sbi, segno, true);
>  	if (dent_blocks > left_blocks)



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
