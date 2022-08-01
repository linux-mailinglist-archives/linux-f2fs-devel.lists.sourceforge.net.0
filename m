Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 816A4586394
	for <lists+linux-f2fs-devel@lfdr.de>; Mon,  1 Aug 2022 06:40:25 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.94.2)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1oINE3-0004LE-Ko; Mon, 01 Aug 2022 04:40:20 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <eunhee83.rho@samsung.com>) id 1oINE1-0004L8-SI
 for linux-f2fs-devel@lists.sourceforge.net; Mon, 01 Aug 2022 04:40:18 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=References:Content-Type:Content-Transfer-Encoding:
 Date:Message-ID:In-Reply-To:To:From:Sender:Reply-To:Subject:Mime-Version:Cc:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=hzbhYOqkA0ybVjCJXM7h/bXExcppfaT3rHZaniOrLxw=; b=B7q5803Bi9pBHWCPlFUU7hSgyF
 jzVZYuU5BgL2d3H7ez89IYsbGXw0ijW/ParSu/iu8o/LPkwb9fdmuwFmxJ4/wOpaghbWUWbRSMt7y
 qfIi+awWHxpEklX/K7txsRxOrNc9k0YHZjBztms1M/S7fM3lZTeEkENIVI/Cg9cWsGTc=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=References:Content-Type:Content-Transfer-Encoding:Date:Message-ID:
 In-Reply-To:To:From:Sender:Reply-To:Subject:Mime-Version:Cc:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=hzbhYOqkA0ybVjCJXM7h/bXExcppfaT3rHZaniOrLxw=; b=gg7ZKIryCAO92sBozxzugCITiy
 G2Kf7MyZtvNTfcxn6WS4Z0jv3MqPwsRneKticiiui2p5wmywjZLt+0lxFZ5w7NhxEpGSJknuFUuv3
 XYT25UanGXBFjLTlasV9GvWzkrZ+6giq0LPmeJk0fKA6aJX1HqloMH1oThYTTmJ7uhKQ=;
Received: from mailout3.samsung.com ([203.254.224.33])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.94.2)
 id 1oINDx-0002OZ-Ar
 for linux-f2fs-devel@lists.sourceforge.net; Mon, 01 Aug 2022 04:40:18 +0000
Received: from epcas2p1.samsung.com (unknown [182.195.41.53])
 by mailout3.samsung.com (KnoxPortal) with ESMTP id
 20220801044003epoutp0348de0694c108325dcbbd6dd683bbdc45~HHsFaEliV1964619646epoutp03k
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Mon,  1 Aug 2022 04:40:03 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout3.samsung.com
 20220801044003epoutp0348de0694c108325dcbbd6dd683bbdc45~HHsFaEliV1964619646epoutp03k
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
 s=mail20170921; t=1659328803;
 bh=hzbhYOqkA0ybVjCJXM7h/bXExcppfaT3rHZaniOrLxw=;
 h=Subject:Reply-To:From:To:In-Reply-To:Date:References:From;
 b=aNXycnH/j+wLhJf8VcZHc0w8lW51psbMR+xmQum32mTx2jyqjMKQqRhnuORMsZfGc
 VqUrl3P8FY31eV+npfYxvguVcsMcTmfVyFe68LQKPdc6MIybAza0+KRsMeY5iyaplE
 DT9x5l4gLQOoRU+V5nVwQGBiEGI0S78521NAX/48=
Received: from epsnrtp3.localdomain (unknown [182.195.42.164]) by
 epcas2p2.samsung.com (KnoxPortal) with ESMTP id
 20220801044002epcas2p25ff9d7be2d3e639947b880e93769a660~HHsEydK4h1270312703epcas2p2f;
 Mon,  1 Aug 2022 04:40:02 +0000 (GMT)
Received: from epsmges2p1.samsung.com (unknown [182.195.36.68]) by
 epsnrtp3.localdomain (Postfix) with ESMTP id 4Lx55G3gZWz4x9QZ; Mon,  1 Aug
 2022 04:40:02 +0000 (GMT)
X-AuditID: b6c32a45-45bff700000025c2-ce-62e7592258dc
Received: from epcas2p4.samsung.com ( [182.195.41.56]) by
 epsmges2p1.samsung.com (Symantec Messaging Gateway) with SMTP id
 3E.C5.09666.22957E26; Mon,  1 Aug 2022 13:40:02 +0900 (KST)
Mime-Version: 1.0
From: Eunhee Rho <eunhee83.rho@samsung.com>
To: Jaegeuk Kim <jaegeuk@kernel.org>, "chao@kernel.org" <chao@kernel.org>,
 "linux-f2fs-devel@lists.sourceforge.net"
 <linux-f2fs-devel@lists.sourceforge.net>, "linux-kernel@vger.kernel.org"
 <linux-kernel@vger.kernel.org>
