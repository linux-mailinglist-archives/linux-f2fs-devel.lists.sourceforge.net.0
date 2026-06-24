Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id vmbAE81lO2oyXQgAu9opvQ
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 24 Jun 2026 07:06:21 +0200
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C6266BB5A0
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 24 Jun 2026 07:06:20 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=lists.sourceforge.net header.s=beta header.b=GnjokFKd;
	dkim=fail ("body hash did not verify") header.d=sourceforge.net header.s=x header.b=Ehfh50DL;
	dkim=fail ("body hash did not verify") header.d=sf.net header.s=x header.b=BKuHgwQT;
	dkim=fail ("body hash did not verify") header.d=kernel.org header.s=k20260515 header.b=mJp1fqG+;
	spf=pass (mail.lfdr.de: domain of linux-f2fs-devel-bounces@lists.sourceforge.net designates 216.105.38.7 as permitted sender) smtp.mailfrom=linux-f2fs-devel-bounces@lists.sourceforge.net;
	dmarc=pass (policy=none) header.from=lists.sourceforge.net
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:MIME-Version:References:In-Reply-To:
	Message-ID:Date:To:Sender:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=X+Wg4+q6+r4/Se2xle3SnonKasIEY2PUXZHuS72A3cA=; b=GnjokFKdNA4rFpi2rRA5mBoL0E
	wCLPvba+YZ0Hfg/i0/FABUeX8+NLF/LoW6iBaQLVQmeC1+Q2z1uWnSv46RlcN0KXsPwfwq3rPH91R
	76XWwqtAkcvKT6rYy0Q3F/CbIAanXjs7o32rQXY81WPPcfu7ukcy+SgGvAf0dpluz0WE=;
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1wcFoX-0006s6-55;
	Wed, 24 Jun 2026 05:06:17 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <ebiggers@kernel.org>) id 1wcFoV-0006ri-93
 for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 24 Jun 2026 05:06:15 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=zHcMypoNh6FUAYJTXgnZTyd0K4ySEkTyYoTxs/MQzNQ=; b=Ehfh50DLwXWo5tCMatW4IPVTGP
 ZwXSac6hw0bAMLaTZ5Vd81KIgDd4Jbtn+mmIpk/ulchSES2QLVxrPrcEKCwTKGCswrw69CRGVJ1/Z
 Fic7FRhPuPRkGoPcjB6KU5baWkxwiu9cxpTEc16tzYp1P7+i0jZDUB+Idy/mzhKRler8=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=zHcMypoNh6FUAYJTXgnZTyd0K4ySEkTyYoTxs/MQzNQ=; b=BKuHgwQTiaAw/vBGTSa68o6D1G
 c3BYniDuaKkVh90MIVXt8c0dHS/SrGRFErnFRzslvJ9PM8YGDjEBDNZ6aRO/rKlnz73sEJQJqNaPa
 u1grDY1i4Qamt1tIisubt2sF5UWVmBoRxqIb3ih0MWjT223xtLJ8NFx5LTip0QpvVX9w=;
Received: from tor.source.kernel.org ([172.105.4.254])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1wcFoT-0004mf-7a for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 24 Jun 2026 05:06:15 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
 by tor.source.kernel.org (Postfix) with ESMTP id C863A60200;
 Wed, 24 Jun 2026 05:06:02 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E6BB61F00A3F;
 Wed, 24 Jun 2026 05:06:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
 s=k20260515; t=1782277562;
 bh=zHcMypoNh6FUAYJTXgnZTyd0K4ySEkTyYoTxs/MQzNQ=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References;
 b=mJp1fqG+rt2+NZJ66CgqMOKnyaKJa1RflnGpASavtDQeY9O3mJszdfzt9pbxtPIMe
 fETjyEUvU0HCHmusyAalICvawF44n0ivQtvg5Td1cRQimzTVxrfBJETvCAXwEqJxh2
 ib9P69+fTmkhF/cjvsDdiealGDs4rCljuHHBqwn93R+se5ChFVio6k6SHAam6SBK6B
 fWbnTTPqA0zu5C9j7kdKSU10M8WCxu+ZOdIOuNyABy/GbWQV2EsFr5DOplCXPxZTJ1
 ECakLEfE2VeB5GreSGbR3h0ZIxWFDwDYhcAwrmdBD9l2aPhDppQKSiM+X1j49I4VKL
 4Wi0Syjz1bEEA==
