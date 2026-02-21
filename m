Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id YGCqJj0SmmlpYQMAu9opvQ
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	for <lists+linux-f2fs-devel@lfdr.de>; Sat, 21 Feb 2026 21:14:53 +0100
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id D8C2016DC84
	for <lists+linux-f2fs-devel@lfdr.de>; Sat, 21 Feb 2026 21:14:52 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:MIME-Version:Message-ID:Date:To:Sender:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=cNpb41DbsVyqQefeHm27/MvTBCEitunwAb68GzxeRUE=; b=Z9xL+F/+cIbWLEYMM1AXssab5n
	Kk4Lx0bwvzLNFNvhnGDUW6uZwgK4y6DU6aCvfxe3mR86A+bobSTFfKTko8hqLNVsOOdz3m0dysSt1
	Cg3DoLM6RxCNTFEuxR7IAgsjOnTJGa+WHorKSpqNoLHu1SiSMa89jt1eAyyN5GEsv5+I=;
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1vttNH-0003I8-87;
	Sat, 21 Feb 2026 20:14:47 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <ebiggers@kernel.org>) id 1vttMZ-0003HH-R3
 for linux-f2fs-devel@lists.sourceforge.net;
 Sat, 21 Feb 2026 20:14:03 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:Message-ID:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=Tq7dyRnpR8DT4tW2fzYrLDvg4grSgK/BOZZTSTiYcak=; b=VP2ddybaFgVuMf/brZD5mnIR1D
 1taMcnJkdYBaEL1vyISA9OZF/xkpoliVXf0v7SVzBG6WIVY2S+5eL7yKs2CjSDOR79KaqkWmEdAld
 qgoq+zF+JABo4Uc+YDn9J0ITxsuKeGM3hPpJsWttDNtYpGXNS2c6i5OgkxMwdQMjupvA=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:Cc:To:From
 :Sender:Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=Tq7dyRnpR8DT4tW2fzYrLDvg4grSgK/BOZZTSTiYcak=; b=O
 1RnYUTranmINpSbdsY1KwX0N97sls9BueHpl11VkxuQeNYJEqwWvl3mJIB0AEKMmBX5LoFSj/s55x
 1aE1r8N383UwKEpWb+NTj+Q4uA81PLFgZldQJZcoBi6LYFrY1Hmx4ppzulrazd3/SN91oA8fna/bp
 3GgF6RzrZZC1HcfI=;
Received: from sea.source.kernel.org ([172.234.252.31])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1vttMZ-0003ui-3i for linux-f2fs-devel@lists.sourceforge.net;
 Sat, 21 Feb 2026 20:14:03 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id C06AE41A04;
 Sat, 21 Feb 2026 20:13:52 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6E64EC4CEF7;
 Sat, 21 Feb 2026 20:13:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1771704832;
 bh=XiSyrRdVNg5RaCKPxQSBaWFY6pxU+wD3GORpXVNtZPI=;
 h=From:To:Cc:Subject:Date:From;
 b=tpKpFZJfY4gmoUoOOahFyx6ZeKQaK9Jpcx6A+86olHVTje9Iji+Dn/smneuw+IYzP
 ACgeOZViJoWuR4aceGqxDWeVajBuBVtTkDwXLVK/BIxPbmt3L089CyierAgueJJmUL
 jugtnhqFEQROcK3FpV0oxi478/9iwyy4Nm4Noxjclup2S4gzpMkaJUf0IivwKkQnEm
 32jiiI0kp87649SSfNfUQISW73ZYRbCqe49B04xkNIQ7MP1WE8jCOQNoKGplnjPBM1
 6NxW8PR8BtfDTKnMvmokGxAKUsPeq4ETUyIDOY9xF7iElzHCuiZ3u4IyD9NFzGTlyq
 +aUA9XyMi5TgA==
To: Jaegeuk Kim <jaegeuk@kernel.org>, Chao Yu <chao@kernel.org>,
 linux-f2fs-devel@lists.sourceforge.net
