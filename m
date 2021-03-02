Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A56532AAFE
	for <lists+linux-f2fs-devel@lfdr.de>; Tue,  2 Mar 2021 21:05:35 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1lHBGr-00068B-Qs; Tue, 02 Mar 2021 20:05:29 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <ebiggers@kernel.org>) id 1lHBGi-00066H-FX
 for linux-f2fs-devel@lists.sourceforge.net; Tue, 02 Mar 2021 20:05:20 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=cOmDOwTQaC4o8lBMp047M41m256bYaQhCYhY5ns0+gQ=; b=ETushirEHFgbitLqeiF8tLiVUa
 KnwSmMyR6/Lb4TKGkC1npxsxLRP3LLEZ/KqIpb54QpnxHXuRjW4RbsurTfvVCdwNHm5H70ICQWfWZ
 LjOCRcgVc2kIEMpWCTUAKYhQPVovAs6Eua65Hzgihu3Ej3cZ7DrinymZESv0HWXZkJ0w=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=cOmDOwTQaC4o8lBMp047M41m256bYaQhCYhY5ns0+gQ=; b=hymvbav03igpjGwzw1a7Yu3Lqm
 PCtqkxP4Fl8fp9CGWqxWOcGI2q4XGfgpPIhQO7mP2uLXxGgT1ricHXlXq+gvHwNnFEigQd2WTBdZ0
 JysV9rWghdmx4FkejohHgCjkasjR5KgAfRKwrgCJKStSDUmvKkBqA1UWmEV/cpRI1E7c=;
Received: from mail.kernel.org ([198.145.29.99])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.3)
 id 1lHBGY-0005et-DA
 for linux-f2fs-devel@lists.sourceforge.net; Tue, 02 Mar 2021 20:05:19 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id 9FFA160201;
 Tue,  2 Mar 2021 20:05:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1614715504;
 bh=dZn0iUMFHRoA3vCrFDFvUd/mf0EEgaR4RnetwWeEbvk=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=HPE5cKlZK29+1nuN2yukCiV809pPnGzoFaEbQbsk0bqP7WZIUtziy0UyVBXLCdegZ
 TEscfw7lcOW7zeEGHQjkHd+mSalW5sq8F6vj0akIqBrU+GvveITHyroCZoV7y/+ZuV
 mV4THCKB1yK+igUKVMo7ljAhbjuVh1HGE8fcDDUpMfjB/QUuTItVjV8RXwSyTa4Z6Z
 eiAB2EkNBHFRPz1+N86yB9xKK9F3g+5hV843D24qgZnibjK+Gkm0WrzwRaSecQd8dH
 Jzvvvd9ifzmltHKeiyXmWpVHhinPDs3VJFP7ZNY5HCzQZ7oEopeLOmj5eiNgxPcCDK
 TjmogQy0XyGcA==
From: Eric Biggers <ebiggers@kernel.org>
To: linux-ext4@vger.kernel.org,
	linux-f2fs-devel@lists.sourceforge.net
Date: Tue,  2 Mar 2021 12:04:20 -0800
Message-Id: <20210302200420.137977-3-ebiggers@kernel.org>
X-Mailer: git-send-email 2.30.1
In-Reply-To: <20210302200420.137977-1-ebiggers@kernel.org>
References: <20210302200420.137977-1-ebiggers@kernel.org>
MIME-Version: 1.0
X-Spam-Score: -0.1 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 0.0 URIBL_BLOCKED ADMINISTRATOR NOTICE: The query to URIBL was blocked.
 See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URIs: hihonor.com]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1lHBGY-0005et-DA
Subject: [f2fs-dev] [PATCH 2/2] f2fs: fix error handling in
 f2fs_end_enable_verity()
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
Cc: linux-fscrypt@vger.kernel.org, stable@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

From: Eric Biggers <ebiggers@google.com>

f2fs didn't properly clean up if verity failed to be enabled on a file:

- It left verity metadata (pages past EOF) in the page cache, which
  would be exposed to userspace if the file was later extended.

