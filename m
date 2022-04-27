Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id A5F20511C1B
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 27 Apr 2022 18:03:16 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.94.2)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1njk8I-0006xe-BL; Wed, 27 Apr 2022 16:03:12 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <p.raghav@samsung.com>) id 1njk8H-0006xW-Cy
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 27 Apr 2022 16:03:12 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=References:Content-Type:Content-Transfer-Encoding:
 MIME-Version:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=BWD7vHeyj4CQ5Yi8P8N3Y/UNmrAcLUZCdK4xuanhqxM=; b=SprscVsY4Q/bHc13zbcqpL5n3f
 NRpNW+TXhckMKBeZGHMuL1a63MnxZSHxpYvb11plzg2LB3wbXKM2DqvQuXjU/S9H/LKYsdLuCujSP
 YC6fEHTeOiR4a8Zbm35jBHSOkhoyD8tpl5S9tkCtvGBP5FluE6vYKi/eX4BrhQafmR4A=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=References:Content-Type:Content-Transfer-Encoding:MIME-Version:
 In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=BWD7vHeyj4CQ5Yi8P8N3Y/UNmrAcLUZCdK4xuanhqxM=; b=mV16m+M2OP2XHZH36lBaVuV00y
 kqikr63N+w/7oYPXvcoI1EHRDx3afwxZWZA+bkKbX6YMPStNUFbv9QbDO+fJSOvVgetZeg0x4oCaY
 qVQRZY+CIK4lL2epNR4rLfL13To7rrsoPmY/V5Tb0lQp5dG7ElGAhHRgNoc5bdvnQkg8=;
Received: from mailout2.w1.samsung.com ([210.118.77.12])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.94.2)
 id 1njk8E-00Bt3u-S5
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 27 Apr 2022 16:03:11 +0000
Received: from eucas1p1.samsung.com (unknown [182.198.249.206])
 by mailout2.w1.samsung.com (KnoxPortal) with ESMTP id
 20220427160301euoutp0217b4aed362abd36b01a18c7eac0850b9~pzE-NkG6k1442014420euoutp02e
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Wed, 27 Apr 2022 16:03:01 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.w1.samsung.com
 20220427160301euoutp0217b4aed362abd36b01a18c7eac0850b9~pzE-NkG6k1442014420euoutp02e
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
 s=mail20170921; t=1651075381;
 bh=BWD7vHeyj4CQ5Yi8P8N3Y/UNmrAcLUZCdK4xuanhqxM=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=GjtnpqS6TFmG2lS3q3AvbSUlERHkrFUlQO9oURtx63Y8neTC073fmMr39BfnCvCBw
 DTvzJ0X8IPJMoeRECHcpODziirNBHPHsusQTuxwb6EylE22GYnBKu6saD8rcytElZS
 FMexbXBDvDOgUTbirA0LbgEUR7hJIW8gG1tIYbU8=
Received: from eusmges1new.samsung.com (unknown [203.254.199.242]) by
 eucas1p2.samsung.com (KnoxPortal) with ESMTP id
 20220427160300eucas1p2fc7475012e90a1a33a382c42587b4446~pzE9zxJ3a2333423334eucas1p2i;
 Wed, 27 Apr 2022 16:03:00 +0000 (GMT)
Received: from eucas1p1.samsung.com ( [182.198.249.206]) by
 eusmges1new.samsung.com (EUCPMTA) with SMTP id 48.D7.10009.33969626; Wed, 27
 Apr 2022 17:02:59 +0100 (BST)
Received: from eusmtrp2.samsung.com (unknown [182.198.249.139]) by
 eucas1p2.samsung.com (KnoxPortal) with ESMTPA id
 20220427160259eucas1p25aab0637fec229cd1140e6aa08678f38~pzE9RHMr30646906469eucas1p2D;
 Wed, 27 Apr 2022 16:02:59 +0000 (GMT)
Received: from eusmgms1.samsung.com (unknown [182.198.249.179]) by
 eusmtrp2.samsung.com (KnoxPortal) with ESMTP id
 20220427160259eusmtrp23acd8a811248a150d7112d6be62c6f22~pzE9QGU2h2598325983eusmtrp2e;
 Wed, 27 Apr 2022 16:02:59 +0000 (GMT)
X-AuditID: cbfec7f2-e95ff70000002719-74-6269693374d0
Received: from eusmtip2.samsung.com ( [203.254.199.222]) by
 eusmgms1.samsung.com (EUCPMTA) with SMTP id 5F.71.09522.33969626; Wed, 27
 Apr 2022 17:02:59 +0100 (BST)
Received: from localhost (unknown [106.210.248.162]) by eusmtip2.samsung.com
 (KnoxPortal) with ESMTPA id
 20220427160259eusmtip2e40409a4ed4d05babb2748470116c200~pzE85iTMw3126231262eusmtip23;
 Wed, 27 Apr 2022 16:02:59 +0000 (GMT)
