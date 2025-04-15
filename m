Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id D897AA89C49
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 15 Apr 2025 13:28:28 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1u4eSg-0008Mg-6Q;
	Tue, 15 Apr 2025 11:28:18 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <chao@kernel.org>) id 1u4eSY-0008MI-CS
 for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 15 Apr 2025 11:28:10 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:Message-ID:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=K2AIna88c5W3lr1zVZNAQBxUA94bceRg2QvATJnT7xE=; b=Bql7DRqbDDOq/hJjv4/eSDqZRg
 wW7PpdEJu6JnT8xOGpKVY6im1DhtqeZ25tXLJR2+polgoQzb6Y70BNgqohJSra8cc4y27dBAnPYqm
 ZTsMmKUY64oYMYCNvdQmB3rYvyG+v39UR42IrF/v4opdpJ5fu3KGYooO96gJEDZr11OI=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:Cc:To:From
 :Sender:Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=K2AIna88c5W3lr1zVZNAQBxUA94bceRg2QvATJnT7xE=; b=e
 jZ0gZnpf8LwU/CUgB85kv9t4OPv8MjMTdWg9vHmn9kei/A+aB5vNOmY9CUcH1oroJW4gyWvYTXfYk
 yFzmiJVk5z3G3rzFqyxdq5VYGxqeoOfmH4TYjXfZ3l3H0vKmIBRPo/N/ZWSWSA1r2NaNm3QBQLly0
 ek0bKntF66YmHRDw=;
Received: from sea.source.kernel.org ([172.234.252.31])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1u4eSJ-0002yX-7B for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 15 Apr 2025 11:28:10 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id A0D06446F5
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Tue, 15 Apr 2025 11:27:43 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C1BA2C4CEDD;
 Tue, 15 Apr 2025 11:27:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1744716464;
 bh=PdlH3ExfK32PapgIU9ie/YF1Dd/vxmIqc/21XNk1aZk=;
 h=From:To:Cc:Subject:Date:From;
 b=fKsp6mGQ0nqWuBDFxnX6JyLkYvnRX5SlPJ0NKuNsae9UiAWXxGiExjp2nFdwPnzqO
 87Sh3dd/beeBhX5EukJ6gEUaiwFuhlJI0lJREazQ2sMhU2wB2uIsO2mfkHSh1Xe84b
 /shH2dswiOk6TGGPl695/lDIctXYiRumR4nu8jiTsGd3MiQKyaY/wEcZthEsGGqJdN
 W39GbDkHx71EAyObfstxEBCcEaRsyL8DN/uDzs/Y7s3NrxiucFWL5ZUwFhaVI3qMDi
 RHzmndfEl8DwFsYe+4FAky0+CU0QKGEMqDNThVvw+pQ9KneZMIaxKgUiG5tzN6gn0w
 qLAALuT35UHvQ==
To: jaegeuk@kernel.org
Date: Tue, 15 Apr 2025 19:27:36 +0800
Message-ID: <20250415112736.1127626-1-chao@kernel.org>
X-Mailer: git-send-email 2.49.0.604.gff1f9ca942-goog
MIME-Version: 1.0
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  w/ below testcase, fsck will fix image accidently: mkfs.f2fs
 -f /dev/vdb mount -t f2fs -o noinline_dentry /dev/vdb /mnt/f2fs mkdir
 /mnt/f2fs/dir/
 touch /mnt/f2fs/dir/file umount /mnt/f2fs inject.f2fs [...] 
 Content analysis details:   (-0.2 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 RCVD_IN_VALIDITY_RPBL_BLOCKED RBL: ADMINISTRATOR NOTICE: The
 query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [172.234.252.31 listed in bl.score.senderscore.com]
 0.0 RCVD_IN_VALIDITY_CERTIFIED_BLOCKED RBL: ADMINISTRATOR NOTICE:
 The query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [172.234.252.31 listed in sa-accredit.habeas.com]
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
X-Headers-End: 1u4eSJ-0002yX-7B
Subject: [f2fs-dev] [PATCH] fsck.f2fs: fix to repair hash_code only if
 c.fix_on is true
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
Cc: linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

w/ below testcase, fsck will fix image accidently:
mkfs.f2fs -f /dev/vdb
mount -t f2fs -o noinline_dentry /dev/vdb /mnt/f2fs
mkdir /mnt/f2fs/dir/
touch /mnt/f2fs/dir/file
umount /mnt/f2fs
inject.f2fs --dent --mb d_hash --nid 5 --val 0x9a2ea068 /dev/vdb
fsck.f2fs -d 1 /dev/vdb

output:
[FIX] (f2fs_check_hash_code:1741)  --> Mismatch hash_code for "file" [9a2ea068:53fcf74e]
[fsck_chk_dentry_blk:2124] [  2] Dentry Block [0x4401] Fixed hash_codes

In f2fs_check_hash_code(), we should only fix hash code and return 1
if c.fix_on is true, otherwise, caller will update fixed value to
dentry block directly.

Signed-off-by: Chao Yu <chao@kernel.org>
---
 fsck/fsck.c | 17 ++++++++++++-----
 1 file changed, 12 insertions(+), 5 deletions(-)

diff --git a/fsck/fsck.c b/fsck/fsck.c
index 73fcf07..2cff33f 100644
--- a/fsck/fsck.c
+++ b/fsck/fsck.c
@@ -1738,11 +1738,18 @@ static int f2fs_check_hash_code(int encoding, int casefolded,
 		char new[F2FS_PRINT_NAMELEN];
 
 		pretty_print_filename(name, len, new, enc_name);
-		FIX_MSG("Mismatch hash_code for \"%s\" [%x:%x]",
-				new, le32_to_cpu(dentry->hash_code),
-				hash_code);
-		dentry->hash_code = cpu_to_le32(hash_code);
-		return 1;
+
+		ASSERT_MSG("Mismatch hash_code for \"%s\" [%x:%x]",
+					new, le32_to_cpu(dentry->hash_code),
+					hash_code);
+		if (c.fix_on) {
+			FIX_MSG("Fix hash_code for \"%s\" from %x to %x",
+					new, le32_to_cpu(dentry->hash_code),
+					hash_code);
+			dentry->hash_code = cpu_to_le32(hash_code);
+			return 1;
+		}
+		return 0;
 	}
 	return 0;
 }
-- 
2.49.0



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
