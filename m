Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id MIVmNH8svGn4twIAu9opvQ
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	for <lists+linux-f2fs-devel@lfdr.de>; Thu, 19 Mar 2026 18:03:59 +0100
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 392742CF60F
	for <lists+linux-f2fs-devel@lfdr.de>; Thu, 19 Mar 2026 18:03:59 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:MIME-Version:References:In-Reply-To:
	Message-ID:Date:To:Sender:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=dJRV1M1qI7yRiMoUZr1DHigahS37fhHoJAeGhZezrEc=; b=cGIXMfs58YTCl9IpazFvPcA0oN
	QNPN2fgnmzzrRH14Se5Bx4aMMenk/V033bLgLvpjdabTA3NzWOkUSJR4l1RIftxqbei1q/1o7gxEO
	snPF/IWd4+Oy7ynGWoLOq7Uq2BaNDSfi3zPVYUXEKHCo7ScYlsRl5UjIMhAx7g2WiXYg=;
Received: from [127.0.0.1] (helo=sfs-ml-3.v29.lw.sourceforge.com)
	by sfs-ml-3.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1w3Gmq-0008LP-Js;
	Thu, 19 Mar 2026 17:03:56 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-3.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <aalbersh@kernel.org>) id 1w3Gmp-0008LE-1S
 for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 19 Mar 2026 17:03:55 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=8SeePN0QAVWyJtFSsFddVg0hfeGj7qMMmN49dGJsMy4=; b=UAUFUHGYuCFJUl+Vn5ORdi8T3G
 qYnqL7dDdFGl3gSLUzwSAUa7sd4HzTIH57yH+6vaZSbJ2GvWAp3Zam75+Sl5dLxyRnFblEOsSLy4S
 NY7f/pj0lliTEr5V6V1XMZd0fFMbh6DRU7GvyDG4IJR8S30w5NHxtKSsIB8RlVLZSJM8=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=8SeePN0QAVWyJtFSsFddVg0hfeGj7qMMmN49dGJsMy4=; b=fV6t686rAtLnzwe0CphjKNDvtI
 dopivY3AxiJWGHYuaJIjIs90vi3far4Ezeq0lKeP/AdkyjARyLf06pil5WEGP2IVpsXiaEC3ctcFv
 +xR9+02ftEJ1xZQ3P6hW0pt8WMW0wyF90vR+XRtRDUTA20eD+n669osf7wG2Wpexw9s8=;
Received: from tor.source.kernel.org ([172.105.4.254])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1w3Gmo-0005k4-9O for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 19 Mar 2026 17:03:54 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 98D5161851;
 Thu, 19 Mar 2026 17:03:43 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 24D16C19424;
 Thu, 19 Mar 2026 17:03:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1773939823;
 bh=iRVMo4LLqzTvxVAS9W3KUEqySn3JSIcTykHsq1FaLnQ=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=mQMRHckjLAdVsZaqX/qjHghOSxgfL4XlvMvXCBM8cVKeKSLxU6EobRp9JbWI5RjKP
 l0/OoKiOjN2Pa5Ia9qGulcHnTr4jQGVqBIxzKdDsdR5QGWI75uRtTQK9oWO6QLzDBF
 8iyw0vJvo36Vj3WUNQZBxJXGdeiHOx33FG5MTPvUdDT+1DFKyQXs4g76pobAqul5dC
 6b8frew9vHq6t3YkbxJrMvX7oNMT/mqAqigtxEfzj5RFjGtP/jOqcYVeB9omMFB4b3
 CiqalbBymP1ZUD7N/8VsxT9gUXMWLsitWakaISenfyF0YvK/R50SYvVQnMqVQctu/F
 kzyFX5v4bcdug==
To: linux-xfs@vger.kernel.org, fsverity@lists.linux.dev,
 linux-fsdevel@vger.kernel.org, ebiggers@kernel.org