From: Pankaj Raghav <p.raghav@samsung.com>
To: jaegeuk@kernel.org, axboe@kernel.dk, snitzer@kernel.org, hch@lst.de,
 mcgrof@kernel.org, naohiro.aota@wdc.com, sagi@grimberg.me,
 damien.lemoal@opensource.wdc.com, dsterba@suse.com,
 johannes.thumshirn@wdc.com
Date: Wed, 27 Apr 2022 18:02:42 +0200
Message-Id: <20220427160255.300418-4-p.raghav@samsung.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220427160255.300418-1-p.raghav@samsung.com>
MIME-Version: 1.0
X-Brightmail-Tracker: H4sIAAAAAAAAA02Sf1CTdRzH7/t8H549rOY9bBTfUDN3l1eoEAceX9PrSkue8vJE7Yf5B0x4
 hOkYuDGjqGsEIySRwSUojvxR5JzhgBE1kY6gGAgEMWf8/nGwUgqGsJkcCTGeefnf+/P5vj7v
 9+dz96Wh+CoVTMuVaZxKKVNIKSFZ2zz368YIufzgC5MjUdh8oxniK4MFFC6enoO47VQHgYsK
 TgvwfEcnxPVTZ/1w1/1MAvc2WAl8+covBB43l0J8omGaxA/yhpZ62aMQ/zsajosabwHsdJQS
 uL5vPe4eMwpw98VofL2+lcT2awYKn/vGKcD6HA/EPXonwIU2ix+eLc8W4Kt/uUjc0rfy5dWs
 /eZOdqHlW4otzJoSsJ1DVSRr79Cw1abjFHtBewqylq8/YevOzxJsXa+WYvOzpijWqhv2Y10/
 Oij2ZI0JsOYaB8nqLVV+u8XvCbcmcAr5MU4V9lKcMOm3wX6YOken5485BFpQK8gD/jRiIlFJ
 xQiRB4S0mDECZMo5LuALN0Anqv6EXkrMzALkaoh4ONHuaoU8dAmg03dnfcUdgMp198g8QNMU
 E4IyeadApgegwsrK5QzITEDUVfM74bWSMJvQ9125pFeTzLPojilzWYuYF9ED4xjBx61BZ7r/
 EXhN/ZktSD/zLo8EoNYz48s4XEKyvju7vARiyoXINHmb5GdfRe6Fdp+PBE3YanxHr0KL1nO+
 fgZy9sz7hrMBKrCaKW8YWgo72a7wSsg8j8zXwnj8FZT/uQvyxArUMxnAr7ACFdWW+NoilJsj
 5mkpss6N+0IRsn9qIHmERc6hBD1YW/rILaWP3FL6f+x5AE0giNOokxM5dbiSez9ULUtWa5SJ
 ofEpydVg6Uu3LdhmfgBlE3dDGwFBg0aAaCgNFLnrkg6KRQmyDz7kVCmxKo2CUzeClTQpDRLF
 yytlYiZRlsYd4bhUTvXwlaD9g7WEZEPMvg0HYtvagz8e3rar2FLzUcxUncjWJ4RNnkPF15ty
 5bWBm9clWDXRbz9WWZ9Rvcm9TfFl01f3IzcrRpvTKy7Z9yy8ufPnXmtq5eEDhpm9uuDwzoCn
 oqV1sh7wmkdOr6eTYmy3d/8d8kV7Q5lsY7UkdvsR+b7Fxcv9Eap17tyS/bqBsB1vGLWBcdNp
 yqwKGf1H1XaDZcD/aFOacWtUimo6zdAR6XzL03XjyVXPVe1N2ZL62XDGgHH/4Ux7/457T+9a
 kGgCgn4yzN8kPU90DXvWONzR8HXz6rX6fvqornsw9NCI5FZUR8tkWbzNZCMvuGKPse/ERT0j
 0CY/3qhKL+m3SEl1kiw8BKrUsv8AISTrFkEEAAA=
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFprPKsWRmVeSWpSXmKPExsVy+t/xe7rGmZlJBrf3CVusP3WM2WL13X42
 i2kffjJbnJ56lsliUv8MdovfZ88zW+x9N5vV4sKPRiaLmwd2MlmsXH2UyeLJ+lnMFj0HPrBY
 /O26BxRrechs8eehocWkQ9cYLZ5encVksfeWtsWlxyvYLS4tcrfYs/cki8XlXXPYLOYve8pu
 MaHtK7PFjQlPGS0mHt/MavF5aQu7xbrX71ksTtySdpD1uHzF2+PfiTVsHhOb37F7nL+3kcXj
 8tlSj02rOtk8FjZMZfbYvKTeY/eCz0weu282sHn0Nr9j89jZep/V4/2+q2wefVtWMXqs33KV
 xWPC5o2sAUJRejZF+aUlqQoZ+cUltkrRhhZGeoaWFnpGJpZ6hsbmsVZGpkr6djYpqTmZZalF
 +nYJehkX795mLvjJUdH7+Cp7A+M29i5GTg4JAROJM+9PMncxcnEICSxllNjxYCMbREJC4vbC
 JkYIW1jiz7UuNoii54wSXe8OAiU4ONgEtCQaO9lB4iICTxgl7v98zALiMAs0sEjcmriLCaRb
 WMBUYvuFDhYQm0VAVeLlqkYwm1fASuLvisdMEBvkJWZe+s4OMpRTwFpiwqcIkLAQUEn3olus
 EOWCEidnPgFrZQYqb946m3kCo8AsJKlZSFILGJlWMYqklhbnpucWG+oVJ+YWl+al6yXn525i
 BKaUbcd+bt7BOO/VR71DjEwcjIcYJTiYlUR4v+zOSBLiTUmsrEotyo8vKs1JLT7EaAp09kRm
 KdHkfGBSyyuJNzQzMDU0MbM0MLU0M1YS5/Us6EgUEkhPLEnNTk0tSC2C6WPi4JRqYNrIxBaw
 Sy67r63yerDW7GjF6Z/3hq64+z+gLHfPf97UvG3l3H80rxz+mefGVa23MNb2RKru/orLi/tN
 z3z3cN/UVPiYZ0foLudwrnx/OfV2+9tHrqn8NVovFP3hueHTTUyeAT/uqKpx9O3daHzgVfi/
 faF66SdDju+60LTy4bWk5m9a7ow1Xgyq9+vyu1YEPlEJVUzZ0L1i/u8tTJd/mRxSKvvMvI3j
 d55F8FohnR9qzZXlMvfYLiZJRJmvYG2K8bwxo/1e5OTK9evt/bOm3Jit5CH4+o78hvNM964s
 SWa92MliZFcX9Oqdzbwvem15DxN4zxxjvCvwR9j3zGNjUZG7WgErmRpLu0pXxgVkKrEUZyQa
 ajEXFScCAJFoJ62yAwAA
