Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id DC4272DD4DD
	for <lists+linux-f2fs-devel@lfdr.de>; Thu, 17 Dec 2020 17:07:12 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:To:References:Mime-Version:Message-Id:
	In-Reply-To:Date:Sender:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=PATJDzb62Yn7gJblnmvktDbvLuZnSOqXqQDBvV94KH0=; b=m020OLX9wLwj2AQZ3skou1tbV
	jWLbRpSkDBSa00zzhyyoA336UEuxNb9mQi/D3Ik5H0qOWD4Oq3FAI+NSqw1X3w7m4DegONoysR5Si
	zNe6o2PuVf0pnBQ75KDpl6OmT3BT0NJVwC3lkY+EKFJF4oyRJhK4xjNq6OYnqBpEFhbTc=;
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1kpvo5-0007Ph-OF; Thu, 17 Dec 2020 16:07:09 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <36HTbXwYKAEUzh05h0nvvnsl.jvt@flex--satyat.bounces.google.com>)
 id 1kpvo4-0007PY-A5
 for linux-f2fs-devel@lists.sourceforge.net; Thu, 17 Dec 2020 16:07:08 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:Cc:To:From:Subject:References:
 Mime-Version:Message-Id:In-Reply-To:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=7Z3K+fHYjNyuoO4dSNB82lkpnvkq7FStMIxFNit/rl0=; b=HGXmgfQblwgsSZF2rl3x9/Eo2
 u4thIshtUHQeofvqUg6yxwSgPqqnj00sgXjKCNwSG2J9F3fxtPXX3+9EwpSQHFskekQcEORXiCxjg
 4Iw9DEgTl8V2Md66wn2uPD45kNuXBIUPYXgORLBQ6/zH0VliEBas/NLddSKvTckw4uNV0=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:Cc:To:From:Subject:References:Mime-Version:Message-Id:
 In-Reply-To:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=7Z3K+fHYjNyuoO4dSNB82lkpnvkq7FStMIxFNit/rl0=; b=g6akB4yXPQrJ+MyQkkdOpWU4qd
 mdBfz9mp55lARm3LmffoWmiwiHLGoTLnzgmQA8V/XhKyDe/Dw701lRCCcsvC7XkvQv4Dqn3dm9THa
 69BHmLshEZt1s+LuxKOBCGInbwf01AijujpyG5LsVjbyxnNUR4YLusJqc4URKXPWYOhk=;
Received: from mail-pf1-f202.google.com ([209.85.210.202])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.92.2)
 id 1kpvnz-0006U8-Ii
 for linux-f2fs-devel@lists.sourceforge.net; Thu, 17 Dec 2020 16:07:08 +0000
Received: by mail-pf1-f202.google.com with SMTP id n8so18905773pfa.8
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Thu, 17 Dec 2020 08:07:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=sender:date:in-reply-to:message-id:mime-version:references:subject
 :from:to:cc; bh=7Z3K+fHYjNyuoO4dSNB82lkpnvkq7FStMIxFNit/rl0=;
 b=e0JvguaRWrkWVqrRzw6SKomeaEtI46RfPUgfE9YUPL8B2iguBvc/ysi7gsYFqog1+E
 IFWpcckq3wWYj41SVhK0Tz7nRVO02spSkVguhFjnLizEjIRptkKArkRgshOfqi8XjdWl
 ZQHtfOJA57spw5Te0cLkeoFbUM1fKyAaDlkfAaYmRRvLCMQSOqQt1JV2gFOadeY741Bb
 FgxNVqGbYAsBMosdCiyNxDs9ItISgmU/G49LNj1a8kaR+DW3dQSzIcaeGHy0EXspxNml
 QDA5DtjTgyvRm1rjtMsCCkGqGAmz73hurP6u46tU22mAZxsHdA+1FZk8p8EvlSKo1vqH
 iHQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:date:in-reply-to:message-id:mime-version
 :references:subject:from:to:cc;
 bh=7Z3K+fHYjNyuoO4dSNB82lkpnvkq7FStMIxFNit/rl0=;
 b=d6QfkmKdoJq2DfPUmG6HhEXi7DvL+oe0gabY2LxydBv4p7w6qBez3m5EaMJp1xmeWF
 ygI0wPMSPySGw919UGnF9XrwGim27JlsoCRliNUG1KsNsnSl/7p89GIz39D/Z8d2lxJp
 npgdiMe/KHiq7TaJ94/vMwNLBbGIkUbibY7uyCDMh3DOp8Q9eHH93HVMws7zqvecZCq0
 RD1VbYCuoKvKszZtsj6W7z5Wj61QaZNCv5yMM+9XrJYblJ/5ukwmo9va8w+O1fsyj1Dh
 T97b/cTDXl30gWYzZgd64uru3NI4cJ8AFgZhTMO0QWEmQrGv4OVqOJieXMEwvd6/ERdY
 pk+w==
