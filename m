Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 2AD03C68059
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 18 Nov 2025 08:43:21 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Subject:MIME-Version:Message-Id:Date:To:From:Sender:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=Q3u2hy26uUs3Wo0qgpNKuQ14+uJZ1URu6oJwNnaPLkE=; b=KHJLwPEdhnezBqhvoLN7MOxCYX
	TWE0W+TioGRx89dLkR16TbBMy5qoVUAQb8pVdyP9oZ7q+ASV9Ioh+1y3uFkRxyTpkMdeSVwGtKjIK
	gtlBb1+o+mGHxuGvCZDrI0a6NfhQnxd9AbXyTHADbaEoQ+s0Sj02vZTUhQrvpSerjEh8=;
Received: from [127.0.0.1] (helo=sfs-ml-3.v29.lw.sourceforge.com)
	by sfs-ml-3.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1vLGMe-0005gP-Tu;
	Tue, 18 Nov 2025 07:43:00 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-3.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <ckulkarnilinux@gmail.com>) id 1vLGMd-0005gJ-Fe
 for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 18 Nov 2025 07:42:59 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=NxywsA1nA8TGs2RT9uGSCEgSdjJBrPjC0KiHZ/jaP8E=; b=jIFviLip9A71rHHLk5JYafbZS1
 YtFBnNQDL/vgjegwu7VHdvmM+jUYx7OaSpPq1MluVzVmWq4rUS/G87fG9KOg4O5AH3CfMPO3vzbd5
 GrddrmLtQHzE+mBm9OcPv9I4H4O2XYD/98m6G/KvwVIGEzzXrmRx2SYYfu93lDug7Fz0=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:Message-Id:Date:Subject:Cc:To:From
 :Sender:Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=NxywsA1nA8TGs2RT9uGSCEgSdjJBrPjC0KiHZ/jaP8E=; b=U
 2CZVaGoBeLXqsIkx5UvjgOfstx89lED3U4KBrXu9L+B8HsWy9yUokOMKC81W3auzKcIMFl4vbkTb3
 8xNEqRFnl0nIn2IIjug8Hd9K4lNjgVz8vQIJYmr9g6gITmcrxLwMXfIe0wvplK35SRPdqmwDSqPIX
 h83YZ5POjrPb/wIY=;
Received: from mail-pf1-f175.google.com ([209.85.210.175])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1vLGMc-0001qh-Sy for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 18 Nov 2025 07:42:59 +0000
Received: by mail-pf1-f175.google.com with SMTP id
 d2e1a72fcca58-7ba92341f83so1230835b3a.0
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Mon, 17 Nov 2025 23:42:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1763451768; x=1764056568; darn=lists.sourceforge.net;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=NxywsA1nA8TGs2RT9uGSCEgSdjJBrPjC0KiHZ/jaP8E=;
 b=BD9CviJ2JMuLofF6kWaJdLIcgkVuT+88UInDnXNCAwn3JHiZU4KSvz5GqqEmnQOqA5
 WP/1q5bURqfFwl4nAcWd68kT2QurXN2l3JBLC04jQpw2kzrgSWlJG/DSNVRx3ZWbeV2l
 pAoeEqfBT+OtuBRiR3yVcqO0+/u7sWFLUfy4wvuwuFL0ovP/6GS3ComrCNVnEmB4ToDD
 NaOkc4r4f0CqUp5s7SPTUN+TO1erSJcNCZSMAyAZGwjebkuJjLOpRsjSQGs0qqOujLlz
 zJPmohk2eAJadXxUghD+KAuFPooxBKGM+yvT+QG+CI/sbYVEe5ZScxRv5Xf5DXpLgLc3
 JK2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1763451768; x=1764056568;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=NxywsA1nA8TGs2RT9uGSCEgSdjJBrPjC0KiHZ/jaP8E=;
 b=NCFR1ho3Kdinc9xZIaZcXKkmFdMUZyh7uwemLzuuDyeIbHtvrkvUNEhYzjVRY2sZO9
 LRBiRazCKjVDp38L1ITvkVyYcHkQbDPA2YL2rkextwmb2JhmRdXVKRAlRwt7WmkxT8ZD
 /c0rAZWcvw7I3hm3WhEGJtMCnz7DMrwyJA1tGYbvH5J437CnAxCytpKcmrPWSHMIpwso
 cD0BbFtDxlHzkDHmD5Fg1/ZPbnlj2bEki6N6D8/kYnnBOD1M5YXP+ioS5W4/Qcp9+7qn
 QHHJlpSKa9PNGHQR4QAT6EsR2uYiMs8gifZxdfnwLDnJpstvGwRGo9X8FUjKL9fuNKzH
 ThzA==
