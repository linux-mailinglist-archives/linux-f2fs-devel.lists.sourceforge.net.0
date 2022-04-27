Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id A7601511C26
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 27 Apr 2022 18:03:24 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.94.2)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1njk8S-0006dl-2j; Wed, 27 Apr 2022 16:03:23 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <p.raghav@samsung.com>) id 1njk8N-0006cK-JP
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 27 Apr 2022 16:03:18 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=References:Content-Type:Content-Transfer-Encoding:
 MIME-Version:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=6yQzfClVhDZ6n4jKfgnEonLdHdedN/dO+ui2CUTxKaw=; b=R1hRtH3TBKbN/8VdzD/5Fx4Pr6
 FQDXNxVfp/WrMwLXbuIzQemL98aZkt/RCzcvqbAFIoXbxK7Uo3ql6oajZ2MWSv04nq120rPSyFJLZ
 U+24AuS5qNdcQa6KkQcvuqWx1cVufj3GjbT2WXxkagON6vjGcWHJAbgOZZ+NWwYfGmM0=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=References:Content-Type:Content-Transfer-Encoding:MIME-Version:
 In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=6yQzfClVhDZ6n4jKfgnEonLdHdedN/dO+ui2CUTxKaw=; b=e682fjscCT9IuDF5VHr0V1qz6s
 oJC12i46NDCuxpOjAtLJJkpNSyGryP8QJd6VA2pHCuUQ6EVJHyUnCzWDiy2/wZhnxSaWxWsoghYeu
 iiq24AdSc0JX2IF0Nb2A3UZMX7dQYX/G+aLmq7YTQwcl7drf9yH3A+9Qj3s9YilCR4p4=;
Received: from mailout1.w1.samsung.com ([210.118.77.11])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.94.2)
 id 1njk8L-00Bt4v-EU
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 27 Apr 2022 16:03:18 +0000
Received: from eucas1p1.samsung.com (unknown [182.198.249.206])
 by mailout1.w1.samsung.com (KnoxPortal) with ESMTP id
 20220427160306euoutp01acb54d6b7b891bc2f0818150f8b551c0~pzFEIHgPX0746107461euoutp01e
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Wed, 27 Apr 2022 16:03:06 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.w1.samsung.com
 20220427160306euoutp01acb54d6b7b891bc2f0818150f8b551c0~pzFEIHgPX0746107461euoutp01e
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
 s=mail20170921; t=1651075386;
 bh=6yQzfClVhDZ6n4jKfgnEonLdHdedN/dO+ui2CUTxKaw=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=cKE+vL/OPgHNA5HyEuoppvKdFOS+gwWs/XPu9wKdHeQVDpM9bVGUGuGH4Cz1Ot2nV
 mwZW75NlBDHpbmp3EMaq6ci6eCl8znZzFGLCjeqC8bf+AzrosLVKEJGzyhJO56tHro
 xWC6wXNFsIlB0LEPDkuJgM7n+T08AdvuEPooYFV8=
Received: from eusmges1new.samsung.com (unknown [203.254.199.242]) by
 eucas1p2.samsung.com (KnoxPortal) with ESMTP id
 20220427160305eucas1p23f1ca6b3cc5d07b7197b62455d839133~pzFCtQUuI1589415894eucas1p2K;
 Wed, 27 Apr 2022 16:03:05 +0000 (GMT)
Received: from eucas1p1.samsung.com ( [182.198.249.206]) by
 eusmges1new.samsung.com (EUCPMTA) with SMTP id 7B.D7.10009.93969626; Wed, 27
 Apr 2022 17:03:05 +0100 (BST)
Received: from eusmtrp2.samsung.com (unknown [182.198.249.139]) by
 eucas1p1.samsung.com (KnoxPortal) with ESMTPA id
 20220427160304eucas1p1a0080df82f76c39882c4298c3c3d99fd~pzFCRIwGd2685626856eucas1p1p;
 Wed, 27 Apr 2022 16:03:04 +0000 (GMT)
