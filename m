Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 141F9A353BE
	for <lists+linux-f2fs-devel@lfdr.de>; Fri, 14 Feb 2025 02:35:29 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1tikbw-0001gV-KN;
	Fri, 14 Feb 2025 01:35:21 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <chao@kernel.org>) id 1tikbu-0001gM-8K
 for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 14 Feb 2025 01:35:18 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 From:References:To:Subject:Cc:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=bV2hDQE53sYKcYmwv0OhOV6jkG5qJjOS8v+FT4zElSI=; b=hhBOS/cD3+E9afANeTT/BBFEX1
 GYQTOchauLxuKPNUiGVRfdGU1IrlKkxcrgwY4kZtTeIo9G+Kxim7FpE21Yo82MI+PLaMF1w9dPK0E
 b7xJJgWfpwr9KJ/tEHXMECOI2QZzdjYqYx6GxnRHX46v2dlkIwdEBjkdGoFdtGiwpkjw=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:To:
 Subject:Cc:MIME-Version:Date:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=bV2hDQE53sYKcYmwv0OhOV6jkG5qJjOS8v+FT4zElSI=; b=cprqesxhA9JnyVBsjBGQfO7m46
 u6zSc/WpZ4ZE+ZFPYaY9pUGEEkKG6ImjRr9fF7FDuNWRAc9BGxs+3zXFjPYhnlr1+U5LCt0AF4hla
 0qIstSKVAQCxVWmRTVN6pLKPFvwXHHEF73BZBHXhOUcuXQs2tC1pD0ch24WUxnCPZ8Nk=;
Received: from nyc.source.kernel.org ([147.75.193.91])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1tikbt-0004Vd-RP for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 14 Feb 2025 01:35:18 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id 9B495A42A02;
 Fri, 14 Feb 2025 01:33:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BA1E5C4CED1;
 Fri, 14 Feb 2025 01:35:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1739496911;
 bh=CADuvBrVBIT5LuqPjR3kLYoWYDmCrsfTi2YERJfMO3s=;
 h=Date:Cc:Subject:To:References:From:In-Reply-To:From;
 b=IqGyRiipNhvUJ0BRBKvBKxg6WD1mZbcYHtLqxPY05xhjvW4GZ/scX6Xxo0o9CH6Bh
 jL+IzjcPraL0WIV+pz3tV4mxujZUuwPXCczRlj5DoYY9JSON2f5j8bfVgSL8YdCq2r
 17qQ3b0lgQxjd/p1lUoxp/JwmuqxO2BmBvSzSKTvUwIWGqnF6pWzLxKGrU9Uqn6KnN
 cU5+AX6eiApAy4kBIEcV99mToB0jd0n9n0g5+NycaB9YLSygRw9muYNAWgeVLUdF/V
 VLmBDgqbZpKcRI765fc6VVbIE5dx8E4JnkUL7d2nO4LBI+SZi+AdSnuuBwaDgjnP12
 8LnQnPcIJ5zww==
Message-ID: <bdda86bd-3977-4c77-b8d5-b37feda9e98a@kernel.org>
Date: Fri, 14 Feb 2025 09:35:08 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Jaegeuk Kim <jaegeuk@kernel.org>
References: <20250212075242.988652-1-chao@kernel.org>
 <Z64zcac0_dw1_rML@google.com>
