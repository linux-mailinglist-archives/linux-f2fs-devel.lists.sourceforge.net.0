Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id D844ACDEC12
	for <lists+linux-f2fs-devel@lfdr.de>; Fri, 26 Dec 2025 15:14:21 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Subject:MIME-Version:Message-ID:Date:To:From:Sender:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=Kh6aY5XdlNC3NBKlVNePFBNuF32fA4GRnlv02rCL2C4=; b=Fl/Uf4/l7Oz1Fd9nw6/XOgDKdp
	X+y9EO8YYK5lftQutj8DYbuqsPgNUuaqNrrLz9zEGYzhMPSKDhd3mvDvN4a9JGKS32YwE5c3zg9Y/
	kE22yWlPIIQnH53vo4JgWZszT/Gm15q87t3W7hzRWC7DCkMkAuvio9XhIfbxZeeQaEkc=;
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1vZ8a0-0003jW-V9;
	Fri, 26 Dec 2025 14:14:08 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <yangyongpeng.storage@gmail.com>) id 1vZ8Zz-0003jP-LD
 for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 26 Dec 2025 14:14:07 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:Message-ID:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=gO2KkfgH/fzGmNHaO9pq5Aojjs9APV25pT+D93rqhxE=; b=YY6lbM4l9VqNB+bQCvaT46laHY
 Fau7Fe/QqOQPL7VB18B0oKjIl/BlBnQuqJv89shYlynvuc9eHuV2eejnsxeMvpVeRVhWsYIRmp7Rw
 QQGaVmVA5ESzqhXlMy7U45Q9gXrR2Waj7I8n8d3dQ81qBF/EfnxuuZNLyQzdBoqDcbEc=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:Cc:To:From
 :Sender:Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=gO2KkfgH/fzGmNHaO9pq5Aojjs9APV25pT+D93rqhxE=; b=V
 3ll3/KlVxcl25F0J9Ezil77vAubtL9p8rQOr3Li6FULxD94JdvpPu3tDEUGKoRaAPCxekHnZFzwhL
 fq54P6CpyKXuamDSijacgAQ/AU/hw3WB1po3LJU0d6wpunrgDuSHDrB6ohCEcr/F7NSjzJlIgCLyF
 /R3iMC8uuiaELCPo=;
Received: from mail-pl1-f169.google.com ([209.85.214.169])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1vZ8Zz-0008KJ-63 for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 26 Dec 2025 14:14:07 +0000
Received: by mail-pl1-f169.google.com with SMTP id
 d9443c01a7336-2a09a3bd9c5so64529815ad.3
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Fri, 26 Dec 2025 06:14:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1766758441; x=1767363241; darn=lists.sourceforge.net;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=gO2KkfgH/fzGmNHaO9pq5Aojjs9APV25pT+D93rqhxE=;
 b=U1LSRd+yj2X4HEVJC7cMqntLVnrB+6SmanOC9RziTy45NBX84dr6aGFAiMWBN7PVG0
 ymFIg5yUFAtebXz48lG4oXCWcfnOEJBWODm+LqiyYNWVZsFwgEXOCGaF375vA9ImcXmr
 OJoxfbnfhfER/bHXAO+ZOt3I4gYzhIR1g6Hoicl1zmq3e9SndVII0rnylWPJGHp765WI
 z80clq5nBlehB6bBfwkUwtqXDW3QD2VQvjFry7WwhkIM6N9/1qkNXjjceWa459rLHtrI
 4JPr6Ios6YaqAJkrXVz8vSEL9PAzqsjPO7f56vuBDavFAWtWTKbxz7SoP8AghqNRKD3W
 1wAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1766758441; x=1767363241;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=gO2KkfgH/fzGmNHaO9pq5Aojjs9APV25pT+D93rqhxE=;
 b=L6ZwFXb3TWEkfkDCmSQtdiQIW3VFKnzImKndHOBXrX99+FJ3Z6iVdN2ea5OF9Pup8N
 epHlSMyMwvKnelEAI1JBzRt0j2zD3sg0uV/M5KMEFRv5S0gE5CITpTm+OQvO7q8IK7VB
 UjHd7NdvwTixbec+g/8TLyjZydznA0JAVaKxUbEqTzRbCAhQj3JWKLYoZluxTWoEyaAW
 QwQhY9/7zYRfPMt4qUnCHbfRBUmrBSt/Xzltv8gKxfqvIp6i1bmxnkkPUgWTFAg4ywlW
 P1URYrMTgQElUuT4aEEt5uXxtCHWIde4d4LZVeIkXQ5OKbXK7ydSh3CqKurQtwxQ6vMs
 lTeQ==
X-Gm-Message-State: AOJu0Yy54smUOg4qXTnA+fZFIl52M4dnplX2qOH7e73RPe34g06gVXL9
 L0QdLMrRWWqloOSMKmDxIpWkznQVnrGzyG+0HL+35ojMB5ic6RaIAYmwhiTRPwdr
