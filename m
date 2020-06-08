Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id A60C01F1C46
	for <lists+linux-f2fs-devel@lfdr.de>; Mon,  8 Jun 2020 17:41:54 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1jiJuJ-0000Wv-HL; Mon, 08 Jun 2020 15:41:51 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <yefremov.denis@gmail.com>) id 1jiJuI-0000WY-7G
 for linux-f2fs-devel@lists.sourceforge.net; Mon, 08 Jun 2020 15:41:50 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=cHWA4ojiiDEn5KL63INPPyDAtucasDF2S7FDQVE+qDM=; b=IIuAlDq/rR19Qsj9P66y0w+Z/0
 0fyRUV1ZgXX1kIbdwq6vgvap+xtg1KBzGS2Ffk60nPjaXgFD8hgDeNKZRfpKQ4pNVv6BzwZ4ExZB3
 wP7BOJlN9e+mlbhS4BlXGDdmSvSt29Ztq3e65mhhT8BFM5ldB/qjXdpV7lk4OdUt/99A=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=cHWA4ojiiDEn5KL63INPPyDAtucasDF2S7FDQVE+qDM=; b=NoEhNw6kLMQyHVkvLb07XFWJ3E
 ej9gqMegTcY4ssUdHCb9vsG0qX9xrfZqQmNrkyW/6D9clunGgHvqBTbGF/f9ArA3RkbX3ssXkDAvL
 jHcQPEG5kGKI4Rf1LhJrA0wznKn6PbU7hWugsAke2ax/Zd6RCEaYlnbhXD8woQ1z6GSg=;
Received: from mail-lj1-f194.google.com ([209.85.208.194])
 by sfi-mx-4.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.92.2)
 id 1jiJuG-00GbYp-Qe
 for linux-f2fs-devel@lists.sourceforge.net; Mon, 08 Jun 2020 15:41:49 +0000
Received: by mail-lj1-f194.google.com with SMTP id y11so19436206ljm.9
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Mon, 08 Jun 2020 08:41:48 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=cHWA4ojiiDEn5KL63INPPyDAtucasDF2S7FDQVE+qDM=;
 b=OTv5awbvBPzY4TrU85xsiq0b459bhI4Zs6RLD1dGg36HoiVqhv5KINOyMhU4WU1/gO
 RmbFggd4X9mAns4iozgl4xDY4wwOI8w8lZYmIjW5USxVdraBKBqH/c1EzNeWJ0631ezo
 nFthnPkeOtwvuJ3zJ0S92zgFLPDYqjvXR6BsAFCpvpNO5luBzH/97kdEUfrkbf8YboMb
 +s2H/jPqd5vtOkNgfqJTpIHydM2eE+x43koFyJWBk2MmFqohtx7NJlcm1eDKkmCjcL01
 rncsAifGnZMvKwrWvMA/bW6Zswphd7M59fSbv1jckcwqDaaTktbkbleGIyEBmOB+OeDq
 Y3yQ==
X-Gm-Message-State: AOAM530iMyAeRgwnQw7F15p9KZanWkfNoiZrA9FJ5yg2asdWNnvbRdng
 P2E3b290MNLQ8FFtPFC7aTI=
X-Google-Smtp-Source: ABdhPJxcCGObw86L0+s5Xo2L0LL0YIVqvz7Ew0Npvfx0IF/mCW9rPeOPpxnN7fLbQW2rEI0i/duE+A==
X-Received: by 2002:a2e:6c07:: with SMTP id h7mr12138763ljc.125.1591630895189; 
 Mon, 08 Jun 2020 08:41:35 -0700 (PDT)
Received: from localhost.localdomain ([213.87.137.116])
 by smtp.googlemail.com with ESMTPSA id m3sm2497480ljb.38.2020.06.08.08.41.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 08 Jun 2020 08:41:34 -0700 (PDT)
From: Denis Efremov <efremov@linux.com>
To: Chao Yu <yuchao0@huawei.com>,
	Jaegeuk Kim <jaegeuk@kernel.org>
Date: Mon,  8 Jun 2020 18:41:23 +0300
Message-Id: <20200608154123.235198-1-efremov@linux.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200605181533.73113-1-efremov@linux.com>
References: <20200605181533.73113-1-efremov@linux.com>
MIME-Version: 1.0
X-Spam-Score: -0.1 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 0.0 URIBL_BLOCKED ADMINISTRATOR NOTICE: The query to URIBL was blocked.
 See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URIs: linux.com]
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/, no
 trust [209.85.208.194 listed in list.dnswl.org]
 0.0 FREEMAIL_FROM Sender email is commonly abused enduser mail provider
 (yefremov.denis[at]gmail.com)
 0.2 HEADER_FROM_DIFFERENT_DOMAINS From and EnvelopeFrom 2nd level mail
 domains are different
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [209.85.208.194 listed in wl.mailspike.net]
 0.2 FREEMAIL_FORGED_FROMDOMAIN 2nd level domains in From and EnvelopeFrom
 freemail headers are different
 -0.6 AWL AWL: Adjusted score from AWL reputation of From: address
X-Headers-End: 1jiJuG-00GbYp-Qe
Subject: [f2fs-dev] [PATCH v2] f2fs: use kfree() instead of kvfree() to free
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
Use kfree() instead of kvfree() to free sbi in f2fs_fill_super() and
f2fs_put_super() because the memory is allocated with kzalloc().

Fixes: 5222595d093e ("f2fs: use kvmalloc, if kmalloc is failed")
Signed-off-by: Denis Efremov <efremov@linux.com>
---
Changes in v2:
 - Single patch instead of two separate patches
 - kvfree fixed in f2fs_put_super

 fs/f2fs/super.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/fs/f2fs/super.c b/fs/f2fs/super.c
index 8a9955902d84..94bfc140bef9 100644
--- a/fs/f2fs/super.c
+++ b/fs/f2fs/super.c
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
 
@@ -3812,7 +3812,7 @@ static int f2fs_fill_super(struct super_block *sb, void *data, int silent)
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