X-Gm-Message-State: AOAM530jT2bGLSv8tpP0YbuRkcHrt1DRCZNZlBy5xTbSJVZvLt7AyQ3P
 gBVKQTqoxaoJ36g7c6TMcyVyPl3wLpw=
X-Google-Smtp-Source: ABdhPJxY4PW963cHR5jZ/mIUafxHXUibQmpN8tlzQezRU/dOjBwJBXpXg5DkoKlQ19c1mK82MKLdrX5vvqg=
X-Received: from satyaprateek.c.googlers.com
 ([fda3:e722:ac3:10:24:72f4:c0a8:1092])
 (user=satyat job=sendgmr) by 2002:a17:902:ed0a:b029:dc:55b:5cb9 with SMTP id
 b10-20020a170902ed0ab02900dc055b5cb9mr15404164pld.40.1608217832225; Thu, 17
 Dec 2020 07:10:32 -0800 (PST)
Date: Thu, 17 Dec 2020 15:10:13 +0000
In-Reply-To: <20201217151013.1513045-1-satyat@google.com>
Message-Id: <20201217151013.1513045-3-satyat@google.com>
Mime-Version: 1.0
References: <20201217151013.1513045-1-satyat@google.com>
X-Mailer: git-send-email 2.29.2.684.gfbc64c5ab5-goog
To: Jaegeuk Kim <jaegeuk@kernel.org>, Eric Biggers <ebiggers@kernel.org>,
 Chao Yu <chao@kernel.org>
X-Spam-Score: -7.6 (-------)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/, no
 trust [209.85.210.202 listed in list.dnswl.org]
 0.0 RCVD_IN_MSPIKE_H3      RBL: Good reputation (+3)
 [209.85.210.202 listed in wl.mailspike.net]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -7.5 USER_IN_DEF_DKIM_WL    From: address is in the default DKIM white-list
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
 -0.0 DKIMWL_WL_MED          DKIMwl.org - Medium trust sender
X-Headers-End: 1kpvnz-0006U8-Ii
Subject: [f2fs-dev] [PATCH v2 2/2] libf2fs_io: Make metadata encryption work
 with sparse mode
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
From: Satya Tangirala via Linux-f2fs-devel
 <linux-f2fs-devel@lists.sourceforge.net>
Reply-To: Satya Tangirala <satyat@google.com>
Cc: Satya Tangirala <satyat@google.com>, linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

This patch is an *untested* attempt to make metadata encryption work with
sparse mode. It's included only in case there are already objections to the
approach.

The easiest way to make metadata encryption work with sparse mode might
be to encrypt buffers before the calls to sparse_write_blk() and decrypt
buffers after the calls to sparse_read_blk() (and just call
sparse_write_blk() from sparse_write_zeroed_blk() if metadata encryption is
enabled). I didn't do that here because multiple reads on unchanging data
would cause unnecessary decryptions, and multiple writes of the same block
would cause unnecessary encryptions.

Instead, in this patch, I opted to allow each block to be stored as either
ciphertext or plaintext. This patch keeps track of whether each block
needs to be encrypted before being written out into the sparse file. Any
writes to a block will cause the block to store the plaintext (and we
mark the block as requiring encryption if the write was supposed to be
encrypted). Any reads that want decrypted plaintext from an encrypted
block will cause the block to first be decrypted and marked as requiring
encryption. Any reads that want the *cipher*-text (not decrypted) data
from a decrypted block will cause the block to first be encrypted and
marked as no longer requiring encryption (this case shouldn't happen
afaict - so each block will be encrypted and decrypted at most once).

Signed-off-by: Satya Tangirala <satyat@google.com>
---
 lib/libf2fs_io.c | 111 ++++++++++++++++++++++++++++++++++++++++-------
 1 file changed, 95 insertions(+), 16 deletions(-)

diff --git a/lib/libf2fs_io.c b/lib/libf2fs_io.c
index df3723d..eec02ae 100644
--- a/lib/libf2fs_io.c
+++ b/lib/libf2fs_io.c
@@ -41,6 +41,11 @@ struct f2fs_configuration c;
 #include <sparse/sparse.h>
 struct sparse_file *f2fs_sparse_file;
 static char **blocks;
