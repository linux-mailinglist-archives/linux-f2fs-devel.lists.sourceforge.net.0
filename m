Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id AE84174E046
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 10 Jul 2023 23:33:47 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1qIyVn-0001jc-80;
	Mon, 10 Jul 2023 21:33:40 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <lkp@intel.com>) id 1qIyVl-0001jW-PW
 for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 10 Jul 2023 21:33:38 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:MIME-Version:Message-ID:Subject:Cc:To:
 From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=qFZABpn3SslKxyGwneojElQRWTUJcXCXtThSUoZbr88=; b=ADNFuq8DGgB1poKg1b2mppjcD6
 fCwGk8R85fmEEf4uzNapFkF3wWlzIPUHipGTyoi4irK3H/EOXJuPy0d4DNq3dA4iRshe5wHxMpu7k
 1dZjJU54xzDkC6zNtPdCo5Ghx8Lq1Qx7qM5IkT3GtuFVmK2c8zc0a2+uPmuBa1PC3WXM=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:MIME-Version:Message-ID:Subject:Cc:To:From:Date:Sender:
 Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
 :Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=qFZABpn3SslKxyGwneojElQRWTUJcXCXtThSUoZbr88=; b=j
 y7Sd56u21E0yLnIsaZicETHhcAYH/2BVWEbRzxf+btppnkfqyYuG6FRh6WWYLSdzYfulMZehogv6G
 /hBWZSRBdPFuGzGbb4cCX/qMdYEauFb2NJUOamgqnGaN/nwzjiafEdzATEJrC41YbDP7LyaV0yJ6n
 B1TxjbELHCLJvNaA=;
Received: from mga03.intel.com ([134.134.136.65])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1qIyVk-003hCz-Iq for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 10 Jul 2023 21:33:38 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1689024816; x=1720560816;
 h=date:from:to:cc:subject:message-id:mime-version;
 bh=Kb2rc3LY9QiBnaOXj6f06OeidL9rzaYUAi7KLEwieJc=;
 b=AjJSiNEOb7YyRbj+2fCcm4vykIQmh4A3e6r66hfeOWaOFj9wdnYJWTiY
 zwubqzMRghoai70H3xHTCUUoFE1iFxC2fArosHMyckFvjyqEWONApcUr/
 L6VVXPcrJLDsSHxiJQGLSCff+JWbZ5QhZCOISP09kOxcSlHmBRGQA1PXR
 nGb/t+lX/oBze8t3msFmc/XNRZWs3IzUqQ4sLW/vPrS4pgbarulKMaVK8
 7d27AdfVCjwwqGhogGbmuLxVwxlgNlMUvcQbAJSKI23UquEI+VtVq3xbq
 vwnHAaSN+ACj9/2FWRTDYid0fudjdhnjk6tDmP4AXIk1OmT4xGeqJCRIS g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10767"; a="367958142"
X-IronPort-AV: E=Sophos;i="6.01,195,1684825200"; d="scan'208";a="367958142"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Jul 2023 14:33:30 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10767"; a="671121006"
X-IronPort-AV: E=Sophos;i="6.01,195,1684825200"; d="scan'208";a="671121006"
Received: from lkp-server01.sh.intel.com (HELO c544d7fc5005) ([10.239.97.150])
 by orsmga003.jf.intel.com with ESMTP; 10 Jul 2023 14:33:29 -0700
Received: from kbuild by c544d7fc5005 with local (Exim 4.96)
 (envelope-from <lkp@intel.com>) id 1qIyVc-00041M-1S;
 Mon, 10 Jul 2023 21:33:28 +0000
Date: Tue, 11 Jul 2023 05:33:11 +0800
From: kernel test robot <lkp@intel.com>
To: Christoph Hellwig <hch@lst.de>
Message-ID: <202307110542.NBAMyZxE-lkp@intel.com>
MIME-Version: 1.0
Content-Disposition: inline
X-Spam-Score: -3.2 (---)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: tree:
 https://git.kernel.org/pub/scm/linux/kernel/git/jaegeuk/f2fs.git
 dev-test head: d73b38253cda925126fc85e32277fbe2f1b100bf commit:
 2031cbae1532cadb0838ebc1fecbfd14698b5a0a
 [5/6] f2fs: don't reopen [...] 
 Content analysis details:   (-3.2 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [134.134.136.65 listed in wl.mailspike.net]
 -2.3 RCVD_IN_DNSWL_MED      RBL: Sender listed at https://www.dnswl.org/,
 medium trust [134.134.136.65 listed in list.dnswl.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid -0.7 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1qIyVk-003hCz-Iq
Subject: [f2fs-dev] [jaegeuk-f2fs:dev-test 5/6] fs/f2fs/super.c:1563:17:
 error: no member named 'blkz_seq' in 'struct f2fs_dev_info'
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
 linux-f2fs-devel@lists.sourceforge.net, oe-kbuild-all@lists.linux.dev
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/jaegeuk/f2fs.git dev-test
head:   d73b38253cda925126fc85e32277fbe2f1b100bf
commit: 2031cbae1532cadb0838ebc1fecbfd14698b5a0a [5/6] f2fs: don't reopen the main block device in f2fs_scan_devices
config: x86_64-rhel-8.3-rust (https://download.01.org/0day-ci/archive/20230711/202307110542.NBAMyZxE-lkp@intel.com/config)
compiler: clang version 15.0.7 (https://github.com/llvm/llvm-project.git 8dfdcc7b7bf66834a761bd8de445840ef68e4d1a)
reproduce: (https://download.01.org/0day-ci/archive/20230711/202307110542.NBAMyZxE-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202307110542.NBAMyZxE-lkp@intel.com/

All errors (new ones prefixed by >>):

>> fs/f2fs/super.c:1563:17: error: no member named 'blkz_seq' in 'struct f2fs_dev_info'
           kvfree(FDEV(0).blkz_seq);
                  ~~~~~~~ ^
   1 error generated.


vim +1563 fs/f2fs/super.c

  1558	
  1559	static void destroy_device_list(struct f2fs_sb_info *sbi)
  1560	{
  1561		int i;
  1562	
> 1563		kvfree(FDEV(0).blkz_seq);
  1564		for (i = 1; i < sbi->s_ndevs; i++) {
  1565			blkdev_put(FDEV(i).bdev, sbi->sb->s_type);
  1566	#ifdef CONFIG_BLK_DEV_ZONED
  1567			kvfree(FDEV(i).blkz_seq);
  1568	#endif
  1569		}
  1570		kvfree(sbi->devs);
  1571	}
  1572	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
