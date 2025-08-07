Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id E8FC1B1DF7F
	for <lists+linux-f2fs-devel@lfdr.de>; Fri,  8 Aug 2025 00:57:32 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:In-Reply-To:MIME-Version:References:
	Message-ID:To:Date:Sender:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=t79aJYmzd2zqM/1zoeRRQx2yGC3D+ITFPoDIEzQAto0=; b=gr+Ok6moE5jCCJQHBQcpqDMBkD
	obFk9QleAQNwUz2DxVOrfq9f6G5iMdun3ngR43dhpmi1lCVsYUJXAYcATgwejtvoLOX1XRjKk9mP6
	2tdb4vJiUqUkRJRjx4TeisDEh5b2Ef74FbIiR0E5MilLPyHO6Xt+ye9kFPOLjwCC2xB4=;
Received: from [127.0.0.1] (helo=sfs-ml-3.v29.lw.sourceforge.com)
	by sfs-ml-3.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1uk9Y6-0006ah-3C;
	Thu, 07 Aug 2025 22:57:26 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-3.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <jaegeuk@kernel.org>) id 1uk9Y4-0006aZ-1X
 for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 07 Aug 2025 22:57:24 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=mawuoBVczi8u5rlN32K/D0BDiszW+QC0PnqixlIXH8M=; b=kFSvctDO7QY3tzQucuSxASQTTN
 vZBCYLuQ0TWIlexMjItcsAiGAL7DA/VhtZy/h8QuGONhOlQ3uEeCcz+WrQQhrZ3VJJ+y8G8L7YKKP
 QHxx53jN2U8jwQ1DWD7YdU+shClCDOERbFfPXz8UrYv80uoaB8vEr9bP9FbkJOytQMIk=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=mawuoBVczi8u5rlN32K/D0BDiszW+QC0PnqixlIXH8M=; b=J/tKws925a6rAMLIGzGE2BMEWP
 CmGXm7gdrB8qnSTB/Uv9vmDzPI8uVYzfjCptMftCNjiNueLwrHSk4CiCLknSms8lkmpvy6CSWM+ve
 Ld+vl8sXfOfP1Nl0qezlKa90Y6OmjMF289uxrql46qrVReTJ2aYh2YhTWhEyNpzWGmfQ=;
Received: from tor.source.kernel.org ([172.105.4.254])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1uk9Y3-0001pW-73 for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 07 Aug 2025 22:57:23 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 4D9B3601BB;
 Thu,  7 Aug 2025 22:57:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CA189C4CEEB;
 Thu,  7 Aug 2025 22:57:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1754607432;
 bh=c8duk4lraiBt/JWLIRh8rR4h2Qs+lHhpdIDqCzZilBw=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=QYyd6Z2PmYdU5EfQLe2Hc6hQ4YbnHzBaYL+cxlh2swCCvGXc6nt8LUQsPI+IPOnuL
 BC7caO1ePbookhOsx6M5cFZrnhcIPEWLmjgGb2F9Cng+CaUO72Y9nvUHz0WJZwHia1
 IMz8GFLrg84gEOvObk0RAAvHGBlYvvEbJhyfW53wk6QKX6PVaJwco/WqLobkmddrM8
 4fFqJrbsFtS+gwyo2dzvLnz77LymkX6FrQ78B9b/uG9rp85lGGD/RHn0xNz53BepQE
 TggYxTYQ/tNTUDkb48EYh59dmvnumS+nmxZwAtYJioHwdzaOc5XCH6mlDwKCwX1vsa
 e+aP2qqTU6vWg==
