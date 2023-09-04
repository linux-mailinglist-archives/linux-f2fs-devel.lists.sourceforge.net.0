Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 35EAC791A52
	for <lists+linux-f2fs-devel@lfdr.de>; Mon,  4 Sep 2023 17:10:42 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1qdBDg-00045r-Jj;
	Mon, 04 Sep 2023 15:10:27 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <chao@kernel.org>) id 1qdBDd-00045e-Ur
 for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 04 Sep 2023 15:10:24 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=lh7JfKrbmzSvo/+Smfz7cHzjht5szOeju1LuYhEkx6M=; b=frdEa6Ii49fUpwd2Fbi/Nhexyr
 HBntcmmoCTW64KvswwV2ORXSzstg5EW/108UZiG0hcZa0MNQbJK3X99KHQIxBgUkhpU1oZh9PJwj7
 Fm3Jv3CsFzP4XIivPDlSZ+UvmMWeTJgEXkjzBEIYdS1DMLbl/1hVuwP5fNjWV8Ympq+I=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:Message-Id:Date:Subject:Cc:To:From
 :Sender:Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=lh7JfKrbmzSvo/+Smfz7cHzjht5szOeju1LuYhEkx6M=; b=P
 SvfCW9jjrRJGVQLUWl/wedUCeZx6eNW3bh7SeUJXldnC7t7mrFZ8VcTmTZullrqP054QHNPlJkp8p
 u/sUqoYEjQ+WDea84vkFFAIczpzxn0FrwTWvI25j2ccDhdEegcSBRnNWeCHeyCuq0gBT21E3A44bD
 IC1KAA72sNCJGzSM=;
Received: from ams.source.kernel.org ([145.40.68.75])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1qdBDa-0000RO-Vm for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 04 Sep 2023 15:10:24 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 9B840B80DB3
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Mon,  4 Sep 2023 15:10:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4AD7CC433C8;
 Mon,  4 Sep 2023 15:10:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1693840215;
 bh=XRW8YTHaWV8ms59XN9GHUEpvdguZ6HOD3am7bwM4Xcw=;
 h=From:To:Cc:Subject:Date:From;
 b=rsFq0ku1qS0T2Ddu4stzj5273qMjAcyW7K4Is58Rdir03Aae+SLjVCkfOIiTCvXhi
 YXUe/IDnTZvTQcxUQ++0yRY8dzIeGsMlzCo4cnnxjEJI9GO6rEXRHJifQMgA4EwJVA
 xdUKjAX8e9zjOuLBSLRRLiElWIC+iBxWLl5GQKicTdU0wcod7wfoLsbt5ioDpteUKT
 UA7pCshnCDcEi+/M1URolrZUx4x6cws6m04Q41PciPvQqZFYFAwSch1nCh/UcvTXV5
 dtloxXoJL2KdyrCzlvg8/X2VqJG/xFomRxhq+k+qX44prz+0xxMzPojoRvagOQTAw8
 HFAEYo4uxAbLg==
From: Chao Yu <chao@kernel.org>
To: jaegeuk@kernel.org
Date: Mon,  4 Sep 2023 23:10:07 +0800
Message-Id: <20230904151007.1784860-1-chao@kernel.org>
X-Mailer: git-send-email 2.40.1
MIME-Version: 1.0
X-Spam-Score: -2.5 (--)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  fsck.f2fs prints i_gc_failures reset message w/ [FIX] tags, 
 it's not appropriate due to reset i_gc_failures is not a fix. Let's add
 INFO_MSG()
 macro to print such important non-fix message. Signed-off-by: Chao Yu
 <chao@kernel.org>
 --- fsck/fsck.c | 2 +- include/f2fs_fs.h | 7 +++++++ 2 files changed,
 8 insertions(+), 1 deletion(-) 
 Content analysis details:   (-2.5 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -2.3 RCVD_IN_DNSWL_MED      RBL: Sender listed at https://www.dnswl.org/,
 medium trust [145.40.68.75 listed in list.dnswl.org]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1qdBDa-0000RO-Vm
Subject: [f2fs-dev] [PATCH] fsck.f2fs: use INFO_MSG() to print i_gc_failure
 reset info
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
Cc: linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

fsck.f2fs prints i_gc_failures reset message w/ [FIX] tags, it's not
appropriate due to reset i_gc_failures is not a fix.

Let's add INFO_MSG() macro to print such important non-fix message.

Signed-off-by: Chao Yu <chao@kernel.org>
---
 fsck/fsck.c       | 2 +-
 include/f2fs_fs.h | 7 +++++++
 2 files changed, 8 insertions(+), 1 deletion(-)

diff --git a/fsck/fsck.c b/fsck/fsck.c
index 78ffdb6..a30719e 100644
--- a/fsck/fsck.c
+++ b/fsck/fsck.c
@@ -1282,7 +1282,7 @@ skip_blkcnt_fix:
 		if (c.fix_on) {
 			node_blk->i.i_gc_failures = cpu_to_le16(0);
 			need_fix = 1;
-			FIX_MSG("Regular: 0x%x reset i_gc_failures from 0x%x to 0x00",
+			INFO_MSG("Regular: 0x%x reset i_gc_failures from 0x%x to 0x00",
 					nid, i_gc_failures);
 		}
 	}
diff --git a/include/f2fs_fs.h b/include/f2fs_fs.h
index 7e7db22..bc4f7b8 100644
--- a/include/f2fs_fs.h
+++ b/include/f2fs_fs.h
@@ -235,6 +235,13 @@ static inline uint64_t bswap_64(uint64_t val)
 /*
  * Debugging interfaces
  */
+
+#define INFO_MSG(fmt, ...)						\
+	do {								\
+		printf("[INFO] (%s:%4d) ", __func__, __LINE__);		\
+		printf(" --> "fmt"\n", ##__VA_ARGS__);			\
+	} while (0)
+
 #define FIX_MSG(fmt, ...)						\
 	do {								\
 		printf("[FIX] (%s:%4d) ", __func__, __LINE__);		\
-- 
2.40.1



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
