Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 2EB42A7A7E9
	for <lists+linux-f2fs-devel@lfdr.de>; Thu,  3 Apr 2025 18:25:31 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1u0NNX-0004ui-SA;
	Thu, 03 Apr 2025 16:25:19 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <lkp@intel.com>) id 1u0NNJ-0004uS-HZ
 for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 03 Apr 2025 16:25:05 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=MGSWoUMkZ5Z74DGJfdIrgI1hDmCAB/FzZQ8xftzqW1Y=; b=izfA0VcNYEX0FUqPhpTQXCHxJG
 cViUvCkA9qwkpGHA5I8Fz8ffJnVChltWRYGYQcoQHUvU9XB2VoHlEnj16lP+N2c9rqWnxs/iE4Ksr
 1ByizF6QEMVBe/BWvSk016nLff2nL2OfFOyjIW08KLQB0QDpTFAuoX8aJPIPbW6iOvWU=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=MGSWoUMkZ5Z74DGJfdIrgI1hDmCAB/FzZQ8xftzqW1Y=; b=dxglO8SIByfYWXhlO+fSlevQz4
 SVsr0tT8hvhJfIg9Pb42ZknWj+N5os1bOS0R+pqwS8jYZ0HWwS5+AQcWz81RyG5ER31wqC+b8ZTb0
 1NOaf+hZbLgwRIYdKOa6NSIH7KULl8XQ3dy5z7ouL9ZooK2s3ei/8Jbhto+7AdTX0jJI=;
Received: from mgamail.intel.com ([198.175.65.15])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1u0NMz-0002SB-NZ for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 03 Apr 2025 16:25:05 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1743697485; x=1775233485;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=ZxbRwQpKz0uC4rWFiP68dkqAQz2gSJboA0Xfn/m9gpQ=;
 b=GjES+IkIdj7Ih356gwQNfP7ATMbDhV5K1nx1gTkcEQ1jDOdtj23/tTLg
 YoIQlyBfdzKM+WNfntyrLEZx3VgmVj6jYJ8Mhwhd69gFOzK1ewelRZnpv
 E5/ctRkul2FLSZXHWqARkdRWWC3TiAanepQQVlBnsApoCcmZ/Ij6I7DKx
 gj2g+9TgjEI7BXgeYy9aNxnCSd397yjxZgcbGRhTD8eI4N/o+RehlGESU
 5sPA1+NqhKU982IhAnnkl3t9t0GTO8tI3K5Y3WnWmCO5Of02foqy1Wa2S
 EsyDhi/txn63xjK7qdWgPv1f+66IO2p1n6XBKmO35GuK+NxoR+/U894sx Q==;
X-CSE-ConnectionGUID: jN/GdgsPTUKaGNOdtrOC9A==
X-CSE-MsgGUID: ZMNkWjgyQ5SS//0YC11bUQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11393"; a="48775519"
X-IronPort-AV: E=Sophos;i="6.15,184,1739865600"; d="scan'208";a="48775519"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Apr 2025 09:24:35 -0700
X-CSE-ConnectionGUID: xxB70RBJQwGRvlAWi+WJjA==
X-CSE-MsgGUID: OvWiObj2RCWfp9Nfg6CGAQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,184,1739865600"; d="scan'208";a="131180637"
Received: from lkp-server01.sh.intel.com (HELO b207828170a5) ([10.239.97.150])
 by fmviesa003.fm.intel.com with ESMTP; 03 Apr 2025 09:24:33 -0700
Received: from kbuild by b207828170a5 with local (Exim 4.96)
 (envelope-from <lkp@intel.com>) id 1u0NMj-0000fT-33;
 Thu, 03 Apr 2025 16:24:29 +0000