Received: from eusmgms1.samsung.com (unknown [182.198.249.179]) by
 eusmtrp2.samsung.com (KnoxPortal) with ESMTP id
 20220427160304eusmtrp21dbea116401f4753609014b6527a5210~pzFCQGpO42598325983eusmtrp2o;
 Wed, 27 Apr 2022 16:03:04 +0000 (GMT)
X-AuditID: cbfec7f2-e7fff70000002719-7f-626969390a70
Received: from eusmtip2.samsung.com ( [203.254.199.222]) by
 eusmgms1.samsung.com (EUCPMTA) with SMTP id C6.81.09522.83969626; Wed, 27
 Apr 2022 17:03:04 +0100 (BST)
Received: from localhost (unknown [106.210.248.162]) by eusmtip2.samsung.com
 (KnoxPortal) with ESMTPA id
 20220427160304eusmtip21ef5128fdd0e92e860a902eb43177b8d~pzFB5d6OL3126231262eusmtip26;
 Wed, 27 Apr 2022 16:03:04 +0000 (GMT)
From: Pankaj Raghav <p.raghav@samsung.com>
To: jaegeuk@kernel.org, axboe@kernel.dk, snitzer@kernel.org, hch@lst.de,
 mcgrof@kernel.org, naohiro.aota@wdc.com, sagi@grimberg.me,
 damien.lemoal@opensource.wdc.com, dsterba@suse.com,
 johannes.thumshirn@wdc.com
