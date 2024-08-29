Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id E6E9396525F
	for <lists+linux-f2fs-devel@lfdr.de>; Thu, 29 Aug 2024 23:53:06 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1sjn4g-0004cO-LD;
	Thu, 29 Aug 2024 21:53:03 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <daeho43@gmail.com>) id 1sjn4e-0004by-Qo
 for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 29 Aug 2024 21:53:01 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=69BLrci8h2uTitvESztrQSBwSpGSo97sp/z053MaEPc=; b=OkFP71EbONPnQmPUC+qSqg9C5I
 64tImLzfs9wA+gsxpRu0hH+KlDFD2Qstn1q7Pu2qSuLTcUbNlOz0dUpzDA3w2UK/E3OEJnRdUOofF
 M29j53oaJfqUecgKduK8gXbOHwKh/1L3qLu6cd9UlVVfGViai/EovnZeXkCx9b4AouS8=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=69BLrci8h2uTitvESztrQSBwSpGSo97sp/z053MaEPc=; b=eFlXFwz5zn7RIqIgMVMAPCRudS
 1qsi62iDxrRNOmwYS/e/1w/t0Euizya1ptaKXd9+PrPCiS3xne1mHn1fhfm6JGXgZxN/vEjCs27aV
 XmSFZqHJyOboyqV+xMYyAPwFnK4MLe8vimqGyQXkjneXbgpFA+Q9UUWg4wCSfrVQd2Xw=;
Received: from mail-ot1-f54.google.com ([209.85.210.54])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1sjn4e-0007bT-Rp for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 29 Aug 2024 21:53:01 +0000
Received: by mail-ot1-f54.google.com with SMTP id
 46e09a7af769-70f660d2250so274875a34.2
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Thu, 29 Aug 2024 14:53:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1724968370; x=1725573170; darn=lists.sourceforge.net;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=69BLrci8h2uTitvESztrQSBwSpGSo97sp/z053MaEPc=;
 b=IF8OYEL5NP8cHqROLZuGRhiTIcb2PcCFha/tp7bw7YCssaManvdQNLOLY6Z0eFmGKF
 q2sjHP0dytJZreaAxuvnlcnJ5JhdBQ3wJiSNN3/PnoCK0eioCoA9Aw6/jnRYsEF9IHnz
 Mr5t2rNPAi69gMFyntZ5lexG6Zu2FoxfVZp6YOe2ueL1boD/Zr7SXKtP5bzMDa/7LrES
 9F42/uetPU55DBid2BRdYlxgxFSYDMgYLX4etVhn99qmKaNTwLgsICqxBMfxCafedRKF
 LGBHO95CqktlmChXju1Neya9A67/S359p+ku8biRdqvuwQMZp2xhrv4Nk8ij8+JNQRlX
 xuyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1724968370; x=1725573170;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=69BLrci8h2uTitvESztrQSBwSpGSo97sp/z053MaEPc=;
 b=npuC57jkdQgUnLWTiaTFk6VRFYLvCNtXe8YhjU97l7IgSLXXwSiTtAg+rhDd9MaGiP
 BlV8mj+ZmvOalUePa0IxIIZYKkjn4Egh4+qKY5rzU+TlmF1JAUp4hAJO2cNHxNMvEOJo
 f+gHVFtUeZ7cTPYwjNnLtbOGo3wFc6M8yFyuQpt4+6gjXNqPB88V5zb+Lh/02i343evS
 FZ1RCi28CaQqVPmUA/WrPdHgLPA1tSprUx4TAd8SfLGFpIoxj7T3GsW9JIGKJ1SUCVKh
 VspejdRMvvJQfNYhd4rZtEAh3VcMIq0Dc2+xVQEq7SrNiLbhzyxAdV8wsSXnh89Z0iGl
 Qp9Q==
X-Forwarded-Encrypted: i=1;
 AJvYcCWSDxpOs27MshgsaTq3xZT9WL6OtcHEeOMsOsYc7WbpEZ98JPiVG0jXCk/R+Ib84HxxrbvUAvkh62a62oBpc6H/@lists.sourceforge.net
X-Gm-Message-State: AOJu0YxInjMgRBCC96/u6d8uR31scSMhUsW4IPlHzSK76u5eeFQmGYa6
 BlSLKCwkYEVT5oDMNRV43HcSBXb5HKV0QEGxqk8MiskSFZ6t6BKh
X-Google-Smtp-Source: AGHT+IH2rAoCzKieGURg0hEYXUEFMYscZLTq0dHlouR7C/XTDPs+NEDDfKhc1cHTJv8eT6BXCLxtxA==
X-Received: by 2002:a05:6358:910d:b0:1b1:ac7f:51d5 with SMTP id
 e5c5f4694b2df-1b603cb548dmr515038355d.22.1724968370066; 
 Thu, 29 Aug 2024 14:52:50 -0700 (PDT)
Received: from daehojeong-desktop.mtv.corp.google.com
 ([2a00:79e0:2e14:7:a1e7:73eb:e77e:3e2b])
 by smtp.gmail.com with ESMTPSA id
 41be03b00d2f7-7d22e9d512asm1705653a12.78.2024.08.29.14.52.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 29 Aug 2024 14:52:49 -0700 (PDT)
From: Daeho Jeong <daeho43@gmail.com>
To: linux-kernel@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net,
 kernel-team@android.com
