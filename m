Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 742FA8DF25
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 14 Aug 2019 22:45:41 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1hy09J-0001Qb-SS; Wed, 14 Aug 2019 20:45:37 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <arnd@arndb.de>)
 id 1hy09I-0001QG-B6; Wed, 14 Aug 2019 20:45:36 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=yryEacCtYJwxW3FqOh7CstjSYrtL+KEIcwI0yJLShe4=; b=guRTdb9fzxKwz5OCTlACchs+ih
 SVneBk7uSMVY/n3cUA+RXOzoT9hkNW6FfMOPoxFV9mV2wfAMj1U5HDjtU5UdXd7KsByVdesjHCIg9
 whHlHkBCY3mKcsG99b4jDQ7Nw0LTPw2gc2iGfog5b6mTTL63UYuH+tLos6gz4VIIWMG4=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:Message-Id:Date:Subject:Cc:To:From
 :Sender:Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=yryEacCtYJwxW3FqOh7CstjSYrtL+KEIcwI0yJLShe4=; b=a
 z8Iv/86As/Rvzev+QSWd3QiuvYhZo/f6fp9JCu27sqrTMpHvBFmIehFd6rwdHbgb3n6AyJq8/dcb2
 tPV67Dd9d+VmaaULML1NJLLs6OdlEkHWdB6dZRj/H1LaSJql6/esOfZ2MJvTR5zrD6c2IDGjwtuY7
 W2rluypWoY65ZLCk=;
Received: from mout.kundenserver.de ([212.227.126.134])
 by sfi-mx-4.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.90_1)
 id 1hy09E-003mfE-L3; Wed, 14 Aug 2019 20:45:36 +0000
Received: from threadripper.lan ([149.172.19.189]) by mrelayeu.kundenserver.de
 (mreue010 [212.227.15.129]) with ESMTPA (Nemesis) id
 1MJmbB-1hiokV3nNB-00K75E; Wed, 14 Aug 2019 22:43:31 +0200
From: Arnd Bergmann <arnd@arndb.de>
To: linux-kernel@vger.kernel.org, viro@zeniv.linux.org.uk,
 linux-fsdevel@vger.kernel.org
Date: Wed, 14 Aug 2019 22:42:27 +0200
Message-Id: <20190814204259.120942-1-arnd@arndb.de>
X-Mailer: git-send-email 2.20.0
MIME-Version: 1.0
X-Provags-ID: V03:K1:xGnsbJFEb5cp5VgCCKba17rABY8rw5YpFHVSp9sUcOzQSe+UXGP
 EfEYa61AjTCAHzUWX6wv2lDU7UbSUWqI2oz4Izzo8ktMHBlxmH8NVFj4hnZmHzHR9j3PmnD
 FdXT0A0EWAS6WaUuOwbDeG9tdQjqBuRZe/Qa9Z37r+1tBtsxN6SEXAY5fO0COcyHnB4qqcA
 G33rmG1j8a0kHXtMGaC3A==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:lZeESLReWcA=:o8v1Y+WXV56E6iMJG8Ogif
 2FqbIgZz9Cf28eQxkb1FeOSJmjwIDMMG6qZymgcdySt/904oRKzRXaxzdToNS9eKtscmO3Pqe
 /FgBQD2UqihLwK3P/Pddn1urtJAP8i4lHDXy2HhE2jK8dPb6o36J+yFC20qjDEZ2PrwGmI4P+
 eCWYNuv25DY/1Lti33SSmno2KcNiHGryG0RZ4MxsltqQfXdWyvsKej7eST7IWNiMWKhvjyU37
 hE4nHYkj/tcVvmbwEjgJuruEJRODw6lCU7hWqw9twzGmBAmy8QMD8J//vGUTZ4q5+VzF9VhjQ
 bG82fyrhMmJKoue644MCK3h+10nGq6fpc0+zn8mYx07fSdSIGFWt2VJ2pxnSCWgeITy6Ere97
 sRmxqZNBv/e8jpN7Uc0JBjNzz9yYdvbFlJfGeIc2ao4vxcJORGyxhpoqAIRlQzpHC31QgNZum
 edQsMV2appVThHuGv1ov/A9jLW2kPA47ZPWpCcXW+dzl4v7v86+29DJTNjj3mVImCRQNSuJS4
 cAtYqWH6jHUAOn8v98eCWJv3t830ah1HbsJkf7tJ7ckvhUNIWDFHYDwgsfXjt098IoD2AtXor
 PgWxV3iIYDq+x9Wym9Nl2f8rz27kROMPDKgPXeM8TeWHxiZbHQgKAuei5tzhS7HSjk0UKFYhp
 9Oh+W+y+k0I/NRheX6o+PUjcCpNRjNPLHuD9piLtJmz92aChC6F/e9SyB7FzdHKmmf4IcD77K
 7HYEjW+U1QhnWXZOIuSxIrYkaKmPv6aeBud5fA==
