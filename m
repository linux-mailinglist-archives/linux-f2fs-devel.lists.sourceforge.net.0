Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 8BD2ECDE3B0
	for <lists+linux-f2fs-devel@lfdr.de>; Fri, 26 Dec 2025 03:23:33 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Type:Content-Transfer-Encoding:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:In-Reply-To:References:To:MIME-Version:Date:
	Message-ID:Sender:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=4uMxK7qVyyaWZrGCPkueAWuo0ffCZpmeHkWe4hZbZhE=; b=gJmbf9Og16AvVLWaarnnLLFk0n
	2xfHGA6FD4Ljn5jTJYBpNe7KWjzpTdmXZy82BwYtPDbChQ5N5qEq0MqoqIy3e71aVIRpyGs2vSt8X
	7NbWyy91W5DG4bfqzGcGIXvnFzVm8x/mGpqTNhaB48i4eUoupLZ9T1mUtCVjfz/tofXQ=;
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1vYxUF-0006dH-U0;
	Fri, 26 Dec 2025 02:23:27 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <chao@kernel.org>) id 1vYxUE-0006dB-Lg
 for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 26 Dec 2025 02:23:26 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 From:References:To:Subject:Cc:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=giYRTdMP4cVcM82pUO/GkfZNme8TyeRD/DkByQgjLnQ=; b=aWfwRXhyV1IYiURMrz2We+FO8T
 W7s4Nm/iKLgFs+3g0zzncPSsdmct533d0Af1Hiq6FbwaKUKP89mmgWLQhwAUZOivoTCcvlzO1JPWC
 QoD2OHlu8AcYFr6xX5J9Wl9tPxkHmQ3D1bHL20QRraQF2rXL7swxx7VLOMiKQUtDFUC8=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:To:
 Subject:Cc:MIME-Version:Date:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=giYRTdMP4cVcM82pUO/GkfZNme8TyeRD/DkByQgjLnQ=; b=fNEBUpvh5UkxATznmRKXB+f0g1
 2xtO8hiDLup3ifuwDBAQOceILsbPyhBUhQTa7x1qHZtggC6C4JL5StbjxsNEGH0goShA4MMpQsLc9
 6moMI3bzCrz75oBi2iDgAvs9WLegMVaw8dmB4schJPUeQb8ash5xDoNVLUbF7WvKQahk=;
Received: from tor.source.kernel.org ([172.105.4.254])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1vYxUD-0006Fk-WE for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 26 Dec 2025 02:23:26 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 5753A6000A;
 Fri, 26 Dec 2025 02:23:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4F5C2C4CEF1;
 Fri, 26 Dec 2025 02:23:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1766715795;
 bh=mg8ndmgzuTqyeWdRBJm+GmIUFdX2Mpt74j1QPYzE2io=;
 h=Date:Cc:Subject:To:References:From:In-Reply-To:From;
 b=OQEacyAgrC9uxP9YQ/oYrrraCb36HuCdjpHnmkyzqcha2zx3qxwMpgsONGYJlXUp/
 qPmC3rVd97v76o4VdvxLEQFtCnmPo/x3p4UBxxRxXQVwgcEu+mAVaAJtEZ13Gom1Ph
 MQaX03Ok6rBlhlBh85Qw27sFXfogWFoXgI0QkdXwh8AX4JNMlLgtkZuPuG5D3cj5L3
 dChRYmHuFTDFBzzzXLrt1UDXs8l8mxvQIhl7JNxd0WMfH6wei+gMtMTLnoQRvyagL9
 UNhESlRfxtV2MzYKotk06ft+mbn8MioYflbnnEAYFUSfCnHzLKE4357P/rMyjHdLCD
 exNWwom97P6pw==
Message-ID: <c34d413c-755c-4248-8aab-c891577d4b21@kernel.org>
Date: Fri, 26 Dec 2025 10:23:18 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Yongpeng Yang <yangyongpeng.storage@gmail.com>,
 Jaegeuk Kim <jaegeuk@kernel.org>
