Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 6877654CC1C
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 15 Jun 2022 17:03:37 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.94.2)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1o1UYO-0006O9-7P; Wed, 15 Jun 2022 15:03:32 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <lkp@intel.com>) id 1o1UYN-0006Nx-9u
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 15 Jun 2022 15:03:31 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=3SsthYpkDaLQU8T5OXr2DiEygFNhA/uAQW5JzJFfTLE=; b=DbfH+0+3RdgPuEAVWpGUIbPmjX
 Fwn7RYJm5oimlHHjjVKuNYgwsHRTsCLFqlLCrI4YcRXRF+G5omTOW4FvRLrRT17lPS9Zv5ynPL8tZ
 +cc8VXX9I1tASTi21L30QcUkiqNcIqjf52VE3Mpr4wX9o6fzz4HMmZHlYiPRydadnDrs=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=3SsthYpkDaLQU8T5OXr2DiEygFNhA/uAQW5JzJFfTLE=; b=G1381aalcsugk7mHYfkF3LOt5H
 rgCwQ1CiQfRQ+1VIwgvUHRH/sH+1jQy4E5PWBDTQ3x6NHRgtQgO5DSG9raV8nT3OONb1+Ph/FGfGs
 CYCqfMsNlwwvrY1Ub0idseps6HoTQja7Q9lSBIxv77vrERoPscJxczdHxp5t4F4l6SyU=;
Received: from mga06b.intel.com ([134.134.136.31] helo=mga06.intel.com)
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.94.2)
 id 1o1UYJ-002URt-DR
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 15 Jun 2022 15:03:31 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1655305407; x=1686841407;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=MHeoGg3PQPdP5VbC2PG27RoW1s04/Fz9tzoP6DSf9WQ=;
 b=j/abgUZWxscqnqJxNS2UhCdM7JayZG3H6wnyuNWRXmelBjo2R2Sbk9SB
 K5r1JQYLx+IG4zWmUl8IcQrlM29/rMyWE+3Fd+y68InMc/TF4cNYsvKN5
 vUo7IbC+BX4Y28EB5TvC1ds8UDgIXEXEPL968CmlxihSFoM9bLs98iO5R
 0kG1HPbkpW/oHWGjEftyrmv+/b2B6k3yYvinLujB9NaZRtW0Y3NHRakQl
 bYia0zCMB9pmLetOC/1B8856urmHoOLtguELyYWmtPFurDS3WxQHRRYgf
 MzLRcAv1iYMbQeMeCYffM+2Lb6Gy7NeZxXEIwcTxw1/1SVIEfhVOyCyRI g==;
X-IronPort-AV: E=McAfee;i="6400,9594,10378"; a="340648125"
X-IronPort-AV: E=Sophos;i="5.91,302,1647327600"; d="scan'208";a="340648125"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Jun 2022 08:03:21 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.91,302,1647327600"; d="scan'208";a="612778636"
Received: from lkp-server01.sh.intel.com (HELO 60dabacc1df6) ([10.239.97.150])
 by orsmga008.jf.intel.com with ESMTP; 15 Jun 2022 08:03:19 -0700
Received: from kbuild by 60dabacc1df6 with local (Exim 4.95)
 (envelope-from <lkp@intel.com>) id 1o1UYA-000MxD-PE;
 Wed, 15 Jun 2022 15:03:18 +0000
Date: Wed, 15 Jun 2022 23:02:55 +0800
From: kernel test robot <lkp@intel.com>
To: Ren Zhijie <renzhijie2@huawei.com>, jaegeuk@kernel.org, chao@kernel.org,
 daehojeong@google.com
