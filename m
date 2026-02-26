Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id AOc0JaVdoGm3igQAu9opvQ
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	for <lists+linux-f2fs-devel@lfdr.de>; Thu, 26 Feb 2026 15:50:13 +0100
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E9331A7EAB
	for <lists+linux-f2fs-devel@lfdr.de>; Thu, 26 Feb 2026 15:50:12 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Subject:MIME-Version:References:In-Reply-To:Message-ID:Date:To:From:Sender:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=tVx+EvA8GFFyHc67RdpbrCtVFEHNili5ZvuA8WPzikg=; b=SeonmMYYQ16s9rIjsnDH3oTLnM
	6P1dNkynLtQGoE4cw+Y+7GUolI0YOa7hgGuEH6/UEGMCRi9jVVOhOT9SFjuYKpq5gFKVI3EIAaNKf
	uvH6z/eyajYHijn6ABTk+vd+J+Mj678lvQoiJnA5uriSbngvq+e3TLaAej0d3p0D6nC4=;
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1vvcgo-0003os-KT;
	Thu, 26 Feb 2026 14:50:06 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95) (envelope-from
 <BATV+c5cab09b19de097b6dd3+8222+infradead.org+hch@bombadil.srs.infradead.org>)
 id 1vvcgl-0003oc-J4 for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 26 Feb 2026 14:50:03 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=NoVQIsbZaWVeMYaoymE6GlqeIrC54yXJhWsgztpQSEs=; b=KGtGQQ1YQJwpCJLJ8W2RCoeOps
 FXdnNCLUUIOldIp9HaJYTLqQ+ljL5GGdbiOEjozH3rR57xy7/p0GzH6/pGZOTJd/yNsszsV4ckgPY
 JHLY8tVazAUq1vNMMYDoXiecZh4l69MJA7pVbJ6ppG2JsGhHFhEBLECDXzrSAQQayn+M=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=NoVQIsbZaWVeMYaoymE6GlqeIrC54yXJhWsgztpQSEs=; b=kJwGrPKpVLPEn4gpskki7k0AHx
 Q8jzLsEnSe9IvN2CZP3wHs5YTvDrYEA+OfNeED4+mIGkZuOdf8MuninqJLZldpQ58W49HN0bfAgc9
 u2E1bkaEtewynoll1+wytfoVpEot594G2c7wranBV6UNeeFY1TR0vRC7csNLH+1mKlx8=;
Received: from bombadil.infradead.org ([198.137.202.133])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1vvcgk-0000Rm-GQ for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 26 Feb 2026 14:50:03 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender
 :Reply-To:Content-Type:Content-ID:Content-Description;
 bh=NoVQIsbZaWVeMYaoymE6GlqeIrC54yXJhWsgztpQSEs=; b=XfcK+cvIRGZFkN/js6p1Y/xEr2
 fOzNyiA2gHBOc2SaRrSWq29L2oNzy0QiorrkW1Uwltw1ygP+aeqMzJteDZOvBxwU6l+Cri5gVL6PH
 lSBwhEPyR1xP4DAzC0Hu0C+ef43G9d/YTfMl/jqQirI6bD6SuJ2a1EFWaGdby/esytx1nbNhjxn4+
 A5MnzdhJLgy5Qj+p2JnrTRQDguN43GnqxikRjq2a06s9XufBynaiakBI2UhMzC4bjbwuSNm7pYzAb
 reTD782uj28ZnbJYgPnjb83KyUlz8j5wiWE6xLQumch6rGpmCm7VyxoJhWPhhaLtWr9iO3EVgVDty
 5gwipjxg==;
