Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id iIm7I04svGnXuAIAu9opvQ
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	for <lists+linux-f2fs-devel@lfdr.de>; Thu, 19 Mar 2026 18:03:10 +0100
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 325022CF530
	for <lists+linux-f2fs-devel@lfdr.de>; Thu, 19 Mar 2026 18:03:05 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:MIME-Version:References:In-Reply-To:
	Message-ID:Date:To:Sender:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=tOdJoHCJaMyNzIJE/HwK+Ck5+wsbfgs6bD8eq5dKIMs=; b=A2+2SgPBVLXRKasyiwL/GhtEp5
	lvELJiWZey4Eq7ouWje267xtkGmzok/PfctmDTu2yB9uBj+cl7EgPSL5fKSeferVvR6nTUI8kCS2V
	1kJauqjUn3/rY9U0Qzp+gPgLOTsmfk7MaxZ+zo3p/kMwLl+3gNmVe3qRYwtfvZY6aSP0=;
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1w3Glz-0008Qf-0S;
	Thu, 19 Mar 2026 17:03:03 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <aalbersh@kernel.org>) id 1w3Glx-0008QK-62
 for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 19 Mar 2026 17:03:01 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=nPIpow4OLeGwVXVNqYy7gHuWPlSWwYQI034ji3TbLJU=; b=O9Ewi8Kr2PIw7COWU+II31uaVs
 rbIHADlUVBLW0aX/HQWxwInggnVpwRvcD1EAwlDJ+JriUBPFJwBm3QsUZFulE86hDduZOq6bvZkEP
 H1gPsfQwQ2yUQqTUb4ARfyblgY3y5dd8BOrXrCOJKYXWSzxXuh4CEDXS5FmZI1gcff8c=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=nPIpow4OLeGwVXVNqYy7gHuWPlSWwYQI034ji3TbLJU=; b=k4CkSFskd1ArJ+enwaKOgSan4U
 I+xpUDx9kQZ+x3SiZlx5dQYcc4Mfub73o/pjAWRnhLQnMw6BsOo7w+8kHDJ5PcjjOdOzqo4Urgej7
 zzcavwWr9uH6ZwWQLjFqc/tNiPbpn8WfCedjbRdjL66pl/wlFik8ho1gCr3lT6h5k44o=;
Received: from sea.source.kernel.org ([172.234.252.31])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1w3Glx-0005dX-3f for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 19 Mar 2026 17:03:01 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id C471E43999;
 Thu, 19 Mar 2026 17:02:50 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 709FFC19424;
 Thu, 19 Mar 2026 17:02:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1773939770;
 bh=243Psy4aTxTkRvGQCs3mF2qAJ/K0xtW/ydhm17iP0yA=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=aw3buszNn1Vs0ZA598ldjdI1sDtkmLPvnxtjy19g37dxZmn/KCO1JIoHxtjYkFojP
 ik7mLeyOMatCbNKnEWt1/aEsRIAsDadjIoVGyZuFpUkpMBO4PCDCbpJQKNEkwlmcj+
 dYSRSsyFpsUayDt9E+R7sDuSf/Kg0uWeunegeCiF/0WUSw+/pMLWqfznzcLX7tLnPM
 egQXseH/9j5YQQn4LJ/qnk/Xh7TsVhvjzOncAq6ClxPKRTkEU0GeC5+wbUxwV8Dm2+
 Si12/CGsxgpAw7EchzQQ3+qP1O8t5nLyTl/+GKC1tloz7r8T6YgMsqtkPkppBvcAGb
 JUOQJ2usppDnQ==
To: linux-xfs@vger.kernel.org, fsverity@lists.linux.dev,
 linux-fsdevel@vger.kernel.org, ebiggers@kernel.org
