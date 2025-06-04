Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 15A9AACD204
	for <lists+linux-f2fs-devel@lfdr.de>; Wed,  4 Jun 2025 03:02:14 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:MIME-Version:References:In-Reply-To:
	Message-Id:Date:To:Sender:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ZXRc+yqYHm6/yPCqvaIrxuoFBad+LbnijkJ4CZoZue8=; b=VabVUCPGx9iIPFFcIfKb0y96PO
	UPSjxUkM8COfb5f4U9B5r05CKR1mCrZ2ZV5M/FkdETr7PcYqT9cmzVJ2aXoxkdPTRU1/mEnNgOMkC
	JRLOy1dN6a7nQnVy/tWNjuTD4Xy5TSL/ypbnGtwzRXEZovwDzL48nwHAUz/D/v0SW//A=;
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1uMcW9-0002ww-Ar;
	Wed, 04 Jun 2025 01:02:09 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <sashal@kernel.org>) id 1uMcW7-0002wq-Im
 for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 04 Jun 2025 01:02:07 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=cfa021vq/RXdEaIMjHWhK0e5TVAImejkt0MSRseG26Y=; b=ZENKzTDMPCmDBiLKNkUTtX0zM5
 ebVCisF0reXtM3icdmgnHR5+HuKSSabDgrDaMz+xVHFJtRF+BUfXYKHRYMoo6B3z+wxSjHdNB1pF5
 010kk4ZS0j4PJSegfN74pKzzTQ76VAA6fUyeQvGP66FCENHpgx6x5GBHvKfpJy+ZAsTU=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=cfa021vq/RXdEaIMjHWhK0e5TVAImejkt0MSRseG26Y=; b=eUNYh6r/Aw9z/MbfUUeW7uf4Gj
 ST0s68lFNVuXvwWH+WYm0e+EpkuRJIaT9AdvDXiX3wjlO/Tl9aLdyGetA3jOOyizdYs5hHs11PMvB
 ZurcBe3lbzQ4filEofs9d1JhC2NxOMAkzw8aGfxQnnDAbB0Jj/A8fNu8a0UF63uLCptw=;
Received: from nyc.source.kernel.org ([147.75.193.91])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1uMcW6-0001Cg-9J for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 04 Jun 2025 01:02:07 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id 8353BA4FE47;
 Wed,  4 Jun 2025 01:01:55 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4616AC4CEED;
 Wed,  4 Jun 2025 01:01:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1748998915;
 bh=VKqfhA7TrbXh3WBQ+CW7rSzRxbN9u+9Z3IPj0kUVkgg=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=kqFEVwBc4kxku/4vCnfesBkkh3i4rZ5shv2ovKR9twqNGkd3F7TM2lsxPm1jL2mW5
 x8zzMFb0ni4a27riHe3fg2nIrL7ZrlPVOhMEO2fAVl88JBVRBS53EQlEyvzpkwDc58
 5tZRhsW3qXSRCreUL40ze7NP56CEy6+HXEv3HESy8xW7r8MUCMNGogUlJapFQkbXdf
 6KofZYAxIw30hwqfsdIEw7y7XYAsTPZw+FUcGzPqyijwVNx86nzXzCLlVEiUSOtfWy
 cKyOVPbQsRanHt1Dnpxz1hEdXg0fQBoEQvxxnRwFoOkCToQf8/+G2vnW/gG1e+QqN+
 ybKp2DiLN/WkQ==
To: patches@lists.linux.dev,
	stable@vger.kernel.org
