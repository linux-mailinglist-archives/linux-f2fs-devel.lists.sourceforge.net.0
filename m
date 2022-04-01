Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A6644EE9BF
	for <lists+linux-f2fs-devel@lfdr.de>; Fri,  1 Apr 2022 10:29:09 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.94.2)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1naCeY-0004FJ-Bj; Fri, 01 Apr 2022 08:29:04 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <chao@kernel.org>) id 1naCeX-0004FA-NH
 for linux-f2fs-devel@lists.sourceforge.net; Fri, 01 Apr 2022 08:29:04 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=axyl17uMsQa3XSl1y/eInFEW7i1tw1RHeN/iR2Gpnj4=; b=ggNl44jLXDfb3mWWPB3Ep+GrV9
 Z3u/dlw3oE/CE8JzzXpqNJRyJii3KrIJ6tDwJCQLmNezeO+tWmLaLZnmokj4CpLycHwtfhj40NjG7
 HWxZpax5WGmZlIVN6vB8oWKJYggPd9ZWyKoWKLGqIiGrbs2mL/6YEX7JbttTWW67PSDA=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:Cc:To:
 Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=axyl17uMsQa3XSl1y/eInFEW7i1tw1RHeN/iR2Gpnj4=; b=LlV3ASe2DOYVF+7miWlyR4zbfc
 AfuEYSuQqbfwNoxuIZBkE0ON4N//JbXuDxjoavAqolMpoBHdloLY8hRQOZtYnQZGx5pTk+jEIssJA
 WVTTXXuGq+EOTFcFqqI+BREiwNdHlbZdAMLIHQ8MfTB63ucD47qLlYt+cWnD1pmnyqGE=;
Received: from dfw.source.kernel.org ([139.178.84.217])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.94.2)
 id 1naCeV-0002PZ-2u
 for linux-f2fs-devel@lists.sourceforge.net; Fri, 01 Apr 2022 08:29:04 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 6D48560F96;
 Fri,  1 Apr 2022 08:28:57 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BF0E0C340F3;
 Fri,  1 Apr 2022 08:28:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1648801736;
 bh=pPqxOeyFjUHuyu7vxwgeY8ILe1oHtpSMdXW50dLcRHM=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=iKqPc+QpPvi/2008lcBWEOUWMorfKpX+s8wOainZRl3B6gEu9nhu7R+axyOuANnJD
 7tbLJ3MFHVxUJS9gitZBpvs7WSNngV6a8xL9k5E8Ts9Cgo4jhNF/TgeFmeIIEuYpD9
 QxuwT/8vZ5QlvoLFQeoTOB/hunbf/+VF8/hDw0vdUwuHdo3kuJmLmbJ/aiy9qjRlae
 jsl7SXUUBnFF/PFMuuyQZkc5l1ViJgtU9M5/rW/1CkvOfEUVBdDchlRF03CW/KJofD
 jVYAXS2TMUg9/h9ox/VxLz0cz3XoU+aPXWTEH3OQ7CJPbmYGVvvTl/yTUWFO8TzNr4
 ii98xGSD2wqkA==
Message-ID: <0c134e0e-b2d0-0bc0-42fc-cd220ff77e72@kernel.org>
Date: Fri, 1 Apr 2022 16:28:52 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Content-Language: en-US
To: Yufen Yu <yuyufen@huawei.com>, jaegeuk@kernel.org
References: <20220401071909.505086-1-yuyufen@huawei.com>
 <20220401071909.505086-5-yuyufen@huawei.com>