X-Priority: 3
X-Content-Kind-Code: NORMAL
In-Reply-To: <20220801040607epcms2p82da0594039ba5f1ed77c451e2d13c965@epcms2p8>
X-CPGS-Detection: blocking_info_exchange
X-Drm-Type: N,general
X-Msg-Generator: Mail
X-Msg-Type: PERSONAL
X-Reply-Demand: N
Message-ID: <20220801044002epcms2p5a832b87ab1e6c8f0391d8d26f33c042c@epcms2p5>
Date: Mon, 01 Aug 2022 13:40:02 +0900
X-CMS-MailID: 20220801044002epcms2p5a832b87ab1e6c8f0391d8d26f33c042c
X-Sendblock-Type: AUTO_CONFIDENTIAL
X-CPGSPASS: Y
X-CPGSPASS: Y
CMS-TYPE: 102P
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFvrCKsWRmVeSWpSXmKPExsWy7bCmha5S5PMkgzmzJC1OTz3LZPHykKbF
 k/WzmC0uLXK3uLxrDpsDq8emVZ1sHrsXfGby6NuyitHj8ya5AJaobJuM1MSU1CKF1Lzk/JTM
 vHRbJe/geOd4UzMDQ11DSwtzJYW8xNxUWyUXnwBdt8wcoK1KCmWJOaVAoYDE4mIlfTubovzS
 klSFjPziElul1IKUnALzAr3ixNzi0rx0vbzUEitDAwMjU6DChOyMI68TCxawV/ya/4W5gfED
 axcjJ4eEgInE1jPvWLoYuTiEBHYwSny+fYi9i5GDg1dAUOLvDmGQGmEBB4kTUzczgdhCAkoS
 fw/eZ4KI60pM2TKJEcRmE9CWuHK8nRVkjojAQ0aJD0e2MUEs4JWY0f6UBcKWlti+fCtYA6eA
 n8SyrodQNRoSP5b1MkPYohI3V79lh7HfH5vPCGGLSLTeOwtVIyjx4OduqLiExN2NLWwQdr5E
 z5OjUDMrJHauuApVoy9xrWMj2A28Ar4Sn45OAJvPIqAqsWfNHqhdLhKb5rwHm8MsIC+x/e0c
 ZlA4MAtoSqzfpQ9iSggoSxy5xQLzVcPG3+zobGYBPomOw3/h4jvmPYG6Rk1i8ccF0CCXkbix
 4T7TBEalWYiAnoVk7yyEvQsYmVcxiqUWFOempxYbFRjCozY5P3cTIzj5abnuYJz89oPeIUYm
 DsZDjBIczEoivHdcnicJ8aYkVlalFuXHF5XmpBYfYjQF+ngis5Rocj4w/eaVxBuaWBqYmJkZ
 mhuZGpgrifN6pWxIFBJITyxJzU5NLUgtgulj4uCUamASk5vSddz9fiif9pYWgadGzjv/Bqs9
 U7/ntKfqy5G9zevvPHh/9eHVB9MLv/g+Zk9/KnJt8Uoz9i/nf4Rv9ks40N0dfKTsXW+gmQ93
 yps5gdEd9bzpC9boLqsQPWAwp4L5/IRO79uJHnG5kzPueFwtnhEU5bvsQ1/wL9viFbnnJZgy
 fJ4kMTsyt+/hFDmhsaxQdOOyea4Ls2u/3KoWm6J2/JHJ6lMX1GSq1/aw+jdsbXGUnvOD+6jD
 kqBSc58Pmgty7e4ox62tKnS1Wft5DY81/9cq/2t1X3Kb/RhfTI9MmLshNT5O/NORbxZNJyvC
 M2ZV3ua+IVdaz/g5863W0p2nbb7zMaXLmPmzNjrHGCmxFGckGmoxFxUnAgDxZxfnBwQAAA==
DLP-Filter: Pass
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20220729002517epcms2p35eed262c3349287436c1848ab350c2d4
References: <20220801040607epcms2p82da0594039ba5f1ed77c451e2d13c965@epcms2p8>
 <YuXZSTw4reBDtLgk@google.com>
 <20220729002517epcms2p35eed262c3349287436c1848ab350c2d4@epcms2p3>
 <CGME20220729002517epcms2p35eed262c3349287436c1848ab350c2d4@epcms2p5>
X-Spam-Score: -3.2 (---)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  To ensure serialized IOs, f2fs allows only LFS mode for zoned
 device. Remove redundant check for direct IO. Signed-off-by: Eunhee Rho
 <eunhee83.rho@samsung.com>
 --- fs/f2fs/f2fs.h | 7 +------ 1 file changed, 1 insertion(+), 6 deletions(-)
 Content analysis details:   (-3.2 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 RCVD_IN_MSPIKE_H3      RBL: Good reputation (+3)
 [203.254.224.33 listed in wl.mailspike.net]
 -2.3 RCVD_IN_DNSWL_MED      RBL: Sender listed at https://www.dnswl.org/,
 medium trust [203.254.224.33 listed in list.dnswl.org]
 -0.0 SPF_HELO_PASS          SPF: HELO matches SPF record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
 -0.7 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1oINDx-0002OZ-Ar
Subject: [f2fs-dev] [PATCH v1] f2fs: remove device type check for direct IO
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
Reply-To: eunhee83.rho@samsung.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

To ensure serialized IOs, f2fs allows only LFS mode for zoned
device. Remove redundant check for direct IO.

Signed-off-by: Eunhee Rho <eunhee83.rho@samsung.com>
---
 fs/f2fs/f2fs.h | 7 +------
 1 file changed, 1 insertion(+), 6 deletions(-)

diff --git a/fs/f2fs/f2fs.h b/fs/f2fs/f2fs.h
index ecd870e5d6da..ca9354746eec 100644
--- a/fs/f2fs/f2fs.h
+++ b/fs/f2fs/f2fs.h
@@ -4496,12 +4496,7 @@ static inline bool f2fs_force_buffered_io(struct inode *inode,
 	/* disallow direct IO if any of devices has unaligned blksize */
 	if (f2fs_is_multi_device(sbi) && !sbi->aligned_blksize)
 		return true;
-	/*
-	 * for blkzoned device, fallback direct IO to buffered IO, so
-	 * all IOs can be serialized by log-structured write.
-	 */
-	if (f2fs_sb_has_blkzoned(sbi))
-		return true;
+
 	if (f2fs_lfs_mode(sbi) && (rw == WRITE)) {
 		if (block_unaligned_IO(inode, iocb, iter))
 			return true;
-- 
2.25.1



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
