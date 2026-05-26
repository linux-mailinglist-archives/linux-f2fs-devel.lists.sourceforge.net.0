Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id EJxeNkcXFWqQSgcAu9opvQ
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 26 May 2026 05:45:11 +0200
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 26EE05D06DB
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 26 May 2026 05:45:10 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Subject:MIME-Version:Message-ID:Date:To:From:Sender:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=PcVAuNsilXkWnaIa5Oy3sexTskaC4jjH5XlZnmapUTE=; b=d2zWp8Q11gXeW4D9wNdIYgqIwi
	p2AkQ+rVNzH9ac3NQsfyY8D9q0DL+Uu+lpGVulCkSfrDusm73JetiBFtm8qQ/B4Zmz77IRzBGxN0D
	2oBU1GDs9zZ9CBJ1A5D9pbDyewUA8exvNvoyGM91FYoNXu46Lwa9dAjKwotvsr2E0tDM=;
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1wRiiz-0007ye-Le;
	Tue, 26 May 2026 03:44:59 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <qwjhust@gmail.com>) id 1wRiiy-0007yY-5R
 for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 26 May 2026 03:44:57 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:Message-ID:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=mIBdIvyjghcA5U0E+cK/NlWb2TAS2dmtADXjkP6n9ws=; b=Kaj6CKELI1sOc/Iulkp7n6hsc2
 XCO+tNtVqH6E/uBuTiy6CurGV75yVHr+Cs/NtEYKl5IIxTcisUR1EpTwEZc9pk4wxf4nVbGQCTRVD
 5NmUItHY+l7nxkqF1vJAKADR2YcSxszgHmwmaEkQYda3cdZNqT3TiMqwVb655tW8mvEo=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:Cc:To:From
 :Sender:Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=mIBdIvyjghcA5U0E+cK/NlWb2TAS2dmtADXjkP6n9ws=; b=S
 ZQHN5NobBFr8+oA1Iu4F1Zg9OBDppZ5g+wHOZsUt5rIpYdjUwums3tygIOcCGopPqrI7FECdBY3cv
 fuyPssvV6Zz+2XImg3t9LZiHce2hU6X8CkwyFMaQPc4QZPO7kyWoLzGs2sfz1ScXW9H/Q4ThxF9/g
 z+MDqIy9nE7rb5DY=;
Received: from mail-pj1-f41.google.com ([209.85.216.41])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1wRiiu-00070k-LB for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 26 May 2026 03:44:57 +0000
Received: by mail-pj1-f41.google.com with SMTP id
 98e67ed59e1d1-3680540a6efso5637074a91.2
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Mon, 25 May 2026 20:44:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1779767086; x=1780371886; darn=lists.sourceforge.net;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=mIBdIvyjghcA5U0E+cK/NlWb2TAS2dmtADXjkP6n9ws=;
 b=bEMyGQEhowMm3ND21kSNVKgU9Aj2TjGCc4UM3t/2Nn/03wxhiGYmGhqmRIRbVC1J1q
 WO9VRK0XP1H2txbdK56XFzjgODgEr8kit+6Rr4L+rJcpeBLNd7p9VslCxJnkHpLgX4Mk
 OgVN+SsqeEgmSSAOWOrD0VyIQ65pXHHZGmqaJOhDdldf7lSOUNEVQEaSu1yR2gR68k+H
 /wUsUBa19lLP+EsNpC0nnfzmcD/vEp0PqByR4Px0jjBBBe20jsgUTcuuVzyvrdC7QsPs
 wWjArjA+OhBLPfDNhwW1curLlLBCHOeBkO029ZTlQNJY6RkUWCr466XH8f9K/x1EUK1A
 6XAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1779767086; x=1780371886;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=mIBdIvyjghcA5U0E+cK/NlWb2TAS2dmtADXjkP6n9ws=;
 b=TOpDfsKaudgWXD6nHgHSc0CRJ6tXnc+agJQxuUcXMRYrNzJb4+mGBhvEZX4kUf0sBX
 uVBazdYsNUjDOwP8wSFq62V4PfKbSSUsoXhj2l6r1H9cmrfjhnBpge8+fpdzchZjYMyR
 Bj1iW2phcCiMBMXqYOHk2zfCCnB9NMkBALvPz9I0IqIYxJc6JPTv0D0LGpiLVJoGqcyc
 K7d/JyfeXukP2lLQ5Fm1wF/1TmtCitZI4r9SBTNE/in3HEzbpKJxcFRy+Et+W9YKq0tU
 ORbLYGU6rpPKQ9dDliRTz49LVx3gUu8VHMvLE0JGuQa/tJOzg1Cnz+0mksQB48qf55yF
 LUuA==
