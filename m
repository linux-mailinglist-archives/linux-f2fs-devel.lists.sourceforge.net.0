Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 6BE11651FF9
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 20 Dec 2022 12:56:44 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1p7bEc-0001r1-7b;
	Tue, 20 Dec 2022 11:56:38 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <chao@kernel.org>) id 1p7bEN-0001ps-Jp
 for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 20 Dec 2022 11:56:23 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=4pyGOeeDBXSYDOrGSx472A82BiNXe2+OvUfDP4zjuC8=; b=COIqTUXQQs6V18jJHNl6npYIve
 fYog9Nc79V5JV4sp1GD/hO/O6+SM8Bw3H05FC4kvokOc10TtESiCApuX9jqrNpVb1f91FnvvujELI
 OcTRJzJwHJIZ1vEm9NU8oksihO/Sw4PZBT7qpWaAiWfhsL5ZdE2RplQtfl/MvTwmS0tg=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:Message-Id:Date:Subject:Cc:To:From
 :Sender:Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=4pyGOeeDBXSYDOrGSx472A82BiNXe2+OvUfDP4zjuC8=; b=F
 /EkglJQYGtSkTBayYUlJH+sEh3zZgA6cBLiApG/kullyXZvctRh8hoE55LRtXdHYwyhON7D3Mltdr
 VMHBfK2PTbzRxIJrDu48vz1eqku5KFxujw4zjT3oeX+LNv0L5rmPLSJIg9+fT1qEbdEZYRy4hbTlF
 ugspElkBxaRZsgTQ=;
Received: from dfw.source.kernel.org ([139.178.84.217])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1p7bEL-0003uI-G4 for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 20 Dec 2022 11:56:23 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id D88A361346
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Tue, 20 Dec 2022 11:56:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5AEEDC433EF;
 Tue, 20 Dec 2022 11:56:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1671537372;
 bh=N/tS7ZErAu/Z3EKySakrgdgcw7FVnibMu9luI9kwOMI=;
 h=From:To:Cc:Subject:Date:From;
 b=o9boFgKZTJXmZjV6eSzzBN43HKxFfBzF6U4SsO//iKCgfiqu/KMbzw9hhlyf47V37
 bEE3ENco0W+dVhNuuY49eEOn4zUDak7PPtD+7kuY88lhbLvA87ySWxzrlRNubHm44l
 UmKw64Sv+GnfVBAOwwCxsWEKmYmnGbve2ALv4amKgOBEPqXbA5FxnEUT4Wl6vr0CnP
 S3EeLsCuUpijVXRLHcYpr5M23hc192SpBPYRB4zzkInsW9ocJVhVGzjo7N5YDEmNYZ
 Kt25jynNiBZvy0GBfacP6uUcPFuW86WjGqgfKeSimSvpWGz1rU3tvLAjJjyAtQ5RXW
 NGuFeKksXJaBQ==
