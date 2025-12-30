Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E86ACEA55B
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 30 Dec 2025 18:39:12 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Subject:MIME-Version:Message-ID:Date:To:From:Sender:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=u7Mw+CosjCXCQt7JzJ3gRmy5+SG/PBDIhAKaWhMf8DQ=; b=E3Qgwn/mqdfLW8x9k+Mqt2iaFv
	vRVImOWVscGo5DCfvMxek1NlZdIW8H04z9FkHHIyN4LqtW/XN/9a0LRlU94eZQCR5rUJtYb1RArWp
	5lOLuZ/tMRdx1F9acHLJp5L7ZGGxceAoNpTGODaNnEneqEHGpfKtaViBkSNdG0Qzh7kM=;
Received: from [127.0.0.1] (helo=sfs-ml-3.v29.lw.sourceforge.com)
	by sfs-ml-3.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1vadgU-0006oQ-JY;
	Tue, 30 Dec 2025 17:39:02 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-3.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <daeho43@gmail.com>) id 1vadgT-0006oB-3v
 for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 30 Dec 2025 17:39:01 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:Message-ID:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=Qxdt/kyhf3WYbLmjM9uI+Ex5hbzqYjgcy6n4m4nmiV0=; b=Fbl/7gkUV0d6Rxh8Ljxtw1ymE/
 uWRFG2Iq+cltvQ04kN3kgXyha+b2cRRZ8rwSJpbRNxZA5aubP8OxpMZva3oxfTncTM1asQ40yYBoW
 hnflCcoxDuyM6ru5yUcwmT5xVQov9rCsPaaKHXlwEsrheEb9+jkTyW0OLi8zx5O7huRo=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:Cc:To:From
 :Sender:Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=Qxdt/kyhf3WYbLmjM9uI+Ex5hbzqYjgcy6n4m4nmiV0=; b=V
 UfekXiSqWpP3wu/f8ltQKf5joVfACkPZQ6j4SCDJw3fD4bQiUPDVdkyujtI/B8EiNwnIAJMdeBhd4
 EJn4/JB9dXsfveh9uk1EdBRMshH1l0TitSJMesAf0RhRCTuHEVQIuCj8InEAdgPOtVhoQmKlOeKmc
 iDEmxlwux8Eo+wKE=;
Received: from mail-pg1-f178.google.com ([209.85.215.178])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1vadgS-0005fD-Jg for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 30 Dec 2025 17:39:01 +0000
Received: by mail-pg1-f178.google.com with SMTP id
 41be03b00d2f7-c0ec27cad8cso6158681a12.1
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Tue, 30 Dec 2025 09:39:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1767116330; x=1767721130; darn=lists.sourceforge.net;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=Qxdt/kyhf3WYbLmjM9uI+Ex5hbzqYjgcy6n4m4nmiV0=;
 b=jQ8nXNxmZU4+Q/HM/KI+9T34NOHy4l3UDvIfRX5i6pq5UO11NA5z2SUehZy4NPlI05
 XLygt/aPP5Da1Ps3wjJpjpBH6FsCj0BY9Vm6hHKMTIsBH0eMXbozCw0v2/3leshqHnK5
 6nK/VCk+vC4V1zyPUAwxTLdzu64jSqYJYTUbGrQ98gZp5siVX3JrVgM4Cs+9EMj2zkqc
 HFEf+k31xgkN06bHAYqRd5lDjX8YCT7W2fBPEbRPpIZKLvdWEE8Lny+vrMDrsV/ZcfGE
 wEE97nTABZzT5dZ+Q2pbeaZuZGPyDm9SuFUfwCnuGHE8gGxblEjLOo1FrHQbwScxgD6l
 IgFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1767116330; x=1767721130;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Qxdt/kyhf3WYbLmjM9uI+Ex5hbzqYjgcy6n4m4nmiV0=;
 b=aH16oP0NzW2lAZnPoFyYhe3yumnmSsme/hH8xtyEMTXlv6h8PzjyqSk+DdqmpDXdoB
 EQo8oW/efn+SCX7Eny7waJn8XW9dt9YjPQQaQbJbysKpyBtnlynY7eOrmBPM92MWYli/
 91g3b/YSrJ73Hc92kuI3YFTUQZ3VFE3AKO44D4iqA9rUTS9nvZnXwIiL3QcSmSvdJGAk
 MV5Lg7It/j61iARt4mRn6gT8wWKee4APiNwRE2cMPGtfPEB8JUAUcNoWblK2aLcCi/qn
 pe8zn35TSrQxTstXIrByNjBTVrVejbMkdWg2T1guZgiT1WPkFXtGZn4SelZW4LYtJlKd
 ebTg==
