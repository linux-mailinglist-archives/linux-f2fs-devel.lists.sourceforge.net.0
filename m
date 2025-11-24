Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 895C9C82DB5
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 25 Nov 2025 00:48:37 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Subject:MIME-Version:References:In-Reply-To:Message-Id:Date:To:From:Sender:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=fX5Ax4M+M1dlE9tUi5ihlCgOLzRgHqSz1r/z5m56r38=; b=FBq+qjLQTX6eCDpP1K4RQ+tiYv
	vHylewE+sm3xIdgwB9lVAoIzsEwP857FK20WKpx13R+7OWkHugKiQFwzP2Pmo/4/8OMV7311RQ1s7
	OWkVCJxeLvz1gz76puzXO7XDG8bezVCTVuPp3xaVlkSo0dtGxJcsb2uzcyv5lorcyP68=;
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1vNgIN-0005Wn-NC;
	Mon, 24 Nov 2025 23:48:35 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <ckulkarnilinux@gmail.com>) id 1vNgIL-0005Wd-39
 for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 24 Nov 2025 23:48:33 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=KD9mOy62HqGMPaOYo+qJ4jLF6S4k7Y6n0q2fK45fvpw=; b=TIqkWW6E/z9DD1BoOa7zknLsWD
 Niq/JqJ+amp04KHKc5Gnpb1A33UELeqqjjduNLyWJl+UK/ZhQSGzrQgsrTBMyoJpe5aqfKvj76VWS
 S2JBR4u4NnAmjk2+ExIJJQ9dP8UhSjt+XNdwqQ1bSS2NH6qPxNA+2TStH7sJHP9QiJr4=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=KD9mOy62HqGMPaOYo+qJ4jLF6S4k7Y6n0q2fK45fvpw=; b=JQHEJG05ChmCtoaEHigeEL/nAa
 dlq4+sZqERKGhwDHOB0WgHVFfJfo77N7bVNXwnv0rgNMf7dEjYJyP6EkQiI6irG/oXXA4jp2cjnOl
 QVpWyP6+TIWyE9skS96i/NW6XQiEpvTMW6qGewmy61xssRnB3xIojpGfSfb1vdvKVK9o=;
Received: from mail-pg1-f178.google.com ([209.85.215.178])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1vNgIK-0006KY-Kj for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 24 Nov 2025 23:48:33 +0000
Received: by mail-pg1-f178.google.com with SMTP id
 41be03b00d2f7-bc59a785697so4218086a12.0
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Mon, 24 Nov 2025 15:48:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1764028107; x=1764632907; darn=lists.sourceforge.net;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=KD9mOy62HqGMPaOYo+qJ4jLF6S4k7Y6n0q2fK45fvpw=;
 b=Qxypl1VTG1sF7AN3aesVjFOXn4LCAoDmnjtFyvaMMp3fLA69FmitTzchmCRyxgc9Zo
 GKvPvO78L9B3iEHjeVQkVXcWXX59JcbeB5Y7OyOgdXgvdYX6KGAx9956a97AecBnS2F0
 9l2YwnNtsEMMAXZmWiUpIiHSYIgMq1gfpidqoZB1uOE/VhnjS4FJ4pW5YbJT3hzRlGlQ
 h8TaHAA+hyrMmBiTTydoNh+rtaAmH5BPQg5B99Cb2Os42GhpSlQVnLsSJuAjzvwYARhA
 t1YIjim110woebxaLdEmAozLKZ6HAkqRRsbk/82ZgdD6YTjA7LzMPQdKieNjLJqK64Ej
 44gQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1764028107; x=1764632907;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=KD9mOy62HqGMPaOYo+qJ4jLF6S4k7Y6n0q2fK45fvpw=;
 b=veE+Atev7UCAebQBRbAvnKketxhLL5747uaoT3Akx7rvkmjmky3dFLyaGnTigOAILR
 WpjhAAHRoOWSVTUV05AdM1jOXybdfncqjZvXGMna38YqMAGvN/HjOp7xAfcecU4M2tFB
 6qzK2ETDEc+17KvD5GO9V7cqKsFo8hKaAFPhFRgBQNQm2QihCJqFH+MSjx/wjlZwR5W9
 yDUqFP/v1XvAoXqUdD57Wp+cFTVwyPWlWz6RZLg8RlxEB8OGNwmwnwJyMnsrqEnjtL8T
 4DHbAncQoVBlIf8EHMYGcOwVPXhpc7brpYU4WG1C5n1lTYfMr4PSUFdALkzEMwcp/03c
 VS3g==