X-Spam-Score: 0.0 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 0.0 URIBL_BLOCKED ADMINISTRATOR NOTICE: The query to URIBL was blocked.
 See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URIs: suse.com]
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/, no
 trust [212.227.126.134 listed in list.dnswl.org]
 0.0 SPF_NONE               SPF: sender does not publish an SPF Record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
X-Headers-End: 1hy09E-003mfE-L3
Subject: [f2fs-dev] [PATCH v5 00/18] compat_ioctl.c removal, part 2/3
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
Cc: alexandre.belloni@bootlin.com, joseph.qi@linux.alibaba.com,
 adilger.kernel@dilger.ca, mikulas@artax.karlin.mff.cuni.cz,
 linux-rtc@vger.kernel.org, linux-nilfs@vger.kernel.org,
 Arnd Bergmann <arnd@arndb.de>, linux-scsi@vger.kernel.org,
 darrick.wong@oracle.com, cluster-devel@redhat.com, dgilbert@interlog.com,
 linux-ext4@vger.kernel.org, linux@roeck-us.net, linux-hwmon@vger.kernel.org,
 ecryptfs@vger.kernel.org, linux-watchdog@vger.kernel.org, minyard@acm.org,
 jejb@linux.ibm.com, jslaby@suse.com, linux-block@vger.kernel.org,
 jlbec@evilplan.org, jaegeuk@kernel.org,
 openipmi-developer@lists.sourceforge.net, wim@linux-watchdog.org,
 konishi.ryusuke@gmail.com, agruenba@redhat.com, axboe@kernel.dk, tytso@mit.edu,
 martin.petersen@oracle.com, gregkh@linuxfoundation.org,
 linux-f2fs-devel@lists.sourceforge.net, linux-xfs@vger.kernel.org,
 netdev@vger.kernel.org, rpeterso@redhat.com, davem@davemloft.net,
 ocfs2-devel@oss.oracle.com, linux-ppp@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

This is a follow-up to part 1/3 that I posted after -rc2.
I hope these are still largely uncontroversial changes, and
I would like to get them into linux-5.4.

Part 1 was in

https://lore.kernel.org/lkml/CAPcyv4i_nHzV155RcgnAQ189aq2Lfd2g8pA1D5NbZqo9E_u+Dw@mail.gmail.com/

Part 3 will be one kernel release after part 2 is merged,
as that still needs a little extra work.

The entire series is available at

git://git.kernel.org/pub/scm/linux/kernel/git/arnd/playground.git compat_ioctl

      Arnd

Al Viro (2):
  compat_ioctl: unify copy-in of ppp filters
  compat_ioctl: move PPPIOCSCOMPRESS to ppp_generic

