Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id B1426CDC56D
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 24 Dec 2025 14:17:32 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Subject:MIME-Version:Message-ID:Date:To:From:Sender:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=jGWaj/7XzeUKq/Y/eJZ21K+4GEjnoYflSGzGx0IkNaQ=; b=B3TlNtTo6KzZV6I3o15vK5gi2S
	cyHXDcVSTG3iOJcCADtLw2fzQlcm/BhzLEIKL+bjHiA2NF5oNI0tQ3UpCL2zdKABgyYdvH7LZFRDv
	kRD+d1G1RrnUAmpQ5z8VkMzCHbVyVvupb6VEL6sUhrkJld8dD6ukKD7xrO17hm5mhhuE=;
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1vYOjs-0002kc-Ci;
	Wed, 24 Dec 2025 13:17:16 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <yangyongpeng.storage@gmail.com>) id 1vYOjq-0002kW-Nl
 for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 24 Dec 2025 13:17:14 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:Message-ID:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=tXAYeRz5BR0DtaA9WPyOpTenjVtUy4tRhx25jzbT+bk=; b=Tjsb1To8EZolifpM+/32GYWuoI
 wddosIra9JpyYVuECoz/HSyFwdw4itUObDcW0iu7Rvc64CjEyp2R/w1kNlJVSTnAwyxCSjU7n8MBx
 jUnQ95LyEtlBdrA5iH59womx7Ui3L0PxC4QnTFhvv3C+/oPYv1jZbBhWPNbfX/0QC1HE=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:Cc:To:From
 :Sender:Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=tXAYeRz5BR0DtaA9WPyOpTenjVtUy4tRhx25jzbT+bk=; b=H
 uZfUuLb52I+1M3qbnJeeI3KQaOkkUcH0DYm03xYJmTKpn/AIZrDSErz0Crbn4m0Vu8ONlYXQhSPA9
 wuRkfHZBVCWY9oVhZdFA+MXUuBtb/SNodwYB7Z2sBAKU+rRieqySpXJVHBxR6bNMKw2LibfiXuW6A
 skATthmMwIAWW2TA=;
Received: from mail-pl1-f169.google.com ([209.85.214.169])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1vYOjq-0004tZ-6g for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 24 Dec 2025 13:17:14 +0000
Received: by mail-pl1-f169.google.com with SMTP id
 d9443c01a7336-29f0f875bc5so86849395ad.3
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Wed, 24 Dec 2025 05:17:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1766582228; x=1767187028; darn=lists.sourceforge.net;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=tXAYeRz5BR0DtaA9WPyOpTenjVtUy4tRhx25jzbT+bk=;
 b=VeQe8GULqDIiA6Tk09NSjrbeidWYi83lfT/flsm7L2q3ZXR3Ifxpu+/PpNdxONaFpy
 mseHDaWA6wAsObXvbzMXCWVcL2x+v4VFZ7dAsD0DQ517b3A5qJ0vrJ9PNQZwJyOEb1MO
 o/nju7SgvTEV4FscqSDzk8ledKs9RlVOXQLd501b75Mcv3jeacBUsWCgP0Od7Sqtl4KH
 dsZHOMfIlOa1mJhnNPjBBwEIu48X9OXpD6QWlVZ8uSfIhi977DyLLcaExhW90G5Njz6i
 UiKKDf2s5x3Gr+RiO1thWx5bup9fvcHW8NwMYTl+opjbqAUZZ3KxIncspzULgtnldhib
 JH7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1766582228; x=1767187028;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=tXAYeRz5BR0DtaA9WPyOpTenjVtUy4tRhx25jzbT+bk=;
 b=EvRMPVEH9NHF86uzNMIKFmIj4PxLxEkEnKB//HquM+0T0k3FBR9Ijho1KpmfA8cg8+
 n7GtubX0/WDURDC6H2UtKzgRBPo8OU6ClFoiFskkVZMbZLGsXJQrqryUcYkQXAvUwlrO
 3VJhSY1yBNk8CmN20VQ01hpMApKzn9H4H1VVwvFYY6oCU1sjusD8RNH9Udn2uW4HkxlK
 TIIBymq3PQ2PQfWh8hHdhZo5O/MCbatjwUmCQS1FPiPyb6JV15vCC3/0vp12QMbgErRC
 PpHU1q196oT6/72bTkABgptrwDmpiOitUT4Ufc7KwEoUAry7OHGWfS+yT5x9Qr85ZwDp
 1GIQ==
