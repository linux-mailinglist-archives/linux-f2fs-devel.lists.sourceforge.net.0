Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id BEFFB54BE3D
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 15 Jun 2022 01:18:05 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.94.2)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1o1FnQ-0006Op-2l; Tue, 14 Jun 2022 23:18:02 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <bart.vanassche@gmail.com>) id 1o1FnO-0006OY-Kd
 for linux-f2fs-devel@lists.sourceforge.net; Tue, 14 Jun 2022 23:18:01 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=BBhpbn+GR/GrpRDQUAhF4AUlQSYSCJQrTUctP3edPfA=; b=ECPodDlsgMtG2f34odVKOzATou
 ezRC9zVbDlxe0EV767SBkMcD7oblWOpZv3ARHEwGttoSpnDf7lScxayW0O0D7L14lr580wLWTc5XA
 F7UjsOG/EL2dX1gztUbPHMwwE4n5i+dgBR++l7jpEKC8Ic5IyjqKdfEat5A6jZOZtVHM=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=BBhpbn+GR/GrpRDQUAhF4AUlQSYSCJQrTUctP3edPfA=; b=PqkvikbyUeKYFp3m/lumKEoycp
 sJn+APM6QRtCwcVTcywgG3AqRN/hP70w5si/nGgILIQJsBV3SgCQ4cEPBDE0nFmmKRDOQWvWKAyEe
 +A+twOTHXXaLVLSkQ/mwfWN/i6xAr7N7xtLDD/fSVWaUyj91Zvbz0eheFTzcqEiLIitU=;
Received: from mail-pl1-f182.google.com ([209.85.214.182])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.94.2)
 id 1o1FnI-001rAt-0o
 for linux-f2fs-devel@lists.sourceforge.net; Tue, 14 Jun 2022 23:18:01 +0000
Received: by mail-pl1-f182.google.com with SMTP id g8so3772064plt.8
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Tue, 14 Jun 2022 16:17:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=BBhpbn+GR/GrpRDQUAhF4AUlQSYSCJQrTUctP3edPfA=;
 b=35reqTWf0ZJ3PalAvr5UvpQsc281Nx2Yaiekh5Fswx6ubGlwamlEUzAqa/tv2gsJEt
 C9QKT0GUrVsxqaHCwkcR/SVfsYWztnTMo0vS3bflkIN1OGvIk16oLNBidQV9IgS0k3vf
 Aa6/xSlKCaRiIXNYsOGTCzCRLNVVMq7IZZICPciQV7UCD9ur7E5YU1DRlxtgOcqkfpJt
 frn9rkZMSkuN380FrajRXC37d1NA7xj77yQ9jAUY4Uh0QX+gD1MZM6jlUhwKGE9yLVhs
 lWOPUiJkZ2QHmCvaCSRVFT5gaxq+9ak+zmzyCAuOwvPaxaIhZSzFtT+YuZuZiJIGbNg0
 M0zw==
X-Gm-Message-State: AJIora9qJ39BSrku6rO/b8M526JayzEgcpOzA7nkTnwC+a1HOQ9X7YDe
 LYY/I9KteCQ8RJM1ydQQ5DA=
X-Google-Smtp-Source: AGRyM1tdPElL5eAoSS4Mpcw0RKu4rkCkh77JVun4vsiW1pOp9UqVvjqIdUfBRlssTtxZhnhN2lj0pQ==
X-Received: by 2002:a17:903:2291:b0:164:95f:b512 with SMTP id
 b17-20020a170903229100b00164095fb512mr6349349plh.120.1655248670295; 
 Tue, 14 Jun 2022 16:17:50 -0700 (PDT)
Received: from bvanassche-linux.mtv.corp.google.com
 ([2620:15c:211:201:ab60:e1ea:e2eb:c1b6])
 by smtp.gmail.com with ESMTPSA id
 x2-20020a1709028ec200b001621ce92196sm7769491plo.86.2022.06.14.16.17.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 14 Jun 2022 16:17:49 -0700 (PDT)
