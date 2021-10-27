Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 95BA743D7C8
	for <lists+linux-f2fs-devel@lfdr.de>; Thu, 28 Oct 2021 01:55:50 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.94.2)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1mfslm-0006t1-GG; Wed, 27 Oct 2021 23:55:45 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <daeho43@gmail.com>) id 1mfsll-0006sb-2N
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 27 Oct 2021 23:55:43 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=vg6E5OmGYHn5+IyE3WrLoYyvAdoqCM0a4q0JJegvWrM=; b=VcnkHa/ppB+Kyii5OWkAE/cido
 PAFMs+MwdfGehsL73IRh7/5Nxk9KWUJss1RCgKxkywzWKT4aJkySDberr5UemBCZcOuWf/O+HaB2o
 KfgSJr4U/QEja0IoQYGdsG3ORlXtVsLksERTDvWmOcpflg47tVbBmNIC7Ubee7K9+IHk=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:Message-Id:Date:Subject:Cc:To:From
 :Sender:Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=vg6E5OmGYHn5+IyE3WrLoYyvAdoqCM0a4q0JJegvWrM=; b=h
 2L/rfnHudS2nVJnM2AFTVzqgyswNe/XU/vkd2KKmSHyYurDkWUtpfrtymx9Y4zUQJ5aS2VuRHzgEH
 3Z0Qyp/ygtRQmvpQCa16LK0tmD+5+SsWFYbV8s89sgrLb2X1bH83ZhIugBbf3QpByylcHfTqS15tP
 EwhAoep8SfsKBlEg=;
Received: from mail-oi1-f170.google.com ([209.85.167.170])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.92.3)
 id 1mfsld-002Lx1-VQ
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 27 Oct 2021 23:55:43 +0000
Received: by mail-oi1-f170.google.com with SMTP id x8so1521395oix.2
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Wed, 27 Oct 2021 16:55:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=vg6E5OmGYHn5+IyE3WrLoYyvAdoqCM0a4q0JJegvWrM=;
 b=HOcNND3NwAYdfC1iNgX23mLTtOXmPIeoXtLFFSOH8mSPtJPxBBFyvKWiHvpKsSy8We
 IwxkX99QGe6YVajOZUV4bNuLB280NVgc15b+Ai/mLg+LY1Iu+UlYz4TRoPEu+gLuf1TI
 RRbLh+nA93ctjQuxpPc9kUHRv7MkDqdFYfItF+1z1m6SBNtzKuEH6Gg8pOAlOynKCAkq
 OZJGWw5f6YoIlx9LmLTFRRDUB9DRIxnaC2ZRxuQsUrl7sHWxO0BsyjEZAPlTZw4tjhnk
 emvD7ZyM0HQgqSngwBM2to43ZkPGBfcP3rp3KS8Xe5DgqCnMh8RszzBDnohYhPgLAGnZ
 HXpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=vg6E5OmGYHn5+IyE3WrLoYyvAdoqCM0a4q0JJegvWrM=;
 b=6ISutl3Gqc93jnujLbsyM7wc2pxwDPgeXsKBHQrxbuNjHlxOSi4dCzoWeoVAC9az6T
 O7vAleHyWd99k7g6AonvdI0HVQ6kvXtmbXl9Zr1x7ETaOly4QaMu3z3cvctkT0l4jJVY
 ycGnXqmWq63MoJhJeL4te0L6KVILETidLhBXmRK0Y8MdgrjhNS5TE5x3G5lT8lg8SwiP
 kIj6M/5eMF2gtoafCTm7acxuPix2VzRTxVPZ1KjykU21yk5iifY6pgqWqFr+wrvMN+Bo
 7CsIH94VOzc4pNnmta4vx0ep0ciMfbOGYhPKcWfjrQ6eSsbWWOjOrFpq002+lMjZoM9p
 KSGA==
X-Gm-Message-State: AOAM532CThNbD1KTz/TnNbFD7N+VPFLcbwSTLYl8WtkpRO04/Cch7Gt0
 M8pQk2e2+57FjgXb29jYW/fWZWgHMlw=
X-Google-Smtp-Source: ABdhPJwru7fnm40/ZeI7chy9uRFBqMQzp9ueR9qQPxssv9pW8hb9WOS0dxvezOR572DrXZFOdM6cgA==
X-Received: by 2002:a17:90a:ae12:: with SMTP id
 t18mr9162564pjq.137.1635378375954; 
 Wed, 27 Oct 2021 16:46:15 -0700 (PDT)