Date: Thu, 29 Aug 2024 14:52:37 -0700
Message-ID: <20240829215242.3641502-2-daeho43@gmail.com>
X-Mailer: git-send-email 2.46.0.469.g59c65b2a67-goog
In-Reply-To: <20240829215242.3641502-1-daeho43@gmail.com>
References: <20240829215242.3641502-1-daeho43@gmail.com>
MIME-Version: 1.0
X-Spam-Score: 0.0 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: From: Daeho Jeong Now we do readahead for a full section by
 not considering migration_granularity and it triggers unnecessary read. So,
 make it read with the correct amount. Signed-off-by: Daeho Jeong ---
 fs/f2fs/gc.c
 | 33 ++++++++++++++++++++ 1 file changed, 20 insertions(+), 13 deletions(-)
 Content analysis details:   (0.0 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 RCVD_IN_VALIDITY_CERTIFIED_BLOCKED RBL: ADMINISTRATOR NOTICE:
 The query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [209.85.210.54 listed in sa-accredit.habeas.com]
 0.0 RCVD_IN_VALIDITY_RPBL_BLOCKED RBL: ADMINISTRATOR NOTICE: The
 query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [209.85.210.54 listed in bl.score.senderscore.com]
 0.2 FREEMAIL_ENVFROM_END_DIGIT Envelope-from freemail username ends
 in digit [daeho43[at]gmail.com]
 0.0 FREEMAIL_FROM          Sender email is commonly abused enduser mail
 provider [daeho43[at]gmail.com]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 RCVD_IN_MSPIKE_H3      RBL: Good reputation (+3)
 [209.85.210.54 listed in wl.mailspike.net]
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.0 T_SCC_BODY_TEXT_LINE   No description available.
 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
X-Headers-End: 1sjn4e-0007bT-Rp
Subject: [f2fs-dev] [PATCH 2/7] f2fs: read summary blocks with the correct
 amount for migration_granularity
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
Cc: Daeho Jeong <daehojeong@google.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

From: Daeho Jeong <daehojeong@google.com>

Now we do readahead for a full section by not considering
migration_granularity and it triggers unnecessary read. So, make it read
with the correct amount.

Signed-off-by: Daeho Jeong <daehojeong@google.com>
---
 fs/f2fs/gc.c | 33 ++++++++++++++++++++-------------
 1 file changed, 20 insertions(+), 13 deletions(-)

diff --git a/fs/f2fs/gc.c b/fs/f2fs/gc.c
index 46e3bc26b78a..b5d3fd40b17a 100644
--- a/fs/f2fs/gc.c
+++ b/fs/f2fs/gc.c
@@ -1708,24 +1708,33 @@ static int do_garbage_collect(struct f2fs_sb_info *sbi,
 	struct blk_plug plug;
 	unsigned int segno = start_segno;
 	unsigned int end_segno = start_segno + SEGS_PER_SEC(sbi);
+	unsigned int sec_end_segno;
 	int seg_freed = 0, migrated = 0;
 	unsigned char type = IS_DATASEG(get_seg_entry(sbi, segno)->type) ?
 						SUM_TYPE_DATA : SUM_TYPE_NODE;
 	unsigned char data_type = (type == SUM_TYPE_DATA) ? DATA : NODE;
 	int submitted = 0;
 
-	if (__is_large_section(sbi))
-		end_segno = rounddown(end_segno, SEGS_PER_SEC(sbi));
+	if (__is_large_section(sbi)) {
+		sec_end_segno = rounddown(end_segno, SEGS_PER_SEC(sbi));
 
-	/*
-	 * zone-capacity can be less than zone-size in zoned devices,
-	 * resulting in less than expected usable segments in the zone,
-	 * calculate the end segno in the zone which can be garbage collected
-	 */
-	if (f2fs_sb_has_blkzoned(sbi))
-		end_segno -= SEGS_PER_SEC(sbi) -
+		/*
+		 * zone-capacity can be less than zone-size in zoned devices,
+		 * resulting in less than expected usable segments in the zone,
+		 * calculate the end segno in the zone which can be garbage
+		 * collected
+		 */
+		if (f2fs_sb_has_blkzoned(sbi))
+			sec_end_segno -= SEGS_PER_SEC(sbi) -
 					f2fs_usable_segs_in_sec(sbi, segno);
 
+		if (gc_type == BG_GC)
+			end_segno = start_segno + sbi->migration_granularity;
+
+		if (end_segno > sec_end_segno)
+			end_segno = sec_end_segno;
+	}
+
 	sanity_check_seg_type(sbi, get_seg_entry(sbi, segno)->type);
 
 	/* readahead multi ssa blocks those have contiguous address */
@@ -1762,9 +1771,6 @@ static int do_garbage_collect(struct f2fs_sb_info *sbi,
 
 		if (get_valid_blocks(sbi, segno, false) == 0)
 			goto freed;
-		if (gc_type == BG_GC && __is_large_section(sbi) &&
-				migrated >= sbi->migration_granularity)
-			goto skip;
 		if (!PageUptodate(sum_page) || unlikely(f2fs_cp_error(sbi)))
 			goto skip;
 
@@ -1803,7 +1809,8 @@ static int do_garbage_collect(struct f2fs_sb_info *sbi,
 
 		if (__is_large_section(sbi))
 			sbi->next_victim_seg[gc_type] =
-				(segno + 1 < end_segno) ? segno + 1 : NULL_SEGNO;
+				(segno + 1 < sec_end_segno) ?
+					segno + 1 : NULL_SEGNO;
 skip:
 		f2fs_put_page(sum_page, 0);
 	}
-- 
2.46.0.469.g59c65b2a67-goog



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
