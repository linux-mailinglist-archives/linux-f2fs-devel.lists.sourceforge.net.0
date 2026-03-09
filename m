Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id ELm2KrEer2khOQIAu9opvQ
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 09 Mar 2026 20:25:37 +0100
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 47F8523FD00
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 09 Mar 2026 20:25:37 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:MIME-Version:References:In-Reply-To:
	Message-ID:Date:To:Sender:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=cfcqMZ+gFSl5yajWBt0Yom3FZTyXvEqj5MCUNhLuaEE=; b=Rx+xsUDeBF/Xk3cfQCPmx7PBbx
	g1N0vKvMF84l/8q81NDN4r5yyXyy9zH8/Gtn/fZmiDvKZqJWrqlwxvpSIb9NWwAweWnmDb1Dv5ZvA
	O+zFutGgvII1G5oc+ilgkXGTfpJZwbJEBC+1jflL3PYZZ5GyTsJ9TYfDfqEGef13WX6c=;
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1vzgER-0001dY-Vy;
	Mon, 09 Mar 2026 19:25:36 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <aalbersh@kernel.org>) id 1vzgEM-0001cV-8e
 for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 09 Mar 2026 19:25:30 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=iKmDs5kPCJ1T7d7fLsQyAQDJoBhAjqmf7JCLsDSCHDk=; b=YxYNfRnEmNNAscF3/Zlzbxblea
 ziqnzux0FGw7+ppRLUVgDB62FXsbgYWhLA+RCvZV6M7s79FjFWzVc5RXK41vN6Fw0qu3j5J+4DxLw
 kszP/bqFnH+QfoqogSV37EW5Ryeqsr0b4ghoGj12NOg0TJAN0auK0gX6F9eMU9+zwfiA=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=iKmDs5kPCJ1T7d7fLsQyAQDJoBhAjqmf7JCLsDSCHDk=; b=Tjsa5F/SYWt66YFagBHKexjN58
 bCJ273Z6mFspu0jOojpEIl5cNsPS4Aeiz4lw4wUS64IL3LRdZW55inyPRKptYbtwpNLyEf+ScF6cA
 zQAtFeKK2FVCf3GMwocPLfLGClL61M4QBcB1lqKyvuSmzfnbx2vgI1rSiDfqO+eCCpv8=;
Received: from sea.source.kernel.org ([172.234.252.31])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1vzgEL-0001JH-O4 for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 09 Mar 2026 19:25:30 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id 516E343E10;
 Mon,  9 Mar 2026 19:25:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id ECE2DC4CEF7;
 Mon,  9 Mar 2026 19:25:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1773084324;
 bh=q+80M4WVwB0jriNEN9Ewn5e6CqLpErMAF/cbVAJOGpo=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=JZYW1nAmbw9jWj6fXPPX3hvrZWj8/q/sJSrRcyof83ttU4SLvmxGfjsKp0SIUsT7I
 p4Xzr7esilW2G4EOnfqlyFqdrN9BO1qOGch7qH5QCfYfvo9ZaO8wuhAIozRVZcIxZq
 F3EednrXH9XMoGDyKrOx3Up7dJs6wk07KklhIdF3jx07UjCUGju+u3DmRJrO/Wj5zb
 mj0IXDDSBnnAP4x5CTonrJba7pQQAMiYnvodOwraWrQ/YK+Co/lGrkiBcPX8I7eK9Z
 SuVAMm4blhSuvIdZJA5QJH0mnln49FuuxJLwdeWrN38SO9V2cfMzOzdzolHwdYK6Wp
 IX6quVnylZqYg==
To: linux-xfs@vger.kernel.org, fsverity@lists.linux.dev,
 linux-fsdevel@vger.kernel.org, ebiggers@kernel.org
