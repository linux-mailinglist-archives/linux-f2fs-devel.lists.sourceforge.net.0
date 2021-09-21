Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 0BEE241357E
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 21 Sep 2021 16:38:01 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1mSgu5-0002n4-He; Tue, 21 Sep 2021 14:37:49 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <hsiangkao@linux.alibaba.com>) id 1mSgu3-0002mx-Da
 for linux-f2fs-devel@lists.sourceforge.net; Tue, 21 Sep 2021 14:37:47 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=PG9J/ZWvEQ2PoLDeuhQ5N3p04p+PSBrHCn8k/ZL4aYw=; b=AgEzrtPRuEFp/r7i5r+kimNind
 tBYjSNoIDbAkllytIS7VQtUjsEToVujwG4RIf1C9IDNBs0HbUyCRhTJ3yR8DiHZv/aSU12ewU2QYx
 xzqre9r+4ZhTR7Gmach6cW2UfMrC7B1cIul6iGZuQ6U5Ueaxyarlx06x4wWshd34ABD8=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:Message-Id:Date:Subject:Cc:To:From
 :Sender:Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=PG9J/ZWvEQ2PoLDeuhQ5N3p04p+PSBrHCn8k/ZL4aYw=; b=L
 KDuhRoJAK9KKLBeRvW+jVxbTY0OPCyE1EK2WFlWjQZoqpSw8dO5se3KYpEq1Zzz69T+c04G8IAnc2
 gJ4yjIDxLa+3bLt9ewaMNbQaHRqaURpEzQgpmXnIIE3E/znSAnlklUA/t7hVZRNDjdH4RXrmmhUgv
 YxOuZsm1vTu87iXw=;
Received: from out30-132.freemail.mail.aliyun.com ([115.124.30.132])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.3)
 id 1mSgu2-000aKl-2e
 for linux-f2fs-devel@lists.sourceforge.net; Tue, 21 Sep 2021 14:37:47 +0000
X-Alimail-AntiSpam: AC=PASS; BC=-1|-1; BR=01201311R491e4; CH=green; DM=||false|;
 DS=||; FP=0|-1|-1|-1|0|-1|-1|-1; HT=e01e04395; MF=hsiangkao@linux.alibaba.com;
 NM=1; PH=DS; RN=5; SR=0; TI=SMTPD_---0Up9-D6K_1632235054; 
Received: from
 e18g09479.et15sqa.tbsite.net(mailfrom:hsiangkao@linux.alibaba.com
 fp:SMTPD_---0Up9-D6K_1632235054) by smtp.aliyun-inc.com(127.0.0.1);
 Tue, 21 Sep 2021 22:37:35 +0800
From: Gao Xiang <hsiangkao@linux.alibaba.com>
To: Jaegeuk Kim <jaegeuk@kernel.org>,
	Chao Yu <chao@kernel.org>
Date: Tue, 21 Sep 2021 22:37:30 +0800
Message-Id: <20210921143730.82649-1-hsiangkao@linux.alibaba.com>
X-Mailer: git-send-email 2.24.4
MIME-Version: 1.0
X-Spam-Score: -8.0 (--------)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: Fix up a misuse that the filename pointer isn't always valid
 in the ring buffer, and we should copy the content instead. Fixes: 0c5e36db17f5
 ("f2fs: trace f2fs_lookup") Signed-off-by: Gao Xiang
 <hsiangkao@linux.alibaba.com>
 --- include/trace/events/f2fs.h | 12 ++++++------ 1 file changed,
 6 insertions(+), 6 deletions(-) 
 Content analysis details:   (-8.0 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
 no trust [115.124.30.132 listed in list.dnswl.org]
 -7.5 USER_IN_DEF_SPF_WL     From: address is in the default SPF
 white-list
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 UNPARSEABLE_RELAY      Informational: message has unparseable relay
 lines
 -0.5 ENV_AND_HDR_SPF_MATCH  Env and Hdr From used in default SPF WL
 Match
X-Headers-End: 1mSgu2-000aKl-2e
Subject: [f2fs-dev] [PATCH] f2fs: fix up f2fs_lookup tracepoints
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
Cc: Gao Xiang <hsiangkao@linux.alibaba.com>,
 LKML <linux-kernel@vger.kernel.org>, linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

Fix up a misuse that the filename pointer isn't always valid in
the ring buffer, and we should copy the content instead.

Fixes: 0c5e36db17f5 ("f2fs: trace f2fs_lookup")
Signed-off-by: Gao Xiang <hsiangkao@linux.alibaba.com>
---
 include/trace/events/f2fs.h | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/include/trace/events/f2fs.h b/include/trace/events/f2fs.h
index 4e881d9..4cb055a 100644
--- a/include/trace/events/f2fs.h
+++ b/include/trace/events/f2fs.h
@@ -807,20 +807,20 @@
 	TP_STRUCT__entry(
 		__field(dev_t,	dev)
 		__field(ino_t,	ino)
-		__field(const char *,	name)
+		__string(name,	dentry->d_name.name)
 		__field(unsigned int, flags)
 	),
 
 	TP_fast_assign(
 		__entry->dev	= dir->i_sb->s_dev;
 		__entry->ino	= dir->i_ino;
-		__entry->name	= dentry->d_name.name;
+		__assign_str(name, dentry->d_name.name);
 		__entry->flags	= flags;
 	),
 
 	TP_printk("dev = (%d,%d), pino = %lu, name:%s, flags:%u",
 		show_dev_ino(__entry),
-		__entry->name,
+		__get_str(name),
 		__entry->flags)
 );
 
@@ -834,7 +834,7 @@
 	TP_STRUCT__entry(
 		__field(dev_t,	dev)
 		__field(ino_t,	ino)
-		__field(const char *,	name)
+		__string(name,	dentry->d_name.name)
 		__field(nid_t,	cino)
 		__field(int,	err)
 	),
@@ -842,14 +842,14 @@
 	TP_fast_assign(
 		__entry->dev	= dir->i_sb->s_dev;
 		__entry->ino	= dir->i_ino;
-		__entry->name	= dentry->d_name.name;
+		__assign_str(name, dentry->d_name.name);
 		__entry->cino	= ino;
 		__entry->err	= err;
 	),
 
 	TP_printk("dev = (%d,%d), pino = %lu, name:%s, ino:%u, err:%d",
 		show_dev_ino(__entry),
-		__entry->name,
+		__get_str(name),
 		__entry->cino,
 		__entry->err)
 );
-- 
1.8.3.1



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
