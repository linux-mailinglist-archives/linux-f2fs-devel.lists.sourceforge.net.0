Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 8FLTEc2xGGoemQgAu9opvQ
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	for <lists+linux-f2fs-devel@lfdr.de>; Thu, 28 May 2026 23:21:17 +0200
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id C38055FA5AF
	for <lists+linux-f2fs-devel@lfdr.de>; Thu, 28 May 2026 23:21:16 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:MIME-Version:References:In-Reply-To:
	Message-ID:Date:To:Sender:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=FgYve/o8xCjL5OjpcusXoew9cSAHzhfWNYy32NNlsC0=; b=dGGyZo0d3F7AoKMWp5fIm17Hul
	RbWTfycgU3akUY6ZvUi4ZrAic0ktW4gFOS08etJia4UD7u4WN4WeYwgQK9ime7i1SlvFkag3yqQr+
	ziYWTORgJYbE30unBUCOu0GOPDSrOvJ+6tEW89cmRK70BFBe2PKspVJJgP8cFJk3lQPY=;
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1wSiAG-0005Fr-TK;
	Thu, 28 May 2026 21:21:14 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <bvanassche@acm.org>) id 1wSiAF-0005Fk-EZ
 for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 28 May 2026 21:21:12 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=n1VOSmKYD1rBYtN8Kre1Zg5NQryiUvUCCOyqR3Ikguc=; b=FGGmTGEuhCWUgRPkDhZFOCPz+7
 mmnGFhJvt8k5OjahG81gdxQlifgZwJncu3F0P9begmQuvH03RBw7XRbF/lthB+E/qLPbpG1xYQU6E
 q1N0lZ0DvSOsuEh4C5y/m81Qn4YESGGGmnoDEqHBLmgNSoIvs+D23TJsX2jmAbTjnVlY=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=n1VOSmKYD1rBYtN8Kre1Zg5NQryiUvUCCOyqR3Ikguc=; b=l74gldqhFCO8mfuOQICnoHlzK4
 gTpXvdvyQOTDfbdhzN5XasF+eDkCsr766vI84PayMoSKSarbWJzv1bwgJ+YqnQ5/cfEacBxuNYivS
 m8bnzHRYGiuW48XnLf8+bH6WS+bPWpX15E+AS5zC9n74w/DnCA3j+S0Wdohl3pS0XKoo=;
Received: from 013.lax.mailroute.net ([199.89.1.16])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1wSiAA-0002vD-UP for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 28 May 2026 21:21:12 +0000
Received: from localhost (localhost [127.0.0.1])
 by 013.lax.mailroute.net (Postfix) with ESMTP id 4gRKCk4vXwzlfwHM;
 Thu, 28 May 2026 21:20:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=acm.org; h=
 content-transfer-encoding:mime-version:references:in-reply-to
 :x-mailer:message-id:date:date:subject:subject:from:from
 :received:received; s=mr01; t=1780003247; x=1782595248; bh=n1VOS
 mKYD1rBYtN8Kre1Zg5NQryiUvUCCOyqR3Ikguc=; b=GbXUq5GqgmDziOyXw2k0R
 0Xrs3+ZxhlQhtvedcO6OK2ottbq7VT1EGfDPnXIwGfmajezGd22fqrADp44DCN7o
 YK2bw03t3k1L/LvjSJMDlL2Qm8kmAiVBU7yJEoCxqAMkJm1WqVSvnu1+3znQcQtA
 UzIouACL9aco1wgHkkEs6BADMulZ9WHWugkVqQH0gmWWMDeIFR5jEYcAvpopvhgU
 KP4Ix1vNGOgoWHK6pMtaxjEfHUjcbyS7T8nPtRIqAVe5yWS0CJY5GwMZBZyRbubc
 BpRSB5TTmbU4mX+YEva1VBBGobsXVxEptTCXmw4JQr7NFaOnPp/Kj0wtt3IUUfsw
 g==
X-Virus-Scanned: by MailRoute
Received: from 013.lax.mailroute.net ([127.0.0.1])
 by localhost (013.lax [127.0.0.1]) (mroute_mailscanner, port 10029) with LMTP
 id 3QhYEtL4fGNC; Thu, 28 May 2026 21:20:47 +0000 (UTC)
Received: from bvanassche.mtv.corp.google.com (unknown [104.135.180.219])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 (Authenticated sender: bvanassche@acm.org)
 by 013.lax.mailroute.net (Postfix) with ESMTPSA id 4gRKCf3hl5zlgyGm;
 Thu, 28 May 2026 21:20:46 +0000 (UTC)
To: Jaegeuk Kim <jaegeuk@kernel.org>
Date: Thu, 28 May 2026 14:20:28 -0700
Message-ID: <0e18152026cacd1e61fb5fb5483fc1d3c57bdc51.1780003055.git.bvanassche@acm.org>
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
 Content preview:  The bio_for_each_segment_all() loop can take more than 10
 ms for a large bio on an ARM little core. This is too much for interrupt
 context.
 Hence perform the write bio completion work asynchronously i [...] 
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
X-Headers-End: 1wSiAA-0002vD-UP
Subject: [f2fs-dev] [PATCH 4/4] f2fs: Run f2fs_write_end_io() asynchronously
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
X-Rspamd-Queue-Id: C38055FA5AF
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

