Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C832AF85B8
	for <lists+linux-f2fs-devel@lfdr.de>; Fri,  4 Jul 2025 04:44:43 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Subject:MIME-Version:References:In-Reply-To:Date:To:From:Message-ID:Sender:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=w2z/ZkGBsQvl0KlZfbwmOqVkJaNfad7n4TaDlTBfZPw=; b=TZZk7C9zthzb/l1d3JysbxmcXs
	Olwg//UKKL6B09FIT4dliVgbFMSNIwmgxoMYyTvd6/VMubRPKc+YjmG4ZbDTnAScV+of4eD3DyuVH
	WOD29kdtKnpZXXx8bX3o8OY/SfBb4VqfoPHmdTeRrAvix+UPX7UzqpYfYCBTJ1IsfJ/c=;
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1uXWPW-0005aM-FN;
	Fri, 04 Jul 2025 02:44:22 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <ywen.chen@foxmail.com>) id 1uXWPU-0005aD-M3
 for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 04 Jul 2025 02:44:21 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Date:Subject:Cc:To:From:Message-ID:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=60C9crPrlso6i63AWM7qFupPHsU4T1ZcqF61uHig4r0=; b=IgRt9992crFC1GedXSaQIIJl3v
 VE7PluCCm1JiiUIAdlH5hlWyGuFlmGmc4jK45dsqhVdxN6EvWbig7wIudRVn/cBn1fci7BU/YNpSx
 DZJ0IZk2ksTWm2zkxb+I5CW9EYXvnzIE+zNGs0oC55io/oqKna0yeYqxYMJgzn1p26UM=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Date:
 Subject:Cc:To:From:Message-ID:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=60C9crPrlso6i63AWM7qFupPHsU4T1ZcqF61uHig4r0=; b=aHXWxMT0SqwUTyBbT+9I3w6nBN
 R9SJZEFRpFmth8OtuTzHG9ffnxWesHV4jzzJZ1noH4BNLme7vclYg7Wo2HaDk9/q00KAmpRJsrbL+
 N+CpdtGOx0E1T7G/bmf1X1pStowuukSNWUUeR4Rc66qjKCXvpUCKWaKSoWzaYovgowaQ=;
Received: from xmbghk7.mail.qq.com ([43.163.128.47])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1uXWPT-0008WC-Ic for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 04 Jul 2025 02:44:20 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foxmail.com;
 s=s201512; t=1751597052;
 bh=60C9crPrlso6i63AWM7qFupPHsU4T1ZcqF61uHig4r0=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References;
 b=s+rZaqLW9aMeHUtrZUFMo/lvomsT0TsfeLVcOsBsp6RPA+SU8JsVVsMo4HGPd6Xtl
 NiU9PAInL1ECgQJyiJVkiwDP3g/ciBLOcajqiLEj03eZXHcyJRZGIxOzDK87Nj4ExY
 zttXrx/2+GLTMmsexOku596DPDK+lf9jcoflbnX0=
Received: from meizu-Precision-3660.meizu.com ([112.91.84.73])
 by newxmesmtplogicsvrsza29-0.qq.com (NewEsmtp) with SMTP
 id AFA99AEB; Fri, 04 Jul 2025 10:43:58 +0800
