Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 6ECB622231C
	for <lists+linux-f2fs-devel@lfdr.de>; Thu, 16 Jul 2020 14:57:21 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1jw3Rv-0008JL-RU; Thu, 16 Jul 2020 12:57:19 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <prvs=45955ca59=aravind.ramesh@wdc.com>)
 id 1jw3Rt-0008J7-Lh
 for linux-f2fs-devel@lists.sourceforge.net; Thu, 16 Jul 2020 12:57:17 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=Q+v2pIqll9+zu7tqDdF5EIu0PBlCbomgVfd6KL4f9tk=; b=OA8npsE9uPa16BPe8bib+Kyc1U
 NMh0tP4wjA9XP7LJZKDFwLrQXIk+UvR0GEXRWREjTgIAtxgvEWPPnkluMO3jSalXhG6UjM+3j6cAZ
 zQwUPhhNPmPTugD+BA0VxG7H/GyLfnp/zQloR724KqssSaqpqK+P0vWBO479Njj5cNIo=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:Message-Id:Date:Subject:Cc:To:From
 :Sender:Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=Q+v2pIqll9+zu7tqDdF5EIu0PBlCbomgVfd6KL4f9tk=; b=J
 g7Tyi6aBFusIadn6qytPjTlT53EtqZdTpuOCSliC2QbUkRmPVBhTZo1D1zC8OWg24siA7kd+JhIiI
 Fktt21XJVG18g00mD6Yz1rz8WMOBv8t0vp/sJ2Lvz5LihMky29UTNVhC393rK18HTLDZNgVizy6K9
 7gYQmk1UutR2O2P8=;
Received: from esa3.hgst.iphmx.com ([216.71.153.141])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1jw3Rr-00ALSq-JW
 for linux-f2fs-devel@lists.sourceforge.net; Thu, 16 Jul 2020 12:57:17 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1594904236; x=1626440236;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=O4pD4LKgfWrCrqA+gwkTvaHq9NmrFkB/x0RL4K2+7i8=;
 b=aOM0c9gP/7L/6c5i44SRAmrb6XmIcJ/lXlnomo4ovro6VXDzyoZb2QGs
 heECxR5pQqdCliOf57u7dMUYKeasZfW/zddx+LWqzqlJIyUIt0VjOccYR
 kMu8QnPmAjfijAiLLuipyM+pGH8idD0rAn65dvI3BMb9kxQhKNxP6Uweh
 PGzE/LqDIojtEAclR2/SHFVL234DeMu/kubWFgOawXM0752r0SWlXG0bp
 XIwJbeuyQkp2Zy49ho6q9QzhlmWB4ncGEErera6Rk7sm2fdre41cfC0uW
 cejR8ZMwuZuHdm4cDV/hTL+AhgOlJLTHti3dOznQuU8P5ya7oIkCVqr95 g==;
IronPort-SDR: z6zINDVjayQ4RAJ+xTuffsf+udMg0sBqA5RehHXs7o1DGv7qsjHsZLAE140cpKIAq6NkeSSTvR
 IGjLQNb/1DKZ1NG+vQMdYmJu72Kze1d6BMYLoMjCO9ONdDOWGshI7u4mA8vh4fXqvaAT+M9o9W
 UV84G0zukP1STwuyR0L8pIUKHD3aTcrl2wplZJsHvB+1XwC1cXa0DuzhTm7mdKhojtFbVED94/
 oMtdvc2KT+DPQ8cYT4vY6p71ppUGO5Bg2hwNHWFsRl7a/VrUovnwblF6I7GxOWxUwHHe/gnbn1
 UQg=
X-IronPort-AV: E=Sophos;i="5.75,359,1589212800"; d="scan'208";a="146914156"
Received: from uls-op-cesaip02.wdc.com (HELO uls-op-cesaep02.wdc.com)
 ([199.255.45.15])
 by ob1.hgst.iphmx.com with ESMTP; 16 Jul 2020 20:57:11 +0800
