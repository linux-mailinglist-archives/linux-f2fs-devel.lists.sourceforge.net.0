Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 8792B11C6AA
	for <lists+linux-f2fs-devel@lfdr.de>; Thu, 12 Dec 2019 08:51:59 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1ifJGK-00009r-Ip; Thu, 12 Dec 2019 07:51:52 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <yangtiezhu@loongson.cn>) id 1ifJGJ-00009k-5U
 for linux-f2fs-devel@lists.sourceforge.net; Thu, 12 Dec 2019 07:51:51 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
 MIME-Version:Content-Type:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=xS184QHnjyKZKIsFcV/e14qMvmMtTfTh8wMl0dg8lE0=; b=LsHg1iF0C8kNxwWUUTTV0cxXHU
 MzI+NzdKhnbFJMvcDiDp7YRJ7XbKOIxUEyYnYsZlq9kOlZSu+SGoWFvuoB7sm33T9SdQlfckWyMd6
 EpVSKop+zGjIDpvQ2z9hzKjD6/N+nHTJEOv0t7hyQKWTxXbMQNteU+GZaMEVyCJuqx/0=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:MIME-Version:
 Content-Type:Content-Transfer-Encoding:Content-ID:Content-Description:
 Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
 In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=xS184QHnjyKZKIsFcV/e14qMvmMtTfTh8wMl0dg8lE0=; b=BzXoOEY7tHeKf0iEFADn6+TF81
 el7BXHMgGmuWYvtXXm1EpFUlGDP3/bopkj3vHa0OKTBPR7OWicBQohVEKVVEIYMdtKxMOesqXycnz
 a4dUFDzN0rRYQfTP9W9CYlOgaqc3MHsCwejAXIwV18u5T4enogFMmvLc4nWFUkanSjxk=;
Received: from [114.242.206.163] (helo=loongson.cn)
 by sfi-mx-4.v28.lw.sourceforge.com with esmtp (Exim 4.92.2)
 id 1ifJG9-002Rgw-QK
 for linux-f2fs-devel@lists.sourceforge.net; Thu, 12 Dec 2019 07:51:51 +0000
Received: from linux.localdomain (unknown [123.138.236.242])
 by mail.loongson.cn (Coremail) with SMTP id AQAAf9DxT9N48fFduPEJAA--.13S2;
 Thu, 12 Dec 2019 15:51:20 +0800 (CST)
From: Tiezhu Yang <yangtiezhu@loongson.cn>
To: Alexander Viro <viro@zeniv.linux.org.uk>,
 "Theodore Y. Ts'o" <tytso@mit.edu>, Jaegeuk Kim <jaegeuk@kernel.org>,
 Chao Yu <yuchao0@huawei.com>, Eric Biggers <ebiggers@kernel.org>,
 Tyler Hicks <tyhicks@canonical.com>
Date: Thu, 12 Dec 2019 15:51:04 +0800
Message-Id: <1576137064-31249-1-git-send-email-yangtiezhu@loongson.cn>
X-Mailer: git-send-email 2.1.0
X-CM-TRANSID: AQAAf9DxT9N48fFduPEJAA--.13S2
X-Coremail-Antispam: 1UD129KBjvJXoWxKF1xJF45AFWDZF4DJr17Awb_yoW7Wr1kpF
 sxAF97Jrs7Gry5urn5tr1fCr1Yv3s7Wr17GrZ7Ga4vk342qrn5XrWIyry09wn5JFWDX3Z0
 ga98G34rCFy5tFJanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
 9KBjDU0xBIdaVrnRJUUUvlb7Iv0xC_Kw4lb4IE77IF4wAFF20E14v26r4j6ryUM7CY07I2
 0VC2zVCF04k26cxKx2IYs7xG6rWj6s0DM7CIcVAFz4kK6r1j6r18M28lY4IEw2IIxxk0rw
 A2F7IY1VAKz4vEj48ve4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_Gr0_Xr1l84ACjcxK6xII
 jxv20xvEc7CjxVAFwI0_Gr0_Cr1l84ACjcxK6I8E87Iv67AKxVWxJr0_GcWl84ACjcxK6I
 8E87Iv6xkF7I0E14v26F4UJVW0owAS0I0E0xvYzxvE52x082IY62kv0487Mc02F40EFcxC
 0VAKzVAqx4xG6I80ewAv7VC0I7IYx2IY67AKxVWUXVWUAwAv7VC2z280aVAFwI0_Gr0_Cr
 1lOx8S6xCaFVCjc4AY6r1j6r4UM4x0Y48IcxkI7VAKI48JM4IIrI8v6xkF7I0E8cxan2IY
 04v7MxkIecxEwVAFwVW8CwCF04k20xvY0x0EwIxGrwCFx2IqxVCFs4IE7xkEbVWUJVW8Jw
 C20s026c02F40E14v26r1j6r18MI8I3I0E7480Y4vE14v26r106r1rMI8E67AF67kF1VAF
 wI0_Jw0_GFylIxkGc2Ij64vIr41lIxAIcVC0I7IYx2IY67AKxVWUJVWUCwCI42IY6xIIjx
 v20xvEc7CjxVAFwI0_Gr0_Cr1lIxAIcVCF04k26cxKx2IYs7xG6rWUJVWrZr1UMIIF0xvE
 x4A2jsIE14v26r1j6r4UMIIF0xvEx4A2jsIEc7CjxVAFwI0_Gr0_Gr1UYxBIdaVFxhVjvj
 DU0xZFpf9x07boo7NUUUUU=
