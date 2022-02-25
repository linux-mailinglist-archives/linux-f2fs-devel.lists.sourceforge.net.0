Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id EE3484C3B65
	for <lists+linux-f2fs-devel@lfdr.de>; Fri, 25 Feb 2022 03:07:24 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.94.2)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1nNQ0v-0007Nv-WC; Fri, 25 Feb 2022 02:07:20 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <chao@kernel.org>) id 1nNQ0u-0007Np-4Q
 for linux-f2fs-devel@lists.sourceforge.net; Fri, 25 Feb 2022 02:07:18 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 From:References:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:Cc:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=3WmfM2pUlnt7188Ub69UI1QgA0eOvVvpA57LCJfAhKg=; b=J/jtmjjZeJKzX744R1SNaNCnNq
 vtt/h72OXj/ZruifKIkU+pbLQkrpLxaoX8TUUl5t5ipCrusYvJ8L3kRbGuYLkUNb9cfhhw7afBU9K
 aJAIySfdx+ViIobgkyCkd0Cwk05/76K08kTjh3Qd7qTCDWZxGmgTk6iLTOZIEJUaRYXM=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:To:
 Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:Cc:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=3WmfM2pUlnt7188Ub69UI1QgA0eOvVvpA57LCJfAhKg=; b=iaEB7kvouikZYz9OCX0SJjwjAq
 Twkp1PG5OCI79O4vgGI6O+dpVe/J6mC/e0f4mo3eIft+NPQUsA3DT5EevDI1ocnz9K1rw0HdIutdW
 jXeANqbXjkBfOjg9JDxf1FRpH6lwq6rxhjYlYmNUAqT3x5GUTHKQJgKp4EL1Vn+71nXM=;
Received: from dfw.source.kernel.org ([139.178.84.217])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.94.2)
 id 1nNQ0q-0000wW-Rx
 for linux-f2fs-devel@lists.sourceforge.net; Fri, 25 Feb 2022 02:07:18 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 4640D614E1
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Fri, 25 Feb 2022 02:07:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D1558C340E9;
 Fri, 25 Feb 2022 02:07:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1645754829;
 bh=/rNQ7PbKEORHE5W8GJIvYASYkIGdvtgnf4kTnIWSLT8=;
 h=Date:Subject:To:References:From:In-Reply-To:From;
 b=St8PhKgwZ/GyOhZlZ3X5+XNwAIEq6ci5VE5YkA6vSDe36hxMbhS9vERuLk5tTqJ/C
 i7J+1mvJedSea1EFwpe2hQ0sAn6VVmFi7rGfr3APAcPmdi0juTVOx7wGxIKCTacZQW
 T83t3zQUqsI6rB7eei+1rdZu6IGLMKOYwdjTJirggVxDan1X8eWHA4ZJ9N2hKmSKnr
 A4P0QWomTjsXZRKxu6ANRhFqt1PmqMFGUJma33okFcOSmhsgl1u78+1B2afPuFwJ6o
 TmEa2w7PPsFqzaN2EfJncc90YXBfKRp7p5jmYL3aO4UhLvOc7fpVovx/XkmIy2AQnr
 8HMbWsInYoOQA==
Message-ID: <119d1f9e-7f2f-019f-6fdd-2bdb59d97bc6@kernel.org>
Date: Fri, 25 Feb 2022 10:07:05 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.0
Content-Language: en-US
To: Jaegeuk Kim <jaegeuk@kernel.org>, linux-kernel@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net
References: <20220212142023.2508247-1-jaegeuk@kernel.org>
 <20220212142023.2508247-2-jaegeuk@kernel.org> <YgrlUzJyvgrFSREc@google.com>
