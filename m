Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id EBA9871F811
	for <lists+linux-f2fs-devel@lfdr.de>; Fri,  2 Jun 2023 03:37:14 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1q4tj3-0005vY-7k;
	Fri, 02 Jun 2023 01:37:09 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <lkp@intel.com>) id 1q4tj1-0005vN-Ba
 for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 02 Jun 2023 01:37:07 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=Qs0U0OWznwzQ5S0Gb4KMW1xe5GdGJEFOU+4WuqsG4XA=; b=M/+iyRBbS5KJlYhfx8ximXvKIG
 TjrZPW0BlHoi2vmVRzyIbVlahIr2N8/K4sJVcS4IM70VLjqmpwcqQYWUAqVV6L2GcI9EzAyo/F3oF
 OGV8kiMt6u8AUCUAxCApuHkZsPrEdc191vEQDAHNAwU6YzbzBO45Oer0F3i7dJLc2d8o=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=Qs0U0OWznwzQ5S0Gb4KMW1xe5GdGJEFOU+4WuqsG4XA=; b=ddqofI2QgnfMaQcPoSGdYCfa8f
 WaT0NeZfNSL/Xt9pB23JFmC7/wqTvzQ7FJacBDeOXTZqWcGtsPDBkA5G6FTGiaTrvikw8fEVKMLIw
 OIDut2eFEbQW6PSURzIWsSARst7sZ2Vv4pBVNMFRTVBgCkrAgKCm7r3O3lU9TqJEhkA0=;
Received: from mga17.intel.com ([192.55.52.151])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1q4tiy-0002Yc-0o for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 02 Jun 2023 01:37:07 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1685669824; x=1717205824;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=01GCcuu0HghGwWeCZNHmm9Tq8ORhR7z4ILt07iIC0l8=;
 b=Zcc909KrxQgkQnyZapRhMUj5nVI2w2ioY8/U2Fce8BlivDG6c6w8qYq7
 BOdHoD5mbQ2cUkECxXB+P+wuGPL7nm2KSpptiv1RB0YmIskdT6GUjZFvJ
 7O4aP+n1NWEFtg7/l1Zvuya/meI7SOocbD10lN6Nb5dwe5xT8y67HAziA
 ba+7gqBA8FTko1MdIs+wqysoceAnG0x6wKZK0DbNqadHxeDDmhmCRnh1V
 PGgOngHD+gKYC/tXTzPGvTYwROsCPukQgSQ+KzCD+lsoZ3/dyaww3T1Te
 0CLSpuzm7pdXNtKX3fopX+kezKaLWwzhNBDhFT+wh0t87fjnUOFHwJIJI Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10728"; a="336103240"
X-IronPort-AV: E=Sophos;i="6.00,211,1681196400"; d="scan'208";a="336103240"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Jun 2023 18:36:57 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10728"; a="772677288"
X-IronPort-AV: E=Sophos;i="6.00,211,1681196400"; d="scan'208";a="772677288"
Received: from lkp-server01.sh.intel.com (HELO fb1ced2c09fb) ([10.239.97.150])
 by fmsmga008.fm.intel.com with ESMTP; 01 Jun 2023 18:36:54 -0700
Received: from kbuild by fb1ced2c09fb with local (Exim 4.96)
 (envelope-from <lkp@intel.com>) id 1q4tin-0002t2-1u;
 Fri, 02 Jun 2023 01:36:53 +0000
