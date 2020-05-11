Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 048461CE3EE
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 11 May 2020 21:22:32 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1jYE0U-00031x-L7; Mon, 11 May 2020 19:22:30 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <ebiggers@kernel.org>) id 1jYE0S-00031o-NW
 for linux-f2fs-devel@lists.sourceforge.net; Mon, 11 May 2020 19:22:28 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=xQpjt4jMJRHXmSReAE+bPZoRR79hWw3vRHzLPxN+9NY=; b=CWR6gMrWZSnzRKO1aU+BpbWO1+
 Fu1b8ed+0clVhV+hpooVPAQV/m0MjSoDkTuahN7ymQS49aw8JIdU+yInQ2fQ8FXez9cz0h0S5M2b+
 s5AgZDG8H9k7z+w/JT/sYzwAKfaEMVyMenYmdF3bomIHosUFGNuECT+TcfKW4iDIQTW8=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=xQpjt4jMJRHXmSReAE+bPZoRR79hWw3vRHzLPxN+9NY=; b=Fc0wykbPeXuauThbE1LPwerIxP
 v+KjqeQiztOu7ZM15ktf50FnjG6cru7imadQpr71mVB0IPevjxZmBxIlJFGJKqhhedfC11w2YZLVR
 peeHSstY6lu7uYxGeY05Ai6SM5GJ5s1gvxB8NEcVDMyfkJ9f+nmD8PApYzNOhnhlhLW0=;
Received: from mail.kernel.org ([198.145.29.99])
 by sfi-mx-3.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1jYE0R-001nE0-Go
 for linux-f2fs-devel@lists.sourceforge.net; Mon, 11 May 2020 19:22:28 +0000
Received: from sol.hsd1.ca.comcast.net (c-107-3-166-239.hsd1.ca.comcast.net
 [107.3.166.239])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id CF2A52075E;
 Mon, 11 May 2020 19:22:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1589224942;
 bh=d0mhTf9ltsz6952kdu0zLSAPYKO76veQBl8NydPGJB8=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=dLxJoMny0QN72lRYXNcFmWIIOcbgMyDAbiGZHE09IFd/erBpDY4JaB/ORztvXyk2K
 pbZY1lTGqEJCotE/vj/aKuIxsEPv6rYdN0aDD5Wl+VVPDDmMS3kpP+Y2lHoz4uL2fA
 Dx/Owh3QovbPRpljw8aLLS9I84ngHD0TwojQBnJs=
From: Eric Biggers <ebiggers@kernel.org>
To: linux-fscrypt@vger.kernel.org
Date: Mon, 11 May 2020 12:21:17 -0700
Message-Id: <20200511192118.71427-2-ebiggers@kernel.org>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200511192118.71427-1-ebiggers@kernel.org>
References: <20200511192118.71427-1-ebiggers@kernel.org>
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
 -0.2 DKIMWL_WL_HIGH         DKIMwl.org - Whitelisted High sender
 -0.1 AWL AWL: Adjusted score from AWL reputation of From: address
X-Headers-End: 1jYE0R-001nE0-Go
Subject: [f2fs-dev] [PATCH 1/2] fs-verity: fix all kerneldoc warnings
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
Cc: linux-ext4@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

From: Eric Biggers <ebiggers@google.com>

Fix all kerneldoc warnings in fs/verity/ and include/linux/fsverity.h.
Most of these were due to missing documentation for function parameters.

