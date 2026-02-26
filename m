Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id WE6TL6VdoGlSiwQAu9opvQ
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	for <lists+linux-f2fs-devel@lfdr.de>; Thu, 26 Feb 2026 15:50:13 +0100
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 0FE6B1A7EAD
	for <lists+linux-f2fs-devel@lfdr.de>; Thu, 26 Feb 2026 15:50:12 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Subject:MIME-Version:References:In-Reply-To:Message-ID:Date:To:From:Sender:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=M6sxQ0kAtrJUKuBCdmR9hoak2CcgK7AWGuvuUGOocS0=; b=aZQ/VowzlwKJXDOY86luNFiZz3
	xHQqRgPwiCcqL5buMYzcGw9e2ewpdZwIXXGnreQ+CWBNUtDUckzXH/E1jfsXXpRTYw2CiD1xJyxp1
	TC18VJpY0iFjLFSgiNw6Aon0HupiGpnL091khm655j9zEt8NWpmNylRXYFVHWBDDliSA=;
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1vvcgp-0007Ej-C9;
	Thu, 26 Feb 2026 14:50:08 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95) (envelope-from
 <BATV+c5cab09b19de097b6dd3+8222+infradead.org+hch@bombadil.srs.infradead.org>)
 id 1vvcgk-0007EB-Qf for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 26 Feb 2026 14:50:04 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=wdIEsKTzA9SnbF5IiASm761ocVgdBQM29TC5lUjPX2c=; b=ReEt7Z+yTHmyT4YK3OmK6YqJUD
 tWspVDqXPo9OsMJDwMYWS+0VjVkh8lGgZU5PgH36RJpmX8/FxU3t4BjjY9ajiYL4KAmF+ZhU316JQ
 ICIrnj7XTzloU+uUGQPqpX75CexfpC3jVKJGIP2cnKvaX4+CIbL2fMiyTkiw11sIa1sI=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=wdIEsKTzA9SnbF5IiASm761ocVgdBQM29TC5lUjPX2c=; b=VF1YjrGPoFIXs2u515a7oxufym
 bxqeyTcq+S0aCPwYuf6UqHod2vhd3Jqtm7rC2WT8t0GTl4C7k1DKOxeEeysP9K9IN8ny4s0xhzxq3
 dBDud939rcBc8nGZugjPp10OoWTh/0RlfqmIscu8m1B3OSqmAyaPe84VyGGI8VgYOmP8=;
Received: from bombadil.infradead.org ([198.137.202.133])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1vvcgk-0000Rn-GX for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 26 Feb 2026 14:50:03 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender
 :Reply-To:Content-Type:Content-ID:Content-Description;
 bh=wdIEsKTzA9SnbF5IiASm761ocVgdBQM29TC5lUjPX2c=; b=AM5a6lH8QBV7r3VGXzAiWJ9gB0
 jgLPsfbFRfea51sZM7mCdiHd/UhEP0rcDgx13btlsfNyltlGpyrNMtC546mEPrU2FTEtQhgcJTfph
 M+J38sFp6s6UHxmEfI3XMyow3APfefz4SjoJLx3ANk0vfud3F4ExMi4qu2nC8g120IaQloykKA/Kx
 T5vJ8+sIDs0roUmhmJWurURtPawval24xcp30kWvFfvqAzSzxWebcdQ0ZvNw1FISH/h3l8oEfjYnV
 0dKG2ATg+R0cCvw2HoVo82/KokMlYai+gc8baTtQFYOSvdqVsX3Zvkko6Qv8Ib6OhHPHPT5b1yUQH
 72KOmYtA==;