Date: Thu, 19 Mar 2026 18:01:51 +0100
Message-ID: <20260319170231.1455553-5-aalbersh@kernel.org>
X-Mailer: git-send-email 2.51.2
In-Reply-To: <20260319170231.1455553-1-aalbersh@kernel.org>
References: <20260319170231.1455553-1-aalbersh@kernel.org>
MIME-Version: 1.0
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-1.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  Helper to pre-fill folio with hashes of empty blocks. This
 will be used by iomap to synthesize blocks full of zero hashes on the fly.
 Signed-off-by: Andrey Albershteyn <aalbersh@kernel.org> Reviewed-by: "Darrick
 J. Wong" <djwong@kernel.org> --- fs/verity/pagecache.c | 22
 ++++++++++++++++++++++
 include/linux/fsverity.h | 8 ++++++++ 2 [...] 
 Content analysis details:   (-0.2 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1w3Glx-0005dX-3f
Subject: [f2fs-dev] [PATCH v5 04/25] fsverity: introduce
 fsverity_folio_zero_hash()
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
	MAILLIST(-0.20)[mailman];
	R_DKIM_ALLOW(-0.20)[lists.sourceforge.net:s=beta];
	R_SPF_ALLOW(-0.20)[+ip4:216.105.38.7:c];
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
	RSPAMD_EMAILBL_FAIL(0.00)[aalbersh.kernel.org:query timed out];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ASN(0.00)[asn:11320, ipnet:216.105.32.0/21, country:US];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.sourceforge.net:helo,lists.sourceforge.net:rdns,lists.sourceforge.net:dkim]
X-Rspamd-Queue-Id: 325022CF530
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Helper to pre-fill folio with hashes of empty blocks. This will be used
by iomap to synthesize blocks full of zero hashes on the fly.

Signed-off-by: Andrey Albershteyn <aalbersh@kernel.org>
Reviewed-by: "Darrick J. Wong" <djwong@kernel.org>
---
 fs/verity/pagecache.c    | 22 ++++++++++++++++++++++
 include/linux/fsverity.h |  8 ++++++++
 2 files changed, 30 insertions(+)

diff --git a/fs/verity/pagecache.c b/fs/verity/pagecache.c
index 1819314ecaa3..1d94bf73f38c 100644
--- a/fs/verity/pagecache.c
+++ b/fs/verity/pagecache.c
@@ -2,6 +2,7 @@
 /*
  * Copyright 2019 Google LLC
  */
+#include "fsverity_private.h"
 
 #include <linux/export.h>
 #include <linux/fsverity.h>
@@ -56,3 +57,24 @@ void generic_readahead_merkle_tree(struct inode *inode, pgoff_t index,
 		folio_put(folio);
 }
 EXPORT_SYMBOL_GPL(generic_readahead_merkle_tree);
+
+/**
+ * fsverity_folio_zero_hash() - fill folio with hashes of zero data block
+ * @folio:	folio to fill
+ * @poff:	offset in the folio to start
+ * @plen:	length of the range to fill with hashes
+ * @vi:		fsverity info
+ */
+void fsverity_folio_zero_hash(struct folio *folio, size_t poff, size_t plen,
+			      struct fsverity_info *vi)
+{
+	size_t offset = poff;
+
+	WARN_ON_ONCE(!IS_ALIGNED(poff, vi->tree_params.digest_size));
+	WARN_ON_ONCE(!IS_ALIGNED(plen, vi->tree_params.digest_size));
+
+	for (; offset < (poff + plen); offset += vi->tree_params.digest_size)
+		memcpy_to_folio(folio, offset, vi->tree_params.zero_digest,
+				vi->tree_params.digest_size);
+}
+EXPORT_SYMBOL_GPL(fsverity_folio_zero_hash);
diff --git a/include/linux/fsverity.h b/include/linux/fsverity.h
index 8ba7806b225e..35bb76093de5 100644
--- a/include/linux/fsverity.h
+++ b/include/linux/fsverity.h
@@ -202,6 +202,8 @@ bool fsverity_verify_blocks(struct fsverity_info *vi, struct folio *folio,
 			    size_t len, size_t offset);
 void fsverity_verify_bio(struct fsverity_info *vi, struct bio *bio);
 void fsverity_enqueue_verify_work(struct work_struct *work);
+void fsverity_folio_zero_hash(struct folio *folio, size_t poff, size_t plen,
+			      struct fsverity_info *vi);
 
 #else /* !CONFIG_FS_VERITY */
 
@@ -288,6 +290,12 @@ static inline int fsverity_ensure_verity_info(struct inode *inode)
 	return -EOPNOTSUPP;
 }
 
+static inline void fsverity_folio_zero_hash(struct folio *folio, size_t poff,
+		size_t plen, struct fsverity_info *vi)
+{
+	WARN_ON_ONCE(1);
+}
+
 #endif	/* !CONFIG_FS_VERITY */
 
 static inline bool fsverity_verify_folio(struct fsverity_info *vi,
-- 
2.51.2



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
