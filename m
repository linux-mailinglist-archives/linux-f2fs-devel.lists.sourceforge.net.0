Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 28669511C28
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 27 Apr 2022 18:03:25 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.94.2)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1njk8S-0006e2-Ix; Wed, 27 Apr 2022 16:03:23 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <p.raghav@samsung.com>) id 1njk8O-0006co-OP
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 27 Apr 2022 16:03:19 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=References:Content-Type:Content-Transfer-Encoding:
 MIME-Version:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=Z59AramoBMIFuOXUYYH05DZBLjfbCNMGUst3i9j3Z7Q=; b=Ge6lLMCtMCacY4XAao7AbBpmEh
 cIB8etPtKFwqvpNZ/9DfLfA96UoRUuCr5bQQoVo2aOAXZNzbVQEq7fdBS+OULx5PAtNc7EIBFGcCl
 ojCLMIj4GdlRw8stCgWyEJDE7hf7paHq3t/DSwuX6W5k17v8VH4fhiAGkJZKqsQ1vQYQ=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=References:Content-Type:Content-Transfer-Encoding:MIME-Version:
 In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=Z59AramoBMIFuOXUYYH05DZBLjfbCNMGUst3i9j3Z7Q=; b=dckd8v6Gr7osFKiB278kOenLnQ
 xXsDzb2GZMX3rRLk612mCS4uLBGfaGkKMuowyQCX/9LMuZVy/TNxkNFdnUtCePQaxEcWpKjiQyzAX
 v0jc30JJHp0XeCw7CKPoHUHy6q5w1IcbT+B3ez2CFwENzfJp0+qic3GQA7omL8i1sAWc=;
Received: from mailout2.w1.samsung.com ([210.118.77.12])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.94.2)
 id 1njk8M-00Bt59-Ta
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 27 Apr 2022 16:03:19 +0000
Received: from eucas1p2.samsung.com (unknown [182.198.249.207])
 by mailout2.w1.samsung.com (KnoxPortal) with ESMTP id
 20220427160310euoutp0298636c1683a442137c8805acda106e0f~pzFHHgcbU1060710607euoutp02c
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Wed, 27 Apr 2022 16:03:10 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.w1.samsung.com
 20220427160310euoutp0298636c1683a442137c8805acda106e0f~pzFHHgcbU1060710607euoutp02c
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
 s=mail20170921; t=1651075390;
 bh=Z59AramoBMIFuOXUYYH05DZBLjfbCNMGUst3i9j3Z7Q=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=W7RCwmZtNSpvqE8y4evit2Zuyld27ntnSWb6JvmMVBxMaxqsV2CNMLB1BGalJnTQP
 YU0C/GItlU594cRcvi1Dbxne/WVtaDdWMEvWlL9JbbHa5tK/3iAwedjLyWAn8J47KM
 uIoIWOO+pVS0kGYKL9LDlUfRYQeyBV2VT2nUvGbg=
Received: from eusmges3new.samsung.com (unknown [203.254.199.245]) by
 eucas1p2.samsung.com (KnoxPortal) with ESMTP id
 20220427160308eucas1p29e66b3685c84483f3fdd5a90299d93e1~pzFFvrXVn2333623336eucas1p2p;
 Wed, 27 Apr 2022 16:03:08 +0000 (GMT)
Received: from eucas1p1.samsung.com ( [182.198.249.206]) by
 eusmges3new.samsung.com (EUCPMTA) with SMTP id 8C.0A.10260.C3969626; Wed, 27
 Apr 2022 17:03:08 +0100 (BST)
Received: from eusmtrp1.samsung.com (unknown [182.198.249.138]) by
 eucas1p2.samsung.com (KnoxPortal) with ESMTPA id
 20220427160307eucas1p229f9ebae38fcca9974909799e5e63ccf~pzFFKDoBX2335623356eucas1p2h;
 Wed, 27 Apr 2022 16:03:07 +0000 (GMT)
Received: from eusmgms2.samsung.com (unknown [182.198.249.180]) by
 eusmtrp1.samsung.com (KnoxPortal) with ESMTP id
 20220427160307eusmtrp194cac78e29ca037961137d3a49caf9ec~pzFFDipZN2142221422eusmtrp1D;
 Wed, 27 Apr 2022 16:03:07 +0000 (GMT)
X-AuditID: cbfec7f5-bddff70000002814-96-6269693c7e10
Received: from eusmtip1.samsung.com ( [203.254.199.221]) by
 eusmgms2.samsung.com (EUCPMTA) with SMTP id 85.A7.09404.B3969626; Wed, 27
 Apr 2022 17:03:07 +0100 (BST)
Received: from localhost (unknown [106.210.248.162]) by eusmtip1.samsung.com
 (KnoxPortal) with ESMTPA id
 20220427160307eusmtip1fe2208eed35a4c2cc164aecccf9c648a~pzFEt7JbD1109611096eusmtip1x;
 Wed, 27 Apr 2022 16:03:07 +0000 (GMT)