Message-ID: <202206152345.By6X3FNj-lkp@intel.com>
References: <20220615070422.214106-1-renzhijie2@huawei.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220615070422.214106-1-renzhijie2@huawei.com>
X-Spam-Score: -3.7 (---)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  Hi Ren, Thank you for the patch! Yet something to improve:
 [auto build test ERROR on next-20220615] 
 Content analysis details:   (-3.7 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -2.3 RCVD_IN_DNSWL_MED      RBL: Sender listed at https://www.dnswl.org/,
 medium trust [134.134.136.31 listed in list.dnswl.org]
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
X-Headers-End: 1o1UYJ-002URt-DR
Subject: Re: [f2fs-dev] [PATCH -next] f2fs: fix build error too many
 arguments to functions
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
Cc: Ren Zhijie <renzhijie2@huawei.com>, kbuild-all@lists.01.org,
 linux-kernel@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

Hi Ren,

Thank you for the patch! Yet something to improve:

[auto build test ERROR on next-20220615]

url:    https://github.com/intel-lab-lkp/linux/commits/Ren-Zhijie/f2fs-fix-build-error-too-many-arguments-to-functions/20220615-150808
base:    6012273897fefb12566580efedee10bb06e5e6ed
config: x86_64-rhel-8.3 (https://download.01.org/0day-ci/archive/20220615/202206152345.By6X3FNj-lkp@intel.com/config)
compiler: gcc-11 (Debian 11.3.0-3) 11.3.0
reproduce (this is a W=1 build):
        # https://github.com/intel-lab-lkp/linux/commit/1832104c73270fad342bf40c089542083dca7585
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review Ren-Zhijie/f2fs-fix-build-error-too-many-arguments-to-functions/20220615-150808
        git checkout 1832104c73270fad342bf40c089542083dca7585
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        make W=1 O=build_dir ARCH=x86_64 SHELL=/bin/bash fs/f2fs/

If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>

All errors (new ones prefixed by >>):

   fs/f2fs/data.c: In function 'f2fs_finish_read_bio':
>> fs/f2fs/data.c:136:33: error: too few arguments to function 'f2fs_end_read_compressed_page'
     136 |                                 f2fs_end_read_compressed_page(page, true, 0);
         |                                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   In file included from fs/f2fs/data.c:25:
   fs/f2fs/f2fs.h:4226:20: note: declared here
    4226 | static inline void f2fs_end_read_compressed_page(struct page *page, bool failed,
         |                    ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>> fs/f2fs/data.c:137:25: error: too few arguments to function 'f2fs_put_page_dic'
     137 |                         f2fs_put_page_dic(page);
         |                         ^~~~~~~~~~~~~~~~~
   In file included from fs/f2fs/data.c:25:
   fs/f2fs/f2fs.h:4231:20: note: declared here
    4231 | static inline void f2fs_put_page_dic(struct page *page, bool in_softirq)
         |                    ^~~~~~~~~~~~~~~~~
   fs/f2fs/data.c: In function 'f2fs_handle_step_decompress':
   fs/f2fs/data.c:239:25: error: too few arguments to function 'f2fs_end_read_compressed_page'
     239 |                         f2fs_end_read_compressed_page(page, PageError(page),
         |                         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   In file included from fs/f2fs/data.c:25:
   fs/f2fs/f2fs.h:4226:20: note: declared here
    4226 | static inline void f2fs_end_read_compressed_page(struct page *page, bool failed,
         |                    ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~


vim +/f2fs_end_read_compressed_page +136 fs/f2fs/data.c

6dbb17961f46b2 Eric Biggers      2018-04-18  121  
7f59b277f79e8a Eric Biggers      2021-01-04  122  static void f2fs_finish_read_bio(struct bio *bio)
93dfe2ac516250 Jaegeuk Kim       2013-11-30  123  {
6dbb17961f46b2 Eric Biggers      2018-04-18  124  	struct bio_vec *bv;
6dc4f100c175dd Ming Lei          2019-02-15  125  	struct bvec_iter_all iter_all;
93dfe2ac516250 Jaegeuk Kim       2013-11-30  126  
7f59b277f79e8a Eric Biggers      2021-01-04  127  	/*
7f59b277f79e8a Eric Biggers      2021-01-04  128  	 * Update and unlock the bio's pagecache pages, and put the
7f59b277f79e8a Eric Biggers      2021-01-04  129  	 * decompression context for any compressed pages.
7f59b277f79e8a Eric Biggers      2021-01-04  130  	 */
2b070cfe582b8e Christoph Hellwig 2019-04-25  131  	bio_for_each_segment_all(bv, bio, iter_all) {
7f59b277f79e8a Eric Biggers      2021-01-04  132  		struct page *page = bv->bv_page;
6dbb17961f46b2 Eric Biggers      2018-04-18  133  
7f59b277f79e8a Eric Biggers      2021-01-04  134  		if (f2fs_is_compressed_page(page)) {
7f59b277f79e8a Eric Biggers      2021-01-04  135  			if (bio->bi_status)
6ce19aff0b8cd3 Chao Yu           2021-05-20 @136  				f2fs_end_read_compressed_page(page, true, 0);
7f59b277f79e8a Eric Biggers      2021-01-04 @137  			f2fs_put_page_dic(page);
4c8ff7095bef64 Chao Yu           2019-11-01  138  			continue;
4c8ff7095bef64 Chao Yu           2019-11-01  139  		}
4c8ff7095bef64 Chao Yu           2019-11-01  140  
7f59b277f79e8a Eric Biggers      2021-01-04  141  		/* PG_error was set if decryption or verity failed. */
6dbb17961f46b2 Eric Biggers      2018-04-18  142  		if (bio->bi_status || PageError(page)) {
6dbb17961f46b2 Eric Biggers      2018-04-18  143  			ClearPageUptodate(page);
fb7d70db305a14 Jaegeuk Kim       2018-09-25  144  			/* will re-read again later */
fb7d70db305a14 Jaegeuk Kim       2018-09-25  145  			ClearPageError(page);
6dbb17961f46b2 Eric Biggers      2018-04-18  146  		} else {
6dbb17961f46b2 Eric Biggers      2018-04-18  147  			SetPageUptodate(page);
6dbb17961f46b2 Eric Biggers      2018-04-18  148  		}
5f9abab42b60e6 Jaegeuk Kim       2018-10-16  149  		dec_page_count(F2FS_P_SB(page), __read_io_type(page));
6dbb17961f46b2 Eric Biggers      2018-04-18  150  		unlock_page(page);
6dbb17961f46b2 Eric Biggers      2018-04-18  151  	}
79bbefb19f1359 Chao Yu           2020-03-23  152  
7f59b277f79e8a Eric Biggers      2021-01-04  153  	if (bio->bi_private)
7f59b277f79e8a Eric Biggers      2021-01-04  154  		mempool_free(bio->bi_private, bio_post_read_ctx_pool);
7f59b277f79e8a Eric Biggers      2021-01-04  155  	bio_put(bio);
4c8ff7095bef64 Chao Yu           2019-11-01  156  }
4c8ff7095bef64 Chao Yu           2019-11-01  157  

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
