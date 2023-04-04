Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id BAE2C6D5844
	for <lists+linux-f2fs-devel@lfdr.de>; Tue,  4 Apr 2023 07:55:04 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1pjZdE-0003hQ-VQ;
	Tue, 04 Apr 2023 05:55:00 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <qkrwngud825@gmail.com>) id 1pjZdD-0003hJ-Fu
 for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 04 Apr 2023 05:54:58 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=XQ3oNyH4FOddcnUgUP4bzkSvXXig3ELz1ZDxa0NezHQ=; b=JHrTTtPxYXUk2lnxhEpKqSuGE0
 ZSeah5vHMY56JhHwrfPt/ueZw0Gj7g1yQL7pakv0zEqoOVbt+byB5lHtwaMm1prqzr5zkBUy1LAbi
 2tz88OR6a3rd7OoOxiNDEZ886Us/kVURZTWdKZbt7zWM7L8P1FJZS/PGPLd0ZQ+NaP8I=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:Message-Id:Date:Subject:Cc:To:From
 :Sender:Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=XQ3oNyH4FOddcnUgUP4bzkSvXXig3ELz1ZDxa0NezHQ=; b=B
 5HHUt8lfU4nQYxbvnRYJvz4dmDIxCeGy3zPfsRRY6uOqL6pbN3MwwNto9IeB+bxUtYHHZ3tL3yNC3
 wyxqy4RsqaaycXHoVVDan2AI9H3LLrz1FEi3VxamczW+FIxmVf8KMNfQrS9eNjYrDSLhoP73i6DVY
 Cv2+lhcsjwcjEp60=;
Received: from mail-pj1-f54.google.com ([209.85.216.54])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1pjZdB-0005ll-MI for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 04 Apr 2023 05:54:58 +0000
Received: by mail-pj1-f54.google.com with SMTP id
 lr16-20020a17090b4b9000b0023f187954acso32865013pjb.2
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Mon, 03 Apr 2023 22:54:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112; t=1680587691;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=XQ3oNyH4FOddcnUgUP4bzkSvXXig3ELz1ZDxa0NezHQ=;
 b=bqeplp9ByHYYGGVvCRlPIGsuZ6hpdUvBZoIslOU71dLNJZQfjnziWZK1urXvbNETpg
 Vz8ldpT142sf8BfYsIlZOYLMFI2j9bm1Qjd1dTuebU3AsCHMRaUiMdX1T618RW6iFi7/
 Lgty9Eb0nS+MQ0TikvSulixvAewrD183DZF6zKXrd/yVVRDfMM+AwmwzeCjZOrK/OUtn
 BZF3n5c+0RjfwbUeJBJq5FBdBnNtmhEdzeWbtHHjdhlvFW+IAGDM1OkdoGosQCoH+yik
 gRPeaGRlbvROPbLz4c8J+Km6aUAMVBROg4JHefwgf5AS1RusvawX4ymp77NtkNTEIZcM
 a0uA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680587691;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=XQ3oNyH4FOddcnUgUP4bzkSvXXig3ELz1ZDxa0NezHQ=;
 b=ouYg1PPUGXWikUlqeg4CI7/7zfYaeySRXw9AunnRTfo/AdJBWp2l1daI+URMTnn6hS
 QElDV9Ukqn8/jivkpyude1ByXoOQY/9OYoQu5TxT4SoUehCfm+mRX/ogOmx1+dUFkmT/
 L57utlNyaBRiEMRzNVD4EURZrEEAnD1UP7eiCvmz9plNytWcsI+aH9pvVSsqQPuk0QF2
 hl/HD8/ShPqt5p0QW7vkU/Jpkdt6Hpe17amTzNkGTOPaW+TgOiRxF8QJ/32ADkCDsrpe
 4YRo6RmJF77b55Xadg2TT0bv73JIvEtQmLoiG5dE6HFLVek3dhtCtbzLte+jjkbvWs1J
 naSA==
X-Gm-Message-State: AAQBX9cb62+C6wVnYQysmgFvczdDrtKhXVqSHr9mTT1rWxScG5zqfakA
 ZdrLPUy30QH8vYS9xTgkhyQmAmunVHVuvg==
X-Google-Smtp-Source: AKy350b/S1UQWR3tkTQkrSENykEkK32bUgeUjq4l4dJclGxrDNTx98ky+ueCFlXqDVF0tOcQrx4gYA==
X-Received: by 2002:a17:90b:4b84:b0:234:bf0:86b9 with SMTP id
 lr4-20020a17090b4b8400b002340bf086b9mr1471212pjb.25.1680587691493; 
 Mon, 03 Apr 2023 22:54:51 -0700 (PDT)
