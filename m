Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 6FE6446C4A8
	for <lists+linux-f2fs-devel@lfdr.de>; Tue,  7 Dec 2021 21:31:52 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.94.2)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1muh7r-0007gY-9x; Tue, 07 Dec 2021 20:31:47 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <daeho43@gmail.com>) id 1muh7q-0007gS-8e
 for linux-f2fs-devel@lists.sourceforge.net; Tue, 07 Dec 2021 20:31:46 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=luCWywBAHn4KEwu7iiwOCSMXii0Bh7YSDjhuOykugKw=; b=Nz47MJW4Zms2tNuUMoRSy7GaYW
 lq4iPyDgBXj3NfIw5C5Y4i3Wbordh9xDOqOhrGEeIe7ErjfUIY/7bmmGc6fezM51OX3XQbA/m1ePh
 orGSgiymJOS1QFsGwWBIko/8dE3ZSXieAc5wrb3WDXQZjNoYv2E368Cy+f09rkaBibSE=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:Message-Id:Date:Subject:Cc:To:From
 :Sender:Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=luCWywBAHn4KEwu7iiwOCSMXii0Bh7YSDjhuOykugKw=; b=b
 s9gRLupLeK/HvWwfS4yE8uMCksCkYTw6Sb5Rv6oJxczVwZnEL0Ll3MI2r4TEfIsN080fLOvk/n9d4
 Aw2IX7w9rDCKD3D65QB7IYt0JNChpZ5gr1TJmPTmwIVklYysc7ACDYO7wLa4G/85PtRK/a4fzCjl4
 Q35EQvuyeMHzzv20=;
Received: from mail-pg1-f178.google.com ([209.85.215.178])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.92.3)
 id 1muh7p-007vo8-GM
 for linux-f2fs-devel@lists.sourceforge.net; Tue, 07 Dec 2021 20:31:46 +0000
Received: by mail-pg1-f178.google.com with SMTP id 71so130925pgb.4
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Tue, 07 Dec 2021 12:31:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=luCWywBAHn4KEwu7iiwOCSMXii0Bh7YSDjhuOykugKw=;
 b=CvURTtI2uXrbQpKuCtkSBSvTlR/HvnYtp7VMF462MjuTgBrSQQRNAuooEcz6JxbAss
 rvUs7oST1Q3w9qVaVrwbyqLox5+Fl/Z25nbwVwz/gLLdn1JTgYyh48d+b+51UacSC4px
 8N9Vqd5JJ4ycimNnGT71EWf/+ClWb12GGserDGVxnehuz9d//Lfs2CbH1vJjNlothvLC
 UiYQ1qPRUVW//yqSa8X1z3SYuUs6P2PZ904I6941WkHOcARM8Y9Ezm2YEjkAZWvqV8DG
 uDaz7vyHF7SrX977dKYOmrYZVHJVd+tfUlqH2j6/T+uJWwlzFYIcaiztuAgp8CsEN6sP
 uIoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=luCWywBAHn4KEwu7iiwOCSMXii0Bh7YSDjhuOykugKw=;
 b=u0/0hYHNboW9PU8c5m3XzJSsh67LYQx5KaMQuvUs6aBMyypT8E5PZJTvQImkI4v+37
 EoMkmpAM8aitBrHrLSVRhB6lX2nJ7Pqm2ScEEehm5/fwhvAdbr23sE28UM5Bp1s2RkIn
 +eEGYyvT9WCIccIOkTp5MlEG4rzVN+qtZkpsQCKTzOmHAI0ihy/lLJbGcu37IfKKonpV
 sUnAVhm4yZCuFLSszsVlLJ2JMYGYmLEsUjS26VaK4avkIaI4XC0Am7WZjCnSyJF7D/0c
 6gnS2crTG1TaAtP/MhHJHhDWhDfWDmPnrdngFa6tuFc/YNr4LyrUX3yXK8ZiWvz190ak
 KgQg==
X-Gm-Message-State: AOAM531s6WTysCJiU5BzHpzWJUQOfg4QKfLL0DxLwicI8N4SYvBRPA7T
 M1SDlQxNQw7R7SR3/6EbNSs=
