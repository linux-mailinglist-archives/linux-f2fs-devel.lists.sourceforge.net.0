Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id A3EF7AD0891
	for <lists+linux-f2fs-devel@lfdr.de>; Fri,  6 Jun 2025 21:20:42 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Subject:MIME-Version:Message-ID:Date:To:From:Sender:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=2YA9cMiU56XmdcxQcevn6kiUlD3jCEHE5VUKf8cIviI=; b=WJT4gV3NKYVZtGgrAmDnJjqsOo
	9i3oNN+4TiL5KYVHi+KeONQoFew7ZQjRmUXNnArXNrdh7b56UyNl8b8zJ0um5Om+FK9RCy8aUHHFJ
	rMcZMUHh9PLQGnw3wL/ePIISDelM9MzBdwdwMLpYDt55TNxV36jEa5ztXLpLiZQ7xW9A=;
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1uNccE-0005X3-Aq;
	Fri, 06 Jun 2025 19:20:34 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <daeho43@gmail.com>) id 1uNccD-0005Wx-ED
 for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 06 Jun 2025 19:20:33 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:Message-ID:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=9UTDZ1/hHZs0bK8G0qVizEGkzLroiiZ6qFk6RdyLfRk=; b=kPd4dIUs+brgka4r/gnHWkmkZv
 xGRQ02lBFQAJIFHw0E4BpIgkxceLLZf69HOLaHMTZ+0gxzLXOJ0/+xXEWM660a82/Xf/C9t+yzaD/
 AX3J6WPnLCTWY81V1jvFBd6AH7hmx9jgoCz/bhSj3pahXyS3om4Fj1kGc58qFj3L8haA=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:Cc:To:From
 :Sender:Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=9UTDZ1/hHZs0bK8G0qVizEGkzLroiiZ6qFk6RdyLfRk=; b=M
 H0o2Mm1b9dsBSJKCZ5ev1jG3SPPSMnk6Ldsb07lT5S1O0Q9uEo+YxkRkgp/SYI/rYlk/5/jEkTS0A
 vi+sp4W36RmviWi1tDIyU/8klyc1nX/VzHb35FHgVEivLwn3+P1SLE/O3y2qIIfxVKo7mCBZJfKtm
 y8ZWJiGcNc/mVrfo=;
Received: from mail-pl1-f175.google.com ([209.85.214.175])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1uNccD-00045h-0M for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 06 Jun 2025 19:20:33 +0000
Received: by mail-pl1-f175.google.com with SMTP id
 d9443c01a7336-235f9ea8d08so17740715ad.1
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Fri, 06 Jun 2025 12:20:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1749237622; x=1749842422; darn=lists.sourceforge.net;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=9UTDZ1/hHZs0bK8G0qVizEGkzLroiiZ6qFk6RdyLfRk=;
 b=DQn+DsGePR2W0+j7T5/Lc5UDH+3T5wBLEe0KCDroa6EzgD3eNmIu8MKCW9yI7szyWK
 I/XDYwy7cxEf+p0c4okcsnBm9L83HF5DtXT5YTjhiid7QuVCGPH3mBK8qZadOmvbGmg5
 wmrWaq/bY/J2kf5h+jf6+0UNt3P5DRS7eTDnMq80fhD4XvVUvccgjnVCHPP4CpQ92EBq
 K/8YxorXKKw5pSQQSGYMfdiOrCPE6n39rJaEshLe4fYt5HB8uxqcFEjucPVDAm/2SBae
 32vymWpGCN591VhL8mc0jQ6gW1kYRD33JStWJjQVUZssEfW57Z0IxZG0++Na+uIUiDJ0
 ltSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1749237622; x=1749842422;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=9UTDZ1/hHZs0bK8G0qVizEGkzLroiiZ6qFk6RdyLfRk=;
 b=TVlmy20jyVNLbvNfW5ccRSzJRYFGqWaGKYmx5EsYDuuc1f4l9kjn6ecVRMNLCcMo0N
 io4DOaB/9KCIc1o5qHUacnNl5yKNnz5G0hNYwDE+WXo6ixC4S8vR0Eepbsi2Z2MnMSS1
 uA554EiZyuc9zMVfF4rroTbKVahI1OkrYGge3MoIYwBgSXMctvrTjTJ8+nhw0V+41Z0d
 kq9sDjyE5Sux/BiW3aYUDbsqwaEPSl7EN/aXQmrQw4YhU9r4+vWbtI5K2tlTLtIK250F
 7RxzNuifl6kn/EdnNx6N9AKwGPSH3mb+q9DPS+KQhaNf/spR2NMzGFjkneVvKSVNOKnD
 e9Mw==
