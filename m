Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 2532B9A4E08
	for <lists+linux-f2fs-devel@lfdr.de>; Sat, 19 Oct 2024 15:01:29 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1t294u-0007bm-QB;
	Sat, 19 Oct 2024 13:01:09 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <lkp@intel.com>) id 1t294b-0007b1-8t
 for linux-f2fs-devel@lists.sourceforge.net;
 Sat, 19 Oct 2024 13:00:50 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=ix6wp4h+5YtULsxw61aSeKxyHM9NhIevm4jcdHlEGQY=; b=ZOvW4vxtu4Cva88Wifz8t9Gpgv
 5XxKyfQLR/K8PgVvAUE+Vx4anTfKvjlPaNRBoRDQxWrHGxMR/dYsepGlguK+lL+MGA/xDswOZw4Om
 REbtKhufY+SdE7ZKy4htgXBhReNEhgs98pfGbuRIzpwRt7yB7cvITzblPfeJ93AxbkeA=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=ix6wp4h+5YtULsxw61aSeKxyHM9NhIevm4jcdHlEGQY=; b=UOlZnIhg8EYLHEGu1RcfLfEdT3
 QahVclxwyBGoM7Pte3DAoD53Vplm90H9XtDD3RlKiMiV4mB5/t7kVu5YYq2E/7sJlZr26hzvpe0bE
 Dkh2Iw2odd2AHAtMR9ANCGHPihdCKAjTRHCpo7GCgBocaAVN5Wd4kF9av67hsbZNQItE=;
Received: from mgamail.intel.com ([192.198.163.10])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1t294X-0002jE-OY for linux-f2fs-devel@lists.sourceforge.net;
 Sat, 19 Oct 2024 13:00:49 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1729342846; x=1760878846;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=m7W4fJEtIeyu8tniSEMGnCUSt9Skkxkp3RQMvF94rpA=;
 b=HH4gudqjmyPtzC0zF97OG5BIsSwXkGUXQj8DBT529J3n6JCo7WktcgwT
 qs3o2tf6aQaic9nR6HNGrFFPudqfQfKW0wMhxpW6YYNhAG8VHo8AdbASq
 Mw50FEGFDwRMBCYkJPlH49hneJgQMd8kVLj1u9yrW9tmAij4XbmUJqRk2
 cDLIen5qVm0I7HpDL2xXK702EUifiNMxm6F/wGeTlMtiGbNIrieu0bMqa
 R8uo70dOVcEtaaBDrbtmbFEFS3Ya97E4OhYSalSib9sNvBHPKvbNxpyk9
 6/CPtfTWffZip2wQWBLCzSX4jYri8ydoGI4qQMKdN5EJUquWRz0aOU4Dw g==;
X-CSE-ConnectionGUID: YhffY3zaTkeSWoR3ebcdRw==
X-CSE-MsgGUID: G3sDN3n8STGcEz5hm1KzBQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11230"; a="40232726"
X-IronPort-AV: E=Sophos;i="6.11,216,1725346800"; d="scan'208";a="40232726"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Oct 2024 06:00:35 -0700
X-CSE-ConnectionGUID: nRm6KXBBRZK57aaXZ94/mg==
X-CSE-MsgGUID: uZ4+rfKdTee/kSSABrapEg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,216,1725346800"; d="scan'208";a="116580650"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
 by orviesa001.jf.intel.com with ESMTP; 19 Oct 2024 06:00:33 -0700
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
 (envelope-from <lkp@intel.com>) id 1t294I-000P1B-2R;
 Sat, 19 Oct 2024 13:00:30 +0000