X-Gm-Gg: AY/fxX4IW9o/TNhAX9gCHJ3uykCq1/gERDSVvsjhZ8hpbxo/AvxauqcbCIsi4d3byiD
 CxUit/izrErp10U9G2bKD03gTwHdKECxKF0z1JkZia6nl6iviZ/67+v+P2GCsFEsYrlW0Q4ytOO
 y/oPoudGy6yDQrTWMh+3ZfqgF92k6oiJvnKxgby0VFHHpLMtBRAA9+P6Y+nDg6tIYL4Fjt72C+2
 w0+yzsN3GInbCIoFilDOYqmF30B7D8A2wSPKdYhBgJGKAyDuUYZiYg9+5ba6EnU60Xx068ZJqQ/
 4EvE1/Hr2qHp4CbHo/nsRaCgWExFHJ98u3nuWTr7AEGi3QMIhGZ2Qpgq3tXM8IhvmBZA+oC6Ov2
 G5TvroqXKhJbJwLYnIJO9160IMBotWhGP8jc5TMWi//3/i1OsHz2pGTpFCK2aeoX0m3AhhaBO+v
 lu7Q2dlF0d8NgZMtBTg6qzmtjiTiwlbcAymyDkNmUVaKIPVlFOAJmt3K+2cF9iGTw1HI8A
X-Google-Smtp-Source: AGHT+IE1fDOCWGPuw3XFkMdWp/ptWq73GTU9SVw5nWY6wTNffeElGF3vUwdkqlFSGZ21GAVzkbi7HQ==
X-Received: by 2002:a17:903:32c3:b0:298:616a:ba93 with SMTP id
 d9443c01a7336-2a2f220cc86mr193911595ad.9.1766758441298; 
 Fri, 26 Dec 2025 06:14:01 -0800 (PST)
Received: from xiaomi-ThinkCentre-M760t.mioffice.cn ([43.224.245.241])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-2a2f3d4d2c6sm204513445ad.49.2025.12.26.06.13.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 26 Dec 2025 06:14:00 -0800 (PST)
From: Yongpeng Yang <yangyongpeng.storage@gmail.com>
To: Chao Yu <chao@kernel.org>,
	Jaegeuk Kim <jaegeuk@kernel.org>
Date: Fri, 26 Dec 2025 22:11:13 +0800
Message-ID: <20251226141111.119177-3-yangyongpeng.storage@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-1.hosts.colo.sdot.me", 
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
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.0 FREEMAIL_FROM Sender email is commonly abused enduser mail provider
 [yangyongpeng.storage(at)gmail.com]
 0.0 RCVD_IN_MSPIKE_H3      RBL: Good reputation (+3)
 [209.85.214.169 listed in wl.mailspike.net]
 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
X-Headers-End: 1vZ8Zz-0008KJ-63
Subject: [f2fs-dev] [PATCH v2 1/1] f2fs: fix IS_CHECKPOINTED flag
 inconsistency issue caused by concurrent atomic commit and checkpoint
 writes
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
Cc: Jinbao Liu <jinbaoliu365@gmail.com>, Jinbao Liu <liujinbao1@xiaomi.com>,
 Sheng Yong <shengyong1@xiaomi.com>, Yongpeng Yang <yangyongpeng@xiaomi.com>,
 linux-f2fs-devel@lists.sourceforge.net,
 Yongpeng Yang <yangyongpeng.storage@outlook.com>
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
sbi->node_write should be acquired through __write_node_folio to ensure
that the IS_CHECKPOINTED flag correctly indicates that the checkpoint
write has been completed.

Fixes: 608514deba38 ("f2fs: set fsync mark only for the last dnode")
Signed-off-by: Sheng Yong <shengyong1@xiaomi.com>
Signed-off-by: Jinbao Liu <liujinbao1@xiaomi.com>
Signed-off-by: Yongpeng Yang <yangyongpeng@xiaomi.com>
---
v2:
- set_dentry_mark for atomic file's last_folio in __write_node_folio.
---
 fs/f2fs/node.c | 14 ++++++++++----
 1 file changed, 10 insertions(+), 4 deletions(-)

diff --git a/fs/f2fs/node.c b/fs/f2fs/node.c
index 482a362f2625..2c6102bee349 100644
--- a/fs/f2fs/node.c
+++ b/fs/f2fs/node.c
@@ -1774,8 +1774,13 @@ static bool __write_node_folio(struct folio *folio, bool atomic, bool *submitted
 		goto redirty_out;
 	}
 
-	if (atomic && !test_opt(sbi, NOBARRIER))
-		fio.op_flags |= REQ_PREFLUSH | REQ_FUA;
+	if (atomic) {
+		if (!test_opt(sbi, NOBARRIER))
+			fio.op_flags |= REQ_PREFLUSH | REQ_FUA;
+		if (IS_INODE(folio))
+			set_dentry_mark(folio,
+				f2fs_need_dentry_mark(sbi, ino_of_node(folio)));
+	}
 
 	/* should add to global list before clearing PAGECACHE status */
 	if (f2fs_in_warm_node_list(sbi, folio)) {
@@ -1916,8 +1921,9 @@ int f2fs_fsync_node_pages(struct f2fs_sb_info *sbi, struct inode *inode,
 					if (is_inode_flag_set(inode,
 								FI_DIRTY_INODE))
 						f2fs_update_inode(inode, folio);
-					set_dentry_mark(folio,
-						f2fs_need_dentry_mark(sbi, ino));
+					if (!atomic)
+						set_dentry_mark(folio,
+							f2fs_need_dentry_mark(sbi, ino));
 				}
 				/* may be written by other thread */
 				if (!folio_test_dirty(folio))
-- 
2.43.0



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