The bio_for_each_segment_all() loop can take more than 10 ms for a large
bio on an ARM little core. This is too much for interrupt context. Hence
perform the write bio completion work asynchronously if a bio is large and
if f2fs_write_end_io() is called from atomic context. This patch reduces
the time spent in f2fs_write_end_io() from about 10 ms to about 150
microseconds on an Arm Cortex-A520 core.

Signed-off-by: Bart Van Assche <bvanassche@acm.org>
---
 fs/f2fs/data.c  | 21 ++++++++++++++++++++-
 fs/f2fs/f2fs.h  |  2 ++
 fs/f2fs/super.c |  5 +++++
 fs/f2fs/sysfs.c |  2 ++
 4 files changed, 29 insertions(+), 1 deletion(-)

diff --git a/fs/f2fs/data.c b/fs/f2fs/data.c
index 48c004976c4e..6e169490c4cf 100644
--- a/fs/f2fs/data.c
+++ b/fs/f2fs/data.c
@@ -409,11 +409,30 @@ static void f2fs_write_end_bio(struct bio *bio)
 	bio_put(bio);
 }
 
+static void f2fs_write_end_io_work(struct work_struct *work)
+{
+	struct bio *bio = &container_of(work, struct f2fs_bio, work)->bio;
+
+	f2fs_write_end_bio(bio);
+}
+
 static void f2fs_write_end_io(struct bio *bio)
 {
+	struct f2fs_sb_info *sbi;
+
 	iostat_update_and_unbind_ctx(bio);
 
-	f2fs_write_end_bio(bio);
+	sbi = bio->bi_private;
+
+	if (in_atomic() && bio->bi_iter.bi_size > sbi->max_atc_write_bio_size) {
+		struct work_struct *w;
+
+		w = &container_of(bio, struct f2fs_bio, bio)->work;
+		INIT_WORK(w, f2fs_write_end_io_work);
+		queue_work(sbi->wq, w);
+	} else {
+		f2fs_write_end_bio(bio);
+	}
 }
 
 #ifdef CONFIG_BLK_DEV_ZONED
diff --git a/fs/f2fs/f2fs.h b/fs/f2fs/f2fs.h
index 30353c439d3c..a6a3e01122e1 100644
--- a/fs/f2fs/f2fs.h
+++ b/fs/f2fs/f2fs.h
@@ -1763,6 +1763,8 @@ struct f2fs_sb_info {
 	struct f2fs_sm_info *sm_info;		/* segment manager */
 
 	/* for bio operations */
+	/* Largest write bio size completed in atomic context (atc). */
+	u32 max_atc_write_bio_size;
 	struct f2fs_bio_info *write_io[NR_PAGE_TYPE];	/* for write bios */
 	/* keep migration IO order for LFS mode */
 	struct f2fs_rwsem io_order_lock;
diff --git a/fs/f2fs/super.c b/fs/f2fs/super.c
index 5a100f740b3f..1e822380edb3 100644
--- a/fs/f2fs/super.c
+++ b/fs/f2fs/super.c
@@ -5007,6 +5007,11 @@ static int f2fs_fill_super(struct super_block *sb, struct fs_context *fc)
 
 	sb->s_fs_info = sbi;
 	sbi->raw_super = raw_super;
+	/*
+	 * SZ_16K restricts the time spent on completing writes to about 150
+	 * microseconds on an Arm Cortex-A520 core.
+	 */
+	sbi->max_atc_write_bio_size = SZ_16K;
 
 	INIT_WORK(&sbi->s_error_work, f2fs_record_error_work);
 	memcpy(sbi->errors, raw_super->s_errors, MAX_F2FS_ERRORS);
diff --git a/fs/f2fs/sysfs.c b/fs/f2fs/sysfs.c
index 352e96ad5c3a..70b2e9be8f8b 100644
--- a/fs/f2fs/sysfs.c
+++ b/fs/f2fs/sysfs.c
@@ -1266,6 +1266,7 @@ F2FS_SBI_RW_ATTR(gc_idle_interval, interval_time[GC_TIME]);
 F2FS_SBI_RW_ATTR(umount_discard_timeout, interval_time[UMOUNT_DISCARD_TIMEOUT]);
 F2FS_SBI_RW_ATTR(gc_pin_file_thresh, gc_pin_file_threshold);
 F2FS_SBI_RW_ATTR(gc_reclaimed_segments, gc_reclaimed_segs);
+F2FS_SBI_RW_ATTR(max_atc_write_bio_size, max_atc_write_bio_size);
 F2FS_SBI_GENERAL_RW_ATTR(max_victim_search);
 F2FS_SBI_GENERAL_RW_ATTR(migration_granularity);
 F2FS_SBI_GENERAL_RW_ATTR(migration_window_granularity);
@@ -1508,6 +1509,7 @@ static struct attribute *f2fs_attrs[] = {
 	ATTR_LIST(seq_file_ra_mul),
 	ATTR_LIST(gc_segment_mode),
 	ATTR_LIST(gc_reclaimed_segments),
+	ATTR_LIST(max_atc_write_bio_size),
 	ATTR_LIST(max_fragment_chunk),
 	ATTR_LIST(max_fragment_hole),
 	ATTR_LIST(current_atomic_write),


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
