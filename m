Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 2CFDC6D6D8C
	for <lists+linux-f2fs-devel@lfdr.de>; Tue,  4 Apr 2023 22:04:35 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1pjmtJ-0001Hg-2x;
	Tue, 04 Apr 2023 20:04:29 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <lkp@intel.com>) id 1pjmtE-0001HZ-B5
 for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 04 Apr 2023 20:04:24 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=F58QZRSSq7WdhLdiNBX9TlwLk5zEMJeI5QgMvQGJq08=; b=AfxVKB2Tr1dXu9sRxyJfycSX2H
 /Rjnw4KKy336/s5LWMbSPvgC5awhH3icCzpGKY6/aMLov0V+TtRStjTLa8mpJPgPpyIQjM/J5Fe82
 x9Dtui3kdAlAxB2qBaiTrnFbQDvnly2KXKNW5s5Wn5eZTdAs5SxcY/dRd7Z1YTMzP+JE=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=F58QZRSSq7WdhLdiNBX9TlwLk5zEMJeI5QgMvQGJq08=; b=fKxU7dt9wQ9w55VLHTRLnV4C17
 gwWl5pPOikQ6/st/YV+WzvGONera6P+Bp2ZXv+nUvjAz0p7Hvuh3SeKOVRXFWOegmXu2GhW4xoqDk
 /GXDRrVxYGAe6A9XL8YPAVqdPDwTLwD8j13cJoRNz14m8uQ9wdtFEdzJhEZNF3TD1yVE=;
Received: from mga09.intel.com ([134.134.136.24])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1pjmtB-0000xh-TG for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 04 Apr 2023 20:04:24 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1680638661; x=1712174661;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=18lcDFuhufjfEk41Im2zdZ7+q+Es2J/THwDDLFSkfS8=;
 b=GNUhIgmMDMJl3FocEVVdUja0rTuaiEpz4NloATRpfA+RLxxALwxesr/e
 4QTd9xOk4KWbhORYyQOYEYBtsNUfAPr16N8/c2RIeML1plRceDBcd0BH/
 1BBcmBBLGOPDv41OqrXAermX2AUeioHh6fWCQ30ZwQ7R2qmed8dCK3jw6
 ymXmchL+Gk4vVjBUzEJUUHD+TlDA9q1yBcbMLGEo1sKJx0inz7wUpJ8lO
 MKZASlNce2QcgaOla605SE43On3RhHgpeNCEvb+dkJn5Kk7RE1KbsRsIm
 NGX9DBZTq3oOLJQSphoKl6cEfl+NcDRuN5esqxfaohZ7tCh6IUrQjhC8G Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10670"; a="344004113"
X-IronPort-AV: E=Sophos;i="5.98,318,1673942400"; d="scan'208";a="344004113"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Apr 2023 13:03:46 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10670"; a="830118675"
X-IronPort-AV: E=Sophos;i="5.98,318,1673942400"; d="scan'208";a="830118675"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
 by fmsmga001.fm.intel.com with ESMTP; 04 Apr 2023 13:03:41 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
 (envelope-from <lkp@intel.com>) id 1pjmsW-000Q0Y-1O;
 Tue, 04 Apr 2023 20:03:40 +0000
Date: Wed, 5 Apr 2023 04:03:11 +0800
From: kernel test robot <lkp@intel.com>
To: Andrey Albershteyn <aalbersh@redhat.com>, djwong@kernel.org,
 dchinner@redhat.com, ebiggers@kernel.org, hch@infradead.org,
 linux-xfs@vger.kernel.org, fsverity@lists.linux.dev
