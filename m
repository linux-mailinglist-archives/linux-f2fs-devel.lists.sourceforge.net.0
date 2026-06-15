Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id yTqeCPDjL2pJIgUAu9opvQ
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 15 Jun 2026 13:37:20 +0200
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 259A4685C43
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 15 Jun 2026 13:37:19 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=lists.sourceforge.net header.s=beta header.b=Mj1eRUr3;
	dkim=fail ("body hash did not verify") header.d=sourceforge.net header.s=x header.b=IXgRlpaB;
	dkim=fail ("body hash did not verify") header.d=sf.net header.s=x header.b="R jRTd9K";
	dkim=fail ("body hash did not verify") header.d=rosa.ru header.s=mail header.b=G753B7a2;
	spf=pass (mail.lfdr.de: domain of linux-f2fs-devel-bounces@lists.sourceforge.net designates 216.105.38.7 as permitted sender) smtp.mailfrom=linux-f2fs-devel-bounces@lists.sourceforge.net;
	dmarc=pass (policy=none) header.from=lists.sourceforge.net
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:MIME-Version:Message-Id:Date:To:Sender:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=siJDWypfhLP+ZWTtE+Qce8NaW5ZcGluYD6m7qSqIWBQ=; b=Mj1eRUr3ZSeHkhdgqLLApuoV+y
	OT96LRRXAV3GsLA1Flj1lRt8MOgoOqu4ueFAGKo1ZZMWJsCFBoVk4N76rSa5zgpjIfklHcWpBjZBL
	R9giLGD/I9JoQSdEseHyxJpnjaDn/4fSD5m8klJP1tXvXqjXFRo+vcxx+SKBGahq0c/Y=;
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1wZ5cu-0003Ji-QZ;
	Mon, 15 Jun 2026 11:37:10 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <m.lobanov@rosa.ru>) id 1wZ5cS-0003J2-9t
 for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 15 Jun 2026 11:36:42 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=5d2OOaI9LDy9ZqSPENY4d2Q3vHMKfgmp0U0BULnYdbQ=; b=IXgRlpaB+yAU181xzF0zObnEip
 3ggFiSWF/ehkjV5jom+4KBzVJD69jUddJ+WA0OiKHZLlTv3zZKNptmubGl32s8NwmPuExVp5+Ygzh
 eanZeXdPnfLAMgsp2JWhX8gbciFa7BAl4aa/S0ZX4OgbuHtgqND7PetRd4N3rh2O1M70=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:Message-Id:Date:Subject:Cc:To:From
 :Sender:Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=5d2OOaI9LDy9ZqSPENY4d2Q3vHMKfgmp0U0BULnYdbQ=; b=R
 jRTd9K1sFhu5XMDG5QjYG8Ekb6A64yaihGHtz12wfQ2TE6so9rre1K8Txp3F+49maS+7mkmk1wME9
 TN0GtKRuqpkXxzQVWH7QvzkPeWtt4ps1qqlpVisiqEFVa79CK0nHPQl2CWHxY+3S8/rkIzinQpfhk
 r9B/UFJ3dXQMZC/Y=;
Received: from forward101d.mail.yandex.net ([178.154.239.212])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1wZ5cM-0005il-Kl for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 15 Jun 2026 11:36:41 +0000
Received: from mail-nwsmtp-smtp-production-main-59.iva.yp-c.yandex.net
 (mail-nwsmtp-smtp-production-main-59.iva.yp-c.yandex.net
 [IPv6:2a02:6b8:c0c:1e05:0:640:3290:0])
 by forward101d.mail.yandex.net (Yandex) with ESMTPS id 9783DC02D3;
 Mon, 15 Jun 2026 14:36:26 +0300 (MSK)
Received: by mail-nwsmtp-smtp-production-main-59.iva.yp-c.yandex.net (smtp)
 with ESMTPSA id GaN2WgugYeA0-3m5p74q2; 
 Mon, 15 Jun 2026 14:36:25 +0300
X-Yandex-Fwd: 1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=rosa.ru; s=mail;
 t=1781523386; bh=5d2OOaI9LDy9ZqSPENY4d2Q3vHMKfgmp0U0BULnYdbQ=;
 h=Message-Id:Date:Cc:Subject:To:From;
 b=G753B7a2ifAGN4BF3f9homXyHipbdK/B+ghblT8R5hQmdSx432KScPgcQcNsunVS4
 BeMI5Lx+1QEB0loRacXypMHScgkWLTO6M/6dDs6QZG7A+skVV623TQ9tbuPgwogXn0
 4uo4QqsE+bT8A0iNb67r1d9hIp9DsMYjKSerHPg4=