X-Forwarded-Encrypted: i=1;
 AJvYcCWN41Hi1xWLP26Vh0bqtG+ytpA+3ULa5vFH+DKyaA88LukutCdMjx47DIDLAV4X6AEeCPUYJrYUkRFU5ULUVRmo@lists.sourceforge.net
X-Gm-Message-State: AOJu0YwEYN2utPq+PhbgZ7XAIY7lYQaCn6BbQ07ltQ2ELQrSuTQEZH4Z
 lGsnHbqppfNXUY4NtKboBlhsMktsj7c/ctIamujrJaeEmyLErg9WPS40
X-Gm-Gg: ASbGncunbS6PPglyXd0tFax6QtHc2+qeT/2UheL69SACOoBvT581n2DCtk4WCZXGcFD
 6XPB8nX7g3NpXqRqKINCgvrHpkptXCpJYZKwxsIcrnEdJ+rYYPv9VVWQ0G8bV6tSmVDHmcjY7NI
 qApnq/VLuY568y4mnttfQY966D0Pf27XVQxhKO9XfTROtksw2aql4RECU0EIETV/+k2/NTwfaEg
 RofR5W8SpmBZksyqWForOx+sKJVoHqYK4tNaN7LntZiOHpEudtC9cIq6DZ3zvOfc9yFZKtnWDvG
 JDPuiqNgoANM7fX2E5Gtj1+Xi/BkMgjLwR5Q1aGmNJV3wuEpGkrwjLYbCBjR1GGU/mrINf2fE12
 oNVxYXjjIPyU5yxv6j9V3A+QQl/jikX+fLJG9GoKfbh2OkiWATCuH93FsovGFPD+5YYOKaB7PZe
 PMiUP971PClDz7DYBjEBKr5nLwbyjTM45jRdMcAKH3ZXL474Az5b+U92W78w==
X-Google-Smtp-Source: AGHT+IEP4Fiq1WYi0fQwUxT7w8CcXRrYGmKQQRpSmtx18AEGOxK4QGIRV7JKkjFv4nGOrRKeWjhvWA==
X-Received: by 2002:a05:7022:69aa:b0:11b:3742:1257 with SMTP id
 a92af1059eb24-11b4120ca2amr9929883c88.34.1763451767829; 
 Mon, 17 Nov 2025 23:42:47 -0800 (PST)
Received: from localhost (ip70-175-132-216.oc.oc.cox.net. [70.175.132.216])
 by smtp.gmail.com with ESMTPSA id
 a92af1059eb24-11b06088625sm58814092c88.8.2025.11.17.23.42.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 17 Nov 2025 23:42:47 -0800 (PST)
From: Chaitanya Kulkarni <ckulkarnilinux@gmail.com>
To: linux-block@vger.kernel.org, dm-devel@lists.linux.dev,
 linux-raid@vger.kernel.org, linux-nvme@lists.infradead.org,
 linux-f2fs-devel@lists.sourceforge.net, linux-xfs@vger.kernel.org
