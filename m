Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F4BE2B60E
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 27 May 2019 15:11:22 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1hVFPK-0000sr-Lb; Mon, 27 May 2019 13:11:18 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <stummala@codeaurora.org>) id 1hVFPJ-0000sk-Tk
 for linux-f2fs-devel@lists.sourceforge.net; Mon, 27 May 2019 13:11:17 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
 MIME-Version:Content-Type:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=UmivGaHxUkuboEHTpj/IC5GRZpe0ONF25+zFxp8fSDA=; b=hv6cvpcjGbAT6Cx/I9h9RTgOU0
 VoxzckVA8ImOAn0urqj23UTF2zecsNy3Kq++Tiu7ODYabxJaEc63GGAQe6sIlzZNSHySN0qlZ4pWN
 qmoOmY6tFQxByPoIAMjQmTfNxwjJf7vSsj+I5EFW5TQUSHFNLiAPCB8tSV9uTFNr9L1k=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:MIME-Version:
 Content-Type:Content-Transfer-Encoding:Content-ID:Content-Description:
 Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
 In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=UmivGaHxUkuboEHTpj/IC5GRZpe0ONF25+zFxp8fSDA=; b=KO7S6TlcP1rR21H+PKvzJ8OO6y
 Q6rS/6q6zfrh8Mb4GwVXjQZ2i91wM4+0F/fLxVx86Jk+OZY3ujcCX5ztKkrsV4DSUQo+ugRdmDAZ9
 CMrkHRDr5wOUXyc3A5CKdAuvM5Ci7xmKail5406zt7J5XFLiGMfeKtkd52oHL2SLVqhk=;
Received: from smtp.codeaurora.org ([198.145.29.96])
 by sfi-mx-4.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 id 1hVFPI-00FNJA-N1
 for linux-f2fs-devel@lists.sourceforge.net; Mon, 27 May 2019 13:11:17 +0000
Received: by smtp.codeaurora.org (Postfix, from userid 1000)
 id 2557E60303; Mon, 27 May 2019 13:11:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=codeaurora.org;
 s=default; t=1558962671;
 bh=vgQHKjatuuR2l1jDszVWwCc/xyVrmWfL4GYi56xMaTY=;
 h=From:To:Cc:Subject:Date:From;
 b=MmnicGkRTYq9gwqqJLY1E7kWPavHb/K56l7da0LKv0ULSS2rKnxJW8l9EbvYtsmfn
 ui2SsoLOaOVyQaI0pDhU6XO6vE8hElxq8lGy9eWlg8q5Sdk0g0wMY/Ex0boV4rOnk7
 0kW7uvixMt4eHYuMzmL1PjmJIidau8jIB6ROp+tQ=
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
 pdx-caf-mail.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.7 required=2.0 tests=ALL_TRUSTED,BAYES_00,
 DKIM_INVALID,DKIM_SIGNED,SPF_NONE,T_FILL_THIS_FORM_SHORT autolearn=no
 autolearn_force=no version=3.4.0
Received: from codeaurora.org
 (blr-c-bdr-fw-01_globalnat_allzones-outside.qualcomm.com [103.229.19.19])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
 (No client certificate requested)
 (Authenticated sender: stummala@smtp.codeaurora.org)
 by smtp.codeaurora.org (Postfix) with ESMTPSA id C3FDB6019D;
 Mon, 27 May 2019 13:11:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=codeaurora.org;
 s=default; t=1558962670;
 bh=vgQHKjatuuR2l1jDszVWwCc/xyVrmWfL4GYi56xMaTY=;
 h=From:To:Cc:Subject:Date:From;
 b=VEWjIQOwqdA0P1ReYmBt320WWrqap1AU8BbKYGiflJ7uvOFqtZhtwQJF6xchI/528
 eu2lAv2LCAlp6sGlXmqigxP0eSJENQlhW/1OJtQscI87gBosjv9oVtZiAzE98Erevo
 0e49zF8c/L9J7rtMTRlkiZDz28+IXGjsedIs03NU=
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org C3FDB6019D
Authentication-Results: pdx-caf-mail.web.codeaurora.org;
 dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: pdx-caf-mail.web.codeaurora.org;
 spf=none smtp.mailfrom=stummala@codeaurora.org
From: Sahitya Tummala <stummala@codeaurora.org>
To: Jaegeuk Kim <jaegeuk@kernel.org>, Chao Yu <yuchao0@huawei.com>,
 linux-f2fs-devel@lists.sourceforge.net
Date: Mon, 27 May 2019 18:40:55 +0530
Message-Id: <1558962655-25994-1-git-send-email-stummala@codeaurora.org>
X-Mailer: git-send-email 1.9.1
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
 0.0 T_FILL_THIS_FORM_SHORT Fill in a short form with personal information
 -0.0 AWL AWL: Adjusted score from AWL reputation of From: address
X-Headers-End: 1hVFPI-00FNJA-N1
Subject: [f2fs-dev] [PATCH v2] f2fs: ratelimit recovery messages
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
Cc: linux-kernel@vger.kernel.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

Ratelimit the recovery logs, which are expected in case
of sudden power down and which could result into too
many prints.

Signed-off-by: Sahitya Tummala <stummala@codeaurora.org>
---
v2:
 - fix minor formatting and add new line for printk

 fs/f2fs/recovery.c | 18 +++++++++---------
 1 file changed, 9 insertions(+), 9 deletions(-)

diff --git a/fs/f2fs/recovery.c b/fs/f2fs/recovery.c
index e04f82b..60d7652 100644
--- a/fs/f2fs/recovery.c
+++ b/fs/f2fs/recovery.c
@@ -188,8 +188,8 @@ static int recover_dentry(struct inode *inode, struct page *ipage,
 		name = "<encrypted>";
 	else
 		name = raw_inode->i_name;
-	f2fs_msg(inode->i_sb, KERN_NOTICE,
-			"%s: ino = %x, name = %s, dir = %lx, err = %d",
+	printk_ratelimited(KERN_NOTICE
+			"%s: ino = %x, name = %s, dir = %lx, err = %d\n",
 			__func__, ino_of_node(ipage), name,
 			IS_ERR(dir) ? 0 : dir->i_ino, err);
 	return err;
@@ -292,8 +292,8 @@ static int recover_inode(struct inode *inode, struct page *page)
 	else
 		name = F2FS_INODE(page)->i_name;
 
-	f2fs_msg(inode->i_sb, KERN_NOTICE,
-		"recover_inode: ino = %x, name = %s, inline = %x",
+	printk_ratelimited(KERN_NOTICE
+			"recover_inode: ino = %x, name = %s, inline = %x\n",
 			ino_of_node(page), name, raw->i_inline);
 	return 0;
 }
@@ -642,11 +642,11 @@ static int do_recover_data(struct f2fs_sb_info *sbi, struct inode *inode,
 err:
 	f2fs_put_dnode(&dn);
 out:
-	f2fs_msg(sbi->sb, KERN_NOTICE,
-		"recover_data: ino = %lx (i_size: %s) recovered = %d, err = %d",
-		inode->i_ino,
-		file_keep_isize(inode) ? "keep" : "recover",
-		recovered, err);
+	printk_ratelimited(KERN_NOTICE
+			"recover_data: ino = %lx (i_size: %s) recovered = %d, err = %d\n",
+			inode->i_ino,
+			file_keep_isize(inode) ? "keep" : "recover",
+			recovered, err);
 	return err;
 }
 
-- 
Qualcomm India Private Limited, on behalf of Qualcomm Innovation Center, Inc.
Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum, a Linux Foundation Collaborative Project.



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
