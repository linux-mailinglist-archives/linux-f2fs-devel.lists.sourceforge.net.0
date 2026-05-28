Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id s+5zDcGxGGoemQgAu9opvQ
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	for <lists+linux-f2fs-devel@lfdr.de>; Thu, 28 May 2026 23:21:05 +0200
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id C4F645FA595
	for <lists+linux-f2fs-devel@lfdr.de>; Thu, 28 May 2026 23:21:04 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:MIME-Version:References:In-Reply-To:
	Message-ID:Date:To:Sender:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=BSRFvCoxd+iRE/tzOtoNUEqV2yTWKJqq66Bqz7ZNmMs=; b=kIUODJPqLWmI54TcU90hYyjRnD
	wsOqfI/3xVcvEAHtOY0R943YbXtUUQmO7Kf4ImKbNO8itaPXpOuab6S2gh5UIZSbFNR1jF6IS/kwW
	Dnv2AN0Vn5Ukcjq8uss0U9Zy/PSUq1WUF9PlJkSc+jYl16SYH7Rv6SKUYnHDFvmnoH7o=;
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1wSiA2-0001gw-8r;
	Thu, 28 May 2026 21:21:02 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <bvanassche@acm.org>) id 1wSiA1-0001gi-7S
 for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 28 May 2026 21:21:01 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=qOKUQ2eanIUmTlb/4O9rznB2fBHJbNK+dlUx4cQV5Yg=; b=GcB4wi/LK1uK5WFeL6CTqcxySg
 t8vpe3nRiyXpk+Vu8HZVyQPOtD8UtrTptlN3JLCguQLYwV7V/nq5DylEMwPeN18lFVBnTP+5Vgnyy
 dLk6SoGRGQ7kaS+oC46ihC/CKzWMPQjW3gue/JQpPBd6YjT+10Ww/uXWihRe5ozpY5Hs=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=qOKUQ2eanIUmTlb/4O9rznB2fBHJbNK+dlUx4cQV5Yg=; b=J8pNviYl4hHvWl1oNm3b6v4mHk
 Jbwbi5n35tKNryip97sMZYaI2S/XNf+hK7XmNul70G1laMzk0GNyQSpRNLdo2KVm6fEebVLOHqyQq
 JQCDG/KuKt3vlMwBU+V+23sKHKov5R/SR8JqjebnOnZK5LSg+VGIhRTPTG/wKhny//nU=;
Received: from 013.lax.mailroute.net ([199.89.1.16])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1wSi9z-0002uV-5m for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 28 May 2026 21:21:01 +0000
Received: from localhost (localhost [127.0.0.1])
 by 013.lax.mailroute.net (Postfix) with ESMTP id 4gRKCg61y5zlfdfC;
 Thu, 28 May 2026 21:20:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=acm.org; h=
 content-transfer-encoding:mime-version:references:in-reply-to
 :x-mailer:message-id:date:date:subject:subject:from:from
 :received:received; s=mr01; t=1780003244; x=1782595245; bh=qOKUQ
 2eanIUmTlb/4O9rznB2fBHJbNK+dlUx4cQV5Yg=; b=1XFCIETHzIYL6jAccB7n/
 q9LqlLBX5BIyJbWdszYynqGcVpb0b4BUMq1667mlGkz9Mf1i5R9NhuIwM2dEUBB8
 g2s3bTcAd+EvLM1ikcoys/3rlZs1HTxNhYuJRqGVJfVZvCEXybuC3MgkDd2nQfT3
 O07TdoNFVsrtwrc0A+/EV8rkdd4MrwgHs2683dXZ9t1nzQqp7WmVWD0WQGQ28M1F
 xHyrxgjAedQUf2QwPS48gklUqBSlyVgdwa2NE7155At/FMXTzEIi/fzppBe/kR7M
 28LKLPxpdyPHKR5veTkHBrWytfEUcWZn/PmkGS69Pg3uwYVFxxbFoGp4c/R7X5sd
 g==
X-Virus-Scanned: by MailRoute
Received: from 013.lax.mailroute.net ([127.0.0.1])
 by localhost (013.lax [127.0.0.1]) (mroute_mailscanner, port 10029) with LMTP
 id t4iZcNJR2weX; Thu, 28 May 2026 21:20:44 +0000 (UTC)
Received: from bvanassche.mtv.corp.google.com (unknown [104.135.180.219])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 (Authenticated sender: bvanassche@acm.org)
 by 013.lax.mailroute.net (Postfix) with ESMTPSA id 4gRKCb3ggSzlfc3v;
 Thu, 28 May 2026 21:20:42 +0000 (UTC)
