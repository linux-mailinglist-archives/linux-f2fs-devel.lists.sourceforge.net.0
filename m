Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 7EE238A8D8A
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 17 Apr 2024 23:12:24 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1rxCZg-0001H9-Jq;
	Wed, 17 Apr 2024 21:12:13 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <jaegeuk@kernel.org>) id 1rxCZf-0001Gv-Al
 for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 17 Apr 2024 21:12:12 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:Message-ID:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=2vAcUawf/3hVTkVfj5MTIBA/4B4Ncyz3qLrCvlqc0Z8=; b=dHvSnEY/hoGe+KPkJk8YQ76U5s
 aXnJ7JFptpvin1qqrQ9DW/4VRBA8h8EAsavcBAyIGuXsk6QrEGA2pClVnkQaycpJWYgeB36lp2nCr
 xzn1VPRRxsJu/90vrQZ5M4gCf8WNZbhB4Qgp7tNYz9HZAYkIWRDeIwifxYW6bPBW00Do=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:Cc:To:From
 :Sender:Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=2vAcUawf/3hVTkVfj5MTIBA/4B4Ncyz3qLrCvlqc0Z8=; b=C
 I0KNyZ0aeI1eTCIatbNUfzVR/F2CGQClCxX+JJ+gyCqgnZ5efBnBbsc2/kewSz+wq+aI4enhy4WsB
 uIgiFEqBSmlKrQpaR6LeadObrFyKAPO2p4NhUTRqRaPOG6rOsVDY0bFGV1Zua+JVMDgtcWsfxvxN4
 hMOMuMx+fpNm+e/8=;
Received: from sin.source.kernel.org ([145.40.73.55])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1rxCZe-0003mM-Vy for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 17 Apr 2024 21:12:11 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id 24589CE13D4
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Wed, 17 Apr 2024 21:12:04 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 41A0DC072AA;
 Wed, 17 Apr 2024 21:12:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1713388323;
 bh=QarXj+s/wPiCd324CLbe5/b03kj2VCCAjbBMQT6SOZc=;
 h=From:To:Cc:Subject:Date:From;
 b=lb32onrf4lOWuPDyDlZMiePYzDKx+PU7/6WoDuB3z3gHKmZ+7Ne+rL6T5GjDDq+Bo
 8XbYS3ExHuGsBM1AVsf8ubHtzaznUHkJBNu+BkViUDBPsOUNMthMf89x1ozzt1dEZw
 +oYh+61mwxbaLCA+Xmq/KDd2FScFpsvBG/vHmhfpslFPnsKU9Mp3tILMJddxQ21PVw
 nfydajmXUaKJXAc3TJ3gEMTSXV38N7JJtKH5D8nQA//22fiIpvyZ06+LMbuRmvja2N
 Fgr+Cdta1EXskNh2Wf3oEROGvfRwAVSa0vMQDWotXfrY6YsipVgfsLV+uBYqovMuGN
 V5NUgBqJNoH2w==
From: Jaegeuk Kim <jaegeuk@kernel.org>
To: linux-kernel@vger.kernel.org,
	linux-f2fs-devel@lists.sourceforge.net
