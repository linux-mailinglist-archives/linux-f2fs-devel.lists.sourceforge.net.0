Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id BFCFE96C1D4
	for <lists+linux-f2fs-devel@lfdr.de>; Wed,  4 Sep 2024 17:11:20 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1slrfA-0001qo-O5;
	Wed, 04 Sep 2024 15:11:16 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <daeho43@gmail.com>) id 1slrf5-0001qg-9r
 for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 04 Sep 2024 15:11:11 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:Message-ID:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=43ydKagFmOiArusbTnepvZXequK3FKBWJc82HDWyEIw=; b=XbL8o/qf+B8tH7XqPsb5Ar0dUd
 tl9ZhtyRsNxWvhAjd7/pBVlJNsVh5rmFVvU/NPrNhKNfZGqpRn++9lTsR4MqZw+fwDbzsDpIROMyj
 WMBevfCGyKkaAe4j3/Z+C500bsURQunRP15/aCdxy4r2eAdKgx8cZg8E7UakzMdSEcOQ=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:Cc:To:From
 :Sender:Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=43ydKagFmOiArusbTnepvZXequK3FKBWJc82HDWyEIw=; b=c
 QZcZCiRb+naHZIYqODgdr01ZmdRQOkVKb3KMeeNrLxdb1iZm6P2N9y1eEwGEMbM+45lWfcD1QmaM4
 DPzyMobs18UOqSu8O1L8YKsHu0kGv6j/xfKAXPyVisGqtfcUnRICyUSpDuvic3RVI8iBkZ5mlOqrK
 oCjgauU8fVyoKyEM=;
Received: from mail-pl1-f177.google.com ([209.85.214.177])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1slrf4-0000Pe-Ls for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 04 Sep 2024 15:11:11 +0000
Received: by mail-pl1-f177.google.com with SMTP id
 d9443c01a7336-2053525bd90so36119815ad.0
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Wed, 04 Sep 2024 08:11:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1725462660; x=1726067460; darn=lists.sourceforge.net;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=43ydKagFmOiArusbTnepvZXequK3FKBWJc82HDWyEIw=;
 b=fd5e7Gttl1hhLpedkCybInRJhcZ/r84VmIuipoY+YHcuQrbFivLGCsdJuP+L2Fg4Uf
 /vng1Nnm9sYmeV5GpuvX4+nsZ0Vq5ywXHioDounksy6PWgINoqbYE/Mh5o1nL/cCROJC
 OfUJZMV1rYDO/Wd12g3vfY1VTgfTZCjqN/ENrnW9fzJPVB2ll9aPMWlEdNXI9tDg47e5
 DZW3feIdQD1F1bDTTqz89ELQAgeMaPg4Z/MB/aOwf6kw60d2dikE8UKUhtUofQ5e6sPI
 dbKdcDSQtkoq/D9pdY/7V4fQM3W+ijbekBucxkxGlacItIg0X9jMmnDV2VcC1BhrSh8E
 /59g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1725462660; x=1726067460;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=43ydKagFmOiArusbTnepvZXequK3FKBWJc82HDWyEIw=;
 b=WQEE19SmSuPA3DSi1yBKrkNG3Q2JzyFiS0J4XmWGlG4bwRRFqZ+ua5hP4/G7Hl93ct
 NIJ04ceIqJCDEb4X2YoDKfCCiRKlR+U//ixfCJ5WDdlH+o4JiCgSGZUVZiLfIT68gRSn
 B+Iplccz7d5Gia50a2v0FPGCdwSyFtuTtZKhVKTO1B810voocvM3ghT1Xroo4McJLOSX
 8+xaQ/UZjz4RC/WjTZYfqqNtOhZKOvQBXGOFTbNAdAc6meMbOqr7KuZVcrzX/JXwshkt
 dByhU+rAPS1UXYFFOW6aGYvG2JKGuOaOu7bbv8Bo+/hfLUzguGXRbUj2/NibrBaYK574
 BMaQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCWvMY2MWS/reFLzqHdZw95UfuDJx2Kq+ENGCRNRkH7QrkXGMs4nAFEzyABDOJeIRwkVuPUmJ/AYiGVk4uavgh3V@lists.sourceforge.net
X-Gm-Message-State: AOJu0YzQRrkFbhWDp1F8EhFd3fxvAZ9MB/tuR0PgYkFmYguQ6APFTAvR
 /gXVSv/B0fUvPm35zyTJ8r417S9ai2kqp9dKUCTwyYflQX5qDujj
X-Google-Smtp-Source: AGHT+IGfo/94kB9afFvRPno+mvVQpzCAOhJq+Y9J3yrdPnGat19R1P1vOwtxLsIwUfwROlQ0n6sETw==
X-Received: by 2002:a17:902:e74f:b0:205:7e3f:9e31 with SMTP id
 d9443c01a7336-2057e3fa1fcmr93168535ad.60.1725462659805; 
 Wed, 04 Sep 2024 08:10:59 -0700 (PDT)
