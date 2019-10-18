Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 532BDDBDBE
	for <lists+linux-f2fs-devel@lfdr.de>; Fri, 18 Oct 2019 08:39:16 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1iLLuo-00064a-8q; Fri, 18 Oct 2019 06:39:10 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <prvs=187ff726d=shinichiro.kawasaki@wdc.com>)
 id 1iLLun-00064N-09
 for linux-f2fs-devel@lists.sourceforge.net; Fri, 18 Oct 2019 06:39:09 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=g4shLEeAzRIqPCkzMY6V0n+pK1C9zoucNPceT4a61Kc=; b=ZfZxHBKryUfel9f7eOt4LnAQ3K
 X+mTF5ao8/ibFe069thQpt13PdTGp2qJhmtAlNg4vQYgpKKJBdcxGaKawl6KHlhaOlYWVHMMA7CiG
 gvK1UhQ78VOQWcH+PiTOoBmrbC8onnjaGwswVyqj1sIrjqXoF32vRHXNkgudFDNMV2sg=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:Message-Id:Date:Subject:Cc:To:From
 :Sender:Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=g4shLEeAzRIqPCkzMY6V0n+pK1C9zoucNPceT4a61Kc=; b=M
 Aw8fLQVlGZiI1i945CgTsO7am0j54BT1iZmxOWVddNzA4h1BuBCc8E0KgvTf+ul8BBvSiP7ZancC/
 W3s3+oBd8uGEaZ3YwUarH205n8lPmj+967JBZOr2jbikc9oWM7pb7Q4Yn24q4Ei4sI9txTmkrNAvK
 hnevzEUqvHoaThwY=;
Received: from esa5.hgst.iphmx.com ([216.71.153.144])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1iLLuk-006I5b-PQ
 for linux-f2fs-devel@lists.sourceforge.net; Fri, 18 Oct 2019 06:39:08 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1571380747; x=1602916747;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=ECrrfmwl/4vFXR6m5jhQofX90qwtcQviBUtdL8eu/HM=;
 b=LqmZGOmYQeQV4l3bAjqCT4tqr9SaVwyykiJXlOzp2FKYOHe/AHYmjSX9
 mDj/H8DCIRFz6JAMyuBiiAlkDKsOSKpGuA2wXvEQqlJYP4tcBHKkX9gsu
 AuQvofG9rEXl8ofe/5fKLY/KR736GnDsTKE9EfBg1cxV9nvrPPf0mdfzP
 QIlBnwm/EmOs9EKmx9zrBYqceaPzDIwwkduuFssnhnCe28zGlgJRQcmi5
 u7H5wATj8nlVcJku/i2vi2AhwDLMsKsxzayyP78JKlCBC4vuO2CrcCHsc
 YFLFJq2yh9Yi6m/6BBeYadXXIC6Z1jvD8nbb7i9RpeO/MiNzqTDH4m2XB g==;
IronPort-SDR: WjHB1a/G/AnbO2dVSpI3dz68RruvtsUBPpWcI25Ekr7LyrS8YS6wBhHXsnBKlg+8Zyg4Q/avXK
 z38zY3RodaN0cnMnuEhG9qpI5WIBiGMm+GcdaXG7CQRH9hQaF3O7EZ7pM5Hq1Wunb2vI7Q0z6v
 A+gXX2BWl2ombLWuPK6gggdJztHSZey6A1OoySwGCTURynr5AY/irTtCXOrmKezJ6tadBWKfSL
 Tk5L9MH3Tl66fWkRD9Jxiya4Nhe0bWGOruvnlpa8TxzXnZzhzItDyHv1a3jZXcnckOcpDmr+gv
 3tc=
X-IronPort-AV: E=Sophos;i="5.67,310,1566835200"; d="scan'208";a="121585261"
Received: from h199-255-45-15.hgst.com (HELO uls-op-cesaep02.wdc.com)
 ([199.255.45.15])
 by ob1.hgst.iphmx.com with ESMTP; 18 Oct 2019 14:39:02 +0800
