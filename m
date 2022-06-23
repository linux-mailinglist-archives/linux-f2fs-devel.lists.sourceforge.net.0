Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 70059558669
	for <lists+linux-f2fs-devel@lfdr.de>; Thu, 23 Jun 2022 20:12:34 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.94.2)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1o4RJg-0004Sq-4p; Thu, 23 Jun 2022 18:12:33 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <bart.vanassche@gmail.com>) id 1o4RJf-0004Sk-3t
 for linux-f2fs-devel@lists.sourceforge.net; Thu, 23 Jun 2022 18:12:32 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=hRIctd5VebPXefvI/Kilae8Ou+nirvLhB8h1mjZYsYY=; b=anMg2V4NWpTbYgQKhwTUFxkL6w
 aQAhdPo7RtQa5+5WBYJILbFT5m/SgwoOK/66dk8bUdAH8oR8hS6Jo8QQwx3OdNIrZqHxWDdhEELH1
 VzGbd1n93ZNJq71FfQoh4IWPVu6WyAvHLftwETB0DDv79VmRzt3AGqI+L2pXqJE40fQc=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=hRIctd5VebPXefvI/Kilae8Ou+nirvLhB8h1mjZYsYY=; b=bwW2/cXJwaYoDEtYiFnjAh2LX0
 dtn2GAjVfPYui94EwjjmIUx5yR+a7b37tVWBtp9UsB+HtFXjEKg5Du5sog37CNlIfY4it2NN1T+1g
 /l4UgfHmY87qLdJz8kR9GPFOS1gjxmIeJARan0TLhAFd8KqQosb0d8NaE6YdhkFkzpcY=;
Received: from mail-pg1-f170.google.com ([209.85.215.170])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.94.2)
 id 1o4RJc-0005fm-FN
 for linux-f2fs-devel@lists.sourceforge.net; Thu, 23 Jun 2022 18:12:31 +0000
Received: by mail-pg1-f170.google.com with SMTP id e63so186989pgc.5
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Thu, 23 Jun 2022 11:12:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=hRIctd5VebPXefvI/Kilae8Ou+nirvLhB8h1mjZYsYY=;
 b=JA/kKYyDzbozLEgdCs/HwPUGnM229zNBXLQ4/d/cT7eSLRRNZUeWgw3eG2mkV5Rm+4
 viVarbwxF5+GvVA9JnveGFGuR4Ky3u4BqwM0kPg7nuyf3sdSTDHfm4opSnTxQyPXD/gJ
 xkdxbF6VtpDO1LfDuJYHkWAakki4eFJBzi/RXa05t4ZWf64VZtzgJWdCNjvhTZyTJZyB
 7kk+D6cez543pmFzzSctJrBUkiNU27RzdEBnlubtAye00hC3XDUTQhL993LhKHED3ZiJ
 vCtc74u0BwvJmmozzx7h5E0wgZxhuQMA43eW101udkTuBTnkm2GajMs7BcyeIpq4nyiU
 Sc7w==
X-Gm-Message-State: AJIora+FBmQoX7mxmgClY6DgEcDZFvIiakMKHnqn9tuonUc24hj9JMPa
 cjWS3L2FTgqTuRUVz/RPKKg=
X-Google-Smtp-Source: AGRyM1uq9F6sU6itKuUaCj528Yrb020hvJVnVUPV/WMYM7Xdd+CnRXPe7CcwB5TVeswasgVTv1WA2Q==
X-Received: by 2002:aa7:8426:0:b0:525:23bf:1b78 with SMTP id
 q6-20020aa78426000000b0052523bf1b78mr22642267pfn.26.1656007942852; 
 Thu, 23 Jun 2022 11:12:22 -0700 (PDT)
Received: from bvanassche-linux.mtv.corp.google.com
 ([2620:15c:211:201:70af:1dc5:d20:a563])
 by smtp.gmail.com with ESMTPSA id
 az8-20020a170902a58800b00163d76696e1sm104803plb.102.2022.06.23.11.12.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 23 Jun 2022 11:12:22 -0700 (PDT)
From: Bart Van Assche <bvanassche@acm.org>
To: Jaegeuk Kim <jaegeuk@kernel.org>
Date: Thu, 23 Jun 2022 11:12:07 -0700
Message-Id: <20220623181208.3596448-5-bvanassche@acm.org>
X-Mailer: git-send-email 2.37.0.rc0.161.g10f37bed90-goog
In-Reply-To: <20220623181208.3596448-1-bvanassche@acm.org>
References: <20220623181208.3596448-1-bvanassche@acm.org>
MIME-Version: 1.0
X-Spam-Score: 0.5 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  Use F2FS_BLKSIZE instead of PAGE_SIZE for dev_read_block()
 buffers since dev_read_block() reads F2FS_BLKSIZE bytes. Signed-off-by: Bart
 Van Assche <bvanassche@acm.org> --- fsck/mount.c | 6 +++--- 1 file changed,
 3 insertions(+), 3 deletions(-) 
 Content analysis details:   (0.5 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
 no trust [209.85.215.170 listed in list.dnswl.org]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 0.2 HEADER_FROM_DIFFERENT_DOMAINS From and EnvelopeFrom 2nd level
 mail domains are different
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 FREEMAIL_FROM          Sender email is commonly abused enduser mail
 provider [bart.vanassche[at]gmail.com]
 0.0 RCVD_IN_MSPIKE_H3      RBL: Good reputation (+3)
 [209.85.215.170 listed in wl.mailspike.net]
 0.2 FREEMAIL_FORGED_FROMDOMAIN 2nd level domains in From and
 EnvelopeFrom freemail headers are different
 -0.0 T_SCC_BODY_TEXT_LINE   No description available.
 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
X-Headers-End: 1o4RJc-0005fm-FN
Subject: [f2fs-dev] [PATCH v2 4/5] Use F2FS_BLKSIZE for dev_read_block()
 buffers
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
Cc: Bart Van Assche <bvanassche@acm.org>,
 linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

Use F2FS_BLKSIZE instead of PAGE_SIZE for dev_read_block() buffers since
dev_read_block() reads F2FS_BLKSIZE bytes.

Signed-off-by: Bart Van Assche <bvanassche@acm.org>
---
 fsck/mount.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/fsck/mount.c b/fsck/mount.c
index 108e1238493d..cc871fea5d10 100644
--- a/fsck/mount.c
+++ b/fsck/mount.c
@@ -1115,7 +1115,7 @@ static void *get_checkpoint_version(block_t cp_addr)
 {
 	void *cp_page;
 
-	cp_page = malloc(PAGE_SIZE);
+	cp_page = malloc(F2FS_BLKSIZE);
 	ASSERT(cp_page);
 
 	if (dev_read_block(cp_page, cp_addr) < 0)
@@ -1821,7 +1821,7 @@ static void read_compacted_summaries(struct f2fs_sb_info *sbi)
 
 	start = start_sum_block(sbi);
 
-	kaddr = (char *)malloc(PAGE_SIZE);
+	kaddr = malloc(F2FS_BLKSIZE);
 	ASSERT(kaddr);
 
 	ret = dev_read_block(kaddr, start++);
@@ -1856,7 +1856,7 @@ static void read_compacted_summaries(struct f2fs_sb_info *sbi)
 			if (offset + SUMMARY_SIZE <=
 					PAGE_CACHE_SIZE - SUM_FOOTER_SIZE)
 				continue;
-			memset(kaddr, 0, PAGE_SIZE);
+			memset(kaddr, 0, F2FS_BLKSIZE);
 			ret = dev_read_block(kaddr, start++);
 			ASSERT(ret >= 0);
 			offset = 0;


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
