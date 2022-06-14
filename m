Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id D0E4754A8BA
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 14 Jun 2022 07:27:29 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.94.2)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1o0z5K-0001vc-Ab; Tue, 14 Jun 2022 05:27:27 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <lkp@intel.com>) id 1o0z5I-0001vW-KW
 for linux-f2fs-devel@lists.sourceforge.net; Tue, 14 Jun 2022 05:27:25 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:MIME-Version:Message-ID:Subject:Cc:To:
 From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=WF1yMOC/hQdDDDTtW+oBkjo9X/YnIz8kg/L8Qeig1JE=; b=ZEv8hmC0uR4zCrZ0OTzBjdSRmd
 ZupGqJ269RCYb0rvPkcxafyzHLTkzwydeF7t5N2RXCfEwEo6UU+GGpShpcEc0YxFsR1nGTKe+iM2y
 44NtORJ0fppxKJNf903WCY/DGhrlpTRHoMu6C5riUlq01gMgvUFiMnh/cIx//8jupzP4=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:MIME-Version:Message-ID:Subject:Cc:To:From:Date:Sender:
 Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
 :Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=WF1yMOC/hQdDDDTtW+oBkjo9X/YnIz8kg/L8Qeig1JE=; b=Q
 vVA6AjUw6S6xeV6arfS7SchJy7ohQquZU6DXmKw79JDk4gLtH9ftB8FhoiQhRO+4bAyVOIU9FXrg5
 oCodbT8a8HETSecMP9oOrVHTmBwOBO0cO6+UJJDPrbLElyCRVtukXXuzgJJcMdYYsldIG/GzdynJz
 EzMq/3VdAIZMMylE=;
Received: from mga05.intel.com ([192.55.52.43])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.94.2)
 id 1o0z5H-000sPO-Ay
 for linux-f2fs-devel@lists.sourceforge.net; Tue, 14 Jun 2022 05:27:25 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1655184443; x=1686720443;
 h=date:from:to:cc:subject:message-id:mime-version;
 bh=COT+kgd5eedc/FdqthVLIA930mEXjT/2DUeQL9vQadw=;
 b=g8ub9Dz8NHMNY3GmGiD7gKnmRsKo8KlEdyJoCaAQODN3xg7ygSXXlZWr
 hCSd0QxM+oguxxAPE6snN4BuUjz9eH+eODuI9A/C46bBndYdMoxV/KqSN
 9PCbPCPGOogN6eWLpgNJ0vUc0wZLQhFwsdi7P3DRch9Hbmkvl7giOIlFY
 b66HbsVy/4nzJh932QujwLuRVCzFZvdzlchtZhdJ+ILGHR8ptcCDDB43Q
 60IMk/c0djChfCWBo7aj+L7ut++uoxlwhdK+ayEMUfk+iVBjdd5szKt1R
 dYJBpCaxd//ktis8427jttvhKTz4azGNTLO6yHKXZPVDDcOseEahsIchd w==;
X-IronPort-AV: E=McAfee;i="6400,9594,10377"; a="364843609"
X-IronPort-AV: E=Sophos;i="5.91,299,1647327600"; d="scan'208";a="364843609"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Jun 2022 22:27:16 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.91,299,1647327600"; d="scan'208";a="910786791"
Received: from lkp-server01.sh.intel.com (HELO 60dabacc1df6) ([10.239.97.150])
 by fmsmga005.fm.intel.com with ESMTP; 13 Jun 2022 22:27:15 -0700
Received: from kbuild by 60dabacc1df6 with local (Exim 4.95)
 (envelope-from <lkp@intel.com>) id 1o0z58-000LW9-EJ;
 Tue, 14 Jun 2022 05:27:14 +0000