From: Chao Yu <chao@kernel.org>
In-Reply-To: <YgrlUzJyvgrFSREc@google.com>
X-Spam-Score: -7.9 (-------)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 2022/2/15 7:27, Jaegeuk Kim wrote: > If one read IO is
 always failing, we can fall into an infinite loop in > f2fs_sync_dirty_inodes.
 This happens during xfstests/generic/475. > > [ 142.803335] Buf [...] 
 Content analysis details:   (-7.9 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [139.178.84.217 listed in list.dnswl.org]
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -2.0 NICE_REPLY_A           Looks like a legit reply (A)
 -0.7 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1nNQ0q-0000wW-Rx
Subject: Re: [f2fs-dev] [PATCH 2/2 v2] f2fs: avoid an infinite loop in
 f2fs_sync_dirty_inodes
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On 2022/2/15 7:27, Jaegeuk Kim wrote:
> If one read IO is always failing, we can fall into an infinite loop in
> f2fs_sync_dirty_inodes. This happens during xfstests/generic/475.
> 
> [  142.803335] Buffer I/O error on dev dm-1, logical block 8388592, async page read
> ...
> [  382.887210]  submit_bio_noacct+0xdd/0x2a0
> [  382.887213]  submit_bio+0x80/0x110
> [  382.887223]  __submit_bio+0x4d/0x300 [f2fs]
> [  382.887282]  f2fs_submit_page_bio+0x125/0x200 [f2fs]
> [  382.887299]  __get_meta_page+0xc9/0x280 [f2fs]
> [  382.887315]  f2fs_get_meta_page+0x13/0x20 [f2fs]
> [  382.887331]  f2fs_get_node_info+0x317/0x3c0 [f2fs]
> [  382.887350]  f2fs_do_write_data_page+0x327/0x6f0 [f2fs]
> [  382.887367]  f2fs_write_single_data_page+0x5b7/0x960 [f2fs]
> [  382.887386]  f2fs_write_cache_pages+0x302/0x890 [f2fs]
> [  382.887405]  ? preempt_count_add+0x7a/0xc0
> [  382.887408]  f2fs_write_data_pages+0xfd/0x320 [f2fs]
> [  382.887425]  ? _raw_spin_unlock+0x1a/0x30
> [  382.887428]  do_writepages+0xd3/0x1d0
> [  382.887432]  filemap_fdatawrite_wbc+0x69/0x90
> [  382.887434]  filemap_fdatawrite+0x50/0x70
> [  382.887437]  f2fs_sync_dirty_inodes+0xa4/0x270 [f2fs]
> [  382.887453]  f2fs_write_checkpoint+0x189/0x1640 [f2fs]
> [  382.887469]  ? schedule_timeout+0x114/0x150
> [  382.887471]  ? ttwu_do_activate+0x6d/0xb0
> [  382.887473]  ? preempt_count_add+0x7a/0xc0
> [  382.887476]  kill_f2fs_super+0xca/0x100 [f2fs]
> [  382.887491]  deactivate_locked_super+0x35/0xa0
> [  382.887494]  deactivate_super+0x40/0x50
> [  382.887497]  cleanup_mnt+0x139/0x190
> [  382.887499]  __cleanup_mnt+0x12/0x20
> [  382.887501]  task_work_run+0x64/0xa0
> [  382.887505]  exit_to_user_mode_prepare+0x1b7/0x1c0
> [  382.887508]  syscall_exit_to_user_mode+0x27/0x50
> [  382.887510]  do_syscall_64+0x48/0xc0
> [  382.887513]  entry_SYSCALL_64_after_hwframe+0x44/0xae
> 
> Signed-off-by: Jaegeuk Kim <jaegeuk@kernel.org>
> ---
>   Change log from v1:
>    - fix a regression to report EIO too early
> 
>   fs/f2fs/checkpoint.c | 13 ++++++++-----
>   fs/f2fs/f2fs.h       |  3 +++
>   2 files changed, 11 insertions(+), 5 deletions(-)
> 
> diff --git a/fs/f2fs/checkpoint.c b/fs/f2fs/checkpoint.c
> index 203a1577942d..56c81c68ef71 100644
> --- a/fs/f2fs/checkpoint.c
> +++ b/fs/f2fs/checkpoint.c
> @@ -1059,13 +1059,13 @@ int f2fs_sync_dirty_inodes(struct f2fs_sb_info *sbi, enum inode_type type)
>   	struct inode *inode;
>   	struct f2fs_inode_info *fi;
>   	bool is_dir = (type == DIR_INODE);
> -	unsigned long ino = 0;
> +	unsigned long ino = 0, retry_count = DEFAULT_RETRY_SYNC_DIR_COUNT;
>   
>   	trace_f2fs_sync_dirty_inodes_enter(sbi->sb, is_dir,
>   				get_pages(sbi, is_dir ?
>   				F2FS_DIRTY_DENTS : F2FS_DIRTY_DATA));
>   retry:
> -	if (unlikely(f2fs_cp_error(sbi))) {
> +	if (unlikely(f2fs_cp_error(sbi) || (is_dir && !retry_count))) {
>   		trace_f2fs_sync_dirty_inodes_exit(sbi->sb, is_dir,
>   				get_pages(sbi, is_dir ?
>   				F2FS_DIRTY_DENTS : F2FS_DIRTY_DATA));
> @@ -1096,10 +1096,13 @@ int f2fs_sync_dirty_inodes(struct f2fs_sb_info *sbi, enum inode_type type)
>   
>   		iput(inode);
>   		/* We need to give cpu to another writers. */
> -		if (ino == cur_ino)
> -			cond_resched();
> -		else
> +		if (ino == cur_ino) {
> +			retry_count--;
> +			io_schedule_timeout(DEFAULT_IO_TIMEOUT);
> +		} else {
> +			retry_count = DEFAULT_RETRY_SYNC_DIR_COUNT;
>   			ino = cur_ino;
> +		}
>   	} else {
>   		/*
>   		 * We should submit bio, since it exists several
> diff --git a/fs/f2fs/f2fs.h b/fs/f2fs/f2fs.h
> index c9515c3c54fd..f40ef7b61965 100644
> --- a/fs/f2fs/f2fs.h
> +++ b/fs/f2fs/f2fs.h
> @@ -577,6 +577,9 @@ enum {
>   /* maximum retry quota flush count */
>   #define DEFAULT_RETRY_QUOTA_FLUSH_COUNT		8
>   
> +/* maximum retry sync dirty inodes */
> +#define DEFAULT_RETRY_SYNC_DIR_COUNT	3000

3000 * 20ms/round = 60sec

How about just trying 5 or 10 sec?

Thanks,

> +
>   #define F2FS_LINK_MAX	0xffffffff	/* maximum link count per file */
>   
>   #define MAX_DIR_RA_PAGES	4	/* maximum ra pages of dir */


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
