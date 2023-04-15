Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 338196E326F
	for <lists+linux-f2fs-devel@lfdr.de>; Sat, 15 Apr 2023 18:29:04 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1pnilo-00020i-JV;
	Sat, 15 Apr 2023 16:28:59 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <lkp@intel.com>) id 1pniln-00020b-3e
 for linux-f2fs-devel@lists.sourceforge.net;
 Sat, 15 Apr 2023 16:28:58 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=pXNW+MN0KH9FkXzSOVYbKvttzL3EyvlMug0QLeimEuU=; b=eumkzntpYaRVAsc4kkn5lxGWlY
 DvOAUcjHUBQ8wkycvQApkhXpaRyYjiqEX+66dHMl1FAChyfdXaba834EXz/TpIWppmJFL+6rCGCJS
 23cOGKcwkkC/sS9V2sidgfyv6+4Zm5bzt2ehabR/KLXPge/EX8M9ajryXOizpO0/qFcI=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=pXNW+MN0KH9FkXzSOVYbKvttzL3EyvlMug0QLeimEuU=; b=cXRvN1N7h7jjMawMrp2e2XUzIx
 9iP+OuWgE8sqj1knWYu2UMvYYWZiiT99nAHotPuQ7k8z7W73a/kxJQhn3D3qkQuoXUv1cLKPOz7qj
 WVasDtNTnhb968feezrr9R4+KKT+VeopsPxfPOi4efMJDDCulXe5XiNUPnhXK1zxNLqQ=;
Received: from mga14.intel.com ([192.55.52.115])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1pnilk-008oXm-KS for linux-f2fs-devel@lists.sourceforge.net;
 Sat, 15 Apr 2023 16:28:58 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1681576136; x=1713112136;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=7WDFbotKuhiIiJbcxbHdXMWDMXq/tVrwwzO/KDspDBE=;
 b=Z3QvjMqTZBgmVqAfle2CuIo/i511pEjE+hatap3RRczjLRWw7g6llPRK
 Te2P4Nrqhf/m4Yd0n0UswXh8qntDCHDweRSFji9zSH5kib4U85r4jBoHB
 XdyOH9y28KRrSTsq/bWjNzqP5X8w3kN7qHj5MaFMVGDoGKPVD5roCw08I
 ns0nFFT9cduvtzIpJMfkptKurR++jVASsphkjTqmftoTmOK1a7OWfCykM
 dSOY75j3tNjIj0eGZQd4sM44Dr7IjsOo7BjNjjbpNugZcTv82V4SvSAM1
 rq3hvJ0biDWN1y1Ajqu4qyHiNw+lYOde4/if5aI0KL/gLJEVVjFXwrt4u w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10681"; a="344656229"
X-IronPort-AV: E=Sophos;i="5.99,200,1677571200"; d="scan'208";a="344656229"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Apr 2023 09:28:50 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10681"; a="936370018"
X-IronPort-AV: E=Sophos;i="5.99,200,1677571200"; d="scan'208";a="936370018"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
 by fmsmga006.fm.intel.com with ESMTP; 15 Apr 2023 09:28:48 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
 (envelope-from <lkp@intel.com>) id 1pnilb-000bCt-2B;
 Sat, 15 Apr 2023 16:28:47 +0000
Date: Sun, 16 Apr 2023 00:28:23 +0800
From: kernel test robot <lkp@intel.com>
To: Yangtao Li <frank.li@vivo.com>, Jaegeuk Kim <jaegeuk@kernel.org>,
 Chao Yu <yuchao0@huawei.com>, Chao Yu <chao@kernel.org>