Message-ID: <202304050317.r2pJY8DK-lkp@intel.com>
References: <20230404145319.2057051-21-aalbersh@redhat.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230404145319.2057051-21-aalbersh@redhat.com>
X-Spam-Score: -3.2 (---)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  Hi Andrey,
 kernel test robot noticed the following build errors:
 [auto build test ERROR on xfs-linux/for-next] [also build test ERROR on
 kdave/for-next
 jaegeuk-f2fs/dev-test jaegeuk-f2fs/dev linus/master v6.3-rc5] [cannot apply
 to next-20230404] [If your patch is a [...] 
 Content analysis details:   (-3.2 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -2.3 RCVD_IN_DNSWL_MED      RBL: Sender listed at https://www.dnswl.org/,
 medium trust [134.134.136.24 listed in list.dnswl.org]
 0.0 RCVD_IN_MSPIKE_H3      RBL: Good reputation (+3)
 [134.134.136.24 listed in wl.mailspike.net]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
 -0.7 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1pjmtB-0000xh-TG
Subject: Re: [f2fs-dev] [PATCH v2 20/23] xfs: add fs-verity support
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
Cc: agruenba@redhat.com, linux-ext4@vger.kernel.org,
 damien.lemoal@opensource.wdc.com, llvm@lists.linux.dev,
 linux-f2fs-devel@lists.sourceforge.net, cluster-devel@redhat.com,
 oe-kbuild-all@lists.linux.dev, rpeterso@redhat.com, xiang@kernel.org,
 jth@kernel.org, linux-erofs@lists.ozlabs.org,
 Andrey Albershteyn <aalbersh@redhat.com>, linux-btrfs@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

Hi Andrey,

kernel test robot noticed the following build errors:

[auto build test ERROR on xfs-linux/for-next]
[also build test ERROR on kdave/for-next jaegeuk-f2fs/dev-test jaegeuk-f2fs/dev linus/master v6.3-rc5]
[cannot apply to next-20230404]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Andrey-Albershteyn/xfs-Add-new-name-to-attri-d/20230404-230224
base:   https://git.kernel.org/pub/scm/fs/xfs/xfs-linux.git for-next
patch link:    https://lore.kernel.org/r/20230404145319.2057051-21-aalbersh%40redhat.com
patch subject: [PATCH v2 20/23] xfs: add fs-verity support
config: i386-randconfig-r036-20230403 (https://download.01.org/0day-ci/archive/20230405/202304050317.r2pJY8DK-lkp@intel.com/config)
compiler: clang version 14.0.6 (https://github.com/llvm/llvm-project f28c006a5895fc0e329fe15fead81e37457cb1d1)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/intel-lab-lkp/linux/commit/1324353702eaba7da1643d589631adcaedf9a046
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review Andrey-Albershteyn/xfs-Add-new-name-to-attri-d/20230404-230224
        git checkout 1324353702eaba7da1643d589631adcaedf9a046
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=i386 olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=i386 SHELL=/bin/bash fs/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202304050317.r2pJY8DK-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from fs/xfs/xfs_super.c:34:
>> fs/xfs/xfs_ondisk.h:194:2: error: call to __compiletime_assert_3998 declared with 'error' attribute: XFS: value of strlen(XFS_VERITY_DESCRIPTOR_NAME) is wrong, expected XFS_VERITY_DESCRIPTOR_NAME_LEN
           XFS_CHECK_VALUE(strlen(XFS_VERITY_DESCRIPTOR_NAME),
           ^
   fs/xfs/xfs_ondisk.h:19:2: note: expanded from macro 'XFS_CHECK_VALUE'
           BUILD_BUG_ON_MSG((value) != (expected), \
           ^
   include/linux/build_bug.h:39:37: note: expanded from macro 'BUILD_BUG_ON_MSG'
   #define BUILD_BUG_ON_MSG(cond, msg) compiletime_assert(!(cond), msg)
                                       ^
   include/linux/compiler_types.h:397:2: note: expanded from macro 'compiletime_assert'
           _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
           ^
   include/linux/compiler_types.h:385:2: note: expanded from macro '_compiletime_assert'
           __compiletime_assert(condition, msg, prefix, suffix)
           ^
   include/linux/compiler_types.h:378:4: note: expanded from macro '__compiletime_assert'
                           prefix ## suffix();                             \
                           ^
   <scratch space>:77:1: note: expanded from here
   __compiletime_assert_3998
   ^
   1 error generated.


vim +/error +194 fs/xfs/xfs_ondisk.h

     8	
     9	#define XFS_CHECK_STRUCT_SIZE(structname, size) \
    10		BUILD_BUG_ON_MSG(sizeof(structname) != (size), "XFS: sizeof(" \
    11			#structname ") is wrong, expected " #size)
    12	
    13	#define XFS_CHECK_OFFSET(structname, member, off) \
    14		BUILD_BUG_ON_MSG(offsetof(structname, member) != (off), \
    15			"XFS: offsetof(" #structname ", " #member ") is wrong, " \
    16			"expected " #off)
    17	
    18	#define XFS_CHECK_VALUE(value, expected) \
    19		BUILD_BUG_ON_MSG((value) != (expected), \
    20			"XFS: value of " #value " is wrong, expected " #expected)
    21	
    22	static inline void __init
    23	xfs_check_ondisk_structs(void)
    24	{
    25		/* ag/file structures */
    26		XFS_CHECK_STRUCT_SIZE(struct xfs_acl,			4);
    27		XFS_CHECK_STRUCT_SIZE(struct xfs_acl_entry,		12);
    28		XFS_CHECK_STRUCT_SIZE(struct xfs_agf,			224);
    29		XFS_CHECK_STRUCT_SIZE(struct xfs_agfl,			36);
    30		XFS_CHECK_STRUCT_SIZE(struct xfs_agi,			344);
    31		XFS_CHECK_STRUCT_SIZE(struct xfs_bmbt_key,		8);
    32		XFS_CHECK_STRUCT_SIZE(struct xfs_bmbt_rec,		16);
    33		XFS_CHECK_STRUCT_SIZE(struct xfs_bmdr_block,		4);
    34		XFS_CHECK_STRUCT_SIZE(struct xfs_btree_block_shdr,	48);
    35		XFS_CHECK_STRUCT_SIZE(struct xfs_btree_block_lhdr,	64);
    36		XFS_CHECK_STRUCT_SIZE(struct xfs_btree_block,		72);
    37		XFS_CHECK_STRUCT_SIZE(struct xfs_dinode,		176);
    38		XFS_CHECK_STRUCT_SIZE(struct xfs_disk_dquot,		104);
    39		XFS_CHECK_STRUCT_SIZE(struct xfs_dqblk,			136);
    40		XFS_CHECK_STRUCT_SIZE(struct xfs_dsb,			264);
    41		XFS_CHECK_STRUCT_SIZE(struct xfs_dsymlink_hdr,		56);
    42		XFS_CHECK_STRUCT_SIZE(struct xfs_inobt_key,		4);
    43		XFS_CHECK_STRUCT_SIZE(struct xfs_inobt_rec,		16);
    44		XFS_CHECK_STRUCT_SIZE(struct xfs_refcount_key,		4);
    45		XFS_CHECK_STRUCT_SIZE(struct xfs_refcount_rec,		12);
    46		XFS_CHECK_STRUCT_SIZE(struct xfs_rmap_key,		20);
    47		XFS_CHECK_STRUCT_SIZE(struct xfs_rmap_rec,		24);
    48		XFS_CHECK_STRUCT_SIZE(xfs_timestamp_t,			8);
    49		XFS_CHECK_STRUCT_SIZE(struct xfs_legacy_timestamp,	8);
    50		XFS_CHECK_STRUCT_SIZE(xfs_alloc_key_t,			8);
    51		XFS_CHECK_STRUCT_SIZE(xfs_alloc_ptr_t,			4);
    52		XFS_CHECK_STRUCT_SIZE(xfs_alloc_rec_t,			8);
    53		XFS_CHECK_STRUCT_SIZE(xfs_inobt_ptr_t,			4);
    54		XFS_CHECK_STRUCT_SIZE(xfs_refcount_ptr_t,		4);
    55		XFS_CHECK_STRUCT_SIZE(xfs_rmap_ptr_t,			4);
    56	
    57		/* dir/attr trees */
    58		XFS_CHECK_STRUCT_SIZE(struct xfs_attr3_leaf_hdr,	80);
    59		XFS_CHECK_STRUCT_SIZE(struct xfs_attr3_leafblock,	88);
    60		XFS_CHECK_STRUCT_SIZE(struct xfs_attr3_rmt_hdr,		56);
    61		XFS_CHECK_STRUCT_SIZE(struct xfs_da3_blkinfo,		56);
    62		XFS_CHECK_STRUCT_SIZE(struct xfs_da3_intnode,		64);
    63		XFS_CHECK_STRUCT_SIZE(struct xfs_da3_node_hdr,		64);
    64		XFS_CHECK_STRUCT_SIZE(struct xfs_dir3_blk_hdr,		48);
    65		XFS_CHECK_STRUCT_SIZE(struct xfs_dir3_data_hdr,		64);
    66		XFS_CHECK_STRUCT_SIZE(struct xfs_dir3_free,		64);
    67		XFS_CHECK_STRUCT_SIZE(struct xfs_dir3_free_hdr,		64);
    68		XFS_CHECK_STRUCT_SIZE(struct xfs_dir3_leaf,		64);
    69		XFS_CHECK_STRUCT_SIZE(struct xfs_dir3_leaf_hdr,		64);
    70		XFS_CHECK_STRUCT_SIZE(xfs_attr_leaf_entry_t,		8);
    71		XFS_CHECK_STRUCT_SIZE(xfs_attr_leaf_hdr_t,		32);
    72		XFS_CHECK_STRUCT_SIZE(xfs_attr_leaf_map_t,		4);
    73		XFS_CHECK_STRUCT_SIZE(xfs_attr_leaf_name_local_t,	4);
    74	
    75		/*
    76		 * m68k has problems with xfs_attr_leaf_name_remote_t, but we pad it to
    77		 * 4 bytes anyway so it's not obviously a problem.  Hence for the moment
    78		 * we don't check this structure. This can be re-instated when the attr
    79		 * definitions are updated to use c99 VLA definitions.
    80		 *
    81		XFS_CHECK_STRUCT_SIZE(xfs_attr_leaf_name_remote_t,	12);
    82		 */
    83	
    84		XFS_CHECK_OFFSET(xfs_attr_leaf_name_local_t, valuelen,	0);
    85		XFS_CHECK_OFFSET(xfs_attr_leaf_name_local_t, namelen,	2);
    86		XFS_CHECK_OFFSET(xfs_attr_leaf_name_local_t, nameval,	3);
    87		XFS_CHECK_OFFSET(xfs_attr_leaf_name_remote_t, valueblk,	0);
    88		XFS_CHECK_OFFSET(xfs_attr_leaf_name_remote_t, valuelen,	4);
    89		XFS_CHECK_OFFSET(xfs_attr_leaf_name_remote_t, namelen,	8);
    90		XFS_CHECK_OFFSET(xfs_attr_leaf_name_remote_t, name,	9);
    91		XFS_CHECK_STRUCT_SIZE(xfs_attr_leafblock_t,		40);
    92		XFS_CHECK_OFFSET(struct xfs_attr_shortform, hdr.totsize, 0);
    93		XFS_CHECK_OFFSET(struct xfs_attr_shortform, hdr.count,	 2);
    94		XFS_CHECK_OFFSET(struct xfs_attr_shortform, list[0].namelen,	4);
    95		XFS_CHECK_OFFSET(struct xfs_attr_shortform, list[0].valuelen,	5);
    96		XFS_CHECK_OFFSET(struct xfs_attr_shortform, list[0].flags,	6);
    97		XFS_CHECK_OFFSET(struct xfs_attr_shortform, list[0].nameval,	7);
    98		XFS_CHECK_STRUCT_SIZE(xfs_da_blkinfo_t,			12);
    99		XFS_CHECK_STRUCT_SIZE(xfs_da_intnode_t,			16);
   100		XFS_CHECK_STRUCT_SIZE(xfs_da_node_entry_t,		8);
   101		XFS_CHECK_STRUCT_SIZE(xfs_da_node_hdr_t,		16);
   102		XFS_CHECK_STRUCT_SIZE(xfs_dir2_data_free_t,		4);
   103		XFS_CHECK_STRUCT_SIZE(xfs_dir2_data_hdr_t,		16);
   104		XFS_CHECK_OFFSET(xfs_dir2_data_unused_t, freetag,	0);
   105		XFS_CHECK_OFFSET(xfs_dir2_data_unused_t, length,	2);
   106		XFS_CHECK_STRUCT_SIZE(xfs_dir2_free_hdr_t,		16);
   107		XFS_CHECK_STRUCT_SIZE(xfs_dir2_free_t,			16);
   108		XFS_CHECK_STRUCT_SIZE(xfs_dir2_leaf_entry_t,		8);
   109		XFS_CHECK_STRUCT_SIZE(xfs_dir2_leaf_hdr_t,		16);
   110		XFS_CHECK_STRUCT_SIZE(xfs_dir2_leaf_t,			16);
   111		XFS_CHECK_STRUCT_SIZE(xfs_dir2_leaf_tail_t,		4);
   112		XFS_CHECK_STRUCT_SIZE(xfs_dir2_sf_entry_t,		3);
   113		XFS_CHECK_OFFSET(xfs_dir2_sf_entry_t, namelen,		0);
   114		XFS_CHECK_OFFSET(xfs_dir2_sf_entry_t, offset,		1);
   115		XFS_CHECK_OFFSET(xfs_dir2_sf_entry_t, name,		3);
   116		XFS_CHECK_STRUCT_SIZE(xfs_dir2_sf_hdr_t,		10);
   117	
   118		/* log structures */
   119		XFS_CHECK_STRUCT_SIZE(struct xfs_buf_log_format,	88);
   120		XFS_CHECK_STRUCT_SIZE(struct xfs_dq_logformat,		24);
   121		XFS_CHECK_STRUCT_SIZE(struct xfs_efd_log_format_32,	16);
   122		XFS_CHECK_STRUCT_SIZE(struct xfs_efd_log_format_64,	16);
   123		XFS_CHECK_STRUCT_SIZE(struct xfs_efi_log_format_32,	16);
   124		XFS_CHECK_STRUCT_SIZE(struct xfs_efi_log_format_64,	16);
   125		XFS_CHECK_STRUCT_SIZE(struct xfs_extent_32,		12);
   126		XFS_CHECK_STRUCT_SIZE(struct xfs_extent_64,		16);
   127		XFS_CHECK_STRUCT_SIZE(struct xfs_log_dinode,		176);
   128		XFS_CHECK_STRUCT_SIZE(struct xfs_icreate_log,		28);
   129		XFS_CHECK_STRUCT_SIZE(xfs_log_timestamp_t,		8);
   130		XFS_CHECK_STRUCT_SIZE(struct xfs_log_legacy_timestamp,	8);
   131		XFS_CHECK_STRUCT_SIZE(struct xfs_inode_log_format_32,	52);
   132		XFS_CHECK_STRUCT_SIZE(struct xfs_inode_log_format,	56);
   133		XFS_CHECK_STRUCT_SIZE(struct xfs_qoff_logformat,	20);
   134		XFS_CHECK_STRUCT_SIZE(struct xfs_trans_header,		16);
   135		XFS_CHECK_STRUCT_SIZE(struct xfs_attri_log_format,	40);
   136		XFS_CHECK_STRUCT_SIZE(struct xfs_attrd_log_format,	16);
   137		XFS_CHECK_STRUCT_SIZE(struct xfs_bui_log_format,	16);
   138		XFS_CHECK_STRUCT_SIZE(struct xfs_bud_log_format,	16);
   139		XFS_CHECK_STRUCT_SIZE(struct xfs_cui_log_format,	16);
   140		XFS_CHECK_STRUCT_SIZE(struct xfs_cud_log_format,	16);
   141		XFS_CHECK_STRUCT_SIZE(struct xfs_rui_log_format,	16);
   142		XFS_CHECK_STRUCT_SIZE(struct xfs_rud_log_format,	16);
   143		XFS_CHECK_STRUCT_SIZE(struct xfs_map_extent,		32);
   144		XFS_CHECK_STRUCT_SIZE(struct xfs_phys_extent,		16);
   145	
   146		XFS_CHECK_OFFSET(struct xfs_bui_log_format, bui_extents,	16);
   147		XFS_CHECK_OFFSET(struct xfs_cui_log_format, cui_extents,	16);
   148		XFS_CHECK_OFFSET(struct xfs_rui_log_format, rui_extents,	16);
   149		XFS_CHECK_OFFSET(struct xfs_efi_log_format, efi_extents,	16);
   150		XFS_CHECK_OFFSET(struct xfs_efi_log_format_32, efi_extents,	16);
   151		XFS_CHECK_OFFSET(struct xfs_efi_log_format_64, efi_extents,	16);
   152	
   153		/*
   154		 * The v5 superblock format extended several v4 header structures with
   155		 * additional data. While new fields are only accessible on v5
   156		 * superblocks, it's important that the v5 structures place original v4
   157		 * fields/headers in the correct location on-disk. For example, we must
   158		 * be able to find magic values at the same location in certain blocks
   159		 * regardless of superblock version.
   160		 *
   161		 * The following checks ensure that various v5 data structures place the
   162		 * subset of v4 metadata associated with the same type of block at the
   163		 * start of the on-disk block. If there is no data structure definition
   164		 * for certain types of v4 blocks, traverse down to the first field of
   165		 * common metadata (e.g., magic value) and make sure it is at offset
   166		 * zero.
   167		 */
   168		XFS_CHECK_OFFSET(struct xfs_dir3_leaf, hdr.info.hdr,	0);
   169		XFS_CHECK_OFFSET(struct xfs_da3_intnode, hdr.info.hdr,	0);
   170		XFS_CHECK_OFFSET(struct xfs_dir3_data_hdr, hdr.magic,	0);
   171		XFS_CHECK_OFFSET(struct xfs_dir3_free, hdr.hdr.magic,	0);
   172		XFS_CHECK_OFFSET(struct xfs_attr3_leafblock, hdr.info.hdr, 0);
   173	
   174		XFS_CHECK_STRUCT_SIZE(struct xfs_bulkstat,		192);
   175		XFS_CHECK_STRUCT_SIZE(struct xfs_inumbers,		24);
   176		XFS_CHECK_STRUCT_SIZE(struct xfs_bulkstat_req,		64);
   177		XFS_CHECK_STRUCT_SIZE(struct xfs_inumbers_req,		64);
   178	
   179		/*
   180		 * Make sure the incore inode timestamp range corresponds to hand
   181		 * converted values based on the ondisk format specification.
   182		 */
   183		XFS_CHECK_VALUE(XFS_BIGTIME_TIME_MIN - XFS_BIGTIME_EPOCH_OFFSET,
   184				XFS_LEGACY_TIME_MIN);
   185		XFS_CHECK_VALUE(XFS_BIGTIME_TIME_MAX - XFS_BIGTIME_EPOCH_OFFSET,
   186				16299260424LL);
   187	
   188		/* Do the same with the incore quota expiration range. */
   189		XFS_CHECK_VALUE(XFS_DQ_BIGTIME_EXPIRY_MIN << XFS_DQ_BIGTIME_SHIFT, 4);
   190		XFS_CHECK_VALUE(XFS_DQ_BIGTIME_EXPIRY_MAX << XFS_DQ_BIGTIME_SHIFT,
   191				16299260424LL);
   192	
   193		/* fs-verity descriptor xattr name */
 > 194		XFS_CHECK_VALUE(strlen(XFS_VERITY_DESCRIPTOR_NAME),
   195				XFS_VERITY_DESCRIPTOR_NAME_LEN);
   196	}
   197	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
