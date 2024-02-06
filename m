Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id ECBA784C018
	for <lists+linux-f2fs-devel@lfdr.de>; Tue,  6 Feb 2024 23:33:26 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1rXU0C-0000hM-26;
	Tue, 06 Feb 2024 22:33:17 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <daeho43@gmail.com>) id 1rXU0A-0000hG-9i
 for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 06 Feb 2024 22:33:15 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:Message-ID:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=00pmZ6kibv+G4s9omY1rvgDUEdmKCy0BpQNbUzvHf2k=; b=aWtT/Kd8AMwaoZ1eq0sWpgZ4nj
 FV6fE/c0wJIGDOt0BC/Rc0CwyCf2Ce/ztXP9T1mz6T+HGlByh4U4vBhuj+xbMZ4Q9KmxxWtbq1UdD
 TbE2FW+v0U02+fG96HbebDwZzsBxW92ASCc3/neIG3c0tH9J9O2zw694oKZXFJQj6Ucg=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:Cc:To:From
 :Sender:Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=00pmZ6kibv+G4s9omY1rvgDUEdmKCy0BpQNbUzvHf2k=; b=d
 jrAm5T/cGKfMbcQuxAr4nugLs5D1T2YlWrcihn501HDZAMDipSnjY2vOqCDUTpfxP5IUZxybLuajk
 2q2og5XNCN9DyMWa5BQw4x4ddhxFx0zGjyEdaMmWVz23i7xzo9AMN8X44IA4pJgpoysgmpwCLSj93
 wD4p0buQaiUv4euI=;
Received: from mail-pl1-f182.google.com ([209.85.214.182])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1rXU05-00041A-Bk for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 06 Feb 2024 22:33:15 +0000
Received: by mail-pl1-f182.google.com with SMTP id
 d9443c01a7336-1d93ddd76adso228645ad.2
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Tue, 06 Feb 2024 14:33:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1707258784; x=1707863584; darn=lists.sourceforge.net;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=00pmZ6kibv+G4s9omY1rvgDUEdmKCy0BpQNbUzvHf2k=;
 b=IKXWyQDT7WBqiTxYPffQ2sRfA3rYn3bhThudniUwEOIVzLaig45Y+skuqji+U+vU6T
 HASA5J6DG/M/sJYYuMiIByzNK/sGePQZodz51BRLlIjdpgaTeBtIJLRq3BOHqwVUe8v7
 IZzTpLNoatitAbfkY3rR0+cuexI5HtqO3aVVDEjn4FXB8Hd5Q+J5DLf5WICwUgnusc55
 wL27xDLxv50rl/x90OZ5s8Sg7chsBBK5wNl72bQML8xa2XllNwCHrfKcm/gsGkiRAJok
 DWLlxlIAuH9ojTQZQnYJ02EVusf25wMyKKAtHpCrMpY7/ptzmkqVuGEjzpjxHyGztOaF
 s6Jw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1707258784; x=1707863584;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=00pmZ6kibv+G4s9omY1rvgDUEdmKCy0BpQNbUzvHf2k=;
 b=PSgtLDU6Vn7nrb/9H2m5RiUuqLc1WxRkn9k2sye4zqVlwMP6AQ31U6oIgR2r+It8Iu
 F5qD8ur53xRNUfv0PTlzMeqN7q/oDlmz/RykzW6yE9OJOGD5EMuHh4FWicqdyYINPS5n
 r2NZeMYNuGYkMBjv3nJyZX+b0Vf9LwSca5ZecmfGQ6CvtdItRsEeDz69kqNVapgXFBnl
 za1MjilKpcYZEFkEFtanDdHoz8I3JCgygqo8/u3FEzz9y0HDhEpotXkL8CQRHxHsmLXJ
 qYN7lN2wOQP3BdSeLAFclbXFGcIBxr94WiGUtCnWmrVUbQTAnx3rozKM9lwwBGTzBTh7
 y8Lg==
X-Forwarded-Encrypted: i=1;
 AJvYcCUV8V64PZ12KFz16h58QwOVkVrhV2xfVuuXhqh2ecQZ4YAHSwsOaBpOaXCB+BbPyKhOwFvZKSSyMSnpoEoaZyDcfs8i0A382K/fn9NOZr6GcrKPF41aEA==
X-Gm-Message-State: AOJu0YyBxLjXAcXpD71xbzlVi1eFyHQ/O2yboUA46g+UEJI5w9cCp/6F
 7R9IfLgq3qVnnnOPP2KoHpyBpOTkemIiMpxctBj5OaO8gmdTf2x+
X-Google-Smtp-Source: AGHT+IGgc/izjSH8pQnpq08ELcEm7vCo3Fyc8MzvjLN09UD4s8l+Wk5PMEV/tTi7YFLNc5uHpVBzTA==
X-Received: by 2002:a17:90a:3189:b0:296:9bc8:c16d with SMTP id
 j9-20020a17090a318900b002969bc8c16dmr984401pjb.26.1707258784206; 
 Tue, 06 Feb 2024 14:33:04 -0800 (PST)
X-Forwarded-Encrypted: i=1;
 AJvYcCXc6fivOnbrdtPy6PSV7U7G5sDFUskyySDlpl9XItR4RSmzcx7WMPVFXScv6FmQATmvQ9oKEViDUfNAso87u1Z0mEqh74yLewWSU9k55Kdg4ukOvCfb2h7wDftWZXIUJ2u2PHzIwashMdbsNPBlEmCqnlDUUc4acxza8JQoQVtzXxOfsw==