Arnd Bergmann (16):
  xfs: compat_ioctl: use compat_ptr()
  xfs: compat_ioctl: add missing conversions
  gfs2: add compat_ioctl support
  fs: compat_ioctl: move FITRIM emulation into file systems
  watchdog: cpwd: use generic compat_ptr_ioctl
  compat_ioctl: move WDIOC handling into wdt drivers
  compat_ioctl: reimplement SG_IO handling
  af_unix: add compat_ioctl support
  compat_ioctl: handle SIOCOUTQNSD
  compat_ioctl: move SIOCOUTQ out of compat_ioctl.c
  tty: handle compat PPP ioctls
  compat_ioctl: handle PPPIOCGIDLE for 64-bit time_t
  compat_ioctl: ppp: move simple commands into ppp_generic.c
  compat_ioctl: move SG_GET_REQUEST_TABLE handling
  pktcdvd: add compat_ioctl handler
  scsi: sd: enable compat ioctls for sed-opal

 Documentation/networking/ppp_generic.txt  |   2 +
 arch/powerpc/platforms/52xx/mpc52xx_gpt.c |   1 +
 arch/um/drivers/harddog_kern.c            |   1 +
 block/scsi_ioctl.c                        | 132 ++++++++-
 drivers/block/pktcdvd.c                   |  25 ++
 drivers/char/ipmi/ipmi_watchdog.c         |   1 +
 drivers/hwmon/fschmd.c                    |   1 +
 drivers/net/ppp/ppp_generic.c             | 245 ++++++++++-----
 drivers/rtc/rtc-ds1374.c                  |   1 +
 drivers/scsi/sd.c                         |  14 +-
 drivers/scsi/sg.c                         |  59 +++-
 drivers/tty/tty_io.c                      |   5 +
 drivers/watchdog/acquirewdt.c             |   1 +
 drivers/watchdog/advantechwdt.c           |   1 +
 drivers/watchdog/alim1535_wdt.c           |   1 +
 drivers/watchdog/alim7101_wdt.c           |   1 +
 drivers/watchdog/ar7_wdt.c                |   1 +
 drivers/watchdog/at91rm9200_wdt.c         |   1 +
 drivers/watchdog/ath79_wdt.c              |   1 +
 drivers/watchdog/bcm63xx_wdt.c            |   1 +
 drivers/watchdog/cpu5wdt.c                |   1 +
 drivers/watchdog/cpwd.c                   |  25 +-
 drivers/watchdog/eurotechwdt.c            |   1 +
 drivers/watchdog/f71808e_wdt.c            |   1 +
 drivers/watchdog/gef_wdt.c                |   1 +
 drivers/watchdog/geodewdt.c               |   1 +
 drivers/watchdog/ib700wdt.c               |   1 +
 drivers/watchdog/ibmasr.c                 |   1 +
 drivers/watchdog/indydog.c                |   1 +
 drivers/watchdog/intel_scu_watchdog.c     |   1 +
 drivers/watchdog/iop_wdt.c                |   1 +
 drivers/watchdog/it8712f_wdt.c            |   1 +
 drivers/watchdog/ixp4xx_wdt.c             |   1 +
 drivers/watchdog/ks8695_wdt.c             |   1 +
 drivers/watchdog/m54xx_wdt.c              |   1 +
 drivers/watchdog/machzwd.c                |   1 +
 drivers/watchdog/mixcomwd.c               |   1 +
 drivers/watchdog/mtx-1_wdt.c              |   1 +
 drivers/watchdog/mv64x60_wdt.c            |   1 +
 drivers/watchdog/nuc900_wdt.c             |   1 +
 drivers/watchdog/nv_tco.c                 |   1 +
 drivers/watchdog/pc87413_wdt.c            |   1 +
 drivers/watchdog/pcwd.c                   |   1 +
 drivers/watchdog/pcwd_pci.c               |   1 +
 drivers/watchdog/pcwd_usb.c               |   1 +
 drivers/watchdog/pika_wdt.c               |   1 +
 drivers/watchdog/pnx833x_wdt.c            |   1 +
 drivers/watchdog/rc32434_wdt.c            |   1 +
 drivers/watchdog/rdc321x_wdt.c            |   1 +
 drivers/watchdog/riowd.c                  |   1 +
 drivers/watchdog/sa1100_wdt.c             |   1 +
 drivers/watchdog/sb_wdog.c                |   1 +
 drivers/watchdog/sbc60xxwdt.c             |   1 +
 drivers/watchdog/sbc7240_wdt.c            |   1 +
 drivers/watchdog/sbc_epx_c3.c             |   1 +
 drivers/watchdog/sbc_fitpc2_wdt.c         |   1 +
 drivers/watchdog/sc1200wdt.c              |   1 +
 drivers/watchdog/sc520_wdt.c              |   1 +
 drivers/watchdog/sch311x_wdt.c            |   1 +
 drivers/watchdog/scx200_wdt.c             |   1 +
 drivers/watchdog/smsc37b787_wdt.c         |   1 +
 drivers/watchdog/w83877f_wdt.c            |   1 +
 drivers/watchdog/w83977f_wdt.c            |   1 +
 drivers/watchdog/wafer5823wdt.c           |   1 +
 drivers/watchdog/watchdog_dev.c           |   1 +
 drivers/watchdog/wdrtas.c                 |   1 +
 drivers/watchdog/wdt.c                    |   1 +
 drivers/watchdog/wdt285.c                 |   1 +
 drivers/watchdog/wdt977.c                 |   1 +
 drivers/watchdog/wdt_pci.c                |   1 +
 fs/compat_ioctl.c                         | 346 +---------------------
 fs/ecryptfs/file.c                        |   1 +
 fs/ext4/ioctl.c                           |   1 +
 fs/f2fs/file.c                            |   1 +
 fs/gfs2/file.c                            |  24 ++
 fs/hpfs/dir.c                             |   1 +
 fs/hpfs/file.c                            |   1 +
 fs/nilfs2/ioctl.c                         |   1 +
 fs/ocfs2/ioctl.c                          |   1 +
 fs/xfs/xfs_ioctl32.c                      |  11 +-
 include/linux/blkdev.h                    |   2 +
 include/uapi/linux/ppp-ioctl.h            |   2 +
 include/uapi/linux/ppp_defs.h             |  14 +
 lib/iov_iter.c                            |   1 +
 net/socket.c                              |   3 +
 net/unix/af_unix.c                        |  19 ++
 86 files changed, 526 insertions(+), 472 deletions(-)

