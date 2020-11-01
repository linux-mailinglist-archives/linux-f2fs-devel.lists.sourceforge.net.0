Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 738AE2A1D5F
	for <lists+linux-f2fs-devel@lfdr.de>; Sun,  1 Nov 2020 11:38:52 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1kZAl9-0007cj-1E; Sun, 01 Nov 2020 10:38:51 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <gregkh@linuxfoundation.org>) id 1kZAl5-0007c4-TF
 for linux-f2fs-devel@lists.sourceforge.net; Sun, 01 Nov 2020 10:38:47 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:MIME-Version
 :Message-ID:In-Reply-To:Date:From:Cc:To:Subject:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=y/+j07ACkR2aDeIa1w5hCJ4VHeVNt9O/NJCzJ1Q1J+w=; b=DkluKCzLwz5TpcThVUOOCZTucC
 ZCmwyrvf2QikkajrKMQx9ey2DkIPRqo7WiPkYSCvW8TWerQlwj7JO87x/oJwufgG0QDyIkmBY2y/e
 N6l/5WUfal0jmmWlrnp36P5iHzPmOVcVKauKivdQiHma2Mxm6wqUM/Dkq3Uz81xdtZIM=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:Message-ID:
 In-Reply-To:Date:From:Cc:To:Subject:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=y/+j07ACkR2aDeIa1w5hCJ4VHeVNt9O/NJCzJ1Q1J+w=; b=XWCS+F+nKbXdTxt6787dkg0L3J
 0zB/eeik5ZSYa8sDUl5phvse+2FaOor2R2jqc9KjjQ2ERc/JFDDX8eluL/pPxMl96QZCQvC8JjMNY
 pnR0ElLi1KLbDX7MonTSrnvsC0zBD6ALNjVQucda/M8HuQlXcfsxGB7GohfBdVJ4K4dg=;
Received: from mail.kernel.org ([198.145.29.99])
 by sfi-mx-3.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1kZAkz-00FAYT-0s
 for linux-f2fs-devel@lists.sourceforge.net; Sun, 01 Nov 2020 10:38:47 +0000
Received: from localhost (83-86-74-64.cable.dynamic.v4.ziggo.nl [83.86.74.64])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id AE9B32084C;
 Sun,  1 Nov 2020 10:38:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1604227113;
 bh=GurUq4W2huofrU6jLCvJXLA6jIU5fQdCFuhJS993u6E=;
 h=Subject:To:Cc:From:Date:In-Reply-To:From;
 b=2lWiw1mXJ0SoS9dgV9xDlVrZ8eDEvpwXalYswfzWJXPSY0p3zwVK0W0ZP9FmrPdLD
 xo0RocQoOywk9q7FfV2I7+/NtOB/5NE/MKQXCMv+K8/zekAlTs5uMM0S3+f4H0KulY
 09NvbtBVE67vUyWYTIrjAuLs+Fd36lNMCPphN9L8=
To: ebiggers@google.com, ebiggers@kernel.org, gregkh@linuxfoundation.org,
 linux-f2fs-devel@lists.sourceforge.net, linux-mtd@lists.infradead.org,
 tytso@mit.edu
From: <gregkh@linuxfoundation.org>
Date: Sun, 01 Nov 2020 11:39:03 +0100
In-Reply-To: <20201031220553.1085782-5-ebiggers@kernel.org>
Message-ID: <16042271439860@kroah.com>
MIME-Version: 1.0
X-stable: commit
X-Patchwork-Hint: ignore 
X-Spam-Score: 0.0 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 0.0 URIBL_BLOCKED ADMINISTRATOR NOTICE: The query to URIBL was blocked.
 See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URIs: infradead.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1kZAkz-00FAYT-0s
Subject: [f2fs-dev] Patch "fscrypt: only set dentry_operations on ciphertext
 dentries" has been added to the 4.19-stable tree
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
Cc: stable-commits@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net


This is a note to let you know that I've just added the patch titled

    fscrypt: only set dentry_operations on ciphertext dentries

to the 4.19-stable tree which can be found at:
    http://www.kernel.org/git/?p=linux/kernel/git/stable/stable-queue.git;a=summary

The filename of the patch is:
     fscrypt-only-set-dentry_operations-on-ciphertext-dentries.patch
and it can be found in the queue-4.19 subdirectory.

If you, or anyone else, feels it should not be added to the stable tree,
please let <stable@vger.kernel.org> know about it.


From foo@baz Sun Nov  1 11:35:18 AM CET 2020
From: Eric Biggers <ebiggers@kernel.org>
Date: Sat, 31 Oct 2020 15:05:52 -0700
Subject: fscrypt: only set dentry_operations on ciphertext dentries
To: stable@vger.kernel.org
Cc: linux-fscrypt@vger.kernel.org, linux-ext4@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net, linux-mtd@lists.infradead.org, Theodore Ts'o <tytso@mit.edu>
Message-ID: <20201031220553.1085782-5-ebiggers@kernel.org>

From: Eric Biggers <ebiggers@google.com>

commit d456a33f041af4b54f3ce495a86d00c246165032 upstream.

Plaintext dentries are always valid, so only set fscrypt_d_ops on
ciphertext dentries.

Besides marginally improved performance, this allows overlayfs to use an
fscrypt-encrypted upperdir, provided that all the following are true:

    (1) The fscrypt encryption key is placed in the keyring before
	mounting overlayfs, and remains while the overlayfs is mounted.

    (2) The overlayfs workdir uses the same encryption policy.

    (3) No dentries for the ciphertext names of subdirectories have been
	created in the upperdir or workdir yet.  (Since otherwise
	d_splice_alias() will reuse the old dentry with ->d_op set.)

One potential use case is using an ephemeral encryption key to encrypt
all files created or changed by a container, so that they can be
securely erased ("crypto-shredded") after the container stops.

Signed-off-by: Eric Biggers <ebiggers@google.com>
Signed-off-by: Theodore Ts'o <tytso@mit.edu>
Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
---
 fs/crypto/hooks.c |    3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

--- a/fs/crypto/hooks.c
+++ b/fs/crypto/hooks.c
@@ -115,9 +115,8 @@ int __fscrypt_prepare_lookup(struct inod
 		spin_lock(&dentry->d_lock);
 		dentry->d_flags |= DCACHE_ENCRYPTED_NAME;
 		spin_unlock(&dentry->d_lock);
+		d_set_d_op(dentry, &fscrypt_d_ops);
 	}
-
-	d_set_d_op(dentry, &fscrypt_d_ops);
 	return 0;
 }
 EXPORT_SYMBOL_GPL(__fscrypt_prepare_lookup);


Patches currently in stable-queue which might be from ebiggers@kernel.org are

queue-4.19/fscrypt-only-set-dentry_operations-on-ciphertext-dentries.patch
queue-4.19/fscrypt-clean-up-and-improve-dentry-revalidation.patch
queue-4.19/fscrypt-fix-race-allowing-rename-and-link-of-ciphertext-dentries.patch
queue-4.19/fs-fscrypt-clear-dcache_encrypted_name-when-unaliasing-directory.patch
queue-4.19/fscrypt-fix-race-where-lookup-marks-plaintext-dentry-as-ciphertext.patch


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
