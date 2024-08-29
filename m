Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id EF7E5965260
	for <lists+linux-f2fs-devel@lfdr.de>; Thu, 29 Aug 2024 23:53:06 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1sjn4j-0004ch-0X;
	Thu, 29 Aug 2024 21:53:05 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <daeho43@gmail.com>) id 1sjn4h-0004cV-Ep
 for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 29 Aug 2024 21:53:04 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=nCE0wLcnJbc0xPPX5QrcdREOsfuAh2HyRWp/G1mjRP4=; b=PkiiY2UkWmkQj5kW+U0WJLOgKP
 UDD4YdoxFr1cl5m7Vfys3T/tEXcRrqlxeaf3jOHi5CUhTJU63yg8+XQssX2CfOAmL3APMDIMH1LVf
 jjOKDs1tZzKreeuRFh80WLV+IG9R2F9scFZFgk+0ybfySqojVtyGNsAqfrlF3zHzMB5Y=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=nCE0wLcnJbc0xPPX5QrcdREOsfuAh2HyRWp/G1mjRP4=; b=jRd0ulA5uPGfYt25P+H8hTSF7w
 /iT+3/nU/cu4droek5YSbmZHQF2Ku9yPxYnIurUkeCcfKVNRin1r5zWOTtxLQ8WmNTH7f4//NGJS3
 m95IAZyr4Ah+XbWsFgkF23p/TIbW3KgqN9ewW6u8myL5WWUKfuERQNav8Ub90D5Paqtk=;
Received: from mail-il1-f181.google.com ([209.85.166.181])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1sjn4h-0007bW-BJ for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 29 Aug 2024 21:53:04 +0000
Received: by mail-il1-f181.google.com with SMTP id
 e9e14a558f8ab-39e6a32ae15so3823245ab.3
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Thu, 29 Aug 2024 14:53:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1724968377; x=1725573177; darn=lists.sourceforge.net;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=nCE0wLcnJbc0xPPX5QrcdREOsfuAh2HyRWp/G1mjRP4=;
 b=JoUjQmzjvC4YU8xbDH+sZ27v+hX1KNReOk/DC/ypXLISCnzfgV+MGF2I69la96jno0
 seRpT2AHNQwKJpWva/vZlq3Z0kASr4xSY86mF5Us1+5MPrVSvYP0VGeabqV0oUxfl+B/
 AWhWApZltsG4aAZDF0Mo9HFS1dVkLadqx5N4PUZU/sgqxhzAMhfU4nsLFlBYGpWR0AoG
 iEU8xv9cVmwGI25m5FBjffyyDOk6po244Vb6SvaZJfjSVOnmt06KewOysO3Sb8y9149Q
 CAnAOPmof78S0ImDZEAyJqWJ2BUVs7vjV+9gFXcn47EYkyfjSzXhUzTEN8iALAVpFK6e
 +rRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1724968377; x=1725573177;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=nCE0wLcnJbc0xPPX5QrcdREOsfuAh2HyRWp/G1mjRP4=;
 b=knZ0R7Bb2C9EFbiCR+uwYF3d7nuCR0ZR78pXFiMXpFe8nxteuTAwIGN3X8Qfm+w2pn
 C7PRmKMqUv67CFZlQQZ1YXjCssjt7uMtR3xX0w8oKtIHi6nJLxh8xtF0mfN56RgQUVM8
 Jq+blxRAL5LAIeh7wpQLSLx3D3+mlbJMSApoTqowuk60EMqava1dYZlHPyU64y8hpFiI
 NJL9XE+06zHugeyHPPlFSR44gMSN85M1uojabgFFChsb98QroLYJWkktSQ0j4haMzZP9
 fZyx/07LXohd9bZ25HSwgOUB2u18UnXj7MsSgF7cbRTMQP8HbLLjle0RIbJNu96P9Guc
 lICw==
X-Forwarded-Encrypted: i=1;
 AJvYcCV/rFYwftumyTUwv9houuI5Hx0kPqm2VROcHPTWrwLvcUjbcoNBQkXNTFE6IYtpUWw9sFow2cnCZDzOgz6rVPr+@lists.sourceforge.net
X-Gm-Message-State: AOJu0Yx7EC+cbmjI0l37CMjo5I3GA6RUIF1UINlhT3GBkvXrFX0SmbkF
 MXBeemAuxHQMpHWwkxFunILrv3xO8Ub8i9KXzXBQbqJEKxxRCnzqPhqZDw==