X-Forwarded-Encrypted: i=1;
 AJvYcCWdHP41UIBpigJ1baSbviJUScR2jGSN+u6HyQDkVG6040fi7+YSxQgiWAMjlMP25v4m21Q+MVTAViBkuWWZKlob@lists.sourceforge.net
X-Gm-Message-State: AOJu0YyaUbR44V91M09GDcTWOIu8DGiT7ZQjWXO1wMZ1/fjL1nwJ2EWi
 0a4jYwW8JXiDPgutdY5d+2077xXDGdkTfA7lROU6ahep8KAzaUdpanEr9CuT0w==
X-Gm-Gg: ASbGncv5sQGB9zRNsMk5Y/tYcM9kX6WuGv+g0GXtEhpQVlgyh0Fipjky+mCEk9JmVKG
 8uqVJ48+FeVRbw2f1ebXI2dnyhVLsSWTs0kg44ZvHQXE7zoV2+9Bdl+k7YwHJGJSVhmIf33mbIH
 SHf+//ziYOTb2yqyyWbe7X59ZFhNhc/2UJpJ7RcGkMX4T63mV4ffRf9CWCvoOCF1vzXKyFV32fG
 +WD8WKnZzf0suaDzoO02ge+4uslQx9nOPlVRiIbRtHq+triKBgnNC2aDomd3Rbw0/qLz0k63bnh
 SZs/BK+nrjePuhbDVh0Evgz5F5zCEv5AZ6OmKTudgSRMz12jYJfMwFdhm5mlIT24nBMpItv1KbJ
 rjosOk9WL8UaG/0ekOKITBijVKxUhT8O34lzPwgYgew==
X-Google-Smtp-Source: AGHT+IH5bV7+H+EmGUIjzHVg3caXPHPiAR5sjZ1TOPIyhwE5ycPXN4xBytDNmBZxOwGLuFBA5Haj8Q==
X-Received: by 2002:a17:902:f603:b0:235:f298:cbbe with SMTP id
 d9443c01a7336-23601e44b41mr70110995ad.12.1749237622054; 
 Fri, 06 Jun 2025 12:20:22 -0700 (PDT)
Received: from daehojeong-desktop.mtv.corp.google.com
 ([2a00:79e0:2e14:7:d02c:e22:e5a4:2f84])
 by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-3132ad9a4aasm2962217a91.1.2025.06.06.12.20.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 06 Jun 2025 12:20:21 -0700 (PDT)
From: Daeho Jeong <daeho43@gmail.com>
To: linux-kernel@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net,
 kernel-team@android.com
