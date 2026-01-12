Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F343D147DF
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 12 Jan 2026 18:47:23 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:MIME-Version:References:In-Reply-To:
	Message-ID:Date:To:Sender:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=iESO2gGogltYEfR4mcf8Q6GLd3mbKAQibkw9wBVpQfw=; b=BhzUh2t/2mwB/35UtB14GJa2kO
	LNBoDBlXgqc6IcJcRueQggO7LqRfmvocmUorBI1GCb6SezTnoq9VENJd6ipdDUr5yEzndqXwM2yGO
	YQmS1BrD+eyqIpdz3g2OyWz4RpDkcWFG6cGjxkmMFj+1hbBqUwbq9qVmB31ANAAPUhrs=;
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1vfM0f-0003Rx-P1;
	Mon, 12 Jan 2026 17:47:21 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <cel@kernel.org>) id 1vfM0e-0003Rc-NG
 for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 12 Jan 2026 17:47:20 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=yxEaK/yNFLnmcfdZdlHWDsndV86qJbxCR65j3IMerqc=; b=IoP5fdkvH8hDb4RvMKRhrwk6B7
 j7hflQci/2q/6bT/UWsou3DRZYh6l0ndTD53v1G1wvxv84DhOcAACKBpDAkFHnn8r+nIC1Pm4xhTd
 4qIMJpOi+iKBVVOAlDyb1/hM5bM1FMxE0KLjjcvfTHpP0QlL7+Zo5WHbj/dZoYQZF/Fk=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=yxEaK/yNFLnmcfdZdlHWDsndV86qJbxCR65j3IMerqc=; b=KvC5sUseXwMY+INuF5Gs6bpdPF
 pGBqJKYyzNceK0AjgrmuhIkNYojqoZ23K9xaEZPz2EX1LoyAPw9mCuP996+wX0URSTdRbkIX9+D9X
 xNKhCtYBwUDfz5E+AKilLYa/5nZpvvwRATV754b64k4/9+/He7/UdAicd1FlhJKKpsq0=;
Received: from sea.source.kernel.org ([172.234.252.31])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1vfM0e-0008US-97 for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 12 Jan 2026 17:47:20 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id E8C24442A1;
 Mon, 12 Jan 2026 17:47:09 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8D1FFC2BC87;
 Mon, 12 Jan 2026 17:47:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1768240029;
 bh=q6kHQb/sJzXKx0Up0ATDcFUCwgxZAGk1F4yu/JZhQtI=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=pvJTVLHxPyJyyx/O2etEyMsukDeRV46zAjiiryP31Ndu8w7G6JMDP0649kvxozyKO
 PFirLFjDkG/dbiirzhruI/XKwcM81wbhl/HcLRVjyN/4egAr3CdmRio1gJOomFrwfr
 EVcXZL1JL8x2U1cJf6dy4ZLm/4IClxypRt416JHr75IQ+6oUSUVS/19nHG7PDdqgRg
 WDF6wii3+FhxA9jrWYZM/sTtcpl+xQ8Kd5KC3rgc07Gnxp9lVaDx+mBvAvpz9160dh
 3dUXdWx6J0sNRMik2OAu9acn0greSviSqjij5/Ht4UFEtHejIqghSswp5F3kPniOGJ
 X9Cm70ztUm8Ww==
To: vira,
	Christian Brauner <brauner@kernel.org>,
	Jan Kara <jack@suse.cz>
Date: Mon, 12 Jan 2026 12:46:26 -0500
Message-ID: <20260112174629.3729358-14-cel@kernel.org>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260112174629.3729358-1-cel@kernel.org>
References: <20260112174629.3729358-1-cel@kernel.org>
MIME-Version: 1.0
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-2.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: From: Chuck Lever <chuck.lever@oracle.com> Upper layers such
 as NFSD need a way to query whether a filesystem handles filenames in a
 case-sensitive
 manner so they can provide correct semantics to remote clients. Without this
 information, NFS e [...] 
 Content analysis details:   (-0.2 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1vfM0e-0008US-97
Subject: [f2fs-dev] [PATCH v3 13/16] isofs: Implement fileattr_get for case
 sensitivity
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
From: Chuck Lever via Linux-f2fs-devel <linux-f2fs-devel@lists.sourceforge.net>
Reply-To: Chuck Lever <cel@kernel.org>
Cc: pc@manguebit.org, yuezhang.mo@sony.com, cem@kernel.org,
 almaz.alexandrovich@paragon-software.com, adilger.kernel@dilger.ca,
 linux-cifs@vger.kernel.org, sfrench@samba.org, slava@dubeyko.com,
 linux-ext4@vger.kernel.org, linkinjeon@kernel.org, sprasad@microsoft.com,
 frank.li@vivo.com, ronniesahlberg@gmail.com, glaubitz@physik.fu-berlin.de,
 jaegeuk@kernel.org, hirofumi@mail.parknet.co.jp, linux-nfs@vger.kernel.org,
 tytso@mit.edu, linux-f2fs-devel@lists.sourceforge.net,
 linux-xfs@vger.kernel.org, senozhatsky@chromium.org,
 Chuck Lever <chuck.lever@oracle.com>, hansg@kernel.org, anna@kernel.org,
 linux-fsdevel@vger.kernel.org, sj1557.seo@samsung.com, trondmy@kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

From: Chuck Lever <chuck.lever@oracle.com>

Upper layers such as NFSD need a way to query whether a
filesystem handles filenames in a case-sensitive manner so
they can provide correct semantics to remote clients. Without
this information, NFS exports of ISO 9660 filesystems cannot
properly advertise their filename case behavior.

Implement isofs_fileattr_get() to report ISO 9660 case
handling behavior. The 'check=r' (relaxed) mount option
enables case-insensitive lookups, and this setting determines
the value reported through the file_kattr structure. By
default, Joliet extensions operate in relaxed mode while plain
ISO 9660 uses strict (case-sensitive) mode. All ISO 9660
variants are case-preserving, meaning filenames are stored
exactly as they appear on the disc.

The callback is registered only on isofs_dir_inode_operations
because isofs has no custom inode_operations for regular
files, and symlinks use the generic page_symlink_inode_operations.

Signed-off-by: Chuck Lever <chuck.lever@oracle.com>
---
 fs/isofs/dir.c | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/fs/isofs/dir.c b/fs/isofs/dir.c
index 09df40b612fb..717cdf726e83 100644
--- a/fs/isofs/dir.c
+++ b/fs/isofs/dir.c
@@ -12,6 +12,7 @@
  *  isofs directory handling functions
  */
 #include <linux/gfp.h>
+#include <linux/fileattr.h>
 #include "isofs.h"
 
 int isofs_name_translate(struct iso_directory_record *de, char *new, struct inode *inode)
@@ -266,6 +267,15 @@ static int isofs_readdir(struct file *file, struct dir_context *ctx)
 	return result;
 }
 
+static int isofs_fileattr_get(struct dentry *dentry, struct file_kattr *fa)
+{
+	struct isofs_sb_info *sbi = ISOFS_SB(dentry->d_sb);
+
+	fa->case_insensitive = sbi->s_check == 'r';
+	fa->case_preserving = true;
+	return 0;
+}
+
 const struct file_operations isofs_dir_operations =
 {
 	.llseek = generic_file_llseek,
@@ -279,6 +289,7 @@ const struct file_operations isofs_dir_operations =
 const struct inode_operations isofs_dir_inode_operations =
 {
 	.lookup = isofs_lookup,
+	.fileattr_get = isofs_fileattr_get,
 };
 
 
-- 
2.52.0



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