X-Google-Smtp-Source: AGHT+IE0LMLaW2SFCQEnAxcRPDZaaNk8z4TmEdUAL7GcPO1HotWMRXyXRXgwaiwnYrlWv7QK3LyMcg==
X-Received: by 2002:a05:6e02:1e09:b0:39e:3b81:66b5 with SMTP id
 e9e14a558f8ab-39f377d80aemr56263715ab.4.1724968377453; 
 Thu, 29 Aug 2024 14:52:57 -0700 (PDT)
Received: from daehojeong-desktop.mtv.corp.google.com
 ([2a00:79e0:2e14:7:a1e7:73eb:e77e:3e2b])
 by smtp.gmail.com with ESMTPSA id
 41be03b00d2f7-7d22e9d512asm1705653a12.78.2024.08.29.14.52.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 29 Aug 2024 14:52:57 -0700 (PDT)
From: Daeho Jeong <daeho43@gmail.com>
To: linux-kernel@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net,
 kernel-team@android.com
Date: Thu, 29 Aug 2024 14:52:41 -0700
Message-ID: <20240829215242.3641502-6-daeho43@gmail.com>
X-Mailer: git-send-email 2.46.0.469.g59c65b2a67-goog
In-Reply-To: <20240829215242.3641502-1-daeho43@gmail.com>
References: <20240829215242.3641502-1-daeho43@gmail.com>
MIME-Version: 1.0
X-Spam-Score: 0.0 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: From: Daeho Jeong Added control knobs for
 gc_no_zoned_gc_percent
 and gc_boost_zoned_gc_percent. Signed-off-by: Daeho Jeong ---
 Documentation/ABI/testing/sysfs-fs-f2fs
 | 14 ++++++++++++++ fs/f2fs/gc.c | 12 +++++++++--- fs/f2fs/gc.h | 4 ++++
 fs/f2fs/sysfs.c | 4 ++++ 4 files changed, 31 insertion [...] 
 Content analysis details:   (0.0 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 RCVD_IN_VALIDITY_RPBL_BLOCKED RBL: ADMINISTRATOR NOTICE: The
 query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [209.85.166.181 listed in bl.score.senderscore.com]
 0.0 RCVD_IN_VALIDITY_CERTIFIED_BLOCKED RBL: ADMINISTRATOR NOTICE:
 The query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [209.85.166.181 listed in sa-accredit.habeas.com]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 FREEMAIL_FROM          Sender email is commonly abused enduser mail
 provider [daeho43[at]gmail.com]
 0.2 FREEMAIL_ENVFROM_END_DIGIT Envelope-from freemail username ends
 in digit [daeho43[at]gmail.com]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [209.85.166.181 listed in wl.mailspike.net]
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.0 T_SCC_BODY_TEXT_LINE   No description available.
X-Headers-End: 1sjn4h-0007bW-BJ
Subject: [f2fs-dev] [PATCH 6/7] f2fs: create gc_no_zoned_gc_percent and
 gc_boost_zoned_gc_percent
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

Added control knobs for gc_no_zoned_gc_percent and
gc_boost_zoned_gc_percent.

Signed-off-by: Daeho Jeong <daehojeong@google.com>
---
 Documentation/ABI/testing/sysfs-fs-f2fs | 14 ++++++++++++++
 fs/f2fs/gc.c                            | 12 +++++++++---
 fs/f2fs/gc.h                            |  4 ++++
 fs/f2fs/sysfs.c                         |  4 ++++
 4 files changed, 31 insertions(+), 3 deletions(-)

diff --git a/Documentation/ABI/testing/sysfs-fs-f2fs b/Documentation/ABI/testing/sysfs-fs-f2fs
index 4fcd0f824bde..265baec879fd 100644
--- a/Documentation/ABI/testing/sysfs-fs-f2fs
+++ b/Documentation/ABI/testing/sysfs-fs-f2fs
@@ -769,3 +769,17 @@ Date:		August 2024
 Contact:	"Daeho Jeong" <daehojeong@google.com>
 Description:	In order to fine tune GC behavior, we can control the number of
 		reserved segments.
+
+What:		/sys/fs/f2fs/<disk>/gc_no_zoned_gc_percent
+Date:		August 2024
+Contact:	"Daeho Jeong" <daehojeong@google.com>
+Description:	If the percentage of free sections over total sections is above this
+		number, F2FS do not garbage collection for zoned devices through the
+		background GC thread. the default number is "60".
+
+What:		/sys/fs/f2fs/<disk>/gc_boost_zoned_gc_percent
+Date:		August 2024
+Contact:	"Daeho Jeong" <daehojeong@google.com>
+Description:	If the percentage of free sections over total sections is under this
+		number, F2FS boosts garbage collection for zoned devices through the
+		background GC thread. the default number is "25".
diff --git a/fs/f2fs/gc.c b/fs/f2fs/gc.c
index 37b47a8d95f1..6b79c43a57e3 100644
--- a/fs/f2fs/gc.c
+++ b/fs/f2fs/gc.c
@@ -119,7 +119,8 @@ static int gc_thread_func(void *data)
 		}
 
 		if (f2fs_sb_has_blkzoned(sbi)) {
-			if (has_enough_free_blocks(sbi, LIMIT_NO_ZONED_GC)) {
+			if (has_enough_free_blocks(sbi,
+				gc_th->no_zoned_gc_percent)) {
 				wait_ms = gc_th->no_gc_sleep_time;
 				f2fs_up_write(&sbi->gc_lock);
 				goto next;
@@ -200,10 +201,14 @@ int f2fs_start_gc_thread(struct f2fs_sb_info *sbi)
 		gc_th->min_sleep_time = DEF_GC_THREAD_MIN_SLEEP_TIME_ZONED;
 		gc_th->max_sleep_time = DEF_GC_THREAD_MAX_SLEEP_TIME_ZONED;
 		gc_th->no_gc_sleep_time = DEF_GC_THREAD_NOGC_SLEEP_TIME_ZONED;
+		gc_th->no_zoned_gc_percent = LIMIT_NO_ZONED_GC;
+		gc_th->boost_zoned_gc_percent = LIMIT_BOOST_ZONED_GC;
 	} else {
 		gc_th->min_sleep_time = DEF_GC_THREAD_MIN_SLEEP_TIME;
 		gc_th->max_sleep_time = DEF_GC_THREAD_MAX_SLEEP_TIME;
 		gc_th->no_gc_sleep_time = DEF_GC_THREAD_NOGC_SLEEP_TIME;
+		gc_th->no_zoned_gc_percent = 0;
+		gc_th->boost_zoned_gc_percent = 0;
 	}
 
 	gc_th->gc_wake = false;
@@ -1740,8 +1745,9 @@ static int do_garbage_collect(struct f2fs_sb_info *sbi,
 
 			if (f2fs_sb_has_blkzoned(sbi) &&
 					!has_enough_free_blocks(sbi,
-					LIMIT_BOOST_ZONED_GC))
-				migration_granularity *= BOOST_GC_MULTIPLE;
+					sbi->gc_thread->boost_zoned_gc_percent))
+				migration_granularity *=
+					BOOST_GC_MULTIPLE;
 
 			end_segno = start_segno + migration_granularity;
 		}