Received: from daehojeong-desktop.mtv.corp.google.com
 ([2620:0:1000:8411:6e38:9e6f:4818:7d04])
 by smtp.gmail.com with ESMTPSA id
 n3-20020a170902dc8300b001d6f091ca04sm32371pld.13.2024.02.06.14.33.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 06 Feb 2024 14:33:03 -0800 (PST)
From: Daeho Jeong <daeho43@gmail.com>
To: linux-kernel@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net,
 kernel-team@android.com
Date: Tue,  6 Feb 2024 14:32:55 -0800
Message-ID: <20240206223257.3461359-1-daeho43@gmail.com>
X-Mailer: git-send-email 2.43.0.594.gd9cf4e227d-goog
MIME-Version: 1.0
X-Spam-Score: 0.0 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  From: Daeho Jeong Make f2fs_gc_range() an extenal function
 to use it for GC for a range. Signed-off-by: Daeho Jeong Signed-off-by:
 Jaegeuk
 Kim --- fs/f2fs/gc.c | 49 ++++++++++++++++++++++++++++ 1 file changed, 28
 insertions(+), 21 deletions(-) 
 Content analysis details:   (0.0 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
 no trust [209.85.214.182 listed in list.dnswl.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 FREEMAIL_FROM          Sender email is commonly abused enduser mail
 provider [daeho43[at]gmail.com]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 0.2 FREEMAIL_ENVFROM_END_DIGIT Envelope-from freemail username ends
 in digit [daeho43[at]gmail.com]
 0.0 RCVD_IN_MSPIKE_H3      RBL: Good reputation (+3)
 [209.85.214.182 listed in wl.mailspike.net]
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
 -0.0 T_SCC_BODY_TEXT_LINE   No description available.
X-Headers-End: 1rXU05-00041A-Bk
Subject: [f2fs-dev] [PATCH 1/3] f2fs: separate f2fs_gc_range() to use GC for
 a range
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
Cc: Jaegeuk Kim <jaegeuk@kernel.org>, Daeho Jeong <daehojeong@google.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

From: Daeho Jeong <daehojeong@google.com>

Make f2fs_gc_range() an extenal function to use it for GC for a range.

Signed-off-by: Daeho Jeong <daehojeong@google.com>
Signed-off-by: Jaegeuk Kim <jaegeuk@kernel.org>
---
 fs/f2fs/gc.c | 49 ++++++++++++++++++++++++++++---------------------
 1 file changed, 28 insertions(+), 21 deletions(-)

diff --git a/fs/f2fs/gc.c b/fs/f2fs/gc.c
index a079eebfb080..a46d5053f965 100644
--- a/fs/f2fs/gc.c
+++ b/fs/f2fs/gc.c
@@ -1983,10 +1983,34 @@ void f2fs_build_gc_manager(struct f2fs_sb_info *sbi)
 	init_atgc_management(sbi);
 }
 
+static int f2fs_gc_range(struct f2fs_sb_info *sbi,
+		unsigned int start_seg, unsigned int end_seg, bool dry_run)
+{
+	unsigned int segno;
+
+	for (segno = start_seg; segno <= end_seg; segno += sbi->segs_per_sec) {
+		struct gc_inode_list gc_list = {
+			.ilist = LIST_HEAD_INIT(gc_list.ilist),
+			.iroot = RADIX_TREE_INIT(gc_list.iroot, GFP_NOFS),
+		};
+
+		do_garbage_collect(sbi, segno, &gc_list, FG_GC, true);
+		put_gc_inode(&gc_list);
+
+		if (!dry_run && get_valid_blocks(sbi, segno, true))
+			return -EAGAIN;
+
+		if (fatal_signal_pending(current))
+			return -ERESTARTSYS;
+	}
+
+	return 0;
+}
+
 static int free_segment_range(struct f2fs_sb_info *sbi,
-				unsigned int secs, bool gc_only)
+				unsigned int secs, bool dry_run)
 {
-	unsigned int segno, next_inuse, start, end;
+	unsigned int next_inuse, start, end;
 	struct cp_control cpc = { CP_RESIZE, 0, 0, 0 };
 	int gc_mode, gc_type;
 	int err = 0;
@@ -2012,25 +2036,8 @@ static int free_segment_range(struct f2fs_sb_info *sbi,
 		f2fs_allocate_segment_for_resize(sbi, type, start, end);
 
 	/* do GC to move out valid blocks in the range */
-	for (segno = start; segno <= end; segno += sbi->segs_per_sec) {
-		struct gc_inode_list gc_list = {
-			.ilist = LIST_HEAD_INIT(gc_list.ilist),
-			.iroot = RADIX_TREE_INIT(gc_list.iroot, GFP_NOFS),
-		};
-
-		do_garbage_collect(sbi, segno, &gc_list, FG_GC, true);
-		put_gc_inode(&gc_list);
-
-		if (!gc_only && get_valid_blocks(sbi, segno, true)) {
-			err = -EAGAIN;
-			goto out;
-		}
-		if (fatal_signal_pending(current)) {
-			err = -ERESTARTSYS;
-			goto out;
-		}
-	}
-	if (gc_only)
+	err = f2fs_gc_range(sbi, start, end, dry_run);
+	if (err || dry_run)
 		goto out;
 
 	stat_inc_cp_call_count(sbi, TOTAL_CALL);
-- 
2.43.0.594.gd9cf4e227d-goog



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