From: Chao Yu <chao@kernel.org>
To: jaegeuk@kernel.org
Date: Tue, 20 Dec 2022 19:56:02 +0800
Message-Id: <20221220115602.6715-1-chao@kernel.org>
X-Mailer: git-send-email 2.36.1
MIME-Version: 1.0
X-Spam-Score: -5.1 (-----)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: Commit 3db1de0e582c ("f2fs: change the current atomic write
 way") has removed all users of PAGE_PRIVATE_ATOMIC_WRITE, remove its definition
 and related functions. Signed-off-by: Chao Yu <chao@kernel.org> ---
 fs/f2fs/f2fs.h
 | 15 +++++ 1 file changed, 5 insertions(+), 10 deletions(-) 
 Content analysis details:   (-5.1 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [139.178.84.217 listed in list.dnswl.org]
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.8 UPPERCASE_50_75        message body is 50-75% uppercase
 -0.7 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1p7bEL-0003uI-G4
Subject: [f2fs-dev] [PATCH] f2fs: remove unused PAGE_PRIVATE_ATOMIC_WRITE
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

Commit 3db1de0e582c ("f2fs: change the current atomic write way")
has removed all users of PAGE_PRIVATE_ATOMIC_WRITE, remove its
definition and related functions.

Signed-off-by: Chao Yu <chao@kernel.org>
---
 fs/f2fs/f2fs.h | 15 +++++----------
 1 file changed, 5 insertions(+), 10 deletions(-)

diff --git a/fs/f2fs/f2fs.h b/fs/f2fs/f2fs.h
index 710d6d0209c4..b39d978058cb 100644
--- a/fs/f2fs/f2fs.h
+++ b/fs/f2fs/f2fs.h
@@ -1401,19 +1401,17 @@ static inline void f2fs_clear_bit(unsigned int nr, char *addr);
  * Layout A: lowest bit should be 1
  * | bit0 = 1 | bit1 | bit2 | ... | bit MAX | private data .... |
  * bit 0	PAGE_PRIVATE_NOT_POINTER
- * bit 1	PAGE_PRIVATE_ATOMIC_WRITE
- * bit 2	PAGE_PRIVATE_DUMMY_WRITE
- * bit 3	PAGE_PRIVATE_ONGOING_MIGRATION
- * bit 4	PAGE_PRIVATE_INLINE_INODE
- * bit 5	PAGE_PRIVATE_REF_RESOURCE
- * bit 6-	f2fs private data
+ * bit 1	PAGE_PRIVATE_DUMMY_WRITE
+ * bit 2	PAGE_PRIVATE_ONGOING_MIGRATION
+ * bit 3	PAGE_PRIVATE_INLINE_INODE
+ * bit 4	PAGE_PRIVATE_REF_RESOURCE
+ * bit 5-	f2fs private data
  *
  * Layout B: lowest bit should be 0
  * page.private is a wrapped pointer.
  */
 enum {
 	PAGE_PRIVATE_NOT_POINTER,		/* private contains non-pointer data */
-	PAGE_PRIVATE_ATOMIC_WRITE,		/* data page from atomic write path */
 	PAGE_PRIVATE_DUMMY_WRITE,		/* data page for padding aligned IO */
 	PAGE_PRIVATE_ONGOING_MIGRATION,		/* data page which is on-going migrating */
 	PAGE_PRIVATE_INLINE_INODE,		/* inode page contains inline data */
@@ -1458,19 +1456,16 @@ PAGE_PRIVATE_GET_FUNC(nonpointer, NOT_POINTER);
 PAGE_PRIVATE_GET_FUNC(reference, REF_RESOURCE);
 PAGE_PRIVATE_GET_FUNC(inline, INLINE_INODE);
 PAGE_PRIVATE_GET_FUNC(gcing, ONGOING_MIGRATION);
-PAGE_PRIVATE_GET_FUNC(atomic, ATOMIC_WRITE);
 PAGE_PRIVATE_GET_FUNC(dummy, DUMMY_WRITE);
 
 PAGE_PRIVATE_SET_FUNC(reference, REF_RESOURCE);
 PAGE_PRIVATE_SET_FUNC(inline, INLINE_INODE);
 PAGE_PRIVATE_SET_FUNC(gcing, ONGOING_MIGRATION);
-PAGE_PRIVATE_SET_FUNC(atomic, ATOMIC_WRITE);
 PAGE_PRIVATE_SET_FUNC(dummy, DUMMY_WRITE);
 
 PAGE_PRIVATE_CLEAR_FUNC(reference, REF_RESOURCE);
 PAGE_PRIVATE_CLEAR_FUNC(inline, INLINE_INODE);
 PAGE_PRIVATE_CLEAR_FUNC(gcing, ONGOING_MIGRATION);
-PAGE_PRIVATE_CLEAR_FUNC(atomic, ATOMIC_WRITE);
 PAGE_PRIVATE_CLEAR_FUNC(dummy, DUMMY_WRITE);
 
 static inline unsigned long get_page_private_data(struct page *page)
-- 
2.36.1



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
