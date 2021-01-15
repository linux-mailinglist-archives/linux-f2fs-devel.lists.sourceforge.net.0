Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 4AD862F8415
	for <lists+linux-f2fs-devel@lfdr.de>; Fri, 15 Jan 2021 19:21:09 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1l0Tic-0002IS-JY; Fri, 15 Jan 2021 18:21:06 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <ebiggers@kernel.org>) id 1l0TiY-0002GZ-LC
 for linux-f2fs-devel@lists.sourceforge.net; Fri, 15 Jan 2021 18:21:02 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=ZhZfXItCF784UDtjoJUd59i7e+8xnIsCZhpWLs72wAA=; b=a3GZMAtm1sre9/zf4ltO525VzF
 u6GrOtyGuxLqMNGlsmexA2Qzw9btYeF1O3dBu0Ir47Ai4qYR5rIsOjPq2AMNmmrPT2F7pExlutB69
 6jHVhWAv7cjt4DYmTM0If/8QT/x2DbfbZsNze1UPG6Zvo0GGCbdT9cSxTIatbpkk25No=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=ZhZfXItCF784UDtjoJUd59i7e+8xnIsCZhpWLs72wAA=; b=fCDlnyDy9ZLLBSN4IoBSzeow/r
 EmZYwPKFSt6j/OVvGt5PilXy7m1SU3wENmTWtcD52UZAhSHyLW/rcapCF5i3fJBnP5oVWrPpHwEwF
 7yrKVNvcE3AIsyGKphnJXdjUtqJHMG8o4UclC3EKRcNmW9uGb1fxFOM9S8irgenPp1rM=;
Received: from mail.kernel.org ([198.145.29.99])
 by sfi-mx-3.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1l0ThX-005PEZ-V8
 for linux-f2fs-devel@lists.sourceforge.net; Fri, 15 Jan 2021 18:20:09 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id 851D523A6C;
 Fri, 15 Jan 2021 18:19:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1610734774;
 bh=DBm5POVqThVqB6dR0uFKTktVEXLstitiHg1DG/aF4QM=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=S+zoOQ/fI9iHtksm84CuXz1loVV1PH1en9rM/bpCSgerSJhppwjg5/JABqS/Q/5MN
 YmeKczMMxKNkLgO3M7tG1m2t4LcJ0iyoLF7dq8JrL/dSouRxvEmWmh2S3KxJ2GkWz0
 kyDALixxhhcVKKmePXO6AGp6523+Cyhwhb+IlT5TKnnUqf8FoszDmmecHTSLey6Xk2
 UKF40HtqlrfFyYUhgFcChzqtRb0e3HyystLXBkB9/ijX/ZMXf73iV1RyQM1Timzr/D
 uZdJjKdLF2/tFlMXM28HHK6z1pRLPMlCDuj5wECLquhkZ7pQNWID7kyiykpYEmP1X1
 J9zA0rCEu6/OA==
From: Eric Biggers <ebiggers@kernel.org>
To: linux-fscrypt@vger.kernel.org
Date: Fri, 15 Jan 2021 10:18:19 -0800
Message-Id: <20210115181819.34732-7-ebiggers@kernel.org>
X-Mailer: git-send-email 2.30.0
In-Reply-To: <20210115181819.34732-1-ebiggers@kernel.org>
References: <20210115181819.34732-1-ebiggers@kernel.org>
MIME-Version: 1.0
X-Spam-Score: -0.3 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.2 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1l0ThX-005PEZ-V8
Subject: [f2fs-dev] [PATCH 6/6] fs-verity: support reading signature with
 ioctl
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
Cc: Theodore Ts'o <tytso@mit.edu>, linux-api@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net, linux-fsdevel@vger.kernel.org,
 Jaegeuk Kim <jaegeuk@kernel.org>, linux-ext4@vger.kernel.org,
 Victor Hsieh <victorhsieh@google.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

From: Eric Biggers <ebiggers@google.com>

Add support for FS_VERITY_METADATA_TYPE_SIGNATURE to
FS_IOC_READ_VERITY_METADATA.  This allows a userspace server program to
retrieve the built-in signature (if present) of a verity file for
serving to a client which implements fs-verity compatible verification.
See the patch which introduced FS_IOC_READ_VERITY_METADATA for more
details.

The ability for userspace to read the built-in signatures is also useful
because it allows a system that is using the in-kernel signature
verification to migrate to userspace signature verification.

This has been tested using a new xfstest which calls this ioctl via a
new subcommand for the 'fsverity' program from fsverity-utils.

