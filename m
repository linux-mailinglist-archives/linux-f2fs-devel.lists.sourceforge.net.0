Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id +KiKJOGg+GlExQIAu9opvQ
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 04 May 2026 15:36:33 +0200
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id B31F34BDF60
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 04 May 2026 15:36:32 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Subject:MIME-Version:Message-Id:Date:To:From:Sender:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=89vULHf+HZk7ng1kIX9tYuw4RasZZkl3XCu3Ml7A/Ig=; b=D6TbRBfu9MQXB+/DhrMqLyTYIY
	8uLCGn8TENB2VMndHxz8saOZ7NRAhLggn9SjFTX0Pp2+S1x+OyYMq3FWNtQuEqSyQlNBlrephaUUl
	VDKfqJoZpB6CFonHqWfoNrW6R75CIJ+8eYtHj0idDneim+m9WknHHoXOV1SoOTFfdHlQ=;
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1wJtTC-0004rt-1i;
	Mon, 04 May 2026 13:36:19 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <zzzccc427@gmail.com>) id 1wJtTA-0004rj-CQ
 for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 04 May 2026 13:36:17 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=8H2f2k29lbWfTJB0lfO3QkuoExzwF2AG5/RWyRyUBG8=; b=VdgP6QHUD+PqDzR7Ejagkp9yGU
 14rba79KF3aHVypHrTyhjaFT4v7lbb1PCMdTO5CQR4v4LUtSBmfvUBySPLBUj6PKzRTmWzmAqcg8Y
 cggdQp/7AlyNw50psVqAaMGMQFfjrAnxLZp4Rh+0cZqtyu8jPtanNYe1WobyC+y0L7nY=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:Message-Id:Date:Subject:Cc:To:From
 :Sender:Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=8H2f2k29lbWfTJB0lfO3QkuoExzwF2AG5/RWyRyUBG8=; b=V
 fDctHU44vxLZdLBYjrOrh1m5eYHn21gR20vWVJCnuQvPP+ulFsygHq87Caaqch8Q3Mou/OMKvMY6g
 tsXnDTmIVJEJxzBggQ/Q+K3IdZZG+/xjFyfXrarooZYbVBzBWNsPiv0DYDNOcfkD8JwFHAQBzF9QU
 XRfkSvkfmNtbHgcI=;
Received: from mail-pl1-f177.google.com ([209.85.214.177])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1wJtT7-0003xT-EG for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 04 May 2026 13:36:17 +0000
Received: by mail-pl1-f177.google.com with SMTP id
 d9443c01a7336-2ab39b111b9so17097395ad.1
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Mon, 04 May 2026 06:36:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1777901767; x=1778506567; darn=lists.sourceforge.net;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=8H2f2k29lbWfTJB0lfO3QkuoExzwF2AG5/RWyRyUBG8=;
 b=J91zNH6qxK/gAqPJNCnuYwUWFCjQ0xbqinWQpMVFhXeYYfN0Ao1d0PIeQFaTStQOgd
 ttv/eCulAvOcSR48dj19OFPzYXoOpizc8v+IabeCAtv0JV3Nfmqt7jOt6El97E2iHZpE
 +6aFNkyeWUfBMll8dHrGHB9zBLTFPYQ685ERPWQPoLgiCW5uYFcmkHQFtmS6WsN2P8fp
 Ny8Na+gXe7Ap0glVzyj8Ca9+jGd7Qr7W1UioFFbx6hUyNzaBRZcM314BiIEj4n6tpc8n
 hZe+mWfbgrjEUj1MmJYjv5UVHShgXTPKv5FEWeLI+NWHr9p95wPSxIOrNJT1DBxGnw8g
 q77w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1777901767; x=1778506567;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=8H2f2k29lbWfTJB0lfO3QkuoExzwF2AG5/RWyRyUBG8=;
 b=f+yvcVZh2PBBPHexIF9kPGaKmbIus2+BrmwQ8MIuChjVxKj0Xy/5yy45EOlTu7d5AX
 F9PDIX+E8WK+8DTPNdIJrCpo6ZsXwa75+YKbWpNASqYeaQJhpWoEViKmPPN9nFFHDa6Q
 RNu4OcHBClsQbO2yRaTiqFuVbTdiFEdnZWrp12rG7+SgAPmAZ40HTpPTJbi1iJqIqDjY
 7wrkpyIp5fakzgXco0DVxCFuNNCYUNaKMr0eBDNa3GlGRzRzn0HIrry3kSUwBFmfoQX/
 wIP8hpRVGduRagHj6Zvf076nUfvGgcvdBMHdjs19s1m/C2jakOEaHIsJW29iAVZSyImN
 f2fw==
X-Forwarded-Encrypted: i=1;
 AFNElJ9HPgIBWrZw1TUIgElFbZoB4gNDRSwG8PHYu/7ktZ1SmNrDDfsrfsiqJpZL1ul5IgAoQjEohn1+gtETPNbvyNYZ@lists.sourceforge.net
