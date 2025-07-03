Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id F02FCAF6F5F
	for <lists+linux-f2fs-devel@lfdr.de>; Thu,  3 Jul 2025 11:55:26 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Subject:MIME-Version:References:In-Reply-To:Date:To:From:Message-ID:Sender:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=CIHxsykB+EGKkoeifVC4b9BdWgFodEr5+MGHzRUS/yU=; b=lKILBQ8GQTW3Ym9puYgBgJdSGj
	zbtDZ6oKIjh8An9yKcM2f4+BHbQythf3h/2bO6WZnD8BxMzK/3PIYEBexzv6qnX6QIuHf3bjeE2rG
	JHneCLg7wwVbL6Ny9tsfvy7ZDFKk2zAcFFfVbdbdlfYmCDJiFZCovAMvrhcmijtc89pE=;
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1uXGey-0001RL-9j;
	Thu, 03 Jul 2025 09:55:16 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <ywen.chen@foxmail.com>) id 1uXGev-0001RE-2J
 for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 03 Jul 2025 09:55:13 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Date:Subject:Cc:To:From:Message-ID:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=/wbU6XDJ7jlrc766Os5+o9iK4M0G0pB69Mpr3DKOBH4=; b=JhnTqlCaLw00LaDoRF4R5YZbj4
 BufDJZDpN5EQeAgeVTVLMj3qa4A5Ns1+tjw3juG691wMCKXYsePXG7YB6L60TBoqSkNJzwszdSAly
 uffeBHdUA0SS6sdlmI9tnF42MjM68hBEODbYSNSeoJnkRAlcpHjUzlXTvz1x/8i/753Y=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Date:
 Subject:Cc:To:From:Message-ID:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=/wbU6XDJ7jlrc766Os5+o9iK4M0G0pB69Mpr3DKOBH4=; b=QKw0xGlEVG0NaIPoO8nQMV83dU
 xGUy/qXQPXXRHd+qxYOgcrTWCJHW8KpqKK04NxLuxBVbj9NpfGGCb6uFCMXrYlcKTZDHg3Yzws573
 FOSDDTncZOXlarHYi7Eyh4Ua6V4tsypZ9a8tVHywDGr9svO0Rdi8L5OSqReQpslKxxoc=;
Received: from xmbghk7.mail.qq.com ([43.163.128.53])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1uXGet-0002Ft-8x for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 03 Jul 2025 09:55:12 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foxmail.com;
 s=s201512; t=1751536504;
 bh=/wbU6XDJ7jlrc766Os5+o9iK4M0G0pB69Mpr3DKOBH4=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References;
 b=o2hfWmt77eL0sb3d3Op4nC0HsK06Lv972CAXFiDOpPFNEn3vcvuo6UpP8HW3puo5C
 +s1WG8DzheFQcvnF2lPWnCbezD3EneD4MjJcnqJh48gR3FKMLiV0BFYbZKUkpNdcRC
 vQ1k3mH8K7lKHljmaM0S302gi/dHO/9pCkeRAqOM=
Received: from meizu-Precision-3660.meizu.com ([14.21.33.154])
 by newxmesmtplogicsvrszb16-1.qq.com (NewEsmtp) with SMTP
 id DA8AB8E0; Thu, 03 Jul 2025 17:54:40 +0800
