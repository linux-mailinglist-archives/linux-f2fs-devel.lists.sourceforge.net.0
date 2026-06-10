Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id q3SDL2+8KWohcgMAu9opvQ
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 10 Jun 2026 21:35:11 +0200
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B9B966C853
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 10 Jun 2026 21:35:11 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=lists.sourceforge.net header.s=beta header.b=b9Xicees;
	dkim=fail ("body hash did not verify") header.d=sourceforge.net header.s=x header.b=Z0O+mvZO;
	dkim=fail ("body hash did not verify") header.d=sf.net header.s=x header.b=kFEEGbh3;
	dkim=fail ("body hash did not verify") header.d=acm.org header.s=mr01 header.b=34SZQBgd;
	spf=pass (mail.lfdr.de: domain of linux-f2fs-devel-bounces@lists.sourceforge.net designates 216.105.38.7 as permitted sender) smtp.mailfrom=linux-f2fs-devel-bounces@lists.sourceforge.net;
	dmarc=pass (policy=none) header.from=lists.sourceforge.net
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:MIME-Version:References:In-Reply-To:
	Message-ID:Date:To:Sender:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=4vA/K+Z/MuoYWKO2vxdqObSI4n2po5jB8wfCl314DfY=; b=b9Xiceesr3bOUcholD3cB435BW
	8jn108NqbLTL/FG2cRKRu+w7PRYNzr1ZM8wvcfDTG/oixRqfPev67x9xZfYyyh5myRlPsTjrde+Wl
	G8DiwRRTP4WZJYVXDjOCkQoV8vhRwhjYh+w4nBg0Bbe65wVt6W6DjSD6Wi/KHkxAkMmM=;
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1wXOhh-0006yj-BB;
	Wed, 10 Jun 2026 19:35:06 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <bvanassche@acm.org>) id 1wXOhf-0006yc-HC
 for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 10 Jun 2026 19:35:05 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=XPsw0/K7hKg7V5u8LCalSQM3cy+Nljo38kHMgqijmQ8=; b=Z0O+mvZOZsgl+dIZCFV5rAGS6U
 vw4ArcwpEov+TOLPdqma+zHpR+wiQjJ9jX/CxWFXQoXbSxEanr+b/kA+HuHb8FAgtM6EybUtnkhG2
 JQi3uvTQnjQsAkS/OyQZF1hv3DFM+lW/I8o0qaxN2PreTPAYnAM91pRlMseCVTYPUSJU=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=XPsw0/K7hKg7V5u8LCalSQM3cy+Nljo38kHMgqijmQ8=; b=kFEEGbh3czuZ7OWrBeK3xpu8Dm
 QGXSSmE8DXNp8W5jjM1k3kjd6fZAvvD7q2cQ9PfZqsl4AjIc0Bhf4cr7qFuPPLfgb6Grsvlm+8YSZ
 ue21vvobZqf7w3TldE0GAKQZBRSkBQ8c4gu9tv7RU79PIJuYHe6xFzkkxH13eIQutThw=;
Received: from 013.lax.mailroute.net ([199.89.1.16])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1wXOhb-0001XV-Pa for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 10 Jun 2026 19:35:04 +0000
Received: from localhost (localhost [127.0.0.1])
 by 013.lax.mailroute.net (Postfix) with ESMTP id 4gbGFM0Dqgzlgr4B;
 Wed, 10 Jun 2026 19:34:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=acm.org; h=
 content-transfer-encoding:mime-version:references:in-reply-to
 :x-mailer:message-id:date:date:subject:subject:from:from
 :received:received; s=mr01; t=1781120083; x=1783712084; bh=XPsw0
 /K7hKg7V5u8LCalSQM3cy+Nljo38kHMgqijmQ8=; b=34SZQBgdG0WbbVXIEXIxu
 7luI+3y6RLgUMxaH5eLWMd9MRXC7fnywFTtR7U6Js2J7iJs0GbrwhgW1RrDD/bbD
 kFVCugrAWDrjr42FBUvqw1Sgy3+RzUESICqlQGQog2HdDsZFKkKvIN1d4Zm8eH5L
 Qn/F0Y4ESvfVSp+ANqPO1dPWhWoIa4qIsdsGOOwB7sJw/ti4MdbG8KuGGYxp3mYi
 IkCyB50b0r+1jvq/r9ygQtddu2UeosnF6Nvr/XdbZEGqpnazZKsflWcyjQMXv7PL
 AU3WDjkKB+kiH/XXnNm3PnBXg/tmZYGyw7jlbmTXxR1KnbZKaDtZRwOoQPnBWzSu
 g==
