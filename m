Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 1CDDC4C6980
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 28 Feb 2022 12:09:12 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.94.2)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1nOdts-0005TC-Jg; Mon, 28 Feb 2022 11:09:07 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <jakobkoschel@gmail.com>)
 id 1nOdtq-0005ST-QQ; Mon, 28 Feb 2022 11:09:05 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=DGHuYFjchXbmgUIZ1SnPPgINXW2r1tGfV7LKxanZ5rw=; b=ThoOcUPaw0DFX/p8k2Ntrh+8Vs
 WbwS8qdwBiEBY24WryrqTA2fyrjoXyG0xKprlqOFstcrCrrcCADRP7V4nRtQLm/RtFiIwVbZ304j1
 LvFHMlAP6JDfsANfudVU+u1eeCMsnKlKPJqsIa1SiFqtMi48J2nQnYjXJbyt5RyLpiHY=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:Message-Id:Date:Subject:Cc:To:From
 :Sender:Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=DGHuYFjchXbmgUIZ1SnPPgINXW2r1tGfV7LKxanZ5rw=; b=c
 m/uGRHaRuXqKAmPeZf5kOO6wH7SJznKJc8/dDjMOtLLJekvquX+3brpXb71m/SKLkQ53au01Os+nP
 XjJPN9qKXEQKeKlQXIcPOaKcC/mILMa+FW50PZCDcl+9sTun6kV5z9pk+G70xI8Fr0szgZdvMYFRw
 bg9kUrraIDcijsxE=;
Received: from mail-ej1-f53.google.com ([209.85.218.53])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.94.2)
 id 1nOdtj-0007IF-Jg; Mon, 28 Feb 2022 11:09:04 +0000
Received: by mail-ej1-f53.google.com with SMTP id gb39so24032858ejc.1;
 Mon, 28 Feb 2022 03:08:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=DGHuYFjchXbmgUIZ1SnPPgINXW2r1tGfV7LKxanZ5rw=;
 b=mx6+xil8F/OwTucWDkjx4s8oWe9qKYEvq+lRSteVfL7qHoHjMYzOaON1c2kL9OYiTX
 db1Mykp/ffS9il6Fqi76pAlN/G5rXNdswBXj/5Gig3gkxoatbBHPRDADsVd/P2bKgern
 FiNaHDXHNfiQkUQdDT0QxGTuel99Vo9xYQqWbNfVZEfqWt3+vAZeTOc1QbByn6ecNGa6
 S2BlhLxmBqy/aCRkfkMxvBR+4RMiFfh+//eOhtERGL+8TdWCfHba+zdrYCDUyKUpjEKv
 GoJF4WvvVQmT7fMcDismFLp5shdM79FKyOLpnEpulQji7R6fg8Aw9kXLsIi9eJ28dAK+
 e6Aw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=DGHuYFjchXbmgUIZ1SnPPgINXW2r1tGfV7LKxanZ5rw=;
 b=Z6wKcmqTakK6TsRpiC+eYpbW2y3Ttd3HrOzli7ziEkqr2CwX6cGvA6CJU56KySkZVt
 sCnN7rpkzHfYGYELHcsZOeoWLYU6gJ2C2aFO70xP/A30sHLzeZ3ieStUxV64G1UovEVy
 /avUEyIFIKTxnZ7X+K6NSKzW196VpHNJhcpIp489RTa0staN2bHtmzePZQF5jAc8fQPM
 BOtcVxdcZcijHe6LsDnMcG/Ja98ij84Z1AbRhA2Qvu3nsMNFlslP7PURTs1/T8gQUmsO
 +AkvPwOh2vF2q1jfCGw7v/PA8CHAw2XiGb6fOGeBUuRRP4OGGLYxIQkSKFFluVHARSRI
 7h+g==
X-Gm-Message-State: AOAM530mnOvr9qyXbDOOGXlKszd1boDpxLAqHFE+lIWD1QKo0ITSYE+O
 8RgjTrGOAe+KW8NyHXY8N+k=
X-Google-Smtp-Source: ABdhPJzNctGRxtGORumk8xJxhLEhhYPBXw3MCY4PM4mZEwTJgQgzAy87Z2fgE8nw5jOtXDmEFeeNlg==
X-Received: by 2002:a17:906:32d8:b0:6ce:d850:f79 with SMTP id
 k24-20020a17090632d800b006ced8500f79mr14260258ejk.414.1646046532887; 
 Mon, 28 Feb 2022 03:08:52 -0800 (PST)
