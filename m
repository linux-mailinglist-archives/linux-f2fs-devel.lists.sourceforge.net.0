Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 8991AAB3658
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 12 May 2025 13:55:33 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:MIME-Version:Message-ID:Date:To:Sender:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=PFCk+y7FjrG4XD+d2IvD3zsalmv05DPncFLrR5ICAIY=; b=Uwcz+pXxulZJWmccWyzDXyQvBM
	Td5ph5isR00S0SG1EVKqdeSnbU2y7nbXqoTKwznroCVX//izZkrplqi+MNPQ18BQL0hpD1D982Xrf
	297d8YV1E9+KWhbYw47CzQe2MVxuGZLgj+ZDiTjEPcUZ3DtYtqt7KKPAdfZjGBwm8mmw=;
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1uERkp-00067h-RB;
	Mon, 12 May 2025 11:55:31 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <chao@kernel.org>) id 1uERko-0005xj-3J
 for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 12 May 2025 11:55:30 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:Message-ID:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=84t2iglcvd1+559FLdf2A3g7JxOkQZW4SFcodnq7jeE=; b=XeUEYZmr5r6k/MdXozE2fxG6Am
 282IeFdNleLwGp2D9cc1exw2ZS4aIrDkd4Yiaqdnm72m++JmzFP/gPPHF7SSBjRaIEfVu2nM/kuA7
 bT+W6poFJQDkf39sFUwoAAeyMWtdsf6dCcpQyTJUWJPITPuPL8FEy0YRI3O1mCJqxAX0=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:Cc:To:From
 :Sender:Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=84t2iglcvd1+559FLdf2A3g7JxOkQZW4SFcodnq7jeE=; b=H
 ZxiOYJ96lyiBCA/zJSWjfx4FmwFhDRkQbASEKtN2UqJbqVnEbrDHIZtKptChLnhfFQbi4PIvI1jFv
 x89ZBNUOJhUIYYDlJUlaEPBci/L/giazIggaPVa/YA1VEuDRPjthKrM+OYbQ/y74P/4x/9BUyp59/
 +suqA0KsfKHC6kTs=;
Received: from tor.source.kernel.org ([172.105.4.254])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1uERkn-0007rA-5q for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 12 May 2025 11:55:30 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 5ED53629D0
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Mon, 12 May 2025 11:55:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1D3D6C4CEE7;
 Mon, 12 May 2025 11:55:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1747050918;
 bh=7bZWupwPWNBhNeY+PgLjtxu9RVBfTF5znVi1CwfkTj4=;
 h=From:To:Cc:Subject:Date:From;
 b=T6RitHBGJ9+pa5SISRl+XiffykKgkYSpvBTr5XeMlhlglFJbT/nwPACJzlKmCbMHa
 WJ+BEnCCTfflhxmIjKg4JLPrE42c4Gsh9dc4/SMIktJUYfj27KDAc7kxdFAMc4AjH/
 2aIh+UQxIP/dyO8h9NGE/X3oyniB2XR8yPXln4zBGINXinxYp1lRQyP9PaeVrnJxj6
 E3IqH0ZHdgjYRfen7ok3zwFXL2RVpmB86vD4EZZZcb7hqfWRho54GsjgBdaRt2Wq8D
 ZzD2pMDTCzLnwAv+axs+/HOTfaoDIcguiKkYtIIzujFnXZa/whRyM81x3XVGi8L0tH
 6Bhp+OjXbhBUQ==