To: Jaegeuk Kim <jaegeuk@kernel.org>
Date: Thu, 28 May 2026 14:20:26 -0700
Message-ID: <b2addb590d05b91a724382bdf94d2e4bc9797982.1780003055.git.bvanassche@acm.org>
X-Mailer: git-send-email 2.54.0.823.g6e5bcc1fc9-goog
In-Reply-To: <cover.1780003055.git.bvanassche@acm.org>
References: <cover.1780003055.git.bvanassche@acm.org>
MIME-Version: 1.0
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-2.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: Rename f2fs_post_read_wq into f2fs_wq. Create it
 unconditionally.
 Prepare for using this workqueue for completing write bios. Signed-off-by:
 Bart Van Assche <bvanassche@acm.org> --- fs/f2fs/compress.c | 2 +-
 fs/f2fs/data.c
 | 22 ++++++++ fs/f2fs/f2fs.h | 6 +++--- fs/f2fs/super.c | 8 ++++---- 4 files
 changed, 16 [...] 
 Content analysis details:   (-0.2 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
X-Headers-End: 1wSi9z-0002uV-5m
Subject: [f2fs-dev] [PATCH 2/4] f2fs: Rename f2fs_post_read_wq into f2fs_wq
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
From: Bart Van Assche via Linux-f2fs-devel
 <linux-f2fs-devel@lists.sourceforge.net>
Reply-To: Bart Van Assche <bvanassche@acm.org>
Cc: Bart Van Assche <bvanassche@acm.org>,
 linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net
X-Spamd-Result: default: False [-8.61 / 15.00];
	WHITELIST_DMARC(-7.00)[sourceforge.net:D:+];
	DMARC_POLICY_ALLOW_WITH_FAILURES(-0.50)[];
	RWL_MAILSPIKE_EXCELLENT(-0.40)[216.105.38.7:from];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:216.105.38.7:c];
	R_DKIM_ALLOW(-0.20)[lists.sourceforge.net:s=beta];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DKIM_MIXED(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:jaegeuk@kernel.org,m:bvanassche@acm.org,m:linux-f2fs-devel@lists.sourceforge.net,s:lists@lfdr.de];
	DMARC_POLICY_ALLOW(0.00)[lists.sourceforge.net,none];
	MIME_TRACE(0.00)[0:+];
	TO_DN_SOME(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORWARDED(0.00)[linux-f2fs-devel@lists.sourceforge.net];
	ARC_NA(0.00)[];
	FORGED_SENDER(0.00)[linux-f2fs-devel@lists.sourceforge.net,linux-f2fs-devel-bounces@lists.sourceforge.net];
	R_DKIM_REJECT(0.00)[sourceforge.net:s=x,sf.net:s=x,acm.org:s=mr01];
	DKIM_TRACE(0.00)[lists.sourceforge.net:+,sourceforge.net:-,sf.net:-,acm.org:-];
	REPLYTO_DOM_NEQ_TO_DOM(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[linux-f2fs-devel@lists.sourceforge.net,linux-f2fs-devel-bounces@lists.sourceforge.net];
	REPLYTO_DOM_NEQ_FROM_DOM(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_RCPT(0.00)[linux-f2fs-devel];
	RCPT_COUNT_THREE(0.00)[3];
	ASN(0.00)[asn:11320, ipnet:216.105.32.0/21, country:US];
	HAS_REPLYTO(0.00)[bvanassche@acm.org]
X-Rspamd-Queue-Id: C4F645FA595
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Rename f2fs_post_read_wq into f2fs_wq. Create it unconditionally.
Prepare for using this workqueue for completing write bios.

Signed-off-by: Bart Van Assche <bvanassche@acm.org>
---
 fs/f2fs/compress.c |  2 +-
 fs/f2fs/data.c     | 22 ++++++++--------------
 fs/f2fs/f2fs.h     |  6 +++---
 fs/f2fs/super.c    |  8 ++++----
 4 files changed, 16 insertions(+), 22 deletions(-)

diff --git a/fs/f2fs/compress.c b/fs/f2fs/compress.c
index 881e76158b96..b3c016c4094b 100644
--- a/fs/f2fs/compress.c
+++ b/fs/f2fs/compress.c
@@ -1807,7 +1807,7 @@ static void f2fs_put_dic(struct decompress_io_ctx *dic, bool in_task)
 			f2fs_free_dic(dic, false);
 		} else {
 			INIT_WORK(&dic->free_work, f2fs_late_free_dic);
-			queue_work(dic->sbi->post_read_wq, &dic->free_work);
+			queue_work(dic->sbi->wq, &dic->free_work);
 		}
 	}
 }
