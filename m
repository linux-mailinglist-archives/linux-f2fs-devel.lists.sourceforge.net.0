Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id E5DFC11A148
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 11 Dec 2019 03:20:47 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1iercK-00037U-96; Wed, 11 Dec 2019 02:20:44 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <yangtiezhu@loongson.cn>) id 1iercI-00037J-KY
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 11 Dec 2019 02:20:42 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
 MIME-Version:Content-Type:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=inxcWkdFZRSnYtx37zTuksEzmne8zm5rffLkk9auTP8=; b=mqDkOKOAFyr51hAM8eU34fP3To
 qqUSji0w0SjgjuIAtLdJBNIgpGA3xccWHeSg5j7EmuogyF5wjnXmwWC66folBEYBZR6TVKS2FqXKo
 eXy+95Mmwp+7NeeyKLEfgzhq3Tk6NIAXuU7u3xosxJAJR4rBmKRplk/8xObkydlWZXKw=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:MIME-Version:
 Content-Type:Content-Transfer-Encoding:Content-ID:Content-Description:
 Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
 In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=inxcWkdFZRSnYtx37zTuksEzmne8zm5rffLkk9auTP8=; b=JQvgd9SFSu/+9NJqNUuN6eu6Ws
 Pjdl6ZTb44R8OHJEbeWwhV6jYxhBEEYFvEUA6iVan6CWqiANY61She9NrutJUkMx3FgmTmyRxg4N4
 6wYIa4F5bKFpSaiYc0xcuDRneiIxKGt/DDx5JSBBxPmnximxpAsBDycOIGJy3yFef/Cs=;
Received: from mail.loongson.cn ([114.242.206.163] helo=loongson.cn)
 by sfi-mx-4.v28.lw.sourceforge.com with esmtp (Exim 4.92.2)
 id 1iercF-000fsf-RE
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 11 Dec 2019 02:20:42 +0000
Received: from linux.localdomain (unknown [123.138.236.242])
 by mail.loongson.cn (Coremail) with SMTP id AQAAf9DxrxdqUvBdi2oJAA--.59S2;
 Wed, 11 Dec 2019 10:20:26 +0800 (CST)
From: Tiezhu Yang <yangtiezhu@loongson.cn>
To: Alexander Viro <viro@zeniv.linux.org.uk>,
 "Theodore Y. Ts'o" <tytso@mit.edu>, Jaegeuk Kim <jaegeuk@kernel.org>,
 Chao Yu <yuchao0@huawei.com>, Eric Biggers <ebiggers@kernel.org>,
 Tyler Hicks <tyhicks@canonical.com>
Date: Wed, 11 Dec 2019 10:20:01 +0800
Message-Id: <1576030801-8609-1-git-send-email-yangtiezhu@loongson.cn>
X-Mailer: git-send-email 2.1.0
X-CM-TRANSID: AQAAf9DxrxdqUvBdi2oJAA--.59S2
X-Coremail-Antispam: 1UD129KBjvJXoWxtF18ZF4rZrW5Jw1ftrW3GFg_yoW7Zr4UpF
 sxJF97trs7GryY9r95tr1fCr1Yv3s7Wr17GrZxGa4vy34aqrn5XrWIvry09wn3JFWDX3Z0
 ga98G34rCFy5JFJanT9S1TB71UUUUUJqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
 9KBjDU0xBIdaVrnRJUUUPEb7Iv0xC_Kw4lb4IE77IF4wAFF20E14v26r4j6ryUM7CY07I2
 0VC2zVCF04k26cxKx2IYs7xG6rWj6s0DM7CIcVAFz4kK6r1j6r18M28lY4IEw2IIxxk0rw
 A2F7IY1VAKz4vEj48ve4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_Ar0_tr1l84ACjcxK6xII
 jxv20xvEc7CjxVAFwI0_Cr0_Gr1UM28EF7xvwVC2z280aVAFwI0_Gr1j6F4UJwA2z4x0Y4
 vEx4A2jsIEc7CjxVAFwI0_Gr1j6F4UJwAaw2AFwI0_Jrv_JF1le2I262IYc4CY6c8Ij28I
 cVAaY2xG8wAqx4xG64xvF2IEw4CE5I8CrVC2j2WlYx0E2Ix0cI8IcVAFwI0_JrI_JrylYx
 0Ex4A2jsIE14v26r1j6r4UMcvjeVCFs4IE7xkEbVWUJVW8JwACjcxG0xvY0x0EwIxGrwAC
 I402YVCY1x02628vn2kIc2xKxwCY1x0262kKe7AKxVWUAVWUtwCY02Avz4vE14v_Gr1l42
 xK82IYc2Ij64vIr41l4I8I3I0E4IkC6x0Yz7v_Jr0_Gr1l4IxYO2xFxVAFwI0_Jrv_JF1l
 x2IqxVAqx4xG67AKxVWUJVWUGwC20s026x8GjcxK67AKxVWUGVWUWwC2zVAF1VAY17CE14
 v26r1q6r43MIIYrxkI7VAKI48JMIIF0xvE2Ix0cI8IcVAFwI0_Jr0_JF4lIxAIcVC0I7IY
 x2IY6xkF7I0E14v26r4j6F4UMIIF0xvE42xK8VAvwI8IcIk0rVWrJr0_WFyUJwCI42IY6I
 8E87Iv67AKxVWUJVW8JwCI42IY6I8E87Iv6xkF7I0E14v26r4j6r4UJbIYCTnIWIevJa73
 UjIFyTuYvjxUgwSlUUUUU
X-CM-SenderInfo: p1dqw3xlh2x3gn0dqz5rrqw2lrqou0/
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 0.0 URIBL_BLOCKED ADMINISTRATOR NOTICE: The query to URIBL was blocked.
 See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URIs: disk_name.name]
 -0.0 SPF_HELO_PASS          SPF: HELO matches SPF record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.2 AWL AWL: Adjusted score from AWL reputation of From: address
X-Headers-End: 1iercF-000fsf-RE
Subject: [f2fs-dev] [PATCH v5] fs: introduce is_dot_or_dotdot helper for
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
 fs/namei.c            |  6 ++----
 include/linux/namei.h | 10 ++++++++++
 6 files changed, 18 insertions(+), 41 deletions(-)

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
diff --git a/fs/namei.c b/fs/namei.c
index d6c91d1..f3a4439 100644
--- a/fs/namei.c
+++ b/fs/namei.c
@@ -2451,10 +2451,8 @@ static int lookup_one_len_common(const char *name, struct dentry *base,
 	if (!len)
 		return -EACCES;
 
-	if (unlikely(name[0] == '.')) {
-		if (len < 2 || (len == 2 && name[1] == '.'))
-			return -EACCES;
-	}
+	if (is_dot_or_dotdot(name, len))
+		return -EACCES;
 
 	while (len--) {
 		unsigned int c = *(const unsigned char *)name++;
diff --git a/include/linux/namei.h b/include/linux/namei.h
index 7fe7b87..0fd9315 100644
--- a/include/linux/namei.h
+++ b/include/linux/namei.h
@@ -92,4 +92,14 @@ retry_estale(const long error, const unsigned int flags)
 	return error == -ESTALE && !(flags & LOOKUP_REVAL);
 }
 
+static inline bool is_dot_or_dotdot(const unsigned char *name, size_t len)
+{
+	if (unlikely(name[0] == '.')) {
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
