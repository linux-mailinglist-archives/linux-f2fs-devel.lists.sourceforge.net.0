Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id Gbr0La98S2rwSAEAu9opvQ
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 06 Jul 2026 12:00:15 +0200
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 02DC370ED8C
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 06 Jul 2026 12:00:15 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=lists.sourceforge.net header.s=beta header.b=lNXvAM1z;
	dkim=fail ("body hash did not verify") header.d=sourceforge.net header.s=x header.b="i0YXbZX/";
	dkim=fail ("body hash did not verify") header.d=sf.net header.s=x header.b="M sxTaeN";
	dkim=fail ("body hash did not verify") header.d=kernel.org header.s=k20260515 header.b=o0672R1m;
	dmarc=pass (policy=none) header.from=lists.sourceforge.net;
	spf=pass (mail.lfdr.de: domain of linux-f2fs-devel-bounces@lists.sourceforge.net designates 216.105.38.7 as permitted sender) smtp.mailfrom=linux-f2fs-devel-bounces@lists.sourceforge.net
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:MIME-Version:Message-ID:Date:To:Sender:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=dCAfCcFtKibQnZLF7D7kIcYD4DzLbj/BYYDHj6+umuM=; b=lNXvAM1zSfGu68HwLwum8Y1V3J
	zM4IWmfSP8xBZBRI2DKJhGcmliRisKtraNKIdlz7zCvDxv1armnBBhpM9dsJgHXUL1k+WbMqRGv48
	g7DXkOCfPaZu/L+/xhAOHlhJaGqwKcXjMYIljbQn9brN2gxA9KMahjEY8QCAwn4MvZlU=;
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1wgg7R-0001TO-Um;
	Mon, 06 Jul 2026 10:00:05 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <chao@kernel.org>) id 1wgg7Q-0001TG-BJ
 for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 06 Jul 2026 10:00:04 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:Message-ID:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=chjPuNCFQtUiE7OqGIJnm2ZFSRal0XTYbXylExYq4fo=; b=i0YXbZX/xiaPSfQhCpCiU+gYL0
 +wLD2IEvnd6q0stvtDLGBn9zb59xcPqaza5hp5LNrxmeevEhQSfyRSEdjWSyGYQcBMShePNJXryEg
 VPrEoj0J5i2JlrHm46nX180ZVYvYPp4GXMlj4cIYKd4aWtYVJSC5ikJfP3uY8IYjLBxI=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:Cc:To:From
 :Sender:Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=chjPuNCFQtUiE7OqGIJnm2ZFSRal0XTYbXylExYq4fo=; b=M
 sxTaeN+bfGY69cO1DH5s1wL5f2Dcar0b15eOOlpZrQpIGVd8tIDDHh+JF0XyBRq21lJJkAVIjuk6R
 9lyzdC2RDtBpcnswTBrX/yty2iYTRYvrsqWuOhy8C0r+xntHW73JhWPIp+hpLzBdgVnWgAx350DUL
 0jupsX0LRf6Hsp9k=;
Received: from sea.source.kernel.org ([172.234.252.31])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1wgg7O-0005cc-1g for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 06 Jul 2026 10:00:04 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
 by sea.source.kernel.org (Postfix) with ESMTP id 38D0040A39;
 Mon,  6 Jul 2026 09:59:52 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BF5E51F00A3D;
 Mon,  6 Jul 2026 09:59:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
 s=k20260515; t=1783331992;
 bh=chjPuNCFQtUiE7OqGIJnm2ZFSRal0XTYbXylExYq4fo=;
 h=From:To:Cc:Subject:Date;
 b=o0672R1m+PN640PWaZ3WGV0QHFpLyyiLlYFGvglbB6O+fpJ0TBx+LXrXhsM/uW+zw
 o3ddwvf+OBYwG9cS00B9UThKtVN/gVxJTyimFG8+c4IIu3K+hwkEt4CsiLZiI3MxRJ
 uo15vLe0ZJ10Kk89PjEtPlPbAfWs9fxH6r+wWIjKQMyzd1t8JBuZmYPrYV2yY6AAcc
 HwSPTCKW0S9g71Um9H9lVX3GupRgZupQzRGdPGrCVWb61sU6N1vyxDpFTVPOdDCkV6
 RlzN6CtUb4uEdkW2Zp5XMXjjYh5VSircD2ZYrTBkYZZuztptyfuXkBPoO1HLbqouj6
 +4i/YdyHNbp0w==
