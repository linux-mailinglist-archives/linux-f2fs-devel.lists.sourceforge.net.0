Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id BB3259F92D1
	for <lists+linux-f2fs-devel@lfdr.de>; Fri, 20 Dec 2024 14:10:59 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1tOcmJ-0000f1-0N;
	Fri, 20 Dec 2024 13:10:51 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <lkp@intel.com>) id 1tOcmC-0000eo-54
 for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 20 Dec 2024 13:10:44 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:MIME-Version:Message-ID:Subject:Cc:To:
 From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=OgGGankFzfPb6llmy72DHIwXY8Q+NWajc7gjxvx2crU=; b=EpZXIL1n9ZA8vJSFo2Qi9Mf9yL
 +89YDV6ep1LDena9+dQZ+rrPNrdRF+E6tkcV8wmxuCAEFTBAcXYyVLP2uQw8MHxM8gfF22g+9G8hv
 XouuKVcGEksxnYuE/D1Q11eLc1AOXacPcn70rF6zjTicaVFk+FfX4hnjHncZSD7FE/q8=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:MIME-Version:Message-ID:Subject:Cc:To:From:Date:Sender:
 Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
 :Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=OgGGankFzfPb6llmy72DHIwXY8Q+NWajc7gjxvx2crU=; b=C
 PUGpKla1WNRTPtpmUeJo0yYNGfZnIoemuqCBlbaj/8+Udu6UyjdXlEa45USUXMk7ZgbMYgjykjk4L
 Pc7KzmwjMs0galQITUqgi5XmuebqfI0xUIMhxSiV8YYgiTYWUMs5XZJo5nDlVLjhgXx/brSooC4wI
 roflc8H6yPIYHK7A=;
Received: from mgamail.intel.com ([198.175.65.18])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1tOcm7-0004Zy-JG for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 20 Dec 2024 13:10:44 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1734700240; x=1766236240;
 h=date:from:to:cc:subject:message-id:mime-version;
 bh=9tfqMRRr/14ylRJVnXmikiBT0Y1tNBBBRg53lA/Cil8=;
 b=kwj/M4mABUUnTrpmuRMNyB0qhiBcWs4i9pD1bOscXU9Lhjc7o0sTfVkH
 C2IALFYkvoMcgSs6tJDGubX1sPmH23erSzCL7mQzrveCHZIdE/39yP05A
 Lg5E7/6jbcK72bNSVBMmtmqJR+Z2yFEn29nNb4jqpnv0iMSTeJwEylqlM
 Iz3K3d5bD16ZBQ+osqXxGJ0Ny3YXgCoqyxk4gLFb2+0JbgEyvQxovWxll
 qs9ibd5fHtKla6S2G8TlL+UR2pZ8pdfwXTP+4/ZLBGXVTd/qY1eyirTcW
 6oZgqfn0j6kEuI9xldut+1emT/xPJ+Mn05/Ft3KXl8GqFvcd3Pyt70TI7 w==;
X-CSE-ConnectionGUID: FAkYbAbZQC+J8uCAKvyCJg==
X-CSE-MsgGUID: DVP5Q6ReQo2mWVDzBwVdow==
X-IronPort-AV: E=McAfee;i="6700,10204,11292"; a="35369751"
X-IronPort-AV: E=Sophos;i="6.12,250,1728975600"; d="scan'208";a="35369751"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Dec 2024 05:10:25 -0800
X-CSE-ConnectionGUID: y9kGpgOPQxmRNQedtW43YA==
X-CSE-MsgGUID: FHrmnFK/QWGpPAhyOVdzTg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,250,1728975600"; d="scan'208";a="98292457"
Received: from lkp-server01.sh.intel.com (HELO a46f226878e0) ([10.239.97.150])
 by fmviesa006.fm.intel.com with ESMTP; 20 Dec 2024 05:10:23 -0800
Received: from kbuild by a46f226878e0 with local (Exim 4.96)
 (envelope-from <lkp@intel.com>) id 1tOclo-0001AJ-2o;
 Fri, 20 Dec 2024 13:10:20 +0000
