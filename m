Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 358E36D2102
	for <lists+linux-f2fs-devel@lfdr.de>; Fri, 31 Mar 2023 14:58:45 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-3.v29.lw.sourceforge.com)
	by sfs-ml-3.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1piEL3-0005JM-8r;
	Fri, 31 Mar 2023 12:58:40 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-3.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <chao@kernel.org>) id 1piEL1-0005JF-VD
 for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 31 Mar 2023 12:58:39 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=eZnNX/g1TFTqpWoLMQ/GIzn43Xps9FKdeQsILT7OgIM=; b=Avn8GHhm2ScBugHCrVMGNKeVcf
 IIOSgixRXH52hUuxsF2zM9USkx1G8UtzR7++EbxqRtPpH4fnrdO8DL0ZKTVqC5pXXSZxdB321BAKz
 ZCfrY0kTd1RJPLjt2jxmmYQmaRKyHNeA4VkQa/E/GKrSCS7Ec9CPr9Fgj3/E6p7tb9Fo=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:Cc:To:
 Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=eZnNX/g1TFTqpWoLMQ/GIzn43Xps9FKdeQsILT7OgIM=; b=F52TrDAKuRf5PcQzUbkJcDogGa
 n6A1D6aX1twuLuc5hd/EvWY5/I+bzQjoyu77vGWzmpKAB82mS+ggBdqQnz9V4S0frrzyCoRzdcfPD
 jIanAYFTjDHGVozHZaAv+YBLevL1nDWgT0CSnGWaQSMGx7BvvYXLlt3cZabzbS6BJPsY=;
Received: from ams.source.kernel.org ([145.40.68.75])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1piEL0-0003a2-4Q for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 31 Mar 2023 12:58:39 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id C42FBB82F38;
 Fri, 31 Mar 2023 12:58:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AC459C433D2;
 Fri, 31 Mar 2023 12:58:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1680267510;
 bh=UgrdYIiRIbayP2Q1rIOBzLC98/PLeze/M5lY956Ds+8=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=VMPzYccq2lNRrECym0avp51Jp5+rIWGRObTEnwkUjKugo0vt1hWQcN7U2wQ1hmCDR
 M7D+iS5IPTfJ0BIy74aZhka/pU9+QaNID0F0j2YO3rAi6A9uCH9xtEm1zi/xOTvXT7
 /txk36wbyKb21fsmmIQwk9ugDAG6vs9EOQxq1cqOs9DhTsx13Xl3Ij7U7IeRRpZSyX
 ALKUPCw1w98j0UrDfsNxCTQAGn+5LOenGvRwWP0LoGk3nK4BU98vy47wWl3SIVOoji
 JaxNIsQUjq7wAsvaKX3hs+mjjKqW9on47bdG2wnv7nk8HoMuTse6tD1WGDNTZQGqco
 wbp/0eHLkGR+g==
