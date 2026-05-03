Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 2Er3NRTW9mloZAIAu9opvQ
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	for <lists+linux-f2fs-devel@lfdr.de>; Sun, 03 May 2026 06:59:00 +0200
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 1683A4B477A
	for <lists+linux-f2fs-devel@lfdr.de>; Sun, 03 May 2026 06:58:59 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Subject:MIME-Version:Message-Id:Date:To:From:Sender:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=ObRiFawXqt7wDe69udZX8JKhASyaAs8r1aPDQm1/eNY=; b=X7QdkCp9Xdrg+PzvIDnWNQhXhN
	Z1zWQ7EJvBBEYcHE+xRjFkjJjiYc1xeXgJxEuzmLAHcD94wguoZMcB+b/akyQdrGrVI71wO1M3r4d
	P84SiAZVB0bgpQ9QOOLyKi30yx/l4dUESL4zxJg4X41IrstO8ErtYQeW3j1nWA/uv204=;
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1wJOuc-0004dN-UW;
	Sun, 03 May 2026 04:58:38 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <zzzccc427@gmail.com>) id 1wJOuc-0004dH-8p
 for linux-f2fs-devel@lists.sourceforge.net;
 Sun, 03 May 2026 04:58:38 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=bx/V9bGyVRo8uv3ZHvZhi/z5CN9+7hIS1jPr7RlO1vw=; b=M+YnjpVQaacvq08sIPGVtCnjs6
 /eNCA3wNFzoAfp4oTI1bNWzXq9mAOrzmr5CU+BXsbvQdQb0+UuSLVXvJFB6BiEAY3/p4LFS7w/xX2
 59r5+7IYqy1JytkN6ytmh0VDvB+yRjfKdqwPNLQE6BAGL+X4Sc2zWvIumvlcqjaOYbOY=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:Message-Id:Date:Subject:Cc:To:From
 :Sender:Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=bx/V9bGyVRo8uv3ZHvZhi/z5CN9+7hIS1jPr7RlO1vw=; b=a
 v9/3EPaghmwHXsl2dJX1+bDgEA5z/priZTq2sgq8s/BXxK/ZWOdfLYAqoONPdxvJKOKUI0uznKJxe
 FoSYTpDxX7TB/HXQpfkWebv46dPIRZQaLYQFjTivA6pkHXmikV5wAcrrTRCs+/gIjNHfwLDTgHqDh
 SyT5UGA0w/3MyJX8=;
Received: from mail-pl1-f175.google.com ([209.85.214.175])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1wJOub-0002vC-PV for linux-f2fs-devel@lists.sourceforge.net;
 Sun, 03 May 2026 04:58:38 +0000
Received: by mail-pl1-f175.google.com with SMTP id
 d9443c01a7336-2b458ca2296so17971655ad.0
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Sat, 02 May 2026 21:58:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1777784312; x=1778389112; darn=lists.sourceforge.net;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=bx/V9bGyVRo8uv3ZHvZhi/z5CN9+7hIS1jPr7RlO1vw=;
 b=eFPcgkcvy3MePUmEm/nfNrs0zpAavrGLsccy3AKD7F/gkQ296H+SqvvNvp4keiuT+s
 FLYO5cXmFuveYxCirNw6UO3vJJ5J+/QSZLedgWN+knsC1/3K+ZEBcv+H5B5Kd5i6+hOl
 HCrcNXTPRefuQl/680MR1HKq7Gg84pTAsOTcF4RIkgZ5dkoDyxEtwxjPnqeo4+tpW06T
 3qTKJVBex2l8KR9wZ0gtU8qHucVIsQnkHJYe9R9VrS8JpahVeekPVKNRwmEaLcxsal+H
 Unkxtt9yBo3/vCVv1xdCx7uPArnl4zxk+as+3UjGzDIHctoC792pEsB7t59x0DD39pnu
 gc9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1777784312; x=1778389112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=bx/V9bGyVRo8uv3ZHvZhi/z5CN9+7hIS1jPr7RlO1vw=;
 b=QP0mezzZkhVagsYbHj9iyBG3PzTYH2OyiZNrurxN1jsio/9qoEHk6dzJIMhU4F2ER+
 yKfj7bUIfOZQI9S+uyjIulbxrWqUzIVrlshWdBLHPJmpEWJn2dh/m9djgnY4GcPF0sve
 5hCrSs22s7GotcSSX7SxsG6yHZeAtHnPWfmq2ovdHlGEKdretAc1sA8ghcY0RhCh66wb
 ThGhbon3MzZL0s/8Z+89GmyYzbB8y7YU0H3jffe3/s9oFGKmZY3h7EMOvG+HgphnUHkY
 0eFN4yR7nL9L5Iqs1HKlmkgh5VM8k8aLM0ygIX3QHJ9sgPm+a5b6QxeLHJlhhg5Li4Bu
 J1JA==