diff --git a/fs/f2fs/data.c b/fs/f2fs/data.c
index 1659a57a6d5b..080d69fa8cd1 100644
--- a/fs/f2fs/data.c
+++ b/fs/f2fs/data.c
@@ -341,7 +341,7 @@ static void f2fs_read_end_io(struct bio *bio)
 			f2fs_handle_step_decompress(ctx, intask);
 		} else if (enabled_steps) {
 			INIT_WORK(&ctx->work, f2fs_post_read_work);
-			queue_work(ctx->sbi->post_read_wq, &ctx->work);
+			queue_work(ctx->sbi->wq, &ctx->work);
 			return;
 		}
 	}
@@ -4477,23 +4477,17 @@ void f2fs_destroy_post_read_processing(void)
 	kmem_cache_destroy(bio_post_read_ctx_cache);
 }
 
-int f2fs_init_post_read_wq(struct f2fs_sb_info *sbi)
+int f2fs_init_wq(struct f2fs_sb_info *sbi)
 {
-	if (!f2fs_sb_has_encrypt(sbi) &&
-		!f2fs_sb_has_verity(sbi) &&
-		!f2fs_sb_has_compression(sbi))
-		return 0;
-
-	sbi->post_read_wq = alloc_workqueue("f2fs_post_read_wq",
-						 WQ_UNBOUND | WQ_HIGHPRI,
-						 num_online_cpus());
-	return sbi->post_read_wq ? 0 : -ENOMEM;
+	sbi->wq = alloc_workqueue("f2fs_wq", WQ_UNBOUND | WQ_HIGHPRI,
+				  num_online_cpus());
+	return sbi->wq ? 0 : -ENOMEM;
 }
 
-void f2fs_destroy_post_read_wq(struct f2fs_sb_info *sbi)
+void f2fs_destroy_wq(struct f2fs_sb_info *sbi)
 {
-	if (sbi->post_read_wq)
-		destroy_workqueue(sbi->post_read_wq);
+	if (sbi->wq)
+		destroy_workqueue(sbi->wq);
 }
 
 int __init f2fs_init_bio_entry_cache(void)
diff --git a/fs/f2fs/f2fs.h b/fs/f2fs/f2fs.h
index 91f506e7c9cf..30353c439d3c 100644
--- a/fs/f2fs/f2fs.h
+++ b/fs/f2fs/f2fs.h
@@ -1969,7 +1969,7 @@ struct f2fs_sb_info {
 	/* Precomputed FS UUID checksum for seeding other checksums */
 	__u32 s_chksum_seed;
 
-	struct workqueue_struct *post_read_wq;	/* post read workqueue */
+	struct workqueue_struct *wq;		/* bio completion workqueue */
 
 	/*
 	 * If we are in irq context, let's update error information into
@@ -4193,8 +4193,8 @@ bool f2fs_overwrite_io(struct inode *inode, loff_t pos, size_t len);
 void f2fs_clear_page_cache_dirty_tag(struct folio *folio);
 int f2fs_init_post_read_processing(void);
 void f2fs_destroy_post_read_processing(void);
-int f2fs_init_post_read_wq(struct f2fs_sb_info *sbi);
-void f2fs_destroy_post_read_wq(struct f2fs_sb_info *sbi);
+int f2fs_init_wq(struct f2fs_sb_info *sbi);
+void f2fs_destroy_wq(struct f2fs_sb_info *sbi);
 extern const struct iomap_ops f2fs_iomap_ops;
 
 /*
diff --git a/fs/f2fs/super.c b/fs/f2fs/super.c
index ccf806b676f5..5a100f740b3f 100644
--- a/fs/f2fs/super.c
+++ b/fs/f2fs/super.c
@@ -2074,7 +2074,7 @@ static void f2fs_put_super(struct super_block *sb)
 	/* flush s_error_work before sbi destroy */
 	flush_work(&sbi->s_error_work);
 
-	f2fs_destroy_post_read_wq(sbi);
+	f2fs_destroy_wq(sbi);
 
 	kvfree(sbi->ckpt);
 
@@ -5130,9 +5130,9 @@ static int f2fs_fill_super(struct super_block *sb, struct fs_context *fc)
 		goto free_devices;
 	}
 
-	err = f2fs_init_post_read_wq(sbi);
+	err = f2fs_init_wq(sbi);
 	if (err) {
-		f2fs_err(sbi, "Failed to initialize post read workqueue");
+		f2fs_err(sbi, "Failed to create workqueue");
 		goto free_devices;
 	}
 
@@ -5419,7 +5419,7 @@ static int f2fs_fill_super(struct super_block *sb, struct fs_context *fc)
 	f2fs_stop_ckpt_thread(sbi);
 	/* flush s_error_work before sbi destroy */
 	flush_work(&sbi->s_error_work);
-	f2fs_destroy_post_read_wq(sbi);
+	f2fs_destroy_wq(sbi);
 free_devices:
 	destroy_device_list(sbi);
 	kvfree(sbi->ckpt);


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
