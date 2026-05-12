Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id KMZpJc+8AmonwAEAu9opvQ
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 12 May 2026 07:38:23 +0200
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 30B2E51A3AA
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 12 May 2026 07:38:23 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Subject:MIME-Version:References:In-Reply-To:Message-ID:Date:To:From:Sender:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=PXI/N/fhG1xg1/1/QTKNdB54vwL6mzQeD9VSupr7DhQ=; b=MOhmr8rtHuxtyJBu/jPzlp4n4o
	Gb8QUqAy+/8sfQkXE4wHakgnzYGGUCN9AbxMnaReRSMgazEVsLuomSDqG78ixuQEvswAoO9yOlu78
	FQTElDUum2NH+Yfdhn8CZWdWcpq8vbxPfkfnquvgvde4VD+B7yD87CFwmkDxzXuQPMPk=;
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1wMfoz-0007zo-SU;
	Tue, 12 May 2026 05:38:21 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95) (envelope-from
 <BATV+9f3c1ea353498f61ccd0+8297+infradead.org+hch@bombadil.srs.infradead.org>)
 id 1wMfov-0007zL-RA for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 12 May 2026 05:38:17 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=3njmnPYKfXyGxBuvKgaH5GivvgicyjwAkMmByhnmVfs=; b=lIDqZx8WR7AA4dDF94JWfdwVRA
 EqxVNQ9nf/hV39RLYBlUL8lVqj1G3db7+lUKAQ+sKMu5Ewl8zE/9Da2td1/ovBtvXWXK3zoLVEggf
 2jnX3ML1Z6ObbgvehNvhtzNxMfZyI79JnsWH+s156dtJkm/PDg6jRn7pc9PRdFUNSTdA=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=3njmnPYKfXyGxBuvKgaH5GivvgicyjwAkMmByhnmVfs=; b=PZj8RbJBvsOwppPomwtq2SHYGU
 0I6xs4ZY5fv9XEveV6X7wslN3crBDH3AnEJCs1FrTVZ5r96s/wT0zzUaZfXZKy4Cbt4VNMYWkq/Mi
 79GYq/+Fj6V1b3EShKjv6hr6ftiIs9vCp4bT3AfiEJoBbYgrfPw19qgYIpHPcKG675yY=;
Received: from bombadil.infradead.org ([198.137.202.133])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1wMfos-0004sp-J9 for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 12 May 2026 05:38:16 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender
 :Reply-To:Content-Type:Content-ID:Content-Description;
 bh=3njmnPYKfXyGxBuvKgaH5GivvgicyjwAkMmByhnmVfs=; b=LiH5UIQaX7gQOxBmNMmgiW2c9M
 Sw4TUVUPyiAW+otc+CLl1MH8cNxafrJTke/+5h9ekIgkCCE6wUvC0Wp/hsAmzQNABnrIxxB0la6W2
 K+LEhQeH/uU0PTzGQAOaFzioXzpzvrHVQb9T7pD4RjGUwIVj2SuL6wcODRIImWU8mDrJOyqjI519P
 iBAKU++IsFSrs/7KErD6eQrhXvg9hTd/dViywq3t2OWMC0EJF1+UjOFOKgyCW5nmJEynP6BjIbd8B
 EJroeuDhIKqm7kAp5yFSu5BfA2aMaik60jjBnsCTMAt7RoUPFZ2/yWx0pC0EtQgHohGzZbgEPGihn
 jJKGY1xg==;