From: Chao Yu <chao@kernel.org>
In-Reply-To: <20220401071909.505086-5-yuyufen@huawei.com>
X-Spam-Score: -5.2 (-----)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 2022/4/1 15:19, Yufen Yu via Linux-f2fs-devel wrote: >
 Nowly, we can use new fault injection framework. Just delete the > stale fault
 injection code. > > Signed-off-by: Yufen Yu <yuyufen@huawei.com [...] 
 Content analysis details:   (-5.2 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [139.178.84.217 listed in list.dnswl.org]
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.0 T_SCC_BODY_TEXT_LINE   No description available.
 -0.0 NICE_REPLY_A           Looks like a legit reply (A)
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1naCeV-0002PZ-2u
Subject: Re: [f2fs-dev] [PATCH 4/5] f2fs: get rid of stale fault injection
 code
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

On 2022/4/1 15:19, Yufen Yu via Linux-f2fs-devel wrote:
> Nowly, we can use new fault injection framework. Just delete the
> stale fault injection code.
> 
> Signed-off-by: Yufen Yu <yuyufen@huawei.com>
> ---
>   fs/f2fs/checkpoint.c |  2 +-
>   fs/f2fs/f2fs.h       | 51 ++----------------------------------------
>   fs/f2fs/super.c      | 53 --------------------------------------------
>   fs/f2fs/sysfs.c      | 23 -------------------
>   4 files changed, 3 insertions(+), 126 deletions(-)
> 
> diff --git a/fs/f2fs/checkpoint.c b/fs/f2fs/checkpoint.c
> index 820eb95b08f1..88e419db5782 100644
> --- a/fs/f2fs/checkpoint.c
> +++ b/fs/f2fs/checkpoint.c
> @@ -28,7 +28,7 @@ struct kmem_cache *f2fs_inode_entry_slab;
>   
>   void f2fs_stop_checkpoint(struct f2fs_sb_info *sbi, bool end_io)
>   {
> -	f2fs_build_fault_attr(sbi, 0, 0);
> +	f2fs_stop_fault_inject(sbi);
>   	set_ckpt_flags(sbi, CP_ERROR_FLAG);
>   	if (!end_io)
>   		f2fs_flush_merged_writes(sbi);
> diff --git a/fs/f2fs/f2fs.h b/fs/f2fs/f2fs.h
> index beb935f807d6..61b07eb4bb7b 100644
> --- a/fs/f2fs/f2fs.h
> +++ b/fs/f2fs/f2fs.h
> @@ -65,19 +65,6 @@ enum {
>   
>   extern struct dentry *f2fs_debugfs_root;
>   
> -#ifdef CONFIG_F2FS_FAULT_INJECTION
> -#define F2FS_ALL_FAULT_TYPE		((1 << FAULT_MAX) - 1)
> -
> -struct f2fs_fault_info {
> -	atomic_t inject_ops;
> -	unsigned int inject_rate;
> -	unsigned int inject_type;
> -};
> -
> -extern const char *f2fs_fault_name[FAULT_MAX];
> -#define IS_FAULT_SET(fi, type) ((fi)->inject_type & (1 << (type)))
> -#endif
> -
>   /*
>    * For mount options
>    */
> @@ -148,9 +135,6 @@ struct f2fs_mount_info {
>   	kgid_t s_resgid;		/* reserved blocks for gid */
>   	int active_logs;		/* # of active logs */
>   	int inline_xattr_size;		/* inline xattr size */
> -#ifdef CONFIG_F2FS_FAULT_INJECTION
> -	struct f2fs_fault_info fault_info;	/* For fault injection */
> -#endif
>   #ifdef CONFIG_QUOTA
>   	/* Names of quota files with journalled quota */
>   	char *s_qf_names[MAXQUOTAS];
> @@ -1860,42 +1844,18 @@ struct f2fs_sb_info {
>   };
>   
>   #ifdef CONFIG_F2FS_FAULT_INJECTION
> +extern const char *f2fs_fault_name[FAULT_MAX];
>   #define f2fs_show_injection_info(sbi, type)					\
>   	printk_ratelimited("%sF2FS-fs (%s) : inject %s in %s of %pS\n",	\
>   		KERN_INFO, sbi->sb->s_id,				\
>   		f2fs_fault_name[type],					\
>   		__func__, __builtin_return_address(0))
> -static inline bool time_to_inject(struct f2fs_sb_info *sbi, int type)
> -{
> -	struct f2fs_fault_info *ffi = &F2FS_OPTION(sbi).fault_info;
> -
> -	if (!ffi->inject_rate)
> -		return false;
> -
> -	if (!IS_FAULT_SET(ffi, type))
> -		return false;
> -
> -	atomic_inc(&ffi->inject_ops);
> -	if (atomic_read(&ffi->inject_ops) >= ffi->inject_rate) {
> -		atomic_set(&ffi->inject_ops, 0);
> -		return true;
> -	}
> -	return false;
> -}
> -#else
> -#define f2fs_show_injection_info(sbi, type) do { } while (0)
> -static inline bool time_to_inject(struct f2fs_sb_info *sbi, int type)
> -{
> -	return false;
> -}
> -#endif
> -
> -#ifdef CONFIG_F2FS_FAULT_INJECTION
>   bool f2fs_should_fail(struct f2fs_sb_info *sbi, unsigned int type);
>   void f2fs_fault_inject_init(struct f2fs_sb_info *sbi);
>   void f2fs_fault_inject_fini(struct f2fs_sb_info *sbi);
>   void f2fs_stop_fault_inject(struct f2fs_sb_info *sbi);
>   #else
> +#define f2fs_show_injection_info(sbi, type) do { } while (0)
>   static inline bool f2fs_should_fail(struct f2fs_sb_info *sbi, unsigned int type)
>   {
>   	return false;
> @@ -4538,13 +4498,6 @@ static inline bool f2fs_need_verity(const struct inode *inode, pgoff_t idx)
>   	       idx < DIV_ROUND_UP(inode->i_size, PAGE_SIZE);
>   }
>   
> -#ifdef CONFIG_F2FS_FAULT_INJECTION
> -extern void f2fs_build_fault_attr(struct f2fs_sb_info *sbi, unsigned int rate,
> -							unsigned int type);
> -#else
> -#define f2fs_build_fault_attr(sbi, rate, type)		do { } while (0)
> -#endif
> -
>   static inline bool is_journalled_quota(struct f2fs_sb_info *sbi)
>   {
>   #ifdef CONFIG_QUOTA
> diff --git a/fs/f2fs/super.c b/fs/f2fs/super.c
> index e18f60165f44..859ae5068761 100644
> --- a/fs/f2fs/super.c
> +++ b/fs/f2fs/super.c
> @@ -64,22 +64,6 @@ const char *f2fs_fault_name[FAULT_MAX] = {
>   	[FAULT_LOCK_OP]		= "lock_op",
>   };
>   
> -void f2fs_build_fault_attr(struct f2fs_sb_info *sbi, unsigned int rate,
> -							unsigned int type)
> -{
> -	struct f2fs_fault_info *ffi = &F2FS_OPTION(sbi).fault_info;
> -
> -	if (rate) {
> -		atomic_set(&ffi->inject_ops, 0);
> -		ffi->inject_rate = rate;
> -	}
> -
> -	if (type)
> -		ffi->inject_type = type;
> -
> -	if (!rate && !type)
> -		memset(ffi, 0, sizeof(struct f2fs_fault_info));
> -}
>   #endif
>   
>   /* f2fs-wide shrinker description */
> @@ -122,8 +106,6 @@ enum {
>   	Opt_resuid,
>   	Opt_mode,
>   	Opt_io_size_bits,
> -	Opt_fault_injection,
> -	Opt_fault_type,
>   	Opt_lazytime,
>   	Opt_nolazytime,
>   	Opt_quota,
> @@ -198,8 +180,6 @@ static match_table_t f2fs_tokens = {
>   	{Opt_resuid, "resuid=%u"},
>   	{Opt_mode, "mode=%s"},
>   	{Opt_io_size_bits, "io_bits=%u"},
> -	{Opt_fault_injection, "fault_injection=%u"},
> -	{Opt_fault_type, "fault_type=%u"},
>   	{Opt_lazytime, "lazytime"},
>   	{Opt_nolazytime, "nolazytime"},
>   	{Opt_quota, "quota"},
> @@ -874,29 +854,6 @@ static int parse_options(struct super_block *sb, char *options, bool is_remount)
>   			}
>   			F2FS_OPTION(sbi).write_io_size_bits = arg;
>   			break;
> -#ifdef CONFIG_F2FS_FAULT_INJECTION
> -		case Opt_fault_injection:
> -			if (args->from && match_int(args, &arg))
> -				return -EINVAL;
> -			f2fs_build_fault_attr(sbi, arg, F2FS_ALL_FAULT_TYPE);
> -			set_opt(sbi, FAULT_INJECTION);
> -			break;
> -
> -		case Opt_fault_type:
> -			if (args->from && match_int(args, &arg))
> -				return -EINVAL;
> -			f2fs_build_fault_attr(sbi, 0, arg);
> -			set_opt(sbi, FAULT_INJECTION);
> -			break;
> -#else
> -		case Opt_fault_injection:
> -			f2fs_info(sbi, "fault_injection options not supported");
> -			break;
> -
> -		case Opt_fault_type:
> -			f2fs_info(sbi, "fault_type options not supported");
> -			break;
> -#endif
>   		case Opt_lazytime:
>   			sb->s_flags |= SB_LAZYTIME;
>   			break;
> @@ -1963,14 +1920,6 @@ static int f2fs_show_options(struct seq_file *seq, struct dentry *root)
>   	if (F2FS_IO_SIZE_BITS(sbi))
>   		seq_printf(seq, ",io_bits=%u",
>   				F2FS_OPTION(sbi).write_io_size_bits);
> -#ifdef CONFIG_F2FS_FAULT_INJECTION
> -	if (test_opt(sbi, FAULT_INJECTION)) {
> -		seq_printf(seq, ",fault_injection=%u",
> -				F2FS_OPTION(sbi).fault_info.inject_rate);
> -		seq_printf(seq, ",fault_type=%u",
> -				F2FS_OPTION(sbi).fault_info.inject_type);
> -	}
> -#endif

This will cause regression due to it breaks application usage w/ -o
fault_* mountoption..., I don't think this is the right way.

Thanks,

>   #ifdef CONFIG_QUOTA
>   	if (test_opt(sbi, QUOTA))
>   		seq_puts(seq, ",quota");
> @@ -2076,8 +2025,6 @@ static void default_options(struct f2fs_sb_info *sbi)
>   #ifdef CONFIG_F2FS_FS_POSIX_ACL
>   	set_opt(sbi, POSIX_ACL);
>   #endif
> -
> -	f2fs_build_fault_attr(sbi, 0, 0);
>   }
>   
>   #ifdef CONFIG_QUOTA
> diff --git a/fs/f2fs/sysfs.c b/fs/f2fs/sysfs.c
> index 4c50aedd5144..85af2e97d565 100644
> --- a/fs/f2fs/sysfs.c
> +++ b/fs/f2fs/sysfs.c
> @@ -31,10 +31,6 @@ enum {
>   	F2FS_SBI,	/* struct f2fs_sb_info */
>   #ifdef CONFIG_F2FS_STAT_FS
>   	STAT_INFO,	/* struct f2fs_stat_info */
> -#endif
> -#ifdef CONFIG_F2FS_FAULT_INJECTION
> -	FAULT_INFO_RATE,	/* struct f2fs_fault_info */
> -	FAULT_INFO_TYPE,	/* struct f2fs_fault_info */
>   #endif
>   	RESERVED_BLOCKS,	/* struct f2fs_sb_info */
>   	CPRC_INFO,	/* struct ckpt_req_control */
> @@ -76,11 +72,6 @@ static unsigned char *__struct_ptr(struct f2fs_sb_info *sbi, int struct_type)
>   		return (unsigned char *)NM_I(sbi);
>   	else if (struct_type == F2FS_SBI || struct_type == RESERVED_BLOCKS)
>   		return (unsigned char *)sbi;
> -#ifdef CONFIG_F2FS_FAULT_INJECTION
> -	else if (struct_type == FAULT_INFO_RATE ||
> -					struct_type == FAULT_INFO_TYPE)
> -		return (unsigned char *)&F2FS_OPTION(sbi).fault_info;
> -#endif
>   #ifdef CONFIG_F2FS_STAT_FS
>   	else if (struct_type == STAT_INFO)
>   		return (unsigned char *)F2FS_STAT(sbi);
> @@ -429,12 +420,6 @@ static ssize_t __sbi_store(struct f2fs_attr *a,
>   	ret = kstrtoul(skip_spaces(buf), 0, &t);
>   	if (ret < 0)
>   		return ret;
> -#ifdef CONFIG_F2FS_FAULT_INJECTION
> -	if (a->struct_type == FAULT_INFO_TYPE && t >= (1 << FAULT_MAX))
> -		return -EINVAL;
> -	if (a->struct_type == FAULT_INFO_RATE && t >= UINT_MAX)
> -		return -EINVAL;
> -#endif
>   	if (a->struct_type == RESERVED_BLOCKS) {
>   		spin_lock(&sbi->stat_lock);
>   		if (t > (unsigned long)(sbi->user_block_count -
> @@ -773,10 +758,6 @@ F2FS_RW_ATTR(F2FS_SBI, f2fs_sb_info, readdir_ra, readdir_ra);
>   F2FS_RW_ATTR(F2FS_SBI, f2fs_sb_info, max_io_bytes, max_io_bytes);
>   F2FS_RW_ATTR(F2FS_SBI, f2fs_sb_info, gc_pin_file_thresh, gc_pin_file_threshold);
>   F2FS_RW_ATTR(F2FS_SBI, f2fs_super_block, extension_list, extension_list);
> -#ifdef CONFIG_F2FS_FAULT_INJECTION
> -F2FS_RW_ATTR(FAULT_INFO_RATE, f2fs_fault_info, inject_rate, inject_rate);
> -F2FS_RW_ATTR(FAULT_INFO_TYPE, f2fs_fault_info, inject_type, inject_type);
> -#endif
>   F2FS_RW_ATTR(F2FS_SBI, f2fs_sb_info, data_io_flag, data_io_flag);
>   F2FS_RW_ATTR(F2FS_SBI, f2fs_sb_info, node_io_flag, node_io_flag);
>   F2FS_RW_ATTR(F2FS_SBI, f2fs_sb_info, gc_urgent_high_remaining, gc_urgent_high_remaining);
> @@ -892,10 +873,6 @@ static struct attribute *f2fs_attrs[] = {
>   	ATTR_LIST(max_io_bytes),
>   	ATTR_LIST(gc_pin_file_thresh),
>   	ATTR_LIST(extension_list),
> -#ifdef CONFIG_F2FS_FAULT_INJECTION
> -	ATTR_LIST(inject_rate),
> -	ATTR_LIST(inject_type),
> -#endif
>   	ATTR_LIST(data_io_flag),
>   	ATTR_LIST(node_io_flag),
>   	ATTR_LIST(gc_urgent_high_remaining),


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