Signed-off-by: Eric Biggers <ebiggers@google.com>
---
 Documentation/filesystems/fsverity.rst |  9 +++++++-
 fs/verity/read_metadata.c              | 30 ++++++++++++++++++++++++++
 include/uapi/linux/fsverity.h          |  1 +
 3 files changed, 39 insertions(+), 1 deletion(-)

diff --git a/Documentation/filesystems/fsverity.rst b/Documentation/filesystems/fsverity.rst
index 6dc5772037ef9..1d831e3cbcb33 100644
--- a/Documentation/filesystems/fsverity.rst
+++ b/Documentation/filesystems/fsverity.rst
@@ -236,6 +236,7 @@ This ioctl takes in a pointer to the following structure::
 
    #define FS_VERITY_METADATA_TYPE_MERKLE_TREE     1
    #define FS_VERITY_METADATA_TYPE_DESCRIPTOR      2
+   #define FS_VERITY_METADATA_TYPE_SIGNATURE       3
 
    struct fsverity_read_metadata_arg {
            __u64 metadata_type;
@@ -256,6 +257,10 @@ This ioctl takes in a pointer to the following structure::
 - ``FS_VERITY_METADATA_TYPE_DESCRIPTOR`` reads the fs-verity
   descriptor.  See `fs-verity descriptor`_.
 
+- ``FS_VERITY_METADATA_TYPE_SIGNATURE`` reads the signature which was
+  passed to FS_IOC_ENABLE_VERITY, if any.  See `Built-in signature
+  verification`_.
+
 The semantics are similar to those of ``pread()``.  ``offset``
 specifies the offset in bytes into the metadata item to read from, and
 ``length`` specifies the maximum number of bytes to read from the
@@ -279,7 +284,9 @@ FS_IOC_READ_VERITY_METADATA can fail with the following errors:
 - ``EINTR``: the ioctl was interrupted before any data was read
 - ``EINVAL``: reserved fields were set, or ``offset + length``
   overflowed
-- ``ENODATA``: the file is not a verity file
+- ``ENODATA``: the file is not a verity file, or
+  FS_VERITY_METADATA_TYPE_SIGNATURE was requested but the file doesn't
+  have a built-in signature
 - ``ENOTTY``: this type of filesystem does not implement fs-verity, or
   this ioctl is not yet implemented on it
 - ``EOPNOTSUPP``: the kernel was not configured with fs-verity
diff --git a/fs/verity/read_metadata.c b/fs/verity/read_metadata.c
index 2dea6dd3bb05a..7e2d0c7bdf0de 100644
--- a/fs/verity/read_metadata.c
+++ b/fs/verity/read_metadata.c
@@ -114,6 +114,34 @@ static int fsverity_read_descriptor(struct inode *inode,
 	kfree(desc);
 	return res;
 }
+
+static int fsverity_read_signature(struct inode *inode,
+				   void __user *buf, u64 offset, int length)
+{
+	struct fsverity_descriptor *desc;
+	size_t desc_size;
+	int res;
+
+	res = fsverity_get_descriptor(inode, &desc, &desc_size);
+	if (res)
+		return res;
+
+	if (desc->sig_size == 0) {
+		res = -ENODATA;
+		goto out;
+	}
+
+	/*
+	 * Include only the signature.  Note that fsverity_get_descriptor()
+	 * already verified that sig_size is in-bounds.
+	 */
+	res = fsverity_read_buffer(buf, offset, length, desc->signature,
+				   le32_to_cpu(desc->sig_size));
+out:
+	kfree(desc);
+	return res;
+}
+
 /**
  * fsverity_ioctl_read_metadata() - read verity metadata from a file
  * @filp: file to read the metadata from
@@ -158,6 +186,8 @@ int fsverity_ioctl_read_metadata(struct file *filp, const void __user *uarg)
 						 length);
 	case FS_VERITY_METADATA_TYPE_DESCRIPTOR:
 		return fsverity_read_descriptor(inode, buf, arg.offset, length);
+	case FS_VERITY_METADATA_TYPE_SIGNATURE:
+		return fsverity_read_signature(inode, buf, arg.offset, length);
 	default:
 		return -EINVAL;
 	}
diff --git a/include/uapi/linux/fsverity.h b/include/uapi/linux/fsverity.h
index 41abc283dbccb..15384e22e331e 100644
--- a/include/uapi/linux/fsverity.h
+++ b/include/uapi/linux/fsverity.h
@@ -85,6 +85,7 @@ struct fsverity_formatted_digest {
 
 #define FS_VERITY_METADATA_TYPE_MERKLE_TREE	1
 #define FS_VERITY_METADATA_TYPE_DESCRIPTOR	2
+#define FS_VERITY_METADATA_TYPE_SIGNATURE	3
 
 struct fsverity_read_metadata_arg {
 	__u64 metadata_type;
-- 
2.30.0



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