X-Forwarded-Encrypted: i=1;
 AJvYcCU5rQGrzWrfHLWW2jk5HADgFbffHDc0WIS5Yp+ghaiWC5HBL7p8Kcdpbyeqm26MLvhaSxffBd/YoowlciAv2w/Z@lists.sourceforge.net
X-Gm-Message-State: AOJu0YxgQxPfFAg+gMbJIlnBNHr28rLUfdNH03nnOCY2Y9VLn4U4iRCB
 4OK6j52s+4rpkjPW3YHmDcfy6HU5ikrUZbpNS3P9Rz5y77JHJFcwc6gspyENtg==
X-Gm-Gg: AY/fxX4MUkXY6+7u+TK+FzemXUr3iFAVbe8HaoRGZ9E7Ucb724oiVNyo77dWZ9FehHP
 nGx2dZVw5xGtuUt8/fSDOH+LhY8tuz3U65nxzDoZEiFRm6bgcJtjVD3rFKkEavxHPg567OdehuZ
 EmRmzMnzp5D05sstjaWbhZV66BJK36qXpjoHQcgrGHn+tvPaK8NrymbawL5gKrFgTEZrP+0L17s
 rjmWrrgNU+Nhbs3b9bGjhbsOddC6NGH4rdbSy9nlZbebEyr3rueCMdE6ZE/rsF97U+Bs04M2rWa
 y6T9agnTk5CY5WVifrC64/mDpBCcn1rR+Z8O3h/aDgN0UUp3iipazO8xyseBceGphQ9z+rJDxE2
 RWu8JyOqFbGLzQyVpRSHOD8A3i9r+oFzbHX+UoNPN75mVbfL76ZT5mZlY7vD1yrThm9u6x1jWxs
 wBjhq06bYTUPIARxpcxUpXupNmHRA+h2xaWkyavcZOZuWpQBOYbJ+UeWdHIGCFmsWtwi3KZ5k6i
 HOD1A+zAYEoTGdxaDCp29x+S3sSsUV/l7AcAHk=
X-Google-Smtp-Source: AGHT+IFTUkXUvgYWbhaTsv6NeMktSYxRYi7p1BYVBdEvXjZG6+sP03VtFmAdzxRknHKuawXSydq/9Q==
X-Received: by 2002:a05:7300:de07:b0:2ae:51ae:5cf3 with SMTP id
 5a478bee46e88-2b05ebd0d80mr26034218eec.6.1767116329634; 
 Tue, 30 Dec 2025 09:38:49 -0800 (PST)
Received: from daehojeong-desktop.mtv.corp.google.com
 ([2a00:79e0:2e7c:8:3f02:5aba:72e2:8c51])
 by smtp.gmail.com with ESMTPSA id
 5a478bee46e88-2b05ffd5f86sm73202579eec.5.2025.12.30.09.38.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 30 Dec 2025 09:38:49 -0800 (PST)
From: Daeho Jeong <daeho43@gmail.com>
To: linux-kernel@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net,
 kernel-team@android.com