Date: Tue,  3 Jun 2025 20:59:11 -0400
Message-Id: <20250604005919.4191884-85-sashal@kernel.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250604005919.4191884-1-sashal@kernel.org>
References: <20250604005919.4191884-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 6.12.31
X-Spam-Score: -2.6 (--)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: From: Chao Yu <chao@kernel.org> [ Upstream commit
 db03c20c0850dc8d2bcabfa54b9438f7d666c863
 ] 1. After we start atomic write in a database file, before committing all
 data, we'd better not set inode w/ vfs dirty status to avoid redundant updates,
 instead, we only set inode w/ atomic dirty stat [...] 
 Content analysis details:   (-2.6 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -2.3 RCVD_IN_DNSWL_MED      RBL: Sender listed at https://www.dnswl.org/,
 medium trust [147.75.193.91 listed in list.dnswl.org]
 0.0 RCVD_IN_VALIDITY_CERTIFIED_BLOCKED RBL: ADMINISTRATOR NOTICE:
 The query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [147.75.193.91 listed in sa-accredit.habeas.com]
 0.0 RCVD_IN_VALIDITY_RPBL_BLOCKED RBL: ADMINISTRATOR NOTICE: The
 query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [147.75.193.91 listed in bl.score.senderscore.com]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1uMcW6-0001Cg-9J
Subject: [f2fs-dev] [PATCH AUTOSEL 6.12 85/93] f2fs: fix to set atomic write
 status more clear
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
Cc: Sasha Levin <sashal@kernel.org>, Daeho Jeong <daehojeong@google.com>,
 linux-f2fs-devel@lists.sourceforge.net, Zhiguo Niu <zhiguo.niu@unisoc.com>,
 Jaegeuk Kim <jaegeuk@kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

From: Chao Yu <chao@kernel.org>

[ Upstream commit db03c20c0850dc8d2bcabfa54b9438f7d666c863 ]

1. After we start atomic write in a database file, before committing
all data, we'd better not set inode w/ vfs dirty status to avoid
redundant updates, instead, we only set inode w/ atomic dirty status.

2. After we commit all data, before committing metadata, we need to
clear atomic dirty status, and set vfs dirty status to allow vfs flush
dirty inode.

Cc: Daeho Jeong <daehojeong@google.com>
Reported-by: Zhiguo Niu <zhiguo.niu@unisoc.com>
Signed-off-by: Chao Yu <chao@kernel.org>
Reviewed-by: Daeho Jeong <daehojeong@google.com>
Reviewed-by: Zhiguo Niu <zhiguo.niu@unisoc.com>
Signed-off-by: Jaegeuk Kim <jaegeuk@kernel.org>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---

Now let me analyze the code changes step by step to understand the
precise modification: **Analysis of the Commit:** **YES** - This commit
should be backported to stable kernel trees. **Extensive Explanation:**
This commit addresses a critical issue in f2fs atomic write
functionality that can lead to data inconsistency and corruption. Here's
my detailed analysis: ## 1. **Nature of the Bug Fix** The commit fixes a
logic flaw in how f2fs handles inode dirty status during atomic write
operations. The problem lies in the interaction between VFS dirty status
and f2fs-specific atomic write dirty status. ## 2. **Critical Code
Changes Analysis** ### Change 1: `fs/f2fs/inode.c` -
`f2fs_mark_inode_dirty_sync()` ```c // BEFORE: if
(f2fs_is_atomic_file(inode)) return; // AFTER: if
(f2fs_is_atomic_file(inode) && !is_inode_flag_set(inode,
FI_ATOMIC_COMMITTED)) return; ``` **Impact**: This change ensures that
atomic files can only be marked with VFS dirty status **after** they
have been committed (`FI_ATOMIC_COMMITTED` is set). Before this fix,
atomic files would never get VFS dirty status, which could lead to
metadata inconsistencies. ### Change 2: `fs/f2fs/super.c` -
`f2fs_inode_dirtied()` ```c // BEFORE: if (!ret &&
f2fs_is_atomic_file(inode)) set_inode_flag(inode, FI_ATOMIC_DIRTIED); //
AFTER: if (!ret && f2fs_is_atomic_file(inode) &&
!is_inode_flag_set(inode, FI_ATOMIC_COMMITTED)) set_inode_flag(inode,
FI_ATOMIC_DIRTIED); ``` **Impact**: This prevents setting the atomic
dirty flag on files that have already been committed, maintaining proper
state transitions. ### Change 3: `fs/f2fs/segment.c` -
`__f2fs_commit_atomic_write()` ```c // Added comment and condition
check: /bin /bin.usr-is-merged /boot /dev /etc /home /init /lib
/lib.usr-is-merged /lib64 /lost+found /media /mnt /opt /proc /root /run
/sbin /sbin.usr-is-merged /snap /srv /sys /tmp /usr /var capability_test
capability_test.c f2fs_folio_analysis.md ipv4_multipath_analysis.md
ipv6_route_allocation_rcu_analysis.md ixgbe_e610_set_phys_id_analysis.md
linux lpfc_timeout_analysis.md mac80211_mlo_mbssid_analysis.md
pfcp_driver_historical_analysis.md rtl_bb_delay_analysis.md
rtw89_mlo_analysis.md tcp_multipath_load_balance_analysis.md
test_conflict.yaml test_unaligned_diff test_unaligned_diff.c
type_size_check type_size_check.c veth_driver_analysis.md
wifi_mlo_mbssid_tx_link_id_analysis.md inode may has no
FI_ATOMIC_DIRTIED flag due to no write capability_test capability_test.c
f2fs_folio_analysis.md ipv4_multipath_analysis.md
ipv6_route_allocation_rcu_analysis.md ixgbe_e610_set_phys_id_analysis.md
linux lpfc_timeout_analysis.md mac80211_mlo_mbssid_analysis.md
pfcp_driver_historical_analysis.md rtl_bb_delay_analysis.md
rtw89_mlo_analysis.md tcp_multipath_load_balance_analysis.md
test_conflict.yaml test_unaligned_diff test_unaligned_diff.c
type_size_check type_size_check.c veth_driver_analysis.md
wifi_mlo_mbssid_tx_link_id_analysis.md before commit. linux/ if
(is_inode_flag_set(inode, FI_ATOMIC_DIRTIED)) { /bin /bin.usr-is-merged
/boot /dev /etc /home /init /lib /lib.usr-is-merged /lib64 /lost+found
/media /mnt /opt /proc /root /run /sbin /sbin.usr-is-merged /snap /srv
/sys /tmp /usr /var clear atomic dirty status and set vfs dirty status
linux/ clear_inode_flag(inode, FI_ATOMIC_DIRTIED);
f2fs_mark_inode_dirty_sync(inode, true); } ``` **Impact**: This ensures
proper transition from atomic dirty status to VFS dirty status during
commit, with clear documentation of the edge case being handled. ## 3.
**Why This Should Be Backported** ### **Critical Correctness Issue** -
**Data Integrity**: The bug can cause atomic writes to not maintain
proper ACID properties, leading to data corruption - **Filesystem
Consistency**: Improper inode dirty state management can cause metadata
inconsistencies - **Database Safety**: This affects database
applications that rely on atomic writes for consistency ### **Minimal
Risk Profile** - **Small, Contained Changes**: Only 3 files modified
with focused logic changes - **No New Features**: Pure bug fix without
introducing new functionality - **Well-Understood Code Path**: Changes
are in well-established f2fs atomic write handling - **Conservative
Approach**: Adds conditions rather than removing them, reducing
regression risk ### **Clear Problem Statement** The commit message
clearly states the issue: 1. **Before atomic commit**: Avoid redundant
VFS updates by only setting atomic dirty status 2. **After atomic
commit**: Clear atomic dirty status and allow VFS dirty status for
proper flushing ### **Matches Successful Backport Patterns** This commit
is very similar to "Similar Commit #1" and "Similar Commit #4" which
were both marked as "Backport Status: YES" because they: - Fix atomic
write-related bugs - Have minimal code changes - Address data integrity
issues - Include proper Fixes tags and stable CC ### **Low Regression
Risk** - Changes are defensive (adding conditions) - Follows existing
state machine logic more precisely - Well-tested atomic write code path
- No architectural changes ### **Affects Real Workloads** - Database
applications using atomic writes - Any application relying on f2fs
atomic write semantics - Mobile and embedded systems commonly using f2fs
This is exactly the type of important bug fix that stable trees are
designed to include: it fixes a real data integrity issue with minimal
risk and no new features.

 fs/f2fs/inode.c   | 4 +++-
 fs/f2fs/segment.c | 6 ++++++
 fs/f2fs/super.c   | 4 +++-
 3 files changed, 12 insertions(+), 2 deletions(-)

diff --git a/fs/f2fs/inode.c b/fs/f2fs/inode.c
index a60db5e795a4c..14193df44ec90 100644
--- a/fs/f2fs/inode.c
+++ b/fs/f2fs/inode.c
@@ -34,7 +34,9 @@ void f2fs_mark_inode_dirty_sync(struct inode *inode, bool sync)
 	if (f2fs_inode_dirtied(inode, sync))
 		return;
 
-	if (f2fs_is_atomic_file(inode))
+	/* only atomic file w/ FI_ATOMIC_COMMITTED can be set vfs dirty */
+	if (f2fs_is_atomic_file(inode) &&
+			!is_inode_flag_set(inode, FI_ATOMIC_COMMITTED))
 		return;
 
 	mark_inode_dirty_sync(inode);
diff --git a/fs/f2fs/segment.c b/fs/f2fs/segment.c
index 769a90b609e2c..449c0acbfabc0 100644
--- a/fs/f2fs/segment.c
+++ b/fs/f2fs/segment.c
@@ -370,7 +370,13 @@ static int __f2fs_commit_atomic_write(struct inode *inode)
 	} else {
 		sbi->committed_atomic_block += fi->atomic_write_cnt;
 		set_inode_flag(inode, FI_ATOMIC_COMMITTED);
+
+		/*
+		 * inode may has no FI_ATOMIC_DIRTIED flag due to no write
+		 * before commit.
+		 */
 		if (is_inode_flag_set(inode, FI_ATOMIC_DIRTIED)) {
+			/* clear atomic dirty status and set vfs dirty status */
 			clear_inode_flag(inode, FI_ATOMIC_DIRTIED);
 			f2fs_mark_inode_dirty_sync(inode, true);
 		}
diff --git a/fs/f2fs/super.c b/fs/f2fs/super.c
index 573cc4725e2e8..1236a90841a69 100644
--- a/fs/f2fs/super.c
+++ b/fs/f2fs/super.c
@@ -1516,7 +1516,9 @@ int f2fs_inode_dirtied(struct inode *inode, bool sync)
 	}
 	spin_unlock(&sbi->inode_lock[DIRTY_META]);
 
-	if (!ret && f2fs_is_atomic_file(inode))
+	/* if atomic write is not committed, set inode w/ atomic dirty */
+	if (!ret && f2fs_is_atomic_file(inode) &&
+			!is_inode_flag_set(inode, FI_ATOMIC_COMMITTED))
 		set_inode_flag(inode, FI_ATOMIC_DIRTIED);
 
 	return ret;
-- 
2.39.5



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
