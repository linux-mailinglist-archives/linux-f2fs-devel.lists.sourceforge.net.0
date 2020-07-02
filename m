Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 2073721290D
	for <lists+linux-f2fs-devel@lfdr.de>; Thu,  2 Jul 2020 18:10:12 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1jr1mq-0007bG-Fo; Thu, 02 Jul 2020 16:10:08 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <prvs=44573aa05=aravind.ramesh@wdc.com>)
 id 1jr1mq-0007b9-1t
 for linux-f2fs-devel@lists.sourceforge.net; Thu, 02 Jul 2020 16:10:08 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=RiTLTi6wlEH7BgZP1ncsIEfjYTQdTGJaj8T7Tc+1Mf0=; b=jjqDHIzEv0byGsoOJmK14mLl5D
 ZFshePWEMo4+ITz6O45tXchk1B5lcct7Z69QMCsH+cVGnX6tRvcbUS+TMrBAz7g2hxO7enpMW1SC9
 4BB7+dN3nCGzwGss3rrUXVAS8zxfe0/hUrmKOHSCsnfH+12tsryM3Bgknrb9XxpZzKQU=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:Message-Id:Date:Subject:Cc:To:From
 :Sender:Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=RiTLTi6wlEH7BgZP1ncsIEfjYTQdTGJaj8T7Tc+1Mf0=; b=L
 Yft9UN5jOuW82ab2iQ12S1jB90WB0g8nnb+CFK3NtJuvPqtsBbuyguR8e2fr96ZwPsYAeSQNfmnbS
 QbpWa04p053yvF7K6y2n1q6GIkh7rWK9Ppkirpd3EDZmGQACQ+1jZndPTz4F7yZmpLuoVwtYBQD3J
 YhmR4b+uYzxP8jfg=;
Received: from esa3.hgst.iphmx.com ([216.71.153.141])
 by sfi-mx-3.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1jr1mm-005v6l-79
 for linux-f2fs-devel@lists.sourceforge.net; Thu, 02 Jul 2020 16:10:08 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1593706204; x=1625242204;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=REDp/j//+rstq6qASxwCu01PzRiD+wjaJB1mP3fHxbs=;
 b=XoNrVlfW4ugCm8x16EwDUrzc1sZ5yYQJ5X7kz+aGaqwNHo/HMJfpfFMc
 wPKHBCCO2b1xgR+pBjSiRWXyVSEmFAqJiuWVGBghiMaD2ad1jeaKaIjzB
 aJm7NJtRRoDZek6aJ98zh8Gkx9biNSosiGopWUUAYPMnuVw4NxbJ815LN
 FzEhiTHcoDg3E09lKI7lBO4IUGaUtkGQ+k5302izZjX6j2RA02hsypKZt
 4QqGNdzdTZ+s1aaucVVl215Q6VjLPsX1OzMi4QpgexbqFw1jKDtuS0ky2
 oWUMsQe4cQDrV1oH77r8qIZUNFdJIbv6MxYTNAZXqcPi0tvj5JEied7JN g==;
IronPort-SDR: th55KyblOaSL0EhmbJ40keTSc2zCTOYbNkIDvcwAUIhHUXcyadmrJYB1hwMn0u3EyhmazEit0A
 aaXqY3ur8QCVbQFdQVwhPbj+bf6IRlcfPGWElJWEl+Ftk4qe5g+8kAPS3xjOq4hgRT9ZwrOA/T
 eEyE3+S/K+yaMLa/wq9vYlt6E1ZREH1xfhdwtZOAT0VbXJm/o9qYoD9nj9xReJAt1yQiEFfrOV
 T17qI3Pj27f43voKh9W7ZW++INv5mPb9cNh4L75OwUlqXSr4waJlwJ62vIJbanZhBZ9Nc/6ECV
 84k=
X-IronPort-AV: E=Sophos;i="5.75,304,1589212800"; d="scan'208";a="145822113"
Received: from uls-op-cesaip02.wdc.com (HELO uls-op-cesaep02.wdc.com)
 ([199.255.45.15])
 by ob1.hgst.iphmx.com with ESMTP; 02 Jul 2020 23:54:14 +0800