X-QQ-mid: xmsmtpt1751536480tpbyasjsf
Message-ID: <tencent_316CDC61E3A3AE54E74179695FD15D214508@qq.com>
X-QQ-XMAILINFO: MhK4DKsBP06i+cCzqH1WlqkU/TgT5BvFdPh/2rLIQz5xEiGeI0wKKfGtTXQY+O
 gS11rAieuw5+d1ohsGBF6SX364Tq2WkIE67boL6TbHmpiGSZVbnh7s+m7QffMXWx/pS8tCTm7qHD
 SvsUlEhBPZZ3aa4wPMA/ZaZqUBRkowHeubccuC9Xc4Cs8dMWkVSFzJPfZWB1E18nemet+F3uRMrH
 paopFvuEgreFViKNFfEtYUFxWg3MQjKB4msUQ/EgBBLNq4q6CekSVyurT2ogx7rlIeW5ovFvE0TW
 sr4A22wQBqMYUQxdX+uc3Awa7LBYMu5O1aS2M/rA1ALzHoMuZluRlPLIXlTGqZ0gz50Enk8K8rnD
 ikR+AAqjS6zHcElbwlIhTqIFjNZj8lUI/x2g7yYKjBVp97ly3AZpZhTTkRWDKBl59fyecYX781v/
 Z/Scr0bvFKbmvYTmMJR8dmT9gQbBm+VrE8Zc4XF7RH9EfgDeghy6dqaQrRXr6BbIjn+u+Varw99p
 GIa2Zg3tPC59wStaGEhS9BBRm6MvdfRUv7V3U9V/w6U706eQ6MiOnusaEAOFBlo7XyRRl/lADmv8
 0cW76ukBYF78XhUR4YC1wGzfiQlCiXf+3DpRPi9ZWSl1S0z0nu+rOr0l8OZlFcgHRQnTRlKZ7JKH
 F2eOiyCJBB+Hna1SWLThAGkbUk21GIJYGIHHHQPEJ3N5xTCCTZMmXzSqtMZjvns2lTuIZeDkYuJJ
 8lsevUAqjoongUBu9R94ECVcOnpP3wzGLYukQWIMb/NbYxfcc0nz+iodmppUvg+no/4ffTPCZZud
 JmexaleeSj/9mpMON6bJWm4ixXNDWxlTx1gWT8TPaSIoAq1t5B6KL5a3RNCsy7qmnsGE0N3tpDTM
 YJAWHGSxLGcsW81M4qX3to2M3uXl50Owdo237384T0Z5KjZjWxkSIMHkEEBUhBsuOsCZNB/qfSqq
 gESu8DzfoaeKeFN+RKm20Belh0jpgMIhttdw+4sY/UWIFlw5nXoNV0x6BWgy6Cmc2Tyevo4M6825
 UT106rPvPbmUxyfTImNqz0H/+tMKUJHR33opX5yPxSm85o+1Z+VwU1eLigpNM=