X-CM-SenderInfo: p1dqw3xlh2x3gn0dqz5rrqw2lrqou0/
X-Spam-Score: 0.3 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 0.0 URIBL_BLOCKED ADMINISTRATOR NOTICE: The query to URIBL was blocked.
 See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URIs: loongson.cn]
 -0.0 SPF_HELO_PASS          SPF: HELO matches SPF record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 1.0 RDNS_NONE Delivered to internal network by a host with no rDNS
 -0.7 AWL AWL: Adjusted score from AWL reputation of From: address
X-Headers-End: 1ifJG9-002Rgw-QK
Subject: [f2fs-dev] [PATCH v6] fs: introduce is_dot_or_dotdot helper for
 cleanup
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
Cc: linux-fsdevel@vger.kernel.org, linux-fscrypt@vger.kernel.org,
 ecryptfs@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

There exists many similar and duplicate codes to check "." and "..",
so introduce is_dot_or_dotdot helper to make the code more clean.

Signed-off-by: Tiezhu Yang <yangtiezhu@loongson.cn>
---

v6:
  - do not use the helper function in fs/namei.c
  - add extra check "len >= 1" in is_dot_or_dotdot()

v5:
  - remove "qname" variable in fscrypt_fname_disk_to_usr()
  - modify "len < 2" to "len == 1" in is_dot_or_dotdot()

v4:
  - rename is_dot_dotdot() to is_dot_or_dotdot()

v3:
  - use "name" and "len" as arguments instead of qstr
  - move is_dot_dotdot() to include/linux/namei.h

v2:
  - use the better performance implementation of is_dot_dotdot
  - make it static inline and move it to include/linux/fs.h

 fs/crypto/fname.c     | 17 +++--------------
 fs/ecryptfs/crypto.c  | 12 +-----------
 fs/f2fs/f2fs.h        | 11 -----------
 fs/f2fs/hash.c        |  3 ++-
 include/linux/namei.h | 10 ++++++++++
 5 files changed, 16 insertions(+), 37 deletions(-)

diff --git a/fs/crypto/fname.c b/fs/crypto/fname.c
index 3da3707..bb41f5d 100644
--- a/fs/crypto/fname.c
+++ b/fs/crypto/fname.c
@@ -11,21 +11,11 @@
  * This has not yet undergone a rigorous security audit.
  */
 
+#include <linux/namei.h>
 #include <linux/scatterlist.h>
 #include <crypto/skcipher.h>
 #include "fscrypt_private.h"
 