X-Gm-Message-State: AOJu0Yx6yw7QpNRxMbpk/G9uypscpl0koONQJsyG1DZF/tWGBEnv+L2L
 veSGIw8Ux5qJngzuXuEH2ORdy1AIJPpb03c6/29CZjfw0VaOV8qUg06c
X-Gm-Gg: AY/fxX4hP8cZYhoe1OEpORhpCjhJhyX35p+CXQ9ukmQmsYnB3cJryNS9BmArJOAfDel
 mU6/N4aiBTiiKeyseplOT61CGcLMs0oJwKQWsyOa65XxXO/09pat+XdxSYOWH2srtlULJhOZGnY
 wuBVQ5YoqwHuP81kTgePuMaAzm0JY9kob0MbC0pIniLzDkMEHRwlaJICA7ii9Z3zbiKb/cGNMjk
 /waz5tPRi+7sn0nTP6xP2wJGSsebvHuh4xnfZE79IPy2JiU/8nRd2pMRrxVpK4nVOa8GmHHWojC
 lH8O77ltRPo4dsjnKl0seW14bwxewc74mz7GW/ZYLLyXo1SiAd1CE4Iu2tc5suvo/g4yKCqXe/T
 79ELVqCVnme07/bQIbl030ypFW6s+uEjby+mzykGSl+aHEhNan6Gvvz+DnjaFWnCRJzkBjpQ9tx
 qFhjsdYWWWJ4U36avuyBhhP/YxIS+Hyeg6Z2v4HSxNRIhwtDfnZuzoCKqH+A==
X-Google-Smtp-Source: AGHT+IF9SDlGv3DF3dOgCTfFvuON4q3qRWYHFMkTz3rzJd3H5BWqfOR4DpCksobWVQxzDJHKebrAHQ==
X-Received: by 2002:a17:902:e548:b0:295:8a2a:9595 with SMTP id
 d9443c01a7336-2a2f283de59mr173201535ad.39.1766582228301; 
 Wed, 24 Dec 2025 05:17:08 -0800 (PST)
Received: from xiaomi-ThinkCentre-M760t.mioffice.cn ([43.224.245.241])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-2a2f3d5d3fasm158402645ad.69.2025.12.24.05.17.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 24 Dec 2025 05:17:08 -0800 (PST)
From: Yongpeng Yang <yangyongpeng.storage@gmail.com>
To: Chao Yu <chao@kernel.org>,
	Jaegeuk Kim <jaegeuk@kernel.org>
