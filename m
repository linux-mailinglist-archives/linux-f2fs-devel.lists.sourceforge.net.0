Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 93B38972535
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 10 Sep 2024 00:20:13 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1snmjy-0005wv-Ty;
	Mon, 09 Sep 2024 22:20:10 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <daeho43@gmail.com>) id 1snmjq-0005wK-Lh
 for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 09 Sep 2024 22:20:02 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=m4K3+hj6aGpbXAqhJlIDqPuZ5OSvQ2hWwcmdr3buziA=; b=LrGS6i2xgogDdyUvimSpckGsA9
 V+igbdCQEkbvHaFKG1Nh3kDfqwjP4jmxpN7lvB+DkZ0f7k60XVt2TtJPZ8zkSANlzKwUadkQMqNAl
 eDLoMTlBYecAIuVo0ur1kjmxaH5ahxACKobdvs7HpTI2LgmPSNyvLRx1mir0iAG3gEi8=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=m4K3+hj6aGpbXAqhJlIDqPuZ5OSvQ2hWwcmdr3buziA=; b=BLAknr8ak/d+9gbYWNlnAo5jYF
 OiXpkSWv5EuXtf5X3ETKjqaEk3kI5MrkFIKJDYIvcmpjylx23YICDn41IGcX3a4YM6sb3bS68GhiG
 +gMT8DJ8q8VCEol0XoPSQnFfYTpnnI72jZsFFhVbOg0N4l3JfCZ7wrXCxaJUd5uxV1lc=;
Received: from mail-pj1-f43.google.com ([209.85.216.43])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1snmjp-0006gL-Qw for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 09 Sep 2024 22:20:02 +0000
Received: by mail-pj1-f43.google.com with SMTP id
 98e67ed59e1d1-2d877e9054eso3277780a91.3
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Mon, 09 Sep 2024 15:20:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1725920396; x=1726525196; darn=lists.sourceforge.net;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=m4K3+hj6aGpbXAqhJlIDqPuZ5OSvQ2hWwcmdr3buziA=;
 b=C3t28zQpxeyk19N/hIsPwvMTm/mQFlU4VjSoURyubphyjR36HMZvVrwhaDF70Fo2eV
 xVnnJ6vpQ+h3PGle5K+EoL6leKunteBkay1GjEHMlchwCWK7dbq1VLUbJ05XdUy+hd3b
 3vTX6USl/fRSoVBmTzRLNm4qjSGBgFruB74nC2A2bNwfY7yRUQjpz6L8eTfHqgyEuLO6
 bw8/rgCeMbFua4L0rNZO3zBJQOPpSYM9zXfWx6HBgyqapl+Wa/dm+gHyGs2UGoV3yOC3
 IukNjzH37GzFWfY3OJKq2EsxiODAKpXw3jRn+0o/nE+linSd/IRDAGw2fSBw/TOaB0s1
 X/rA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1725920396; x=1726525196;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=m4K3+hj6aGpbXAqhJlIDqPuZ5OSvQ2hWwcmdr3buziA=;
 b=M1IVwesA40who/CS+u8mMR5yAzDynQ6s8upfGPGs6wXXRey4/3WJeMVzxpqlR/65ka
 F0ua51aHv9+Eo30fybwQQlYJUkZvEM0PC99tyPAtWrEo/o0P16hw+HMfg0e4tJD34Wny
 gwq2t3szn7UIHX31F1rqmEfPG0cUsBnSD00f6I848cmaGBb6i39pKmTnFfpW9iZomRqz
 j854wOx0+gxXv+TU1tRpkur+4GnhJDmHvtWLwel7fb2W7lOSMP1KIxr900t7te9eDmTq
 0DPYAJKIEThDC7wUjQ927vKlybdMgR4XHZWBmWtSwS7fbT1wHEaM2ovHeS2VchkYeDJ/
 dEmQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCWSoAacd7cvxa/SK8HzsfdxEILH3HdLlJnO3qD3k70E3W1Sn30TCIAoElX2ajUCm2PdtupeobBPX0kZXH2OldQS@lists.sourceforge.net
