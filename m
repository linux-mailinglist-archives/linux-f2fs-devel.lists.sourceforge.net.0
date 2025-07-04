Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 43512AF9BCA
	for <lists+linux-f2fs-devel@lfdr.de>; Fri,  4 Jul 2025 22:52:08 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Subject:MIME-Version:Message-ID:To:From:Date:Sender:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=9v+NuK886l40eYxGCfESGHZH79ZMH3NIU0inLEejM7Q=; b=ZAHBmXNjxDktHAYaTTn1iRUN4m
	P82saaMr7qqKlyrIL9/x3FoxLTTPRq1kfTKijQ0lg+maJAGMB18f6YATTAQ8J9NO3ulDQ2sf8gnsF
	b1hf+jTLaMIYpmb8gzO3Uh3fMxGpIR3YXh81WidNqxGWV8L2qghnngYUzOnSU9V22Rr0=;
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1uXnO2-0007QV-Gy;
	Fri, 04 Jul 2025 20:51:58 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <lkp@intel.com>) id 1uXnO1-0007QH-98
 for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 04 Jul 2025 20:51:57 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:MIME-Version:Message-ID:Subject:Cc:To:
 From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=bnkqh0enRNUMriJhAdcuKmydw8yl2E9gISzWD7yvn9w=; b=EBjK/REtC4oI0Xa9X8Hfy0nJBJ
 qpo0k5ezyk6cx4jcwaPhyAExOFeGa5BRAATiOyIlxIKfznkZEulN2mHK/jRvq/I+XbOuxQDLDcj/T
 7CVdIowpN0JkQRhZqkE4gsFwgOGXznMmN6AmBktiTK5L650w1YWiNxiUawKtrcT25iEs=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:MIME-Version:Message-ID:Subject:Cc:To:From:Date:Sender:
 Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
 :Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=bnkqh0enRNUMriJhAdcuKmydw8yl2E9gISzWD7yvn9w=; b=D
 Q9Eg+4wByn1KXwGmqdN/ppGCx+Br9x41ROM+bROAp9BBGK/YIktThXCld2qSWyaYarXLGM5nOxpNC
 LWT/4zCVJVSxVZEIMu8rNJaQ2KMVYG/k4zETWn1A/cKgRCoQzpkmfhk3OlVlRcE7D2G+sSNSJ2NGp
 iedlkZ0laHwL1PRY=;
Received: from mgamail.intel.com ([198.175.65.19])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1uXnNz-0002We-Um for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 04 Jul 2025 20:51:57 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1751662315; x=1783198315;
 h=date:from:to:cc:subject:message-id:mime-version;
 bh=svDa7ZwVU9UD6Rzkj0V1sfUEaHH3fIM1Oq+wY4ejg90=;
 b=FnJyuyjraMX6NR1gzjnTCnxGb+XG33PNParMgwLp7yU2y6AUaAaxJoUL
 Kr3Yrt+27SaGErHwue5at5BD9ziNRU0hLmJnqSn40pOooDPz8i/yj9Vcj
 V4k86tttCI/0b9+CI3FTfVFKRIepAB/jsHNSNIV4jVeLbYjENxr5SHdIn
 eBr38m2/UjjZDhOABkbM9ORU6LEkKHXKPnwNv3zLlCf9BIeGPd4VGzOIJ
 yfjXTk+2OeCBGcQnD9S5g9jqY92IJdUZfxmtbdBlcNGyYFCS1+FY/WTlz
 5T5BsLbdbkjkNSBUNRe3L+9qactZqpFOoKXG0yPyk47e2H+NpB5PhVRhF g==;
X-CSE-ConnectionGUID: 4a1DVvupQ7+yPdXOyK0fDw==
X-CSE-MsgGUID: U/6URiPaTqG6nDCvHwrJxw==
X-IronPort-AV: E=McAfee;i="6800,10657,11484"; a="53857372"
X-IronPort-AV: E=Sophos;i="6.16,288,1744095600"; d="scan'208";a="53857372"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Jul 2025 13:51:45 -0700
X-CSE-ConnectionGUID: dGxBiakDQeSGO8P9tcqgyw==
X-CSE-MsgGUID: OQZcJPtYR5WBZeTnU7AVZw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,288,1744095600"; d="scan'208";a="160382508"
Received: from igk-lkp-server01.igk.intel.com (HELO 030a839a1121)
 ([10.91.175.65])
 by orviesa005.jf.intel.com with ESMTP; 04 Jul 2025 13:51:43 -0700
