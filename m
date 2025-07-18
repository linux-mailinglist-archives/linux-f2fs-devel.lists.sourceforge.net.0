Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id CCDF2B0ABB5
	for <lists+linux-f2fs-devel@lfdr.de>; Fri, 18 Jul 2025 23:40:40 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Subject:MIME-Version:Message-ID:Date:To:From:Sender:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=iwcl+nPbRzOjVJS+WI1nnyT/5e3T17s6GbgtOPG3JLk=; b=b4g3auc9l4Lrb51OxjAk4BSw2l
	uNJf4wNYGX4wu0ziy3i0l4hwdJe5Ca3MZTFYg7JK/BeBu4co9HPf8A3Q68KQcNJ7fAhCG5FYeWQ7R
	Ydu91aQaeTXWkiE5tJTvoU+y8kiuamz6ysWIZjiuuhUZsfdfuRxmgbK8kzRodFjBzdZA=;
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1ucsoj-0008Bq-LS;
	Fri, 18 Jul 2025 21:40:34 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <daeho43@gmail.com>) id 1ucsoi-0008BY-01
 for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 18 Jul 2025 21:40:32 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:Message-ID:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=DfoGAqDs0KEygckjNWNCfRbMYzpWUQukgt2WdbLvfmc=; b=XIKUmwSxdEoLKDFlk1JyDIj6gG
 J3D9+sb2EGNROXo2LPBDDFIkbh5MBOuZ6OAXVWI9+31E/a7zB3xQFbHPCbmfertPKMs8DnvTfO3iZ
 yDu5NXzn6Wwc6pEs2ci3DH8R0UUBu0RJOIcOz6sBnH0Y+m0nef4nueOHJfvMXPeEhNtE=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:Cc:To:From
 :Sender:Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=DfoGAqDs0KEygckjNWNCfRbMYzpWUQukgt2WdbLvfmc=; b=P
 DiVZWDLJpvsfjSYlPtE1zQ4JIxIJxPQPGuTEz541nmGCP0rOptupiD8eLVVoTrXI+pczsCLFFKW6t
 i17+/lzgFPXbgVcDZbYMwtxial4TTQ+OB3SAZSVr39lnfyKmr0+/H4zOh9TB7SO3Hn/64Z+D6QrpI
 2hFtV+FtAgD9Kco4=;
Received: from mail-pf1-f178.google.com ([209.85.210.178])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1ucsoi-0005tN-Bj for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 18 Jul 2025 21:40:32 +0000
Received: by mail-pf1-f178.google.com with SMTP id
 d2e1a72fcca58-742c7a52e97so2261472b3a.3
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Fri, 18 Jul 2025 14:40:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1752874822; x=1753479622; darn=lists.sourceforge.net;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=DfoGAqDs0KEygckjNWNCfRbMYzpWUQukgt2WdbLvfmc=;
 b=HnmkxsowNDVFft5f28NxMQfVt+tkjAQ0XdRt2FinaNFU0oOVdia6FuAjQQMRm24LRn
 g6rkzVBiRuJcL8TddxF8algsY3inIGhDo2ym5GfWAxN13elu8obHWVLzeTvsDAUjqFon
 Qn1p5DaAwrF045S58jIQbVj5jKKrVAbvx+Xj2AjQx3UKlPRLiifBKEYaGR0oO3m+ui3j
 uaZu3KAktlsj4Q3D2e+xOqiJ6X62Q37/9WsFNcYVcjIxQK+QqVHNA+iQMv70sbuw0AcQ
 ZrzDA9hmgVGMblVA/IdkYepTRQ+S41+65Ler00JkSUzPRAwoUUCKs1BjQrv9LovhmDXO
 OjnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1752874822; x=1753479622;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=DfoGAqDs0KEygckjNWNCfRbMYzpWUQukgt2WdbLvfmc=;
 b=wU3wAjFXXjzR2cR52ZcVUeKnuKulFfT21Sx8nzeUSPJzVXcAPRHHlorEIttvzTPYJ1
 E9oVl2INoHBJgBO1q6GjNa76WtJz1qGBf2uarh7C/whuOOOPAtar/bCMHbLmePqLG/nd
 mxhbaItP1t1vi9v5YM4wM+08mRxB0P0VAfsu+wIpBEi6/pr5WDYKtZqrzKbr3n+DAWup
 gHAoohDIInkjfKRMSnGW7zvIerh9eK2LmdQmX/XnJXfKsWGdbFZWysWdaRh0/gx9H1Bk
 b+o1e32CepsGTUAsmhLGcMI20Psp6gpuTHA7+GtmZJ2ti7gn8C+NAleL187U5ewFjz3g
 EABw==
