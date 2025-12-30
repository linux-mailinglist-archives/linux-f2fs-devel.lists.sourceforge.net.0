Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B58FCE8FD5
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 30 Dec 2025 09:15:15 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Subject:MIME-Version:Message-ID:Date:To:From:Sender:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=8E/mbDZI7JypXGE1PpYP+A1OSYU1yxjpjbAlvvvHnMw=; b=kVdgpl8OZH51UUUzXC+UvIpYZ1
	UPO+2jgOCnocISuc+l7QCNm6RhnIpdq2zPC8n7y6klLtSObT8fO8sLJQurfNv/3KWE+okL/3nInyp
	1D259qmKCeuPXiSRsDqInbGFwy2L0BJPPj2aVl2j0KdP6yB1GRTJq8wJUu4gQShrCKyM=;
Received: from [127.0.0.1] (helo=sfs-ml-3.v29.lw.sourceforge.com)
	by sfs-ml-3.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1vaUsm-0004Eb-JM;
	Tue, 30 Dec 2025 08:15:08 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-3.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <yangyongpeng.storage@gmail.com>) id 1vaUsl-0004EV-Gw
 for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 30 Dec 2025 08:15:07 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:Message-ID:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=2MZfG4OyxMw3+Klm+4KPmlNM+ymCVZ/DpiByDXxWmd4=; b=DAmxREWPLLX+O49du8wqvPOdn5
 9rEIRNgGdJAGvppF/wCVOchmKLnju3c1hoeuFiNuoCXgWZh/0ratGlxWLOtxcsyD23yTmZqq+L9mS
 F8k/8Cx5cmDbJGAnX//9EHLYV1l7vX3xNjY3FAVKrT5u+ynG+SXp1FVMwg4eSef0m/88=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:Cc:To:From
 :Sender:Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=2MZfG4OyxMw3+Klm+4KPmlNM+ymCVZ/DpiByDXxWmd4=; b=i
 +lstvNNChssWvuvqTCD9WdqljtI20pRinAjJe+gp7Lnx+9yZEDXUgvR1LvGqwIga1ZWF3L502axiZ
 EeyrnSLhMPbkJsS1neTITd+f2u1f5zqeGT7xMPlFZ47CBm8/YFdcwPJo/9PT0vaVVXX53sjQh0Wey
 E0zsIZfX/VZj+NK0=;
Received: from mail-pf1-f175.google.com ([209.85.210.175])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1vaUsk-0005ai-WE for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 30 Dec 2025 08:15:07 +0000
Received: by mail-pf1-f175.google.com with SMTP id
 d2e1a72fcca58-7fbbb84f034so6567725b3a.0
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Tue, 30 Dec 2025 00:15:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1767082496; x=1767687296; darn=lists.sourceforge.net;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=2MZfG4OyxMw3+Klm+4KPmlNM+ymCVZ/DpiByDXxWmd4=;
 b=geJsLtkqmJg+HNbXpfg27+MXwKkZnlCvgSn1dgCRJD3RFt/JqRpRoUF47fuKlCidcK
 BRmEI+ue8WDkFmpLr9aoF24bGoIgn7aKegmWGIAkjTQRVWP73XEEQIA5W6g79HQ6tQV2
 1mbY7K3Co1NI+sVa55NHat6riIeU6sGD62n4rQSY64kRkg1Lyqn2aeRniAB72WAK5biD
 su56I1gXq1DDi6cswZvoVfJUY+7XZnfw+eDhyihk9Q1NlXFbC2T7ozu9ytnPt5L5lJUT
 mVve2LtUAG8Ny/GNTgAS6RZsTro4vmgJA1e2t+BpHfLbHFhBa09XQtGnUx+aWIC+97ku
 H02Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1767082496; x=1767687296;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=2MZfG4OyxMw3+Klm+4KPmlNM+ymCVZ/DpiByDXxWmd4=;
 b=c1AjB8W5+mFL/+C8b/mHGXQher+8pbzIYK+LupkKPoShENWTjf3d8/Ms7dwrFXQEJf
 psCNHUFXE5v3hIq44/aySx9nOeasTGpNk830aAi1N0JivO+lx/yL6y913GmCH3QHf0SO
 L/aoLmnrQnMwSiO2jKIQrhHMyxhMBpQgWCKWh6GsjDN2vr9a5taWUErUrfui7SuoLz1h
 3h1NqL4bEDbu+X8/KTESxLy591Yf8N06809At5f2PlAs6wHVy/oVF7LkbaIypc7Z/YSY
 sPPIbRUzuzqHFXdJ38dmL17W2ka+J4w4ZGbUNyzT5IopB3xO8ytomMznocbIeol7izf8
 fTyQ==
X-Gm-Message-State: AOJu0Yz1W/n5sMGR2tQXnia/8M2MTMLHliBa1RG/s3t96QLVQJJNY2lN
 p1SyT3R5b5UlYIgr8dQnwdnDQbcHnIbSVrBi0nVlf9kHVQTt5MFWL2bukLd6d2SU
