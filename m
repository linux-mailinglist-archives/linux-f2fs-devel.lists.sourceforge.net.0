Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 812B66A73A6
	for <lists+linux-f2fs-devel@lfdr.de>; Wed,  1 Mar 2023 19:38:49 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1pXRLh-0000qq-SX;
	Wed, 01 Mar 2023 18:38:45 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <lkp@intel.com>) id 1pXRLg-0000qk-Cx
 for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 01 Mar 2023 18:38:43 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=kYiZP4ttpoP+WmgrpaX4cZDnKWm4zJa6/15rnQxfiME=; b=CJhvL3Wmt4SxMGfB7JUU0GjNPn
 KgMX/hBwygA/M3PrKq0hKcYe00eXOe2lGNdP/FVpC85dd6HAIy1USKLZH+mzOJ09IBU0OhY8TnLz7
 D5/g2Q/hOGNO8y47GcsrRnbSdP/B3D2i0wHrbA+HbvcD1IIfRYQZh3zmkYJtX1my2MrY=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=kYiZP4ttpoP+WmgrpaX4cZDnKWm4zJa6/15rnQxfiME=; b=mKumMgFOwgj8CEmK5uwp8lFEEI
 EHrG6wuc26sQqaw3/obIeYG35rbT3iflLUA9G+fHFTmvdjAiOoMkFvqCitRBFPdbTpBg+fl92kHLn
 J/pI/9Duofryq/RbT9xf+Tpd4ykn6xHJnkV04X9cAjGTnrANc9pxpmRfS49OwbWwavAg=;
Received: from mga03.intel.com ([134.134.136.65])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1pXRLb-00B9vU-L7 for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 01 Mar 2023 18:38:43 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1677695919; x=1709231919;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=0+6pK6GQZOLUcX08e82w2PNbJriTNrH9Gj7tBxOFd78=;
 b=aJx9/dHEzCi4d6IkR/KB6zV13+BbUP48CoveFsOPv4iKvv1wTkoe8lVt
 35tGaDjMCnbx7gHiJCdC9ht0VV/sZIDc4aYIALfCoQNv+ypPOp90l3Mfx
 zDTn8vAFu4tCOEtiS9lM0bDY5tAPY7tBcEXCj50jnptvH/IRVogTNtPfc
 M69jG36XTvwkkhdOfkx9byY6ka3OcsWG8n4jfQMEeh86xx6S8sBrAU6HW
 26mj0hI9eoHtQjwdlkfRWQIGkX+nUn6WF4y6vyOsSfJERV4NLKRTGPFes
 5C+CoKnXmAHQg5cnIyf3wF5nDN70q+MbilMv3mfFDxJFBat3BkQQtTLIm w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10636"; a="336780666"
X-IronPort-AV: E=Sophos;i="5.98,225,1673942400"; d="scan'208";a="336780666"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Mar 2023 10:38:33 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10636"; a="848760343"
X-IronPort-AV: E=Sophos;i="5.98,225,1673942400"; d="scan'208";a="848760343"
Received: from lkp-server01.sh.intel.com (HELO 3895f5c55ead) ([10.239.97.150])
 by orsmga005.jf.intel.com with ESMTP; 01 Mar 2023 10:38:30 -0800
Received: from kbuild by 3895f5c55ead with local (Exim 4.96)
 (envelope-from <lkp@intel.com>) id 1pXRLR-0006L9-31;
 Wed, 01 Mar 2023 18:38:29 +0000