Date: Sat, 21 Feb 2026 12:13:16 -0800
Message-ID: <20260221201316.22025-1-ebiggers@kernel.org>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
X-Spam-Score: -0.3 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-1.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: Since commit 52e7e0d88933 ("fscrypt: Switch to sync_skcipher
 and on-stack requests") eliminated the dynamic allocation of crypto requests, 
 the only remaining dynamic memory allocation done by fscrypt_ [...] 
 Content analysis details:   (-0.3 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1vttMZ-0003ui-3i
Subject: [f2fs-dev] [PATCH] f2fs: remove unreachable code in
 f2fs_encrypt_one_page()
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
Cc: Christoph Hellwig <hch@infradead.org>, Eric Biggers <ebiggers@kernel.org>,
 linux-fscrypt@vger.kernel.org, Vlastimil Babka <vbabka@suse.cz>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-7.61 / 15.00];
	WHITELIST_DMARC(-7.00)[sourceforge.net:D:+];
	MID_RHS_MATCH_TO(1.00)[];
	DMARC_POLICY_ALLOW_WITH_FAILURES(-0.50)[];
	RWL_MAILSPIKE_EXCELLENT(-0.40)[216.105.38.7:from];
	R_SPF_ALLOW(-0.20)[+ip4:216.105.38.7];
	MAILLIST(-0.20)[mailman];
	R_DKIM_ALLOW(-0.20)[lists.sourceforge.net:s=beta];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_MIXED(0.00)[];
	TO_DN_SOME(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	REPLYTO_DOM_EQ_TO_DOM(0.00)[];
	FORWARDED(0.00)[linux-f2fs-devel@lists.sourceforge.net];
	ARC_NA(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER(0.00)[linux-f2fs-devel@lists.sourceforge.net,linux-f2fs-devel-bounces@lists.sourceforge.net];
	FORGED_RECIPIENTS(0.00)[m:jaegeuk@kernel.org,m:chao@kernel.org,m:linux-f2fs-devel@lists.sourceforge.net,m:hch@infradead.org,m:ebiggers@kernel.org,m:linux-fscrypt@vger.kernel.org,m:vbabka@suse.cz,s:lists@lfdr.de];
	R_DKIM_REJECT(0.00)[sourceforge.net:s=x,sf.net:s=x,kernel.org:s=k20201202];
	REPLYTO_DOM_NEQ_FROM_DOM(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[lists.sourceforge.net:+,sourceforge.net:-,sf.net:-,kernel.org:-];
	RCVD_COUNT_FIVE(0.00)[5];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[linux-f2fs-devel@lists.sourceforge.net,linux-f2fs-devel-bounces@lists.sourceforge.net];
	DMARC_POLICY_ALLOW(0.00)[lists.sourceforge.net,none];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TAGGED_RCPT(0.00)[linux-f2fs-devel];
	HAS_REPLYTO(0.00)[ebiggers@kernel.org];
	RCPT_COUNT_SEVEN(0.00)[7];
	ASN(0.00)[asn:11320, ipnet:216.105.32.0/21, country:US];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.sourceforge.net:rdns,lists.sourceforge.net:helo,lists.sourceforge.net:dkim,suse.cz:email]
X-Rspamd-Queue-Id: D8C2016DC84
X-Rspamd-Action: no action

Since commit 52e7e0d88933 ("fscrypt: Switch to sync_skcipher and
on-stack requests") eliminated the dynamic allocation of crypto
requests, the only remaining dynamic memory allocation done by
fscrypt_encrypt_pagecache_blocks() is the bounce page allocation.

The bounce page is allocated from a mempool.  Mempool allocations with
GFP_NOFS never fail.  Therefore, fscrypt_encrypt_pagecache_blocks() can
no longer return -ENOMEM when passed GFP_NOFS.

Remove the now-unreachable code from f2fs_encrypt_one_page().

Suggested-by: Vlastimil Babka <vbabka@suse.cz>
Link: https://lore.kernel.org/all/d9dc2ee1-283d-4467-ad36-a6a4aa557589@suse.cz/
Signed-off-by: Eric Biggers <ebiggers@kernel.org>
---
 fs/f2fs/data.c | 14 ++------------
 1 file changed, 2 insertions(+), 12 deletions(-)

diff --git a/fs/f2fs/data.c b/fs/f2fs/data.c
index 338df7a2aea6..400f0400e13d 100644
--- a/fs/f2fs/data.c
+++ b/fs/f2fs/data.c
@@ -2785,33 +2785,23 @@ static void f2fs_readahead(struct readahead_control *rac)
 int f2fs_encrypt_one_page(struct f2fs_io_info *fio)
 {
 	struct inode *inode = fio_inode(fio);
 	struct folio *mfolio;
 	struct page *page;
-	gfp_t gfp_flags = GFP_NOFS;
 
 	if (!f2fs_encrypted_file(inode))
 		return 0;
 
 	page = fio->compressed_page ? fio->compressed_page : fio->page;
 
 	if (fscrypt_inode_uses_inline_crypto(inode))
 		return 0;
 
-retry_encrypt:
 	fio->encrypted_page = fscrypt_encrypt_pagecache_blocks(page_folio(page),
-					PAGE_SIZE, 0, gfp_flags);
-	if (IS_ERR(fio->encrypted_page)) {
-		/* flush pending IOs and wait for a while in the ENOMEM case */
-		if (PTR_ERR(fio->encrypted_page) == -ENOMEM) {
-			f2fs_flush_merged_writes(fio->sbi);
-			memalloc_retry_wait(GFP_NOFS);
-			gfp_flags |= __GFP_NOFAIL;
-			goto retry_encrypt;
-		}
+					PAGE_SIZE, 0, GFP_NOFS);
+	if (IS_ERR(fio->encrypted_page))
 		return PTR_ERR(fio->encrypted_page);
-	}
 
 	mfolio = filemap_lock_folio(META_MAPPING(fio->sbi), fio->old_blkaddr);
 	if (!IS_ERR(mfolio)) {
 		if (folio_test_uptodate(mfolio))
 			memcpy(folio_address(mfolio),

base-commit: 8934827db5403eae57d4537114a9ff88b0a8460f
-- 
2.53.0



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