Date: Wed, 27 Apr 2022 18:02:47 +0200
Message-Id: <20220427160255.300418-9-p.raghav@samsung.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220427160255.300418-1-p.raghav@samsung.com>
MIME-Version: 1.0
X-Brightmail-Tracker: H4sIAAAAAAAAA01Se0xbZRzNd+/t7aWx7K7F8A3Ehep04AZDTfzcpvEx3I37Y4sYNS4qZbtA
 I3TYgrAxBYSx8dha0DFaqi0vRRgWRiHreDhZgAF2LDxGYWM8Rp3WrO0oOAjIpNwu7r9zft85
 v3N+yUfhIiMZQMnkyaxCLk2QkAKipXvp2vZXZbKYHdYyChn7unFUN6EiUYlrCUf9Zy0YKlaV
 8tGyZQBH7Y4yHrq+mIWhsctmDP1c14WhWaMWR4WXXQT6N//22ixnGkcr0xGouPMGQLYRLYba
 x19Ag3dq+GiwYi9qa+8l0NAlHYn0P9r4SJ27gCOr2gZQUU8TD7mrc/jol7+dBLo6HvhGEDM0
 vI9ZvXqeZIqyHXxm4HYjwQxZUpgLtXkkU555FmeaqjKYVoMbY1rHMknmdLaDZMwnJnmMs2OE
 ZM6YagFjNI0QjLqpkXdA9LFg92E2QfYlqwh/PVoQX5Bv4CWZNqSNn2jiZQL7E/nAh4L0y7Cq
 cZbIBwJKRNcAuNTmwDkyD2CPapXPETeAV+p+IB9ZuusrvZafACzLXcQ48heA+pu2NQtFkXQo
 zMpbd/vRVgCLGhrWRThtx+F10yjmWSWm34OTE2PAYyDoLVDX9pFnLKR3wqy7TpxL2ww1gw/W
 d/rQu6B6zivZCHs1nt4+ays3w+zmsvXakK4WwKK+YW/TPbD0j28JDouhvcfE5/BT8KFZj3E4
 Hdqsy15zDoAqs5H0hMG1sDO/J3ggTodA46VwTv4mrNQXAE7hC633NnIVfGFxyzmcGwvhqVwR
 p5ZA89KsNxTCoW903jIMLLbOAzUI1j52jPaxY7T/5xoAXgv82RRlYhyrjJCzqWFKaaIyRR4X
 duhI4gWw9qf7V3vmLoLv7ffDOgFGgU4AKVziJ5xvjY8RCQ9Ljx5jFUc+U6QksMpOEEgREn/h
 IVmDVETHSZPZz1k2iVU8esUon4BM7JS48mv01UJFfd9BccVc6zWNZk+Qz0zH7NsLB90nFU/7
 jx7f71gEYuVrhegT4jlyy9FnBjLuB0X6js5pot4NiS8djq7fMBBmz/jQyvTz/omtLh+1jIHT
 +yMr7jiadz5b7zIV3x3ZWvWFurXr/aTaiKkdLvd557YbQ1EvDdtUK8mv6N85FrL1txeXHyhT
 B7ZTneYPQvMyxu5NH8dmfp28We5y1tLiysDUk5NTt9LzR9NmaqymzL3mmNilgpje6mW/wk2W
 ksipqJYr6QErzc8bHnbpahKEBkOaLmX61p+NF5NMu0qC8e/8ztErruBN4W99KpFvC5JF6/Mq
 Yyc0SbuNgic7SiSEMl4aEYorlNL/AHjkNBtCBAAA
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFprHKsWRmVeSWpSXmKPExsVy+t/xe7oWmZlJBleeaFmsP3WM2WL13X42
 i2kffjJbnJ56lsliUv8MdovfZ88zW+x9N5vV4sKPRiaLmwd2MlmsXH2UyeLJ+lnMFj0HPrBY
 /O26BxRrechs8eehocWkQ9cYLZ5encVksfeWtsWlxyvYLS4tcrfYs/cki8XlXXPYLOYve8pu
 MaHtK7PFjQlPGS0mHt/MavF5aQu7xbrX71ksTtySdpD1uHzF2+PfiTVsHhOb37F7nL+3kcXj
 8tlSj02rOtk8FjZMZfbYvKTeY/eCz0weu282sHn0Nr9j89jZep/V4/2+q2wefVtWMXqs33KV
 xWPC5o2sAUJRejZF+aUlqQoZ+cUltkrRhhZGeoaWFnpGJpZ6hsbmsVZGpkr6djYpqTmZZalF
 +nYJehndXQtYC7bwV9xq3czawPiKp4uRk0NCwETi2NrFLF2MXBxCAksZJd6dbGWDSEhI3F7Y
 xAhhC0v8udbFBlH0nFHiyf01QA4HB5uAlkRjJztIXETgCaPE/Z+PwSYxCzSwSNyauIsJpFtY
 IEBiZUsXK0gDi4CqxJw9ESBhXgEricbn75khFshLzLz0nR2khFPAWmLCJ7ASIaCS7kW3WCHK
 BSVOznzCAmIzA5U3b53NPIFRYBaS1CwkqQWMTKsYRVJLi3PTc4sN9YoTc4tL89L1kvNzNzEC
 E8q2Yz8372Cc9+qj3iFGJg7GQ4wSHMxKIrxfdmckCfGmJFZWpRblxxeV5qQWH2I0Bbp6IrOU
 aHI+MKXllcQbmhmYGpqYWRqYWpoZK4nzehZ0JAoJpCeWpGanphakFsH0MXFwSjUwbXh0sFYx
 ffez0B6x6u98avHVshcbxYx9PuuKqC2oyAzgu+CwtoUpebr1lrPqWgqLljxszKicc6BGQ13I
 6evUJ+ebNSwcVrf4uN4X2H9p0b79p9z1jxvH3u/mepvZFyL1epHRTbW0Za4/4t5/vhSaYfbe
 Nv/OIaHcQy/5yxZ8X/bHpEG2/YBd47UCT6FTu35+ccguYrMy7AvSi0xYfvGwTtrMxss3rzr+
 fb/IzDvo9PeqkBVWQo8tRKNua6l/rP7w3DF31qFTMVd5171Zv+Y374rm8BKVtJ2Xjq9u9Yj8
 yrfkL4+Dq8uUw98/2STONzv8qsZ57wfTRxHFkjMF416p3f6VVTG7S19jdfC2JWpySizFGYmG
 WsxFxYkABPmx3bEDAAA=
