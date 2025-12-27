Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 99AEACDF4B8
	for <lists+linux-f2fs-devel@lfdr.de>; Sat, 27 Dec 2025 07:23:44 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Subject:MIME-Version:Message-ID:Date:To:From:Sender:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=8m1Yj4buZRX3txUrbMA6E4ML4IC/MCayUnnarntYtLc=; b=eHMq44iDFx/Es+f+xUoS2ZA7jV
	bjki79R/dKvGHpuZtpNET8w2+tXphtOk3aqBKPeufbkHOBuf/jhQmcpNUH8vMfKQxk/iMxU+qqBir
	qE0uhFMp+D+ZjsvJd308FlIqJfL1OecxSHatXKRr+8dNoNlPMDfYaD53ePA0qOCg2JDo=;
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1vZNiC-0005Nl-JE;
	Sat, 27 Dec 2025 06:23:36 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <yangyongpeng.storage@gmail.com>) id 1vZNi9-0005Ne-On
 for linux-f2fs-devel@lists.sourceforge.net;
 Sat, 27 Dec 2025 06:23:34 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:Message-ID:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=9y3Re+5HzgFi+dtKuT5MyllnA054IgI5LqKk6GAJecY=; b=Wpyrkxx8Uu/JYt6eETszMWH//F
 4r+Cdfw322Sppj+nqXM76aEUKBkO7wZDyr8NNlE5ngQ1RY/mXedmWRX8vghpHSh/AtwJyJ30nqwIv
 68BZxtUYq3+WFOSCpcQvQkqakdE+sYgU59smhxKgo/eE942/DE1WF/JSzv6cSKWy2i+w=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:Cc:To:From
 :Sender:Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=9y3Re+5HzgFi+dtKuT5MyllnA054IgI5LqKk6GAJecY=; b=j
 gQKEEq/avq7o3UIKZr6ipgn+gqibaXDNCUQTnOPZ6ucCp1Keugq4gsJnh/ZnbDHp8fLZ5YXrxyiJC
 dYS6+2MPKds80eJ4EtVUwrpQtP62TiWJL5OUr/VPVdu338J9jqa4zU5K4yQ16zkjV/KYL8UhcqneI
 u9jJPa0wgGP9FWPE=;
Received: from mail-pf1-f173.google.com ([209.85.210.173])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1vZNi9-0003Cs-7t for linux-f2fs-devel@lists.sourceforge.net;
 Sat, 27 Dec 2025 06:23:33 +0000
Received: by mail-pf1-f173.google.com with SMTP id
 d2e1a72fcca58-7b8eff36e3bso12235212b3a.2
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Fri, 26 Dec 2025 22:23:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1766816602; x=1767421402; darn=lists.sourceforge.net;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=9y3Re+5HzgFi+dtKuT5MyllnA054IgI5LqKk6GAJecY=;
 b=SxvqXSk1sQ6Hii5Zwv2KyAUoPy2iuJ/dEsx0YwfMqPMd/55F4uyJYTfXdxb+LGigXK
 6J7NETVol1bTVF3WSiKQl5pfWSAukGcouVsz4zMle2pcxepUH8cnwZo0iYZBxTpcFkMj
 hdFpZtyOloVIe+0d9YJOzgKUTipVDJeMtB1dxSQxU8QtabSCcsBYk0nc4r8XBEaavrqw
 u42NBH+uQoNm7SXPWz7cpsk35aBDEL2VF3+hEH2XQFbuenWMjcGWnBlCM2GZrxx5313v
 sCVI6yGINwQCdQ8Nb2y+hr2xuuPyjlv+fT8ggIaXQagFfvELyRrGWGjXDSqgVgHfRRzW
 gFwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1766816602; x=1767421402;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=9y3Re+5HzgFi+dtKuT5MyllnA054IgI5LqKk6GAJecY=;
 b=vmQweqHV3i54BW17swnGlyyUepMJQuTojZ790iVgz0trZ1p+9tPgtPD6xelPIXCRTM
 gduqlJ4A6NoQZvO48R5dgPkT4rJhJMhVhTlXiOLVB2AMtLPo2QgAVIx8UNNtjHCuPsDw
 zBQ7zqB+yUfeIUF+juLGgvJB7DLvNg1Q+PdnyJ9Hjx1OICj6FhbtNdBF2o7DSgMAiogd
 UfggxAe6SWm+AYCFtvVHSZCHaPUAMCUi0Lz09cTnVthJrkCe6ZHACL03TZuw+BDpxxZ7
 JpCHSfvAI5vIpowK8+T4TB58M4KoJr4xv2054hNCwlbYvrcRhOqH5X/E32sH58J48e2v
 Ct2w==
