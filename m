Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 0ABF01099C4
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 26 Nov 2019 08:57:31 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1iZViz-0001sO-RT; Tue, 26 Nov 2019 07:57:29 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <prvs=22691bff3=damien.lemoal@wdc.com>)
 id 1iZViy-0001sD-SV
 for linux-f2fs-devel@lists.sourceforge.net; Tue, 26 Nov 2019 07:57:28 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=uXotREX51CiyposbzVLqO+KvjTyT4XGfgc6UpQK0x08=; b=lPczpTvnE/g4+QdlDdKapWyS8e
 z2jm1dr/GtPHu/7IpK7wrqf50kCJvRrz1evHDlZL/OLfG5F27ftPlYimaOvVUF32OdLuzINRIdx4P
 sRyfvxf2Wy+GdZhfBSI4wEY/sDRhbiz+3HxAdE8XIseVR9Zz6QPGTV8FrUXPQGRmmJ3w=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:Message-Id:Date:Subject:Cc:To:From
 :Sender:Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=uXotREX51CiyposbzVLqO+KvjTyT4XGfgc6UpQK0x08=; b=i
 eUsGjtpaxSv4WYGGKg5nHvIQYXDhXTVGiY5Hkxvmew7me+81flTgVXqo3YP8CFoOce9CzYMqf/MeM
 3aK5e8qkxtjtCAoFLTUUE21b9ybhKydyKwtuBWS53H55YpGV0kPlHmKxjGAcAsOjHvOc8JITsyRvU
 +99KAcXqUXZnZU0Q=;
Received: from esa2.hgst.iphmx.com ([68.232.143.124])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1iZViw-005qMd-M6
 for linux-f2fs-devel@lists.sourceforge.net; Tue, 26 Nov 2019 07:57:28 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1574755082; x=1606291082;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=WIegTzF55RGNat3aWcqEAV5DxrfODFbYbMq1bip5hAU=;
 b=JotiKao3inzy4+X6m5eHaEHEl55041KtgnJtyOCASJtnT/Mr4kylvGwW
 +66tfrvEXF8XCmjtf8pBwYj5HW/EQNJ5LuYvXUj9V8I1JZPbK9Bcjd7mw
 KxfxoLmE82C5qPQV3b7goWhBgXvzLiJfvLtbddsWs0LZcvGYFu9ucDffu
 U/18V4ZHPYZfo8rzELb5bsTJInH3S9gMRIVhGeCVTPtp3BOyBfwN9Mh9C
 UPwzL5Kw5jGz0f7J1F4A9zHZIbRdHPjG3FrnBj7ZsGXaH/gb2lt6QwpRT
 luXGw2b7c4n+SLCQ43V8oCVCDTOkvCPkiuh4bnEQeuX+wqeEJDYZfXTNM g==;
IronPort-SDR: 2QA3AUjGvfTwuePQEUeTf7A4BJlPCQ/Nrbp7JxjBzEBGnzR7c4WFRAcZbOUM/lxmTEltlKDQed
 U+IOALJaMuTDhvIvryJvOAEzS5cVcN2zFfUznhgtvpFlwqHk2WxMSS7ONajqggyQq6BxSDTZdm
 EzMPpGfwka323LatNk4aK0BW1XvyJvuhekY/6kyPMpzD8eT0mIvIFc6njRmniLK3W0J9zxgE+f
 jr98QiU3WemwJxecmIDQotaFLZrw7gheIZePEgb9hXFPkAwJNGYadY+6piBZqGQ8I5VQOIqTu2
 8S4=
X-IronPort-AV: E=Sophos;i="5.69,244,1571673600"; d="scan'208";a="225408845"
Received: from h199-255-45-14.hgst.com (HELO uls-op-cesaep01.wdc.com)
 ([199.255.45.14])
 by ob1.hgst.iphmx.com with ESMTP; 26 Nov 2019 15:57:53 +0800
IronPort-SDR: NIpSMMS3N998uVd/Vr07qcfrSkIHHaLb9CJbJM1KQ3DzG35fwzjrui+SikDH5XFA4xFLwaJ135
 9rCoixtX3x/a/B4UCo2VYg8Fn/ZENWSRj1fqt81lELnnROoUVTGdvO5cBe7PMcmwaeQeSQkOo9
 E2LJL374hWLQ+QKj45UmLQAqJibHXFUtlDALAAVwHhmAptUKFyfDRkMdp6xIntOqSkHfw55i7S
 5Zpew4Oeg7TlyVWPH8QqG2qu5OHpOJHULIHI08QO9NxzCzRPnAbNY5w4kLMiB2wZgaIyfMkACI
 ECs5+XnvPBiniWVCF/x5hxBQ