Received: from daehojeong-desktop.mtv.corp.google.com
 ([2a00:79e0:2e14:7:85f3:1406:4b87:9708])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-206aea55d42sm14629905ad.204.2024.09.04.08.10.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 04 Sep 2024 08:10:59 -0700 (PDT)
From: Daeho Jeong <daeho43@gmail.com>
To: linux-kernel@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net,
 kernel-team@android.com
Date: Wed,  4 Sep 2024 08:10:54 -0700
Message-ID: <20240904151054.813444-1-daeho43@gmail.com>
X-Mailer: git-send-email 2.46.0.469.g59c65b2a67-goog
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
 dirty for FI_ATOMIC_COMMITTED flag") Signed-off-by: Daeho Jeong --- v2: take
 the original logic not to change inode size by inode dirtying from VFS layer
 --- f [...] 
 Content analysis details:   (0.0 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.2 FREEMAIL_ENVFROM_END_DIGIT Envelope-from freemail username ends
 in digit [daeho43[at]gmail.com]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 FREEMAIL_FROM          Sender email is commonly abused enduser mail
 provider [daeho43[at]gmail.com]
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
 no trust [209.85.214.177 listed in list.dnswl.org]
 0.0 RCVD_IN_MSPIKE_H3      RBL: Good reputation (+3)
 [209.85.214.177 listed in wl.mailspike.net]
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.0 T_SCC_BODY_TEXT_LINE   No description available.
 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
X-Headers-End: 1slrf4-0000Pe-Ls
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
v2: take the original logic not to change inode size by inode dirtying
    from VFS layer
---
 fs/f2fs/f2fs.h    | 2 +-
 fs/f2fs/inode.c   | 5 +++++
 fs/f2fs/segment.c | 8 ++++++++
 3 files changed, 14 insertions(+), 1 deletion(-)

diff --git a/fs/f2fs/f2fs.h b/fs/f2fs/f2fs.h
index ac19c61f0c3e..4ef6d877aa36 100644
--- a/fs/f2fs/f2fs.h
+++ b/fs/f2fs/f2fs.h
@@ -802,6 +802,7 @@ enum {
 	FI_ALIGNED_WRITE,	/* enable aligned write */
 	FI_COW_FILE,		/* indicate COW file */
 	FI_ATOMIC_COMMITTED,	/* indicate atomic commit completed except disk sync */
+	FI_ATOMIC_DIRTIED,	/* indicate atomic file is dirtied */
 	FI_ATOMIC_REPLACE,	/* indicate atomic replace */
 	FI_OPENED_FILE,		/* indicate file has been opened */
 	FI_MAX,			/* max flag, never be used */
@@ -3041,7 +3042,6 @@ static inline void __mark_inode_dirty_flag(struct inode *inode,
 	case FI_INLINE_DOTS:
 	case FI_PIN_FILE:
 	case FI_COMPRESS_RELEASED:
-	case FI_ATOMIC_COMMITTED:
 		f2fs_mark_inode_dirty_sync(inode, true);
 	}
 }
diff --git a/fs/f2fs/inode.c b/fs/f2fs/inode.c
index aef57172014f..4729c49bf6d7 100644
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
 
diff --git a/fs/f2fs/segment.c b/fs/f2fs/segment.c
index 78c3198a6308..2f6ee9afd3ad 100644
--- a/fs/f2fs/segment.c
+++ b/fs/f2fs/segment.c
@@ -199,6 +199,10 @@ void f2fs_abort_atomic_write(struct inode *inode, bool clean)
 	clear_inode_flag(inode, FI_ATOMIC_COMMITTED);
 	clear_inode_flag(inode, FI_ATOMIC_REPLACE);
 	clear_inode_flag(inode, FI_ATOMIC_FILE);
+	if (is_inode_flag_set(inode, FI_ATOMIC_DIRTIED)) {
+		clear_inode_flag(inode, FI_ATOMIC_DIRTIED);
+		f2fs_mark_inode_dirty_sync(inode, true);
+	}
 	stat_dec_atomic_inode(inode);
 
 	F2FS_I(inode)->atomic_write_task = NULL;
@@ -366,6 +370,10 @@ static int __f2fs_commit_atomic_write(struct inode *inode)
 	} else {
 		sbi->committed_atomic_block += fi->atomic_write_cnt;
 		set_inode_flag(inode, FI_ATOMIC_COMMITTED);
+		if (is_inode_flag_set(inode, FI_ATOMIC_DIRTIED)) {
+			clear_inode_flag(inode, FI_ATOMIC_DIRTIED);
+			f2fs_mark_inode_dirty_sync(inode, true);
+		}
 	}
 
 	__complete_revoke_list(inode, &revoke_list, ret ? true : false);
-- 
2.46.0.469.g59c65b2a67-goog



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