To: Jaegeuk Kim <jaegeuk@kernel.org>,
	Chao Yu <chao@kernel.org>
Date: Mon, 15 Jun 2026 14:36:13 +0300
Message-Id: <20260615113613.20762-1-m.lobanov@rosa.ru>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
MIME-Version: 1.0
X-Spam-Score: 0.8 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-2.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  When updating an atomic-write file, f2fs_write_begin() may
 read the previously written data back from the COW inode:
 prepare_atomic_write_begin()
 locates the block in the COW inode and sets use_cow, a [...] 
 Content analysis details:   (0.8 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 1.0 RCVD_IN_UCE2           RBL: IP Subnet Listed in UCEPROTECT Level 2
 [178.154.239.212 listed in dnsbl-2.uceprotect.net]
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
X-Headers-End: 1wZ5cM-0005il-Kl
Subject: [f2fs-dev] [PATCH v2] f2fs: read COW data with the original inode
 during atomic write
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
From: Mikhail Lobanov via Linux-f2fs-devel
 <linux-f2fs-devel@lists.sourceforge.net>
Reply-To: Mikhail Lobanov <m.lobanov@rosa.ru>
Cc: lvc-project@linuxtesting.org, m.lobanov@rosa.ru,
 linux-kernel@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net,
 daehojeong@google.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-8.61 / 15.00];
	WHITELIST_DMARC(-7.00)[sourceforge.net:D:+];
	DMARC_POLICY_ALLOW_WITH_FAILURES(-0.50)[];
	RWL_MAILSPIKE_EXCELLENT(-0.40)[216.105.38.7:from];
	R_SPF_ALLOW(-0.20)[+ip4:216.105.38.7];
	MAILLIST(-0.20)[mailman];
	R_DKIM_ALLOW(-0.20)[lists.sourceforge.net:s=beta];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DKIM_MIXED(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DMARC_POLICY_ALLOW(0.00)[lists.sourceforge.net,none];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:jaegeuk@kernel.org,m:chao@kernel.org,m:lvc-project@linuxtesting.org,m:m.lobanov@rosa.ru,m:linux-kernel@vger.kernel.org,m:linux-f2fs-devel@lists.sourceforge.net,m:daehojeong@google.com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[linux-f2fs-devel@lists.sourceforge.net,linux-f2fs-devel-bounces@lists.sourceforge.net];
	TO_DN_SOME(0.00)[];
	R_DKIM_REJECT(0.00)[sourceforge.net:s=x,sf.net:s=x,rosa.ru:s=mail];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	FORWARDED(0.00)[linux-f2fs-devel@lists.sourceforge.net];
	REPLYTO_DOM_NEQ_FROM_DOM(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[lists.sourceforge.net:+,sourceforge.net:-,sf.net:-,rosa.ru:-];
	RCVD_COUNT_FIVE(0.00)[5];
	ALIAS_RESOLVED(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[linux-f2fs-devel@lists.sourceforge.net,linux-f2fs-devel-bounces@lists.sourceforge.net];
	REPLYTO_DOM_NEQ_TO_DOM(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[7];
	TAGGED_RCPT(0.00)[linux-f2fs-devel];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:11320, ipnet:216.105.32.0/21, country:US];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	HAS_REPLYTO(0.00)[m.lobanov@rosa.ru]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 259A4685C43

When updating an atomic-write file, f2fs_write_begin() may read the
previously written data back from the COW inode:
prepare_atomic_write_begin() locates the block in the COW inode and sets
use_cow, and the read bio is then built with the COW inode:

	f2fs_submit_page_read(use_cow ? F2FS_I(inode)->cow_inode : inode,
			      ...);

and f2fs_grab_read_bio() decides whether to schedule fs-layer decryption
(STEP_DECRYPT) for the bio based on that inode via
fscrypt_inode_uses_fs_layer_crypto().

However, the folio being filled belongs to the original inode
(folio->mapping->host == inode), and the data stored in the COW block was
encrypted (or left as plaintext) using the original inode's context, not
the COW inode's -- see f2fs_encrypt_one_page(), which keys off
fio->page->mapping->host.  fscrypt_decrypt_pagecache_blocks() likewise
operates on folio->mapping->host.

The COW inode is created as a tmpfile in the parent directory and inherits
its encryption policy from there.  With test_dummy_encryption the newly
created COW inode gets the dummy policy and becomes encrypted, while a
pre-existing regular file -- created before the policy applied, e.g.
already present in the on-disk image -- stays unencrypted.  The read
path then sets STEP_DECRYPT based on the encrypted COW inode and calls
fscrypt_decrypt_pagecache_blocks() on a folio whose host (the unencrypted
original inode) has a NULL ->i_crypt_info, dereferencing it:

  Oops: general protection fault, probably for non-canonical address ...
  KASAN: null-ptr-deref in range [0x0000000000000008-0x000000000000000f]
  RIP: 0010:fscrypt_decrypt_pagecache_blocks+0xa0/0x310
  Workqueue: f2fs_post_read_wq f2fs_post_read_work
  Call Trace:
   fscrypt_decrypt_bio+0x1eb/0x340
   f2fs_post_read_work+0xba/0x140
   process_one_work+0x91c/0x1a40
   worker_thread+0x677/0xe90
   kthread+0x2bc/0x3a0

The COW inode is only needed to locate the on-disk block, and that block
address is already resolved into @blkaddr by prepare_atomic_write_begin()
via __find_data_block(cow_inode, ...); f2fs_submit_page_read() then reads
from that physical @blkaddr directly, so the inode argument only selects
the post-read crypto context, not which block is fetched.  Reading with
@inode therefore returns the same (latest, not-yet-committed) COW data,
while making both the fs-layer decryption decision and the inline crypto
path use the correct (original inode's) key.

With the COW inode no longer used at the read site, the use_cow flag has no
remaining consumer; drop it from f2fs_write_begin() and
prepare_atomic_write_begin().

Fixes: 591fc34e1f98 ("f2fs: use cow inode data when updating atomic write")
Cc: stable@vger.kernel.org
Signed-off-by: Mikhail Lobanov <m.lobanov@rosa.ru>
Reviewed-by: Chao Yu <chao@kernel.org>
---
v2: drop the now-unused use_cow flag from f2fs_write_begin() and
    prepare_atomic_write_begin() (Chao Yu); no functional change beyond
    v1.  Carried Chao's Reviewed-by as the cleanup was his request.
    Rebased on current mainline (f2fs_submit_page_read() now takes a
    fsverity_info argument and returns void).

 fs/f2fs/data.c | 17 ++++++++++++-----
 1 file changed, 11 insertions(+), 6 deletions(-)

diff --git a/fs/f2fs/data.c b/fs/f2fs/data.c
index 8d4f1e75dee3..9016272b68c7 100644
--- a/fs/f2fs/data.c
+++ b/fs/f2fs/data.c
@@ -3822,7 +3822,7 @@ static int __reserve_data_block(struct inode *inode, pgoff_t index,
 
 static int prepare_atomic_write_begin(struct f2fs_sb_info *sbi,
 			struct folio *folio, loff_t pos, unsigned int len,
-			block_t *blk_addr, bool *node_changed, bool *use_cow)
+			block_t *blk_addr, bool *node_changed)
 {
 	struct inode *inode = folio->mapping->host;
 	struct inode *cow_inode = F2FS_I(inode)->cow_inode;
@@ -3839,7 +3839,6 @@ static int prepare_atomic_write_begin(struct f2fs_sb_info *sbi,
 	if (err) {
 		return err;
 	} else if (*blk_addr != NULL_ADDR) {
-		*use_cow = true;
 		return 0;
 	}
 
@@ -3873,7 +3872,6 @@ static int f2fs_write_begin(const struct kiocb *iocb,
 	struct folio *folio;
 	pgoff_t index = pos >> PAGE_SHIFT;
 	bool need_balance = false;
-	bool use_cow = false;
 	block_t blkaddr = NULL_ADDR;
 	int err = 0;
 
@@ -3936,7 +3934,7 @@ static int f2fs_write_begin(const struct kiocb *iocb,
 
 	if (f2fs_is_atomic_file(inode))
 		err = prepare_atomic_write_begin(sbi, folio, pos, len,
-					&blkaddr, &need_balance, &use_cow);
+					&blkaddr, &need_balance);
 	else
 		err = prepare_write_begin(sbi, folio, pos, len,
 					&blkaddr, &need_balance);
@@ -3976,8 +3974,15 @@ static int f2fs_write_begin(const struct kiocb *iocb,
 			err = -EFSCORRUPTED;
 			goto put_folio;
 		}
-		f2fs_submit_page_read(use_cow ? F2FS_I(inode)->cow_inode :
-						inode,
+		/*
+		 * Although the block may be stored in the COW inode, the folio
+		 * belongs to @inode and its data was encrypted (or not) using
+		 * @inode's context (see f2fs_encrypt_one_page()).  Read with
+		 * @inode so the post-read decryption decision matches the
+		 * folio's owner; otherwise an unencrypted @inode whose COW inode
+		 * is encrypted hits a NULL ->i_crypt_info on decryption.
+		 */
+		f2fs_submit_page_read(inode,
 				      NULL, /* can't write to fsverity files */
 				      folio, blkaddr, 0, true);
 

-- 
2.34.1



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