Date: Wed, 24 Dec 2025 21:16:35 +0800
Message-ID: <20251224131634.3860115-2-yangyongpeng.storage@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-2.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  From: Yongpeng Yang During SPO tests, when mounting F2FS,
 an -EINVAL error was returned from f2fs_recover_inode_page. The issue occurred
 under the following scenario Thread A Thread B f2fs_ioc_commit_atomic_write
 - f2fs_do_sync_file // atomic = true - f2fs_fsync_node_pages : last_folio
 = inode folio : schedule before folio_lock(last_folio) f2fs_write_checkpoint
 - [...] Content analysis details:   (-0.2 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 0.0 FREEMAIL_FROM Sender email is commonly abused enduser mail provider
 [yangyongpeng.storage(at)gmail.com]
 0.0 RCVD_IN_MSPIKE_H3      RBL: Good reputation (+3)
 [209.85.214.169 listed in wl.mailspike.net]
 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
X-Headers-End: 1vYOjq-0004tZ-6g
Subject: [f2fs-dev] [PATCH 1/1] f2fs: fix IS_CHECKPOINTED flag inconsistency
 issue caused by concurrent atomic commit and checkpoint writes
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
Cc: Yongpeng Yang <yangyongpeng.storage@outlook.com>,
 Yongpeng Yang <yangyongpeng@xiaomi.com>, Sheng Yong <shengyong1@xiaomi.com>,
 linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

From: Yongpeng Yang <yangyongpeng@xiaomi.com>

During SPO tests, when mounting F2FS, an -EINVAL error was returned from
f2fs_recover_inode_page. The issue occurred under the following scenario

Thread A                                     Thread B
f2fs_ioc_commit_atomic_write
 - f2fs_do_sync_file // atomic = true
  - f2fs_fsync_node_pages
    : last_folio = inode folio
    : schedule before folio_lock(last_folio) f2fs_write_checkpoint
                                              - block_operations// writeback last_folio
                                              - schedule before f2fs_flush_nat_entries
    : set_fsync_mark(last_folio, 1)
    : set_dentry_mark(last_folio, 1)
    : folio_mark_dirty(last_folio)
    : __write_node_folio(last_folio)
                                              - f2fs_flush_nat_entries
                                                : {struct nat_entry}->flag |= BIT(IS_CHECKPOINTED)
                                             SPO

Thread A calls f2fs_need_dentry_mark(sbi, ino), and the last_folio has
already been written once. However, the {struct nat_entry}->flag did not
have the IS_CHECKPOINTED set, causing set_dentry_mark(last_folio, 1) and
write last_folio again.

After SPO and reboot, it was detected that {struct node_info}->blk_addr
was not NULL_ADDR because Thread B successfully write the checkpoint.

This issue only occurs in atomic write scenarios, and does not affect
regular file fsync operations. Therefore, for atomic file fsync,
sbi->cp_rwsem should be acquired to ensure that the IS_CHECKPOINTED flag
correctly indicates that the checkpoint write has been completed.

Fixes: 608514deba38 ("f2fs: set fsync mark only for the last dnode")
Signed-off-by: Sheng Yong <shengyong1@xiaomi.com>
Signed-off-by: Yongpeng Yang <yangyongpeng@xiaomi.com>
---
 fs/f2fs/node.c | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/fs/f2fs/node.c b/fs/f2fs/node.c
index 482a362f2625..e482a38444f1 100644
--- a/fs/f2fs/node.c
+++ b/fs/f2fs/node.c
@@ -1854,7 +1854,7 @@ int f2fs_fsync_node_pages(struct f2fs_sb_info *sbi, struct inode *inode,
 	struct folio_batch fbatch;
 	int ret = 0;
 	struct folio *last_folio = NULL;
-	bool marked = false;
+	bool marked = false, locked = false;
 	nid_t ino = inode->i_ino;
 	int nr_folios;
 	int nwritten = 0;
@@ -1889,6 +1889,10 @@ int f2fs_fsync_node_pages(struct f2fs_sb_info *sbi, struct inode *inode,
 			if (ino_of_node(folio) != ino)
 				continue;
 
+			if (atomic && folio == last_folio) {
+				f2fs_lock_op(sbi);
+				locked = true;
+			}
 			folio_lock(folio);
 
 			if (unlikely(!is_node_folio(folio))) {
@@ -1959,6 +1963,8 @@ int f2fs_fsync_node_pages(struct f2fs_sb_info *sbi, struct inode *inode,
 		goto retry;
 	}
 out:
+	if (locked)
+		f2fs_unlock_op(sbi);
 	if (nwritten)
 		f2fs_submit_merged_write_cond(sbi, NULL, NULL, ino, NODE);
 	return ret;
-- 
2.43.0



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
