Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id nc6AAjirImpobwEAu9opvQ
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	for <lists+linux-f2fs-devel@lfdr.de>; Fri, 05 Jun 2026 12:55:52 +0200
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 332386478BD
	for <lists+linux-f2fs-devel@lfdr.de>; Fri, 05 Jun 2026 12:55:51 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=lists.sourceforge.net header.s=beta header.b=m8Nkdb5b;
	dkim=fail ("body hash did not verify") header.d=sourceforge.net header.s=x header.b=ciwuGdMJ;
	dkim=fail ("body hash did not verify") header.d=sf.net header.s=x header.b="A v9hnMQ";
	dkim=fail ("body hash did not verify") header.d=rosa.ru header.s=mail header.b=knUqC+WD;
	spf=pass (mail.lfdr.de: domain of linux-f2fs-devel-bounces@lists.sourceforge.net designates 216.105.38.7 as permitted sender) smtp.mailfrom=linux-f2fs-devel-bounces@lists.sourceforge.net;
	dmarc=pass (policy=none) header.from=lists.sourceforge.net
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:MIME-Version:Message-Id:Date:To:Sender:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=93885MYx3/9HiB3fRwGahvm6TMoOcQyqbgpBYdze+Pg=; b=m8Nkdb5b53RghRfsQ/NtPSYGiT
	AZ5vfF5rZUh2LPhOpBy85pnDo7XbFKpmYVzn0RQeySMwrmvpKfGV0y/2JL2z1LylfW0FwWn3Vzrgv
	H7jdIHrgji86GppCivlaxp2ed+hX8ytiLj691a5nZuJX7Vm0N/Glk/bk1R/5sxgDo3ko=;
Received: from [127.0.0.1] (helo=sfs-ml-3.v29.lw.sourceforge.com)
	by sfs-ml-3.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1wVSDG-0006KJ-K6;
	Fri, 05 Jun 2026 10:55:43 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-3.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <m.lobanov@rosa.ru>) id 1wVSCx-0006Jn-D1
 for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 05 Jun 2026 10:55:24 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=roqDwFCKSOfqoEvMH3HcV0q1plvbGQsfEEkLVszHKiA=; b=ciwuGdMJU19SsSU2i/oUe1Xpat
 2gL2MLYypLgquHlReAuvbXdOnRf8VG12M0fIKxpuYc6hYxTUz+tmfZWvk69hYLXBUEx9xS7MlMctS
 hRLQcMAnWKAvOIxax/Fex1nIjhNIfcR+LRHCV8LZZQFIlrapopv22c+ldQOX/bho6Axs=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:Message-Id:Date:Subject:Cc:To:From
 :Sender:Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=roqDwFCKSOfqoEvMH3HcV0q1plvbGQsfEEkLVszHKiA=; b=A
 v9hnMQyjsb67NRyKgbEknT/6oBCv/LjEsVYpdocTtUxI6+eTEA5/FjbnyOWBVe9MTC8ZVXCZpvwQV
 9NNWX1/g+e6dpucEyUb147eu96fLqTtwv3XWEKPkJ7M4Sx32eV9ayFxIdwZ9RbVi4cfVjIvmlQ18E
 NcHUeT9J8I7opsn4=;
Received: from forward200a.mail.yandex.net ([178.154.239.93])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1wVSCt-0003tq-SL for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 05 Jun 2026 10:55:24 +0000
Received: from forward103a.mail.yandex.net (forward103a.mail.yandex.net
 [IPv6:2a02:6b8:c0e:500:1:45:d181:d103])
 by forward200a.mail.yandex.net (Yandex) with ESMTPS id C8CADC3E8B
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Fri, 05 Jun 2026 13:38:45 +0300 (MSK)
Received: from mail-nwsmtp-smtp-production-main-60.vla.yp-c.yandex.net
 (mail-nwsmtp-smtp-production-main-60.vla.yp-c.yandex.net
 [IPv6:2a02:6b8:c0f:4c18:0:640:5600:0])
 by forward103a.mail.yandex.net (Yandex) with ESMTPS id C1E9F804C0;
 Fri, 05 Jun 2026 13:38:38 +0300 (MSK)
Received: by mail-nwsmtp-smtp-production-main-60.vla.yp-c.yandex.net (smtp)
 with ESMTPSA id ZcffmqLe7a60-kaRNz9XR; 
 Fri, 05 Jun 2026 13:38:37 +0300
X-Yandex-Fwd: 1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=rosa.ru; s=mail;
 t=1780655918; bh=roqDwFCKSOfqoEvMH3HcV0q1plvbGQsfEEkLVszHKiA=;
 h=Message-Id:Date:Cc:Subject:To:From;
 b=knUqC+WDUAgnqxDKtEh2dL3DL5dQWXYQLusjUQPo7MUozKS5ebwl+3MFZW/HGzuUp
 mM+9j+8wjSbropEF3yhxkZ6LbDLvPa1kBwQhOa82kf0UcoCI+z3A33aL1bQ42RAUe1
 m6Ona2oyCubeeWta9gejEwsVQTeY9p9AcgP0bT7U=
