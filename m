Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 89E59AACEC8
	for <lists+linux-f2fs-devel@lfdr.de>; Tue,  6 May 2025 22:24:42 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:In-Reply-To:MIME-Version:References:
	Message-ID:To:Date:Sender:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Kir9pJqEhE6skIeTcDJ6ocOihLsEo0IGvGXwKE+t0C0=; b=j2kEFQplMhuySXUyhH1Ixg6vXZ
	86AvcxpIQ1+wLs32JZV/lp8e9w6K0YbLQtqlzH4KFH4mIjbljcw/OxhJqY0vU5tj/OCAzqTSm66oz
	+rjnhO+X+N0YvDJeLNg1gEWNZhHKKDhHEYqDyN54fU113w210NXOJNZzpg9T6mhAn8hw=;
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1uCOq8-0001o5-LB;
	Tue, 06 May 2025 20:24:32 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <jaegeuk@kernel.org>) id 1uCOq6-0001nx-Q4
 for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 06 May 2025 20:24:30 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=d4urZ71vuyT8eht65gUtT5xebdHsTtnbDCLNjOMYdbU=; b=BiPMeP7VBHU2f5mlq4l2cu29MA
 sS69NcM3T7v+c/dmxC3YV7ge23vfbG8JbVS6doWCHT3yIxAyS41SVqRikpZEJ7FmC7k+l7ApHbULq
 HqGmH4T9vQWdWowsF4zyvnCmy9Q4DVfEg3DSXk5GcE1SWhE/w3kj7MGyBQWGh5BQs/P0=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=d4urZ71vuyT8eht65gUtT5xebdHsTtnbDCLNjOMYdbU=; b=eDsfLq9SMoPdmbXaqjyP/dNb8h
 I1tHorH0SnfsLtqzSu8zThK8jPmgYPlf+xd2yNJgeH8Wsw/Qjv4DPn1ZBmpCy0kjBqHoCI7pkzSoZ
 Yyp4tvWNwVImnF4lhxbD6CdPHKa7lSIH+7EZn9/1bXaVCjoJPb8tb9bPmim6duhByuUg=;
Received: from dfw.source.kernel.org ([139.178.84.217])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1uCOpp-00085W-RB for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 06 May 2025 20:24:30 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id B6EFE5C31BC;
 Tue,  6 May 2025 20:21:49 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 559F5C4CEE4;
 Tue,  6 May 2025 20:24:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1746563046;
 bh=I/pKuaPSKgxKWabUvyWb3lHK+h+bIXqJNADRY5eBmXk=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=A1xxAEq345WIOhybafd4rOQrd6/5y0n0BSl6L6SLFdwlgy4iEE4tatUtbvIDFO5TE
 DI7N1NxWnQEABnMGNzE7MEkdPQ2JDUGrYQi0QYEF1DqXgWSFyI8JCu7sOuMzsn3veu
 oGzvxPjry8ei8g30wQbJntBiluhYVryhXBMahRty+wtqq2o/U7ukYNiVcqYj5fGkyI
 /WdNz7qNSp7qlyTmbxZPwioL/mH4ZVwhCr1JR5lVtFJTEa42V8hAnWgrKawmrMiM2D
 mc6uagBHO2tnXUE3jVAFNHh04NrmoNj9dqpZjdy5NVQIW8RtPU/31w9OwSb76BbU/X
 1N/KYZvvwG9yQ==
Date: Tue, 6 May 2025 20:24:04 +0000
To: Eric Sandeen <sandeen@redhat.com>
Message-ID: <aBpv5Mf0ts3AfrAk@google.com>
References: <20250423170926.76007-1-sandeen@redhat.com>
 <20250423170926.76007-3-sandeen@redhat.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20250423170926.76007-3-sandeen@redhat.com>
