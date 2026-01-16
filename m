Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id EC378D32D23
	for <lists+linux-f2fs-devel@lfdr.de>; Fri, 16 Jan 2026 15:46:38 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:MIME-Version:References:In-Reply-To:
	Message-ID:Date:To:Sender:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/hURwhU4yLWZObNNlRavQlaDj6VsAyK1Xc7Se6qRkyQ=; b=egBJxv+W1HggOHwXSSr1TYh7mq
	CTHw/PCX7h4RY21cQ5MizEIjZSew1umGf4YywFXhbe83qNPmQvmjnEYkn7nhafto2px8YJxFcH3TB
	VHVdPLTTbFRX7ZUwLxaMmahZFC1MQCrW/aKAqlXNW8Mc0SBHID1Q0cqb+O7TAoqE8NZg=;
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1vgl5u-0001rG-S1;
	Fri, 16 Jan 2026 14:46:35 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <cel@kernel.org>) id 1vgl5t-0001r4-N4
 for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 16 Jan 2026 14:46:34 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=YncDRJKVnnn3MH7/i3/AxrgEoE8iEqI+7SnyiOrH2JA=; b=UchHdTsbQYWbkv5wf5Ut8tgCOu
 fW6ZT40F1axLAqvVCUViMR7wj/GRfV8O2KHO/KBDwOa3Xa+/Fre8XdmM8OtpY1VMF3lQa7FIePkcy
 cjbJ1EizJOzoKwyEIpDKGpuxdD1GWcTDtnByu8LS4gzWFCaysl2bFBKADCG+T56C6Rus=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=YncDRJKVnnn3MH7/i3/AxrgEoE8iEqI+7SnyiOrH2JA=; b=M+9YX495+sDRALIXIsKHNXfyX6
 U92Iwz0j3BFsk7RpVw1NobnK2XiMH/GFntvBk9LOvis3GRNkk9Ild6UsbA2M68sII9jRq/6xI+ApK
 JjSzgt+nVIUNkzggl95/0ni2qCU1ZcK+PPM234aaw3VVZPcs4uEQeuRFYUCdj2+MBQ/Q=;
Received: from tor.source.kernel.org ([172.105.4.254])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1vgl5t-0002DN-UC for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 16 Jan 2026 14:46:34 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 60743601D0;
 Fri, 16 Jan 2026 14:46:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E496EC19425;
 Fri, 16 Jan 2026 14:46:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1768574783;
 bh=a661ni48mgSpevVv8uV64JVotuwrk9w+dgDbRx0EyxI=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=ZWRg71n+tKCudxlH674opbuV6KLPb1NgCP1VNATBFwFTxONYJHuezZIz0+e4wdvMd
 hbpQLm7xtSjuodkx6bEAr5wfTgYScpUyqMvxUX+mK2c/LMQB0mzpgiCkNRmFtk+rfZ
 RL9nqWksOEn89ztZCnfOs1wvv5dsrIFa+V1iskdnClEpd+UrLwqIVEkP8k3WtrUe+l
 OJy170J4hCG/zmYGp+LrODiUE0PX54luFgAVHx4u7ZMXln5WKxGMn/YVwHQfIP+NoE
 Og+cw08Wc7hnCgQs8sPXHvUUYYFInHYeBUmeyqYmHh6f3itNkX1wAGbNpCwthsQavv
 yM3aHwHkotPuA==
To: Al Viro <viro@zeniv.linux.org.uk>, Christian Brauner <brauner@kernel.org>,
 Jan Kara <jack@suse.cz>