From: Pankaj Raghav <p.raghav@samsung.com>
To: jaegeuk@kernel.org, axboe@kernel.dk, snitzer@kernel.org, hch@lst.de,
 mcgrof@kernel.org, naohiro.aota@wdc.com, sagi@grimberg.me,
 damien.lemoal@opensource.wdc.com, dsterba@suse.com,
 johannes.thumshirn@wdc.com
Date: Wed, 27 Apr 2022 18:02:50 +0200
Message-Id: <20220427160255.300418-12-p.raghav@samsung.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220427160255.300418-1-p.raghav@samsung.com>
MIME-Version: 1.0
X-Brightmail-Tracker: H4sIAAAAAAAAA01Se0xTZxzNd+/t7S2z7lpd+CLdiFWmuPAQMPvG2MIWs924p7pMMNmwwOWR
 8XAt4BAX64oOOnlVUB5uQh2TAqGUh1lBSIMCMoa6YkeBDOKEqSCt8kjpEFjLrZn/nXN+5/zO
 70s+ChfpyM1UYkoaK0uRJklID+JKj+OmX1hiYnTgco8Y6X7rwVHdXwUkOvfYgaP+kgEMqQtK
 +Whp4BaOOqwVPHR78SSGho0GDGnrujE0oSvH0RnjYwItq8acWvZdHD29uwupu/4EaNJcjqGO
 kdeQ6V4NH5k076OrHX0EGmy7QKKLv0zyUeHpBRxZCicBKupt5qG56mw+api2EejGiFf4y8zg
 nQ+YlRv1JFOktPKZW2N6ghkcSGeaanNJpkpRgjPNP59g2ivnMKZ9WEEyeUoryRhOjfMYW6eZ
 ZPJbagGjazETTGGznvep6JBHWCyblJjBygLePuyRYCrOx44o1n2z0mTnK8CiQAUEFKRDoL7K
 gauAByWiawA8t7xKcmQeQIW2wk3mALxe14E9i1y71OqOXAawbLERcOQhgPfGTM4JRZH0Tngy
 l+/SN9EWAIsaGzEXwekpHN5uGVpbtZE+CPWLVuDCBO0D8+by1rCQfhPa74zyuTpvWGay811L
 BU69cDaCs2yAfWUThAvjTouytWLtIkhrPeC4qRhw2T2wumUC5/BGONXb4t4phv1nzxAczoKT
 liV3OBvAAoOOdJVBZ1n+70kuiNO+UNcWwNnfgdctBh7nWA8tMxu4E9ZD9ZXzOCcLYc5pEeeW
 QINjwl0K4eB3FwjOwkDD0t5CsKX8ubeUP/eW8v9rKwFeCzzZdHlyPCsPTmGP+sulyfL0lHj/
 mNTkJuD80/0rvQu/gpqpJ/5dAKNAF4AULtkknG9PiBYJY6WZx1hZapQsPYmVdwEvipB4CmMS
 G6UiOl6axn7FskdY2bMpRgk2KzCv+jJhZEZw67qg6QXpt5KPM7UfhVrT7seZc5JrreNBr74e
 fvT+zIcvafy2WEvtQ/b34vzSA//VBBmK2zQp+n1ZMDNb3aAmJjSVA7v3BeERxqhHxu/HRsOE
 OT7nfecv7pU0PEwVp379hWm1x3dZXLzDR6na+lnuZcGxEDgjLXG88GPp8LveMUPH/zn1R3DA
 tC33wbYn9It/q2pWFw490n651bPEM8RBNYyHrUZHHoyIN1bVd0YFbCsw6iWx1uN9/vu1scod
 b72SaQsIDzzw9CfJgZVr3bPb94d2x3lGPnjDODLsvWeWarQczhAPh3p1niB++Byxtu2726tH
 L+mzrn5iKr1plhDyBOmunbhMLv0P+DRJV0IEAAA=
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFprHKsWRmVeSWpSXmKPExsVy+t/xu7rWmZlJBlem61isP3WM2WL13X42
 i2kffjJbnJ56lsliUv8MdovfZ88zW+x9N5vV4sKPRiaLmwd2MlmsXH2UyeLJ+lnMFj0HPrBY
 /O26BxRrechs8eehocWkQ9cYLZ5encVksfeWtsWlxyvYLS4tcrfYs/cki8XlXXPYLOYve8pu
 MaHtK7PFjQlPGS0mHt/MavF5aQu7xbrX71ksTtySdpD1uHzF2+PfiTVsHhOb37F7nL+3kcXj
 8tlSj02rOtk8FjZMZfbYvKTeY/eCz0weu282sHn0Nr9j89jZep/V4/2+q2wefVtWMXqs33KV
 xWPC5o2sAUJRejZF+aUlqQoZ+cUltkrRhhZGeoaWFnpGJpZ6hsbmsVZGpkr6djYpqTmZZalF
 +nYJehmXpvQxFTTwVPzb9J29gfEHZxcjJ4eEgInE4cVbmbsYuTiEBJYySvQ/WcAKkZCQuL2w
 iRHCFpb4c62LDcQWEnjOKDHhtGQXIwcHm4CWRGMnO0iviMATRon7Px+zgDjMAg0sErcm7mIC
 aRAWCJWY1NLMDmKzCKhK9H7uBRvKK2At8f3KbXaIBfISMy99ZwcZygkUn/ApAmKXlUT3olus
 EOWCEidnPmEBsZmBypu3zmaewCgwC0lqFpLUAkamVYwiqaXFuem5xUZ6xYm5xaV56XrJ+bmb
 GIEJZduxn1t2MK589VHvECMTB+MhRgkOZiUR3i+7M5KEeFMSK6tSi/Lji0pzUosPMZoCnT2R
 WUo0OR+Y0vJK4g3NDEwNTcwsDUwtzYyVxHk9CzoShQTSE0tSs1NTC1KLYPqYODilGpjmrbjk
 9E73Oa/J+if9fbyVPcrR819umO4l9WfiedHM9K3yc/6Gbyg62Tsx7MYf/zfPimqaavWu+PZK
 MFqoGGlO1k35krMgp0nx9Pnrk9v+V+5Oj9WaYmo1f90kBvnlXxa+kvf/lb3Zf/fVXQn9s8vy
 mlri9jQ9lBUtLUw71Ht/Pu/8Sx8y+xa/z3qlkhm3PE9bSebp4+RTjpGcG7Rv817UnFhZHV72
 4sg0++ZHk1j8eddUrNkx64SjxfM/27/d+Mxw52zurrkCx825z/sceibeyelzr+vJC48DMxy0
 3zutXD6Fa2E1z7w1r6a1PD37+/TBpn/VXgebj/CvDIt2udqfe01MzXFXetXfVRx1z3r8lViK
 MxINtZiLihMBMHgdG7EDAAA=
