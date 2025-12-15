Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 76647CBDCC6
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 15 Dec 2025 13:28:44 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:MIME-Version:Message-ID:Date:To:Sender:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=Qw7G4R8nVsHAKEAlA0SDLVeYlC52jjZJvUymw87fU/Y=; b=EO/jxi39Y+TJpQOvkoxwG6DsEV
	OHO8UxRwfKxx1DY+knbx2yXkQ2D3iGjAok9Oo6Z7JdwKsXJaAhZ8XfStrVnhaz+Qa6vfEWiqK7eyA
	+SzcNBWI8BvYYy+TcrxykIaKFnLRO8uy6+3jYhL7IQZPslnN/rQ3F5jRFG1NFCGSnwY4=;
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1vV7gw-00026f-Cm;
	Mon, 15 Dec 2025 12:28:43 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <chao@kernel.org>) id 1vV7gu-00026T-Tt
 for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 15 Dec 2025 12:28:41 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:Message-ID:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=FD3svua92cpmuY9Qjkv2pNDhVb+zb3fvxtKeCkm/brI=; b=aeclIPLXZrs7SRF/s7rCgWRR1F
 hX73klepGSoQBWH1pWSJnGeco3Y1yx5Exo3EwtOoEQjf+D2CwaiMsWqb0AszzXsO1H6+TK22hsBz1
 kfNiVOF4hKIL2Vi5EozeH7f8+6m+tiVeSw7sFRwJzlCE7ZxAL0THE76Gu0RNPk+Nvowk=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:Cc:To:From
 :Sender:Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=FD3svua92cpmuY9Qjkv2pNDhVb+zb3fvxtKeCkm/brI=; b=b
 AyidMzqJvu21QJfE5h7cZec9XMZ6D08k3dhMt099heYnzbkMHu3WOwC7I5AroBB/GEiakiBloqKEt
 FVKOktfiYkISq4su7J8xTT8//LKVfnaCKsDicmU2dQ75CG86N+B36tBF1QpdPX8IgwETpuopS+a7P
 rEdMKV/ZyS88SWrM=;
Received: from sea.source.kernel.org ([172.234.252.31])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1vV7gv-0000Ja-5P for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 15 Dec 2025 12:28:41 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id CD0B243EC3
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Mon, 15 Dec 2025 12:28:35 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1C39DC4CEF5;
 Mon, 15 Dec 2025 12:28:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1765801715;
 bh=RZvd85nvfhqfjtMWDxGTEAT94wttNeZtSpvWhvrUFu4=;
 h=From:To:Cc:Subject:Date:From;
 b=szihdfv96P+cEPknHgyHbr8+JjurQJ1VAtmESL0TkloZG6bNMJh5MX/kdp/5Ohg8Z
 QLE1a7OhrRXZT+v7kEzJODLpHCf7tlmDupMj1FPIQfct7V12s/TecwXWOtwgBSvlpp
 5Bw2Z1JT8+aEp0A2RAMX6JIfS2HmAkHCkTGbE+/1vHNTbEmQiF85qQlnzo4M+JDSKW
 qv17k+NszvEHVCH2RM5dADMR+fwuawlWmTzijmtZ7iwEfRU68u10ESY4zOAzlieXNc
 IBPuyrR09DtTHaCpX9vNRdoyK08h9Uw2QMlVcKYVbsZv4AZsehzFlEtCmQ6ySygtfM
 v+wbgZkfEuzrA==
To: jaegeuk@kernel.org
Date: Mon, 15 Dec 2025 20:28:30 +0800
Message-ID: <20251215122830.3495475-1-chao@kernel.org>
X-Mailer: git-send-email 2.52.0.239.gd5f0c6e74e-goog
MIME-Version: 1.0
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-2.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: In order to avoid loading corrupted nat entry from disk. Cc:
 stable@kernel.org Signed-off-by: Chao Yu <chao@kernel.org> --- fs/f2fs/node.c
 | 9 +++++---- 1 file changed, 5 insertions(+), 4 deletions(-) 
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
X-Headers-End: 1vV7gv-0000Ja-5P
Subject: [f2fs-dev] [PATCH] f2fs: fix to sanity check on nat_entry.nid in
 f2fs_get_node_info()
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
Cc: stable@kernel.org, linux-kernel@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

In order to avoid loading corrupted nat entry from disk.

Cc: stable@kernel.org
Signed-off-by: Chao Yu <chao@kernel.org>
---
 fs/f2fs/node.c | 9 +++++----
 1 file changed, 5 insertions(+), 4 deletions(-)

diff --git a/fs/f2fs/node.c b/fs/f2fs/node.c
index ce471e033774..13c88dfd790d 100644
--- a/fs/f2fs/node.c
+++ b/fs/f2fs/node.c
@@ -630,14 +630,15 @@ int f2fs_get_node_info(struct f2fs_sb_info *sbi, nid_t nid,
 	node_info_from_raw_nat(ni, &ne);
 	f2fs_folio_put(folio, true);
 sanity_check:
-	if (__is_valid_data_blkaddr(ni->blk_addr) &&
+	if (unlikely(ni->nid != nid ||
+		(__is_valid_data_blkaddr(ni->blk_addr) &&
 		!f2fs_is_valid_blkaddr(sbi, ni->blk_addr,
-					DATA_GENERIC_ENHANCE)) {
+					DATA_GENERIC_ENHANCE)))) {
 		set_sbi_flag(sbi, SBI_NEED_FSCK);
 		f2fs_err_ratelimited(sbi,
-			"f2fs_get_node_info of %pS: inconsistent nat entry, "
+			"f2fs_get_node_info of %pS: nid:%u, inconsistent nat entry, "
 			"ino:%u, nid:%u, blkaddr:%u, ver:%u, flag:%u",
-			__builtin_return_address(0),
+			__builtin_return_address(0), nid,
 			ni->ino, ni->nid, ni->blk_addr, ni->version, ni->flag);
 		f2fs_handle_error(sbi, ERROR_INCONSISTENT_NAT);
 		return -EFSCORRUPTED;
-- 
2.49.0



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
