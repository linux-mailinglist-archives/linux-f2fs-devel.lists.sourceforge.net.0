Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 1666A7905A9
	for <lists+linux-f2fs-devel@lfdr.de>; Sat,  2 Sep 2023 08:48:34 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1qcKQf-0004R5-QA;
	Sat, 02 Sep 2023 06:48:22 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <lkp@intel.com>) id 1qcKQe-0004Qz-9l
 for linux-f2fs-devel@lists.sourceforge.net;
 Sat, 02 Sep 2023 06:48:20 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:MIME-Version:Message-ID:Subject:Cc:To:
 From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=0R2RolrnDz42bcnp4ubi6NRMBZi3V/VWId6ydHSp7MU=; b=deYRzzuCq4m68ahVmazfjNXs1C
 hDma/dMW2lHkjAdBz5iBrgT+0QcDED/dY4Rw19lKneTvgHMRfPlW0TT+LLXpd+N4vPJvKPdlxsKGQ
 1QSTiEt3J08pUMNr6ipKieK+fLgs3dxtBlivWHuFLWU0T4T2i9FPQp1+F0rKVQXqXdcU=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:MIME-Version:Message-ID:Subject:Cc:To:From:Date:Sender:
 Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
 :Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=0R2RolrnDz42bcnp4ubi6NRMBZi3V/VWId6ydHSp7MU=; b=A
 1vjKSxSysMS7G7zWsL5aGYTp4u8rnw2k8UBzynSYUTHhnROMJFV/EvV1srxFvK8HQhrE8Vv9GufS6
 1m6hu3aE+tB4L2UdLSLWB3N3GAvy6gXIHJpw+NoVFCWt5qzUye1a4EzcI+iB89RWdj4sEc4/9Xtlh
 OBxnN5jSYn3sxJFk=;
Received: from mgamail.intel.com ([134.134.136.31])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1qcKQc-0006b6-Uu for linux-f2fs-devel@lists.sourceforge.net;
 Sat, 02 Sep 2023 06:48:20 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1693637298; x=1725173298;
 h=date:from:to:cc:subject:message-id:mime-version;
 bh=yvj8Wahqrl3KRrH+1vdarL676wOdPvnfZk3BUVO8Eh0=;
 b=C4prY6756ciCltKRMYCZU/JRshx8iA/jn5BpMKrPRQJkGnDLGapE/TM6
 olgZ55skwlMGd8Pbmuwjd7PN+0dWwXcOMGhO+BL4Ll2aE2qrXHgrxcW3b
 515hUgkx4fWE8B5bobsl/twP5cSF90MaRSCsll34jL5iNSPieQoWVYh+R
 wHtGunptMSDeGHTOGDqdMWUBKNnTFDTLWabDLD1S0SdYnnvxTCnqtIekU
 c34LBFxUP4BS0CY+jT6QWXxB/+Dfmt1qdo5pu4c7mleAzf7don12Rib2e
 cbILgva8wulXCzKC079LyZ2lNIoPn7lSgWxyDbefc1KGTkuvR+7azIALi A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10819"; a="440324755"
X-IronPort-AV: E=Sophos;i="6.02,221,1688454000"; d="scan'208";a="440324755"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Sep 2023 23:48:13 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10819"; a="733739907"
X-IronPort-AV: E=Sophos;i="6.02,221,1688454000"; d="scan'208";a="733739907"
Received: from lkp-server01.sh.intel.com (HELO 5d8055a4f6aa) ([10.239.97.150])
 by orsmga007.jf.intel.com with ESMTP; 01 Sep 2023 23:48:11 -0700
Received: from kbuild by 5d8055a4f6aa with local (Exim 4.96)
 (envelope-from <lkp@intel.com>) id 1qcKQT-00025L-0C;
 Sat, 02 Sep 2023 06:48:09 +0000
