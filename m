Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B112C7ED5E
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 24 Nov 2025 03:58:05 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Subject:MIME-Version:References:In-Reply-To:Message-Id:Date:To:From:Sender:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=V8eDCniYE5onT6td3XvJWQMb9XJvtmJFFvHoYNN0qw4=; b=JYAuoT7jEynxbIwdj4hgVahtgM
	AcsbNfrf99ojuJ3uc7e4P1GsJklkp+nbPSxgGlkbnxZQSjGbPBgCqKg5HU+Bg3ysXhfXEpGkYbPIh
	P5q+IE8RJ1t/47zqVnZQj+njleYBQx00emsuloORY6sYoO/ql+JKTvHeoXPTc8DgpU70=;
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1vNMm6-0002pA-KE;
	Mon, 24 Nov 2025 02:57:58 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <ckulkarnilinux@gmail.com>) id 1vNMm5-0002p3-LQ
 for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 24 Nov 2025 02:57:57 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=4v5MRSjdziMsNVvfMkn8flY57vC+Pu/WImeTNAJo+ww=; b=NoEXOtUSOsu30LLSoH+XGqOEse
 MEdOfolTlGBe3IzqVKma2YC5Pdvt+gJdeN8viYodOaHbsoHZzXnIBGSSuxo7Ixm1OC+Huz9clDbY2
 NWyGJJpuO09eerGrSqs7J6aC7mK950Qcw1gePCBAiQvDentDr2yKcf5akh2nMrlUbcVo=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=4v5MRSjdziMsNVvfMkn8flY57vC+Pu/WImeTNAJo+ww=; b=lsM0ZmgEk4/wdI4MOPIJJw6HZQ
 QWBU+/ek78rxmBcQRUwct24np2FiLCEyzDx8v+bbs7WcGI/ecq3CRRFOnKpmWW8sWAFPdWComdhz8
 r+Ib0cLyJMpcs0pr4ovMwWy98NZ3mc1GJKRMSgzPAZWWh9488O1JPjgIzG+184CIhf74=;
Received: from mail-pg1-f177.google.com ([209.85.215.177])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1vNMm4-0002fI-R7 for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 24 Nov 2025 02:57:57 +0000
Received: by mail-pg1-f177.google.com with SMTP id
 41be03b00d2f7-bc0e89640b9so2439557a12.1
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Sun, 23 Nov 2025 18:57:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1763953066; x=1764557866; darn=lists.sourceforge.net;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=4v5MRSjdziMsNVvfMkn8flY57vC+Pu/WImeTNAJo+ww=;
 b=lvMYJqzZOCIbgrayzjjqXjSwsNgnqRbSBvOzDcuVg9ZF5YtkHcjBlfLz1eoKc9CrNJ
 9DWuJByJe8lXIZw9XFLqpSK/BAmiCxoCI3FfBBoUBvCbPuIFM25A5m/0z74t7pDVGIk4
 tZFLOh4mNA9fWQHdH8MVRVTsGMLQRKDmfd8N97xcufgr+uuCOJeGkZATgyjts8pU1l0l
 1ouNcDUpWshTUhAMiGtAj0LMgBAaOC3SgmSVORhoY5lD/Lmd6BFs0SVv3J+7kcJSi5R2
 tKtCdQqgawxW5q6zrU6TkJjkmMwR2Xt7u/rPwKPOdb0fIyqELF8Pvx1knwMWFpXz+D6S
 VDWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1763953066; x=1764557866;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=4v5MRSjdziMsNVvfMkn8flY57vC+Pu/WImeTNAJo+ww=;
 b=we1b8h25x4iqfa6DA0lKMS2Fpw4sDduSBZecFmyG6faDrf9u6OU2ztidvjEHbe7H63
 d/JiBUfjkzRupm9z6qoHPPbAQNs/VPFEjFsjB11KKrVGYlOTO7y6Sfg9EFuE7rmOoxMC
 opmJqSollhm928P/2H/JG88Y5rRtcfhQ+ChJiTvT+d9RH6L0UXwScF0UMpbrk9UUzbyz
 1aO5aDVzAxtp1oVZiNh4sRrcxO9EFqLFTA8MZIC88PAhrS+e/SS7bKO4lmlpaSpVnn4m
 mcUenYt+o7Rt2OQezJmuLY01jq2nfxxp6DMNLPMd80F94P2DRShMl1zw+TRyQUPW+zHf
 7RpA==
X-Forwarded-Encrypted: i=1;
 AJvYcCVcHDT8C6xwqLXMpi2GUBC768pph5U4IH9HwpnzTp0iKr3A6M3nUj5Sdo4/iHgfDHEt2+Ke/VNn1qMCimLrzYMJ@lists.sourceforge.net
X-Gm-Message-State: AOJu0YwgS+3aY/BMXVxOJc9CjGW1zgOqWpQ02mLwNXPfvLyHiFR4IqG9
 iiXI75g2EO3mUVYo+WI/Bmh2s39QK2sh47ixHnJgyQ74GVigRSvizds3