Date: Fri,  6 Jun 2025 12:20:17 -0700
Message-ID: <20250606192017.439733-1-daeho43@gmail.com>
X-Mailer: git-send-email 2.50.0.rc0.604.gd4ff7b7c86-goog
MIME-Version: 1.0
X-Spam-Score: 0.1 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-1.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  From: Daeho Jeong Add a sysfs knob to set a multiplier for
 the background GC migration window when F2FS Garbage Collection is boosted.
 Signed-off-by: Daeho Jeong --- Documentation/ABI/testing/sysfs-fs-f2fs |
 8 ++++++++ fs/f2fs/gc.c | 3 ++- fs/f2fs/gc.h | 1 + fs/f2fs/sysfs.c | 2 ++
 4 files changed, 13 insertions(+), 1 deletion(-) 
 Content analysis details:   (0.1 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 0.2 FREEMAIL_ENVFROM_END_DIGIT Envelope-from freemail username ends in
 digit [daeho43(at)gmail.com]
 0.0 FREEMAIL_FROM Sender email is commonly abused enduser mail provider
 [daeho43(at)gmail.com]
 0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [209.85.214.175 listed in wl.mailspike.net]
X-Headers-End: 1uNccD-00045h-0M
Subject: [f2fs-dev] [PATCH] f2fs: add gc_boost_gc_multiple sysfs node
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

Add a sysfs knob to set a multiplier for the background GC migration
window when F2FS Garbage Collection is boosted.

Signed-off-by: Daeho Jeong <daehojeong@google.com>
---
 Documentation/ABI/testing/sysfs-fs-f2fs | 8 ++++++++
 fs/f2fs/gc.c                            | 3 ++-
 fs/f2fs/gc.h                            | 1 +
 fs/f2fs/sysfs.c                         | 2 ++
 4 files changed, 13 insertions(+), 1 deletion(-)

diff --git a/Documentation/ABI/testing/sysfs-fs-f2fs b/Documentation/ABI/testing/sysfs-fs-f2fs
index bf03263b9f46..931c1f63aa2e 100644
--- a/Documentation/ABI/testing/sysfs-fs-f2fs
+++ b/Documentation/ABI/testing/sysfs-fs-f2fs
@@ -861,3 +861,11 @@ Description:	This is a read-only entry to show the value of sb.s_encoding_flags,
 		SB_ENC_STRICT_MODE_FL            0x00000001
 		SB_ENC_NO_COMPAT_FALLBACK_FL     0x00000002
 		============================     ==========
+
+What:		/sys/fs/f2fs/<disk>/gc_boost_gc_multiple
+Date:		June 2025
+Contact:	"Daeho Jeong" <daehojeong@google.com>
+Description:	Set a multiplier for the background GC migration window when F2FS GC is
+		boosted.
+		Default: 5
+
diff --git a/fs/f2fs/gc.c b/fs/f2fs/gc.c
index 3cb5242f4ddf..de7e59bc0906 100644
--- a/fs/f2fs/gc.c
+++ b/fs/f2fs/gc.c
@@ -197,6 +197,7 @@ int f2fs_start_gc_thread(struct f2fs_sb_info *sbi)
 
 	gc_th->urgent_sleep_time = DEF_GC_THREAD_URGENT_SLEEP_TIME;
 	gc_th->valid_thresh_ratio = DEF_GC_THREAD_VALID_THRESH_RATIO;
+	gc_th->boost_gc_multiple = BOOST_GC_MULTIPLE;
 
 	if (f2fs_sb_has_blkzoned(sbi)) {
 		gc_th->min_sleep_time = DEF_GC_THREAD_MIN_SLEEP_TIME_ZONED;
@@ -1749,7 +1750,7 @@ static int do_garbage_collect(struct f2fs_sb_info *sbi,
 					!has_enough_free_blocks(sbi,
 					sbi->gc_thread->boost_zoned_gc_percent))
 				window_granularity *=
-					BOOST_GC_MULTIPLE;
+					sbi->gc_thread->boost_gc_multiple;
 
 			end_segno = start_segno + window_granularity;
 		}
diff --git a/fs/f2fs/gc.h b/fs/f2fs/gc.h
index 5c1eaf55e127..efa1968810a0 100644
--- a/fs/f2fs/gc.h
+++ b/fs/f2fs/gc.h
@@ -68,6 +68,7 @@ struct f2fs_gc_kthread {
 	unsigned int no_zoned_gc_percent;
 	unsigned int boost_zoned_gc_percent;
 	unsigned int valid_thresh_ratio;
+	unsigned int boost_gc_multiple;
 };
 
 struct gc_inode_list {
diff --git a/fs/f2fs/sysfs.c b/fs/f2fs/sysfs.c
index 75134d69a0bd..b0270b1c939c 100644
--- a/fs/f2fs/sysfs.c
+++ b/fs/f2fs/sysfs.c
@@ -1050,6 +1050,7 @@ GC_THREAD_RW_ATTR(gc_no_gc_sleep_time, no_gc_sleep_time);
 GC_THREAD_RW_ATTR(gc_no_zoned_gc_percent, no_zoned_gc_percent);
 GC_THREAD_RW_ATTR(gc_boost_zoned_gc_percent, boost_zoned_gc_percent);
 GC_THREAD_RW_ATTR(gc_valid_thresh_ratio, valid_thresh_ratio);
+GC_THREAD_RW_ATTR(gc_boost_gc_multiple, boost_gc_multiple);
 
 /* SM_INFO ATTR */
 SM_INFO_RW_ATTR(reclaim_segments, rec_prefree_segments);
@@ -1220,6 +1221,7 @@ static struct attribute *f2fs_attrs[] = {
 	ATTR_LIST(gc_no_zoned_gc_percent),
 	ATTR_LIST(gc_boost_zoned_gc_percent),
 	ATTR_LIST(gc_valid_thresh_ratio),
+	ATTR_LIST(gc_boost_gc_multiple),
 	ATTR_LIST(gc_idle),
 	ATTR_LIST(gc_urgent),
 	ATTR_LIST(reclaim_segments),
-- 
2.50.0.rc0.604.gd4ff7b7c86-goog



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
