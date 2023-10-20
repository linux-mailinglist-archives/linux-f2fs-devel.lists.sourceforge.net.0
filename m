Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id F21DB7D142B
	for <lists+linux-f2fs-devel@lfdr.de>; Fri, 20 Oct 2023 18:37:23 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-3.v29.lw.sourceforge.com)
	by sfs-ml-3.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1qtsUp-0002nl-7m;
	Fri, 20 Oct 2023 16:37:09 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-3.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <daeho43@gmail.com>) id 1qtsUn-0002nf-82
 for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 20 Oct 2023 16:37:07 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:Message-ID:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=t9hC4nL6redQSBoYQJzaTuLfHsbZDhIMKmoiNfdDp30=; b=jfHESgQ2RodBUBKPkgEvcUvgMC
 MIJyqqmYXlIF2ip83uFo2uNi21GCwdQFPZ756Wmk/Q9TpqZZQ9sB0IEiE5eAYiWyMNbKlH3Om7UYA
 hNVCnwgRC+qhgOjZF/AYM/JU1jR1EnFdPlDKSjB6k7S5urSfOrjklauGX3761h46a3V4=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:Cc:To:From
 :Sender:Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=t9hC4nL6redQSBoYQJzaTuLfHsbZDhIMKmoiNfdDp30=; b=C
 51/xcQCKbhyRvvUpC0pIFQDtWOOmS9s3yqJCAR4lP+JCBXYm+pnf/SlWoNPjMuRbOi25MS0V/H7/D
 R35vEwjxNhOD0nafmToMUZcl0IqKBGYF9RM9V98HnC3JAenLcZyZqc8GIANCYOi9h+CU+s3G44ikP
 E/+Yti4RzRToIqnI=;
Received: from mail-il1-f171.google.com ([209.85.166.171])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1qtsUg-004O18-Hm for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 20 Oct 2023 16:37:07 +0000
Received: by mail-il1-f171.google.com with SMTP id
 e9e14a558f8ab-3575c10421aso3645735ab.3
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Fri, 20 Oct 2023 09:37:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1697819817; x=1698424617; darn=lists.sourceforge.net;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=t9hC4nL6redQSBoYQJzaTuLfHsbZDhIMKmoiNfdDp30=;
 b=jLVriqfwDcXjJEKqpTZu+d8c0Vq9VY4i4U59Oyh8xG7vpgfr0rId0MlinGkgmGCZIe
 1rMI+KXtB2bhF+mOOFsgf1QvfQrz7VjNmShzM1jAfmy46wdU4+ZDTWJEE1NfFf6yZNqw
 /NKPIV/3Tdr/+x3PMXaAoUMvC+65sm80GjSMHVBncg6a1mrcNahHIDWX1W+joQy3G+ca
 WJM0MOLVWLupY0IuChmai5W2/yCDon4C2aV/v/iDw5t2JXRE4qSWuL2xCO35sKxo2r+d
 JZ2H7ve8czfv5XRX2SpSS2vTPvhjB8Y2bjJThiEAbhuemToBzKkexbM7EdGh8PPeIMtR
 Ml2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1697819817; x=1698424617;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=t9hC4nL6redQSBoYQJzaTuLfHsbZDhIMKmoiNfdDp30=;
 b=jEgrQFosUfvrMpGyVFJpV0FZjebA0hT6jTTSTBCoL0vZ4txhy6V8YCS25ndmfEFT/t
 vJAVH6Mauo9Z9vDYDoH4p62rHMSELDOziflBlDTpxEFmKsdWnCI8zLZ+I4nrivLUlKHN
 tGWd06aMZl9IHtSYiMfjfwxQevqhCdSYol5S+88046HhCNHA/RKo7jsqRiLPdO88i4dk
 8Wxm/ng7hGVloqIKZFYg3lsrWOi+KRhkM9NcM6T2fLgi4Ft5CSfNwHgMluC03g/a0rxW
 Pza3wIReW5JRehPBZLXA74QclK2HujmtZlxkrhrqkQsJNohPx/bsvJWv4k+94oFTIAXm
 Pxyg==
