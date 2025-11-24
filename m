Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A829C82DB4
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 25 Nov 2025 00:48:37 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Subject:MIME-Version:References:In-Reply-To:Message-Id:Date:To:From:Sender:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=XydaUVvoNO7FgeC5fvmqKjiUnALNNb2wtrYIrYG/Tro=; b=BnKG4x2w6yQuVDmDfknkKktz2q
	UojV8nEtBZPmJMYs6KLcDNRqtmFhcggTj3xh4uWXlQEYR/30+K8HshKDs3Pon5h9mUw6FlcVldAZD
	1+Twx8LsZ5GS7AmoKiFEDHYbfKOJYOcSugWzyoqh6BBFXUsdeh9RIVolSVEIlyESNPZU=;
Received: from [127.0.0.1] (helo=sfs-ml-3.v29.lw.sourceforge.com)
	by sfs-ml-3.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1vNgIL-0007uT-Nn;
	Mon, 24 Nov 2025 23:48:33 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-3.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <ckulkarnilinux@gmail.com>) id 1vNgIJ-0007uL-NW
 for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 24 Nov 2025 23:48:31 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=x5IpKKGvYwA44MA2SdIRqzoysh0eqDWrauHh/IuigN8=; b=TuP8PzI6s3cXMClWJ4OdP8sVcs
 oH2KyMiaDLzj+OIIW1MHstKSKrb2JZjNdvX5DUdOYe/co93jd7O/oav11FRVNZFh36Df8hSlIBDU+
 kf8RGGhRM6lrYgjKeikr7fikm7xzGF/b7dIV79LzgXNDgHh5cT5l9UQ6RGOQtD+zMZ8E=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=x5IpKKGvYwA44MA2SdIRqzoysh0eqDWrauHh/IuigN8=; b=hTSL3LwusQHpxNwY3nV2IQntSc
 LY1RAi8TAhKIUMYmFan+KgbYJz81udb7YqGvJuHxvhQF/3hmD1L1XFHrmKxeoO/+fdFKY8eIVNBbh
 vBUrwIBkjTvY6DOWcbapuC72IIXcqlzOwvRmPu/A5WxbHMUuCqQj6g+tUljXBbGSjGIs=;
Received: from mail-pl1-f169.google.com ([209.85.214.169])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1vNgIJ-0006KS-6V for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 24 Nov 2025 23:48:31 +0000
Received: by mail-pl1-f169.google.com with SMTP id
 d9443c01a7336-298039e00c2so68051175ad.3
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Mon, 24 Nov 2025 15:48:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1764028105; x=1764632905; darn=lists.sourceforge.net;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=x5IpKKGvYwA44MA2SdIRqzoysh0eqDWrauHh/IuigN8=;
 b=RMRTL299+IqUzOde3Qu+flKtzz0YfOoqoG8i3/g76i18Vz/vq7jTlHeI4fqk4B3JT1
 7z+QUNnXL5jeAS0CxO8KvSVtLdes0f7l8AgBsIz2+ehWOejnDGAk79Y+sOw7wSiKHlOg
 2o6W/J5T1O4+/GpzY9NDa/iSfEsh1ScOKacab3F06aZDR8wEXunJu6OrC8CmI8rJx8UK
 16NetPlAYp08JCsFJ0U7/9DibE00BhhvnGsk7EqV0wUWGhLBAxH3mTDn+57zTTi3zQfQ
 TtObSE6pitL9347nLcOBaeKoSdVSNbaDJpZJf2/vSAafnIEmrw+vkwDwGUDJ8Q1vqqAE
 S0QA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1764028105; x=1764632905;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=x5IpKKGvYwA44MA2SdIRqzoysh0eqDWrauHh/IuigN8=;
 b=rwQ100WTYXOLAGtAFq3GEPXVOG86ncEUO0GAzmT5HC7hrG2eW26ckelcVMrCW8OtBi
 zWUhD+2sNJPkkPMOE+zLuJHWcgA+8XwRBSFCoVcUzxbUiHJ4LQ18IRMmq7XZQbIB8gph
 lCsDxnnPNKgKsCaFhGaN55QcMgyTZyBZwu0lQIfvcjndfpXa9YY5SvDK96yUPOHUYxTR
 64EqxgMMq4fZ8WLtkZOodwIAEEWVT1vkbORvUwUpHPEhrTepRoHflQR1GYDwkyqgdtHo
 BXGlzgxvoqHzEx3Q5PRI1sOlX2glleZC0JXXjCoNmS8qv5NJIuOOSg+CXCzl2FyW0KBv
 0BsA==
X-Forwarded-Encrypted: i=1;
 AJvYcCVbdKbJ6ZzqAUUdytN2WKkJ3L4nqyzIc9vOrCZ/1U1bAMAISs2wpK4qW/21TqLQdOZ/8ZRUxyVA/ccsdip+CJA1@lists.sourceforge.net
