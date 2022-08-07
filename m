Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id D895958BA3A
	for <lists+linux-f2fs-devel@lfdr.de>; Sun,  7 Aug 2022 10:30:02 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.94.2)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1oKbfV-0001YF-PR; Sun, 07 Aug 2022 08:29:54 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <lkp@intel.com>) id 1oKbfG-0001Xs-0p
 for linux-f2fs-devel@lists.sourceforge.net; Sun, 07 Aug 2022 08:29:40 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=pkwTUGcLWmSCoL1Q0M78W4FQl27OGzrvpaeGW11/tCc=; b=AsNa0yYFDhjZzC7m8WoSNsb9K5
 wgA2GnzOph/Iyhl+fPxyo/BlFxPWyVwDUF83r+ME25YB4eXIKOMhvCviiZqizqoEI5vYU0tFFtrdQ
 PdEXKQcEpdLjnxX/gZXLPVmbxtCdmRtVBf2dGA6iz90xHctPRJuU4Oc01g8YCGOIl2b8=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=pkwTUGcLWmSCoL1Q0M78W4FQl27OGzrvpaeGW11/tCc=; b=dRzxk7hL2okWaTfgpMNU/yMJhG
 LDYratgJT8YRcAItI6ijIi3zf9cU2mvt/gzBkTSsFghHfV+ikjcoFDm+m2CjUiK4yPxa/JN5w0m86
 rRWuWcAcaiT19SZJg+ay2vcGo9Keym1Rn/EYcohgJCopkrFf4N/S6FP3JTiJP56GKXHA=;
Received: from mga12.intel.com ([192.55.52.136])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.94.2)
 id 1oKbfD-006YV9-1S
 for linux-f2fs-devel@lists.sourceforge.net; Sun, 07 Aug 2022 08:29:38 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1659860975; x=1691396975;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=jhs/4HQpgEECO1zoH2jpvSGy5xuBWQgxs4vDl/E5W8Y=;
 b=H6EHjq2rlBvuOlH0CyaE9lA0DfP9XKPQNKltNcdDYZf0P3CvLePo0VMl
 mx4vCuzt+OZFckzShsGFbZmZCoB3M99VIbx9LxIkXdC8p9poRmSnFlC1M
 OOdcztS8QAT07odxJeB0/wO1Wc3Q9lWOWkLkjBicyltp/hx3XeTE2j1jG
 KAmb0J4Pdw+4ERpnZTGUSyj6hmjU7pywuZoP4bYRhMdVpiU8fx0c68JN4
 tqzBqxeXnJyGdEu8ZkfLJgwraeWWFHZO2yYGziw12Ikfuis+APuOT+EAy
 tEpaymvcyNo/lBzCNTkYdfzO6myc39mkBw8kY/Jw3zFCBoUPyY9V12nsa w==;
X-IronPort-AV: E=McAfee;i="6400,9594,10431"; a="270195829"
X-IronPort-AV: E=Sophos;i="5.93,219,1654585200"; d="scan'208";a="270195829"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Aug 2022 01:29:28 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.93,219,1654585200"; d="scan'208";a="693431170"
Received: from lkp-server01.sh.intel.com (HELO e0eace57cfef) ([10.239.97.150])
 by FMSMGA003.fm.intel.com with ESMTP; 07 Aug 2022 01:29:26 -0700
Received: from kbuild by e0eace57cfef with local (Exim 4.96)
 (envelope-from <lkp@intel.com>) id 1oKbf4-000L9d-0J;
 Sun, 07 Aug 2022 08:29:26 +0000
Date: Sun, 7 Aug 2022 16:29:05 +0800
From: kernel test robot <lkp@intel.com>
To: studentxswpy@163.com, jaegeuk@kernel.org, chao@kernel.org,
 linux-f2fs-devel@lists.sourceforge.net, linux-kernel@vger.kernel.org
