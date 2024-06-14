Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E106908045
	for <lists+linux-f2fs-devel@lfdr.de>; Fri, 14 Jun 2024 02:49:58 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-3.v29.lw.sourceforge.com)
	by sfs-ml-3.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1sHv8Y-0003Ex-5s;
	Fri, 14 Jun 2024 00:49:49 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-3.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <cwjhust@gmail.com>) id 1sHv8W-0003Er-6N
 for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 14 Jun 2024 00:49:47 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=Hr9zxapFgNaER63LJwaQwrbpwLBIxQNjoba83Eu4cUw=; b=cRxtUWROgCtaPWHQooBEfmRWf0
 QmmjFCLHy/0bqiSeDxXEyjW6eZCRgFViMi1l0q2+i2Kt9b/9wmKFZzXMt0mseFRKi7eGIMGuj/5MM
 fMlITlNO/gO9svJ3DaNCXjgP/ZSzaEWWe1fg+FsX8efScwOc3SiRHeClWtHFRr5c+hMM=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:Message-Id:Date:Subject:Cc:To:From
 :Sender:Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=Hr9zxapFgNaER63LJwaQwrbpwLBIxQNjoba83Eu4cUw=; b=M
 JbBow34f089b0Cn/im1NWQ4kWy7wYBXeJC//enx/+ZT+kwFG2Dt1KVcEZZ4wC03ObkKv32RRKucmO
 7UndIWNyNTwx9trj/SVQqG7oBF+UcJsXs6/iRWSN1b2o3bxCAICf7RplojmUMxeMgJnotbsjfayL9
 iLfD6N5hTT0BIzpo=;
Received: from mail-pl1-f196.google.com ([209.85.214.196])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1sHv8V-0007cO-NV for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 14 Jun 2024 00:49:47 +0000
Received: by mail-pl1-f196.google.com with SMTP id
 d9443c01a7336-1f4a0050b9aso15093275ad.2
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Thu, 13 Jun 2024 17:49:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1718326176; x=1718930976; darn=lists.sourceforge.net;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=Hr9zxapFgNaER63LJwaQwrbpwLBIxQNjoba83Eu4cUw=;
 b=XhgZTTvfhn1YKT79VO2a/7gPqs22EjemAzw2JKIgMkjfqH2m0d7VXcNJtZrXqQxUP8
 hKchZE/DyYQHNSpO7fhpxIx4DXFvm1UHgNFnSKEstMUZ9VH6OYt6Wxq+YMELJmPLTHbM
 o4x9ORBTju9cCzWAPy7ss8wgE5ZI9LjxMEpjUOwc13puH/J45PSgCTARWDrKraXbixGs
 +YMkkt4hGVaexH5ruZCqXjVUvwtqEXNS51zPIKMUYIqGpjRB8NVJRCsRma+RKPEPiZoH
 LP/PA2+g1vvuiO36ygsVJOtQVpl2y9aB5iFbEDJemqEn2rVYdRG3aWe4zgUMhXEfVe5N
 zjqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1718326176; x=1718930976;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=Hr9zxapFgNaER63LJwaQwrbpwLBIxQNjoba83Eu4cUw=;
 b=LlCJKpBZz/e/aG379x5c6jKg8lNgP9H7+7I/XdgsBpGjG4IhL5V0TSHjRqTIXUqbwO
 LXIlo5VSOcgBT2TwNtgiruacK3MQMSLZPa+V8jZ+nas1GchptOH7KM8AzjzSqJaW1cTq
 pBgNybQADJDCiAbNCs/JSZC7sRqSxlkqRx/Z2U4T7cNlL5gJlWvLGDUW8K5p7JgMAQSB
 fFHFfv8FJtdsFNbe6hwXE/m7G/d4fYeHl+RnzZKvrErfdAid+3pJP5P5J3f9dIdsqPe+
 gRRjYBfztFb/Ascp7tqAbPYXazfNSJneSb96M6/I3VUzz6kb4MVDzDtSS3+iYfAWeBXQ
 T2VQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCU5sE9EKZrc+enITr2Y8+3dA+sbIk7vj34uOMFM2krv/ThBKitvlZ+QJ5Y5b6TjXAgamZ0oXGiFhGPCbM5iih9lAnLTU5wZgEa6zpEX54OAIsJ20+o4Tg==
X-Gm-Message-State: AOJu0YwDaVI2Qv6MNtzKFR/bS09YLGn36z4wN6QqeuiJ6nTFgt/9x5GN
 F2ufJPyZpC8DzXz7fr70fQ0+Ck14ruyG0JDna/rALgBJl5unK73WKiP2IQRJ/e2Rsw==