- It didn't truncate the verity metadata at all (either from cache or
  from disk) if an error occurred while setting the verity bit.

Fix these bugs by adding a call to truncate_inode_pages() and ensuring
that we truncate the verity metadata (both from cache and from disk) in
all error paths.  Also rework the code to cleanly separate the success
path from the error paths, which makes it much easier to understand.

Reported-by: Yunlei He <heyunlei@hihonor.com>
Fixes: 95ae251fe828 ("f2fs: add fs-verity support")
Cc: <stable@vger.kernel.org> # v5.4+
Signed-off-by: Eric Biggers <ebiggers@google.com>
---
 fs/f2fs/verity.c | 61 ++++++++++++++++++++++++++++++++----------------
 1 file changed, 41 insertions(+), 20 deletions(-)

diff --git a/fs/f2fs/verity.c b/fs/f2fs/verity.c
index 054ec852b5ea4..2db89967fde37 100644
--- a/fs/f2fs/verity.c
+++ b/fs/f2fs/verity.c
@@ -160,31 +160,52 @@ static int f2fs_end_enable_verity(struct file *filp, const void *desc,
 	};
 	int err = 0;
 
-	if (desc != NULL) {
-		/* Succeeded; write the verity descriptor. */
-		err = pagecache_write(inode, desc, desc_size, desc_pos);
+	/*
+	 * If an error already occurred (which fs/verity/ signals by passing
+	 * desc == NULL), then only clean-up is needed.
+	 */
+	if (desc == NULL)
+		goto cleanup;
 
-		/* Write all pages before clearing FI_VERITY_IN_PROGRESS. */
-		if (!err)
-			err = filemap_write_and_wait(inode->i_mapping);
-	}
+	/* Append the verity descriptor. */
+	err = pagecache_write(inode, desc, desc_size, desc_pos);
+	if (err)
+		goto cleanup;
 
-	/* If we failed, truncate anything we wrote past i_size. */
-	if (desc == NULL || err)
-		f2fs_truncate(inode);
+	/*
+	 * Write all pages (both data and verity metadata).  Note that this must
+	 * happen before clearing FI_VERITY_IN_PROGRESS; otherwise pages beyond
+	 * i_size won't be written properly.  For crash consistency, this also
+	 * must happen before the verity inode flag gets persisted.
+	 */
+	err = filemap_write_and_wait(inode->i_mapping);
+	if (err)
+		goto cleanup;
+
+	/* Set the verity xattr. */
+	err = f2fs_setxattr(inode, F2FS_XATTR_INDEX_VERITY,
+			    F2FS_XATTR_NAME_VERITY, &dloc, sizeof(dloc),
+			    NULL, XATTR_CREATE);
+	if (err)
+		goto cleanup;
+
+	/* Finally, set the verity inode flag. */
+	file_set_verity(inode);
+	f2fs_set_inode_flags(inode);
+	f2fs_mark_inode_dirty_sync(inode, true);
 
 	clear_inode_flag(inode, FI_VERITY_IN_PROGRESS);
+	return 0;
 
-	if (desc != NULL && !err) {
-		err = f2fs_setxattr(inode, F2FS_XATTR_INDEX_VERITY,
-				    F2FS_XATTR_NAME_VERITY, &dloc, sizeof(dloc),
-				    NULL, XATTR_CREATE);
-		if (!err) {
-			file_set_verity(inode);
-			f2fs_set_inode_flags(inode);
-			f2fs_mark_inode_dirty_sync(inode, true);
-		}
-	}
+cleanup:
+	/*
+	 * Verity failed to be enabled, so clean up by truncating any verity
+	 * metadata that was written beyond i_size (both from cache and from
+	 * disk) and clearing FI_VERITY_IN_PROGRESS.
+	 */
+	truncate_inode_pages(inode->i_mapping, inode->i_size);
+	f2fs_truncate(inode);
+	clear_inode_flag(inode, FI_VERITY_IN_PROGRESS);
 	return err;
 }
 
-- 
2.30.1



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