References: <20251224131634.3860115-2-yangyongpeng.storage@gmail.com>
Content-Language: en-US
In-Reply-To: <20251224131634.3860115-2-yangyongpeng.storage@gmail.com>
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-2.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 12/24/2025 9:16 PM, Yongpeng Yang wrote: > From: Yongpeng
 Yang <yangyongpeng@xiaomi.com> Nice catch! > > During SPO tests, when mounting
 F2FS, an -EINVAL error was returned from > f2fs_recover_inode_page. The issue
 occurred under the following scenario > > Thread A Thread B >
 f2fs_ioc_commit_atomic_w [...] 
 Content analysis details:   (-0.2 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1vYxUD-0006Fk-WE
Subject: Re: [f2fs-dev] [PATCH 1/1] f2fs: fix IS_CHECKPOINTED flag
 inconsistency issue caused by concurrent atomic commit and checkpoint
 writes
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
Cc: Yongpeng Yang <yangyongpeng@xiaomi.com>, Sheng Yong <shengyong1@xiaomi.com>,
 linux-f2fs-devel@lists.sourceforge.net,
 Yongpeng Yang <yangyongpeng.storage@outlook.com>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On 12/24/2025 9:16 PM, Yongpeng Yang wrote:
> From: Yongpeng Yang <yangyongpeng@xiaomi.com>

Nice catch!

> 
> During SPO tests, when mounting F2FS, an -EINVAL error was returned from
> f2fs_recover_inode_page. The issue occurred under the following scenario
> 
> Thread A                                     Thread B
> f2fs_ioc_commit_atomic_write
>   - f2fs_do_sync_file // atomic = true
>    - f2fs_fsync_node_pages
>      : last_folio = inode folio
>      : schedule before folio_lock(last_folio) f2fs_write_checkpoint
>                                                - block_operations// writeback last_folio
>                                                - schedule before f2fs_flush_nat_entries
>      : set_fsync_mark(last_folio, 1)
>      : set_dentry_mark(last_folio, 1)
>      : folio_mark_dirty(last_folio)
>      : __write_node_folio(last_folio)

What do you think of relocating set_fsync_mark & set_dentry_mark logic
into __write_node_folio(), so that we can cover them w/ existed .node_write
lock in __write_node_folio(), it can avoid checkpoint racing as well.

>                                                - f2fs_flush_nat_entries
>                                                  : {struct nat_entry}->flag |= BIT(IS_CHECKPOINTED)
>                                               SPO
> 
> Thread A calls f2fs_need_dentry_mark(sbi, ino), and the last_folio has
> already been written once. However, the {struct nat_entry}->flag did not
> have the IS_CHECKPOINTED set, causing set_dentry_mark(last_folio, 1) and
> write last_folio again.
> 
> After SPO and reboot, it was detected that {struct node_info}->blk_addr
> was not NULL_ADDR because Thread B successfully write the checkpoint.
> 
> This issue only occurs in atomic write scenarios, and does not affect

If atomic is false, we will encounter such issue as well? or am I missing
something?

			if (!atomic || folio == last_folio) {
				set_fsync_mark(folio, 1);
				percpu_counter_inc(&sbi->rf_node_block_count);
				if (IS_INODE(folio)) {
					if (is_inode_flag_set(inode,
								FI_DIRTY_INODE))
						f2fs_update_inode(inode, folio);
					set_dentry_mark(folio,
						f2fs_need_dentry_mark(sbi, ino));
				}
				/* may be written by other thread */
				if (!folio_test_dirty(folio))
					folio_mark_dirty(folio);
			}

Thanks,

> regular file fsync operations. Therefore, for atomic file fsync,
> sbi->cp_rwsem should be acquired to ensure that the IS_CHECKPOINTED flag
> correctly indicates that the checkpoint write has been completed.
> 
> Fixes: 608514deba38 ("f2fs: set fsync mark only for the last dnode")
> Signed-off-by: Sheng Yong <shengyong1@xiaomi.com>
> Signed-off-by: Yongpeng Yang <yangyongpeng@xiaomi.com>
> ---
>   fs/f2fs/node.c | 8 +++++++-
>   1 file changed, 7 insertions(+), 1 deletion(-)
> 
> diff --git a/fs/f2fs/node.c b/fs/f2fs/node.c
> index 482a362f2625..e482a38444f1 100644
> --- a/fs/f2fs/node.c
> +++ b/fs/f2fs/node.c
> @@ -1854,7 +1854,7 @@ int f2fs_fsync_node_pages(struct f2fs_sb_info *sbi, struct inode *inode,
>   	struct folio_batch fbatch;
>   	int ret = 0;
>   	struct folio *last_folio = NULL;
> -	bool marked = false;
> +	bool marked = false, locked = false;
>   	nid_t ino = inode->i_ino;
>   	int nr_folios;
>   	int nwritten = 0;
> @@ -1889,6 +1889,10 @@ int f2fs_fsync_node_pages(struct f2fs_sb_info *sbi, struct inode *inode,
>   			if (ino_of_node(folio) != ino)
>   				continue;
>   
> +			if (atomic && folio == last_folio) {
> +				f2fs_lock_op(sbi);
> +				locked = true;
> +			}
>   			folio_lock(folio);
>   
>   			if (unlikely(!is_node_folio(folio))) {
> @@ -1959,6 +1963,8 @@ int f2fs_fsync_node_pages(struct f2fs_sb_info *sbi, struct inode *inode,
>   		goto retry;
>   	}
>   out:
> +	if (locked)
> +		f2fs_unlock_op(sbi);
>   	if (nwritten)
>   		f2fs_submit_merged_write_cond(sbi, NULL, NULL, ino, NODE);
>   	return ret;



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
