Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 41C0D4FDDA1
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 12 Apr 2022 13:28:07 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.94.2)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1neEgn-0003I4-MS; Tue, 12 Apr 2022 11:28:04 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <p.raghav@samsung.com>) id 1neEgl-0003Hd-2e
 for linux-f2fs-devel@lists.sourceforge.net; Tue, 12 Apr 2022 11:28:02 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=References:Content-Type:Content-Transfer-Encoding:
 MIME-Version:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=DAx5kLLOPwXasoScBQnSsavkiePH+0SfUKPEh5/aL5Y=; b=DqvNdzzWHJ+FFphLi8u4qqKoPn
 Bu+KYd83qV4jJG5IVpF0JphZhG5EpGvZA4Zj1Q/wZmXn+f3LDDpPCi6aHwCn7E4H9NV1cloNxU+l6
 yGOO1WzexogtREGX1gB47b9H8G+c3rag7vuO99jcfc72pph/Q/u1R6YFZ3jgSRfxKCsA=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=References:Content-Type:Content-Transfer-Encoding:MIME-Version:
 In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=DAx5kLLOPwXasoScBQnSsavkiePH+0SfUKPEh5/aL5Y=; b=AiPuqM6LblE9oYl3X7pKOtvisP
 jEjcQlE21zCnYCVjR5JFCciYBWlbJbkg1UA4z7ELKuOmb5wieNPZa1BkYENojcnWfh6WZtk0kyZj9
 r+whX+kAuied/FO5eIU0mh5KPONrcnF+ji07X0XTUKAzkLKye9CHD3c1JY3Kc123tB9s=;
Received: from mailout1.w1.samsung.com ([210.118.77.11])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.94.2)
 id 1neEge-00Dy1u-VB
 for linux-f2fs-devel@lists.sourceforge.net; Tue, 12 Apr 2022 11:28:02 +0000
Received: from eucas1p1.samsung.com (unknown [182.198.249.206])
 by mailout1.w1.samsung.com (KnoxPortal) with ESMTP id
 20220412112748euoutp011ad1be4b1a899534fe6a0eef7d5a560d~lIpaGB0cS0064500645euoutp01G
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Tue, 12 Apr 2022 11:27:48 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.w1.samsung.com
 20220412112748euoutp011ad1be4b1a899534fe6a0eef7d5a560d~lIpaGB0cS0064500645euoutp01G
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
 s=mail20170921; t=1649762868;
 bh=DAx5kLLOPwXasoScBQnSsavkiePH+0SfUKPEh5/aL5Y=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=ChR2Bg72p8e6PgDTRbJhp9RHS45je2xQi+glGAMQjsCheohi8F5x+jnRuwsRKfXnY
 8e//w7xNay+eoaKPoPO2yeUJM4e9xCE7VrOWEFZ55K8Wsp3RjKEN3y49nThWJDRVBn
 Yo2hWXlb9ogkosKfJUAOVNPYyPSB04l1gPDcgEy8=
Received: from eusmges1new.samsung.com (unknown [203.254.199.242]) by
 eucas1p1.samsung.com (KnoxPortal) with ESMTP id
 20220412112747eucas1p10483f5fe5ccc0aadc4e6438a1d944d79~lIpZdgi9X1426014260eucas1p1c;
 Tue, 12 Apr 2022 11:27:47 +0000 (GMT)
Received: from eucas1p2.samsung.com ( [182.198.249.207]) by
 eusmges1new.samsung.com (EUCPMTA) with SMTP id 5E.D7.10009.33265526; Tue, 12
 Apr 2022 12:27:47 +0100 (BST)
Received: from eusmtrp2.samsung.com (unknown [182.198.249.139]) by
 eucas1p1.samsung.com (KnoxPortal) with ESMTPA id
 20220412112747eucas1p11e2747339407a5c51a93e7b7060ab965~lIpZG_AlL1689016890eucas1p1M;
 Tue, 12 Apr 2022 11:27:47 +0000 (GMT)
Received: from eusmgms1.samsung.com (unknown [182.198.249.179]) by
 eusmtrp2.samsung.com (KnoxPortal) with ESMTP id
 20220412112747eusmtrp2ccfec54250a79b13b056e95456a40849~lIpZGWRwE1299712997eusmtrp2e;
 Tue, 12 Apr 2022 11:27:47 +0000 (GMT)
X-AuditID: cbfec7f2-e95ff70000002719-ae-6255623399cc
Received: from eusmtip1.samsung.com ( [203.254.199.221]) by
 eusmgms1.samsung.com (EUCPMTA) with SMTP id F1.76.09522.33265526; Tue, 12
 Apr 2022 12:27:47 +0100 (BST)