Detected with:

    scripts/kernel-doc -v -none fs/verity/*.{c,h} include/linux/fsverity.h

This cleanup makes it possible to check new patches for kerneldoc
warnings without having to filter out all the existing ones.

Signed-off-by: Eric Biggers <ebiggers@google.com>
---
 fs/verity/enable.c           | 2 ++
 fs/verity/fsverity_private.h | 2 +-
 fs/verity/measure.c          | 2 ++
 fs/verity/open.c             | 1 +
 fs/verity/signature.c        | 3 +++
 fs/verity/verify.c           | 3 +++
 include/linux/fsverity.h     | 3 +++
 7 files changed, 15 insertions(+), 1 deletion(-)

diff --git a/fs/verity/enable.c b/fs/verity/enable.c
index d98bea308fd7f1..5ab3bbec810873 100644
--- a/fs/verity/enable.c
+++ b/fs/verity/enable.c
@@ -329,6 +329,8 @@ static int enable_verity(struct file *filp,
 
 /**
  * fsverity_ioctl_enable() - enable verity on a file
+ * @filp: file to enable verity on
+ * @uarg: user pointer to fsverity_enable_arg
  *
  * Enable fs-verity on a file.  See the "FS_IOC_ENABLE_VERITY" section of
  * Documentation/filesystems/fsverity.rst for the documentation.
diff --git a/fs/verity/fsverity_private.h b/fs/verity/fsverity_private.h
index 74768cf539daf5..8788f3a5035c2a 100644
--- a/fs/verity/fsverity_private.h
+++ b/fs/verity/fsverity_private.h
@@ -61,7 +61,7 @@ struct merkle_tree_params {
 	u64 level_start[FS_VERITY_MAX_LEVELS];
 };
 
-/**
+/*
  * fsverity_info - cached verity metadata for an inode
  *
  * When a verity file is first opened, an instance of this struct is allocated
diff --git a/fs/verity/measure.c b/fs/verity/measure.c
index 05049b68c74553..df409a5682edf9 100644
--- a/fs/verity/measure.c
+++ b/fs/verity/measure.c
@@ -11,6 +11,8 @@
 
 /**
  * fsverity_ioctl_measure() - get a verity file's measurement
+ * @filp: file to get measurement of
+ * @_uarg: user pointer to fsverity_digest
  *
  * Retrieve the file measurement that the kernel is enforcing for reads from a
  * verity file.  See the "FS_IOC_MEASURE_VERITY" section of
diff --git a/fs/verity/open.c b/fs/verity/open.c
index c5fe6948e26290..d007db0c9304d1 100644
--- a/fs/verity/open.c
+++ b/fs/verity/open.c
@@ -330,6 +330,7 @@ EXPORT_SYMBOL_GPL(fsverity_prepare_setattr);
 
 /**
  * fsverity_cleanup_inode() - free the inode's verity info, if present
+ * @inode: an inode being evicted
  *
  * Filesystems must call this on inode eviction to free ->i_verity_info.
  */
diff --git a/fs/verity/signature.c b/fs/verity/signature.c
index c8b255232de543..b14ed96387ece0 100644
--- a/fs/verity/signature.c
+++ b/fs/verity/signature.c
@@ -28,6 +28,9 @@ static struct key *fsverity_keyring;
 
 /**
  * fsverity_verify_signature() - check a verity file's signature
+ * @vi: the file's fsverity_info
+ * @desc: the file's fsverity_descriptor
+ * @desc_size: size of @desc
  *
  * If the file's fs-verity descriptor includes a signature of the file
  * measurement, verify it against the certificates in the fs-verity keyring.
diff --git a/fs/verity/verify.c b/fs/verity/verify.c
index e0cb62da38644b..a8b68c6f663d12 100644
--- a/fs/verity/verify.c
+++ b/fs/verity/verify.c
@@ -179,6 +179,7 @@ static bool verify_page(struct inode *inode, const struct fsverity_info *vi,
 
 /**
  * fsverity_verify_page() - verify a data page
+ * @page: the page to verity
  *
  * Verify a page that has just been read from a verity file.  The page must be a
  * pagecache page that is still locked and not yet uptodate.
@@ -206,6 +207,7 @@ EXPORT_SYMBOL_GPL(fsverity_verify_page);
 #ifdef CONFIG_BLOCK
 /**
  * fsverity_verify_bio() - verify a 'read' bio that has just completed
+ * @bio: the bio to verify
  *
  * Verify a set of pages that have just been read from a verity file.  The pages
  * must be pagecache pages that are still locked and not yet uptodate.  Pages
@@ -264,6 +266,7 @@ EXPORT_SYMBOL_GPL(fsverity_verify_bio);
 
 /**
  * fsverity_enqueue_verify_work() - enqueue work on the fs-verity workqueue
+ * @work: the work to enqueue
  *
  * Enqueue verification work for asynchronous processing.
  */
diff --git a/include/linux/fsverity.h b/include/linux/fsverity.h
index ecc604e61d61b9..5ac30198e03201 100644
--- a/include/linux/fsverity.h
+++ b/include/linux/fsverity.h
@@ -200,6 +200,7 @@ static inline void fsverity_enqueue_verify_work(struct work_struct *work)
 
 /**
  * fsverity_active() - do reads from the inode need to go through fs-verity?
+ * @inode: inode to check
  *
  * This checks whether ->i_verity_info has been set.
  *
@@ -207,6 +208,8 @@ static inline void fsverity_enqueue_verify_work(struct work_struct *work)
  * be verified or not.  Don't use IS_VERITY() for this purpose; it's subject to
  * a race condition where the file is being read concurrently with
  * FS_IOC_ENABLE_VERITY completing.  (S_VERITY is set before ->i_verity_info.)
+ *
+ * Return: true if reads need to go through fs-verity, otherwise false
  */
 static inline bool fsverity_active(const struct inode *inode)
 {
-- 
2.26.2



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