diff --git a/fs/f2fs/gc.h b/fs/f2fs/gc.h
index 33848d550153..e8195eb4ca6d 100644
--- a/fs/f2fs/gc.h
+++ b/fs/f2fs/gc.h
@@ -61,6 +61,10 @@ struct f2fs_gc_kthread {
 						 * caller of f2fs_balance_fs()
 						 * will wait on this wait queue.
 						 */
+
+	/* for gc control for zoned devices */
+	unsigned int no_zoned_gc_percent;
+	unsigned int boost_zoned_gc_percent;
 };
 
 struct gc_inode_list {
diff --git a/fs/f2fs/sysfs.c b/fs/f2fs/sysfs.c
index 2ed773132f40..647f6660f4df 100644
--- a/fs/f2fs/sysfs.c
+++ b/fs/f2fs/sysfs.c
@@ -960,6 +960,8 @@ GC_THREAD_RW_ATTR(gc_urgent_sleep_time, urgent_sleep_time);
 GC_THREAD_RW_ATTR(gc_min_sleep_time, min_sleep_time);
 GC_THREAD_RW_ATTR(gc_max_sleep_time, max_sleep_time);
 GC_THREAD_RW_ATTR(gc_no_gc_sleep_time, no_gc_sleep_time);
+GC_THREAD_RW_ATTR(gc_no_zoned_gc_percent, no_zoned_gc_percent);
+GC_THREAD_RW_ATTR(gc_boost_zoned_gc_percent, boost_zoned_gc_percent);
 
 /* SM_INFO ATTR */
 SM_INFO_RW_ATTR(reclaim_segments, rec_prefree_segments);
@@ -1117,6 +1119,8 @@ static struct attribute *f2fs_attrs[] = {
 	ATTR_LIST(gc_min_sleep_time),
 	ATTR_LIST(gc_max_sleep_time),
 	ATTR_LIST(gc_no_gc_sleep_time),
+	ATTR_LIST(gc_no_zoned_gc_percent),
+	ATTR_LIST(gc_boost_zoned_gc_percent),
 	ATTR_LIST(gc_idle),
 	ATTR_LIST(gc_urgent),
 	ATTR_LIST(reclaim_segments),
-- 
2.46.0.469.g59c65b2a67-goog



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