X-Forwarded-Encrypted: i=1;
 AJvYcCUPiazkuhyOUvZGm65DOjELavB6Q68WPht10xKM/smjSos8n2H3QQaR2KlSfHsWZ3IhZ+QtHSEzDcPY5eYLzXEI@lists.sourceforge.net
X-Gm-Message-State: AOJu0Ywd1jPzbq+dDDrOOjzcDJOFYqf1O/TRsckGd6fe4EqgnIKJPEdU
 CO9r/TaIWA7WrjxMViyrGZ52AKRN33HbRcKSNzlz5lhNDzVVM1lIAHpb
X-Gm-Gg: ASbGncsGMhywkhUUlxengEmZozEtLvQGJYrIPQ/aWeIqgGEJx/lXPJHrQ0NC81MR/H9
 kb8uOoWMJvMqLNKoLZOOAcTpXqGhaAu1llT1dexBS/DzCd0hXQ0Z+QvXDll0hfoqixNGj3pM4Tu
 8RpO3WVAbXQGzhvpgYs2TWRl2DWgR3VUpzF2+8OnbGzbCJfATca4Xlp2nO8/hshdftY5uJvgy/g
 7IOThV1oTzznIw7z5H5N+3a2oe3N4h65P8rvPVqcAkNcDCWuMT+SPfPrvWQRHU/4YVfVoAUph4s
 KpMKUYbP17Amz+Roq7mCb7XlY6LQNK9KqgQJ6B2Z8anoYPFbRqgUB8I/tzhtigKXyLBQthxie+R
 sVNvprrSIyBATJI+uYbDIOOMxHmEGxPPtftPoqvj3wddBeR82c6mbVq8m2da61+nC3T9cP5R6Qu
 dOgem22y6t3OVDEIcuCqIl7AqLs/dnGVSHhHCMcH73+E3dZbM=
X-Google-Smtp-Source: AGHT+IGqGWPp3dbaz9P/oMvxkH8tM768OBnx1ym9H6OndIwxHy5XjYnjyPQDBtMIVrKtoM7S3ehYMw==
X-Received: by 2002:a05:693c:810c:b0:2a4:3593:9697 with SMTP id
 5a478bee46e88-2a719279965mr8848102eec.20.1764028106837; 
 Mon, 24 Nov 2025 15:48:26 -0800 (PST)
Received: from localhost (ip70-175-132-216.oc.oc.cox.net. [70.175.132.216])
 by smtp.gmail.com with ESMTPSA id
 5a478bee46e88-2a6fc5b122dsm56253333eec.5.2025.11.24.15.48.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 24 Nov 2025 15:48:26 -0800 (PST)
From: Chaitanya Kulkarni <ckulkarnilinux@gmail.com>
To: axboe@kernel.dk, agk@redhat.com, snitzer@kernel.org, mpatocka@redhat.com,
 song@kernel.org, yukuai@fnnas.com, hch@lst.de, sagi@grimberg.me,
 kch@nvidia.com, jaegeuk@kernel.org, chao@kernel.org, cem@kernel.org