X-Gm-Message-State: AOJu0YzXnjLWu33ZFtS7XpdhItVoMl6wxl7W6h+lR1PvvFqVSdGt9Yqw
 X/aZP3MHMa1xcwmvGHhgd40=
X-Google-Smtp-Source: AGHT+IErBYRk5RSu27/tu6H4mXHVqWs0dQWv7AHNX55KFrbnnB+ii+yjDutyMqVXdXx8OcYYdac6Bg==
X-Received: by 2002:a05:6e02:1544:b0:345:787a:cb1c with SMTP id
 j4-20020a056e02154400b00345787acb1cmr3151137ilu.6.1697819816765; 
 Fri, 20 Oct 2023 09:36:56 -0700 (PDT)
Received: from daehojeong-desktop.mtv.corp.google.com
 ([2620:15c:211:201:b74d:59d2:dbfd:c8dd])
 by smtp.gmail.com with ESMTPSA id
 f15-20020a63f10f000000b005af7ee01ab4sm1699571pgi.6.2023.10.20.09.36.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 20 Oct 2023 09:36:56 -0700 (PDT)
From: Daeho Jeong <daeho43@gmail.com>
To: linux-kernel@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net,
 kernel-team@android.com
Date: Fri, 20 Oct 2023 09:36:45 -0700
Message-ID: <20231020163645.2852056-1-daeho43@gmail.com>
X-Mailer: git-send-email 2.42.0.655.g421f12c284-goog
MIME-Version: 1.0
X-Spam-Score: 0.1 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: From: Daeho Jeong Flush remaining checkpoint requests at the
 end of remount, since a new checkpoint would be triggered while remount and
 we need to take care of it before returning from remount, in order to avoid
 the b [...] 
 Content analysis details:   (0.1 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 0.0 FREEMAIL_FROM          Sender email is commonly abused enduser mail
 provider [daeho43[at]gmail.com]
 0.2 FREEMAIL_ENVFROM_END_DIGIT Envelope-from freemail username ends
 in digit [daeho43[at]gmail.com]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [209.85.166.171 listed in wl.mailspike.net]
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
 no trust [209.85.166.171 listed in list.dnswl.org]
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
X-Headers-End: 1qtsUg-004O18-Hm
Subject: [f2fs-dev] [PATCH] f2fs: finish previous checkpoints before
 returning from remount
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

Flush remaining checkpoint requests at the end of remount, since a new
checkpoint would be triggered while remount and we need to take care of
it before returning from remount, in order to avoid the below race
condition.

  - Thread                          - checkpoint thread
  do_remount()
   down_write(&sb->s_umount);
   f2fs_remount()
    f2fs_disable_checkpoint(sbi) -> add checkpoints to the list
                                    block_operations()
                                     down_read_trylock(&sb->s_umount) = 0
   up_write(&sb->s_umount);
                                     f2fs_quota_sync()
                                      dquot_writeback_dquots()
                                       WARN_ON_ONCE(!rwsem_is_locked(&sb->s_umount));

Signed-off-by: Daeho Jeong <daehojeong@google.com>
---
 fs/f2fs/super.c | 59 +++++++++++++++++++++++++++----------------------
 1 file changed, 32 insertions(+), 27 deletions(-)

diff --git a/fs/f2fs/super.c b/fs/f2fs/super.c
index a8c8232852bb..d6edf7df6abd 100644
--- a/fs/f2fs/super.c
+++ b/fs/f2fs/super.c
@@ -2286,9 +2286,9 @@ static int f2fs_remount(struct super_block *sb, int *flags, char *data)
 	unsigned long old_sb_flags;
 	int err;
 	bool need_restart_gc = false, need_stop_gc = false;
-	bool need_restart_ckpt = false, need_stop_ckpt = false;
 	bool need_restart_flush = false, need_stop_flush = false;
 	bool need_restart_discard = false, need_stop_discard = false;
+	bool need_enable_checkpoint = false, need_disable_checkpoint = false;
 	bool no_read_extent_cache = !test_opt(sbi, READ_EXTENT_CACHE);
 	bool no_age_extent_cache = !test_opt(sbi, AGE_EXTENT_CACHE);
 	bool enable_checkpoint = !test_opt(sbi, DISABLE_CHECKPOINT);
@@ -2452,24 +2452,6 @@ static int f2fs_remount(struct super_block *sb, int *flags, char *data)
 		clear_sbi_flag(sbi, SBI_IS_CLOSE);
 	}
 
