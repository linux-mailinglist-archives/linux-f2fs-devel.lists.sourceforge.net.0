Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C8F16E5B7E
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 18 Apr 2023 10:03:47 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-3.v29.lw.sourceforge.com)
	by sfs-ml-3.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1pogJR-0001Ra-6D;
	Tue, 18 Apr 2023 08:03:40 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-3.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <lkp@intel.com>) id 1pogJP-0001RT-OX
 for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 18 Apr 2023 08:03:38 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:MIME-Version:Message-ID:Subject:Cc:To:
 From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=ewYHF5lDDFgbvB5HTJASHQepdiZsG+YogPXoIEBnrp8=; b=DciiFIhfQgz+x3r8hrCb2n2FmM
 L5b+IOtkT6mPnmLMc90iVLd165xx/g9968TiZw1QgKV06sAn6jupwFaiWMbKt8JTOcD1vwZmBhiqi
 3P5sLrz8WV3DaFzRyhbNzGJZvJHxOhTvqVWrdVc8dfkiO5HgqqGG68Qi9Z6RUzy9TwKY=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:MIME-Version:Message-ID:Subject:Cc:To:From:Date:Sender:
 Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
 :Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=ewYHF5lDDFgbvB5HTJASHQepdiZsG+YogPXoIEBnrp8=; b=V
 +v/LXcQ/TI8wE2oIg4FNMaPTLjNXtNkNofBkqhsOQDvZlRIrdc6Rc4/P6jSkSKsp6oK165WjIeTWy
 +Q5KU1ckCUjSioyt1xvBzRttBJXk66ju68FKENBsivty1qEiqspNVtGVZDj0qGEzseR5LbR86ROB1
 DnK2+0oVbr4oxpyE=;
Received: from mga04.intel.com ([192.55.52.120])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1pogJN-0000Uq-0W for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 18 Apr 2023 08:03:38 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1681805017; x=1713341017;
 h=date:from:to:cc:subject:message-id:mime-version;
 bh=3gvt0Cr3iK9FcuX33wgyb3BC3sOttQXdFu65w04jc1U=;
 b=fWUo9pQXCSKMSPh92EIo+g131aMQBjkyLDzV7e/unrnnSLhYUvCoeP5d
 9li++zsWp2GwnaSyZryqgxqv1YtYQtcztWcLwwj9tmXF1ijhxGgTFqW2I
 Yd86kn7rbHiMr6bTwcSViGT0RnZ1AxVgCW5oDWj9+x2IbMxzOZRCMbWry
 feFyaNZdo4sgYAnS1tQF8xoKd1N041qonJ0p9Ep4RC/2gy2jBimcyD03d
 IurUJYpJghv9ts/B3pSCGxJ6TVGH/bmDRZ4VEyYmdk+X1fARe6dnba8m5
 bYUTcGKOIzRR70o1Odr40nRMFrWVYTXSS+1n0FpmolTg6usf0V1sSUkPr A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10683"; a="343858971"
X-IronPort-AV: E=Sophos;i="5.99,206,1677571200"; d="scan'208";a="343858971"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Apr 2023 01:03:29 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10683"; a="693539353"
X-IronPort-AV: E=Sophos;i="5.99,206,1677571200"; d="scan'208";a="693539353"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
 by fmsmga007.fm.intel.com with ESMTP; 18 Apr 2023 01:03:27 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
 (envelope-from <lkp@intel.com>) id 1pogJC-000d8h-1V;
 Tue, 18 Apr 2023 08:03:26 +0000
Date: Tue, 18 Apr 2023 16:03:01 +0800
From: kernel test robot <lkp@intel.com>
To: Jaegeuk Kim <jaegeuk@kernel.org>
Message-ID: <202304181512.3CpLfgBe-lkp@intel.com>
MIME-Version: 1.0
Content-Disposition: inline
X-Spam-Score: -2.5 (--)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: tree:
 https://git.kernel.org/pub/scm/linux/kernel/git/jaegeuk/f2fs.git
 dev-test head: 07717639336b495e1115e95824031643363d0276 commit:
 07717639336b495e1115e95824031643363d0276
 [49/49] f2fs: remove pow [...] 
 Content analysis details:   (-2.5 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -2.3 RCVD_IN_DNSWL_MED      RBL: Sender listed at https://www.dnswl.org/,
 medium trust [192.55.52.120 listed in list.dnswl.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.0 T_SCC_BODY_TEXT_LINE   No description available.
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1pogJN-0000Uq-0W
Subject: [f2fs-dev] [jaegeuk-f2fs:dev-test 49/49] ld.lld: error: undefined
 symbol: __hexagon_udivdi3
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
Cc: llvm@lists.linux.dev, linux-f2fs-devel@lists.sourceforge.net,
 oe-kbuild-all@lists.linux.dev
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/jaegeuk/f2fs.git dev-test
head:   07717639336b495e1115e95824031643363d0276
commit: 07717639336b495e1115e95824031643363d0276 [49/49] f2fs: remove power-of-two limitation fo zoned device
config: hexagon-randconfig-r012-20230416 (https://download.01.org/0day-ci/archive/20230418/202304181512.3CpLfgBe-lkp@intel.com/config)
compiler: clang version 17.0.0 (https://github.com/llvm/llvm-project 437b7602e4a998220871de78afcb020b9c14a661)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://git.kernel.org/pub/scm/linux/kernel/git/jaegeuk/f2fs.git/commit/?id=07717639336b495e1115e95824031643363d0276
        git remote add jaegeuk-f2fs https://git.kernel.org/pub/scm/linux/kernel/git/jaegeuk/f2fs.git
        git fetch --no-tags jaegeuk-f2fs dev-test
        git checkout 07717639336b495e1115e95824031643363d0276
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=hexagon olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=hexagon SHELL=/bin/bash

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202304181512.3CpLfgBe-lkp@intel.com/

All errors (new ones prefixed by >>):

>> ld.lld: error: undefined symbol: __hexagon_udivdi3
   >>> referenced by super.c
   >>>               fs/f2fs/super.o:(f2fs_scan_devices) in archive vmlinux.a
   >>> referenced by super.c
   >>>               fs/f2fs/super.o:(f2fs_scan_devices) in archive vmlinux.a
   >>> did you mean: __hexagon_udivsi3
   >>> defined in: vmlinux.a(arch/hexagon/lib/udivsi3.o)
--
>> ld.lld: error: undefined symbol: __hexagon_divdi3
   >>> referenced by gc.c
   >>>               fs/f2fs/gc.o:(update_fs_metadata) in archive vmlinux.a
   >>> referenced by gc.c
   >>>               fs/f2fs/gc.o:(update_fs_metadata) in archive vmlinux.a

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