Date: Tue, 30 Dec 2025 09:38:45 -0800
Message-ID: <20251230173845.2310677-1-daeho43@gmail.com>
X-Mailer: git-send-email 2.52.0.351.gbe84eed79e-goog
MIME-Version: 1.0
X-Spam-Score: 0.1 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-2.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  From: Daeho Jeong During the garbage collection process, F2FS
 submits readahead I/Os for valid blocks. However, since the GC loop runs
 within a single plug scope without intermediate flushing, these readahead
 I/Os ofte [...] 
 Content analysis details:   (0.1 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 0.0 FREEMAIL_FROM Sender email is commonly abused enduser mail provider
 [daeho43(at)gmail.com]
 0.2 FREEMAIL_ENVFROM_END_DIGIT Envelope-from freemail username ends in
 digit [daeho43(at)gmail.com]
 0.0 RCVD_IN_MSPIKE_H3      RBL: Good reputation (+3)
 [209.85.215.178 listed in wl.mailspike.net]
 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
X-Headers-End: 1vadgS-0005fD-Jg
Subject: [f2fs-dev] [PATCH] f2fs: flush plug periodically during GC to
 maximize readahead effect
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

During the garbage collection process, F2FS submits readahead I/Os for
valid blocks. However, since the GC loop runs within a single plug scope
without intermediate flushing, these readahead I/Os often accumulate in
the block layer's plug list instead of being dispatched to the device
immediately.

Consequently, when the GC thread attempts to lock the page later, the
I/O might not have completed (or even started), leading to a "read try
and wait" scenario. This negates the benefit of readahead and causes
unnecessary delays in GC latency.

This patch addresses this issue by introducing an intermediate
blk_finish_plug() and blk_start_plug() pair within the GC loop. This
forces the dispatch of pending I/Os, ensuring that readahead pages are
fetched in time, thereby reducing GC latency.

Signed-off-by: Daeho Jeong <daehojeong@google.com>
---
 fs/f2fs/gc.c | 19 +++++++++++++------
 1 file changed, 13 insertions(+), 6 deletions(-)

diff --git a/fs/f2fs/gc.c b/fs/f2fs/gc.c
index 384fa7e2085b..8ffc3d4f7989 100644
--- a/fs/f2fs/gc.c
+++ b/fs/f2fs/gc.c
@@ -1031,7 +1031,8 @@ static int check_valid_map(struct f2fs_sb_info *sbi,
  * ignore that.
  */
 static int gc_node_segment(struct f2fs_sb_info *sbi,
-		struct f2fs_summary *sum, unsigned int segno, int gc_type)
+		struct f2fs_summary *sum, unsigned int segno, int gc_type,
+		struct blk_plug *plug)
 {
 	struct f2fs_summary *entry;
 	block_t start_addr;
@@ -1100,8 +1101,11 @@ static int gc_node_segment(struct f2fs_sb_info *sbi,
 		stat_inc_node_blk_count(sbi, 1, gc_type);
 	}
 
-	if (++phase < 3)
+	if (++phase < 3) {
+		blk_finish_plug(plug);
+		blk_start_plug(plug);
 		goto next_step;
+	}
 
 	if (fggc)
 		atomic_dec(&sbi->wb_sync_req[NODE]);
@@ -1535,7 +1539,7 @@ static int move_data_page(struct inode *inode, block_t bidx, int gc_type,
  */
 static int gc_data_segment(struct f2fs_sb_info *sbi, struct f2fs_summary *sum,
 		struct gc_inode_list *gc_list, unsigned int segno, int gc_type,
-		bool force_migrate)
+		bool force_migrate, struct blk_plug *plug)
 {
 	struct super_block *sb = sbi->sb;
 	struct f2fs_summary *entry;
@@ -1703,8 +1707,11 @@ static int gc_data_segment(struct f2fs_sb_info *sbi, struct f2fs_summary *sum,
 		}
 	}
 
-	if (++phase < 5)
+	if (++phase < 5) {
+		blk_finish_plug(plug);
+		blk_start_plug(plug);
 		goto next_step;
+	}
 
 	return submitted;
 }
@@ -1853,11 +1860,11 @@ static int do_garbage_collect(struct f2fs_sb_info *sbi,
 			 */
 			if (type == SUM_TYPE_NODE)
 				submitted += gc_node_segment(sbi, sum->entries,
-						cur_segno, gc_type);
+						cur_segno, gc_type, &plug);
 			else
 				submitted += gc_data_segment(sbi, sum->entries,
 						gc_list, cur_segno,
-						gc_type, force_migrate);
+						gc_type, force_migrate, &plug);
 
 			stat_inc_gc_seg_count(sbi, data_type, gc_type);
 			sbi->gc_reclaimed_segs[sbi->gc_mode]++;
-- 
2.52.0.351.gbe84eed79e-goog



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