Message-ID: <202208071655.jHZ9QodB-lkp@intel.com>
References: <20220801092202.3134668-1-studentxswpy@163.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220801092202.3134668-1-studentxswpy@163.com>
X-Spam-Score: -3.2 (---)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  Hi, Thank you for the patch! Perhaps something to improve:
 [auto build test WARNING on next-20220728] 
 Content analysis details:   (-3.2 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -2.3 RCVD_IN_DNSWL_MED      RBL: Sender listed at https://www.dnswl.org/,
 medium trust [192.55.52.136 listed in list.dnswl.org]
 -0.0 SPF_HELO_PASS          SPF: HELO matches SPF record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.7 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1oKbfD-006YV9-1S
Subject: Re: [f2fs-dev] [PATCH -next] f2fs: Replace kmalloc() with
 f2fs_kmalloc
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
Cc: Hacash Robot <hacashRobot@santino.com>, Xie Shaowen <studentxswpy@163.com>,
 kbuild-all@lists.01.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

Hi,

Thank you for the patch! Perhaps something to improve:

[auto build test WARNING on next-20220728]

url:    https://github.com/intel-lab-lkp/linux/commits/studentxswpy-163-com/f2fs-Replace-kmalloc-with-f2fs_kmalloc/20220801-172502
base:    7c5e07b73ff3011c9b82d4a3286a3362b951ad2b
config: i386-allyesconfig (https://download.01.org/0day-ci/archive/20220807/202208071655.jHZ9QodB-lkp@intel.com/config)
compiler: gcc-11 (Debian 11.3.0-3) 11.3.0
reproduce (this is a W=1 build):
        # https://github.com/intel-lab-lkp/linux/commit/ca9f7259448a8dc0a2c4a1ae0a34a8109df4d6e1
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review studentxswpy-163-com/f2fs-Replace-kmalloc-with-f2fs_kmalloc/20220801-172502
        git checkout ca9f7259448a8dc0a2c4a1ae0a34a8109df4d6e1
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        make W=1 O=build_dir ARCH=i386 SHELL=/bin/bash fs/f2fs/

If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>

All warnings (new ones prefixed by >>):

   fs/f2fs/dir.c: In function 'f2fs_match_ci_name':
>> fs/f2fs/dir.c:235:52: warning: passing argument 1 of 'f2fs_kmalloc' makes pointer from integer without a cast [-Wint-conversion]
     235 |                 decrypted_name.name = f2fs_kmalloc(de_name_len, GFP_KERNEL);
         |                                                    ^~~~~~~~~~~
         |                                                    |
         |                                                    u32 {aka unsigned int}
   In file included from fs/f2fs/dir.c:13:
   fs/f2fs/f2fs.h:3316:55: note: expected 'struct f2fs_sb_info *' but argument is of type 'u32' {aka 'unsigned int'}
    3316 | static inline void *f2fs_kmalloc(struct f2fs_sb_info *sbi,
         |                                  ~~~~~~~~~~~~~~~~~~~~~^~~
   fs/f2fs/dir.c:235:39: error: too few arguments to function 'f2fs_kmalloc'
     235 |                 decrypted_name.name = f2fs_kmalloc(de_name_len, GFP_KERNEL);
         |                                       ^~~~~~~~~~~~
   In file included from fs/f2fs/dir.c:13:
   fs/f2fs/f2fs.h:3316:21: note: declared here
    3316 | static inline void *f2fs_kmalloc(struct f2fs_sb_info *sbi,
         |                     ^~~~~~~~~~~~


vim +/f2fs_kmalloc +235 fs/f2fs/dir.c

   211	
   212	#if IS_ENABLED(CONFIG_UNICODE)
   213	/*
   214	 * Test whether a case-insensitive directory entry matches the filename
   215	 * being searched for.
   216	 *
   217	 * Returns 1 for a match, 0 for no match, and -errno on an error.
   218	 */
   219	static int f2fs_match_ci_name(const struct inode *dir, const struct qstr *name,
   220				       const u8 *de_name, u32 de_name_len)
   221	{
   222		const struct super_block *sb = dir->i_sb;
   223		const struct unicode_map *um = sb->s_encoding;
   224		struct fscrypt_str decrypted_name = FSTR_INIT(NULL, de_name_len);
   225		struct qstr entry = QSTR_INIT(de_name, de_name_len);
   226		int res;
   227	
   228		if (IS_ENCRYPTED(dir)) {
   229			const struct fscrypt_str encrypted_name =
   230				FSTR_INIT((u8 *)de_name, de_name_len);
   231	
   232			if (WARN_ON_ONCE(!fscrypt_has_encryption_key(dir)))
   233				return -EINVAL;
   234	
 > 235			decrypted_name.name = f2fs_kmalloc(de_name_len, GFP_KERNEL);
   236			if (!decrypted_name.name)
   237				return -ENOMEM;
   238			res = fscrypt_fname_disk_to_usr(dir, 0, 0, &encrypted_name,
   239							&decrypted_name);
   240			if (res < 0)
   241				goto out;
   242			entry.name = decrypted_name.name;
   243			entry.len = decrypted_name.len;
   244		}
   245	
   246		res = utf8_strncasecmp_folded(um, name, &entry);
   247		/*
   248		 * In strict mode, ignore invalid names.  In non-strict mode,
   249		 * fall back to treating them as opaque byte sequences.
   250		 */
   251		if (res < 0 && !sb_has_strict_encoding(sb)) {
   252			res = name->len == entry.len &&
   253					memcmp(name->name, entry.name, name->len) == 0;
   254		} else {
   255			/* utf8_strncasecmp_folded returns 0 on match */
   256			res = (res == 0);
   257		}
   258	out:
   259		kfree(decrypted_name.name);
   260		return res;
   261	}
   262	#endif /* CONFIG_UNICODE */
   263	

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
