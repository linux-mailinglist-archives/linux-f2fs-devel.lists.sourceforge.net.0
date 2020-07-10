Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 4AF5421BC85
	for <lists+linux-f2fs-devel@lfdr.de>; Fri, 10 Jul 2020 19:44:27 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1jtx4Q-0007EN-7o; Fri, 10 Jul 2020 17:44:22 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <prvs=453bf6bcd=aravind.ramesh@wdc.com>)
 id 1jtx4O-0007EB-1J
 for linux-f2fs-devel@lists.sourceforge.net; Fri, 10 Jul 2020 17:44:20 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=5hTOH+QmCfnrhK/mqhbRpJ/RxnCtKUGZ8yaUDNcaGs4=; b=iajkI60D3HqjSnnnl3nuyz99q7
 o69YWHl5SbHPI/xIneD4hmcgMTSXTvcxMxBIwPA5bT+i0jl0tlkx0GdBXI/lI5XSOgzsrrV70P3Hy
 b7pKs58W12mbjt4EkjUQmO+v2HKftsPTHRT3ZizPVwLlNpgTQjaci6VmTwd7NFD60J9o=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:Message-Id:Date:Subject:Cc:To:From
 :Sender:Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=5hTOH+QmCfnrhK/mqhbRpJ/RxnCtKUGZ8yaUDNcaGs4=; b=I
 wFeU1O821UipC5rd25pjy/QoG3I3Ll+HO3EZlD6r3EB5ilEttAdWu5SpFds44Rhly9/eyTJOLTUgN
 O5Tz0NYTZ9l3o82UTOiocXg6lVqwzLvQiPK1kJxZE08AYhEB1W0unWpQv3VWhasuhVo8J1rxqEdSS
 HfSJ2dE2VfDA/R5Q=;
Received: from esa5.hgst.iphmx.com ([216.71.153.144])
 by sfi-mx-4.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1jtx4M-00GN8a-BI
 for linux-f2fs-devel@lists.sourceforge.net; Fri, 10 Jul 2020 17:44:19 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1594403058; x=1625939058;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=cbc3oM6oIgo9G4kTaaD0VNdPm5ejczfoBNVZTRiYqc0=;
 b=e2/pNTORW11e2BQwpyonY6HdodsZ0U9ZRax9aM5wJLowTJRtAufFtOTY
 f4Hlyi5/KcY/N7iSDXvowD8Jdb0Eo1rZpdfUiITnP7mQL/SyLIzdu/2jl
 yux02Sj54LEVfIyoPZl+EmDRwH2/o8o3wio06qVyMnXJGu0arhVALTLIi
 X4chs0/xklAVtRUCzOPqkZimt4/Fo3nBizbPQNMJn4YSWmkOcwPPDySu6
 gHh2uLs6oBJy42lYnnP3pYiW6HMHY3KxwLtjcM0rIJUqDq3Td9EAzmpV2
 wWteGG9FXBmET2HH39JFhNQ0rRHKQMv9KHwAt8HZnYwHPMgC6nfS2STNy w==;
IronPort-SDR: dWmkSREDPf78O1+Q5tcWSnAnusw6DJ5711CPi2S4whXhcRqkNnnVwEsSGkOVh6pRiGOaFfs0DA
 hX2vszUIC8DN4bdOB3rKKmvrdqXbsKXDSX+naxJLICjqVCsSHqV3BmEXwY4Zf7UEhzwbV+rpW6
 lYO7wIPZOeBDhQ09Y2YUkfPKulAwsp/iJaZ0sD5ew/xlS4wFD9NazBbMSMDIYM5eZ53rQz/cyJ
 WhulbuvIZEkj5NLbyDdhPxYwIHP98YcD2W2jeXqHV4iVKeUDWkzQShLOQStlNjR9ompUbQPZBH
 F6g=
X-IronPort-AV: E=Sophos;i="5.75,336,1589212800"; d="scan'208";a="142313669"
Received: from h199-255-45-14.hgst.com (HELO uls-op-cesaep01.wdc.com)
 ([199.255.45.14])
 by ob1.hgst.iphmx.com with ESMTP; 11 Jul 2020 01:44:01 +0800
IronPort-SDR: l8fOQJwrvVTk8/xC+39M2jSLo201kQQGGngGO2ToOy1YTFqpEhX0n2Ju2hFEpt93B8a0wYWHGZ
 YgxieNRk/KgwFqGiNDrkHVVlNhqoiOCa8=
Received: from uls-op-cesaip02.wdc.com ([10.248.3.37])
 by uls-op-cesaep01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Jul 2020 10:32:35 -0700
IronPort-SDR: blztnjK4Hr8mDDnOtUyUAVCX9Zd4cdtNa2WcuJVOvCmTXnXU9rOLJV21Gxa2bdRBhvM2Go+ebd
 hSRVNrEM6l3w==
WDCIronportException: Internal
Received: from aravind-workstation.hgst.com (HELO localhost.localdomain)
 ([10.64.18.44])
 by uls-op-cesaip02.wdc.com with ESMTP; 10 Jul 2020 10:43:58 -0700
From: Aravind Ramesh <aravind.ramesh@wdc.com>
To: jaegeuk@kernel.org, yuchao0@huawei.com, linux-fsdevel@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net, hch@lst.de
Date: Fri, 10 Jul 2020 23:13:52 +0530
Message-Id: <20200710174353.21988-1-aravind.ramesh@wdc.com>
X-Mailer: git-send-email 2.19.1
MIME-Version: 1.0
X-Spam-Score: -0.3 (/)
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
 -0.1 AWL AWL: Adjusted score from AWL reputation of From: address
X-Headers-End: 1jtx4M-00GN8a-BI
Subject: [f2fs-dev] [PATCH v2 0/1]  f2fs: zns zone-capacity support
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
 fs/f2fs/gc.c                       |  27 +++--
 fs/f2fs/gc.h                       |  42 +++++++-
 fs/f2fs/segment.c                  | 154 ++++++++++++++++++++++++++---
 fs/f2fs/segment.h                  |  21 ++--
 fs/f2fs/super.c                    |  41 ++++++--
 7 files changed, 267 insertions(+), 38 deletions(-)

-- 
2.19.1



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