X-Forwarded-Encrypted: i=1;
 AFNElJ+q2V0IxPy6PDRy7zf6ZGABp4M5br6sbK2e1bPm+GHq1ebhMS0MtFVTW48SiI+WkTwRy0pF9TyPZdoZwGBNmK0y@lists.sourceforge.net
X-Gm-Message-State: AOJu0Yw3iZ16xGfWFBlDaD72s+0ef33rD57Hojc1RcuVDhe4S5x2WRFG
 mmEzDibVOvJD8yd1qpei9pCgnDFv+Y9bhdUm3waR8iTquE4A4VDP5L9y
X-Gm-Gg: AeBDieu3BGUfemKMIA+sYHown1QNGsIL387eaMjUUGs8F01u1D/hsEYwEWXLBCE9miR
 0yRxVvNKKunK0hham+XvTbBlgnII49Sy38cQspYmu5BzWEQ9BKJ+olHnFFgObLqHOtQVsBzrzeT
 idG7R+vanPYNrhOOcuzr8Bqq1NtGyMEolT5klBDAO1q4PAzFewpqXQHWS84/TaDuR7zL4O83RNn
 E8bH643B0Bg6YwhrH/J7CmmfZ7bjnVvnFEVHAfsAVbEHoYoaL5+iQvj464qwv63WZqf+MnmBPIJ
 WYFcrU46AN293iPQ4gYl6uRUMKVqrVyAtZdGmv1nUTaHugFfsFOxxsYli8LKtXuMn4oySebPXgI
 WPrJnQ2UtjuVYs+eNdceAQ38945jT2R6ZY65Ae6OqWH7a6askVvTb6trqQCYIhWDd7/sE+2F32x
 9yYGH1DCKujpuQvCWUNOUGYDSMTTzY
X-Received: by 2002:a17:903:2885:b0:2b0:a957:304 with SMTP id
 d9443c01a7336-2b9f2566d07mr28812215ad.6.1777784311964; 
 Sat, 02 May 2026 21:58:31 -0700 (PDT)
Received: from localhost ([111.228.63.84]) by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-2b9caaadf8dsm66729695ad.23.2026.05.02.21.58.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 02 May 2026 21:58:31 -0700 (PDT)
From: Cen Zhang <zzzccc427@gmail.com>
To: jaegeuk@kernel.org,
	chao@kernel.org