X-Google-Smtp-Source: ABdhPJxFhFc024NfnOU07kNguCdgE7a4kVv2gG0dcrUOmD2uNU41iEFXAWE+Jmstos87uxDVBzEc+A==
X-Received: by 2002:a62:1a03:0:b0:494:64b5:3e01 with SMTP id
 a3-20020a621a03000000b0049464b53e01mr1422017pfa.35.1638909099896; 
 Tue, 07 Dec 2021 12:31:39 -0800 (PST)
Received: from daehojeong-desktop.mtv.corp.google.com
 ([2620:15c:211:201:e554:7a45:5de:729a])
 by smtp.gmail.com with ESMTPSA id y6sm631072pfi.154.2021.12.07.12.31.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 07 Dec 2021 12:31:39 -0800 (PST)
From: Daeho Jeong <daeho43@gmail.com>
To: linux-kernel@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net,
 kernel-team@android.com
Date: Tue,  7 Dec 2021 12:31:36 -0800
Message-Id: <20211207203136.1498796-1-daeho43@gmail.com>
X-Mailer: git-send-email 2.34.1.400.ga245620fadb-goog
MIME-Version: 1.0
X-Spam-Score: 0.1 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: From: Daeho Jeong Added a new sysfs node called
 gc_urgent_high_remaining.
 The user can set the trial count limit for GC urgent high mode with this
 value. If GC thread gets to the limit, the mode will turn back to GC no [...]
 Content analysis details:   (0.1 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
 no trust [209.85.215.178 listed in list.dnswl.org]
 0.0 RCVD_IN_MSPIKE_H3      RBL: Good reputation (+3)
 [209.85.215.178 listed in wl.mailspike.net]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.2 FREEMAIL_ENVFROM_END_DIGIT Envelope-from freemail username ends
 in digit [daeho43[at]gmail.com]
 0.0 FREEMAIL_FROM          Sender email is commonly abused enduser mail
 provider [daeho43[at]gmail.com]
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
X-Headers-End: 1muh7p-007vo8-GM
Subject: [f2fs-dev] [PATCH] f2fs: add gc_urgent_high_remaining sysfs node
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

Added a new sysfs node called gc_urgent_high_remaining. The user can
set the trial count limit for GC urgent high mode with this value. If
GC thread gets to the limit, the mode will turn back to GC normal mode.
By default, the value is zero, which means there is no limit like before.

Signed-off-by: Daeho Jeong <daehojeong@google.com>
---
 Documentation/ABI/testing/sysfs-fs-f2fs |  7 +++++++
 fs/f2fs/f2fs.h                          |  3 +++
 fs/f2fs/gc.c                            | 12 ++++++++++++
 fs/f2fs/super.c                         |  1 +
 fs/f2fs/sysfs.c                         | 14 ++++++++++++++
 5 files changed, 37 insertions(+)

diff --git a/Documentation/ABI/testing/sysfs-fs-f2fs b/Documentation/ABI/testing/sysfs-fs-f2fs
index 9f3c355bb70e..2416b03ff283 100644
--- a/Documentation/ABI/testing/sysfs-fs-f2fs
+++ b/Documentation/ABI/testing/sysfs-fs-f2fs
@@ -533,3 +533,10 @@ Description:	With "mode=fragment:block" mount options, we can scatter block allo
 		f2fs will allocate 1..<max_fragment_chunk> blocks in a chunk and make a hole
 		in the length of 1..<max_fragment_hole> by turns. This value can be set
 		between 1..512 and the default value is 4.
+
+What:		/sys/fs/f2fs/<disk>/gc_urgent_high_remaining
+Date:		December 2021
+Contact:	"Daeho Jeong" <daehojeong@google.com>
+Description:	You can set the trial count limit for GC urgent high mode with this value.
+		If GC thread gets to the limit, the mode will turn back to GC normal mode.
+		By default, the value is zero, which means there is no limit like before.
diff --git a/fs/f2fs/f2fs.h b/fs/f2fs/f2fs.h
index cbc73bd71dad..5da592286721 100644
--- a/fs/f2fs/f2fs.h
+++ b/fs/f2fs/f2fs.h
@@ -1683,6 +1683,9 @@ struct f2fs_sb_info {
 	unsigned int cur_victim_sec;		/* current victim section num */
 	unsigned int gc_mode;			/* current GC state */
 	unsigned int next_victim_seg[2];	/* next segment in victim section */
+	spinlock_t gc_urgent_high_lock;
+	bool gc_urgent_high_limited;		/* indicates having limited trial count */
+	unsigned int gc_urgent_high_remaining;	/* remaining trial count for GC_URGENT_HIGH */
 
 	/* for skip statistic */
 	unsigned int atomic_files;		/* # of opened atomic file */
diff --git a/fs/f2fs/gc.c b/fs/f2fs/gc.c
index a946ce0ead34..bd4fb896b644 100644
--- a/fs/f2fs/gc.c
+++ b/fs/f2fs/gc.c
@@ -92,6 +92,18 @@ static int gc_thread_func(void *data)
 		 * So, I'd like to wait some time to collect dirty segments.
 		 */
 		if (sbi->gc_mode == GC_URGENT_HIGH) {
+			spin_lock(&sbi->gc_urgent_high_lock);
+			if (sbi->gc_urgent_high_limited) {
+				if (!sbi->gc_urgent_high_remaining) {
+					sbi->gc_urgent_high_limited = false;
+					spin_unlock(&sbi->gc_urgent_high_lock);
+					sbi->gc_mode = GC_NORMAL;
+					continue;
+				}
+				sbi->gc_urgent_high_remaining--;
+			}
+			spin_unlock(&sbi->gc_urgent_high_lock);
+
 			wait_ms = gc_th->urgent_sleep_time;
 			down_write(&sbi->gc_lock);
 			goto do_gc;
diff --git a/fs/f2fs/super.c b/fs/f2fs/super.c
index 040b6d02e1d8..9acd76ea09ca 100644
--- a/fs/f2fs/super.c
+++ b/fs/f2fs/super.c
@@ -3548,6 +3548,7 @@ static void init_sb_info(struct f2fs_sb_info *sbi)
 	sbi->seq_file_ra_mul = MIN_RA_MUL;
 	sbi->max_fragment_chunk = DEF_FRAGMENT_SIZE;
 	sbi->max_fragment_hole = DEF_FRAGMENT_SIZE;
+	spin_lock_init(&sbi->gc_urgent_high_lock);
 
 	sbi->dir_level = DEF_DIR_LEVEL;
 	sbi->interval_time[CP_TIME] = DEF_CP_INTERVAL;
diff --git a/fs/f2fs/sysfs.c b/fs/f2fs/sysfs.c
index 47c950f65b6f..e2c58d80b20c 100644
--- a/fs/f2fs/sysfs.c
+++ b/fs/f2fs/sysfs.c
@@ -487,6 +487,18 @@ static ssize_t __sbi_store(struct f2fs_attr *a,
 		return count;
 	}
 
+	if (!strcmp(a->attr.name, "gc_urgent_high_remaining")) {
+		if (t < 0)
+			return -EINVAL;
+
+		spin_lock(&sbi->gc_urgent_high_lock);
+		sbi->gc_urgent_high_limited = t == 0 ? false : true;
+		sbi->gc_urgent_high_remaining = t;
+		spin_unlock(&sbi->gc_urgent_high_lock);
+
+		return count;
+	}
+
 #ifdef CONFIG_F2FS_IOSTAT
 	if (!strcmp(a->attr.name, "iostat_enable")) {
 		sbi->iostat_enable = !!t;
@@ -742,6 +754,7 @@ F2FS_RW_ATTR(FAULT_INFO_TYPE, f2fs_fault_info, inject_type, inject_type);
 #endif
 F2FS_RW_ATTR(F2FS_SBI, f2fs_sb_info, data_io_flag, data_io_flag);
 F2FS_RW_ATTR(F2FS_SBI, f2fs_sb_info, node_io_flag, node_io_flag);
+F2FS_RW_ATTR(F2FS_SBI, f2fs_sb_info, gc_urgent_high_remaining, gc_urgent_high_remaining);
 F2FS_RW_ATTR(CPRC_INFO, ckpt_req_control, ckpt_thread_ioprio, ckpt_thread_ioprio);
 F2FS_GENERAL_RO_ATTR(dirty_segments);
 F2FS_GENERAL_RO_ATTR(free_segments);
@@ -855,6 +868,7 @@ static struct attribute *f2fs_attrs[] = {
 #endif
 	ATTR_LIST(data_io_flag),
 	ATTR_LIST(node_io_flag),
+	ATTR_LIST(gc_urgent_high_remaining),
 	ATTR_LIST(ckpt_thread_ioprio),
 	ATTR_LIST(dirty_segments),
 	ATTR_LIST(free_segments),
-- 
2.34.1.400.ga245620fadb-goog



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