Received: from localhost.localdomain (dhcp-077-250-038-153.chello.nl.
 [77.250.38.153]) by smtp.googlemail.com with ESMTPSA id
 z22-20020a17090655d600b006d229436793sm4209049ejp.223.2022.02.28.03.08.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 28 Feb 2022 03:08:52 -0800 (PST)
From: Jakob Koschel <jakobkoschel@gmail.com>
To: Linus Torvalds <torvalds@linux-foundation.org>
Date: Mon, 28 Feb 2022 12:08:16 +0100
Message-Id: <20220228110822.491923-1-jakobkoschel@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  This is the first patch removing several categories of use
 cases of the list iterator variable past the loop. This is follow up to the
 discussion in: As concluded in: the correct use should be using a separate
 variable after the loop and using a 'tmp' variable as the list iterator.
 The list iterator will not point to a valid structure after the l [...] 
 Content analysis details:   (-0.2 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
 no trust [209.85.218.53 listed in list.dnswl.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 0.0 FREEMAIL_FROM          Sender email is commonly abused enduser mail
 provider [jakobkoschel[at]gmail.com]
 0.0 RCVD_IN_MSPIKE_H3      RBL: Good reputation (+3)
 [209.85.218.53 listed in wl.mailspike.net]
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
 -0.0 T_SCC_BODY_TEXT_LINE   No description available.
X-Headers-End: 1nOdtj-0007IF-Jg
Subject: [f2fs-dev] [PATCH 0/6] Remove usage of list iterator past the loop
 body
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
Cc: alsa-devel@alsa-project.org, linux-aspeed@lists.ozlabs.org,
 "Gustavo A. R. Silva" <gustavo@embeddedor.com>, linux-iio@vger.kernel.org,
 nouveau@lists.freedesktop.org, Rasmus Villemoes <linux@rasmusvillemoes.dk>,
 dri-devel@lists.freedesktop.org, Cristiano Giuffrida <c.giuffrida@vu.nl>,
 amd-gfx@lists.freedesktop.org, samba-technical@lists.samba.org,
 linux1394-devel@lists.sourceforge.net, drbd-dev@lists.linbit.com,
 linux-arch <linux-arch@vger.kernel.org>, linux-cifs@vger.kernel.org,
 kvm@vger.kernel.org, linux-scsi@vger.kernel.org, linux-rdma@vger.kernel.org,
 linux-staging@lists.linux.dev, "Bos, H.J." <h.j.bos@vu.nl>,
 Jason Gunthorpe <jgg@ziepe.ca>, intel-wired-lan@lists.osuosl.org,
 kgdb-bugreport@lists.sourceforge.net, bcm-kernel-feedback-list@broadcom.com,
 Dan Carpenter <dan.carpenter@oracle.com>, linux-media@vger.kernel.org,
 Kees Cook <keescook@chromium.org>, Arnd Bergman <arnd@arndb.de>,
 linux-pm@vger.kernel.org, intel-gfx@lists.freedesktop.org,
 Brian Johannesmeyer <bjohannesmeyer@gmail.com>,
 Nathan Chancellor <nathan@kernel.org>, linux-fsdevel@vger.kernel.org,
 Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
 Jakob Koschel <jakobkoschel@gmail.com>, v9fs-developer@lists.sourceforge.net,
 linux-tegra@vger.kernel.org, Thomas Gleixner <tglx@linutronix.de>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 linux-arm-kernel@lists.infradead.org, linux-sgx@vger.kernel.org,
 linux-block@vger.kernel.org, netdev@vger.kernel.org, linux-usb@vger.kernel.org,
 linux-wireless@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net, tipc-discussion@lists.sourceforge.net,
 linux-crypto@vger.kernel.org, dmaengine@vger.kernel.org,
 linux-mediatek@lists.infradead.org, Andrew Morton <akpm@linux-foundation.org>,
 linuxppc-dev@lists.ozlabs.org, Mike Rapoport <rppt@kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

This is the first patch removing several categories of use cases of
the list iterator variable past the loop.
This is follow up to the discussion in:
https://lore.kernel.org/all/20220217184829.1991035-1-jakobkoschel@gmail.com/

As concluded in:
https://lore.kernel.org/all/YhdfEIwI4EdtHdym@kroah.com/
the correct use should be using a separate variable after the loop
and using a 'tmp' variable as the list iterator.
The list iterator will not point to a valid structure after the loop
if no break/goto was hit. Invalid uses of the list iterator variable
can be avoided altogether by simply using a separate pointer to
iterate the list.

Linus and Greg agreed on the following pattern:

-	struct gr_request *req;
+	struct gr_request *req = NULL;
+	struct gr_request *tmp;
	struct gr_ep *ep;
	int ret = 0;

-	list_for_each_entry(req, &ep->queue, queue) {
-		if (&req->req == _req)
+	list_for_each_entry(tmp, &ep->queue, queue) {
+		if (&tmp->req == _req) {
+			req = tmp;
			break;
+		}
	}
-	if (&req->req != _req) {
+	if (!req) {
		ret = -EINVAL;
		goto out;
	}


With gnu89 the list iterator variable cannot yet be declared
within the for loop of the list iterator.
Moving to a more modern version of C would allow defining
the list iterator variable within the macro, limiting
the scope to the loop.
This avoids any incorrect usage past the loop altogether.

This are around 30% of the cases where the iterator
variable is used past the loop (identified with a slightly
modified version of use_after_iter.cocci).
I've decided to split it into at a few patches separated
by similar use cases.

Because the output of get_maintainer.pl was too big,
I included all the found lists and everyone from the
previous discussion.

Jakob Koschel (6):
  drivers: usb: remove usage of list iterator past the loop body
  treewide: remove using list iterator after loop body as a ptr
  treewide: fix incorrect use to determine if list is empty
  drivers: remove unnecessary use of list iterator variable
  treewide: remove dereference of list iterator after loop body
  treewide: remove check of list iterator against head past the loop
    body

 arch/arm/mach-mmp/sram.c                      |  9 ++--
 arch/arm/plat-pxa/ssp.c                       | 28 +++++-------
 arch/powerpc/sysdev/fsl_gtm.c                 |  4 +-
 arch/x86/kernel/cpu/sgx/encl.c                |  6 ++-
 drivers/block/drbd/drbd_req.c                 | 45 ++++++++++++-------
 drivers/counter/counter-chrdev.c              | 26 ++++++-----
 drivers/crypto/cavium/nitrox/nitrox_main.c    | 11 +++--
 drivers/dma/dw-edma/dw-edma-core.c            |  4 +-
 drivers/dma/ppc4xx/adma.c                     | 11 +++--
 drivers/firewire/core-transaction.c           | 32 +++++++------
 drivers/firewire/sbp2.c                       | 14 +++---
 drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c        | 19 +++++---
 drivers/gpu/drm/drm_memory.c                  | 15 ++++---
 drivers/gpu/drm/drm_mm.c                      | 17 ++++---
 drivers/gpu/drm/drm_vm.c                      | 13 +++---
 drivers/gpu/drm/gma500/oaktrail_lvds.c        |  9 ++--
 drivers/gpu/drm/i915/gem/i915_gem_context.c   | 14 +++---
 .../gpu/drm/i915/gem/i915_gem_execbuffer.c    | 15 ++++---
 drivers/gpu/drm/i915/gt/intel_ring.c          | 15 ++++---
 .../gpu/drm/nouveau/nvkm/subdev/clk/base.c    | 11 +++--
 .../gpu/drm/nouveau/nvkm/subdev/fb/ramgk104.c | 13 +++---
 drivers/gpu/drm/scheduler/sched_main.c        | 14 +++---
 drivers/gpu/drm/ttm/ttm_bo.c                  | 19 ++++----
 drivers/gpu/drm/vmwgfx/vmwgfx_kms.c           | 22 +++++----
 drivers/infiniband/hw/hfi1/tid_rdma.c         | 16 ++++---
 drivers/infiniband/hw/mlx4/main.c             | 12 ++---
 drivers/media/dvb-frontends/mxl5xx.c          | 11 +++--
 drivers/media/pci/saa7134/saa7134-alsa.c      |  4 +-
 drivers/media/v4l2-core/v4l2-ctrls-api.c      | 31 +++++++------
 drivers/misc/mei/interrupt.c                  | 12 ++---
 .../net/ethernet/intel/i40e/i40e_ethtool.c    |  3 +-
 .../net/ethernet/qlogic/qede/qede_filter.c    | 11 +++--
 drivers/net/wireless/ath/ath6kl/htc_mbox.c    |  2 +-
 .../net/wireless/intel/ipw2x00/libipw_rx.c    | 15 ++++---
 drivers/perf/xgene_pmu.c                      | 13 +++---
 drivers/power/supply/cpcap-battery.c          | 11 +++--
 drivers/scsi/lpfc/lpfc_bsg.c                  | 16 ++++---
 drivers/scsi/scsi_transport_sas.c             | 17 ++++---
 drivers/scsi/wd719x.c                         | 12 +++--
 drivers/staging/rtl8192e/rtl819x_TSProc.c     | 17 +++----
 drivers/staging/rtl8192e/rtllib_rx.c          | 17 ++++---
 .../staging/rtl8192u/ieee80211/ieee80211_rx.c | 15 ++++---
 .../rtl8192u/ieee80211/rtl819x_TSProc.c       | 19 ++++----
 drivers/thermal/thermal_core.c                | 38 ++++++++++------
 drivers/usb/gadget/composite.c                |  9 ++--
 drivers/usb/gadget/configfs.c                 | 22 +++++----
 drivers/usb/gadget/udc/aspeed-vhub/epn.c      | 11 +++--
 drivers/usb/gadget/udc/at91_udc.c             | 26 ++++++-----
 drivers/usb/gadget/udc/atmel_usba_udc.c       | 11 +++--
 drivers/usb/gadget/udc/bdc/bdc_ep.c           | 11 +++--
 drivers/usb/gadget/udc/fsl_qe_udc.c           | 11 +++--
 drivers/usb/gadget/udc/fsl_udc_core.c         | 11 +++--
 drivers/usb/gadget/udc/goku_udc.c             | 11 +++--
 drivers/usb/gadget/udc/gr_udc.c               | 11 +++--
 drivers/usb/gadget/udc/lpc32xx_udc.c          | 11 +++--
 drivers/usb/gadget/udc/max3420_udc.c          | 11 +++--
 drivers/usb/gadget/udc/mv_u3d_core.c          | 11 +++--
 drivers/usb/gadget/udc/mv_udc_core.c          | 11 +++--
 drivers/usb/gadget/udc/net2272.c              | 12 ++---
 drivers/usb/gadget/udc/net2280.c              | 11 +++--
 drivers/usb/gadget/udc/omap_udc.c             | 11 +++--
 drivers/usb/gadget/udc/pxa25x_udc.c           | 11 +++--
 drivers/usb/gadget/udc/s3c-hsudc.c            | 11 +++--
 drivers/usb/gadget/udc/tegra-xudc.c           | 11 +++--
 drivers/usb/gadget/udc/udc-xilinx.c           | 11 +++--
 drivers/usb/mtu3/mtu3_gadget.c                | 11 +++--
 drivers/usb/musb/musb_gadget.c                | 11 +++--
 drivers/vfio/mdev/mdev_core.c                 | 11 +++--
 fs/cifs/smb2misc.c                            | 10 +++--
 fs/f2fs/segment.c                             |  9 ++--
 fs/proc/kcore.c                               | 13 +++---
 kernel/debug/kdb/kdb_main.c                   | 36 +++++++++------
 kernel/power/snapshot.c                       | 10 +++--
 kernel/trace/ftrace.c                         | 22 +++++----
 kernel/trace/trace_eprobe.c                   | 15 ++++---
 kernel/trace/trace_events.c                   | 11 ++---
 net/9p/trans_xen.c                            | 11 +++--
 net/ipv4/udp_tunnel_nic.c                     | 10 +++--
 net/tipc/name_table.c                         | 11 +++--
 net/tipc/socket.c                             | 11 +++--
 net/xfrm/xfrm_ipcomp.c                        | 11 +++--
 sound/soc/intel/catpt/pcm.c                   | 13 +++---
 sound/soc/sprd/sprd-mcdt.c                    | 13 +++---
 83 files changed, 708 insertions(+), 465 deletions(-)


base-commit: 7ee022567bf9e2e0b3cd92461a2f4986ecc99673
--
2.25.1


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
