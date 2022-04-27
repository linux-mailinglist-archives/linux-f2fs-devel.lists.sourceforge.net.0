Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 19665511C25
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 27 Apr 2022 18:03:24 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.94.2)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1njk8P-0006L3-Ku; Wed, 27 Apr 2022 16:03:22 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <p.raghav@samsung.com>) id 1njk8M-0006KA-QP
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 27 Apr 2022 16:03:19 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=References:Content-Type:Content-Transfer-Encoding:
 MIME-Version:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=epmGeWlUg0sk1ymD8aKTHa+TpgtMEyeF9rDL5knBwqw=; b=TN5ljGNtIu1lpvW1Ni5J+hdjmW
 JZJ757NCRe3R2thH403h6rteMuWgMzgKIcNtPjWCRqIpandMaz884QWhtsrrFDFs/kDNFCDu8Pa+3
 6tUibHWKU9ZU+Z3iWVRzZMoC/+rElxvVHKhR5S3K4zGi2HbXFi3pNk6Ovrl5s2KYt6DQ=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=References:Content-Type:Content-Transfer-Encoding:MIME-Version:
 In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=epmGeWlUg0sk1ymD8aKTHa+TpgtMEyeF9rDL5knBwqw=; b=iQgUr5L2XblnWtssppX/gNRhlC
 +xnIpwFA6bkOx1YNL3FFy/JYobVjap8wZwLmAJdSvuLTP2I/rlhruQmdn4r6c14nFuBgej9L/aZbg
 78ed1OamtRpFYBYaBWQsRkSG+L93aDHLpEJBIAlz7G8Ec3ko0gxVikurhnsPsx3u+BoE=;
Received: from mailout2.w1.samsung.com ([210.118.77.12])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.94.2)
 id 1njk8M-0004ej-O2
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 27 Apr 2022 16:03:19 +0000
Received: from eucas1p1.samsung.com (unknown [182.198.249.206])
 by mailout2.w1.samsung.com (KnoxPortal) with ESMTP id
 20220427160312euoutp02107a954bedbc207e78efc1873bd86394~pzFJfbVkG1479314793euoutp02z
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Wed, 27 Apr 2022 16:03:12 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.w1.samsung.com
 20220427160312euoutp02107a954bedbc207e78efc1873bd86394~pzFJfbVkG1479314793euoutp02z
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
 s=mail20170921; t=1651075392;
 bh=epmGeWlUg0sk1ymD8aKTHa+TpgtMEyeF9rDL5knBwqw=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=O1B+j/eS+FAhKO55gxGTSOXqmIXYgt9rOunF5AtiN+EgolHYWyqnHFZICEd76fw0Q
 pICj5XVecpnpOl3dd6/zPcqBDH401BRYF4C9WFh7ZxVUNEi9jyq5Zn1fDuaya3HWLe
 YReGlE4H46Th3X+/JAZzE24GELaWet6aVi7q99PQ=
Received: from eusmges2new.samsung.com (unknown [203.254.199.244]) by
 eucas1p2.samsung.com (KnoxPortal) with ESMTP id
 20220427160310eucas1p2f26bfea8215bfd277e0dea375708d596~pzFH3ddlk2333623336eucas1p2t;
 Wed, 27 Apr 2022 16:03:10 +0000 (GMT)
Received: from eucas1p1.samsung.com ( [182.198.249.206]) by
 eusmges2new.samsung.com (EUCPMTA) with SMTP id 24.14.09887.E3969626; Wed, 27
 Apr 2022 17:03:10 +0100 (BST)
Received: from eusmtrp1.samsung.com (unknown [182.198.249.138]) by
 eucas1p2.samsung.com (KnoxPortal) with ESMTPA id
 20220427160310eucas1p28cd3c5ff4fb7a04bc77c4c0b9d96bb74~pzFHH_jlH1480614806eucas1p2y;
 Wed, 27 Apr 2022 16:03:10 +0000 (GMT)
