Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id C1E9FB16A9A
	for <lists+linux-f2fs-devel@lfdr.de>; Thu, 31 Jul 2025 04:57:02 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:In-Reply-To:References:To:MIME-Version:Date:
	Message-ID:Sender:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=AbFMwKQh2FeCfa1ouZkpRyFbwKWrkXsJJubbwFy9K8c=; b=MmiEuQapMsW76uDkLI9KsyDZ9X
	yr1avVAOF/zGUG11Kc8rUrPBcsKlnkJsg+dqcir/inzp7sTggRA2dT7EszudheiXD7Jbai8/kvAoI
	bWB/g1g2qI6miiHZR9iYWZoEPIKOmo89eKJWg/T1f7yEwEqZccwgKBS9qOgD0faMjwJs=;
Received: from [127.0.0.1] (helo=sfs-ml-3.v29.lw.sourceforge.com)
	by sfs-ml-3.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1uhJTT-0006m6-MG;
	Thu, 31 Jul 2025 02:56:55 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-3.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <chao@kernel.org>) id 1uhJTS-0006m0-5e
 for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 31 Jul 2025 02:56:54 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 From:References:To:Subject:Cc:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=eXZImKyvJeMq+IYkKcB2pl4MHqGF517jWlTq9PV6BrU=; b=CBUvcGYS5MD3qeyc2uEECb6uob
 jA5rM+Yf2EScE6kDd6jgdlEqTrbkLyW9kZdGsSRoF2TQjPrpyzPUwMRb/HuBPG+nSI8zZdMad05kh
 U/LC44MQhkZ+x/ayZ1ND4j/AbNWJQE0PWccA7q3A+ctSBx9lhj0RWrOd80zqFEhkXfA8=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:To:
 Subject:Cc:MIME-Version:Date:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=eXZImKyvJeMq+IYkKcB2pl4MHqGF517jWlTq9PV6BrU=; b=GA4wrFnbxTYB5qdxDZ7X/qjJ6F
 dxRXc03VEPcMOfZZ1vjvFjHy5p+zF8KY3vPA8SYo4Yfw5NjAWSNyjn6o7G2euoZra73Ql9lRg/vFJ
 o5/nwhuzMuYBfHlZwiuleCdOQkugubotncVWcRqG2NlgbdewHaNwfgFtzFNYyIOqJA9s=;
Received: from dfw.source.kernel.org ([139.178.84.217])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1uhJTR-0007bn-Ci for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 31 Jul 2025 02:56:54 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id E4CD15C594C;
 Thu, 31 Jul 2025 02:56:47 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6B805C4CEE7;
 Thu, 31 Jul 2025 02:56:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1753930607;
 bh=oo7rQERvLXJ+qXxeAvJHTDBIvLuAcldgZkVC342F380=;
 h=Date:Cc:Subject:To:References:From:In-Reply-To:From;
 b=d/heq9cva3KCSUH8/tE1oOcI4Tu2iQR0JdrkGHDPDKhQK6KGLogMQF6aRERdQY6Xm
 6uW0fKIQWwnpla4EfA090BoDrochxF7oVEFR/k9/B20rC0fcg5L4QXWsJsS4PkKyiI
 hA2yOLuHF+SFqu4S6cEuhY5M98HD32vzMEzd6+kT8O/OgM/huwfZTKW9erEEt8OfLr
 21JFiBph5xzAzrhUApitSPSI16ST49a0x8yCAUO/uw1SWLXF+kfUq6AKS0i3OIMSEa
 boXrVXmwOle1fz4tAUi2jgtB4KxZtWC/XNWBfxywqAnoxufM651huMmaXzM02dajMx
 CjIj57vkHFqEQ==