X-Gm-Gg: AY/fxX66NApwzbPAuzuvjDUic63J4dR+gXxjSZxWVVfoYv2fbTvCmpjBcEn7wxP+uQX
 c3NoYYUtu1K5FEbmVFWvdmZAZTkoAuz0WMGwT13UeUVjVv3TFyuMPOqT32/lXuEYzJWhAJZDfln
 B6dqlEhjIOD515/gjGcT3WD5E4AKrwkTuN8l1VEEM15UiECslKo0kbdnJ7VqDSg4v1gvWGZhDmz
 B/TSWAXqs7jJF+dUhgugGkoNnOWl5VbOH1vb3//2Y/5X04uMmsikpm44PHrIj6RKqPkPBs1sXFQ
 5cD5+X5DeLcoUPah3gXm7lfLqCQ/X1aCWFv4IxfxaC4v05u5iHRhqZYIId1uG2B4+sMZdZVv1I7
 8kCBiOA3VGTsInODoEkK33CqJlZmunnPp0TK0xSM+wAXzwsx+no35GpCWs3BowyoZ4WYRj57uXn
 UM8kvXuqt332U7EY6YpjbLoD9dgFk=
X-Google-Smtp-Source: AGHT+IFZ6Y2XSEAP+CTlDHiJBAh5aERVuCx5av4owgCFEwjoehKKq4Le5CeK4tYHo0CGT/yjcWiMMw==
X-Received: by 2002:a05:6a20:4325:b0:35d:dd84:148c with SMTP id
 adf61e73a8af0-376a81dcca5mr33050159637.28.1767082496158; 
 Tue, 30 Dec 2025 00:14:56 -0800 (PST)
Received: from monty-pavel.. ([120.245.115.65])
 by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-34e921b39dfsm29552652a91.8.2025.12.30.00.14.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 30 Dec 2025 00:14:55 -0800 (PST)
From: Yongpeng Yang <yangyongpeng.storage@gmail.com>
To: Chao Yu <chao@kernel.org>,
	Jaegeuk Kim <jaegeuk@kernel.org>
Date: Tue, 30 Dec 2025 16:14:30 +0800
Message-ID: <20251230081429.8243-2-yangyongpeng.storage@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Spam-Score: 0.8 (/)
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
 - [...] Content analysis details:   (0.8 points, 5.0 required)
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
 1.0 RCVD_IN_UCE2           RBL: IP Subnet Listed in UCEPROTECT Level 2
 [120.245.115.65 listed in dnsbl-2.uceprotect.net]
 0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [209.85.210.175 listed in wl.mailspike.net]
X-Headers-End: 1vaUsk-0005ai-WE
Subject: [f2fs-dev] [PATCH v4 1/1] f2fs: fix IS_CHECKPOINTED flag
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
    - __write_node_folio(last_folio)
      : f2fs_down_read(&sbi->node_write)//block
                                              - f2fs_flush_nat_entries
                                                : {struct nat_entry}->flag |= BIT(IS_CHECKPOINTED)
                                              - unblock_operations
                                                : f2fs_up_write(&sbi->node_write)
                                             f2fs_write_checkpoint//return
      : f2fs_do_write_node_page()
f2fs_ioc_commit_atomic_write//return
                                             SPO

Thread A calls f2fs_need_dentry_mark(sbi, ino), and the last_folio has
already been written once. However, the {struct nat_entry}->flag did not
have the IS_CHECKPOINTED set, causing set_dentry_mark(last_folio, 1) and
write last_folio again after Thread B finishes f2fs_write_checkpoint.

After SPO and reboot, it was detected that {struct node_info}->blk_addr
was not NULL_ADDR because Thread B successfully write the checkpoint.

This issue only occurs in atomic write scenarios. For regular file
fsync operations, the folio must be dirty. If
block_operations->f2fs_sync_node_pages successfully submit the folio
write, this path will not be executed. Otherwise, the
f2fs_write_checkpoint will need to wait for the folio write submission
to complete, as sbi->nr_pages[F2FS_DIRTY_NODES] > 0. Therefore, the
situation where f2fs_need_dentry_mark checks that the {struct
nat_entry}->flag /wo the IS_CHECKPOINTED flag, but the folio write has
already been submitted, will not occur.

Therefore, for atomic file fsync, sbi->node_write should be acquired
through __write_node_folio to ensure that the IS_CHECKPOINTED flag
correctly indicates that the checkpoint write has been completed.

Fixes: 608514deba38 ("f2fs: set fsync mark only for the last dnode")
Signed-off-by: Sheng Yong <shengyong1@xiaomi.com>
Signed-off-by: Jinbao Liu <liujinbao1@xiaomi.com>
Signed-off-by: Yongpeng Yang <yangyongpeng@xiaomi.com>
---
v4:
- Clarify when the last_folio write completes in the commit message.
v3:
- Add detailed explanations for why fsync operations on regular files do
not hit this issue.
v2:
- If atomic is true, set_dentry_mark in __write_node_folio.
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