Received: from eusmgms1.samsung.com (unknown [182.198.249.179]) by
 eusmtrp1.samsung.com (KnoxPortal) with ESMTP id
 20220427160309eusmtrp1f63202f28b5d3c5f17e52fea4e3ccc83~pzFHFJ3Nm2077420774eusmtrp1Y;
 Wed, 27 Apr 2022 16:03:09 +0000 (GMT)
X-AuditID: cbfec7f4-45bff7000000269f-64-6269693e7212
Received: from eusmtip1.samsung.com ( [203.254.199.221]) by
 eusmgms1.samsung.com (EUCPMTA) with SMTP id 4B.81.09522.D3969626; Wed, 27
 Apr 2022 17:03:09 +0100 (BST)
Received: from localhost (unknown [106.210.248.162]) by eusmtip1.samsung.com
 (KnoxPortal) with ESMTPA id
 20220427160309eusmtip10bafb514eb5df875b8fe2d26100f2413~pzFGuYNlG1783517835eusmtip1N;
 Wed, 27 Apr 2022 16:03:09 +0000 (GMT)
From: Pankaj Raghav <p.raghav@samsung.com>
To: jaegeuk@kernel.org, axboe@kernel.dk, snitzer@kernel.org, hch@lst.de,
 mcgrof@kernel.org, naohiro.aota@wdc.com, sagi@grimberg.me,
 damien.lemoal@opensource.wdc.com, dsterba@suse.com,
 johannes.thumshirn@wdc.com
