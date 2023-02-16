Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id C79B2698DA0
	for <lists+linux-f2fs-devel@lfdr.de>; Thu, 16 Feb 2023 08:14:20 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1pSYTC-0001tI-2D;
	Thu, 16 Feb 2023 07:14:17 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <yonggil.song@samsung.com>) id 1pSYT5-0001tB-Ev
 for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 16 Feb 2023 07:14:11 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=References:Content-Type:Content-Transfer-Encoding:
 Date:Message-ID:CC:To:From:Sender:Reply-To:Subject:Mime-Version:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=/s/DDvoDqvkI0R3gCjxwHuxsXwGnIrRYiSsKEv400/g=; b=d+eplgnfu7unzEXPVzblSHCIWf
 NvacIFtMG5xBfwJ6IjtdIIuDBPK30XUCPxNjgqx4nv5kz/0Ve4n0nSEl4pi2MjQV3kd00c7AsRL9H
 xl06dOVFblbBvKJ2SxPTcOnA9SHGxTbNoe/92CjRPky7GWTIaxH+fblYSRfrFL39D13s=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=References:Content-Type:Content-Transfer-Encoding:Date:Message-ID:CC:To:
 From:Sender:Reply-To:Subject:Mime-Version:Content-ID:Content-Description:
 Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
 In-Reply-To:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=/s/DDvoDqvkI0R3gCjxwHuxsXwGnIrRYiSsKEv400/g=; b=O
 nXKdsq87h2OZPh4tKopWsep0WJZEPyAPDxbi8zNuUIpzVbYj8XWMnT+RSEG3r9VLtyalThzBHLcJC
 UVdG45wP8awTUgSiW/El0JVKgtri9sa7IDEHk7WrAlvli9ZKJo1K4ZaNIVu0f3dvyZ1U1f5v+Zvaj
 PvuHofV+Sel7nPR0=;
Received: from mailout3.samsung.com ([203.254.224.33])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1pSYSu-0000mM-F0 for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 16 Feb 2023 07:14:06 +0000
Received: from epcas2p3.samsung.com (unknown [182.195.41.55])
 by mailout3.samsung.com (KnoxPortal) with ESMTP id
 20230216071351epoutp038e9f7258120cfad7aa4b3bb74563cf89~EPKLWoHe52971629716epoutp03m
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Thu, 16 Feb 2023 07:13:51 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout3.samsung.com
 20230216071351epoutp038e9f7258120cfad7aa4b3bb74563cf89~EPKLWoHe52971629716epoutp03m
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
 s=mail20170921; t=1676531631;
 bh=/s/DDvoDqvkI0R3gCjxwHuxsXwGnIrRYiSsKEv400/g=;
 h=Subject:Reply-To:From:To:CC:Date:References:From;
 b=FhlJk2fQEkFwbFsZXf/SP5bxhpxj20U0tOp1zytWzChCqAhZxfJ5atiN3bjDK6NWx
 O+ZR1Ekz3C72i4AOihqi2VENhHkxY7p26T76yFZ9E9dSr9J8iN+hTaYbGVlGM9L6/o
 pBzO891OAl0/xhFWqUO8ns39kyUlurlcXX0IrFk4=
Received: from epsnrtp2.localdomain (unknown [182.195.42.163]) by
 epcas2p1.samsung.com (KnoxPortal) with ESMTP id
 20230216071351epcas2p1e45a30e991e440d87e949dd5415eb736~EPKLCWZSp2317123171epcas2p1W;
 Thu, 16 Feb 2023 07:13:51 +0000 (GMT)
Received: from epsmges2p2.samsung.com (unknown [182.195.36.101]) by
 epsnrtp2.localdomain (Postfix) with ESMTP id 4PHR4t4fYMz4x9Pv; Thu, 16 Feb
 2023 07:13:50 +0000 (GMT)
