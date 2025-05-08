Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 80865AAF150
	for <lists+linux-f2fs-devel@lfdr.de>; Thu,  8 May 2025 04:58:40 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Type:Content-Transfer-Encoding:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:In-Reply-To:References:To:MIME-Version:Date:
	Message-ID:Sender:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=NsuyZ+gk1SMWB/QtZSa3Lerwk5O4HCKH43UohPviBpo=; b=Zf3GOF8YA1TkNKTHcnmMBaFGSJ
	HpxL1s2jrcwcvMVjTH1c0WyRN2lvC+E57t6vA1607kzXQdczbVnvx4nJTw2pWqkkWDQ+ID/OoQiRw
	94YNQQKHMuDqLxByq0mJNfAVw9b/EEi++OdUQIx0Fm746j3+itzxHmhfSGvR6eEL/3xo=;
Received: from [127.0.0.1] (helo=sfs-ml-3.v29.lw.sourceforge.com)
	by sfs-ml-3.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1uCrSx-0002IE-QE;
	Thu, 08 May 2025 02:58:31 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-3.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <lihongbo22@huawei.com>) id 1uCrSw-0002I8-Qj
 for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 08 May 2025 02:58:30 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 From:References:CC:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=2K7TqxrsXhDRzY2DT2VoJLmFlFow0ZtYQCkaVkz2Ym0=; b=PgZESVuJmcw43jL0m9f+SptmxD
 LUFk6wBB3qj391TXy74b1pRWJwYEfv1pYvZHcpvoMOjnm81jAVU+xt6BdgBIMbHh+S7GIcEvWG0Ho
 kpYWk223RVM2r9Lv4uMzZNFdPM5VsyU6Dx7mkhcq4VBS0bub+VekK7Vq9Y3ggqcmIuYY=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:CC:To:
 Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=2K7TqxrsXhDRzY2DT2VoJLmFlFow0ZtYQCkaVkz2Ym0=; b=R5IbMRMYai70EhflOrTXQW+6aF
 lKWXQ4bDC4mEG0eEd3GHHCMsYsRjH6d8bXhgozwInwbJUP5gcyJ8sQ2ncpHwdoHKmLHxuSfD7D0BY
 q1qHgCQ3wgzRkkN3qWd+JJ5WcZbrL7NPG9YZITEchzDmoHFMr29QEaGalAj3FltbrBpg=;
Received: from szxga01-in.huawei.com ([45.249.212.187])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1uCrSv-00068Q-D4 for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 08 May 2025 02:58:30 +0000
Received: from mail.maildlp.com (unknown [172.19.163.174])
 by szxga01-in.huawei.com (SkyGuard) with ESMTP id 4ZtGXk2Jynz13Lc6;
 Thu,  8 May 2025 10:38:46 +0800 (CST)
Received: from kwepemo500009.china.huawei.com (unknown [7.202.194.199])
 by mail.maildlp.com (Postfix) with ESMTPS id 57CE71400E3;
 Thu,  8 May 2025 10:40:04 +0800 (CST)
Received: from [10.67.111.104] (10.67.111.104) by
 kwepemo500009.china.huawei.com (7.202.194.199) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.11; Thu, 8 May 2025 10:40:03 +0800
Message-ID: <6c3c7e74-b85b-44df-801b-b37845791051@huawei.com>
Date: Thu, 8 May 2025 10:40:03 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Eric Sandeen <sandeen@redhat.com>, <linux-f2fs-devel@lists.sourceforge.net>
References: <20250423170926.76007-1-sandeen@redhat.com>
 <20250423170926.76007-2-sandeen@redhat.com>
Content-Language: en-US
In-Reply-To: <20250423170926.76007-2-sandeen@redhat.com>
X-Originating-IP: [10.67.111.104]
X-ClientProxiedBy: dggems706-chm.china.huawei.com (10.3.19.183) To
 kwepemo500009.china.huawei.com (7.202.194.199)