IronPort-SDR: OBIm6xDy1GvcXRM1GWoZlm/NXG3xLFrwqVuVZgXx3EJT7nDv+4+fzgTWLT4vtI1Bqcb1r575H8
 NY7ae/zm/qB74Ckagy9TXuHjV9JYY1y4Q=
Received: from uls-op-cesaip01.wdc.com ([10.248.3.36])
 by uls-op-cesaep02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Jul 2020 08:42:27 -0700
IronPort-SDR: 97YX9WJQ/bKlkxmCGpn2oWWEOZtPdf0qqcJbzReK9Opc5AUN3KnYlW1mKVFRfMdSVK+kLqD0QP
 zvvGtEVt4s7Q==
WDCIronportException: Internal
Received: from aravind-workstation.hgst.com (HELO localhost.localdomain)
 ([10.64.18.44])
 by uls-op-cesaip01.wdc.com with ESMTP; 02 Jul 2020 08:54:11 -0700
From: Aravind Ramesh <aravind.ramesh@wdc.com>
To: jaegeuk@kernel.org, yuchao0@huawei.com, linux-fsdevel@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net, hch@lst.de
Date: Thu,  2 Jul 2020 21:23:59 +0530
Message-Id: <20200702155401.13322-1-aravind.ramesh@wdc.com>
X-Mailer: git-send-email 2.19.1
MIME-Version: 1.0
X-Spam-Score: -0.5 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 -0.0 SPF_HELO_PASS          SPF: HELO matches SPF record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 0.0 URIBL_BLOCKED ADMINISTRATOR NOTICE: The query to URIBL was blocked.
 See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URIs: infradead.org]
 -0.3 AWL AWL: Adjusted score from AWL reputation of From: address
X-Headers-End: 1jr1mm-005v6l-79
Subject: [f2fs-dev] [PATCH 0/2] f2fs: zns zone-capacity support
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
space of a namespace into zones. Each zone provides a LBA range that shall
be written sequentially. An explicit reset of zone is needed to write to
the zone again.

ZNS defines a per-zone capacity which can be equal or less than the
zone-size. Zone-capacity is the number of usable blocks in the zone.
This patchset implements support for ZNS devices with a zone-capacity
that is less that the device zone-size.

The first patch checks if zone-capacity is less than zone-size, if it is,
then any segment which starts after the zone-capacity is marked as
not-free in the free segment bitmap at initial mount time. These segments
are marked as permanently used so they are not allocated for writes and
consequently not needed to be garbage collected. In case the zone-capacity
is not aligned to default segment size(2MB), then a segment can start
before the zone-capacity and span across zone-capacity boundary.
Such spanning segments are also considered as usable segments.

The second patch tracks the usable blocks in a spanning segment, so that
during writes and GC, usable blocks in spanning segment is calculated to
ensure writes/reads do not cross the zone-capacity boundary.

This series is based on the git tree
git://git.kernel.org/pub/scm/linux/kernel/git/jaegeuk/f2fs.git branch dev
and requires the below patch in order to build.
https://lore.kernel.org/linux-nvme/20200701063720.GA28954@lst.de/T/#m19e0197ae1837b7fe959b13fbc2a859b1f2abc1e

The above patch has been merged to the nvme-5.9 branch in the git tree:
git://git.infradead.org/nvme.git

Jaegeuk, perhaps you can carry this patch through your tree as well ?


Aravind Ramesh (2):
  f2fs: support zone capacity less than zone size
  f2fs: manage zone capacity during writes and gc

 fs/f2fs/f2fs.h    |   5 ++
 fs/f2fs/gc.c      |  27 +++++---
 fs/f2fs/gc.h      |  42 +++++++++++--
 fs/f2fs/segment.c | 154 ++++++++++++++++++++++++++++++++++++++++++----
 fs/f2fs/segment.h |  12 ++--
 fs/f2fs/super.c   |  41 ++++++++++--
 6 files changed, 247 insertions(+), 34 deletions(-)

-- 
2.19.1



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