X-Gm-Message-State: AOJu0Yw9l1dV3UoaZraRU+WdNKdwoygvRYo7Lo4aSI19jBrPwB12Ph8X
 ++dzOaLOuO2ht+JooZtzIQrfZHmVG4iBhWWz+h+CiLjzG90qigaUFQ2P
X-Gm-Gg: Acq92OFFo6elUV/m4EmZD+23ufMfu366fT6pu3p2jVCe/b4kVNf5KA5q7piA4jPJT2R
 9pIojcMK8kxlN228sfLuAsS3OYlJeKopPu89MfyE4cxlJCtjHGaeAMkIR9bH9ujLDRElqTok13d
 /s+FeatEauPLo2Dw0eUM7NbJng5eajpNdnOwUeikiEDz9TtddEfsefzNBCdCzis7Y3WiCRqg22Q
 Yv44HfMou9ZXuQw/GStLq9unhaPWymHGqo+d0ED9lyIzpHp7wZdY1F/F27O/EY3bF1Rw1K91YiU
 pO9l/uNxrdCSVp5fRwGhr7lSMpwPVQDCVCZ+xjJ8ZlH5gTAIdlj0uiiuKwpwNPYHKXQiNjcW9M3
 dG9zE1DeO1mSCdmUppN7QwMSdNFywyC4++UDzW/0WpwX+Ni5twzoKIH6+VHYyn7+TlRx4OmXGW2
 /LEqbhqBywDGO1DZX/KvVnRZ83ahQVrXNo15VuVtOJz9HQx7rmZtacTxIVmpyUBhtfHv1COA==
X-Received: by 2002:a17:90b:5208:b0:35d:a5cb:95c1 with SMTP id
 98e67ed59e1d1-36a676287b9mr16258291a91.23.1779767086338; 
 Mon, 25 May 2026 20:44:46 -0700 (PDT)
Received: from qiwenjie-ThinkCentre-M760t.mioffice.cn ([43.224.245.241])
 by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-36a676e195asm5790623a91.1.2026.05.25.20.44.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 25 May 2026 20:44:45 -0700 (PDT)
From: Wenjie Qi <qwjhust@gmail.com>
X-Google-Original-From: Wenjie Qi <qiwenjie@xiaomi.com>
To: jaegeuk@kernel.org,
	chao@kernel.org
Date: Tue, 26 May 2026 11:44:39 +0800
Message-ID: <20260526034439.1017521-1-qiwenjie@xiaomi.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-1.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  f2fs_write_end_io() decrements the writeback page counter
 before waking sbi->cp_wait for the last F2FS_WB_CP_DATA completion. That
 decrement
 can drop the F2FS_WB_CP_DATA count to zero. It can unblock a concurrent
 unmount
 path waiting in f2fs_wait_on_all_pages(). Unmount can then continue through
 f2fs_put_super() and free sbi [...] 
 Content analysis details:   (-0.2 points, 5.0 required)
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
 [qwjhust(at)gmail.com]
 0.0 RCVD_IN_MSPIKE_H3      RBL: Good reputation (+3)
 [209.85.216.41 listed in wl.mailspike.net]
 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
X-Headers-End: 1wRiiu-00070k-LB
Subject: [f2fs-dev] [PATCH v2] f2fs: avoid cp_wait use-after-free in
 f2fs_write_end_io()
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
Cc: qwjhust@gmail.com, stable@kernel.org, qiwenjie@xiaomi.com,
 linux-kernel@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net