To: jaegeuk@kernel.org,
	Chao Yu <chao@kernel.org>
Date: Fri,  5 Jun 2026 13:38:34 +0300
Message-Id: <20260605103834.14894-1-m.lobanov@rosa.ru>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
MIME-Version: 1.0
X-Spam-Score: -0.2 (/)
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
 Content analysis details:   (-0.2 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
X-Headers-End: 1wVSCt-0003tq-SL
Subject: [f2fs-dev] [PATCH] f2fs: read COW data with the original inode
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
Cc: lvc-project@linuxtesting.org, linux-kernel@vger.kernel.org,
 daehojeong@google.com, stable@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-8.61 / 15.00];
	WHITELIST_DMARC(-7.00)[sourceforge.net:D:+];
	DMARC_POLICY_ALLOW_WITH_FAILURES(-0.50)[];
	RWL_MAILSPIKE_EXCELLENT(-0.40)[216.105.38.7:from];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:216.105.38.7];
	R_DKIM_ALLOW(-0.20)[lists.sourceforge.net:s=beta];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DMARC_POLICY_ALLOW(0.00)[lists.sourceforge.net,none];
	DKIM_MIXED(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:jaegeuk@kernel.org,m:chao@kernel.org,m:lvc-project@linuxtesting.org,m:linux-kernel@vger.kernel.org,m:daehojeong@google.com,m:stable@vger.kernel.org,m:linux-f2fs-devel@lists.sourceforge.net,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[linux-f2fs-devel@lists.sourceforge.net,linux-f2fs-devel-bounces@lists.sourceforge.net];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	R_DKIM_REJECT(0.00)[sourceforge.net:s=x,sf.net:s=x,rosa.ru:s=mail];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	FORWARDED(0.00)[linux-f2fs-devel@lists.sourceforge.net];
	REPLYTO_DOM_NEQ_FROM_DOM(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[lists.sourceforge.net:+,sourceforge.net:-,sf.net:-,rosa.ru:-];
	RCVD_COUNT_FIVE(0.00)[6];
	PREVIOUSLY_DELIVERED(0.00)[linux-f2fs-devel@lists.sourceforge.net];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[linux-f2fs-devel@lists.sourceforge.net,linux-f2fs-devel-bounces@lists.sourceforge.net];
	REPLYTO_DOM_NEQ_TO_DOM(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	HAS_REPLYTO(0.00)[m.lobanov@rosa.ru];
	RCPT_COUNT_SEVEN(0.00)[7];
	ASN(0.00)[asn:11320, ipnet:216.105.32.0/21, country:US];
	TAGGED_RCPT(0.00)[linux-f2fs-devel];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[rosa.ru:mid,rosa.ru:email,rosa.ru:replyto]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 332386478BD

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
address is already resolved into @blkaddr; the data's crypto state belongs
to the original inode.  Read with the original inode so the post-read
decryption decision matches the folio's owner.  This also makes the inline
crypto path use the correct (original inode's) key.

Fixes: 591fc34e1f98 ("f2fs: use cow inode data when updating atomic write")
Cc: stable@vger.kernel.org
Signed-off-by: Mikhail Lobanov <m.lobanov@rosa.ru>
---
 fs/f2fs/data.c | 14 ++++++++++++--
 1 file changed, 12 insertions(+), 2 deletions(-)

diff --git a/fs/f2fs/data.c b/fs/f2fs/data.c
index cf05014fa5e3..8f6c22537e9f 100644
--- a/fs/f2fs/data.c
+++ b/fs/f2fs/data.c
@@ -3961,8 +3961,18 @@ static int f2fs_write_begin(const struct kiocb *iocb,
 			err = -EFSCORRUPTED;
 			goto put_folio;
 		}
-		f2fs_submit_page_read(use_cow ? F2FS_I(inode)->cow_inode :
-						inode,
+		/*
+		 * Although the block is stored in the COW inode, the folio
+		 * belongs to @inode and its data was encrypted (or left as
+		 * plaintext) using @inode's context, not the COW inode's; see
+		 * f2fs_encrypt_one_page(), which keys off fio->page->mapping->
+		 * host.  fscrypt_decrypt_pagecache_blocks() likewise operates
+		 * on folio->mapping->host.  Read with @inode so the post-read
+		 * decryption decision matches the folio's owner; otherwise an
+		 * unencrypted @inode whose COW inode is encrypted would hit a
+		 * NULL ->i_crypt_info during decryption.
+		 */
+		f2fs_submit_page_read(inode,
 				      NULL, /* can't write to fsverity files */
 				      folio, blkaddr, 0, true);
 
-- 
2.39.5 (Apple Git-154)



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
