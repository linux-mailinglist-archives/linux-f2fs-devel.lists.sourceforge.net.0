Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id ADDE02B7763
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 18 Nov 2020 08:58:17 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1kfIM4-0007sV-ET; Wed, 18 Nov 2020 07:58:16 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <ebiggers@kernel.org>) id 1kfIM3-0007sJ-5c
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 18 Nov 2020 07:58:15 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=KXm9ulroIbvXFqcTcTAaehIHTITRkOmvPfk4Em1ZVq4=; b=Qp+hKw1HFhveHzLuK+ydDetEc7
 2XgO7O41/2I7PxmjgI1mz0vi9lU1KKzuaSmaypXN2VgYyqA08oQduLXhHNeu9FB7nTY9MabclfGnQ
 aXKFn3/xJdPwiSw2WGJxydJb0h1FooOM+xKudBW8l8ifR5FPxUOJGVbikZTIIF6mSF8Y=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=KXm9ulroIbvXFqcTcTAaehIHTITRkOmvPfk4Em1ZVq4=; b=AszNl+fEXQ4k0MTL/in89nv/P7
 oU9yoDivNIF1N/EqgxAG7Q6QkcNb/S9yXoX7luLU416q6sz0uK+0TdS9ebkYAFPyINoL6vMhZ07wl
 psVC3dL2P4X+qBgeLmYX+hRMWcf+JRDzpar//cbaqDVCO+zScNU3Iu9R9cDqkyzbqFfA=;
Received: from mail.kernel.org ([198.145.29.99])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1kfILh-00Cf9h-VE
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 18 Nov 2020 07:58:15 +0000
Received: from sol.attlocal.net
 (172-10-235-113.lightspeed.sntcca.sbcglobal.net [172.10.235.113])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 01736246B3;
 Wed, 18 Nov 2020 07:57:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1605686261;
 bh=D+Kyjii18F0waqpkVXSX3zdRISdLOoxWag/Zq/plDfg=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=wciZgUxRsT4BpUHM/xK7x+itYlwScHX5JDV4LPcCZe9NsPUlgYTrKiN3zfYXLus8i
 zSemoz4gBJxKD8n9MO4HB9NPQsGOvh+QR8JnCfwKXnzA/JeCOdF3AUjT4gsXrv0t/I
 UpASd0HyCEVENL+ByuFX13YPNCschjAJ91tiyRiw=
From: Eric Biggers <ebiggers@kernel.org>
To: linux-fscrypt@vger.kernel.org
Date: Tue, 17 Nov 2020 23:56:08 -0800
Message-Id: <20201118075609.120337-5-ebiggers@kernel.org>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20201118075609.120337-1-ebiggers@kernel.org>
References: <20201118075609.120337-1-ebiggers@kernel.org>
MIME-Version: 1.0
X-Spam-Score: 2.4 (++)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 0.0 SPF_NONE               SPF: sender does not publish an SPF Record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 2.5 SUSPICIOUS_RECIPS      Similar addresses in recipient list
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 0.0 TIME_LIMIT_EXCEEDED    Exceeded time limit / deadline
X-Headers-End: 1kfILh-00Cf9h-VE
Subject: [f2fs-dev] [PATCH 4/5] ubifs: prevent creating duplicate encrypted
 filenames
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
Cc: linux-fsdevel@vger.kernel.org, linux-ext4@vger.kernel.org,
 linux-mtd@lists.infradead.org, stable@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

From: Eric Biggers <ebiggers@google.com>

As described in "fscrypt: add fscrypt_is_nokey_name()", it's possible to
create a duplicate filename in an encrypted directory by creating a file
concurrently with adding the directory's encryption key.

Fix this bug on ubifs by rejecting no-key dentries in ubifs_create(),
ubifs_mkdir(), ubifs_mknod(), and ubifs_symlink().

Note that ubifs doesn't actually report the duplicate filenames from
readdir, but rather it seems to replace the original dentry with a new
one (which is still wrong, just a different effect from ext4).

On ubifs, this fixes xfstest generic/595 as well as the new xfstest I
wrote specifically for this bug.

Fixes: f4f61d2cc6d8 ("ubifs: Implement encrypted filenames")
Cc: stable@vger.kernel.org
Signed-off-by: Eric Biggers <ebiggers@google.com>
---
 fs/ubifs/dir.c | 17 +++++++++++++----
 1 file changed, 13 insertions(+), 4 deletions(-)

diff --git a/fs/ubifs/dir.c b/fs/ubifs/dir.c
index 155521e51ac5..08fde777c324 100644
--- a/fs/ubifs/dir.c
+++ b/fs/ubifs/dir.c
@@ -270,6 +270,15 @@ static struct dentry *ubifs_lookup(struct inode *dir, struct dentry *dentry,
 	return d_splice_alias(inode, dentry);
 }
 
+static int ubifs_prepare_create(struct inode *dir, struct dentry *dentry,
+				struct fscrypt_name *nm)
+{
+	if (fscrypt_is_nokey_name(dentry))
+		return -ENOKEY;
+
+	return fscrypt_setup_filename(dir, &dentry->d_name, 0, nm);
+}
+
 static int ubifs_create(struct inode *dir, struct dentry *dentry, umode_t mode,
 			bool excl)
 {
@@ -293,7 +302,7 @@ static int ubifs_create(struct inode *dir, struct dentry *dentry, umode_t mode,
 	if (err)
 		return err;
 
-	err = fscrypt_setup_filename(dir, &dentry->d_name, 0, &nm);
+	err = ubifs_prepare_create(dir, dentry, &nm);
 	if (err)
 		goto out_budg;
 
@@ -953,7 +962,7 @@ static int ubifs_mkdir(struct inode *dir, struct dentry *dentry, umode_t mode)
 	if (err)
 		return err;
 
-	err = fscrypt_setup_filename(dir, &dentry->d_name, 0, &nm);
+	err = ubifs_prepare_create(dir, dentry, &nm);
 	if (err)
 		goto out_budg;
 
@@ -1038,7 +1047,7 @@ static int ubifs_mknod(struct inode *dir, struct dentry *dentry,
 		return err;
 	}
 
-	err = fscrypt_setup_filename(dir, &dentry->d_name, 0, &nm);
+	err = ubifs_prepare_create(dir, dentry, &nm);
 	if (err) {
 		kfree(dev);
 		goto out_budg;
@@ -1122,7 +1131,7 @@ static int ubifs_symlink(struct inode *dir, struct dentry *dentry,
 	if (err)
 		return err;
 
-	err = fscrypt_setup_filename(dir, &dentry->d_name, 0, &nm);
+	err = ubifs_prepare_create(dir, dentry, &nm);
 	if (err)
 		goto out_budg;
 
-- 
2.29.2



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
