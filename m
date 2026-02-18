Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id sF8BF7oUlWlYKwIAu9opvQ
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 18 Feb 2026 02:24:10 +0100
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id A767D15283A
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 18 Feb 2026 02:24:09 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:MIME-Version:Message-ID:Date:To:Sender:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=brZgOC6bCKV2G8EvQ8/rLCm+m6wk29x/o3o7BO5CWA8=; b=SNlcK7QqF0Pep9jE+wzoja0WZW
	NI1aBWxYhHVj9NZeeVOuKaeqYmfKxBWkmULoU3YLAeCCjYy6mVf7mFN8W2CZWU+x5gAyaMRP768d9
	JOJo/N85HWjg4paCTm5tb0jBkzx9s0WSOAuwA9vPKITSy8SwlmItbJ7VDj5JVO2n2ggs=;
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1vsWIN-0007k3-8S;
	Wed, 18 Feb 2026 01:24:04 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <ebiggers@kernel.org>) id 1vsWIL-0007jp-DB
 for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 18 Feb 2026 01:24:02 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:Message-ID:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=j1gvlyunZzWA+pP0PdrKjZBH+llNycodrK7u4vRaNDA=; b=JLSjIiRzjW8qRmnOT6Mggze8Pv
 BRA1FDlPK5m5u2wY1i6hbiPlV5gf8739tS6gReT9P2ZLxScZ9J7VNMZDhGn+MXmlppefaB/CahFHT
 j3Ur5uA8t6rLI4umNzviklwMxMz6F4SttxpYe9JMlPiZUC+XjBgbDkxpgeGf/DvidRwU=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:Cc:To:From
 :Sender:Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=j1gvlyunZzWA+pP0PdrKjZBH+llNycodrK7u4vRaNDA=; b=L
 xGP10Aa2WIlsY33vCa25UWPIaV69CsLishjyI0XeN5qGs9CHMTjOAkuzu19fIG0Eh3nBROERxiea5
 /2lmlokWOw1UzSEVcNAYGV2M8dYsbPRBf97wxIOQaeiV6SpKdDOrsycJ5RjeuS5W4yjC21dJAXMVY
 vjy9saDJClPtpJ9M=;
Received: from tor.source.kernel.org ([172.105.4.254])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1vsWIL-0004C1-7W for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 18 Feb 2026 01:24:02 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 4F57560128;
 Wed, 18 Feb 2026 01:23:50 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C1169C4CEF7;
 Wed, 18 Feb 2026 01:23:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1771377830;
 bh=Xboojag1vEgmqOg34zLpFazvcP43i/jI0x1goHvyFNo=;
 h=From:To:Cc:Subject:Date:From;
 b=bQ+BG/eLuJWw8bYqg6Iq9tsAx3tFm5EaysXtrmjMcljXmjSf8leEzmwaMvGBM9a2D
 Di7zQIbdet1YvATbX4SRu3PsBLSepdyKwbt//6eJ6nMjf5hpAv1OV5wwVAEFM9GNs6
 t3l+rlj37kr36WCJOI0yN62rwcJOQg4PHc72pJrtat+3rYEuHR1UpszqmMft8FX4aE
 t7JIPI5vUsMPEpVy+GTeyOm8p3pQh8wnijNFBoz01fCv+gfR0gC/xqMw2eApc9HJGb
 eyM9C9Ud+d+h8Z+joMgFdHlqIZlXd5UYvQz1CD0oKE3+8lfmaqUCqQVgywBqK2scfB
 mo+ALPctDIzOw==
To: fsverity@lists.linux.dev
Date: Tue, 17 Feb 2026 17:22:44 -0800
Message-ID: <20260218012244.18536-1-ebiggers@kernel.org>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-1.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: hppa-linux-gcc 9.5.0 generates a call to fsverity_readahead()
 in f2fs_readahead() when CONFIG_FS_VERITY=n,
 because it fails to do the expected
 dead code elimination based on vi always being NULL. Fix [...] 
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
X-Headers-End: 1vsWIL-0004C1-7W
Subject: [f2fs-dev] [PATCH] fsverity: fix build error by adding
 fsverity_readahead() stub
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
From: Eric Biggers via Linux-f2fs-devel
 <linux-f2fs-devel@lists.sourceforge.net>
