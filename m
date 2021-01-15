Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id E32E02F8410
	for <lists+linux-f2fs-devel@lfdr.de>; Fri, 15 Jan 2021 19:21:08 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1l0Tid-0002Ii-LV; Fri, 15 Jan 2021 18:21:07 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <ebiggers@kernel.org>) id 1l0TiY-0002Fz-L8
 for linux-f2fs-devel@lists.sourceforge.net; Fri, 15 Jan 2021 18:21:02 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=ZINA+BQJeU1Qtx5R665RVk6DzXR7e/CN5277Xc0IzS8=; b=XuFrXuwCaeH2G+4eQaeJPbGXxl
 qN//oXAgVmUiSYxG1XvWwmXMVaovBdIq/bGgeK8LzQKV6hVp4sxELiiuFYsV/tOMPTBvs7If1alhg
 DblTtZego/YrPYJKm4uv3QgZaxzC66JYWO90fb2S1jMl4vP3m4IN2TkBYu7PTTJQ7rck=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=ZINA+BQJeU1Qtx5R665RVk6DzXR7e/CN5277Xc0IzS8=; b=LYefLTv7iFbBvBhoQ7zC9dtTIi
 7inSL8UCueuBhUu43RpWkUCqNEc54Rjr4E1RqYshm2X+zZs4KWjF3Vjp9+02mzyW+mFhk5DCskkOd
 +P+Ty+Fr/nVOJJsdPlRqHEylVQ2St1k+rZiz9kEQmtBU8xRoXQk60nzrPwZe7jvh/if8=;
Received: from mail.kernel.org ([198.145.29.99])
 by sfi-mx-3.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1l0ThQ-005PE8-NX
 for linux-f2fs-devel@lists.sourceforge.net; Fri, 15 Jan 2021 18:19:54 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id 283E923A9C;
 Fri, 15 Jan 2021 18:19:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1610734774;
 bh=3tf17MDWrGIlvy8SI+oes67sgJXnVSJsC3e5U1cikIA=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=VfR8z95ZOmifI/nt1Ul75/gFtn3/rXrThfnWJPtXyqIfpUq513T+uuan3RXnnyo2A
 2UZ32crGW4PhR2kgdr3O6J/kwXPA3YgtTo7R7ZIvG9JMn9a0ppiQDkwZJAtK9GjvDS
 f6Qfx90EVmIvpy57svhDWbbWkHq+4cd68DxdDy9a8mRz+5vDt7U06QmfXQ8MJsqV4G
 yKYvO7Y5MLy2olMSMYkM725mCK1+WLHeJ+dRRy0X3jqY5K2W0H4JqS7GKfMkySGaok
 CVDZLQurZCdzDKZRK7pYeeQPY7rDttg5Dx96Q7+8mOtcHJX4j8xvLLmDU5WYBogX+O
 QCKkgpkmuwuFw==
From: Eric Biggers <ebiggers@kernel.org>
To: linux-fscrypt@vger.kernel.org
Date: Fri, 15 Jan 2021 10:18:18 -0800
Message-Id: <20210115181819.34732-6-ebiggers@kernel.org>
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
X-Headers-End: 1l0ThQ-005PE8-NX
Subject: [f2fs-dev] [PATCH 5/6] fs-verity: support reading descriptor with
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

Add support for FS_VERITY_METADATA_TYPE_DESCRIPTOR to
FS_IOC_READ_VERITY_METADATA.  This allows a userspace server program to
retrieve the fs-verity descriptor of a file for serving to a client
which implements fs-verity compatible verification.  See the patch which
introduced FS_IOC_READ_VERITY_METADATA for more details.

"fs-verity descriptor" here means only the part that userspace cares
about because it is hashed to produce the file digest.  It doesn't
include the signature which ext4 and f2fs append to the
fsverity_descriptor struct when storing it on-disk, since that way of
storing the signature is an implementation detail.  The next patch adds
a separate metadata_type value for retrieving the signature separately.

This has been tested using a new xfstest which calls this ioctl via a
new subcommand for the 'fsverity' program from fsverity-utils.