Date: Sat, 2 Sep 2023 14:47:42 +0800
From: kernel test robot <lkp@intel.com>
To: Chunhai Guo <guochunhai@vivo.com>
Message-ID: <202309021427.K1P8kWbl-lkp@intel.com>
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
 dev-test head: e1e9b8062c74af76b78d10a821cc6c786592209c commit:
 e1e9b8062c74af76b78d10a821cc6c786592209c
 [30/30] f2fs: replace bl [...] 
 Content analysis details:   (-2.5 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -2.3 RCVD_IN_DNSWL_MED      RBL: Sender listed at https://www.dnswl.org/,
 medium trust [134.134.136.31 listed in list.dnswl.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1qcKQc-0006b6-Uu
Subject: [f2fs-dev] [jaegeuk-f2fs:dev-test 30/30] ERROR: modpost:
 "__blk_flush_plug" [fs/f2fs/f2fs.ko] undefined!
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
 Chao Yu <yuchao0@huawei.com>, oe-kbuild-all@lists.linux.dev
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/jaegeuk/f2fs.git dev-test
head:   e1e9b8062c74af76b78d10a821cc6c786592209c
commit: e1e9b8062c74af76b78d10a821cc6c786592209c [30/30] f2fs: replace blk_finish_plug() with blk_flush_plug()
config: i386-randconfig-002-20230902 (https://download.01.org/0day-ci/archive/20230902/202309021427.K1P8kWbl-lkp@intel.com/config)
compiler: gcc-7 (Ubuntu 7.5.0-6ubuntu2) 7.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20230902/202309021427.K1P8kWbl-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202309021427.K1P8kWbl-lkp@intel.com/

All errors (new ones prefixed by >>, old ones prefixed by <<):

WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/mtd/chips/cfi_util.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/mtd/chips/cfi_cmdset_0020.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/net/phy/sfp.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/net/phy/bcm-phy-ptp.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/net/ethernet/amd/lance.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/net/wireless/ti/wlcore/wlcore.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/net/wireless/ti/wl12xx/wl12xx.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/net/wireless/ti/wl1251/wl1251_sdio.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/net/wireless/ti/wl18xx/wl18xx.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/net/arcnet/arcnet.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/net/arcnet/rfc1201.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/net/arcnet/rfc1051.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/net/arcnet/arc-rawmode.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/net/arcnet/capmode.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/net/arcnet/com90xx.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/net/arcnet/com90io.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/net/ieee802154/fakelb.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/cdrom/cdrom.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/auxdisplay/line-display.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/usb/storage/uas.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/usb/serial/ch341.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/usb/serial/usb_debug.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/usb/serial/usb-serial-simple.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/usb/serial/symbolserial.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/usb/misc/ezusb.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/usb/chipidea/ci_hdrc_msm.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/input/matrix-keymap.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/input/tests/input_test.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/rtc/lib_test.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/rtc/rtc-goldfish.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/rtc/rtc-tps65910.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/mmc/core/sdio_uart.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/hid/hid.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/hid/hid-apple.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/hid/hid-aureal.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/hid/hid-belkin.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/hid/hid-bigbenff.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/hid/hid-cherry.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/hid/hid-chicony.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/hid/hid-cypress.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/hid/hid-emsff.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/hid/hid-elecom.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/hid/hid-elo.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/hid/hid-evision.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/hid/hid-ezkey.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/hid/hid-vivaldi-common.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/hid/hid-holtek-kbd.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/hid/hid-holtek-mouse.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/hid/hid-ite.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/hid/hid-keytouch.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/hid/hid-lenovo.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/hid/hid-letsketch.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/hid/hid-logitech.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/hid/hid-lg-g15.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/hid/hid-maltron.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/hid/hid-mf.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/hid/hid-megaworld.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/hid/hid-microsoft.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/hid/hid-ntrig.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/hid/hid-prodikeys.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/hid/hid-pl.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/hid/hid-petalynx.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/hid/hid-primax.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/hid/hid-razer.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/hid/hid-redragon.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/hid/hid-retrode.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/hid/hid-semitek.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/hid/hid-sjoy.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/hid/hid-sony.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/hid/hid-speedlink.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/hid/hid-steam.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/hid/hid-steelseries.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/hid/hid-sunplus.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/hid/hid-tmff.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/hid/hid-tivo.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/hid/hid-twinhan.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/hid/hid-zpff.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/hid/hid-zydacron.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/platform/x86/amilo-rfkill.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/rpmsg/rpmsg_char.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/hwtracing/intel_th/intel_th_msu_sink.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/uio/uio.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/uio/uio_pruss.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/hwmon/corsair-cpro.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/hwmon/mr75203.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/vhost/vringh.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/iio/buffer/kfifo_buf.o
WARNING: modpost: missing MODULE_DESCRIPTION() in sound/soc/codecs/snd-soc-wm-adsp.o
WARNING: modpost: missing MODULE_DESCRIPTION() in sound/soc/amd/snd-acp-config.o
WARNING: modpost: missing MODULE_DESCRIPTION() in sound/soc/xilinx/snd-soc-xlnx-i2s.o
WARNING: modpost: missing MODULE_DESCRIPTION() in samples/configfs/configfs_sample.o
WARNING: modpost: missing MODULE_DESCRIPTION() in net/core/dev_addr_lists_test.o
WARNING: modpost: missing MODULE_DESCRIPTION() in net/802/fddi.o
WARNING: modpost: missing MODULE_DESCRIPTION() in net/packet/af_packet_diag.o
WARNING: modpost: missing MODULE_DESCRIPTION() in net/atm/atm.o
WARNING: modpost: missing MODULE_DESCRIPTION() in net/atm/lec.o
WARNING: modpost: missing MODULE_DESCRIPTION() in net/caif/caif.o
WARNING: modpost: missing MODULE_DESCRIPTION() in net/caif/chnl_net.o
WARNING: modpost: missing MODULE_DESCRIPTION() in net/caif/caif_socket.o
WARNING: modpost: missing MODULE_DESCRIPTION() in net/ieee802154/ieee802154_socket.o
>> ERROR: modpost: "__blk_flush_plug" [fs/f2fs/f2fs.ko] undefined!

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