X-QQ-mid: xmsmtpt1751597038tlheim36w
Message-ID: <tencent_82716EB4F15F579C738C3CC3AFE62E822207@qq.com>
X-QQ-XMAILINFO: MeRnHSrEJzCrXBD8vlUlbdOjZ64QGNMuOTs64HRplnflQ2Xw47I1asd051G1Fa
 HkAZe+pG5Sbjn05hu2LVcp+KFz4uvh3/PquiaTE+gcX4JARoZoOB0OoJWMJTOolc6FOfBkx6n7XI
 omAbVYjDagqD1/Gy1Ln/NNP+1N4UNXOc7/RsczR0Ii36+GXeRzMFw9qVFbxrIdh6h/6H4uI6wQsx
 uoQmrzd/UY1LgUVPtHzLNd4V61Zb+11WUYcyfHsa1xFHTeTFvJ/uOjBSZ+4rub0Egmn4ZEpkXw0b
 kzd67z5cntmZLn8wDvd3PtusABNFGV7Ba5vl1JcONR5N0HiqXBakTP8E17XujVxLxMn5QbqlHA7h
 gFxrgWvnadL8Qz3UEv9J7oMglBfHDGEr2MgdUbdv+wPEO28zZPhszwtvpi4H5bsCzViJuzWYC4XQ
 VHiW+RxZkEanaotTY2vkMHp6EuqjTl6ygz7QD58vizIvcIgEhobCM5FuRaz/YrfiuLgMYiXx+jlR
 6rK6TfCET9UKwxXsRPKe29bT0qD9FjmVi+3lSXoTR4i4rG7SNJdut6xPrY/6wfYNt1lrZ6kckqn7
 Dqps4jlBb7Rtw4OeRRM4AfX28hUeCCRDcRQIrW/dFxoNmqLGc6DyDyq7Av/4wcBUKhx4U96NlGXt
 CD4jcM2phCSMvg2sG79ynyCuT5zaHo1RBxHEHfzoO9UoJhbqnzbBpPf5jzLsrd7OZ7K2ge0hMQF/
 DadpAYf7N1DyILLPIOxnxfdDRsv1vwjMo3GsjnBaaueRkVbPMsN1UgmspkATWLRFPOGg7E0dR2eN
 HLBL690GC+96ltRvV0eJijs+uKtoFtMXsg3i+p6nwxhOUajs1LX9Ij6ffL3aDTWKI7iW3ik/v7AV
 WfNdSxbou1CzZ4Dj9b5N2hNyTSpexQ1s+juAg4Lf/JwpxyFNcCtDheDAFlY0hcQlvZxEbcYNoV2f
 +IwGVD0K1UrkN0HrkvYzsspuJb6R6euNA01rbt3nxe8aq6uGJf/7ZEC97TBzTopAkXQ1j8GvCA9H
 Jon7WENY+5wnQJkfGHVv7K9bjLh3f6LSWRl86vJfWDgod5j3EfaYU7QRvWL6H7iY8bSIu/A0wm0Q
 LyzxQylUT5qRMypuU=
X-QQ-XMRINFO: NI4Ajvh11aEj8Xl/2s1/T8w=
From: Yuwen Chen <ywen.chen@foxmail.com>
To: hch@infradead.org
Date: Fri,  4 Jul 2025 10:43:57 +0800
X-OQ-MSGID: <20250704024357.4078753-1-ywen.chen@foxmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <aGZFtmIxHDLKL6mc@infradead.org>
References: <aGZFtmIxHDLKL6mc@infradead.org>
MIME-Version: 1.0
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-1.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  During path traversal, the generic_ci_match function may be
 called multiple times. The number of memory allocations and releases in it
 accounts for a relatively high proportion in the flamegraph. This [...] 
 Content analysis details:   (-0.2 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 0.0 FREEMAIL_FROM Sender email is commonly abused enduser mail provider
 [ywen.chen(at)foxmail.com]
X-Headers-End: 1uXWPT-0008WC-Ic
Subject: [f2fs-dev] [PATCH v3 1/2] libfs: reduce the number of memory
 allocations in generic_ci_match
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
Cc: brauner@kernel.org, ywen.chen@foxmail.com, tytso@mit.edu,
 linux-kernel@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net,
 adilger.kernel@dilger.ca, viro@zeniv.linux.org.uk,
 linux-fsdevel@vger.kernel.org, jaegeuk@kernel.org, linux-ext4@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

During path traversal, the generic_ci_match function may be called
multiple times. The number of memory allocations and releases
in it accounts for a relatively high proportion in the flamegraph.
This patch significantly reduces the number of memory allocations
in generic_ci_match through pre - allocation.

Signed-off-by: Yuwen Chen <ywen.chen@foxmail.com>
---
 fs/ext4/namei.c    |  2 +-
 fs/f2fs/dir.c      |  2 +-
 fs/libfs.c         | 33 ++++++++++++++++++++++++++++++---
 include/linux/fs.h |  8 +++++++-
 4 files changed, 39 insertions(+), 6 deletions(-)

diff --git a/fs/ext4/namei.c b/fs/ext4/namei.c
index a178ac2294895..f235693bd71aa 100644
--- a/fs/ext4/namei.c
+++ b/fs/ext4/namei.c
@@ -1443,7 +1443,7 @@ static bool ext4_match(struct inode *parent,
 
 		return generic_ci_match(parent, fname->usr_fname,
 					&fname->cf_name, de->name,
-					de->name_len) > 0;
+					de->name_len, NULL) > 0;
 	}
 #endif
 
diff --git a/fs/f2fs/dir.c b/fs/f2fs/dir.c
index c36b3b22bfffd..4c6611fbd9574 100644
--- a/fs/f2fs/dir.c
+++ b/fs/f2fs/dir.c
@@ -197,7 +197,7 @@ static inline int f2fs_match_name(const struct inode *dir,
 	if (fname->cf_name.name)
 		return generic_ci_match(dir, fname->usr_fname,
 					&fname->cf_name,
-					de_name, de_name_len);
+					de_name, de_name_len, NULL);
 
 #endif
 	f.usr_fname = fname->usr_fname;