Content-Language: en-US
In-Reply-To: <Z64zcac0_dw1_rML@google.com>
X-Spam-Score: -4.0 (----)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 2/14/25 02:01, Jaegeuk Kim wrote: > On 02/12,
 Chao Yu wrote:
 >> syzbot reports a f2fs bug as below: >> >> F2FS-fs (loop3): Stopped
 filesystem
 due to reason: 7 >> kworker/u8:7: attempt to access bey [...] 
 Content analysis details:   (-4.0 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 0.0 RCVD_IN_VALIDITY_CERTIFIED_BLOCKED RBL: ADMINISTRATOR NOTICE:
 The query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [147.75.193.91 listed in sa-trusted.bondedsender.org]
 0.0 RCVD_IN_VALIDITY_RPBL_BLOCKED RBL: ADMINISTRATOR NOTICE: The
 query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [147.75.193.91 listed in bl.score.senderscore.com]
 -2.3 RCVD_IN_DNSWL_MED      RBL: Sender listed at https://www.dnswl.org/,
 medium trust [147.75.193.91 listed in list.dnswl.org]
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -1.5 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1tikbt-0004Vd-RP
Subject: Re: [f2fs-dev] [PATCH] f2fs: fix to avoid accessing uninitialized
 curseg
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

On 2/14/25 02:01, Jaegeuk Kim wrote:
> On 02/12, Chao Yu wrote:
>> syzbot reports a f2fs bug as below:
>>
>> F2FS-fs (loop3): Stopped filesystem due to reason: 7
>> kworker/u8:7: attempt to access beyond end of device
>> BUG: unable to handle page fault for address: ffffed1604ea3dfa
>> RIP: 0010:get_ckpt_valid_blocks fs/f2fs/segment.h:361 [inline]
>> RIP: 0010:has_curseg_enough_space fs/f2fs/segment.h:570 [inline]
>> RIP: 0010:__get_secs_required fs/f2fs/segment.h:620 [inline]
>> RIP: 0010:has_not_enough_free_secs fs/f2fs/segment.h:633 [inline]
>> RIP: 0010:has_enough_free_secs+0x575/0x1660 fs/f2fs/segment.h:649
>>  <TASK>
>>  f2fs_is_checkpoint_ready fs/f2fs/segment.h:671 [inline]
>>  f2fs_write_inode+0x425/0x540 fs/f2fs/inode.c:791
>>  write_inode fs/fs-writeback.c:1525 [inline]
>>  __writeback_single_inode+0x708/0x10d0 fs/fs-writeback.c:1745
>>  writeback_sb_inodes+0x820/0x1360 fs/fs-writeback.c:1976
>>  wb_writeback+0x413/0xb80 fs/fs-writeback.c:2156
>>  wb_do_writeback fs/fs-writeback.c:2303 [inline]
>>  wb_workfn+0x410/0x1080 fs/fs-writeback.c:2343
>>  process_one_work kernel/workqueue.c:3236 [inline]
>>  process_scheduled_works+0xa66/0x1840 kernel/workqueue.c:3317
>>  worker_thread+0x870/0xd30 kernel/workqueue.c:3398
>>  kthread+0x7a9/0x920 kernel/kthread.c:464
>>  ret_from_fork+0x4b/0x80 arch/x86/kernel/process.c:148
>>  ret_from_fork_asm+0x1a/0x30 arch/x86/entry/entry_64.S:244
>>
>> Commit 8b10d3653735 ("f2fs: introduce FAULT_NO_SEGMENT") allows to trigger
>> no free segment fault in allocator, then it will update curseg->segno to
>> NULL_SEGNO, though, CP_ERROR_FLAG has been set, f2fs_write_inode() missed
>> to check the flag, and access invalid curseg->segno directly in below call
>> path, then resulting in panic:
>>
>> - f2fs_write_inode
>>  - f2fs_is_checkpoint_ready
>>   - has_enough_free_secs
>>    - has_not_enough_free_secs
>>     - __get_secs_required
>>      - has_curseg_enough_space
>>       - get_ckpt_valid_blocks
>>       : access invalid curseg->segno
>>
>> To avoid this issue, let's:
>> - check CP_ERROR_FLAG flag in prior to f2fs_is_checkpoint_ready() in
>> f2fs_write_inode().
>> - in has_curseg_enough_space(), a) verify status of curseg before accessing
>> its field, and b) grab curseg_mutex lock to avoid race condition.
>>
>> Fixes: 8b10d3653735 ("f2fs: introduce FAULT_NO_SEGMENT")
>> Reported-by: syzbot+b6b347b7a4ea1b2e29b6@syzkaller.appspotmail.com
>> Closes: https://lore.kernel.org/all/67973c2b.050a0220.11b1bb.0089.GAE@google.com
>> Signed-off-by: Chao Yu <chao@kernel.org>
>> ---
>>  fs/f2fs/inode.c   |  7 +++++++
>>  fs/f2fs/segment.h | 27 ++++++++++++++++++++++-----
>>  2 files changed, 29 insertions(+), 5 deletions(-)
>>
>> diff --git a/fs/f2fs/inode.c b/fs/f2fs/inode.c
>> index 02f1b69d03d8..5c1b515eab36 100644
>> --- a/fs/f2fs/inode.c
>> +++ b/fs/f2fs/inode.c
>> @@ -799,6 +799,13 @@ int f2fs_write_inode(struct inode *inode, struct writeback_control *wbc)
>>  		!is_inode_flag_set(inode, FI_DIRTY_INODE))
>>  		return 0;
>>  
>> +	/*
>> +	 * no need to update inode page, ultimately f2fs_evict_inode() will
>> +	 * clear dirty status of inode.
>> +	 */
>> +	if (f2fs_cp_error(sbi))
>> +		return -EIO;
>> +
>>  	if (!f2fs_is_checkpoint_ready(sbi)) {
>>  		f2fs_mark_inode_dirty_sync(inode, true);
>>  		return -ENOSPC;
>> diff --git a/fs/f2fs/segment.h b/fs/f2fs/segment.h
>> index 943be4f1d6d2..e9fcf2b85b76 100644
>> --- a/fs/f2fs/segment.h
>> +++ b/fs/f2fs/segment.h
>> @@ -559,15 +559,23 @@ static inline bool has_curseg_enough_space(struct f2fs_sb_info *sbi,
>>  			unsigned int node_blocks, unsigned int data_blocks,
>>  			unsigned int dent_blocks)
>>  {
>> -
>> +	struct curseg_info *curseg;
>>  	unsigned int segno, left_blocks, blocks;
>>  	int i;
>>  
>>  	/* check current data/node sections in the worst case. */
>>  	for (i = CURSEG_HOT_DATA; i < NR_PERSISTENT_LOG; i++) {
>> -		segno = CURSEG_I(sbi, i)->segno;
>> -		left_blocks = CAP_BLKS_PER_SEC(sbi) -
>> +		curseg = CURSEG_I(sbi, i);
>> +
>> +		mutex_lock(&curseg->curseg_mutex);
>> +		if (!curseg->inited || curseg->segno == NULL_SEGNO) {
>> +			left_blocks = 0;
>> +		} else {
>> +			segno = curseg->segno;
>> +			left_blocks = CAP_BLKS_PER_SEC(sbi) -
>>  				get_ckpt_valid_blocks(sbi, segno, true);
>> +		}
>> +		mutex_unlock(&curseg->curseg_mutex);
> 
> This looks a bit worrisome, as it'll block user-facing allocation. Can we
> have another way to prevent the issue?

How about this? It'll be fine to use a temp valid segno in
get_ckpt_valid_blocks(), it can get rid of curseg_mutex use.

segno = CURSEG_I(sbi, i)->segno;
if (!curseg->inited || segno == NULL_SEGNO) {
	left_blocks = 0;
} else {
	...

Thanks,

> 
>>  
>>  		blocks = i <= CURSEG_COLD_DATA ? data_blocks : node_blocks;
>>  		if (blocks > left_blocks)
>> @@ -575,9 +583,18 @@ static inline bool has_curseg_enough_space(struct f2fs_sb_info *sbi,
>>  	}
>>  
>>  	/* check current data section for dentry blocks. */
>> -	segno = CURSEG_I(sbi, CURSEG_HOT_DATA)->segno;
>> -	left_blocks = CAP_BLKS_PER_SEC(sbi) -
>> +	curseg = CURSEG_I(sbi, CURSEG_HOT_DATA);
>> +
>> +	mutex_lock(&curseg->curseg_mutex);
>> +	if (!curseg->inited || curseg->segno == NULL_SEGNO) {
>> +		left_blocks = 0;
>> +	} else {
>> +		segno = curseg->segno;
>> +		left_blocks = CAP_BLKS_PER_SEC(sbi) -
>>  			get_ckpt_valid_blocks(sbi, segno, true);
>> +	}
>> +	mutex_unlock(&curseg->curseg_mutex);
>> +
>>  	if (dent_blocks > left_blocks)
>>  		return false;
>>  	return true;
>> -- 
>> 2.48.1.502.g6dc24dfdaf-goog



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
