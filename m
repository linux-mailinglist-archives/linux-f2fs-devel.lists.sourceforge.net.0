Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id oLgyLqK8AmrKwAEAu9opvQ
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 12 May 2026 07:37:38 +0200
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B12751A35D
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 12 May 2026 07:37:38 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Subject:MIME-Version:References:In-Reply-To:Message-ID:Date:To:From:Sender:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=5AuSp6hiU49hXSd80A+AtHyHLQ05rlzA/gRX8v3MNU4=; b=ZSUa18FCYdVyF2VIZW6AYEYpPc
	k4PR6khd3L+fAdJZfP/EDQNwyWzBgt4q/NMZNveRfcWe9oaoN75IOMBDRadCFqnQMCIu/gmabHC3W
	D7Gn6+lo2N633J/vJsdSMwtFdGVEAqZU1JQ5D0XNmsWaO6xSgPJW4vO5T3D60zvUWp1E=;
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1wMfoH-0007vv-22;
	Tue, 12 May 2026 05:37:37 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95) (envelope-from
 <BATV+9f3c1ea353498f61ccd0+8297+infradead.org+hch@bombadil.srs.infradead.org>)
 id 1wMfoF-0007vm-JY for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 12 May 2026 05:37:35 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=/e1E43Aw8DTZbb0PWgWlLEg76+pOp+WQ5laY13dT/AY=; b=fviQLTka0/TdD58W+nWq73Tzxr
 rZ2LBqujQxvLbT7yAvxyNuJQoUaC4NOb+eBp5T8NrYOQc6QCVf/KM5hn7qQ1WGOEBkDCqtcM1MjcJ
 aXMSteKa0znlRqTW1vHHHaWH1926d5pJK4FeGsKPMbQKLXyuGROh99CThppUGza3fpFI=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=/e1E43Aw8DTZbb0PWgWlLEg76+pOp+WQ5laY13dT/AY=; b=Kt62CTXqSYkyUOiUbkUQ7KJK3c
 dNm1/hbLRhr2oXWkOviAJcpkARMTpo/QKQGhEr4WijSklb571FFO2oe0HIdmbXP3c2+Tuqi7EcTiA
 cWnJzNIbz211zvR7rb+cw+IDdLpHd8wImw0UHa/hLcTxMikKshjRcOxBRln2ZBFQM5bM=;
Received: from bombadil.infradead.org ([198.137.202.133])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1wMfoD-0004qB-Ox for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 12 May 2026 05:37:35 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender
 :Reply-To:Content-Type:Content-ID:Content-Description;
 bh=/e1E43Aw8DTZbb0PWgWlLEg76+pOp+WQ5laY13dT/AY=; b=y18jNN6IPZlAJzD9Y2fqbDV5I5
 t70jJrjHcSzL6K2knltP7wGbdjaIIuebiXhzNNCkcG+TLWtCjasTBkVdIyDBJPH7qVtppi1Fon0/0
 D3YfBN/M4uLOPTU6ZZ/Acm4ajvvztkJ12cvkz9SgK99YpZkHkU8u7N0mI63biJ5dye+9DgbDNQ5DC
 dagBVq3ZLbxhntKH6bFTm/9bdWz4oWSJNz8PFJpzqmFN+krxQpbSd4hNsgM3ardXVB8DmstwokTGd
 c9RKK2S6TJNMY4e0fhrn8HP1lGValwj8cZabS4qvNOPa3s8r3rd4r/Vdf2NtDTYPDX4p53/9swG+5
 RMk1SW8A==;
Received: from
 2a02-8389-2341-5b80-decc-1a96-daaa-a2cc.cable.dynamic.v6.surfer.at
 ([2a02:8389:2341:5b80:decc:1a96:daaa:a2cc] helo=localhost)
 by bombadil.infradead.org with esmtpsa (Exim 4.99.1 #2 (Red Hat Linux))
 id 1wMfnz-0000000FfNY-1SOX; Tue, 12 May 2026 05:37:19 +0000
From: Christoph Hellwig <hch@lst.de>
To: Andrew Morton <akpm@linux-foundation.org>, Chris Li <chrisl@kernel.org>,
 Kairui Song <kasong@tencent.com>
Date: Tue, 12 May 2026 07:35:22 +0200
Message-ID: <20260512053625.2950900-7-hch@lst.de>
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
 Content preview: Make use of the abstractions we have. This is a preparation
 for moving more special casing down into block/. Signed-off-by: Christoph
 Hellwig <hch@lst.de> --- block/fops.c | 6 ++++++ mm/swapfile.c | 5 -----
 2 files changed, 6 insertions(+), 5 deletions(-) 
 Content analysis details:   (0.2 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.2 HEADER_FROM_DIFFERENT_DOMAINS From and EnvelopeFrom 2nd level mail
 domains are different
X-Headers-End: 1wMfoD-0004qB-Ox
Subject: [f2fs-dev] [PATCH 06/12] swap,
 block: move the block device swapon code into block/fops.c
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
X-Rspamd-Queue-Id: 5B12751A35D
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[lst.de:email,lst.de:mid]
X-Rspamd-Action: no action

Make use of the abstractions we have.  This is a preparation for
moving more special casing down into block/.

Signed-off-by: Christoph Hellwig <hch@lst.de>
---
 block/fops.c  | 6 ++++++
 mm/swapfile.c | 5 -----
 2 files changed, 6 insertions(+), 5 deletions(-)

diff --git a/block/fops.c b/block/fops.c
index bb6642b45937..453141801684 100644
--- a/block/fops.c
+++ b/block/fops.c
@@ -949,6 +949,11 @@ static int blkdev_mmap_prepare(struct vm_area_desc *desc)
 	return generic_file_mmap_prepare(desc);
 }
 
+static int blkdev_swap_activate(struct file *file, struct swap_info_struct *sis)
+{
+	return add_swap_extent(sis, sis->max, 0);
+}
+
 const struct file_operations def_blk_fops = {
 	.open		= blkdev_open,
 	.release	= blkdev_release,
@@ -965,6 +970,7 @@ const struct file_operations def_blk_fops = {
 	.splice_read	= filemap_splice_read,
 	.splice_write	= iter_file_splice_write,
 	.fallocate	= blkdev_fallocate,
+	.swap_activate	= blkdev_swap_activate,
 	.uring_cmd	= blkdev_uring_cmd,
 	.fop_flags	= FOP_BUFFER_RASYNC,
 };
diff --git a/mm/swapfile.c b/mm/swapfile.c
index 1b7fc03612f4..fbf11c8c5c69 100644
--- a/mm/swapfile.c
+++ b/mm/swapfile.c
@@ -2781,13 +2781,8 @@ EXPORT_SYMBOL_GPL(add_swap_extent);
 static int setup_swap_extents(struct swap_info_struct *sis,
 			      struct file *swap_file)
 {
-	struct address_space *mapping = swap_file->f_mapping;
-	struct inode *inode = mapping->host;
 	int ret, error = 0;
 
-	if (S_ISBLK(inode->i_mode))
-		return add_swap_extent(sis, sis->max, 0);
-
 	if (swap_file->f_op->swap_activate)
 		ret = swap_file->f_op->swap_activate(swap_file, sis);
 	else
-- 
2.53.0



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
