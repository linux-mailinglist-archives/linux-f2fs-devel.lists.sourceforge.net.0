Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 4EC801F4945
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 10 Jun 2020 00:15:44 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1jimWy-0000Th-5e; Tue, 09 Jun 2020 22:15:40 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <yefremov.denis@gmail.com>) id 1jimWx-0000TW-2h
 for linux-f2fs-devel@lists.sourceforge.net; Tue, 09 Jun 2020 22:15:39 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=qTrEmgv7RHDZYDuYM0LPp7lzo5g/KSIrjUA4oTLoZNQ=; b=S7J+g1sS810O0a5gJIs4BP4ubN
 Al6JyCZipCUi6PBAWuSK3zdcSqo9N7XQPoespt4TcmnAESqn6Emf8TtM99ZSdGgtnv9INRkHEGsID
 ofsoVx+OnClI2kEorespIKeHgK/OArR5XWySU/GKpCY9UVrI30EgFqEUkGHoYZcfXomg=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=qTrEmgv7RHDZYDuYM0LPp7lzo5g/KSIrjUA4oTLoZNQ=; b=k8oW3mLZLfL7r/LzHIvn3kFkRf
 gaHTUfvHm5biiyV1+CZMGGsPLcC3mloV9sV+EZn91r6a9A6HWLsjsowXd0HaGL6E2FSr+i7i8ChsC
 bq0iKGV5y+NIX9yrRAYQ1nNjmIYm6jf3pZPQgXdOLtzC18+8w0R05SNDjKWJWVgH6i0Y=;
Received: from mail-lf1-f66.google.com ([209.85.167.66])
 by sfi-mx-4.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.92.2)
 id 1jimWt-000Tcj-87
 for linux-f2fs-devel@lists.sourceforge.net; Tue, 09 Jun 2020 22:15:39 +0000
Received: by mail-lf1-f66.google.com with SMTP id 82so268784lfh.2
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Tue, 09 Jun 2020 15:15:35 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=qTrEmgv7RHDZYDuYM0LPp7lzo5g/KSIrjUA4oTLoZNQ=;
 b=sMebRGn0T6mzQm1jYIcDu9s+9YuXcK7rIr/ms8iXMWtu755WIOC49xvyU7w2kV6QpY
 rtn7UiQdyrsbgKQPjJkR/NtsWRwTBQg3Ia+ILS7p7Cd+tv4IIWh6x3aC+HV1AOILtRQD
 GxE3VklBJrqNwQVEtDL8xeITzUwHA7Hxz3RZHf8yxWlDsO/HmM0yCLsFpXadSBsSfCwr
 PP95kfCMfp0Lkxn6ZKq3DZGlcfJrzj8UNmnAce46vsUjWONvfo61cGRFeqFROns7mxP8
 afKfWiezD/Po6IIXeFo4enpVEvDlwMVDUzJXwWG3pm6zLhwgxj15pTDN+8Ud0rPmzBXH
 6mvg==
X-Gm-Message-State: AOAM530E5maYC68RYG4NcLhWwTTTHVr0A7fS0zy76vydm8h97HjKtdch
 YUXo6DghGV87amOTykKDpzg=
X-Google-Smtp-Source: ABdhPJzb2FBZt+ybfr4zN7HzzmVHi6UAQDQdYo+lqynaVtXgD2iq4meR1/vyhgwUXCfegDjO/PbF9g==
X-Received: by 2002:a19:8ac3:: with SMTP id m186mr19262lfd.131.1591740928724; 
 Tue, 09 Jun 2020 15:15:28 -0700 (PDT)
Received: from localhost.localdomain ([213.87.137.116])
 by smtp.googlemail.com with ESMTPSA id o19sm4531705ljc.23.2020.06.09.15.15.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 09 Jun 2020 15:15:25 -0700 (PDT)
