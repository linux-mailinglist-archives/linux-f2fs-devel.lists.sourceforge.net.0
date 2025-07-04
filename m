Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id B839EAF85B9
	for <lists+linux-f2fs-devel@lfdr.de>; Fri,  4 Jul 2025 04:44:48 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Subject:MIME-Version:References:In-Reply-To:Date:To:From:Message-ID:Sender:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=g/ZGni/wpkK0XZ6KSN2H1bB4iiPW7tgeKXUYH0b9+aA=; b=cj1c7E2pDchjgSTzp3iKSokVfU
	30B0kch9lIgH9tQ1N6rjkF0KoVf5EyiwG9YQLFMINKc0f4qsFLfjEcTyhUN0QAlQE93P11uNSDYpQ
	AwKlj/zOBwA2D50XzINj7/zPKr/CBKVyqzOaio54WkDXtdzLihTa3CnJmKh8/4UL9voQ=;
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1uXWPv-0000gL-Je;
	Fri, 04 Jul 2025 02:44:47 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <ywen.chen@foxmail.com>) id 1uXWPu-0000fw-BP
 for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 04 Jul 2025 02:44:46 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Date:Subject:Cc:To:From:Message-ID:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=x++/DrPNd44ZCLrC0h0UmG5N3pBOIkWVrED+TUpDaQM=; b=nWRP9AQyr8II4rsGRe70j27D2N
 vK2ZkYSDHE86Wafv1DBXB8vIcGQCphMXjOR2oPh4XfUZ4pyzqs1RKDpQUUcYQEWNyoDoYfYWA6+s1
 ymXHj+ZaaE8wJPiGyAmfV8qEwgNnI1qI+nsQKQk19KfoL4KSTOAxBA2Gwo8TtaFp9+qA=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Date:
 Subject:Cc:To:From:Message-ID:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=x++/DrPNd44ZCLrC0h0UmG5N3pBOIkWVrED+TUpDaQM=; b=SyQdX9BpMVe2f+onXBoGu4QBcr
 n4HE3J3npJIEwGGi29x4SgFx42zOOcHRLzcH3pCyAre1GQEyH/OWJROrFeSwyBrGHHH3KwcMTE3Su
 avpUDORsFpBmRfLqmONn9TmCET5kgoHIxJI8TIgseA7RRe4r3R8iHPbYgHlIe7f0O3p4=;
Received: from xmbghk7.mail.qq.com ([43.163.128.47])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1uXWPq-00006H-Pq for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 04 Jul 2025 02:44:43 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foxmail.com;
 s=s201512; t=1751597061;
 bh=x++/DrPNd44ZCLrC0h0UmG5N3pBOIkWVrED+TUpDaQM=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References;
 b=IfZK1LaQ8LrAMVHiKpRLFWl+ULSLM/Cyrs8Z1eOIO1hQOn4NNqNfTXyxUUHe+gD9O
 Gv7mWLimuYFqFaAd4xxiN3+khO46my/BJyGtWvwxWXkOxLvvXnBkLBnrdp2yGbozd5
 b9tHCh1JPOMYRMvIDp3Q5iQHSXlWTxnRT6MEIX+s=
Received: from meizu-Precision-3660.meizu.com ([14.21.33.153])
 by newxmesmtplogicsvrszb20-0.qq.com (NewEsmtp) with SMTP
 id B1284873; Fri, 04 Jul 2025 10:44:18 +0800
X-QQ-mid: xmsmtpt1751597058t0px2c030
Message-ID: <tencent_AF5D3E4566DC2FE381AE03E77779AA5F1F08@qq.com>
X-QQ-XMAILINFO: Od+6/RRPbeDtRA0hh4DoK7vwOScIr3LPQOoTh0ezLc86jVUia1ShtBvSk+5yPW
 QEN149HyuUAaLcy1GGLVLK8Ul+kh7bf/C7E8l2t70SPqNZ7+ttR2pAo2cJAoWuMMiwYjdys5zPLX
 2oWDQK1ipH+IW8X8aACvfCAZ5HpbOsAPxIrWWzh1lJFScjOYARClcl9hokgrROHoXmoj4s/sSPAO
 EbjkitYz3CVgEYHju4FJng6FxzEFNGHQu+PGdKJo/10pviLH6qfCJoUKu91JWgQhwhbdyPlMB1Px
 iLyzbhzPX9MHv1avwL+LGiRY/V59IH5chul1DNWezYi8jD3Ixsg8iXRPbgc9d3AuV/53c+tES5Ei
 /WB6TdPXiT/RdFd3ZbeKY/WmWOK6bBpsyS0JXjW5tIhiHvh4CKL9CWQot8F33QiFM/0LuvKPetka
 6fF6tNxomqAxCFWrcOFZd0bx1qGEZMgieTOpubXIJ1d3ygjNb/WClb1pMoeCq8RP81arPpi9AiE0
 A2byanW0ZvYR98fZXS13uK8NE4luunXfKv856B1kT5xqjYzMFS608NsYWuww1Nn0wZyVwYaZA0TZ
 30fwrDy7mQrHBpkFC+Uo0r5iKk2jL7neUiV6Pd7nms70rmx0y6DxJQSm9sVTo2tOFZRwUaEUG6x6
 59TtxRoaoh7b5IQq9Kb66cQd96UVvm+uXG8bww6a/HtbMVAND0YVCoKmqwWFnsr/OKjRMy5nNAn3
 hxOcKoVd0rXfTDUIGnvQB6yG2ZtVwm45cs7PhE88iiOgTDDRjZrWId+NSSn+pn7O/jFKHy+wf2WS
 gZRoqaAr68fxwveMhUcu+pJ+fyck2711HQ3esoiwF45ZswgVFMXJrC8yZ5HS2S362e8/0PDOEuKm
 jNULnlejOarUf4mptR5AVJxnS3mZB0AMvQBIOPX8p3s4ZnPoQ7b0s5Pj/CuOqR7rgtkasQDfzBR9
 Ss57LmnVgm0xIsww0+1tlVpdv1efbxHf0+NhfbH6gWLzEZ6iktfdMaPkjRNKecE+QkC45cXpSZgH
 dSfZcduyz1vMFFq0YSoGeRlMgCntMLiMUB51x2TkS16Ain49wGF22B4SLnX/g=
X-QQ-XMRINFO: MSVp+SPm3vtS1Vd6Y4Mggwc=
From: Yuwen Chen <ywen.chen@foxmail.com>
To: hch@infradead.org
Date: Fri,  4 Jul 2025 10:44:16 +0800
X-OQ-MSGID: <20250704024416.4078789-1-ywen.chen@foxmail.com>
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
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 0.0 FREEMAIL_FROM Sender email is commonly abused enduser mail provider
 [ywen.chen(at)foxmail.com]
X-Headers-End: 1uXWPq-00006H-Pq
Subject: [f2fs-dev] [PATCH v3 2/2] f2fs: improve the performance of
 f2fs_lookup
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
of v6.6 and a userdebug version.

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
 fs/f2fs/dir.c    | 24 +++++++++++++++++-------
 fs/f2fs/f2fs.h   |  3 ++-
 fs/f2fs/inline.c |  3 ++-
 3 files changed, 21 insertions(+), 9 deletions(-)

diff --git a/fs/f2fs/dir.c b/fs/f2fs/dir.c
index 4c6611fbd9574..ee0cbeb80debd 100644
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
-					de_name, de_name_len, NULL);
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
-- 
2.34.1



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