-	if ((*flags & SB_RDONLY) || test_opt(sbi, DISABLE_CHECKPOINT) ||
-			!test_opt(sbi, MERGE_CHECKPOINT)) {
-		f2fs_stop_ckpt_thread(sbi);
-		need_restart_ckpt = true;
-	} else {
-		/* Flush if the prevous checkpoint, if exists. */
-		f2fs_flush_ckpt_thread(sbi);
-
-		err = f2fs_start_ckpt_thread(sbi);
-		if (err) {
-			f2fs_err(sbi,
-			    "Failed to start F2FS issue_checkpoint_thread (%d)",
-			    err);
-			goto restore_gc;
-		}
-		need_stop_ckpt = true;
-	}
-
 	/*
 	 * We stop issue flush thread if FS is mounted as RO
 	 * or if flush_merge is not passed in mount option.
@@ -2481,7 +2463,7 @@ static int f2fs_remount(struct super_block *sb, int *flags, char *data)
 	} else {
 		err = f2fs_create_flush_cmd_control(sbi);
 		if (err)
-			goto restore_ckpt;
+			goto restore_gc;
 		need_stop_flush = true;
 	}
 
@@ -2503,8 +2485,31 @@ static int f2fs_remount(struct super_block *sb, int *flags, char *data)
 			err = f2fs_disable_checkpoint(sbi);
 			if (err)
 				goto restore_discard;
+			need_enable_checkpoint = true;
 		} else {
 			f2fs_enable_checkpoint(sbi);
+			need_disable_checkpoint = true;
+		}
+	}
+
+	/*
+	 * Place this routine at the end, since a new checkpoint would be
+	 * triggered while remount and we need to take care of it before
+	 * returning from remount.
+	 */
+	if ((*flags & SB_RDONLY) || test_opt(sbi, DISABLE_CHECKPOINT) ||
+			!test_opt(sbi, MERGE_CHECKPOINT)) {
+		f2fs_stop_ckpt_thread(sbi);
+	} else {
+		/* Flush if the prevous checkpoint, if exists. */
+		f2fs_flush_ckpt_thread(sbi);
+
+		err = f2fs_start_ckpt_thread(sbi);
+		if (err) {
+			f2fs_err(sbi,
+			    "Failed to start F2FS issue_checkpoint_thread (%d)",
+			    err);
+			goto restore_checkpoint;
 		}
 	}
 
@@ -2522,6 +2527,13 @@ static int f2fs_remount(struct super_block *sb, int *flags, char *data)
 	adjust_unusable_cap_perc(sbi);
 	*flags = (*flags & ~SB_LAZYTIME) | (sb->s_flags & SB_LAZYTIME);
 	return 0;
+restore_checkpoint:
+	if (need_enable_checkpoint) {
+		f2fs_enable_checkpoint(sbi);
+	} else if (need_disable_checkpoint) {
+		if (f2fs_disable_checkpoint(sbi))
+			f2fs_warn(sbi, "checkpoint has not been disabled");
+	}
 restore_discard:
 	if (need_restart_discard) {
 		if (f2fs_start_discard_thread(sbi))
@@ -2537,13 +2549,6 @@ static int f2fs_remount(struct super_block *sb, int *flags, char *data)
 		clear_opt(sbi, FLUSH_MERGE);
 		f2fs_destroy_flush_cmd_control(sbi, false);
 	}
-restore_ckpt:
-	if (need_restart_ckpt) {
-		if (f2fs_start_ckpt_thread(sbi))
-			f2fs_warn(sbi, "background ckpt thread has stopped");
-	} else if (need_stop_ckpt) {
-		f2fs_stop_ckpt_thread(sbi);
-	}
 restore_gc:
 	if (need_restart_gc) {
 		if (f2fs_start_gc_thread(sbi))
-- 
2.42.0.283.g2d96d420d3-goog



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