X-Google-Smtp-Source: AGHT+IGZRxn+Q9QyKPSinjIbvRNnovNHhMZftvOoCKYOG2MN/PiQrhE56oC0bjzZjT7sPIWAgcDlog==
X-Received: by 2002:a17:902:c409:b0:1f7:560:ef27 with SMTP id
 d9443c01a7336-1f8627f731bmr16059525ad.40.1718326176175; 
 Thu, 13 Jun 2024 17:49:36 -0700 (PDT)
Received: from tan.. ([222.20.95.235]) by smtp.googlemail.com with ESMTPSA id
 d9443c01a7336-1f855f17968sm20338485ad.229.2024.06.13.17.49.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 13 Jun 2024 17:49:35 -0700 (PDT)
From: Wenjie Cheng <cwjhust@gmail.com>
To: jaegeuk@kernel.org,
	chao@kernel.org
Date: Fri, 14 Jun 2024 00:48:41 +0000
Message-Id: <20240614004841.103114-1-cwjhust@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: This reverts commit c550e25bca660ed2554cbb48d32b82d0bb98e4b1.
 Commit c550e25bca660ed2554cbb48d32b82d0bb98e4b1 ("f2fs: use flush command
 instead of FUA for zoned device") used additional flush command to keep write
 order. Content analysis details:   (-0.2 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 RCVD_IN_VALIDITY_RPBL_BLOCKED RBL: ADMINISTRATOR NOTICE: The
 query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [209.85.214.196 listed in bl.score.senderscore.com]
 0.0 RCVD_IN_VALIDITY_CERTIFIED_BLOCKED RBL: ADMINISTRATOR NOTICE:
 The query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [209.85.214.196 listed in sa-trusted.bondedsender.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 FREEMAIL_FROM          Sender email is commonly abused enduser mail
 provider [cwjhust[at]gmail.com]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.0 RCVD_IN_MSPIKE_H3      RBL: Good reputation (+3)
 [209.85.214.196 listed in wl.mailspike.net]
 -0.0 T_SCC_BODY_TEXT_LINE   No description available.
 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
X-Headers-End: 1sHv8V-0007cO-NV
Subject: [f2fs-dev] [PATCH] Revert "f2fs: use flush command instead of FUA
 for zoned device"
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
Cc: qwjhust@gmail.com, linux-kernel@vger.kernel.org,
 Wenjie Cheng <cwjhust@gmail.com>, linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

This reverts commit c550e25bca660ed2554cbb48d32b82d0bb98e4b1.

Commit c550e25bca660ed2554cbb48d32b82d0bb98e4b1 ("f2fs: use flush
command instead of FUA for zoned device") used additional flush
command to keep write order.

Since Commit dd291d77cc90eb6a86e9860ba8e6e38eebd57d12 ("block:
Introduce zone write plugging") has enabled the block layer to
handle this order issue, there is no need to use flush command.

Signed-off-by: Wenjie Cheng <cwjhust@gmail.com>
---
 fs/f2fs/file.c | 3 +--
 fs/f2fs/node.c | 2 +-
 2 files changed, 2 insertions(+), 3 deletions(-)

diff --git a/fs/f2fs/file.c b/fs/f2fs/file.c
index eae2e7908072..f08e6208e183 100644
--- a/fs/f2fs/file.c
+++ b/fs/f2fs/file.c
@@ -372,8 +372,7 @@ static int f2fs_do_sync_file(struct file *file, loff_t start, loff_t end,
 	f2fs_remove_ino_entry(sbi, ino, APPEND_INO);
 	clear_inode_flag(inode, FI_APPEND_WRITE);
 flush_out:
-	if ((!atomic && F2FS_OPTION(sbi).fsync_mode != FSYNC_MODE_NOBARRIER) ||
-	    (atomic && !test_opt(sbi, NOBARRIER) && f2fs_sb_has_blkzoned(sbi)))
+	if (!atomic && F2FS_OPTION(sbi).fsync_mode != FSYNC_MODE_NOBARRIER)
 		ret = f2fs_issue_flush(sbi, inode->i_ino);
 	if (!ret) {
 		f2fs_remove_ino_entry(sbi, ino, UPDATE_INO);
diff --git a/fs/f2fs/node.c b/fs/f2fs/node.c
index 144f9f966690..c45d341dcf6e 100644
--- a/fs/f2fs/node.c
+++ b/fs/f2fs/node.c
@@ -1631,7 +1631,7 @@ static int __write_node_page(struct page *page, bool atomic, bool *submitted,
 		goto redirty_out;
 	}
 
-	if (atomic && !test_opt(sbi, NOBARRIER) && !f2fs_sb_has_blkzoned(sbi))
+	if (atomic && !test_opt(sbi, NOBARRIER))
 		fio.op_flags |= REQ_PREFLUSH | REQ_FUA;
 
 	/* should add to global list before clearing PAGECACHE status */
-- 
2.34.1



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
