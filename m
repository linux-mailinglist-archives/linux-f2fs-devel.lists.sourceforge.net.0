Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id D1123B14098
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 28 Jul 2025 18:46:16 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Subject:MIME-Version:Message-ID:Date:To:From:Sender:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=JN02nRj3X6RRbTfJyTOVaTLoFD21M+2mwwwglRctvOE=; b=mZCLVBr7TqtIATWO0Y5HPQZ9Ew
	dAbETvbnkr6otP3rvsFkAjZTwA+lEHPzcdcehpMX35rcA2BnYB/mnaCP9GpmPNyZE1bNn6EOjyC2R
	vLaOj7FU/NBGg+MQQOUsmWpIzXMduOmdZjuDlnjzQ23vBOuwKdmAWr3Uu+Bc9xmkRDrU=;
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1ugQzE-0008Dg-DE;
	Mon, 28 Jul 2025 16:46:04 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <daeho43@gmail.com>) id 1ugQzD-0008DZ-BB
 for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 28 Jul 2025 16:46:03 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:Message-ID:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=M1UZzt0XN01fsU2MzjSe2LXAiJeLQpYEWrArpijkKzw=; b=UrV/ylrwoAPvXth5PvKuz9TmSw
 mV0m6ryNHwq25IyWbFrfANR0Lp2MYof2TRK/CqH5F4Zf5erI7KduPKknjHxLu48dzJXgtFjWAXVoC
 sFq+dx7cJabOHR0kxyAY/sP3ILAi3vhUZW37LhTuwNv6rwBFG9d+o+fOJRXvKXfE8rTs=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:Cc:To:From
 :Sender:Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=M1UZzt0XN01fsU2MzjSe2LXAiJeLQpYEWrArpijkKzw=; b=m
 Nl8ShNfguTvHof2Da4s6gqpLI7NMW6v/sCCxuWh2AIfnR+sNahWmczl7k8eCHjWCxGuhRhMnTzEAv
 Md6id/z4d1Zd8eh5YR0ge4wtKaX++L1adr+mLeb/8Qacg8mzNwZ3EilDcUPWP+jmyLyF+9lxpuWeH
 g/hm20tKNVQOoUDE=;
Received: from mail-pg1-f172.google.com ([209.85.215.172])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1ugQzC-0007zl-R4 for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 28 Jul 2025 16:46:03 +0000
Received: by mail-pg1-f172.google.com with SMTP id
 41be03b00d2f7-b2c4e46a89fso3967013a12.2
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Mon, 28 Jul 2025 09:46:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1753721152; x=1754325952; darn=lists.sourceforge.net;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=M1UZzt0XN01fsU2MzjSe2LXAiJeLQpYEWrArpijkKzw=;
 b=Jwh+m7Gf7+0nsVOCnr+mx+6MrnHUirvzZ5nFo4n95a4DJ4sx2GQYuOs3KN4FfX2pAZ
 5+RHbwP2NWsbEXrPwmc4ug5zFjojFZg0DVjn6ohAp93vR9CNb8Az3Qq9JofPXf/LOUgO
 TGj5ztQtIJMGrXr3NSeEs6xo7Effk168J4FDFork/X6EpyjAteECCygs2qMkbVtsx6Ly
 i0oMo6tK14XySaqQffdbwj4F5dMzrRiC+GOrvDKC/IbHt4bnDT3XB19TFK2NvwwIpsvA
 vtwy6W67CasZAZ4WFbIxTuoa+MPrU4pRoj8dxsTzu2Mw6sh8wv9kpNrS5DnXorCKYp/v
 MCww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1753721152; x=1754325952;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=M1UZzt0XN01fsU2MzjSe2LXAiJeLQpYEWrArpijkKzw=;
 b=Ge/sDYhynL1j5HYw8kXNMfHlhbh2KiZfNignA+oTvq409OWJ4H0oqtRQD1/EjZwxvG
 /ATZ8r3xzQz1oCIe7yB2hf/lHk6+KB0HbBy0RDez8IeAwJbT/CrV5Kzz8AbtyTKYAbig
 RkXL7dFWQeyhyJk0syiqF3sqc9yOHerWQTLqaI9K1TvaJXZhf+Hb9h9aml62YTXcrkhg
 w0C60XqxvWkKlQWBnZutaNuHDn8fd3oj5aPOaKXhEnXC86fbms2egHV+4ETR7X+JpSjp
 h9/yP5Wo3irk7KsHsb0i+Iv8ZsFSChwM54imHqsEIsWI1OxA19wmkZg3dgrtqj6hWzsh
 cAjw==
X-Forwarded-Encrypted: i=1;
 AJvYcCWachWn9TitCqeTsoklgUcgji7ppO1ZVB9Zx9cYzEB1fKGgI6cyEoYQFilbwW4q5tWe2oXl66z55IYDSuoWL9l6@lists.sourceforge.net
X-Gm-Message-State: AOJu0YzPsLWu1gWEwVnDWj6oADeKU9QD/b1pPpJCZ09pd6MbHSsLfli6
 xrmf1xcZEqmhIumMUPBNOesi1stsmZ1ccsglU6moJJCzjgZ9YgkTjcJ8
