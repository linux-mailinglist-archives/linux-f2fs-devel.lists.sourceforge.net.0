Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id yORgH4ker2khOQIAu9opvQ
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 09 Mar 2026 20:24:57 +0100
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 75A4023FC8D
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 09 Mar 2026 20:24:57 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:MIME-Version:References:In-Reply-To:
	Message-ID:Date:To:Sender:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=xLSyIEmeTNXo+YrPpge2vTi8/q12HsqfgB7MytmKZgI=; b=OkqLQuc7sZy9DVm9fGa6OKWk50
	JNYlIfzZ7g+2W1EMXjnKNwLHze5IA0KS3EIXBJlourNgbMr0YY9ElmqnPIjpTeuYZkdCebFMIgZtn
	1oGhJdJkkic1q7FgANvK1cUNUoYx1edP1y4MgG/aNtjWFgmSIy7810jmLAzKMmHx5HxA=;
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1vzgDo-0001YG-4W;
	Mon, 09 Mar 2026 19:24:56 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <aalbersh@kernel.org>) id 1vzgDm-0001Y4-Dd
 for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 09 Mar 2026 19:24:54 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=rny9xtqth13VspWMS0J2Ex3RXLkojrj3wPDFrSrLvMY=; b=S82NCaVYWM7KM/UV7WR7LEM5dg
 FvvwEy8O7HleEfxG4ir8b609h3qRHcH1HFl0MCPJQJgCbO05kR0wTIwjdCJd8DZnOx1Xg1Juaayd2
 mptHsjls1klyLg1bHXMMwa39gp4gxpdm/zYVtz7qkzRWpwifZcanQNuzf5SSzJ4uty6c=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=rny9xtqth13VspWMS0J2Ex3RXLkojrj3wPDFrSrLvMY=; b=SqSDn0efC1/7MJ8vIHBAp3NeFx
 SPQeExLIAz5HQRq0ONiuE0x2QOFL173hlFsvtzUqe4HGJCrlB+2JMlZlgD9a4/u4xX+3474Zqw5cI
 SWKvnJfbX3RMJdXk5j246ywBa7oMVWyYMOIQP1XQ+XTm2QKTTXwwEOzb0RQBXV1n8rWM=;
Received: from sea.source.kernel.org ([172.234.252.31])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1vzgDm-0001Fr-2S for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 09 Mar 2026 19:24:54 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id C0E0B41B28;
 Mon,  9 Mar 2026 19:24:43 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 602A6C4CEF7;
 Mon,  9 Mar 2026 19:24:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1773084283;
 bh=wy0fgG+OqF6cw22y7JDQIN2MJp1BJ6acjGWjdLKi8F0=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=QW2xH7HuqQXoi83jcceoja9TI1YAhDBVMJNuiv/10JIE4wTymwbz9hphQZSXdqHZk
 1Fo8vHaMoH02qE0IMf0WXvAujp2unHUTVVoRzZpLecru3kyYMnSIWzdjeGFEwYThMr
 yigqa4+cyKQAayODnLk1YlPFvvjkAW3IXPfO4our8ug4p2ZBIvmY5eMrtZsL89QIuw
 RZutFoWAIwsMM6pX6NucYJSCSYjlnslXcRrKLKDopHz6Ti1snJBKH0n4qzkKcbzCOe
 yO/ntjkLR9zJuqp5evJrth13nVO8S0skkg2N20V/7manmi/inS+jRM0KnAGLKul/JP
 1oqZlXfBoS/SQ==
To: linux-xfs@vger.kernel.org, fsverity@lists.linux.dev,
 linux-fsdevel@vger.kernel.org, ebiggers@kernel.org
Date: Mon,  9 Mar 2026 20:23:24 +0100
Message-ID: <20260309192355.176980-10-aalbersh@kernel.org>
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
 Content preview: Issue reading of fsverity merkle tree on the fsverity inodes.
 This way metadata will be available at I/O completion time. Signed-off-by:
 Andrey Albershteyn <aalbersh@kernel.org> --- fs/iomap/buffered-io.c | 3 +++
 1 file changed, 3 insertions(+) 
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
X-Headers-End: 1vzgDm-0001Fr-2S
Subject: [f2fs-dev] [PATCH v4 09/25] iomap: issue readahead for fsverity
 merkle tree
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
X-Rspamd-Queue-Id: 75A4023FC8D
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

Issue reading of fsverity merkle tree on the fsverity inodes. This way
metadata will be available at I/O completion time.

Signed-off-by: Andrey Albershteyn <aalbersh@kernel.org>
---
 fs/iomap/buffered-io.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/fs/iomap/buffered-io.c b/fs/iomap/buffered-io.c
index a335a18c307f..1d9481f00b41 100644
--- a/fs/iomap/buffered-io.c
+++ b/fs/iomap/buffered-io.c
@@ -593,6 +593,9 @@ void iomap_read_folio(const struct iomap_ops *ops,
 
 	if (iter.pos < i_size_read(iter.inode))
 		ctx->vi = fsverity_get_info(iter.inode);
+	if (ctx->vi)
+		fsverity_readahead(ctx->vi, folio->index,
+				   folio_nr_pages(folio));
 
 	while ((ret = iomap_iter(&iter, ops)) > 0)
 		iter.status = iomap_read_folio_iter(&iter, ctx,
-- 
2.51.2



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
