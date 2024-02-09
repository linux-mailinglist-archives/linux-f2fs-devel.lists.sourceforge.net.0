Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 54A8084EEF5
	for <lists+linux-f2fs-devel@lfdr.de>; Fri,  9 Feb 2024 03:43:15 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1rYGr3-0006HF-AC;
	Fri, 09 Feb 2024 02:43:06 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <daeho43@gmail.com>) id 1rYGr2-0006H9-7L
 for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 09 Feb 2024 02:43:05 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:Message-ID:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=vBDyj3Iv7QB4U+Y1PAOul+HNZzqp+6gSDSC9V0g8NJY=; b=D1Qj23pVonWnuFroazVn8eR563
 +vVoDMoFW57nWVIQ8z8J51rz23Wt2JvOx02Hz29IyOEZc0bRPEfjj6AHaZPysbPFpWX7MnQdbdAsi
 NWPeBFzkTg0ijFRPNimVZFI0b7U7MNdS1YfMzGlJxIQ5sRKxIALQG2JHVaHSzEpd6dW4=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:Cc:To:From
 :Sender:Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=vBDyj3Iv7QB4U+Y1PAOul+HNZzqp+6gSDSC9V0g8NJY=; b=E
 at0/dTN6AVwo3TBw1DsBaNS4ocp63hrRpUg5xh2O4AXOicNrFMys6v7IGLr88RVd8fxtiv1Ahbhk/
 s13Bs0q0Fpfw/QCt1aypM1V4VkaEJJNP/9gNmqy49NgtftD50qAS4CDJhorhSn/rqc8Zz+TzXXHzP
 WLj51emup+pZbvhs=;
Received: from mail-pf1-f173.google.com ([209.85.210.173])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1rYGqx-00089e-8E for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 09 Feb 2024 02:43:05 +0000
Received: by mail-pf1-f173.google.com with SMTP id
 d2e1a72fcca58-6e04ea51984so311688b3a.0
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Thu, 08 Feb 2024 18:42:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1707446574; x=1708051374; darn=lists.sourceforge.net;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=vBDyj3Iv7QB4U+Y1PAOul+HNZzqp+6gSDSC9V0g8NJY=;
 b=ZH9WkHJWGUez9h1YVnV29dSMpHSmXF9rg2PvroXQsIrPWF3oZhvNCho4/g+kz0CmTm
 GfTuaIuuY9RVhW6Do029IEPB8P7lWniN9jJPSMIJWCK7DhhtcVaLMODiaeM7rmMfvpxr
 FV3R6APrZAYzljcPnt2k+rZWNye60w5LhqCLopqQ6mbv2uRRpYWAUHvLGG5yQ8k3dN9A
 HweeFIyjzyEP4KON7wpUv5VTFeRFwZ/a343s/llG9hoUPQmYa3iVO0MXtNJ+WScMpJCF
 yn72bovRGMPiXYae5HqTVJRj/JIROm5eqAfnBRnozx9eCwBuFQUu6orzjCe0ka+ZO2So
 jnIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1707446574; x=1708051374;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=vBDyj3Iv7QB4U+Y1PAOul+HNZzqp+6gSDSC9V0g8NJY=;
 b=hiOq7pUg2XH/ckamtRX2Kc9HojCbbaDBkzHuVAnRWDzuFMcfE0YeYRoWO5KnxNuiLC
 9SpQKB9AwSxLPpMumJ2Y7sXkBlU04n06Zwzi2cuk2sSViNStZXnNDoR9SvfQcj+HvG5V
 1jdCF0MNpEzXkbPwoSuwrFq7urSZHbbWQb4DQ5oqxxu5SSq8wQTrq42XqfAsFkHnHGlp
 nAf2n7PzQfhMo8FPbEvUn58w8Cr+n7orQbGTbpueEGZGLXuFf7BIa4fdNjzlY1w9MXYI
 mNUAGL/otpNVAeUbQ490btpYOptYGHO/wb9qbu5fOZEi43Lkku4kCsGHLnuI1XltoxkH
 DSFQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCU38eRQrYJJGWMxq5behIX4AnsDPYcweyVygU4zxjP2vNHJjfqyBANReKiL8Kb6tpDQIcVwjNyFH3ow6Y+SnOXhK2V1cUgRFTZg+YLyB71U7k5nfZpZ/Q==
X-Gm-Message-State: AOJu0YxSwsymCONIa5x7mrsHJE4G79VifEz/6k+vnPaR/1JBYBL126UN
 DpcorJlx4Emo0ySQTMVFOrHACwvUjHM620b2NkdRrGQ9+S88yjZE
X-Google-Smtp-Source: AGHT+IHrDj9IlQkFHQtCcC/zy9KM2UXDK/Y87EJn1nmRW6+FzpCS2mU3H7Ljz+0IN9fVd8avLcqKbw==
X-Received: by 2002:a05:6a00:10c5:b0:6db:d040:4d05 with SMTP id
 d5-20020a056a0010c500b006dbd0404d05mr448678pfu.22.1707446574237; 
 Thu, 08 Feb 2024 18:42:54 -0800 (PST)
X-Forwarded-Encrypted: i=1;
 AJvYcCV+VsKHdVQvMC/78ocjiVjk/KLdMxA8f6hwUqQ/IjHhCJmRQlNHHD/WEV0r/2pERktgn2HAl/iFkpXo5P4jTEOGqpsvPqznpjb22+NhV8pjuWU6lpht6/oc1V5iKPpxgUXixjq2ls6VbbIHmE4YXzVjRbyMBs1648Sa5rv5Hf7WAUtEwQ==
Received: from daehojeong-desktop.mtv.corp.google.com
 ([2620:0:1000:8411:20e:63ed:be25:710f])
 by smtp.gmail.com with ESMTPSA id
 t28-20020a62d15c000000b006d9a7a48bbesm521505pfl.116.2024.02.08.18.42.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 08 Feb 2024 18:42:53 -0800 (PST)
From: Daeho Jeong <daeho43@gmail.com>
To: linux-kernel@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net,
 kernel-team@android.com
Date: Thu,  8 Feb 2024 18:42:25 -0800
Message-ID: <20240209024227.66741-1-daeho43@gmail.com>
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
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
 no trust [209.85.210.173 listed in list.dnswl.org]
 0.2 FREEMAIL_ENVFROM_END_DIGIT Envelope-from freemail username ends
 in digit [daeho43[at]gmail.com]
 0.0 FREEMAIL_FROM          Sender email is commonly abused enduser mail
 provider [daeho43[at]gmail.com]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 RCVD_IN_MSPIKE_H3      RBL: Good reputation (+3)
 [209.85.210.173 listed in wl.mailspike.net]
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
 -0.0 T_SCC_BODY_TEXT_LINE   No description available.
X-Headers-End: 1rYGqx-00089e-8E
Subject: [f2fs-dev] [PATCH v2 1/2] f2fs: separate f2fs_gc_range() to use GC
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
