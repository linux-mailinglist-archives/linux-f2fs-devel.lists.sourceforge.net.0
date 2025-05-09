Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 45E5AAB0909
	for <lists+linux-f2fs-devel@lfdr.de>; Fri,  9 May 2025 06:05:49 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Subject:MIME-Version:Message-ID:To:From:Date:Sender:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=8XI1rBKGQZNlTLiNenNslfnmFHVN4GzgJjLGGec7R5c=; b=ZwsWw6KxZ+7TL0orJLDavR9Fq3
	thJ+slfEwEK9uT9c9A4NogGVJCvlJnRUjAhbWIlzRhIkE6U8+wvJJ6N+EuCgAHX5BFMqOSF5helxf
	34vSzZs36ylxbw3+Yo8STixzSSOLAdgDoWrkCexE7f2s5hWdntWKTlDC7IRwcWkBVgRE=;
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1uDEzS-0002Sa-Kk;
	Fri, 09 May 2025 04:05:38 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <lkp@intel.com>) id 1uDEzR-0002SU-PL
 for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 09 May 2025 04:05:37 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:MIME-Version:Message-ID:Subject:Cc:To:
 From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=zm2fF3pv3zNn03Ic4+tBrGEIPFKVG9yLq3WpNp/gqVg=; b=LD7aAO4LQocfTc7JJRqcrA5leW
 ALF9yitomLd/hlek+9SwXJduaRKmrn0Ow2tzir6yd6AvsXCJ7XdxuBIKP+AyLNOl20+5k+51LCJLZ
 /H5fF3Huu4pbIfmrGSK7aRYaQ2ofRPQyFWqUdnWt3JW9oA7kieTWjCO7sb/zwvhP5OfE=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:MIME-Version:Message-ID:Subject:Cc:To:From:Date:Sender:
 Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
 :Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=zm2fF3pv3zNn03Ic4+tBrGEIPFKVG9yLq3WpNp/gqVg=; b=H
 L+GiUWNZXO81jbNeyY9b3ug1RSr5Th/3e5hpXKNMS4bnUG3JTaQ+2dHPeuR8lTnADRqagLesEHryr
 S//zbNLlJyg8BSS71j3aQdn9xWj3jFO6AnszFUEXrfgxap5KUu6zAgMfrwjyAiSsOldOU2drgPx2y
 R/e5OrXsT5ubnrQw=;
Received: from mgamail.intel.com ([192.198.163.8])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1uDEzN-0001Oe-Nq for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 09 May 2025 04:05:37 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1746763534; x=1778299534;
 h=date:from:to:cc:subject:message-id:mime-version;
 bh=Jsl2tzX90OD0kcAVU9KYY+pivFFA8MPKP1tFFI8+tiE=;
 b=U7bp3jbbndqcCpdVdspZJapGD/NjJ4wmTWLZcNal7GAuIUY8HiKMlrnU
 gavUXrlBkVrj5F1eKX7lGssZjGDYtM2yw2HUZYfkwod2p7faK7Nl/3RO6
 7WUkhuxtrLKGfdo69rIkhjemRO31JYwdM7WLo9UwCIWb2mmeN4Xb7cb7k
 NoosJ08spYRuamPuWqwd2fwtTd+DesruBkXKq0a6cb2N/VcdVclsh07IF
 uUsVatJH8ul+YFYMXb+tp/BeQBKjWEEbtMN9XXBkIkjoHMoHL2Vg1osU9
 cFw/Wtae7Jel4Tt+pbnRSrUk+Pfza2qpiOuaXM7gfB8J2gG54xUSVqyoZ Q==;
X-CSE-ConnectionGUID: E6UbDgihRkWrsAd4J4geMg==
X-CSE-MsgGUID: DFamEgfPS3CeiNZWYWogzQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11427"; a="66110951"
X-IronPort-AV: E=Sophos;i="6.15,274,1739865600"; d="scan'208";a="66110951"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 May 2025 21:05:23 -0700
X-CSE-ConnectionGUID: 25vJ59ktTyWnH4icfGp2Ng==
X-CSE-MsgGUID: LTiFe6VjQ8iokQLml2MtoQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,274,1739865600"; d="scan'208";a="141456006"
Received: from lkp-server01.sh.intel.com (HELO 1992f890471c) ([10.239.97.150])
 by orviesa004.jf.intel.com with ESMTP; 08 May 2025 21:05:21 -0700
Received: from kbuild by 1992f890471c with local (Exim 4.96)
 (envelope-from <lkp@intel.com>) id 1uDEz9-000BeR-0W;
 Fri, 09 May 2025 04:05:19 +0000