diff --git a/fs/libfs.c b/fs/libfs.c
index 9ea0ecc325a81..d2a6b2a4fe11c 100644
--- a/fs/libfs.c
+++ b/fs/libfs.c
@@ -1863,6 +1863,26 @@ static const struct dentry_operations generic_ci_dentry_ops = {
 #endif
 };
 
+#define DECRYPTED_NAME_PREALLOC_MIN_LEN 64
+static inline char *decrypted_name_prealloc_resize(
+		struct decrypted_name_prealloc *prealloc,
+		size_t wantlen)
+{
+	char *retbuf = NULL;
+
+	if (prealloc->name && wantlen >= prealloc->namelen)
+		return prealloc->name;
+
+	retbuf = kmalloc(wantlen + DECRYPTED_NAME_PREALLOC_MIN_LEN, GFP_KERNEL);
+	if (!retbuf)
+		return NULL;
+
+	kfree(prealloc->name);
+	prealloc->name = retbuf;
+	prealloc->namelen = wantlen + DECRYPTED_NAME_PREALLOC_MIN_LEN;
+	return retbuf;
+}
+
 /**
  * generic_ci_match() - Match a name (case-insensitively) with a dirent.
  * This is a filesystem helper for comparison with directory entries.
@@ -1873,6 +1893,7 @@ static const struct dentry_operations generic_ci_dentry_ops = {
  * @folded_name: Optional pre-folded name under lookup
  * @de_name: Dirent name.
  * @de_name_len: dirent name length.
+ * @prealloc: decrypted name memory buffer
  *
  * Test whether a case-insensitive directory entry matches the filename
  * being searched.  If @folded_name is provided, it is used instead of
@@ -1884,7 +1905,8 @@ static const struct dentry_operations generic_ci_dentry_ops = {
 int generic_ci_match(const struct inode *parent,
 		     const struct qstr *name,
 		     const struct qstr *folded_name,
-		     const u8 *de_name, u32 de_name_len)
+		     const u8 *de_name, u32 de_name_len,
+		     struct decrypted_name_prealloc *prealloc)
 {
 	const struct super_block *sb = parent->i_sb;
 	const struct unicode_map *um = sb->s_encoding;
@@ -1899,7 +1921,11 @@ int generic_ci_match(const struct inode *parent,
 		if (WARN_ON_ONCE(!fscrypt_has_encryption_key(parent)))
 			return -EINVAL;
 
-		decrypted_name.name = kmalloc(de_name_len, GFP_KERNEL);
+		if (!prealloc)
+			decrypted_name.name = kmalloc(de_name_len, GFP_KERNEL);
+		else
+			decrypted_name.name = decrypted_name_prealloc_resize(
+					prealloc, de_name_len);
 		if (!decrypted_name.name)
 			return -ENOMEM;
 		res = fscrypt_fname_disk_to_usr(parent, 0, 0, &encrypted_name,
@@ -1928,7 +1954,8 @@ int generic_ci_match(const struct inode *parent,
 		res = utf8_strncasecmp(um, name, &dirent);
 
 out:
-	kfree(decrypted_name.name);
+	if (!prealloc)
+		kfree(decrypted_name.name);
 	if (res < 0 && sb_has_strict_encoding(sb)) {
 		pr_err_ratelimited("Directory contains filename that is invalid UTF-8");
 		return 0;
diff --git a/include/linux/fs.h b/include/linux/fs.h
index 4ec77da65f144..65307c8c11485 100644
--- a/include/linux/fs.h
+++ b/include/linux/fs.h
@@ -3651,10 +3651,16 @@ extern int generic_file_fsync(struct file *, loff_t, loff_t, int);
 extern int generic_check_addressable(unsigned, u64);
 
 extern void generic_set_sb_d_ops(struct super_block *sb);
+
+struct decrypted_name_prealloc {
+	char *name;
+	size_t namelen;
+};
 extern int generic_ci_match(const struct inode *parent,
 			    const struct qstr *name,
 			    const struct qstr *folded_name,
-			    const u8 *de_name, u32 de_name_len);
+			    const u8 *de_name, u32 de_name_len,
+			    struct decrypted_name_prealloc *prealloc);
 
 #if IS_ENABLED(CONFIG_UNICODE)
 int generic_ci_d_hash(const struct dentry *dentry, struct qstr *str);
-- 
2.34.1



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