To: linux-fscrypt@vger.kernel.org
Date: Tue, 23 Jun 2026 22:03:24 -0700
Message-ID: <20260624050334.124606-7-ebiggers@kernel.org>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260624050334.124606-1-ebiggers@kernel.org>
References: <20260624050334.124606-1-ebiggers@kernel.org>
MIME-Version: 1.0
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-2.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: Now that fscrypt's file contents en/decryption is always
 implemented
 using blk-crypto when the filesystem is block-based, the fs-layer en/decryption
 code in ext4 is unused code. Remove it. Note that this makes possible some
 additional cleanups, but they're left to later commits: 
 Content analysis details:   (-0.2 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
X-Headers-End: 1wcFoT-0004mf-7a
Subject: [f2fs-dev] [PATCH 06/16] ext4: Remove fs-layer file contents
 en/decryption code
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
From: Eric Biggers via Linux-f2fs-devel
 <linux-f2fs-devel@lists.sourceforge.net>
Reply-To: Eric Biggers <ebiggers@kernel.org>
Cc: Ritesh Harjani <ritesh.list@gmail.com>, Theodore Ts'o <tytso@mit.edu>,
 Zhang Yi <yi.zhang@huawei.com>, linux-f2fs-devel@lists.sourceforge.net,
 linux-block@vger.kernel.org, Andreas Dilger <adilger.kernel@dilger.ca>,
 Ojaswin Mujoo <ojaswin@linux.ibm.com>, Baokun Li <libaokun@linux.alibaba.com>,
 Jaegeuk Kim <jaegeuk@kernel.org>, linux-fsdevel@vger.kernel.org,
 Jan Kara <jack@suse.cz>, linux-ext4@vger.kernel.org,
 Christoph Hellwig <hch@lst.de>, Eric Biggers <ebiggers@kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-7.11 / 15.00];
	WHITELIST_DMARC(-7.00)[sourceforge.net:D:+];
	SUSPICIOUS_RECIPS(1.50)[];
	DMARC_POLICY_ALLOW_WITH_FAILURES(-0.50)[];
	RWL_MAILSPIKE_EXCELLENT(-0.40)[216.105.38.7:from];
	R_DKIM_ALLOW(-0.20)[lists.sourceforge.net:s=beta];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:216.105.38.7:c];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:linux-fscrypt@vger.kernel.org,m:ritesh.list@gmail.com,m:tytso@mit.edu,m:yi.zhang@huawei.com,m:linux-f2fs-devel@lists.sourceforge.net,m:linux-block@vger.kernel.org,m:adilger.kernel@dilger.ca,m:ojaswin@linux.ibm.com,m:libaokun@linux.alibaba.com,m:jaegeuk@kernel.org,m:linux-fsdevel@vger.kernel.org,m:jack@suse.cz,m:linux-ext4@vger.kernel.org,m:hch@lst.de,m:ebiggers@kernel.org,m:riteshlist@gmail.com,s:lists@lfdr.de];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_MIXED(0.00)[];
	FREEMAIL_CC(0.00)[gmail.com,mit.edu,huawei.com,lists.sourceforge.net,vger.kernel.org,dilger.ca,linux.ibm.com,linux.alibaba.com,kernel.org,suse.cz,lst.de];
	ARC_NA(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[15];
	TO_DN_SOME(0.00)[];
	DMARC_POLICY_ALLOW(0.00)[lists.sourceforge.net,none];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER(0.00)[linux-f2fs-devel@lists.sourceforge.net,linux-f2fs-devel-bounces@lists.sourceforge.net];
	FORWARDED(0.00)[linux-f2fs-devel@lists.sourceforge.net];
	R_DKIM_REJECT(0.00)[sourceforge.net:s=x,sf.net:s=x,kernel.org:s=k20260515];
	DKIM_TRACE(0.00)[lists.sourceforge.net:+,sourceforge.net:-,sf.net:-,kernel.org:-];
	REPLYTO_DOM_NEQ_TO_DOM(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	ALIAS_RESOLVED(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[linux-f2fs-devel@lists.sourceforge.net,linux-f2fs-devel-bounces@lists.sourceforge.net];
	REPLYTO_DOM_NEQ_FROM_DOM(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	HAS_REPLYTO(0.00)[ebiggers@kernel.org];
	TAGGED_RCPT(0.00)[linux-f2fs-devel];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:11320, ipnet:216.105.32.0/21, country:US];
	FORGED_SENDER_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.sourceforge.net:helo,lists.sourceforge.net:rdns,lists.sourceforge.net:from_mime,lists.sourceforge.net:dkim,lists.sourceforge.net:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 1C6266BB5A0

Now that fscrypt's file contents en/decryption is always implemented
using blk-crypto when the filesystem is block-based, the fs-layer
en/decryption code in ext4 is unused code.  Remove it.

Note that this makes possible some additional cleanups, but they're left
to later commits:

  - Making ext4_bio_write_folio() return void
  - Renaming bio_post_read_ctx to fsverity_ctx or similar, and
    allocating the pool only when fsverity support is needed

Signed-off-by: Eric Biggers <ebiggers@kernel.org>
---
 fs/ext4/crypto.c   |  1 -
 fs/ext4/inode.c    | 28 ++--------------
 fs/ext4/page-io.c  | 68 ++-------------------------------------
 fs/ext4/readpage.c | 80 ++++------------------------------------------
 4 files changed, 13 insertions(+), 164 deletions(-)

diff --git a/fs/ext4/crypto.c b/fs/ext4/crypto.c
index 6b809ac80ef7..9265cfe62c83 100644
--- a/fs/ext4/crypto.c
+++ b/fs/ext4/crypto.c
@@ -235,11 +235,10 @@ static bool ext4_has_stable_inodes(struct super_block *sb)
 
 const struct fscrypt_operations ext4_cryptops = {
 	.inode_info_offs	= (int)offsetof(struct ext4_inode_info, i_crypt_info) -
 				  (int)offsetof(struct ext4_inode_info, vfs_inode),
 	.is_block_based		= 1,
-	.needs_bounce_pages	= 1,
 	.has_32bit_inodes	= 1,
 	.supports_subblock_data_units = 1,
 	.legacy_key_prefix	= "ext4:",
 	.get_context		= ext4_get_context,
 	.set_context		= ext4_set_context,
diff --git a/fs/ext4/inode.c b/fs/ext4/inode.c
index ce99807c5f5b..8eb2af481129 100644
--- a/fs/ext4/inode.c
+++ b/fs/ext4/inode.c
@@ -1260,21 +1260,10 @@ int ext4_block_write_begin(handle_t *handle, struct folio *folio,
 		if (should_journal_data)
 			ext4_journalled_zero_new_buffers(handle, inode, folio,
 							 from, to);
 		else
 			folio_zero_new_buffers(folio, from, to);
-	} else if (fscrypt_inode_uses_fs_layer_crypto(inode)) {
-		for (i = 0; i < nr_wait; i++) {
-			int err2;
-
-			err2 = fscrypt_decrypt_pagecache_blocks(folio,
-						blocksize, bh_offset(wait[i]));
-			if (err2) {
-				clear_buffer_uptodate(wait[i]);
-				err = err2;
-			}
-		}
 	}
 
 	return err;
 }
 
@@ -3827,13 +3816,13 @@ static int ext4_iomap_begin(struct inode *inode, loff_t offset, loff_t length,
 
 	if (ret < 0)
 		return ret;
 out:
 	/*
-	 * When inline encryption is enabled, sometimes I/O to an encrypted file
-	 * has to be broken up to guarantee DUN contiguity.  Handle this by
-	 * limiting the length of the mapping returned.
+	 * Sometimes I/O to an encrypted file has to be broken up to guarantee
+	 * DUN contiguity.  Handle this by limiting the length of the mapping
+	 * returned.
 	 */
 	map.m_len = fscrypt_limit_io_blocks(inode, map.m_lblk, map.m_len);
 
 	/*
 	 * Before returning to iomap, let's ensure the allocated mapping
@@ -4079,21 +4068,10 @@ static struct buffer_head *ext4_load_tail_bh(struct inode *inode, loff_t from)
 
 	if (!buffer_uptodate(bh)) {
 		err = ext4_read_bh_lock(bh, 0, true);
 		if (err)
 			goto unlock;
-		if (fscrypt_inode_uses_fs_layer_crypto(inode)) {
-			/* We expect the key to be set. */
-			BUG_ON(!fscrypt_has_encryption_key(inode));
-			err = fscrypt_decrypt_pagecache_blocks(folio,
-							       blocksize,
-							       bh_offset(bh));
-			if (err) {
-				clear_buffer_uptodate(bh);
-				goto unlock;
-			}
-		}
 	}
 	return bh;
 
 unlock:
 	folio_unlock(folio);
diff --git a/fs/ext4/page-io.c b/fs/ext4/page-io.c
index bc674aa4a656..557f44178d87 100644
--- a/fs/ext4/page-io.c
+++ b/fs/ext4/page-io.c
@@ -101,22 +101,16 @@ static void ext4_finish_bio(struct bio *bio)
 {
 	struct folio_iter fi;
 
 	bio_for_each_folio_all(fi, bio) {
 		struct folio *folio = fi.folio;
-		struct folio *io_folio = NULL;
 		struct buffer_head *bh, *head;
 		size_t bio_start = fi.offset;
 		size_t bio_end = bio_start + fi.length;
 		unsigned under_io = 0;
 		unsigned long flags;
 
-		if (fscrypt_is_bounce_folio(folio)) {
-			io_folio = folio;
-			folio = fscrypt_pagecache_folio(folio);
-		}
-
 		if (bio->bi_status) {
 			int err = blk_status_to_errno(bio->bi_status);
 			mapping_set_error(folio->mapping, err);
 		}
 		bh = head = folio_buffers(folio);
@@ -137,14 +131,12 @@ static void ext4_finish_bio(struct bio *bio)
 				set_buffer_write_io_error(bh);
 				buffer_io_error(bh);
 			}
 		} while ((bh = bh->b_this_page) != head);
 		spin_unlock_irqrestore(&head->b_uptodate_lock, flags);
-		if (!under_io) {
-			fscrypt_free_bounce_page(&io_folio->page);
+		if (!under_io)
 			folio_end_writeback(folio);
-		}
 	}
 }
 
 static void ext4_release_io_end(ext4_io_end_t *io_end)
 {
@@ -451,33 +443,30 @@ static bool io_submit_need_new_bio(struct ext4_io_submit *io,
 }
 
 static void io_submit_add_bh(struct ext4_io_submit *io,
 			     struct inode *inode,
 			     struct folio *folio,
-			     struct folio *io_folio,
 			     struct buffer_head *bh)
 {
 	if (io->io_bio && io_submit_need_new_bio(io, inode, folio, bh)) {
 submit_and_retry:
 		ext4_io_submit(io);
 	}
 	if (io->io_bio == NULL)
 		io_submit_init_bio(io, inode, folio, bh);
-	if (!bio_add_folio(io->io_bio, io_folio, bh->b_size, bh_offset(bh)))
+	if (!bio_add_folio(io->io_bio, folio, bh->b_size, bh_offset(bh)))
 		goto submit_and_retry;
 	wbc_account_cgroup_owner(io->io_wbc, folio, bh->b_size);
 	io->io_next_block++;
 }
 
 int ext4_bio_write_folio(struct ext4_io_submit *io, struct folio *folio,
 		size_t len)
 {
-	struct folio *io_folio = folio;
 	struct inode *inode = folio->mapping->host;
 	unsigned block_start;
 	struct buffer_head *bh, *head;
-	int ret = 0;
 	int nr_to_submit = 0;
 	struct writeback_control *wbc = io->io_wbc;
 	bool keep_towrite = false;
 
 	BUG_ON(!folio_test_locked(folio));
@@ -547,67 +536,16 @@ int ext4_bio_write_folio(struct ext4_io_submit *io, struct folio *folio,
 		return 0;
 	}
 
 	bh = head = folio_buffers(folio);
 
-	/*
-	 * If any blocks are being written to an encrypted file, encrypt them
-	 * into a bounce page.  For simplicity, just encrypt until the last
-	 * block which might be needed.  This may cause some unneeded blocks
-	 * (e.g. holes) to be unnecessarily encrypted, but this is rare and
-	 * can't happen in the common case of blocksize == PAGE_SIZE.
-	 */
-	if (fscrypt_inode_uses_fs_layer_crypto(inode)) {
-		gfp_t gfp_flags = GFP_NOFS;
-		unsigned int enc_bytes = round_up(len, i_blocksize(inode));
-		struct page *bounce_page;
-
-		/*
-		 * Since bounce page allocation uses a mempool, we can only use
-		 * a waiting mask (i.e. request guaranteed allocation) on the
-		 * first page of the bio.  Otherwise it can deadlock.
-		 */
-		if (io->io_bio)
-			gfp_flags = GFP_NOWAIT;
-	retry_encrypt:
-		bounce_page = fscrypt_encrypt_pagecache_blocks(folio,
-					enc_bytes, 0, gfp_flags);
-		if (IS_ERR(bounce_page)) {
-			ret = PTR_ERR(bounce_page);
-			if (ret == -ENOMEM &&
-			    (io->io_bio || wbc->sync_mode == WB_SYNC_ALL)) {
-				gfp_t new_gfp_flags = GFP_NOFS;
-				if (io->io_bio)
-					ext4_io_submit(io);
-				else
-					new_gfp_flags |= __GFP_NOFAIL;
-				memalloc_retry_wait(gfp_flags);
-				gfp_flags = new_gfp_flags;
-				goto retry_encrypt;
-			}
-
-			printk_ratelimited(KERN_ERR "%s: ret = %d\n", __func__, ret);
-			folio_redirty_for_writepage(wbc, folio);
-			do {
-				if (buffer_async_write(bh)) {
-					clear_buffer_async_write(bh);
-					set_buffer_dirty(bh);
-				}
-				bh = bh->b_this_page;
-			} while (bh != head);
-
-			return ret;
-		}
-		io_folio = page_folio(bounce_page);
-	}
-
 	__folio_start_writeback(folio, keep_towrite);
 
 	/* Now submit buffers to write */
 	do {
 		if (!buffer_async_write(bh))
 			continue;
-		io_submit_add_bh(io, inode, folio, io_folio, bh);
+		io_submit_add_bh(io, inode, folio, bh);
 	} while ((bh = bh->b_this_page) != head);
 
 	return 0;
 }
diff --git a/fs/ext4/readpage.c b/fs/ext4/readpage.c
index dd3627c71732..8af183798a33 100644
--- a/fs/ext4/readpage.c
+++ b/fs/ext4/readpage.c
@@ -50,24 +50,14 @@
 #define NUM_PREALLOC_POST_READ_CTXS	128
 
 static struct kmem_cache *bio_post_read_ctx_cache;
 static mempool_t *bio_post_read_ctx_pool;
 
-/* postprocessing steps for read bios */
-enum bio_post_read_step {
-	STEP_INITIAL = 0,
-	STEP_DECRYPT,
-	STEP_VERITY,
-	STEP_MAX,
-};
-
 struct bio_post_read_ctx {
 	struct bio *bio;
 	struct fsverity_info *vi;
 	struct work_struct work;
-	unsigned int cur_step;
-	unsigned int enabled_steps;
 };
 
 static void __read_end_io(struct bio *bio)
 {
 	struct folio_iter fi;
@@ -77,80 +67,33 @@ static void __read_end_io(struct bio *bio)
 	if (bio->bi_private)
 		mempool_free(bio->bi_private, bio_post_read_ctx_pool);
 	bio_put(bio);
 }
 
-static void bio_post_read_processing(struct bio_post_read_ctx *ctx);
-
-static void decrypt_work(struct work_struct *work)
-{
-	struct bio_post_read_ctx *ctx =
-		container_of(work, struct bio_post_read_ctx, work);
-	struct bio *bio = ctx->bio;
-
-	if (fscrypt_decrypt_bio(bio))
-		bio_post_read_processing(ctx);
-	else
-		__read_end_io(bio);
-}
-
 static void verity_work(struct work_struct *work)
 {
 	struct bio_post_read_ctx *ctx =
 		container_of(work, struct bio_post_read_ctx, work);
 	struct bio *bio = ctx->bio;
 	struct fsverity_info *vi = ctx->vi;
 
 	/*
-	 * fsverity_verify_bio() may call readahead() again, and although verity
-	 * will be disabled for that, decryption may still be needed, causing
-	 * another bio_post_read_ctx to be allocated.  So to guarantee that
-	 * mempool_alloc() never deadlocks we must free the current ctx first.
-	 * This is safe because verity is the last post-read step.
+	 * Free the bio_post_read_ctx right away, since it's no longer needed.
+	 * This relieves the pressure on the mempool as much as possible.
 	 */
-	BUILD_BUG_ON(STEP_VERITY + 1 != STEP_MAX);
 	mempool_free(ctx, bio_post_read_ctx_pool);
 	bio->bi_private = NULL;
 
 	fsverity_verify_bio(vi, bio);
 
 	__read_end_io(bio);
 }
 
-static void bio_post_read_processing(struct bio_post_read_ctx *ctx)
-{
-	/*
-	 * We use different work queues for decryption and for verity because
-	 * verity may require reading metadata pages that need decryption, and
-	 * we shouldn't recurse to the same workqueue.
-	 */
-	switch (++ctx->cur_step) {
-	case STEP_DECRYPT:
-		if (ctx->enabled_steps & (1 << STEP_DECRYPT)) {
-			INIT_WORK(&ctx->work, decrypt_work);
-			fscrypt_enqueue_decrypt_work(&ctx->work);
-			return;
-		}
-		ctx->cur_step++;
-		fallthrough;
-	case STEP_VERITY:
-		if (IS_ENABLED(CONFIG_FS_VERITY) &&
-		    ctx->enabled_steps & (1 << STEP_VERITY)) {
-			INIT_WORK(&ctx->work, verity_work);
-			fsverity_enqueue_verify_work(&ctx->work);
-			return;
-		}
-		ctx->cur_step++;
-		fallthrough;
-	default:
-		__read_end_io(ctx->bio);
-	}
-}
-
 static bool bio_post_read_required(struct bio *bio)
 {
-	return bio->bi_private && !bio->bi_status;
+	return IS_ENABLED(CONFIG_FS_VERITY) && bio->bi_private &&
+	       !bio->bi_status;
 }
 
 /*
  * I/O completion handler for multipage BIOs.
  *
@@ -166,37 +109,28 @@ static bool bio_post_read_required(struct bio *bio)
 static void mpage_end_io(struct bio *bio)
 {
 	if (bio_post_read_required(bio)) {
 		struct bio_post_read_ctx *ctx = bio->bi_private;
 
-		ctx->cur_step = STEP_INITIAL;
-		bio_post_read_processing(ctx);
+		INIT_WORK(&ctx->work, verity_work);
+		fsverity_enqueue_verify_work(&ctx->work);
 		return;
 	}
 	__read_end_io(bio);
 }
 
 static void ext4_set_bio_post_read_ctx(struct bio *bio,
 				       const struct inode *inode,
 				       struct fsverity_info *vi)
 {
-	unsigned int post_read_steps = 0;
-
-	if (fscrypt_inode_uses_fs_layer_crypto(inode))
-		post_read_steps |= 1 << STEP_DECRYPT;
-
-	if (vi)
-		post_read_steps |= 1 << STEP_VERITY;
-
-	if (post_read_steps) {
+	if (vi) {
 		/* Due to the mempool, this never fails. */
 		struct bio_post_read_ctx *ctx =
 			mempool_alloc(bio_post_read_ctx_pool, GFP_NOFS);
 
 		ctx->bio = bio;
 		ctx->vi = vi;
-		ctx->enabled_steps = post_read_steps;
 		bio->bi_private = ctx;
 	}
 }
 
 static inline loff_t ext4_readpage_limit(struct inode *inode)
-- 
2.54.0



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
