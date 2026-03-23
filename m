Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id iKEuJeMBwWlUPgQAu9opvQ
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 23 Mar 2026 10:03:31 +0100
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id BEF072EE9F8
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 23 Mar 2026 10:03:30 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Subject:MIME-Version:References:In-Reply-To:Message-ID:Date:To:From:Sender:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=oBibQuWdiBiQFS2S2vyGNDxBtm0qZ5wEw+mSmIHyfpg=; b=H7fhNKMHXIlTX2rWsf3cVMoAxN
	sVYVIlhtB0ZD52erJSabJHkAsKL46ERMhjLbOjg65El5ZlFxj/RkpFb9ANQBXopLE4MsgQpoLZAcF
	kpxJ8x4chLOr1tAPmsE33a4avoubsMlLNf1lMzgyJjLUd/V+TRHeP+1QUMgLXhGuypkA=;
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1w4bBz-0006ff-2q;
	Mon, 23 Mar 2026 09:03:23 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <geoo115@gmail.com>) id 1w4bBx-0006fZ-Rr
 for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 23 Mar 2026 09:03:21 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=dIpObjutcRtHgTXUR+0sMiHzyB3EqgBo8502nsC82hQ=; b=as5mgOHTOmI+ebb06LC800Sypk
 yTLOp9hSJik6FHjSiSFNA6wPSmUHnjlVigQ5dgYlSIaJZFXKEZGa1AC32g18z00g2yGwl7Kr/D2R8
 LnNgUoULF5imBaQ3BLff4n3pKQ56WJrJiATzIVrBRIA6xl/eZQ4FOhfC6UigUltynOoc=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=dIpObjutcRtHgTXUR+0sMiHzyB3EqgBo8502nsC82hQ=; b=cE1sl23jg3QEcQyYWA2YgqM6OY
 Mke7Y/m5Zkbu2YZCm6rdSozUOoOQqZrdbIIHSi04NTyMVg8yyYt/xuKpbhzhRyAxn4HEzKWRSD9lY
 u0VzCnstBQcXcC7jVtH5a/t9d0+PH4DCgRVyj4l8jsxFQmC5iLzLIhz8GfYtZWrJJwvg=;
Received: from mail-wm1-f50.google.com ([209.85.128.50])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1w4bBx-0007MP-Am for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 23 Mar 2026 09:03:21 +0000
Received: by mail-wm1-f50.google.com with SMTP id
 5b1f17b1804b1-4852c9b4158so29410205e9.0
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Mon, 23 Mar 2026 02:03:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1774256590; x=1774861390; darn=lists.sourceforge.net;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=dIpObjutcRtHgTXUR+0sMiHzyB3EqgBo8502nsC82hQ=;
 b=XfCfbgG1gQV/TzuaNWcJcF6ZbAd8BIa2kjCvn56ZiMFGJn5d8rR1yjbQPDlzz5rHXv
 7ZZ85+685VfYEB7t6dGfo3jkVHg7HZLuZpvWV1FUGjEu7D1lpiTXBgZwlDnlc6zBqbcv
 ScdRNJY6QIGBTL7e7HQoUtR3wq/9QYAw9QUNAiR9C8ccEJ6UKMnPtQQjujEiq39ge4LJ
 zFthecIjsp83ick180EHWPqKpjPMr1rz1H160xVm+TYatvT99UVI+CWwMWKO+WMPOlO5
 AA7+aJZP+Yy4jVFy78hAEb1LnMSw4X373AxRy1TOwZ21FvMF4MV9g4r7AO0oxznwLV9q
 lMWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1774256590; x=1774861390;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=dIpObjutcRtHgTXUR+0sMiHzyB3EqgBo8502nsC82hQ=;
 b=d50hQ0u7knIfB4z0Edjko8BtMjOHK/pGv8+Ah9qFwyYtThcKbkiPEfMAp70XweYkTk
 L0BS78dspe5YdsBz1Y/7X2YpIQOG4BZtEL+CCUr5LG3GnrLzsrLUHEmCA1fDE6NVtpS4
 vIf/5IjLnk0iNmUvZkoumZU05xlJVC8z7ls1nQLpBUztZhgZ+AVttXQY9ebn0+svyOed
 Ce4AyTOI23ZM+CP66iLEs17MB3OmNYhP2Sp8jvRNve5XTEaDMT5Oh9ByU/q6hIT3JE25
 3jYuLAlDksR6k6WB5scC6xwJPIYdcvlUPzk1p7dAqw5JGW0ZqUT2hRAt/N7ZbHVmd8yv
 jftg==
