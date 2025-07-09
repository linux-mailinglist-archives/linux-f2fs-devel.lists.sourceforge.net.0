Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 2EF08AFDD99
	for <lists+linux-f2fs-devel@lfdr.de>; Wed,  9 Jul 2025 04:42:52 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Subject:In-Reply-To:MIME-Version:References:Message-ID:To:From:Date:Sender:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=B7zFXSoZbYuO+Cj2HqSYZcqS5yXHaJYcpE86lYL+Ij8=; b=N9YMVPm6SHW9NJxopfrAjG4nt7
	M9ruJlXObzrc79rGJNyd2Gzwfo2efXPUN9vF+CVtJ6niwy8/N20q3Y0iplXp7IVzhCksWbj4qzp8F
	sdbdSQA7sqwcPnaibgRCbkpv2uq73Q34bmJrTCgws+7T1v3vWxiJCDoNMRC/Wv1bQkEQ=;
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1uZKlf-0000rG-HR;
	Wed, 09 Jul 2025 02:42:43 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <lkp@intel.com>) id 1uZKld-0000r9-AH
 for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 09 Jul 2025 02:42:41 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=Dddadjzc6vklg6TEvhfw4K2tSgz5pavYZvzo2vTvWtY=; b=KWUrGpiXjBVaHTZwsCm2DYezu+
 Q/7eOvRa8IiMPBu4dqvF3DVFaYm1sFFFDd/z2f+p/D+4vT3Hw3qfeDrv+YX8oHvxsYc3KEABcc3H6
 XEN97C1YjXAksEBC7By6HpYMbPj3pTXrxTskbPly3JWERIHYecGaksLmhIb/BW45V2ok=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=Dddadjzc6vklg6TEvhfw4K2tSgz5pavYZvzo2vTvWtY=; b=kUbj7s2tM/PiLNsMrnpBcMjS0B
 nsTUsQOii/sjiW9MRevzNj5M+KBjCh/xgcl72g1JMv8izrXsVmtnOHdZcAE79Vs9LJd6dUyGqd6c7
 TUVbvkoxdz2sZoT8loDeuNi7vOu0LrrgUUErpmE0C/drxe06HYESO3HUgCHW88xEBD2c=;
Received: from mgamail.intel.com ([192.198.163.8])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1uZKlc-0007Nh-O5 for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 09 Jul 2025 02:42:41 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1752028961; x=1783564961;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=xglNHnUKEdCNHWEZUbyP1kgYRLDTNgnIgCGRAbmV9TY=;
 b=dw5T0honNgbcHSgVLhI5okurUN5hXKafCPqHzdJwJQxhD1YIXy0eVI2h
 F1eUSBQxx1UQx4NR+u3gyO3I84XyXS3RJuNbbL7Y5Aqh8i9HeHk7qMYZg
 2Xpkrpn1e0kuOuRka00BUo8cDqzL8kJsj722v/w/I0VwVLVMP/7JxRZJo
 acGtMIjnXKtskaBFstAaFWrrXePR8pE4fs+jLdevdFhvw+nF8J2a8yQML
 4CDJ/vZVn7X8HHZY4uLPp8G+x2QQNfmJMsJ+S5tWjpk9DBYiiL+lBZN8x
 3Tf+ssC1OVmXIgSjhcea6PGYD+PnflP/he9DWFtKEKvfIJoPF+JyfL9rC g==;
X-CSE-ConnectionGUID: YeI5y3LbQH6PFCVXpGPtlg==
X-CSE-MsgGUID: 2kf1HQczQPqCNaYVvVJ+jg==
X-IronPort-AV: E=McAfee;i="6800,10657,11487"; a="71861559"
X-IronPort-AV: E=Sophos;i="6.16,298,1744095600"; d="scan'208";a="71861559"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Jul 2025 19:42:30 -0700
X-CSE-ConnectionGUID: tytLHidlQRG86rBxSg+7Kw==
X-CSE-MsgGUID: TUVthDdhTX+U4YWnIEJPfw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,298,1744095600"; d="scan'208";a="161204389"
Received: from lkp-server01.sh.intel.com (HELO 9ee84586c615) ([10.239.97.150])
 by fmviesa004.fm.intel.com with ESMTP; 08 Jul 2025 19:42:27 -0700
Received: from kbuild by 9ee84586c615 with local (Exim 4.96)
 (envelope-from <lkp@intel.com>) id 1uZKlN-0002zX-0w;
 Wed, 09 Jul 2025 02:42:25 +0000
Date: Wed, 9 Jul 2025 10:42:13 +0800
From: kernel test robot <lkp@intel.com>
To: Yuwen Chen <ywen.chen@foxmail.com>, tytso@mit.edu,
 adilger.kernel@dilger.ca, jaegeuk@kernel.org, chao@kernel.org,
 viro@zeniv.linux.org.uk, brauner@kernel.org
Message-ID: <202507091026.yb48YXt5-lkp@intel.com>
References: <tencent_0D8BB6ABAB0880DB7BFCCE35EDBC3DCFF505@qq.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <tencent_0D8BB6ABAB0880DB7BFCCE35EDBC3DCFF505@qq.com>
X-Spam-Score: -0.3 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-2.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  Hi Yuwen,
 kernel test robot noticed the following build warnings:
 [auto build test WARNING on jaegeuk-f2fs/dev-test] [also build test WARNING
 on jaegeuk-f2fs/dev brauner-vfs/vfs.all linus/master v6.16-rc5 next-20250708]
 [cannot apply to tytso-ext4/dev] [If your patc [...] 
 Content analysis details:   (-0.3 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 RCVD_IN_DNSWL_BLOCKED  RBL: ADMINISTRATOR NOTICE: The query to DNSWL
 was blocked.  See
 http://wiki.apache.org/spamassassin/DnsBlocklists#DnsBlocklists-dnsbl-block
 for more information. [192.198.163.8 listed in list.dnswl.org]
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1uZKlc-0007Nh-O5
Subject: Re: [f2fs-dev] [PATCH] f2fs: improve the performance of f2fs_lookup
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
 Yuwen Chen <ywen.chen@foxmail.com>, oe-kbuild-all@lists.linux.dev,
 linux-fsdevel@vger.kernel.org, linux-ext4@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

Hi Yuwen,

kernel test robot noticed the following build warnings:

[auto build test WARNING on jaegeuk-f2fs/dev-test]
[also build test WARNING on jaegeuk-f2fs/dev brauner-vfs/vfs.all linus/master v6.16-rc5 next-20250708]
[cannot apply to tytso-ext4/dev]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Yuwen-Chen/f2fs-improve-the-performance-of-f2fs_lookup/20250708-184528
base:   https://git.kernel.org/pub/scm/linux/kernel/git/jaegeuk/f2fs.git dev-test
patch link:    https://lore.kernel.org/r/tencent_0D8BB6ABAB0880DB7BFCCE35EDBC3DCFF505%40qq.com
patch subject: [PATCH] f2fs: improve the performance of f2fs_lookup
config: arc-randconfig-001-20250709 (https://download.01.org/0day-ci/archive/20250709/202507091026.yb48YXt5-lkp@intel.com/config)
compiler: arc-linux-gcc (GCC) 8.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250709/202507091026.yb48YXt5-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202507091026.yb48YXt5-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> Warning: fs/libfs.c:1908 function parameter 'prealloc' not described in 'generic_ci_match'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