Date: Wed, 17 Apr 2024 21:12:01 +0000
Message-ID: <20240417211201.3919770-1-jaegeuk@kernel.org>
X-Mailer: git-send-email 2.44.0.683.g7961c838ac-goog
MIME-Version: 1.0
X-Spam-Score: -1.9 (-)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: This reverts commit 930e2607638d ("f2fs: remove obsolete
 whint_mode"), 
 as we decide to pass write hints to the disk. Signed-off-by: Jaegeuk Kim
 <jaegeuk@kernel.org> --- Documentation/filesystems/f2fs.rst | 29
 +++++++++++++++
 fs/f2fs/data.c | 2 + fs/f2fs/f2fs.h | 2 + fs/f2fs/segment.c | 59
 +++++++++++++++++++++++++++ [...] 
 Content analysis details:   (-1.9 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -1.7 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1rxCZe-0003mM-Vy
Subject: [f2fs-dev] [PATCH] f2fs: assign the write hint per stream by default
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
Cc: Jaegeuk Kim <jaegeuk@kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

This reverts commit 930e2607638d ("f2fs: remove obsolete whint_mode"), as we
decide to pass write hints to the disk.

Signed-off-by: Jaegeuk Kim <jaegeuk@kernel.org>
---
 Documentation/filesystems/f2fs.rst | 29 +++++++++++++++
 fs/f2fs/data.c                     |  2 +
 fs/f2fs/f2fs.h                     |  2 +
 fs/f2fs/segment.c                  | 59 ++++++++++++++++++++++++++++++
 4 files changed, 92 insertions(+)

diff --git a/Documentation/filesystems/f2fs.rst b/Documentation/filesystems/f2fs.rst
index efc3493fd6f8..68a0885fb5e6 100644
--- a/Documentation/filesystems/f2fs.rst
+++ b/Documentation/filesystems/f2fs.rst
@@ -774,6 +774,35 @@ In order to identify whether the data in the victim segment are valid or not,
 F2FS manages a bitmap. Each bit represents the validity of a block, and the
 bitmap is composed of a bit stream covering whole blocks in main area.
 
+Write-hint Policy
+-----------------
+
+F2FS sets the whint all the time with the below policy.
+
+===================== ======================== ===================
+User                  F2FS                     Block
+===================== ======================== ===================
+N/A                   META                     WRITE_LIFE_NONE|REQ_META
+N/A                   HOT_NODE                 WRITE_LIFE_NONE
+N/A                   WARM_NODE                WRITE_LIFE_MEDIUM
+N/A                   COLD_NODE                WRITE_LIFE_LONG
+ioctl(COLD)           COLD_DATA                WRITE_LIFE_EXTREME
+extension list        "                        "
+
+-- buffered io
+N/A                   COLD_DATA                WRITE_LIFE_EXTREME
+N/A                   HOT_DATA                 WRITE_LIFE_SHORT
+N/A                   WARM_DATA                WRITE_LIFE_NOT_SET
+
+-- direct io
+WRITE_LIFE_EXTREME    COLD_DATA                WRITE_LIFE_EXTREME
+WRITE_LIFE_SHORT      HOT_DATA                 WRITE_LIFE_SHORT
+WRITE_LIFE_NOT_SET    WARM_DATA                WRITE_LIFE_NOT_SET
+WRITE_LIFE_NONE       "                        WRITE_LIFE_NONE
+WRITE_LIFE_MEDIUM     "                        WRITE_LIFE_MEDIUM
+WRITE_LIFE_LONG       "                        WRITE_LIFE_LONG
+===================== ======================== ===================
+
 Fallocate(2) Policy
 -------------------
 
diff --git a/fs/f2fs/data.c b/fs/f2fs/data.c
index 5d641fac02ba..ed7d08785fcf 100644
--- a/fs/f2fs/data.c
+++ b/fs/f2fs/data.c
@@ -465,6 +465,8 @@ static struct bio *__bio_alloc(struct f2fs_io_info *fio, int npages)
 	} else {
 		bio->bi_end_io = f2fs_write_end_io;
 		bio->bi_private = sbi;
+		bio->bi_write_hint = f2fs_io_type_to_rw_hint(sbi,
+						fio->type, fio->temp);
 	}
 	iostat_alloc_and_bind_ctx(sbi, bio, NULL);
 
diff --git a/fs/f2fs/f2fs.h b/fs/f2fs/f2fs.h
index dd530dc70005..b3b878acc86b 100644
--- a/fs/f2fs/f2fs.h
+++ b/fs/f2fs/f2fs.h
@@ -3745,6 +3745,8 @@ void f2fs_destroy_segment_manager(struct f2fs_sb_info *sbi);
 int __init f2fs_create_segment_manager_caches(void);
 void f2fs_destroy_segment_manager_caches(void);
 int f2fs_rw_hint_to_seg_type(enum rw_hint hint);
+enum rw_hint f2fs_io_type_to_rw_hint(struct f2fs_sb_info *sbi,
+			enum page_type type, enum temp_type temp);
 unsigned int f2fs_usable_segs_in_sec(struct f2fs_sb_info *sbi,
 			unsigned int segno);
 unsigned int f2fs_usable_blks_in_seg(struct f2fs_sb_info *sbi,
diff --git a/fs/f2fs/segment.c b/fs/f2fs/segment.c
index f0da516ba8dc..daa94669f7ee 100644
--- a/fs/f2fs/segment.c
+++ b/fs/f2fs/segment.c
@@ -3364,6 +3364,65 @@ int f2fs_rw_hint_to_seg_type(enum rw_hint hint)
 	}
 }
 
+/*
+ * This returns write hints for each segment type. This hints will be
+ * passed down to block layer as below by default.
+ *
+ * User                  F2FS                     Block
+ * ----                  ----                     -----
+ *                       META                     WRITE_LIFE_NONE|REQ_META
+ *                       HOT_NODE                 WRITE_LIFE_NONE
+ *                       WARM_NODE                WRITE_LIFE_MEDIUM
+ *                       COLD_NODE                WRITE_LIFE_LONG
+ * ioctl(COLD)           COLD_DATA                WRITE_LIFE_EXTREME
+ * extension list        "                        "
+ *
+ * -- buffered io
+ *                       COLD_DATA                WRITE_LIFE_EXTREME
+ *                       HOT_DATA                 WRITE_LIFE_SHORT
+ *                       WARM_DATA                WRITE_LIFE_NOT_SET
+ *
+ * -- direct io
+ * WRITE_LIFE_EXTREME    COLD_DATA                WRITE_LIFE_EXTREME
+ * WRITE_LIFE_SHORT      HOT_DATA                 WRITE_LIFE_SHORT
+ * WRITE_LIFE_NOT_SET    WARM_DATA                WRITE_LIFE_NOT_SET
+ * WRITE_LIFE_NONE       "                        WRITE_LIFE_NONE
+ * WRITE_LIFE_MEDIUM     "                        WRITE_LIFE_MEDIUM
+ * WRITE_LIFE_LONG       "                        WRITE_LIFE_LONG
+ */
+enum rw_hint f2fs_io_type_to_rw_hint(struct f2fs_sb_info *sbi,
+				enum page_type type, enum temp_type temp)
+{
+	switch (type) {
+	case DATA:
+		switch (temp) {
+		case WARM:
+			return WRITE_LIFE_NOT_SET;
+		case HOT:
+			return WRITE_LIFE_SHORT;
+		case COLD:
+			return WRITE_LIFE_EXTREME;
+		default:
+			return WRITE_LIFE_NONE;
+		}
+	case NODE:
+		switch (temp) {
+		case WARM:
+			return WRITE_LIFE_MEDIUM;
+		case HOT:
+			return WRITE_LIFE_NONE;
+		case COLD:
+			return WRITE_LIFE_LONG;
+		default:
+			return WRITE_LIFE_NONE;
+		}
+	case META:
+		return WRITE_LIFE_NONE;
+	default:
+		return WRITE_LIFE_NONE;
+	}
+}
+
 static int __get_segment_type_2(struct f2fs_io_info *fio)
 {
 	if (fio->type == DATA)
-- 
2.44.0.683.g7961c838ac-goog



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
