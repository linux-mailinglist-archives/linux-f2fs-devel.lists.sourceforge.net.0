Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 9FC65A9555C
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 21 Apr 2025 19:38:43 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-3.v29.lw.sourceforge.com)
	by sfs-ml-3.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1u6v6O-0004uI-3h;
	Mon, 21 Apr 2025 17:38:39 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-3.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <lkp@intel.com>) id 1u6v6M-0004u6-M5
 for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 21 Apr 2025 17:38:38 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=TDtkp5cnfMFAtLecgAQtUi5gfKMjKNltY0HEQ/wCDO8=; b=VePmhpZC9LRHS/7dRIc0Hp1SWA
 BMBE3GaXoTAF0F4wXqeBNORGiRdKXFk3ALjKn3ZaKsjrvwQ0Ty0kOJUcvygsX0v28Dyfi/6LQkNVH
 s4NsTxwlcIER9i4FLEc2ZHypu3K6IISSTUk8jlpPJpb1CYitee//lM9jMA9NsikNMEOM=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=TDtkp5cnfMFAtLecgAQtUi5gfKMjKNltY0HEQ/wCDO8=; b=IcNm/vl8Rn37ClXQMNjoDSrjtx
 8SogarTIkft+8OAmKAMkEzBAYR7p/EhCI6WdZf7YFG9GYh+zp41h+2uroBOt8MFPLDmKJgPa7WQut
 fIv7BJdFebq1JuJE8dS3ONMFhA+acpJvk8zdzVXdzrIGUQSKkakpW2vJ+YsFHXCYghwA=;
Received: from mgamail.intel.com ([192.198.163.19])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1u6v65-0005C5-Jd for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 21 Apr 2025 17:38:37 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1745257101; x=1776793101;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=SzSFHkTGOg84oGCaj8qXsMRNnj8W17dO8iKWSIv8hcc=;
 b=K7TfGyTEe8qPZ18Pele0EPs4ATwwgWx5GTUAY6S0Dk5YIU4MC4yj0Tet
 pbBL3s9au2rqvxIEf9xA4LV6NgDyXSEmvS4S6MLUtssFKudN/xRc7YIzU
 jzqdvCqSAbGOwMXcAvHJr5jvIRWOAt9MfVTaTylalDc7nsQjzI8ssOZUp
 u1UK1cwIDhSRKqW+fz2+te/RmujBxBullPnsWeJLIlGUZtdK/KgzYa9UW
 qcF9h1q8hKg+rSiXOuj/SvWyt8lFP/CXSxQ1LQLLAQj+tZdhZWncNwEij
 0YeE8f0J/ptrSRjfPHihg0aDpaBc5hXpaTA7JHR6TIQmjO0tvvqGTkfae Q==;
X-CSE-ConnectionGUID: nJdPK5FMRc2zbXNCCOPN7w==
X-CSE-MsgGUID: gMfVdWIQQcuCUDKlznSuIw==
X-IronPort-AV: E=McAfee;i="6700,10204,11410"; a="45917073"
X-IronPort-AV: E=Sophos;i="6.15,228,1739865600"; d="scan'208";a="45917073"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Apr 2025 10:37:51 -0700
X-CSE-ConnectionGUID: 03JrvA4+TbO1O5b6fkCx7A==
X-CSE-MsgGUID: ++FvrSF8Teu1CmbfPfjmAQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,228,1739865600"; d="scan'208";a="136876063"
Received: from lkp-server01.sh.intel.com (HELO 050dd05385d1) ([10.239.97.150])
 by fmviesa004.fm.intel.com with ESMTP; 21 Apr 2025 10:37:48 -0700
Received: from kbuild by 050dd05385d1 with local (Exim 4.96)
 (envelope-from <lkp@intel.com>) id 1u6v5W-0000HT-0Z;
 Mon, 21 Apr 2025 17:37:46 +0000
