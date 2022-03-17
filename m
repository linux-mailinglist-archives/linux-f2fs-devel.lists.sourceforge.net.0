Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 194634DBF81
	for <lists+linux-f2fs-devel@lfdr.de>; Thu, 17 Mar 2022 07:25:26 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.94.2)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1nUjZa-0001du-54; Thu, 17 Mar 2022 06:25:20 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <lkp@intel.com>) id 1nUjXg-0001Uu-6O
 for linux-f2fs-devel@lists.sourceforge.net; Thu, 17 Mar 2022 06:23:24 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:MIME-Version
 :Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=XpUwqXZdPuhzX+dERn+RJ0JASbMV++z0HKVetA/1jEw=; b=id/zrQJfrzYpn0NVju3tr4XQgL
 PVsukSVQyD8ib9PNe/wcx17HRb9qcmuTmPdj5V2PIyVJK0hKzUmzSdWOtGMVmbu2EtgDYCTG692YL
 ObvAzdiYQQd7ti9abTqWgbsO9oPNr5IEg2sD87wNBpvwbZc7zytRPE0Egqi5EKhz+JgA=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:Message-ID:Subject:Cc
 :To:From:Date:Sender:Reply-To:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=XpUwqXZdPuhzX+dERn+RJ0JASbMV++z0HKVetA/1jEw=; b=L
 nojdeMWyvOoUar108gwkhVAbzau8MaWVFPJiCdxmknoTcOjb2xyNvK07NsWzG17Pcy5UP3ZHy5a8x
 VPU080i2XZptBI2AqtRalUeADVXw+9eAyddUk5USMJcalSAJc19h+TJfi2v7v7gun3uXBFbOjqpnQ
 bsFnsUsaQJHYWzQ4=;
Received: from mga11.intel.com ([192.55.52.93])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.94.2)
 id 1nUjXc-001cAW-MW
 for linux-f2fs-devel@lists.sourceforge.net; Thu, 17 Mar 2022 06:23:22 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1647498200; x=1679034200;
 h=date:from:to:cc:subject:message-id:mime-version:
 content-transfer-encoding;
 bh=nTSTxSGj7Nc7Muhp0FwkYy1FNPvjFQ48Sy84VgDOtFw=;
 b=fejEqob5bKlIhsIqJHoHTcVEXklDHAhqEGWiXmEdNgozdGMIVI11td3O
 bagVEF1s5t47iLM/fk+B3OTM8X/4zfdULmmJTi8doygWLbm+rZ/Ffg2da
 GSZZHXwPE8wPb5V2UZgEGtlKhYPzFYyzSjZ9trPa0lYED3kBfEM9zjeCG
 sGjctxdiAyv+vpaXcshjCOGHNlzLiidtBGL0zR/AfThIziyaK7L/3PyES
 8d+tRBE13wrX3+AdPCL0XXQx+B8iyuZZl+TJaAyx3LtuVsWCBYoA+S5iD
 +QOGkizcQDzaQw8UW1bvGPcHIEp85Dtrn0eRgyehHgq3IXwuIRxdfgvBI Q==;
X-IronPort-AV: E=McAfee;i="6200,9189,10288"; a="254350119"
X-IronPort-AV: E=Sophos;i="5.90,188,1643702400"; d="scan'208";a="254350119"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Mar 2022 23:18:17 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.90,188,1643702400"; d="scan'208";a="581189632"
Received: from lkp-server02.sh.intel.com (HELO 89b41b6ae01c) ([10.239.97.151])
 by orsmga001.jf.intel.com with ESMTP; 16 Mar 2022 23:18:12 -0700
Received: from kbuild by 89b41b6ae01c with local (Exim 4.92)
 (envelope-from <lkp@intel.com>)
 id 1nUjSd-000DMs-LG; Thu, 17 Mar 2022 06:18:11 +0000
