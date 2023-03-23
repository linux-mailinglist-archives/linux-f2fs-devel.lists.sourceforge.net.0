Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (unknown [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id C02466C648E
	for <lists+linux-f2fs-devel@lfdr.de>; Thu, 23 Mar 2023 11:15:15 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1pfHyP-0002aX-AF;
	Thu, 23 Mar 2023 10:15:11 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <michalechner92@googlemail.com>) id 1pfHxo-0002a7-DP
 for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 23 Mar 2023 10:14:34 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:To:Subject:Message-ID:Date:From:
 MIME-Version:Sender:Reply-To:Cc:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=2H5oBkiNTWQW+m0UGdIOpnWOqNNCR7MlU2vSD0+VUJA=; b=TAwR4Cp0iBlg5fPQcB2/h6UO3J
 kYb/gT5W2EBJxcAiUPgcAc2cU/BYVc3ZcbbohscGQXcbU/zeweJFp65SSdFpgzCAMmwATZ+DLo+p5
 rtD0z2ge5D53J9T0hG/sGBA0ooXuBMopBT16C7u5bC3aVNEfUfFUtW9nMLS0alk9lZ2A=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:To:Subject:Message-ID:Date:From:MIME-Version:Sender:Reply-To
 :Cc:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=2H5oBkiNTWQW+m0UGdIOpnWOqNNCR7MlU2vSD0+VUJA=; b=c
 aJKREyOIJARNUbYDj3E7IwaFK8pyT90IgWF+qLk+daF+3u3LgC5lR7x+BTc/xhBZ7CfSZQN9sZeQ0
 F+7N0I6V9DRiUDl30iw4ggvuCUuivlLXgrnm2KfI+YfpBxCvJlrPPhb5R6wtBH1TthgtsvabezPr+
 PjYlzVeJMFyVgnSg=;
Received: from mail-ed1-f41.google.com ([209.85.208.41])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1pfHxf-0001i0-Vo for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 23 Mar 2023 10:14:24 +0000
Received: by mail-ed1-f41.google.com with SMTP id w9so84176863edc.3
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Thu, 23 Mar 2023 03:14:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=googlemail.com; s=20210112; t=1679566457;
 h=to:subject:message-id:date:from:mime-version:from:to:cc:subject
 :date:message-id:reply-to;
 bh=2H5oBkiNTWQW+m0UGdIOpnWOqNNCR7MlU2vSD0+VUJA=;
 b=Bjmzk8CY5J7069j5NQvjb8Oz7qKVbagZKh75nxuA7143YX7y983k2PnheU5qxGNCAT
 BRzVzXn9EU3/N9L2Jq8iYovTNhhSC7oAbngg1nq/0KAE+qRwar0XvBXVnP/nx0oX1BNC
 rXDk9XAGCK2VqZUlkHV+3CGKCbr2cp/HFbDDyNyC1E4GRIuzSn/up/5i3Sm3jgZPFV7J
 UcJCcbSd47hSt4gwPSfO2dXjMHApaHuw2ejzhiWbJKChGzBCIShpZydzX203ejosgIUm
 DsOBidsgIou7gfwupVB3BGpDD5yZtuOjp8/Nusva9WFWTUM7kiXH5h8snQiruj5hxZX4
 VMPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1679566457;
 h=to:subject:message-id:date:from:mime-version:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=2H5oBkiNTWQW+m0UGdIOpnWOqNNCR7MlU2vSD0+VUJA=;
 b=Uflx6ZZ5I57yTMMERRsLhIY7+QSkydFkW/lEBJJQV7R36XqHaFPZkG4RHiVTR0U7gR
 /fZ0gBU7L3NwnYSYfFa/3vMNBrdGvo3K2dqVxCAwUSzBGlF3vtTCItsBs26CObpU/T1q
 thNUgilakxT+Ab3cLCNpWAtkg9CkKluyu/WKs6GXdwxyHWUKxS4gpHwvPsUrG7VTalf9
 y84fyyuX0GXt9tvT1gCLZRu0QBMoasvA5NIIhdZBbZL3ct3SrOK5xfqXcVPgh36es2MI
 Isd0oKWajw/I94PweV1UdImafZIRzpejPHoArr1G/c9fzkTaUAroMMG9/RfEHglPTquU
 ++mQ==
X-Gm-Message-State: AO0yUKUNDbN5Lpq/IYnsHjIGIQnpap06pTscLTiBETXPnJwK4nGFoDr3
 OpvN/KZJudlbe2oiFVccCpE4GyVpp8VEpACdRcT0/8vEdnw=
X-Google-Smtp-Source: AK7set81RYhgABYExh9u0qUQE/aw+JUJ2D8JaiarekNLHAxhWVPTBwEYqFo3MUBSh/Kf9TXSFUOADgkg7+h6yEpURl0=
X-Received: by 2002:a17:906:2d49:b0:92a:a75e:6b9 with SMTP id
 e9-20020a1709062d4900b0092aa75e06b9mr4689929eji.11.1679566457112; Thu, 23 Mar
 2023 03:14:17 -0700 (PDT)
MIME-Version: 1.0
Date: Thu, 23 Mar 2023 11:14:06 +0100
Message-ID: <CAJ5GUvkTDtP3+ASo4QEhQ0WFfruv6N22RgyXwf_=A+fXbUwufQ@mail.gmail.com>
To: linux-f2fs-devel@lists.sourceforge.net
X-Spam-Score: 0.1 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  Hello everyone, I'm maintaining a kernel for Pixel 7 android
 devices running the 5.10 kernel. After merging the latest updates from f2fs
 stable for 5.10, users experience a kernel panic, which I believe is caused
 by [...] Content analysis details:   (0.1 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
 no trust [209.85.208.41 listed in list.dnswl.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.2 FREEMAIL_ENVFROM_END_DIGIT Envelope-from freemail username ends
 in digit [michalechner92[at]googlemail.com]
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [209.85.208.41 listed in wl.mailspike.net]
 0.0 FREEMAIL_FROM          Sender email is commonly abused enduser mail
 provider [michalechner92[at]googlemail.com]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
X-Headers-End: 1pfHxf-0001i0-Vo
Subject: [f2fs-dev] F2FS kernel panic - latest 5.10 stable
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
From: Micha L via Linux-f2fs-devel <linux-f2fs-devel@lists.sourceforge.net>
Reply-To: Micha L <michalechner92@googlemail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

Hello everyone,

I'm maintaining a kernel for Pixel 7 android devices running the 5.10
kernel. After merging the latest updates from f2fs stable for 5.10,
users experience a kernel panic, which I believe is caused by the most
recently pushed tag there.

I never personally experienced the panic, but I got two ramoops/pstore
logs that look exactly the same since I pushed the kernel containing
the latest f2fs stable commits. One panic happened while the user was
browsing chrome, the other while watching YouTube.
Both crashes look identical in the kernel log.


Here's the snipped from the kernel log:
[  271.459684][ T9723] Unable to handle kernel NULL pointer
dereference at virtual address 0000000000000000
[  271.459713][ T9723] Mem abort info:
[  271.459725][ T9723]   ESR = 0x96000006
[  271.459737][ T9723]   EC = 0x25: DABT (current EL), IL = 32 bits
[  271.459746][ T9723]   SET = 0, FnV = 0
[  271.459755][ T9723]   EA = 0, S1PTW = 0
[  271.459763][ T9723] Data abort info:
[  271.459772][ T9723]   ISV = 0, ISS = 0x00000006
[  271.459782][ T9723]   CM = 0, WnR = 0
[  271.459793][ T9723] user pgtable: 4k pages, 39-bit VAs, pgdp=00000000d0a97000
[  271.459803][ T9723] [0000000000000000] pgd=0000000949ddc003,
p4d=0000000949ddc003, pud=0000000949ddc003, pmd=0000000000000000
[  271.459831][ T9723] Internal error: Oops: 96000006 [#1] PREEMPT SMP
[  271.459851][ T9723] debug-snapshot dss: core register saved(CPU:5)
[  271.459862][ T9723] debug-snapshot dss: ECC error check erridr_el1.num = 0x2
[  271.459874][ T9723] debug-snapshot dss: ERRSELR_EL1.SEL = 0, NOT
Error, ERXSTATUS_EL1 = 0x0
[  271.459884][ T9723] debug-snapshot dss: ERRSELR_EL1.SEL = 1, NOT
Error, ERXSTATUS_EL1 = 0x0
[  271.459892][ T9723] debug-snapshot dss: context saved(CPU:5)
[  271.460130][ T9723] item - log_kevents is disabled
[  271.460135][ T9723] Modules linked in: snd_soc_cs40l26(O)
input_cs40l26_i2c(O) cl_dsp(O) syna_touch(O) bcmdhd4389(O)
wlan_ptracker(O) snd_soc_cs35l45_i2c(O) snd_soc_cs35l41_i2c(O)
overheat_mitigation(O) mcps802154_region_pctt(O) max77729_charger(O)
mali_kbase(O) mali_pixel(O) lwis(O) gxp(O) google_dual_batt_gauge(O)
google_dock(O) goog_touch_interface(O) drv2624(O) bigocean(O)
audiometrics(O) coresight_etm4x coresight_replicator coresight_funnel
coresight_tmc coresight pps_gpio pps_core arm_dsu_pmu gpu_cooling
goodixfp stmvl53l1 usbc_cooling_dev usb_f_etr_miu scsi_debug
crc_t10dif slg51002_core slg51000_core sbb_mux null_blk
slg51002_regulator slg51000_regulator pixel_stat_mm pixel_stat_sysfs
bcm_dbg pixel_em vh_mm pinctrl_slg51002 pinctrl_slg51000
crct10dif_generic crct10dif_common touch_bus_negotiator(O)
touch_offload(O) st21nfc(O) snd_soc_cs35l45_spi(O) snd_soc_cs35l45(O)
snd_soc_cs35l41_spi(O) snd_soc_cs35l41(O) snd_soc_wm_adsp(O)
pca9468(O) panel_samsung_sofef01(O)
[  271.460242][ T9723]  panel_samsung_s6e3hc4(O)
panel_samsung_s6e3hc3(O) panel_samsung_s6e3hc3_c10(O)
panel_samsung_s6e3hc2(O) panel_samsung_s6e3fc3(O)
panel_samsung_s6e3fc3_p10(O) panel_samsung_emul(O)
panel_boe_nt37290(O) panel_samsung_drv(O) p9221(O) nitrous(O)
mcps802154_region_nfcc_coex(O) mcps802154_region_fira(O)
max77759_charger(O) max77729_uic(O) max77729_pmic(O) max20339(O)
max1720x_battery(O) mailbox_wc(O) janeiro(O) heatmap(O) google_cpm(O)
google_charger(O) google_battery(O) exynos_reboot(O) google_bms(O)
exynos_drm(O) st54spi(O) st33spi(O) dw3000(O) mcps802154(O)
aoc_uwb_platform_drv(O) aoc_uwb_service_dev(O) aoc_usb_driver(O)
aoc_control_dev(O) aoc_char_dev(O) aoc_channel_dev(O) aoc_alsa_dev(O)
aoc_alsa_dev_util(O) aoc_core(O) trusty_virtio trusty_test trusty_log
trusty_irq memlat_devfreq exynos_acme softdog s2mpg13_spmic_thermal
gs_thermal google_bcl odpm debug_reboot smfc exynos_mfc i2c_dev
i2c_acpm i2c_exynos5 rtc_s2mpg12 keycombo s2mpg12_key tcpci_max77759
[  271.460337][ T9723]  max77759_contaminant bc_max77759
max77759_helper usb_psy usb_f_dm1 usb_f_dm usb_f_rndis xhci_exynos
spidev sg ufs_exynos_core ufs_pixel_fips140 s2mpg1x_gpio_gs201
bcm47765 sscoredump at24 zcomp_eh zcomp_cpu zram g2d samsung_iommu
samsung_iommu_group exynos_tty s2mpg13_powermeter s2mpg13_regulator
s2mpg12_powermeter s2mpg12_regulator s2mpg12_mfd s2mpg13_mfd
pmic_class exynos_seclog dbgcore_dump sysrq_hook hardlockup_debug
s3c2410_wdt eh cp_thermal_zone cpif bts cpif_page boot_device_spi
exynos_bcm_dbg_dump gsa_gsc slc_acpm slc_pmon slc_dummy acpm_mbox_test
exynos_devfreq exynos_dm slc_pt power_stats exynos_pd_dbg exynos_pd
dwc3_exynos_usb gvotable exynos_cpuhp pixel_metrics vh_i2c vh_cgroup
vh_fs vh_thermal vh_preemptirq_long vh_sched arm_memlat_mon
governor_memlat sched_tp pixel_boot_metrics exynos_adv_tracer_s2d
keydebug kernel_top exynos_coresight_etm exynos_ecc_handler
exynos_coresight exynos_debug_test pixel_debug_test ehld
hardlockup_watchdog sjtag_driver
[  271.460460][ T9723]  gsa trusty_ipc samsung_dma_heap trusty_core
samsung_secure_iova exynos_adv_tracer debug_snapshot_debug_kinfo
clk_exynos pcie_exynos_core exynos_pm acpm_flexpmu_dbg
pcie_exynos_gs201_rc_cal shm_ipc spi_s3c64xx samsung_dma pl330
exynos_pcie_iommu itmon logbuffer exynos_cpupm exynos_mct cmupmucal
exynos_pm_qos gs_acpm systrace dss ect_parser gs_chipid
pinctrl_samsung_core phy_exynos_mipi phy_exynos_mipi_dsim
exynos_pmu_if phy_exynos_usbdrd_super pkvm_s2mpu exynos_pd_el3 lzo_rle
lzo zsmalloc
[  271.460525][ T9723] CPU: 5 PID: 9723 Comm: ThreadPoolForeg Tainted:
G        W  O
5.10.175-Kirisakura_Raviantah_1.0.0-998706-gad5c1a6fadac #1
[  271.460529][ T9723] Hardware name: GS201 CHEETAH MP based on GS201 (DT)
[  271.460534][ T9723] pstate: 60400005 (nZCv daif +PAN -UAO -TCO BTYPE=--)
[  271.460550][ T9723] pc : __replace_atomic_write_block+0x2ec/0x454
[  271.460557][ T9723] lr : __replace_atomic_write_block+0x2e8/0x454
[  271.460561][ T9723] sp : ffffffc02448bb10
[  271.460565][ T9723] x29: ffffffc02448bb60 x28: 0000000000000002
[  271.460571][ T9723] x27: ffffffc02448bb30 x26: ffffffc02448bb40
[  271.460577][ T9723] x25: 0000000000000000 x24: ffffff800981e000
[  271.460583][ T9723] x23: 0000000000000000 x22: ffffff8921a5dc80
[  271.460588][ T9723] x21: ffffff89b9a31cc0 x20: 0000000000000000
[  271.460593][ T9723] x19: 0000000000821099 x18: ffffffc01f517048
[  271.460599][ T9723] x17: ff00000000000000 x16: 000000ff00000000
[  271.460605][ T9723] x15: 0000ff0000000000 x14: 00c40000031a3800
[  271.460611][ T9723] x13: ffffff8a28ea3558 x12: 0000000000000001
[  271.460617][ T9723] x11: ffffff8921a5dc98 x10: 0000000000000003
[  271.460623][ T9723] x9 : 0000000000000002 x8 : ffffffff008b7ec0
[  271.460629][ T9723] x7 : 0000000000000000 x6 : ffffffc02448b9e8
[  271.460635][ T9723] x5 : 0000000000000001 x4 : ffffff8a6e5bba60
[  271.460641][ T9723] x3 : 0000000000015525 x2 : ffffff89bb32ae00
[  271.460647][ T9723] x1 : 0000000000000000 x0 : ffffffff008b7ec0
[  271.460654][ T9723] Call trace:
[  271.460660][ T9723]  __replace_atomic_write_block+0x2ec/0x454
[  271.460666][ T9723]  f2fs_commit_atomic_write+0x4e0/0x5c4
[  271.460673][ T9723]  __f2fs_ioctl+0x2a38/0x53e4
[  271.460678][ T9723]  f2fs_ioctl+0x58/0x8c
[  271.460685][ T9723]  __arm64_sys_ioctl+0xac/0x118
[  271.460691][ T9723]  el0_svc_common.llvm.12808801858016031363+0xd4/0x1e4
[  271.460696][ T9723]  do_el0_svc+0x2c/0x9c
[  271.460703][ T9723]  el0_svc+0x18/0x28
[  271.460707][ T9723]  el0_sync_handler+0x8c/0xf0
[  271.460713][ T9723]  el0_sync+0x1b4/0x1c0
[  271.460718][ T9723] Code: 940017ec 910063e0 97fe7c6e f941eea2 (b94002e4)
[  271.460723][ T9723] ---[ end trace bedb98bed8071e73 ]---


It looks to me like the recent commits around atomic write might cause it.
Maybe: https://github.com/freak07/Kirisakura_Pantah/commit/1126ed69c0fe4d22a4761a22ee73c519c2320176

Link to my source is here:
https://github.com/freak07/Kirisakura_Pantah/tree/pantah-tq2a.230305


If you have any other questions please feel free to ask.

With kind regards,

Micha


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