X-CMS-MailID: 20220427160307eucas1p229f9ebae38fcca9974909799e5e63ccf
X-Msg-Generator: CA
X-RootMTR: 20220427160307eucas1p229f9ebae38fcca9974909799e5e63ccf
X-EPHeader: CA
CMS-TYPE: 201P
X-CMS-RootMailID: 20220427160307eucas1p229f9ebae38fcca9974909799e5e63ccf
References: <20220427160255.300418-1-p.raghav@samsung.com>
 <CGME20220427160307eucas1p229f9ebae38fcca9974909799e5e63ccf@eucas1p2.samsung.com>
X-Spam-Score: -5.8 (-----)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  Checks were in place to return error when a non power-of-2
 zoned devices is detected. Remove those checks as non power-of-2 zoned devices
 are now supported. Relax the zone size constraint to align with the
 BTRFS_STRIPE_LEN(64k)
 so that block groups are aligned to the BTRFS_STRIPE_LEN. 
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
X-Headers-End: 1njk8M-00Bt59-Ta
Subject: [f2fs-dev] [PATCH 11/16] btrfs: zoned: relax the alignment
 constraint for zoned devices
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

Checks were in place to return error when a non power-of-2 zoned devices
is detected. Remove those checks as non power-of-2 zoned devices are
now supported.

Relax the zone size constraint to align with the BTRFS_STRIPE_LEN(64k)
so that block groups are aligned to the BTRFS_STRIPE_LEN.

Reviewed-by: Luis Chamberlain <mcgrof@kernel.org>
Signed-off-by: Pankaj Raghav <p.raghav@samsung.com>
---
 fs/btrfs/zoned.c | 9 +++++----
 1 file changed, 5 insertions(+), 4 deletions(-)

diff --git a/fs/btrfs/zoned.c b/fs/btrfs/zoned.c
index 8f3f542e174c..3ed085762f14 100644
--- a/fs/btrfs/zoned.c
+++ b/fs/btrfs/zoned.c
@@ -395,8 +395,7 @@ int btrfs_get_dev_zone_info(struct btrfs_device *device, bool populate_cache)
 		zone_sectors = bdev_zone_sectors(bdev);
 	}
 
-	/* Check if it's power of 2 (see is_power_of_2) */
-	ASSERT(zone_sectors != 0 && (zone_sectors & (zone_sectors - 1)) == 0);
+	ASSERT(zone_sectors != 0 && IS_ALIGNED(zone_sectors, BTRFS_STRIPE_LEN));
 	zone_info->zone_size = zone_sectors << SECTOR_SHIFT;
 
 	/* We reject devices with a zone size larger than 8GB */
@@ -835,9 +834,11 @@ int btrfs_sb_log_location_bdev(struct block_device *bdev, int mirror, int rw,
 
 	ASSERT(rw == READ || rw == WRITE);
 
-	if (!is_power_of_2(bdev_zone_sectors(bdev)))
-		return -EINVAL;
 	nr_sectors = bdev_nr_sectors(bdev);
+
+	if (!IS_ALIGNED(nr_sectors, BTRFS_STRIPE_LEN))
+		return -EINVAL;
+
 	nr_zones = bdev_zone_no(bdev, nr_sectors);
 
 	sb_zone = sb_zone_number(bdev, mirror);
-- 
2.25.1



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