X-Gm-Gg: ASbGncsgmMf2vsDhoVtRMeO8G11ZXhsZH/ni1TOGUlrHyA/wdyUGTmm4giTda/riwsK
 EJX2HA8SvvmcKHG0rqzTKrBoL0aqCRPJy3vftxm06lHu8Kb1HBm85TOzwJj9kT/muADe38V4Zsx
 UTy4Th7dqCLIOytKMsVHrSKV8L9aRVES7TBWUVY4ui3l/JvHHbSdEvy+ZvNA+3V+QbF99x3tPs2
 9Vvbfj+H5nTUJb3Pp2WDU2A64jq02AJ37UyaNbkiaRhzkaSUNAbKbv6IzZQ3B44Oe6qaeNLHc1z
 jvz3N4gb9BCPcc0Fd5Jl4sqCANUsV3M4KuAKdQc6RuanZnmdFMdmmaFkDZGJPaELIsvHw9gzJVc
 WJk1XdipNvY1jjpp0DhG6qhUHNgD/p94oEYBv+tMFvo6TPSRQCmajQ30b0pi4bzKkxXMG6m6iLP
 iQWKM++S50vJtjRwKAB+Rwy6W0QmslzS331/D9v8TbmhnVQOI=
X-Google-Smtp-Source: AGHT+IE2F0nLiNeIHq2g4zMVJnIfiBv34S3msVGeqkx0u3CUtdU5YuLkC01czcghjZ+E6ydM6GCvrQ==
X-Received: by 2002:a05:7022:6391:b0:11b:79f1:847 with SMTP id
 a92af1059eb24-11c9d712bd4mr5835461c88.12.1763953065943; 
 Sun, 23 Nov 2025 18:57:45 -0800 (PST)
Received: from localhost (ip70-175-132-216.oc.oc.cox.net. [70.175.132.216])
 by smtp.gmail.com with ESMTPSA id
 a92af1059eb24-11c93de6d5csm43367228c88.4.2025.11.23.18.57.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 23 Nov 2025 18:57:45 -0800 (PST)
From: Chaitanya Kulkarni <ckulkarnilinux@gmail.com>
To: axboe@kernel.dk, agk@redhat.com, snitzer@kernel.org, mpatocka@redhat.com,
 song@kernel.org, yukuai@fnnas.com, hch@lst.de, sagi@grimberg.me,
 kch@nvidia.com, jaegeuk@kernel.org, chao@kernel.org, cem@kernel.org
Date: Sun, 23 Nov 2025 18:57:34 -0800
Message-Id: <20251124025737.203571-3-ckulkarnilinux@gmail.com>
X-Mailer: git-send-email 2.40.0
In-Reply-To: <20251124025737.203571-1-ckulkarnilinux@gmail.com>
References: <20251124025737.203571-1-ckulkarnilinux@gmail.com>
MIME-Version: 1.0
X-Spam-Score: 0.8 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-1.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  __blkdev_issue_discard() always returns 0, making all error
 checking at call sites dead code. For dm-thin change issue_discard() return
 type to void,
 in passdown_double_checking_shared_status() remove the r assignment
 from return value of the issue_discard(), for end_discard() hardcod value
 of [...] Content analysis details:   (0.8 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 1.0 RCVD_IN_UCE2           RBL: IP Subnet Listed in UCEPROTECT Level 2
 [70.175.132.216 listed in dnsbl-2.uceprotect.net]
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain -0.0 RCVD_IN_MSPIKE_H3      RBL: Good reputation (+3)
 [209.85.215.177 listed in wl.mailspike.net]
 0.0 FREEMAIL_FROM Sender email is commonly abused enduser mail provider
 [ckulkarnilinux(at)gmail.com]
 -0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
X-Headers-End: 1vNMm4-0002fI-R7
Subject: [f2fs-dev] [PATCH V2 2/5] dm: ignore discard return value
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
 linux-kernel@vger.kernel.org, linux-nvme@lists.infradead.org,
 linux-f2fs-devel@lists.sourceforge.net, linux-block@vger.kernel.org,
 Chaitanya Kulkarni <ckulkarnilinux@gmail.com>, bpf@vger.kernel.org,
 linux-xfs@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

__blkdev_issue_discard() always returns 0, making all error checking
at call sites dead code.

For dm-thin change issue_discard() return type to void, in
passdown_double_checking_shared_status() remove the r assignment from
return value of the issue_discard(), for end_discard() hardcod value
of r to 0 that matches only value returned from
__blkdev_issue_discard().

md part is simplified to only check !discard_bio by ignoring the
__blkdev_issue_discard() value.

Signed-off-by: Chaitanya Kulkarni <ckulkarnilinux@gmail.com>
---
 drivers/md/dm-thin.c | 12 +++++-------
 drivers/md/md.c      |  4 ++--
 2 files changed, 7 insertions(+), 9 deletions(-)

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
index 7b5c5967568f..aeb62df39828 100644
--- a/drivers/md/md.c
+++ b/drivers/md/md.c
@@ -9132,8 +9132,8 @@ void md_submit_discard_bio(struct mddev *mddev, struct md_rdev *rdev,
 {
 	struct bio *discard_bio = NULL;
 
-	if (__blkdev_issue_discard(rdev->bdev, start, size, GFP_NOIO,
-			&discard_bio) || !discard_bio)
+	__blkdev_issue_discard(rdev->bdev, start, size, GFP_NOIO, &discard_bio);
+	if (!discard_bio)
 		return;
 
 	bio_chain(discard_bio, bio);
-- 
2.40.0



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