X-CMS-MailID: 20220427160259eucas1p25aab0637fec229cd1140e6aa08678f38
X-Msg-Generator: CA
X-RootMTR: 20220427160259eucas1p25aab0637fec229cd1140e6aa08678f38
X-EPHeader: CA
CMS-TYPE: 201P
X-CMS-RootMailID: 20220427160259eucas1p25aab0637fec229cd1140e6aa08678f38
References: <20220427160255.300418-1-p.raghav@samsung.com>
 <CGME20220427160259eucas1p25aab0637fec229cd1140e6aa08678f38@eucas1p2.samsung.com>
X-Spam-Score: -5.9 (-----)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  Many places in the filesystem for zoned devices open code
 this function to find the zone number for a given sector with power of 2
 assumption.
 This generic helper can be used to calculate zone number [...] 
 Content analysis details:   (-5.9 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [210.118.77.12 listed in list.dnswl.org]
 0.0 RCVD_IN_MSPIKE_H3      RBL: Good reputation (+3)
 [210.118.77.12 listed in wl.mailspike.net]
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
X-Headers-End: 1njk8E-00Bt3u-S5
Subject: [f2fs-dev] [PATCH 03/16] block: add bdev_zone_no helper
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
Cc: jiangbo.365@bytedance.com, Pankaj Raghav <p.raghav@samsung.com>,
 kch@nvidia.com, bvanassche@acm.org, matias.bjorling@wdc.com,
 gost.dev@samsung.com, linux-kernel@vger.kernel.org,
 linux-nvme@lists.infradead.org, linux-f2fs-devel@lists.sourceforge.net,
 linux-block@vger.kernel.org, clm@fb.com, dm-devel@redhat.com, agk@redhat.com,
 jonathan.derrick@linux.dev, kbusch@kernel.org, linux-fsdevel@vger.kernel.org,
 josef@toxicpanda.com, linux-btrfs@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

Many places in the filesystem for zoned devices open code this function
to find the zone number for a given sector with power of 2 assumption.
This generic helper can be used to calculate zone number for a given
sector in a block device

This helper internally uses blk_queue_zone_no to find the zone number.

Reviewed-by: Luis Chamberlain <mcgrof@kernel.org>
Signed-off-by: Pankaj Raghav <p.raghav@samsung.com>
---
 include/linux/blkdev.h | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/include/linux/blkdev.h b/include/linux/blkdev.h
index f8f2d2998afb..55293e0a8702 100644
--- a/include/linux/blkdev.h
+++ b/include/linux/blkdev.h
@@ -1392,6 +1392,15 @@ static inline bool bdev_zone_aligned(struct block_device *bdev, sector_t sec)
 	return false;
 }
 
+static inline unsigned int bdev_zone_no(struct block_device *bdev, sector_t sec)
+{
+	struct request_queue *q = bdev_get_queue(bdev);
+
+	if (q)
+		return blk_queue_zone_no(q, sec);
+	return 0;
+}
+
 static inline unsigned int bdev_max_open_zones(struct block_device *bdev)
 {
 	struct request_queue *q = bdev_get_queue(bdev);
-- 
2.25.1



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