-- 
2.20.0

Cc: davem@davemloft.net
Cc: axboe@kernel.dk
Cc: linux-block@vger.kernel.org
Cc: minyard@acm.org
Cc: gregkh@linuxfoundation.org
Cc: linux@roeck-us.net
Cc: alexandre.belloni@bootlin.com
Cc: jejb@linux.ibm.com
Cc: martin.petersen@oracle.com
Cc: dgilbert@interlog.com
Cc: jslaby@suse.com
Cc: wim@linux-watchdog.org
Cc: viro@zeniv.linux.org.uk
Cc: tytso@mit.edu
Cc: adilger.kernel@dilger.ca
Cc: jaegeuk@kernel.org
Cc: rpeterso@redhat.com
Cc: agruenba@redhat.com
Cc: mikulas@artax.karlin.mff.cuni.cz
Cc: konishi.ryusuke@gmail.com
Cc: jlbec@evilplan.org
Cc: joseph.qi@linux.alibaba.com
Cc: darrick.wong@oracle.com
Cc: linux-xfs@vger.kernel.org
Cc: netdev@vger.kernel.org
Cc: linux-kernel@vger.kernel.org
Cc: openipmi-developer@lists.sourceforge.net
Cc: linux-hwmon@vger.kernel.org
Cc: linux-ppp@vger.kernel.org
Cc: linux-rtc@vger.kernel.org
Cc: linux-scsi@vger.kernel.org
Cc: linux-watchdog@vger.kernel.org
Cc: linux-fsdevel@vger.kernel.org
Cc: ecryptfs@vger.kernel.org
Cc: linux-ext4@vger.kernel.org
Cc: linux-f2fs-devel@lists.sourceforge.net
Cc: cluster-devel@redhat.com
Cc: linux-nilfs@vger.kernel.org
Cc: ocfs2-devel@oss.oracle.com


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
