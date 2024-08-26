Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 8EDD195FA91
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 26 Aug 2024 22:24:11 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-3.v29.lw.sourceforge.com)
	by sfs-ml-3.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1sigFw-0004BG-Qb;
	Mon, 26 Aug 2024 20:24:04 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-3.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <daeho43@gmail.com>) id 1sigFw-0004BA-Cw
 for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 26 Aug 2024 20:24:03 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:Message-ID:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=WGeGgPWuY1K2FynP7scy8UtSU10OAbl7DE/fg3On6Kk=; b=HRBTtU0/U9jQiCGnDKAhY1/N9d
 Zz8aUor1FnsIc6Y1KT+pCtb2wr5+RTIvvBbeITw1wQOggkWPLKjFY3nMZJgVemoqPY/k6c3mURYRn
 6MF9lNQvhB0+UEH1RUycog3DhPtChOeUxFwnoswRCMvIUG8YTpfVxxwN7tBDyjsJb1RQ=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:Cc:To:From
 :Sender:Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=WGeGgPWuY1K2FynP7scy8UtSU10OAbl7DE/fg3On6Kk=; b=W
 kB3W9R2J9FEZoUrSbBsZA01l38HsWrxhj6vpC4y2nXBqEI7gXvgr9bG/GYq+EZTYGKYqoETLv4VUp
 1RBoN/keQNN7eSP5/5fgdhbnPjlB8gtpyu1SJpp1yLF8E2AuFefdSZA+Ulw17uMIO/KWA/Xzj8czT
 dn5oa3E0u/mnQUlk=;
Received: from mail-pl1-f174.google.com ([209.85.214.174])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1sigFv-0000a5-1n for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 26 Aug 2024 20:24:03 +0000
Received: by mail-pl1-f174.google.com with SMTP id
 d9443c01a7336-20227ba378eso42475925ad.0
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Mon, 26 Aug 2024 13:24:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1724703837; x=1725308637; darn=lists.sourceforge.net;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=WGeGgPWuY1K2FynP7scy8UtSU10OAbl7DE/fg3On6Kk=;
 b=SbJZo/kGemYscxptqBAK20SUvkasZz4v5Qt+xwTBaQnA3Mana43Dl1S3SYU760nQTQ
 w/bztnEMdPnC7DM8ZwRnpjtchtr8X7b0FBkX+Mf7SHAU0RziwL+8QsCW2vYdR5XrJAvT
 /mCY4fXbNIK4lt9ZFke0vO61tqjSouW5gqSePYti59MGXkNvZvq5OdTbB/pFqZPsBLCX
 jhjVpVFy8xp+aa/fMGqUlOOoEGdZvwRmg7+BF7IKuCrAkgYMG0BYy/YS7kqckDjK9nPf
 i/9dGG6JuvXGcUmw3T0vAX/z0iP/lMdXE5LxK7+dR+HskQyKKqnbNdvkMFbex0Rjx8F4
 hrkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1724703837; x=1725308637;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=WGeGgPWuY1K2FynP7scy8UtSU10OAbl7DE/fg3On6Kk=;
 b=Usi+TptzBTLV3N6OLfDkR+xu4PPYr8Njn5MXff/Ipc5FfWAQy4O/kqiyhEsSn7wpg/
 YsnbjQTkk128pXBPvE5PwEntF1WWWkbSu0zv2U7YQC5kIqsfYOkJIEZFB+P6g6tFgRjh
 mTyJLkLM/2dK0hnVt9N4rSAPfTnH6NW884v2wLcMpWJ4ic8SeddLBFdIWvl29ywd1z5l
 06ACz57hbm8lp3mHNLrycvuae/ZAXBgwY4jVC3KJQ2e0PEuwEvyBxAL6eCIRe04GxiMC
 2DZnCcM6EM0ZgFRkkW9GU9urzp20iI4z+n0QbDFPmNdLVL2H51hQ5pgx+jZbckp5CBiQ
 9Uqw==
X-Forwarded-Encrypted: i=1;
 AJvYcCUj/3gvff+qyzeE20NAc1r2LkHGoXwBsbisr3IUawFwvsMSXlCL+OkeizD7RYj6U30s/jzTv9mrMvF/448H6y2h@lists.sourceforge.net