X-Spam-Score: -6.6 (------)
X-Spam-Report: Spam detection software, running on the system "6901ab67b84d", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 04/23,
 Eric Sandeen wrote: > From: Hongbo Li <lihongbo22@huawei.com>
 > > In handle_mount_opt, we use fs_parameter to parse each option. > However
 we're still using the old API to get the options st [...] 
 Content analysis details:   (-6.6 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/, high
 trust [139.178.84.217 listed in list.dnswl.org]
 -1.4 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1uCOpp-00085W-RB
Subject: Re: [f2fs-dev] [PATCH V3 2/7] f2fs: move the option parser into
 handle_mount_opt
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
Cc: linux-fsdevel@vger.kernel.org, lihongbo22@huawei.com,
 linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On 04/23, Eric Sandeen wrote:
> From: Hongbo Li <lihongbo22@huawei.com>
> 
> In handle_mount_opt, we use fs_parameter to parse each option.
> However we're still using the old API to get the options string.
> Using fsparams parse_options allows us to remove many of the Opt_
> enums, so remove them.
> 
> The checkpoint disable cap (or percent) involves rather complex
> parsing; we retain the old match_table mechanism for this, which
> handles it well.
> 
> There are some changes about parsing options:
>   1. For `active_logs`, `inline_xattr_size` and `fault_injection`,
>      we use s32 type according the internal structure to record the
>      option's value.
> 
> Signed-off-by: Hongbo Li <lihongbo22@huawei.com>
> [sandeen: forward port, minor fixes and updates]
> Signed-off-by: Eric Sandeen <sandeen@redhat.com>
> ---
>  fs/f2fs/super.c | 1061 ++++++++++++++++++-----------------------------
>  1 file changed, 406 insertions(+), 655 deletions(-)
> 
> diff --git a/fs/f2fs/super.c b/fs/f2fs/super.c
> index ebea03bba054..20dee7c40d59 100644
> --- a/fs/f2fs/super.c
> +++ b/fs/f2fs/super.c
> @@ -27,6 +27,7 @@
>  #include <linux/part_stat.h>
>  #include <linux/zstd.h>
>  #include <linux/lz4.h>
> +#include <linux/ctype.h>
>  #include <linux/fs_parser.h>
>  
>  #include "f2fs.h"
> @@ -124,29 +125,20 @@ enum {
>  	Opt_disable_roll_forward,
>  	Opt_norecovery,
>  	Opt_discard,
> -	Opt_nodiscard,
>  	Opt_noheap,
>  	Opt_heap,
>  	Opt_user_xattr,
> -	Opt_nouser_xattr,
>  	Opt_acl,
> -	Opt_noacl,
>  	Opt_active_logs,
>  	Opt_disable_ext_identify,
>  	Opt_inline_xattr,
> -	Opt_noinline_xattr,
>  	Opt_inline_xattr_size,
>  	Opt_inline_data,
>  	Opt_inline_dentry,
> -	Opt_noinline_dentry,
>  	Opt_flush_merge,
> -	Opt_noflush_merge,
>  	Opt_barrier,
> -	Opt_nobarrier,
>  	Opt_fastboot,
>  	Opt_extent_cache,
> -	Opt_noextent_cache,
> -	Opt_noinline_data,
>  	Opt_data_flush,
>  	Opt_reserve_root,
>  	Opt_resgid,
> @@ -155,21 +147,13 @@ enum {
>  	Opt_fault_injection,
>  	Opt_fault_type,
>  	Opt_lazytime,
> -	Opt_nolazytime,
>  	Opt_quota,
> -	Opt_noquota,
>  	Opt_usrquota,
>  	Opt_grpquota,
>  	Opt_prjquota,
>  	Opt_usrjquota,
>  	Opt_grpjquota,
>  	Opt_prjjquota,
> -	Opt_offusrjquota,
> -	Opt_offgrpjquota,
> -	Opt_offprjjquota,
> -	Opt_jqfmt_vfsold,
> -	Opt_jqfmt_vfsv0,
> -	Opt_jqfmt_vfsv1,
>  	Opt_alloc,
>  	Opt_fsync,
>  	Opt_test_dummy_encryption,
> @@ -179,17 +163,15 @@ enum {
>  	Opt_checkpoint_disable_cap_perc,
>  	Opt_checkpoint_enable,
>  	Opt_checkpoint_merge,
> -	Opt_nocheckpoint_merge,
>  	Opt_compress_algorithm,
>  	Opt_compress_log_size,
> -	Opt_compress_extension,
>  	Opt_nocompress_extension,
> +	Opt_compress_extension,
>  	Opt_compress_chksum,
>  	Opt_compress_mode,
>  	Opt_compress_cache,
>  	Opt_atgc,
>  	Opt_gc_merge,
> -	Opt_nogc_merge,
>  	Opt_discard_unit,
>  	Opt_memory_mode,
>  	Opt_age_extent_cache,
> @@ -319,83 +301,12 @@ static const struct fs_parameter_spec f2fs_param_specs[] = {
>  	{}
>  };
>  
> -static match_table_t f2fs_tokens = {
> -	{Opt_gc_background, "background_gc=%s"},
> -	{Opt_disable_roll_forward, "disable_roll_forward"},
> -	{Opt_norecovery, "norecovery"},
> -	{Opt_discard, "discard"},
> -	{Opt_nodiscard, "nodiscard"},
> -	{Opt_noheap, "no_heap"},
> -	{Opt_heap, "heap"},
> -	{Opt_user_xattr, "user_xattr"},
> -	{Opt_nouser_xattr, "nouser_xattr"},
> -	{Opt_acl, "acl"},
> -	{Opt_noacl, "noacl"},
> -	{Opt_active_logs, "active_logs=%u"},
> -	{Opt_disable_ext_identify, "disable_ext_identify"},
> -	{Opt_inline_xattr, "inline_xattr"},
> -	{Opt_noinline_xattr, "noinline_xattr"},
> -	{Opt_inline_xattr_size, "inline_xattr_size=%u"},
> -	{Opt_inline_data, "inline_data"},
> -	{Opt_inline_dentry, "inline_dentry"},
> -	{Opt_noinline_dentry, "noinline_dentry"},
> -	{Opt_flush_merge, "flush_merge"},
> -	{Opt_noflush_merge, "noflush_merge"},
> -	{Opt_barrier, "barrier"},
> -	{Opt_nobarrier, "nobarrier"},
> -	{Opt_fastboot, "fastboot"},
> -	{Opt_extent_cache, "extent_cache"},
> -	{Opt_noextent_cache, "noextent_cache"},
> -	{Opt_noinline_data, "noinline_data"},
> -	{Opt_data_flush, "data_flush"},
> -	{Opt_reserve_root, "reserve_root=%u"},
> -	{Opt_resgid, "resgid=%u"},
> -	{Opt_resuid, "resuid=%u"},
> -	{Opt_mode, "mode=%s"},
> -	{Opt_fault_injection, "fault_injection=%u"},
> -	{Opt_fault_type, "fault_type=%u"},
> -	{Opt_lazytime, "lazytime"},
> -	{Opt_nolazytime, "nolazytime"},
> -	{Opt_quota, "quota"},
> -	{Opt_noquota, "noquota"},
> -	{Opt_usrquota, "usrquota"},
> -	{Opt_grpquota, "grpquota"},
> -	{Opt_prjquota, "prjquota"},
> -	{Opt_usrjquota, "usrjquota=%s"},
> -	{Opt_grpjquota, "grpjquota=%s"},
> -	{Opt_prjjquota, "prjjquota=%s"},
> -	{Opt_offusrjquota, "usrjquota="},
> -	{Opt_offgrpjquota, "grpjquota="},
> -	{Opt_offprjjquota, "prjjquota="},
> -	{Opt_jqfmt_vfsold, "jqfmt=vfsold"},
> -	{Opt_jqfmt_vfsv0, "jqfmt=vfsv0"},
> -	{Opt_jqfmt_vfsv1, "jqfmt=vfsv1"},
> -	{Opt_alloc, "alloc_mode=%s"},
> -	{Opt_fsync, "fsync_mode=%s"},
> -	{Opt_test_dummy_encryption, "test_dummy_encryption=%s"},
> -	{Opt_test_dummy_encryption, "test_dummy_encryption"},
> -	{Opt_inlinecrypt, "inlinecrypt"},
> -	{Opt_checkpoint_disable, "checkpoint=disable"},
> -	{Opt_checkpoint_disable_cap, "checkpoint=disable:%u"},
> -	{Opt_checkpoint_disable_cap_perc, "checkpoint=disable:%u%%"},
> -	{Opt_checkpoint_enable, "checkpoint=enable"},
> -	{Opt_checkpoint_merge, "checkpoint_merge"},
> -	{Opt_nocheckpoint_merge, "nocheckpoint_merge"},
> -	{Opt_compress_algorithm, "compress_algorithm=%s"},
> -	{Opt_compress_log_size, "compress_log_size=%u"},
> -	{Opt_compress_extension, "compress_extension=%s"},
> -	{Opt_nocompress_extension, "nocompress_extension=%s"},
> -	{Opt_compress_chksum, "compress_chksum"},
> -	{Opt_compress_mode, "compress_mode=%s"},
> -	{Opt_compress_cache, "compress_cache"},
> -	{Opt_atgc, "atgc"},
> -	{Opt_gc_merge, "gc_merge"},
> -	{Opt_nogc_merge, "nogc_merge"},
> -	{Opt_discard_unit, "discard_unit=%s"},
> -	{Opt_memory_mode, "memory=%s"},
> -	{Opt_age_extent_cache, "age_extent_cache"},
> -	{Opt_errors, "errors=%s"},
> -	{Opt_nat_bits, "nat_bits"},
> +/* Resort to a match_table for this interestingly formatted option */
> +static match_table_t f2fs_checkpoint_tokens = {
> +	{Opt_checkpoint_disable, "disable"},
> +	{Opt_checkpoint_disable_cap, "disable:%u"},
> +	{Opt_checkpoint_disable_cap_perc, "disable:%u%%"},
> +	{Opt_checkpoint_enable, "enable"},
>  	{Opt_err, NULL},
>  };
>  
> @@ -511,7 +422,7 @@ static void init_once(void *foo)
>  static const char * const quotatypes[] = INITQFNAMES;
>  #define QTYPE2NAME(t) (quotatypes[t])
>  static int f2fs_set_qf_name(struct f2fs_sb_info *sbi, int qtype,
> -							substring_t *args)
> +			    struct fs_parameter *param)
>  {
>  	struct super_block *sb = sbi->sb;
>  	char *qname;
> @@ -526,7 +437,7 @@ static int f2fs_set_qf_name(struct f2fs_sb_info *sbi, int qtype,
>  		return 0;
>  	}
>  
> -	qname = match_strdup(args);
> +	qname = kmemdup_nul(param->string, param->size, GFP_KERNEL);
>  	if (!qname) {
>  		f2fs_err(sbi, "Not enough memory for storing quotafile name");
>  		return -ENOMEM;
> @@ -611,14 +522,9 @@ static int f2fs_check_quota_options(struct f2fs_sb_info *sbi)
>  #endif
>  
>  static int f2fs_set_test_dummy_encryption(struct f2fs_sb_info *sbi,
> -					  const char *opt,
> -					  const substring_t *arg,
> +					  const struct fs_parameter *param,
>  					  bool is_remount)
>  {
> -	struct fs_parameter param = {
> -		.type = fs_value_is_string,
> -		.string = arg->from ? arg->from : "",
> -	};
>  	struct fscrypt_dummy_policy *policy =
>  		&F2FS_OPTION(sbi).dummy_enc_policy;
>  	int err;
> @@ -644,17 +550,17 @@ static int f2fs_set_test_dummy_encryption(struct f2fs_sb_info *sbi,
>  		return -EINVAL;
>  	}
>  
> -	err = fscrypt_parse_test_dummy_encryption(&param, policy);
> +	err = fscrypt_parse_test_dummy_encryption(param, policy);
>  	if (err) {
>  		if (err == -EEXIST)
>  			f2fs_warn(sbi,
>  				  "Can't change test_dummy_encryption on remount");
>  		else if (err == -EINVAL)
>  			f2fs_warn(sbi, "Value of option \"%s\" is unrecognized",
> -				  opt);
> +				  param->key);
>  		else
>  			f2fs_warn(sbi, "Error processing option \"%s\" [%d]",
> -				  opt, err);
> +				  param->key, err);
>  		return -EINVAL;
>  	}
>  	f2fs_warn(sbi, "Test dummy encryption mode enabled");
> @@ -797,372 +703,262 @@ static int f2fs_set_zstd_level(struct f2fs_sb_info *sbi, const char *str)
>  #endif
>  #endif
>  
> -static int parse_options(struct f2fs_sb_info *sbi, char *options, bool is_remount)
> +static int handle_mount_opt(struct fs_context *fc, struct fs_parameter *param)
>  {
> -	substring_t args[MAX_OPT_ARGS];
> +	struct f2fs_sb_info *sbi = fc->s_fs_info;
>  #ifdef CONFIG_F2FS_FS_COMPRESSION
>  	unsigned char (*ext)[F2FS_EXTENSION_LEN];
>  	unsigned char (*noext)[F2FS_EXTENSION_LEN];
>  	int ext_cnt, noext_cnt;
> +	char *name;
>  #endif
> -	char *p, *name;
> -	int arg = 0;
> -	kuid_t uid;
> -	kgid_t gid;
> -	int ret;
> +	substring_t args[MAX_OPT_ARGS];
> +	struct fs_parse_result result;
> +	int is_remount;
> +	int token, ret, arg;
>  
> -	if (!options)
> -		return 0;
> +	token = fs_parse(fc, f2fs_param_specs, param, &result);
> +	if (token < 0)
> +		return token;
>  
> -	while ((p = strsep(&options, ",")) != NULL) {
> -		int token;
> +	is_remount = fc->purpose == FS_CONTEXT_FOR_RECONFIGURE;
>  
> -		if (!*p)
> -			continue;
> -		/*
> -		 * Initialize args struct so we know whether arg was
> -		 * found; some options take optional arguments.
> -		 */
> -		args[0].to = args[0].from = NULL;
> -		token = match_token(p, f2fs_tokens, args);
> -
> -		switch (token) {
> -		case Opt_gc_background:
> -			name = match_strdup(&args[0]);
> -
> -			if (!name)
> -				return -ENOMEM;
> -			if (!strcmp(name, "on")) {
> -				F2FS_OPTION(sbi).bggc_mode = BGGC_MODE_ON;
> -			} else if (!strcmp(name, "off")) {
> -				if (f2fs_sb_has_blkzoned(sbi)) {
> -					f2fs_warn(sbi, "zoned devices need bggc");
> -					kfree(name);
> -					return -EINVAL;
> -				}
> -				F2FS_OPTION(sbi).bggc_mode = BGGC_MODE_OFF;
> -			} else if (!strcmp(name, "sync")) {
> -				F2FS_OPTION(sbi).bggc_mode = BGGC_MODE_SYNC;
> -			} else {
> -				kfree(name);
> +	switch (token) {
> +	case Opt_gc_background:
> +		F2FS_OPTION(sbi).bggc_mode = result.uint_32;
> +		break;
> +	case Opt_disable_roll_forward:
> +		set_opt(sbi, DISABLE_ROLL_FORWARD);
> +		break;
> +	case Opt_norecovery:
> +		/* requires ro mount, checked in f2fs_validate_options */
> +		set_opt(sbi, NORECOVERY);
> +		break;
> +	case Opt_discard:
> +		if (result.negated) {
> +			if (f2fs_hw_should_discard(sbi)) {
> +				f2fs_warn(sbi, "discard is required for zoned block devices");
>  				return -EINVAL;
>  			}
> -			kfree(name);
> -			break;
> -		case Opt_disable_roll_forward:
> -			set_opt(sbi, DISABLE_ROLL_FORWARD);
> -			break;
> -		case Opt_norecovery:
> -			/* requires ro mount, checked in f2fs_default_check */
> -			set_opt(sbi, NORECOVERY);
> -			break;
> -		case Opt_discard:
> +			clear_opt(sbi, DISCARD);
> +		} else {
>  			if (!f2fs_hw_support_discard(sbi)) {
>  				f2fs_warn(sbi, "device does not support discard");
>  				break;
>  			}
>  			set_opt(sbi, DISCARD);
> -			break;
> -		case Opt_nodiscard:
> -			if (f2fs_hw_should_discard(sbi)) {
> -				f2fs_warn(sbi, "discard is required for zoned block devices");
> -				return -EINVAL;
> -			}
> -			clear_opt(sbi, DISCARD);
> -			break;
> -		case Opt_noheap:
> -		case Opt_heap:
> -			f2fs_warn(sbi, "heap/no_heap options were deprecated");
> -			break;
> +		}
> +		break;
> +	case Opt_noheap:
> +	case Opt_heap:
> +		f2fs_warn(sbi, "heap/no_heap options were deprecated");
> +		break;
>  #ifdef CONFIG_F2FS_FS_XATTR
> -		case Opt_user_xattr:
> -			set_opt(sbi, XATTR_USER);
> -			break;
> -		case Opt_nouser_xattr:
> +	case Opt_user_xattr:
> +		if (result.negated)
>  			clear_opt(sbi, XATTR_USER);
> -			break;
> -		case Opt_inline_xattr:
> -			set_opt(sbi, INLINE_XATTR);
> -			break;
> -		case Opt_noinline_xattr:
> +		else
> +			set_opt(sbi, XATTR_USER);
> +		break;
> +	case Opt_inline_xattr:
> +		if (result.negated)
>  			clear_opt(sbi, INLINE_XATTR);
> -			break;
> -		case Opt_inline_xattr_size:
> -			if (args->from && match_int(args, &arg))
> -				return -EINVAL;
> -			set_opt(sbi, INLINE_XATTR_SIZE);
> -			F2FS_OPTION(sbi).inline_xattr_size = arg;
> -			break;
> +		else
> +			set_opt(sbi, INLINE_XATTR);
> +		break;
> +	case Opt_inline_xattr_size:
> +		set_opt(sbi, INLINE_XATTR_SIZE);
> +		F2FS_OPTION(sbi).inline_xattr_size = result.int_32;
> +		break;
>  #else
> -		case Opt_user_xattr:
> -		case Opt_nouser_xattr:
> -		case Opt_inline_xattr:
> -		case Opt_noinline_xattr:
> -		case Opt_inline_xattr_size:
> -			f2fs_info(sbi, "xattr options not supported");
> -			break;
> +	case Opt_user_xattr:
> +	case Opt_inline_xattr:
> +	case Opt_inline_xattr_size:
> +		f2fs_info(sbi, "%s options not supported", param->key);
> +		break;
>  #endif
>  #ifdef CONFIG_F2FS_FS_POSIX_ACL
> -		case Opt_acl:
> -			set_opt(sbi, POSIX_ACL);
> -			break;
> -		case Opt_noacl:
> +	case Opt_acl:
> +		if (result.negated)
>  			clear_opt(sbi, POSIX_ACL);
> -			break;
> +		else
> +			set_opt(sbi, POSIX_ACL);
> +		break;
>  #else
> -		case Opt_acl:
> -		case Opt_noacl:
> -			f2fs_info(sbi, "acl options not supported");
> -			break;
> +	case Opt_acl:
> +		f2fs_info(sbi, "%s options not supported", param->key);
> +		break;
>  #endif
> -		case Opt_active_logs:
> -			if (args->from && match_int(args, &arg))
> -				return -EINVAL;
> -			if (arg != 2 && arg != 4 &&
> -				arg != NR_CURSEG_PERSIST_TYPE)
> -				return -EINVAL;
> -			F2FS_OPTION(sbi).active_logs = arg;
> -			break;
> -		case Opt_disable_ext_identify:
> -			set_opt(sbi, DISABLE_EXT_IDENTIFY);
> -			break;
> -		case Opt_inline_data:
> +	case Opt_active_logs:
> +		if (result.int_32 != 2 && result.int_32 != 4 &&
> +			result.int_32 != NR_CURSEG_PERSIST_TYPE)
> +			return -EINVAL;
> +		F2FS_OPTION(sbi).active_logs = result.int_32;
> +		break;
> +	case Opt_disable_ext_identify:
> +		set_opt(sbi, DISABLE_EXT_IDENTIFY);
> +		break;
> +	case Opt_inline_data:
> +		if (result.negated)
> +			clear_opt(sbi, INLINE_DATA);
> +		else
>  			set_opt(sbi, INLINE_DATA);
> -			break;
> -		case Opt_inline_dentry:
> -			set_opt(sbi, INLINE_DENTRY);
> -			break;
> -		case Opt_noinline_dentry:
> +		break;
> +	case Opt_inline_dentry:
> +		if (result.negated)
>  			clear_opt(sbi, INLINE_DENTRY);
> -			break;
> -		case Opt_flush_merge:
> -			set_opt(sbi, FLUSH_MERGE);
> -			break;
> -		case Opt_noflush_merge:
> +		else
> +			set_opt(sbi, INLINE_DENTRY);
> +		break;
> +	case Opt_flush_merge:
> +		if (result.negated)
>  			clear_opt(sbi, FLUSH_MERGE);
> -			break;
> -		case Opt_nobarrier:
> +		else
> +			set_opt(sbi, FLUSH_MERGE);
> +		break;
> +	case Opt_barrier:
> +		if (result.negated)
>  			set_opt(sbi, NOBARRIER);
> -			break;
> -		case Opt_barrier:
> +		else
>  			clear_opt(sbi, NOBARRIER);
> -			break;
> -		case Opt_fastboot:
> -			set_opt(sbi, FASTBOOT);
> -			break;
> -		case Opt_extent_cache:
> -			set_opt(sbi, READ_EXTENT_CACHE);
> -			break;
> -		case Opt_noextent_cache:
> +		break;
> +	case Opt_fastboot:
> +		set_opt(sbi, FASTBOOT);
> +		break;
> +	case Opt_extent_cache:
> +		if (result.negated) {
>  			if (f2fs_sb_has_device_alias(sbi)) {
>  				f2fs_err(sbi, "device aliasing requires extent cache");
>  				return -EINVAL;
>  			}
>  			clear_opt(sbi, READ_EXTENT_CACHE);
> -			break;
> -		case Opt_noinline_data:
> -			clear_opt(sbi, INLINE_DATA);
> -			break;
> -		case Opt_data_flush:
> -			set_opt(sbi, DATA_FLUSH);
> -			break;
> -		case Opt_reserve_root:
> -			if (args->from && match_int(args, &arg))
> -				return -EINVAL;
> -			if (test_opt(sbi, RESERVE_ROOT)) {
> -				f2fs_info(sbi, "Preserve previous reserve_root=%u",
> -					  F2FS_OPTION(sbi).root_reserved_blocks);
> -			} else {
> -				F2FS_OPTION(sbi).root_reserved_blocks = arg;
> -				set_opt(sbi, RESERVE_ROOT);
> -			}
> -			break;
> -		case Opt_resuid:
> -			if (args->from && match_int(args, &arg))
> -				return -EINVAL;
> -			uid = make_kuid(current_user_ns(), arg);
> -			if (!uid_valid(uid)) {
> -				f2fs_err(sbi, "Invalid uid value %d", arg);
> -				return -EINVAL;
> -			}
> -			F2FS_OPTION(sbi).s_resuid = uid;
> -			break;
> -		case Opt_resgid:
> -			if (args->from && match_int(args, &arg))
> -				return -EINVAL;
> -			gid = make_kgid(current_user_ns(), arg);
> -			if (!gid_valid(gid)) {
> -				f2fs_err(sbi, "Invalid gid value %d", arg);
> -				return -EINVAL;
> -			}
> -			F2FS_OPTION(sbi).s_resgid = gid;
> -			break;
> -		case Opt_mode:
> -			name = match_strdup(&args[0]);
> -
> -			if (!name)
> -				return -ENOMEM;
> -			if (!strcmp(name, "adaptive")) {
> -				F2FS_OPTION(sbi).fs_mode = FS_MODE_ADAPTIVE;
> -			} else if (!strcmp(name, "lfs")) {
> -				F2FS_OPTION(sbi).fs_mode = FS_MODE_LFS;
> -			} else if (!strcmp(name, "fragment:segment")) {
> -				F2FS_OPTION(sbi).fs_mode = FS_MODE_FRAGMENT_SEG;
> -			} else if (!strcmp(name, "fragment:block")) {
> -				F2FS_OPTION(sbi).fs_mode = FS_MODE_FRAGMENT_BLK;
> -			} else {
> -				kfree(name);
> -				return -EINVAL;
> -			}
> -			kfree(name);
> -			break;
> +		} else
> +			set_opt(sbi, READ_EXTENT_CACHE);
> +		break;
> +	case Opt_data_flush:
> +		set_opt(sbi, DATA_FLUSH);
> +		break;
> +	case Opt_reserve_root:
> +		if (test_opt(sbi, RESERVE_ROOT)) {
> +			f2fs_info(sbi, "Preserve previous reserve_root=%u",
> +				  F2FS_OPTION(sbi).root_reserved_blocks);
> +		} else {
> +			F2FS_OPTION(sbi).root_reserved_blocks = result.int_32;
> +			set_opt(sbi, RESERVE_ROOT);
> +		}
> +		break;
> +	case Opt_resuid:
> +		F2FS_OPTION(sbi).s_resuid = result.uid;
> +		break;
> +	case Opt_resgid:
> +		F2FS_OPTION(sbi).s_resgid = result.gid;
> +		break;
> +	case Opt_mode:
> +		F2FS_OPTION(sbi).fs_mode = result.uint_32;
> +		break;
>  #ifdef CONFIG_F2FS_FAULT_INJECTION
> -		case Opt_fault_injection:
> -			if (args->from && match_int(args, &arg))
> -				return -EINVAL;
> -			if (f2fs_build_fault_attr(sbi, arg, 0, FAULT_RATE))
> -				return -EINVAL;
> -			set_opt(sbi, FAULT_INJECTION);
> -			break;
> +	case Opt_fault_injection:
> +		if (f2fs_build_fault_attr(sbi, result.int_32, 0, FAULT_RATE))
> +			return -EINVAL;
> +		set_opt(sbi, FAULT_INJECTION);
> +		break;
>  
> -		case Opt_fault_type:
> -			if (args->from && match_int(args, &arg))
> -				return -EINVAL;
> -			if (f2fs_build_fault_attr(sbi, 0, arg, FAULT_TYPE))
> -				return -EINVAL;
> -			set_opt(sbi, FAULT_INJECTION);
> -			break;
> +	case Opt_fault_type:
> +		if (f2fs_build_fault_attr(sbi, 0, result.int_32, FAULT_TYPE))
> +			return -EINVAL;
> +		set_opt(sbi, FAULT_INJECTION);
> +		break;
>  #else
> -		case Opt_fault_injection:
> -		case Opt_fault_type:
> -			f2fs_info(sbi, "fault injection options not supported");
> -			break;
> +	case Opt_fault_injection:
> +	case Opt_fault_type:
> +		f2fs_info(sbi, "%s options not supported", param->key);
> +		break;
>  #endif
> -		case Opt_lazytime:
> -			set_opt(sbi, LAZYTIME);
> -			break;
> -		case Opt_nolazytime:
> +	case Opt_lazytime:
> +		if (result.negated)
>  			clear_opt(sbi, LAZYTIME);
> -			break;
> +		else
> +			set_opt(sbi, LAZYTIME);
> +		break;
>  #ifdef CONFIG_QUOTA
> -		case Opt_quota:
> -		case Opt_usrquota:
> -			set_opt(sbi, USRQUOTA);
> -			break;
> -		case Opt_grpquota:
> -			set_opt(sbi, GRPQUOTA);
> -			break;
> -		case Opt_prjquota:
> -			set_opt(sbi, PRJQUOTA);
> -			break;
> -		case Opt_usrjquota:
> -			ret = f2fs_set_qf_name(sbi, USRQUOTA, &args[0]);
> -			if (ret)
> -				return ret;
> -			break;
> -		case Opt_grpjquota:
> -			ret = f2fs_set_qf_name(sbi, GRPQUOTA, &args[0]);
> -			if (ret)
> -				return ret;
> -			break;
> -		case Opt_prjjquota:
> -			ret = f2fs_set_qf_name(sbi, PRJQUOTA, &args[0]);
> -			if (ret)
> -				return ret;
> -			break;
> -		case Opt_offusrjquota:
> -			ret = f2fs_clear_qf_name(sbi, USRQUOTA);
> -			if (ret)
> -				return ret;
> -			break;
> -		case Opt_offgrpjquota:
> -			ret = f2fs_clear_qf_name(sbi, GRPQUOTA);
> -			if (ret)
> -				return ret;
> -			break;
> -		case Opt_offprjjquota:
> -			ret = f2fs_clear_qf_name(sbi, PRJQUOTA);
> -			if (ret)
> -				return ret;
> -			break;
> -		case Opt_jqfmt_vfsold:
> -			F2FS_OPTION(sbi).s_jquota_fmt = QFMT_VFS_OLD;
> -			break;
> -		case Opt_jqfmt_vfsv0:
> -			F2FS_OPTION(sbi).s_jquota_fmt = QFMT_VFS_V0;
> -			break;
> -		case Opt_jqfmt_vfsv1:
> -			F2FS_OPTION(sbi).s_jquota_fmt = QFMT_VFS_V1;
> -			break;
> -		case Opt_noquota:
> +	case Opt_quota:
> +		if (result.negated) {
>  			clear_opt(sbi, QUOTA);
>  			clear_opt(sbi, USRQUOTA);
>  			clear_opt(sbi, GRPQUOTA);
>  			clear_opt(sbi, PRJQUOTA);
> -			break;
> +		} else
> +			set_opt(sbi, USRQUOTA);
> +		break;
> +	case Opt_usrquota:
> +		set_opt(sbi, USRQUOTA);
> +		break;
> +	case Opt_grpquota:
> +		set_opt(sbi, GRPQUOTA);
> +		break;
> +	case Opt_prjquota:
> +		set_opt(sbi, PRJQUOTA);
> +		break;
> +	case Opt_usrjquota:
> +		if (!*param->string)
> +			ret = f2fs_clear_qf_name(sbi, USRQUOTA);
> +		else
> +			ret = f2fs_set_qf_name(sbi, USRQUOTA, param);
> +		if (ret)
> +			return ret;
> +		break;
> +	case Opt_grpjquota:
> +		if (!*param->string)
> +			ret = f2fs_clear_qf_name(sbi, GRPQUOTA);
> +		else
> +			ret = f2fs_set_qf_name(sbi, GRPQUOTA, param);
> +		if (ret)
> +			return ret;
> +		break;
> +	case Opt_prjjquota:
> +		if (!*param->string)
> +			ret = f2fs_clear_qf_name(sbi, PRJQUOTA);
> +		else
> +			ret = f2fs_set_qf_name(sbi, PRJQUOTA, param);
> +		if (ret)
> +			return ret;
> +		break;
> +	case Opt_jqfmt:
> +		F2FS_OPTION(sbi).s_jquota_fmt = result.uint_32;
> +		break;
>  #else
> -		case Opt_quota:
> -		case Opt_usrquota:
> -		case Opt_grpquota:
> -		case Opt_prjquota:
> -		case Opt_usrjquota:
> -		case Opt_grpjquota:
> -		case Opt_prjjquota:
> -		case Opt_offusrjquota:
> -		case Opt_offgrpjquota:
> -		case Opt_offprjjquota:
> -		case Opt_jqfmt_vfsold:
> -		case Opt_jqfmt_vfsv0:
> -		case Opt_jqfmt_vfsv1:
> -		case Opt_noquota:
> -			f2fs_info(sbi, "quota operations not supported");
> -			break;
> +	case Opt_quota:
> +	case Opt_usrquota:
> +	case Opt_grpquota:
> +	case Opt_prjquota:
> +	case Opt_usrjquota:
> +	case Opt_grpjquota:
> +	case Opt_prjjquota:
> +		f2fs_info(sbi, "quota operations not supported");
> +		break;
>  #endif
> -		case Opt_alloc:
> -			name = match_strdup(&args[0]);
> -			if (!name)
> -				return -ENOMEM;
> -
> -			if (!strcmp(name, "default")) {
> -				F2FS_OPTION(sbi).alloc_mode = ALLOC_MODE_DEFAULT;
> -			} else if (!strcmp(name, "reuse")) {
> -				F2FS_OPTION(sbi).alloc_mode = ALLOC_MODE_REUSE;
> -			} else {
> -				kfree(name);
> -				return -EINVAL;
> -			}
> -			kfree(name);
> -			break;
> -		case Opt_fsync:
> -			name = match_strdup(&args[0]);
> -			if (!name)
> -				return -ENOMEM;
> -			if (!strcmp(name, "posix")) {
> -				F2FS_OPTION(sbi).fsync_mode = FSYNC_MODE_POSIX;
> -			} else if (!strcmp(name, "strict")) {
> -				F2FS_OPTION(sbi).fsync_mode = FSYNC_MODE_STRICT;
> -			} else if (!strcmp(name, "nobarrier")) {
> -				F2FS_OPTION(sbi).fsync_mode =
> -							FSYNC_MODE_NOBARRIER;
> -			} else {
> -				kfree(name);
> -				return -EINVAL;
> -			}
> -			kfree(name);
> -			break;
> -		case Opt_test_dummy_encryption:
> -			ret = f2fs_set_test_dummy_encryption(sbi, p, &args[0],
> -							     is_remount);
> -			if (ret)
> -				return ret;
> -			break;
> -		case Opt_inlinecrypt:
> +	case Opt_alloc:
> +		F2FS_OPTION(sbi).alloc_mode = result.uint_32;
> +		break;
> +	case Opt_fsync:
> +		F2FS_OPTION(sbi).fsync_mode = result.uint_32;
> +		break;
> +	case Opt_test_dummy_encryption:
> +		ret = f2fs_set_test_dummy_encryption(sbi, param, is_remount);
> +		if (ret)
> +			return ret;
> +		break;
> +	case Opt_inlinecrypt:
>  #ifdef CONFIG_FS_ENCRYPTION_INLINE_CRYPT
> -			set_opt(sbi, INLINECRYPT);
> +		set_opt(sbi, INLINECRYPT);
>  #else
> -			f2fs_info(sbi, "inline encryption not supported");
> +		f2fs_info(sbi, "inline encryption not supported");
>  #endif
> -			break;
> +		break;
> +	case Opt_checkpoint:

I applied the below to avoid build errors.

--- a/fs/f2fs/super.c
+++ b/fs/f2fs/super.c
@@ -960,6 +960,13 @@ static int f2fs_parse_param(struct fs_context *fc, struct fs_parameter *param)
 #endif
                break;
        case Opt_checkpoint:
+               /*
+                * Initialize args struct so we know whether arg was
+                * found; some options take optional arguments.
+                */
+               args[0].from = args[0].to = NULL;
+               arg = 0;
+
                /* revert to match_table for checkpoint= options */
                token = match_token(param->string, f2fs_checkpoint_tokens, args);
                switch (token) {

> +		/* revert to match_table for checkpoint= options */
> +		token = match_token(param->string, f2fs_checkpoint_tokens, args);
> +		switch (token) {
>  		case Opt_checkpoint_disable_cap_perc:
>  			if (args->from && match_int(args, &arg))
>  				return -EINVAL;
> @@ -1183,270 +979,225 @@ static int parse_options(struct f2fs_sb_info *sbi, char *options, bool is_remoun
>  		case Opt_checkpoint_enable:
>  			clear_opt(sbi, DISABLE_CHECKPOINT);
>  			break;
> -		case Opt_checkpoint_merge:
> -			set_opt(sbi, MERGE_CHECKPOINT);
> -			break;
> -		case Opt_nocheckpoint_merge:
> +		default:
> +			return -EINVAL;
> +		}
> +		break;
> +	case Opt_checkpoint_merge:
> +		if (result.negated)
>  			clear_opt(sbi, MERGE_CHECKPOINT);
> -			break;
> +		else
> +			set_opt(sbi, MERGE_CHECKPOINT);
> +		break;
>  #ifdef CONFIG_F2FS_FS_COMPRESSION
> -		case Opt_compress_algorithm:
> -			if (!f2fs_sb_has_compression(sbi)) {
> -				f2fs_info(sbi, "Image doesn't support compression");
> -				break;
> -			}
> -			name = match_strdup(&args[0]);
> -			if (!name)
> -				return -ENOMEM;
> -			if (!strcmp(name, "lzo")) {
> +	case Opt_compress_algorithm:
> +		if (!f2fs_sb_has_compression(sbi)) {
> +			f2fs_info(sbi, "Image doesn't support compression");
> +			break;
> +		}
> +		name = param->string;
> +		if (!strcmp(name, "lzo")) {
>  #ifdef CONFIG_F2FS_FS_LZO
> -				F2FS_OPTION(sbi).compress_level = 0;
> -				F2FS_OPTION(sbi).compress_algorithm =
> -								COMPRESS_LZO;
> +			F2FS_OPTION(sbi).compress_level = 0;
> +			F2FS_OPTION(sbi).compress_algorithm = COMPRESS_LZO;
>  #else
> -				f2fs_info(sbi, "kernel doesn't support lzo compression");
> +			f2fs_info(sbi, "kernel doesn't support lzo compression");
>  #endif
> -			} else if (!strncmp(name, "lz4", 3)) {
> +		} else if (!strncmp(name, "lz4", 3)) {
>  #ifdef CONFIG_F2FS_FS_LZ4
> -				ret = f2fs_set_lz4hc_level(sbi, name);
> -				if (ret) {
> -					kfree(name);
> -					return -EINVAL;
> -				}
> -				F2FS_OPTION(sbi).compress_algorithm =
> -								COMPRESS_LZ4;
> +			ret = f2fs_set_lz4hc_level(sbi, name);
> +			if (ret)
> +				return -EINVAL;
> +			F2FS_OPTION(sbi).compress_algorithm = COMPRESS_LZ4;
>  #else
> -				f2fs_info(sbi, "kernel doesn't support lz4 compression");
> +			f2fs_info(sbi, "kernel doesn't support lz4 compression");
>  #endif
> -			} else if (!strncmp(name, "zstd", 4)) {
> +		} else if (!strncmp(name, "zstd", 4)) {
>  #ifdef CONFIG_F2FS_FS_ZSTD
> -				ret = f2fs_set_zstd_level(sbi, name);
> -				if (ret) {
> -					kfree(name);
> -					return -EINVAL;
> -				}
> -				F2FS_OPTION(sbi).compress_algorithm =
> -								COMPRESS_ZSTD;
> +			ret = f2fs_set_zstd_level(sbi, name);
> +			if (ret)
> +				return -EINVAL;
> +			F2FS_OPTION(sbi).compress_algorithm = COMPRESS_ZSTD;
>  #else
> -				f2fs_info(sbi, "kernel doesn't support zstd compression");
> +			f2fs_info(sbi, "kernel doesn't support zstd compression");
>  #endif
> -			} else if (!strcmp(name, "lzo-rle")) {
> +		} else if (!strcmp(name, "lzo-rle")) {
>  #ifdef CONFIG_F2FS_FS_LZORLE
> -				F2FS_OPTION(sbi).compress_level = 0;
> -				F2FS_OPTION(sbi).compress_algorithm =
> -								COMPRESS_LZORLE;
> +			F2FS_OPTION(sbi).compress_level = 0;
> +			F2FS_OPTION(sbi).compress_algorithm = COMPRESS_LZORLE;
>  #else
> -				f2fs_info(sbi, "kernel doesn't support lzorle compression");
> +			f2fs_info(sbi, "kernel doesn't support lzorle compression");
>  #endif
> -			} else {
> -				kfree(name);
> -				return -EINVAL;
> -			}
> -			kfree(name);
> +		} else
> +			return -EINVAL;
> +		break;
> +	case Opt_compress_log_size:
> +		if (!f2fs_sb_has_compression(sbi)) {
> +			f2fs_info(sbi, "Image doesn't support compression");
>  			break;
> -		case Opt_compress_log_size:
> -			if (!f2fs_sb_has_compression(sbi)) {
> -				f2fs_info(sbi, "Image doesn't support compression");
> -				break;
> -			}
> -			if (args->from && match_int(args, &arg))
> -				return -EINVAL;
> -			if (arg < MIN_COMPRESS_LOG_SIZE ||
> -				arg > MAX_COMPRESS_LOG_SIZE) {
> -				f2fs_err(sbi,
> -					"Compress cluster log size is out of range");
> -				return -EINVAL;
> -			}
> -			F2FS_OPTION(sbi).compress_log_size = arg;
> +		}
> +		if (result.uint_32 < MIN_COMPRESS_LOG_SIZE ||
> +		    result.uint_32 > MAX_COMPRESS_LOG_SIZE) {
> +			f2fs_err(sbi,
> +				"Compress cluster log size is out of range");
> +			return -EINVAL;
> +		}
> +		F2FS_OPTION(sbi).compress_log_size = result.uint_32;
> +		break;
> +	case Opt_compress_extension:
> +		if (!f2fs_sb_has_compression(sbi)) {
> +			f2fs_info(sbi, "Image doesn't support compression");
>  			break;
> -		case Opt_compress_extension:
> -			if (!f2fs_sb_has_compression(sbi)) {
> -				f2fs_info(sbi, "Image doesn't support compression");
> -				break;
> -			}
> -			name = match_strdup(&args[0]);
> -			if (!name)
> -				return -ENOMEM;
> -
> -			ext = F2FS_OPTION(sbi).extensions;
> -			ext_cnt = F2FS_OPTION(sbi).compress_ext_cnt;
> -
> -			if (strlen(name) >= F2FS_EXTENSION_LEN ||
> -				ext_cnt >= COMPRESS_EXT_NUM) {
> -				f2fs_err(sbi,
> -					"invalid extension length/number");
> -				kfree(name);
> -				return -EINVAL;
> -			}
> +		}
> +		name = param->string;
> +		ext = F2FS_OPTION(sbi).extensions;
> +		ext_cnt = F2FS_OPTION(sbi).compress_ext_cnt;
>  
> -			if (is_compress_extension_exist(sbi, name, true)) {
> -				kfree(name);
> -				break;
> -			}
> +		if (strlen(name) >= F2FS_EXTENSION_LEN ||
> +		    ext_cnt >= COMPRESS_EXT_NUM) {
> +			f2fs_err(sbi, "invalid extension length/number");
> +			return -EINVAL;
> +		}
>  
> -			ret = strscpy(ext[ext_cnt], name);
> -			if (ret < 0) {
> -				kfree(name);
> -				return ret;
> -			}
> -			F2FS_OPTION(sbi).compress_ext_cnt++;
> -			kfree(name);
> +		if (is_compress_extension_exist(sbi, name, true))
>  			break;
> -		case Opt_nocompress_extension:
> -			if (!f2fs_sb_has_compression(sbi)) {
> -				f2fs_info(sbi, "Image doesn't support compression");
> -				break;
> -			}
> -			name = match_strdup(&args[0]);
> -			if (!name)
> -				return -ENOMEM;
>  
> -			noext = F2FS_OPTION(sbi).noextensions;
> -			noext_cnt = F2FS_OPTION(sbi).nocompress_ext_cnt;
> -
> -			if (strlen(name) >= F2FS_EXTENSION_LEN ||
> -				noext_cnt >= COMPRESS_EXT_NUM) {
> -				f2fs_err(sbi,
> -					"invalid extension length/number");
> -				kfree(name);
> -				return -EINVAL;
> -			}
> +		ret = strscpy(ext[ext_cnt], name, F2FS_EXTENSION_LEN);
> +		if (ret < 0)
> +			return ret;
> +		F2FS_OPTION(sbi).compress_ext_cnt++;
> +		break;
> +	case Opt_nocompress_extension:
> +		if (!f2fs_sb_has_compression(sbi)) {
> +			f2fs_info(sbi, "Image doesn't support compression");
> +			break;
> +		}
> +		name = param->string;
> +		noext = F2FS_OPTION(sbi).noextensions;
> +		noext_cnt = F2FS_OPTION(sbi).nocompress_ext_cnt;
>  
> -			if (is_compress_extension_exist(sbi, name, false)) {
> -				kfree(name);
> -				break;
> -			}
> +		if (strlen(name) >= F2FS_EXTENSION_LEN ||
> +			noext_cnt >= COMPRESS_EXT_NUM) {
> +			f2fs_err(sbi, "invalid extension length/number");
> +			return -EINVAL;
> +		}
>  
> -			ret = strscpy(noext[noext_cnt], name);
> -			if (ret < 0) {
> -				kfree(name);
> -				return ret;
> -			}
> -			F2FS_OPTION(sbi).nocompress_ext_cnt++;
> -			kfree(name);
> +		if (is_compress_extension_exist(sbi, name, false))
>  			break;
> -		case Opt_compress_chksum:
> -			if (!f2fs_sb_has_compression(sbi)) {
> -				f2fs_info(sbi, "Image doesn't support compression");
> -				break;
> -			}
> -			F2FS_OPTION(sbi).compress_chksum = true;
> +
> +		ret = strscpy(noext[noext_cnt], name, F2FS_EXTENSION_LEN);
> +		if (ret < 0)
> +			return ret;
> +		F2FS_OPTION(sbi).nocompress_ext_cnt++;
> +		break;
> +	case Opt_compress_chksum:
> +		if (!f2fs_sb_has_compression(sbi)) {
> +			f2fs_info(sbi, "Image doesn't support compression");
>  			break;
> -		case Opt_compress_mode:
> -			if (!f2fs_sb_has_compression(sbi)) {
> -				f2fs_info(sbi, "Image doesn't support compression");
> -				break;
> -			}
> -			name = match_strdup(&args[0]);
> -			if (!name)
> -				return -ENOMEM;
> -			if (!strcmp(name, "fs")) {
> -				F2FS_OPTION(sbi).compress_mode = COMPR_MODE_FS;
> -			} else if (!strcmp(name, "user")) {
> -				F2FS_OPTION(sbi).compress_mode = COMPR_MODE_USER;
> -			} else {
> -				kfree(name);
> -				return -EINVAL;
> -			}
> -			kfree(name);
> +		}
> +		F2FS_OPTION(sbi).compress_chksum = true;
> +		break;
> +	case Opt_compress_mode:
> +		if (!f2fs_sb_has_compression(sbi)) {
> +			f2fs_info(sbi, "Image doesn't support compression");
>  			break;
> -		case Opt_compress_cache:
> -			if (!f2fs_sb_has_compression(sbi)) {
> -				f2fs_info(sbi, "Image doesn't support compression");
> -				break;
> -			}
> -			set_opt(sbi, COMPRESS_CACHE);
> +		}
> +		F2FS_OPTION(sbi).compress_mode = result.uint_32;
> +		break;
> +	case Opt_compress_cache:
> +		if (!f2fs_sb_has_compression(sbi)) {
> +			f2fs_info(sbi, "Image doesn't support compression");
>  			break;
> +		}
> +		set_opt(sbi, COMPRESS_CACHE);
> +		break;
>  #else
> -		case Opt_compress_algorithm:
> -		case Opt_compress_log_size:
> -		case Opt_compress_extension:
> -		case Opt_nocompress_extension:
> -		case Opt_compress_chksum:
> -		case Opt_compress_mode:
> -		case Opt_compress_cache:
> -			f2fs_info(sbi, "compression options not supported");
> -			break;
> +	case Opt_compress_algorithm:
> +	case Opt_compress_log_size:
> +	case Opt_compress_extension:
> +	case Opt_nocompress_extension:
> +	case Opt_compress_chksum:
> +	case Opt_compress_mode:
> +	case Opt_compress_cache:
> +		f2fs_info(sbi, "compression options not supported");
> +		break;
>  #endif
> -		case Opt_atgc:
> -			set_opt(sbi, ATGC);
> -			break;
> -		case Opt_gc_merge:
> -			set_opt(sbi, GC_MERGE);
> -			break;
> -		case Opt_nogc_merge:
> +	case Opt_atgc:
> +		set_opt(sbi, ATGC);
> +		break;
> +	case Opt_gc_merge:
> +		if (result.negated)
>  			clear_opt(sbi, GC_MERGE);
> -			break;
> -		case Opt_discard_unit:
> -			name = match_strdup(&args[0]);
> -			if (!name)
> -				return -ENOMEM;
> -			if (!strcmp(name, "block")) {
> -				F2FS_OPTION(sbi).discard_unit =
> -						DISCARD_UNIT_BLOCK;
> -			} else if (!strcmp(name, "segment")) {
> -				F2FS_OPTION(sbi).discard_unit =
> -						DISCARD_UNIT_SEGMENT;
> -			} else if (!strcmp(name, "section")) {
> -				F2FS_OPTION(sbi).discard_unit =
> -						DISCARD_UNIT_SECTION;
> -			} else {
> -				kfree(name);
> -				return -EINVAL;
> -			}
> -			kfree(name);
> -			break;
> -		case Opt_memory_mode:
> -			name = match_strdup(&args[0]);
> -			if (!name)
> -				return -ENOMEM;
> -			if (!strcmp(name, "normal")) {
> -				F2FS_OPTION(sbi).memory_mode =
> -						MEMORY_MODE_NORMAL;
> -			} else if (!strcmp(name, "low")) {
> -				F2FS_OPTION(sbi).memory_mode =
> -						MEMORY_MODE_LOW;
> -			} else {
> -				kfree(name);
> -				return -EINVAL;
> -			}
> -			kfree(name);
> -			break;
> -		case Opt_age_extent_cache:
> -			set_opt(sbi, AGE_EXTENT_CACHE);
> -			break;
> -		case Opt_errors:
> -			name = match_strdup(&args[0]);
> -			if (!name)
> -				return -ENOMEM;
> -			if (!strcmp(name, "remount-ro")) {
> -				F2FS_OPTION(sbi).errors =
> -						MOUNT_ERRORS_READONLY;
> -			} else if (!strcmp(name, "continue")) {
> -				F2FS_OPTION(sbi).errors =
> -						MOUNT_ERRORS_CONTINUE;
> -			} else if (!strcmp(name, "panic")) {
> -				F2FS_OPTION(sbi).errors =
> -						MOUNT_ERRORS_PANIC;
> -			} else {
> -				kfree(name);
> -				return -EINVAL;
> +		else
> +			set_opt(sbi, GC_MERGE);
> +		break;
> +	case Opt_discard_unit:
> +		F2FS_OPTION(sbi).discard_unit = result.uint_32;
> +		break;
> +	case Opt_memory_mode:
> +		F2FS_OPTION(sbi).memory_mode = result.uint_32;
> +		break;
> +	case Opt_age_extent_cache:
> +		set_opt(sbi, AGE_EXTENT_CACHE);
> +		break;
> +	case Opt_errors:
> +		F2FS_OPTION(sbi).errors = result.uint_32;
> +		break;
> +	case Opt_nat_bits:
> +		set_opt(sbi, NAT_BITS);
> +		break;
> +	}
> +	return 0;
> +}
> +
> +static int parse_options(struct f2fs_sb_info *sbi, char *options, bool is_remount)
> +{
> +	struct fs_parameter param;
> +	struct fs_context fc;
> +	char *key;
> +	int ret;
> +
> +	if (!options)
> +		return 0;
> +
> +	memset(&fc, 0, sizeof(fc));
> +	fc.s_fs_info = sbi;
> +	if (is_remount)
> +		fc.purpose = FS_CONTEXT_FOR_RECONFIGURE;
> +
> +	while ((key = strsep(&options, ",")) != NULL) {
> +		if (*key) {
> +			size_t v_len = 0;
> +			char *value = strchr(key, '=');
> +
> +			param.type = fs_value_is_flag;
> +			param.string = NULL;
> +
> +			if (value) {
> +				if (value == key)
> +					continue;
> +
> +				*value++ = 0;
> +				v_len = strlen(value);
> +				param.string = kmemdup_nul(value, v_len, GFP_KERNEL);
> +				if (!param.string)
> +					return -ENOMEM;
> +				param.type = fs_value_is_string;
>  			}
> -			kfree(name);
> -			break;
> -		case Opt_nat_bits:
> -			set_opt(sbi, NAT_BITS);
> -			break;
> -		default:
> -			f2fs_err(sbi, "Unrecognized mount option \"%s\" or missing value",
> -				 p);
> -			return -EINVAL;
> +
> +			param.key = key;
> +			param.size = v_len;
> +
> +			ret = handle_mount_opt(&fc, &param);
> +			kfree(param.string);
> +			if (ret < 0)
> +				return ret;
>  		}
>  	}
>  	return 0;
>  }
>  
> -static int f2fs_default_check(struct f2fs_sb_info *sbi)
> +static int f2fs_validate_options(struct f2fs_sb_info *sbi)
>  {
>  #ifdef CONFIG_QUOTA
>  	if (f2fs_check_quota_options(sbi))
> @@ -2519,7 +2270,7 @@ static int f2fs_remount(struct super_block *sb, int *flags, char *data)
>  	}
>  #endif
>  
> -	err = f2fs_default_check(sbi);
> +	err = f2fs_validate_options(sbi);
>  	if (err)
>  		goto restore_opts;
>  
> @@ -4678,7 +4429,7 @@ static int f2fs_fill_super(struct super_block *sb, void *data, int silent)
>  	if (err)
>  		goto free_options;
>  
> -	err = f2fs_default_check(sbi);
> +	err = f2fs_validate_options(sbi);
>  	if (err)
>  		goto free_options;
>  
> -- 
> 2.49.0


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