Date: Mon, 17 Nov 2025 23:42:43 -0800
Message-Id: <20251118074243.636812-1-ckulkarnilinux@gmail.com>
X-Mailer: git-send-email 2.40.0
MIME-Version: 1.0
X-Spam-Score: 0.8 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-2.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  __blkdev_issue_discard() always returns 0, making all error
 checking at call sites dead code. The function simply stops allocating bios
 and returns 0. Discard operations are advisory/optimization, not critical.
 Some callers have dead error checking code expecting wrong return codes such
 as -ENOTSUPP when 0 is only returned. 
 Content analysis details:   (0.8 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 1.0 RCVD_IN_UCE2           RBL: IP Subnet Listed in UCEPROTECT Level 2
 [70.175.132.216 listed in dnsbl-2.uceprotect.net]
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 0.0 FREEMAIL_FROM Sender email is commonly abused enduser mail provider
 [ckulkarnilinux(at)gmail.com]
 0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [209.85.210.175 listed in wl.mailspike.net]
X-Headers-End: 1vLGMc-0001qh-Sy
Subject: [f2fs-dev] [RFC PATCH] block: change __blkdev_issue_discard()
 return type to void
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
Cc: axboe@kernel.dk, kch@nvidia.com, sagi@grimberg.me, cem@kernel.org,
 snitzer@kernel.org, song@kernel.org,
 Chaitanya Kulkarni <ckulkarnilinux@gmail.com>, mpatocka@redhat.com,
 jaegeuk@kernel.org, yukuai3@huawei.com, hch@lst.de, agk@redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

__blkdev_issue_discard() always returns 0, making all error checking
at call sites dead code. The function simply stops allocating bios 
and returns 0.

Discard operations are advisory/optimization, not critical. Some callers
have dead error checking code expecting wrong return codes such as
-ENOTSUPP when 0 is only returned. 

This patch changes __blkdev_issue_discard() return type to void and
removes dead error checking code from all call sites:

* Block layer:
  blk-lib.c: Remove return value, update blkdev_issue_discard() caller

* Device mapper:
  dm-thin.c: Change issue_discard() to void, update both callers
  md.c: Simplify conditional to just check for NULL bio

* NVMe target:
  io-cmd-bdev.c: Remove dead error handling and error_slba assignment

* Filesystems:
  f2fs/segment.c: Preserve fault injection
  xfs/xfs_discard.c: Update both xfs_discard_extents() and
  xfs_discard_rtdev_extents() to remove dead error checks

Signed-off-by: Chaitanya Kulkarni <ckulkarnilinux@gmail.com>
---
Hi,

Due to involvement of all the subsystem making it as an RFC, ideally
it shuoldn't be an RFC.

-ck
---
 block/blk-lib.c                   |  7 +++----
 drivers/md/dm-thin.c              | 12 +++++-------
 drivers/md/md.c                   |  4 ++--
 drivers/nvme/target/io-cmd-bdev.c |  7 +------
 fs/f2fs/segment.c                 |  2 +-
 fs/xfs/xfs_discard.c              | 17 +++--------------
 include/linux/blkdev.h            |  2 +-
 7 files changed, 16 insertions(+), 35 deletions(-)

diff --git a/block/blk-lib.c b/block/blk-lib.c
index 3030a772d3aa..ca78ec6b5326 100644
--- a/block/blk-lib.c
+++ b/block/blk-lib.c
@@ -60,7 +60,7 @@ struct bio *blk_alloc_discard_bio(struct block_device *bdev,
 	return bio;
 }
 
-int __blkdev_issue_discard(struct block_device *bdev, sector_t sector,
+void __blkdev_issue_discard(struct block_device *bdev, sector_t sector,
 		sector_t nr_sects, gfp_t gfp_mask, struct bio **biop)
 {
 	struct bio *bio;
@@ -68,7 +68,6 @@ int __blkdev_issue_discard(struct block_device *bdev, sector_t sector,
 	while ((bio = blk_alloc_discard_bio(bdev, &sector, &nr_sects,
 			gfp_mask)))
 		*biop = bio_chain_and_submit(*biop, bio);
-	return 0;
 }
 EXPORT_SYMBOL(__blkdev_issue_discard);
 
@@ -90,8 +89,8 @@ int blkdev_issue_discard(struct block_device *bdev, sector_t sector,
 	int ret;
 
 	blk_start_plug(&plug);
-	ret = __blkdev_issue_discard(bdev, sector, nr_sects, gfp_mask, &bio);
-	if (!ret && bio) {
+	__blkdev_issue_discard(bdev, sector, nr_sects, gfp_mask, &bio);
+	if (bio) {
 		ret = submit_bio_wait(bio);
 		if (ret == -EOPNOTSUPP)
 			ret = 0;
diff --git a/drivers/md/dm-thin.c b/drivers/md/dm-thin.c
index c84149ba4e38..77c76f75c85f 100644
--- a/drivers/md/dm-thin.c
+++ b/drivers/md/dm-thin.c
@@ -395,13 +395,13 @@ static void begin_discard(struct discard_op *op, struct thin_c *tc, struct bio *
 	op->bio = NULL;
 }
 
-static int issue_discard(struct discard_op *op, dm_block_t data_b, dm_block_t data_e)
+static void issue_discard(struct discard_op *op, dm_block_t data_b, dm_block_t data_e)
 {
 	struct thin_c *tc = op->tc;
 	sector_t s = block_to_sectors(tc->pool, data_b);
 	sector_t len = block_to_sectors(tc->pool, data_e - data_b);
 
-	return __blkdev_issue_discard(tc->pool_dev->bdev, s, len, GFP_NOIO, &op->bio);
+	__blkdev_issue_discard(tc->pool_dev->bdev, s, len, GFP_NOIO, &op->bio);
 }
 
 static void end_discard(struct discard_op *op, int r)
@@ -1113,9 +1113,7 @@ static void passdown_double_checking_shared_status(struct dm_thin_new_mapping *m
 				break;
 		}
 
-		r = issue_discard(&op, b, e);
-		if (r)
-			goto out;
+		issue_discard(&op, b, e);
 
 		b = e;
 	}
@@ -1188,8 +1186,8 @@ static void process_prepared_discard_passdown_pt1(struct dm_thin_new_mapping *m)
 		struct discard_op op;
 
 		begin_discard(&op, tc, discard_parent);
-		r = issue_discard(&op, m->data_block, data_end);
-		end_discard(&op, r);
+		issue_discard(&op, m->data_block, data_end);
+		end_discard(&op, 0);
 	}
 }
 
diff --git a/drivers/md/md.c b/drivers/md/md.c
index 41c476b40c7a..7fc0bb7a3814 100644
--- a/drivers/md/md.c
+++ b/drivers/md/md.c
@@ -9041,8 +9041,8 @@ void md_submit_discard_bio(struct mddev *mddev, struct md_rdev *rdev,
 {
 	struct bio *discard_bio = NULL;
 
-	if (__blkdev_issue_discard(rdev->bdev, start, size, GFP_NOIO,
-			&discard_bio) || !discard_bio)
+	__blkdev_issue_discard(rdev->bdev, start, size, GFP_NOIO, &discard_bio);
+	if (!discard_bio)
 		return;
 
 	bio_chain(discard_bio, bio);
diff --git a/drivers/nvme/target/io-cmd-bdev.c b/drivers/nvme/target/io-cmd-bdev.c
index 8d246b8ca604..f26010c46c33 100644
--- a/drivers/nvme/target/io-cmd-bdev.c
+++ b/drivers/nvme/target/io-cmd-bdev.c
@@ -366,16 +366,11 @@ static u16 nvmet_bdev_discard_range(struct nvmet_req *req,
 		struct nvme_dsm_range *range, struct bio **bio)
 {
 	struct nvmet_ns *ns = req->ns;
-	int ret;
 
-	ret = __blkdev_issue_discard(ns->bdev,
+	__blkdev_issue_discard(ns->bdev,
 			nvmet_lba_to_sect(ns, range->slba),
 			le32_to_cpu(range->nlb) << (ns->blksize_shift - 9),
 			GFP_KERNEL, bio);
-	if (ret && ret != -EOPNOTSUPP) {
-		req->error_slba = le64_to_cpu(range->slba);
-		return errno_to_nvme_status(req, ret);
-	}
 	return NVME_SC_SUCCESS;
 }
 
diff --git a/fs/f2fs/segment.c b/fs/f2fs/segment.c
index b45eace879d7..e6078176f733 100644
--- a/fs/f2fs/segment.c
+++ b/fs/f2fs/segment.c
@@ -1346,7 +1346,7 @@ static int __submit_discard_cmd(struct f2fs_sb_info *sbi,
 		if (time_to_inject(sbi, FAULT_DISCARD)) {
 			err = -EIO;
 		} else {
-			err = __blkdev_issue_discard(bdev,
+			__blkdev_issue_discard(bdev,
 					SECTOR_FROM_BLOCK(start),
 					SECTOR_FROM_BLOCK(len),
 					GFP_NOFS, &bio);
diff --git a/fs/xfs/xfs_discard.c b/fs/xfs/xfs_discard.c
index ee49f20875af..f82cc07806df 100644
--- a/fs/xfs/xfs_discard.c
+++ b/fs/xfs/xfs_discard.c
@@ -116,7 +116,6 @@ xfs_discard_extents(
 	struct xfs_extent_busy	*busyp;
 	struct bio		*bio = NULL;
 	struct blk_plug		plug;
-	int			error = 0;
 
 	blk_start_plug(&plug);
 	list_for_each_entry(busyp, &extents->extent_list, list) {
@@ -126,18 +125,10 @@ xfs_discard_extents(
 
 		trace_xfs_discard_extent(xg, busyp->bno, busyp->length);
 
-		error = __blkdev_issue_discard(btp->bt_bdev,
+		__blkdev_issue_discard(btp->bt_bdev,
 				xfs_gbno_to_daddr(xg, busyp->bno),
 				XFS_FSB_TO_BB(mp, busyp->length),
 				GFP_KERNEL, &bio);
-		if (error && error != -EOPNOTSUPP) {
-			xfs_info(mp,
-	 "discard failed for extent [0x%llx,%u], error %d",
-				 (unsigned long long)busyp->bno,
-				 busyp->length,
-				 error);
-			break;
-		}
 	}
 
 	if (bio) {
@@ -149,7 +140,7 @@ xfs_discard_extents(
 	}
 	blk_finish_plug(&plug);
 
-	return error;
+	return 0;
 }
 
 /*
@@ -496,12 +487,10 @@ xfs_discard_rtdev_extents(
 
 		trace_xfs_discard_rtextent(mp, busyp->bno, busyp->length);
 
-		error = __blkdev_issue_discard(bdev,
+		__blkdev_issue_discard(bdev,
 				xfs_rtb_to_daddr(mp, busyp->bno),
 				XFS_FSB_TO_BB(mp, busyp->length),
 				GFP_NOFS, &bio);
-		if (error)
-			break;
 	}
 	xfs_discard_free_rtdev_extents(tr);
 
diff --git a/include/linux/blkdev.h b/include/linux/blkdev.h
index f0ab02e0a673..b05c37d20b09 100644
--- a/include/linux/blkdev.h
+++ b/include/linux/blkdev.h
@@ -1258,7 +1258,7 @@ extern void blk_io_schedule(void);
 
 int blkdev_issue_discard(struct block_device *bdev, sector_t sector,
 		sector_t nr_sects, gfp_t gfp_mask);
-int __blkdev_issue_discard(struct block_device *bdev, sector_t sector,
+void __blkdev_issue_discard(struct block_device *bdev, sector_t sector,
 		sector_t nr_sects, gfp_t gfp_mask, struct bio **biop);
 int blkdev_issue_secure_erase(struct block_device *bdev, sector_t sector,
 		sector_t nr_sects, gfp_t gfp);
-- 
2.40.0



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
