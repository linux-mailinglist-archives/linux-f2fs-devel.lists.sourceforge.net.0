Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 583359A5106
	for <lists+linux-f2fs-devel@lfdr.de>; Sat, 19 Oct 2024 23:58:33 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1t2HSh-0004YO-AJ;
	Sat, 19 Oct 2024 21:58:15 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <lkp@intel.com>) id 1t2HSg-0004YC-2g
 for linux-f2fs-devel@lists.sourceforge.net;
 Sat, 19 Oct 2024 21:58:14 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=9NOh56FeU6f54/rMPo2VW33A2+CIWNwAvnOFGFiTwvo=; b=iTipTQaUpdr/Yx8N6x9sOjzCm/
 ffJ0OyfduhT9SXNZHljr4KoJ26QBgopSibM5Kq0ha6C0eSeUy3uOZW2BUSUUdM4+OcSziV0KkKiTC
 da2D2RqKarm0J1oQ1vgQIhBtywPuUo2g1MzBDmu/8gwG1FVtWwD5lmGTGSnuts1o+qek=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=9NOh56FeU6f54/rMPo2VW33A2+CIWNwAvnOFGFiTwvo=; b=OhD5ZO8cqIRMa1eOexCs6NsciZ
 deICOw2WUBGewKjgxwvf5yDxpISfA+8FQyOgKq3Q2gtqKiksR2OxVcuY7BSSzBkF8Ynb6vBr2/UAK
 3NIcZziMY3h7clJfgzqksq7EBZdz8DR2VOtX9AtjY9CtpA10Rie9RtS14td2Zq/f4zJs=;
Received: from mgamail.intel.com ([198.175.65.17])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1t2HSb-0003Oj-WB for linux-f2fs-devel@lists.sourceforge.net;
 Sat, 19 Oct 2024 21:58:14 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1729375090; x=1760911090;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=kF4o32H6Y+d5GRg9+dYDAFXUYee3JdV9QlWYoFKJKBQ=;
 b=Kl2JtsbqULfGfc9izaPBjPvATKIz/CSpqOUzGw+sUEHa/zjKRDS4NBuB
 h3vzc3T79f6DWPk5+IRVyIjIDzoOE1vOXs9tTw4T5HLqTRdjfEOTvKrRF
 gTeutIgoZDfoLBNotzM4Uo7zARWqne7tLG0lYnb0KyL4HzqENmSVi/fXz
 e/TGgCuXYW9rKD1x2Bf1Sdrelf1uJITY6O2e//mq9M4fVg7uCDxg9sNGu
 Y97pd1/Nq4qVGKZfEIfq97GKPYfg1DVFkrClEGLGiy92Q1sch2sa228OB
 68Rg9u5sUn+uuzvEz2rHb69aO/Y4s+4lzZmKt4OhhZPmcU1fb7ewLcNYY w==;
X-CSE-ConnectionGUID: yMIkVY2aQRe7ZwdxcrTPdw==
X-CSE-MsgGUID: znTu3HUmRIiI6PvIZf/Bgg==
X-IronPort-AV: E=McAfee;i="6700,10204,11230"; a="28983918"
X-IronPort-AV: E=Sophos;i="6.11,217,1725346800"; d="scan'208";a="28983918"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Oct 2024 14:58:05 -0700
X-CSE-ConnectionGUID: fPl6equpT0uNzjD4ZHvRgQ==
X-CSE-MsgGUID: jZ/gyGMvRW2olnQDoGkwHQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,217,1725346800"; d="scan'208";a="83737408"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
 by fmviesa005.fm.intel.com with ESMTP; 19 Oct 2024 14:58:02 -0700
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
 (envelope-from <lkp@intel.com>) id 1t2HSS-000PaT-0f;
 Sat, 19 Oct 2024 21:58:00 +0000
Date: Sun, 20 Oct 2024 05:57:30 +0800
From: kernel test robot <lkp@intel.com>
To: Chao Yu <yuchao0@huawei.com>, Chao Yu <chao@kernel.org>, jaegeuk@kernel.org
Message-ID: <202410200521.Mc4H4BHm-lkp@intel.com>
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
 medium trust [198.175.65.17 listed in list.dnswl.org]
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
X-Headers-End: 1t2HSb-0003Oj-WB
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
Cc: Chao Yu <yuchao0@huawei.com>, llvm@lists.linux.dev,
 linux-kernel@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net,
 oe-kbuild-all@lists.linux.dev
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
config: i386-buildonly-randconfig-002-20241019 (https://download.01.org/0day-ci/archive/20241020/202410200521.Mc4H4BHm-lkp@intel.com/config)
compiler: clang version 18.1.8 (https://github.com/llvm/llvm-project 3b5b5c1ec4a3095ab096dd780e84d7ab81f3d7ff)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241020/202410200521.Mc4H4BHm-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202410200521.Mc4H4BHm-lkp@intel.com/

All error/warnings (new ones prefixed by >>):

>> fs/f2fs/segment.c:3818:38: warning: declaration of 'enum log_type' will not be visible outside of this function [-Wvisibility]
    3818 | static int log_type_to_seg_type(enum log_type type)
         |                                      ^
>> fs/f2fs/segment.c:3818:47: error: variable has incomplete type 'enum log_type'
    3818 | static int log_type_to_seg_type(enum log_type type)
         |                                               ^
   fs/f2fs/segment.c:3818:38: note: forward declaration of 'enum log_type'
    3818 | static int log_type_to_seg_type(enum log_type type)
         |                                      ^
   fs/f2fs/segment.c:3843:16: error: variable has incomplete type 'enum log_type'
    3843 |         enum log_type type = __get_segment_type(fio);
         |                       ^
   fs/f2fs/segment.c:3843:7: note: forward declaration of 'enum log_type'
    3843 |         enum log_type type = __get_segment_type(fio);
         |              ^
>> fs/f2fs/segment.c:4828:44: error: argument type 'enum log_type' is incomplete
    4828 |                 array[i].seg_type = log_type_to_seg_type(i);
         |                                                          ^
   fs/f2fs/segment.c:3818:38: note: forward declaration of 'enum log_type'
    3818 | static int log_type_to_seg_type(enum log_type type)
         |                                      ^
   1 warning and 3 errors generated.


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

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