To: jaegeuk@kernel.org
Date: Mon,  6 Jul 2026 17:59:42 +0800
Message-ID: <20260706095943.2560208-1-chao@kernel.org>
X-Mailer: git-send-email 2.55.0.rc2.803.g1fd1e6609c-goog
MIME-Version: 1.0
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-2.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: Commit 02117b8ae9c0 ("f2fs: Set GF_NOFS in
 read_cache_page_gfp
 while doing f2fs_quota_read") adds GFP_NOFS in f2fs_quota_read() to avoid
 below deadlock: - do_sys_open - vfs_open - dquot_file_open - dquot_initialize
 - dqget - dquot_acquire : locks &dqopt->dqio_mutex (VFS Quota Mutex) -
 qtree_read_dquot
 - f2fs_quota_read - read_mapping_page (GFP_KERNEL [...] 
 Content analysis details:   (-0.2 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
X-Headers-End: 1wgg7O-0005cc-1g
Subject: [f2fs-dev] [PATCH 1/2] f2fs: quota: do not use GFP_NOFS in
 f2fs_quota_read()
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
From: Chao Yu via Linux-f2fs-devel <linux-f2fs-devel@lists.sourceforge.net>
Reply-To: Chao Yu <chao@kernel.org>
Cc: Jan Kara <jack@suse.cz>, linux-kernel@vger.kernel.org,
 Matthew Wilcox <willy@infradead.org>, linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-7.61 / 15.00];
	WHITELIST_DMARC(-7.00)[sourceforge.net:D:+];
	MID_RHS_MATCH_TO(1.00)[];
	DMARC_POLICY_ALLOW_WITH_FAILURES(-0.50)[];
	RWL_MAILSPIKE_EXCELLENT(-0.40)[216.105.38.7:from];
	R_SPF_ALLOW(-0.20)[+ip4:216.105.38.7];
	MAILLIST(-0.20)[mailman];
	R_DKIM_ALLOW(-0.20)[lists.sourceforge.net:s=beta];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_MIXED(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	ARC_NA(0.00)[];
	REPLYTO_DOM_EQ_TO_DOM(0.00)[];
	FORWARDED(0.00)[linux-f2fs-devel@lists.sourceforge.net];
	FORGED_SENDER(0.00)[linux-f2fs-devel@lists.sourceforge.net,linux-f2fs-devel-bounces@lists.sourceforge.net];
	MIME_TRACE(0.00)[0:+];
	R_DKIM_REJECT(0.00)[sourceforge.net:s=x,sf.net:s=x,kernel.org:s=k20260515];
	FORGED_RECIPIENTS(0.00)[m:jaegeuk@kernel.org,m:jack@suse.cz,m:linux-kernel@vger.kernel.org,m:willy@infradead.org,m:linux-f2fs-devel@lists.sourceforge.net,s:lists@lfdr.de];
	REPLYTO_DOM_NEQ_FROM_DOM(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[lists.sourceforge.net:+,sourceforge.net:-,sf.net:-,kernel.org:-];
	RCVD_COUNT_FIVE(0.00)[5];
	DBL_BLOCKED_OPENRESOLVER(0.00)[infradead.org:email,lists.sourceforge.net:from_smtp,lists.sourceforge.net:dkim,lists.sourceforge.net:helo,lists.sourceforge.net:rdns,lists.sourceforge.net:from_mime,suse.cz:email];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[linux-f2fs-devel@lists.sourceforge.net,linux-f2fs-devel-bounces@lists.sourceforge.net];
	DMARC_POLICY_ALLOW(0.00)[lists.sourceforge.net,none];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-f2fs-devel];
	RCPT_COUNT_FIVE(0.00)[5];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:11320, ipnet:216.105.32.0/21, country:US];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	HAS_REPLYTO(0.00)[chao@kernel.org]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 02DC370ED8C

Commit 02117b8ae9c0 ("f2fs: Set GF_NOFS in read_cache_page_gfp while doing
f2fs_quota_read") adds GFP_NOFS in f2fs_quota_read() to avoid below deadlock:

- do_sys_open
 - vfs_open
  - dquot_file_open
   - dquot_initialize
    - dqget
     - dquot_acquire
      : locks &dqopt->dqio_mutex (VFS Quota Mutex)
      - qtree_read_dquot
       - f2fs_quota_read
        - read_mapping_page (GFP_KERNEL / allows GFP_FS)
         - __alloc_pages_nodemask
          - try_to_free_pages (Direct Reclaim)
           - prune_icache_sb
            - evict
             - f2fs_evict_inode
              - dquot_drop
               - dqput
                - dquot_commit
                 : tries to lock &dqopt->dqio_mutex again
                 ==> DEADLOCK (waiting for itself)

As Jan Kara mentioned, quota system has fixed this issue w/ commit
537e11cdc7a6 ("quota: Prevent memory allocation recursion while holding
dq_lock"), so this GFP_NOFS flag should be relic, let's drop it.

Cc: Jan Kara <jack@suse.cz>
Cc: Matthew Wilcox <willy@infradead.org>
Signed-off-by: Chao Yu <chao@kernel.org>
---
 fs/f2fs/super.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/fs/f2fs/super.c b/fs/f2fs/super.c
index da468df058eb..fdfd6a7203dd 100644
--- a/fs/f2fs/super.c
+++ b/fs/f2fs/super.c
@@ -3167,8 +3167,7 @@ static ssize_t f2fs_quota_read(struct super_block *sb, int type, char *data,
 		size_t offset;
 
 repeat:
-		folio = mapping_read_folio_gfp(mapping, off >> PAGE_SHIFT,
-				GFP_NOFS);
+		folio = mapping_read_folio_gfp(mapping, off >> PAGE_SHIFT, 0);
 		if (IS_ERR(folio)) {
 			if (PTR_ERR(folio) == -ENOMEM) {
 				memalloc_retry_wait(GFP_NOFS);
-- 
2.49.0



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