IronPort-SDR: BGOEZICuwfRyYMqLYwyJZb5H6/DC6im+BdbkMTb7NbAawFuWXvOByFSOOupinRXG4POFCwrV+A
 VcrGmvXKKSXFZ7aToYbU+ftul9tBTCCwtow1NqZgaJZTbW0z2fPi+vpvPQ7oxHWMWzoWHVpkc9
 I+Dil2TzdH154jesPV8VsLw58YLSG60oEcRiQeIwZZTV5TnUsJCywhu6kJHumeuDj6HIgRyngX
 4pVJwxGRe0FzBnvmv0NQin6wnX5leOcvRu/0qTTO5jed6KJWaJ2DtoK6R2K4Jpfu2/QOPhNYYy
 i5HHE4ExP0cs71QfzNuc4qDk
Received: from uls-op-cesaip02.wdc.com ([10.248.3.37])
 by uls-op-cesaep02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Oct 2019 23:34:46 -0700
IronPort-SDR: MoMCdkyxmPcVBfwpnxkT0qdPgezbC7Xqvba7RfBmwQQInxYMm0maRHJLUNbqERyAoOk6M7nrWr
 b5EueyvfZ0CFo61MefbKO98pM/G7Y4jwjurSfHhVVnAHURscwrcd2pTC1OSVkV2mqCdFHLZst6
 CojGcvYWLD3YrM2vVN2cXTmoQwH+Mxjfr5+YTw7YFhs0eZzx2glheZ3Qru1eAJm/SQ/eFJGC/h
 6e1Ups0z+MvAP7tju3JlBITAenxsniq6ABXvM0KqRU86bWyKuOMllbtME3FqRoaGbHzl0+SWxe
 2uw=
WDCIronportException: Internal
Received: from shindev.dhcp.fujisawa.hgst.com (HELO shindev.fujisawa.hgst.com)
 ([10.149.52.166])
 by uls-op-cesaip02.wdc.com with ESMTP; 17 Oct 2019 23:39:01 -0700
From: Shin'ichiro Kawasaki <shinichiro.kawasaki@wdc.com>
To: Jaegeuk Kim <jaegeuk@kernel.org>, Chao Yu <yuchao0@huawei.com>,
 linux-f2fs-devel@lists.sourceforge.net
Date: Fri, 18 Oct 2019 15:38:57 +0900
Message-Id: <20191018063859.3082-1-shinichiro.kawasaki@wdc.com>
X-Mailer: git-send-email 2.21.0
MIME-Version: 1.0
X-Spam-Score: -0.1 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
X-Headers-End: 1iLLuk-006I5b-PQ
Subject: [f2fs-dev] [PATCH 0/2] f2fs: Check write pointers of zoned block
 devices
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
Cc: Damien Le Moal <Damien.LeMoal@wdc.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On sudden f2fs shutdown, zoned block device status and f2fs meta data can be
inconsistent. When f2fs shutdown happens during write operations, write pointers
on the device go forward but the f2fs meta data does not reflect the write
pointer progress. This inconsistency will eventually cause "Unaligned write
command" error when restarting write operation after the next mount.

This error is observed with xfstests test case generic/388, which enforces
sudden shutdown during write operation and checks the file system recovery.

This patch series adds a feature to f2fs to check and fix the write pointer
consistency when zoned block devices get mounted. Per discussion on the list,
implement two checks: a check for open zones and a check for non-open zones.

The first patch add the check for open zones that current segments point to.
Check write pointer consistency with current segment positions recorded in CP,
and if they are inconsistent, assign a new zone to the current segment. When
fsync data exists, check and fix the consistency after fsync data recovery.

The second patch adds the check for non-open zones that current segments do not
point to. Compare write pointers with valid block maps in SIT, and if they are
inconsistent, report the failure. Even if fixes are required, do not have kernel
fix because SIT consistency with CP is not guaranteed because of hardware
failure or software bug possibility. In such check failure cases, fail the mount
to ask users to run fsck. Corresponding patch series is being posted for
fsck.f2fs to add the write pointer consistency check feature.

Thank goes to Chao Yu for the detailed discussion on the list.

Shin'ichiro Kawasaki (2):
  f2fs: Check write pointer consistency of open zones
  f2fs: Check write pointer consistency of non-open zones

 fs/f2fs/f2fs.h     |   4 +
 fs/f2fs/recovery.c |   6 +
 fs/f2fs/segment.c  | 271 +++++++++++++++++++++++++++++++++++++++++++++
 fs/f2fs/super.c    |  17 ++-
 4 files changed, 295 insertions(+), 3 deletions(-)

-- 
2.21.0



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