X-Gm-Message-State: AOJu0YyS1aemXjB2iTag0OsrhEUAAdIUwBjy2Ae2qAr/NQAt3dqRbRaK
 vjGBTyU0ah+DLlc442bK7D6cLvF9mULGwlTUzAglLcR/zstbF5yVf8ec
X-Gm-Gg: AY/fxX6D4FGPI0eDv+lK6hDTqqxOvBoJv+Jgkkxxs0yVRcrhu84y2GnrOXSS5w+z+Hl
 YDKYtvFIAZiKFOlqHOgiwuNh6cg/iO2mRUFaaxfX/jVv0tBQF0RU/MHZs4xlX50ueDDMpJwPcLr
 Ip3lPiQIreZ5/rcjvmnq1rxh7GIBlvAlcKJ6tZQ0me/xm+rtx7a3mruWBWRUhlxIXqhmX3Ztgte
 sXB62cVEoOvcsKk+wtYHhXunvA+feZhH8qmlU8QKlzFuAd5gUUyQUBUeTZ2pHWbLH0dgujCwngV
 /x+bXZxKemdybHbAVqQs8pYQrTt/Di42HMuzB71HFSxtSf0MiXQsQ3feSiVJ36y126PwyN7Xm+C
 L3EXoPKWoZ0aI+0OND1JI0bHVqKt0i3IrDuhFHHIfiTLPBwrhjuiWr00m9I0O0qpBvtT+dDXoTi
 byI9HYLUzfUH4/g8rU5IAy27iJ1CVXAAlPHfRMdQ==
X-Google-Smtp-Source: AGHT+IEJTIH5oPy0mGMxFyYj7n+LvSX1GgFhyUbeUcmZW1a95GaSN760CgPVKkasIq3KW7LqsI+EUA==
X-Received: by 2002:a05:6a00:2345:b0:7ff:d378:98f with SMTP id
 d2e1a72fcca58-7ffd3875007mr21636483b3a.37.1766816602412; 
 Fri, 26 Dec 2025 22:23:22 -0800 (PST)
Received: from monty-pavel.. ([120.245.115.65])
 by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-7ff7aa328basm23764174b3a.11.2025.12.26.22.23.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 26 Dec 2025 22:23:22 -0800 (PST)
From: Yongpeng Yang <yangyongpeng.storage@gmail.com>
To: Chao Yu <chao@kernel.org>,
	Jaegeuk Kim <jaegeuk@kernel.org>
Date: Sat, 27 Dec 2025 14:21:42 +0800
Message-ID: <20251227062141.7722-2-yangyongpeng.storage@gmail.com>
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
 1.0 RCVD_IN_UCE2           RBL: IP Subnet Listed in UCEPROTECT Level 2
 [120.245.115.65 listed in dnsbl-2.uceprotect.net]
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
 [209.85.210.173 listed in wl.mailspike.net]
 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
X-Headers-End: 1vZNi9-0003Cs-7t
Subject: [f2fs-dev] [PATCH v3 1/1] f2fs: fix IS_CHECKPOINTED flag
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