X-Gm-Message-State: AOJu0YyCt8XzSzOPJ1HeLBLAZtyioeFffJk5UI8kV0+TOl9xu8h3/w4X
 ha0sViiaDgE+gTKD96X1CRBiX1V7mtkdouVkgvP87sxIj3Co+0pBNlKKRIKRIVT4
X-Gm-Gg: AeBDievBMcsHT9juVzK+hOxU7M3/GpT+WLfMhGj8iZIz/fupYbZ4rFCOK5Bt3Dw1lvV
 n4bXkH5XpGfre+PSoW8y05tlbm8GmeC7zgptiny1gn9DI+mjonAY+UPloZJ9QYvlk0sIXVjf6FC
 hS1fk+km+h8r1FeE5JKgsdo0dUQrIe9a4Y6TtRlr29h36Ck9/zx2WO5/TPah3VDp/psZU9o5jBt
 fB0Et2PEHIjCHUG9Xbq5YAHoU7FkGXkUF4fJAXtaCFu1m6q164sonOKYk1mjKALPPl6f69PWdUS
 xVqL4MRM/XmPx9GOhM+pdmv1EtV7f91drmz0G2DdLmNpEhslhXEjJUb4Fb7iR17YzOGJkQpNA2z
 9d7HAG98QXO7gG7GUa1r4iV1c/jQuCu4f0bYFPgkLzyi8ZL4yb207iWYcz3uScJ5Vgk5ab6SNVM
 /vlEbkMm3qpmkg4qt9PsEUxSObDNTE
X-Received: by 2002:a17:902:cec7:b0:2b2:5491:e32f with SMTP id
 d9443c01a7336-2b9f2579e8dmr97533225ad.16.1777901766441; 
 Mon, 04 May 2026 06:36:06 -0700 (PDT)
Received: from localhost ([111.228.63.84]) by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-2b9cae3b8e6sm99839635ad.65.2026.05.04.06.35.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 04 May 2026 06:36:06 -0700 (PDT)
From: Cen Zhang <zzzccc427@gmail.com>
To: jaegeuk@kernel.org,
	chao@kernel.org
Date: Mon,  4 May 2026 21:35:52 +0800
Message-Id: <20260504133552.1902811-1-zzzccc427@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Spam-Score: 2.1 (++)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-1.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: create_discard_cmd_control() is called from
 f2fs_build_segment_manager(), 
 before f2fs_build_node_manager() and mount recovery have completed. It
 currently starts the discard thread immediately, so iss [...] 
 Content analysis details:   (2.1 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 RCVD_IN_MSPIKE_H3      RBL: Good reputation (+3)
 [209.85.214.177 listed in wl.mailspike.net]
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
 1.0 HK_RANDOM_FROM         From username looks random
 1.0 HK_RANDOM_ENVFROM      Envelope sender username looks random
 0.0 FREEMAIL_FROM Sender email is commonly abused enduser mail provider
 [zzzccc427(at)gmail.com]
 0.2 FREEMAIL_ENVFROM_END_DIGIT Envelope-from freemail username ends in
 digit [zzzccc427(at)gmail.com]
X-Headers-End: 1wJtT7-0003xT-EG
Subject: [f2fs-dev] [PATCH v2] f2fs: start discard thread after mount
 recovery
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
Cc: baijiaju1990@gmail.com, quic_stummala@quicinc.com,
 Cen Zhang <zzzccc427@gmail.com>, linux-kernel@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net
X-Rspamd-Queue-Id: B31F34BDF60
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.01 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	RWL_MAILSPIKE_EXCELLENT(-0.40)[216.105.38.7:from];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:216.105.38.7];
	R_DKIM_ALLOW(-0.20)[lists.sourceforge.net:s=beta];
	DMARC_POLICY_SOFTFAIL(0.10)[gmail.com : SPF not aligned (relaxed), DKIM not aligned (relaxed),none];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	DKIM_MIXED(0.00)[];
	FREEMAIL_CC(0.00)[gmail.com,quicinc.com,vger.kernel.org,lists.sourceforge.net];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER(0.00)[zzzccc427@gmail.com,linux-f2fs-devel-bounces@lists.sourceforge.net];
	ARC_NA(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	FORGED_RECIPIENTS(0.00)[m:jaegeuk@kernel.org,m:chao@kernel.org,m:baijiaju1990@gmail.com,m:quic_stummala@quicinc.com,m:zzzccc427@gmail.com,m:linux-kernel@vger.kernel.org,m:linux-f2fs-devel@lists.sourceforge.net,s:lists@lfdr.de];
	TO_DN_SOME(0.00)[];
	FORWARDED(0.00)[linux-f2fs-devel@lists.sourceforge.net];
	MIME_TRACE(0.00)[0:+];
	R_DKIM_REJECT(0.00)[sourceforge.net:s=x,sf.net:s=x,gmail.com:s=20251104];
	DKIM_TRACE(0.00)[lists.sourceforge.net:+,sourceforge.net:-,sf.net:-,gmail.com:-];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PREVIOUSLY_DELIVERED(0.00)[linux-f2fs-devel@lists.sourceforge.net];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[zzzccc427@gmail.com,linux-f2fs-devel-bounces@lists.sourceforge.net];
	FORGED_SENDER_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[7];
	ASN(0.00)[asn:11320, ipnet:216.105.32.0/21, country:US];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-f2fs-devel];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.sourceforge.net:helo,lists.sourceforge.net:dkim,lists.sourceforge.net:rdns]

