Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 65F5911785F
	for <lists+linux-f2fs-devel@lfdr.de>; Mon,  9 Dec 2019 22:24:40 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1ieQWD-0007Fq-2d; Mon, 09 Dec 2019 21:24:37 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <ebiggers@kernel.org>) id 1ieQWA-0007Fh-1C
 for linux-f2fs-devel@lists.sourceforge.net; Mon, 09 Dec 2019 21:24:34 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=vdLjYOqhnTvpNWMxLNkdLeuaXOfs+lUrzGR2NgO512U=; b=G0YIXXn2qj3ku9kBN2k1Kyjcsm
 eVSfW//mxegO03i817b6YFf0Xq9WiONHFlwVhdFmKgMbXRSC4pZ3zR1ltsFMsPhRvsAhpxE2rL4IW
 SoZGGagjhaF3CVklSW/ebhXaTCe8C/0YPY6YvFl69sAKsI5Eos9pYJGluyXYQGIpfQ7Y=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:Message-Id:Date:Subject:Cc:To:From
 :Sender:Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=vdLjYOqhnTvpNWMxLNkdLeuaXOfs+lUrzGR2NgO512U=; b=R
 Hq/ghzUT3VMc6QLc71L2b747iW24cjiaV0B4Bby9yZBfLJ8DDVsrPXq4VI9RS2a3UHZpmHmEaLIWl
 PXHKqCChNKqMDNS3EBNWXRTN3D+xOUqYRfobOv0yG8zcz/eYCyZ5M9sbsdZo8HUdQY+WmR7iULdih
 to3pE2+ImdzBExqA=;
Received: from mail.kernel.org ([198.145.29.99])
 by sfi-mx-3.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1ieQW8-00Feoh-2L
 for linux-f2fs-devel@lists.sourceforge.net; Mon, 09 Dec 2019 21:24:33 +0000
Received: from ebiggers-linuxstation.mtv.corp.google.com (unknown
 [104.132.1.77])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 4C3EC206E0;
 Mon,  9 Dec 2019 21:24:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1575926661;
 bh=AuIH2TuNaKEm6dBcgepjEUobcygYmoPNcrv739g/VaE=;
 h=From:To:Cc:Subject:Date:From;
 b=J7m6m+s8RzaSoJKCdliMpJXYf99LrPNVjrWWU2WJDaJ5oXTnD7gq/qxP7Nnkl7bvY
 9PNeNoBVhuNoLzJNODdkdHgY3KTved7XvffkkEBncbYyJ+pfRxQYH9P6RSnEtkLUng
 YE4h6d65aZU+lFiYDvliDOzoPEfYiBHfVmDGLMdk=
From: Eric Biggers <ebiggers@kernel.org>
To: linux-fscrypt@vger.kernel.org
Date: Mon,  9 Dec 2019 13:23:48 -0800
Message-Id: <20191209212348.243331-1-ebiggers@kernel.org>
X-Mailer: git-send-email 2.24.0.393.g34dc348eaf-goog
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
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - Whitelisted High sender
 -0.2 AWL AWL: Adjusted score from AWL reputation of From: address
X-Headers-End: 1ieQW8-00Feoh-2L
Subject: [f2fs-dev] [PATCH] fscrypt: don't check for ENOKEY from
 fscrypt_get_encryption_info()
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
Cc: linux-ext4@vger.kernel.org, linux-mtd@lists.infradead.org,
 linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

From: Eric Biggers <ebiggers@google.com>

fscrypt_get_encryption_info() returns 0 if the encryption key is
unavailable; it never returns ENOKEY.  So remove checks for ENOKEY.

Signed-off-by: Eric Biggers <ebiggers@google.com>
---
 fs/ext4/dir.c  | 2 +-
 fs/f2fs/dir.c  | 2 +-
 fs/ubifs/dir.c | 2 +-
 3 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/fs/ext4/dir.c b/fs/ext4/dir.c
index 9fdd2b269d617..4c9d3ff394a5d 100644
--- a/fs/ext4/dir.c
+++ b/fs/ext4/dir.c
@@ -116,7 +116,7 @@ static int ext4_readdir(struct file *file, struct dir_context *ctx)
 
 	if (IS_ENCRYPTED(inode)) {
 		err = fscrypt_get_encryption_info(inode);
-		if (err && err != -ENOKEY)
+		if (err)
 			return err;
 	}
 
diff --git a/fs/f2fs/dir.c b/fs/f2fs/dir.c
index c967cacf979ef..d9ad842945df5 100644
--- a/fs/f2fs/dir.c
+++ b/fs/f2fs/dir.c
@@ -987,7 +987,7 @@ static int f2fs_readdir(struct file *file, struct dir_context *ctx)
 
 	if (IS_ENCRYPTED(inode)) {
 		err = fscrypt_get_encryption_info(inode);
-		if (err && err != -ENOKEY)
+		if (err)
 			goto out;
 
 		err = fscrypt_fname_alloc_buffer(inode, F2FS_NAME_LEN, &fstr);
diff --git a/fs/ubifs/dir.c b/fs/ubifs/dir.c
index 0b98e3c8b461d..acc4f942d25b6 100644
--- a/fs/ubifs/dir.c
+++ b/fs/ubifs/dir.c
@@ -512,7 +512,7 @@ static int ubifs_readdir(struct file *file, struct dir_context *ctx)
 
 	if (encrypted) {
 		err = fscrypt_get_encryption_info(dir);
-		if (err && err != -ENOKEY)
+		if (err)
 			return err;
 
 		err = fscrypt_fname_alloc_buffer(dir, UBIFS_MAX_NLEN, &fstr);
-- 
2.24.0.393.g34dc348eaf-goog



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