Date: Tue, 22 Apr 2025 01:37:43 +0800
From: kernel test robot <lkp@intel.com>
To: Eric Sandeen <sandeen@redhat.com>, linux-f2fs-devel@lists.sourceforge.net
Message-ID: <202504220117.vULD83Cm-lkp@intel.com>
References: <20250420154647.1233033-6-sandeen@redhat.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20250420154647.1233033-6-sandeen@redhat.com>
X-Spam-Score: -3.2 (---)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  Hi Eric,
 kernel test robot noticed the following build warnings:
 [auto build test WARNING on v6.15-rc3] [also build test WARNING on
 linus/master]
 [cannot apply to jaegeuk-f2fs/dev-test jaegeuk-f2fs/dev next-20250417] [If
 your patch is applied to the wrong git tree, [...] 
 Content analysis details:   (-3.2 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -2.3 RCVD_IN_DNSWL_MED      RBL: Sender listed at https://www.dnswl.org/,
 medium trust [192.198.163.19 listed in list.dnswl.org]
 0.0 RCVD_IN_VALIDITY_RPBL_BLOCKED RBL: ADMINISTRATOR NOTICE: The
 query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [192.198.163.19 listed in bl.score.senderscore.com]
 0.0 RCVD_IN_VALIDITY_CERTIFIED_BLOCKED RBL: ADMINISTRATOR NOTICE:
 The query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [192.198.163.19 listed in sa-accredit.habeas.com]
 0.0 T_SPF_TEMPERROR        SPF: test of record failed (temperror)
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.7 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1u6v65-0005C5-Jd
Subject: Re: [f2fs-dev] [PATCH 5/7] f2fs: separate the options parsing and
 options checking
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
Cc: Eric Sandeen <sandeen@redhat.com>, llvm@lists.linux.dev,
 lihongbo22@huawei.com, oe-kbuild-all@lists.linux.dev,
 linux-fsdevel@vger.kernel.org, jaegeuk@kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

Hi Eric,

kernel test robot noticed the following build warnings:

[auto build test WARNING on v6.15-rc3]
[also build test WARNING on linus/master]
[cannot apply to jaegeuk-f2fs/dev-test jaegeuk-f2fs/dev next-20250417]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Eric-Sandeen/f2fs-Add-fs-parameter-specifications-for-mount-options/20250421-220156
base:   v6.15-rc3
patch link:    https://lore.kernel.org/r/20250420154647.1233033-6-sandeen%40redhat.com
patch subject: [PATCH 5/7] f2fs: separate the options parsing and options checking
config: i386-buildonly-randconfig-003-20250421 (https://download.01.org/0day-ci/archive/20250422/202504220117.vULD83Cm-lkp@intel.com/config)
compiler: clang version 20.1.2 (https://github.com/llvm/llvm-project 58df0ef89dd64126512e4ee27b4ac3fd8ddf6247)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250422/202504220117.vULD83Cm-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202504220117.vULD83Cm-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> fs/f2fs/super.c:764:5: warning: format specifies type 'unsigned long' but the argument has type 'unsigned int' [-Wformat]
     763 |                         f2fs_err(NULL, "inline xattr size is out of range: %lu ~ %lu",
         |                                                                            ~~~
         |                                                                            %u
     764 |                                 MIN_INLINE_XATTR_SIZE, MAX_INLINE_XATTR_SIZE);
         |                                 ^~~~~~~~~~~~~~~~~~~~~
   fs/f2fs/f2fs.h:1871:42: note: expanded from macro 'f2fs_err'
    1871 |         f2fs_printk(sbi, false, KERN_ERR fmt, ##__VA_ARGS__)
         |                                          ~~~    ^~~~~~~~~~~
   fs/f2fs/xattr.h:86:31: note: expanded from macro 'MIN_INLINE_XATTR_SIZE'
      86 | #define MIN_INLINE_XATTR_SIZE (sizeof(struct f2fs_xattr_header) / sizeof(__le32))
         |                               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   fs/f2fs/super.c:964:8: warning: variable 'arg' is used uninitialized whenever '&&' condition is false [-Wsometimes-uninitialized]
     964 |                         if (args->from && match_int(args, &arg))
         |                             ^~~~~~~~~~
   fs/f2fs/super.c:966:8: note: uninitialized use occurs here
     966 |                         if (arg < 0 || arg > 100)
         |                             ^~~
   fs/f2fs/super.c:964:8: note: remove the '&&' if its condition is always true
     964 |                         if (args->from && match_int(args, &arg))
         |                             ^~~~~~~~~~~~~
   fs/f2fs/super.c:719:21: note: initialize the variable 'arg' to silence this warning
     719 |         int token, ret, arg;
         |                            ^
         |                             = 0
   fs/f2fs/super.c:1285:20: error: use of undeclared identifier 'sbi'
    1285 |         if (f2fs_readonly(sbi->sb))
         |                           ^
   fs/f2fs/super.c:1287:28: error: use of undeclared identifier 'sbi'; did you mean 'sb'?
    1287 |         if (f2fs_sb_has_quota_ino(sbi)) {
         |                                   ^~~
         |                                   sb
   fs/f2fs/super.c:1187:26: note: 'sb' declared here
    1187 |                                         struct super_block *sb)
         |                                                             ^
   fs/f2fs/super.c:1288:13: error: use of undeclared identifier 'sbi'; did you mean 'sb'?
    1288 |                 f2fs_info(sbi, "Filesystem with quota feature cannot be mounted RDWR without CONFIG_QUOTA");
         |                           ^~~
         |                           sb
   fs/f2fs/f2fs.h:1877:14: note: expanded from macro 'f2fs_info'
    1877 |         f2fs_printk(sbi, false, KERN_INFO fmt, ##__VA_ARGS__)
         |                     ^
   fs/f2fs/super.c:1187:26: note: 'sb' declared here
    1187 |                                         struct super_block *sb)
         |                                                             ^
   fs/f2fs/super.c:1291:32: error: use of undeclared identifier 'sbi'; did you mean 'sb'?
    1291 |         if (f2fs_sb_has_project_quota(sbi)) {
         |                                       ^~~
         |                                       sb
   fs/f2fs/super.c:1187:26: note: 'sb' declared here
    1187 |                                         struct super_block *sb)
         |                                                             ^
   fs/f2fs/super.c:1292:12: error: use of undeclared identifier 'sbi'; did you mean 'sb'?
    1292 |                 f2fs_err(sbi, "Filesystem with project quota feature cannot be mounted RDWR without CONFIG_QUOTA");
         |                          ^~~
         |                          sb
   fs/f2fs/f2fs.h:1871:14: note: expanded from macro 'f2fs_err'
    1871 |         f2fs_printk(sbi, false, KERN_ERR fmt, ##__VA_ARGS__)
         |                     ^
   fs/f2fs/super.c:1187:26: note: 'sb' declared here
    1187 |                                         struct super_block *sb)
         |                                                             ^
   2 warnings and 5 errors generated.


vim +764 fs/f2fs/super.c

   707	
   708	static int handle_mount_opt(struct fs_context *fc, struct fs_parameter *param)
   709	{
   710		struct f2fs_fs_context *ctx = fc->fs_private;
   711	#ifdef CONFIG_F2FS_FS_COMPRESSION
   712		unsigned char (*ext)[F2FS_EXTENSION_LEN];
   713		unsigned char (*noext)[F2FS_EXTENSION_LEN];
   714		int ext_cnt, noext_cnt;
   715	#endif
   716		substring_t args[MAX_OPT_ARGS];
   717		struct fs_parse_result result;
   718		char *name;
   719		int token, ret, arg;
   720	
   721		token = fs_parse(fc, f2fs_param_specs, param, &result);
   722		if (token < 0)
   723			return token;
   724	
   725		switch (token) {
   726		case Opt_gc_background:
   727			F2FS_CTX_INFO(ctx).bggc_mode = result.uint_32;
   728			ctx->spec_mask |= F2FS_SPEC_background_gc;
   729			break;
   730		case Opt_disable_roll_forward:
   731			ctx_set_opt(ctx, F2FS_MOUNT_DISABLE_ROLL_FORWARD);
   732			break;
   733		case Opt_norecovery:
   734			/* requires ro mount, checked in f2fs_validate_options */
   735			ctx_set_opt(ctx, F2FS_MOUNT_NORECOVERY);
   736			break;
   737		case Opt_discard:
   738			if (result.negated)
   739				ctx_clear_opt(ctx, F2FS_MOUNT_DISCARD);
   740			else
   741				ctx_set_opt(ctx, F2FS_MOUNT_DISCARD);
   742			break;
   743		case Opt_noheap:
   744		case Opt_heap:
   745			f2fs_warn(NULL, "heap/no_heap options were deprecated");
   746			break;
   747	#ifdef CONFIG_F2FS_FS_XATTR
   748		case Opt_user_xattr:
   749			if (result.negated)
   750				ctx_clear_opt(ctx, F2FS_MOUNT_XATTR_USER);
   751			else
   752				ctx_set_opt(ctx, F2FS_MOUNT_XATTR_USER);
   753			break;
   754		case Opt_inline_xattr:
   755			if (result.negated)
   756				ctx_clear_opt(ctx, F2FS_MOUNT_INLINE_XATTR);
   757			else
   758				ctx_set_opt(ctx, F2FS_MOUNT_INLINE_XATTR);
   759			break;
   760		case Opt_inline_xattr_size:
   761			if (result.int_32 < MIN_INLINE_XATTR_SIZE ||
   762				result.int_32 > MAX_INLINE_XATTR_SIZE) {
   763				f2fs_err(NULL, "inline xattr size is out of range: %lu ~ %lu",
 > 764					MIN_INLINE_XATTR_SIZE, MAX_INLINE_XATTR_SIZE);
   765				return -EINVAL;
   766			}
   767			ctx_set_opt(ctx, F2FS_MOUNT_INLINE_XATTR_SIZE);
   768			F2FS_CTX_INFO(ctx).inline_xattr_size = result.int_32;
   769			ctx->spec_mask |= F2FS_SPEC_inline_xattr_size;
   770			break;
   771	#else
   772		case Opt_user_xattr:
   773		case Opt_inline_xattr:
   774		case Opt_inline_xattr_size:
   775			f2fs_info(NULL, "%s options not supported", param->key);
   776			break;
   777	#endif
   778	#ifdef CONFIG_F2FS_FS_POSIX_ACL
   779		case Opt_acl:
   780			if (result.negated)
   781				ctx_clear_opt(ctx, F2FS_MOUNT_POSIX_ACL);
   782			else
   783				ctx_set_opt(ctx, F2FS_MOUNT_POSIX_ACL);
   784			break;
   785	#else
   786		case Opt_acl:
   787			f2fs_info(NULL, "%s options not supported", param->key);
   788			break;
   789	#endif
   790		case Opt_active_logs:
   791			if (result.int_32 != 2 && result.int_32 != 4 &&
   792				result.int_32 != NR_CURSEG_PERSIST_TYPE)
   793				return -EINVAL;
   794			ctx->spec_mask |= F2FS_SPEC_active_logs;
   795			F2FS_CTX_INFO(ctx).active_logs = result.int_32;
   796			break;
   797		case Opt_disable_ext_identify:
   798			ctx_set_opt(ctx, F2FS_MOUNT_DISABLE_EXT_IDENTIFY);
   799			break;
   800		case Opt_inline_data:
   801			if (result.negated)
   802				ctx_clear_opt(ctx, F2FS_MOUNT_INLINE_DATA);
   803			else
   804				ctx_set_opt(ctx, F2FS_MOUNT_INLINE_DATA);
   805			break;
   806		case Opt_inline_dentry:
   807			if (result.negated)
   808				ctx_clear_opt(ctx, F2FS_MOUNT_INLINE_DENTRY);
   809			else
   810				ctx_set_opt(ctx, F2FS_MOUNT_INLINE_DENTRY);
   811			break;
   812		case Opt_flush_merge:
   813			if (result.negated)
   814				ctx_clear_opt(ctx, F2FS_MOUNT_FLUSH_MERGE);
   815			else
   816				ctx_set_opt(ctx, F2FS_MOUNT_FLUSH_MERGE);
   817			break;
   818		case Opt_barrier:
   819			if (result.negated)
   820				ctx_set_opt(ctx, F2FS_MOUNT_NOBARRIER);
   821			else
   822				ctx_clear_opt(ctx, F2FS_MOUNT_NOBARRIER);
   823			break;
   824		case Opt_fastboot:
   825			ctx_set_opt(ctx, F2FS_MOUNT_FASTBOOT);
   826			break;
   827		case Opt_extent_cache:
   828			if (result.negated)
   829				ctx_clear_opt(ctx, F2FS_MOUNT_READ_EXTENT_CACHE);
   830			else
   831				ctx_set_opt(ctx, F2FS_MOUNT_READ_EXTENT_CACHE);
   832			break;
   833		case Opt_data_flush:
   834			ctx_set_opt(ctx, F2FS_MOUNT_DATA_FLUSH);
   835			break;
   836		case Opt_reserve_root:
   837			ctx_set_opt(ctx, F2FS_MOUNT_RESERVE_ROOT);
   838			F2FS_CTX_INFO(ctx).root_reserved_blocks = result.uint_32;
   839			ctx->spec_mask |= F2FS_SPEC_reserve_root;
   840			break;
   841		case Opt_resuid:
   842			F2FS_CTX_INFO(ctx).s_resuid = result.uid;
   843			ctx->spec_mask |= F2FS_SPEC_resuid;
   844			break;
   845		case Opt_resgid:
   846			F2FS_CTX_INFO(ctx).s_resgid = result.gid;
   847			ctx->spec_mask |= F2FS_SPEC_resgid;
   848			break;
   849		case Opt_mode:
   850			F2FS_CTX_INFO(ctx).fs_mode = result.uint_32;
   851			ctx->spec_mask |= F2FS_SPEC_mode;
   852			break;
   853	#ifdef CONFIG_F2FS_FAULT_INJECTION
   854		case Opt_fault_injection:
   855			if (result.int_32 > INT_MAX)
   856				return -EINVAL;
   857			F2FS_CTX_INFO(ctx).fault_info.inject_rate = result.int_32;
   858			ctx->spec_mask |= F2FS_SPEC_fault_injection;
   859			ctx_set_opt(ctx, F2FS_MOUNT_FAULT_INJECTION);
   860			break;
   861	
   862		case Opt_fault_type:
   863			if (result.uint_32 > BIT(FAULT_MAX))
   864				return -EINVAL;
   865			F2FS_CTX_INFO(ctx).fault_info.inject_type = result.uint_32;
   866			ctx->spec_mask |= F2FS_SPEC_fault_type;
   867			ctx_set_opt(ctx, F2FS_MOUNT_FAULT_INJECTION);
   868			break;
   869	#else
   870		case Opt_fault_injection:
   871		case Opt_fault_type:
   872			f2fs_info(NULL, "%s options not supported", param->key);
   873			break;
   874	#endif
   875		case Opt_lazytime:
   876			if (result.negated)
   877				ctx_clear_opt(ctx, F2FS_MOUNT_LAZYTIME);
   878			else
   879				ctx_set_opt(ctx, F2FS_MOUNT_LAZYTIME);
   880			break;
   881	#ifdef CONFIG_QUOTA
   882		case Opt_quota:
   883			if (result.negated) {
   884				ctx_clear_opt(ctx, F2FS_MOUNT_QUOTA);
   885				ctx_clear_opt(ctx, F2FS_MOUNT_USRQUOTA);
   886				ctx_clear_opt(ctx, F2FS_MOUNT_GRPQUOTA);
   887				ctx_clear_opt(ctx, F2FS_MOUNT_PRJQUOTA);
   888			} else
   889				ctx_set_opt(ctx, F2FS_MOUNT_USRQUOTA);
   890			break;
   891		case Opt_usrquota:
   892			ctx_set_opt(ctx, F2FS_MOUNT_USRQUOTA);
   893			break;
   894		case Opt_grpquota:
   895			ctx_set_opt(ctx, F2FS_MOUNT_GRPQUOTA);
   896			break;
   897		case Opt_prjquota:
   898			ctx_set_opt(ctx, F2FS_MOUNT_PRJQUOTA);
   899			break;
   900		case Opt_usrjquota:
   901			if (!*param->string)
   902				ret = f2fs_unnote_qf_name(fc, USRQUOTA);
   903			else
   904				ret = f2fs_note_qf_name(fc, USRQUOTA, param);
   905			if (ret)
   906				return ret;
   907			break;
   908		case Opt_grpjquota:
   909			if (!*param->string)
   910				ret = f2fs_unnote_qf_name(fc, GRPQUOTA);
   911			else
   912				ret = f2fs_note_qf_name(fc, GRPQUOTA, param);
   913			if (ret)
   914				return ret;
   915			break;
   916		case Opt_prjjquota:
   917			if (!*param->string)
   918				ret = f2fs_unnote_qf_name(fc, PRJQUOTA);
   919			else
   920				ret = f2fs_note_qf_name(fc, PRJQUOTA, param);
   921			if (ret)
   922				return ret;
   923			break;
   924		case Opt_jqfmt:
   925			F2FS_CTX_INFO(ctx).s_jquota_fmt = result.int_32;
   926			ctx->spec_mask |= F2FS_SPEC_jqfmt;
   927			break;
   928	#else
   929		case Opt_quota:
   930		case Opt_usrquota:
   931		case Opt_grpquota:
   932		case Opt_prjquota:
   933		case Opt_usrjquota:
   934		case Opt_grpjquota:
   935		case Opt_prjjquota:
   936			f2fs_info(NULL, "quota operations not supported");
   937			break;
   938	#endif
   939		case Opt_alloc:
   940			F2FS_CTX_INFO(ctx).alloc_mode = result.uint_32;
   941			ctx->spec_mask |= F2FS_SPEC_alloc_mode;
   942			break;
   943		case Opt_fsync:
   944			F2FS_CTX_INFO(ctx).fsync_mode = result.uint_32;
   945			ctx->spec_mask |= F2FS_SPEC_fsync_mode;
   946			break;
   947		case Opt_test_dummy_encryption:
   948			ret = f2fs_parse_test_dummy_encryption(param, ctx);
   949			if (ret)
   950				return ret;
   951			break;
   952		case Opt_inlinecrypt:
   953	#ifdef CONFIG_FS_ENCRYPTION_INLINE_CRYPT
   954			ctx_set_opt(ctx, F2FS_MOUNT_INLINECRYPT);
   955	#else
   956			f2fs_info(NULL, "inline encryption not supported");
   957	#endif
   958			break;
   959		case Opt_checkpoint:
   960			/* revert to match_table for checkpoint= options */
   961			token = match_token(param->string, f2fs_checkpoint_tokens, args);
   962			switch (token) {
   963			case Opt_checkpoint_disable_cap_perc:
   964				if (args->from && match_int(args, &arg))
   965					return -EINVAL;
   966				if (arg < 0 || arg > 100)
   967					return -EINVAL;
   968				F2FS_CTX_INFO(ctx).unusable_cap_perc = arg;
   969				ctx->spec_mask |= F2FS_SPEC_checkpoint_disable_cap_perc;
   970				ctx_set_opt(ctx, F2FS_MOUNT_DISABLE_CHECKPOINT);
   971				break;
   972			case Opt_checkpoint_disable_cap:
   973				if (args->from && match_int(args, &arg))
   974					return -EINVAL;
   975				F2FS_CTX_INFO(ctx).unusable_cap = arg;
   976				ctx->spec_mask |= F2FS_SPEC_checkpoint_disable_cap;
   977				ctx_set_opt(ctx, F2FS_MOUNT_DISABLE_CHECKPOINT);
   978				break;
   979			case Opt_checkpoint_disable:
   980				ctx_set_opt(ctx, F2FS_MOUNT_DISABLE_CHECKPOINT);
   981				break;
   982			case Opt_checkpoint_enable:
   983				ctx_clear_opt(ctx, F2FS_MOUNT_DISABLE_CHECKPOINT);
   984				break;
   985			default:
   986				return -EINVAL;
   987			}
   988			break;
   989		case Opt_checkpoint_merge:
   990			if (result.negated)
   991				ctx_clear_opt(ctx, F2FS_MOUNT_MERGE_CHECKPOINT);
   992			else
   993				ctx_set_opt(ctx, F2FS_MOUNT_MERGE_CHECKPOINT);
   994			break;
   995	#ifdef CONFIG_F2FS_FS_COMPRESSION
   996		case Opt_compress_algorithm:
   997			name = param->string;
   998			if (!strcmp(name, "lzo")) {
   999	#ifdef CONFIG_F2FS_FS_LZO
  1000				F2FS_CTX_INFO(ctx).compress_level = 0;
  1001				F2FS_CTX_INFO(ctx).compress_algorithm = COMPRESS_LZO;
  1002				ctx->spec_mask |= F2FS_SPEC_compress_level;
  1003				ctx->spec_mask |= F2FS_SPEC_compress_algorithm;
  1004	#else
  1005				f2fs_info(NULL, "kernel doesn't support lzo compression");
  1006	#endif
  1007			} else if (!strncmp(name, "lz4", 3)) {
  1008	#ifdef CONFIG_F2FS_FS_LZ4
  1009				ret = f2fs_set_lz4hc_level(ctx, name);
  1010				if (ret)
  1011					return -EINVAL;
  1012				F2FS_CTX_INFO(ctx).compress_algorithm = COMPRESS_LZ4;
  1013				ctx->spec_mask |= F2FS_SPEC_compress_algorithm;
  1014	#else
  1015				f2fs_info(NULL, "kernel doesn't support lz4 compression");
  1016	#endif
  1017			} else if (!strncmp(name, "zstd", 4)) {
  1018	#ifdef CONFIG_F2FS_FS_ZSTD
  1019				ret = f2fs_set_zstd_level(ctx, name);
  1020				if (ret)
  1021					return -EINVAL;
  1022				F2FS_CTX_INFO(ctx).compress_algorithm = COMPRESS_ZSTD;
  1023				ctx->spec_mask |= F2FS_SPEC_compress_algorithm;
  1024	#else
  1025				f2fs_info(NULL, "kernel doesn't support zstd compression");
  1026	#endif
  1027			} else if (!strcmp(name, "lzo-rle")) {
  1028	#ifdef CONFIG_F2FS_FS_LZORLE
  1029				F2FS_CTX_INFO(ctx).compress_level = 0;
  1030				F2FS_CTX_INFO(ctx).compress_algorithm = COMPRESS_LZORLE;
  1031				ctx->spec_mask |= F2FS_SPEC_compress_level;
  1032				ctx->spec_mask |= F2FS_SPEC_compress_algorithm;
  1033	#else
  1034				f2fs_info(NULL, "kernel doesn't support lzorle compression");
  1035	#endif
  1036			} else
  1037				return -EINVAL;
  1038			break;
  1039		case Opt_compress_log_size:
  1040			if (result.uint_32 < MIN_COMPRESS_LOG_SIZE ||
  1041			    result.uint_32 > MAX_COMPRESS_LOG_SIZE) {
  1042				f2fs_err(NULL,
  1043					"Compress cluster log size is out of range");
  1044				return -EINVAL;
  1045			}
  1046			F2FS_CTX_INFO(ctx).compress_log_size = result.uint_32;
  1047			ctx->spec_mask |= F2FS_SPEC_compress_log_size;
  1048			break;
  1049		case Opt_compress_extension:
  1050			name = param->string;
  1051			ext = F2FS_CTX_INFO(ctx).extensions;
  1052			ext_cnt = F2FS_CTX_INFO(ctx).compress_ext_cnt;
  1053	
  1054			if (strlen(name) >= F2FS_EXTENSION_LEN ||
  1055			    ext_cnt >= COMPRESS_EXT_NUM) {
  1056				f2fs_err(NULL, "invalid extension length/number");
  1057				return -EINVAL;
  1058			}
  1059	
  1060			if (is_compress_extension_exist(&ctx->info, name, true))
  1061				break;
  1062	
  1063			ret = strscpy(ext[ext_cnt], name, F2FS_EXTENSION_LEN);
  1064			if (ret < 0)
  1065				return ret;
  1066			F2FS_CTX_INFO(ctx).compress_ext_cnt++;
  1067			ctx->spec_mask |= F2FS_SPEC_compress_extension;
  1068			break;
  1069		case Opt_nocompress_extension:
  1070			name = param->string;
  1071			noext = F2FS_CTX_INFO(ctx).noextensions;
  1072			noext_cnt = F2FS_CTX_INFO(ctx).nocompress_ext_cnt;
  1073	
  1074			if (strlen(name) >= F2FS_EXTENSION_LEN ||
  1075				noext_cnt >= COMPRESS_EXT_NUM) {
  1076				f2fs_err(NULL, "invalid extension length/number");
  1077				return -EINVAL;
  1078			}
  1079	
  1080			if (is_compress_extension_exist(&ctx->info, name, false))
  1081				break;
  1082	
  1083			ret = strscpy(noext[noext_cnt], name, F2FS_EXTENSION_LEN);
  1084			if (ret < 0)
  1085				return ret;
  1086			F2FS_CTX_INFO(ctx).nocompress_ext_cnt++;
  1087			ctx->spec_mask |= F2FS_SPEC_nocompress_extension;
  1088			break;
  1089		case Opt_compress_chksum:
  1090			F2FS_CTX_INFO(ctx).compress_chksum = true;
  1091			ctx->spec_mask |= F2FS_SPEC_compress_chksum;
  1092			break;
  1093		case Opt_compress_mode:
  1094			F2FS_CTX_INFO(ctx).compress_mode = result.uint_32;
  1095			ctx->spec_mask |= F2FS_SPEC_compress_mode;
  1096			break;
  1097		case Opt_compress_cache:
  1098			ctx_set_opt(ctx, F2FS_MOUNT_COMPRESS_CACHE);
  1099			break;
  1100	#else
  1101		case Opt_compress_algorithm:
  1102		case Opt_compress_log_size:
  1103		case Opt_compress_extension:
  1104		case Opt_nocompress_extension:
  1105		case Opt_compress_chksum:
  1106		case Opt_compress_mode:
  1107		case Opt_compress_cache:
  1108			f2fs_info(NULL, "compression options not supported");
  1109			break;
  1110	#endif
  1111		case Opt_atgc:
  1112			ctx_set_opt(ctx, F2FS_MOUNT_ATGC);
  1113			break;
  1114		case Opt_gc_merge:
  1115			if (result.negated)
  1116				ctx_clear_opt(ctx, F2FS_MOUNT_GC_MERGE);
  1117			else
  1118				ctx_set_opt(ctx, F2FS_MOUNT_GC_MERGE);
  1119			break;
  1120		case Opt_discard_unit:
  1121			F2FS_CTX_INFO(ctx).discard_unit = result.uint_32;
  1122			ctx->spec_mask |= F2FS_SPEC_discard_unit;
  1123			break;
  1124		case Opt_memory_mode:
  1125			F2FS_CTX_INFO(ctx).memory_mode = result.uint_32;
  1126			ctx->spec_mask |= F2FS_SPEC_memory_mode;
  1127			break;
  1128		case Opt_age_extent_cache:
  1129			ctx_set_opt(ctx, F2FS_MOUNT_AGE_EXTENT_CACHE);
  1130			break;
  1131		case Opt_errors:
  1132			F2FS_CTX_INFO(ctx).errors = result.uint_32;
  1133			ctx->spec_mask |= F2FS_SPEC_errors;
  1134			break;
  1135		case Opt_nat_bits:
  1136			ctx_set_opt(ctx, F2FS_MOUNT_NAT_BITS);
  1137			break;
  1138		}
  1139		return 0;
  1140	}
  1141	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