X-AuditID: b6c32a46-4e1ff70000007a4b-c9-63edd7ae7059
Received: from epcas2p1.samsung.com ( [182.195.41.53]) by
 epsmges2p2.samsung.com (Symantec Messaging Gateway) with SMTP id
 A1.79.31307.EA7DDE36; Thu, 16 Feb 2023 16:13:50 +0900 (KST)
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
Message-ID: <20230216071350epcms2p7b3f5f37b168b634ec7a7ba8555fd0b49@epcms2p7>
Date: Thu, 16 Feb 2023 16:13:50 +0900
X-CMS-MailID: 20230216071350epcms2p7b3f5f37b168b634ec7a7ba8555fd0b49
X-Sendblock-Type: AUTO_CONFIDENTIAL
CMS-TYPE: 102P
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFvrPKsWRmVeSWpSXmKPExsWy7bCmqe6662+TDV4tk7c4PfUsk8XU9r2M
 FqsehFs8WT+L2eLSIneLy7vmsFms6pjL6MDusWBTqcemVZ1sHrsXfGby6NuyitHj8ya5ANao
 bJuM1MSU1CKF1Lzk/JTMvHRbJe/geOd4UzMDQ11DSwtzJYW8xNxUWyUXnwBdt8wcoBuUFMoS
 c0qBQgGJxcVK+nY2RfmlJakKGfnFJbZKqQUpOQXmBXrFibnFpXnpenmpJVaGBgZGpkCFCdkZ
 x7ZMZS24wFYxcVNmA+MB1i5GTg4JAROJFQ9OMYPYQgI7GCWerdLtYuTg4BUQlPi7QxjEFBaw
 kfh7ww6iQkni2oFeFhBbWEBfYvPiZewgNpuArsTfDcuBbC4OEYHJTBITvqxgAkkwCwRJ3J/y
 AGoVr8SM9qcsELa0xPblWxkhbA2JH8t6mSFsUYmbq9+yw9jvj82HqhGRaL13FqpGUOLBz91Q
 cUmJRYfOM0HY+RJ/V1xng7BrJLY2tEHF9SWudWxkgXjLV+LqGSuQMIuAqsTsBb+hSlwkmu8+
 hTpZXmL72znMIOXMApoS63fpg5gSAsoSR26xQFTwSXQc/ssO89SOeU+gpqhJbN60GepZGYkL
 j9ugjvSQmLT1HjSMAyWm7jvAPoFRYRYimGch2TsLYe8CRuZVjGKpBcW56anFRgVG8HhNzs/d
 xAhOiVpuOxinvP2gd4iRiYPxEKMEB7OSCO+mm2+ShXhTEiurUovy44tKc1KLDzGaAn08kVlK
 NDkfmJTzSuINTSwNTMzMDM2NTA3MlcR5pW1PJgsJpCeWpGanphakFsH0MXFwSjUwbbu3JNvq
 KZ+X1pWV15Z6637eptVkbG/+Mt4japLohcrJa8q/yRtcfem03djo1JWQb2t/PThbk9y74+yd
 QteNs+ImzvjWeHHNe2GxZ/PWCOm2lvMvqDk54+5DZZEKN7dnLn7z1R8dbJ/V1C63mYV7Ts5H
 nofdz2Vbqi9mNP9ZLnUpxmtW4qcknhn1237N9JwgfmL2+eJ3savuezRsbH857/OGVUc3nljS
 2L5G9eAl3/CPvSU23xT7C3p+f4o78MHoUtuKK1uPL02MqGFzLvjLpZLsuHKL8kXnSSvuXAm0
 qnad73jzY06XpkVi2ayWy+Kic87Jv5n1iHPusrkBWWziluIm2sERtpcL/4QmOy9dNVOJpTgj
 0VCLuag4EQCs9AkAEgQAAA==
DLP-Filter: Pass
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20230215024850epcms2p22be2cc864d82b44f31c19a7ef28770b6
References: <CGME20230215024850epcms2p22be2cc864d82b44f31c19a7ef28770b6@epcms2p7>
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
 medium trust [203.254.224.33 listed in list.dnswl.org]
 0.0 RCVD_IN_MSPIKE_H3      RBL: Good reputation (+3)
 [203.254.224.33 listed in wl.mailspike.net]
 -0.0 SPF_HELO_PASS          SPF: HELO matches SPF record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1pSYSu-0000mM-F0
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
Cc: Seokhwan Kim <sukka.kim@samsung.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

When f2fs skipped a gc round during victim migration, there was a bug which
would skip all upcoming gc rounds unconditionally because skipped_gc_rwsem
was not initialized. It fixes the bug by correctly initializing the
skipped_gc_rwsem inside the gc loop.

Fixes: 3db1de0e582c ("f2fs: change the current atomic write way")
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