Date: Thu, 2 Mar 2023 02:37:42 +0800
From: kernel test robot <lkp@intel.com>
To: Yangtao Li <frank.li@vivo.com>, jaegeuk@kernel.org, chao@kernel.org
Message-ID: <202303020207.fOdSTt0K-lkp@intel.com>
References: <20230301152212.53951-1-frank.li@vivo.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230301152212.53951-1-frank.li@vivo.com>
X-Spam-Score: -3.2 (---)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  Hi Yangtao, I love your patch! Perhaps something to improve:
 [auto build test WARNING on jaegeuk-f2fs/dev-test] [cannot apply to v6.2]
 [If your patch is applied to the wrong git tree, kindly drop us a note. And
 when submitting patch, we suggest to use '--base' [...] 
 Content analysis details:   (-3.2 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 URIBL_BLOCKED          ADMINISTRATOR NOTICE: The query to URIBL was
 blocked.  See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URIs: intel.com]
 -2.3 RCVD_IN_DNSWL_MED      RBL: Sender listed at https://www.dnswl.org/,
 medium trust [134.134.136.65 listed in list.dnswl.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid -0.7 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1pXRLb-00B9vU-L7
Subject: Re: [f2fs-dev] [PATCH] f2fs: add discard_cpuset mount opt
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
Cc: linux-f2fs-devel@lists.sourceforge.net, linux-kernel@vger.kernel.org,
 Yangtao Li <frank.li@vivo.com>, oe-kbuild-all@lists.linux.dev
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

Hi Yangtao,

I love your patch! Perhaps something to improve:

[auto build test WARNING on jaegeuk-f2fs/dev-test]
[cannot apply to v6.2]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Yangtao-Li/f2fs-add-discard_cpuset-mount-opt/20230301-232500
base:   https://git.kernel.org/pub/scm/linux/kernel/git/jaegeuk/f2fs.git dev-test
patch link:    https://lore.kernel.org/r/20230301152212.53951-1-frank.li%40vivo.com
patch subject: [PATCH] f2fs: add discard_cpuset mount opt
config: x86_64-allyesconfig (https://download.01.org/0day-ci/archive/20230302/202303020207.fOdSTt0K-lkp@intel.com/config)
compiler: gcc-11 (Debian 11.3.0-8) 11.3.0
reproduce (this is a W=1 build):
        # https://github.com/intel-lab-lkp/linux/commit/fdcaea1b50e37d5bcfcc186db80237edc04cfafc
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review Yangtao-Li/f2fs-add-discard_cpuset-mount-opt/20230301-232500
        git checkout fdcaea1b50e37d5bcfcc186db80237edc04cfafc
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        make W=1 O=build_dir ARCH=x86_64 olddefconfig
        make W=1 O=build_dir ARCH=x86_64 SHELL=/bin/bash fs/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202303020207.fOdSTt0K-lkp@intel.com/

All warnings (new ones prefixed by >>):

   fs/f2fs/super.c: In function 'f2fs_remount':
>> fs/f2fs/super.c:2526:1: warning: the frame size of 2568 bytes is larger than 2048 bytes [-Wframe-larger-than=]
    2526 | }
         | ^


vim +2526 fs/f2fs/super.c

4b2414d04e9912 Chao Yu          2017-08-08  2284  
df728b0f6954c3 Jaegeuk Kim      2016-03-23  2285  	/* recover superblocks we couldn't write due to previous RO mount */
1751e8a6cb935e Linus Torvalds   2017-11-27  2286  	if (!(*flags & SB_RDONLY) && is_sbi_flag_set(sbi, SBI_NEED_SB_WRITE)) {
df728b0f6954c3 Jaegeuk Kim      2016-03-23  2287  		err = f2fs_commit_super(sbi, false);
dcbb4c10e6d969 Joe Perches      2019-06-18  2288  		f2fs_info(sbi, "Try to recover all the superblocks, ret: %d",
dcbb4c10e6d969 Joe Perches      2019-06-18  2289  			  err);
df728b0f6954c3 Jaegeuk Kim      2016-03-23  2290  		if (!err)
df728b0f6954c3 Jaegeuk Kim      2016-03-23  2291  			clear_sbi_flag(sbi, SBI_NEED_SB_WRITE);
df728b0f6954c3 Jaegeuk Kim      2016-03-23  2292  	}
df728b0f6954c3 Jaegeuk Kim      2016-03-23  2293  
498c5e9fcd10c8 Yunlei He        2015-05-07  2294  	default_options(sbi);
26666c8a4366de Chao Yu          2014-09-15  2295  
696c018c7718f5 Namjae Jeon      2013-06-16  2296  	/* parse mount options */
ed318a6cc0b620 Eric Biggers     2020-05-12  2297  	err = parse_options(sb, data, true);
696c018c7718f5 Namjae Jeon      2013-06-16  2298  	if (err)
696c018c7718f5 Namjae Jeon      2013-06-16  2299  		goto restore_opts;
696c018c7718f5 Namjae Jeon      2013-06-16  2300  
696c018c7718f5 Namjae Jeon      2013-06-16  2301  	/*
696c018c7718f5 Namjae Jeon      2013-06-16  2302  	 * Previous and new state of filesystem is RO,
876dc59eb1f013 Gu Zheng         2014-04-11  2303  	 * so skip checking GC and FLUSH_MERGE conditions.
696c018c7718f5 Namjae Jeon      2013-06-16  2304  	 */
1751e8a6cb935e Linus Torvalds   2017-11-27  2305  	if (f2fs_readonly(sb) && (*flags & SB_RDONLY))
696c018c7718f5 Namjae Jeon      2013-06-16  2306  		goto skip;
696c018c7718f5 Namjae Jeon      2013-06-16  2307  
a7d9fe3c338870 Jaegeuk Kim      2021-05-21  2308  	if (f2fs_sb_has_readonly(sbi) && !(*flags & SB_RDONLY)) {
a7d9fe3c338870 Jaegeuk Kim      2021-05-21  2309  		err = -EROFS;
a7d9fe3c338870 Jaegeuk Kim      2021-05-21  2310  		goto restore_opts;
a7d9fe3c338870 Jaegeuk Kim      2021-05-21  2311  	}
a7d9fe3c338870 Jaegeuk Kim      2021-05-21  2312  
ea6767337f8631 Jaegeuk Kim      2017-10-06  2313  #ifdef CONFIG_QUOTA
1751e8a6cb935e Linus Torvalds   2017-11-27  2314  	if (!f2fs_readonly(sb) && (*flags & SB_RDONLY)) {
0abd675e97e60d Chao Yu          2017-07-09  2315  		err = dquot_suspend(sb, -1);
0abd675e97e60d Chao Yu          2017-07-09  2316  		if (err < 0)
0abd675e97e60d Chao Yu          2017-07-09  2317  			goto restore_opts;
4354994f097d06 Daniel Rosenberg 2018-08-20  2318  	} else if (f2fs_readonly(sb) && !(*flags & SB_RDONLY)) {
0abd675e97e60d Chao Yu          2017-07-09  2319  		/* dquot_resume needs RW */
1751e8a6cb935e Linus Torvalds   2017-11-27  2320  		sb->s_flags &= ~SB_RDONLY;
ea6767337f8631 Jaegeuk Kim      2017-10-06  2321  		if (sb_any_quota_suspended(sb)) {
0abd675e97e60d Chao Yu          2017-07-09  2322  			dquot_resume(sb, -1);
7beb01f74415c5 Chao Yu          2018-10-24  2323  		} else if (f2fs_sb_has_quota_ino(sbi)) {
ea6767337f8631 Jaegeuk Kim      2017-10-06  2324  			err = f2fs_enable_quotas(sb);
ea6767337f8631 Jaegeuk Kim      2017-10-06  2325  			if (err)
ea6767337f8631 Jaegeuk Kim      2017-10-06  2326  				goto restore_opts;
0abd675e97e60d Chao Yu          2017-07-09  2327  		}
ea6767337f8631 Jaegeuk Kim      2017-10-06  2328  	}
ea6767337f8631 Jaegeuk Kim      2017-10-06  2329  #endif
c5bf8348338260 Yangtao Li       2023-02-06  2330  	if (f2fs_lfs_mode(sbi) && !IS_F2FS_IPU_DISABLE(sbi)) {
c5bf8348338260 Yangtao Li       2023-02-06  2331  		err = -EINVAL;
c5bf8348338260 Yangtao Li       2023-02-06  2332  		f2fs_warn(sbi, "LFS is not compatible with IPU");
c5bf8348338260 Yangtao Li       2023-02-06  2333  		goto restore_opts;
c5bf8348338260 Yangtao Li       2023-02-06  2334  	}
c5bf8348338260 Yangtao Li       2023-02-06  2335  
093749e296e29a Chao Yu          2020-08-04  2336  	/* disallow enable atgc dynamically */
093749e296e29a Chao Yu          2020-08-04  2337  	if (no_atgc == !!test_opt(sbi, ATGC)) {
093749e296e29a Chao Yu          2020-08-04  2338  		err = -EINVAL;
093749e296e29a Chao Yu          2020-08-04  2339  		f2fs_warn(sbi, "switch atgc option is not allowed");
093749e296e29a Chao Yu          2020-08-04  2340  		goto restore_opts;
093749e296e29a Chao Yu          2020-08-04  2341  	}
093749e296e29a Chao Yu          2020-08-04  2342  
9cd81ce3c2f01f Chao Yu          2015-09-18  2343  	/* disallow enable/disable extent_cache dynamically */
12607c1ba7637e Jaegeuk Kim      2022-11-30  2344  	if (no_read_extent_cache == !!test_opt(sbi, READ_EXTENT_CACHE)) {
9cd81ce3c2f01f Chao Yu          2015-09-18  2345  		err = -EINVAL;
dcbb4c10e6d969 Joe Perches      2019-06-18  2346  		f2fs_warn(sbi, "switch extent_cache option is not allowed");
9cd81ce3c2f01f Chao Yu          2015-09-18  2347  		goto restore_opts;
9cd81ce3c2f01f Chao Yu          2015-09-18  2348  	}
71644dff481180 Jaegeuk Kim      2022-12-01  2349  	/* disallow enable/disable age extent_cache dynamically */
71644dff481180 Jaegeuk Kim      2022-12-01  2350  	if (no_age_extent_cache == !!test_opt(sbi, AGE_EXTENT_CACHE)) {
71644dff481180 Jaegeuk Kim      2022-12-01  2351  		err = -EINVAL;
71644dff481180 Jaegeuk Kim      2022-12-01  2352  		f2fs_warn(sbi, "switch age_extent_cache option is not allowed");
71644dff481180 Jaegeuk Kim      2022-12-01  2353  		goto restore_opts;
71644dff481180 Jaegeuk Kim      2022-12-01  2354  	}
9cd81ce3c2f01f Chao Yu          2015-09-18  2355  
1f78adfab379e5 Chao Yu          2019-07-12  2356  	if (no_io_align == !!F2FS_IO_ALIGNED(sbi)) {
1f78adfab379e5 Chao Yu          2019-07-12  2357  		err = -EINVAL;
1f78adfab379e5 Chao Yu          2019-07-12  2358  		f2fs_warn(sbi, "switch io_bits option is not allowed");
1f78adfab379e5 Chao Yu          2019-07-12  2359  		goto restore_opts;
1f78adfab379e5 Chao Yu          2019-07-12  2360  	}
1f78adfab379e5 Chao Yu          2019-07-12  2361  
6ce19aff0b8cd3 Chao Yu          2021-05-20  2362  	if (no_compress_cache == !!test_opt(sbi, COMPRESS_CACHE)) {
6ce19aff0b8cd3 Chao Yu          2021-05-20  2363  		err = -EINVAL;
6ce19aff0b8cd3 Chao Yu          2021-05-20  2364  		f2fs_warn(sbi, "switch compress_cache option is not allowed");
6ce19aff0b8cd3 Chao Yu          2021-05-20  2365  		goto restore_opts;
6ce19aff0b8cd3 Chao Yu          2021-05-20  2366  	}
6ce19aff0b8cd3 Chao Yu          2021-05-20  2367  
4f993264fe2965 Chao Yu          2021-08-03  2368  	if (block_unit_discard != f2fs_block_unit_discard(sbi)) {
4f993264fe2965 Chao Yu          2021-08-03  2369  		err = -EINVAL;
4f993264fe2965 Chao Yu          2021-08-03  2370  		f2fs_warn(sbi, "switch discard_unit option is not allowed");
4f993264fe2965 Chao Yu          2021-08-03  2371  		goto restore_opts;
4f993264fe2965 Chao Yu          2021-08-03  2372  	}
4f993264fe2965 Chao Yu          2021-08-03  2373  
fdcaea1b50e37d Yangtao Li       2023-03-01  2374  	if (!cpumask_equal(&F2FS_OPTION(sbi).discard_cpumask,
fdcaea1b50e37d Yangtao Li       2023-03-01  2375  		&old_discard_cpumask)) {
fdcaea1b50e37d Yangtao Li       2023-03-01  2376  		err = -EINVAL;
fdcaea1b50e37d Yangtao Li       2023-03-01  2377  		f2fs_warn(sbi, "switch discard_cpuset option is not allowed");
fdcaea1b50e37d Yangtao Li       2023-03-01  2378  		goto restore_opts;
fdcaea1b50e37d Yangtao Li       2023-03-01  2379  	}
fdcaea1b50e37d Yangtao Li       2023-03-01  2380  
4354994f097d06 Daniel Rosenberg 2018-08-20  2381  	if ((*flags & SB_RDONLY) && test_opt(sbi, DISABLE_CHECKPOINT)) {
4354994f097d06 Daniel Rosenberg 2018-08-20  2382  		err = -EINVAL;
dcbb4c10e6d969 Joe Perches      2019-06-18  2383  		f2fs_warn(sbi, "disabling checkpoint not compatible with read-only");
4354994f097d06 Daniel Rosenberg 2018-08-20  2384  		goto restore_opts;
4354994f097d06 Daniel Rosenberg 2018-08-20  2385  	}
4354994f097d06 Daniel Rosenberg 2018-08-20  2386  
696c018c7718f5 Namjae Jeon      2013-06-16  2387  	/*
696c018c7718f5 Namjae Jeon      2013-06-16  2388  	 * We stop the GC thread if FS is mounted as RO
696c018c7718f5 Namjae Jeon      2013-06-16  2389  	 * or if background_gc = off is passed in mount
696c018c7718f5 Namjae Jeon      2013-06-16  2390  	 * option. Also sync the filesystem.
696c018c7718f5 Namjae Jeon      2013-06-16  2391  	 */
bbbc34fd666254 Chao Yu          2020-02-14  2392  	if ((*flags & SB_RDONLY) ||
5911d2d1d1a38b Chao Yu          2021-03-27  2393  			(F2FS_OPTION(sbi).bggc_mode == BGGC_MODE_OFF &&
5911d2d1d1a38b Chao Yu          2021-03-27  2394  			!test_opt(sbi, GC_MERGE))) {
696c018c7718f5 Namjae Jeon      2013-06-16  2395  		if (sbi->gc_thread) {
4d57b86dd86404 Chao Yu          2018-05-30  2396  			f2fs_stop_gc_thread(sbi);
876dc59eb1f013 Gu Zheng         2014-04-11  2397  			need_restart_gc = true;
696c018c7718f5 Namjae Jeon      2013-06-16  2398  		}
aba291b3d8d839 Chao Yu          2014-11-18  2399  	} else if (!sbi->gc_thread) {
4d57b86dd86404 Chao Yu          2018-05-30  2400  		err = f2fs_start_gc_thread(sbi);
696c018c7718f5 Namjae Jeon      2013-06-16  2401  		if (err)
696c018c7718f5 Namjae Jeon      2013-06-16  2402  			goto restore_opts;
876dc59eb1f013 Gu Zheng         2014-04-11  2403  		need_stop_gc = true;
876dc59eb1f013 Gu Zheng         2014-04-11  2404  	}
876dc59eb1f013 Gu Zheng         2014-04-11  2405  
930e2607638de8 Jaegeuk Kim      2022-04-12  2406  	if (*flags & SB_RDONLY) {
faa0e55bba54b9 Jaegeuk Kim      2016-03-24  2407  		sync_inodes_sb(sb);
faa0e55bba54b9 Jaegeuk Kim      2016-03-24  2408  
faa0e55bba54b9 Jaegeuk Kim      2016-03-24  2409  		set_sbi_flag(sbi, SBI_IS_DIRTY);
faa0e55bba54b9 Jaegeuk Kim      2016-03-24  2410  		set_sbi_flag(sbi, SBI_IS_CLOSE);
faa0e55bba54b9 Jaegeuk Kim      2016-03-24  2411  		f2fs_sync_fs(sb, 1);
faa0e55bba54b9 Jaegeuk Kim      2016-03-24  2412  		clear_sbi_flag(sbi, SBI_IS_CLOSE);
faa0e55bba54b9 Jaegeuk Kim      2016-03-24  2413  	}
faa0e55bba54b9 Jaegeuk Kim      2016-03-24  2414  
3f7070b05052f9 Chao Yu          2021-03-17  2415  	if ((*flags & SB_RDONLY) || test_opt(sbi, DISABLE_CHECKPOINT) ||
3f7070b05052f9 Chao Yu          2021-03-17  2416  			!test_opt(sbi, MERGE_CHECKPOINT)) {
3f7070b05052f9 Chao Yu          2021-03-17  2417  		f2fs_stop_ckpt_thread(sbi);
3fd9735908287c Chao Yu          2021-03-17  2418  		need_restart_ckpt = true;
4354994f097d06 Daniel Rosenberg 2018-08-20  2419  	} else {
4f99484d27961c Jaegeuk Kim      2022-08-18  2420  		/* Flush if the prevous checkpoint, if exists. */
4f99484d27961c Jaegeuk Kim      2022-08-18  2421  		f2fs_flush_ckpt_thread(sbi);
4f99484d27961c Jaegeuk Kim      2022-08-18  2422  
261eeb9c1585de Daeho Jeong      2021-01-19  2423  		err = f2fs_start_ckpt_thread(sbi);
261eeb9c1585de Daeho Jeong      2021-01-19  2424  		if (err) {
261eeb9c1585de Daeho Jeong      2021-01-19  2425  			f2fs_err(sbi,
261eeb9c1585de Daeho Jeong      2021-01-19  2426  			    "Failed to start F2FS issue_checkpoint_thread (%d)",
261eeb9c1585de Daeho Jeong      2021-01-19  2427  			    err);
261eeb9c1585de Daeho Jeong      2021-01-19  2428  			goto restore_gc;
261eeb9c1585de Daeho Jeong      2021-01-19  2429  		}
3fd9735908287c Chao Yu          2021-03-17  2430  		need_stop_ckpt = true;
261eeb9c1585de Daeho Jeong      2021-01-19  2431  	}
261eeb9c1585de Daeho Jeong      2021-01-19  2432  
876dc59eb1f013 Gu Zheng         2014-04-11  2433  	/*
876dc59eb1f013 Gu Zheng         2014-04-11  2434  	 * We stop issue flush thread if FS is mounted as RO
876dc59eb1f013 Gu Zheng         2014-04-11  2435  	 * or if flush_merge is not passed in mount option.
876dc59eb1f013 Gu Zheng         2014-04-11  2436  	 */
1751e8a6cb935e Linus Torvalds   2017-11-27  2437  	if ((*flags & SB_RDONLY) || !test_opt(sbi, FLUSH_MERGE)) {
5eba8c5d1fb3af Jaegeuk Kim      2016-12-07  2438  		clear_opt(sbi, FLUSH_MERGE);
4d57b86dd86404 Chao Yu          2018-05-30  2439  		f2fs_destroy_flush_cmd_control(sbi, false);
3fd9735908287c Chao Yu          2021-03-17  2440  		need_restart_flush = true;
5eba8c5d1fb3af Jaegeuk Kim      2016-12-07  2441  	} else {
4d57b86dd86404 Chao Yu          2018-05-30  2442  		err = f2fs_create_flush_cmd_control(sbi);
2163d19815b3df Gu Zheng         2014-04-27  2443  		if (err)
3fd9735908287c Chao Yu          2021-03-17  2444  			goto restore_ckpt;
3fd9735908287c Chao Yu          2021-03-17  2445  		need_stop_flush = true;
876dc59eb1f013 Gu Zheng         2014-04-11  2446  	}
3fd9735908287c Chao Yu          2021-03-17  2447  
4d67490498acb4 Fengnan Chang    2021-08-19  2448  	if (no_discard == !!test_opt(sbi, DISCARD)) {
4d67490498acb4 Fengnan Chang    2021-08-19  2449  		if (test_opt(sbi, DISCARD)) {
4d67490498acb4 Fengnan Chang    2021-08-19  2450  			err = f2fs_start_discard_thread(sbi);
4d67490498acb4 Fengnan Chang    2021-08-19  2451  			if (err)
4d67490498acb4 Fengnan Chang    2021-08-19  2452  				goto restore_flush;
4d67490498acb4 Fengnan Chang    2021-08-19  2453  			need_stop_discard = true;
4d67490498acb4 Fengnan Chang    2021-08-19  2454  		} else {
4d67490498acb4 Fengnan Chang    2021-08-19  2455  			f2fs_stop_discard_thread(sbi);
4d67490498acb4 Fengnan Chang    2021-08-19  2456  			f2fs_issue_discard_timeout(sbi);
4d67490498acb4 Fengnan Chang    2021-08-19  2457  			need_restart_discard = true;
4d67490498acb4 Fengnan Chang    2021-08-19  2458  		}
4d67490498acb4 Fengnan Chang    2021-08-19  2459  	}
4d67490498acb4 Fengnan Chang    2021-08-19  2460  
277afbde6ca2b3 Chao Yu          2021-07-29  2461  	if (enable_checkpoint == !!test_opt(sbi, DISABLE_CHECKPOINT)) {
3fd9735908287c Chao Yu          2021-03-17  2462  		if (test_opt(sbi, DISABLE_CHECKPOINT)) {
3fd9735908287c Chao Yu          2021-03-17  2463  			err = f2fs_disable_checkpoint(sbi);
3fd9735908287c Chao Yu          2021-03-17  2464  			if (err)
4d67490498acb4 Fengnan Chang    2021-08-19  2465  				goto restore_discard;
3fd9735908287c Chao Yu          2021-03-17  2466  		} else {
3fd9735908287c Chao Yu          2021-03-17  2467  			f2fs_enable_checkpoint(sbi);
3fd9735908287c Chao Yu          2021-03-17  2468  		}
876dc59eb1f013 Gu Zheng         2014-04-11  2469  	}
3fd9735908287c Chao Yu          2021-03-17  2470  
696c018c7718f5 Namjae Jeon      2013-06-16  2471  skip:
4b2414d04e9912 Chao Yu          2017-08-08  2472  #ifdef CONFIG_QUOTA
4b2414d04e9912 Chao Yu          2017-08-08  2473  	/* Release old quota file names */
4b2414d04e9912 Chao Yu          2017-08-08  2474  	for (i = 0; i < MAXQUOTAS; i++)
ba87a45c23d645 Wang Xiaojun     2020-06-17  2475  		kfree(org_mount_opt.s_qf_names[i]);
4b2414d04e9912 Chao Yu          2017-08-08  2476  #endif
696c018c7718f5 Namjae Jeon      2013-06-16  2477  	/* Update the POSIXACL Flag */
1751e8a6cb935e Linus Torvalds   2017-11-27  2478  	sb->s_flags = (sb->s_flags & ~SB_POSIXACL) |
1751e8a6cb935e Linus Torvalds   2017-11-27  2479  		(test_opt(sbi, POSIX_ACL) ? SB_POSIXACL : 0);
df728b0f6954c3 Jaegeuk Kim      2016-03-23  2480  
7e65be49ed94f8 Jaegeuk Kim      2017-12-27  2481  	limit_reserve_root(sbi);
1ae18f71cb5226 Jaegeuk Kim      2020-05-15  2482  	adjust_unusable_cap_perc(sbi);
095680f24f2673 Jaegeuk Kim      2018-09-28  2483  	*flags = (*flags & ~SB_LAZYTIME) | (sb->s_flags & SB_LAZYTIME);
696c018c7718f5 Namjae Jeon      2013-06-16  2484  	return 0;
4d67490498acb4 Fengnan Chang    2021-08-19  2485  restore_discard:
4d67490498acb4 Fengnan Chang    2021-08-19  2486  	if (need_restart_discard) {
4d67490498acb4 Fengnan Chang    2021-08-19  2487  		if (f2fs_start_discard_thread(sbi))
4d67490498acb4 Fengnan Chang    2021-08-19  2488  			f2fs_warn(sbi, "discard has been stopped");
4d67490498acb4 Fengnan Chang    2021-08-19  2489  	} else if (need_stop_discard) {
4d67490498acb4 Fengnan Chang    2021-08-19  2490  		f2fs_stop_discard_thread(sbi);
4d67490498acb4 Fengnan Chang    2021-08-19  2491  	}
3fd9735908287c Chao Yu          2021-03-17  2492  restore_flush:
3fd9735908287c Chao Yu          2021-03-17  2493  	if (need_restart_flush) {
3fd9735908287c Chao Yu          2021-03-17  2494  		if (f2fs_create_flush_cmd_control(sbi))
3fd9735908287c Chao Yu          2021-03-17  2495  			f2fs_warn(sbi, "background flush thread has stopped");
3fd9735908287c Chao Yu          2021-03-17  2496  	} else if (need_stop_flush) {
3fd9735908287c Chao Yu          2021-03-17  2497  		clear_opt(sbi, FLUSH_MERGE);
3fd9735908287c Chao Yu          2021-03-17  2498  		f2fs_destroy_flush_cmd_control(sbi, false);
3fd9735908287c Chao Yu          2021-03-17  2499  	}
3fd9735908287c Chao Yu          2021-03-17  2500  restore_ckpt:
3fd9735908287c Chao Yu          2021-03-17  2501  	if (need_restart_ckpt) {
3fd9735908287c Chao Yu          2021-03-17  2502  		if (f2fs_start_ckpt_thread(sbi))
3fd9735908287c Chao Yu          2021-03-17  2503  			f2fs_warn(sbi, "background ckpt thread has stopped");
3fd9735908287c Chao Yu          2021-03-17  2504  	} else if (need_stop_ckpt) {
3fd9735908287c Chao Yu          2021-03-17  2505  		f2fs_stop_ckpt_thread(sbi);
3fd9735908287c Chao Yu          2021-03-17  2506  	}
876dc59eb1f013 Gu Zheng         2014-04-11  2507  restore_gc:
876dc59eb1f013 Gu Zheng         2014-04-11  2508  	if (need_restart_gc) {
4d57b86dd86404 Chao Yu          2018-05-30  2509  		if (f2fs_start_gc_thread(sbi))
dcbb4c10e6d969 Joe Perches      2019-06-18  2510  			f2fs_warn(sbi, "background gc thread has stopped");
876dc59eb1f013 Gu Zheng         2014-04-11  2511  	} else if (need_stop_gc) {
4d57b86dd86404 Chao Yu          2018-05-30  2512  		f2fs_stop_gc_thread(sbi);
876dc59eb1f013 Gu Zheng         2014-04-11  2513  	}
696c018c7718f5 Namjae Jeon      2013-06-16  2514  restore_opts:
4b2414d04e9912 Chao Yu          2017-08-08  2515  #ifdef CONFIG_QUOTA
63189b785960c3 Chao Yu          2018-03-08  2516  	F2FS_OPTION(sbi).s_jquota_fmt = org_mount_opt.s_jquota_fmt;
4b2414d04e9912 Chao Yu          2017-08-08  2517  	for (i = 0; i < MAXQUOTAS; i++) {
ba87a45c23d645 Wang Xiaojun     2020-06-17  2518  		kfree(F2FS_OPTION(sbi).s_qf_names[i]);
63189b785960c3 Chao Yu          2018-03-08  2519  		F2FS_OPTION(sbi).s_qf_names[i] = org_mount_opt.s_qf_names[i];
4b2414d04e9912 Chao Yu          2017-08-08  2520  	}
4b2414d04e9912 Chao Yu          2017-08-08  2521  #endif
fdcaea1b50e37d Yangtao Li       2023-03-01  2522  	cpumask_copy(&F2FS_OPTION(sbi).discard_cpumask, &old_discard_cpumask);
696c018c7718f5 Namjae Jeon      2013-06-16  2523  	sbi->mount_opt = org_mount_opt;
0abd675e97e60d Chao Yu          2017-07-09  2524  	sb->s_flags = old_sb_flags;
696c018c7718f5 Namjae Jeon      2013-06-16  2525  	return err;
696c018c7718f5 Namjae Jeon      2013-06-16 @2526  }
696c018c7718f5 Namjae Jeon      2013-06-16  2527  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