X-CMS-MailID: 20220427160304eucas1p1a0080df82f76c39882c4298c3c3d99fd
X-Msg-Generator: CA
X-RootMTR: 20220427160304eucas1p1a0080df82f76c39882c4298c3c3d99fd
X-EPHeader: CA
CMS-TYPE: 201P
X-CMS-RootMailID: 20220427160304eucas1p1a0080df82f76c39882c4298c3c3d99fd
References: <20220427160255.300418-1-p.raghav@samsung.com>
 <CGME20220427160304eucas1p1a0080df82f76c39882c4298c3c3d99fd@eucas1p1.samsung.com>
X-Spam-Score: -5.8 (-----)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  Add helpers to calculate alignment, round up and round down
 for zoned devices. These helpers encapsulates the necessary handling for
 power_of_2 and non-power_of_2 zone sizes. Optimized calculations ar [...] 
 Content analysis details:   (-5.8 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 RCVD_IN_MSPIKE_H3      RBL: Good reputation (+3)
 [210.118.77.11 listed in wl.mailspike.net]
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [210.118.77.11 listed in list.dnswl.org]
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
X-Headers-End: 1njk8L-00Bt4v-EU
Subject: [f2fs-dev] [PATCH 08/16] btrfs: zoned: add generic btrfs helpers
 for zoned devices
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

Add helpers to calculate alignment, round up and round down
for zoned devices. These helpers encapsulates the necessary handling for
power_of_2 and non-power_of_2 zone sizes. Optimized calculations are
performed for zone sizes that are power_of_2 with log and shifts.

btrfs_zoned_is_aligned() is added instead of reusing bdev_zone_aligned()
helper is due to some use cases in btrfs where zone alignment is checked
before having access to the underlying block device such as in this
function: btrfs_load_block_group_zone_info().

Reviewed-by: Luis Chamberlain <mcgrof@kernel.org>
Signed-off-by: Pankaj Raghav <p.raghav@samsung.com>
---
 fs/btrfs/zoned.h | 28 ++++++++++++++++++++++++++++
 1 file changed, 28 insertions(+)

diff --git a/fs/btrfs/zoned.h b/fs/btrfs/zoned.h
index 49317524e9a6..b9c435961361 100644
--- a/fs/btrfs/zoned.h
+++ b/fs/btrfs/zoned.h
@@ -9,6 +9,7 @@
 #include "disk-io.h"
 #include "block-group.h"
 #include "btrfs_inode.h"
+#include "misc.h"
 
 /*
  * Block groups with more than this value (percents) of unusable space will be
@@ -34,6 +35,33 @@ struct btrfs_zoned_device_info {
 	u32 sb_zone_location[BTRFS_SUPER_MIRROR_MAX];
 };
 
+static inline bool btrfs_zoned_is_aligned(u64 pos, u64 zone_size)
+{
+	u64 remainder = 0;
+
+	if (is_power_of_two_u64(zone_size))
+		return IS_ALIGNED(pos, zone_size);
+
+	div64_u64_rem(pos, zone_size, &remainder);
+	return remainder == 0;
+}
+
+static inline u64 btrfs_zoned_roundup(u64 pos, u64 zone_size)
+{
+	if (is_power_of_two_u64(zone_size))
+		return ALIGN(pos, zone_size);
+
+	return roundup(pos, zone_size);
+}
+
+static inline u64 btrfs_zoned_rounddown(u64 pos, u64 zone_size)
+{
+	if (is_power_of_two_u64(zone_size))
+		return round_down(pos, zone_size);
+
+	return rounddown(pos, zone_size);
+}
+
 #ifdef CONFIG_BLK_DEV_ZONED
 int btrfs_get_dev_zone(struct btrfs_device *device, u64 pos,
 		       struct blk_zone *zone);
-- 
2.25.1



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
