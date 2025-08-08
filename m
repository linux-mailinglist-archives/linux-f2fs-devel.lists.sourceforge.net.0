Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id C7D4CB1EDEC
	for <lists+linux-f2fs-devel@lfdr.de>; Fri,  8 Aug 2025 19:42:13 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:MIME-Version:References:In-Reply-To:
	Message-Id:Date:To:Sender:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=CDRbcHmW/rssvTD6zwuTTY+Jp/ipdoso2HaQK4Fs38o=; b=bc8Q7jcBb7nBImopdZgYV1k2lh
	IhB6H9du1NB0FrAMBF+jAXUMCgUonyDKLE7l+PT2CoLaplAmKRZ6F56L9vrmjvc6TTDc+/fqBokIP
	Pt/RoaG1OHRAmkraPXugvnUptd8AYb+sRp6nhOE8o5VNB5ChOz2E1aF9l3jnlpgF2CU8=;
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1ukR6X-0006VK-3K;
	Fri, 08 Aug 2025 17:42:09 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <sashal@kernel.org>) id 1ukR6V-0006VA-9f
 for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 08 Aug 2025 17:42:07 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=Gv8i5tRACKneWNJlgo3zNdZkMeX8bVI/X/w3M4ncibw=; b=AATvNGOlrHdX3VtnTp1cIGHvpJ
 v+ExbpQmtvSAmJmQ50n1Wwwv/cTptr8zgSMzBpLJ+T4KtGbVt+kD2tsEPqlz07lsTj9y2BirUsvPQ
 Y73o3Nu9OgpQ1EyYaPEMHCk1+3YzgF+1OgOWQt3glKV1EkT2VbseIS+pvzN/FCmxSPI4=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=Gv8i5tRACKneWNJlgo3zNdZkMeX8bVI/X/w3M4ncibw=; b=kS1BxPl0iR/J27ojeQgVHHUyzc
 ySqM5BdwYFsoUTykmJqraPp5Xxmn9+DT48R8lsDexyR5MkkK5gmrSmVzfjVGQkDBS1SmzKnLDdJt1
 krW8QmE/RJVOlaj/k7ACP4q6Sy3jz6e21g2c5GP8bujWOTJAew7BdxyN1Rln5S1c8oU0=;
Received: from sea.source.kernel.org ([172.234.252.31])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1ukR6U-0004mO-MF for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 08 Aug 2025 17:42:07 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id 65F3244C69
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Fri,  8 Aug 2025 17:41:56 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3688BC4CEF6;
 Fri,  8 Aug 2025 17:41:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1754674916;
 bh=kEWlOktnyZwjJKz+hmcULA3mO6mETSHAMPCejDarDQs=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=mUhFzcCD7G2QkXOE766f0sw9V9xk2OXkVNNS0YeAqdn7rk/+TPE+yl5I1L7m78wgd
 aadLNJqrBQuuo8/lSY1mhXmI/P8QgYR0XPqQsof1x2s1ZczYRxKKs+CsboPvxHI8we
 sG/KQz9KZL6hcmLkMB/Svw7c25DcNjBdLzUytLgVfFyhx47VUkbAELOkxzqfmkcOvP
 qGeTADVj0YQkU1Xd1T9enDNGJHbAI4rUWbXypxPGWjWcC7g66s75cY8OxIQpn6ctZ9
 bP8/i2nVvjJc6ZVA6Ellu6b3iLY102YwatT8Yi7hNa0RzQg6EvtG/0SI01a49WVqRg
 wVNokwX7LvIEA==
To: patches@lists.linux.dev,
	stable@vger.kernel.org