Date: Thu, 7 Aug 2025 22:57:10 +0000
To: Chunhai Guo <guochunhai@vivo.com>
Message-ID: <aJUvRjNZ124o-Quk@google.com>
References: <20250807133501.551848-1-guochunhai@vivo.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20250807133501.551848-1-guochunhai@vivo.com>
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-1.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  By the way, can we also add some testcases in xfstests to
 check all this works as intended? On 08/07, Chunhai Guo wrote: > This patch
 allows privileged users to reserve nodes via the > 'reserve_node' mount option,
 which is similar to the existing > 'reserve_root' option. > > "-o reserve_node
 [...] Content analysis details:   (-0.2 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1uk9Y3-0001pW-73
Subject: Re: [f2fs-dev] [PATCH v6] f2fs: add reserved nodes for privileged
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
From: Jaegeuk Kim via Linux-f2fs-devel <linux-f2fs-devel@lists.sourceforge.net>
Reply-To: Jaegeuk Kim <jaegeuk@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

By the way, can we also add some testcases in xfstests to check all this
works as intended?

On 08/07, Chunhai Guo wrote:
> This patch allows privileged users to reserve nodes via the
> 'reserve_node' mount option, which is similar to the existing
> 'reserve_root' option.
> 
> "-o reserve_node=<N>" means <N> nodes are reserved for privileged
> users only.
> 
> Signed-off-by: Chunhai Guo <guochunhai@vivo.com>
> ---
> v5->v6: Modified F2FS_SPEC_reserve_node from (1<<24) to (1<<25) following Zhiguo's suggestion in v5.
> v4->v5: Apply Chao's suggestion from v4.
> v3->v4: Rebase this patch on https://lore.kernel.org/linux-f2fs-devel/20250731060338.1136086-1-chao@kernel.org
> v2->v3: Apply Chao's suggestion from v2.
> v1->v2: Add two missing handling parts.
> v1: https://lore.kernel.org/linux-f2fs-devel/20250729095238.607433-1-guochunhai@vivo.com/
> ---
>  Documentation/filesystems/f2fs.rst |  9 ++++---
>  fs/f2fs/f2fs.h                     | 17 ++++++++----
>  fs/f2fs/super.c                    | 43 +++++++++++++++++++++++++-----
>  3 files changed, 54 insertions(+), 15 deletions(-)
> 
> diff --git a/Documentation/filesystems/f2fs.rst b/Documentation/filesystems/f2fs.rst
> index 5cad369ceb92..e06cbb823bb7 100644
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
> index f19472eb2789..047964d66736 100644
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
> @@ -178,6 +179,7 @@ struct f2fs_rwsem {
>  struct f2fs_mount_info {
>  	unsigned int opt;
>  	block_t root_reserved_blocks;	/* root reserved blocks */
> +	block_t root_reserved_nodes;	/* root reserved nodes */
>  	kuid_t s_resuid;		/* reserved blocks for uid */
>  	kgid_t s_resgid;		/* reserved blocks for gid */
>  	int active_logs;		/* # of active logs */
> @@ -2407,7 +2409,7 @@ static inline bool f2fs_has_xattr_block(unsigned int ofs)
>  	return ofs == XATTR_NODE_OFFSET;
>  }
>  
> -static inline bool __allow_reserved_blocks(struct f2fs_sb_info *sbi,
> +static inline bool __allow_reserved_root(struct f2fs_sb_info *sbi,
>  					struct inode *inode, bool cap)
>  {
>  	if (!inode)
> @@ -2432,7 +2434,7 @@ static inline unsigned int get_available_block_count(struct f2fs_sb_info *sbi,
>  	avail_user_block_count = sbi->user_block_count -
>  					sbi->current_reserved_blocks;
>  
> -	if (test_opt(sbi, RESERVE_ROOT) && !__allow_reserved_blocks(sbi, inode, cap))
> +	if (test_opt(sbi, RESERVE_ROOT) && !__allow_reserved_root(sbi, inode, cap))
>  		avail_user_block_count -= F2FS_OPTION(sbi).root_reserved_blocks;
>  
>  	if (unlikely(is_sbi_flag_set(sbi, SBI_CP_DISABLED))) {
> @@ -2790,7 +2792,7 @@ static inline int inc_valid_node_count(struct f2fs_sb_info *sbi,
>  					struct inode *inode, bool is_inode)
>  {
>  	block_t	valid_block_count;
> -	unsigned int valid_node_count;
> +	unsigned int valid_node_count, avail_user_node_count;
>  	unsigned int avail_user_block_count;
>  	int err;
>  
> @@ -2812,15 +2814,20 @@ static inline int inc_valid_node_count(struct f2fs_sb_info *sbi,
>  	spin_lock(&sbi->stat_lock);
>  
>  	valid_block_count = sbi->total_valid_block_count + 1;
> -	avail_user_block_count = get_available_block_count(sbi, inode, false);
> +	avail_user_block_count = get_available_block_count(sbi, inode,
> +			test_opt(sbi, RESERVE_NODE));
>  
>  	if (unlikely(valid_block_count > avail_user_block_count)) {
>  		spin_unlock(&sbi->stat_lock);
>  		goto enospc;
>  	}
>  
> +	avail_user_node_count = sbi->total_node_count - F2FS_RESERVED_NODE_NUM;
> +	if (test_opt(sbi, RESERVE_NODE) &&
> +			!__allow_reserved_root(sbi, inode, true))
> +		avail_user_node_count -= F2FS_OPTION(sbi).root_reserved_nodes;
>  	valid_node_count = sbi->total_valid_node_count + 1;
> -	if (unlikely(valid_node_count > sbi->total_node_count)) {
> +	if (unlikely(valid_node_count > avail_user_node_count)) {
>  		spin_unlock(&sbi->stat_lock);
>  		goto enospc;
>  	}
> diff --git a/fs/f2fs/super.c b/fs/f2fs/super.c
> index 3f8bc42e0968..f37004780ce0 100644
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
> @@ -273,6 +274,7 @@ static const struct fs_parameter_spec f2fs_param_specs[] = {
>  	fsparam_flag_no("extent_cache", Opt_extent_cache),
>  	fsparam_flag("data_flush", Opt_data_flush),
>  	fsparam_u32("reserve_root", Opt_reserve_root),
> +	fsparam_u32("reserve_node", Opt_reserve_node),
>  	fsparam_gid("resgid", Opt_resgid),
>  	fsparam_uid("resuid", Opt_resuid),
>  	fsparam_enum("mode", Opt_mode, f2fs_param_mode),
> @@ -346,6 +348,7 @@ static match_table_t f2fs_checkpoint_tokens = {
>  #define F2FS_SPEC_memory_mode			(1 << 22)
>  #define F2FS_SPEC_errors			(1 << 23)
>  #define F2FS_SPEC_lookup_mode			(1 << 24)
> +#define F2FS_SPEC_reserve_node			(1 << 25)
>  
>  struct f2fs_fs_context {
>  	struct f2fs_mount_info info;
> @@ -447,22 +450,30 @@ static void f2fs_destroy_casefold_cache(void) { }
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
> @@ -851,6 +862,11 @@ static int f2fs_parse_param(struct fs_context *fc, struct fs_parameter *param)
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
> @@ -1438,6 +1454,14 @@ static int f2fs_check_opt_consistency(struct fs_context *fc,
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
> @@ -1637,6 +1661,9 @@ static void f2fs_apply_options(struct fs_context *fc, struct super_block *sb)
>  	if (ctx->spec_mask & F2FS_SPEC_reserve_root)
>  		F2FS_OPTION(sbi).root_reserved_blocks =
>  					F2FS_CTX_INFO(ctx).root_reserved_blocks;
> +	if (ctx->spec_mask & F2FS_SPEC_reserve_node)
> +		F2FS_OPTION(sbi).root_reserved_nodes =
> +					F2FS_CTX_INFO(ctx).root_reserved_nodes;
>  	if (ctx->spec_mask & F2FS_SPEC_resgid)
>  		F2FS_OPTION(sbi).s_resgid = F2FS_CTX_INFO(ctx).s_resgid;
>  	if (ctx->spec_mask & F2FS_SPEC_resuid)
> @@ -2359,9 +2386,11 @@ static int f2fs_show_options(struct seq_file *seq, struct dentry *root)
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
> -- 
> 2.34.1


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