Message-ID: <526cac92-29eb-42a4-bf56-220e3b1f7c0c@kernel.org>
Date: Thu, 31 Jul 2025 10:56:43 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Chunhai Guo <guochunhai@vivo.com>, jaegeuk@kernel.org
References: <20250730141540.603144-1-guochunhai@vivo.com>
Content-Language: en-US
In-Reply-To: <20250730141540.603144-1-guochunhai@vivo.com>
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-2.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 7/30/25 22:15,
 Chunhai Guo wrote: > This patch allows privileged
 users to reserve nodes via the > 'reserve_node' mount option, which is similar
 to the existing > 'reserve_root' option. > > "-o rese [...] 
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
X-Headers-End: 1uhJTR-0007bn-Ci
Subject: Re: [f2fs-dev] [PATCH v3] f2fs: add reserved nodes for privileged
 users
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
Cc: linux-kernel@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On 7/30/25 22:15, Chunhai Guo wrote:
> This patch allows privileged users to reserve nodes via the
> 'reserve_node' mount option, which is similar to the existing
> 'reserve_root' option.
> 
> "-o reserve_node=<N>" means <N> nodes are reserved for privileged
> users only.
> 
> Signed-off-by: Chunhai Guo <guochunhai@vivo.com>
> ---
> v2->v3: Apply Chao's suggestion from v2.
> v1->v2: Add two missing handling parts.
> v1: https://lore.kernel.org/linux-f2fs-devel/20250729095238.607433-1-guochunhai@vivo.com/
> ---
>  Documentation/filesystems/f2fs.rst |  9 ++++---
>  fs/f2fs/f2fs.h                     | 17 +++++++-----
>  fs/f2fs/super.c                    | 43 +++++++++++++++++++++++++-----
>  3 files changed, 53 insertions(+), 16 deletions(-)
> 
> diff --git a/Documentation/filesystems/f2fs.rst b/Documentation/filesystems/f2fs.rst
> index 03b1efa6d3b2..95dbcd7ac9a8 100644
> --- a/Documentation/filesystems/f2fs.rst
> +++ b/Documentation/filesystems/f2fs.rst
> @@ -173,9 +173,12 @@ data_flush		 Enable data flushing before checkpoint in order to
>  			 persist data of regular and symlink.
>  reserve_root=%d		 Support configuring reserved space which is used for
>  			 allocation from a privileged user with specified uid or
> -			 gid, unit: 4KB, the default limit is 0.2% of user blocks.
> -resuid=%d		 The user ID which may use the reserved blocks.
> -resgid=%d		 The group ID which may use the reserved blocks.
> +			 gid, unit: 4KB, the default limit is 12.5% of user blocks.
> +reserve_node=%d		 Support configuring reserved nodes which are used for
> +			 allocation from a privileged user with specified uid or
> +			 gid, the default limit is 12.5% of all nodes.
> +resuid=%d		 The user ID which may use the reserved blocks and nodes.
> +resgid=%d		 The group ID which may use the reserved blocks and nodes.
>  fault_injection=%d	 Enable fault injection in all supported types with
>  			 specified injection rate.
>  fault_type=%d		 Support configuring fault injection type, should be
> diff --git a/fs/f2fs/f2fs.h b/fs/f2fs/f2fs.h
> index 97c1a2a3fbd7..70f32c118dac 100644
> --- a/fs/f2fs/f2fs.h
> +++ b/fs/f2fs/f2fs.h
> @@ -131,6 +131,7 @@ extern const char *f2fs_fault_name[FAULT_MAX];
>   * string rather than using the MS_LAZYTIME flag, so this must remain.
>   */
>  #define F2FS_MOUNT_LAZYTIME		0x40000000
> +#define F2FS_MOUNT_RESERVE_NODE		0x80000000
>  
>  #define F2FS_OPTION(sbi)	((sbi)->mount_opt)
>  #define clear_opt(sbi, option)	(F2FS_OPTION(sbi).opt &= ~F2FS_MOUNT_##option)
> @@ -172,6 +173,7 @@ struct f2fs_rwsem {
>  struct f2fs_mount_info {
>  	unsigned int opt;
>  	block_t root_reserved_blocks;	/* root reserved blocks */
> +	block_t root_reserved_nodes;	/* root reserved nodes */
>  	kuid_t s_resuid;		/* reserved blocks for uid */
>  	kgid_t s_resgid;		/* reserved blocks for gid */
>  	int active_logs;		/* # of active logs */
> @@ -2355,13 +2357,11 @@ static inline bool f2fs_has_xattr_block(unsigned int ofs)
>  	return ofs == XATTR_NODE_OFFSET;
>  }
>  
> -static inline bool __allow_reserved_blocks(struct f2fs_sb_info *sbi,
> +static inline bool __allow_reserved_root(struct f2fs_sb_info *sbi,
>  					struct inode *inode, bool cap)
>  {
>  	if (!inode)
>  		return true;
> -	if (!test_opt(sbi, RESERVE_ROOT))
> -		return false;

Oh, I just notice this condition is wrong, let me submit a patch
to fix this, as I hope it can go into stable correctly.

Thanks,

>  	if (IS_NOQUOTA(inode))
>  		return true;
>  	if (uid_eq(F2FS_OPTION(sbi).s_resuid, current_fsuid()))
> @@ -2382,7 +2382,8 @@ static inline unsigned int get_available_block_count(struct f2fs_sb_info *sbi,
>  	avail_user_block_count = sbi->user_block_count -
>  					sbi->current_reserved_blocks;
>  
> -	if (!__allow_reserved_blocks(sbi, inode, cap))
> +	if (test_opt(sbi, RESERVE_ROOT) &&
> +			!__allow_reserved_root(sbi, inode, cap))
>  		avail_user_block_count -= F2FS_OPTION(sbi).root_reserved_blocks;
>  
>  	if (unlikely(is_sbi_flag_set(sbi, SBI_CP_DISABLED))) {
> @@ -2740,7 +2741,7 @@ static inline int inc_valid_node_count(struct f2fs_sb_info *sbi,
>  					struct inode *inode, bool is_inode)
>  {
>  	block_t	valid_block_count;
> -	unsigned int valid_node_count;
> +	unsigned int valid_node_count, avail_user_node_count;
>  	unsigned int avail_user_block_count;
>  	int err;
>  
> @@ -2769,8 +2770,12 @@ static inline int inc_valid_node_count(struct f2fs_sb_info *sbi,
>  		goto enospc;
>  	}
>  
> +	avail_user_node_count = sbi->total_node_count - F2FS_RESERVED_NODE_NUM;
> +	if (test_opt(sbi, RESERVE_NODE) &&
> +			!__allow_reserved_root(sbi, inode, false))
> +		avail_user_node_count -= F2FS_OPTION(sbi).root_reserved_nodes;
>  	valid_node_count = sbi->total_valid_node_count + 1;
> -	if (unlikely(valid_node_count > sbi->total_node_count)) {
> +	if (unlikely(valid_node_count > avail_user_node_count)) {
>  		spin_unlock(&sbi->stat_lock);
>  		goto enospc;
>  	}
> diff --git a/fs/f2fs/super.c b/fs/f2fs/super.c
> index 30c038413040..a24e855a38ed 100644
> --- a/fs/f2fs/super.c
> +++ b/fs/f2fs/super.c
> @@ -143,6 +143,7 @@ enum {
>  	Opt_extent_cache,
>  	Opt_data_flush,
>  	Opt_reserve_root,
> +	Opt_reserve_node,
>  	Opt_resgid,
>  	Opt_resuid,
>  	Opt_mode,
> @@ -265,6 +266,7 @@ static const struct fs_parameter_spec f2fs_param_specs[] = {
>  	fsparam_flag_no("extent_cache", Opt_extent_cache),
>  	fsparam_flag("data_flush", Opt_data_flush),
>  	fsparam_u32("reserve_root", Opt_reserve_root),
> +	fsparam_u32("reserve_node", Opt_reserve_node),
>  	fsparam_gid("resgid", Opt_resgid),
>  	fsparam_uid("resuid", Opt_resuid),
>  	fsparam_enum("mode", Opt_mode, f2fs_param_mode),
> @@ -336,6 +338,7 @@ static match_table_t f2fs_checkpoint_tokens = {
>  #define F2FS_SPEC_discard_unit			(1 << 21)
>  #define F2FS_SPEC_memory_mode			(1 << 22)
>  #define F2FS_SPEC_errors			(1 << 23)
> +#define F2FS_SPEC_reserve_node			(1 << 24)
>  
>  struct f2fs_fs_context {
>  	struct f2fs_mount_info info;
> @@ -437,22 +440,30 @@ static void f2fs_destroy_casefold_cache(void) { }
>  
>  static inline void limit_reserve_root(struct f2fs_sb_info *sbi)
>  {
> -	block_t limit = min((sbi->user_block_count >> 3),
> +	block_t block_limit = min((sbi->user_block_count >> 3),
>  			sbi->user_block_count - sbi->reserved_blocks);
> +	block_t node_limit = sbi->total_node_count >> 3;
>  
>  	/* limit is 12.5% */
>  	if (test_opt(sbi, RESERVE_ROOT) &&
> -			F2FS_OPTION(sbi).root_reserved_blocks > limit) {
> -		F2FS_OPTION(sbi).root_reserved_blocks = limit;
> +			F2FS_OPTION(sbi).root_reserved_blocks > block_limit) {
> +		F2FS_OPTION(sbi).root_reserved_blocks = block_limit;
>  		f2fs_info(sbi, "Reduce reserved blocks for root = %u",
>  			  F2FS_OPTION(sbi).root_reserved_blocks);
>  	}
> -	if (!test_opt(sbi, RESERVE_ROOT) &&
> +	if (test_opt(sbi, RESERVE_NODE) &&
> +			F2FS_OPTION(sbi).root_reserved_nodes > node_limit) {
> +		F2FS_OPTION(sbi).root_reserved_nodes = node_limit;
> +		f2fs_info(sbi, "Reduce reserved nodes for root = %u",
> +			  F2FS_OPTION(sbi).root_reserved_nodes);
> +	}
> +	if (!test_opt(sbi, RESERVE_ROOT) && !test_opt(sbi, RESERVE_NODE) &&
>  		(!uid_eq(F2FS_OPTION(sbi).s_resuid,
>  				make_kuid(&init_user_ns, F2FS_DEF_RESUID)) ||
>  		!gid_eq(F2FS_OPTION(sbi).s_resgid,
>  				make_kgid(&init_user_ns, F2FS_DEF_RESGID))))
> -		f2fs_info(sbi, "Ignore s_resuid=%u, s_resgid=%u w/o reserve_root",
> +		f2fs_info(sbi, "Ignore s_resuid=%u, s_resgid=%u w/o reserve_root"
> +				" and reserve_node",
>  			  from_kuid_munged(&init_user_ns,
>  					   F2FS_OPTION(sbi).s_resuid),
>  			  from_kgid_munged(&init_user_ns,
> @@ -841,6 +852,11 @@ static int f2fs_parse_param(struct fs_context *fc, struct fs_parameter *param)
>  		F2FS_CTX_INFO(ctx).root_reserved_blocks = result.uint_32;
>  		ctx->spec_mask |= F2FS_SPEC_reserve_root;
>  		break;
> +	case Opt_reserve_node:
> +		ctx_set_opt(ctx, F2FS_MOUNT_RESERVE_NODE);
> +		F2FS_CTX_INFO(ctx).root_reserved_nodes = result.uint_32;
> +		ctx->spec_mask |= F2FS_SPEC_reserve_node;
> +		break;
>  	case Opt_resuid:
>  		F2FS_CTX_INFO(ctx).s_resuid = result.uid;
>  		ctx->spec_mask |= F2FS_SPEC_resuid;
> @@ -1424,6 +1440,14 @@ static int f2fs_check_opt_consistency(struct fs_context *fc,
>  		ctx_clear_opt(ctx, F2FS_MOUNT_RESERVE_ROOT);
>  		ctx->opt_mask &= ~F2FS_MOUNT_RESERVE_ROOT;
>  	}
> +	if (test_opt(sbi, RESERVE_NODE) &&
> +			(ctx->opt_mask & F2FS_MOUNT_RESERVE_NODE) &&
> +			ctx_test_opt(ctx, F2FS_MOUNT_RESERVE_NODE)) {
> +		f2fs_info(sbi, "Preserve previous reserve_node=%u",
> +			F2FS_OPTION(sbi).root_reserved_nodes);
> +		ctx_clear_opt(ctx, F2FS_MOUNT_RESERVE_NODE);
> +		ctx->opt_mask &= ~F2FS_MOUNT_RESERVE_NODE;
> +	}
>  
>  	err = f2fs_check_test_dummy_encryption(fc, sb);
>  	if (err)
> @@ -1623,6 +1647,9 @@ static void f2fs_apply_options(struct fs_context *fc, struct super_block *sb)
>  	if (ctx->spec_mask & F2FS_SPEC_reserve_root)
>  		F2FS_OPTION(sbi).root_reserved_blocks =
>  					F2FS_CTX_INFO(ctx).root_reserved_blocks;
> +	if (ctx->spec_mask & F2FS_SPEC_reserve_node)
> +		F2FS_OPTION(sbi).root_reserved_nodes =
> +					F2FS_CTX_INFO(ctx).root_reserved_nodes;
>  	if (ctx->spec_mask & F2FS_SPEC_resgid)
>  		F2FS_OPTION(sbi).s_resgid = F2FS_CTX_INFO(ctx).s_resgid;
>  	if (ctx->spec_mask & F2FS_SPEC_resuid)
> @@ -2342,9 +2369,11 @@ static int f2fs_show_options(struct seq_file *seq, struct dentry *root)
>  	else if (F2FS_OPTION(sbi).fs_mode == FS_MODE_FRAGMENT_BLK)
>  		seq_puts(seq, "fragment:block");
>  	seq_printf(seq, ",active_logs=%u", F2FS_OPTION(sbi).active_logs);
> -	if (test_opt(sbi, RESERVE_ROOT))
> -		seq_printf(seq, ",reserve_root=%u,resuid=%u,resgid=%u",
> +	if (test_opt(sbi, RESERVE_ROOT) || test_opt(sbi, RESERVE_NODE))
> +		seq_printf(seq, ",reserve_root=%u,reserve_node=%u,resuid=%u,"
> +				"resgid=%u",
>  				F2FS_OPTION(sbi).root_reserved_blocks,
> +				F2FS_OPTION(sbi).root_reserved_nodes,
>  				from_kuid_munged(&init_user_ns,
>  					F2FS_OPTION(sbi).s_resuid),
>  				from_kgid_munged(&init_user_ns,



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
