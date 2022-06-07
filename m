Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id A981D53F76E
	for <lists+linux-f2fs-devel@lfdr.de>; Tue,  7 Jun 2022 09:41:15 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.94.2)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1nyTpw-0006jX-4B; Tue, 07 Jun 2022 07:41:13 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <lkp@intel.com>) id 1nyTpr-0006jQ-2X
 for linux-f2fs-devel@lists.sourceforge.net; Tue, 07 Jun 2022 07:41:09 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:MIME-Version:Message-ID:Subject:Cc:To:
 From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=1AyLDmVWepWhZ40cNW3RGgLSCsAy0s+ojliK3ufC17I=; b=VWsKAtrUm1J5Ck0VQqFvzeIZw7
 JWhQ4ApWUS3sng/dKwPca8rde6Y8DYUlqtnsCzRwErA5u9Meao5bMvPsoguHDJbik6uIVphqXZEE5
 fLH/4vWTql4IYtBxcVmGzTM8qVfkFxzbQjp0m/Baw00Ks+9mg8BYt+iNh/cIKP2wLwgI=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:MIME-Version:Message-ID:Subject:Cc:To:From:Date:Sender:
 Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
 :Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=1AyLDmVWepWhZ40cNW3RGgLSCsAy0s+ojliK3ufC17I=; b=K
 ZUux4t9nbeME7XRULjyif77/mew3qnLsgw5ZjQovksdrWEGcWfqVd7A1yE1uSyVR1QP2alAAQ/lGj
 j/v9ho7SqNzsu1QK/TGHxgatuA4ES89Q36C+2ge7b9pFsHpryTYeIC3G2rdUACXDmPGk2rP5FiNO8
 nA81lfhkZDvGwM38=;
Received: from mga01.intel.com ([192.55.52.88])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.94.2)
 id 1nyTpj-00088w-4j
 for linux-f2fs-devel@lists.sourceforge.net; Tue, 07 Jun 2022 07:41:07 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1654587660; x=1686123660;
 h=date:from:to:cc:subject:message-id:mime-version;
 bh=B+WYoP6Zk3TaibE1wctiooiWrRYzinG+AW1DrGNq9DM=;
 b=jTRPATNbNIzoqdFD6LXY+1CaEizIzudtOFV/DmQ9njo9GAoVC+/qpmdT
 V3qLbvbqrythA2kzW2S4eQcx6HEIX8RVaR9O9PamzdjDOzUklnyKjcwxV
 A5Gh8+2KO8/Gf2lYlUTsz4JHcFSIgaVDgxPaw285kkH3l63BCs65IBb12
 oCFJbsiLbTWpKIhAqZF5QH2qsrsvsp/c8JM3L14xDPVziFzBKB8M3gRhs
 AOWQnxZkAPhX7uWqAT4qE5cwppK5ni/plcCKH21j5UhRAUu5ODxeDcyYF
 Clg3mDGjlbdOVsars0v4Y1bKLMyneeQtfmLDzoetSLCBMSsncbmhjKeef g==;
X-IronPort-AV: E=McAfee;i="6400,9594,10370"; a="302073048"
X-IronPort-AV: E=Sophos;i="5.91,283,1647327600"; d="scan'208";a="302073048"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Jun 2022 00:40:50 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.91,283,1647327600"; d="scan'208";a="636004037"
Received: from lkp-server01.sh.intel.com (HELO 60dabacc1df6) ([10.239.97.150])
 by fmsmga008.fm.intel.com with ESMTP; 07 Jun 2022 00:40:47 -0700
Received: from kbuild by 60dabacc1df6 with local (Exim 4.95)
 (envelope-from <lkp@intel.com>) id 1nyTpW-000DTx-Aa;
 Tue, 07 Jun 2022 07:40:46 +0000