Date: Fri, 2 Jun 2023 09:36:30 +0800
From: kernel test robot <lkp@intel.com>
To: Jan Kara <jack@suse.cz>, Al Viro <viro@zeniv.linux.org.uk>
Message-ID: <202306020948.TBmCxtVw-lkp@intel.com>
References: <20230601105830.13168-4-jack@suse.cz>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230601105830.13168-4-jack@suse.cz>
X-Spam-Score: -2.7 (--)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  Hi Jan, kernel test robot noticed the following build errors:
 [auto build test ERROR on tytso-ext4/dev] [also build test ERROR on
 jaegeuk-f2fs/dev-test
 jaegeuk-f2fs/dev linus/master v6.4-rc4 next-20230601] [cannot apply to
 vfs-idmapping/for-next] [If your patch [...] 
 Content analysis details:   (-2.7 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -2.3 RCVD_IN_DNSWL_MED      RBL: Sender listed at https://www.dnswl.org/,
 medium trust [192.55.52.151 listed in list.dnswl.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid -0.0 T_SCC_BODY_TEXT_LINE   No description available.
 -0.2 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1q4tiy-0002Yc-0o
Subject: Re: [f2fs-dev] [PATCH v2 4/6] fs: Establish locking order for
 unrelated directories
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
Cc: Christian Brauner <brauner@kernel.org>, Ted Tso <tytso@mit.edu>,
 Miklos Szeredi <miklos@szeredi.hu>, "Darrick J. Wong" <djwong@kernel.org>,
 Jan Kara <jack@suse.cz>, stable@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net, linux-xfs@vger.kernel.org,
 oe-kbuild-all@lists.linux.dev, linux-fsdevel@vger.kernel.org,
 Jaegeuk Kim <jaegeuk@kernel.org>, linux-ext4@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

Hi Jan,

kernel test robot noticed the following build errors:

[auto build test ERROR on tytso-ext4/dev]
[also build test ERROR on jaegeuk-f2fs/dev-test jaegeuk-f2fs/dev linus/master v6.4-rc4 next-20230601]
[cannot apply to vfs-idmapping/for-next]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Jan-Kara/ext4-Remove-ext4-locking-of-moved-directory/20230601-225100
base:   https://git.kernel.org/pub/scm/linux/kernel/git/tytso/ext4.git dev
patch link:    https://lore.kernel.org/r/20230601105830.13168-4-jack%40suse.cz
patch subject: [PATCH v2 4/6] fs: Establish locking order for unrelated directories
config: um-i386_defconfig (https://download.01.org/0day-ci/archive/20230602/202306020948.TBmCxtVw-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build):
        # https://github.com/intel-lab-lkp/linux/commit/234d970a1de0d79e372cc04d6a8112d2aec56c44
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review Jan-Kara/ext4-Remove-ext4-locking-of-moved-directory/20230601-225100
        git checkout 234d970a1de0d79e372cc04d6a8112d2aec56c44
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        make W=1 O=build_dir ARCH=um SUBARCH=i386 olddefconfig
        make W=1 O=build_dir ARCH=um SUBARCH=i386 SHELL=/bin/bash

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202306020948.TBmCxtVw-lkp@intel.com/

All error/warnings (new ones prefixed by >>):

   fs/inode.c: In function 'lock_two_inodes':
>> fs/inode.c:1121:9: warning: this 'if' clause does not guard... [-Wmisleading-indentation]
    1121 |         if (!inode1 || !inode2)
         |         ^~
   fs/inode.c:1129:17: note: ...this statement, but the latter is misleadingly indented as if it were guarded by the 'if'
    1129 |                 goto lock;
         |                 ^~~~
>> fs/inode.c:1129:17: error: label 'lock' used but not defined
   fs/inode.c: At top level:
>> fs/inode.c:1136:9: error: expected identifier or '(' before 'if'
    1136 |         if (S_ISDIR(inode2->i_mode) == S_ISDIR(inode1->i_mode)) {
         |         ^~
>> fs/inode.c:1139:11: error: expected identifier or '(' before 'else'
    1139 |         } else if (!S_ISDIR(inode1->i_mode))
         |           ^~~~
   In file included from include/linux/kernel.h:27,
                    from include/linux/cpumask.h:10,
                    from include/linux/smp.h:13,
                    from include/linux/lockdep.h:14,
                    from include/linux/spinlock.h:63,
                    from include/linux/wait.h:9,
                    from include/linux/wait_bit.h:8,
                    from include/linux/fs.h:6,
                    from fs/inode.c:7:
>> include/linux/minmax.h:167:63: error: expected identifier or '(' before 'while'
     167 |         do { typeof(a) __tmp = (a); (a) = (b); (b) = __tmp; } while (0)
         |                                                               ^~~~~
   fs/inode.c:1140:17: note: in expansion of macro 'swap'
    1140 |                 swap(inode1, inode2);
         |                 ^~~~
>> fs/inode.c:1141:5: error: expected '=', ',', ';', 'asm' or '__attribute__' before ':' token
    1141 | lock:
         |     ^
   fs/inode.c:1144:9: error: expected identifier or '(' before 'if'
    1144 |         if (inode2 && inode2 != inode1)
         |         ^~
>> fs/inode.c:1146:1: error: expected identifier or '(' before '}' token
    1146 | }
         | ^


vim +/lock +1129 fs/inode.c

  1105	
  1106	/**
  1107	 * lock_two_inodes - lock two inodes (may be regular files but also dirs)
  1108	 *
  1109	 * Lock any non-NULL argument. The caller must make sure that if he is passing
  1110	 * in two directories, one is not ancestor of the other.  Zero, one or two
  1111	 * objects may be locked by this function.
  1112	 *
  1113	 * @inode1: first inode to lock
  1114	 * @inode2: second inode to lock
  1115	 * @subclass1: inode lock subclass for the first lock obtained
  1116	 * @subclass2: inode lock subclass for the second lock obtained
  1117	 */
  1118	void lock_two_inodes(struct inode *inode1, struct inode *inode2,
  1119			     unsigned subclass1, unsigned subclass2)
  1120	{
> 1121		if (!inode1 || !inode2)
  1122			/*
  1123			 * Make sure @subclass1 will be used for the acquired lock.
  1124			 * This is not strictly necessary (no current caller cares) but
  1125			 * let's keep things consistent.
  1126			 */
  1127			if (!inode1)
  1128				swap(inode1, inode2);
> 1129			goto lock;
  1130		}
  1131	
  1132		/*
  1133		 * If one object is directory and the other is not, we must make sure
  1134		 * to lock directory first as the other object may be its child.
  1135		 */
> 1136		if (S_ISDIR(inode2->i_mode) == S_ISDIR(inode1->i_mode)) {
  1137			if (inode1 > inode2)
  1138				swap(inode1, inode2);
> 1139		} else if (!S_ISDIR(inode1->i_mode))
  1140			swap(inode1, inode2);
> 1141	lock:
  1142		if (inode1)
  1143			inode_lock_nested(inode1, subclass1);
  1144		if (inode2 && inode2 != inode1)
  1145			inode_lock_nested(inode2, subclass2);
> 1146	}
  1147	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
