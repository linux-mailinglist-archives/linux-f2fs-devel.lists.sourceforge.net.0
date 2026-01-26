Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id sBHYHzzzdmkzZgEAu9opvQ
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 26 Jan 2026 05:53:16 +0100
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C40483FC6
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 26 Jan 2026 05:53:16 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Subject:MIME-Version:References:In-Reply-To:Message-ID:Date:To:From:Sender:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=wKc7M75bZWAB504Ls4uAZOH9qLU6krXUTSTQWir971s=; b=Kp8+4j8HByNL9DxeuKXSTweceH
	E80gx6b9qpsjI8BWC9LbS73kdNN2sSDkZBf/5tZLoqaJ/PCtJ4Z2CwSgqLfOqS8QZMde+0sfo7kCI
	OXovJdOP2XLfsdQqFS+Cf2bD3eMRsrGJYUBuUD0mOWjtdPOBakSqMC4b0c6lfF/M1Cz8=;
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1vkEbC-0003co-4D;
	Mon, 26 Jan 2026 04:53:14 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95) (envelope-from
 <BATV+12afb9bb7a5ef89fcdd0+8191+infradead.org+hch@bombadil.srs.infradead.org>)
 id 1vkEaz-0003bq-7O for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 26 Jan 2026 04:53:02 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=msMVIu9sG+zHlGxQl6P3akWEAjf+4WBK4vAVLStngPE=; b=X5dmjImLkn/7Bk0NL+qJxPhoTY
 O4hdtn2zJAmaqUW7JIaZBx34AyjnDutrR7B/xZvB4ugZwI+ovEd5XTB9bwoGpDY2UU64NuZ1c9kz2
 TupZyALD5kCbS2TY3GCTEy/OcGf/aB9OWkkvM04mFams7rjNyA/wrxKipEKZXtn2G6PM=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=msMVIu9sG+zHlGxQl6P3akWEAjf+4WBK4vAVLStngPE=; b=AjkQXDHLZq5RWGjGMWUwunHLTY
 EvhrNHP0Fp/RUnTbcHXDyft0hEKiBcRZR3Sb3E8rTrNmANPe+3xaEClx8e+mO532hSUGT9LLNc+Hs
 +6h7UiQVIoGj8WMmTPE3L4DkLXXvDGh3DBkQi9tJYCPs/Y1SPcZBsItndffKgVaGlekU=;
Received: from bombadil.infradead.org ([198.137.202.133])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1vkEas-0001pC-V5 for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 26 Jan 2026 04:52:55 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender
 :Reply-To:Content-Type:Content-ID:Content-Description;
 bh=msMVIu9sG+zHlGxQl6P3akWEAjf+4WBK4vAVLStngPE=; b=25c5Ta7GQUDobn0Tj5TWcEk9FF
 mn4meeagTervwGPMltG1T9z1ye1U1VS+t+gazG3hRDG6+eGKVRAhSPm5dOVEE4d832K4JH1nxbkxW
 DT6cOkBZE3C6GZMgiL7DdjUOgLXueC5DTv5yhZ6F4J6yH6kUsMU4wsvuXtwvcOs6w6nklAwpMNrpj
 6hbVlkvf92lMiczrJNWcuD2rzaiLewVmTuxksauReVN1baUjLcCC6j4tj+Jb9kmDHY27R0EyEmjC5
 QgoblTW7pu8wrQYbjgiWr3b6pPKE1KWAoYg9ZEL0yjhcyz5lchLO//7rlAms64vPmd6xf6epIfRqv
 aj+awHhQ==;