Date: Tue, 7 Jun 2022 15:40:21 +0800
From: kernel test robot <lkp@intel.com>
To: Jack Qiu via Linux-f2fs-devel <linux-f2fs-devel@lists.sourceforge.net>
Message-ID: <202206071533.vc9l1Css-lkp@intel.com>
MIME-Version: 1.0
Content-Disposition: inline
X-Spam-Score: -5.2 (-----)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: tree:
 https://git.kernel.org/pub/scm/linux/kernel/git/jaegeuk/f2fs.git
 dev-test head: 7f7c4d65019e9c82538b92ec5df2e4f0c6765998 commit:
 7f7c4d65019e9c82538b92ec5df2e4f0c6765998
 [2/2] f2fs: optimize err [...] 
 Content analysis details:   (-5.2 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 RCVD_IN_MSPIKE_H3      RBL: Good reputation (+3)
 [192.55.52.88 listed in wl.mailspike.net]
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [192.55.52.88 listed in list.dnswl.org]
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
 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
X-Headers-End: 1nyTpj-00088w-4j
Subject: [f2fs-dev] [jaegeuk-f2fs:dev-test 2/2] fs/f2fs/file.c:3908:15:
 error: use of undeclared identifier 'sbi'
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
Cc: llvm@lists.linux.dev, kbuild-all@lists.01.org, Chao Yu <yuchao0@huawei.com>,
 linux-f2fs-devel@lists.sourceforge.net, Jaegeuk Kim <jaegeuk@kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/jaegeuk/f2fs.git dev-test
head:   7f7c4d65019e9c82538b92ec5df2e4f0c6765998
commit: 7f7c4d65019e9c82538b92ec5df2e4f0c6765998 [2/2] f2fs: optimize error handling in redirty_blocks
config: i386-randconfig-a002 (https://download.01.org/0day-ci/archive/20220607/202206071533.vc9l1Css-lkp@intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project b92436efcb7813fc481b30f2593a4907568d917a)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://git.kernel.org/pub/scm/linux/kernel/git/jaegeuk/f2fs.git/commit/?id=7f7c4d65019e9c82538b92ec5df2e4f0c6765998
        git remote add jaegeuk-f2fs https://git.kernel.org/pub/scm/linux/kernel/git/jaegeuk/f2fs.git
        git fetch --no-tags jaegeuk-f2fs dev-test
        git checkout 7f7c4d65019e9c82538b92ec5df2e4f0c6765998
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=i386 SHELL=/bin/bash fs/f2fs/

If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>

All errors (new ones prefixed by >>):

>> fs/f2fs/file.c:3908:15: error: use of undeclared identifier 'sbi'
                   f2fs_bug_on(sbi, !page);
                               ^
   1 error generated.


vim +/sbi +3908 fs/f2fs/file.c

  3884	
  3885	static int redirty_blocks(struct inode *inode, pgoff_t page_idx, int len)
  3886	{
  3887		DEFINE_READAHEAD(ractl, NULL, NULL, inode->i_mapping, page_idx);
  3888		struct address_space *mapping = inode->i_mapping;
  3889		struct page *page;
  3890		pgoff_t redirty_idx = page_idx;
  3891		int i, page_len = 0, ret = 0;
  3892	
  3893		page_cache_ra_unbounded(&ractl, len, 0);
  3894	
  3895		for (i = 0; i < len; i++, page_idx++) {
  3896			page = read_cache_page(mapping, page_idx, NULL, NULL);
  3897			if (IS_ERR(page)) {
  3898				ret = PTR_ERR(page);
  3899				break;
  3900			}
  3901			page_len++;
  3902		}
  3903	
  3904		for (i = 0; i < page_len; i++, redirty_idx++) {
  3905			page = find_lock_page(mapping, redirty_idx);
  3906	
  3907			/* It will never fail, when page has pinned above */
> 3908			f2fs_bug_on(sbi, !page);
  3909	
  3910			set_page_dirty(page);
  3911			f2fs_put_page(page, 1);
  3912			f2fs_put_page(page, 0);
  3913		}
  3914	
  3915		return ret;
  3916	}
  3917	

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