To: jaegeuk@kernel.org
Date: Mon, 12 May 2025 19:55:14 +0800
Message-ID: <20250512115514.2641059-1-chao@kernel.org>
X-Mailer: git-send-email 2.49.0.1015.ga840276032-goog
MIME-Version: 1.0
X-Spam-Score: -1.7 (-)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: FAULT_KMALLOC 0x000000001 There is one redundant '0' in
 32-bits hexademical number of fault type,
 remove it. Signed-off-by: Chao Yu <chao@kernel.org>
 --- Documentation/ABI/testing/sysfs-fs-f2fs | 52 ++++++++++++
 Documentation/filesystems/f2fs.rst
 | 52 ++++++++++++ 2 files changed, 5 [...] 
 Content analysis details:   (-1.7 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 RCVD_IN_VALIDITY_CERTIFIED_BLOCKED RBL: ADMINISTRATOR NOTICE:
 The query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [172.105.4.254 listed in sa-accredit.habeas.com]
 0.0 RCVD_IN_VALIDITY_RPBL_BLOCKED RBL: ADMINISTRATOR NOTICE: The
 query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [172.105.4.254 listed in bl.score.senderscore.com]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -1.6 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1uERkn-0007rA-5q
Subject: [f2fs-dev] [PATCH] f2fs: fix 32-bits hexademical number in fault
 injection doc
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
From: Chao Yu via Linux-f2fs-devel <linux-f2fs-devel@lists.sourceforge.net>
Reply-To: Chao Yu <chao@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

FAULT_KMALLOC                    0x000000001

There is one redundant '0' in 32-bits hexademical number of fault type,
remove it.

Signed-off-by: Chao Yu <chao@kernel.org>
---
 Documentation/ABI/testing/sysfs-fs-f2fs | 52 ++++++++++++-------------
 Documentation/filesystems/f2fs.rst      | 52 ++++++++++++-------------
 2 files changed, 52 insertions(+), 52 deletions(-)

diff --git a/Documentation/ABI/testing/sysfs-fs-f2fs b/Documentation/ABI/testing/sysfs-fs-f2fs
index feafb36fd921..e060798f9fc1 100644
--- a/Documentation/ABI/testing/sysfs-fs-f2fs
+++ b/Documentation/ABI/testing/sysfs-fs-f2fs
@@ -710,33 +710,33 @@ Description:	Support configuring fault injection type, should be
 		enabled with fault_injection option, fault type value
 		is shown below, it supports single or combined type.
 
-		===========================      ===========
+		===========================      ==========
 		Type_Name                        Type_Value
-		===========================      ===========
-		FAULT_KMALLOC                    0x000000001
-		FAULT_KVMALLOC                   0x000000002
-		FAULT_PAGE_ALLOC                 0x000000004
-		FAULT_PAGE_GET                   0x000000008
-		FAULT_ALLOC_BIO                  0x000000010 (obsolete)
-		FAULT_ALLOC_NID                  0x000000020
-		FAULT_ORPHAN                     0x000000040
-		FAULT_BLOCK                      0x000000080
-		FAULT_DIR_DEPTH                  0x000000100
-		FAULT_EVICT_INODE                0x000000200
-		FAULT_TRUNCATE                   0x000000400
-		FAULT_READ_IO                    0x000000800
-		FAULT_CHECKPOINT                 0x000001000
-		FAULT_DISCARD                    0x000002000
-		FAULT_WRITE_IO                   0x000004000
-		FAULT_SLAB_ALLOC                 0x000008000
-		FAULT_DQUOT_INIT                 0x000010000
-		FAULT_LOCK_OP                    0x000020000
-		FAULT_BLKADDR_VALIDITY           0x000040000
-		FAULT_BLKADDR_CONSISTENCE        0x000080000
-		FAULT_NO_SEGMENT                 0x000100000
-		FAULT_INCONSISTENT_FOOTER        0x000200000
-		FAULT_TIMEOUT                    0x000400000 (1000ms)
-		===========================      ===========
+		===========================      ==========
+		FAULT_KMALLOC                    0x00000001
+		FAULT_KVMALLOC                   0x00000002
+		FAULT_PAGE_ALLOC                 0x00000004
+		FAULT_PAGE_GET                   0x00000008
+		FAULT_ALLOC_BIO                  0x00000010 (obsolete)
+		FAULT_ALLOC_NID                  0x00000020
+		FAULT_ORPHAN                     0x00000040
+		FAULT_BLOCK                      0x00000080
+		FAULT_DIR_DEPTH                  0x00000100
+		FAULT_EVICT_INODE                0x00000200
+		FAULT_TRUNCATE                   0x00000400
+		FAULT_READ_IO                    0x00000800
+		FAULT_CHECKPOINT                 0x00001000
+		FAULT_DISCARD                    0x00002000
+		FAULT_WRITE_IO                   0x00004000
+		FAULT_SLAB_ALLOC                 0x00008000
+		FAULT_DQUOT_INIT                 0x00010000
+		FAULT_LOCK_OP                    0x00020000
+		FAULT_BLKADDR_VALIDITY           0x00040000
+		FAULT_BLKADDR_CONSISTENCE        0x00080000
+		FAULT_NO_SEGMENT                 0x00100000
+		FAULT_INCONSISTENT_FOOTER        0x00200000
+		FAULT_TIMEOUT                    0x00400000 (1000ms)
+		===========================      ==========
 
 What:		/sys/fs/f2fs/<disk>/discard_io_aware_gran
 Date:		January 2023
diff --git a/Documentation/filesystems/f2fs.rst b/Documentation/filesystems/f2fs.rst
index 157743ab107d..724fc5e2889a 100644
--- a/Documentation/filesystems/f2fs.rst
+++ b/Documentation/filesystems/f2fs.rst
@@ -182,33 +182,33 @@ fault_type=%d		 Support configuring fault injection type, should be
 			 enabled with fault_injection option, fault type value
 			 is shown below, it supports single or combined type.
 
-			 ===========================      ===========
+			 ===========================      ==========
 			 Type_Name                        Type_Value
-			 ===========================      ===========
-			 FAULT_KMALLOC                    0x000000001
-			 FAULT_KVMALLOC                   0x000000002
-			 FAULT_PAGE_ALLOC                 0x000000004
-			 FAULT_PAGE_GET                   0x000000008
-			 FAULT_ALLOC_BIO                  0x000000010 (obsolete)
-			 FAULT_ALLOC_NID                  0x000000020
-			 FAULT_ORPHAN                     0x000000040
-			 FAULT_BLOCK                      0x000000080
-			 FAULT_DIR_DEPTH                  0x000000100
-			 FAULT_EVICT_INODE                0x000000200
-			 FAULT_TRUNCATE                   0x000000400
-			 FAULT_READ_IO                    0x000000800
-			 FAULT_CHECKPOINT                 0x000001000
-			 FAULT_DISCARD                    0x000002000
-			 FAULT_WRITE_IO                   0x000004000
-			 FAULT_SLAB_ALLOC                 0x000008000
-			 FAULT_DQUOT_INIT                 0x000010000
-			 FAULT_LOCK_OP                    0x000020000
-			 FAULT_BLKADDR_VALIDITY           0x000040000
-			 FAULT_BLKADDR_CONSISTENCE        0x000080000
-			 FAULT_NO_SEGMENT                 0x000100000
-			 FAULT_INCONSISTENT_FOOTER        0x000200000
-			 FAULT_TIMEOUT                    0x000400000 (1000ms)
-			 ===========================      ===========
+			 ===========================      ==========
+			 FAULT_KMALLOC                    0x00000001
+			 FAULT_KVMALLOC                   0x00000002
+			 FAULT_PAGE_ALLOC                 0x00000004
+			 FAULT_PAGE_GET                   0x00000008
+			 FAULT_ALLOC_BIO                  0x00000010 (obsolete)
+			 FAULT_ALLOC_NID                  0x00000020
+			 FAULT_ORPHAN                     0x00000040
+			 FAULT_BLOCK                      0x00000080
+			 FAULT_DIR_DEPTH                  0x00000100
+			 FAULT_EVICT_INODE                0x00000200
+			 FAULT_TRUNCATE                   0x00000400
+			 FAULT_READ_IO                    0x00000800
+			 FAULT_CHECKPOINT                 0x00001000
+			 FAULT_DISCARD                    0x00002000
+			 FAULT_WRITE_IO                   0x00004000
+			 FAULT_SLAB_ALLOC                 0x00008000
+			 FAULT_DQUOT_INIT                 0x00010000
+			 FAULT_LOCK_OP                    0x00020000
+			 FAULT_BLKADDR_VALIDITY           0x00040000
+			 FAULT_BLKADDR_CONSISTENCE        0x00080000
+			 FAULT_NO_SEGMENT                 0x00100000
+			 FAULT_INCONSISTENT_FOOTER        0x00200000
+			 FAULT_TIMEOUT                    0x00400000 (1000ms)
+			 ===========================      ==========
 mode=%s			 Control block allocation mode which supports "adaptive"
 			 and "lfs". In "lfs" mode, there should be no random
 			 writes towards main area.
-- 
2.49.0



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