IronPort-SDR: WpYzYwh4bPfH9c3eDJgAJbDAUE7Gm4c86mQDWgKI8BPKQnf5/uVkt78/ylpaiwcbtEqr0dG4qL
 N/3R1gKlWhOGFqUEaRPRDtS2ffZRoEHWI=
Received: from uls-op-cesaip02.wdc.com ([10.248.3.37])
 by uls-op-cesaep02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Jul 2020 05:45:00 -0700
IronPort-SDR: jwUi6ApyP6ObeZO3mn/yzERb4lN3QSYJn4ZXDLU21ymnn84Md26CFnNspBAwPANeIyxcqX8zyi
 QL1atI/7JmLA==
WDCIronportException: Internal
Received: from aravind-workstation.hgst.com (HELO localhost.localdomain)
 ([10.64.18.44])
 by uls-op-cesaip02.wdc.com with ESMTP; 16 Jul 2020 05:57:08 -0700
From: Aravind Ramesh <aravind.ramesh@wdc.com>
To: jaegeuk@kernel.org, yuchao0@huawei.com, linux-fsdevel@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net, hch@lst.de
Date: Thu, 16 Jul 2020 18:26:55 +0530
Message-Id: <20200716125656.3662-1-aravind.ramesh@wdc.com>
X-Mailer: git-send-email 2.19.1
MIME-Version: 1.0
X-Spam-Score: -0.1 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 0.0 URIBL_BLOCKED ADMINISTRATOR NOTICE: The query to URIBL was blocked.
 See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URIs: infradead.org]
 -0.0 SPF_HELO_PASS          SPF: HELO matches SPF record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
X-Headers-End: 1jw3Rr-00ALSq-JW
Subject: [f2fs-dev] [PATCH v3 0/1] f2fs: zns zone-capacity support
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
Cc: niklas.cassel@wdc.com, Damien.LeMoal@wdc.com,
 Aravind Ramesh <aravind.ramesh@wdc.com>, matias.bjorling@wdc.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

NVM Express Zoned Namespace command set specification allows host software
to communicate with a NVM subsystem using zones. ZNS defines a host-managed
zoned block device model for NVMe devices. It divides the logical address
space of a namespace into zones. Each zone provides a LBA range that
shall be written sequentially. An explicit reset of zone is needed to write to
the zone again.

ZNS defines a per-zone capacity which can be equal or less than the
zone-size. Zone-capacity is the number of usable blocks in the zone.
This patchset implements support for ZNS devices with a zone-capacity
that is less that the device zone-size.

This patch checks if zone-capacity is less than zone-size, if it is,
then any segment which starts after the zone-capacity is marked as
not-free in the free segment bitmap at initial mount time. These segments
are marked as permanently used so they are not allocated for writes and
consequently not needed to be garbage collected. In case the zone-capacity
is not aligned to default segment size(2MB), then a segment can start
before the zone-capacity and span across zone-capacity boundary.
Such spanning segments are also considered as usable segments. It tracks
the usable blocks in a spanning segment, so that during writes and GC,
usable blocks in spanning segment is calculated to ensure writes/reads
do not cross the zone-capacity boundary.

This patch is based on the git tree
git://git.kernel.org/pub/scm/linux/kernel/git/jaegeuk/f2fs.git branch dev
and requires the below patch in order to build.
https://lore.kernel.org/linux-nvme/20200701063720.GA28954@lst.de/T/#m19e0197ae1837b7fe959b13fbc2a859b1f2abc1e

The above patch has been merged to the nvme-5.9 branch in the git tree:
git://git.infradead.org/nvme.git

Aravind Ramesh (1):
  f2fs: support zone capacity less than zone size

 Documentation/filesystems/f2fs.rst |  15 +++
 fs/f2fs/f2fs.h                     |   5 +
 fs/f2fs/gc.c                       |  25 +++--
 fs/f2fs/gc.h                       |  44 +++++++-
 fs/f2fs/segment.c                  | 156 ++++++++++++++++++++++++++---
 fs/f2fs/segment.h                  |  26 +++--
 fs/f2fs/super.c                    |  41 ++++++--
 7 files changed, 275 insertions(+), 37 deletions(-)

-- 
2.19.1



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