Received: from uls-op-cesaip01.wdc.com ([10.248.3.36])
 by uls-op-cesaep01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Nov 2019 23:52:22 -0800
IronPort-SDR: sxuwJ1p2iDmM5pXbjUF/DAx9OEkWJeCr7QyVHAX6TIUSkZSZpWZ+Pesxagx83phxenScE1wNk/
 mRIeItZUHcbUkhQ/J3eL88a62UAuwtlIRaLBNIbjdcKr+aPk8xUtoO2mU9EYUovW3sut6ngT3Z
 tx8edEQc8mOaatEK6eLtY/HoQ5aip5dEqqcx8YMJVoG0OMZgUEcZnkp/J3hPxAXLJwFfzaZ9L+
 cvJyT4QZ3h8nq/oE7t/wbdEnN/lcX4msHc+k+lkhJ1Ut0qLxdXePjX7PmLgmTiLQE1+HdgysYc
 XSM=
WDCIronportException: Internal
Received: from washi.fujisawa.hgst.com ([10.149.53.254])
 by uls-op-cesaip01.wdc.com with ESMTP; 25 Nov 2019 23:57:20 -0800
From: Damien Le Moal <damien.lemoal@wdc.com>
To: linux-f2fs-devel@lists.sourceforge.net, linux-kernel@vger.kernel.org,
 Jaegeuk Kim <jaegeuk@kernel.org>, Chao Yu <yuchao0@huawei.com>
Date: Tue, 26 Nov 2019 16:57:19 +0900
Message-Id: <20191126075719.1046485-1-damien.lemoal@wdc.com>
X-Mailer: git-send-email 2.23.0
MIME-Version: 1.0
X-Spam-Score: -0.1 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 0.0 URIBL_BLOCKED ADMINISTRATOR NOTICE: The query to URIBL was blocked.
 See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URIs: javigon.com]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 0.0 AWL AWL: Adjusted score from AWL reputation of From: address
X-Headers-End: 1iZViw-005qMd-M6
Subject: [f2fs-dev] [PATCH] f2fs: Fix direct IO handling
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
Cc: linux-fsdevel@vger.kernel.org, Javier Gonzalez <javier@javigon.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

f2fs_preallocate_blocks() identifies direct IOs using the IOCB_DIRECT
flag for a kiocb structure. However, the file system direct IO handler
function f2fs_direct_IO() may have decided that a direct IO has to be
exececuted as a buffered IO using the function f2fs_force_buffered_io().
This is the case for instance for volumes including zoned block device
and for unaligned write IOs with LFS mode enabled.

These 2 different methods of identifying direct IOs can result in
inconsistencies generating stale data access for direct reads after a
direct IO write that is treated as a buffered write. Fix this
inconsistency by combining the IOCB_DIRECT flag test with the result
of f2fs_force_buffered_io().

Reported-by: Javier Gonzalez <javier@javigon.com>
Signed-off-by: Damien Le Moal <damien.lemoal@wdc.com>
---
 fs/f2fs/data.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/fs/f2fs/data.c b/fs/f2fs/data.c
index 5755e897a5f0..8ac2d3b70022 100644
--- a/fs/f2fs/data.c
+++ b/fs/f2fs/data.c
@@ -1073,6 +1073,8 @@ int f2fs_preallocate_blocks(struct kiocb *iocb, struct iov_iter *from)
 	int flag;
 	int err = 0;
 	bool direct_io = iocb->ki_flags & IOCB_DIRECT;
+	bool do_direct_io = direct_io &&
+		!f2fs_force_buffered_io(inode, iocb, from);
 
 	/* convert inline data for Direct I/O*/
 	if (direct_io) {
@@ -1081,7 +1083,7 @@ int f2fs_preallocate_blocks(struct kiocb *iocb, struct iov_iter *from)
 			return err;
 	}
 
-	if (direct_io && allow_outplace_dio(inode, iocb, from))
+	if (do_direct_io && allow_outplace_dio(inode, iocb, from))
 		return 0;
 
 	if (is_inode_flag_set(inode, FI_NO_PREALLOC))
-- 
2.23.0



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