Received: from daehojeong-desktop.mtv.corp.google.com
 ([2620:15c:211:201:b75c:b351:dcb7:11d8])
 by smtp.gmail.com with ESMTPSA id b9sm1048168pfv.158.2021.10.27.16.46.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 27 Oct 2021 16:46:15 -0700 (PDT)
From: Daeho Jeong <daeho43@gmail.com>
To: linux-kernel@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net,
 kernel-team@android.com
Date: Wed, 27 Oct 2021 16:46:10 -0700
Message-Id: <20211027234611.1958146-1-daeho43@gmail.com>
X-Mailer: git-send-email 2.33.0.1079.g6e70778dc9-goog
MIME-Version: 1.0
X-Spam-Score: 0.1 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  From: Daeho Jeong Even though fsck fixed quota issues, fsck
 returns failure status and makes the user code misunderstand like errors
 are still there. Signed-off-by: Daeho Jeong --- fsck/fsck.c | 6 ++++--
 include/f2fs_fs.h
 | 1 + 2 files changed, 5 insertions(+), 2 deletions(-) 
 Content analysis details:   (0.1 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.2 FREEMAIL_ENVFROM_END_DIGIT Envelope-from freemail username ends
 in digit [daeho43[at]gmail.com]
 0.0 FREEMAIL_FROM          Sender email is commonly abused enduser mail
 provider [daeho43[at]gmail.com]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [209.85.167.170 listed in wl.mailspike.net]
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
 no trust [209.85.167.170 listed in list.dnswl.org]
X-Headers-End: 1mfsld-002Lx1-VQ
Subject: [f2fs-dev] [PATCH 1/2] f2fs-tools: remove false failure alarm when
 fixing quota
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

Even though fsck fixed quota issues, fsck returns failure status and
makes the user code misunderstand like errors are still there.

Signed-off-by: Daeho Jeong <daehojeong@google.com>
---
 fsck/fsck.c       | 6 ++++--
 include/f2fs_fs.h | 1 +
 2 files changed, 5 insertions(+), 2 deletions(-)

diff --git a/fsck/fsck.c b/fsck/fsck.c
index 110c1ec..bc11e07 100644
--- a/fsck/fsck.c
+++ b/fsck/fsck.c
@@ -2025,7 +2025,7 @@ int fsck_chk_quota_files(struct f2fs_sb_info *sbi)
 			f2fs_filesize_update(sbi, ino, 0);
 			ret = quota_write_inode(sbi, qtype);
 			if (!ret) {
-				c.bug_on = 1;
+				c.quota_fixed = true;
 				DBG(1, "OK\n");
 			} else {
 				ASSERT_MSG("Unable to write quota file");
@@ -2197,6 +2197,8 @@ void fsck_init(struct f2fs_sb_info *sbi)
 	ASSERT(fsck->dentry != NULL);
 	memcpy(fsck->dentry->name, "/", 1);
 	fsck->dentry_end = fsck->dentry;
+
+	c.quota_fixed = false;
 }
 
 static void fix_hard_links(struct f2fs_sb_info *sbi)
@@ -3330,7 +3332,7 @@ int fsck_verify(struct f2fs_sb_info *sbi)
 	if (force || (c.fix_on && f2fs_dev_is_writable())) {
 		struct f2fs_checkpoint *cp = F2FS_CKPT(sbi);
 
-		if (force || c.bug_on || c.bug_nat_bits) {
+		if (force || c.bug_on || c.bug_nat_bits || c.quota_fixed) {
 			/* flush nats to write_nit_bits below */
 			flush_journal_entries(sbi);
 			fix_hard_links(sbi);
diff --git a/include/f2fs_fs.h b/include/f2fs_fs.h
index 69260a6..9f918ba 100644
--- a/include/f2fs_fs.h
+++ b/include/f2fs_fs.h
@@ -491,6 +491,7 @@ struct f2fs_configuration {
 	int defset;
 	int bug_on;
 	int bug_nat_bits;
+	bool quota_fixed;
 	int alloc_failed;
 	int auto_fix;
 	int layout;
-- 
2.33.0.1079.g6e70778dc9-goog



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