Received: from localhost.localdomain ([114.71.100.10])
 by smtp.gmail.com with ESMTPSA id
 c16-20020a17090abf1000b002342ccc8280sm7065942pjs.6.2023.04.03.22.54.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 03 Apr 2023 22:54:50 -0700 (PDT)
From: Juhyung Park <qkrwngud825@gmail.com>
To: linux-f2fs-devel@lists.sourceforge.net
Date: Tue,  4 Apr 2023 14:54:46 +0900
Message-Id: <20230404055446.1656296-1-qkrwngud825@gmail.com>
X-Mailer: git-send-email 2.40.0
MIME-Version: 1.0
X-Spam-Score: 2.4 (++)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: cp_payload is set differently [1] when extended node bitmap
 feature is enabled. Commit b79c3ba4ea9d broke fsck on f2fs file systems
 created
 on 2+ TB device with extended node bitmap feature enabled. As the sanity
 check is for checking overflows, fix this to assume the max possible cp_payload
 size under the extended node bitmap. 
 Content analysis details:   (2.4 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.8 HK_RANDOM_FROM         From username looks random
 0.0 HK_RANDOM_ENVFROM      Envelope sender username looks random
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
 no trust [209.85.216.54 listed in list.dnswl.org]
 1.5 RCVD_IN_SORBS_WEB      RBL: SORBS: sender is an abusable web server
 [114.71.100.10 listed in dnsbl.sorbs.net]
 0.2 FREEMAIL_ENVFROM_END_DIGIT Envelope-from freemail username ends
 in digit [qkrwngud825[at]gmail.com]
 0.0 FREEMAIL_FROM          Sender email is commonly abused enduser mail
 provider [qkrwngud825[at]gmail.com]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 0.0 RCVD_IN_MSPIKE_H3      RBL: Good reputation (+3)
 [209.85.216.54 listed in wl.mailspike.net]
 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
X-Headers-End: 1pjZdB-0005ll-MI
Subject: [f2fs-dev] [PATCH] fsck.f2fs: fix sanity check logic for cp_payload
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
Cc: Alexander Koskovich <akoskovich@pm.me>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

cp_payload is set differently [1] when extended node bitmap feature is
enabled. Commit b79c3ba4ea9d broke fsck on f2fs file systems created on
2+ TB device with extended node bitmap feature enabled.

As the sanity check is for checking overflows, fix this to assume the max
possible cp_payload size under the extended node bitmap.

Link: https://git.kernel.org/pub/scm/linux/kernel/git/jaegeuk/f2fs-tools.git/tree/mkfs/f2fs_format.c?h=v1.15.0#n372 [1]
Fixes: b79c3ba4ea9d ("fsck.f2fs: sanity check cp_payload before reading checkpoint")
Reported-by: Alexander Koskovich <akoskovich@pm.me>
Signed-off-by: Juhyung Park <qkrwngud825@gmail.com>
---
 fsck/mount.c      | 2 +-
 include/f2fs_fs.h | 4 ++++
 2 files changed, 5 insertions(+), 1 deletion(-)

diff --git a/fsck/mount.c b/fsck/mount.c
index 2b26701..df0314d 100644
--- a/fsck/mount.c
+++ b/fsck/mount.c
@@ -1208,7 +1208,7 @@ int get_valid_checkpoint(struct f2fs_sb_info *sbi)
 	int ret;
 
 	cp_payload = get_sb(cp_payload);
-	if (cp_payload > F2FS_BLK_ALIGN(MAX_SIT_BITMAP_SIZE))
+	if (cp_payload > F2FS_BLK_ALIGN(MAX_CP_PAYLOAD))
 		return -EINVAL;
 
 	cp_blks = 1 + cp_payload;
diff --git a/include/f2fs_fs.h b/include/f2fs_fs.h
index 333ae07..f890634 100644
--- a/include/f2fs_fs.h
+++ b/include/f2fs_fs.h
@@ -1168,6 +1168,10 @@ static_assert(sizeof(struct f2fs_nat_block) == 4095, "");
 #define MAX_SIT_BITMAP_SIZE    (SEG_ALIGN(SIZE_ALIGN(F2FS_MAX_SEGMENT, \
 						SIT_ENTRY_PER_BLOCK)) * \
 						c.blks_per_seg / 8)
+#define MAX_CP_PAYLOAD         (SEG_ALIGN(SIZE_ALIGN(UINT32_MAX, NAT_ENTRY_PER_BLOCK)) * \
+						DEFAULT_NAT_ENTRY_RATIO / 100 * \
+						c.blks_per_seg / 8 + \
+						MAX_SIT_BITMAP_SIZE - MAX_BITMAP_SIZE_IN_CKPT)
 
 /*
  * Note that f2fs_sit_entry->vblocks has the following bit-field information.
-- 
2.40.0



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
