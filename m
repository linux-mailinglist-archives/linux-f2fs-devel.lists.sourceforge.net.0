Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id C4D90698DFD
	for <lists+linux-f2fs-devel@lfdr.de>; Thu, 16 Feb 2023 08:44:56 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1pSYwj-0002tI-Mc;
	Thu, 16 Feb 2023 07:44:49 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <yonggil.song@samsung.com>) id 1pSYwe-0002tB-Py
 for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 16 Feb 2023 07:44:45 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=References:Content-Type:Content-Transfer-Encoding:
 Date:Message-ID:CC:To:From:Sender:Reply-To:Subject:Mime-Version:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=oEJl9mI2BPZgtqcU4ebRMNclNVoy/K+7rH+uFc8JogA=; b=CXiibp0tLmrae3gi7p6gu/Qnm4
 rjdAdG1mPLp1Iedr9cwvWcUdmHtaFX3I7JiCBvi19bbzaqQeTD3GRERnH3Fic8Z3X86FCrTDG25xj
 5kyot6drcl5ZW2I30yJjUpQZlIFKM5M3vBCobV2z9zZmAXVWYxTAfV9VMHdsSvVnnqew=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=References:Content-Type:Content-Transfer-Encoding:Date:Message-ID:CC:To:
 From:Sender:Reply-To:Subject:Mime-Version:Content-ID:Content-Description:
 Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
 In-Reply-To:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=oEJl9mI2BPZgtqcU4ebRMNclNVoy/K+7rH+uFc8JogA=; b=j
 G80PDmX3jkB9Hu2LGktoYvBEil+r/FZb7bupLwM9SoJ8wiIdAgi8kyGBD4o/VO/P5K97vSuangnzv
 +PqwjjQWVqnyMO/J5mOv6QL9AjjY4sbJNygFQMXpxEpC3yCbFHF5GZYFYiCnmuNCSBWJ+nW68pIPO
 1P52TvS505nh5sZk=;
Received: from mailout4.samsung.com ([203.254.224.34])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1pSYwa-0061IP-7g for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 16 Feb 2023 07:44:44 +0000
Received: from epcas2p4.samsung.com (unknown [182.195.41.56])
 by mailout4.samsung.com (KnoxPortal) with ESMTP id
 20230216074429epoutp041a09ccf08fec22b082c60939f0954a84~EPk7IFdmC2800928009epoutp04w
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Thu, 16 Feb 2023 07:44:29 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout4.samsung.com
 20230216074429epoutp041a09ccf08fec22b082c60939f0954a84~EPk7IFdmC2800928009epoutp04w
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
 s=mail20170921; t=1676533469;
 bh=oEJl9mI2BPZgtqcU4ebRMNclNVoy/K+7rH+uFc8JogA=;
 h=Subject:Reply-To:From:To:CC:Date:References:From;
 b=u/mdwkn69McCwBKe+B0gOHcSguDuCTw0QDDR9kca5fgTEUk3R5b4X2XuCI37K06Od
 BFcAFtNuU8bfielerD+TPNPhCzPnPBSy5mI5bVNAlWRM0Hx6ttgCGnqoZcJU9TJH3X
 S87HvRIgFjdcBkcxtfhvGgOt6Oeqza5uYLsf96ZQ=
Received: from epsnrtp3.localdomain (unknown [182.195.42.164]) by
 epcas2p1.samsung.com (KnoxPortal) with ESMTP id
 20230216074428epcas2p14a2330c2d00e8976848f16f37027ceff~EPk6eeJuO0558405584epcas2p1s;
 Thu, 16 Feb 2023 07:44:28 +0000 (GMT)
Received: from epsmges2p2.samsung.com (unknown [182.195.36.97]) by
 epsnrtp3.localdomain (Postfix) with ESMTP id 4PHRmD2K6Bz4x9QB; Thu, 16 Feb
 2023 07:44:28 +0000 (GMT)
X-AuditID: b6c32a46-743fa70000007a4b-af-63eddedc5314
Received: from epcas2p4.samsung.com ( [182.195.41.56]) by
 epsmges2p2.samsung.com (Symantec Messaging Gateway) with SMTP id
 90.8D.31307.CDEDDE36; Thu, 16 Feb 2023 16:44:28 +0900 (KST)
Mime-Version: 1.0
From: Yonggil Song <yonggil.song@samsung.com>
To: Chao Yu <chao@kernel.org>, "jaegeuk@kernel.org" <jaegeuk@kernel.org>,
 "linux-f2fs-devel@lists.sourceforge.net"
 <linux-f2fs-devel@lists.sourceforge.net>, "linux-kernel@vger.kernel.org"
 <linux-kernel@vger.kernel.org>, "daehojeong@google.com"
 <daehojeong@google.com>
