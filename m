Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 50DC5AD0889
	for <lists+linux-f2fs-devel@lfdr.de>; Fri,  6 Jun 2025 21:15:59 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Subject:MIME-Version:Message-ID:Date:To:From:Sender:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=KWTH2gZKKZocoi2qeBVYTvhZD3UaTzcdIKP/XwZWfPM=; b=c4httm/4ZWAA337HTq9hUbNBi6
	8mpDFlecJSDeihK5nGFfVZo+gqlFP3SFgo7BUpfrjarrIf7G6KY5uhLg442TEREhgmmR/g6vy3sSY
	yaCFDUbvoxFTjys/1QIMSwXjCIVD1SkUezhycNaHSZKEY/0OyaKobT0qxhCuEsrmjbsQ=;
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1uNcXh-0004eu-AB;
	Fri, 06 Jun 2025 19:15:53 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <daeho43@gmail.com>) id 1uNcXg-0004en-2V
 for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 06 Jun 2025 19:15:52 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:Message-ID:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=wjMIOt/LXFQebzmgX0Ga8a/wOAlhCkmqYvTYDXKBEUY=; b=P9yt1q4X9LMC0LriTDS3xnNhyH
 2Ngyr0k8cW2erd9Gd0aLrZ/3NEukrZ8Qfpj6o72KTi5lEgiPl4pweeF0H6J3j79TsyvY7DwBhUeyA
 pY1nkaJGfDVjVsCFsRZDb4lIhIcazNvMYq0EO7FFU8UqkBYLX0PmnP7M5td5+JSBWS10=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:Cc:To:From
 :Sender:Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=wjMIOt/LXFQebzmgX0Ga8a/wOAlhCkmqYvTYDXKBEUY=; b=F
 LUbIh43hopOMTYExHuAaYly8wGx/UQOBEW+BZI1+RVNKH594KkX4YuKJNYuBhivpgoB8zYYxfe8Bn
 PtIKRI9La6ChMIhcWuZUtkzJR6OuC5NeC0K4WcZ3i5+ffF45FM2e54g3OCai2XJjkjBWy/zFkPhVh
 xkVnCXPxwnUckMNg=;
Received: from mail-pf1-f179.google.com ([209.85.210.179])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1uNcXf-0003py-LA for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 06 Jun 2025 19:15:51 +0000
Received: by mail-pf1-f179.google.com with SMTP id
 d2e1a72fcca58-7425bd5a83aso2265523b3a.0
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Fri, 06 Jun 2025 12:15:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1749237341; x=1749842141; darn=lists.sourceforge.net;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=wjMIOt/LXFQebzmgX0Ga8a/wOAlhCkmqYvTYDXKBEUY=;
 b=CirDfvpvA1oraFojEZCDIn0Y1SUuIBzvAg/L9u84a0KHXeBB9UgyyIO3kuQ7oL25/D
 nuQUei8oyMNp6tomz2VWlsJqTjJ0wN2HKP9Jt4FatDUvU2a2sjKzziFbsq4aACMTsAuf
 uc/fwYGCii6UGOyIbKHNSjxm+n5zNZ239kcV19NEiDHFIXP0KSQajacKzD0GyTyxAoO2
 2rr/zdgAaXfIfbtWJxcceS9kt27XYqxY016az/YxCxFqUxFSdtiw2fK5GC29UsWJkrQQ
 UoTPK7Bw6xpcraZQ97p5E/23fhNE3J+4Fd+y91NCmSOPNdalXwk4m8ejACwo+qE+jCe6
 nk6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1749237341; x=1749842141;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=wjMIOt/LXFQebzmgX0Ga8a/wOAlhCkmqYvTYDXKBEUY=;
 b=dDqdaYVghWRcILt7JrEPDrhW94ZTjraHH4mMIji7mTzCiOrbumWM8JrJMv0QNSnWRy
 GXF40ZMYVlFUA+sjAjehMLyqH1cQAQCPPWTach0jVegOO8VJ26jhXEjAeqlfepY3OIXm
 QlBmhsGrH17e48+p3Trs7M4ZQNZgsJveA86bc3FPXoOLmH6t2C4JO2bKHCrHcAElHF/3
 QbCxG4fhV3YXTjvCdnrf0HLHBjlKIwbvvxgZhxMT4W8cK2Q0ZW3aCpmxm/VIFGDpPqfU
 ksfIWPtOzzzI6iRRhwx2N1Xs9QNepkNC1rG1atpXvqU1YopnxIvisQtJ37bBr0RvIPnn
 fWeA==
X-Forwarded-Encrypted: i=1;
 AJvYcCU6X+7tVYhIrWqbcjr6xpuHhtRJ/TwJ9Kfz5Qzz17LmLImOZqPacH+qGysRO31lfWbZatTbRhVbAubq7MKol0OM@lists.sourceforge.net