Received: from localhost (unknown [106.210.248.108]) by eusmtip1.samsung.com
 (KnoxPortal) with ESMTPA id
 20220412112747eusmtip18003f73b5a8d483a2434bd5a74e5e0cf~lIpY0r__v1035110351eusmtip1I;
 Tue, 12 Apr 2022 11:27:47 +0000 (GMT)
From: Pankaj Raghav <p.raghav@samsung.com>
To: linux-f2fs-devel@lists.sourceforge.net
Date: Tue, 12 Apr 2022 13:27:43 +0200
Message-Id: <20220412112745.44108-2-p.raghav@samsung.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220412112745.44108-1-p.raghav@samsung.com>
MIME-Version: 1.0
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFupkleLIzCtJLcpLzFFi42LZduzneV3jpNAkg4OLNCxa278xWTy+85nd
 4uj/t2wWlxa5W9yY8JTRYs3NpywObB47Z91l99i0qpPNY/eCz0wefVtWMXq0H+hmCmCN4rJJ
 Sc3JLEst0rdL4Mpo3t/GXHCGt2Jrl1YD42muLkZODgkBE4m7HY/Zuxi5OIQEVjBKLNuwAcr5
 wihx8so+ZgjnM6PE8X8rmGBa3q2bwgKRWM4o8eLEOkYI5yWjxOx/fUAZDg42AS2Jxk52kAYR
 IHNiw19GEJtZoFDi5qNvYIOEBbwk/tz+ClbDIqAqsfxxC5jNK2Ap8a7nORvEMnmJmZe+g8U5
 Bawk5n5/xQJRIyhxcuYTFoiZ8hLNW2czQ9Sv5JDo62SBsF0kJs27ChUXlnh1fAs7hC0j8X/n
 fKhnqiWe3vgN9qWEQAujRP/O9Wwg90sIWEv0nckBMZkFNCXW79KHKHeUaP5ziBGigk/ixltB
 iAv4JCZtm84MEeaV6GgTgqhWktj58wnUUgmJy01zoA7zkLi2rpt9AqPiLCS/zELyyyyEvQsY
 mVcxiqeWFuempxYb5qWW6xUn5haX5qXrJefnbmIEppbT/45/2sE499VHvUOMTByMhxglOJiV
 RHj71UOThHhTEiurUovy44tKc1KLDzFKc7AoifMmZ25IFBJITyxJzU5NLUgtgskycXBKNTCl
 Ns0sz7g9U+jD+xBtcRur7me8Rjc8pM0YH5/+6h8w92YF01NRq+p3d45/5Lurd31fHp/WArH0
 XecyxDgffPjAtGKF2TpnW/ujazP/Xm2v3cMUuuGy89rVCWYxk5oe14hXCjqLlqbOva/rGZn4
 dKd0uyXz4r5q3v6ZCxhW969dkR3PJpjG3fZx68Yg0abKXcUaB7WzLZ80NLfaX2m+MvtI85+f
 hoct78Rrcp/ebJDAsvF4JRez0/Pl4aeu9JlYSf2ZYbTG4VVj2HKNCZ5uVlP3/TX8bKaZ03//
 9NnzXge/ycb0CBczCDKoJC7i5qjNbq+81N2p9e6h0znpqAV3Odx9Pi1/cTqgqcDBRUgvUYml
 OCPRUIu5qDgRAOD0uU+cAwAA
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFvrOLMWRmVeSWpSXmKPExsVy+t/xu7rGSaFJBk+vCli0tn9jsnh85zO7
 xdH/b9ksLi1yt7gx4SmjxZqbT1kc2Dx2zrrL7rFpVSebx+4Fn5k8+rasYvRoP9DNFMAapWdT
 lF9akqqQkV9cYqsUbWhhpGdoaaFnZGKpZ2hsHmtlZKqkb2eTkpqTWZZapG+XoJfRvL+NueAM
 b8XWLq0GxtNcXYycHBICJhLv1k1h6WLk4hASWMooMfHrJUaIhITE7YVNULawxJ9rXWxdjBxA
 Rc8ZJf47g5hsAloSjZ3sIBUiQObEhr9g1cwC5RJHpt5lAbGFBbwk/tz+ClbDIqAqsfxxC5jN
 K2Ap8a7nORvEdHmJmZe+g8U5Bawk5n5/BdYrBFTz5f46Roh6QYmTM5+wQMyXl2jeOpt5AqPA
 LCSpWUhSCxiZVjGKpJYW56bnFhvqFSfmFpfmpesl5+duYgTGwLZjPzfvYJz36qPeIUYmDsZD
 jBIczEoivP3qoUlCvCmJlVWpRfnxRaU5qcWHGE2B7p7ILCWanA+MwrySeEMzA1NDEzNLA1NL
 M2MlcV7Pgo5EIYH0xJLU7NTUgtQimD4mDk6pBqZsHulnYZJaj46XCYfLTJSz+6vSqV86dcqb
 n+s2XfBPXlMr5NIe7hfndp5xHcvlv/dlPtndv2jKGPfl5wT1RUw7ZUUf1l5p/1y86dnEirbC
 O/8L/OOy63hnsGqZh2+N+372r/iXV+oHv0238NzZMoXtXdq9sme7+xjX6Wnvamc9rM9y7vvj
 pZFpU3ZliaXdee3CtvJu26YGvTSN5PY3L7IWn1JV5N501D9SPKlz65aT3iqLkk6fPTGdweuR
 5zOlN2ftLmWtzg5uTH3upvp7/fWC/CkyOS8+HlhwV+RR+Of/Zxpm13XK98XFsy9YfEDdUCui
 nbPXcxpH/KdM6cv1M27niywsdpk5iU+xsWuBQI8SS3FGoqEWc1FxIgBn2kAxCgMAAA==