Date: Mon,  9 Mar 2026 20:23:39 +0100
Message-ID: <20260309192355.176980-25-aalbersh@kernel.org>
X-Mailer: git-send-email 2.51.2
In-Reply-To: <20260309192355.176980-1-aalbersh@kernel.org>
References: <20260309192355.176980-1-aalbersh@kernel.org>
MIME-Version: 1.0
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-1.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  Even though fsverity has traces,
 debugging issues with varying
 block sizes could be a bit less transparent without read/write traces.
 Signed-off-by:
 Andrey Albershteyn <aalbersh@kernel.org> Reviewed-by: "Darrick J. Wong"
 <djwong@kernel.org>
 --- fs/xfs/xfs_fsverity.c | 6 ++++++ fs/xfs/xfs_trace.h | 45
 ++++++++++++++++++++++++++++++++ [...] 
 Content analysis details:   (-0.2 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1vzgEL-0001JH-O4
Subject: [f2fs-dev] [PATCH v4 24/25] xfs: add fsverity traces
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
From: Andrey Albershteyn via Linux-f2fs-devel
 <linux-f2fs-devel@lists.sourceforge.net>
Reply-To: Andrey Albershteyn <aalbersh@kernel.org>
Cc: Andrey Albershteyn <aalbersh@kernel.org>, djwong@kernel.org,
 linux-f2fs-devel@lists.sourceforge.net, linux-ext4@vger.kernel.org, hch@lst.de,
 linux-btrfs@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net
X-Rspamd-Queue-Id: 47F8523FD00
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-8.61 / 15.00];
	WHITELIST_DMARC(-7.00)[sourceforge.net:D:+];
	DMARC_POLICY_ALLOW_WITH_FAILURES(-0.50)[];
	RWL_MAILSPIKE_EXCELLENT(-0.40)[216.105.38.7:from];
	R_SPF_ALLOW(-0.20)[+ip4:216.105.38.7:c];
	R_DKIM_ALLOW(-0.20)[lists.sourceforge.net:s=beta];
	MAILLIST(-0.20)[mailman];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DKIM_MIXED(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DMARC_POLICY_ALLOW(0.00)[lists.sourceforge.net,none];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:linux-xfs@vger.kernel.org,m:fsverity@lists.linux.dev,m:linux-fsdevel@vger.kernel.org,m:ebiggers@kernel.org,m:aalbersh@kernel.org,m:djwong@kernel.org,m:linux-f2fs-devel@lists.sourceforge.net,m:linux-ext4@vger.kernel.org,m:hch@lst.de,m:linux-btrfs@vger.kernel.org,s:lists@lfdr.de];
	ARC_NA(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	R_DKIM_REJECT(0.00)[sourceforge.net:s=x,sf.net:s=x,kernel.org:s=k20201202];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER(0.00)[linux-f2fs-devel@lists.sourceforge.net,linux-f2fs-devel-bounces@lists.sourceforge.net];
	FORWARDED(0.00)[linux-f2fs-devel@lists.sourceforge.net];
	REPLYTO_DOM_NEQ_FROM_DOM(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[lists.sourceforge.net:+,sourceforge.net:-,sf.net:-,kernel.org:-];
	RCVD_COUNT_FIVE(0.00)[5];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[linux-f2fs-devel@lists.sourceforge.net,linux-f2fs-devel-bounces@lists.sourceforge.net];
	REPLYTO_DOM_NEQ_TO_DOM(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TAGGED_RCPT(0.00)[linux-f2fs-devel];
	HAS_REPLYTO(0.00)[aalbersh@kernel.org];
	RCPT_COUNT_SEVEN(0.00)[10];
	ASN(0.00)[asn:11320, ipnet:216.105.32.0/21, country:US];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.sourceforge.net:dkim,lists.sourceforge.net:rdns,lists.sourceforge.net:helo]
X-Rspamd-Action: no action

Even though fsverity has traces, debugging issues with varying block
sizes could be a bit less transparent without read/write traces.

Signed-off-by: Andrey Albershteyn <aalbersh@kernel.org>
Reviewed-by: "Darrick J. Wong" <djwong@kernel.org>
---
 fs/xfs/xfs_fsverity.c |  6 ++++++
 fs/xfs/xfs_trace.h    | 45 +++++++++++++++++++++++++++++++++++++++++++
 2 files changed, 51 insertions(+)

diff --git a/fs/xfs/xfs_fsverity.c b/fs/xfs/xfs_fsverity.c
index adc53dad174b..f18426acdafd 100644
--- a/fs/xfs/xfs_fsverity.c
+++ b/fs/xfs/xfs_fsverity.c
@@ -79,6 +79,8 @@ xfs_fsverity_get_descriptor(
 	uint32_t		blocksize = i_blocksize(VFS_I(ip));
 	xfs_fileoff_t		last_block_offset;
 
+	trace_xfs_fsverity_get_descriptor(ip);
+
 	ASSERT(inode->i_flags & S_VERITY);
 	error = xfs_bmap_last_extent(NULL, ip, XFS_DATA_FORK, &rec, &is_empty);
 	if (error)
@@ -380,6 +382,7 @@ xfs_fsverity_read_merkle(
 	pgoff_t			index)
 {
 	index += xfs_fsverity_metadata_offset(XFS_I(inode)) >> PAGE_SHIFT;
+	trace_xfs_fsverity_read_merkle(XFS_I(inode), index, PAGE_SIZE);
 
 	return generic_read_merkle_tree_page(inode, index);
 }
@@ -394,6 +397,7 @@ xfs_fsverity_readahead_merkle_tree(
 	unsigned long		nr_pages)
 {
 	index += xfs_fsverity_metadata_offset(XFS_I(inode)) >> PAGE_SHIFT;
+	trace_xfs_fsverity_read_merkle(XFS_I(inode), index, PAGE_SIZE);
 
 	generic_readahead_merkle_tree(inode, index, nr_pages);
 }
@@ -417,6 +421,8 @@ xfs_fsverity_write_merkle(
 	const char		*p;
 	unsigned int		i;
 
+	trace_xfs_fsverity_write_merkle(XFS_I(inode), position, size);
+
 	if (position + size > inode->i_sb->s_maxbytes)
 		return -EFBIG;
 
diff --git a/fs/xfs/xfs_trace.h b/fs/xfs/xfs_trace.h
index 813e5a9f57eb..77e1a4f27f63 100644
--- a/fs/xfs/xfs_trace.h
+++ b/fs/xfs/xfs_trace.h
@@ -6419,6 +6419,51 @@ TRACE_EVENT(xfs_verify_media_error,
 		  __entry->error)
 );
 
+TRACE_EVENT(xfs_fsverity_get_descriptor,
+	TP_PROTO(struct xfs_inode *ip),
+	TP_ARGS(ip),
+	TP_STRUCT__entry(
+		__field(dev_t, dev)
+		__field(xfs_ino_t, ino)
+	),
+	TP_fast_assign(
+		__entry->dev = VFS_I(ip)->i_sb->s_dev;
+		__entry->ino = ip->i_ino;
+	),
+	TP_printk("dev %d:%d ino 0x%llx",
+		  MAJOR(__entry->dev), MINOR(__entry->dev),
+		  __entry->ino)
+);
+
+DECLARE_EVENT_CLASS(xfs_fsverity_class,
+	TP_PROTO(struct xfs_inode *ip, u64 pos, size_t length),
+	TP_ARGS(ip, pos, length),
+	TP_STRUCT__entry(
+		__field(dev_t, dev)
+		__field(xfs_ino_t, ino)
+		__field(u64, pos)
+		__field(size_t, length)
+	),
+	TP_fast_assign(
+		__entry->dev = VFS_I(ip)->i_sb->s_dev;
+		__entry->ino = ip->i_ino;
+		__entry->pos = pos;
+		__entry->length = length;
+	),
+	TP_printk("dev %d:%d ino 0x%llx pos 0x%llx length 0x%zx",
+		  MAJOR(__entry->dev), MINOR(__entry->dev),
+		  __entry->ino,
+		  __entry->pos,
+		  __entry->length)
+)
+
+#define DEFINE_FSVERITY_EVENT(name) \
+DEFINE_EVENT(xfs_fsverity_class, name, \
+	TP_PROTO(struct xfs_inode *ip, u64 pos, size_t length), \
+	TP_ARGS(ip, pos, length))
+DEFINE_FSVERITY_EVENT(xfs_fsverity_read_merkle);
+DEFINE_FSVERITY_EVENT(xfs_fsverity_write_merkle);
+
 #endif /* _TRACE_XFS_H */
 
 #undef TRACE_INCLUDE_PATH
-- 
2.51.2



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