Received: from
 2a02-8389-2341-5b80-decc-1a96-daaa-a2cc.cable.dynamic.v6.surfer.at
 ([2a02:8389:2341:5b80:decc:1a96:daaa:a2cc] helo=localhost)
 by bombadil.infradead.org with esmtpsa (Exim 4.99.1 #2 (Red Hat Linux))
 id 1wMfoa-0000000FfVQ-2Hu2; Tue, 12 May 2026 05:37:56 +0000
From: Christoph Hellwig <hch@lst.de>
To: Andrew Morton <akpm@linux-foundation.org>, Chris Li <chrisl@kernel.org>,
 Kairui Song <kasong@tencent.com>
Date: Tue, 12 May 2026 07:35:27 +0200
Message-ID: <20260512053625.2950900-12-hch@lst.de>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260512053625.2950900-1-hch@lst.de>
References: <20260512053625.2950900-1-hch@lst.de>
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
 Content preview:  struct swap_extent is only used inside of mm/swapfile.c, so
 move it there. Signed-off-by: Christoph Hellwig <hch@lst.de> ---
 include/linux/swap.h
 | 15 mm/swapfile.c | 15 +++++++++++++++ 2 files changed, 15 insertions(+),
 15 deletions(-) 
 Content analysis details:   (0.2 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.2 HEADER_FROM_DIFFERENT_DOMAINS From and EnvelopeFrom 2nd level mail
 domains are different
X-Headers-End: 1wMfos-0004sp-J9
Subject: [f2fs-dev] [PATCH 11/12] swap: move struct swap_extent to swapfile.c
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
Cc: Paulo Alcantara <pc@manguebit.org>, linux-doc@vger.kernel.org,
 "Darrick J . Wong " <djwong@kernel.org>, Carlos Maiolino <cem@kernel.org>,
 Hyunchul Lee <hyc.lee@gmail.com>, linux-mm@kvack.org,
 Naohiro Aota <naohiro.aota@wdc.com>, linux-xfs@vger.kernel.org,
 linux-ext4@vger.kernel.org, Namjae Jeon <linkinjeon@kernel.org>,
 linux-cifs@vger.kernel.org, linux-nfs@vger.kernel.org,
 linux-block@vger.kernel.org, Damien Le Moal <dlemoal@kernel.org>,
 David Sterba <dsterba@suse.com>, Jaegeuk Kim <jaegeuk@kernel.org>,
 Jens Axboe <axboe@kernel.dk>, Christian Brauner <brauner@kernel.org>,
 Theodore Ts'o <tytso@mit.edu>, linux-f2fs-devel@lists.sourceforge.net,
 Steve French <sfrench@samba.org>, Trond Myklebust <trondmy@kernel.org>,
 Anna Schumaker <anna@kernel.org>, linux-fsdevel@vger.kernel.org,
 linux-btrfs@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net
X-Rspamd-Queue-Id: 30B2E51A3AA
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [1.49 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	RWL_MAILSPIKE_EXCELLENT(-0.40)[216.105.38.7:from];
	R_SPF_ALLOW(-0.20)[+ip4:216.105.38.7:c];
	R_DKIM_ALLOW(-0.20)[lists.sourceforge.net:s=beta];
	MAILLIST(-0.20)[mailman];
	MIME_GOOD(-0.10)[text/plain];
	DMARC_POLICY_SOFTFAIL(0.10)[lst.de : SPF not aligned (relaxed), DKIM not aligned (relaxed),none];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_COUNT_THREE(0.00)[4];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:akpm@linux-foundation.org,m:chrisl@kernel.org,m:kasong@tencent.com,m:pc@manguebit.org,m:linux-doc@vger.kernel.org,m:djwong@kernel.org,m:cem@kernel.org,m:hyc.lee@gmail.com,m:linux-mm@kvack.org,m:naohiro.aota@wdc.com,m:linux-xfs@vger.kernel.org,m:linux-ext4@vger.kernel.org,m:linkinjeon@kernel.org,m:linux-cifs@vger.kernel.org,m:linux-nfs@vger.kernel.org,m:linux-block@vger.kernel.org,m:dlemoal@kernel.org,m:dsterba@suse.com,m:jaegeuk@kernel.org,m:axboe@kernel.dk,m:brauner@kernel.org,m:tytso@mit.edu,m:linux-f2fs-devel@lists.sourceforge.net,m:sfrench@samba.org,m:trondmy@kernel.org,m:anna@kernel.org,m:linux-fsdevel@vger.kernel.org,m:linux-btrfs@vger.kernel.org,m:hyclee@gmail.com,s:lists@lfdr.de];
	FREEMAIL_CC(0.00)[manguebit.org,vger.kernel.org,kernel.org,gmail.com,kvack.org,wdc.com,suse.com,kernel.dk,mit.edu,lists.sourceforge.net,samba.org];
	FORGED_SENDER_FORWARDING(0.00)[];
	ARC_NA(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[28];
	FORGED_SENDER(0.00)[hch@lst.de,linux-f2fs-devel-bounces@lists.sourceforge.net];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[linux-f2fs-devel@lists.sourceforge.net];
	DKIM_MIXED(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[hch@lst.de,linux-f2fs-devel-bounces@lists.sourceforge.net];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TAGGED_RCPT(0.00)[linux-f2fs-devel];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	R_DKIM_REJECT(0.00)[sourceforge.net:s=x,sf.net:s=x,infradead.org:s=bombadil.20210309];
	ASN(0.00)[asn:11320, ipnet:216.105.32.0/21, country:US];
	TO_DN_SOME(0.00)[];
	DKIM_TRACE(0.00)[lists.sourceforge.net:+,sourceforge.net:-,sf.net:-,infradead.org:-];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lst.de:email,lst.de:mid,lists.sourceforge.net:rdns,lists.sourceforge.net:helo,lists.sourceforge.net:dkim]
X-Rspamd-Action: no action

struct swap_extent is only used inside of mm/swapfile.c, so move it
there.

Signed-off-by: Christoph Hellwig <hch@lst.de>
---
 include/linux/swap.h | 15 ---------------
 mm/swapfile.c        | 15 +++++++++++++++
 2 files changed, 15 insertions(+), 15 deletions(-)

diff --git a/include/linux/swap.h b/include/linux/swap.h
index 916889738f08..95237ee065c2 100644
--- a/include/linux/swap.h
+++ b/include/linux/swap.h
@@ -178,21 +178,6 @@ struct sysinfo;
 struct writeback_control;
 struct zone;
 
-/*
- * A swap extent maps a range of a swapfile's PAGE_SIZE pages onto a range of
- * disk blocks.  A rbtree of swap extents maps the entire swapfile (Where the
- * term `swapfile' refers to either a blockdevice or an IS_REG file). Apart
- * from setup, they're handled identically.
- *
- * We always assume that blocks are of size PAGE_SIZE.
- */
-struct swap_extent {
-	struct rb_node rb_node;
-	pgoff_t start_page;
-	pgoff_t nr_pages;
-	sector_t start_block;
-};
-
 /*
  * Max bad pages in the new format..
  */
diff --git a/mm/swapfile.c b/mm/swapfile.c
index 26852c2ad36e..c0479533f9ef 100644
--- a/mm/swapfile.c
+++ b/mm/swapfile.c
@@ -260,6 +260,21 @@ static int __try_to_reclaim_swap(struct swap_info_struct *si,
 	return ret;
 }
 
+/*
+ * A swap extent maps a range of a swapfile's PAGE_SIZE pages onto a range of
+ * disk blocks.  A rbtree of swap extents maps the entire swapfile (Where the
+ * term `swapfile' refers to either a blockdevice or an IS_REG file). Apart
+ * from setup, they're handled identically.
+ *
+ * We always assume that blocks are of size PAGE_SIZE.
+ */
+struct swap_extent {
+	struct rb_node rb_node;
+	pgoff_t start_page;
+	pgoff_t nr_pages;
+	sector_t start_block;
+};
+
 static inline struct swap_extent *first_se(struct swap_info_struct *sis)
 {
 	struct rb_node *rb = rb_first(&sis->swap_extent_root);
-- 
2.53.0



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
