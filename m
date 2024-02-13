Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id B056985388D
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 13 Feb 2024 18:38:33 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1rZwjf-0003oN-Ja;
	Tue, 13 Feb 2024 17:38:24 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <daeho43@gmail.com>) id 1rZwjd-0003oH-VB
 for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 13 Feb 2024 17:38:22 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:Message-ID:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=vBDyj3Iv7QB4U+Y1PAOul+HNZzqp+6gSDSC9V0g8NJY=; b=IXuvAWqw9l36QeDBy7oOc72Wl+
 1q/axKZL9xbLFe0xtsosWmZKnlcmRr01dT4BhBYD4sjAabN1yCpFvFWdBY7xzHQG5ddlz99rBkvfO
 wa63NaHku124+0/kib80vRI6aqG1rTSNr+MOhMRWffKFY9CiaO+hCKcF4UiT3AFvnisI=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:Cc:To:From
 :Sender:Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=vBDyj3Iv7QB4U+Y1PAOul+HNZzqp+6gSDSC9V0g8NJY=; b=D
 HHtbxivsQ8L3/kgc7GkhWYCcpxv8XbsOzuD64x4DKTa8+oTYnYxBAnWwseW/19crRXxNSrtiFwl6C
 1HGgwDoHJjOT00IFsqS9TE4H77BMMLtn6YZi2JtlHf3w0OCQg0Cy739tzR3mkJ8zI2SGmg0q806MX
 5sUL1qJmzzVcpvk4=;
Received: from mail-pj1-f49.google.com ([209.85.216.49])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1rZwjd-0003ju-Jb for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 13 Feb 2024 17:38:22 +0000
Received: by mail-pj1-f49.google.com with SMTP id
 98e67ed59e1d1-29080973530so3340555a91.1
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Tue, 13 Feb 2024 09:38:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1707845896; x=1708450696; darn=lists.sourceforge.net;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=vBDyj3Iv7QB4U+Y1PAOul+HNZzqp+6gSDSC9V0g8NJY=;
 b=mzLMiMCLR8fEYg6dKX0Fto6IlHiP4Yv42u71Yik94O2AlZqeotNmSGideF207MFfRR
 egAOlla7o3O4yYjYe3oOb5CNLkx9B+UuhXL+Bxk11mrwXJg8w4AcN/iRdPb22r4bIh0s
 STLyHTwv0WSUmnAmQQclOBdqsUMO8jTZwdRBCdWqgXpX50ASlzdPd0dVxWyq1mDdfTL5
 OA/3Ixv8/0zQUYuT/VMsmO7/3lW8JRD7y+hrTDwVR5J7b6EQBgFBPMzUU9P4kra8CY/g
 4QPSiCO2H5SRzWOzGOgCg/TsuJu16HtsEXtNJMOQJX631Emll3BpK+1K9Md+yNRbq6zM
 UjGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1707845896; x=1708450696;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=vBDyj3Iv7QB4U+Y1PAOul+HNZzqp+6gSDSC9V0g8NJY=;
 b=pSHwxzWfhGY/qIo8a1ImzswNZXgIebK+oXAzOj8Fd5kULKvi9Lvg5psAbXKvdqD/bp
 Wd330Q2gExdn3RcCmTHPd+/0h6T9LeYaMvdPLrrbRFm5XLFdqRJ+bbgzeRZF6ayvMp09
 ZZ30edcOuNkd9OW1uvfGb6rISI5HGKkVfa207Lc154fx0GrB5/kQZSniCXCJFBqZUxK4
 fo0PFzohR7OAg7mmhsf0mCFI6EpmhnPvMXMvLVTdawj9CxfOLptU/lt0wQsneRzBvXfr
 1YalorLNVXRZStDWXXw/54Bfv2Gp3prQH0w/qKS5pxBfLWiOPh3QwHDMDPLX6eLzT6XM
 boCw==
