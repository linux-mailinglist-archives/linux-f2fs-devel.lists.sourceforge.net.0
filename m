Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 7498A54B8EC
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 14 Jun 2022 20:45:05 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.94.2)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1o1BX9-0002A8-6v; Tue, 14 Jun 2022 18:44:59 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <lkp@intel.com>) id 1o1BX7-0002A2-Og
 for linux-f2fs-devel@lists.sourceforge.net; Tue, 14 Jun 2022 18:44:58 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:MIME-Version
 :Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=X0VTpKuk2jWvtpGyZ2sqOvbfiJyTWIV7fW6h0P5HyZI=; b=exqsXTJfmKIhUvX/KquNoxYiIo
 vt+3EWtyUA22Fh5GOo09lm0WlwHOQMJgTL1ftfJQPZyXs5I2AyKX3WrnA2FUaz+XoiEJMFsJz+3GE
 s1HOOxDQ4XaB5g5KLCiOwsizQnaOitP3wU+qx1EQcZRmrtHWxp1i1NjF+xLSQrT9bFFo=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:Message-ID:Subject:Cc
 :To:From:Date:Sender:Reply-To:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=X0VTpKuk2jWvtpGyZ2sqOvbfiJyTWIV7fW6h0P5HyZI=; b=g
 bwxGwYPayURQ5V2r+QtohsPpfNGbij/QDpJuQuK+aKWnnWsz9Ufa0gLdrHk8mGb1IJ4zD+pLvwWX8
 I5wQ955ziXSi4kmQqTZU+7WbRoJ30bzzD28t49M2M6JQ7Ym7ET4JJhjh4M2Qm95jEoVLb20gVpqnR
 K1/oady1h4evYuS4=;
Received: from mga11.intel.com ([192.55.52.93])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.94.2)
 id 1o1BX5-001gep-A5
 for linux-f2fs-devel@lists.sourceforge.net; Tue, 14 Jun 2022 18:44:57 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1655232295; x=1686768295;
 h=date:from:to:cc:subject:message-id:mime-version:
 content-transfer-encoding;
 bh=Ixr3mhKtmM5RFZXlc02iEkQAHMNIxZ03wnoAUFG9cx8=;
 b=g4tk+dSeX4/3DI1CYsKzlw3MczWTEx6oaXD8pXhvINZmXU/nnP5/DmE8
 ohOS8W2HP3Hak6WVABhJQ/CkdLZTFvCaVWCzG9NQ3jt7aAS+dQlm81XM3
 oAcv0wVFZDkd6Ix99LmY1CT4SVW1byRdBfPomTdw8Tr2m6wPfmBdnaL7+
 ntJwwKf8Jn09mmq/RsJ5VzhVPPw6YbWEZpvZnb1y1S0HabcHkAu+NoMmx
 k7LgF/R7A4cR5NLLSfc3huQVXJZZHCMFaT0mRqiGoCQs95e6XYV56NvFd
 o/hUKh6hrI/S9+Q+GyDJKHP9zCJGYXWwYbV+DakrrmyMKIT/vT1Na24fS w==;
X-IronPort-AV: E=McAfee;i="6400,9594,10378"; a="276257151"
X-IronPort-AV: E=Sophos;i="5.91,300,1647327600"; d="scan'208";a="276257151"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Jun 2022 11:44:49 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.91,300,1647327600"; d="scan'208";a="535692441"
Received: from lkp-server01.sh.intel.com (HELO 60dabacc1df6) ([10.239.97.150])
 by orsmga003.jf.intel.com with ESMTP; 14 Jun 2022 11:44:47 -0700
Received: from kbuild by 60dabacc1df6 with local (Exim 4.95)
 (envelope-from <lkp@intel.com>) id 1o1BWw-000MCp-U1;
 Tue, 14 Jun 2022 18:44:46 +0000
