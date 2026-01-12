Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A46FD14791
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 12 Jan 2026 18:46:55 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:MIME-Version:References:In-Reply-To:
	Message-ID:Date:To:Sender:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ljXUYkvc7r88P8P+wrrtSrcrE3WZFPlrbr0Cebjjttg=; b=PYzfWKcMphG1MWPcdGff73Skh+
	K7sV7nRRZAnAv1cQjcF9xNixiy7nGvibdrnxXymAaSHhvF77PMx4g97p2hlF1iK1BIfHWYVoXMlm3
	ZDCM4UAGdtyxWHRVq/T4AcRAVS1L7x6/bMyL4dkDII1c+XFOgZNGztNf6BlOsU/afqfM=;
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1vfM0B-00013M-W1;
	Mon, 12 Jan 2026 17:46:51 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <cel@kernel.org>) id 1vfM0A-00013F-9Z
 for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 12 Jan 2026 17:46:50 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=0eSjElFIcQJvAh4Jf1XVAQ9IX7tKDKmPOBmN0IZu/h4=; b=ZCS8QJm1SAi/BJrKRKAt81xYoR
 AF/Px9+VeQodIDB5dy1XK9SqkE681jk2IDzXW/mH9go/Kn/+yosyHIJNuOhTAArVUr/ThgcvXQPha
 cTj/Yg30e1LJ1wctEYM7VRyOB4PTULl18ETD0YHGHT/nMu5INzdVBCl8Yj2CBYzJNRdQ=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=0eSjElFIcQJvAh4Jf1XVAQ9IX7tKDKmPOBmN0IZu/h4=; b=chGXwre2q8AEQWtQ6GczBRQYjk
 PaEN6MPMJM32Xjt+HsPp029CBEknOmx6soITMhD88hCKv8HWtixcoofk/ETEIz4NuxawBimtUuMy8
 5DsF2Egn8uQKO6qRbJTFTLKiX3F5mAMRNOm1NMHsZajIpe4DnZ9i7Fou1mXEnc4PSAd4=;
Received: from sea.source.kernel.org ([172.234.252.31])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1vfM09-0008Sb-Re for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 12 Jan 2026 17:46:50 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id 8C1B8442E0;
 Mon, 12 Jan 2026 17:46:39 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EB17BC2BCB7;
 Mon, 12 Jan 2026 17:46:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1768239999;
 bh=ZdmolEf7aMS93qvpWlwlmeIbSixEvC9LnO2arPDBgRE=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=YVpUgMZe8pjgAKS6qXuLuKdREdB1T1R6X6kgK2sCjR/n2VWHQJp1zSAKc8xAQp21l
 VcGs6N8AemeD+dN85eQ4zb6ZPxzUDo7bJICPReQ8q/1M4vlTc6t8rqtPu9YDPBcJqV
 EMGWJisvUomZMNzeYWNij/rHJnMZOQTX6cbz3WU8LmJlRC9TF3MbDZgNYhRMQTr/F7
 v76Zysu70moFD3IY60Fzb3DmQnO80tshioDVBPd5atr7VmfIidBsbtao8BBJncmhOe
 +bkEOJ6o0RRyX9rnuZd6B85m3NvCGxneufI5W/2cLCEJCe1lZL+48InwDnBg1N86wm
 /52V56C+h1V8A==
To: vira,
	Christian Brauner <brauner@kernel.org>,
	Jan Kara <jack@suse.cz>
Date: Mon, 12 Jan 2026 12:46:14 -0500
Message-ID: <20260112174629.3729358-2-cel@kernel.org>
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
 Content preview: From: Chuck Lever <chuck.lever@oracle.com> Enable upper
 layers
 such as NFSD to retrieve case sensitivity information from file systems by
 adding case_insensitive and case_preserving boolean fields to struct
 file_kattr.
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
X-Headers-End: 1vfM09-0008Sb-Re
Subject: [f2fs-dev] [PATCH v3 01/16] fs: Add case sensitivity info to
 file_kattr
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

Enable upper layers such as NFSD to retrieve case sensitivity
information from file systems by adding case_insensitive and
case_preserving boolean fields to struct file_kattr.

The default POSIX behavior (case-sensitive, case-preserving) is
initialized in vfs_fileattr_get(), allowing filesystems to override
these values only when they differ from the default.

Signed-off-by: Chuck Lever <chuck.lever@oracle.com>
---
 fs/file_attr.c           | 10 ++++++++++
 include/linux/fileattr.h |  3 +++
 2 files changed, 13 insertions(+)

diff --git a/fs/file_attr.c b/fs/file_attr.c
index 13cdb31a3e94..a73de0e0ecac 100644
--- a/fs/file_attr.c
+++ b/fs/file_attr.c
@@ -21,6 +21,9 @@
 void fileattr_fill_xflags(struct file_kattr *fa, u32 xflags)
 {
 	memset(fa, 0, sizeof(*fa));
+	/* Default: POSIX semantics (case-sensitive, case-preserving) */
+	fa->case_insensitive = false;
+	fa->case_preserving = true;
 	fa->fsx_valid = true;
 	fa->fsx_xflags = xflags;
 	if (fa->fsx_xflags & FS_XFLAG_IMMUTABLE)
@@ -51,6 +54,9 @@ EXPORT_SYMBOL(fileattr_fill_xflags);
 void fileattr_fill_flags(struct file_kattr *fa, u32 flags)
 {
 	memset(fa, 0, sizeof(*fa));
+	/* Default: POSIX semantics (case-sensitive, case-preserving) */
+	fa->case_insensitive = false;
+	fa->case_preserving = true;
 	fa->flags_valid = true;
 	fa->flags = flags;
 	if (fa->flags & FS_SYNC_FL)
@@ -84,6 +90,10 @@ int vfs_fileattr_get(struct dentry *dentry, struct file_kattr *fa)
 	struct inode *inode = d_inode(dentry);
 	int error;
 
+	/* Default: POSIX semantics (case-sensitive, case-preserving) */
+	fa->case_insensitive = false;
+	fa->case_preserving = true;
+
 	if (!inode->i_op->fileattr_get)
 		return -ENOIOCTLCMD;
 
diff --git a/include/linux/fileattr.h b/include/linux/fileattr.h
index f89dcfad3f8f..cfd4d3973716 100644
--- a/include/linux/fileattr.h
+++ b/include/linux/fileattr.h
@@ -51,6 +51,9 @@ struct file_kattr {
 	/* selectors: */
 	bool	flags_valid:1;
 	bool	fsx_valid:1;
+	/* case sensitivity behavior: */
+	bool	case_insensitive:1;
+	bool	case_preserving:1;
 };
 
 int copy_fsxattr_to_user(const struct file_kattr *fa, struct fsxattr __user *ufa);
-- 
2.52.0



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