X-CMS-MailID: 20220412112747eucas1p11e2747339407a5c51a93e7b7060ab965
X-Msg-Generator: CA
X-RootMTR: 20220412112747eucas1p11e2747339407a5c51a93e7b7060ab965
X-EPHeader: CA
CMS-TYPE: 201P
X-CMS-RootMailID: 20220412112747eucas1p11e2747339407a5c51a93e7b7060ab965
References: <20220412112745.44108-1-p.raghav@samsung.com>
 <CGME20220412112747eucas1p11e2747339407a5c51a93e7b7060ab965@eucas1p1.samsung.com>
X-Spam-Score: -5.9 (-----)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  From: Luis Chamberlain <mcgrof@kernel.org> This moves the
 code which fetches the chunk_sectors into a helper. Yes, this could in theory
 be used by non-zoned devices but that's not the case yet, so no need to make
 this a generic routine. 
 Content analysis details:   (-5.9 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 RCVD_IN_MSPIKE_H3      RBL: Good reputation (+3)
 [210.118.77.11 listed in wl.mailspike.net]
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [210.118.77.11 listed in list.dnswl.org]
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
X-Headers-End: 1neEge-00Dy1u-VB
Subject: [f2fs-dev] [PATCH 1/3] libf2fs_zoned: factor out helper to get
 chunk sectors
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
Cc: javier.gonz@samsung.com, mcgrof@kernel.org, Damien.LeMoal@wdc.com,
 pankydev8@gmail.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

From: Luis Chamberlain <mcgrof@kernel.org>

This moves the code which fetches the chunk_sectors into a helper.
Yes, this could in theory be used by non-zoned devices but that's
not the case yet, so no need to make this a generic routine.

This makes it clear what this is doing, and helps us make the
subsequent changes easier to read.

Signed-off-by: Luis Chamberlain <mcgrof@kernel.org>
---
 lib/libf2fs_zoned.c | 27 +++++++++++++++++++--------
 1 file changed, 19 insertions(+), 8 deletions(-)

diff --git a/lib/libf2fs_zoned.c b/lib/libf2fs_zoned.c
index ce73b9a..1447181 100644
--- a/lib/libf2fs_zoned.c
+++ b/lib/libf2fs_zoned.c
@@ -146,35 +146,46 @@ int f2fs_get_zoned_model(int i)
 	return 0;
 }
 
-int f2fs_get_zone_blocks(int i)
+uint64_t f2fs_get_zone_chunk_sectors(struct device_info *dev)
 {
-	struct device_info *dev = c.devices + i;
 	uint64_t sectors;
 	char str[PATH_MAX];
 	FILE *file;
 	int res;
 
-	/* Get zone size */
-	dev->zone_blocks = 0;
-
 	res = get_sysfs_path(dev, "queue/chunk_sectors", str, sizeof(str));
 	if (res != 0) {
 		MSG(0, "\tError: Failed to get device sysfs attribute path\n");
-		return -1;
+		return 0;
 	}
 
 	file = fopen(str, "r");
 	if (!file)
-		return -1;
+		return 0;
 
 	memset(str, 0, sizeof(str));
 	res = fscanf(file, "%s", str);
 	fclose(file);
 
 	if (res != 1)
-		return -1;
+		return 0;
 
 	sectors = atol(str);
+	if (!sectors)
+		return 0;
+
+	return sectors;
+}
+
+int f2fs_get_zone_blocks(int i)
+{
+	struct device_info *dev = c.devices + i;
+	uint64_t sectors;
+
+	/* Get zone size */
+	dev->zone_blocks = 0;
+
+	sectors = f2fs_get_zone_chunk_sectors(dev);
 	if (!sectors)
 		return -1;
 
-- 
2.25.1



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