Received: from kbuild by 030a839a1121 with local (Exim 4.96)
 (envelope-from <lkp@intel.com>) id 1uXnNl-0000i5-05;
 Fri, 04 Jul 2025 20:51:41 +0000
Date: Fri, 4 Jul 2025 22:50:40 +0200
From: kernel test robot <lkp@intel.com>
To: Hongbo Li <lihongbo22@huawei.com>
Message-ID: <202507042222.t8N0OTvE-lkp@intel.com>
MIME-Version: 1.0
Content-Disposition: inline
X-Spam-Score: -0.3 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-2.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: tree:
 https://git.kernel.org/pub/scm/linux/kernel/git/jaegeuk/f2fs.git
 dev-test head: 90548c634bd0dc691ec01fefc0e4960afc49c5eb commit:
 a04c9be5c9103fbf4a190c1b64009490ec88b3ab
 [20/22] f2fs: separate t [...] 
 Content analysis details:   (-0.3 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1uXnNz-0002We-Um
Subject: [f2fs-dev] [jaegeuk-f2fs:dev-test 20/22] fs/f2fs/super.c:768:5:
 warning: format specifies type 'unsigned long' but the argument has type
 'unsigned int'
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
Cc: Jaegeuk Kim <jaegeuk@kernel.org>, llvm@lists.linux.dev,
 linux-f2fs-devel@lists.sourceforge.net, Eric Sandeen <sandeen@redhat.com>,
 oe-kbuild-all@lists.linux.dev
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/jaegeuk/f2fs.git dev-test
head:   90548c634bd0dc691ec01fefc0e4960afc49c5eb
commit: a04c9be5c9103fbf4a190c1b64009490ec88b3ab [20/22] f2fs: separate the options parsing and options checking
config: i386-buildonly-randconfig-2003-20250701 (https://download.01.org/0day-ci/archive/20250704/202507042222.t8N0OTvE-lkp@intel.com/config)
compiler: clang version 20.1.7 (https://github.com/llvm/llvm-project 6146a88f60492b520a36f8f8f3231e15f3cc6082)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250704/202507042222.t8N0OTvE-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202507042222.t8N0OTvE-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> fs/f2fs/super.c:768:5: warning: format specifies type 'unsigned long' but the argument has type 'unsigned int' [-Wformat]
     767 |                         f2fs_err(NULL, "inline xattr size is out of range: %lu ~ %lu",
         |                                                                            ~~~
         |                                                                            %u
     768 |                                 MIN_INLINE_XATTR_SIZE, MAX_INLINE_XATTR_SIZE);
         |                                 ^~~~~~~~~~~~~~~~~~~~~
   fs/f2fs/f2fs.h:1889:42: note: expanded from macro 'f2fs_err'
    1889 |         f2fs_printk(sbi, false, KERN_ERR fmt, ##__VA_ARGS__)
         |                                          ~~~    ^~~~~~~~~~~
   fs/f2fs/xattr.h:86:31: note: expanded from macro 'MIN_INLINE_XATTR_SIZE'
      86 | #define MIN_INLINE_XATTR_SIZE (sizeof(struct f2fs_xattr_header) / sizeof(__le32))
         |                               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   fs/f2fs/super.c:371:20: warning: unused function 'ctx_set_flags' [-Wunused-function]
     371 | static inline void ctx_set_flags(struct f2fs_fs_context *ctx,
         |                    ^~~~~~~~~~~~~
   2 warnings generated.


vim +768 fs/f2fs/super.c

   711	
   712	static int handle_mount_opt(struct fs_context *fc, struct fs_parameter *param)
   713	{
   714		struct f2fs_fs_context *ctx = fc->fs_private;
   715	#ifdef CONFIG_F2FS_FS_COMPRESSION
   716		unsigned char (*ext)[F2FS_EXTENSION_LEN];
   717		unsigned char (*noext)[F2FS_EXTENSION_LEN];
   718		int ext_cnt, noext_cnt;
   719		char *name;
   720	#endif
   721		substring_t args[MAX_OPT_ARGS];
   722		struct fs_parse_result result;
   723		int token, ret, arg;
   724	
   725		token = fs_parse(fc, f2fs_param_specs, param, &result);
   726		if (token < 0)
   727			return token;
   728	
   729		switch (token) {
   730		case Opt_gc_background:
   731			F2FS_CTX_INFO(ctx).bggc_mode = result.uint_32;
   732			ctx->spec_mask |= F2FS_SPEC_background_gc;
   733			break;
   734		case Opt_disable_roll_forward:
   735			ctx_set_opt(ctx, F2FS_MOUNT_DISABLE_ROLL_FORWARD);
   736			break;
   737		case Opt_norecovery:
   738			/* requires ro mount, checked in f2fs_validate_options */
   739			ctx_set_opt(ctx, F2FS_MOUNT_NORECOVERY);
   740			break;
   741		case Opt_discard:
   742			if (result.negated)
   743				ctx_clear_opt(ctx, F2FS_MOUNT_DISCARD);
   744			else
   745				ctx_set_opt(ctx, F2FS_MOUNT_DISCARD);
   746			break;
   747		case Opt_noheap:
   748		case Opt_heap:
   749			f2fs_warn(NULL, "heap/no_heap options were deprecated");
   750			break;
   751	#ifdef CONFIG_F2FS_FS_XATTR
   752		case Opt_user_xattr:
   753			if (result.negated)
   754				ctx_clear_opt(ctx, F2FS_MOUNT_XATTR_USER);
   755			else
   756				ctx_set_opt(ctx, F2FS_MOUNT_XATTR_USER);
   757			break;
   758		case Opt_inline_xattr:
   759			if (result.negated)
   760				ctx_clear_opt(ctx, F2FS_MOUNT_INLINE_XATTR);
   761			else
   762				ctx_set_opt(ctx, F2FS_MOUNT_INLINE_XATTR);
   763			break;
   764		case Opt_inline_xattr_size:
   765			if (result.int_32 < MIN_INLINE_XATTR_SIZE ||
   766				result.int_32 > MAX_INLINE_XATTR_SIZE) {
   767				f2fs_err(NULL, "inline xattr size is out of range: %lu ~ %lu",
 > 768					MIN_INLINE_XATTR_SIZE, MAX_INLINE_XATTR_SIZE);
   769				return -EINVAL;
   770			}
   771			ctx_set_opt(ctx, F2FS_MOUNT_INLINE_XATTR_SIZE);
   772			F2FS_CTX_INFO(ctx).inline_xattr_size = result.int_32;
   773			ctx->spec_mask |= F2FS_SPEC_inline_xattr_size;
   774			break;
   775	#else
   776		case Opt_user_xattr:
   777		case Opt_inline_xattr:
   778		case Opt_inline_xattr_size:
   779			f2fs_info(NULL, "%s options not supported", param->key);
   780			break;
   781	#endif
   782	#ifdef CONFIG_F2FS_FS_POSIX_ACL
   783		case Opt_acl:
   784			if (result.negated)
   785				ctx_clear_opt(ctx, F2FS_MOUNT_POSIX_ACL);
   786			else
   787				ctx_set_opt(ctx, F2FS_MOUNT_POSIX_ACL);
   788			break;
   789	#else
   790		case Opt_acl:
   791			f2fs_info(NULL, "%s options not supported", param->key);
   792			break;
   793	#endif
   794		case Opt_active_logs:
   795			if (result.int_32 != 2 && result.int_32 != 4 &&
   796				result.int_32 != NR_CURSEG_PERSIST_TYPE)
   797				return -EINVAL;
   798			ctx->spec_mask |= F2FS_SPEC_active_logs;
   799			F2FS_CTX_INFO(ctx).active_logs = result.int_32;
   800			break;
   801		case Opt_disable_ext_identify:
   802			ctx_set_opt(ctx, F2FS_MOUNT_DISABLE_EXT_IDENTIFY);
   803			break;
   804		case Opt_inline_data:
   805			if (result.negated)
   806				ctx_clear_opt(ctx, F2FS_MOUNT_INLINE_DATA);
   807			else
   808				ctx_set_opt(ctx, F2FS_MOUNT_INLINE_DATA);
   809			break;
   810		case Opt_inline_dentry:
   811			if (result.negated)
   812				ctx_clear_opt(ctx, F2FS_MOUNT_INLINE_DENTRY);
   813			else
   814				ctx_set_opt(ctx, F2FS_MOUNT_INLINE_DENTRY);
   815			break;
   816		case Opt_flush_merge:
   817			if (result.negated)
   818				ctx_clear_opt(ctx, F2FS_MOUNT_FLUSH_MERGE);
   819			else
   820				ctx_set_opt(ctx, F2FS_MOUNT_FLUSH_MERGE);
   821			break;
   822		case Opt_barrier:
   823			if (result.negated)
   824				ctx_set_opt(ctx, F2FS_MOUNT_NOBARRIER);
   825			else
   826				ctx_clear_opt(ctx, F2FS_MOUNT_NOBARRIER);
   827			break;
   828		case Opt_fastboot:
   829			ctx_set_opt(ctx, F2FS_MOUNT_FASTBOOT);
   830			break;
   831		case Opt_extent_cache:
   832			if (result.negated)
   833				ctx_clear_opt(ctx, F2FS_MOUNT_READ_EXTENT_CACHE);
   834			else
   835				ctx_set_opt(ctx, F2FS_MOUNT_READ_EXTENT_CACHE);
   836			break;
   837		case Opt_data_flush:
   838			ctx_set_opt(ctx, F2FS_MOUNT_DATA_FLUSH);
   839			break;
   840		case Opt_reserve_root:
   841			ctx_set_opt(ctx, F2FS_MOUNT_RESERVE_ROOT);
   842			F2FS_CTX_INFO(ctx).root_reserved_blocks = result.uint_32;
   843			ctx->spec_mask |= F2FS_SPEC_reserve_root;
   844			break;
   845		case Opt_resuid:
   846			F2FS_CTX_INFO(ctx).s_resuid = result.uid;
   847			ctx->spec_mask |= F2FS_SPEC_resuid;
   848			break;
   849		case Opt_resgid:
   850			F2FS_CTX_INFO(ctx).s_resgid = result.gid;
   851			ctx->spec_mask |= F2FS_SPEC_resgid;
   852			break;
   853		case Opt_mode:
   854			F2FS_CTX_INFO(ctx).fs_mode = result.uint_32;
   855			ctx->spec_mask |= F2FS_SPEC_mode;
   856			break;
   857	#ifdef CONFIG_F2FS_FAULT_INJECTION
   858		case Opt_fault_injection:
   859			F2FS_CTX_INFO(ctx).fault_info.inject_rate = result.int_32;
   860			ctx->spec_mask |= F2FS_SPEC_fault_injection;
   861			ctx_set_opt(ctx, F2FS_MOUNT_FAULT_INJECTION);
   862			break;
   863	
   864		case Opt_fault_type:
   865			if (result.uint_32 > BIT(FAULT_MAX))
   866				return -EINVAL;
   867			F2FS_CTX_INFO(ctx).fault_info.inject_type = result.uint_32;
   868			ctx->spec_mask |= F2FS_SPEC_fault_type;
   869			ctx_set_opt(ctx, F2FS_MOUNT_FAULT_INJECTION);
   870			break;
   871	#else
   872		case Opt_fault_injection:
   873		case Opt_fault_type:
   874			f2fs_info(NULL, "%s options not supported", param->key);
   875			break;
   876	#endif
   877		case Opt_lazytime:
   878			if (result.negated)
   879				ctx_clear_opt(ctx, F2FS_MOUNT_LAZYTIME);
   880			else
   881				ctx_set_opt(ctx, F2FS_MOUNT_LAZYTIME);
   882			break;
   883	#ifdef CONFIG_QUOTA
   884		case Opt_quota:
   885			if (result.negated) {
   886				ctx_clear_opt(ctx, F2FS_MOUNT_QUOTA);
   887				ctx_clear_opt(ctx, F2FS_MOUNT_USRQUOTA);
   888				ctx_clear_opt(ctx, F2FS_MOUNT_GRPQUOTA);
   889				ctx_clear_opt(ctx, F2FS_MOUNT_PRJQUOTA);
   890			} else
   891				ctx_set_opt(ctx, F2FS_MOUNT_USRQUOTA);
   892			break;
   893		case Opt_usrquota:
   894			ctx_set_opt(ctx, F2FS_MOUNT_USRQUOTA);
   895			break;
   896		case Opt_grpquota:
   897			ctx_set_opt(ctx, F2FS_MOUNT_GRPQUOTA);
   898			break;
   899		case Opt_prjquota:
   900			ctx_set_opt(ctx, F2FS_MOUNT_PRJQUOTA);
   901			break;
   902		case Opt_usrjquota:
   903			if (!*param->string)
   904				ret = f2fs_unnote_qf_name(fc, USRQUOTA);
   905			else
   906				ret = f2fs_note_qf_name(fc, USRQUOTA, param);
   907			if (ret)
   908				return ret;
   909			break;
   910		case Opt_grpjquota:
   911			if (!*param->string)
   912				ret = f2fs_unnote_qf_name(fc, GRPQUOTA);
   913			else
   914				ret = f2fs_note_qf_name(fc, GRPQUOTA, param);
   915			if (ret)
   916				return ret;
   917			break;
   918		case Opt_prjjquota:
   919			if (!*param->string)
   920				ret = f2fs_unnote_qf_name(fc, PRJQUOTA);
   921			else
   922				ret = f2fs_note_qf_name(fc, PRJQUOTA, param);
   923			if (ret)
   924				return ret;
   925			break;
   926		case Opt_jqfmt:
   927			F2FS_CTX_INFO(ctx).s_jquota_fmt = result.int_32;
   928			ctx->spec_mask |= F2FS_SPEC_jqfmt;
   929			break;
   930	#else
   931		case Opt_quota:
   932		case Opt_usrquota:
   933		case Opt_grpquota:
   934		case Opt_prjquota:
   935		case Opt_usrjquota:
   936		case Opt_grpjquota:
   937		case Opt_prjjquota:
   938			f2fs_info(NULL, "quota operations not supported");
   939			break;
   940	#endif
   941		case Opt_alloc:
   942			F2FS_CTX_INFO(ctx).alloc_mode = result.uint_32;
   943			ctx->spec_mask |= F2FS_SPEC_alloc_mode;
   944			break;
   945		case Opt_fsync:
   946			F2FS_CTX_INFO(ctx).fsync_mode = result.uint_32;
   947			ctx->spec_mask |= F2FS_SPEC_fsync_mode;
   948			break;
   949		case Opt_test_dummy_encryption:
   950			ret = f2fs_parse_test_dummy_encryption(param, ctx);
   951			if (ret)
   952				return ret;
   953			break;
   954		case Opt_inlinecrypt:
   955	#ifdef CONFIG_FS_ENCRYPTION_INLINE_CRYPT
   956			ctx_set_opt(ctx, F2FS_MOUNT_INLINECRYPT);
   957	#else
   958			f2fs_info(NULL, "inline encryption not supported");
   959	#endif
   960			break;
   961		case Opt_checkpoint:
   962			/*
   963			 * Initialize args struct so we know whether arg was
   964			 * found; some options take optional arguments.
   965			 */
   966			args[0].from = args[0].to = NULL;
   967			arg = 0;
   968	
   969			/* revert to match_table for checkpoint= options */
   970			token = match_token(param->string, f2fs_checkpoint_tokens, args);
   971			switch (token) {
   972			case Opt_checkpoint_disable_cap_perc:
   973				if (args->from && match_int(args, &arg))
   974					return -EINVAL;
   975				if (arg < 0 || arg > 100)
   976					return -EINVAL;
   977				F2FS_CTX_INFO(ctx).unusable_cap_perc = arg;
   978				ctx->spec_mask |= F2FS_SPEC_checkpoint_disable_cap_perc;
   979				ctx_set_opt(ctx, F2FS_MOUNT_DISABLE_CHECKPOINT);
   980				break;
   981			case Opt_checkpoint_disable_cap:
   982				if (args->from && match_int(args, &arg))
   983					return -EINVAL;
   984				F2FS_CTX_INFO(ctx).unusable_cap = arg;
   985				ctx->spec_mask |= F2FS_SPEC_checkpoint_disable_cap;
   986				ctx_set_opt(ctx, F2FS_MOUNT_DISABLE_CHECKPOINT);
   987				break;
   988			case Opt_checkpoint_disable:
   989				ctx_set_opt(ctx, F2FS_MOUNT_DISABLE_CHECKPOINT);
   990				break;
   991			case Opt_checkpoint_enable:
   992				ctx_clear_opt(ctx, F2FS_MOUNT_DISABLE_CHECKPOINT);
   993				break;
   994			default:
   995				return -EINVAL;
   996			}
   997			break;
   998		case Opt_checkpoint_merge:
   999			if (result.negated)
  1000				ctx_clear_opt(ctx, F2FS_MOUNT_MERGE_CHECKPOINT);
  1001			else
  1002				ctx_set_opt(ctx, F2FS_MOUNT_MERGE_CHECKPOINT);
  1003			break;
  1004	#ifdef CONFIG_F2FS_FS_COMPRESSION
  1005		case Opt_compress_algorithm:
  1006			name = param->string;
  1007			if (!strcmp(name, "lzo")) {
  1008	#ifdef CONFIG_F2FS_FS_LZO
  1009				F2FS_CTX_INFO(ctx).compress_level = 0;
  1010				F2FS_CTX_INFO(ctx).compress_algorithm = COMPRESS_LZO;
  1011				ctx->spec_mask |= F2FS_SPEC_compress_level;
  1012				ctx->spec_mask |= F2FS_SPEC_compress_algorithm;
  1013	#else
  1014				f2fs_info(NULL, "kernel doesn't support lzo compression");
  1015	#endif
  1016			} else if (!strncmp(name, "lz4", 3)) {
  1017	#ifdef CONFIG_F2FS_FS_LZ4
  1018				ret = f2fs_set_lz4hc_level(ctx, name);
  1019				if (ret)
  1020					return -EINVAL;
  1021				F2FS_CTX_INFO(ctx).compress_algorithm = COMPRESS_LZ4;
  1022				ctx->spec_mask |= F2FS_SPEC_compress_algorithm;
  1023	#else
  1024				f2fs_info(NULL, "kernel doesn't support lz4 compression");
  1025	#endif
  1026			} else if (!strncmp(name, "zstd", 4)) {
  1027	#ifdef CONFIG_F2FS_FS_ZSTD
  1028				ret = f2fs_set_zstd_level(ctx, name);
  1029				if (ret)
  1030					return -EINVAL;
  1031				F2FS_CTX_INFO(ctx).compress_algorithm = COMPRESS_ZSTD;
  1032				ctx->spec_mask |= F2FS_SPEC_compress_algorithm;
  1033	#else
  1034				f2fs_info(NULL, "kernel doesn't support zstd compression");
  1035	#endif
  1036			} else if (!strcmp(name, "lzo-rle")) {
  1037	#ifdef CONFIG_F2FS_FS_LZORLE
  1038				F2FS_CTX_INFO(ctx).compress_level = 0;
  1039				F2FS_CTX_INFO(ctx).compress_algorithm = COMPRESS_LZORLE;
  1040				ctx->spec_mask |= F2FS_SPEC_compress_level;
  1041				ctx->spec_mask |= F2FS_SPEC_compress_algorithm;
  1042	#else
  1043				f2fs_info(NULL, "kernel doesn't support lzorle compression");
  1044	#endif
  1045			} else
  1046				return -EINVAL;
  1047			break;
  1048		case Opt_compress_log_size:
  1049			if (result.uint_32 < MIN_COMPRESS_LOG_SIZE ||
  1050			    result.uint_32 > MAX_COMPRESS_LOG_SIZE) {
  1051				f2fs_err(NULL,
  1052					"Compress cluster log size is out of range");
  1053				return -EINVAL;
  1054			}
  1055			F2FS_CTX_INFO(ctx).compress_log_size = result.uint_32;
  1056			ctx->spec_mask |= F2FS_SPEC_compress_log_size;
  1057			break;
  1058		case Opt_compress_extension:
  1059			name = param->string;
  1060			ext = F2FS_CTX_INFO(ctx).extensions;
  1061			ext_cnt = F2FS_CTX_INFO(ctx).compress_ext_cnt;
  1062	
  1063			if (strlen(name) >= F2FS_EXTENSION_LEN ||
  1064			    ext_cnt >= COMPRESS_EXT_NUM) {
  1065				f2fs_err(NULL, "invalid extension length/number");
  1066				return -EINVAL;
  1067			}
  1068	
  1069			if (is_compress_extension_exist(&ctx->info, name, true))
  1070				break;
  1071	
  1072			ret = strscpy(ext[ext_cnt], name, F2FS_EXTENSION_LEN);
  1073			if (ret < 0)
  1074				return ret;
  1075			F2FS_CTX_INFO(ctx).compress_ext_cnt++;
  1076			ctx->spec_mask |= F2FS_SPEC_compress_extension;
  1077			break;
  1078		case Opt_nocompress_extension:
  1079			name = param->string;
  1080			noext = F2FS_CTX_INFO(ctx).noextensions;
  1081			noext_cnt = F2FS_CTX_INFO(ctx).nocompress_ext_cnt;
  1082	
  1083			if (strlen(name) >= F2FS_EXTENSION_LEN ||
  1084				noext_cnt >= COMPRESS_EXT_NUM) {
  1085				f2fs_err(NULL, "invalid extension length/number");
  1086				return -EINVAL;
  1087			}
  1088	
  1089			if (is_compress_extension_exist(&ctx->info, name, false))
  1090				break;
  1091	
  1092			ret = strscpy(noext[noext_cnt], name, F2FS_EXTENSION_LEN);
  1093			if (ret < 0)
  1094				return ret;
  1095			F2FS_CTX_INFO(ctx).nocompress_ext_cnt++;
  1096			ctx->spec_mask |= F2FS_SPEC_nocompress_extension;
  1097			break;
  1098		case Opt_compress_chksum:
  1099			F2FS_CTX_INFO(ctx).compress_chksum = true;
  1100			ctx->spec_mask |= F2FS_SPEC_compress_chksum;
  1101			break;
  1102		case Opt_compress_mode:
  1103			F2FS_CTX_INFO(ctx).compress_mode = result.uint_32;
  1104			ctx->spec_mask |= F2FS_SPEC_compress_mode;
  1105			break;
  1106		case Opt_compress_cache:
  1107			ctx_set_opt(ctx, F2FS_MOUNT_COMPRESS_CACHE);
  1108			break;
  1109	#else
  1110		case Opt_compress_algorithm:
  1111		case Opt_compress_log_size:
  1112		case Opt_compress_extension:
  1113		case Opt_nocompress_extension:
  1114		case Opt_compress_chksum:
  1115		case Opt_compress_mode:
  1116		case Opt_compress_cache:
  1117			f2fs_info(NULL, "compression options not supported");
  1118			break;
  1119	#endif
  1120		case Opt_atgc:
  1121			ctx_set_opt(ctx, F2FS_MOUNT_ATGC);
  1122			break;
  1123		case Opt_gc_merge:
  1124			if (result.negated)
  1125				ctx_clear_opt(ctx, F2FS_MOUNT_GC_MERGE);
  1126			else
  1127				ctx_set_opt(ctx, F2FS_MOUNT_GC_MERGE);
  1128			break;
  1129		case Opt_discard_unit:
  1130			F2FS_CTX_INFO(ctx).discard_unit = result.uint_32;
  1131			ctx->spec_mask |= F2FS_SPEC_discard_unit;
  1132			break;
  1133		case Opt_memory_mode:
  1134			F2FS_CTX_INFO(ctx).memory_mode = result.uint_32;
  1135			ctx->spec_mask |= F2FS_SPEC_memory_mode;
  1136			break;
  1137		case Opt_age_extent_cache:
  1138			ctx_set_opt(ctx, F2FS_MOUNT_AGE_EXTENT_CACHE);
  1139			break;
  1140		case Opt_errors:
  1141			F2FS_CTX_INFO(ctx).errors = result.uint_32;
  1142			ctx->spec_mask |= F2FS_SPEC_errors;
  1143			break;
  1144		case Opt_nat_bits:
  1145			ctx_set_opt(ctx, F2FS_MOUNT_NAT_BITS);
  1146			break;
  1147		}
  1148		return 0;
  1149	}
  1150	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
