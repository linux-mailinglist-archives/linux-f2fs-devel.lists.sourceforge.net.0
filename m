Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 87F3C6E6B70
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 18 Apr 2023 19:52:24 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1popV5-0008Fr-SG;
	Tue, 18 Apr 2023 17:52:19 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <daeho43@gmail.com>) id 1popV5-0008Fl-2J
 for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 18 Apr 2023 17:52:18 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:Message-ID:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=ecJfBqabO7lqZzAX7J4vFKzXJzBbVDV46eKIKNvjRGA=; b=g505lIfTGTFXl+st3ddigC1vqM
 sdjwMNA9djsChxNu4EXJfqtnUz5/QeOTUkMMH5SlK1BOX5L0QJmRUkZ+8/x4D7fFgyqRjNl8Oe7Pv
 HhugJEnUEqFqtuot0TAnNscSQB/UgL9BZULe1IWMVRj0KEC27bUyz7HJ751OL86/fWBM=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:Cc:To:From
 :Sender:Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=ecJfBqabO7lqZzAX7J4vFKzXJzBbVDV46eKIKNvjRGA=; b=d
 8o9OhL8x4iHonzqFEE5SFMIcxldieauzTimZSvK4/vY3sWmHEKoGnTzCbOz6MysUxUir54/6qE9zk
 I//bhXBD0EI4X6dB5MHN7jmOOl6E8HNixdeQh4tlCbd43g5LTUKJ5SMmlaahGHi+HBAhK2z1OJ+gg
 6UyosuFVgY8PlCu8=;
Received: from mail-pj1-f48.google.com ([209.85.216.48])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1popV2-00012k-Ct for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 18 Apr 2023 17:52:16 +0000
Received: by mail-pj1-f48.google.com with SMTP id pc15so156333pjb.3
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Tue, 18 Apr 2023 10:52:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1681840330; x=1684432330;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=ecJfBqabO7lqZzAX7J4vFKzXJzBbVDV46eKIKNvjRGA=;
 b=UuRVKbYHNO2+ypBmSsydrxG8hH0RsWKq/LU/ZHKXV3YRapO0ysKFvJSkROA9g7vm9B
 kLFt2FJPSyJKCbQOci0pY9obi5lV3WhsPGxGZCQOvGTRpPXXNfeJ+YiKMsoWUFYfYVVC
 brzT+MNq4jqVKJ0DhI5dCPneI/MVeL9HK+9+VVuccBxTEIyGtwUDbxfQFDizQEXMSGHS
 CC3WtzHnHWxWEoebWLZ+Squf20SfvvP28iI3yEsj8IvyblGco7JE/OvflzMQMJddtIWS
 VK92b2mxVVLsDvnzBJjk+35Ap9aTyT4X8bk/cmStc14JO8egcGxG0gNu7bYh+C/DLGPx
 LLrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1681840330; x=1684432330;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=ecJfBqabO7lqZzAX7J4vFKzXJzBbVDV46eKIKNvjRGA=;
 b=WHf8sgCvD12PjzF+NmUW5q1jKoW+ui6mUrz894ClbhEekKY8DAZTZ0U9iMHkwYgvfQ
 tUrLGY0VvmzFES258rFHaO05T1D8FEAxkAHKrCiYoDfkt7ZsdGX9YA/3IY6i7qMYa+wo
 WwvCipYqI6maORH0sMPo6MFeI01Rk/ElGl6mxFNw3HF+Um5XLEbaWMKcqUbIxw1C0PFk
 VD8cLYadw4bzR9rEmanruLBeWLFiKc3PtiRH8HiUqP6oOKGAvcy2NytkvwG4JSikyK0K
 FcnFZ4zvi/I5IgFUVdP+/PntlWheAiBf/blMVNBXhf6VrezxDIjc5ImzaNUzs7usT6pp
 Vwlw==
X-Gm-Message-State: AAQBX9fpm+JpA/ytQxv3cynlEQTPM0JduytCZHbSvASu8ou6ITBLdqHo
 d5T7j9CUxyZY1tnjmuhUyY1zSLeHhnY=
X-Google-Smtp-Source: AKy350bRDp0Yo5TSKicloGZlgruDCfWjNghh4tbzOOhERT6f6BCtJkiJzdsOxSs6PKdY33rl8XzJIQ==
X-Received: by 2002:a05:6a20:a110:b0:ef:8b50:56b7 with SMTP id
 q16-20020a056a20a11000b000ef8b5056b7mr470860pzk.60.1681840330484; 
 Tue, 18 Apr 2023 10:52:10 -0700 (PDT)
