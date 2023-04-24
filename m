Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id BA0126ED1A0
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 24 Apr 2023 17:44:08 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-3.v29.lw.sourceforge.com)
	by sfs-ml-3.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1pqyMH-0003Us-65;
	Mon, 24 Apr 2023 15:44:04 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-3.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <daeho43@gmail.com>) id 1pqyME-0003Ul-JN
 for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 24 Apr 2023 15:44:01 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:Message-ID:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=0Y94kv4Rk3iMTSBh2tM9IseZv7kKI9eQQ2uKEfYb7wc=; b=IoXjnocAwEIeoG5Ur7DhrB6L5n
 wCkwem7QLL4Tvqa7i9dbnJSsV4AoWtYnBdS6W8K2HOhL3NIf9bDcWYfYEgnPVRao1bQtYw4mvjOpF
 OGck8EwDPS5DqzRCStAh+OrRN4lFKoUlc1UKerhuDykp4LFWI0QkpfkvD4EuCo2uNvVM=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:Cc:To:From
 :Sender:Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=0Y94kv4Rk3iMTSBh2tM9IseZv7kKI9eQQ2uKEfYb7wc=; b=X
 dshHOhClcbia2ibpsniYWmubCqRCQKcLHdqpNhLYCpYXYRz8aXh97BsdVuyzd006/g7kYAESBnrcl
 rumAKUO3NkGsbfCu9Yu7D0sOnqSYm4QRpd+MEqR6iDVvgS9EbkLNNH5w70UU0LUWAYnjbeSnZoHDL
 X0fhjKqqVRQ92LzQ=;
Received: from mail-pf1-f170.google.com ([209.85.210.170])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1pqyM9-0007KN-Jb for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 24 Apr 2023 15:44:01 +0000
Received: by mail-pf1-f170.google.com with SMTP id
 d2e1a72fcca58-63b73203e0aso28731781b3a.1
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Mon, 24 Apr 2023 08:43:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1682351032; x=1684943032;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=0Y94kv4Rk3iMTSBh2tM9IseZv7kKI9eQQ2uKEfYb7wc=;
 b=bfqMNspTUR07cVDdCj7SlELLZZ83YmBEmO2Uq6W0tFwNSQPkt5hAaPxANaOF1FdSIR
 i9a0ocFqi5MLcrMvtdmZjd2aSR79XGZois2J3Yryn1P/X2THIP/B8BWo1YGDpEC3OtYF
 W6dUXC9zefKCkGgu9MnPezH3ZYHhvWWNWW2XK3rU9cBJfKVLn8c8mJ05Nm5b8O3t/In6
 /GODt079WO7e7oK1tFA/xpBK0VpfXqcFy9eYELW68sxe6xhgehaSMSYrB0XUZ6a4lzWv
 OdHuxRH0a9J+UVSMjtMf4TQGa8OZJIYs2zVt9oaZB8UjrBKah12X0wPK/OZaVbDsHuE0
 9VwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1682351032; x=1684943032;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=0Y94kv4Rk3iMTSBh2tM9IseZv7kKI9eQQ2uKEfYb7wc=;
 b=RvFa3spgsgR0xcaKUH/S7BpmaT2z3PFysMbytlLnfR7CyC4suoFSi9tiGLHwQVOhzK
 bVa+IzmeSUgV6q09g6lgAq9zK0WO6R8ajGCl+rJn2AaXDCeHYSI08V0aBKUzQ2mFl0wH
 YXN7QtEa7t+LeFkQQmIylgu41k5KXLKYdVolRkk6DToMCDxjCAD/+NHm0uIOf7LjbeBP
 yd91lZCdYiZ5QdYGwQHy/XXuRjy8kWVP+rzEWPaHHS40acPmfgaIuqplCTPUhPFBXmdp
 pGnQcuEwrMCNLHtnChuaOUBrMkLZUESFueJtTLE/b7m9m4fqL9hFQH/ijM061SEq6d8W
 OI2g==
X-Gm-Message-State: AAQBX9e3ihrn3i0fTDoZ8zodgSb3ijkEocmkLBEW82rstbUUED7sWaWI
 FU1pXJNqh11aPZX1ZfRGY+8=
X-Google-Smtp-Source: AKy350YrdMCoecv6uUyzr/dRBtPNCJLufI9W1otCK+PuTbNoU4pTRwhSkGaH7sHfgLAjxeWl6mnnQA==
X-Received: by 2002:a05:6a21:329a:b0:f2:e20a:c8f4 with SMTP id
 yt26-20020a056a21329a00b000f2e20ac8f4mr8577557pzb.31.1682351031753; 
 Mon, 24 Apr 2023 08:43:51 -0700 (PDT)
Received: from daehojeong-desktop.mtv.corp.google.com
 ([2620:15c:211:201:26c1:a43d:1ede:71a3])
 by smtp.gmail.com with ESMTPSA id
 j16-20020aa783d0000000b0063efe2f3ecdsm7541515pfn.204.2023.04.24.08.43.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 24 Apr 2023 08:43:51 -0700 (PDT)
From: Daeho Jeong <daeho43@gmail.com>
To: linux-kernel@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net,
 kernel-team@android.com
Date: Mon, 24 Apr 2023 08:43:48 -0700
Message-ID: <20230424154348.22885-1-daeho43@gmail.com>
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
 atomic write files. Fixes: 3db1de0e582c ("f2fs: change the current atomic
 write way") Signed-off-by: Daeho Jeong --- fs/f2fs/data.c | 15 ++++++++++-----
 1 file changed, 10 insertions(+), 5 deletions(-) 
 Content analysis details:   (0.0 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.2 FREEMAIL_ENVFROM_END_DIGIT Envelope-from freemail username ends
 in digit [daeho43[at]gmail.com]
 0.0 FREEMAIL_FROM          Sender email is commonly abused enduser mail
 provider [daeho43[at]gmail.com]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 0.0 RCVD_IN_MSPIKE_H3      RBL: Good reputation (+3)
 [209.85.210.170 listed in wl.mailspike.net]
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
 no trust [209.85.210.170 listed in list.dnswl.org]
 -0.0 T_SCC_BODY_TEXT_LINE   No description available.
 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
X-Headers-End: 1pqyM9-0007KN-Jb
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

Fixes: 3db1de0e582c ("f2fs: change the current atomic write way")
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