create_discard_cmd_control() is called from f2fs_build_segment_manager(),
before f2fs_build_node_manager() and mount recovery have completed.  It
currently starts the discard thread immediately, so issue_discard_thread()
can run while f2fs_fill_super() is still initializing mount-time state.

This is not the failure-unwind case where free_nm stops the discard
thread before f2fs_destroy_node_manager() frees nm_info.  The window is
earlier: the thread may run while f2fs_build_node_manager() has published
sbi->nm_info but init_node_manager() is still initializing it.  After
commit d6d2b491a82e, issue_discard_thread() may call
f2fs_available_free_memory() and read fields such as nm_i->ram_thresh.

The same early-start window also lets the discard thread observe the
superblock read-only state while mount recovery is still making temporary
SB_RDONLY transitions.

Keep the discard command control available early, but start the discard
thread later in f2fs_fill_super(), after node-manager initialization and
mount recovery have completed.


Fixes: d6d2b491a82e1e411a6766fbfb87c697d8701554 ("f2fs: allow to change discard policy based on cached discard cmds")
Signed-off-by: Cen Zhang <zzzccc427@gmail.com>
---
 fs/f2fs/segment.c | 17 ++++-------------
 fs/f2fs/super.c   | 12 ++++++++++++
 2 files changed, 16 insertions(+), 13 deletions(-)

diff --git a/fs/f2fs/segment.c b/fs/f2fs/segment.c
index 8390994a8826..deb98f564165 100644
--- a/fs/f2fs/segment.c
+++ b/fs/f2fs/segment.c
@@ -2302,12 +2302,10 @@ int f2fs_start_discard_thread(struct f2fs_sb_info *sbi)
 static int create_discard_cmd_control(struct f2fs_sb_info *sbi)
 {
 	struct discard_cmd_control *dcc;
-	int err = 0, i;
+	int i;
 
-	if (SM_I(sbi)->dcc_info) {
-		dcc = SM_I(sbi)->dcc_info;
-		goto init_thread;
-	}
+	if (SM_I(sbi)->dcc_info)
+		return 0;
 
 	dcc = f2fs_kzalloc(sbi, sizeof(struct discard_cmd_control), GFP_KERNEL);
 	if (!dcc)
@@ -2344,14 +2342,7 @@ static int create_discard_cmd_control(struct f2fs_sb_info *sbi)
 
 	init_waitqueue_head(&dcc->discard_wait_queue);
 	SM_I(sbi)->dcc_info = dcc;
-init_thread:
-	err = f2fs_start_discard_thread(sbi);
-	if (err) {
-		kfree(dcc);
-		SM_I(sbi)->dcc_info = NULL;
-	}
-
-	return err;
+	return 0;
 }
 
 static void destroy_discard_cmd_control(struct f2fs_sb_info *sbi)
diff --git a/fs/f2fs/super.c b/fs/f2fs/super.c
index 40079fd7886b..8228be53d036 100644
--- a/fs/f2fs/super.c
+++ b/fs/f2fs/super.c
@@ -5340,6 +5340,15 @@ static int f2fs_fill_super(struct super_block *sb, struct fs_context *fc)
 
 	f2fs_tuning_parameters(sbi);
 
+	/*
+	 * After POR and mount-time recovery, we can run the discard thread. It
+	 * reads node-manager memory thresholds and the superblock read-only
+	 * state, so keep it out of the fill_super() initialization window.
+	 */
+	err = f2fs_start_discard_thread(sbi);
+	if (err)
+		goto leave_shrinker;
+
 	f2fs_notice(sbi, "Mounted with checkpoint version = %llx",
 		    cur_cp_version(F2FS_CKPT(sbi)));
 	f2fs_update_time(sbi, CP_TIME);
@@ -5349,6 +5358,9 @@ static int f2fs_fill_super(struct super_block *sb, struct fs_context *fc)
 	sbi->umount_lock_holder = NULL;
 	return 0;
 
+leave_shrinker:
+	f2fs_leave_shrinker(sbi);
+	f2fs_stop_gc_thread(sbi);
 sync_free_meta:
 	/* safe to flush all the data */
 	sync_filesystem(sbi->sb);
-- 
2.43.0



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