X-Gm-Message-State: AOJu0Yy5JgtGLyilRu2YVsr0qKT3i5mpzh3e8isYwPyeyJL2RGR3hTJB
 V4XxQRd2PFWsnfdQACzCjTMdqrVM8GJjKK8P/tAUqkqudFfVTIbBBc80
X-Gm-Gg: ASbGncunbOiN1RG+YECNS7p4RPtoQx9jHW0YzsWn1UWM+SMvNjxRudaWqNAd7J9Zs1n
 0JguwxCRBCcKJ0oyYSNqEpSoqN55D6NxpN9iJke0Q10gTmBx71C5nVOElqohGpuY8m96KD+kEPj
 NsxT3mogBzXC3JAd3nKWr69sYZUhLrX6sU9/rmVMnPRupRwGuk6pAg6IIWRRA5bU9xhSx/Br87f
 KVDtKZJ9++vLqcAnwLiOoK0MMCGC1Kc9aQ6CsG7kgczRMxAgwhoLEUUCmPC52cWcmwla9systXL
 ze1RKwNcjEZ4f3nX5Nn3v5I42JNJ8N7t+qY4nLTOoZylyPXXv7JCkP+ZcsUm+SDa2cnEKjs/WfR
 AJtpjz88fMCm0RvWBHo5G1lPlUMkWe3WyP43RWgVt5dYwYlqQqKvf
X-Google-Smtp-Source: AGHT+IHsnz+YKTH4F0OOvHcKBTY/iymvbEjaxdXetM6ww7FFyxe3sRF6r6KB+AZkKu0uhD4foJUewQ==
X-Received: by 2002:a05:6a21:b8f:b0:218:bb70:bd23 with SMTP id
 adf61e73a8af0-21ee31c1655mr5218493637.42.1749237340835; 
 Fri, 06 Jun 2025 12:15:40 -0700 (PDT)
Received: from daehojeong-desktop.mtv.corp.google.com
 ([2a00:79e0:2e14:7:d02c:e22:e5a4:2f84])
 by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-7482af7b606sm1680804b3a.67.2025.06.06.12.15.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 06 Jun 2025 12:15:40 -0700 (PDT)
From: Daeho Jeong <daeho43@gmail.com>
To: linux-kernel@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net,
 kernel-team@android.com
Date: Fri,  6 Jun 2025 12:15:34 -0700
Message-ID: <20250606191534.438670-1-daeho43@gmail.com>
X-Mailer: git-send-email 2.50.0.rc0.604.gd4ff7b7c86-goog
MIME-Version: 1.0
X-Spam-Score: 0.1 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-2.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  From: Daeho Jeong Add a sysfs knob to set a multiplier for
 the background GC migration window when F2FS Garbage Collection is boosted.
 Signed-off-by: Daeho Jeong --- Documentation/ABI/testing/sysfs-fs-f2fs |
 7 +++++++ fs/f2fs/gc.c | 3 ++- fs/f2fs/gc.h | 1 + fs/f2fs/sysfs.c | 2 ++ 4
 files changed, 12 insertions(+), 1 deletion(-) 
 Content analysis details:   (0.1 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.0 FREEMAIL_FROM Sender email is commonly abused enduser mail provider
 [daeho43(at)gmail.com]
 0.2 FREEMAIL_ENVFROM_END_DIGIT Envelope-from freemail username ends in
 digit [daeho43(at)gmail.com]
 0.0 RCVD_IN_MSPIKE_H3      RBL: Good reputation (+3)
 [209.85.210.179 listed in wl.mailspike.net]
 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
X-Headers-End: 1uNcXf-0003py-LA
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
 Documentation/ABI/testing/sysfs-fs-f2fs | 7 +++++++
 fs/f2fs/gc.c                            | 3 ++-
 fs/f2fs/gc.h                            | 1 +
 fs/f2fs/sysfs.c                         | 2 ++
 4 files changed, 12 insertions(+), 1 deletion(-)

diff --git a/Documentation/ABI/testing/sysfs-fs-f2fs b/Documentation/ABI/testing/sysfs-fs-f2fs
index bf03263b9f46..0f343cb5cc17 100644
--- a/Documentation/ABI/testing/sysfs-fs-f2fs
+++ b/Documentation/ABI/testing/sysfs-fs-f2fs
@@ -861,3 +861,10 @@ Description:	This is a read-only entry to show the value of sb.s_encoding_flags,
 		SB_ENC_STRICT_MODE_FL            0x00000001
 		SB_ENC_NO_COMPAT_FALLBACK_FL     0x00000002
 		============================     ==========
+
+What:		/sys/fs/f2fs/<disk>/gc_boost_gc_multiple
+Date:		June 2025
+Contact:	"Daeho Jeong" <daehojeong@google.com>
+Description:	Set a multiplier for the background GC migration window when F2FS GC is
+		boosted.
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