X-Gm-Message-State: AOJu0Yx7AMjbdG1sXci5xsd5mf0gAvsaorJmduiXo4f5gOu6UIuaRi6F
 Wk5+VVRuKvVYYHkx9jr56ziMnUKrJuFcA50gpzqR0qYFLT6jQKSp
X-Google-Smtp-Source: AGHT+IH0yXRtZgUiedgapAcFw9gmLlMG5cItC8NxCYiU/+6CoRdUrl4tE1HCQeqmH7Eb4NJ4jPfITQ==
X-Received: by 2002:a17:902:e84f:b0:1fb:6151:f62f with SMTP id
 d9443c01a7336-2039e4858c2mr136911715ad.28.1724703837293; 
 Mon, 26 Aug 2024 13:23:57 -0700 (PDT)
Received: from daehojeong-desktop.mtv.corp.google.com
 ([2a00:79e0:2e14:7:f453:fb42:ecd4:259d])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-203855df0c4sm71430265ad.157.2024.08.26.13.23.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 26 Aug 2024 13:23:57 -0700 (PDT)
From: Daeho Jeong <daeho43@gmail.com>
To: linux-kernel@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net,
 kernel-team@android.com
Date: Mon, 26 Aug 2024 13:23:52 -0700
Message-ID: <20240826202352.2150294-1-daeho43@gmail.com>
X-Mailer: git-send-email 2.46.0.295.g3b9ea8a38a-goog
MIME-Version: 1.0
X-Spam-Score: 0.0 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: From: Daeho Jeong Keep atomic file clean while updating and
 make it dirtied during commit in order to avoid unnecessary and excessive
 inode updates in the previous fix. Fixes: 4bf78322346f ("f2fs: mark inode
 dirty for FI_ATOMIC_COMMITTED flag") Signed-off-by: Daeho Jeong ---
 fs/f2fs/f2fs.h
 | 3 +-- fs/f2fs/inode.c | 10 ++++++---- fs/f2fs/segment.c | 10 ++++++++--
 3 [...] Content analysis details:   (0.0 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 RCVD_IN_DNSWL_BLOCKED  RBL: ADMINISTRATOR NOTICE: The query to
 DNSWL was blocked.  See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [209.85.214.174 listed in list.dnswl.org]
 0.0 FREEMAIL_FROM          Sender email is commonly abused enduser mail
 provider [daeho43[at]gmail.com]
 0.0 RCVD_IN_VALIDITY_RPBL_BLOCKED RBL: ADMINISTRATOR NOTICE: The
 query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [209.85.214.174 listed in bl.score.senderscore.com]
 0.0 RCVD_IN_VALIDITY_SAFE_BLOCKED RBL: ADMINISTRATOR NOTICE: The
 query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [209.85.214.174 listed in sa-accredit.habeas.com]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 0.2 FREEMAIL_ENVFROM_END_DIGIT Envelope-from freemail username ends
 in digit [daeho43[at]gmail.com]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 RCVD_IN_MSPIKE_H3      RBL: Good reputation (+3)
 [209.85.214.174 listed in wl.mailspike.net]
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
 -0.0 T_SCC_BODY_TEXT_LINE   No description available.
X-Headers-End: 1sigFv-0000a5-1n
Subject: [f2fs-dev] [PATCH] f2fs: prevent atomic file from being dirtied
 before commit
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

Keep atomic file clean while updating and make it dirtied during commit
in order to avoid unnecessary and excessive inode updates in the previous
fix.

Fixes: 4bf78322346f ("f2fs: mark inode dirty for FI_ATOMIC_COMMITTED flag")
Signed-off-by: Daeho Jeong <daehojeong@google.com>
---
 fs/f2fs/f2fs.h    |  3 +--
 fs/f2fs/inode.c   | 10 ++++++----
 fs/f2fs/segment.c | 10 ++++++++--
 3 files changed, 15 insertions(+), 8 deletions(-)

diff --git a/fs/f2fs/f2fs.h b/fs/f2fs/f2fs.h
index 465b2fd50c70..5a7f6fa8b585 100644
--- a/fs/f2fs/f2fs.h
+++ b/fs/f2fs/f2fs.h
@@ -801,7 +801,7 @@ enum {
 	FI_COMPRESS_RELEASED,	/* compressed blocks were released */
 	FI_ALIGNED_WRITE,	/* enable aligned write */
 	FI_COW_FILE,		/* indicate COW file */
-	FI_ATOMIC_COMMITTED,	/* indicate atomic commit completed except disk sync */
+	FI_ATOMIC_DIRTIED,	/* indicate atomic file is dirtied */
 	FI_ATOMIC_REPLACE,	/* indicate atomic replace */
 	FI_OPENED_FILE,		/* indicate file has been opened */
 	FI_MAX,			/* max flag, never be used */
@@ -3042,7 +3042,6 @@ static inline void __mark_inode_dirty_flag(struct inode *inode,
 	case FI_INLINE_DOTS:
 	case FI_PIN_FILE:
 	case FI_COMPRESS_RELEASED:
-	case FI_ATOMIC_COMMITTED:
 		f2fs_mark_inode_dirty_sync(inode, true);
 	}
 }
diff --git a/fs/f2fs/inode.c b/fs/f2fs/inode.c
index 1eb250c6b392..5dd3e55d2be2 100644
--- a/fs/f2fs/inode.c
+++ b/fs/f2fs/inode.c
@@ -35,6 +35,11 @@ void f2fs_mark_inode_dirty_sync(struct inode *inode, bool sync)
 	if (f2fs_inode_dirtied(inode, sync))
 		return;
 
+	if (f2fs_is_atomic_file(inode)) {
+		set_inode_flag(inode, FI_ATOMIC_DIRTIED);
+		return;
+	}
+
 	mark_inode_dirty_sync(inode);
 }
 
@@ -653,10 +658,7 @@ void f2fs_update_inode(struct inode *inode, struct page *node_page)
 	ri->i_gid = cpu_to_le32(i_gid_read(inode));
 	ri->i_links = cpu_to_le32(inode->i_nlink);
 	ri->i_blocks = cpu_to_le64(SECTOR_TO_BLOCK(inode->i_blocks) + 1);
-
-	if (!f2fs_is_atomic_file(inode) ||
-			is_inode_flag_set(inode, FI_ATOMIC_COMMITTED))
-		ri->i_size = cpu_to_le64(i_size_read(inode));
+	ri->i_size = cpu_to_le64(i_size_read(inode));
 
 	if (et) {
 		read_lock(&et->lock);
diff --git a/fs/f2fs/segment.c b/fs/f2fs/segment.c
index 78c3198a6308..2b5391b229a8 100644
--- a/fs/f2fs/segment.c
+++ b/fs/f2fs/segment.c
@@ -196,9 +196,12 @@ void f2fs_abort_atomic_write(struct inode *inode, bool clean)
 		truncate_inode_pages_final(inode->i_mapping);
 
 	release_atomic_write_cnt(inode);
-	clear_inode_flag(inode, FI_ATOMIC_COMMITTED);
 	clear_inode_flag(inode, FI_ATOMIC_REPLACE);
 	clear_inode_flag(inode, FI_ATOMIC_FILE);
+	if (is_inode_flag_set(inode, FI_ATOMIC_DIRTIED)) {
+		clear_inode_flag(inode, FI_ATOMIC_DIRTIED);
+		f2fs_mark_inode_dirty_sync(inode, true);
+	}
 	stat_dec_atomic_inode(inode);
 
 	F2FS_I(inode)->atomic_write_task = NULL;
@@ -365,7 +368,10 @@ static int __f2fs_commit_atomic_write(struct inode *inode)
 		sbi->revoked_atomic_block += fi->atomic_write_cnt;
 	} else {
 		sbi->committed_atomic_block += fi->atomic_write_cnt;
-		set_inode_flag(inode, FI_ATOMIC_COMMITTED);
+		if (is_inode_flag_set(inode, FI_ATOMIC_DIRTIED)) {
+			clear_inode_flag(inode, FI_ATOMIC_DIRTIED);
+			f2fs_mark_inode_dirty_sync(inode, true);
+		}
 	}
 
 	__complete_revoke_list(inode, &revoke_list, ret ? true : false);
-- 
2.46.0.295.g3b9ea8a38a-goog



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