X-Gm-Message-State: AOJu0YzTEGxvDXXM2pjlITg824/U0EL/hrnXrYM7iHWRlWDKHL8lBQtj
 tmeWeoEuwX/ZKBouL816bPgVkdbc9NgEn6oC9byCqTj6VMTbsBAu
X-Google-Smtp-Source: AGHT+IGkmDIg9KV3CCSmtY+SzcDsmrRyyyiLqHx8z9OM9jAnq0cDAY0hqnch/xtkfI29tRAs6tMX+A==
X-Received: by 2002:a17:90b:3846:b0:2da:89ac:75b9 with SMTP id
 98e67ed59e1d1-2daffa7fcaamr11312122a91.11.1725920395881; 
 Mon, 09 Sep 2024 15:19:55 -0700 (PDT)
Received: from daehojeong-desktop.mtv.corp.google.com
 ([2a00:79e0:2e14:7:ed56:14c3:db02:6c66])
 by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-2db04988470sm5016840a91.54.2024.09.09.15.19.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 09 Sep 2024 15:19:55 -0700 (PDT)
From: Daeho Jeong <daeho43@gmail.com>
To: linux-kernel@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net,
 kernel-team@android.com
Date: Mon,  9 Sep 2024 15:19:44 -0700
Message-ID: <20240909221946.2004046-5-daeho43@gmail.com>
X-Mailer: git-send-email 2.46.0.598.g6f2099f65c-goog
In-Reply-To: <20240909221946.2004046-1-daeho43@gmail.com>
References: <20240909221946.2004046-1-daeho43@gmail.com>
MIME-Version: 1.0
X-Spam-Score: 0.1 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  From: Daeho Jeong Under low free section count, we need to
 use FG_GC instead of BG_GC to recover free sections. Signed-off-by: Daeho
 Jeong --- v2: moved up the one_time field for better padding. ---
 fs/f2fs/f2fs.h
 | 1 + fs/f2fs/gc.c | 24 +++++++++++++++++------- 2 files changed,
 18 insertions(+), 7 deletions( [...] 
 Content analysis details:   (0.1 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 0.0 FREEMAIL_FROM          Sender email is commonly abused enduser mail
 provider [daeho43[at]gmail.com]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.2 FREEMAIL_ENVFROM_END_DIGIT Envelope-from freemail username ends
 in digit [daeho43[at]gmail.com]
 0.0 RCVD_IN_MSPIKE_H3      RBL: Good reputation (+3)
 [209.85.216.43 listed in wl.mailspike.net]
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
 no trust [209.85.216.43 listed in list.dnswl.org]
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
X-Headers-End: 1snmjp-0006gL-Qw
Subject: [f2fs-dev] [PATCH v2 5/7] f2fs: do FG_GC when GC boosting is
 required for zoned devices
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

Under low free section count, we need to use FG_GC instead of BG_GC to
recover free sections.

Signed-off-by: Daeho Jeong <daehojeong@google.com>
---
v2: moved up the one_time field for better padding.
---
 fs/f2fs/f2fs.h |  1 +
 fs/f2fs/gc.c   | 24 +++++++++++++++++-------
 2 files changed, 18 insertions(+), 7 deletions(-)

diff --git a/fs/f2fs/f2fs.h b/fs/f2fs/f2fs.h
index a00e01e66e08..62880fbb9e20 100644
--- a/fs/f2fs/f2fs.h
+++ b/fs/f2fs/f2fs.h
@@ -1293,6 +1293,7 @@ struct f2fs_gc_control {
 	bool no_bg_gc;			/* check the space and stop bg_gc */
 	bool should_migrate_blocks;	/* should migrate blocks */
 	bool err_gc_skipped;		/* return EAGAIN if GC skipped */
+	bool one_time;			/* require one time GC in one migration unit */
 	unsigned int nr_free_secs;	/* # of free sections to do GC */
 };
 
diff --git a/fs/f2fs/gc.c b/fs/f2fs/gc.c
index 9a3d3994cf2b..a59fec64eccf 100644
--- a/fs/f2fs/gc.c
+++ b/fs/f2fs/gc.c
@@ -81,6 +81,8 @@ static int gc_thread_func(void *data)
 			continue;
 		}
 
+		gc_control.one_time = false;
+
 		/*
 		 * [GC triggering condition]
 		 * 0. GC is not conducted currently.
@@ -126,15 +128,19 @@ static int gc_thread_func(void *data)
 				wait_ms = gc_th->max_sleep_time;
 		}
 
-		if (need_to_boost_gc(sbi))
+		if (need_to_boost_gc(sbi)) {
 			decrease_sleep_time(gc_th, &wait_ms);
-		else
+			if (f2fs_sb_has_blkzoned(sbi))
+				gc_control.one_time = true;
+		} else {
 			increase_sleep_time(gc_th, &wait_ms);
+		}
 do_gc:
 		stat_inc_gc_call_count(sbi, foreground ?
 					FOREGROUND : BACKGROUND);
 
-		sync_mode = F2FS_OPTION(sbi).bggc_mode == BGGC_MODE_SYNC;
+		sync_mode = (F2FS_OPTION(sbi).bggc_mode == BGGC_MODE_SYNC) ||
+				gc_control.one_time;
 
 		/* foreground GC was been triggered via f2fs_balance_fs() */
 		if (foreground)
@@ -1701,7 +1707,7 @@ static int __get_victim(struct f2fs_sb_info *sbi, unsigned int *victim,
 static int do_garbage_collect(struct f2fs_sb_info *sbi,
 				unsigned int start_segno,
 				struct gc_inode_list *gc_list, int gc_type,
-				bool force_migrate)
+				bool force_migrate, bool one_time)
 {
 	struct page *sum_page;
 	struct f2fs_summary_block *sum;
@@ -1728,7 +1734,7 @@ static int do_garbage_collect(struct f2fs_sb_info *sbi,
 			sec_end_segno -= SEGS_PER_SEC(sbi) -
 					f2fs_usable_segs_in_sec(sbi, segno);
 
-		if (gc_type == BG_GC) {
+		if (gc_type == BG_GC || one_time) {
 			unsigned int window_granularity =
 				sbi->migration_window_granularity;
 
@@ -1911,7 +1917,8 @@ int f2fs_gc(struct f2fs_sb_info *sbi, struct f2fs_gc_control *gc_control)
 	}
 
 	seg_freed = do_garbage_collect(sbi, segno, &gc_list, gc_type,
-				gc_control->should_migrate_blocks);
+				gc_control->should_migrate_blocks,
+				gc_control->one_time);
 	if (seg_freed < 0)
 		goto stop;
 
@@ -1922,6 +1929,9 @@ int f2fs_gc(struct f2fs_sb_info *sbi, struct f2fs_gc_control *gc_control)
 		total_sec_freed++;
 	}
 
+	if (gc_control->one_time)
+		goto stop;
+
 	if (gc_type == FG_GC) {
 		sbi->cur_victim_sec = NULL_SEGNO;
 
@@ -2047,7 +2057,7 @@ int f2fs_gc_range(struct f2fs_sb_info *sbi,
 		};
 
 		do_garbage_collect(sbi, segno, &gc_list, FG_GC,
-						dry_run_sections == 0);
+						dry_run_sections == 0, false);
 		put_gc_inode(&gc_list);
 
 		if (!dry_run && get_valid_blocks(sbi, segno, true))
-- 
2.46.0.598.g6f2099f65c-goog



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