Date: Tue, 14 Jun 2022 13:27:06 +0800
From: kernel test robot <lkp@intel.com>
To: Daeho Jeong <daehojeong@google.com>
Message-ID: <202206141312.6Prd40vG-lkp@intel.com>
MIME-Version: 1.0
Content-Disposition: inline
X-Spam-Score: -3.7 (---)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: tree:
 https://git.kernel.org/pub/scm/linux/kernel/git/jaegeuk/f2fs.git
 dev-test head: b133c2a8acb301652cdf98198f21b41e4c36c281 commit:
 1b565702dffe0d67d19fce41be2eae24c0d19709
 [5/7] f2fs: handle decom [...] 
 Content analysis details:   (-3.7 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -2.3 RCVD_IN_DNSWL_MED      RBL: Sender listed at https://www.dnswl.org/,
 medium trust [192.55.52.43 listed in list.dnswl.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.0 T_SCC_BODY_TEXT_LINE   No description available.
 -1.1 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1o0z5H-000sPO-Ay
Subject: [f2fs-dev] [jaegeuk-f2fs:dev-test 5/7] fs/f2fs/data.c:137:8: error:
 too many arguments to function call, expected 3, have 4
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
 kbuild-all@lists.01.org, linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/jaegeuk/f2fs.git dev-test
head:   b133c2a8acb301652cdf98198f21b41e4c36c281
commit: 1b565702dffe0d67d19fce41be2eae24c0d19709 [5/7] f2fs: handle decompress only post processing in softirq
config: i386-randconfig-a004-20220613 (https://download.01.org/0day-ci/archive/20220614/202206141312.6Prd40vG-lkp@intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project c97436f8b6e2718286e8496faf53a2c800e281cf)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://git.kernel.org/pub/scm/linux/kernel/git/jaegeuk/f2fs.git/commit/?id=1b565702dffe0d67d19fce41be2eae24c0d19709
        git remote add jaegeuk-f2fs https://git.kernel.org/pub/scm/linux/kernel/git/jaegeuk/f2fs.git
        git fetch --no-tags jaegeuk-f2fs dev-test
        git checkout 1b565702dffe0d67d19fce41be2eae24c0d19709
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=i386 SHELL=/bin/bash fs/

If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>

All errors (new ones prefixed by >>):

>> fs/f2fs/data.c:137:8: error: too many arguments to function call, expected 3, have 4
                                                           in_softirq);
                                                           ^~~~~~~~~~
   fs/f2fs/f2fs.h:4232:20: note: 'f2fs_end_read_compressed_page' declared here
   static inline void f2fs_end_read_compressed_page(struct page *page,
                      ^
>> fs/f2fs/data.c:138:28: error: too many arguments to function call, expected single argument 'page', have 2 arguments
                           f2fs_put_page_dic(page, in_softirq);
                           ~~~~~~~~~~~~~~~~~       ^~~~~~~~~~
   fs/f2fs/f2fs.h:4237:20: note: 'f2fs_put_page_dic' declared here
   static inline void f2fs_put_page_dic(struct page *page)
                      ^
   fs/f2fs/data.c:242:16: error: too many arguments to function call, expected 3, have 4
                                                   blkaddr, in_softirq);
                                                            ^~~~~~~~~~
   fs/f2fs/f2fs.h:4232:20: note: 'f2fs_end_read_compressed_page' declared here
   static inline void f2fs_end_read_compressed_page(struct page *page,
                      ^
   3 errors generated.


vim +137 fs/f2fs/data.c

   121	
   122	static void f2fs_finish_read_bio(struct bio *bio, bool in_softirq)
   123	{
   124		struct bio_vec *bv;
   125		struct bvec_iter_all iter_all;
   126	
   127		/*
   128		 * Update and unlock the bio's pagecache pages, and put the
   129		 * decompression context for any compressed pages.
   130		 */
   131		bio_for_each_segment_all(bv, bio, iter_all) {
   132			struct page *page = bv->bv_page;
   133	
   134			if (f2fs_is_compressed_page(page)) {
   135				if (bio->bi_status)
   136					f2fs_end_read_compressed_page(page, true, 0,
 > 137								in_softirq);
 > 138				f2fs_put_page_dic(page, in_softirq);
   139				continue;
   140			}
   141	
   142			/* PG_error was set if decryption or verity failed. */
   143			if (bio->bi_status || PageError(page)) {
   144				ClearPageUptodate(page);
   145				/* will re-read again later */
   146				ClearPageError(page);
   147			} else {
   148				SetPageUptodate(page);
   149			}
   150			dec_page_count(F2FS_P_SB(page), __read_io_type(page));
   151			unlock_page(page);
   152		}
   153	
   154		if (bio->bi_private)
   155			mempool_free(bio->bi_private, bio_post_read_ctx_pool);
   156		bio_put(bio);
   157	}
   158	

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