Date: Fri,  8 Aug 2025 13:41:45 -0400
Message-Id: <20250808174146.1272242-5-sashal@kernel.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250808174146.1272242-1-sashal@kernel.org>
References: <20250808174146.1272242-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 6.16
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-2.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: From: Chao Yu <chao@kernel.org> [ Upstream commit
 1773f63d108b1b9b9d053d8c95f8300c556f93b8
 ] F2FS-fs (dm-55): access invalid blkaddr:972878540 Call trace:
 dump_backtrace+0xec/0x128
 show_stack+0x18/0x28 dump_stack_lvl+0x40/0x88 dump_stack+0x18/0x24
 __f2fs_is_valid_blkaddr+0x360/0x3b4 f2fs_is_v [...] 
 Content analysis details:   (-0.2 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1ukR6U-0004mO-MF
Subject: [f2fs-dev] [PATCH AUTOSEL 6.16] f2fs: handle nat.blkaddr corruption
 in f2fs_get_node_info()
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
From: Sasha Levin via Linux-f2fs-devel <linux-f2fs-devel@lists.sourceforge.net>
Reply-To: Sasha Levin <sashal@kernel.org>
Cc: Sasha Levin <sashal@kernel.org>, Jaegeuk Kim <jaegeuk@kernel.org>,
 linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

From: Chao Yu <chao@kernel.org>

[ Upstream commit 1773f63d108b1b9b9d053d8c95f8300c556f93b8 ]

F2FS-fs (dm-55): access invalid blkaddr:972878540
Call trace:
 dump_backtrace+0xec/0x128
 show_stack+0x18/0x28
 dump_stack_lvl+0x40/0x88
 dump_stack+0x18/0x24
 __f2fs_is_valid_blkaddr+0x360/0x3b4
 f2fs_is_valid_blkaddr+0x10/0x20
 f2fs_get_node_info+0x21c/0x60c
 __write_node_page+0x15c/0x734
 f2fs_sync_node_pages+0x4f8/0x700
 f2fs_write_checkpoint+0x4a8/0x99c
 __checkpoint_and_complete_reqs+0x7c/0x20c
 issue_checkpoint_thread+0x4c/0xd8
 kthread+0x11c/0x1b0
 ret_from_fork+0x10/0x20

If nat.blkaddr is corrupted, during checkpoint, f2fs_sync_node_pages()
will loop to flush node page w/ corrupted nat.blkaddr.

Although, it tags SBI_NEED_FSCK, checkpoint can not persist it due
to deadloop.

Let's call f2fs_handle_error(, ERROR_INCONSISTENT_NAT) to record such
error into superblock, it expects fsck can detect the error and repair
inconsistent nat.blkaddr after device reboot.

Note that, let's add sanity check in f2fs_get_node_info() to detect
in-memory nat.blkaddr inconsistency, but only if CONFIG_F2FS_CHECK_FS
is enabled.

Signed-off-by: Chao Yu <chao@kernel.org>
Signed-off-by: Jaegeuk Kim <jaegeuk@kernel.org>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---

LLM Generated explanations, may be completely bogus:

Based on my analysis of the commit, here is my assessment:

**Backport Status: YES**

This commit should be backported to stable kernel trees for the
following reasons:

1. **Critical Bug Fix**: This fixes a **deadloop/infinite loop
   condition** that can occur during checkpoint operations when NAT
   (Node Address Table) entries have corrupted block addresses. The
   commit message clearly shows a real-world stack trace where
   `f2fs_sync_node_pages()` enters an infinite loop trying to flush
   nodes with corrupted nat.blkaddr during checkpoint.

2. **Data Integrity and System Availability**: The deadloop prevents the
   checkpoint from completing, which means:
   - The filesystem cannot persist the `SBI_NEED_FSCK` flag that would
     trigger repair on next mount
   - The system may hang or become unresponsive during checkpoint
     operations
   - Filesystem metadata corruption cannot be properly handled

3. **Small and Contained Fix**: The patch is relatively small (21
   insertions, 8 deletions) and focused on a single function
   `f2fs_get_node_info()`. The changes are:
   - Move the sanity check earlier in the code path
   - Add proper error handling with `f2fs_handle_error()` and
     `ERROR_INCONSISTENT_NAT`
   - Return `-EFSCORRUPTED` instead of `-EFAULT` for better error
     semantics
   - Add conditional caching logic to avoid caching corrupted entries

4. **Low Risk of Regression**:
   - The main sanity check logic already existed but was incomplete
   - The new error handling path only triggers when corruption is
     detected
   - The CONFIG_F2FS_CHECK_FS conditional check adds extra validation
     only when debugging is enabled
   - The change doesn't alter normal operation flow for valid NAT
     entries

5. **Follows Stable Rules**: This fix meets stable kernel criteria:
   - Fixes a real bug that users have hit (stack trace provided)
   - The fix is minimal and targeted
   - No new features are introduced
   - The risk of regression is low

6. **Corruption Handling**: The commit properly handles filesystem
   corruption by:
   - Setting the `SBI_NEED_FSCK` flag
   - Recording the error in the superblock via `f2fs_handle_error()`
   - Providing detailed error logging for debugging
   - Returning appropriate error codes to prevent further damage

The deadloop condition this fixes is particularly severe as it can make
the system unresponsive and prevent proper error recovery, making this
an important candidate for stable backporting.

 fs/f2fs/node.c | 29 +++++++++++++++++++++--------
 1 file changed, 21 insertions(+), 8 deletions(-)

diff --git a/fs/f2fs/node.c b/fs/f2fs/node.c
index bfe104db284e..2fd287f2bca4 100644
--- a/fs/f2fs/node.c
+++ b/fs/f2fs/node.c
@@ -555,8 +555,8 @@ int f2fs_get_node_info(struct f2fs_sb_info *sbi, nid_t nid,
 	struct f2fs_nat_entry ne;
 	struct nat_entry *e;
 	pgoff_t index;
-	block_t blkaddr;
 	int i;
+	bool need_cache = true;
 
 	ni->flag = 0;
 	ni->nid = nid;
@@ -569,6 +569,10 @@ int f2fs_get_node_info(struct f2fs_sb_info *sbi, nid_t nid,
 		ni->blk_addr = nat_get_blkaddr(e);
 		ni->version = nat_get_version(e);
 		f2fs_up_read(&nm_i->nat_tree_lock);
+		if (IS_ENABLED(CONFIG_F2FS_CHECK_FS)) {
+			need_cache = false;
+			goto sanity_check;
+		}
 		return 0;
 	}
 
@@ -594,7 +598,7 @@ int f2fs_get_node_info(struct f2fs_sb_info *sbi, nid_t nid,
 	up_read(&curseg->journal_rwsem);
 	if (i >= 0) {
 		f2fs_up_read(&nm_i->nat_tree_lock);
-		goto cache;
+		goto sanity_check;
 	}
 
 	/* Fill node_info from nat page */
@@ -609,14 +613,23 @@ int f2fs_get_node_info(struct f2fs_sb_info *sbi, nid_t nid,
 	ne = nat_blk->entries[nid - start_nid];
 	node_info_from_raw_nat(ni, &ne);
 	f2fs_folio_put(folio, true);
-cache:
-	blkaddr = le32_to_cpu(ne.block_addr);
-	if (__is_valid_data_blkaddr(blkaddr) &&
-		!f2fs_is_valid_blkaddr(sbi, blkaddr, DATA_GENERIC_ENHANCE))
-		return -EFAULT;
+sanity_check:
+	if (__is_valid_data_blkaddr(ni->blk_addr) &&
+		!f2fs_is_valid_blkaddr(sbi, ni->blk_addr,
+					DATA_GENERIC_ENHANCE)) {
+		set_sbi_flag(sbi, SBI_NEED_FSCK);
+		f2fs_err_ratelimited(sbi,
+			"f2fs_get_node_info of %pS: inconsistent nat entry, "
+			"ino:%u, nid:%u, blkaddr:%u, ver:%u, flag:%u",
+			__builtin_return_address(0),
+			ni->ino, ni->nid, ni->blk_addr, ni->version, ni->flag);
+		f2fs_handle_error(sbi, ERROR_INCONSISTENT_NAT);
+		return -EFSCORRUPTED;
+	}
 
 	/* cache nat entry */
-	cache_nat_entry(sbi, nid, &ne);
+	if (need_cache)
+		cache_nat_entry(sbi, nid, &ne);
 	return 0;
 }
 
-- 
2.39.5



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