Date: Sat, 19 Oct 2024 20:59:56 +0800
From: kernel test robot <lkp@intel.com>
To: Chao Yu <yuchao0@huawei.com>, Chao Yu <chao@kernel.org>, jaegeuk@kernel.org
Message-ID: <202410192028.vIwx2fbN-lkp@intel.com>
References: <20241018092200.2792472-1-chao@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20241018092200.2792472-1-chao@kernel.org>
X-Spam-Score: -2.5 (--)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  Hi Chao,
 kernel test robot noticed the following build errors:
 [auto build test ERROR on jaegeuk-f2fs/dev-test] [also build test ERROR on
 jaegeuk-f2fs/dev linus/master v6.12-rc3 next-20241018] [If your patch is
 applied to the wrong git tree, kindly drop us a note [...] 
 Content analysis details:   (-2.5 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -2.3 RCVD_IN_DNSWL_MED      RBL: Sender listed at https://www.dnswl.org/,
 medium trust [192.198.163.10 listed in list.dnswl.org]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 0.0 T_SPF_TEMPERROR        SPF: test of record failed (temperror)
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1t294X-0002jE-OY
Subject: Re: [f2fs-dev] [PATCH] f2fs: fix to convert log type to segment
 data type correctly
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
Cc: linux-f2fs-devel@lists.sourceforge.net, Chao Yu <yuchao0@huawei.com>,
 linux-kernel@vger.kernel.org, oe-kbuild-all@lists.linux.dev
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

Hi Chao,

kernel test robot noticed the following build errors:

[auto build test ERROR on jaegeuk-f2fs/dev-test]
[also build test ERROR on jaegeuk-f2fs/dev linus/master v6.12-rc3 next-20241018]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Chao-Yu/f2fs-fix-to-convert-log-type-to-segment-data-type-correctly/20241018-172401
base:   https://git.kernel.org/pub/scm/linux/kernel/git/jaegeuk/f2fs.git dev-test
patch link:    https://lore.kernel.org/r/20241018092200.2792472-1-chao%40kernel.org
patch subject: [PATCH] f2fs: fix to convert log type to segment data type correctly
config: x86_64-rhel-8.3 (https://download.01.org/0day-ci/archive/20241019/202410192028.vIwx2fbN-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241019/202410192028.vIwx2fbN-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202410192028.vIwx2fbN-lkp@intel.com/

All error/warnings (new ones prefixed by >>):

>> fs/f2fs/segment.c:3818:38: warning: 'enum log_type' declared inside parameter list will not be visible outside of this definition or declaration
    3818 | static int log_type_to_seg_type(enum log_type type)
         |                                      ^~~~~~~~
>> fs/f2fs/segment.c:3818:47: error: parameter 1 ('type') has incomplete type
    3818 | static int log_type_to_seg_type(enum log_type type)
         |                                 ~~~~~~~~~~~~~~^~~~
>> fs/f2fs/segment.c:3818:12: error: function declaration isn't a prototype [-Werror=strict-prototypes]
    3818 | static int log_type_to_seg_type(enum log_type type)
         |            ^~~~~~~~~~~~~~~~~~~~
   fs/f2fs/segment.c: In function 'do_write_page':
>> fs/f2fs/segment.c:3843:14: error: variable 'type' has initializer but incomplete type
    3843 |         enum log_type type = __get_segment_type(fio);
         |              ^~~~~~~~
>> fs/f2fs/segment.c:3843:23: error: storage size of 'type' isn't known
    3843 |         enum log_type type = __get_segment_type(fio);
         |                       ^~~~
>> fs/f2fs/segment.c:3843:23: warning: unused variable 'type' [-Wunused-variable]
   cc1: some warnings being treated as errors


vim +3818 fs/f2fs/segment.c

  3817	
> 3818	static int log_type_to_seg_type(enum log_type type)
  3819	{
  3820		int seg_type = CURSEG_COLD_DATA;
  3821	
  3822		switch (type) {
  3823		case CURSEG_HOT_DATA:
  3824		case CURSEG_WARM_DATA:
  3825		case CURSEG_COLD_DATA:
  3826		case CURSEG_HOT_NODE:
  3827		case CURSEG_WARM_NODE:
  3828		case CURSEG_COLD_NODE:
  3829			seg_type = (int)type;
  3830			break;
  3831		case CURSEG_COLD_DATA_PINNED:
  3832		case CURSEG_ALL_DATA_ATGC:
  3833			seg_type = CURSEG_COLD_DATA;
  3834			break;
  3835		default:
  3836			break;
  3837		}
  3838		return seg_type;
  3839	}
  3840	
  3841	static void do_write_page(struct f2fs_summary *sum, struct f2fs_io_info *fio)
  3842	{
> 3843		enum log_type type = __get_segment_type(fio);
  3844		int seg_type = log_type_to_seg_type(type);
  3845		bool keep_order = (f2fs_lfs_mode(fio->sbi) &&
  3846					seg_type == CURSEG_COLD_DATA);
  3847	
  3848		if (keep_order)
  3849			f2fs_down_read(&fio->sbi->io_order_lock);
  3850	
  3851		if (f2fs_allocate_data_block(fio->sbi, fio->page, fio->old_blkaddr,
  3852				&fio->new_blkaddr, sum, type, fio)) {
  3853			if (fscrypt_inode_uses_fs_layer_crypto(fio->page->mapping->host))
  3854				fscrypt_finalize_bounce_page(&fio->encrypted_page);
  3855			end_page_writeback(fio->page);
  3856			if (f2fs_in_warm_node_list(fio->sbi, fio->page))
  3857				f2fs_del_fsync_node_entry(fio->sbi, fio->page);
  3858			goto out;
  3859		}
  3860		if (GET_SEGNO(fio->sbi, fio->old_blkaddr) != NULL_SEGNO)
  3861			f2fs_invalidate_internal_cache(fio->sbi, fio->old_blkaddr);
  3862	
  3863		/* writeout dirty page into bdev */
  3864		f2fs_submit_page_write(fio);
  3865	
  3866		f2fs_update_device_state(fio->sbi, fio->ino, fio->new_blkaddr, 1);
  3867	out:
  3868		if (keep_order)
  3869			f2fs_up_read(&fio->sbi->io_order_lock);
  3870	}
  3871	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