Message-ID: <202304160030.xKck82Nx-lkp@intel.com>
References: <20230415132446.13063-1-frank.li@vivo.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230415132446.13063-1-frank.li@vivo.com>
X-Spam-Score: -3.2 (---)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  Hi Yangtao, kernel test robot noticed the following build
 errors: [auto build test ERROR on jaegeuk-f2fs/dev-test] [also build test
 ERROR on jaegeuk-f2fs/dev] [cannot apply to linus/master v6.3-rc6] [If your
 patch is applied to the wrong git tree, kindly drop us a n [...] 
 Content analysis details:   (-3.2 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -2.3 RCVD_IN_DNSWL_MED      RBL: Sender listed at https://www.dnswl.org/,
 medium trust [192.55.52.115 listed in list.dnswl.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.7 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1pnilk-008oXm-KS
Subject: Re: [f2fs-dev] [PATCH] f2fs: refactor struct f2fs_attr macro
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
Cc: linux-kernel@vger.kernel.org, llvm@lists.linux.dev,
 linux-f2fs-devel@lists.sourceforge.net, Yangtao Li <frank.li@vivo.com>,
 oe-kbuild-all@lists.linux.dev
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

Hi Yangtao,

kernel test robot noticed the following build errors:

[auto build test ERROR on jaegeuk-f2fs/dev-test]
[also build test ERROR on jaegeuk-f2fs/dev]
[cannot apply to linus/master v6.3-rc6]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Yangtao-Li/f2fs-refactor-struct-f2fs_attr-macro/20230415-212520
base:   https://git.kernel.org/pub/scm/linux/kernel/git/jaegeuk/f2fs.git dev-test
patch link:    https://lore.kernel.org/r/20230415132446.13063-1-frank.li%40vivo.com
patch subject: [PATCH] f2fs: refactor struct f2fs_attr macro
config: arm-randconfig-r046-20230410 (https://download.01.org/0day-ci/archive/20230416/202304160030.xKck82Nx-lkp@intel.com/config)
compiler: clang version 17.0.0 (https://github.com/llvm/llvm-project 9638da200e00bd069e6dd63604e14cbafede9324)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install arm cross compiling tool for clang build
        # apt-get install binutils-arm-linux-gnueabi
        # https://github.com/intel-lab-lkp/linux/commit/280d6a5b38dd6b5a5303f5426e9f71466a13f047
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review Yangtao-Li/f2fs-refactor-struct-f2fs_attr-macro/20230415-212520
        git checkout 280d6a5b38dd6b5a5303f5426e9f71466a13f047
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=arm olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=arm SHELL=/bin/bash fs/f2fs/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202304160030.xKck82Nx-lkp@intel.com/

All errors (new ones prefixed by >>):

>> fs/f2fs/sysfs.c:981:1: error: type specifier missing, defaults to 'int'; ISO C99 and later do not support implicit int [-Wimplicit-int]
   FAULT_INFO_TYPE_GENERAL_RW_ATTR(inject_type);
   ^
   int
>> fs/f2fs/sysfs.c:981:33: error: a parameter list without types is only allowed in a function definition
   FAULT_INFO_TYPE_GENERAL_RW_ATTR(inject_type);
                                   ^
>> fs/f2fs/sysfs.c:1094:2: error: use of undeclared identifier 'f2fs_attr_inject_type'; did you mean 'f2fs_attr_inject_rate'?
           ATTR_LIST(inject_type),
           ^
   fs/f2fs/sysfs.c:1045:27: note: expanded from macro 'ATTR_LIST'
   #define ATTR_LIST(name) (&f2fs_attr_##name.attr)
                             ^
   <scratch space>:20:1: note: expanded from here
   f2fs_attr_inject_type
   ^
   fs/f2fs/sysfs.c:980:1: note: 'f2fs_attr_inject_rate' declared here
   FAULT_INFO_RATE_GENERAL_RW_ATTR(inject_rate);
   ^
   fs/f2fs/sysfs.c:879:2: note: expanded from macro 'FAULT_INFO_RATE_GENERAL_RW_ATTR'
           F2FS_RW_ATTR(FAULT_INFO_RATE, f2fs_fault_info, elname, elname)  \
           ^
   fs/f2fs/sysfs.c:838:2: note: expanded from macro 'F2FS_RW_ATTR'
           F2FS_ATTR_OFFSET(struct_type, name, 0644,               \
           ^
   fs/f2fs/sysfs.c:824:25: note: expanded from macro 'F2FS_ATTR_OFFSET'
   static struct f2fs_attr f2fs_attr_##_name = {                   \
                           ^
   <scratch space>:48:1: note: expanded from here
   f2fs_attr_inject_rate
   ^
   3 errors generated.


vim +/int +981 fs/f2fs/sysfs.c

   977	
   978	/* FAULT_INFO ATTR */
   979	#ifdef CONFIG_F2FS_FAULT_INJECTION
   980	FAULT_INFO_RATE_GENERAL_RW_ATTR(inject_rate);
 > 981	FAULT_INFO_TYPE_GENERAL_RW_ATTR(inject_type);
   982	#endif
   983	
   984	/* RESERVED_BLOCKS ATTR */
   985	RESERVED_BLOCKS_GENERAL_RW_ATTR(reserved_blocks);
   986	
   987	/* CPRC_INFO ATTR */
   988	CPRC_INFO_GENERAL_RW_ATTR(ckpt_thread_ioprio);
   989	
   990	/* ATGC_INFO ATTR */
   991	ATGC_INFO_RW_ATTR(atgc_candidate_ratio, candidate_ratio);
   992	ATGC_INFO_RW_ATTR(atgc_candidate_count, max_candidate_count);
   993	ATGC_INFO_RW_ATTR(atgc_age_weight, age_weight);
   994	ATGC_INFO_RW_ATTR(atgc_age_threshold, age_threshold);
   995	
   996	F2FS_GENERAL_RO_ATTR(dirty_segments);
   997	F2FS_GENERAL_RO_ATTR(free_segments);
   998	F2FS_GENERAL_RO_ATTR(ovp_segments);
   999	F2FS_GENERAL_RO_ATTR(lifetime_write_kbytes);
  1000	F2FS_GENERAL_RO_ATTR(features);
  1001	F2FS_GENERAL_RO_ATTR(current_reserved_blocks);
  1002	F2FS_GENERAL_RO_ATTR(unusable);
  1003	F2FS_GENERAL_RO_ATTR(encoding);
  1004	F2FS_GENERAL_RO_ATTR(mounted_time_sec);
  1005	F2FS_GENERAL_RO_ATTR(main_blkaddr);
  1006	F2FS_GENERAL_RO_ATTR(pending_discard);
  1007	F2FS_GENERAL_RO_ATTR(gc_mode);
  1008	#ifdef CONFIG_F2FS_STAT_FS
  1009	F2FS_GENERAL_RO_ATTR(moved_blocks_background);
  1010	F2FS_GENERAL_RO_ATTR(moved_blocks_foreground);
  1011	F2FS_GENERAL_RO_ATTR(avg_vblocks);
  1012	#endif
  1013	
  1014	#ifdef CONFIG_FS_ENCRYPTION
  1015	F2FS_FEATURE_RO_ATTR(encryption);
  1016	F2FS_FEATURE_RO_ATTR(test_dummy_encryption_v2);
  1017	#if IS_ENABLED(CONFIG_UNICODE)
  1018	F2FS_FEATURE_RO_ATTR(encrypted_casefold);
  1019	#endif
  1020	#endif /* CONFIG_FS_ENCRYPTION */
  1021	#ifdef CONFIG_BLK_DEV_ZONED
  1022	F2FS_FEATURE_RO_ATTR(block_zoned);
  1023	#endif
  1024	F2FS_FEATURE_RO_ATTR(atomic_write);
  1025	F2FS_FEATURE_RO_ATTR(extra_attr);
  1026	F2FS_FEATURE_RO_ATTR(project_quota);
  1027	F2FS_FEATURE_RO_ATTR(inode_checksum);
  1028	F2FS_FEATURE_RO_ATTR(flexible_inline_xattr);
  1029	F2FS_FEATURE_RO_ATTR(quota_ino);
  1030	F2FS_FEATURE_RO_ATTR(inode_crtime);
  1031	F2FS_FEATURE_RO_ATTR(lost_found);
  1032	#ifdef CONFIG_FS_VERITY
  1033	F2FS_FEATURE_RO_ATTR(verity);
  1034	#endif
  1035	F2FS_FEATURE_RO_ATTR(sb_checksum);
  1036	#if IS_ENABLED(CONFIG_UNICODE)
  1037	F2FS_FEATURE_RO_ATTR(casefold);
  1038	#endif
  1039	F2FS_FEATURE_RO_ATTR(readonly);
  1040	#ifdef CONFIG_F2FS_FS_COMPRESSION
  1041	F2FS_FEATURE_RO_ATTR(compression);
  1042	#endif
  1043	F2FS_FEATURE_RO_ATTR(pin_file);
  1044	
  1045	#define ATTR_LIST(name) (&f2fs_attr_##name.attr)
  1046	static struct attribute *f2fs_attrs[] = {
  1047		ATTR_LIST(gc_urgent_sleep_time),
  1048		ATTR_LIST(gc_min_sleep_time),
  1049		ATTR_LIST(gc_max_sleep_time),
  1050		ATTR_LIST(gc_no_gc_sleep_time),
  1051		ATTR_LIST(gc_idle),
  1052		ATTR_LIST(gc_urgent),
  1053		ATTR_LIST(reclaim_segments),
  1054		ATTR_LIST(main_blkaddr),
  1055		ATTR_LIST(max_small_discards),
  1056		ATTR_LIST(max_discard_request),
  1057		ATTR_LIST(min_discard_issue_time),
  1058		ATTR_LIST(mid_discard_issue_time),
  1059		ATTR_LIST(max_discard_issue_time),
  1060		ATTR_LIST(discard_io_aware_gran),
  1061		ATTR_LIST(discard_urgent_util),
  1062		ATTR_LIST(discard_granularity),
  1063		ATTR_LIST(max_ordered_discard),
  1064		ATTR_LIST(pending_discard),
  1065		ATTR_LIST(gc_mode),
  1066		ATTR_LIST(ipu_policy),
  1067		ATTR_LIST(min_ipu_util),
  1068		ATTR_LIST(min_fsync_blocks),
  1069		ATTR_LIST(min_seq_blocks),
  1070		ATTR_LIST(min_hot_blocks),
  1071		ATTR_LIST(min_ssr_sections),
  1072		ATTR_LIST(max_victim_search),
  1073		ATTR_LIST(migration_granularity),
  1074		ATTR_LIST(dir_level),
  1075		ATTR_LIST(ram_thresh),
  1076		ATTR_LIST(ra_nid_pages),
  1077		ATTR_LIST(dirty_nats_ratio),
  1078		ATTR_LIST(max_roll_forward_node_blocks),
  1079		ATTR_LIST(cp_interval),
  1080		ATTR_LIST(idle_interval),
  1081		ATTR_LIST(discard_idle_interval),
  1082		ATTR_LIST(gc_idle_interval),
  1083		ATTR_LIST(umount_discard_timeout),
  1084	#ifdef CONFIG_F2FS_IOSTAT
  1085		ATTR_LIST(iostat_enable),
  1086		ATTR_LIST(iostat_period_ms),
  1087	#endif
  1088		ATTR_LIST(readdir_ra),
  1089		ATTR_LIST(max_io_bytes),
  1090		ATTR_LIST(gc_pin_file_thresh),
  1091		ATTR_LIST(extension_list),
  1092	#ifdef CONFIG_F2FS_FAULT_INJECTION
  1093		ATTR_LIST(inject_rate),
> 1094		ATTR_LIST(inject_type),
  1095	#endif
  1096		ATTR_LIST(data_io_flag),
  1097		ATTR_LIST(node_io_flag),
  1098		ATTR_LIST(gc_remaining_trials),
  1099		ATTR_LIST(ckpt_thread_ioprio),
  1100		ATTR_LIST(dirty_segments),
  1101		ATTR_LIST(free_segments),
  1102		ATTR_LIST(ovp_segments),
  1103		ATTR_LIST(unusable),
  1104		ATTR_LIST(lifetime_write_kbytes),
  1105		ATTR_LIST(features),
  1106		ATTR_LIST(reserved_blocks),
  1107		ATTR_LIST(current_reserved_blocks),
  1108		ATTR_LIST(encoding),
  1109		ATTR_LIST(mounted_time_sec),
  1110	#ifdef CONFIG_F2FS_STAT_FS
  1111		ATTR_LIST(cp_foreground_calls),
  1112		ATTR_LIST(cp_background_calls),
  1113		ATTR_LIST(gc_foreground_calls),
  1114		ATTR_LIST(gc_background_calls),
  1115		ATTR_LIST(moved_blocks_foreground),
  1116		ATTR_LIST(moved_blocks_background),
  1117		ATTR_LIST(avg_vblocks),
  1118	#endif
  1119	#ifdef CONFIG_BLK_DEV_ZONED
  1120		ATTR_LIST(unusable_blocks_per_sec),
  1121	#endif
  1122	#ifdef CONFIG_F2FS_FS_COMPRESSION
  1123		ATTR_LIST(compr_written_block),
  1124		ATTR_LIST(compr_saved_block),
  1125		ATTR_LIST(compr_new_inode),
  1126		ATTR_LIST(compress_percent),
  1127		ATTR_LIST(compress_watermark),
  1128	#endif
  1129		/* For ATGC */
  1130		ATTR_LIST(atgc_candidate_ratio),
  1131		ATTR_LIST(atgc_candidate_count),
  1132		ATTR_LIST(atgc_age_weight),
  1133		ATTR_LIST(atgc_age_threshold),
  1134		ATTR_LIST(seq_file_ra_mul),
  1135		ATTR_LIST(gc_segment_mode),
  1136		ATTR_LIST(gc_reclaimed_segments),
  1137		ATTR_LIST(max_fragment_chunk),
  1138		ATTR_LIST(max_fragment_hole),
  1139		ATTR_LIST(current_atomic_write),
  1140		ATTR_LIST(peak_atomic_write),
  1141		ATTR_LIST(committed_atomic_block),
  1142		ATTR_LIST(revoked_atomic_block),
  1143		ATTR_LIST(hot_data_age_threshold),
  1144		ATTR_LIST(warm_data_age_threshold),
  1145		ATTR_LIST(last_age_weight),
  1146		NULL,
  1147	};
  1148	ATTRIBUTE_GROUPS(f2fs);
  1149	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