Date: Fri, 4 Apr 2025 00:23:57 +0800
From: kernel test robot <lkp@intel.com>
To: "yohan.joung" <yohan.joung@sk.com>, jaegeuk@kernel.org, chao@kernel.org
Message-ID: <202504032346.pFNGrse7-lkp@intel.com>
References: <20250403071016.2940-1-yohan.joung@sk.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20250403071016.2940-1-yohan.joung@sk.com>
X-Spam-Score: -3.1 (---)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  Hi yohan.joung, kernel test robot noticed the following build
 errors: [auto build test ERROR on jaegeuk-f2fs/dev-test] [also build test
 ERROR on jaegeuk-f2fs/dev linus/master v6.14 next-20250403] [If your patch
 is applied to the wrong git tree, kindly drop us a note. An [...] 
 Content analysis details:   (-3.1 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 RCVD_IN_VALIDITY_RPBL_BLOCKED RBL: ADMINISTRATOR NOTICE: The
 query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [198.175.65.15 listed in bl.score.senderscore.com]
 0.0 RCVD_IN_VALIDITY_CERTIFIED_BLOCKED RBL: ADMINISTRATOR NOTICE:
 The query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [198.175.65.15 listed in sa-accredit.habeas.com]
 -2.3 RCVD_IN_DNSWL_MED      RBL: Sender listed at https://www.dnswl.org/,
 medium trust [198.175.65.15 listed in list.dnswl.org]
 0.0 T_SPF_TEMPERROR        SPF: test of record failed (temperror)
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.6 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1u0NMz-0002SB-NZ
Subject: Re: [f2fs-dev] [PATCH v4] f2fs: prevent the current section from
 being selected as a victim during GC
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
Cc: llvm@lists.linux.dev, linux-kernel@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net, oe-kbuild-all@lists.linux.dev,
 pilhyun.kim@sk.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

Hi yohan.joung,

kernel test robot noticed the following build errors:

[auto build test ERROR on jaegeuk-f2fs/dev-test]
[also build test ERROR on jaegeuk-f2fs/dev linus/master v6.14 next-20250403]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/yohan-joung/f2fs-prevent-the-current-section-from-being-selected-as-a-victim-during-GC/20250403-151057
base:   https://git.kernel.org/pub/scm/linux/kernel/git/jaegeuk/f2fs.git dev-test
patch link:    https://lore.kernel.org/r/20250403071016.2940-1-yohan.joung%40sk.com
patch subject: [PATCH v4] f2fs: prevent the current section from being selected as a victim during GC
config: i386-buildonly-randconfig-003-20250403 (https://download.01.org/0day-ci/archive/20250403/202504032346.pFNGrse7-lkp@intel.com/config)
compiler: clang version 20.1.2 (https://github.com/llvm/llvm-project 58df0ef89dd64126512e4ee27b4ac3fd8ddf6247)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250403/202504032346.pFNGrse7-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202504032346.pFNGrse7-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from fs/f2fs/file.c:30:
>> fs/f2fs/segment.h:480:53: error: too few arguments provided to function-like macro invocation
     480 |                                 if (GET_SEC_FROM_SEG(sbi->next_victim_seg[BG_GC]) == secno)
         |                                                                                 ^
   fs/f2fs/segment.h:105:9: note: macro 'GET_SEC_FROM_SEG' defined here
     105 | #define GET_SEC_FROM_SEG(sbi, segno)                            \
         |         ^
>> fs/f2fs/segment.h:480:9: error: use of undeclared identifier 'GET_SEC_FROM_SEG'
     480 |                                 if (GET_SEC_FROM_SEG(sbi->next_victim_seg[BG_GC]) == secno)
         |                                     ^
   fs/f2fs/segment.h:483:53: error: too few arguments provided to function-like macro invocation
     483 |                                 if (GET_SEC_FROM_SEG(sbi->next_victim_seg[FG_GC]) == secno)
         |                                                                                 ^
   fs/f2fs/segment.h:105:9: note: macro 'GET_SEC_FROM_SEG' defined here
     105 | #define GET_SEC_FROM_SEG(sbi, segno)                            \
         |         ^
   fs/f2fs/segment.h:483:9: error: use of undeclared identifier 'GET_SEC_FROM_SEG'
     483 |                                 if (GET_SEC_FROM_SEG(sbi->next_victim_seg[FG_GC]) == secno)
         |                                     ^
   4 errors generated.


vim +480 fs/f2fs/segment.h

   458	
   459	static inline void __set_test_and_free(struct f2fs_sb_info *sbi,
   460			unsigned int segno, bool inmem)
   461	{
   462		struct free_segmap_info *free_i = FREE_I(sbi);
   463		unsigned int secno = GET_SEC_FROM_SEG(sbi, segno);
   464		unsigned int start_segno = GET_SEG_FROM_SEC(sbi, secno);
   465		unsigned int next;
   466		unsigned int usable_segs = f2fs_usable_segs_in_sec(sbi);
   467	
   468		spin_lock(&free_i->segmap_lock);
   469		if (test_and_clear_bit(segno, free_i->free_segmap)) {
   470			free_i->free_segments++;
   471	
   472			if (!inmem && IS_CURSEC(sbi, secno))
   473				goto skip_free;
   474			next = find_next_bit(free_i->free_segmap,
   475					start_segno + SEGS_PER_SEC(sbi), start_segno);
   476			if (next >= start_segno + usable_segs) {
   477				if (test_and_clear_bit(secno, free_i->free_secmap)) {
   478					free_i->free_sections++;
   479	
 > 480					if (GET_SEC_FROM_SEG(sbi->next_victim_seg[BG_GC]) == secno)
   481						sbi->next_victim_seg[BG_GC] = NULL_SEGNO;
   482	
   483					if (GET_SEC_FROM_SEG(sbi->next_victim_seg[FG_GC]) == secno)
   484						sbi->next_victim_seg[FG_GC] = NULL_SEGNO;
   485				}
   486			}
   487		}
   488	skip_free:
   489		spin_unlock(&free_i->segmap_lock);
   490	}
   491	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