Date: Fri, 20 Dec 2024 21:09:37 +0800
From: kernel test robot <lkp@intel.com>
To: Daniel Lee <chullee@google.com>
Message-ID: <202412202144.aEypgoBo-lkp@intel.com>
MIME-Version: 1.0
Content-Disposition: inline
X-Spam-Score: -2.5 (--)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: tree:
 https://git.kernel.org/pub/scm/linux/kernel/git/jaegeuk/f2fs.git
 dev-test head: 3f1a145b84bcf0fae986212590bfeeaf165d22d6 commit:
 3f1a145b84bcf0fae986212590bfeeaf165d22d6
 [15/15] f2fs: Introduce [...] 
 Content analysis details:   (-2.5 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 RCVD_IN_VALIDITY_CERTIFIED_BLOCKED RBL: ADMINISTRATOR NOTICE:
 The query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [198.175.65.18 listed in sa-accredit.habeas.com]
 -2.3 RCVD_IN_DNSWL_MED      RBL: Sender listed at https://www.dnswl.org/,
 medium trust [198.175.65.18 listed in list.dnswl.org]
 0.0 RCVD_IN_VALIDITY_RPBL_BLOCKED RBL: ADMINISTRATOR NOTICE: The
 query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [198.175.65.18 listed in bl.score.senderscore.com]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 0.0 T_SPF_TEMPERROR        SPF: test of record failed (temperror)
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1tOcm7-0004Zy-JG
Subject: [f2fs-dev] [jaegeuk-f2fs:dev-test 15/15] fs/f2fs/dir.c:339:1:
 warning: unused label 'start_find_entry'
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
 linux-f2fs-devel@lists.sourceforge.net, oe-kbuild-all@lists.linux.dev
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/jaegeuk/f2fs.git dev-test
head:   3f1a145b84bcf0fae986212590bfeeaf165d22d6
commit: 3f1a145b84bcf0fae986212590bfeeaf165d22d6 [15/15] f2fs: Introduce linear search for dentries
config: riscv-randconfig-002-20241220 (https://download.01.org/0day-ci/archive/20241220/202412202144.aEypgoBo-lkp@intel.com/config)
compiler: clang version 19.1.3 (https://github.com/llvm/llvm-project ab51eccf88f5321e7c60591c5546b254b6afab99)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241220/202412202144.aEypgoBo-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202412202144.aEypgoBo-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from fs/f2fs/dir.c:10:
   In file included from include/linux/f2fs_fs.h:11:
   In file included from include/linux/pagemap.h:8:
   In file included from include/linux/mm.h:2223:
   include/linux/vmstat.h:504:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     504 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     505 |                            item];
         |                            ~~~~
   include/linux/vmstat.h:511:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     511 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     512 |                            NR_VM_NUMA_EVENT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~~
   include/linux/vmstat.h:518:36: warning: arithmetic between different enumeration types ('enum node_stat_item' and 'enum lru_list') [-Wenum-enum-conversion]
     518 |         return node_stat_name(NR_LRU_BASE + lru) + 3; // skip "nr_"
         |                               ~~~~~~~~~~~ ^ ~~~
   include/linux/vmstat.h:524:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     524 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     525 |                            NR_VM_NUMA_EVENT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~~
>> fs/f2fs/dir.c:339:1: warning: unused label 'start_find_entry' [-Wunused-label]
     339 | start_find_entry:
         | ^~~~~~~~~~~~~~~~~
   5 warnings generated.


vim +/start_find_entry +339 fs/f2fs/dir.c

   326	
   327	struct f2fs_dir_entry *__f2fs_find_entry(struct inode *dir,
   328						 const struct f2fs_filename *fname,
   329						 struct page **res_page)
   330	{
   331		unsigned long npages = dir_blocks(dir);
   332		struct f2fs_dir_entry *de = NULL;
   333		unsigned int max_depth;
   334		unsigned int level;
   335		bool use_hash = true;
   336	
   337		*res_page = NULL;
   338	
 > 339	start_find_entry:
   340		if (f2fs_has_inline_dentry(dir)) {
   341			de = f2fs_find_in_inline_dir(dir, fname, res_page, use_hash);
   342			goto out;
   343		}
   344	
   345		if (npages == 0)
   346			goto out;
   347	
   348		max_depth = F2FS_I(dir)->i_current_depth;
   349		if (unlikely(max_depth > MAX_DIR_HASH_DEPTH)) {
   350			f2fs_warn(F2FS_I_SB(dir), "Corrupted max_depth of %lu: %u",
   351				  dir->i_ino, max_depth);
   352			max_depth = MAX_DIR_HASH_DEPTH;
   353			f2fs_i_depth_write(dir, max_depth);
   354		}
   355	
   356		for (level = 0; level < max_depth; level++) {
   357			de = find_in_level(dir, level, fname, res_page, use_hash);
   358			if (de || IS_ERR(*res_page))
   359				break;
   360		}
   361	
   362	out:
   363	#if IS_ENABLED(CONFIG_UNICODE)
   364		if (IS_CASEFOLDED(dir) && !de && use_hash) {
   365			use_hash = false;
   366			goto start_find_entry;
   367		}
   368	#endif
   369		/* This is to increase the speed of f2fs_create */
   370		if (!de)
   371			F2FS_I(dir)->task = current;
   372		return de;
   373	}
   374	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
