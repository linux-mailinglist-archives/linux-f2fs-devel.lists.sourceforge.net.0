Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 77BA871387F
	for <lists+linux-f2fs-devel@lfdr.de>; Sun, 28 May 2023 09:47:58 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1q3B84-0008GA-NL;
	Sun, 28 May 2023 07:47:52 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <chao@kernel.org>) id 1q3B7x-0008G3-3E
 for linux-f2fs-devel@lists.sourceforge.net;
 Sun, 28 May 2023 07:47:50 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=6N+7uTPZuTsIhxvm29IasATAb3tyhb4JyG678i7BiD8=; b=PzfOUHclyWtxyFSPa2o/PKlFx4
 q1n+XQyxwwHU2DzBecvneR0gJYt/sUbzBp+y1xL/ye/oZm9hvnp3B6HJLSXaw/o3hdtu+3o0tnyQc
 Br2+MGDEKvXqPlJn2JxLwd3AOH+BynGNcxMQ6riAMu2LmeuUddecK/NL/PF+aYAT8SVQ=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:Message-Id:Date:Subject:Cc:To:From
 :Sender:Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=6N+7uTPZuTsIhxvm29IasATAb3tyhb4JyG678i7BiD8=; b=S
 +U4j+HvA+rncWb1RlViHCGz8GHrSH6tr55N7HbOiWIZ6hHErwPyKMBEFCgtOsIyY0GRbefcWKg4Pq
 bNro1iZ0aBrHaBmMDEwv1T8jFr3uKMvQ43jC6VrWOy3x0TQunvhVylJpbuM8jjHifEeK2tllm6pc/
 wLW1wFQeCIWWqnxM=;
Received: from dfw.source.kernel.org ([139.178.84.217])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1q3B7o-0003hN-Ql for linux-f2fs-devel@lists.sourceforge.net;
 Sun, 28 May 2023 07:47:37 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 9879F6157A
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Sun, 28 May 2023 07:47:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D2343C433EF;
 Sun, 28 May 2023 07:47:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1685260041;
 bh=ZpGoTX9qNRlEq5Lv9msG/vssYrKdybIlN/zFvyB6UuI=;
 h=From:To:Cc:Subject:Date:From;
 b=atEMSKqyr6WeZFg25oEMAjMSq7itWdfOb1eAFaxnqPwQEAU+b3Zh3KR21qtuIVRN6
 uN862Glspb6p1NrG0mPZXuidGcOycI5KmN+Ieokw6dvY+9lbz0pwOG+14x+7XLpNxm
 T12poqoh9i15Wkvxl5OFFZfvvbVpvo16fKMJpthojQi657BuJ0UQOsTa6hgoQfBVg9
 R7X8AXPjNUPuSxKxq/ID3srlFwt/+gezWH92UUrC0ke7H6tA0KPOQSHTNIdJX9wJPu
 HBQTFPbr+L/Celyg1FJjvn12FAY2GVQBt0FoAAIDPUT96W4atJyD57/c8zkDQi8SQP
 /li5PnUAEMrzA==
From: Chao Yu <chao@kernel.org>
To: jaegeuk@kernel.org
Date: Sun, 28 May 2023 15:47:12 +0800
Message-Id: <20230528074713.1682062-1-chao@kernel.org>
X-Mailer: git-send-email 2.40.1
MIME-Version: 1.0
X-Spam-Score: -5.9 (-----)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  For cp error case,
 there will be dirty meta/node pages remained
 after f2fs_write_checkpoint() in f2fs_put_super(), drop them explicitly,
 and do sanity check on reference count of dirty pages and infli [...] 
 Content analysis details:   (-5.9 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [139.178.84.217 listed in list.dnswl.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid -0.7 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1q3B7o-0003hN-Ql
Subject: [f2fs-dev] [PATCH 1/2] f2fs: fix to drop all dirty meta/node pages
 during umount()
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
Cc: linux-kernel@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

For cp error case, there will be dirty meta/node pages remained after
f2fs_write_checkpoint() in f2fs_put_super(), drop them explicitly, and
do sanity check on reference count of dirty pages and inflight IOs.

Signed-off-by: Chao Yu <chao@kernel.org>
---
 fs/f2fs/super.c | 18 ++++++++++++++++--
 1 file changed, 16 insertions(+), 2 deletions(-)

diff --git a/fs/f2fs/super.c b/fs/f2fs/super.c
index 7499ebabaf35..d1bce753f0d2 100644
--- a/fs/f2fs/super.c
+++ b/fs/f2fs/super.c
@@ -1573,6 +1573,7 @@ static void f2fs_put_super(struct super_block *sb)
 {
 	struct f2fs_sb_info *sbi = F2FS_SB(sb);
 	int i;
+	int err = 0;
 	bool done;
 
 	/* unregister procfs/sysfs entries in advance to avoid race case */
@@ -1599,7 +1600,7 @@ static void f2fs_put_super(struct super_block *sb)
 		struct cp_control cpc = {
 			.reason = CP_UMOUNT,
 		};
-		f2fs_write_checkpoint(sbi, &cpc);
+		err = f2fs_write_checkpoint(sbi, &cpc);
 	}
 
 	/* be sure to wait for any on-going discard commands */
@@ -1608,7 +1609,7 @@ static void f2fs_put_super(struct super_block *sb)
 		struct cp_control cpc = {
 			.reason = CP_UMOUNT | CP_TRIMMED,
 		};
-		f2fs_write_checkpoint(sbi, &cpc);
+		err = f2fs_write_checkpoint(sbi, &cpc);
 	}
 
 	/*
@@ -1625,6 +1626,19 @@ static void f2fs_put_super(struct super_block *sb)
 
 	f2fs_wait_on_all_pages(sbi, F2FS_WB_CP_DATA);
 
+	if (err) {
+		truncate_inode_pages_final(NODE_MAPPING(sbi));
+		truncate_inode_pages_final(META_MAPPING(sbi));
+	}
+
+	for (i = 0; i < NR_COUNT_TYPE; i++) {
+		if (!get_pages(sbi, i))
+			continue;
+		f2fs_err(sbi, "detect filesystem reference count leak during "
+			"umount, type: %d, count: %lld", i, get_pages(sbi, i));
+		f2fs_bug_on(sbi, 1);
+	}
+
 	f2fs_bug_on(sbi, sbi->fsync_node_num);
 
 	f2fs_destroy_compress_inode(sbi);
-- 
2.40.1



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