Signed-off-by: Eric Biggers <ebiggers@google.com>
---
 Documentation/filesystems/fsverity.rst |  4 +++
 fs/verity/read_metadata.c              | 40 ++++++++++++++++++++++++++
 include/uapi/linux/fsverity.h          |  1 +
 3 files changed, 45 insertions(+)

diff --git a/Documentation/filesystems/fsverity.rst b/Documentation/filesystems/fsverity.rst
index 50b47a6d9ea11..6dc5772037ef9 100644
--- a/Documentation/filesystems/fsverity.rst
+++ b/Documentation/filesystems/fsverity.rst
@@ -235,6 +235,7 @@ need this ioctl.
 This ioctl takes in a pointer to the following structure::
 
    #define FS_VERITY_METADATA_TYPE_MERKLE_TREE     1
+   #define FS_VERITY_METADATA_TYPE_DESCRIPTOR      2
 
    struct fsverity_read_metadata_arg {
            __u64 metadata_type;
@@ -252,6 +253,9 @@ This ioctl takes in a pointer to the following structure::
   the same order that their hashes are themselves hashed.
   See `Merkle tree`_ for more information.
 
+- ``FS_VERITY_METADATA_TYPE_DESCRIPTOR`` reads the fs-verity
+  descriptor.  See `fs-verity descriptor`_.
+
 The semantics are similar to those of ``pread()``.  ``offset``
 specifies the offset in bytes into the metadata item to read from, and
 ``length`` specifies the maximum number of bytes to read from the
diff --git a/fs/verity/read_metadata.c b/fs/verity/read_metadata.c
index 0f8ad2991cf90..2dea6dd3bb05a 100644
--- a/fs/verity/read_metadata.c
+++ b/fs/verity/read_metadata.c
@@ -76,6 +76,44 @@ static int fsverity_read_merkle_tree(struct inode *inode,
 	}
 	return retval ? retval : err;
 }
+
+/* Copy the requested portion of the buffer to userspace. */
+static int fsverity_read_buffer(void __user *dst, u64 offset, int length,
+				const void *src, size_t src_length)
+{
+	if (offset >= src_length)
+		return 0;
+	src += offset;
+	src_length -= offset;
+
+	length = min_t(size_t, length, src_length);
+
+	if (copy_to_user(dst, src, length))
+		return -EFAULT;
+
+	return length;
+}
+
+static int fsverity_read_descriptor(struct inode *inode,
+				    void __user *buf, u64 offset, int length)
+{
+	struct fsverity_descriptor *desc;
+	size_t desc_size;
+	int res;
+
+	res = fsverity_get_descriptor(inode, &desc, &desc_size);
+	if (res)
+		return res;
+
+	/* don't include the signature */
+	desc_size = offsetof(struct fsverity_descriptor, signature);
+	desc->sig_size = 0;
+
+	res = fsverity_read_buffer(buf, offset, length, desc, desc_size);
+
+	kfree(desc);
+	return res;
+}
 /**
  * fsverity_ioctl_read_metadata() - read verity metadata from a file
  * @filp: file to read the metadata from
@@ -118,6 +156,8 @@ int fsverity_ioctl_read_metadata(struct file *filp, const void __user *uarg)
 	case FS_VERITY_METADATA_TYPE_MERKLE_TREE:
 		return fsverity_read_merkle_tree(inode, vi, buf, arg.offset,
 						 length);
+	case FS_VERITY_METADATA_TYPE_DESCRIPTOR:
+		return fsverity_read_descriptor(inode, buf, arg.offset, length);
 	default:
 		return -EINVAL;
 	}
diff --git a/include/uapi/linux/fsverity.h b/include/uapi/linux/fsverity.h
index 94003b153cb3d..41abc283dbccb 100644
--- a/include/uapi/linux/fsverity.h
+++ b/include/uapi/linux/fsverity.h
@@ -84,6 +84,7 @@ struct fsverity_formatted_digest {
 };
 
 #define FS_VERITY_METADATA_TYPE_MERKLE_TREE	1
+#define FS_VERITY_METADATA_TYPE_DESCRIPTOR	2
 
 struct fsverity_read_metadata_arg {
 	__u64 metadata_type;
-- 
2.30.0



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