X-Forwarded-Encrypted: i=1;
 AJvYcCW3u+9EPMOq+0UzNRoa8r4ZOb0i88ptV6gowvE3ciX1k03ddzEsbD3LFZJhlL7aeqZNEXk2hTOkGxexPdwkYYea@lists.sourceforge.net
X-Gm-Message-State: AOJu0Yyp1ixrDpX8gN8YvxrwLHzwiIqsoDEoJtfpwt1hZqtu8yMLhpyS
 hZb+dDyuXkWxJd5BkHwdB2bDchCx3zCho3eqPsIBthQnYTbRP94tBNeb
X-Gm-Gg: ATEYQzz31S5Kj8OhdzzmxCnT0V9jFNzd4qvYJWZC9aDfAX7iJv6f8/5hJDa+XSDo55j
 VbJyH/nsk1hQPBp2DHap4WO/68D8zwrK5XFkFmIIiiRVj9LOLJQmVyAKCw6eYOJhTHZ9ILvIPyK
 AFJhqNozO+nfLCH+1sfIBWvCReGenNMBwTDqM/Ret5JEwiVUjhXqPoDdLo3LNHijY40XIxuzj1H
 uXG0GcvSIEBZoevLNuQnkz9C8mMy6h4pSXijmw0z9yukB2QMHFUPViwJZ4tn/oNNi6Ppu2dXpK3
 BiqHwFFQb2lTnKTaA702CePQuBT6D1c1BlF+dv+QCE1p774q1hr7Xdkznbmj29bLH6J0jqIwCVf
 B1DGrIjbbLL3Ek07KOJ6dO/MGDIVxVsA7IwVJ6hXnKROYBfDwmbKDJeqYae7iQY1kdlpV2tpWMP
 M2VOszRgtO7zsaqkSxVnNseo8EPro/Us96mSKZgGMK357un5c8aq0kID2SGbbVTkt0Q1e/Z0sPg
 Bz24vxMaxBf5FAnIHQZPccTFgdwwEplIQ==
X-Received: by 2002:a05:600c:3490:b0:487:300:d9ca with SMTP id
 5b1f17b1804b1-4870300db54mr116491665e9.31.1774256589463; 
 Mon, 23 Mar 2026 02:03:09 -0700 (PDT)
Received: from fedora.communityfibre.co.uk
 ([2a02:6b6f:fb26:6400:da6:2a24:3e4a:d588])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-486fe85e4b4sm77598385e9.3.2026.03.23.02.03.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 23 Mar 2026 02:03:08 -0700 (PDT)