+/*
+ * Whether the block in @blocks needs encryption before being written out to
+ * disk.
+ */
+static bool *block_needs_encryption;
 u_int64_t blocks_count;
 static char *zeroed_block;
 #endif
@@ -397,24 +402,65 @@ int dev_read_version(void *buf, __u64 offset, size_t len)
 }
 
 #ifdef WITH_ANDROID
-static int sparse_read_blk(__u64 block, int count, void *buf)
+static int sparse_read_blk(__u64 block, int count, void *buf,
+			   bool metadata_decrypt)
 {
 	int i;
 	char *out = buf;
 	__u64 cur_block;
+	char *crypt_block;
 
 	for (i = 0; i < count; ++i) {
 		cur_block = block + i;
-		if (blocks[cur_block])
+		if (blocks[cur_block]) {
+			/*
+			 * If metadata_decrypt, caller wants the ciphertext
+			 * *decrypted* with the metadata_key. If
+			 * !metadata_decrypt, caller wants the ciphertext as is.
+			 *
+			 * If block_needs_encryption[cur_block], then cur_block
+			 * is decrypted. Otherwise it is encrypted, and the
+			 * ciphertext is currently stored as the block data.
+			 *
+			 * Hence, if metadata_decrypt && !block_needs_encryption,
+			 * we need to decrypt the (currently encrypted) block
+			 * data, and if !metadata_decrypt &&
+			 * block_needs_encryption, we need to encrypt the
+			 * (currently plaintext) block data
+			 *
+			 * We shouldn't actually need the !metadata_decrypt &&
+			 * block_needs_encryption case, since the only way that
+			 * can happen is if we write an encrypted block and then
+			 * try to read that block's ciphertext (without
+			 * decrypting it), which afaict the f2fs userspace tools
+			 * don't do.
+			 */
+			if (metadata_decrypt != block_needs_encryption[cur_block]) {
+				crypt_block = f2fs_metadata_crypt_blocks(
+						blocks[cur_block], F2FS_BLKSIZE,
+						cur_block,
+						block_needs_encryption[cur_block]);
+				if (!crypt_block)
+					return -EINVAL;
+				block_needs_encryption[cur_block] =
+					!block_needs_encryption[cur_block];
+				if (crypt_block != blocks[cur_block] &&
+				    blocks[cur_block] != zeroed_block) {
+					free(blocks[cur_block]);
+				}
+				blocks[cur_block] = crypt_block;
+			}
 			memcpy(out + (i * F2FS_BLKSIZE),
 					blocks[cur_block], F2FS_BLKSIZE);
+		}
 		else if (blocks)
 			memset(out + (i * F2FS_BLKSIZE), 0, F2FS_BLKSIZE);
 	}
 	return 0;
 }
 
-static int sparse_write_blk(__u64 block, int count, const void *buf)
+static int sparse_write_blk(__u64 block, int count, const void *buf,
+			    bool metadata_encrypt)
 {
 	int i;
 	__u64 cur_block;
@@ -429,13 +475,14 @@ static int sparse_write_blk(__u64 block, int count, const void *buf)
 			if (!blocks[cur_block])
 				return -ENOMEM;
 		}
+		block_needs_encryption[cur_block] = metadata_encrypt;
 		memcpy(blocks[cur_block], in + (i * F2FS_BLKSIZE),
 				F2FS_BLKSIZE);
 	}
 	return 0;
 }
 
-static int sparse_write_zeroed_blk(__u64 block, int count)
+static int sparse_write_zeroed_blk(__u64 block, int count, bool metadata_encrypt)
 {
 	int i;
 	__u64 cur_block;
@@ -444,6 +491,7 @@ static int sparse_write_zeroed_blk(__u64 block, int count)
 		cur_block = block + i;
 		if (blocks[cur_block])
 			continue;
+		block_needs_encryption[cur_block] = metadata_encrypt;
 		blocks[cur_block] = zeroed_block;
 	}
 	return 0;