Date: Thu, 17 Mar 2022 14:18:01 +0800
From: kernel test robot <lkp@intel.com>
To: Andrew Morton <akpm@linux-foundation.org>
Message-ID: <6232d299.9omOW8g6S6l31UFc%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
X-Spam-Score: -3.4 (---)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: tree/branch:
 https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git
 master branch HEAD: 8a11187eb62b8b910d2c5484e1f5d160e8b11eb4 Add linux-next
 specific files for 20220316 Error/Warning reports: 
 Content analysis details:   (-3.4 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [192.55.52.93 listed in list.dnswl.org]
 2.5 SUSPICIOUS_RECIPS      Similar addresses in recipient list
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.7 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1nUjXc-001cAW-MW
Subject: [f2fs-dev] [linux-next:master] BUILD REGRESSION
 8a11187eb62b8b910d2c5484e1f5d160e8b11eb4
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
Cc: uclinux-h8-devel@lists.sourceforge.jp, linux-s390@vger.kernel.org,
 linux-staging@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
 linux-scsi@vger.kernel.org, linux-sh@vger.kernel.org,
 usb-storage@lists.one-eyed-alien.net, netdev@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-usb@vger.kernel.org,
 linux-iio@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net,
 Linux Memory Management List <linux-mm@kvack.org>,
 linux-rockchip@lists.infradead.org, linux-hardening@vger.kernel.org,
 linux-serial@vger.kernel.org, linux-alpha@vger.kernel.org,
 linux-media@vger.kernel.org, amd-gfx@lists.freedesktop.org,
 linux-btrfs@vger.kernel.org, linux-rdma@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
branch HEAD: 8a11187eb62b8b910d2c5484e1f5d160e8b11eb4  Add linux-next specific files for 20220316

Error/Warning reports:

https://lore.kernel.org/linux-doc/202202240704.pQD40A9L-lkp@intel.com
https://lore.kernel.org/linux-doc/202202240705.t3QbMnlt-lkp@intel.com
https://lore.kernel.org/linux-media/202203160306.SfWO9QWV-lkp@intel.com
https://lore.kernel.org/linux-media/202203170501.AhqUekoF-lkp@intel.com
https://lore.kernel.org/linux-mm/202203160358.yulPl6b4-lkp@intel.com
https://lore.kernel.org/llvm/202202241039.g8GKEE4O-lkp@intel.com

Error/Warning:

ERROR: dtschema minimum version is v2022.3
ERROR: modpost: "__v4l2_async_nf_add_fwnode_remote" [drivers/media/platform/nxp/imx-mipi-csis.ko] undefined!
ERROR: modpost: "perf_pmu_migrate_context" [drivers/nvdimm/libnvdimm.ko] undefined!
ERROR: modpost: "perf_pmu_register" [drivers/nvdimm/libnvdimm.ko] undefined!
ERROR: modpost: "perf_pmu_unregister" [drivers/nvdimm/libnvdimm.ko] undefined!
ERROR: modpost: "v4l2_async_nf_init" [drivers/media/platform/nxp/imx-mipi-csis.ko] undefined!
ERROR: modpost: "v4l2_async_register_subdev" [drivers/media/platform/nxp/imx-mipi-csis.ko] undefined!
ERROR: modpost: "v4l2_async_subdev_nf_register" [drivers/media/platform/nxp/imx-mipi-csis.ko] undefined!
ERROR: modpost: "v4l2_async_unregister_subdev" [drivers/media/platform/nxp/imx-mipi-csis.ko] undefined!
ERROR: modpost: "v4l2_fwnode_endpoint_parse" [drivers/media/platform/nxp/imx-mipi-csis.ko] undefined!
ERROR: modpost: "v4l2_subdev_get_fwnode_pad_1_to_1" [drivers/media/platform/nxp/imx-mipi-csis.ko] undefined!
ERROR: modpost: "v4l2_subdev_init" [drivers/media/platform/nxp/imx-mipi-csis.ko] undefined!
ERROR: modpost: "v4l2_subdev_link_validate" [drivers/media/platform/nxp/imx-mipi-csis.ko] undefined!
ERROR: modpost: "v4l_bound_align_image" [drivers/media/platform/nxp/imx-mipi-csis.ko] undefined!
arch/arm/mach-iop32x/cp6.c:10:6: warning: no previous prototype for 'iop_enable_cp6' [-Wmissing-prototypes]
drivers/media/platform/samsung/exynos4-is/fimc-isp-video.h:35:6: warning: no previous prototype for 'fimc_isp_video_device_unregister' [-Wmissing-prototypes]
drivers/spi/spi-amd.c:296:21: warning: cast to smaller integer type 'enum amd_spi_versions' from 'const void *' [-Wvoid-pointer-to-enum-cast]
drm_dp_mst_topology.c:(.text+0x2db0): undefined reference to `__drm_atomic_helper_private_obj_duplicate_state'
drm_dp_mst_topology.c:(.text+0x36c4): undefined reference to `drm_kms_helper_hotplug_event'
fs/btrfs/ordered-data.c:168: warning: expecting prototype for Add an ordered extent to the per(). Prototype was for btrfs_add_ordered_extent() instead
fs/btrfs/tree-log.c:6934: warning: This comment starts with '/**', but isn't a kernel-doc comment. Refer Documentation/doc-guide/kernel-doc.rst

Unverified Error/Warning (likely false positive, please contact us if interested):

Makefile:662: arch/nds32/Makefile: No such file or directory
arch/Kconfig:10: can't open file "arch/nds32/Kconfig"
arch/alpha/include/asm/string.h:22:16: warning: '__builtin_memcpy' forming offset [40, 2051] is out of the bounds [0, 40] of object 'tag_buf' with type 'unsigned char[40]' [-Warray-bounds]
arch/s390/kernel/machine_kexec.c:57:9: warning: 'memcpy' offset [0, 511] is out of the bounds [0, 0] [-Warray-bounds]
arch/sh/kernel/machvec.c:105:33: warning: array subscript 'struct sh_machine_vector[0]' is partly outside array bounds of 'long int[1]' [-Warray-bounds]
drivers/bus/imx-weim.c:373:23: sparse: sparse: symbol 'weim_of_notifier' was not declared. Should it be static?
drivers/clk/imx/clk-pll14xx.c:166:2: warning: Value stored to 'pll_div_ctl1' is never read [clang-analyzer-deadcode.DeadStores]
drivers/firmware/turris-mox-rwtm.c:146:1: warning: Call to function 'sprintf' is insecure as it does not provide bounding of the memory buffer or security checks introduced in the C11 standard. Replace with analogous functions that support length arguments or provides boundary checks such as 'sprintf_s' in case of C11 [clang-analyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
drivers/gpu/drm/amd/amdgpu/../display/dc/core/dc_link.c:4330:7: warning: Dereference of null pointer [clang-analyzer-core.NullDereference]
drivers/gpu/drm/amd/amdgpu/../display/dc/core/dc_resource.c:1633:6: warning: no previous prototype for 'is_timing_changed' [-Wmissing-prototypes]
drivers/gpu/drm/amd/amdgpu/../display/dc/core/dc_resource.c:1633:6: warning: no previous prototype for function 'is_timing_changed' [-Wmissing-prototypes]
drivers/gpu/drm/amd/amdgpu/../display/dc/dml/calcs/dce_calcs.c:77:13: warning: stack frame size (5280) exceeds limit (2048) in 'calculate_bandwidth' [-Wframe-larger-than]
drivers/hid/hid-core.c:1665:30: warning: Although the value stored to 'field' is used in the enclosing expression, the value is never actually read from 'field' [clang-analyzer-deadcode.DeadStores]
drivers/hwmon/nsa320-hwmon.c:114:9: warning: Call to function 'sprintf' is insecure as it does not provide bounding of the memory buffer or security checks introduced in the C11 standard. Replace with analogous functions that support length arguments or provides boundary checks such as 'sprintf_s' in case of C11 [clang-analyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
drivers/iio/frequency/admv1014.c:703:22: sparse: sparse: dubious: x & !y
drivers/infiniband/core/user_mad.c:564:50: warning: array subscript 'struct ib_rmpp_mad[0]' is partly outside array bounds of 'unsigned char[124]' [-Warray-bounds]
drivers/input/serio/ps2-gpio.c:223:4: warning: Value stored to 'rxflags' is never read [clang-analyzer-deadcode.DeadStores]
drivers/leds/trigger/ledtrig-tty.c:33:9: warning: Call to function 'sprintf' is insecure as it does not provide bounding of the memory buffer or security checks introduced in the C11 standard. Replace with analogous functions that support length arguments or provides boundary checks such as 'sprintf_s' in case of C11 [clang-analyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
drivers/memory/brcmstb_dpfe.c:707:10: warning: Call to function 'sprintf' is insecure as it does not provide bounding of the memory buffer or security checks introduced in the C11 standard. Replace with analogous functions that support length arguments or provides boundary checks such as 'sprintf_s' in case of C11 [clang-analyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
drivers/memory/tegra/tegra30-emc.c:1164:3: warning: Value stored to 'dram_type_str' is never read [clang-analyzer-deadcode.DeadStores]
drivers/mmc/host/omap_hsmmc.c:747:9: warning: Call to function 'sprintf' is insecure as it does not provide bounding of the memory buffer or security checks introduced in the C11 standard. Replace with analogous functions that support length arguments or provides boundary checks such as 'sprintf_s' in case of C11 [clang-analyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
drivers/net/vxlan/vxlan_core.c:440:34: sparse: sparse: incorrect type in argument 2 (different base types)
drivers/nvmem/sunplus-ocotp.c:74:29: sparse: sparse: symbol 'sp_otp_v0' was not declared. Should it be static?
drivers/pci/vgaarb.c:213:17: warning: Value stored to 'dev' during its initialization is never read [clang-analyzer-deadcode.DeadStores]
drivers/phy/broadcom/phy-brcm-usb.c:233:9: warning: Call to function 'sprintf' is insecure as it does not provide bounding of the memory buffer or security checks introduced in the C11 standard. Replace with analogous functions that support length arguments or provides boundary checks such as 'sprintf_s' in case of C11 [clang-analyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
drivers/scsi/lpfc/lpfc_els.c:7983:38: sparse:    left side has type unsigned int
drivers/scsi/lpfc/lpfc_els.c:7983:38: sparse:    right side has type restricted __be32
drivers/scsi/lpfc/lpfc_els.c:7983:38: sparse: sparse: invalid assignment: |=
drivers/scsi/lpfc/lpfc_els.c:8504:33: sparse: sparse: incorrect type in assignment (different base types)
drivers/soc/rockchip/dtpm.c:15:12: sparse: sparse: obsolete array initializer, use C99 syntax
drivers/staging/greybus/arche-apb-ctrl.c:302:10: warning: Call to function 'sprintf' is insecure as it does not provide bounding of the memory buffer or security checks introduced in the C11 standard. Replace with analogous functions that support length arguments or provides boundary checks such as 'sprintf_s' in case of C11 [clang-analyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
drivers/staging/wfx/bus_spi.c:164:8-33: WARNING: Threaded IRQ with no primary handler requested without IRQF_ONESHOT (unless it is nested IRQ)
drivers/tty/serial/sunplus-uart.c:501:26: sparse: sparse: symbol 'sunplus_console_ports' was not declared. Should it be static?
drivers/usb/storage/ene_ub6250.c:2416:27: warning: array subscript 'struct SD_STATUS[0]' is partly outside array bounds of 'u8[1]' {aka 'unsigned char[1]'} [-Warray-bounds]
drivers/usb/storage/ene_ub6250.c:2417:27: warning: array subscript 'struct MS_STATUS[0]' is partly outside array bounds of 'u8[1]' {aka 'unsigned char[1]'} [-Warray-bounds]
drivers/usb/storage/ene_ub6250.c:2418:27: warning: array subscript 'struct SM_STATUS[0]' is partly outside array bounds of 'u8[1]' {aka 'unsigned char[1]'} [-Warray-bounds]
drm_gem_shmem_helper.c:(.text+0x1dc): undefined reference to `vmf_insert_pfn'
fs/f2fs/file.c:2057 f2fs_ioc_start_atomic_write() warn: inconsistent returns '&inode->i_rwsem'.
fs/reiserfs/lbalance.o: warning: objtool: leaf_copy_boundary_item()+0x30ae: stack state mismatch: cfa1=4+232 cfa2=4+224
fs/reiserfs/lbalance.o: warning: objtool: leaf_copy_boundary_item()+0x30eb: stack state mismatch: cfa1=4+232 cfa2=4+224
include/linux/cacheflush.h:12:46: warning: 'struct folio' declared inside parameter list will not be visible outside of this definition or declaration
include/linux/fortify-string.h:336:4: warning: call to __read_overflow2_field declared with 'warning' attribute: detected read beyond size of field (2nd parameter); maybe use struct_group()? [-Wattribute-warning]
include/linux/fortify-string.h:45:33: warning: '__builtin_memcpy' offset [0, 511] is out of the bounds [0, 0] [-Warray-bounds]
make[1]: *** No rule to make target 'arch/nds32/Makefile'.
mips64-linux-ld: page_alloc.c:(.init.text+0x5654): undefined reference to `node_data'
nd_perf.c:(.text+0x21e): undefined reference to `perf_pmu_migrate_context'
nd_perf.c:(.text+0x434): undefined reference to `perf_pmu_register'
nd_perf.c:(.text+0x4e0): undefined reference to `perf_pmu_migrate_context'
nd_perf.c:(.text+0x57c): undefined reference to `perf_pmu_unregister'
nd_perf.c:(.text+0x682): undefined reference to `perf_pmu_migrate_context'
nd_perf.c:(.text+0x770): undefined reference to `perf_pmu_register'
nd_perf.c:(.text+0xa28): undefined reference to `perf_pmu_unregister'
net.c:(.text+0xe2): undefined reference to `ieee80211_hdrlen'
net/core/pktgen.c:1312:4: warning: Call to function 'sprintf' is insecure as it does not provide bounding of the memory buffer or security checks introduced in the C11 standard. Replace with analogous functions that support length arguments or provides boundary checks such as 'sprintf_s' in case of C11 [clang-analyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
net/ipv4/tcp_input.c:5012:2: warning: Value stored to 'reason' is never read [clang-analyzer-deadcode.DeadStores]
page_alloc.c:(.init.text+0x5648): undefined reference to `node_data'
{standard input}:1989: Error: unknown pseudo-op: `.sec'

Error/Warning ids grouped by kconfigs:

gcc_recent_errors
|-- alpha-allmodconfig
|   |-- arch-alpha-include-asm-string.h:warning:__builtin_memcpy-forming-offset-is-out-of-the-bounds-of-object-tag_buf-with-type-unsigned-char
|   |-- drivers-gpu-drm-amd-amdgpu-..-display-dc-core-dc_resource.c:warning:no-previous-prototype-for-is_timing_changed
|   |-- drivers-iio-frequency-admv1014.c:sparse:sparse:dubious:x-y
|   |-- drivers-net-vxlan-vxlan_core.c:sparse:sparse:incorrect-type-in-argument-(different-base-types)-expected-unsigned-int-usertype-b-got-restricted-__be32-usertype-vni
|   |-- drivers-nvmem-sunplus-ocotp.c:sparse:sparse:symbol-sp_otp_v0-was-not-declared.-Should-it-be-static
|   |-- drivers-tty-serial-sunplus-uart.c:sparse:sparse:symbol-sunplus_console_ports-was-not-declared.-Should-it-be-static
|   |-- fs-btrfs-ordered-data.c:warning:expecting-prototype-for-Add-an-ordered-extent-to-the-per().-Prototype-was-for-btrfs_add_ordered_extent()-instead
|   `-- fs-btrfs-tree-log.c:warning:This-comment-starts-with-but-isn-t-a-kernel-doc-comment.-Refer-Documentation-doc-guide-kernel-doc.rst
|-- alpha-allyesconfig
|   |-- arch-alpha-include-asm-string.h:warning:__builtin_memcpy-forming-offset-is-out-of-the-bounds-of-object-tag_buf-with-type-unsigned-char
|   |-- drivers-gpu-drm-amd-amdgpu-..-display-dc-core-dc_resource.c:warning:no-previous-prototype-for-is_timing_changed
|   |-- drivers-iio-frequency-admv1014.c:sparse:sparse:dubious:x-y
|   |-- drivers-net-vxlan-vxlan_core.c:sparse:sparse:incorrect-type-in-argument-(different-base-types)-expected-unsigned-int-usertype-b-got-restricted-__be32-usertype-vni
|   |-- drivers-nvmem-sunplus-ocotp.c:sparse:sparse:symbol-sp_otp_v0-was-not-declared.-Should-it-be-static
|   |-- drivers-tty-serial-sunplus-uart.c:sparse:sparse:symbol-sunplus_console_ports-was-not-declared.-Should-it-be-static
|   |-- fs-btrfs-ordered-data.c:warning:expecting-prototype-for-Add-an-ordered-extent-to-the-per().-Prototype-was-for-btrfs_add_ordered_extent()-instead
|   `-- fs-btrfs-tree-log.c:warning:This-comment-starts-with-but-isn-t-a-kernel-doc-comment.-Refer-Documentation-doc-guide-kernel-doc.rst
|-- alpha-buildonly-randconfig-r002-20220313
|   |-- fs-btrfs-ordered-data.c:warning:expecting-prototype-for-Add-an-ordered-extent-to-the-per().-Prototype-was-for-btrfs_add_ordered_extent()-instead
|   `-- fs-btrfs-tree-log.c:warning:This-comment-starts-with-but-isn-t-a-kernel-doc-comment.-Refer-Documentation-doc-guide-kernel-doc.rst
|-- arc-allmodconfig
|   |-- drivers-gpu-drm-amd-amdgpu-..-display-dc-core-dc_resource.c:warning:no-previous-prototype-for-is_timing_changed
|   |-- drivers-irqchip-irq-renesas-h8s.c:sparse:sparse:incorrect-type-in-argument-(different-address-spaces)-expected-void-const-volatile-noderef-__iomem-addr-got-void
|   |-- drivers-irqchip-irq-renesas-h8s.c:sparse:sparse:incorrect-type-in-assignment-(different-address-spaces)-expected-void-static-toplevel-icr_base-got-void-noderef-__iomem
|   |-- drivers-irqchip-irq-renesas-h8s.c:sparse:sparse:incorrect-type-in-assignment-(different-address-spaces)-expected-void-static-toplevel-ipr_base-got-void-noderef-__iomem
|   |-- drivers-net-vxlan-vxlan_core.c:sparse:sparse:incorrect-type-in-argument-(different-base-types)-expected-unsigned-int-usertype-b-got-restricted-__be32-usertype-vni
|   |-- drivers-nvmem-sunplus-ocotp.c:sparse:sparse:symbol-sp_otp_v0-was-not-declared.-Should-it-be-static
|   |-- drivers-tty-serial-sunplus-uart.c:sparse:sparse:symbol-sunplus_console_ports-was-not-declared.-Should-it-be-static
|   |-- fs-btrfs-ordered-data.c:warning:expecting-prototype-for-Add-an-ordered-extent-to-the-per().-Prototype-was-for-btrfs_add_ordered_extent()-instead
|   `-- fs-btrfs-tree-log.c:warning:This-comment-starts-with-but-isn-t-a-kernel-doc-comment.-Refer-Documentation-doc-guide-kernel-doc.rst
|-- arc-allyesconfig
|   |-- drivers-gpu-drm-amd-amdgpu-..-display-dc-core-dc_resource.c:warning:no-previous-prototype-for-is_timing_changed
|   |-- fs-btrfs-ordered-data.c:warning:expecting-prototype-for-Add-an-ordered-extent-to-the-per().-Prototype-was-for-btrfs_add_ordered_extent()-instead
|   `-- fs-btrfs-tree-log.c:warning:This-comment-starts-with-but-isn-t-a-kernel-doc-comment.-Refer-Documentation-doc-guide-kernel-doc.rst
|-- arc-randconfig-c023-20220314
|   |-- drivers-gpu-drm-amd-amdgpu-..-display-dc-core-dc_resource.c:warning:no-previous-prototype-for-is_timing_changed
|   |-- fs-btrfs-ordered-data.c:warning:expecting-prototype-for-Add-an-ordered-extent-to-the-per().-Prototype-was-for-btrfs_add_ordered_extent()-instead
|   `-- fs-btrfs-tree-log.c:warning:This-comment-starts-with-but-isn-t-a-kernel-doc-comment.-Refer-Documentation-doc-guide-kernel-doc.rst
|-- arc-randconfig-p002-20220314
|   |-- fs-btrfs-ordered-data.c:warning:expecting-prototype-for-Add-an-ordered-extent-to-the-per().-Prototype-was-for-btrfs_add_ordered_extent()-instead
|   `-- fs-btrfs-tree-log.c:warning:This-comment-starts-with-but-isn-t-a-kernel-doc-comment.-Refer-Documentation-doc-guide-kernel-doc.rst
|-- arc-randconfig-r043-20220313
|   |-- fs-btrfs-ordered-data.c:warning:expecting-prototype-for-Add-an-ordered-extent-to-the-per().-Prototype-was-for-btrfs_add_ordered_extent()-instead
|   `-- fs-btrfs-tree-log.c:warning:This-comment-starts-with-but-isn-t-a-kernel-doc-comment.-Refer-Documentation-doc-guide-kernel-doc.rst
|-- arm-allmodconfig
|   |-- drivers-gpu-drm-amd-amdgpu-..-display-dc-core-dc_resource.c:warning:no-previous-prototype-for-is_timing_changed
|   |-- fs-btrfs-ordered-data.c:warning:expecting-prototype-for-Add-an-ordered-extent-to-the-per().-Prototype-was-for-btrfs_add_ordered_extent()-instead
|   `-- fs-btrfs-tree-log.c:warning:This-comment-starts-with-but-isn-t-a-kernel-doc-comment.-Refer-Documentation-doc-guide-kernel-doc.rst
|-- arm-allyesconfig
|   |-- drivers-gpu-drm-amd-amdgpu-..-display-dc-core-dc_resource.c:warning:no-previous-prototype-for-is_timing_changed
|   |-- fs-btrfs-ordered-data.c:warning:expecting-prototype-for-Add-an-ordered-extent-to-the-per().-Prototype-was-for-btrfs_add_ordered_extent()-instead
|   `-- fs-btrfs-tree-log.c:warning:This-comment-starts-with-but-isn-t-a-kernel-doc-comment.-Refer-Documentation-doc-guide-kernel-doc.rst
|-- arm-defconfig
|   `-- ERROR:dtschema-minimum-version-is-v2022.
|-- arm-qcom_defconfig
|   |-- drm_dp_mst_topology.c:(.text):undefined-reference-to-__drm_atomic_helper_private_obj_duplicate_state
|   `-- drm_dp_mst_topology.c:(.text):undefined-reference-to-drm_kms_helper_hotplug_event
|-- arm-randconfig-c002-20220314
|   |-- drm_gem_shmem_helper.c:(.text):undefined-reference-to-vmf_insert_pfn
|   |-- fs-btrfs-ordered-data.c:warning:expecting-prototype-for-Add-an-ordered-extent-to-the-per().-Prototype-was-for-btrfs_add_ordered_extent()-instead
|   `-- fs-btrfs-tree-log.c:warning:This-comment-starts-with-but-isn-t-a-kernel-doc-comment.-Refer-Documentation-doc-guide-kernel-doc.rst
|-- arm-randconfig-c023-20220313
|   `-- drivers-staging-wfx-bus_spi.c:WARNING:Threaded-IRQ-with-no-primary-handler-requested-without-IRQF_ONESHOT-(unless-it-is-nested-IRQ)
|-- arm-randconfig-s031-20220313
|   |-- arch-arm-mach-iop32x-cp6.c:warning:no-previous-prototype-for-iop_enable_cp6
|   |-- drivers-usb-storage-ene_ub6250.c:warning:array-subscript-struct-MS_STATUS-is-partly-outside-array-bounds-of-u8-aka-unsigned-char
|   |-- drivers-usb-storage-ene_ub6250.c:warning:array-subscript-struct-SD_STATUS-is-partly-outside-array-bounds-of-u8-aka-unsigned-char
|   `-- drivers-usb-storage-ene_ub6250.c:warning:array-subscript-struct-SM_STATUS-is-partly-outside-array-bounds-of-u8-aka-unsigned-char
|-- arm64-allmodconfig
|   |-- drivers-bus-imx-weim.c:sparse:sparse:symbol-weim_of_notifier-was-not-declared.-Should-it-be-static
|   |-- drivers-gpu-drm-amd-amdgpu-..-display-dc-core-dc_resource.c:warning:no-previous-prototype-for-is_timing_changed
|   |-- drivers-iio-frequency-admv1014.c:sparse:sparse:dubious:x-y
|   |-- drivers-irqchip-irq-renesas-h8s.c:sparse:sparse:incorrect-type-in-argument-(different-address-spaces)-expected-void-const-volatile-noderef-__iomem-addr-got-void
|   |-- drivers-irqchip-irq-renesas-h8s.c:sparse:sparse:incorrect-type-in-assignment-(different-address-spaces)-expected-void-static-toplevel-icr_base-got-void-noderef-__iomem
|   |-- drivers-irqchip-irq-renesas-h8s.c:sparse:sparse:incorrect-type-in-assignment-(different-address-spaces)-expected-void-static-toplevel-ipr_base-got-void-noderef-__iomem
|   |-- drivers-net-vxlan-vxlan_core.c:sparse:sparse:incorrect-type-in-argument-(different-base-types)-expected-unsigned-int-usertype-b-got-restricted-__be32-usertype-vni
|   |-- drivers-nvmem-sunplus-ocotp.c:sparse:sparse:symbol-sp_otp_v0-was-not-declared.-Should-it-be-static
|   |-- drivers-scsi-hisi_sas-hisi_sas_v3_hw.c:sparse:sparse:restricted-__le32-degrades-to-integer
|   |-- drivers-soc-rockchip-dtpm.c:sparse:sparse:obsolete-array-initializer-use-C99-syntax
|   |-- drivers-tty-serial-sunplus-uart.c:sparse:sparse:symbol-sunplus_console_ports-was-not-declared.-Should-it-be-static
|   |-- fs-btrfs-ordered-data.c:warning:expecting-prototype-for-Add-an-ordered-extent-to-the-per().-Prototype-was-for-btrfs_add_ordered_extent()-instead
|   `-- fs-btrfs-tree-log.c:warning:This-comment-starts-with-but-isn-t-a-kernel-doc-comment.-Refer-Documentation-doc-guide-kernel-doc.rst
|-- arm64-allyesconfig
|   |-- drivers-gpu-drm-amd-amdgpu-..-display-dc-core-dc_resource.c:warning:no-previous-prototype-for-is_timing_changed
|   |-- fs-btrfs-ordered-data.c:warning:expecting-prototype-for-Add-an-ordered-extent-to-the-per().-Prototype-was-for-btrfs_add_ordered_extent()-instead
|   `-- fs-btrfs-tree-log.c:warning:This-comment-starts-with-but-isn-t-a-kernel-doc-comment.-Refer-Documentation-doc-guide-kernel-doc.rst
|-- arm64-defconfig
|   |-- fs-btrfs-ordered-data.c:warning:expecting-prototype-for-Add-an-ordered-extent-to-the-per().-Prototype-was-for-btrfs_add_ordered_extent()-instead
|   `-- fs-btrfs-tree-log.c:warning:This-comment-starts-with-but-isn-t-a-kernel-doc-comment.-Refer-Documentation-doc-guide-kernel-doc.rst
|-- csky-allmodconfig
|   |-- drivers-gpu-drm-amd-amdgpu-..-display-dc-core-dc_resource.c:warning:no-previous-prototype-for-is_timing_changed
|   |-- fs-btrfs-ordered-data.c:warning:expecting-prototype-for-Add-an-ordered-extent-to-the-per().-Prototype-was-for-btrfs_add_ordered_extent()-instead
|   `-- fs-btrfs-tree-log.c:warning:This-comment-starts-with-but-isn-t-a-kernel-doc-comment.-Refer-Documentation-doc-guide-kernel-doc.rst
|-- csky-allyesconfig
|   |-- drivers-gpu-drm-amd-amdgpu-..-display-dc-core-dc_resource.c:warning:no-previous-prototype-for-is_timing_changed
|   |-- fs-btrfs-ordered-data.c:warning:expecting-prototype-for-Add-an-ordered-extent-to-the-per().-Prototype-was-for-btrfs_add_ordered_extent()-instead
|   `-- fs-btrfs-tree-log.c:warning:This-comment-starts-with-but-isn-t-a-kernel-doc-comment.-Refer-Documentation-doc-guide-kernel-doc.rst
|-- csky-randconfig-c023-20220313
|   |-- fs-btrfs-ordered-data.c:warning:expecting-prototype-for-Add-an-ordered-extent-to-the-per().-Prototype-was-for-btrfs_add_ordered_extent()-instead
|   `-- fs-btrfs-tree-log.c:warning:This-comment-starts-with-but-isn-t-a-kernel-doc-comment.-Refer-Documentation-doc-guide-kernel-doc.rst
|-- h8300-allmodconfig
|   |-- fs-btrfs-ordered-data.c:warning:expecting-prototype-for-Add-an-ordered-extent-to-the-per().-Prototype-was-for-btrfs_add_ordered_extent()-instead
|   `-- fs-btrfs-tree-log.c:warning:This-comment-starts-with-but-isn-t-a-kernel-doc-comment.-Refer-Documentation-doc-guide-kernel-doc.rst
|-- h8300-allyesconfig
|   |-- fs-btrfs-ordered-data.c:warning:expecting-prototype-for-Add-an-ordered-extent-to-the-per().-Prototype-was-for-btrfs_add_ordered_extent()-instead
|   |-- fs-btrfs-tree-log.c:warning:This-comment-starts-with-but-isn-t-a-kernel-doc-comment.-Refer-Documentation-doc-guide-kernel-doc.rst
|   `-- include-linux-cacheflush.h:warning:struct-folio-declared-inside-parameter-list-will-not-be-visible-outside-of-this-definition-or-declaration
|-- h8300-randconfig-s031-20220316
|   |-- drivers-irqchip-irq-renesas-h8s.c:sparse:sparse:incorrect-type-in-argument-(different-address-spaces)-expected-void-const-volatile-noderef-__iomem-addr-got-void
|   |-- drivers-irqchip-irq-renesas-h8s.c:sparse:sparse:incorrect-type-in-assignment-(different-address-spaces)-expected-void-static-toplevel-icr_base-got-void-noderef-__iomem
|   `-- drivers-irqchip-irq-renesas-h8s.c:sparse:sparse:incorrect-type-in-assignment-(different-address-spaces)-expected-void-static-toplevel-ipr_base-got-void-noderef-__iomem
|-- i386-allyesconfig
|   |-- drivers-gpu-drm-amd-amdgpu-..-display-dc-core-dc_resource.c:warning:no-previous-prototype-for-is_timing_changed
|   |-- drivers-gpu-drm-gma500-intel_bios.c:sparse:sparse:incorrect-type-in-argument-(different-address-spaces)-expected-void-const-const-p-got-unsigned-char-noderef-usertype-__iomem
|   |-- drivers-gpu-drm-gma500-opregion.c:sparse:sparse:incorrect-type-in-argument-(different-address-spaces)-expected-void-const-const-p-got-void-noderef-__iomem-assigned-base
|   |-- drivers-net-vxlan-vxlan_core.c:sparse:sparse:incorrect-type-in-argument-(different-base-types)-expected-unsigned-int-usertype-b-got-restricted-__be32-usertype-vni
|   |-- drivers-scsi-lpfc-lpfc_els.c:sparse:left-side-has-type-unsigned-int
|   |-- drivers-scsi-lpfc-lpfc_els.c:sparse:right-side-has-type-restricted-__be32
|   |-- drivers-scsi-lpfc-lpfc_els.c:sparse:sparse:incorrect-type-in-assignment-(different-base-types)-expected-unsigned-int-usertype-linkFailureCnt-got-restricted-__be32-usertype
|   |-- drivers-scsi-lpfc-lpfc_els.c:sparse:sparse:invalid-assignment:
|   |-- drivers-tty-serial-sunplus-uart.c:sparse:sparse:symbol-sunplus_console_ports-was-not-declared.-Should-it-be-static
|   |-- fs-btrfs-ordered-data.c:warning:expecting-prototype-for-Add-an-ordered-extent-to-the-per().-Prototype-was-for-btrfs_add_ordered_extent()-instead
|   `-- fs-btrfs-tree-log.c:warning:This-comment-starts-with-but-isn-t-a-kernel-doc-comment.-Refer-Documentation-doc-guide-kernel-doc.rst
|-- i386-debian-10.3
|   |-- fs-btrfs-ordered-data.c:warning:expecting-prototype-for-Add-an-ordered-extent-to-the-per().-Prototype-was-for-btrfs_add_ordered_extent()-instead
|   `-- fs-btrfs-tree-log.c:warning:This-comment-starts-with-but-isn-t-a-kernel-doc-comment.-Refer-Documentation-doc-guide-kernel-doc.rst
|-- i386-debian-10.3-kselftests
|   |-- fs-btrfs-ordered-data.c:warning:expecting-prototype-for-Add-an-ordered-extent-to-the-per().-Prototype-was-for-btrfs_add_ordered_extent()-instead
|   `-- fs-btrfs-tree-log.c:warning:This-comment-starts-with-but-isn-t-a-kernel-doc-comment.-Refer-Documentation-doc-guide-kernel-doc.rst
|-- i386-randconfig-a001-20220314
|   `-- net.c:(.text):undefined-reference-to-ieee80211_hdrlen
|-- i386-randconfig-a002-20220314
|   |-- fs-btrfs-ordered-data.c:warning:expecting-prototype-for-Add-an-ordered-extent-to-the-per().-Prototype-was-for-btrfs_add_ordered_extent()-instead
|   `-- fs-btrfs-tree-log.c:warning:This-comment-starts-with-but-isn-t-a-kernel-doc-comment.-Refer-Documentation-doc-guide-kernel-doc.rst
|-- i386-randconfig-a004-20220314
|   |-- fs-btrfs-ordered-data.c:warning:expecting-prototype-for-Add-an-ordered-extent-to-the-per().-Prototype-was-for-btrfs_add_ordered_extent()-instead
|   `-- fs-btrfs-tree-log.c:warning:This-comment-starts-with-but-isn-t-a-kernel-doc-comment.-Refer-Documentation-doc-guide-kernel-doc.rst
|-- i386-randconfig-a006-20220314
|   |-- fs-btrfs-ordered-data.c:warning:expecting-prototype-for-Add-an-ordered-extent-to-the-per().-Prototype-was-for-btrfs_add_ordered_extent()-instead
|   `-- fs-btrfs-tree-log.c:warning:This-comment-starts-with-but-isn-t-a-kernel-doc-comment.-Refer-Documentation-doc-guide-kernel-doc.rst
|-- i386-randconfig-c001-20220314
|   |-- fs-btrfs-ordered-data.c:warning:expecting-prototype-for-Add-an-ordered-extent-to-the-per().-Prototype-was-for-btrfs_add_ordered_extent()-instead
|   `-- fs-btrfs-tree-log.c:warning:This-comment-starts-with-but-isn-t-a-kernel-doc-comment.-Refer-Documentation-doc-guide-kernel-doc.rst
|-- i386-randconfig-c021-20220314
|   |-- fs-btrfs-ordered-data.c:warning:expecting-prototype-for-Add-an-ordered-extent-to-the-per().-Prototype-was-for-btrfs_add_ordered_extent()-instead
|   `-- fs-btrfs-tree-log.c:warning:This-comment-starts-with-but-isn-t-a-kernel-doc-comment.-Refer-Documentation-doc-guide-kernel-doc.rst
|-- i386-randconfig-s001
|   |-- drivers-gpu-drm-gma500-intel_bios.c:sparse:sparse:incorrect-type-in-argument-(different-address-spaces)-expected-void-const-const-p-got-unsigned-char-noderef-usertype-__iomem
|   `-- drivers-gpu-drm-gma500-opregion.c:sparse:sparse:incorrect-type-in-argument-(different-address-spaces)-expected-void-const-const-p-got-void-noderef-__iomem-assigned-base
|-- i386-randconfig-s002
|   |-- drivers-gpu-drm-gma500-intel_bios.c:sparse:sparse:incorrect-type-in-argument-(different-address-spaces)-expected-void-const-const-p-got-unsigned-char-noderef-usertype-__iomem
|   |-- drivers-gpu-drm-gma500-opregion.c:sparse:sparse:incorrect-type-in-argument-(different-address-spaces)-expected-void-const-const-p-got-void-noderef-__iomem-assigned-base
|   |-- fs-btrfs-ordered-data.c:warning:expecting-prototype-for-Add-an-ordered-extent-to-the-per().-Prototype-was-for-btrfs_add_ordered_extent()-instead
|   `-- fs-btrfs-tree-log.c:warning:This-comment-starts-with-but-isn-t-a-kernel-doc-comment.-Refer-Documentation-doc-guide-kernel-doc.rst
|-- ia64-allmodconfig
|   |-- drivers-gpu-drm-amd-amdgpu-..-display-dc-core-dc_resource.c:warning:no-previous-prototype-for-is_timing_changed
|   |-- fs-btrfs-ordered-data.c:warning:expecting-prototype-for-Add-an-ordered-extent-to-the-per().-Prototype-was-for-btrfs_add_ordered_extent()-instead
|   `-- fs-btrfs-tree-log.c:warning:This-comment-starts-with-but-isn-t-a-kernel-doc-comment.-Refer-Documentation-doc-guide-kernel-doc.rst
|-- ia64-allyesconfig
|   |-- drivers-gpu-drm-amd-amdgpu-..-display-dc-core-dc_resource.c:warning:no-previous-prototype-for-is_timing_changed
|   |-- fs-btrfs-ordered-data.c:warning:expecting-prototype-for-Add-an-ordered-extent-to-the-per().-Prototype-was-for-btrfs_add_ordered_extent()-instead
|   |-- fs-btrfs-tree-log.c:warning:This-comment-starts-with-but-isn-t-a-kernel-doc-comment.-Refer-Documentation-doc-guide-kernel-doc.rst
|   `-- nd_perf.c:(.text):undefined-reference-to-perf_pmu_migrate_context
|-- ia64-randconfig-r001-20220313
|   `-- drivers-gpu-drm-amd-amdgpu-..-display-dc-core-dc_resource.c:warning:no-previous-prototype-for-is_timing_changed
|-- ia64-randconfig-r001-20220314
|   |-- fs-btrfs-ordered-data.c:warning:expecting-prototype-for-Add-an-ordered-extent-to-the-per().-Prototype-was-for-btrfs_add_ordered_extent()-instead
|   `-- fs-btrfs-tree-log.c:warning:This-comment-starts-with-but-isn-t-a-kernel-doc-comment.-Refer-Documentation-doc-guide-kernel-doc.rst
|-- ia64-randconfig-r031-20220314
|   |-- fs-btrfs-ordered-data.c:warning:expecting-prototype-for-Add-an-ordered-extent-to-the-per().-Prototype-was-for-btrfs_add_ordered_extent()-instead
|   `-- fs-btrfs-tree-log.c:warning:This-comment-starts-with-but-isn-t-a-kernel-doc-comment.-Refer-Documentation-doc-guide-kernel-doc.rst
|-- ia64-randconfig-r036-20220313
|   |-- fs-btrfs-ordered-data.c:warning:expecting-prototype-for-Add-an-ordered-extent-to-the-per().-Prototype-was-for-btrfs_add_ordered_extent()-instead
|   `-- fs-btrfs-tree-log.c:warning:This-comment-starts-with-but-isn-t-a-kernel-doc-comment.-Refer-Documentation-doc-guide-kernel-doc.rst
|-- m68k-allmodconfig
|   |-- fs-btrfs-ordered-data.c:warning:expecting-prototype-for-Add-an-ordered-extent-to-the-per().-Prototype-was-for-btrfs_add_ordered_extent()-instead
|   `-- fs-btrfs-tree-log.c:warning:This-comment-starts-with-but-isn-t-a-kernel-doc-comment.-Refer-Documentation-doc-guide-kernel-doc.rst
|-- m68k-allyesconfig
|   |-- fs-btrfs-ordered-data.c:warning:expecting-prototype-for-Add-an-ordered-extent-to-the-per().-Prototype-was-for-btrfs_add_ordered_extent()-instead
|   `-- fs-btrfs-tree-log.c:warning:This-comment-starts-with-but-isn-t-a-kernel-doc-comment.-Refer-Documentation-doc-guide-kernel-doc.rst
|-- m68k-apollo_defconfig
|   |-- fs-btrfs-ordered-data.c:warning:expecting-prototype-for-Add-an-ordered-extent-to-the-per().-Prototype-was-for-btrfs_add_ordered_extent()-instead
|   `-- fs-btrfs-tree-log.c:warning:This-comment-starts-with-but-isn-t-a-kernel-doc-comment.-Refer-Documentation-doc-guide-kernel-doc.rst
|-- m68k-defconfig
|   |-- fs-btrfs-ordered-data.c:warning:expecting-prototype-for-Add-an-ordered-extent-to-the-per().-Prototype-was-for-btrfs_add_ordered_extent()-instead
|   `-- fs-btrfs-tree-log.c:warning:This-comment-starts-with-but-isn-t-a-kernel-doc-comment.-Refer-Documentation-doc-guide-kernel-doc.rst
|-- m68k-randconfig-r032-20220314
|   |-- fs-btrfs-ordered-data.c:warning:expecting-prototype-for-Add-an-ordered-extent-to-the-per().-Prototype-was-for-btrfs_add_ordered_extent()-instead
|   `-- fs-btrfs-tree-log.c:warning:This-comment-starts-with-but-isn-t-a-kernel-doc-comment.-Refer-Documentation-doc-guide-kernel-doc.rst
|-- mips-allmodconfig
|   |-- drivers-gpu-drm-amd-amdgpu-..-display-dc-core-dc_resource.c:warning:no-previous-prototype-for-is_timing_changed
|   |-- fs-btrfs-ordered-data.c:warning:expecting-prototype-for-Add-an-ordered-extent-to-the-per().-Prototype-was-for-btrfs_add_ordered_extent()-instead
|   `-- fs-btrfs-tree-log.c:warning:This-comment-starts-with-but-isn-t-a-kernel-doc-comment.-Refer-Documentation-doc-guide-kernel-doc.rst
|-- mips-allyesconfig
|   |-- drivers-gpu-drm-amd-amdgpu-..-display-dc-core-dc_resource.c:warning:no-previous-prototype-for-is_timing_changed
|   |-- fs-btrfs-ordered-data.c:warning:expecting-prototype-for-Add-an-ordered-extent-to-the-per().-Prototype-was-for-btrfs_add_ordered_extent()-instead
|   `-- fs-btrfs-tree-log.c:warning:This-comment-starts-with-but-isn-t-a-kernel-doc-comment.-Refer-Documentation-doc-guide-kernel-doc.rst
|-- mips-randconfig-p002-20220313
|   |-- fs-btrfs-ordered-data.c:warning:expecting-prototype-for-Add-an-ordered-extent-to-the-per().-Prototype-was-for-btrfs_add_ordered_extent()-instead
|   |-- fs-btrfs-tree-log.c:warning:This-comment-starts-with-but-isn-t-a-kernel-doc-comment.-Refer-Documentation-doc-guide-kernel-doc.rst
|   |-- mips64-linux-ld:page_alloc.c:(.init.text):undefined-reference-to-node_data
|   |-- nd_perf.c:(.text):undefined-reference-to-perf_pmu_migrate_context
|   |-- nd_perf.c:(.text):undefined-reference-to-perf_pmu_register
|   |-- nd_perf.c:(.text):undefined-reference-to-perf_pmu_unregister
|   `-- page_alloc.c:(.init.text):undefined-reference-to-node_data
|-- nds32-allmodconfig
|   |-- Makefile:arch-nds32-Makefile:No-such-file-or-directory
|   |-- arch-Kconfig:can-t-open-file-arch-nds32-Kconfig
|   `-- make:No-rule-to-make-target-arch-nds32-Makefile-.
|-- nds32-allnoconfig
|   |-- Makefile:arch-nds32-Makefile:No-such-file-or-directory
|   |-- arch-Kconfig:can-t-open-file-arch-nds32-Kconfig
|   `-- make:No-rule-to-make-target-arch-nds32-Makefile-.
|-- nds32-allyesconfig
|   |-- Makefile:arch-nds32-Makefile:No-such-file-or-directory
|   |-- arch-Kconfig:can-t-open-file-arch-nds32-Kconfig
|   `-- make:No-rule-to-make-target-arch-nds32-Makefile-.
|-- nds32-defconfig
|   |-- Makefile:arch-nds32-Makefile:No-such-file-or-directory
|   `-- make:No-rule-to-make-target-arch-nds32-Makefile-.
|-- nds32-randconfig-c024-20220313
|   |-- Makefile:arch-nds32-Makefile:No-such-file-or-directory
|   |-- arch-Kconfig:can-t-open-file-arch-nds32-Kconfig
|   `-- make:No-rule-to-make-target-arch-nds32-Makefile-.
|-- nds32-randconfig-r023-20220314
|   |-- Makefile:arch-nds32-Makefile:No-such-file-or-directory
|   |-- arch-Kconfig:can-t-open-file-arch-nds32-Kconfig
|   `-- make:No-rule-to-make-target-arch-nds32-Makefile-.
|-- nios2-allmodconfig
|   |-- arch-nios2-kernel-misaligned.c:sparse:sparse:incorrect-type-in-argument-(different-address-spaces)-expected-void-noderef-__user-to-got-unsigned-char-usertype-__pu_ptr
|   |-- drivers-net-vxlan-vxlan_core.c:sparse:sparse:incorrect-type-in-argument-(different-base-types)-expected-unsigned-int-usertype-b-got-restricted-__be32-usertype-vni
|   |-- drivers-nvmem-sunplus-ocotp.c:sparse:sparse:symbol-sp_otp_v0-was-not-declared.-Should-it-be-static
|   |-- drivers-tty-serial-sunplus-uart.c:sparse:sparse:symbol-sunplus_console_ports-was-not-declared.-Should-it-be-static
|   |-- fs-btrfs-ordered-data.c:warning:expecting-prototype-for-Add-an-ordered-extent-to-the-per().-Prototype-was-for-btrfs_add_ordered_extent()-instead
|   `-- fs-btrfs-tree-log.c:warning:This-comment-starts-with-but-isn-t-a-kernel-doc-comment.-Refer-Documentation-doc-guide-kernel-doc.rst
|-- nios2-allyesconfig
|   |-- fs-btrfs-ordered-data.c:warning:expecting-prototype-for-Add-an-ordered-extent-to-the-per().-Prototype-was-for-btrfs_add_ordered_extent()-instead
|   `-- fs-btrfs-tree-log.c:warning:This-comment-starts-with-but-isn-t-a-kernel-doc-comment.-Refer-Documentation-doc-guide-kernel-doc.rst
|-- nios2-buildonly-randconfig-r005-20220313
|   |-- fs-btrfs-ordered-data.c:warning:expecting-prototype-for-Add-an-ordered-extent-to-the-per().-Prototype-was-for-btrfs_add_ordered_extent()-instead
|   `-- fs-btrfs-tree-log.c:warning:This-comment-starts-with-but-isn-t-a-kernel-doc-comment.-Refer-Documentation-doc-guide-kernel-doc.rst
|-- nios2-randconfig-r004-20220314
|   |-- fs-btrfs-ordered-data.c:warning:expecting-prototype-for-Add-an-ordered-extent-to-the-per().-Prototype-was-for-btrfs_add_ordered_extent()-instead
|   `-- fs-btrfs-tree-log.c:warning:This-comment-starts-with-but-isn-t-a-kernel-doc-comment.-Refer-Documentation-doc-guide-kernel-doc.rst
|-- nios2-randconfig-r006-20220314
|   |-- fs-btrfs-ordered-data.c:warning:expecting-prototype-for-Add-an-ordered-extent-to-the-per().-Prototype-was-for-btrfs_add_ordered_extent()-instead
|   `-- fs-btrfs-tree-log.c:warning:This-comment-starts-with-but-isn-t-a-kernel-doc-comment.-Refer-Documentation-doc-guide-kernel-doc.rst
|-- nios2-randconfig-r014-20220317
|   |-- ERROR:__v4l2_async_nf_add_fwnode_remote-drivers-media-platform-nxp-imx-mipi-csis.ko-undefined
|   |-- ERROR:v4l2_async_nf_init-drivers-media-platform-nxp-imx-mipi-csis.ko-undefined
|   |-- ERROR:v4l2_async_register_subdev-drivers-media-platform-nxp-imx-mipi-csis.ko-undefined
|   |-- ERROR:v4l2_async_subdev_nf_register-drivers-media-platform-nxp-imx-mipi-csis.ko-undefined
|   |-- ERROR:v4l2_async_unregister_subdev-drivers-media-platform-nxp-imx-mipi-csis.ko-undefined
|   |-- ERROR:v4l2_fwnode_endpoint_parse-drivers-media-platform-nxp-imx-mipi-csis.ko-undefined
|   |-- ERROR:v4l2_subdev_get_fwnode_pad_1_to_1-drivers-media-platform-nxp-imx-mipi-csis.ko-undefined
|   |-- ERROR:v4l2_subdev_init-drivers-media-platform-nxp-imx-mipi-csis.ko-undefined
|   |-- ERROR:v4l2_subdev_link_validate-drivers-media-platform-nxp-imx-mipi-csis.ko-undefined
|   `-- ERROR:v4l_bound_align_image-drivers-media-platform-nxp-imx-mipi-csis.ko-undefined
|-- parisc-allmodconfig
|   |-- drivers-gpu-drm-amd-amdgpu-..-display-dc-core-dc_resource.c:warning:no-previous-prototype-for-is_timing_changed
|   |-- fs-btrfs-ordered-data.c:warning:expecting-prototype-for-Add-an-ordered-extent-to-the-per().-Prototype-was-for-btrfs_add_ordered_extent()-instead
|   `-- fs-btrfs-tree-log.c:warning:This-comment-starts-with-but-isn-t-a-kernel-doc-comment.-Refer-Documentation-doc-guide-kernel-doc.rst
|-- parisc-allyesconfig
|   |-- drivers-gpu-drm-amd-amdgpu-..-display-dc-core-dc_resource.c:warning:no-previous-prototype-for-is_timing_changed
|   |-- fs-btrfs-ordered-data.c:warning:expecting-prototype-for-Add-an-ordered-extent-to-the-per().-Prototype-was-for-btrfs_add_ordered_extent()-instead
|   `-- fs-btrfs-tree-log.c:warning:This-comment-starts-with-but-isn-t-a-kernel-doc-comment.-Refer-Documentation-doc-guide-kernel-doc.rst
|-- parisc-randconfig-m031-20220317
|   `-- fs-f2fs-file.c-f2fs_ioc_start_atomic_write()-warn:inconsistent-returns-inode-i_rwsem-.
|-- parisc-randconfig-r025-20220313
|   `-- drivers-gpu-drm-amd-amdgpu-..-display-dc-core-dc_resource.c:warning:no-previous-prototype-for-is_timing_changed
|-- parisc-randconfig-r033-20220314
|   |-- drivers-infiniband-core-user_mad.c:warning:array-subscript-struct-ib_rmpp_mad-is-partly-outside-array-bounds-of-unsigned-char
|   |-- fs-btrfs-ordered-data.c:warning:expecting-prototype-for-Add-an-ordered-extent-to-the-per().-Prototype-was-for-btrfs_add_ordered_extent()-instead
|   `-- fs-btrfs-tree-log.c:warning:This-comment-starts-with-but-isn-t-a-kernel-doc-comment.-Refer-Documentation-doc-guide-kernel-doc.rst
|-- parisc64-defconfig
|   |-- fs-btrfs-ordered-data.c:warning:expecting-prototype-for-Add-an-ordered-extent-to-the-per().-Prototype-was-for-btrfs_add_ordered_extent()-instead
|   `-- fs-btrfs-tree-log.c:warning:This-comment-starts-with-but-isn-t-a-kernel-doc-comment.-Refer-Documentation-doc-guide-kernel-doc.rst
|-- powerpc-allmodconfig
|   |-- drivers-gpu-drm-amd-amdgpu-..-display-dc-core-dc_resource.c:warning:no-previous-prototype-for-is_timing_changed
|   |-- fs-btrfs-ordered-data.c:warning:expecting-prototype-for-Add-an-ordered-extent-to-the-per().-Prototype-was-for-btrfs_add_ordered_extent()-instead
|   `-- fs-btrfs-tree-log.c:warning:This-comment-starts-with-but-isn-t-a-kernel-doc-comment.-Refer-Documentation-doc-guide-kernel-doc.rst
|-- powerpc-allyesconfig
|   |-- drivers-gpu-drm-amd-amdgpu-..-display-dc-core-dc_resource.c:warning:no-previous-prototype-for-is_timing_changed
|   |-- fs-btrfs-ordered-data.c:warning:expecting-prototype-for-Add-an-ordered-extent-to-the-per().-Prototype-was-for-btrfs_add_ordered_extent()-instead
|   `-- fs-btrfs-tree-log.c:warning:This-comment-starts-with-but-isn-t-a-kernel-doc-comment.-Refer-Documentation-doc-guide-kernel-doc.rst
|-- powerpc64-buildonly-randconfig-r005-20220314
|   |-- fs-btrfs-ordered-data.c:warning:expecting-prototype-for-Add-an-ordered-extent-to-the-per().-Prototype-was-for-btrfs_add_ordered_extent()-instead
|   `-- fs-btrfs-tree-log.c:warning:This-comment-starts-with-but-isn-t-a-kernel-doc-comment.-Refer-Documentation-doc-guide-kernel-doc.rst
|-- powerpc64-randconfig-m031-20220313
|   |-- fs-btrfs-ordered-data.c:warning:expecting-prototype-for-Add-an-ordered-extent-to-the-per().-Prototype-was-for-btrfs_add_ordered_extent()-instead
|   `-- fs-btrfs-tree-log.c:warning:This-comment-starts-with-but-isn-t-a-kernel-doc-comment.-Refer-Documentation-doc-guide-kernel-doc.rst
|-- powerpc64-randconfig-p001-20220314
|   |-- fs-btrfs-ordered-data.c:warning:expecting-prototype-for-Add-an-ordered-extent-to-the-per().-Prototype-was-for-btrfs_add_ordered_extent()-instead
|   `-- fs-btrfs-tree-log.c:warning:This-comment-starts-with-but-isn-t-a-kernel-doc-comment.-Refer-Documentation-doc-guide-kernel-doc.rst
|-- powerpc64-randconfig-r034-20220314
|   |-- fs-btrfs-ordered-data.c:warning:expecting-prototype-for-Add-an-ordered-extent-to-the-per().-Prototype-was-for-btrfs_add_ordered_extent()-instead
|   `-- fs-btrfs-tree-log.c:warning:This-comment-starts-with-but-isn-t-a-kernel-doc-comment.-Refer-Documentation-doc-guide-kernel-doc.rst
|-- riscv-allmodconfig
|   |-- drivers-gpu-drm-amd-amdgpu-..-display-dc-core-dc_resource.c:warning:no-previous-prototype-for-is_timing_changed
|   |-- fs-btrfs-ordered-data.c:warning:expecting-prototype-for-Add-an-ordered-extent-to-the-per().-Prototype-was-for-btrfs_add_ordered_extent()-instead
|   `-- fs-btrfs-tree-log.c:warning:This-comment-starts-with-but-isn-t-a-kernel-doc-comment.-Refer-Documentation-doc-guide-kernel-doc.rst
|-- riscv-allyesconfig
|   |-- drivers-gpu-drm-amd-amdgpu-..-display-dc-core-dc_resource.c:warning:no-previous-prototype-for-is_timing_changed
|   |-- fs-btrfs-ordered-data.c:warning:expecting-prototype-for-Add-an-ordered-extent-to-the-per().-Prototype-was-for-btrfs_add_ordered_extent()-instead
|   `-- fs-btrfs-tree-log.c:warning:This-comment-starts-with-but-isn-t-a-kernel-doc-comment.-Refer-Documentation-doc-guide-kernel-doc.rst
|-- riscv-randconfig-r042-20220313
|   |-- fs-btrfs-ordered-data.c:warning:expecting-prototype-for-Add-an-ordered-extent-to-the-per().-Prototype-was-for-btrfs_add_ordered_extent()-instead
|   `-- fs-btrfs-tree-log.c:warning:This-comment-starts-with-but-isn-t-a-kernel-doc-comment.-Refer-Documentation-doc-guide-kernel-doc.rst
|-- s390-allmodconfig
|   |-- fs-btrfs-ordered-data.c:warning:expecting-prototype-for-Add-an-ordered-extent-to-the-per().-Prototype-was-for-btrfs_add_ordered_extent()-instead
|   `-- fs-btrfs-tree-log.c:warning:This-comment-starts-with-but-isn-t-a-kernel-doc-comment.-Refer-Documentation-doc-guide-kernel-doc.rst
|-- s390-allyesconfig
|   |-- drivers-gpu-drm-amd-amdgpu-..-display-dc-core-dc_resource.c:warning:no-previous-prototype-for-is_timing_changed
|   |-- fs-btrfs-ordered-data.c:warning:expecting-prototype-for-Add-an-ordered-extent-to-the-per().-Prototype-was-for-btrfs_add_ordered_extent()-instead
|   `-- fs-btrfs-tree-log.c:warning:This-comment-starts-with-but-isn-t-a-kernel-doc-comment.-Refer-Documentation-doc-guide-kernel-doc.rst
|-- s390-defconfig
|   |-- arch-s390-kernel-machine_kexec.c:warning:memcpy-offset-is-out-of-the-bounds
|   |-- fs-btrfs-ordered-data.c:warning:expecting-prototype-for-Add-an-ordered-extent-to-the-per().-Prototype-was-for-btrfs_add_ordered_extent()-instead
|   `-- fs-btrfs-tree-log.c:warning:This-comment-starts-with-but-isn-t-a-kernel-doc-comment.-Refer-Documentation-doc-guide-kernel-doc.rst
|-- s390-randconfig-c003-20220314
|   |-- fs-btrfs-ordered-data.c:warning:expecting-prototype-for-Add-an-ordered-extent-to-the-per().-Prototype-was-for-btrfs_add_ordered_extent()-instead
|   `-- fs-btrfs-tree-log.c:warning:This-comment-starts-with-but-isn-t-a-kernel-doc-comment.-Refer-Documentation-doc-guide-kernel-doc.rst
|-- s390-randconfig-r002-20220314
|   |-- ERROR:perf_pmu_migrate_context-drivers-nvdimm-libnvdimm.ko-undefined
|   |-- ERROR:perf_pmu_register-drivers-nvdimm-libnvdimm.ko-undefined
|   |-- ERROR:perf_pmu_unregister-drivers-nvdimm-libnvdimm.ko-undefined
|   |-- fs-btrfs-ordered-data.c:warning:expecting-prototype-for-Add-an-ordered-extent-to-the-per().-Prototype-was-for-btrfs_add_ordered_extent()-instead
|   `-- fs-btrfs-tree-log.c:warning:This-comment-starts-with-but-isn-t-a-kernel-doc-comment.-Refer-Documentation-doc-guide-kernel-doc.rst
|-- s390-randconfig-r044-20220313
|   |-- drivers-gpu-drm-amd-amdgpu-..-display-dc-core-dc_resource.c:warning:no-previous-prototype-for-is_timing_changed
|   |-- include-linux-fortify-string.h:warning:__builtin_memcpy-offset-is-out-of-the-bounds
|   |-- nd_perf.c:(.text):undefined-reference-to-perf_pmu_migrate_context
|   |-- nd_perf.c:(.text):undefined-reference-to-perf_pmu_register
|   `-- nd_perf.c:(.text):undefined-reference-to-perf_pmu_unregister
|-- sh-allmodconfig
|   |-- arch-sh-kernel-machvec.c:warning:array-subscript-struct-sh_machine_vector-is-partly-outside-array-bounds-of-long-int
|   |-- fs-btrfs-ordered-data.c:warning:expecting-prototype-for-Add-an-ordered-extent-to-the-per().-Prototype-was-for-btrfs_add_ordered_extent()-instead
|   |-- fs-btrfs-tree-log.c:warning:This-comment-starts-with-but-isn-t-a-kernel-doc-comment.-Refer-Documentation-doc-guide-kernel-doc.rst
|   `-- standard-input:Error:unknown-pseudo-op:sec
|-- sh-allyesconfig
|   |-- arch-sh-kernel-machvec.c:warning:array-subscript-struct-sh_machine_vector-is-partly-outside-array-bounds-of-long-int
|   |-- fs-btrfs-ordered-data.c:warning:expecting-prototype-for-Add-an-ordered-extent-to-the-per().-Prototype-was-for-btrfs_add_ordered_extent()-instead
|   |-- fs-btrfs-tree-log.c:warning:This-comment-starts-with-but-isn-t-a-kernel-doc-comment.-Refer-Documentation-doc-guide-kernel-doc.rst
|   `-- standard-input:Error:unknown-pseudo-op:sec
|-- sh-randconfig-s032-20220313
|   |-- arch-sh-kernel-machvec.c:warning:array-subscript-struct-sh_machine_vector-is-partly-outside-array-bounds-of-long-int
|   |-- fs-btrfs-ordered-data.c:warning:expecting-prototype-for-Add-an-ordered-extent-to-the-per().-Prototype-was-for-btrfs_add_ordered_extent()-instead
|   `-- fs-btrfs-tree-log.c:warning:This-comment-starts-with-but-isn-t-a-kernel-doc-comment.-Refer-Documentation-doc-guide-kernel-doc.rst
|-- sh-se7712_defconfig
|   `-- arch-sh-kernel-machvec.c:warning:array-subscript-struct-sh_machine_vector-is-partly-outside-array-bounds-of-long-int
|-- sparc-allmodconfig
|   |-- drivers-gpu-drm-amd-amdgpu-..-display-dc-core-dc_resource.c:warning:no-previous-prototype-for-is_timing_changed
|   |-- drivers-iio-frequency-admv1014.c:sparse:sparse:dubious:x-y
|   |-- drivers-net-vxlan-vxlan_core.c:sparse:sparse:incorrect-type-in-argument-(different-base-types)-expected-unsigned-int-usertype-b-got-restricted-__be32-usertype-vni
|   |-- drivers-nvmem-sunplus-ocotp.c:sparse:sparse:symbol-sp_otp_v0-was-not-declared.-Should-it-be-static
|   |-- drivers-tty-serial-sunplus-uart.c:sparse:sparse:symbol-sunplus_console_ports-was-not-declared.-Should-it-be-static
|   |-- fs-btrfs-ordered-data.c:warning:expecting-prototype-for-Add-an-ordered-extent-to-the-per().-Prototype-was-for-btrfs_add_ordered_extent()-instead
|   `-- fs-btrfs-tree-log.c:warning:This-comment-starts-with-but-isn-t-a-kernel-doc-comment.-Refer-Documentation-doc-guide-kernel-doc.rst
|-- sparc-allyesconfig
|   |-- drivers-gpu-drm-amd-amdgpu-..-display-dc-core-dc_resource.c:warning:no-previous-prototype-for-is_timing_changed
|   |-- fs-btrfs-ordered-data.c:warning:expecting-prototype-for-Add-an-ordered-extent-to-the-per().-Prototype-was-for-btrfs_add_ordered_extent()-instead
|   `-- fs-btrfs-tree-log.c:warning:This-comment-starts-with-but-isn-t-a-kernel-doc-comment.-Refer-Documentation-doc-guide-kernel-doc.rst
|-- sparc-randconfig-r021-20220314
|   |-- fs-btrfs-ordered-data.c:warning:expecting-prototype-for-Add-an-ordered-extent-to-the-per().-Prototype-was-for-btrfs_add_ordered_extent()-instead
|   `-- fs-btrfs-tree-log.c:warning:This-comment-starts-with-but-isn-t-a-kernel-doc-comment.-Refer-Documentation-doc-guide-kernel-doc.rst
|-- sparc64-randconfig-m031-20220314
|   |-- drivers-media-platform-samsung-exynos4-is-fimc-isp-video.h:warning:no-previous-prototype-for-fimc_isp_video_device_unregister
|   |-- fs-btrfs-ordered-data.c:warning:expecting-prototype-for-Add-an-ordered-extent-to-the-per().-Prototype-was-for-btrfs_add_ordered_extent()-instead
|   `-- fs-btrfs-tree-log.c:warning:This-comment-starts-with-but-isn-t-a-kernel-doc-comment.-Refer-Documentation-doc-guide-kernel-doc.rst
|-- x86_64-allyesconfig
|   |-- drivers-gpu-drm-amd-amdgpu-..-display-dc-core-dc_resource.c:warning:no-previous-prototype-for-is_timing_changed
|   |-- drivers-iio-frequency-admv1014.c:sparse:sparse:dubious:x-y
|   |-- drivers-net-vxlan-vxlan_core.c:sparse:sparse:incorrect-type-in-argument-(different-base-types)-expected-unsigned-int-usertype-b-got-restricted-__be32-usertype-vni
|   |-- drivers-scsi-lpfc-lpfc_els.c:sparse:left-side-has-type-unsigned-int
|   |-- drivers-scsi-lpfc-lpfc_els.c:sparse:right-side-has-type-restricted-__be32
|   |-- drivers-scsi-lpfc-lpfc_els.c:sparse:sparse:incorrect-type-in-assignment-(different-base-types)-expected-unsigned-int-usertype-linkFailureCnt-got-restricted-__be32-usertype
|   |-- drivers-scsi-lpfc-lpfc_els.c:sparse:sparse:invalid-assignment:
|   |-- drivers-tty-serial-sunplus-uart.c:sparse:sparse:symbol-sunplus_console_ports-was-not-declared.-Should-it-be-static
|   |-- fs-btrfs-ordered-data.c:warning:expecting-prototype-for-Add-an-ordered-extent-to-the-per().-Prototype-was-for-btrfs_add_ordered_extent()-instead
|   `-- fs-btrfs-tree-log.c:warning:This-comment-starts-with-but-isn-t-a-kernel-doc-comment.-Refer-Documentation-doc-guide-kernel-doc.rst
|-- x86_64-kexec
|   |-- fs-btrfs-ordered-data.c:warning:expecting-prototype-for-Add-an-ordered-extent-to-the-per().-Prototype-was-for-btrfs_add_ordered_extent()-instead
|   `-- fs-btrfs-tree-log.c:warning:This-comment-starts-with-but-isn-t-a-kernel-doc-comment.-Refer-Documentation-doc-guide-kernel-doc.rst
|-- x86_64-randconfig-a002-20220314
|   |-- fs-btrfs-ordered-data.c:warning:expecting-prototype-for-Add-an-ordered-extent-to-the-per().-Prototype-was-for-btrfs_add_ordered_extent()-instead
|   `-- fs-btrfs-tree-log.c:warning:This-comment-starts-with-but-isn-t-a-kernel-doc-comment.-Refer-Documentation-doc-guide-kernel-doc.rst
|-- x86_64-randconfig-a004-20220314
|   |-- fs-btrfs-ordered-data.c:warning:expecting-prototype-for-Add-an-ordered-extent-to-the-per().-Prototype-was-for-btrfs_add_ordered_extent()-instead
|   `-- fs-btrfs-tree-log.c:warning:This-comment-starts-with-but-isn-t-a-kernel-doc-comment.-Refer-Documentation-doc-guide-kernel-doc.rst
|-- x86_64-randconfig-a006-20220314
|   |-- fs-btrfs-ordered-data.c:warning:expecting-prototype-for-Add-an-ordered-extent-to-the-per().-Prototype-was-for-btrfs_add_ordered_extent()-instead
|   `-- fs-btrfs-tree-log.c:warning:This-comment-starts-with-but-isn-t-a-kernel-doc-comment.-Refer-Documentation-doc-guide-kernel-doc.rst
|-- x86_64-randconfig-m001-20220314
|   |-- fs-btrfs-ordered-data.c:warning:expecting-prototype-for-Add-an-ordered-extent-to-the-per().-Prototype-was-for-btrfs_add_ordered_extent()-instead
|   `-- fs-btrfs-tree-log.c:warning:This-comment-starts-with-but-isn-t-a-kernel-doc-comment.-Refer-Documentation-doc-guide-kernel-doc.rst
|-- x86_64-rhel-8.3
|   |-- fs-btrfs-ordered-data.c:warning:expecting-prototype-for-Add-an-ordered-extent-to-the-per().-Prototype-was-for-btrfs_add_ordered_extent()-instead
|   `-- fs-btrfs-tree-log.c:warning:This-comment-starts-with-but-isn-t-a-kernel-doc-comment.-Refer-Documentation-doc-guide-kernel-doc.rst
|-- x86_64-rhel-8.3-func
|   |-- fs-btrfs-ordered-data.c:warning:expecting-prototype-for-Add-an-ordered-extent-to-the-per().-Prototype-was-for-btrfs_add_ordered_extent()-instead
|   `-- fs-btrfs-tree-log.c:warning:This-comment-starts-with-but-isn-t-a-kernel-doc-comment.-Refer-Documentation-doc-guide-kernel-doc.rst
|-- x86_64-rhel-8.3-kselftests
|   |-- drivers-net-vxlan-vxlan_core.c:sparse:sparse:incorrect-type-in-argument-(different-base-types)-expected-unsigned-int-usertype-b-got-restricted-__be32-usertype-vni
|   |-- fs-btrfs-ordered-data.c:warning:expecting-prototype-for-Add-an-ordered-extent-to-the-per().-Prototype-was-for-btrfs_add_ordered_extent()-instead
|   `-- fs-btrfs-tree-log.c:warning:This-comment-starts-with-but-isn-t-a-kernel-doc-comment.-Refer-Documentation-doc-guide-kernel-doc.rst
|-- x86_64-rhel-8.3-kunit
|   |-- fs-btrfs-ordered-data.c:warning:expecting-prototype-for-Add-an-ordered-extent-to-the-per().-Prototype-was-for-btrfs_add_ordered_extent()-instead
|   `-- fs-btrfs-tree-log.c:warning:This-comment-starts-with-but-isn-t-a-kernel-doc-comment.-Refer-Documentation-doc-guide-kernel-doc.rst
|-- xtensa-allmodconfig
|   |-- drivers-gpu-drm-amd-amdgpu-..-display-dc-core-dc_resource.c:warning:no-previous-prototype-for-is_timing_changed
|   |-- fs-btrfs-ordered-data.c:warning:expecting-prototype-for-Add-an-ordered-extent-to-the-per().-Prototype-was-for-btrfs_add_ordered_extent()-instead
|   `-- fs-btrfs-tree-log.c:warning:This-comment-starts-with-but-isn-t-a-kernel-doc-comment.-Refer-Documentation-doc-guide-kernel-doc.rst
|-- xtensa-allyesconfig
|   |-- drivers-gpu-drm-amd-amdgpu-..-display-dc-core-dc_resource.c:warning:no-previous-prototype-for-is_timing_changed
|   |-- fs-btrfs-ordered-data.c:warning:expecting-prototype-for-Add-an-ordered-extent-to-the-per().-Prototype-was-for-btrfs_add_ordered_extent()-instead
|   `-- fs-btrfs-tree-log.c:warning:This-comment-starts-with-but-isn-t-a-kernel-doc-comment.-Refer-Documentation-doc-guide-kernel-doc.rst
|-- xtensa-buildonly-randconfig-r003-20220314
|   `-- drivers-gpu-drm-amd-amdgpu-..-display-dc-core-dc_resource.c:warning:no-previous-prototype-for-is_timing_changed
`-- xtensa-randconfig-r005-20220314
    |-- drivers-gpu-drm-amd-amdgpu-..-display-dc-core-dc_resource.c:warning:no-previous-prototype-for-is_timing_changed
    |-- fs-btrfs-ordered-data.c:warning:expecting-prototype-for-Add-an-ordered-extent-to-the-per().-Prototype-was-for-btrfs_add_ordered_extent()-instead
    `-- fs-btrfs-tree-log.c:warning:This-comment-starts-with-but-isn-t-a-kernel-doc-comment.-Refer-Documentation-doc-guide-kernel-doc.rst

clang_recent_errors
|-- arm-randconfig-c002-20220313
|   |-- drivers-clk-imx-clk-pll14xx.c:warning:Value-stored-to-pll_div_ctl1-is-never-read-clang-analyzer-deadcode.DeadStores
|   |-- drivers-firmware-turris-mox-rwtm.c:warning:Call-to-function-sprintf-is-insecure-as-it-does-not-provide-bounding-of-the-memory-buffer-or-security-checks-introduced-in-the-C11-standard.-Replace-with-ana
|   |-- drivers-hid-hid-core.c:warning:Although-the-value-stored-to-field-is-used-in-the-enclosing-expression-the-value-is-never-actually-read-from-field-clang-analyzer-deadcode.DeadStores
|   |-- drivers-hwmon-nsa320-hwmon.c:warning:Call-to-function-sprintf-is-insecure-as-it-does-not-provide-bounding-of-the-memory-buffer-or-security-checks-introduced-in-the-C11-standard.-Replace-with-analogous
|   |-- drivers-input-serio-ps2-gpio.c:warning:Value-stored-to-rxflags-is-never-read-clang-analyzer-deadcode.DeadStores
|   |-- drivers-leds-trigger-ledtrig-tty.c:warning:Call-to-function-sprintf-is-insecure-as-it-does-not-provide-bounding-of-the-memory-buffer-or-security-checks-introduced-in-the-C11-standard.-Replace-with-ana
|   |-- drivers-memory-brcmstb_dpfe.c:warning:Call-to-function-sprintf-is-insecure-as-it-does-not-provide-bounding-of-the-memory-buffer-or-security-checks-introduced-in-the-C11-standard.-Replace-with-analogou
|   |-- drivers-memory-tegra-tegra30-emc.c:warning:Value-stored-to-dram_type_str-is-never-read-clang-analyzer-deadcode.DeadStores
|   |-- drivers-mmc-host-omap_hsmmc.c:warning:Call-to-function-sprintf-is-insecure-as-it-does-not-provide-bounding-of-the-memory-buffer-or-security-checks-introduced-in-the-C11-standard.-Replace-with-analogou
|   |-- drivers-phy-broadcom-phy-brcm-usb.c:warning:Call-to-function-sprintf-is-insecure-as-it-does-not-provide-bounding-of-the-memory-buffer-or-security-checks-introduced-in-the-C11-standard.-Replace-with-an
|   |-- drivers-staging-greybus-arche-apb-ctrl.c:warning:Call-to-function-sprintf-is-insecure-as-it-does-not-provide-bounding-of-the-memory-buffer-or-security-checks-introduced-in-the-C11-standard.-Replace-wi
|   |-- include-linux-fortify-string.h:warning:call-to-__read_overflow2_field-declared-with-warning-attribute:detected-read-beyond-size-of-field-(2nd-parameter)-maybe-use-struct_group()
|   |-- net-core-pktgen.c:warning:Call-to-function-sprintf-is-insecure-as-it-does-not-provide-bounding-of-the-memory-buffer-or-security-checks-introduced-in-the-C11-standard.-Replace-with-analogous-functions-
|   `-- net-ipv4-tcp_input.c:warning:Value-stored-to-reason-is-never-read-clang-analyzer-deadcode.DeadStores
|-- arm-randconfig-r022-20220313
|   |-- fs-btrfs-ordered-data.c:warning:expecting-prototype-for-Add-an-ordered-extent-to-the-per().-Prototype-was-for-btrfs_add_ordered_extent()-instead
|   `-- fs-btrfs-tree-log.c:warning:This-comment-starts-with-but-isn-t-a-kernel-doc-comment.-Refer-Documentation-doc-guide-kernel-doc.rst
|-- arm64-randconfig-r026-20220314
|   `-- drivers-spi-spi-amd.c:warning:cast-to-smaller-integer-type-enum-amd_spi_versions-from-const-void
|-- hexagon-randconfig-r041-20220313
|   |-- fs-btrfs-ordered-data.c:warning:expecting-prototype-for-Add-an-ordered-extent-to-the-per().-Prototype-was-for-btrfs_add_ordered_extent()-instead
|   `-- fs-btrfs-tree-log.c:warning:This-comment-starts-with-but-isn-t-a-kernel-doc-comment.-Refer-Documentation-doc-guide-kernel-doc.rst
|-- hexagon-randconfig-r045-20220313
|   |-- fs-btrfs-ordered-data.c:warning:expecting-prototype-for-Add-an-ordered-extent-to-the-per().-Prototype-was-for-btrfs_add_ordered_extent()-instead
|   `-- fs-btrfs-tree-log.c:warning:This-comment-starts-with-but-isn-t-a-kernel-doc-comment.-Refer-Documentation-doc-guide-kernel-doc.rst
|-- i386-randconfig-a011-20220314
|   |-- fs-btrfs-ordered-data.c:warning:expecting-prototype-for-Add-an-ordered-extent-to-the-per().-Prototype-was-for-btrfs_add_ordered_extent()-instead
|   `-- fs-btrfs-tree-log.c:warning:This-comment-starts-with-but-isn-t-a-kernel-doc-comment.-Refer-Documentation-doc-guide-kernel-doc.rst
|-- i386-randconfig-a012-20220314
|   |-- fs-btrfs-ordered-data.c:warning:expecting-prototype-for-Add-an-ordered-extent-to-the-per().-Prototype-was-for-btrfs_add_ordered_extent()-instead
|   `-- fs-btrfs-tree-log.c:warning:This-comment-starts-with-but-isn-t-a-kernel-doc-comment.-Refer-Documentation-doc-guide-kernel-doc.rst
|-- i386-randconfig-a013-20220314
|   |-- fs-btrfs-ordered-data.c:warning:expecting-prototype-for-Add-an-ordered-extent-to-the-per().-Prototype-was-for-btrfs_add_ordered_extent()-instead
|   `-- fs-btrfs-tree-log.c:warning:This-comment-starts-with-but-isn-t-a-kernel-doc-comment.-Refer-Documentation-doc-guide-kernel-doc.rst
|-- i386-randconfig-a014-20220314
|   |-- fs-btrfs-ordered-data.c:warning:expecting-prototype-for-Add-an-ordered-extent-to-the-per().-Prototype-was-for-btrfs_add_ordered_extent()-instead
|   `-- fs-btrfs-tree-log.c:warning:This-comment-starts-with-but-isn-t-a-kernel-doc-comment.-Refer-Documentation-doc-guide-kernel-doc.rst
|-- i386-randconfig-a015-20220314
|   |-- fs-btrfs-ordered-data.c:warning:expecting-prototype-for-Add-an-ordered-extent-to-the-per().-Prototype-was-for-btrfs_add_ordered_extent()-instead
|   `-- fs-btrfs-tree-log.c:warning:This-comment-starts-with-but-isn-t-a-kernel-doc-comment.-Refer-Documentation-doc-guide-kernel-doc.rst
|-- i386-randconfig-a016-20220314
|   |-- fs-btrfs-ordered-data.c:warning:expecting-prototype-for-Add-an-ordered-extent-to-the-per().-Prototype-was-for-btrfs_add_ordered_extent()-instead
|   `-- fs-btrfs-tree-log.c:warning:This-comment-starts-with-but-isn-t-a-kernel-doc-comment.-Refer-Documentation-doc-guide-kernel-doc.rst
|-- i386-randconfig-c001
|   |-- drivers-hid-hid-core.c:warning:Although-the-value-stored-to-field-is-used-in-the-enclosing-expression-the-value-is-never-actually-read-from-field-clang-analyzer-deadcode.DeadStores
|   `-- net-ipv4-tcp_input.c:warning:Value-stored-to-reason-is-never-read-clang-analyzer-deadcode.DeadStores
|-- riscv-randconfig-c006-20220310
|   `-- drivers-gpu-drm-amd-amdgpu-..-display-dc-core-dc_link.c:warning:Dereference-of-null-pointer-clang-analyzer-core.NullDereference
|-- riscv-randconfig-c006-20220313
|   |-- drivers-clk-imx-clk-pll14xx.c:warning:Value-stored-to-pll_div_ctl1-is-never-read-clang-analyzer-deadcode.DeadStores
|   |-- drivers-hid-hid-core.c:warning:Although-the-value-stored-to-field-is-used-in-the-enclosing-expression-the-value-is-never-actually-read-from-field-clang-analyzer-deadcode.DeadStores
|   |-- drivers-phy-broadcom-phy-brcm-usb.c:warning:Call-to-function-sprintf-is-insecure-as-it-does-not-provide-bounding-of-the-memory-buffer-or-security-checks-introduced-in-the-C11-standard.-Replace-with-an
|   |-- drivers-staging-greybus-arche-apb-ctrl.c:warning:Call-to-function-sprintf-is-insecure-as-it-does-not-provide-bounding-of-the-memory-buffer-or-security-checks-introduced-in-the-C11-standard.-Replace-wi
|   |-- fs-btrfs-ordered-data.c:warning:expecting-prototype-for-Add-an-ordered-extent-to-the-per().-Prototype-was-for-btrfs_add_ordered_extent()-instead
|   `-- fs-btrfs-tree-log.c:warning:This-comment-starts-with-but-isn-t-a-kernel-doc-comment.-Refer-Documentation-doc-guide-kernel-doc.rst
|-- s390-randconfig-c005-20220313
|   |-- drivers-gpu-drm-amd-amdgpu-..-display-dc-core-dc_resource.c:warning:no-previous-prototype-for-function-is_timing_changed
|   |-- drivers-gpu-drm-amd-amdgpu-..-display-dc-dml-calcs-dce_calcs.c:warning:stack-frame-size-()-exceeds-limit-()-in-calculate_bandwidth
|   |-- fs-btrfs-ordered-data.c:warning:expecting-prototype-for-Add-an-ordered-extent-to-the-per().-Prototype-was-for-btrfs_add_ordered_extent()-instead
|   `-- fs-btrfs-tree-log.c:warning:This-comment-starts-with-but-isn-t-a-kernel-doc-comment.-Refer-Documentation-doc-guide-kernel-doc.rst
|-- x86_64-randconfig-a011-20220314
|   |-- drivers-spi-spi-amd.c:warning:cast-to-smaller-integer-type-enum-amd_spi_versions-from-const-void
|   `-- include-linux-fortify-string.h:warning:call-to-__read_overflow2_field-declared-with-warning-attribute:detected-read-beyond-size-of-field-(2nd-parameter)-maybe-use-struct_group()
|-- x86_64-randconfig-a012-20220314
|   |-- fs-btrfs-ordered-data.c:warning:expecting-prototype-for-Add-an-ordered-extent-to-the-per().-Prototype-was-for-btrfs_add_ordered_extent()-instead
|   |-- fs-btrfs-tree-log.c:warning:This-comment-starts-with-but-isn-t-a-kernel-doc-comment.-Refer-Documentation-doc-guide-kernel-doc.rst
|   `-- include-linux-fortify-string.h:warning:call-to-__read_overflow2_field-declared-with-warning-attribute:detected-read-beyond-size-of-field-(2nd-parameter)-maybe-use-struct_group()
|-- x86_64-randconfig-a013-20220314
|   |-- fs-btrfs-ordered-data.c:warning:expecting-prototype-for-Add-an-ordered-extent-to-the-per().-Prototype-was-for-btrfs_add_ordered_extent()-instead
|   |-- fs-btrfs-tree-log.c:warning:This-comment-starts-with-but-isn-t-a-kernel-doc-comment.-Refer-Documentation-doc-guide-kernel-doc.rst
|   |-- fs-reiserfs-lbalance.o:warning:objtool:leaf_copy_boundary_item():stack-state-mismatch:cfa1-cfa2
|   `-- include-linux-fortify-string.h:warning:call-to-__read_overflow2_field-declared-with-warning-attribute:detected-read-beyond-size-of-field-(2nd-parameter)-maybe-use-struct_group()
|-- x86_64-randconfig-a014-20220314
|   |-- drivers-spi-spi-amd.c:warning:cast-to-smaller-integer-type-enum-amd_spi_versions-from-const-void
|   |-- fs-reiserfs-lbalance.o:warning:objtool:leaf_copy_boundary_item():stack-state-mismatch:cfa1-cfa2
|   `-- include-linux-fortify-string.h:warning:call-to-__read_overflow2_field-declared-with-warning-attribute:detected-read-beyond-size-of-field-(2nd-parameter)-maybe-use-struct_group()
|-- x86_64-randconfig-a015-20220314
|   |-- fs-btrfs-ordered-data.c:warning:expecting-prototype-for-Add-an-ordered-extent-to-the-per().-Prototype-was-for-btrfs_add_ordered_extent()-instead
|   |-- fs-btrfs-tree-log.c:warning:This-comment-starts-with-but-isn-t-a-kernel-doc-comment.-Refer-Documentation-doc-guide-kernel-doc.rst
|   `-- include-linux-fortify-string.h:warning:call-to-__read_overflow2_field-declared-with-warning-attribute:detected-read-beyond-size-of-field-(2nd-parameter)-maybe-use-struct_group()
|-- x86_64-randconfig-a016-20220314
|   |-- drivers-spi-spi-amd.c:warning:cast-to-smaller-integer-type-enum-amd_spi_versions-from-const-void
|   `-- include-linux-fortify-string.h:warning:call-to-__read_overflow2_field-declared-with-warning-attribute:detected-read-beyond-size-of-field-(2nd-parameter)-maybe-use-struct_group()
`-- x86_64-randconfig-c007
    |-- drivers-hid-hid-core.c:warning:Although-the-value-stored-to-field-is-used-in-the-enclosing-expression-the-value-is-never-actually-read-from-field-clang-analyzer-deadcode.DeadStores
    |-- drivers-pci-vgaarb.c:warning:Value-stored-to-dev-during-its-initialization-is-never-read-clang-analyzer-deadcode.DeadStores
    `-- net-ipv4-tcp_input.c:warning:Value-stored-to-reason-is-never-read-clang-analyzer-deadcode.DeadStores

elapsed time: 754m

configs tested: 119
configs skipped: 3

gcc tested configs:
arm                                 defconfig
arm64                               defconfig
arm64                            allyesconfig
arm                              allmodconfig
arm                              allyesconfig
i386                 randconfig-c001-20220314
mips                 randconfig-c004-20220314
um                             i386_defconfig
mips                             allmodconfig
riscv                            allmodconfig
um                           x86_64_defconfig
mips                             allyesconfig
riscv                            allyesconfig
sh                               allmodconfig
xtensa                           allyesconfig
h8300                            allyesconfig
parisc                           allyesconfig
alpha                            allyesconfig
arc                              allyesconfig
nios2                            allyesconfig
m68k                         apollo_defconfig
powerpc                      tqm8xx_defconfig
sh                        edosk7760_defconfig
xtensa                       common_defconfig
sh                           se7712_defconfig
arm                         nhk8815_defconfig
h8300                            alldefconfig
powerpc                         wii_defconfig
arm                        oxnas_v6_defconfig
m68k                       m5275evb_defconfig
arm                            qcom_defconfig
mips                         db1xxx_defconfig
arm                        mvebu_v7_defconfig
xtensa                    smp_lx200_defconfig
powerpc                     asp8347_defconfig
arm                  randconfig-c002-20220313
arm                  randconfig-c002-20220314
ia64                                defconfig
ia64                             allmodconfig
ia64                             allyesconfig
m68k                                defconfig
m68k                             allyesconfig
m68k                             allmodconfig
nds32                             allnoconfig
nios2                               defconfig
csky                                defconfig
alpha                               defconfig
nds32                               defconfig
arc                                 defconfig
parisc                              defconfig
parisc64                            defconfig
s390                             allmodconfig
s390                             allyesconfig
s390                                defconfig
i386                             allyesconfig
i386                              debian-10.3
i386                   debian-10.3-kselftests
i386                                defconfig
sparc                            allyesconfig
sparc                               defconfig
powerpc                           allnoconfig
powerpc                          allmodconfig
powerpc                          allyesconfig
i386                 randconfig-a001-20220314
i386                 randconfig-a002-20220314
i386                 randconfig-a004-20220314
i386                 randconfig-a006-20220314
i386                 randconfig-a003-20220314
i386                 randconfig-a005-20220314
x86_64               randconfig-a005-20220314
x86_64               randconfig-a002-20220314
x86_64               randconfig-a001-20220314
x86_64               randconfig-a003-20220314
x86_64               randconfig-a004-20220314
x86_64               randconfig-a006-20220314
arc                  randconfig-r043-20220313
riscv                randconfig-r042-20220313
s390                 randconfig-r044-20220313
riscv                    nommu_k210_defconfig
riscv                    nommu_virt_defconfig
riscv                             allnoconfig
riscv                               defconfig
riscv                          rv32_defconfig
x86_64                    rhel-8.3-kselftests
x86_64                           allyesconfig
x86_64                              defconfig
x86_64                                  kexec
x86_64                               rhel-8.3
x86_64                          rhel-8.3-func
x86_64                         rhel-8.3-kunit

clang tested configs:
x86_64                        randconfig-c007
s390                 randconfig-c005-20220313
mips                 randconfig-c004-20220313
riscv                randconfig-c006-20220313
arm                  randconfig-c002-20220313
i386                          randconfig-c001
powerpc              randconfig-c003-20220313
hexagon                          alldefconfig
powerpc                     pseries_defconfig
powerpc                      katmai_defconfig
mips                            e55_defconfig
arm                          ep93xx_defconfig
powerpc                   bluestone_defconfig
mips                        omega2p_defconfig
mips                        maltaup_defconfig
mips                           mtx1_defconfig
x86_64               randconfig-a011-20220314
x86_64               randconfig-a014-20220314
x86_64               randconfig-a013-20220314
x86_64               randconfig-a012-20220314
x86_64               randconfig-a015-20220314
x86_64               randconfig-a016-20220314
i386                 randconfig-a012-20220314
i386                 randconfig-a016-20220314
i386                 randconfig-a011-20220314
i386                 randconfig-a013-20220314
i386                 randconfig-a014-20220314
i386                 randconfig-a015-20220314
hexagon              randconfig-r045-20220313
hexagon              randconfig-r041-20220313

---
0-DAY CI Kernel Test Service
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
