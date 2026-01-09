Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 26414D06E1B
	for <lists+linux-f2fs-devel@lfdr.de>; Fri, 09 Jan 2026 03:47:46 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:MIME-Version:Message-Id:Date:To:Sender:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=zJJTuCLKlz5OrCkn9/8JxELCe/BZI8T7zuvt9zJLcGY=; b=U7/hRrzdGbE/5+nm1MLt2aqlus
	r/J7rcaVPr7+o8RYdHc7ppYWeRiju6x7dUGYo3jNvN3Ux4OomgvVvCN7/37ptE3nIb+/hGdsh0wT3
	K7Snsj98yE4fOc7q2K65O4TLAkD/eN0b3Q++G4nd/rn1TUy67MTHiSbJszQ/jHUWQ/gg=;
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1ve2XF-00071M-0s;
	Fri, 09 Jan 2026 02:47:33 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <chao@kernel.org>) id 1ve2XD-00071C-Rs
 for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 09 Jan 2026 02:47:32 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=PKpDRxp1qjjcX+X8vAVw/QcFrTxUrBocNiWyB9hFhvc=; b=P8VlP0zlxO3NPTcBllL1tBba7d
 bTv4HORFhZzWAfrVVV88S1pQTRK0F6M4mFxVtM+FSdv8yuasxlDmEy6RR87aHMd+FOjj3q3o7nle+
 ukhN2uwdH5B3eKV9QwTCDPpruRjGmrOuz21B21sHM66XPSPCzzPBS5BtRMJSsX55vGnE=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:Message-Id:Date:Subject:Cc:To:From
 :Sender:Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=PKpDRxp1qjjcX+X8vAVw/QcFrTxUrBocNiWyB9hFhvc=; b=J
 VOpBBQc706uOkgaqngJoNie3co+sREv08U5n8UF8ZBAptQcZdbOeBLchsrzBEdJNdI5bskWYTYZ1s
 JdwhgzqortyX8WODRQ2wkddsdq9IcUUK/TxJhxPKTcN3UIBAK96DaWT/Uq7r9QIbHO2Zr3R0xGv3j
 MhAsyCEouPLnjS2Q=;
Received: from tor.source.kernel.org ([172.105.4.254])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1ve2XE-0006No-3X for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 09 Jan 2026 02:47:32 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 778366014C
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Fri,  9 Jan 2026 02:47:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B52F5C116C6;
 Fri,  9 Jan 2026 02:47:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1767926846;
 bh=eR/mcmTUhW/HJ7Lb31/8v2Nu+WpkjxC3P5rB1CqxdTk=;
 h=From:To:Cc:Subject:Date:From;
 b=rP5lKxLTjg6Q0I7fEDWcCR1Fm2WZLycL+W7KJLRnK4Uq07gbccfEOIbDYyWQYyQtI
 XO0TG2Slsa2yIOrqimElLiETI5Xy7D8cU5elxIaQzDXRj+DyZsnQGPYTfQCfyeUZrW
 VHpVY5QQWDFyvYwgz/A58y9iM9WkbnHjMIaS/GEnLRMmhvw5YOHR2Mz8zyh/EqiUQ2
 nY71BELPkJgKBEzHjKawz5xvIzcbWjn+PvvKvB6Gk4xYpcEiZSLuyqYkbiQ7HhrpEC
 KHVq4nAuHg0hloRGSxVUCxEKDaXGvb2jUab5X96nhFsng4cYcpCqrILWPLCeeglLll
 DORV70WbM4ozw==
To: jaegeuk@kernel.org
Date: Fri,  9 Jan 2026 10:47:16 +0800
Message-Id: <20260109024716.12047-1-chao@kernel.org>
X-Mailer: git-send-email 2.40.1
MIME-Version: 1.0
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-1.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  Below testcase can change large folio supported inode from
 immutable to mutable, it's not as expected, let's add a new check condition
 in f2fs_setflags_common() to detect and reject it. - dd if=/dev/zero
 of=/mnt/f2fs/test
 bs=32k count=4 - f2fs_io setflags immutable /mnt/f2fs/test - echo 3 >
 /proc/sys/vm/drop_caches
 : to reload inode with large folio - f2fs_io read 32 0 1 mmap 0 0 /mn [...]
 Content analysis details:   (-0.2 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1ve2XE-0006No-3X
Subject: [f2fs-dev] [PATCH] f2fs: fix to prevent clearing immutable for
 large folio supported inode
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

Below testcase can change large folio supported inode from immutable
to mutable, it's not as expected, let's add a new check condition in
f2fs_setflags_common() to detect and reject it.

- dd if=/dev/zero of=/mnt/f2fs/test bs=32k count=4
- f2fs_io setflags immutable /mnt/f2fs/test
- echo 3 > /proc/sys/vm/drop_caches
 : to reload inode with large folio
- f2fs_io read 32 0 1 mmap 0 0 /mnt/f2fs/test
- f2fs_io clearflags immutable /mnt/f2fs/test

Signed-off-by: Chao Yu <chao@kernel.org>
---
 fs/f2fs/file.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/fs/f2fs/file.c b/fs/f2fs/file.c
index ce291f152bc3..f7f9da0b215f 100644
--- a/fs/f2fs/file.c
+++ b/fs/f2fs/file.c
@@ -2155,6 +2155,12 @@ static int f2fs_setflags_common(struct inode *inode, u32 iflags, u32 mask)
 		}
 	}
 
+	if ((iflags ^ masked_flags) & F2FS_IMMUTABLE_FL) {
+		if ((masked_flags & F2FS_IMMUTABLE_FL) &&
+			mapping_large_folio_support(inode->i_mapping))
+			return -EINVAL;
+	}
+
 	fi->i_flags = iflags | (fi->i_flags & ~mask);
 	f2fs_bug_on(F2FS_I_SB(inode), (fi->i_flags & F2FS_COMPR_FL) &&
 					(fi->i_flags & F2FS_NOCOMP_FL));
-- 
2.40.1



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