@@ -461,15 +509,23 @@ static int sparse_import_segment(void *UNUSED(priv), const void *data, int len,
 	if (!nr_blocks || len % F2FS_BLKSIZE)
 		return 0;
 
-	return sparse_write_blk(block, nr_blocks, data);
+	return sparse_write_blk(block, nr_blocks, data, false);
+}
+
+static inline void sparse_replace_block(uint64_t blk_num, char *new_block)
+{
+	if (blocks[cur_block] != zeroed_block)
+		free(blocks[blk_num]);
+	blocks[blk_num] = new_block;
 }
 
 static int sparse_merge_blocks(uint64_t start, uint64_t num, int zero)
 {
-	char *buf;
+	char *buf, *enc_buf;
 	uint64_t i;
+	uint64_t cur_block;
 
-	if (zero) {
+	if (zero && !c.metadata_crypt_key) {
 		blocks[start] = NULL;
 		return sparse_file_add_fill(f2fs_sparse_file, 0x0,
 					F2FS_BLKSIZE * num, start);
@@ -483,9 +539,20 @@ static int sparse_merge_blocks(uint64_t start, uint64_t num, int zero)
 	}
 
 	for (i = 0; i < num; i++) {
-		memcpy(buf + i * F2FS_BLKSIZE, blocks[start + i], F2FS_BLKSIZE);
-		free(blocks[start + i]);
-		blocks[start + i] = NULL;
+		cur_block = start + i;
+		if (block_needs_encryption[cur_block]) {
+			enc_buf = f2fs_metadata_crypt_blocks(blocks[cur_block],
+							     F2FS_BLKSIZE,
+							     cur_block, true);
+			if (!enc_buf)
+				return -ENOMEM;
+
+			if (enc_buf != block[cur_block])
+				sparse_replace_block(cur_block, enc_buf);
+		}
+
+		memcpy(buf + i * F2FS_BLKSIZE, blocks[cur_block], F2FS_BLKSIZE);
+		sparse_replace_block(cur_block, NULL);
 	}
 
 	/* free_sparse_blocks will release this buf. */
@@ -495,9 +562,12 @@ static int sparse_merge_blocks(uint64_t start, uint64_t num, int zero)
 					F2FS_BLKSIZE * num, start);
 }
 #else
-static int sparse_read_blk(__u64 block, int count, void *buf) { return 0; }
-static int sparse_write_blk(__u64 block, int count, const void *buf) { return 0; }
-static int sparse_write_zeroed_blk(__u64 block, int count) { return 0; }
+static int sparse_read_blk(__u64 block, int count, void *buf,
+			   bool metadata_decrypt) { return 0; }
+static int sparse_write_blk(__u64 block, int count, const void *buf,
+			    bool metadata_encrypt) { return 0; }
+static int sparse_write_zeroed_blk(__u64 block, int count,
+				   bool metadata_encrypt) { return 0; }
 #endif
 
 static int __dev_read(void *buf, __u64 offset, size_t len, bool metadata_decrypt)
@@ -509,7 +579,8 @@ static int __dev_read(void *buf, __u64 offset, size_t len, bool metadata_decrypt
 
 	if (c.sparse_mode)
 		return sparse_read_blk(offset / F2FS_BLKSIZE,
-					len / F2FS_BLKSIZE, buf);
+					len / F2FS_BLKSIZE, buf,
+					metadata_decrypt);
 
 	fd = __get_device_fd(&offset);
 	if (fd < 0)
@@ -572,7 +643,8 @@ static int __dev_write(void *buf, __u64 offset, size_t len,
 
 	if (c.sparse_mode)
 		return sparse_write_blk(offset / F2FS_BLKSIZE,
-					len / F2FS_BLKSIZE, buf);
+					len / F2FS_BLKSIZE, buf,
+					metadata_encrypt);
 
 	fd = __get_device_fd(&offset);
 	if (fd < 0)
@@ -635,7 +707,8 @@ int dev_fill(void *buf, __u64 offset, size_t len)
 
 	if (c.sparse_mode)
 		return sparse_write_zeroed_blk(offset / F2FS_BLKSIZE,
-						len / F2FS_BLKSIZE);
+						len / F2FS_BLKSIZE,
+						true);
 
 	fd = __get_device_fd(&offset);
 	if (fd < 0)
@@ -725,6 +798,12 @@ int f2fs_init_sparse_file(void)
 		return -1;
 	}
 
+	block_needs_encryption = calloc(blocks_count, sizeof(bool));
+	if (!block_needs_encryption) {
+		MSG(0, "\tError: Calloc Failed for block encryption bookkeeping!!!\n");
+		return -1;
+	}
+
 	zeroed_block = calloc(1, F2FS_BLKSIZE);
 	if (!zeroed_block) {
 		MSG(0, "\tError: Calloc Failed for zeroed block!!!\n");
-- 
2.29.2.729.g45daf8777d-goog



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