From: George Saad <geoo115@gmail.com>
To: Greg KH <gregkh@linuxfoundation.org>
Date: Mon, 23 Mar 2026 09:03:06 +0000
Message-ID: <20260323090306.757911-1-geoo115@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <2026032354-country-saddlebag-5331@gregkh>
References: <2026032354-country-saddlebag-5331@gregkh>
MIME-Version: 1.0
X-Spam-Score: 0.1 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-1.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  In f2fs_compress_write_end_io(), dec_page_count(sbi, type)
 at line 1492 can bring the F2FS_WB_CP_DATA counter to zero,
 unblocking f2fs_wait_on_all_pages()
 in f2fs_put_super() on a concurrent unmount C [...] 
 Content analysis details:   (0.1 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.0 FREEMAIL_FROM Sender email is commonly abused enduser mail provider
 [geoo115(at)gmail.com]
 0.2 FREEMAIL_ENVFROM_END_DIGIT Envelope-from freemail username ends in
 digit [geoo115(at)gmail.com]
 0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [209.85.128.50 listed in wl.mailspike.net]
X-Headers-End: 1w4bBx-0007MP-Am
Subject: [f2fs-dev] [PATCH] f2fs: fix use-after-free of sbi in
 f2fs_compress_write_end_io()
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
Cc: Jaegeuk Kim <jaegeuk@kernel.org>, George Saad <geoo115@gmail.com>,
 linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net
X-Spamd-Result: default: False [-0.01 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	RWL_MAILSPIKE_EXCELLENT(-0.40)[216.105.38.7:from];
	R_SPF_ALLOW(-0.20)[+ip4:216.105.38.7];
	MAILLIST(-0.20)[mailman];
	R_DKIM_ALLOW(-0.20)[lists.sourceforge.net:s=beta];
	MIME_GOOD(-0.10)[text/plain];
	DMARC_POLICY_SOFTFAIL(0.10)[gmail.com : SPF not aligned (relaxed), DKIM not aligned (relaxed),none];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:gregkh@linuxfoundation.org,m:jaegeuk@kernel.org,m:geoo115@gmail.com,m:linux-f2fs-devel@lists.sourceforge.net,s:lists@lfdr.de];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	DKIM_MIXED(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[geoo115@gmail.com,linux-f2fs-devel-bounces@lists.sourceforge.net];
	ARC_NA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	FORGED_SENDER(0.00)[geoo115@gmail.com,linux-f2fs-devel-bounces@lists.sourceforge.net];
	TO_DN_SOME(0.00)[];
	FORWARDED(0.00)[linux-f2fs-devel@lists.sourceforge.net];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	R_DKIM_REJECT(0.00)[sourceforge.net:s=x,sf.net:s=x,gmail.com:s=20230601];
	FROM_HAS_DN(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[linux-f2fs-devel@lists.sourceforge.net];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	FREEMAIL_CC(0.00)[kernel.org,gmail.com,lists.sourceforge.net];
	TAGGED_RCPT(0.00)[linux-f2fs-devel];
	ASN(0.00)[asn:11320, ipnet:216.105.32.0/21, country:US];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DKIM_TRACE(0.00)[lists.sourceforge.net:+,sourceforge.net:-,sf.net:-,gmail.com:-];
	RCPT_COUNT_THREE(0.00)[4];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.sourceforge.net:helo,lists.sourceforge.net:rdns,lists.sourceforge.net:dkim]
X-Rspamd-Queue-Id: BEF072EE9F8
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

In f2fs_compress_write_end_io(), dec_page_count(sbi, type) at line 1492
can bring the F2FS_WB_CP_DATA counter to zero, unblocking
f2fs_wait_on_all_pages() in f2fs_put_super() on a concurrent unmount
CPU. The unmount path then proceeds to call
f2fs_destroy_page_array_cache(sbi) and kfree(sbi). Meanwhile, the bio
completion callback is still executing: when it reaches
page_array_free(sbi, ...), it dereferences sbi->page_array_slab_size
and sbi->page_array_slab within the now-freed f2fs_sb_info structure.

This is the same class of bug as CVE-2026-23234 (which fixed the
equivalent race in f2fs_write_end_io() in data.c), but in the
compressed writeback completion path that was not covered by that fix.

Fix this by caching sbi->page_array_slab and sbi->page_array_slab_size
into local variables at function entry, before dec_page_count(). At
function entry, sbi is guaranteed valid because the F2FS_WB_CP_DATA
counter is still nonzero (this invocation has not yet decremented it),
preventing the unmount path from proceeding past
f2fs_wait_on_all_pages(). The cached values are then used in place of
the post-decrement sbi dereference.

Fixes: 4c8ff709c6 ("f2fs: support data compression")
Signed-off-by: George Saad <geoo115@gmail.com>
---
 fs/f2fs/compress.c | 14 +++++++++++++-
 1 file changed, 13 insertions(+), 1 deletion(-)

diff --git a/fs/f2fs/compress.c b/fs/f2fs/compress.c
index 7b68bf229..c3d837df3 100644
--- a/fs/f2fs/compress.c
+++ b/fs/f2fs/compress.c
@@ -1479,11 +1479,20 @@ void f2fs_compress_write_end_io(struct bio *bio, struct folio *folio)
 {
 	struct page *page = &folio->page;
 	struct f2fs_sb_info *sbi = bio->bi_private;
+	struct kmem_cache *pa_slab = sbi->page_array_slab;
+	unsigned int pa_slab_size = sbi->page_array_slab_size;
 	struct compress_io_ctx *cic = folio->private;
 	enum count_type type = WB_DATA_TYPE(folio,
 				f2fs_is_compressed_page(folio));
 	int i;
 
+	/*
+	 * Cache sbi fields before dec_page_count(), which may unblock
+	 * f2fs_wait_on_all_pages() in the unmount path, allowing
+	 * f2fs_put_super() to free sbi.  At this point sbi is still
+	 * valid because the F2FS_WB_CP_DATA counter is nonzero.
+	 */
+
 	if (unlikely(bio->bi_status != BLK_STS_OK))
 		mapping_set_error(cic->inode->i_mapping, -EIO);
 
@@ -1500,7 +1509,10 @@ void f2fs_compress_write_end_io(struct bio *bio, struct folio *folio)
 		end_page_writeback(cic->rpages[i]);
 	}
 
-	page_array_free(sbi, cic->rpages, cic->nr_rpages);
+	if (likely(sizeof(struct page *) * cic->nr_rpages <= pa_slab_size))
+		kmem_cache_free(pa_slab, cic->rpages);
+	else
+		kfree(cic->rpages);
 	kmem_cache_free(cic_entry_slab, cic);
 }
 
-- 
2.53.0



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
