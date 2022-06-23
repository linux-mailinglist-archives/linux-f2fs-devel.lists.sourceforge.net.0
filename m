Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B332558668
	for <lists+linux-f2fs-devel@lfdr.de>; Thu, 23 Jun 2022 20:12:33 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.94.2)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1o4RJg-0004Tv-Ny; Thu, 23 Jun 2022 18:12:31 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <bart.vanassche@gmail.com>) id 1o4RJf-0004Tp-SI
 for linux-f2fs-devel@lists.sourceforge.net; Thu, 23 Jun 2022 18:12:30 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=stkLL2sQ20Q71Sjrk1Sm+wNuLHlSsZWuzC+1iY/Am/E=; b=l5dJ7fBKU5Brfl03/gh7j9n0BY
 bmYBbAMvTtSXcLi51LIeby7qerhRd9jzQOX/GxKZ02L807V9KOv9Y9RdO5zf1mHHemC8aB0nRDMaa
 WCgrK8vtNvRjoY8+RAvYLEdQCPujTwxIfH5NJwL2O0AWOKMAsJa5D1KKpMJAqxDNPs1w=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=stkLL2sQ20Q71Sjrk1Sm+wNuLHlSsZWuzC+1iY/Am/E=; b=BfH8l7V5ruRhCV+O7lCDtrWHI9
 AuZ5dJzklGvnrOyYT3hDHV5PtoQBDZQj5pxO120X/3p+N6ktMx1jffU5W4ae5B8No6Wuhexss45LX
 SZq9eOiw4czWXrn+LTALLXUR2xotQP555qWdyw89t2ETiHdLx+eZqRO0nUGzw8ipCNbQ=;
Received: from mail-pj1-f51.google.com ([209.85.216.51])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.94.2)
 id 1o4RJb-00BS7z-7j
 for linux-f2fs-devel@lists.sourceforge.net; Thu, 23 Jun 2022 18:12:30 +0000
Received: by mail-pj1-f51.google.com with SMTP id
 k12-20020a17090a404c00b001eaabc1fe5dso3402156pjg.1
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Thu, 23 Jun 2022 11:12:27 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=stkLL2sQ20Q71Sjrk1Sm+wNuLHlSsZWuzC+1iY/Am/E=;
 b=alByRYgTuFMmCe6CK6QWLDxOQWU1qDQO9MJQ1139ObfRpK51PEwjT8O0L9T6fnnqZE
 8hhMy5/zfQHFEL7NzEnw60fL/NBwPzIAlvO2UM+d2IERPqIbG0YxctFkSI+UbFuV25tk
 niL6yAEsdWhe3LPTmqs3p3nAU8RymjBKy/qWR3LsIppnjucKCKX7YHa7byX40CzzFqh7
 ZpOulOk74NMIoAITXYd+gERas9jrnYYFAcPKRdnPGe8vJ4W63znJpNVvpTmrroqmdfWB
 zDp0xombEeH79iIXacbp5rCl089lojLjw9YmYxtlxMblu8VeX0jE/M8MNknVxqZDDqID
 TvVA==
X-Gm-Message-State: AJIora/0nSP5RunrEBbw2WKeTKieMNqJAUTKCnWM2iIyHf2dnX3UO/Xd
 TUK2ZDtE4SVXjI/bquw1tx0=
X-Google-Smtp-Source: AGRyM1vEhJr88e2zPyon0LJXqLXKAQFHxtY7qjJ4KK0G7ctbUqzaOMOaTfLJ1/8AUJ3/SdimyF/jWg==
X-Received: by 2002:a17:902:b706:b0:168:cca6:8de7 with SMTP id
 d6-20020a170902b70600b00168cca68de7mr39482331pls.10.1656007941562; 
 Thu, 23 Jun 2022 11:12:21 -0700 (PDT)
Received: from bvanassche-linux.mtv.corp.google.com
 ([2620:15c:211:201:70af:1dc5:d20:a563])
 by smtp.gmail.com with ESMTPSA id
 az8-20020a170902a58800b00163d76696e1sm104803plb.102.2022.06.23.11.12.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 23 Jun 2022 11:12:20 -0700 (PDT)
From: Bart Van Assche <bvanassche@acm.org>
To: Jaegeuk Kim <jaegeuk@kernel.org>
Date: Thu, 23 Jun 2022 11:12:06 -0700
Message-Id: <20220623181208.3596448-4-bvanassche@acm.org>
X-Mailer: git-send-email 2.37.0.rc0.161.g10f37bed90-goog
In-Reply-To: <20220623181208.3596448-1-bvanassche@acm.org>
References: <20220623181208.3596448-1-bvanassche@acm.org>
MIME-Version: 1.0
X-Spam-Score: 0.5 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: Change the type of the third argument of f2fs_report_zone()
 from void * into struct blk_zone * to enable type checking. Signed-off-by:
 Bart Van Assche <bvanassche@acm.org> --- include/f2fs_fs.h | 4 +++-
 lib/libf2fs_zoned.c
 | 24 +++++++++++++++--------- 2 files changed, 18 insertions(+),
 10 deletions(-)
 Content analysis details:   (0.5 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
 no trust [209.85.216.51 listed in list.dnswl.org]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 0.2 HEADER_FROM_DIFFERENT_DOMAINS From and EnvelopeFrom 2nd level
 mail domains are different
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 FREEMAIL_FROM          Sender email is commonly abused enduser mail
 provider [bart.vanassche[at]gmail.com]
 0.0 RCVD_IN_MSPIKE_H3      RBL: Good reputation (+3)
 [209.85.216.51 listed in wl.mailspike.net]
 0.2 FREEMAIL_FORGED_FROMDOMAIN 2nd level domains in From and
 EnvelopeFrom freemail headers are different
 -0.0 T_SCC_BODY_TEXT_LINE   No description available.
 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
X-Headers-End: 1o4RJb-00BS7z-7j
Subject: [f2fs-dev] [PATCH v2 3/5] Improve compile-time type checking for
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
 lib/libf2fs_zoned.c | 24 +++++++++++++++---------
 2 files changed, 18 insertions(+), 10 deletions(-)

diff --git a/include/f2fs_fs.h b/include/f2fs_fs.h
index fdbf7c7a0b35..8125e9f8d082 100644
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
index d8de66b82029..a0dd8bd269ef 100644
--- a/lib/libf2fs_zoned.c
+++ b/lib/libf2fs_zoned.c
@@ -200,21 +200,26 @@ int f2fs_get_zone_blocks(int i)
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
+	static_assert(sizeof(*rep) == sizeof(rep->rep) + sizeof(rep->zone), "");
+
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
@@ -222,7 +227,7 @@ int f2fs_report_zone(int i, uint64_t sector, void *blkzone)
 		goto out;
 	}
 
-	*blkz = *(struct blk_zone *)(rep + 1);
+	*blkzone = rep->zone;
 out:
 	free(rep);
 	return ret;
@@ -531,7 +536,8 @@ uint32_t f2fs_get_usable_segments(struct f2fs_super_block *sb)
 
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