-static inline bool fscrypt_is_dot_dotdot(const struct qstr *str)
-{
-	if (str->len == 1 && str->name[0] == '.')
-		return true;
-
-	if (str->len == 2 && str->name[0] == '.' && str->name[1] == '.')
-		return true;
-
-	return false;
-}
-
 /**
  * fname_encrypt() - encrypt a filename
  *
@@ -252,10 +242,9 @@ int fscrypt_fname_disk_to_usr(struct inode *inode,
 			const struct fscrypt_str *iname,
 			struct fscrypt_str *oname)
 {
-	const struct qstr qname = FSTR_TO_QSTR(iname);
 	struct fscrypt_digested_name digested_name;
 
-	if (fscrypt_is_dot_dotdot(&qname)) {
+	if (is_dot_or_dotdot(iname->name, iname->len)) {
 		oname->name[0] = '.';
 		oname->name[iname->len - 1] = '.';
 		oname->len = iname->len;
@@ -323,7 +312,7 @@ int fscrypt_setup_filename(struct inode *dir, const struct qstr *iname,
 	memset(fname, 0, sizeof(struct fscrypt_name));
 	fname->usr_fname = iname;
 
-	if (!IS_ENCRYPTED(dir) || fscrypt_is_dot_dotdot(iname)) {
+	if (!IS_ENCRYPTED(dir) || is_dot_or_dotdot(iname->name, iname->len)) {
 		fname->disk_name.name = (unsigned char *)iname->name;
 		fname->disk_name.len = iname->len;
 		return 0;
diff --git a/fs/ecryptfs/crypto.c b/fs/ecryptfs/crypto.c
index f91db24..c3bcbf0 100644
--- a/fs/ecryptfs/crypto.c
+++ b/fs/ecryptfs/crypto.c
@@ -1991,16 +1991,6 @@ int ecryptfs_encrypt_and_encode_filename(
 	return rc;
 }
 
-static bool is_dot_dotdot(const char *name, size_t name_size)
-{
-	if (name_size == 1 && name[0] == '.')
-		return true;
-	else if (name_size == 2 && name[0] == '.' && name[1] == '.')
-		return true;
-
-	return false;
-}
-
 /**
  * ecryptfs_decode_and_decrypt_filename - converts the encoded cipher text name to decoded plaintext
  * @plaintext_name: The plaintext name
@@ -2027,7 +2017,7 @@ int ecryptfs_decode_and_decrypt_filename(char **plaintext_name,
 
 	if ((mount_crypt_stat->flags & ECRYPTFS_GLOBAL_ENCRYPT_FILENAMES) &&
 	    !(mount_crypt_stat->flags & ECRYPTFS_ENCRYPTED_VIEW_ENABLED)) {
-		if (is_dot_dotdot(name, name_size)) {
+		if (is_dot_or_dotdot(name, name_size)) {
 			rc = ecryptfs_copy_filename(plaintext_name,
 						    plaintext_name_size,
 						    name, name_size);
diff --git a/fs/f2fs/f2fs.h b/fs/f2fs/f2fs.h
index 5a888a0..3d5e684 100644
--- a/fs/f2fs/f2fs.h
+++ b/fs/f2fs/f2fs.h
@@ -2767,17 +2767,6 @@ static inline bool f2fs_cp_error(struct f2fs_sb_info *sbi)
 	return is_set_ckpt_flags(sbi, CP_ERROR_FLAG);
 }
 
-static inline bool is_dot_dotdot(const struct qstr *str)
-{
-	if (str->len == 1 && str->name[0] == '.')
-		return true;
-
-	if (str->len == 2 && str->name[0] == '.' && str->name[1] == '.')
-		return true;
-
-	return false;
-}
-
 static inline bool f2fs_may_extent_tree(struct inode *inode)
 {
 	struct f2fs_sb_info *sbi = F2FS_I_SB(inode);
diff --git a/fs/f2fs/hash.c b/fs/f2fs/hash.c
index 5bc4dcd..ef155c2 100644
--- a/fs/f2fs/hash.c
+++ b/fs/f2fs/hash.c
@@ -15,6 +15,7 @@
 #include <linux/cryptohash.h>
 #include <linux/pagemap.h>
 #include <linux/unicode.h>
+#include <linux/namei.h>
 
 #include "f2fs.h"
 
@@ -82,7 +83,7 @@ static f2fs_hash_t __f2fs_dentry_hash(const struct qstr *name_info,
 	if (fname && !fname->disk_name.name)
 		return cpu_to_le32(fname->hash);
 
-	if (is_dot_dotdot(name_info))
+	if (is_dot_or_dotdot(name, len))
 		return 0;
 
 	/* Initialize the default seed for the hash checksum functions */
diff --git a/include/linux/namei.h b/include/linux/namei.h
index 7fe7b87..8b69d0f 100644
--- a/include/linux/namei.h
+++ b/include/linux/namei.h
@@ -92,4 +92,14 @@ retry_estale(const long error, const unsigned int flags)
 	return error == -ESTALE && !(flags & LOOKUP_REVAL);
 }
 
+static inline bool is_dot_or_dotdot(const unsigned char *name, size_t len)
+{
+	if (len >= 1 && unlikely(name[0] == '.')) {
+		if (len == 1 || (len == 2 && name[1] == '.'))
+			return true;
+	}
+
+	return false;
+}
+
 #endif /* _LINUX_NAMEI_H */
-- 
2.1.0



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
