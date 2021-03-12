Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 953C233893A
	for <lists+linux-f2fs-devel@lfdr.de>; Fri, 12 Mar 2021 10:51:26 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1lKeRv-00088n-Dl; Fri, 12 Mar 2021 09:51:15 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <yuchao0@huawei.com>) id 1lKeRt-00087q-IQ
 for linux-f2fs-devel@lists.sourceforge.net; Fri, 12 Mar 2021 09:51:13 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 MIME-Version:Date:Message-ID:From:References:CC:To:Subject:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=6BE2Nf95E52LJDVfzpqhyRWhTzk+Wh47Hc+zNSgpRlU=; b=kfgW1GC1jZ8hHuGRYoUAApg/u2
 /hipUE3PN8naxz0KGuaanND/US0Lb+IH9qPu4EmCp08swE5ob3iyqrxYwNWAYJOcrT9tga2Ui08Dm
 +jgOBPw8DFq4pEQ9qKi41WKQQhEuLiwtv+1dkmUVEwZ6CC2qRRytS8q12sZa5wnRMCqI=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:MIME-Version:Date:
 Message-ID:From:References:CC:To:Subject:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=6BE2Nf95E52LJDVfzpqhyRWhTzk+Wh47Hc+zNSgpRlU=; b=Qab2p3BhHA75cLJe1H2dq6xcoL
 QPBg+H2fse0HX3m9FRRICa7giP7PIwh+x1wQIA57AqGcJvXypZ5OSBqsse4SCG2uycIWf0iJs6vuG
 A+1WyJEuHAwrd/B93peBgVhw0kSX00D1dkksdumRVJ4jvwmF9ee0KQEKeaWWTbG5zD5I=;
Received: from szxga07-in.huawei.com ([45.249.212.35])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1lKeRk-004vYV-Uj
 for linux-f2fs-devel@lists.sourceforge.net; Fri, 12 Mar 2021 09:51:13 +0000
Received: from DGGEMS403-HUB.china.huawei.com (unknown [172.30.72.58])
 by szxga07-in.huawei.com (SkyGuard) with ESMTP id 4Dxgxt4RZ4z8w6w;
 Fri, 12 Mar 2021 17:49:06 +0800 (CST)
Received: from [10.136.110.154] (10.136.110.154) by smtp.huawei.com
 (10.3.19.203) with Microsoft SMTP Server (TLS) id 14.3.498.0; Fri, 12 Mar
 2021 17:50:50 +0800
To: Daeho Jeong <daeho43@gmail.com>, <linux-kernel@vger.kernel.org>,
 <linux-f2fs-devel@lists.sourceforge.net>, <kernel-team@android.com>
References: <20210311023233.1034946-1-daeho43@gmail.com>
From: Chao Yu <yuchao0@huawei.com>
Message-ID: <5000daf0-e204-4f49-f2e9-30489db46d1a@huawei.com>
Date: Fri, 12 Mar 2021 17:50:49 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:52.0) Gecko/20100101
 Thunderbird/52.9.1
MIME-Version: 1.0
In-Reply-To: <20210311023233.1034946-1-daeho43@gmail.com>
Content-Language: en-US
X-Originating-IP: [10.136.110.154]
X-CFilter-Loop: Reflected
X-Spam-Score: 0.0 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 0.0 URIBL_BLOCKED ADMINISTRATOR NOTICE: The query to URIBL was blocked.
 See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URIs: intel.com]
 0.0 RCVD_IN_MSPIKE_H4      RBL: Very Good reputation (+4)
 [45.249.212.35 listed in wl.mailspike.net]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
 -0.0 NICE_REPLY_A           Looks like a legit reply (A)