Message-ID: <cc346bd6-16bb-a38d-d0d8-ec7e928b27e9@kernel.org>
Date: Fri, 31 Mar 2023 20:58:29 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
To: Yangtao Li <frank.li@vivo.com>, jaegeuk@kernel.org
References: <20230330152510.81886-1-frank.li@vivo.com>
Content-Language: en-US
From: Chao Yu <chao@kernel.org>
In-Reply-To: <20230330152510.81886-1-frank.li@vivo.com>
X-Spam-Score: -5.2 (-----)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 2023/3/30 23:25,
 Yangtao Li wrote: > Similar to FAULT_LOCK_OP, 
 this patch supports to inject fault into > f2fs_down_write_trylock(). I guess
 we can cover all trylock w/ FAULT_LOCK_OP type fault injection, rather than
 just cover f2fs_down_write_trylock(). 
 Content analysis details:   (-5.2 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [145.40.68.75 listed in list.dnswl.org]
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid -0.0 NICE_REPLY_A           Looks like a legit reply (A)
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1piEL0-0003a2-4Q
Subject: Re: [f2fs-dev] [PATCH v2] f2fs: support fault injection for
 f2fs_down_write_trylock()
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On 2023/3/30 23:25, Yangtao Li wrote:
> Similar to FAULT_LOCK_OP, this patch supports to inject fault into
> f2fs_down_write_trylock().

I guess we can cover all trylock w/ FAULT_LOCK_OP type fault injection,
rather than just cover f2fs_down_write_trylock().

Including:
- inode_trylock
- down_read_trylock
- down_write_trylock
- mutex_trylock
- sb_start_write_trylock
- trylock_page

Bug only excluding f2fs_trylock_op which was covered by FAULT_LOCK_OP?

What do you think?

Thanks,

> 
> Usage:
>    a) echo 524288 > /sys/fs/f2fs/<dev>/inject_type or
>    b) mount -o fault_type=524288 <dev> <mountpoint>
> 
> Signed-off-by: Yangtao Li <frank.li@vivo.com>
> ---
> v2:
> -remove f2fs_down_write_trylock macro
>   Documentation/ABI/testing/sysfs-fs-f2fs |  1 +
>   Documentation/filesystems/f2fs.rst      |  1 +
>   fs/f2fs/checkpoint.c                    |  4 ++--
>   fs/f2fs/f2fs.h                          |  7 ++++++-
>   fs/f2fs/file.c                          |  8 ++++----
>   fs/f2fs/gc.c                            | 10 +++++-----
>   fs/f2fs/node.c                          |  2 +-
>   fs/f2fs/super.c                         |  1 +
>   8 files changed, 21 insertions(+), 13 deletions(-)
> 
> diff --git a/Documentation/ABI/testing/sysfs-fs-f2fs b/Documentation/ABI/testing/sysfs-fs-f2fs
> index c1314b7fe544..fc0f82f5c9f9 100644
> --- a/Documentation/ABI/testing/sysfs-fs-f2fs
> +++ b/Documentation/ABI/testing/sysfs-fs-f2fs
> @@ -714,6 +714,7 @@ Description:	Support configuring fault injection type, should be
>   		FAULT_DQUOT_INIT         0x000010000
>   		FAULT_LOCK_OP            0x000020000
>   		FAULT_BLKADDR            0x000040000
> +		FAULT_LOCK               0x000080000
>   		===================      ===========
>   
>   What:		/sys/fs/f2fs/<disk>/discard_io_aware_gran
> diff --git a/Documentation/filesystems/f2fs.rst b/Documentation/filesystems/f2fs.rst
> index 2055e72871fe..a81c896464ff 100644
> --- a/Documentation/filesystems/f2fs.rst
> +++ b/Documentation/filesystems/f2fs.rst
> @@ -206,6 +206,7 @@ fault_type=%d		 Support configuring fault injection type, should be
>   			 FAULT_DQUOT_INIT	  0x000010000
>   			 FAULT_LOCK_OP		  0x000020000
>   			 FAULT_BLKADDR		  0x000040000
> +			 FAULT_LOCK	          0x000080000
>   			 ===================	  ===========
>   mode=%s			 Control block allocation mode which supports "adaptive"
>   			 and "lfs". In "lfs" mode, there should be no random
> diff --git a/fs/f2fs/checkpoint.c b/fs/f2fs/checkpoint.c
> index 1e0164cde23d..b119c9ab0cc1 100644
> --- a/fs/f2fs/checkpoint.c
> +++ b/fs/f2fs/checkpoint.c
> @@ -372,7 +372,7 @@ static int f2fs_write_meta_pages(struct address_space *mapping,
>   		goto skip_write;
>   
>   	/* if locked failed, cp will flush dirty pages instead */
> -	if (!f2fs_down_write_trylock(&sbi->cp_global_sem))
> +	if (!f2fs_down_write_trylock(sbi, &sbi->cp_global_sem))
>   		goto skip_write;
>   
>   	trace_f2fs_writepages(mapping->host, wbc, META);
> @@ -1185,7 +1185,7 @@ static bool __need_flush_quota(struct f2fs_sb_info *sbi)
>   	if (!is_journalled_quota(sbi))
>   		return false;
>   
> -	if (!f2fs_down_write_trylock(&sbi->quota_sem))
> +	if (!f2fs_down_write_trylock(sbi, &sbi->quota_sem))
>   		return true;
>   	if (is_sbi_flag_set(sbi, SBI_QUOTA_SKIP_FLUSH)) {
>   		ret = false;
> diff --git a/fs/f2fs/f2fs.h b/fs/f2fs/f2fs.h
> index e73fefe0d8fb..d434c25fa175 100644
> --- a/fs/f2fs/f2fs.h
> +++ b/fs/f2fs/f2fs.h
> @@ -61,6 +61,7 @@ enum {
>   	FAULT_DQUOT_INIT,
>   	FAULT_LOCK_OP,
>   	FAULT_BLKADDR,
> +	FAULT_LOCK,
>   	FAULT_MAX,
>   };
>   
> @@ -2193,8 +2194,12 @@ static inline void f2fs_down_write(struct f2fs_rwsem *sem)
>   	down_write(&sem->internal_rwsem);
>   }
>   
> -static inline int f2fs_down_write_trylock(struct f2fs_rwsem *sem)
> +static inline int f2fs_down_write_trylock(struct f2fs_sb_info *sbi,
> +					struct f2fs_rwsem *sem)
>   {
> +	if (time_to_inject(sbi, FAULT_LOCK))
> +		return 0;
> +
>   	return down_write_trylock(&sem->internal_rwsem);
>   }
>   
> diff --git a/fs/f2fs/file.c b/fs/f2fs/file.c
> index 14e9a20e68df..db8c435d6201 100644
> --- a/fs/f2fs/file.c
> +++ b/fs/f2fs/file.c
> @@ -2462,7 +2462,7 @@ static int f2fs_ioc_gc(struct file *filp, unsigned long arg)
>   		return ret;
>   
>   	if (!sync) {
> -		if (!f2fs_down_write_trylock(&sbi->gc_lock)) {
> +		if (!f2fs_down_write_trylock(sbi, &sbi->gc_lock)) {
>   			ret = -EBUSY;
>   			goto out;
>   		}
> @@ -2506,7 +2506,7 @@ static int __f2fs_ioc_gc_range(struct file *filp, struct f2fs_gc_range *range)
>   
>   do_more:
>   	if (!range->sync) {
> -		if (!f2fs_down_write_trylock(&sbi->gc_lock)) {
> +		if (!f2fs_down_write_trylock(sbi, &sbi->gc_lock)) {
>   			ret = -EBUSY;
>   			goto out;
>   		}
> @@ -2851,7 +2851,7 @@ static int f2fs_move_file_range(struct file *file_in, loff_t pos_in,
>   	f2fs_down_write(&F2FS_I(src)->i_gc_rwsem[WRITE]);
>   	if (src != dst) {
>   		ret = -EBUSY;
> -		if (!f2fs_down_write_trylock(&F2FS_I(dst)->i_gc_rwsem[WRITE]))
> +		if (!f2fs_down_write_trylock(sbi, &F2FS_I(dst)->i_gc_rwsem[WRITE]))
>   			goto out_src;
>   	}
>   
> @@ -2971,7 +2971,7 @@ static int f2fs_ioc_flush_device(struct file *filp, unsigned long arg)
>   	end_segno = min(start_segno + range.segments, dev_end_segno);
>   
>   	while (start_segno < end_segno) {
> -		if (!f2fs_down_write_trylock(&sbi->gc_lock)) {
> +		if (!f2fs_down_write_trylock(sbi, &sbi->gc_lock)) {
>   			ret = -EBUSY;
>   			goto out;
>   		}
> diff --git a/fs/f2fs/gc.c b/fs/f2fs/gc.c
> index 7e97e4284db5..302950c6cbeb 100644
> --- a/fs/f2fs/gc.c
> +++ b/fs/f2fs/gc.c
> @@ -104,7 +104,7 @@ static int gc_thread_func(void *data)
>   		if (foreground) {
>   			f2fs_down_write(&sbi->gc_lock);
>   			goto do_gc;
> -		} else if (!f2fs_down_write_trylock(&sbi->gc_lock)) {
> +		} else if (!f2fs_down_write_trylock(sbi, &sbi->gc_lock)) {
>   			stat_other_skip_bggc_count(sbi);
>   			goto next;
>   		}
> @@ -1577,7 +1577,7 @@ static int gc_data_segment(struct f2fs_sb_info *sbi, struct f2fs_summary *sum,
>   				return submitted;
>   			}
>   
> -			if (!f2fs_down_write_trylock(
> +			if (!f2fs_down_write_trylock(sbi,
>   				&F2FS_I(inode)->i_gc_rwsem[WRITE])) {
>   				iput(inode);
>   				sbi->skipped_gc_rwsem++;
> @@ -1620,11 +1620,11 @@ static int gc_data_segment(struct f2fs_sb_info *sbi, struct f2fs_summary *sum,
>   			int err;
>   
>   			if (S_ISREG(inode->i_mode)) {
> -				if (!f2fs_down_write_trylock(&fi->i_gc_rwsem[READ])) {
> +				if (!f2fs_down_write_trylock(sbi, &fi->i_gc_rwsem[READ])) {
>   					sbi->skipped_gc_rwsem++;
>   					continue;
>   				}
> -				if (!f2fs_down_write_trylock(
> +				if (!f2fs_down_write_trylock(sbi,
>   						&fi->i_gc_rwsem[WRITE])) {
>   					sbi->skipped_gc_rwsem++;
>   					f2fs_up_write(&fi->i_gc_rwsem[READ]);
> @@ -2150,7 +2150,7 @@ int f2fs_resize_fs(struct f2fs_sb_info *sbi, __u64 block_count)
>   	secs = div_u64(shrunk_blocks, BLKS_PER_SEC(sbi));
>   
>   	/* stop other GC */
> -	if (!f2fs_down_write_trylock(&sbi->gc_lock))
> +	if (!f2fs_down_write_trylock(sbi, &sbi->gc_lock))
>   		return -EAGAIN;
>   
>   	/* stop CP to protect MAIN_SEC in free_segment_range */
> diff --git a/fs/f2fs/node.c b/fs/f2fs/node.c
> index bd1dad523796..e8e838f72ae6 100644
> --- a/fs/f2fs/node.c
> +++ b/fs/f2fs/node.c
> @@ -517,7 +517,7 @@ int f2fs_try_to_free_nats(struct f2fs_sb_info *sbi, int nr_shrink)
>   	struct f2fs_nm_info *nm_i = NM_I(sbi);
>   	int nr = nr_shrink;
>   
> -	if (!f2fs_down_write_trylock(&nm_i->nat_tree_lock))
> +	if (!f2fs_down_write_trylock(sbi, &nm_i->nat_tree_lock))
>   		return 0;
>   
>   	spin_lock(&nm_i->nat_list_lock);
> diff --git a/fs/f2fs/super.c b/fs/f2fs/super.c
> index 7d0202f7b317..768be1c76a47 100644
> --- a/fs/f2fs/super.c
> +++ b/fs/f2fs/super.c
> @@ -62,6 +62,7 @@ const char *f2fs_fault_name[FAULT_MAX] = {
>   	[FAULT_DQUOT_INIT]	= "dquot initialize",
>   	[FAULT_LOCK_OP]		= "lock_op",
>   	[FAULT_BLKADDR]		= "invalid blkaddr",
> +	[FAULT_LOCK]		= "lock",
>   };
>   
>   void f2fs_build_fault_attr(struct f2fs_sb_info *sbi, unsigned int rate,


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