Date: Thu, 19 Mar 2026 18:02:11 +0100
Message-ID: <20260319170231.1455553-25-aalbersh@kernel.org>
X-Mailer: git-send-email 2.51.2
In-Reply-To: <20260319170231.1455553-1-aalbersh@kernel.org>
References: <20260319170231.1455553-1-aalbersh@kernel.org>
MIME-Version: 1.0
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-2.hosts.colo.sdot.me", 
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
 --- fs/xfs/xfs_fsverity.c | 6 ++++++ fs/xfs/xfs_trace.h | 46
 ++++++++++++++++++++++++++++++++ [...] 
 Content analysis details:   (-0.2 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1w3Gmo-0005k4-9O
Subject: [f2fs-dev] [PATCH v5 24/25] xfs: add fsverity traces
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
	REPLYTO_DOM_NEQ_TO_DOM(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[linux-f2fs-devel@lists.sourceforge.net,linux-f2fs-devel-bounces@lists.sourceforge.net];
	DKIM_TRACE(0.00)[lists.sourceforge.net:+,sourceforge.net:-,sf.net:-,kernel.org:-];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TAGGED_RCPT(0.00)[linux-f2fs-devel];
	HAS_REPLYTO(0.00)[aalbersh@kernel.org];
	RCPT_COUNT_SEVEN(0.00)[10];
	ASN(0.00)[asn:11320, ipnet:216.105.32.0/21, country:US];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.sourceforge.net:helo,lists.sourceforge.net:rdns,lists.sourceforge.net:dkim]
X-Rspamd-Queue-Id: 392742CF60F
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Even though fsverity has traces, debugging issues with varying block
sizes could be a bit less transparent without read/write traces.

Signed-off-by: Andrey Albershteyn <aalbersh@kernel.org>
Reviewed-by: "Darrick J. Wong" <djwong@kernel.org>
---
 fs/xfs/xfs_fsverity.c |  6 ++++++
 fs/xfs/xfs_trace.h    | 46 +++++++++++++++++++++++++++++++++++++++++++
 2 files changed, 52 insertions(+)

diff --git a/fs/xfs/xfs_fsverity.c b/fs/xfs/xfs_fsverity.c
index ecc66ee8bac5..6db8113da52f 100644
--- a/fs/xfs/xfs_fsverity.c
+++ b/fs/xfs/xfs_fsverity.c
@@ -64,6 +64,8 @@ xfs_fsverity_get_descriptor(
 	uint32_t		blocksize = i_blocksize(VFS_I(ip));
 	xfs_fileoff_t		last_block_offset;
 
+	trace_xfs_fsverity_get_descriptor(ip);
+
 	ASSERT(inode->i_flags & S_VERITY);
 	error = xfs_bmap_last_extent(NULL, ip, XFS_DATA_FORK, &rec, &is_empty);
 	if (error)
@@ -377,6 +379,7 @@ xfs_fsverity_read_merkle(
 	pgoff_t			index)
 {
 	index += xfs_fsverity_metadata_offset(XFS_I(inode)) >> PAGE_SHIFT;
+	trace_xfs_fsverity_read_merkle(XFS_I(inode), index, PAGE_SIZE);
 
 	return generic_read_merkle_tree_page(inode, index);
 }
@@ -391,6 +394,7 @@ xfs_fsverity_readahead_merkle_tree(
 	unsigned long		nr_pages)
 {
 	index += xfs_fsverity_metadata_offset(XFS_I(inode)) >> PAGE_SHIFT;
+	trace_xfs_fsverity_read_merkle(XFS_I(inode), index, PAGE_SIZE);
 
 	generic_readahead_merkle_tree(inode, index, nr_pages);
 }
@@ -414,6 +418,8 @@ xfs_fsverity_write_merkle(
 	const char		*p;
 	unsigned int		i;
 
+	trace_xfs_fsverity_write_merkle(XFS_I(inode), position, size);
+
 	if (position + size > inode->i_sb->s_maxbytes)
 		return -EFBIG;
 
diff --git a/fs/xfs/xfs_trace.h b/fs/xfs/xfs_trace.h
index 813e5a9f57eb..d37f3096c03e 100644
--- a/fs/xfs/xfs_trace.h
+++ b/fs/xfs/xfs_trace.h
@@ -6419,6 +6419,52 @@ TRACE_EVENT(xfs_verify_media_error,
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
+DEFINE_FSVERITY_EVENT(xfs_fsverity_file_corrupt);
+
 #endif /* _TRACE_XFS_H */
 
 #undef TRACE_INCLUDE_PATH
-- 
2.51.2



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
