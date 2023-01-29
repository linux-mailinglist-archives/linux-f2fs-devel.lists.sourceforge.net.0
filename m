Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id A250167FEDB
	for <lists+linux-f2fs-devel@lfdr.de>; Sun, 29 Jan 2023 13:19:43 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1pM6ep-0008DY-JI;
	Sun, 29 Jan 2023 12:19:38 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <willy@infradead.org>) id 1pM6ej-0008DR-Bf
 for linux-f2fs-devel@lists.sourceforge.net;
 Sun, 29 Jan 2023 12:19:32 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=HThgw7sl6uJJTesezO0n2kqBMrE2goYpe6c6Ta3USks=; b=juO05FznSKKPQclIs/a5CyEEV4
 0y297ZG6t+2jlZ4JbBhR76WVtKrrhDgGdnCh+75h7ZYSkojfJMQT+TlDl3YYmi8YCecOAyIIH746f
 uClbWJk1gX2/kmTzQhHGWkZsgoZ/QH2qgFkY8/EfovVD0N0s+traWxHrnlqGYLsUJtEc=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:Message-Id:Date:Subject:Cc:To:From
 :Sender:Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=HThgw7sl6uJJTesezO0n2kqBMrE2goYpe6c6Ta3USks=; b=L
 VNtENAcJLoLOPHx3jpBLdtoRya9nnXp5GoinGshEyO/LAjz2juyyCocMZPeyENqFjeLmfue5ihIjx
 UVdaHtfPaLsvVHZZLE0/86QydvgLCRbs9rcxhhzCMlN6bUWmNLgZa2AJAk18Qg/dGZ0fPOAWoAWOe
 iAFUjAfOJCgEcyO8=;
Received: from [90.155.50.34] (helo=casper.infradead.org)
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1pM6eT-00018c-MK for linux-f2fs-devel@lists.sourceforge.net;
 Sun, 29 Jan 2023 12:19:32 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:MIME-Version:
 Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:In-Reply-To:References;
 bh=HThgw7sl6uJJTesezO0n2kqBMrE2goYpe6c6Ta3USks=; b=EefxzS7qsdrMJ33t6t/RxOs1cF
 FV582ZbD9kbJF1oWPtMVHZZ7x8wivZHz9NBnafc9EQr/0K2vJQU+Z0x7LqcsLDBKk+e5XE+FULm5m
 ysdDb9I5zBGFpLdZHmgIt+D1JbL8vXQ0/lI3Tmd9NiWQBASUfqnjCFIWJWcvte7Q1yxLxVnbgjD3C
 hT9MxPZMQLKwITnYkbVY2WgKQpbC0tP1yhBCGCK2cTygOA/QbYOvtLUxyRApWKYorNRdIKmxUUiJe
 epIgGDbsjR/AiXpV3k+fDCKBFtiSlyugH1dyoHv4LUIeXcSMxiWoQEEh8gcw1SD/cLJRSC0C8yszK
 p5EULVgg==;
Received: from willy by casper.infradead.org with local (Exim 4.94.2 #2 (Red
 Hat Linux)) id 1pM6e5-009QuN-2U; Sun, 29 Jan 2023 12:18:53 +0000
From: "Matthew Wilcox (Oracle)" <willy@infradead.org>
To: "Theodore Y . Ts'o" <tytso@mit.edu>, Jaegeuk Kim <jaegeuk@kernel.org>,
 Eric Biggers <ebiggers@kernel.org>, linux-fscrypt@vger.kernel.org
Date: Sun, 29 Jan 2023 12:18:51 +0000
Message-Id: <20230129121851.2248378-1-willy@infradead.org>
X-Mailer: git-send-email 2.37.1
MIME-Version: 1.0
X-Spam-Score: 1.1 (+)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: Both f2fs and ext4 end up passing the ciphertext page to
 wbc_account_cgroup_owner().
 At the moment, the ciphertext page appears to belong to no cgroup, so it
 is accounted to the root_mem_cgroup instea [...] 
 Content analysis details:   (1.1 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 0.0 SPF_NONE               SPF: sender does not publish an SPF Record
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 1.3 RDNS_NONE Delivered to internal network by a host with no rDNS
X-Headers-End: 1pM6eT-00018c-MK
Subject: [f2fs-dev] [PATCH] fscrypt: Copy the memcg information to the
 ciphertext page
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
Cc: linux-fsdevel@vger.kernel.org, linux-ext4@vger.kernel.org,
 stable@vger.kernel.org, "Matthew Wilcox \(Oracle\)" <willy@infradead.org>,
 linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

Both f2fs and ext4 end up passing the ciphertext page to
wbc_account_cgroup_owner().  At the moment, the ciphertext page appears
to belong to no cgroup, so it is accounted to the root_mem_cgroup instead
of whatever cgroup the original page was in.

It's hard to say how far back this is a bug.  The crypto code shared
between ext4 & f2fs was created in May 2015 with commit 0b81d0779072,
but neither filesystem did anything with memcg_data before then.  memcg
writeback accounting was added to ext4 in July 2015 in commit 001e4a8775f6
and it wasn't added to f2fs until January 2018 (commit 578c647879f7).

I'm going with the ext4 commit since this is the first commit where
there was a difference in behaviour between encrypted and unencrypted
filesystems.

Fixes: 001e4a8775f6 ("ext4: implement cgroup writeback support")
Cc: stable@vger.kernel.org
Signed-off-by: Matthew Wilcox (Oracle) <willy@infradead.org>
---
 fs/crypto/crypto.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/fs/crypto/crypto.c b/fs/crypto/crypto.c
index e78be66bbf01..a4e76f96f291 100644
--- a/fs/crypto/crypto.c
+++ b/fs/crypto/crypto.c
@@ -205,6 +205,9 @@ struct page *fscrypt_encrypt_pagecache_blocks(struct page *page,
 	}
 	SetPagePrivate(ciphertext_page);
 	set_page_private(ciphertext_page, (unsigned long)page);
+#ifdef CONFIG_MEMCG
+	ciphertext_page->memcg_data = page->memcg_data;
+#endif
 	return ciphertext_page;
 }
 EXPORT_SYMBOL(fscrypt_encrypt_pagecache_blocks);
-- 
2.35.1



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