From: Denis Efremov <efremov@linux.com>
To: Chao Yu <yuchao0@huawei.com>,
	Jaegeuk Kim <jaegeuk@kernel.org>
Date: Wed, 10 Jun 2020 01:14:46 +0300
Message-Id: <20200609221446.24537-1-efremov@linux.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200605181533.73113-1-efremov@linux.com>
References: <20200605181533.73113-1-efremov@linux.com>
MIME-Version: 1.0
X-Spam-Score: -0.1 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 0.0 FREEMAIL_FROM Sender email is commonly abused enduser mail provider
 (yefremov.denis[at]gmail.com)
 0.2 HEADER_FROM_DIFFERENT_DOMAINS From and EnvelopeFrom 2nd level mail
 domains are different
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [209.85.167.66 listed in wl.mailspike.net]
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/, no
 trust [209.85.167.66 listed in list.dnswl.org]
 0.2 FREEMAIL_FORGED_FROMDOMAIN 2nd level domains in From and EnvelopeFrom
 freemail headers are different
 -0.6 AWL AWL: Adjusted score from AWL reputation of From: address
X-Headers-End: 1jimWt-000Tcj-87
Subject: [f2fs-dev] [PATCH v3] f2fs: use kfree() instead of kvfree() to free
 superblock data
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
Cc: linux-kernel@vger.kernel.org, Denis Efremov <efremov@linux.com>,
 linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

Use kfree() instead of kvfree() to free super in read_raw_super_block()
because the memory is allocated with kzalloc() in the function.
Use kfree() instead of kvfree() to free sbi, raw_super in
f2fs_fill_super() and f2fs_put_super() because the memory is allocated
with kzalloc().

Fixes: 5222595d093e ("f2fs: use kvmalloc, if kmalloc is failed")
Signed-off-by: Denis Efremov <efremov@linux.com>
---
Changes in v2:
 - Single patch instead of two separate patches
 - kvfree fixed in f2fs_put_super
Changes in v3:
 - raw_super added to the scope, thanks Chao Yu

 fs/f2fs/super.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/fs/f2fs/super.c b/fs/f2fs/super.c
index 8a9955902d84..7b458268ea09 100644
--- a/fs/f2fs/super.c
+++ b/fs/f2fs/super.c
@@ -1241,7 +1241,7 @@ static void f2fs_put_super(struct super_block *sb)
 	sb->s_fs_info = NULL;
 	if (sbi->s_chksum_driver)
 		crypto_free_shash(sbi->s_chksum_driver);
-	kvfree(sbi->raw_super);
+	kfree(sbi->raw_super);
 
 	destroy_device_list(sbi);
 	f2fs_destroy_xattr_caches(sbi);
@@ -1257,7 +1257,7 @@ static void f2fs_put_super(struct super_block *sb)
 #ifdef CONFIG_UNICODE
 	utf8_unload(sbi->s_encoding);
 #endif
-	kvfree(sbi);
+	kfree(sbi);
 }
 
 int f2fs_sync_fs(struct super_block *sb, int sync)
@@ -3130,7 +3130,7 @@ static int read_raw_super_block(struct f2fs_sb_info *sbi,
 
 	/* No valid superblock */
 	if (!*raw_super)
-		kvfree(super);
+		kfree(super);
 	else
 		err = 0;
 
@@ -3808,11 +3808,11 @@ static int f2fs_fill_super(struct super_block *sb, void *data, int silent)
 	fscrypt_free_dummy_context(&F2FS_OPTION(sbi).dummy_enc_ctx);
 	kvfree(options);
 free_sb_buf:
-	kvfree(raw_super);
+	kfree(raw_super);
 free_sbi:
 	if (sbi->s_chksum_driver)
 		crypto_free_shash(sbi->s_chksum_driver);
-	kvfree(sbi);
+	kfree(sbi);
 
 	/* give only one another chance */
 	if (retry_cnt > 0 && skip_recovery) {
-- 
2.26.2



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