Date: Sun,  3 May 2026 12:58:20 +0800
Message-Id: <20260503045820.973718-1-zzzccc427@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Spam-Score: 1.7 (+)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-1.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: The discard command control is built while the segment
 manager
 is constructed, before the node manager is built and before mount recovery
 has completed. Starting the discard thread from that construct [...] 
 Content analysis details:   (1.7 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain 1.0 HK_RANDOM_FROM         From username looks random
 0.6 HK_RANDOM_ENVFROM      Envelope sender username looks random
 0.0 FREEMAIL_FROM Sender email is commonly abused enduser mail provider
 [zzzccc427(at)gmail.com]
 0.2 FREEMAIL_ENVFROM_END_DIGIT Envelope-from freemail username ends in
 digit [zzzccc427(at)gmail.com]
 0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [209.85.214.175 listed in wl.mailspike.net]
X-Headers-End: 1wJOub-0002vC-PV
Subject: [f2fs-dev] [PATCH] f2fs: start discard thread after mount recovery
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
X-Rspamd-Queue-Id: 1683A4B477A
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.01 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	RWL_MAILSPIKE_EXCELLENT(-0.40)[216.105.38.7:from];
	R_DKIM_ALLOW(-0.20)[lists.sourceforge.net:s=beta];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:216.105.38.7];
	MIME_GOOD(-0.10)[text/plain];
	DMARC_POLICY_SOFTFAIL(0.10)[gmail.com : SPF not aligned (relaxed), DKIM not aligned (relaxed),none];
	HAS_LIST_UNSUB(-0.01)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	R_DKIM_REJECT(0.00)[sourceforge.net:s=x,sf.net:s=x,gmail.com:s=20251104];
	DKIM_MIXED(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:jaegeuk@kernel.org,m:chao@kernel.org,m:baijiaju1990@gmail.com,m:quic_stummala@quicinc.com,m:zzzccc427@gmail.com,m:linux-kernel@vger.kernel.org,m:linux-f2fs-devel@lists.sourceforge.net,s:lists@lfdr.de];
	FREEMAIL_CC(0.00)[gmail.com,quicinc.com,vger.kernel.org,lists.sourceforge.net];
	FORWARDED(0.00)[linux-f2fs-devel@lists.sourceforge.net];
	TO_DN_SOME(0.00)[];
	ARC_NA(0.00)[];
	FORGED_SENDER(0.00)[zzzccc427@gmail.com,linux-f2fs-devel-bounces@lists.sourceforge.net];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCVD_COUNT_FIVE(0.00)[5];
	PREVIOUSLY_DELIVERED(0.00)[linux-f2fs-devel@lists.sourceforge.net];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[zzzccc427@gmail.com,linux-f2fs-devel-bounces@lists.sourceforge.net];
	DKIM_TRACE(0.00)[lists.sourceforge.net:+,sourceforge.net:-,sf.net:-,gmail.com:-];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[7];
	ASN(0.00)[asn:11320, ipnet:216.105.32.0/21, country:US];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-f2fs-devel];
	FORGED_SENDER_MAILLIST(0.00)[]

The discard command control is built while the segment manager is
constructed, before the node manager is built and before mount recovery
has completed. Starting the discard thread from that constructor lets the
background thread run while f2fs_fill_super() is still publishing and
initializing mount-time state.

After commit d6d2b491a82e ("f2fs: allow to change discard policy based
on cached discard cmds"), issue_discard_thread() may consult node-manager
memory thresholds through f2fs_available_free_memory(). It can therefore
observe sbi->nm_info while f2fs_build_node_manager() is publishing and
initializing it. The same early-start window also lets the thread test
the superblock read-only state while recovery paths still make temporary
SB_RDONLY transitions.

Keep create_discard_cmd_control() limited to allocating and publishing
the command-control object, which recovery can use to queue discard
commands. Start the discard thread later in f2fs_fill_super(), after POR,
recovery, checkpoint option handling, and discard tuning have completed.
If starting the thread fails, unwind the shrinker and any GC thread that
may already have been started before continuing through the existing
mount-failure cleanup path.

Fixes: d6d2b491a82e1e411a6766fbfb87c697d8701554 ("f2fs: allow to change discard policy based on cached discard cmds")
Signed-off-by: Cen Zhang <zzzccc427@gmail.com>
---
 fs/f2fs/segment.c | 17 ++++-------------
 fs/f2fs/super.c   | 12 ++++++++++++
 2 files changed, 16 insertions(+), 13 deletions(-)

diff --git a/fs/f2fs/segment.c b/fs/f2fs/segment.c
index 8390994a8..deb98f564 100644
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
index 40079fd78..8228be53d 100644
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