X-QQ-XMRINFO: MPJ6Tf5t3I/ycC2BItcBVIA=
From: Yuwen Chen <ywen.chen@foxmail.com>
To: ywen.chen@foxmail.com
Date: Thu,  3 Jul 2025 17:54:38 +0800
X-OQ-MSGID: <20250703095438.4018291-1-ywen.chen@foxmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <tencent_0D8BB6ABAB0880DB7BFCCE35EDBC3DCFF505@qq.com>
References: <tencent_0D8BB6ABAB0880DB7BFCCE35EDBC3DCFF505@qq.com>
MIME-Version: 1.0
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-2.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On the Android system, the file creation operation will call
 the f2fs_lookup function. When there are too many files in a directory, the
 generic_ci_match operation will be called repeatedly in large q [...] 
 Content analysis details:   (-0.2 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.0 FREEMAIL_FROM Sender email is commonly abused enduser mail provider
 [ywen.chen(at)foxmail.com]
X-Headers-End: 1uXGet-0002Ft-8x
Subject: [f2fs-dev] [PATCH v2] f2fs: improve the performance of f2fs_lookup
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
Cc: brauner@kernel.org, tytso@mit.edu, linux-kernel@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net, adilger.kernel@dilger.ca,
 viro@zeniv.linux.org.uk, linux-fsdevel@vger.kernel.org, jaegeuk@kernel.org,
 linux-ext4@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On the Android system, the file creation operation will call
the f2fs_lookup function. When there are too many files in a
directory, the generic_ci_match operation will be called
repeatedly in large quantities. In extreme cases, the file
creation speed will drop to three times per second.

Use the following program to conduct a file-creation test in
the private program directory(/data/media/0/Android/data/*)
of Android.

int main(int argc, char **argv)
{
    size_t fcnt = 0;
    char path[PATH_MAX];
    char buf[4096] = {0};
    int i, fd;

    if (argc < 2)
        return - EINVAL;

    fcnt = atoi(argv[1]);
    for (i = 0; i < fcnt; i++)
    {
        snprintf(path, sizeof(path), "./%d", i);
        fd = open(path, O_RDWR | O_CREAT, 0600);
        if (fd < 0)
            return - 1;
        write(fd, buf, sizeof(buf));
        close(fd);
    }
    return 0;
}

The test platform is Snapdragon 8s Gen4, with a kernel version
of v6.16 and a userdebug version.

Before this submission was merged, when creating 2000 files,
the performance test results are as follows:
$ time /data/file_creater 2000
0m14.83s real     0m00.00s user     0m14.30s system
0m15.61s real     0m00.00s user     0m15.04s system
0m14.72s real     0m00.01s user     0m14.18s system

After this submission was merged, the performance is as follows:
$ time /data/file_creater 2000
0m08.17s real     0m00.00s user     0m07.86s system
0m08.16s real     0m00.01s user     0m07.86s system
0m08.15s real     0m00.00s user     0m07.86s system

It was observed through perf that the generic_ci_match function
was called a large number of times, which led to most of the
time being spent on memory allocation and release. Due to a
flush_dcache operation in the implementation of cts_cbc_decrypt,
this memory cannot be allocated on the stack.

Signed-off-by: Yuwen Chen <ywen.chen@foxmail.com>
---
 fs/ext4/namei.c    |  2 +-
 fs/f2fs/dir.c      | 24 +++++++++++++++++-------
 fs/f2fs/f2fs.h     |  3 ++-
 fs/f2fs/inline.c   |  3 ++-
 fs/libfs.c         | 32 +++++++++++++++++++++++++++++---
 include/linux/fs.h |  8 +++++++-
 6 files changed, 58 insertions(+), 14 deletions(-)

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
index c36b3b22bfffd..ee0cbeb80debd 100644
--- a/fs/f2fs/dir.c
+++ b/fs/f2fs/dir.c
@@ -176,6 +176,7 @@ static struct f2fs_dir_entry *find_in_block(struct inode *dir,
 				struct folio *dentry_folio,
 				const struct f2fs_filename *fname,
 				int *max_slots,
+				struct decrypted_name_prealloc *prealloc,
 				bool use_hash)
 {
 	struct f2fs_dentry_block *dentry_blk;
@@ -184,12 +185,13 @@ static struct f2fs_dir_entry *find_in_block(struct inode *dir,
 	dentry_blk = folio_address(dentry_folio);
 
 	make_dentry_ptr_block(dir, &d, dentry_blk);
-	return f2fs_find_target_dentry(&d, fname, max_slots, use_hash);
+	return f2fs_find_target_dentry(&d, fname, max_slots, prealloc, use_hash);
 }
 
 static inline int f2fs_match_name(const struct inode *dir,
 				   const struct f2fs_filename *fname,
-				   const u8 *de_name, u32 de_name_len)
+				   const u8 *de_name, u32 de_name_len,
+				   struct decrypted_name_prealloc *prealloc)
 {
 	struct fscrypt_name f;
 
@@ -197,7 +199,7 @@ static inline int f2fs_match_name(const struct inode *dir,
 	if (fname->cf_name.name)
 		return generic_ci_match(dir, fname->usr_fname,
 					&fname->cf_name,
-					de_name, de_name_len);
+					de_name, de_name_len, prealloc);
 
 #endif
 	f.usr_fname = fname->usr_fname;
@@ -210,6 +212,7 @@ static inline int f2fs_match_name(const struct inode *dir,
 
 struct f2fs_dir_entry *f2fs_find_target_dentry(const struct f2fs_dentry_ptr *d,
 			const struct f2fs_filename *fname, int *max_slots,
+			struct decrypted_name_prealloc *prealloc,
 			bool use_hash)
 {
 	struct f2fs_dir_entry *de;
@@ -236,7 +239,8 @@ struct f2fs_dir_entry *f2fs_find_target_dentry(const struct f2fs_dentry_ptr *d,
 		if (!use_hash || de->hash_code == fname->hash) {
 			res = f2fs_match_name(d->inode, fname,
 					      d->filename[bit_pos],
-					      le16_to_cpu(de->name_len));
+					      le16_to_cpu(de->name_len),
+					      prealloc);
 			if (res < 0)
 				return ERR_PTR(res);
 			if (res)
@@ -261,6 +265,7 @@ static struct f2fs_dir_entry *find_in_level(struct inode *dir,
 					unsigned int level,
 					const struct f2fs_filename *fname,
 					struct folio **res_folio,
+					struct decrypted_name_prealloc *prealloc,
 					bool use_hash)
 {
 	int s = GET_DENTRY_SLOTS(fname->disk_name.len);
@@ -296,7 +301,8 @@ static struct f2fs_dir_entry *find_in_level(struct inode *dir,
 			}
 		}
 
-		de = find_in_block(dir, dentry_folio, fname, &max_slots, use_hash);
+		de = find_in_block(dir, dentry_folio, fname, &max_slots, prealloc,
+				   use_hash);
 		if (IS_ERR(de)) {
 			*res_folio = ERR_CAST(de);
 			de = NULL;
@@ -336,6 +342,7 @@ struct f2fs_dir_entry *__f2fs_find_entry(struct inode *dir,
 	unsigned int max_depth;
 	unsigned int level;
 	bool use_hash = true;
+	struct decrypted_name_prealloc prealloc = {0};
 
 	*res_folio = NULL;
 
@@ -343,7 +350,8 @@ struct f2fs_dir_entry *__f2fs_find_entry(struct inode *dir,
 start_find_entry:
 #endif
 	if (f2fs_has_inline_dentry(dir)) {
-		de = f2fs_find_in_inline_dir(dir, fname, res_folio, use_hash);
+		de = f2fs_find_in_inline_dir(dir, fname, res_folio, &prealloc,
+					     use_hash);
 		goto out;
 	}
 
@@ -359,7 +367,8 @@ struct f2fs_dir_entry *__f2fs_find_entry(struct inode *dir,
 	}
 
 	for (level = 0; level < max_depth; level++) {
-		de = find_in_level(dir, level, fname, res_folio, use_hash);
+		de = find_in_level(dir, level, fname, res_folio, &prealloc,
+				   use_hash);
 		if (de || IS_ERR(*res_folio))
 			break;
 	}
@@ -372,6 +381,7 @@ struct f2fs_dir_entry *__f2fs_find_entry(struct inode *dir,
 		goto start_find_entry;
 	}
 #endif
+	kfree(prealloc.name);
 	/* This is to increase the speed of f2fs_create */
 	if (!de)
 		F2FS_I(dir)->task = current;
diff --git a/fs/f2fs/f2fs.h b/fs/f2fs/f2fs.h
index 9333a22b9a01e..dfbd2215310fb 100644
--- a/fs/f2fs/f2fs.h
+++ b/fs/f2fs/f2fs.h
@@ -3673,6 +3673,7 @@ int f2fs_prepare_lookup(struct inode *dir, struct dentry *dentry,
 void f2fs_free_filename(struct f2fs_filename *fname);
 struct f2fs_dir_entry *f2fs_find_target_dentry(const struct f2fs_dentry_ptr *d,
 			const struct f2fs_filename *fname, int *max_slots,
+			struct decrypted_name_prealloc *prealloc,
 			bool use_hash);
 int f2fs_fill_dentries(struct dir_context *ctx, struct f2fs_dentry_ptr *d,
 			unsigned int start_pos, struct fscrypt_str *fstr);
@@ -4316,7 +4317,7 @@ int f2fs_write_inline_data(struct inode *inode, struct folio *folio);
 int f2fs_recover_inline_data(struct inode *inode, struct folio *nfolio);
 struct f2fs_dir_entry *f2fs_find_in_inline_dir(struct inode *dir,
 		const struct f2fs_filename *fname, struct folio **res_folio,
-		bool use_hash);
+		struct decrypted_name_prealloc *prealloc, bool use_hash);
 int f2fs_make_empty_inline_dir(struct inode *inode, struct inode *parent,
 			struct folio *ifolio);
 int f2fs_add_inline_entry(struct inode *dir, const struct f2fs_filename *fname,
diff --git a/fs/f2fs/inline.c b/fs/f2fs/inline.c
index 901c630685ced..d02ff6c26d70a 100644
--- a/fs/f2fs/inline.c
+++ b/fs/f2fs/inline.c
@@ -353,6 +353,7 @@ int f2fs_recover_inline_data(struct inode *inode, struct folio *nfolio)
 struct f2fs_dir_entry *f2fs_find_in_inline_dir(struct inode *dir,
 					const struct f2fs_filename *fname,
 					struct folio **res_folio,
+					struct decrypted_name_prealloc *prealloc,
 					bool use_hash)
 {
 	struct f2fs_sb_info *sbi = F2FS_SB(dir->i_sb);
@@ -370,7 +371,7 @@ struct f2fs_dir_entry *f2fs_find_in_inline_dir(struct inode *dir,
 	inline_dentry = inline_data_addr(dir, ifolio);
 
 	make_dentry_ptr_inline(dir, &d, inline_dentry);
-	de = f2fs_find_target_dentry(&d, fname, NULL, use_hash);
+	de = f2fs_find_target_dentry(&d, fname, NULL, prealloc, use_hash);
 	folio_unlock(ifolio);
 	if (IS_ERR(de)) {
 		*res_folio = ERR_CAST(de);
diff --git a/fs/libfs.c b/fs/libfs.c
index 9ea0ecc325a81..cab3d86483835 100644
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
@@ -1884,7 +1904,8 @@ static const struct dentry_operations generic_ci_dentry_ops = {
 int generic_ci_match(const struct inode *parent,
 		     const struct qstr *name,
 		     const struct qstr *folded_name,
-		     const u8 *de_name, u32 de_name_len)
+		     const u8 *de_name, u32 de_name_len,
+		     struct decrypted_name_prealloc *prealloc)
 {
 	const struct super_block *sb = parent->i_sb;
 	const struct unicode_map *um = sb->s_encoding;
@@ -1899,7 +1920,11 @@ int generic_ci_match(const struct inode *parent,
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
@@ -1928,7 +1953,8 @@ int generic_ci_match(const struct inode *parent,
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