From: Bart Van Assche <bvanassche@acm.org>
To: Jaegeuk Kim <jaegeuk@kernel.org>
Date: Tue, 14 Jun 2022 16:17:24 -0700
Message-Id: <20220614231724.776264-4-bvanassche@acm.org>
X-Mailer: git-send-email 2.36.1.476.g0c4daa206d-goog
In-Reply-To: <20220614231724.776264-1-bvanassche@acm.org>
References: <20220614231724.776264-1-bvanassche@acm.org>
MIME-Version: 1.0
X-Spam-Score: 0.5 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: Change the type of the third argument of f2fs_report_zone()
 from void * into struct blk_zone * to enable type checking. Signed-off-by:
 Bart Van Assche <bvanassche@acm.org> --- include/f2fs_fs.h | 4 +++-
 lib/libf2fs_zoned.c
 | 22 +++++++++++++--------- 2 files changed, 16 insertions(+), 10 deletions(-)
 Content analysis details:   (0.5 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 0.2 HEADER_FROM_DIFFERENT_DOMAINS From and EnvelopeFrom 2nd level
 mail domains are different
 0.0 FREEMAIL_FROM          Sender email is commonly abused enduser mail
 provider [bart.vanassche[at]gmail.com]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 RCVD_IN_MSPIKE_H3      RBL: Good reputation (+3)
 [209.85.214.182 listed in wl.mailspike.net]
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
 no trust [209.85.214.182 listed in list.dnswl.org]
 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
 0.2 FREEMAIL_FORGED_FROMDOMAIN 2nd level domains in From and
 EnvelopeFrom freemail headers are different
X-Headers-End: 1o1FnI-001rAt-0o
Subject: [f2fs-dev] [PATCH 3/3] Improve compile-time type checking for
 f2fs_report_zone()
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
Cc: Bart Van Assche <bvanassche@acm.org>,
 linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

Change the type of the third argument of f2fs_report_zone() from void *
into struct blk_zone * to enable type checking.

Signed-off-by: Bart Van Assche <bvanassche@acm.org>
---
 include/f2fs_fs.h   |  4 +++-
 lib/libf2fs_zoned.c | 22 +++++++++++++---------
 2 files changed, 16 insertions(+), 10 deletions(-)

diff --git a/include/f2fs_fs.h b/include/f2fs_fs.h
index 3b1bd6eb7dc7..2dbb56967676 100644
--- a/include/f2fs_fs.h
+++ b/include/f2fs_fs.h
@@ -1560,9 +1560,11 @@ blk_zone_cond_str(struct blk_zone *blkz)
 
 #endif
 
+struct blk_zone;
+
 extern int f2fs_get_zoned_model(int);
 extern int f2fs_get_zone_blocks(int);
-extern int f2fs_report_zone(int, uint64_t, void *);
+extern int f2fs_report_zone(int, uint64_t, struct blk_zone *);
 typedef int (report_zones_cb_t)(int i, void *, void *);
 extern int f2fs_report_zones(int, report_zones_cb_t *, void *);
 extern int f2fs_check_zones(int);
diff --git a/lib/libf2fs_zoned.c b/lib/libf2fs_zoned.c
index d8de66b82029..f0df15220d56 100644
--- a/lib/libf2fs_zoned.c
+++ b/lib/libf2fs_zoned.c
@@ -200,21 +200,24 @@ int f2fs_get_zone_blocks(int i)
 	return 0;
 }
 
-int f2fs_report_zone(int i, uint64_t sector, void *blkzone)
+int f2fs_report_zone(int i, uint64_t sector, struct blk_zone *blkzone)
 {
-	struct blk_zone *blkz = (struct blk_zone *)blkzone;
-	struct blk_zone_report *rep;
+	struct one_zone_report {
+		struct blk_zone_report	rep;
+		struct blk_zone		zone;
+	} *rep;
 	int ret = -1;
 
-	rep = calloc(1, sizeof(struct blk_zone_report) +
-		     sizeof(struct blk_zone));
+	rep = calloc(1, sizeof(*rep));
 	if (!rep) {
 		ERR_MSG("No memory for report zones\n");
 		return -ENOMEM;
 	}
 
-	rep->sector = sector;
-	rep->nr_zones = 1;
+	rep->rep = (struct blk_zone_report){
+		.sector = sector,
+		.nr_zones = 1,
+	};
 	ret = ioctl(c.devices[i].fd, BLKREPORTZONE, rep);
 	if (ret != 0) {
 		ret = -errno;
@@ -222,7 +225,7 @@ int f2fs_report_zone(int i, uint64_t sector, void *blkzone)
 		goto out;
 	}
 
-	*blkz = *(struct blk_zone *)(rep + 1);
+	*blkzone = rep->zone;
 out:
 	free(rep);
 	return ret;
@@ -531,7 +534,8 @@ uint32_t f2fs_get_usable_segments(struct f2fs_super_block *sb)
 
 #else
 
-int f2fs_report_zone(int i, uint64_t UNUSED(sector), void *UNUSED(blkzone))
+int f2fs_report_zone(int i, uint64_t UNUSED(sector),
+		     struct blk_zone *UNUSED(blkzone))
 {
 	ERR_MSG("%d: Unsupported zoned block device\n", i);
 	return -1;


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