Date: Fri, 16 Jan 2026 09:46:00 -0500
Message-ID: <20260116144616.2098618-2-cel@kernel.org>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260116144616.2098618-1-cel@kernel.org>
References: <20260116144616.2098618-1-cel@kernel.org>
MIME-Version: 1.0
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-1.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: From: Chuck Lever <chuck.lever@oracle.com> Enable upper
 layers
 such as NFSD to retrieve case sensitivity information from file systems by
 adding case_insensitive and case_nonpreserving boolean fields to struct
 file_kattr.
 Content analysis details:   (-0.2 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1vgl5t-0002DN-UC
Subject: [f2fs-dev] [PATCH v5 01/16] fs: Add case sensitivity info to
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
case_nonpreserving boolean fields to struct file_kattr.

The case_insensitive and case_nonpreserving fields in struct
file_kattr default to false (POSIX semantics: case-sensitive and
case-preserving), allowing filesystems to set them only when
behavior differs from the default.

Case sensitivity information is exported to userspace via the
existing fa_xflags field using the new FS_XFLAG_CASEFOLD and
FS_XFLAG_CASENONPRESERVING flags.

Signed-off-by: Chuck Lever <chuck.lever@oracle.com>
---
 fs/file_attr.c           | 6 ++++++
 include/linux/fileattr.h | 6 +++++-
 include/uapi/linux/fs.h  | 2 ++
 3 files changed, 13 insertions(+), 1 deletion(-)

diff --git a/fs/file_attr.c b/fs/file_attr.c
index 13cdb31a3e94..2f83f3c6a170 100644
--- a/fs/file_attr.c
+++ b/fs/file_attr.c
@@ -84,6 +84,8 @@ int vfs_fileattr_get(struct dentry *dentry, struct file_kattr *fa)
 	struct inode *inode = d_inode(dentry);
 	int error;
 
+	memset(fa, 0, sizeof(*fa));
+
 	if (!inode->i_op->fileattr_get)
 		return -ENOIOCTLCMD;
 
@@ -106,6 +108,10 @@ static void fileattr_to_file_attr(const struct file_kattr *fa,
 	fattr->fa_nextents = fa->fsx_nextents;
 	fattr->fa_projid = fa->fsx_projid;
 	fattr->fa_cowextsize = fa->fsx_cowextsize;
+	if (fa->case_insensitive)
+		fattr->fa_xflags |= FS_XFLAG_CASEFOLD;
+	if (fa->case_nonpreserving)
+		fattr->fa_xflags |= FS_XFLAG_CASENONPRESERVING;
 }
 
 /**
diff --git a/include/linux/fileattr.h b/include/linux/fileattr.h
index f89dcfad3f8f..7f2e557255ce 100644
--- a/include/linux/fileattr.h
+++ b/include/linux/fileattr.h
@@ -16,7 +16,8 @@
 
 /* Read-only inode flags */
 #define FS_XFLAG_RDONLY_MASK \
-	(FS_XFLAG_PREALLOC | FS_XFLAG_HASATTR)
+	(FS_XFLAG_PREALLOC | FS_XFLAG_HASATTR | \
+	 FS_XFLAG_CASEFOLD | FS_XFLAG_CASENONPRESERVING)
 
 /* Flags to indicate valid value of fsx_ fields */
 #define FS_XFLAG_VALUES_MASK \
@@ -51,6 +52,9 @@ struct file_kattr {
 	/* selectors: */
 	bool	flags_valid:1;
 	bool	fsx_valid:1;
+	/* case sensitivity behavior: */
+	bool	case_insensitive:1;
+	bool	case_nonpreserving:1;
 };
 
 int copy_fsxattr_to_user(const struct file_kattr *fa, struct fsxattr __user *ufa);
diff --git a/include/uapi/linux/fs.h b/include/uapi/linux/fs.h
index 66ca526cf786..919148beaa8c 100644
--- a/include/uapi/linux/fs.h
+++ b/include/uapi/linux/fs.h
@@ -253,6 +253,8 @@ struct file_attr {
 #define FS_XFLAG_FILESTREAM	0x00004000	/* use filestream allocator */
 #define FS_XFLAG_DAX		0x00008000	/* use DAX for IO */
 #define FS_XFLAG_COWEXTSIZE	0x00010000	/* CoW extent size allocator hint */
+#define FS_XFLAG_CASEFOLD	0x00020000	/* case-insensitive lookups */
+#define FS_XFLAG_CASENONPRESERVING 0x00040000	/* case not preserved */
 #define FS_XFLAG_HASATTR	0x80000000	/* no DIFLAG for this	*/
 
 /* the read-only stuff doesn't really belong here, but any other place is
-- 
2.52.0



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