X-Forwarded-Encrypted: i=1;
 AJvYcCUnwFG8gGeXIvjv7SQ1qj4Zzxfa5s7y/z8CHLduRevJQgjT8dCvtJ2z/dFLmW8T7LfcNx9ERxu9F9/bvpg/gcoSlfHRveoifNkrKerR+zz58/2q+jZ3SQ==
X-Gm-Message-State: AOJu0Yw7AIvqMpv2PWaPbe/e9eUVuGY8k2Uqu/4i6BmQ8eOb6zdl+Ijp
 /HI/HX3DaVHSW1XPlw8j1hkvaFNFjN9W0hyuT2tCGmncKzh5FKR6
X-Google-Smtp-Source: AGHT+IFW3W85BONrKtua73JEpUlNUnM0AJHEdGsV1qPTe08O6+wHY1sVAFgjb3rFc25HUMnNh6gW6g==
X-Received: by 2002:a17:90b:1881:b0:297:2748:3a0b with SMTP id
 mn1-20020a17090b188100b0029727483a0bmr144667pjb.44.1707845896405; 
 Tue, 13 Feb 2024 09:38:16 -0800 (PST)
X-Forwarded-Encrypted: i=1;
 AJvYcCX6V7Ro+C296FFuXGiC612aVz9WWS1Ry0aaZwCBOUaZLpQuhQiuvzDwAuYlSpUFkwY/RCLyJzCk1kegA0Z6NQ5PCI+3pToXjgETVYRLhxy0yE2sESy7xK0duaSBHRE050nW61lCUD3u/iX+NQ0JDQH+wiBxf84x30ioBGPtbEjFhSNrEg==
Received: from daehojeong-desktop.mtv.corp.google.com
 ([2620:0:1000:8411:1deb:64bb:dfd3:ad56])
 by smtp.gmail.com with ESMTPSA id
 a18-20020a17090acb9200b00298cc2b7e94sm198137pju.34.2024.02.13.09.38.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 13 Feb 2024 09:38:16 -0800 (PST)
From: Daeho Jeong <daeho43@gmail.com>
To: linux-kernel@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net,
 kernel-team@android.com
Date: Tue, 13 Feb 2024 09:38:11 -0800
Message-ID: <20240213173812.1432663-1-daeho43@gmail.com>
X-Mailer: git-send-email 2.43.0.687.g38aa6559b0-goog
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
 0.0 FREEMAIL_FROM          Sender email is commonly abused enduser mail
 provider [daeho43[at]gmail.com]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 0.2 FREEMAIL_ENVFROM_END_DIGIT Envelope-from freemail username ends
 in digit [daeho43[at]gmail.com]
 0.0 RCVD_IN_MSPIKE_H3      RBL: Good reputation (+3)
 [209.85.216.49 listed in wl.mailspike.net]
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
 no trust [209.85.216.49 listed in list.dnswl.org]
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid -0.0 T_SCC_BODY_TEXT_LINE   No description available.
 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
X-Headers-End: 1rZwjd-0003ju-Jb
Subject: [f2fs-dev] [PATCH v3 1/2] f2fs: separate f2fs_gc_range() to use GC
 for a range
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
index 8a9cdc5a72c5..a089a938355b 100644
--- a/fs/f2fs/gc.c
+++ b/fs/f2fs/gc.c
@@ -1961,10 +1961,34 @@ void f2fs_build_gc_manager(struct f2fs_sb_info *sbi)
 	init_atgc_management(sbi);
 }
 
+static int f2fs_gc_range(struct f2fs_sb_info *sbi,
+		unsigned int start_seg, unsigned int end_seg, bool dry_run)
+{
+	unsigned int segno;
+
+	for (segno = start_seg; segno <= end_seg; segno += SEGS_PER_SEC(sbi)) {
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
@@ -1990,25 +2014,8 @@ static int free_segment_range(struct f2fs_sb_info *sbi,
 		f2fs_allocate_segment_for_resize(sbi, type, start, end);
 
 	/* do GC to move out valid blocks in the range */
-	for (segno = start; segno <= end; segno += SEGS_PER_SEC(sbi)) {
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
2.43.0.687.g38aa6559b0-goog



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