Received: from [4.28.11.157] (helo=localhost)
 by bombadil.infradead.org with esmtpsa (Exim 4.98.2 #2 (Red Hat Linux))
 id 1vvcgd-00000006NaF-37tW; Thu, 26 Feb 2026 14:49:55 +0000
From: Christoph Hellwig <hch@lst.de>
To: Eric Biggers <ebiggers@kernel.org>
Date: Thu, 26 Feb 2026 06:49:21 -0800
Message-ID: <20260226144954.142278-2-hch@lst.de>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260226144954.142278-1-hch@lst.de>
References: <20260226144954.142278-1-hch@lst.de>
MIME-Version: 1.0
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by
 bombadil.infradead.org. See http://www.infradead.org/rpr.html
X-Spam-Score: 0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-2.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  Make io_submit_init_bio complete by also initializing the
 write hint. Signed-off-by: Christoph Hellwig <hch@lst.de> ---
 fs/ext4/page-io.c | 8 ++++---- 1 file changed, 4 insertions(+),
 4 deletions(-) diff --git a/fs/ext4/page-io.c
 b/fs/ext4/page-io.c index a8c95eee91b7..a3644d6cb65f 100644 ---
 a/fs/ext4/page-io.c
 +++ b/fs/ext4/page-io.c @@ -416,6 +416,7 @@ void ext4_io_submit_init(struct
 ext4_io_s [...] 
 Content analysis details:   (0.2 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 0.2 HEADER_FROM_DIFFERENT_DOMAINS From and EnvelopeFrom 2nd level mail
 domains are different
X-Headers-End: 1vvcgk-0000Rn-GX
Subject: [f2fs-dev] [PATCH 01/14] ext4: initialize the write hint in
 io_submit_init_bio
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
Cc: Christian Brauner <brauner@kernel.org>, "Theodore Y. Ts'o" <tytso@mit.edu>,
 "Darrick J. Wong" <djwong@kernel.org>, linux-f2fs-devel@lists.sourceforge.net,
 linux-fscrypt@vger.kernel.org, Andreas Dilger <adilger.kernel@dilger.ca>,
 linux-fsdevel@vger.kernel.org, Jaegeuk Kim <jaegeuk@kernel.org>,
 linux-ext4@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.01 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	RWL_MAILSPIKE_EXCELLENT(-0.40)[216.105.38.7:from];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:216.105.38.7:c];
	R_DKIM_ALLOW(-0.20)[lists.sourceforge.net:s=beta];
	MIME_GOOD(-0.10)[text/plain];
	DMARC_POLICY_SOFTFAIL(0.10)[lst.de : SPF not aligned (relaxed), DKIM not aligned (relaxed),none];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	DKIM_MIXED(0.00)[];
	ARC_NA(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:ebiggers@kernel.org,m:brauner@kernel.org,m:tytso@mit.edu,m:djwong@kernel.org,m:linux-f2fs-devel@lists.sourceforge.net,m:linux-fscrypt@vger.kernel.org,m:adilger.kernel@dilger.ca,m:linux-fsdevel@vger.kernel.org,m:jaegeuk@kernel.org,m:linux-ext4@vger.kernel.org,s:lists@lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	FORWARDED(0.00)[linux-f2fs-devel@lists.sourceforge.net];
	FORGED_SENDER(0.00)[hch@lst.de,linux-f2fs-devel-bounces@lists.sourceforge.net];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	R_DKIM_REJECT(0.00)[sourceforge.net:s=x,sf.net:s=x,infradead.org:s=bombadil.20210309];
	DKIM_TRACE(0.00)[lists.sourceforge.net:+,sourceforge.net:-,sf.net:-,infradead.org:-];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	NEURAL_HAM(-0.00)[-0.999];
	FROM_NEQ_ENVFROM(0.00)[hch@lst.de,linux-f2fs-devel-bounces@lists.sourceforge.net];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TAGGED_RCPT(0.00)[linux-f2fs-devel];
	RCPT_COUNT_SEVEN(0.00)[10];
	ASN(0.00)[asn:11320, ipnet:216.105.32.0/21, country:US];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[]
X-Rspamd-Queue-Id: 0FE6B1A7EAD
X-Rspamd-Action: no action

Make io_submit_init_bio complete by also initializing the write hint.

Signed-off-by: Christoph Hellwig <hch@lst.de>
---
 fs/ext4/page-io.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/fs/ext4/page-io.c b/fs/ext4/page-io.c
index a8c95eee91b7..a3644d6cb65f 100644
--- a/fs/ext4/page-io.c
+++ b/fs/ext4/page-io.c
@@ -416,6 +416,7 @@ void ext4_io_submit_init(struct ext4_io_submit *io,
 }
 
 static void io_submit_init_bio(struct ext4_io_submit *io,
+			       struct inode *inode,
 			       struct buffer_head *bh)
 {
 	struct bio *bio;
@@ -430,6 +431,7 @@ static void io_submit_init_bio(struct ext4_io_submit *io,
 	bio->bi_end_io = ext4_end_bio;
 	bio->bi_private = ext4_get_io_end(io->io_end);
 	io->io_bio = bio;
+	io->io_bio->bi_write_hint = inode->i_write_hint;
 	io->io_next_block = bh->b_blocknr;
 	wbc_init_bio(io->io_wbc, bio);
 }
@@ -445,10 +447,8 @@ static void io_submit_add_bh(struct ext4_io_submit *io,
 submit_and_retry:
 		ext4_io_submit(io);
 	}
-	if (io->io_bio == NULL) {
-		io_submit_init_bio(io, bh);
-		io->io_bio->bi_write_hint = inode->i_write_hint;
-	}
+	if (io->io_bio == NULL)
+		io_submit_init_bio(io, inode, bh);
 	if (!bio_add_folio(io->io_bio, io_folio, bh->b_size, bh_offset(bh)))
 		goto submit_and_retry;
 	wbc_account_cgroup_owner(io->io_wbc, folio, bh->b_size);
-- 
2.47.3



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