X-Virus-Scanned: by MailRoute
Received: from 013.lax.mailroute.net ([127.0.0.1])
 by localhost (013.lax [127.0.0.1]) (mroute_mailscanner, port 10029) with LMTP
 id bS8zMjVVOHAN; Wed, 10 Jun 2026 19:34:43 +0000 (UTC)
Received: from bvanassche.mtv.corp.google.com (unknown [104.135.180.219])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 (Authenticated sender: bvanassche@acm.org)
 by 013.lax.mailroute.net (Postfix) with ESMTPSA id 4gbGFG43kZzlffvd;
 Wed, 10 Jun 2026 19:34:42 +0000 (UTC)
To: Jaegeuk Kim <jaegeuk@kernel.org>
Date: Wed, 10 Jun 2026 12:34:18 -0700
Message-ID: <e19352ee328d76c26e629de55fb1e1570ed1fcbf.1781119949.git.bvanassche@acm.org>
X-Mailer: git-send-email 2.54.0.1099.g489fc7bff1-goog
In-Reply-To: <cover.1781119949.git.bvanassche@acm.org>
References: <cover.1781119949.git.bvanassche@acm.org>
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
 Prepare for using this workqueue for completing write bios. Reviewed-by:
 Chao Yu <chao@kernel.org> Signed-off-by: Bart Van Assche <bvanassche@acm.org>
 --- fs/f2fs/compress.c | 2 +- fs/f2fs/data.c | 22 ++++++++ fs/f2fs/f2fs.h
 | 6 +++--- fs/f2fs/su [...] 
 Content analysis details:   (-0.2 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
X-Headers-End: 1wXOhb-0001XV-Pa
Subject: [f2fs-dev] [PATCH v2 2/4] f2fs: Rename f2fs_post_read_wq into
 f2fs_wq
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
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-8.61 / 15.00];
	WHITELIST_DMARC(-7.00)[sourceforge.net:D:+];
	DMARC_POLICY_ALLOW_WITH_FAILURES(-0.50)[];
	RWL_MAILSPIKE_EXCELLENT(-0.40)[216.105.38.7:from];
	R_DKIM_ALLOW(-0.20)[lists.sourceforge.net:s=beta];
	R_SPF_ALLOW(-0.20)[+ip4:216.105.38.7:c];
	MAILLIST(-0.20)[mailman];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	DKIM_MIXED(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:jaegeuk@kernel.org,m:bvanassche@acm.org,m:linux-f2fs-devel@lists.sourceforge.net,s:lists@lfdr.de];
	ARC_NA(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	DMARC_POLICY_ALLOW(0.00)[lists.sourceforge.net,none];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER(0.00)[linux-f2fs-devel@lists.sourceforge.net,linux-f2fs-devel-bounces@lists.sourceforge.net];
	FORWARDED(0.00)[linux-f2fs-devel@lists.sourceforge.net];
	R_DKIM_REJECT(0.00)[sourceforge.net:s=x,sf.net:s=x,acm.org:s=mr01];
	DKIM_TRACE(0.00)[lists.sourceforge.net:+,sourceforge.net:-,sf.net:-,acm.org:-];
	REPLYTO_DOM_NEQ_TO_DOM(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	ALIAS_RESOLVED(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[linux-f2fs-devel@lists.sourceforge.net,linux-f2fs-devel-bounces@lists.sourceforge.net];
	REPLYTO_DOM_NEQ_FROM_DOM(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	HAS_REPLYTO(0.00)[bvanassche@acm.org];
	TAGGED_RCPT(0.00)[linux-f2fs-devel];
	RCPT_COUNT_THREE(0.00)[3];
	ASN(0.00)[asn:11320, ipnet:216.105.32.0/21, country:US];
	DBL_BLOCKED_OPENRESOLVER(0.00)[acm.org:replyto,acm.org:email,acm.org:mid,lists.sourceforge.net:helo,lists.sourceforge.net:rdns,lists.sourceforge.net:from_mime,lists.sourceforge.net:dkim,lists.sourceforge.net:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 0B9B966C853

Rename f2fs_post_read_wq into f2fs_wq. Create it unconditionally.
Prepare for using this workqueue for completing write bios.

Reviewed-by: Chao Yu <chao@kernel.org>
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
