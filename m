Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B6759F9348
	for <lists+linux-f2fs-devel@lfdr.de>; Fri, 20 Dec 2024 14:31:46 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1tOd6W-0007qQ-E4;
	Fri, 20 Dec 2024 13:31:44 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <lkp@intel.com>) id 1tOd6N-0007pu-JC
 for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 20 Dec 2024 13:31:35 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:MIME-Version:Message-ID:Subject:Cc:To:
 From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=AxO5YUGMEwDPx1fgwQ10tAH+mmi22Zui5Qs/9xQFp/w=; b=REueO8aW6zGk5HpMbzNTIKOmU/
 luKn8TjFW7A67fuPdiVEUxpV3Od1fdaFUE32bWAajrWLf/mh/DMga0sQ7yM3JYLWFaAg0zEzCC1RU
 /IC/MeoQxXtBOM5YfgzRsi/9MsjmhSH9Wud12/En4pOxtpgSdCTe8aExPu2SMIhu2a7g=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:MIME-Version:Message-ID:Subject:Cc:To:From:Date:Sender:
 Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
 :Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=AxO5YUGMEwDPx1fgwQ10tAH+mmi22Zui5Qs/9xQFp/w=; b=F
 ErMKPJDfJYKL1fmAYbjFgaZSkDiWFO+RqGbIso7P58tqbiJFFl1lNUU8+dt4zPgYY7WHsoWaD8N64
 anmMUx0WK6sbBS5w7ZMymF0MSqVVZKjphymrODEToUNKK4LXU10fV65V8azSjHVR6sOoXX97vhGJp
 BXZbGcWWm1EzSrpY=;
Received: from mgamail.intel.com ([198.175.65.11])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1tOd6J-0006W9-OA for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 20 Dec 2024 13:31:35 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1734701492; x=1766237492;
 h=date:from:to:cc:subject:message-id:mime-version;
 bh=kbm4obwbEUfjLX/YvlcqG7pXwN7DQoJTuwlgZn7OiAI=;
 b=XTpfRnPr+pPR3l0o7ZglYvzVPbyA2Jw9GijGxu+xhnig8+bCJXWs8xZP
 MSr1tJbZoTacbimBtatbHJP6d1MJ4T97PHX0l65y4ixI68jc4NIi+zSQh
 eaRNSQQIYIBE/5pPfPHWgpXMQo2uDgOLVq/WlahA2zPVMRHSXmpSPROJL
 ZtYurAp82IW4Apf2ehVWQDx44RPKXFDquaxjcGYSfKnVa/TLnyM0wAa2Y
 xFLTebVG5ZqLLmY6Fo1qeASAC7wxj0uESxmO17aBaIXHYpNhxEOWRrVGg
 R8it+ZIvMLdtdyjJ1kLN8fSiysdYqcyz7PUbJfkz7EuNgqpY2cdUQHVOv Q==;
X-CSE-ConnectionGUID: 2Sut0CcgR56vXJJEAV63cA==
X-CSE-MsgGUID: 1l39nIOZRtCQYOYpaKwHJg==
X-IronPort-AV: E=McAfee;i="6700,10204,11292"; a="45740733"
X-IronPort-AV: E=Sophos;i="6.12,250,1728975600"; d="scan'208";a="45740733"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Dec 2024 05:31:27 -0800
X-CSE-ConnectionGUID: sPiU42OGR9qtxom0zCRASw==
X-CSE-MsgGUID: B5MiCPtuR9aSaMzt8hmrNw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="103502793"
Received: from lkp-server01.sh.intel.com (HELO a46f226878e0) ([10.239.97.150])
 by orviesa005.jf.intel.com with ESMTP; 20 Dec 2024 05:31:24 -0800
Received: from kbuild by a46f226878e0 with local (Exim 4.96)
 (envelope-from <lkp@intel.com>) id 1tOd6A-0001BR-1k;
 Fri, 20 Dec 2024 13:31:22 +0000
Date: Fri, 20 Dec 2024 21:31:20 +0800
From: kernel test robot <lkp@intel.com>
To: Daniel Lee <chullee@google.com>
Message-ID: <202412202124.DeiZjaVi-lkp@intel.com>
MIME-Version: 1.0
Content-Disposition: inline
X-Spam-Score: -2.5 (--)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
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
 0.0 RCVD_IN_VALIDITY_RPBL_BLOCKED RBL: ADMINISTRATOR NOTICE: The
 query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [198.175.65.11 listed in bl.score.senderscore.com]
 0.0 RCVD_IN_VALIDITY_SAFE_BLOCKED RBL: ADMINISTRATOR NOTICE: The
 query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [198.175.65.11 listed in sa-trusted.bondedsender.org]
 -2.3 RCVD_IN_DNSWL_MED      RBL: Sender listed at https://www.dnswl.org/,
 medium trust [198.175.65.11 listed in list.dnswl.org]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 0.0 T_SPF_TEMPERROR        SPF: test of record failed (temperror)
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1tOd6J-0006W9-OA
Subject: [f2fs-dev] [jaegeuk-f2fs:dev-test 15/15] fs/f2fs/dir.c:339:1:
 warning: label 'start_find_entry' defined but not used
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
Cc: Jaegeuk Kim <jaegeuk@kernel.org>, linux-f2fs-devel@lists.sourceforge.net,
 oe-kbuild-all@lists.linux.dev
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/jaegeuk/f2fs.git dev-test
head:   3f1a145b84bcf0fae986212590bfeeaf165d22d6
commit: 3f1a145b84bcf0fae986212590bfeeaf165d22d6 [15/15] f2fs: Introduce linear search for dentries
config: arc-randconfig-001-20241220 (https://download.01.org/0day-ci/archive/20241220/202412202124.DeiZjaVi-lkp@intel.com/config)
compiler: arc-elf-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241220/202412202124.DeiZjaVi-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202412202124.DeiZjaVi-lkp@intel.com/

All warnings (new ones prefixed by >>):

   fs/f2fs/dir.c: In function '__f2fs_find_entry':
>> fs/f2fs/dir.c:339:1: warning: label 'start_find_entry' defined but not used [-Wunused-label]
     339 | start_find_entry:
         | ^~~~~~~~~~~~~~~~


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