Received: from
 2a02-8389-2341-5b80-d601-7564-c2e0-491c.cable.dynamic.v6.surfer.at
 ([2a02:8389:2341:5b80:d601:7564:c2e0:491c] helo=localhost)
 by bombadil.infradead.org with esmtpsa (Exim 4.98.2 #2 (Red Hat Linux))
 id 1vkEaf-0000000BuQ1-2QIb; Mon, 26 Jan 2026 04:52:42 +0000
From: Christoph Hellwig <hch@lst.de>
To: Eric Biggers <ebiggers@kernel.org>
Date: Mon, 26 Jan 2026 05:50:50 +0100
Message-ID: <20260126045212.1381843-5-hch@lst.de>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260126045212.1381843-1-hch@lst.de>
References: <20260126045212.1381843-1-hch@lst.de>
MIME-Version: 1.0
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by
 bombadil.infradead.org. See http://www.infradead.org/rpr.html
X-Spam-Score: 0.0 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-1.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  Use IS_ENABLED to disable this code, leading to a slight size
 reduction: text data bss dec hex filename 25709 2412 24 28145 6df1
 fs/f2fs/compress.o.old
 25198 2252 24 27474 6b52 fs/f2fs/compress.o Signed-off-by: Christoph Hellwig
 <hch@lst.de> --- fs/f2fs/compress.c | 2 +- 1 file changed, 1 insertion(+),
 1 deletion(-) 
 Content analysis details:   (0.0 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 0.0 HEADER_FROM_DIFFERENT_DOMAINS From and EnvelopeFrom 2nd level mail
 domains are different
X-Headers-End: 1vkEas-0001pC-V5
Subject: [f2fs-dev] [PATCH 04/16] f2fs: don't build the fsverity work
 handler for !CONFIG_FS_VERITY
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
Cc: fsverity@lists.linux.dev, Christian Brauner <brauner@kernel.org>,
 Theodore Ts'o <tytso@mit.edu>, Andrey Albershteyn <aalbersh@redhat.com>,
 Matthew Wilcox <willy@infradead.org>, linux-f2fs-devel@lists.sourceforge.net,
 linux-fsdevel@vger.kernel.org, Al Viro <viro@zeniv.linux.org.uk>,
 Jaegeuk Kim <jaegeuk@kernel.org>, David Sterba <dsterba@suse.com>,
 Jan Kara <jack@suse.cz>, linux-ext4@vger.kernel.org,
 linux-btrfs@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.39 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:216.105.38.7:c];
	R_DKIM_ALLOW(-0.20)[lists.sourceforge.net:s=beta];
	DMARC_POLICY_SOFTFAIL(0.10)[lst.de : SPF not aligned (relaxed), DKIM not aligned (relaxed),none];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_COUNT_THREE(0.00)[4];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	SUBJECT_HAS_EXCLAIM(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:ebiggers@kernel.org,m:fsverity@lists.linux.dev,m:brauner@kernel.org,m:tytso@mit.edu,m:aalbersh@redhat.com,m:willy@infradead.org,m:linux-f2fs-devel@lists.sourceforge.net,m:linux-fsdevel@vger.kernel.org,m:viro@zeniv.linux.org.uk,m:jaegeuk@kernel.org,m:dsterba@suse.com,m:jack@suse.cz,m:linux-ext4@vger.kernel.org,m:linux-btrfs@vger.kernel.org,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[hch@lst.de,linux-f2fs-devel-bounces@lists.sourceforge.net];
	ARC_NA(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[14];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[linux-f2fs-devel@lists.sourceforge.net];
	DKIM_MIXED(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	FROM_NEQ_ENVFROM(0.00)[hch@lst.de,linux-f2fs-devel-bounces@lists.sourceforge.net];
	FROM_HAS_DN(0.00)[];
	R_DKIM_REJECT(0.00)[sourceforge.net:s=x,sf.net:s=x,infradead.org:s=bombadil.20210309];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DKIM_TRACE(0.00)[lists.sourceforge.net:+,sourceforge.net:-,sf.net:-,infradead.org:-];
	TAGGED_RCPT(0.00)[linux-f2fs-devel];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:11320, ipnet:216.105.32.0/21, country:US];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lst.de:mid,lst.de:email]
X-Rspamd-Queue-Id: 3C40483FC6
X-Rspamd-Action: no action

Use IS_ENABLED to disable this code, leading to a slight size reduction:

   text	   data	    bss	    dec	    hex	filename
  25709	   2412	     24	  28145	   6df1	fs/f2fs/compress.o.old
  25198	   2252	     24	  27474	   6b52	fs/f2fs/compress.o

Signed-off-by: Christoph Hellwig <hch@lst.de>
---
 fs/f2fs/compress.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/fs/f2fs/compress.c b/fs/f2fs/compress.c
index 7b68bf22989d..40a62f1dee4d 100644
--- a/fs/f2fs/compress.c
+++ b/fs/f2fs/compress.c
@@ -1833,7 +1833,7 @@ void f2fs_decompress_end_io(struct decompress_io_ctx *dic, bool failed,
 {
 	int i;
 
-	if (!failed && dic->need_verity) {
+	if (IS_ENABLED(CONFIG_FS_VERITY) && !failed && dic->need_verity) {
 		/*
 		 * Note that to avoid deadlocks, the verity work can't be done
 		 * on the decompression workqueue.  This is because verifying
-- 
2.47.3



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