X-Spamd-Result: default: False [-1.01 / 15.00];
	RWL_MAILSPIKE_EXCELLENT(-0.40)[216.105.38.7:from];
	R_SPF_ALLOW(-0.20)[+ip4:216.105.38.7];
	R_DKIM_ALLOW(-0.20)[lists.sourceforge.net:s=beta];
	MAILLIST(-0.20)[mailman];
	MIME_GOOD(-0.10)[text/plain];
	DMARC_POLICY_SOFTFAIL(0.10)[gmail.com : SPF not aligned (relaxed), DKIM not aligned (relaxed),none];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	DKIM_MIXED(0.00)[];
	ARC_NA(0.00)[];
	R_DKIM_REJECT(0.00)[sourceforge.net:s=x,sf.net:s=x,gmail.com:s=20251104];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:jaegeuk@kernel.org,m:chao@kernel.org,m:qwjhust@gmail.com,m:stable@kernel.org,m:qiwenjie@xiaomi.com,m:linux-kernel@vger.kernel.org,m:linux-f2fs-devel@lists.sourceforge.net,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[linux-f2fs-devel@lists.sourceforge.net];
	FORGED_SENDER(0.00)[qwjhust@gmail.com,linux-f2fs-devel-bounces@lists.sourceforge.net];
	FREEMAIL_CC(0.00)[gmail.com,kernel.org,xiaomi.com,vger.kernel.org,lists.sourceforge.net];
	DKIM_TRACE(0.00)[lists.sourceforge.net:+,sourceforge.net:-,sf.net:-,gmail.com:-];
	ASN(0.00)[asn:11320, ipnet:216.105.32.0/21, country:US];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	TO_DN_NONE(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[qwjhust@gmail.com,linux-f2fs-devel-bounces@lists.sourceforge.net];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[linux-f2fs-devel@lists.sourceforge.net];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-f2fs-devel];
	RCPT_COUNT_SEVEN(0.00)[7];
	DBL_BLOCKED_OPENRESOLVER(0.00)[xiaomi.com:mid,xiaomi.com:email,lists.sourceforge.net:dkim,lists.sourceforge.net:rdns,lists.sourceforge.net:helo]
X-Rspamd-Queue-Id: 26EE05D06DB
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

f2fs_write_end_io() decrements the writeback page counter before waking
sbi->cp_wait for the last F2FS_WB_CP_DATA completion.

That decrement can drop the F2FS_WB_CP_DATA count to zero. It can unblock
a concurrent unmount path waiting in f2fs_wait_on_all_pages(). Unmount can
then continue through f2fs_put_super() and free sbi while the end_io
callback is still about to evaluate wq_has_sleeper() and wake_up() on
sbi->cp_wait.

Commit 2d9c4a4ed4ee ("f2fs: fix UAF caused by decrementing
sbi->nr_pages[] in f2fs_write_end_io()") fixed one post-decrement sbi
access by moving the warm-node-list handling before dec_page_count(). The
compressed writeback path follows the same rule and documents that
sbi accesses must happen before dec_page_count() can drop the
F2FS_WB_CP_DATA count to zero.

Use atomic_dec_and_lock_irqsave() for F2FS_WB_CP_DATA completions so the
zero transition is serialized with cp_wait.lock. When the count reaches
zero, wake waiters while holding the same lock.

In f2fs_wait_on_all_pages(), prepare the waiter and recheck the page count
while holding cp_wait.lock before sleeping. This keeps the wakeup visible
to waiters without requiring the end_io callback to access sbi after the
F2FS_WB_CP_DATA count has reached zero. It also avoids a missed wakeup that
would otherwise make the waiter sleep until DEFAULT_SCHEDULE_TIMEOUT.

Fixes: ce2739e482bc ("f2fs: fix to avoid UAF in f2fs_write_end_io()")
Cc: stable@kernel.org
Signed-off-by: Wenjie Qi <qiwenjie@xiaomi.com>
---
 fs/f2fs/checkpoint.c | 20 ++++++++++++++++++--
 fs/f2fs/data.c       | 25 +++++++++++++++++--------
 2 files changed, 35 insertions(+), 10 deletions(-)

diff --git a/fs/f2fs/checkpoint.c b/fs/f2fs/checkpoint.c
index c00a6b6ebcbd..b16d2d30ec6a 100644
--- a/fs/f2fs/checkpoint.c
+++ b/fs/f2fs/checkpoint.c
@@ -1497,24 +1497,40 @@ static void unblock_operations(struct f2fs_sb_info *sbi)
 	f2fs_unlock_all(sbi);
 }
 