Date: Mon, 24 Nov 2025 15:48:04 -0800
Message-Id: <20251124234806.75216-5-ckulkarnilinux@gmail.com>
X-Mailer: git-send-email 2.40.0
In-Reply-To: <20251124234806.75216-1-ckulkarnilinux@gmail.com>
References: <20251124234806.75216-1-ckulkarnilinux@gmail.com>
MIME-Version: 1.0
X-Spam-Score: 0.8 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-1.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  __blkdev_issue_discard() always returns 0, making the error
 checking in nvmet_bdev_discard_range() dead code. Kill the function
 nvmet_bdev_discard_range()
 and call __blkdev_issue_discard() directly from nvmet_bdev_execute_discard(), 
 since no error handling is needed anymore for __blkdev_issue_discard() call.
 Content analysis details:   (0.8 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 1.0 RCVD_IN_UCE2           RBL: IP Subnet Listed in UCEPROTECT Level 2
 [70.175.132.216 listed in dnsbl-2.uceprotect.net]
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.0 FREEMAIL_FROM Sender email is commonly abused enduser mail provider
 [ckulkarnilinux(at)gmail.com]
 0.0 RCVD_IN_MSPIKE_H3      RBL: Good reputation (+3)
 [209.85.215.178 listed in wl.mailspike.net]
 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
X-Headers-End: 1vNgIK-0006KY-Kj
Subject: [f2fs-dev] [PATCH V3 4/6] nvmet: ignore discard return value
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
Cc: dm-devel@lists.linux.dev, linux-raid@vger.kernel.org,
 "Martin K . Petersen" <martin.petersen@oracle.com>,
 Johannes Thumshirn <johannes.thumshirn@wdc.com>, linux-kernel@vger.kernel.org,
 linux-nvme@lists.infradead.org, linux-f2fs-devel@lists.sourceforge.net,
 linux-block@vger.kernel.org, Chaitanya Kulkarni <ckulkarnilinux@gmail.com>,
 bpf@vger.kernel.org, linux-xfs@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

__blkdev_issue_discard() always returns 0, making the error checking
in nvmet_bdev_discard_range() dead code.

Kill the function nvmet_bdev_discard_range() and call
__blkdev_issue_discard() directly from nvmet_bdev_execute_discard(),
since no error handling is needed anymore for __blkdev_issue_discard()
call.

Reviewed-by: Martin K. Petersen <martin.petersen@oracle.com>
Reviewed-by: Johannes Thumshirn <johannes.thumshirn@wdc.com>
Reviewed-by: Christoph Hellwig <hch@lst.de>
Signed-off-by: Chaitanya Kulkarni <ckulkarnilinux@gmail.com>
---
 drivers/nvme/target/io-cmd-bdev.c | 28 +++++++---------------------
 1 file changed, 7 insertions(+), 21 deletions(-)

diff --git a/drivers/nvme/target/io-cmd-bdev.c b/drivers/nvme/target/io-cmd-bdev.c
index 8d246b8ca604..ca7731048940 100644
--- a/drivers/nvme/target/io-cmd-bdev.c
+++ b/drivers/nvme/target/io-cmd-bdev.c
@@ -362,29 +362,14 @@ u16 nvmet_bdev_flush(struct nvmet_req *req)
 	return 0;
 }
 
-static u16 nvmet_bdev_discard_range(struct nvmet_req *req,
-		struct nvme_dsm_range *range, struct bio **bio)
-{
-	struct nvmet_ns *ns = req->ns;
-	int ret;
-
-	ret = __blkdev_issue_discard(ns->bdev,
-			nvmet_lba_to_sect(ns, range->slba),
-			le32_to_cpu(range->nlb) << (ns->blksize_shift - 9),
-			GFP_KERNEL, bio);
-	if (ret && ret != -EOPNOTSUPP) {
-		req->error_slba = le64_to_cpu(range->slba);
-		return errno_to_nvme_status(req, ret);
-	}
-	return NVME_SC_SUCCESS;
-}
-
 static void nvmet_bdev_execute_discard(struct nvmet_req *req)
 {
+	struct nvmet_ns *ns = req->ns;
 	struct nvme_dsm_range range;
 	struct bio *bio = NULL;
+	sector_t nr_sects;
 	int i;
-	u16 status;
+	u16 status = NVME_SC_SUCCESS;
 
 	for (i = 0; i <= le32_to_cpu(req->cmd->dsm.nr); i++) {
 		status = nvmet_copy_from_sgl(req, i * sizeof(range), &range,
@@ -392,9 +377,10 @@ static void nvmet_bdev_execute_discard(struct nvmet_req *req)
 		if (status)
 			break;
 
-		status = nvmet_bdev_discard_range(req, &range, &bio);
-		if (status)
-			break;
+		nr_sects = le32_to_cpu(range.nlb) << (ns->blksize_shift - 9);
+		__blkdev_issue_discard(ns->bdev,
+				nvmet_lba_to_sect(ns, range.slba), nr_sects,
+				GFP_KERNEL, &bio);
 	}
 
 	if (bio) {
-- 
2.40.0



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