Reply-To: Eric Biggers <ebiggers@kernel.org>
Cc: linux-fsdevel@vger.kernel.org, Eric Biggers <ebiggers@kernel.org>,
 kernel test robot <lkp@intel.com>, Christoph Hellwig <hch@lst.de>,
 linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-8.61 / 15.00];
	WHITELIST_DMARC(-7.00)[sourceforge.net:D:+];
	DMARC_POLICY_ALLOW_WITH_FAILURES(-0.50)[];
	RWL_MAILSPIKE_EXCELLENT(-0.40)[216.105.38.7:from];
	R_DKIM_ALLOW(-0.20)[lists.sourceforge.net:s=beta];
	R_SPF_ALLOW(-0.20)[+ip4:216.105.38.7];
	MAILLIST(-0.20)[mailman];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_MIXED(0.00)[];
	FORGED_SENDER(0.00)[linux-f2fs-devel@lists.sourceforge.net,linux-f2fs-devel-bounces@lists.sourceforge.net];
	DMARC_POLICY_ALLOW(0.00)[lists.sourceforge.net,none];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:fsverity@lists.linux.dev,m:linux-fsdevel@vger.kernel.org,m:ebiggers@kernel.org,m:lkp@intel.com,m:hch@lst.de,m:linux-f2fs-devel@lists.sourceforge.net,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	FORWARDED(0.00)[linux-f2fs-devel@lists.sourceforge.net];
	R_DKIM_REJECT(0.00)[sourceforge.net:s=x,sf.net:s=x,kernel.org:s=k20201202];
	DKIM_TRACE(0.00)[lists.sourceforge.net:+,sourceforge.net:-,sf.net:-,kernel.org:-];
	REPLYTO_DOM_NEQ_TO_DOM(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	DBL_BLOCKED_OPENRESOLVER(0.00)[intel.com:email];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[linux-f2fs-devel@lists.sourceforge.net,linux-f2fs-devel-bounces@lists.sourceforge.net];
	REPLYTO_DOM_NEQ_FROM_DOM(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCPT_COUNT_FIVE(0.00)[6];
	TAGGED_RCPT(0.00)[linux-f2fs-devel];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:11320, ipnet:216.105.32.0/21, country:US];
	HAS_REPLYTO(0.00)[ebiggers@kernel.org]
X-Rspamd-Queue-Id: A767D15283A
X-Rspamd-Action: no action

hppa-linux-gcc 9.5.0 generates a call to fsverity_readahead() in
f2fs_readahead() when CONFIG_FS_VERITY=n, because it fails to do the
expected dead code elimination based on vi always being NULL.  Fix the
build error by adding an inline stub for fsverity_readahead().  Since
it's just for opportunistic readahead, just make it a no-op.

Reported-by: kernel test robot <lkp@intel.com>
Closes: https://lore.kernel.org/oe-kbuild-all/202602180838.pwICdY2r-lkp@intel.com/
Fixes: 45dcb3ac9832 ("f2fs: consolidate fsverity_info lookup")
Signed-off-by: Eric Biggers <ebiggers@kernel.org>
---
 include/linux/fsverity.h | 9 +++++++--
 1 file changed, 7 insertions(+), 2 deletions(-)

diff --git a/include/linux/fsverity.h b/include/linux/fsverity.h
index fed91023bea9..29bbc8c66159 100644
--- a/include/linux/fsverity.h
+++ b/include/linux/fsverity.h
@@ -193,10 +193,12 @@ int __fsverity_file_open(struct inode *inode, struct file *filp);
 
 int fsverity_ioctl_read_metadata(struct file *filp, const void __user *uarg);
 
 /* verify.c */
 
+void fsverity_readahead(struct fsverity_info *vi, pgoff_t index,
+			unsigned long nr_pages);
 bool fsverity_verify_blocks(struct fsverity_info *vi, struct folio *folio,
 			    size_t len, size_t offset);
 void fsverity_verify_bio(struct fsverity_info *vi, struct bio *bio);
 void fsverity_enqueue_verify_work(struct work_struct *work);
 
@@ -253,10 +255,15 @@ static inline int fsverity_ioctl_read_metadata(struct file *filp,
 	return -EOPNOTSUPP;
 }
 
 /* verify.c */
 
+static inline void fsverity_readahead(struct fsverity_info *vi, pgoff_t index,
+				      unsigned long nr_pages)
+{
+}
+
 static inline bool fsverity_verify_blocks(struct fsverity_info *vi,
 					  struct folio *folio, size_t len,
 					  size_t offset)
 {
 	WARN_ON_ONCE(1);
@@ -307,12 +314,10 @@ static inline int fsverity_file_open(struct inode *inode, struct file *filp)
 		return __fsverity_file_open(inode, filp);
 	return 0;
 }
 
 void fsverity_cleanup_inode(struct inode *inode);
-void fsverity_readahead(struct fsverity_info *vi, pgoff_t index,
-			unsigned long nr_pages);
 
 struct page *generic_read_merkle_tree_page(struct inode *inode, pgoff_t index);
 void generic_readahead_merkle_tree(struct inode *inode, pgoff_t index,
 				   unsigned long nr_pages);
 

base-commit: 2961f841b025fb234860bac26dfb7fa7cb0fb122
-- 
2.53.0



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