X-Forwarded-Encrypted: i=1;
 AJvYcCXsAb+c4OIwOlc/+evenxCrdHLNJTLv6DZi/O1aGD1MRwAvNqcs2NbIu+6YuABEkLLs2dJ3VOENUNQTJwzqgi/u@lists.sourceforge.net
X-Gm-Message-State: AOJu0YxqzZ16iPWneDyu7SXksLG4MYQtK3twkLpN4ZfVjgJgAHE9fFtj
 y4OIBIxfIGsqS5ySsKvMi95Bk83wyZn3/DxNfrPbF0+FG12c3hUCdbVU
X-Gm-Gg: ASbGncuX+OXrXTe+oY56ZWJ9NQCmMRV00oDXh1/gSLOzTl8DNrRzhXU3JIsqxr2enRj
 ivErsv/rNfDqxUWBbS3+kp5QiwBpT2Im/UeSbd8bxKdpCH5P0xQTUscZxCJSxbiRMzgoTzucplK
 usx2UR1zwDlLjqTpY9RoklWsoFo1K8/fQsBHRz3JJoBEyHOzV5cyruIenhBAZwGRD7r8GuF/j8y
 V3XZQU8saC5KfTpGBrcFm/9NhvyI8mR4kTBL+rPCJtZx2D+9pDLsT6h1lhR+NLusvaugyFTMsH0
 iaIwtLk1eMjb9AZ3bFwa5bZJTuO8tSk1+7ncWaVzAR0aMVzVgP75yw44vZAJM+2V5VA729LMHBb
 /6ir6ThGNacTxsO78aoC/1+b84xOIeZ8yWWktgCHeGMhl8tbteIkgyWalla6+lvKLlkkTCVG9cf
 YB4q7+v2+pe+yxaw==
X-Google-Smtp-Source: AGHT+IHzFM56WdAtgwpgdQme2yI48O+6b8pHbsuA1cfjaaC6Z8I1MfrtI83Gnwa4bohZNLfR7gYHyQ==
X-Received: by 2002:a05:6a00:4642:b0:747:ab61:e4fa with SMTP id
 d2e1a72fcca58-759ad4012efmr6197521b3a.14.1752874821444; 
 Fri, 18 Jul 2025 14:40:21 -0700 (PDT)
Received: from daehojeong-desktop.mtv.corp.google.com
 ([2a00:79e0:2e14:7:902e:59ec:cd2a:fc00])
 by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-759cb678fecsm1731070b3a.118.2025.07.18.14.40.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 18 Jul 2025 14:40:21 -0700 (PDT)
From: Daeho Jeong <daeho43@gmail.com>
To: linux-kernel@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net,
 kernel-team@android.com
Date: Fri, 18 Jul 2025 14:40:14 -0700
Message-ID: <20250718214014.2277307-1-daeho43@gmail.com>
X-Mailer: git-send-email 2.50.0.727.gbf7dc18ff4-goog
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
 Signed-off-by: Daeho Jeong --- v2: limit the available value range ---
 Documentation/ABI/testing/sysfs-fs-f2fs
 | 8 ++++++++ fs/f2fs/gc.c | 3 ++- fs/f2fs/gc.h | 1 + fs/f2fs/sysfs.c | 2
 ++ 4 files cha [...] 
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
 [209.85.210.178 listed in wl.mailspike.net]
 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
X-Headers-End: 1ucsoi-0005tN-Bj
Subject: [f2fs-dev] [PATCH v2] f2fs: add gc_boost_gc_multiple sysfs node
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
v2: limit the available value range
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
2.50.0.727.gbf7dc18ff4-goog



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