+static bool f2fs_prepare_cp_wait(struct f2fs_sb_info *sbi,
+				 struct wait_queue_entry *wait, int type)
+{
+	unsigned long flags;
+	bool wait_more;
+
+	prepare_to_wait(&sbi->cp_wait, wait, TASK_UNINTERRUPTIBLE);
+	spin_lock_irqsave(&sbi->cp_wait.lock, flags);
+	wait_more = get_pages(sbi, type);
+	spin_unlock_irqrestore(&sbi->cp_wait.lock, flags);
+
+	return wait_more;
+}
+
 void f2fs_wait_on_all_pages(struct f2fs_sb_info *sbi, int type)
 {
 	DEFINE_WAIT(wait);
 
 	for (;;) {
-		if (!get_pages(sbi, type))
+		if (!f2fs_prepare_cp_wait(sbi, &wait, type))
 			break;
 
 		if (unlikely(f2fs_cp_error(sbi) &&
 			!is_sbi_flag_set(sbi, SBI_IS_CLOSE)))
 			break;
+		finish_wait(&sbi->cp_wait, &wait);
 
 		if (type == F2FS_DIRTY_META)
 			f2fs_sync_meta_pages(sbi, LONG_MAX, FS_CP_META_IO);
 		else if (type == F2FS_WB_CP_DATA)
 			f2fs_submit_merged_write(sbi, DATA);
 
-		prepare_to_wait(&sbi->cp_wait, &wait, TASK_UNINTERRUPTIBLE);
+		if (!f2fs_prepare_cp_wait(sbi, &wait, type))
+			break;
 		io_schedule_timeout(DEFAULT_SCHEDULE_TIMEOUT);
 	}
 	finish_wait(&sbi->cp_wait, &wait);
diff --git a/fs/f2fs/data.c b/fs/f2fs/data.c
index d83a21998ec2..d92f0b70ba2f 100644
--- a/fs/f2fs/data.c
+++ b/fs/f2fs/data.c
@@ -392,15 +392,24 @@ static void f2fs_write_end_io(struct bio *bio)
 		if (f2fs_in_warm_node_list(folio))
 			f2fs_del_fsync_node_entry(sbi, folio);
 
-		dec_page_count(sbi, type);
+		if (type == F2FS_WB_CP_DATA) {
+			unsigned long flags;
 
-		/*
-		 * we should access sbi before folio_end_writeback() to
-		 * avoid racing w/ kill_f2fs_super()
-		 */
-		if (type == F2FS_WB_CP_DATA && !get_pages(sbi, type) &&
-				wq_has_sleeper(&sbi->cp_wait))
-			wake_up(&sbi->cp_wait);
+			/*
+			 * Hold cp_wait.lock across the zero transition and the
+			 * wakeup so f2fs_wait_on_all_pages() cannot miss it or
+			 * free sbi before this callback stops touching cp_wait.
+			 */
+			if (atomic_dec_and_lock_irqsave(&sbi->nr_pages[type],
+							&sbi->cp_wait.lock,
+							flags)) {
+				wake_up_locked(&sbi->cp_wait);
+				spin_unlock_irqrestore(&sbi->cp_wait.lock,
+						       flags);
+			}
+		} else {
+			dec_page_count(sbi, type);
+		}
 
 		folio_clear_f2fs_gcing(folio);
 		folio_end_writeback(folio);
-- 
2.43.0



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
