Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 28D1B8FA89
	for <lists+linux-f2fs-devel@lfdr.de>; Fri, 16 Aug 2019 07:56:56 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1hyVEK-0007dq-9F; Fri, 16 Aug 2019 05:56:52 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <ebiggers@kernel.org>) id 1hyVEI-0007dP-Ov
 for linux-f2fs-devel@lists.sourceforge.net; Fri, 16 Aug 2019 05:56:50 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-Id:Date:Subject:To:From:Sender:Reply-To:Cc:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=d4Pvny3rtTNcjZmNduYfXCNqc0iOTER48ySWthsFjkw=; b=SZzucAVJjT4wSnAweJTrUEYSFP
 Oc2KIvzP/Yd2xlvNdF8bLLx0OB7yJHHcfidGrpSbwULqVW8JUbsCd9mB9AhBD8F98MIlewSxTxtyP
 /cmnKXrst9po+2lkzJIVrkwNoOlur4FiMQHaaWY8NdwqUFE2GQhyx/TGiLCLBekd+kxE=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-Id:
 Date:Subject:To:From:Sender:Reply-To:Cc:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=d4Pvny3rtTNcjZmNduYfXCNqc0iOTER48ySWthsFjkw=; b=asipkeRmNNHt3859YC0qQsn+2T
 +1OO0ddhJXDOZcsDO52WcSJRqqJGEc1gG+RXYas0H41yrO2CLpTsAtjaXphh2Vb+dLhsjBvF+tjh/
 lc+FLidW+QTQdZ8yDAPkKWmbnwkDWDaFR9acj0qflRtPBelOIp+yRdhX5NWqpTB6fiL4=;
Received: from mail.kernel.org ([198.145.29.99])
 by sfi-mx-4.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 id 1hyVEH-0058Cx-Bf
 for linux-f2fs-devel@lists.sourceforge.net; Fri, 16 Aug 2019 05:56:50 +0000
Received: from sol.localdomain (c-24-5-143-220.hsd1.ca.comcast.net
 [24.5.143.220])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id E449B206C2
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Fri, 16 Aug 2019 05:56:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1565935003;
 bh=hEWy1FwHE3RwJ09MdALkIVvXegYypAnkkam0aCtTXAg=;
 h=From:To:Subject:Date:In-Reply-To:References:From;
 b=Um6fyZnKF7j6ipcYZmBkP1eqEbDGYlMOsGofwPRzrOkZTTY3DyRFxChI+M3pyx4DU
 ZiXKma2AFkGT+N5xiwS2dunlQwhvvmHu6LXFtyBsLx8+n/VbI2hYWu0HeNVjue+rlW
 hc3VUuOP+gFXENaMiymb1mL93be3/WQo8rxUw2IY=
From: Eric Biggers <ebiggers@kernel.org>
To: linux-f2fs-devel@lists.sourceforge.net
Date: Thu, 15 Aug 2019 22:55:38 -0700
Message-Id: <20190816055539.30420-3-ebiggers@kernel.org>
X-Mailer: git-send-email 2.22.0
In-Reply-To: <20190816055539.30420-1-ebiggers@kernel.org>
References: <20190816055539.30420-1-ebiggers@kernel.org>
MIME-Version: 1.0
X-Spam-Score: -0.1 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - Whitelisted High sender
X-Headers-End: 1hyVEH-0058Cx-Bf
Subject: [f2fs-dev] [PATCH 2/3] f2fs: fix copying too many bytes in
 FS_IOC_SETFSLABEL
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

From: Eric Biggers <ebiggers@google.com>

Userspace provides a null-terminated string, so don't assume that the
full FSLABEL_MAX bytes can always be copied.

Fixes: 61a3da4d5ef8 ("f2fs: support FS_IOC_{GET,SET}FSLABEL")
Signed-off-by: Eric Biggers <ebiggers@google.com>
---
 fs/f2fs/file.c | 22 +++++-----------------
 1 file changed, 5 insertions(+), 17 deletions(-)

diff --git a/fs/f2fs/file.c b/fs/f2fs/file.c
index d521a582d94d..315127251bc1 100644
--- a/fs/f2fs/file.c
+++ b/fs/f2fs/file.c
@@ -3111,23 +3111,11 @@ static int f2fs_set_volume_name(struct file *filp, unsigned long arg)
 	struct inode *inode = file_inode(filp);
 	struct f2fs_sb_info *sbi = F2FS_I_SB(inode);
 	char *vbuf;
-	int len;
 	int err = 0;
 
-	vbuf = f2fs_kzalloc(sbi, MAX_VOLUME_NAME, GFP_KERNEL);
-	if (!vbuf)
-		return -ENOMEM;
-
-	if (copy_from_user(vbuf, (char __user *)arg, FSLABEL_MAX)) {
-		err = -EFAULT;
-		goto out;
-	}
-
-	len = strnlen(vbuf, FSLABEL_MAX);
-	if (len > FSLABEL_MAX - 1) {
-		err = -EINVAL;
-		goto out;
-	}
+	vbuf = strndup_user((const char __user *)arg, FSLABEL_MAX);
+	if (IS_ERR(vbuf))
+		return PTR_ERR(vbuf);
 
 	err = mnt_want_write_file(filp);
 	if (err)
@@ -3137,7 +3125,7 @@ static int f2fs_set_volume_name(struct file *filp, unsigned long arg)
 
 	memset(sbi->raw_super->volume_name, 0,
 			sizeof(sbi->raw_super->volume_name));
-	utf8s_to_utf16s(vbuf, MAX_VOLUME_NAME, UTF16_LITTLE_ENDIAN,
+	utf8s_to_utf16s(vbuf, strlen(vbuf), UTF16_LITTLE_ENDIAN,
 			sbi->raw_super->volume_name,
 			ARRAY_SIZE(sbi->raw_super->volume_name));
 
@@ -3147,7 +3135,7 @@ static int f2fs_set_volume_name(struct file *filp, unsigned long arg)
 
 	mnt_drop_write_file(filp);
 out:
-	kvfree(vbuf);
+	kfree(vbuf);
 	return err;
 }
 
-- 
2.22.0



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