Date: Fri, 9 May 2025 12:05:04 +0800
From: kernel test robot <lkp@intel.com>
To: Hongbo Li <lihongbo22@huawei.com>
Message-ID: <202505091124.QBOZcpKf-lkp@intel.com>
MIME-Version: 1.0
Content-Disposition: inline
X-Spam-Score: -3.9 (---)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: tree:
 https://git.kernel.org/pub/scm/linux/kernel/git/jaegeuk/f2fs.git
 dev-test head: 33605141d92b1eb2a5e625a79abe35856a588662 commit:
 00ed768afb17ecfb7633466256f9f16514e8b421
 [186/188] f2fs: separate [...] 
 Content analysis details:   (-3.9 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 RCVD_IN_VALIDITY_CERTIFIED_BLOCKED RBL: ADMINISTRATOR NOTICE:
 The query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [192.198.163.8 listed in sa-accredit.habeas.com]
 0.0 RCVD_IN_VALIDITY_RPBL_BLOCKED RBL: ADMINISTRATOR NOTICE: The
 query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [192.198.163.8 listed in bl.score.senderscore.com]
 0.0 URIBL_BLOCKED          ADMINISTRATOR NOTICE: The query to URIBL was
 blocked.  See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URIs: 01.org]
 -2.3 RCVD_IN_DNSWL_MED      RBL: Sender listed at https://www.dnswl.org/,
 medium trust [192.198.163.8 listed in list.dnswl.org]
 0.0 T_SPF_TEMPERROR        SPF: test of record failed (temperror)
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -1.4 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1uDEzN-0001Oe-Nq
Subject: [f2fs-dev] [jaegeuk-f2fs:dev-test 186/188]
 include/linux/kern_levels.h:5:25: warning: format '%zu' expects argument of
 type 'size_t', but argument 5 has type 'long unsigned int'
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
 Eric Sandeen <sandeen@redhat.com>, oe-kbuild-all@lists.linux.dev
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/jaegeuk/f2fs.git dev-test
head:   33605141d92b1eb2a5e625a79abe35856a588662
commit: 00ed768afb17ecfb7633466256f9f16514e8b421 [186/188] f2fs: separate the options parsing and options checking
config: i386-buildonly-randconfig-001-20250509 (https://download.01.org/0day-ci/archive/20250509/202505091124.QBOZcpKf-lkp@intel.com/config)
compiler: gcc-11 (Debian 11.3.0-12) 11.3.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250509/202505091124.QBOZcpKf-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202505091124.QBOZcpKf-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from include/linux/printk.h:7,
                    from include/linux/kernel.h:31,
                    from include/linux/cpumask.h:11,
                    from arch/x86/include/asm/cpumask.h:5,
                    from arch/x86/include/asm/msr.h:11,
                    from arch/x86/include/asm/tsc.h:10,
                    from arch/x86/include/asm/timex.h:6,
                    from include/linux/timex.h:67,
                    from include/linux/time32.h:13,
                    from include/linux/time.h:60,
                    from include/linux/stat.h:19,
                    from include/linux/module.h:13,
                    from fs/f2fs/super.c:8:
   fs/f2fs/super.c: In function 'handle_mount_opt':
>> include/linux/kern_levels.h:5:25: warning: format '%zu' expects argument of type 'size_t', but argument 5 has type 'long unsigned int' [-Wformat=]
       5 | #define KERN_SOH        "\001"          /* ASCII Start Of Header */
         |                         ^~~~~~
   include/linux/kern_levels.h:11:25: note: in expansion of macro 'KERN_SOH'
      11 | #define KERN_ERR        KERN_SOH "3"    /* error conditions */
         |                         ^~~~~~~~
   fs/f2fs/f2fs.h:1883:33: note: in expansion of macro 'KERN_ERR'
    1883 |         f2fs_printk(sbi, false, KERN_ERR fmt, ##__VA_ARGS__)
         |                                 ^~~~~~~~
   fs/f2fs/super.c:766:25: note: in expansion of macro 'f2fs_err'
     766 |                         f2fs_err(NULL, "inline xattr size is out of range: %zu ~ %zu",
         |                         ^~~~~~~~


vim +5 include/linux/kern_levels.h

314ba3520e513a Joe Perches 2012-07-30  4  
04d2c8c83d0e3a Joe Perches 2012-07-30 @5  #define KERN_SOH	"\001"		/* ASCII Start Of Header */
04d2c8c83d0e3a Joe Perches 2012-07-30  6  #define KERN_SOH_ASCII	'\001'
04d2c8c83d0e3a Joe Perches 2012-07-30  7  

:::::: The code at line 5 was first introduced by commit
:::::: 04d2c8c83d0e3ac5f78aeede51babb3236200112 printk: convert the format for KERN_<LEVEL> to a 2 byte pattern

:::::: TO: Joe Perches <joe@perches.com>
:::::: CC: Linus Torvalds <torvalds@linux-foundation.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