Date: Wed, 27 Apr 2022 18:02:52 +0200
Message-Id: <20220427160255.300418-14-p.raghav@samsung.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220427160255.300418-1-p.raghav@samsung.com>
MIME-Version: 1.0
X-Brightmail-Tracker: H4sIAAAAAAAAA01Sa1ATVxidu7vZXTITukZbbpHaIa1toQJV++O2MDzGpl2lr7EvcEZtDFvI
 EB5NoIodR2jAUUpNIAMSjBUYwrM1BGKQR1qkhSCRoiDPVhynSRVsQQErlJY2YXHqv3POd77v
 3DNzaVxsJv1pRWoGp0qVKSWkkLD1LP0UEqlQHHipuz0Emft6cNRwXUuikrtLOHIW92OoSFtK
 oeX+ARzZZ04L0JXFHAyNd7ZiqK6hG0MucxmOCjrvEuif/EmPlnsTR3/f3IqKukYAcg+XYcg+
 8SIa/LWWQoOVb6AO+yUCDbUZSXS22k0h3bH7OBrTuQEqdDQL0Lwpl0Ln7swSqHdiY/RT7NC1
 WHal9xuSLdTMUOzApIVgh/oz2ab6EyRbkV2Ms81VR9n28nmMbR/PJtmvNDMk25p3Q8DOfjdM
 siet9YA1W4cJVtdsEbwr3iOMSOCUis84VVjkx8Kk3tkHgvThLYdq7DeobGB5Jh/40JB5GRoX
 LZQXi5laAG+dJ/KB0IMXAKy+5xbwZB7AO3ML4OFGbXYNyQ9qAKyr618jUwA2GV0eQtMkEwxz
 TlBefQMzBmBhYyPmJTgzjcMr1lHMe2o9swNW6MdXMcFshj1TWsKLRUw47Ctxknzc09Aw+IDy
 HvXx6Lq5ON6yDl4yuFbtuMeiOX8a996HjEkIf8jrJPjd1+Boxy2cx+vhtMNK8TgAOvUFa57P
 oXtseW05F0Btq3m1AfSEnbys9EKcCYLmtjDeHgNPlf+J8Q5fOPbHOv4JvrDIdgrnZRE8fkzM
 uyWwdcm1Fgrh0BfGtVAWXpt2EDoQWPZImbJHypT9n1sO8Hrgx2WqUxI59bZU7mCoWpaizkxN
 DJWnpTQBz592rjgWLoCa6XuhXQCjQReANC7ZIFpoTzogFiXIsg5zqrT9qkwlp+4CG2lC4ieS
 KxplYiZRlsElc1w6p3o4xWgf/2zMYNXmN7e9Gp83UGOKeta+N5nZ97MjLBZNDQZAOsbUlaE/
 9I5tU5yt4fXdluS9BZ90humpFpOUOd4XE/Ze4XMXA+5vqXZFRvnpJh83PdHS+ULU9yMrpbe/
 zNL4RgQXL4MI9069MiNIsmNuX9DV6k93J9X9rju7K7wyTX+54+2lgxUf/UgIBZtGGxxp6q8D
 /d+f2H4ugHH8EhsQGLIzkOiRf7B4JKdZyuw3HJY+X15tfCsqXipfaDly0RidG7/dIpCPmasC
 3/xrujTlzMjMY9HpwcKSON8Lit/8pa17Wq5O/VuVJa7UrIQrjxIRH962SQy7nMXdCcpvI/y2
 pb4SSo5rDNeflBDqJNnWYFyllv0Hdu1dokIEAAA=
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFprHKsWRmVeSWpSXmKPExsVy+t/xu7q2mZlJBvNOmVqsP3WM2WL13X42
 i2kffjJbnJ56lsliUv8MdovfZ88zW+x9N5vV4sKPRiaLmwd2MlmsXH2UyeLJ+lnMFj0HPrBY
 /O26BxRrechs8eehocWkQ9cYLZ5encVksfeWtsWlxyvYLS4tcrfYs/cki8XlXXPYLOYve8pu
 MaHtK7PFjQlPGS0mHt/MavF5aQu7xbrX71ksTtySdpD1uHzF2+PfiTVsHhOb37F7nL+3kcXj
 8tlSj02rOtk8FjZMZfbYvKTeY/eCz0weu282sHn0Nr9j89jZep/V4/2+q2wefVtWMXqs33KV
 xWPC5o2sAUJRejZF+aUlqQoZ+cUltkrRhhZGeoaWFnpGJpZ6hsbmsVZGpkr6djYpqTmZZalF
 +nYJehkn3n9nLbiqU7F87332BsaNyl2MnBwSAiYSKxqWs3UxcnEICSxllLiy4hYbREJC4vbC
 JkYIW1jiz7UusLiQwHNGib6L6V2MHBxsAloSjZ3sIL0iAk8YJe7/fMwC4jALNLBI3Jq4iwmk
 QVjAWWLh5JtgNouAqsSxl/0sIDavgLXEqWmnoZbJS8y89J0dZCgnUHzCpwiIXVYS3YtusUKU
 C0qcnPkErJUZqLx562zmCYwCs5CkZiFJLWBkWsUoklpanJueW2yoV5yYW1yal66XnJ+7iRGY
 ULYd+7l5B+O8Vx/1DjEycTAeYpTgYFYS4f2yOyNJiDclsbIqtSg/vqg0J7X4EKMp0NkTmaVE
 k/OBKS2vJN7QzMDU0MTM0sDU0sxYSZzXs6AjUUggPbEkNTs1tSC1CKaPiYNTqoHJfmuR3JS9
 wd12bwW2Xy7z49n4lM9k/e36g+9+35z6aInLXouvByXCph4U/1vHO4EvideZUU+/YHl9FtfL
 fIlHZ+/u2Bka/n3GrPILLpV/ivoy+1ewBRXP5p7+f4+LWYz/+UsyJ/nZYpWFFPfx/BRlLrJY
 VNm9bLlzeGnXr6Wisq/2Xar8qhOyNWuJRNWeu8cjtQPO3N/9T7Fv3brvE2ZPKI9Y6+HkpnT3
 2s4Tc5iC/y72yXv6ZWuk/TGGp2eEOF8Ji308LcSpmL6nUap2cYxEy64nk6ftrV4k2NLCYPL4
 zrWG859ZutoZTgqvY4hZuPLX00Pzf8jpGReI6HVd7jvkOLVdUrX8CMfrL5/XeU7dqsRSnJFo
 qMVcVJwIAMW3jdqxAwAA