X-Priority: 3
X-Content-Kind-Code: NORMAL
X-CPGS-Detection: blocking_info_exchange
X-Drm-Type: N,general
X-Msg-Generator: Mail
X-Msg-Type: PERSONAL
X-Reply-Demand: N
Message-ID: <20230216074427epcms2p49a3d71b08d356530b40e34e750cc2366@epcms2p4>
Date: Thu, 16 Feb 2023 16:44:27 +0900
X-CMS-MailID: 20230216074427epcms2p49a3d71b08d356530b40e34e750cc2366
X-Sendblock-Type: AUTO_CONFIDENTIAL
CMS-TYPE: 102P
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFmpkk+LIzCtJLcpLzFFi42LZdljTQvfOvbfJBn/vslucnnqWyWJq+15G
 i+bF69ksnqyfxWxxaZG7xeVdc9gsFmx8xOjA7rFgU6nHplWdbB77565h99i94DOTx+dNcgGs
 Udk2GamJKalFCql5yfkpmXnptkrewfHO8aZmBoa6hpYW5koKeYm5qbZKLj4Bum6ZOUBHKCmU
 JeaUAoUCEouLlfTtbIryS0tSFTLyi0tslVILUnIKzAv0ihNzi0vz0vXyUkusDA0MjEyBChOy
 M/a3b2UseMNW0bRvBXsD403WLkYODgkBE4l53fxdjFwcQgI7GCX6nnxmAonzCghK/N0hDGIK
 C9hI/L1h18XICVSiJHHtQC8LiC0soC+xefEydhCbTUBX4u+G5ewgY0QEJjNJTPiyggkkwSxQ
 JNE3+y9YkYQAr8SM9qcsELa0xPblWxkhbA2JH8t6mSFsUYmbq9+yw9jvj82HqhGRaL13FqpG
 UOLBz91QcUmJRYfOM0HY+RJ/V1xng7BrJLY2tEHF9SWudWwE28sr4CvRvXQZK4jNIqAqMWXe
 Sah7XCQu3/vCDnGzvMT2t3OYQX5nFtCUWL9LHxJSyhJHbrFAVPBJdBxG+GrHvCdQm9QkNm/a
 zAphy0hceNwGdaWHxKSt98AmCgkEStw6qDCBUWEWIphnIVk7C2HtAkbmVYxiqQXFuempxUYF
 RvCITc7P3cQITotabjsYp7z9oHeIkYmD8RCjBAezkgjvpptvkoV4UxIrq1KL8uOLSnNSiw8x
 mgI9PJFZSjQ5H5iY80riDU0sDUzMzAzNjUwNzJXEeaVtTyYLCaQnlqRmp6YWpBbB9DFxcEo1
 MK2U/n1pR+4to4Jg+b64X0+eP6sJ3K2wb5vR9l1av1WupF1SYxfjVZ2w8ImePE97+sETH+P+
 vs7/bbf44dSLOzeoiwg9So/ZFc1QNHn3uviTySfPL5jUtien4d6UYuvb1+zWdZyNFXnwmH3/
 uZez5Rakhrw+6nVvr2ZO/r/tG5xO/E5/skPx973zGwymFE8qbjxive30m4lia7kW/u7KcXbb
 66I/j3+TlRbDn4OJtZnT11Rf2HfYROik7/wZmWYHTiYk3vLamd604Of/Z9aTa2wTZpZXRe4O
 vP34hvq7DSfMhEUdvKovvJpWtXLPguLemTcMbz8NtP75kj1Md3/R9jldPnNdKqzytNx/WBit
 qXm6UomlOCPRUIu5qDgRANiXqR0UBAAA
DLP-Filter: Pass
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20230215024850epcms2p22be2cc864d82b44f31c19a7ef28770b6
References: <CGME20230215024850epcms2p22be2cc864d82b44f31c19a7ef28770b6@epcms2p4>
X-Spam-Score: -2.5 (--)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  When f2fs skipped a gc round during victim migration, there
 was a bug which would skip all upcoming gc rounds unconditionally because
 skipped_gc_rwsem was not initialized. It fixes the bug by correctl [...] 
 Content analysis details:   (-2.5 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -2.3 RCVD_IN_DNSWL_MED      RBL: Sender listed at https://www.dnswl.org/,
 medium trust [203.254.224.34 listed in list.dnswl.org]
 -0.0 SPF_HELO_PASS          SPF: HELO matches SPF record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.0 RCVD_IN_MSPIKE_H3      RBL: Good reputation (+3)
 [203.254.224.34 listed in wl.mailspike.net]
 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1pSYwa-0061IP-7g
Subject: [f2fs-dev] [PATCH v2] f2fs: fix uninitialized skipped_gc_rwsem
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
Reply-To: yonggil.song@samsung.com
Cc: "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>,
 "stable@vger.kernel.org" <stable@vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

When f2fs skipped a gc round during victim migration, there was a bug which
would skip all upcoming gc rounds unconditionally because skipped_gc_rwsem
was not initialized. It fixes the bug by correctly initializing the
skipped_gc_rwsem inside the gc loop.

Fixes: 3db1de0e582c ("f2fs: change the current atomic write way")
Cc: stable@vger.kernel.org
Signed-off-by: Yonggil Song <yonggil.song@samsung.com>

diff --git a/fs/f2fs/gc.c b/fs/f2fs/gc.c
index b22f49a6f128..81d326abaac1 100644
--- a/fs/f2fs/gc.c
+++ b/fs/f2fs/gc.c
@@ -1786,8 +1786,8 @@ int f2fs_gc(struct f2fs_sb_info *sbi, struct f2fs_gc_control *gc_control)
 				prefree_segments(sbi));
 
 	cpc.reason = __get_cp_reason(sbi);
-	sbi->skipped_gc_rwsem = 0;
 gc_more:
+	sbi->skipped_gc_rwsem = 0;
 	if (unlikely(!(sbi->sb->s_flags & SB_ACTIVE))) {
 		ret = -EINVAL;
 		goto stop;
-- 
2.34.1


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