X-Spam-Score: -2.3 (--)
X-Spam-Report: Spam detection software, running on the system "6901ab67b84d", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 2025/4/24 1:08, Eric Sandeen wrote: > From: Hongbo Li
 <lihongbo22@huawei.com> > > Use an array of `fs_parameter_spec` called
 f2fs_param_specs
 to > hold the mount option specifications for the new m [...] 
 Content analysis details:   (-2.3 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -2.3 RCVD_IN_DNSWL_MED      RBL: Sender listed at https://www.dnswl.org/,
 medium trust [45.249.212.187 listed in list.dnswl.org]
X-Headers-End: 1uCrSv-00068Q-D4
Subject: Re: [f2fs-dev] [PATCH V3 1/7] f2fs: Add fs parameter specifications
 for mount options
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
From: Hongbo Li via Linux-f2fs-devel <linux-f2fs-devel@lists.sourceforge.net>
Reply-To: Hongbo Li <lihongbo22@huawei.com>
Cc: linux-fsdevel@vger.kernel.org, jaegeuk@kernel.org
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net



On 2025/4/24 1:08, Eric Sandeen wrote:
> From: Hongbo Li <lihongbo22@huawei.com>
> 
> Use an array of `fs_parameter_spec` called f2fs_param_specs to
> hold the mount option specifications for the new mount api.
> 
> Add constant_table structures for several options to facilitate
> parsing.
> 
> Signed-off-by: Hongbo Li <lihongbo22@huawei.com>
> [sandeen: forward port, minor fixes and updates, more fsparam_enum]
> Signed-off-by: Eric Sandeen <sandeen@redhat.com>
Thanks, I have checked this.
Reviewed-by: Hongbo Li <lihongbo22@huawei.com>

> ---
>   fs/f2fs/super.c | 122 ++++++++++++++++++++++++++++++++++++++++++++++++
>   1 file changed, 122 insertions(+)
> 
> diff --git a/fs/f2fs/super.c b/fs/f2fs/super.c
> index 22f26871b7aa..ebea03bba054 100644
> --- a/fs/f2fs/super.c
> +++ b/fs/f2fs/super.c
> @@ -27,6 +27,7 @@
>   #include <linux/part_stat.h>
>   #include <linux/zstd.h>
>   #include <linux/lz4.h>
> +#include <linux/fs_parser.h>
>   
>   #include "f2fs.h"
>   #include "node.h"
> @@ -194,9 +195,130 @@ enum {
>   	Opt_age_extent_cache,
>   	Opt_errors,
>   	Opt_nat_bits,
> +	Opt_jqfmt,
> +	Opt_checkpoint,
>   	Opt_err,
>   };
>   
> +static const struct constant_table f2fs_param_background_gc[] = {
> +	{"on",		BGGC_MODE_ON},
> +	{"off",		BGGC_MODE_OFF},
> +	{"sync",	BGGC_MODE_SYNC},
> +	{}
> +};
> +
> +static const struct constant_table f2fs_param_mode[] = {
> +	{"adaptive",		FS_MODE_ADAPTIVE},
> +	{"lfs",			FS_MODE_LFS},
> +	{"fragment:segment",	FS_MODE_FRAGMENT_SEG},
> +	{"fragment:block",	FS_MODE_FRAGMENT_BLK},
> +	{}
> +};
> +
> +static const struct constant_table f2fs_param_jqfmt[] = {
> +	{"vfsold",	QFMT_VFS_OLD},
> +	{"vfsv0",	QFMT_VFS_V0},
> +	{"vfsv1",	QFMT_VFS_V1},
> +	{}
> +};
> +
> +static const struct constant_table f2fs_param_alloc_mode[] = {
> +	{"default",	ALLOC_MODE_DEFAULT},
> +	{"reuse",	ALLOC_MODE_REUSE},
> +	{}
> +};
> +static const struct constant_table f2fs_param_fsync_mode[] = {
> +	{"posix",	FSYNC_MODE_POSIX},
> +	{"strict",	FSYNC_MODE_STRICT},
> +	{"nobarrier",	FSYNC_MODE_NOBARRIER},
> +	{}
> +};
> +
> +static const struct constant_table f2fs_param_compress_mode[] = {
> +	{"fs",		COMPR_MODE_FS},
> +	{"user",	COMPR_MODE_USER},
> +	{}
> +};
> +
> +static const struct constant_table f2fs_param_discard_unit[] = {
> +	{"block",	DISCARD_UNIT_BLOCK},
> +	{"segment",	DISCARD_UNIT_SEGMENT},
> +	{"section",	DISCARD_UNIT_SECTION},
> +	{}
> +};
> +
> +static const struct constant_table f2fs_param_memory_mode[] = {
> +	{"normal",	MEMORY_MODE_NORMAL},
> +	{"low",		MEMORY_MODE_LOW},
> +	{}
> +};
> +
> +static const struct constant_table f2fs_param_errors[] = {
> +	{"remount-ro",	MOUNT_ERRORS_READONLY},
> +	{"continue",	MOUNT_ERRORS_CONTINUE},
> +	{"panic",	MOUNT_ERRORS_PANIC},
> +	{}
> +};
> +
> +static const struct fs_parameter_spec f2fs_param_specs[] = {
> +	fsparam_enum("background_gc", Opt_gc_background, f2fs_param_background_gc),
> +	fsparam_flag("disable_roll_forward", Opt_disable_roll_forward),
> +	fsparam_flag("norecovery", Opt_norecovery),
> +	fsparam_flag_no("discard", Opt_discard),
> +	fsparam_flag("no_heap", Opt_noheap),
> +	fsparam_flag("heap", Opt_heap),
> +	fsparam_flag_no("user_xattr", Opt_user_xattr),
> +	fsparam_flag_no("acl", Opt_acl),
> +	fsparam_s32("active_logs", Opt_active_logs),
> +	fsparam_flag("disable_ext_identify", Opt_disable_ext_identify),
> +	fsparam_flag_no("inline_xattr", Opt_inline_xattr),
> +	fsparam_s32("inline_xattr_size", Opt_inline_xattr_size),
> +	fsparam_flag_no("inline_data", Opt_inline_data),
> +	fsparam_flag_no("inline_dentry", Opt_inline_dentry),
> +	fsparam_flag_no("flush_merge", Opt_flush_merge),
> +	fsparam_flag_no("barrier", Opt_barrier),
> +	fsparam_flag("fastboot", Opt_fastboot),
> +	fsparam_flag_no("extent_cache", Opt_extent_cache),
> +	fsparam_flag("data_flush", Opt_data_flush),
> +	fsparam_u32("reserve_root", Opt_reserve_root),
> +	fsparam_gid("resgid", Opt_resgid),
> +	fsparam_uid("resuid", Opt_resuid),
> +	fsparam_enum("mode", Opt_mode, f2fs_param_mode),
> +	fsparam_s32("fault_injection", Opt_fault_injection),
> +	fsparam_u32("fault_type", Opt_fault_type),
> +	fsparam_flag_no("lazytime", Opt_lazytime),
> +	fsparam_flag_no("quota", Opt_quota),
> +	fsparam_flag("usrquota", Opt_usrquota),
> +	fsparam_flag("grpquota", Opt_grpquota),
> +	fsparam_flag("prjquota", Opt_prjquota),
> +	fsparam_string_empty("usrjquota", Opt_usrjquota),
> +	fsparam_string_empty("grpjquota", Opt_grpjquota),
> +	fsparam_string_empty("prjjquota", Opt_prjjquota),
> +	fsparam_flag("nat_bits", Opt_nat_bits),
> +	fsparam_enum("jqfmt", Opt_jqfmt, f2fs_param_jqfmt),
> +	fsparam_enum("alloc_mode", Opt_alloc, f2fs_param_alloc_mode),
> +	fsparam_enum("fsync_mode", Opt_fsync, f2fs_param_fsync_mode),
> +	fsparam_string("test_dummy_encryption", Opt_test_dummy_encryption),
> +	fsparam_flag("test_dummy_encryption", Opt_test_dummy_encryption),
> +	fsparam_flag("inlinecrypt", Opt_inlinecrypt),
> +	fsparam_string("checkpoint", Opt_checkpoint),
> +	fsparam_flag_no("checkpoint_merge", Opt_checkpoint_merge),
> +	fsparam_string("compress_algorithm", Opt_compress_algorithm),
> +	fsparam_u32("compress_log_size", Opt_compress_log_size),
> +	fsparam_string("compress_extension", Opt_compress_extension),
> +	fsparam_string("nocompress_extension", Opt_nocompress_extension),
> +	fsparam_flag("compress_chksum", Opt_compress_chksum),
> +	fsparam_enum("compress_mode", Opt_compress_mode, f2fs_param_compress_mode),
> +	fsparam_flag("compress_cache", Opt_compress_cache),
> +	fsparam_flag("atgc", Opt_atgc),
> +	fsparam_flag_no("gc_merge", Opt_gc_merge),
> +	fsparam_enum("discard_unit", Opt_discard_unit, f2fs_param_discard_unit),
> +	fsparam_enum("memory", Opt_memory_mode, f2fs_param_memory_mode),
> +	fsparam_flag("age_extent_cache", Opt_age_extent_cache),
> +	fsparam_enum("errors", Opt_errors, f2fs_param_errors),
> +	{}
> +};
> +
>   static match_table_t f2fs_tokens = {
>   	{Opt_gc_background, "background_gc=%s"},
>   	{Opt_disable_roll_forward, "disable_roll_forward"},


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