X-CMS-MailID: 20220427160310eucas1p28cd3c5ff4fb7a04bc77c4c0b9d96bb74
X-Msg-Generator: CA
X-RootMTR: 20220427160310eucas1p28cd3c5ff4fb7a04bc77c4c0b9d96bb74
X-EPHeader: CA
CMS-TYPE: 201P
X-CMS-RootMailID: 20220427160310eucas1p28cd3c5ff4fb7a04bc77c4c0b9d96bb74
References: <20220427160255.300418-1-p.raghav@samsung.com>
 <CGME20220427160310eucas1p28cd3c5ff4fb7a04bc77c4c0b9d96bb74@eucas1p2.samsung.com>
X-Spam-Score: -5.8 (-----)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  Convert the power of 2 based calculation with zone size to
 be generic in null_zone_no with optimization for power of 2 based zone sizes.
 The nr_zones calculation in null_init_zoned_dev has been replaced with a
 division without special handling for power of 2 based zone sizes as this
 function is called only during the initialization and [...] 
 Content analysis details:   (-5.8 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 RCVD_IN_MSPIKE_H3      RBL: Good reputation (+3)
 [210.118.77.12 listed in wl.mailspike.net]
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [210.118.77.12 listed in list.dnswl.org]
 -0.0 SPF_HELO_PASS          SPF: HELO matches SPF record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
 -0.6 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1njk8M-0004ej-O2
Subject: [f2fs-dev] [PATCH 13/16] null_blk: allow non power of 2 zoned
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

Convert the power of 2 based calculation with zone size to be generic in
null_zone_no with optimization for power of 2 based zone sizes.

The nr_zones calculation in null_init_zoned_dev has been replaced with a
division without special handling for power of 2 based zone sizes as
this function is called only during the initialization and will not
invoked in the hot path.

Performance Measurement:

Device:
zone size = 128M, blocksize=4k

FIO cmd:

fio --name=zbc --filename=/dev/nullb0 --direct=1 --zonemode=zbd  --size=23G
--io_size=<iosize> --ioengine=io_uring --iodepth=<iod> --rw=<mode> --bs=4k
--loops=4

The following results are an average of 4 runs on AMD Ryzen 5 5600X with
32GB of RAM:

Sequential Write:

x-----------------x---------------------------------x---------------------------------x
|     IOdepth     |            8                    |            16                   |
x-----------------x---------------------------------x---------------------------------x
|                 |  KIOPS   |BW(MiB/s) | Lat(usec) |  KIOPS   |BW(MiB/s) | Lat(usec) |
x-----------------x---------------------------------x---------------------------------x
| Without patch   |  578     |  2257    |   12.80   |  576     |  2248    |   25.78   |
x-----------------x---------------------------------x---------------------------------x
|  With patch     |  581     |  2268    |   12.74   |  576     |  2248    |   25.85   |
x-----------------x---------------------------------x---------------------------------x

Sequential read:

x-----------------x---------------------------------x---------------------------------x
| IOdepth         |            8                    |            16                   |
x-----------------x---------------------------------x---------------------------------x
|                 |  KIOPS   |BW(MiB/s) | Lat(usec) |  KIOPS   |BW(MiB/s) | Lat(usec) |
x-----------------x---------------------------------x---------------------------------x
| Without patch   |  667     |  2605    |   11.79   |  675     |  2637    |   23.49   |
x-----------------x---------------------------------x---------------------------------x
|  With patch     |  667     |  2605    |   11.79   |  675     |  2638    |   23.48   |
x-----------------x---------------------------------x---------------------------------x

Random read:

x-----------------x---------------------------------x---------------------------------x
| IOdepth         |            8                    |            16                   |
x-----------------x---------------------------------x---------------------------------x
|                 |  KIOPS   |BW(MiB/s) | Lat(usec) |  KIOPS   |BW(MiB/s) | Lat(usec) |
x-----------------x---------------------------------x---------------------------------x
| Without patch   |  522     |  2038    |   15.05   |  514     |  2006    |   30.87   |
x-----------------x---------------------------------x---------------------------------x
|  With patch     |  522     |  2039    |   15.04   |  523     |  2042    |   30.33   |
x-----------------x---------------------------------x---------------------------------x

Minor variations are noticed in Sequential write with io depth 8 and
in random read with io depth 16. But overall no noticeable differences
were noticed

Reviewed-by: Luis Chamberlain <mcgrof@kernel.org>
Signed-off-by: Pankaj Raghav <p.raghav@samsung.com>
---
 drivers/block/null_blk/main.c  |  4 ++--
 drivers/block/null_blk/zoned.c | 14 +++++++-------
 2 files changed, 9 insertions(+), 9 deletions(-)

diff --git a/drivers/block/null_blk/main.c b/drivers/block/null_blk/main.c
index c441a4972064..82a62b543782 100644
--- a/drivers/block/null_blk/main.c
+++ b/drivers/block/null_blk/main.c
@@ -1931,8 +1931,8 @@ static int null_validate_conf(struct nullb_device *dev)
 		dev->mbps = 0;
 
 	if (dev->zoned &&
-	    (!dev->zone_size || !is_power_of_2(dev->zone_size))) {
-		pr_err("zone_size must be power-of-two\n");
+	    (!dev->zone_size)) {
+		pr_err("zone_size must not be zero\n");
 		return -EINVAL;
 	}
 
diff --git a/drivers/block/null_blk/zoned.c b/drivers/block/null_blk/zoned.c
index dae54dd1aeac..00c34e65ef0a 100644
--- a/drivers/block/null_blk/zoned.c
+++ b/drivers/block/null_blk/zoned.c
@@ -13,7 +13,10 @@ static inline sector_t mb_to_sects(unsigned long mb)
 
 static inline unsigned int null_zone_no(struct nullb_device *dev, sector_t sect)
 {
-	return sect >> ilog2(dev->zone_size_sects);
+	if (is_power_of_2(dev->zone_size_sects))
+		return sect >> ilog2(dev->zone_size_sects);
+
+	return div64_u64(sect, dev->zone_size_sects);
 }
 
 static inline void null_lock_zone_res(struct nullb_device *dev)
@@ -62,10 +65,6 @@ int null_init_zoned_dev(struct nullb_device *dev, struct request_queue *q)
 	sector_t sector = 0;
 	unsigned int i;
 
-	if (!is_power_of_2(dev->zone_size)) {
-		pr_err("zone_size must be power-of-two\n");
-		return -EINVAL;
-	}
 	if (dev->zone_size > dev->size) {
 		pr_err("Zone size larger than device capacity\n");
 		return -EINVAL;
@@ -83,8 +82,9 @@ int null_init_zoned_dev(struct nullb_device *dev, struct request_queue *q)
 	zone_capacity_sects = mb_to_sects(dev->zone_capacity);
 	dev_capacity_sects = mb_to_sects(dev->size);
 	dev->zone_size_sects = mb_to_sects(dev->zone_size);
-	dev->nr_zones = round_up(dev_capacity_sects, dev->zone_size_sects)
-		>> ilog2(dev->zone_size_sects);
+	dev->nr_zones =
+		div64_u64(roundup(dev_capacity_sects, dev->zone_size_sects),
+			  dev->zone_size_sects);
 
 	dev->zones = kvmalloc_array(dev->nr_zones, sizeof(struct nullb_zone),
 				    GFP_KERNEL | __GFP_ZERO);
-- 
2.25.1



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