Received: from daehojeong-desktop.mtv.corp.google.com
 ([2620:15c:211:201:e22b:bd7c:4df6:1ae0])
 by smtp.gmail.com with ESMTPSA id
 w3-20020a17090ac98300b00227223c58ecsm8881772pjt.42.2023.04.18.10.52.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 18 Apr 2023 10:52:10 -0700 (PDT)
From: Daeho Jeong <daeho43@gmail.com>
To: linux-kernel@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net,
 kernel-team@android.com
Date: Tue, 18 Apr 2023 10:52:06 -0700
Message-ID: <20230418175206.3282328-1-daeho43@gmail.com>
X-Mailer: git-send-email 2.40.0.634.g4ca3ef3211-goog
MIME-Version: 1.0
X-Spam-Score: 0.0 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: From: Daeho Jeong Need to use cow inode data content instead
 of the one in the original inode, when we try to write the already updated
 atomic write files. Signed-off-by: Daeho Jeong --- fs/f2fs/data.c | 15
 ++++++++++-----
 1 file changed, 10 insertions(+), 5 deletions(-) 
 Content analysis details:   (0.0 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.2 FREEMAIL_ENVFROM_END_DIGIT Envelope-from freemail username ends
 in digit [daeho43[at]gmail.com]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 0.0 FREEMAIL_FROM          Sender email is commonly abused enduser mail
 provider [daeho43[at]gmail.com]
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.0 RCVD_IN_MSPIKE_H3      RBL: Good reputation (+3)
 [209.85.216.48 listed in wl.mailspike.net]
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
 no trust [209.85.216.48 listed in list.dnswl.org]
 -0.0 T_SCC_BODY_TEXT_LINE   No description available.
 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
X-Headers-End: 1popV2-00012k-Ct
Subject: [f2fs-dev] [PATCH] f2fs: use cow inode data when updating atomic
 write
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

Need to use cow inode data content instead of the one in the original
inode, when we try to write the already updated atomic write files.

Signed-off-by: Daeho Jeong <daehojeong@google.com>
---
 fs/f2fs/data.c | 15 ++++++++++-----
 1 file changed, 10 insertions(+), 5 deletions(-)

diff --git a/fs/f2fs/data.c b/fs/f2fs/data.c
index 8df225014304..7165b1202f53 100644
--- a/fs/f2fs/data.c
+++ b/fs/f2fs/data.c
@@ -3491,7 +3491,7 @@ static int __reserve_data_block(struct inode *inode, pgoff_t index,
 
 static int prepare_atomic_write_begin(struct f2fs_sb_info *sbi,
 			struct page *page, loff_t pos, unsigned int len,
-			block_t *blk_addr, bool *node_changed)
+			block_t *blk_addr, bool *node_changed, bool *use_cow)
 {
 	struct inode *inode = page->mapping->host;
 	struct inode *cow_inode = F2FS_I(inode)->cow_inode;
@@ -3505,10 +3505,12 @@ static int prepare_atomic_write_begin(struct f2fs_sb_info *sbi,
 
 	/* Look for the block in COW inode first */
 	err = __find_data_block(cow_inode, index, blk_addr);
-	if (err)
+	if (err) {
 		return err;
-	else if (*blk_addr != NULL_ADDR)
+	} else if (*blk_addr != NULL_ADDR) {
+		*use_cow = true;
 		return 0;
+	}
 
 	if (is_inode_flag_set(inode, FI_ATOMIC_REPLACE))
 		goto reserve_block;
@@ -3538,6 +3540,7 @@ static int f2fs_write_begin(struct file *file, struct address_space *mapping,
 	struct page *page = NULL;
 	pgoff_t index = ((unsigned long long) pos) >> PAGE_SHIFT;
 	bool need_balance = false;
+	bool use_cow = false;
 	block_t blkaddr = NULL_ADDR;
 	int err = 0;
 
@@ -3597,7 +3600,7 @@ static int f2fs_write_begin(struct file *file, struct address_space *mapping,
 
 	if (f2fs_is_atomic_file(inode))
 		err = prepare_atomic_write_begin(sbi, page, pos, len,
-					&blkaddr, &need_balance);
+					&blkaddr, &need_balance, &use_cow);
 	else
 		err = prepare_write_begin(sbi, page, pos, len,
 					&blkaddr, &need_balance);
@@ -3637,7 +3640,9 @@ static int f2fs_write_begin(struct file *file, struct address_space *mapping,
 			f2fs_handle_error(sbi, ERROR_INVALID_BLKADDR);
 			goto fail;
 		}
-		err = f2fs_submit_page_read(inode, page, blkaddr, 0, true);
+		err = f2fs_submit_page_read(use_cow ?
+				F2FS_I(inode)->cow_inode : inode, page,
+				blkaddr, 0, true);
 		if (err)
 			goto fail;
 
-- 
2.40.0.634.g4ca3ef3211-goog



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
