Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 94AC4B1AE29
	for <lists+linux-f2fs-devel@lfdr.de>; Tue,  5 Aug 2025 08:22:44 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:In-Reply-To:References:To:MIME-Version:Date:
	Message-ID:Sender:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=dRIkYEN909qw5tmlkpyWLt3BUNE7BgaoJp2+UyiKUXg=; b=EHRxEpeouaep2o3j2zJ9SFm8Hx
	v6G0LZnTET6NiWi9uAY1NpArWZpFL5VVeaWFZ/zp0NB6IFPlPbjt3Zr/zHFs+WDMhYo4OZUb8mHPT
	BIozncSCuizYW15tAxwbyxkEoUVqDAXOYNuAQKVn0oYFhPZAk4RORK1TVjTtZpEwUK20=;
Received: from [127.0.0.1] (helo=sfs-ml-3.v29.lw.sourceforge.com)
	by sfs-ml-3.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1ujB49-0007hq-Pl;
	Tue, 05 Aug 2025 06:22:29 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-3.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <chao@kernel.org>) id 1ujB47-0007hi-RW
 for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 05 Aug 2025 06:22:27 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 From:References:To:Subject:Cc:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=Luu3Rhxwv33owwHQMblJt90oyh/BiW1KCbFcFuiwqLE=; b=QlgbhJ5sllRBif6RrvaYcV/PhL
 D5Vh75rNKqrHkFph51vzKymupMXjykq9WiEkxwo4b6NdIXdWexoMkvpeD+gdPZOazO9lPoVGYPz5K
 1L/cdzXTjkSF0IQzjRlECPYSpM6szATg06TFtcozRvV4FzXgkstOWgNSsvFvFNeQtfIY=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:To:
 Subject:Cc:MIME-Version:Date:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=Luu3Rhxwv33owwHQMblJt90oyh/BiW1KCbFcFuiwqLE=; b=gfPFLinU6ZIMa4g49OJ+ULgvfb
 4hMxQfb9qWcU0sMqYynq/LzhSGVda32Yi2kyg+/3BtDt/cmT7gwYhEaD3yBakgPXDeU4J1QpGhviK
 JC6V+v4y/V6Yi0wC8omwiAnPky6xJihrH2mazAlOMpmBlhTaXZW878cD7ZKCI8FQH2s4=;
Received: from nyc.source.kernel.org ([147.75.193.91])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1ujB47-0003A8-2v for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 05 Aug 2025 06:22:27 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id 71D29A55BC6;
 Tue,  5 Aug 2025 06:22:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A0252C4CEF4;
 Tue,  5 Aug 2025 06:22:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1754374936;
 bh=6uLVdU8+uyFZR8v0+QdDzKXZRemfEYYr4oJg7JUG+UY=;
 h=Date:Cc:Subject:To:References:From:In-Reply-To:From;
 b=OteCcpZ7cdWQLhfYLalP5SwsMO2Tf0LidHI+1mXrtwGzEEClCxlbRD5oBMEEufxp2
 26wDR1s871RS4J+qW1J+VYVo2p/Uv2I+0D/U+RZK62pO+/6Td6+z3Psny3oA7TDuPn
 vlrHA6kFiDvDMcp8RcAcDBfo8kU2SQWlGGIsJYJs0uJzC8RevyFT6IBpYhS+PnWXS7
 IGg7e8roTqV7IJgi0hHGVR9iFQJI1F4uunUINNhxHcO5PCAoinI/cSagWXlCWVz6zp
 WyHjtU4Aveo+t2jBxnHgyuqQVUvlQDKxqSm+wNmPsdM9kS3LB5pNureafn/8Bka1FA
 hEj95M1rfIxag==