Date: Wed, 15 Jun 2022 02:44:14 +0800
From: kernel test robot <lkp@intel.com>
To: Andrew Morton <akpm@linux-foundation.org>
Message-ID: <62a8d6fe.l9kTY7EU3b9NXYOz%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
X-Spam-Score: -3.9 (---)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: tree/branch:
 https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git
 master branch HEAD: 35d872b9ea5b3ad784d7479ea728dcb688df2db7 Add linux-next
 specific files for 20220614 Error/Warning: (recently discovered and may have
 been fixed) 
 Content analysis details:   (-3.9 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [192.55.52.93 listed in list.dnswl.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 2.5 SUSPICIOUS_RECIPS      Similar addresses in recipient list
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
X-Headers-End: 1o1BX5-001gep-A5
Subject: [f2fs-dev] [linux-next:master] BUILD REGRESSION
 35d872b9ea5b3ad784d7479ea728dcb688df2db7
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
Cc: Linux Memory Management List <linux-mm@kvack.org>,
 linux-staging@lists.linux.dev, amd-gfx@lists.freedesktop.org,
 linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
branch HEAD: 35d872b9ea5b3ad784d7479ea728dcb688df2db7  Add linux-next specific files for 20220614

Error/Warning: (recently discovered and may have been fixed)

drivers/gpu/drm/amd/amdgpu/../display/include/ddc_service_types.h:130:17: warning: 'DP_SINK_BRANCH_DEV_NAME_7580' defined but not used [-Wunused-const-variable=]

Unverified Error/Warning (likely false positive, please contact us if interested):

drivers/gpu/drm/amd/amdgpu/../display/amdgpu_dm/amdgpu_dm.c:9139:27: warning: variable 'abo' set but not used [-Wunused-but-set-variable]
drivers/staging/vme_user/vme.c:662:20: warning: dereference of NULL 'bridge' [CWE-476] [-Wanalyzer-null-dereference]
fs/f2fs/data.c:136:33: error: too many arguments to function 'f2fs_end_read_compressed_page'
fs/f2fs/data.c:138:25: error: too many arguments to function 'f2fs_put_page_dic'

Error/Warning ids grouped by kconfigs:

gcc_recent_errors
|-- alpha-allyesconfig
|   |-- drivers-gpu-drm-amd-amdgpu-..-display-amdgpu_dm-amdgpu_dm.c:warning:variable-abo-set-but-not-used
|   `-- drivers-staging-rtl8723bs-hal-hal_btcoex.c:warning:variable-pHalData-set-but-not-used
|-- arc-allyesconfig
|   |-- drivers-gpu-drm-amd-amdgpu-..-display-amdgpu_dm-amdgpu_dm.c:warning:variable-abo-set-but-not-used
|   `-- drivers-staging-rtl8723bs-hal-hal_btcoex.c:warning:variable-pHalData-set-but-not-used
|-- arc-randconfig-r015-20220613
|   `-- drivers-gpu-drm-amd-amdgpu-..-display-amdgpu_dm-amdgpu_dm.c:warning:variable-abo-set-but-not-used
|-- arm-allmodconfig
|   |-- drivers-gpu-drm-amd-amdgpu-..-display-amdgpu_dm-amdgpu_dm.c:warning:variable-abo-set-but-not-used
|   `-- drivers-staging-rtl8723bs-hal-hal_btcoex.c:warning:variable-pHalData-set-but-not-used
|-- arm-allyesconfig
|   |-- drivers-gpu-drm-amd-amdgpu-..-display-amdgpu_dm-amdgpu_dm.c:warning:variable-abo-set-but-not-used
|   `-- drivers-staging-rtl8723bs-hal-hal_btcoex.c:warning:variable-pHalData-set-but-not-used
|-- arm-randconfig-c002-20220612
|   `-- drivers-staging-vme_user-vme.c:warning:dereference-of-NULL-bridge-CWE
|-- arm64-allyesconfig
|   |-- drivers-gpu-drm-amd-amdgpu-..-display-amdgpu_dm-amdgpu_dm.c:warning:variable-abo-set-but-not-used
|   `-- drivers-staging-rtl8723bs-hal-hal_btcoex.c:warning:variable-pHalData-set-but-not-used
|-- i386-allyesconfig
|   |-- drivers-gpu-drm-amd-amdgpu-..-display-amdgpu_dm-amdgpu_dm.c:warning:variable-abo-set-but-not-used
|   `-- drivers-staging-rtl8723bs-hal-hal_btcoex.c:warning:variable-pHalData-set-but-not-used
|-- i386-debian-10.3
|   |-- fs-f2fs-data.c:error:too-many-arguments-to-function-f2fs_end_read_compressed_page
|   `-- fs-f2fs-data.c:error:too-many-arguments-to-function-f2fs_put_page_dic
|-- i386-debian-10.3-kselftests
|   |-- fs-f2fs-data.c:error:too-many-arguments-to-function-f2fs_end_read_compressed_page
|   `-- fs-f2fs-data.c:error:too-many-arguments-to-function-f2fs_put_page_dic
|-- ia64-allmodconfig
|   |-- drivers-gpu-drm-amd-amdgpu-..-display-amdgpu_dm-amdgpu_dm.c:warning:variable-abo-set-but-not-used
|   `-- drivers-staging-rtl8723bs-hal-hal_btcoex.c:warning:variable-pHalData-set-but-not-used
|-- ia64-allyesconfig
|   `-- drivers-staging-rtl8723bs-hal-hal_btcoex.c:warning:variable-pHalData-set-but-not-used
|-- m68k-allmodconfig
|   `-- drivers-staging-rtl8723bs-hal-hal_btcoex.c:warning:variable-pHalData-set-but-not-used
|-- m68k-allyesconfig
|   `-- drivers-staging-rtl8723bs-hal-hal_btcoex.c:warning:variable-pHalData-set-but-not-used
|-- m68k-randconfig-r005-20220613
|   |-- fs-f2fs-data.c:error:too-many-arguments-to-function-f2fs_end_read_compressed_page
|   `-- fs-f2fs-data.c:error:too-many-arguments-to-function-f2fs_put_page_dic
|-- mips-allmodconfig
|   |-- drivers-gpu-drm-amd-amdgpu-..-display-amdgpu_dm-amdgpu_dm.c:warning:variable-abo-set-but-not-used
|   `-- drivers-staging-rtl8723bs-hal-hal_btcoex.c:warning:variable-pHalData-set-but-not-used
|-- mips-allyesconfig
|   |-- drivers-gpu-drm-amd-amdgpu-..-display-amdgpu_dm-amdgpu_dm.c:warning:variable-abo-set-but-not-used
|   `-- drivers-staging-rtl8723bs-hal-hal_btcoex.c:warning:variable-pHalData-set-but-not-used
|-- nios2-allyesconfig
|   `-- drivers-staging-rtl8723bs-hal-hal_btcoex.c:warning:variable-pHalData-set-but-not-used
|-- parisc-allyesconfig
|   |-- drivers-gpu-drm-amd-amdgpu-..-display-amdgpu_dm-amdgpu_dm.c:warning:variable-abo-set-but-not-used
|   `-- drivers-staging-rtl8723bs-hal-hal_btcoex.c:warning:variable-pHalData-set-but-not-used
|-- powerpc-allmodconfig
|   |-- drivers-gpu-drm-amd-amdgpu-..-display-amdgpu_dm-amdgpu_dm.c:warning:variable-abo-set-but-not-used
|   `-- drivers-staging-rtl8723bs-hal-hal_btcoex.c:warning:variable-pHalData-set-but-not-used
|-- powerpc-allyesconfig
|   |-- drivers-gpu-drm-amd-amdgpu-..-display-amdgpu_dm-amdgpu_dm.c:warning:variable-abo-set-but-not-used
|   `-- drivers-staging-rtl8723bs-hal-hal_btcoex.c:warning:variable-pHalData-set-but-not-used
|-- riscv-allmodconfig
|   |-- drivers-gpu-drm-amd-amdgpu-..-display-amdgpu_dm-amdgpu_dm.c:warning:variable-abo-set-but-not-used
|   `-- drivers-staging-rtl8723bs-hal-hal_btcoex.c:warning:variable-pHalData-set-but-not-used
|-- riscv-allyesconfig
|   |-- drivers-gpu-drm-amd-amdgpu-..-display-amdgpu_dm-amdgpu_dm.c:warning:variable-abo-set-but-not-used
|   `-- drivers-staging-rtl8723bs-hal-hal_btcoex.c:warning:variable-pHalData-set-but-not-used
|-- s390-allyesconfig
|   `-- drivers-gpu-drm-amd-amdgpu-..-display-amdgpu_dm-amdgpu_dm.c:warning:variable-abo-set-but-not-used
|-- sh-allmodconfig
|   `-- drivers-staging-rtl8723bs-hal-hal_btcoex.c:warning:variable-pHalData-set-but-not-used
|-- sparc-allyesconfig
|   |-- drivers-gpu-drm-amd-amdgpu-..-display-amdgpu_dm-amdgpu_dm.c:warning:variable-abo-set-but-not-used
|   `-- drivers-staging-rtl8723bs-hal-hal_btcoex.c:warning:variable-pHalData-set-but-not-used
|-- x86_64-allyesconfig
|   |-- drivers-gpu-drm-amd-amdgpu-..-display-amdgpu_dm-amdgpu_dm.c:warning:variable-abo-set-but-not-used
|   |-- drivers-gpu-drm-amd-amdgpu-..-display-include-ddc_service_types.h:warning:DP_SINK_BRANCH_DEV_NAME_7580-defined-but-not-used
|   `-- drivers-staging-rtl8723bs-hal-hal_btcoex.c:warning:variable-pHalData-set-but-not-used
|-- x86_64-rhel-8.3-kunit
|   |-- fs-f2fs-data.c:error:too-many-arguments-to-function-f2fs_end_read_compressed_page
|   `-- fs-f2fs-data.c:error:too-many-arguments-to-function-f2fs_put_page_dic
`-- xtensa-allyesconfig
    |-- drivers-gpu-drm-amd-amdgpu-..-display-amdgpu_dm-amdgpu_dm.c:warning:variable-abo-set-but-not-used
    `-- drivers-staging-rtl8723bs-hal-hal_btcoex.c:warning:variable-pHalData-set-but-not-used

clang_recent_errors
`-- riscv-randconfig-r035-20220613
    `-- arch-riscv-kernel-cpufeature.c:warning:variable-cpu_apply_feature-set-but-not-used

elapsed time: 727m

configs tested: 72
configs skipped: 3

gcc tested configs:
arm                              allmodconfig
arm                              allyesconfig
arm64                            allyesconfig
arm                                 defconfig
arm64                               defconfig
ia64                                defconfig
ia64                             allmodconfig
ia64                             allyesconfig
m68k                             allyesconfig
m68k                             allmodconfig
m68k                                defconfig
alpha                               defconfig
csky                                defconfig
alpha                            allyesconfig
nios2                            allyesconfig
nios2                               defconfig
arc                              allyesconfig
arc                                 defconfig
h8300                            allyesconfig
sh                               allmodconfig
xtensa                           allyesconfig
parisc                              defconfig
s390                             allmodconfig
parisc                           allyesconfig
parisc64                            defconfig
s390                                defconfig
s390                             allyesconfig
i386                   debian-10.3-kselftests
i386                              debian-10.3
i386                                defconfig
i386                             allyesconfig
sparc                               defconfig
sparc                            allyesconfig
mips                             allmodconfig
mips                             allyesconfig
powerpc                           allnoconfig
powerpc                          allmodconfig
powerpc                          allyesconfig
x86_64               randconfig-a014-20220613
x86_64               randconfig-a012-20220613
x86_64               randconfig-a011-20220613
x86_64               randconfig-a015-20220613
x86_64               randconfig-a013-20220613
x86_64               randconfig-a016-20220613
i386                 randconfig-a013-20220613
i386                 randconfig-a011-20220613
i386                 randconfig-a012-20220613
i386                 randconfig-a016-20220613
i386                 randconfig-a015-20220613
i386                 randconfig-a014-20220613
arc                  randconfig-r043-20220613
riscv                randconfig-r042-20220613
s390                 randconfig-r044-20220613
riscv                             allnoconfig
riscv                            allyesconfig
riscv                            allmodconfig
riscv                    nommu_k210_defconfig
riscv                          rv32_defconfig
riscv                    nommu_virt_defconfig
riscv                               defconfig
um                             i386_defconfig
um                           x86_64_defconfig
x86_64                              defconfig
x86_64                           allyesconfig
x86_64                                  kexec
x86_64                               rhel-8.3
x86_64                          rhel-8.3-func
x86_64                         rhel-8.3-kunit
x86_64                    rhel-8.3-kselftests
x86_64                           rhel-8.3-syz

clang tested configs:
hexagon              randconfig-r041-20220613
hexagon              randconfig-r045-20220613

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