X-Gm-Gg: ASbGncu8h3HPcJ5P5eUTXA8kHf7Cc1l3dtQ9G+alV5it0cNLZL8UTuICv4v3gB+1XVP
 WLprvv4k11IUvr9wtSmVjLcXb5XYLJMXWGNxGlvXIH4Rz3Bl70TK5fy++L3x/WqiCA12HcLVCt8
 rQWYY8Q/x3If4p5B844jII+97rjfOY17+a1x+p1tJrcQ85umELlu+duuUHWvd3pMNvDiZLf9VAF
 jrA3Rs21ZDKYRLxiJLwK6RFw844JArEAOroZQXWM+eURVproyv7CrdRGJquQBANY2yOfaOU8WMR
 y5M3o4NntTucb9bPbNJAsY0HMg+AgEPz67Wpc6WMqSzJUXuVDJEXyPbSflW6qD6jkCPgV6nHUvR
 6J9ZFXgnfUI9YroGX95R6/ahQr3wZ9hSgUxRe0owclzjUB45qDfCIe7Id79HVUs5nI48el6VOkI
 uVvunafxepVxVoJQ==
X-Google-Smtp-Source: AGHT+IGPVtNIjYRbrfjW1HFVFLTh3xg8CElN5fno8fDplcWQzNyOkR6FKiFJhTUf8EkWVhNnKlE+Pw==
X-Received: by 2002:a05:6a20:3d05:b0:235:86fd:cc99 with SMTP id
 adf61e73a8af0-23d7015a52amr20618828637.24.1753721151597; 
 Mon, 28 Jul 2025 09:45:51 -0700 (PDT)
Received: from daehojeong-desktop.mtv.corp.google.com
 ([2a00:79e0:2e14:7:b166:cd51:360c:c503])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-23ffa37f078sm39289475ad.115.2025.07.28.09.45.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 28 Jul 2025 09:45:51 -0700 (PDT)
From: Daeho Jeong <daeho43@gmail.com>
To: linux-kernel@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net,
 kernel-team@android.com
Date: Mon, 28 Jul 2025 09:45:44 -0700
Message-ID: <20250728164544.1051653-1-daeho43@gmail.com>
X-Mailer: git-send-email 2.50.1.487.gc89ff58d15-goog
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
 Signed-off-by: Daeho Jeong --- v3: fix the range check condition v2: limit
 the available value range --- Documentation/ABI/testing/sysfs-fs-f2fs | 8
 ++++++++ fs/f2fs/gc.c | 3 ++- fs/f2fs/gc.h | 1 + [...] 
 Content analysis details:   (0.1 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.0 FREEMAIL_FROM Sender email is commonly abused enduser mail provider
 [daeho43(at)gmail.com]
 0.2 FREEMAIL_ENVFROM_END_DIGIT Envelope-from freemail username ends in
 digit [daeho43(at)gmail.com]
 0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [209.85.215.172 listed in wl.mailspike.net]
X-Headers-End: 1ugQzC-0007zl-R4
Subject: [f2fs-dev] [PATCH v3] f2fs: add gc_boost_gc_multiple sysfs node
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
v3: fix the range check condition
v2: limit the available value range
---
 Documentation/ABI/testing/sysfs-fs-f2fs | 8 ++++++++
 fs/f2fs/gc.c                            | 3 ++-
 fs/f2fs/gc.h                            | 1 +
 fs/f2fs/sysfs.c                         | 9 +++++++++
 4 files changed, 20 insertions(+), 1 deletion(-)

diff --git a/Documentation/ABI/testing/sysfs-fs-f2fs b/Documentation/ABI/testing/sysfs-fs-f2fs
index bf03263b9f46..6083119851a6 100644
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
+		boosted. The range should be from 1 to the segment count in a section.
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
index 75134d69a0bd..b417b655d4e8 100644
--- a/fs/f2fs/sysfs.c
+++ b/fs/f2fs/sysfs.c
@@ -824,6 +824,13 @@ static ssize_t __sbi_store(struct f2fs_attr *a,
 		return count;
 	}
 
+	if (!strcmp(a->attr.name, "gc_boost_gc_multiple")) {
+		if (t < 1 || t > SEGS_PER_SEC(sbi))
+			return -EINVAL;
+		sbi->gc_thread->boost_gc_multiple = (unsigned int)t;
+		return count;
+	}
+
 	*ui = (unsigned int)t;
 
 	return count;
@@ -1050,6 +1057,7 @@ GC_THREAD_RW_ATTR(gc_no_gc_sleep_time, no_gc_sleep_time);
 GC_THREAD_RW_ATTR(gc_no_zoned_gc_percent, no_zoned_gc_percent);
 GC_THREAD_RW_ATTR(gc_boost_zoned_gc_percent, boost_zoned_gc_percent);
 GC_THREAD_RW_ATTR(gc_valid_thresh_ratio, valid_thresh_ratio);
+GC_THREAD_RW_ATTR(gc_boost_gc_multiple, boost_gc_multiple);
 
 /* SM_INFO ATTR */
 SM_INFO_RW_ATTR(reclaim_segments, rec_prefree_segments);
@@ -1220,6 +1228,7 @@ static struct attribute *f2fs_attrs[] = {
 	ATTR_LIST(gc_no_zoned_gc_percent),
 	ATTR_LIST(gc_boost_zoned_gc_percent),
 	ATTR_LIST(gc_valid_thresh_ratio),
+	ATTR_LIST(gc_boost_gc_multiple),
 	ATTR_LIST(gc_idle),
 	ATTR_LIST(gc_urgent),
 	ATTR_LIST(reclaim_segments),
-- 
2.50.1.487.gc89ff58d15-goog



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