Message-ID: <c3ec89a5-5eb5-4358-92eb-27c9406027a2@kernel.org>
Date: Tue, 5 Aug 2025 14:22:12 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Daniel Lee <chullee@google.com>, Jaegeuk Kim <jaegeuk@kernel.org>
References: <20250804230558.746338-1-chullee@google.com>
Content-Language: en-US
In-Reply-To: <20250804230558.746338-1-chullee@google.com>
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-1.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 8/5/25 07:05,
 Daniel Lee wrote: > For casefolded directories, 
 f2fs may fall back to a linear search if > a hash-based lookup fails. This
 can cause severe performance > regressions. > > While this b [...] 
 Content analysis details:   (-0.2 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 RCVD_IN_DNSWL_BLOCKED  RBL: ADMINISTRATOR NOTICE: The query to DNSWL
 was blocked.  See
 http://wiki.apache.org/spamassassin/DnsBlocklists#DnsBlocklists-dnsbl-block
 for more information. [147.75.193.91 listed in list.dnswl.org]
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1ujB47-0003A8-2v
Subject: Re: [f2fs-dev] [PATCH v2 1/2] f2fs: add lookup_mode mount option
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

On 8/5/25 07:05, Daniel Lee wrote:
> For casefolded directories, f2fs may fall back to a linear search if
> a hash-based lookup fails. This can cause severe performance
> regressions.
> 
> While this behavior can be controlled by userspace tools (e.g. mkfs,
> fsck) by setting an on-disk flag, a kernel-level solution is needed
> to guarantee the lookup behavior regardless of the on-disk state.
> 
> This commit introduces the 'lookup_mode' mount option to provide this
> kernel-side control.
> 
> The option accepts three values:
> - perf: (Default) Enforces a hash-only lookup. The linear fallback
>   is always disabled.
> - compat: Enables the linear search fallback for compatibility with
>   directory entries from older kernels.
> - auto: Determines the mode based on the on-disk flag, preserving the
>   userspace-based behavior.
> 
> Signed-off-by: Daniel Lee <chullee@google.com>
> ---
> v2:
> - rework mount option parsing to use the new mount API.
> - add lookup_mode field to struct f2fs_mount_info.
> - add show_options support for the new option.
>  Documentation/filesystems/f2fs.rst | 19 +++++++++++++++++++
>  fs/f2fs/dir.c                      | 17 ++++++++++++++++-
>  fs/f2fs/f2fs.h                     |  7 +++++++
>  fs/f2fs/super.c                    | 25 +++++++++++++++++++++++++
>  4 files changed, 67 insertions(+), 1 deletion(-)
> 
> diff --git a/Documentation/filesystems/f2fs.rst b/Documentation/filesystems/f2fs.rst
> index 03b1efa6d3b2..a80ed82a547a 100644
> --- a/Documentation/filesystems/f2fs.rst
> +++ b/Documentation/filesystems/f2fs.rst
> @@ -370,6 +370,25 @@ errors=%s		 Specify f2fs behavior on critical errors. This supports modes:
>  			 ====================== =============== =============== ========
>  nat_bits		 Enable nat_bits feature to enhance full/empty nat blocks access,
>  			 by default it's disabled.
> +lookup_mode=%s		 Control the directory lookup behavior for casefolded
> +			 directories. This option has no effect on directories
> +			 that do not have the casefold feature enabled.
> +
> +			 ================== ========================================
> +			 Value		    Description
> +			 ================== ========================================
> +			 perf		    (Default) Enforces a hash-only lookup.
> +					    The linear search fallback is always
> +					    disabled, ignoring the on-disk flag.
> +			 compat		    Enables the linear search fallback for
> +					    compatibility with directory entries
> +					    created by older kernel that used a
> +					    different case-folding algorithm.
> +					    This mode ignores the on-disk flag.
> +			 auto		    F2FS determines the mode based on the
> +					    on-disk `SB_ENC_NO_COMPAT_FALLBACK_FL`
> +					    flag.
> +			 ================== ========================================
>  ======================== ============================================================
>  
>  Debugfs Entries
> diff --git a/fs/f2fs/dir.c b/fs/f2fs/dir.c
> index fffd7749d6d1..48f4f98afb01 100644
> --- a/fs/f2fs/dir.c
> +++ b/fs/f2fs/dir.c
> @@ -16,6 +16,21 @@
>  #include "xattr.h"
>  #include <trace/events/f2fs.h>
>  
> +static inline bool f2fs_should_fallback_to_linear(struct inode *dir)
> +{
> +	struct f2fs_sb_info *sbi = F2FS_I_SB(dir);
> +
> +	switch (F2FS_OPTION(sbi).lookup_mode) {
> +	case LOOKUP_PERF:
> +		return false;
> +	case LOOKUP_COMPAT:
> +		return true;
> +	case LOOKUP_AUTO:
> +		return !sb_no_casefold_compat_fallback(sbi->sb);
> +	}
> +	return false;
> +}
> +
>  #if IS_ENABLED(CONFIG_UNICODE)
>  extern struct kmem_cache *f2fs_cf_name_slab;
>  #endif
> @@ -366,7 +381,7 @@ struct f2fs_dir_entry *__f2fs_find_entry(struct inode *dir,
>  
>  out:
>  #if IS_ENABLED(CONFIG_UNICODE)
> -	if (!sb_no_casefold_compat_fallback(dir->i_sb) &&
> +	if (f2fs_should_fallback_to_linear(dir) &&
>  		IS_CASEFOLDED(dir) && !de && use_hash) {
>  		use_hash = false;
>  		goto start_find_entry;
> diff --git a/fs/f2fs/f2fs.h b/fs/f2fs/f2fs.h
> index 7029aa8b430e..1c0edb8a7134 100644
> --- a/fs/f2fs/f2fs.h
> +++ b/fs/f2fs/f2fs.h
> @@ -212,6 +212,7 @@ struct f2fs_mount_info {
>  	int compress_mode;			/* compression mode */
>  	unsigned char extensions[COMPRESS_EXT_NUM][F2FS_EXTENSION_LEN];	/* extensions */
>  	unsigned char noextensions[COMPRESS_EXT_NUM][F2FS_EXTENSION_LEN]; /* extensions */
> +	unsigned int lookup_mode;
>  };
>  
>  #define F2FS_FEATURE_ENCRYPT			0x00000001
> @@ -1448,6 +1449,12 @@ enum {
>  	TOTAL_CALL = FOREGROUND,
>  };
>  
> +enum f2fs_lookup_mode {
> +	LOOKUP_PERF,
> +	LOOKUP_COMPAT,
> +	LOOKUP_AUTO,
> +};
> +
>  static inline int f2fs_test_bit(unsigned int nr, char *addr);
>  static inline void f2fs_set_bit(unsigned int nr, char *addr);
>  static inline void f2fs_clear_bit(unsigned int nr, char *addr);
> diff --git a/fs/f2fs/super.c b/fs/f2fs/super.c
> index e16c4e2830c2..ed17ab4d5cef 100644
> --- a/fs/f2fs/super.c
> +++ b/fs/f2fs/super.c
> @@ -181,6 +181,7 @@ enum {
>  	Opt_nat_bits,
>  	Opt_jqfmt,
>  	Opt_checkpoint,
> +	Opt_lookup_mode,
>  	Opt_err,
>  };
>  
> @@ -244,6 +245,13 @@ static const struct constant_table f2fs_param_errors[] = {
>  	{}
>  };
>  
> +static const struct constant_table f2fs_param_lookup_mode[] = {
> +	{"perf",	LOOKUP_PERF},
> +	{"compat",	LOOKUP_COMPAT},
> +	{"auto",	LOOKUP_AUTO},
> +	{}
> +};
> +
>  static const struct fs_parameter_spec f2fs_param_specs[] = {
>  	fsparam_enum("background_gc", Opt_gc_background, f2fs_param_background_gc),
>  	fsparam_flag("disable_roll_forward", Opt_disable_roll_forward),
> @@ -300,6 +308,7 @@ static const struct fs_parameter_spec f2fs_param_specs[] = {
>  	fsparam_enum("memory", Opt_memory_mode, f2fs_param_memory_mode),
>  	fsparam_flag("age_extent_cache", Opt_age_extent_cache),
>  	fsparam_enum("errors", Opt_errors, f2fs_param_errors),
> +	fsparam_enum("lookup_mode", Opt_lookup_mode, f2fs_param_lookup_mode),
>  	{}
>  };
>  
> @@ -336,6 +345,7 @@ static match_table_t f2fs_checkpoint_tokens = {
>  #define F2FS_SPEC_discard_unit			(1 << 21)
>  #define F2FS_SPEC_memory_mode			(1 << 22)
>  #define F2FS_SPEC_errors			(1 << 23)
> +#define F2FS_SPEC_lookup_mode			(1 << 24)
>  
>  struct f2fs_fs_context {
>  	struct f2fs_mount_info info;
> @@ -1143,6 +1153,10 @@ static int f2fs_parse_param(struct fs_context *fc, struct fs_parameter *param)
>  	case Opt_nat_bits:
>  		ctx_set_opt(ctx, F2FS_MOUNT_NAT_BITS);
>  		break;
> +	case Opt_lookup_mode:
> +		F2FS_CTX_INFO(ctx).lookup_mode = result.uint_32;
> +		ctx->spec_mask |= F2FS_SPEC_lookup_mode;
> +		break;
>  	}
>  	return 0;
>  }
> @@ -1652,6 +1666,8 @@ static void f2fs_apply_options(struct fs_context *fc, struct super_block *sb)
>  		F2FS_OPTION(sbi).memory_mode = F2FS_CTX_INFO(ctx).memory_mode;
>  	if (ctx->spec_mask & F2FS_SPEC_errors)
>  		F2FS_OPTION(sbi).errors = F2FS_CTX_INFO(ctx).errors;
> +	if (ctx->spec_mask & F2FS_SPEC_lookup_mode)
> +		F2FS_OPTION(sbi).lookup_mode = F2FS_CTX_INFO(ctx).lookup_mode;
>  
>  	f2fs_apply_compression(fc, sb);
>  	f2fs_apply_test_dummy_encryption(fc, sb);
> @@ -2416,6 +2432,13 @@ static int f2fs_show_options(struct seq_file *seq, struct dentry *root)
>  	if (test_opt(sbi, NAT_BITS))
>  		seq_puts(seq, ",nat_bits");
>  
> +	if (F2FS_OPTION(sbi).lookup_mode != LOOKUP_PERF) {
> +		if (F2FS_OPTION(sbi).lookup_mode == LOOKUP_COMPAT)
> +			seq_show_option(seq, "lookup_mode", "compat");
> +		else if (F2FS_OPTION(sbi).lookup_mode == LOOKUP_AUTO)
> +			seq_show_option(seq, "lookup_mode", "auto");

Can we show "lookup_mode=perf" in mount option as well?

Thanks,

> +	}
> +
>  	return 0;
>  }
>  
> @@ -2480,6 +2503,8 @@ static void default_options(struct f2fs_sb_info *sbi, bool remount)
>  #endif
>  
>  	f2fs_build_fault_attr(sbi, 0, 0, FAULT_ALL);
> +
> +	F2FS_OPTION(sbi).lookup_mode = LOOKUP_PERF;
>  }
>  
>  #ifdef CONFIG_QUOTA



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