X-Headers-End: 1lKeRk-004vYV-Uj
Subject: Re: [f2fs-dev] [PATCH v3] f2fs: add sysfs nodes to get runtime
 compression stat
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
Cc: Daeho Jeong <daehojeong@google.com>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On 2021/3/11 10:32, Daeho Jeong wrote:
> From: Daeho Jeong <daehojeong@google.com>
> 
> I've added new sysfs nodes to show runtime compression stat since mount.
> compr_written_block - show the block count written after compression
> compr_saved_block - show the saved block count with compression
> compr_new_inode - show the count of inode newly enabled for compression
> 
> Signed-off-by: Daeho Jeong <daehojeong@google.com>
> ---
> v2: thanks to kernel test robot <lkp@intel.com>, fixed compile issue
>      related to kernel config.
> v3: changed sysfs nodes' names and made them runtime stat, not
>      persistent on disk
> ---
>   Documentation/ABI/testing/sysfs-fs-f2fs | 20 +++++++++
>   fs/f2fs/compress.c                      |  1 +
>   fs/f2fs/f2fs.h                          | 19 ++++++++
>   fs/f2fs/super.c                         |  7 +++
>   fs/f2fs/sysfs.c                         | 58 +++++++++++++++++++++++++
>   5 files changed, 105 insertions(+)
> 
> diff --git a/Documentation/ABI/testing/sysfs-fs-f2fs b/Documentation/ABI/testing/sysfs-fs-f2fs
> index cbeac1bebe2f..f2981eb319cb 100644
> --- a/Documentation/ABI/testing/sysfs-fs-f2fs
> +++ b/Documentation/ABI/testing/sysfs-fs-f2fs
> @@ -409,3 +409,23 @@ Description:	Give a way to change checkpoint merge daemon's io priority.
>   		I/O priority "3". We can select the class between "rt" and "be",
>   		and set the I/O priority within valid range of it. "," delimiter
>   		is necessary in between I/O class and priority number.
> +
> +What:		/sys/fs/f2fs/<disk>/compr_written_block
> +Date:		March 2021
> +Contact:	"Daeho Jeong" <daehojeong@google.com>
> +Description:	Show the block count written after compression since mount.
> +		If you write "0" here, you can initialize compr_written_block and
> +		compr_saved_block to "0".
> +
> +What:		/sys/fs/f2fs/<disk>/compr_saved_block
> +Date:		March 2021
> +Contact:	"Daeho Jeong" <daehojeong@google.com>
> +Description:	Show the saved block count with compression since mount.
> +		If you write "0" here, you can initialize compr_written_block and
> +		compr_saved_block to "0".
> +
> +What:		/sys/fs/f2fs/<disk>/compr_new_inode
> +Date:		March 2021
> +Contact:	"Daeho Jeong" <daehojeong@google.com>
> +Description:	Show the count of inode newly enabled for compression since mount.
> +		If you write "0" here, you can initialize compr_new_inode to "0".
> diff --git a/fs/f2fs/compress.c b/fs/f2fs/compress.c
> index 77fa342de38f..3c9d797dbdd6 100644
> --- a/fs/f2fs/compress.c
> +++ b/fs/f2fs/compress.c
> @@ -1353,6 +1353,7 @@ static int f2fs_write_compressed_pages(struct compress_ctx *cc,
>   	if (fio.compr_blocks)
>   		f2fs_i_compr_blocks_update(inode, fio.compr_blocks - 1, false);
>   	f2fs_i_compr_blocks_update(inode, cc->nr_cpages, true);
> +	add_compr_block_stat(inode, cc->nr_cpages);

If compressed cluster was overwritten as normal cluster, compr_saved_block value
won't be decreased, is it fine?

>   
>   	set_inode_flag(cc->inode, FI_APPEND_WRITE);
>   	if (cc->cluster_idx == 0)
> diff --git a/fs/f2fs/f2fs.h b/fs/f2fs/f2fs.h
> index e2d302ae3a46..2c989f8caf05 100644
> --- a/fs/f2fs/f2fs.h
> +++ b/fs/f2fs/f2fs.h
> @@ -1623,6 +1623,11 @@ struct f2fs_sb_info {
>   #ifdef CONFIG_F2FS_FS_COMPRESSION
>   	struct kmem_cache *page_array_slab;	/* page array entry */
>   	unsigned int page_array_slab_size;	/* default page array slab size */
> +
> +	/* For runtime compression statistics */
> +	atomic64_t compr_written_block;
> +	atomic64_t compr_saved_block;
> +	atomic_t compr_new_inode;
>   #endif
>   };
>   
> @@ -3955,6 +3960,18 @@ int f2fs_init_page_array_cache(struct f2fs_sb_info *sbi);
>   void f2fs_destroy_page_array_cache(struct f2fs_sb_info *sbi);
>   int __init f2fs_init_compress_cache(void);
>   void f2fs_destroy_compress_cache(void);
> +#define inc_compr_inode_stat(inode)					\
> +	do {								\
> +		struct f2fs_sb_info *sbi = F2FS_I_SB(inode);		\
> +		atomic_inc(&sbi->compr_new_inode);			\
> +	} while (0)
> +#define add_compr_block_stat(inode, blocks)				\
> +	do {								\
> +		struct f2fs_sb_info *sbi = F2FS_I_SB(inode);		\
> +		int diff = F2FS_I(inode)->i_cluster_size - blocks;	\
> +		atomic64_add(blocks, &sbi->compr_written_block);	\
> +		atomic64_add(diff, &sbi->compr_saved_block);		\
> +	} while (0)
>   #else
>   static inline bool f2fs_is_compressed_page(struct page *page) { return false; }
>   static inline bool f2fs_is_compress_backend_ready(struct inode *inode)
> @@ -3983,6 +4000,7 @@ static inline int f2fs_init_page_array_cache(struct f2fs_sb_info *sbi) { return
>   static inline void f2fs_destroy_page_array_cache(struct f2fs_sb_info *sbi) { }
>   static inline int __init f2fs_init_compress_cache(void) { return 0; }
>   static inline void f2fs_destroy_compress_cache(void) { }
> +#define inc_compr_inode_stat(inode)		do { } while (0)
>   #endif
>   
>   static inline void set_compress_context(struct inode *inode)
> @@ -4006,6 +4024,7 @@ static inline void set_compress_context(struct inode *inode)
>   	F2FS_I(inode)->i_flags |= F2FS_COMPR_FL;
>   	set_inode_flag(inode, FI_COMPRESSED_FILE);
>   	stat_inc_compr_inode(inode);
> +	inc_compr_inode_stat(inode);

Ditto, if we disable compressed file via f2fs_disable_compressed_file(),
compr_new_inode value won't be decreased correctly.

If there is no problem, it needs to add description to indicate it won't be
aware of decrease of saved/written blocks or compressed inode number.

Thanks,

>   	f2fs_mark_inode_dirty_sync(inode, true);
>   }
>   
> diff --git a/fs/f2fs/super.c b/fs/f2fs/super.c
> index 7069793752f1..88d9ecdee8d3 100644
> --- a/fs/f2fs/super.c
> +++ b/fs/f2fs/super.c
> @@ -3260,6 +3260,13 @@ static void init_sb_info(struct f2fs_sb_info *sbi)
>   
>   	init_rwsem(&sbi->sb_lock);
>   	init_rwsem(&sbi->pin_sem);
> +
> +#ifdef CONFIG_F2FS_FS_COMPRESSION
> +	/* For runtime compression statistics */
> +	atomic64_set(&sbi->compr_written_block, 0);
> +	atomic64_set(&sbi->compr_saved_block, 0);
> +	atomic_set(&sbi->compr_new_inode, 0);
> +#endif
>   }
>   
>   static int init_percpu_info(struct f2fs_sb_info *sbi)
> diff --git a/fs/f2fs/sysfs.c b/fs/f2fs/sysfs.c
> index e38a7f6921dd..2b6e5e6e1286 100644
> --- a/fs/f2fs/sysfs.c
> +++ b/fs/f2fs/sysfs.c
> @@ -282,6 +282,38 @@ static ssize_t f2fs_sbi_show(struct f2fs_attr *a,
>   		return len;
>   	}
>   
> +#ifdef CONFIG_F2FS_FS_COMPRESSION
> +	if (!strcmp(a->attr.name, "compr_written_block")) {
> +		u64 bcount;
> +		int len;
> +
> +		bcount = atomic64_read(&sbi->compr_written_block);
> +
> +		len = scnprintf(buf, PAGE_SIZE, "%llu\n", bcount);
> +		return len;
> +	}
> +
> +	if (!strcmp(a->attr.name, "compr_saved_block")) {
> +		u64 bcount;
> +		int len;
> +
> +		bcount = atomic64_read(&sbi->compr_saved_block);
> +
> +		len = scnprintf(buf, PAGE_SIZE, "%llu\n", bcount);
> +		return len;
> +	}
> +
> +	if (!strcmp(a->attr.name, "compr_new_inode")) {
> +		u32 icount;
> +		int len;
> +
> +		icount = atomic_read(&sbi->compr_new_inode);
> +
> +		len = scnprintf(buf, PAGE_SIZE, "%u\n", icount);
> +		return len;
> +	}
> +#endif
> +
>   	ui = (unsigned int *)(ptr + a->offset);
>   
>   	return sprintf(buf, "%u\n", *ui);
> @@ -458,6 +490,24 @@ static ssize_t __sbi_store(struct f2fs_attr *a,
>   		return count;
>   	}
>   
> +#ifdef CONFIG_F2FS_FS_COMPRESSION
> +	if (!strcmp(a->attr.name, "compr_written_block") ||
> +		!strcmp(a->attr.name, "compr_saved_block")) {
> +		if (t != 0)
> +			return -EINVAL;
> +		atomic64_set(&sbi->compr_written_block, 0);
> +		atomic64_set(&sbi->compr_saved_block, 0);
> +		return count;
> +	}
> +
> +	if (!strcmp(a->attr.name, "compr_new_inode")) {
> +		if (t != 0)
> +			return -EINVAL;
> +		atomic_set(&sbi->compr_new_inode, 0);
> +		return count;
> +	}
> +#endif
> +
>   	*ui = (unsigned int)t;
>   
>   	return count;
> @@ -668,6 +718,9 @@ F2FS_FEATURE_RO_ATTR(sb_checksum, FEAT_SB_CHECKSUM);
>   F2FS_FEATURE_RO_ATTR(casefold, FEAT_CASEFOLD);
>   #ifdef CONFIG_F2FS_FS_COMPRESSION
>   F2FS_FEATURE_RO_ATTR(compression, FEAT_COMPRESSION);
> +F2FS_RW_ATTR(F2FS_SBI, f2fs_sb_info, compr_written_block, compr_written_block);
> +F2FS_RW_ATTR(F2FS_SBI, f2fs_sb_info, compr_saved_block, compr_saved_block);
> +F2FS_RW_ATTR(F2FS_SBI, f2fs_sb_info, compr_new_inode, compr_new_inode);
>   #endif
>   
>   #define ATTR_LIST(name) (&f2fs_attr_##name.attr)
> @@ -730,6 +783,11 @@ static struct attribute *f2fs_attrs[] = {
>   	ATTR_LIST(moved_blocks_foreground),
>   	ATTR_LIST(moved_blocks_background),
>   	ATTR_LIST(avg_vblocks),
> +#endif
> +#ifdef CONFIG_F2FS_FS_COMPRESSION
> +	ATTR_LIST(compr_written_block),
> +	ATTR_LIST(compr_saved_block),
> +	ATTR_LIST(compr_new_inode),
>   #endif
>   	NULL,
>   };
> 


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