Received: from [4.28.11.157] (helo=localhost)
 by bombadil.infradead.org with esmtpsa (Exim 4.98.2 #2 (Red Hat Linux))
 id 1vvcge-00000006NaV-0ZWn; Thu, 26 Feb 2026 14:49:56 +0000
From: Christoph Hellwig <hch@lst.de>
To: Eric Biggers <ebiggers@kernel.org>
Date: Thu, 26 Feb 2026 06:49:23 -0800
Message-ID: <20260226144954.142278-4-hch@lst.de>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260226144954.142278-1-hch@lst.de>
References: <20260226144954.142278-1-hch@lst.de>
MIME-Version: 1.0
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by
 bombadil.infradead.org. See http://www.infradead.org/rpr.html
X-Spam-Score: 0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-1.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  Factor out a helper to prepare for making this logic a bit
 more complex in the next commit. Signed-off-by: Christoph Hellwig <hch@lst.de>
 --- fs/ext4/page-io.c | 13 +++++++++++-- 1 file changed, 11 insertions(+),
 2 deletions(-) 
 Content analysis details:   (0.2 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 RCVD_IN_DNSWL_BLOCKED  RBL: ADMINISTRATOR NOTICE: The query to DNSWL
 was blocked.  See
 http://wiki.apache.org/spamassassin/DnsBlocklists#DnsBlocklists-dnsbl-block
 for more information. [198.137.202.133 listed in list.dnswl.org]
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.2 HEADER_FROM_DIFFERENT_DOMAINS From and EnvelopeFrom 2nd level mail
 domains are different
X-Headers-End: 1vvcgk-0000Rm-GQ
Subject: [f2fs-dev] [PATCH 03/14] ext4: factor out a io_submit_need_new_bio
 helper
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
	R_DKIM_ALLOW(-0.20)[lists.sourceforge.net:s=beta];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:216.105.38.7];
	DMARC_POLICY_SOFTFAIL(0.10)[lst.de : SPF not aligned (relaxed), DKIM not aligned (relaxed),none];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	DKIM_MIXED(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:ebiggers@kernel.org,m:brauner@kernel.org,m:tytso@mit.edu,m:djwong@kernel.org,m:linux-f2fs-devel@lists.sourceforge.net,m:linux-fscrypt@vger.kernel.org,m:adilger.kernel@dilger.ca,m:linux-fsdevel@vger.kernel.org,m:jaegeuk@kernel.org,m:linux-ext4@vger.kernel.org,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[hch@lst.de,linux-f2fs-devel-bounces@lists.sourceforge.net];
	MIME_TRACE(0.00)[0:+];
	RCVD_COUNT_THREE(0.00)[4];
	FORWARDED(0.00)[linux-f2fs-devel@lists.sourceforge.net];
	ARC_NA(0.00)[];
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
X-Rspamd-Queue-Id: 0E9331A7EAB
X-Rspamd-Action: no action

Factor out a helper to prepare for making this logic a bit more
complex in the next commit.

Signed-off-by: Christoph Hellwig <hch@lst.de>
---
 fs/ext4/page-io.c | 13 +++++++++++--
 1 file changed, 11 insertions(+), 2 deletions(-)

diff --git a/fs/ext4/page-io.c b/fs/ext4/page-io.c
index 851d1267054a..88226979c503 100644
--- a/fs/ext4/page-io.c
+++ b/fs/ext4/page-io.c
@@ -440,14 +440,23 @@ static void io_submit_init_bio(struct ext4_io_submit *io,
 	wbc_init_bio(io->io_wbc, bio);
 }
 
+static bool io_submit_need_new_bio(struct ext4_io_submit *io,
+				   struct buffer_head *bh)
+{
+	if (bh->b_blocknr != io->io_next_block)
+		return true;
+	if (!fscrypt_mergeable_bio_bh(io->io_bio, bh))
+		return true;
+	return false;
+}
+
 static void io_submit_add_bh(struct ext4_io_submit *io,
 			     struct inode *inode,
 			     struct folio *folio,
 			     struct folio *io_folio,
 			     struct buffer_head *bh)
 {
-	if (io->io_bio && (bh->b_blocknr != io->io_next_block ||
-			   !fscrypt_mergeable_bio_bh(io->io_bio, bh))) {
+	if (io->io_bio && io_submit_need_new_bio(io, bh)) {
 submit_and_retry:
 		ext4_io_submit(io);
 	}
-- 
2.47.3



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