X-Gm-Message-State: AOJu0Yw5KmZXBcrPmKRuQVZG8Tg6IuEwpXH6MLrIHpKJR8d7FvC8dN/Y
 OfZpKCf+g04/odRsKCFVAP0726FRTC9XpYOw77M90FfLH/TbM3APYkQr
X-Gm-Gg: ASbGncso5RA8YgHvfHmrgnIKTcdhj0YH8+FQg2H1Sb7BkHPmIvb4dOheJr8vl7i/eiB
 HSQAd8hKHLdWeRLSTGMohVoajfrr5KRk8ZQP0Pl0mI5ifr7Fm9GZY9MvIRhWMPs4B1elfYLG+Tu
 QRc1KzXrScFXk3/QKrhKv9mxjdwSVG87Izc+d2P4gK7aXjUcS1mq62DwRrfeYkiWUbdBf/hlcea
 w4Xwq9DYuazY1qV20O9g9/OQp2dL+sxEPxm7UoAitqf3NTS0zFu1/A75Vd1Y0WieSwJLeBto4GJ
 mZKxtsYVNwbYOiZUIlGgDoKfSkTRmJeyBdTFpMAdIGcsYEK5gdHpf+K+ezTfApSMCtpOb47fyYg
 KSRF/y6e+xUXaeZfrUcc0bphePcWSj4VHGDQi6VI2TUXD/OIRhX+1VGeqAxY248AAlYJFYlytj6
 TkIZEarNWApjDCOao+LjzWWxvEkd78TtjbXfHhjajBxy0gDK7yBWE+CyDEww==
X-Google-Smtp-Source: AGHT+IGUjnYuQU4uZ65RexnKMVsIkRo4SljblPDkF73f7cjoVp9uAJMvqcbsbNcZ8FiTC+XwEcc2Xg==
X-Received: by 2002:a05:7022:6610:b0:11b:9386:a37b with SMTP id
 a92af1059eb24-11c9d870ef7mr10566206c88.42.1764028105314; 
 Mon, 24 Nov 2025 15:48:25 -0800 (PST)
Received: from localhost (ip70-175-132-216.oc.oc.cox.net. [70.175.132.216])
 by smtp.gmail.com with ESMTPSA id
 a92af1059eb24-11c93de6d5csm50934572c88.4.2025.11.24.15.48.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 24 Nov 2025 15:48:25 -0800 (PST)
From: Chaitanya Kulkarni <ckulkarnilinux@gmail.com>
To: axboe@kernel.dk, agk@redhat.com, snitzer@kernel.org, mpatocka@redhat.com,
 song@kernel.org, yukuai@fnnas.com, hch@lst.de, sagi@grimberg.me,
 kch@nvidia.com, jaegeuk@kernel.org, chao@kernel.org, cem@kernel.org
Date: Mon, 24 Nov 2025 15:48:03 -0800
Message-Id: <20251124234806.75216-4-ckulkarnilinux@gmail.com>
X-Mailer: git-send-email 2.40.0
In-Reply-To: <20251124234806.75216-1-ckulkarnilinux@gmail.com>
References: <20251124234806.75216-1-ckulkarnilinux@gmail.com>
MIME-Version: 1.0
X-Spam-Score: 0.8 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-2.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  __blkdev_issue_discard() always returns 0, making all error
 checking at call sites dead code. For dm-thin change issue_discard() return
 type to void,
 in passdown_double_checking_shared_status() remove the r assignment
 from return value of the issue_discard(), for end_discard() hardcode value
 o [...] Content analysis details:   (0.8 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 1.0 RCVD_IN_UCE2           RBL: IP Subnet Listed in UCEPROTECT Level 2
 [70.175.132.216 listed in dnsbl-2.uceprotect.net]
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 0.0 FREEMAIL_FROM Sender email is commonly abused enduser mail provider
 [ckulkarnilinux(at)gmail.com]
 0.0 RCVD_IN_MSPIKE_H3      RBL: Good reputation (+3)
 [209.85.214.169 listed in wl.mailspike.net]
 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
X-Headers-End: 1vNgIJ-0006KS-6V
Subject: [f2fs-dev] [PATCH V3 3/6] dm: ignore discard return value
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

__blkdev_issue_discard() always returns 0, making all error checking
at call sites dead code.

For dm-thin change issue_discard() return type to void, in
passdown_double_checking_shared_status() remove the r assignment from
return value of the issue_discard(), for end_discard() hardcode value of 
r to 0 that matches only value returned from __blkdev_issue_discard().

Reviewed-by: Martin K. Petersen <martin.petersen@oracle.com>
Reviewed-by: Johannes Thumshirn <johannes.thumshirn@wdc.com>
Reviewed-by: Christoph Hellwig <hch@lst.de>
Signed-off-by: Chaitanya Kulkarni <ckulkarnilinux@gmail.com>
---
 drivers/md/dm-thin.c | 12 +++++-------
 1 file changed, 5 insertions(+), 7 deletions(-)

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
 
-- 
2.40.0



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
