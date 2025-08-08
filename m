Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id AC895B1EDEB
	for <lists+linux-f2fs-devel@lfdr.de>; Fri,  8 Aug 2025 19:42:07 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:MIME-Version:References:In-Reply-To:
	Message-Id:Date:To:Sender:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=p1YyOMHLQY3tpgiPuncO6yYD2J2str7seTZwW0vtG70=; b=KKmc3/NNVXwxS421yXrKA/OYp5
	itODUWloVRi48nu6xH91d925gmLVTgE52LKOFKK+EWaOSP83vNZ97krGfGPPxRtEAmMUQU10i4Q8d
	lsCQ4y0FjXlTktQBrkGm4JQ6fBuDTnAN1t0ghQHQUJ2FNDf9qATaPIvKPBV3xy06Q/4c=;
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1ukR6L-0002CT-5w;
	Fri, 08 Aug 2025 17:41:57 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <sashal@kernel.org>) id 1ukR6K-0002CI-8R
 for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 08 Aug 2025 17:41:57 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=WK3knqui/qgZwyfpA2aLh547gM+b/5ob4BFoXGrZX8A=; b=UhT2jtdRJKiedwDPkcac1svByI
 MpiyC284032jP0W54ffc62V7AfblqEqKD0S5PQq0TCLl0UBAu72XtplOHE4xQqR2JP74LogOunBIW
 iAx1zukZyw/7hFgE0jI/MCR72NwuQe6G4Zm/6mC/VwoV9BUfpYofbKz31nthrtYKFQQQ=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=WK3knqui/qgZwyfpA2aLh547gM+b/5ob4BFoXGrZX8A=; b=CeyHTnBy34KChLyIZuzS3du1vx
 AYNJRNPwEowh1igy3mOtryPrx/Qf5uUG9siRf30btOToHRUR9i6G77NX9HBJRH8WpvgR+5M3Vjqkc
 /co0ARvC99c9/wTEWuGNkaRT3ncCTOaaD5tAzC2jqKMvi47BrRjymVZBpetKLwjKwMt8=;
Received: from sea.source.kernel.org ([172.234.252.31])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1ukR6K-0004lW-Hx for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 08 Aug 2025 17:41:56 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id 169EE45FC6
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Fri,  8 Aug 2025 17:41:51 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D722DC4CEED;
 Fri,  8 Aug 2025 17:41:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1754674911;
 bh=Szj//6lRoAJz5KpkNcWdWUHudsh4GXZI9PjVTU1aEUU=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=cukuPMnI9/XAuBCgrCpIcK2Annyx0jIxGdiFJTOjlvFuBJBT327YxJ258fhV+NMSL
 0CfDX+TRxWg3SoGg/THFeyDgD+tx8KQKi9yKgKy1PDcGMPPlkOWzoSomWzTBQ6FGmm
 OEcjGbs6zptuZpiwq3GHaNFZePYx/hVFUGz35bwv+Csz2z5MhHG1eKlFBb2xMShbzx
 27MiIBykscQ9BSyvZnJUxDzJItKmhJZSqnif8nSNqMnL3IZ7j3HH9M1mhns0B5clIG
 uWvpW/vpR0HpO966OUxRbNO84UEmNkY5y5p6wa+EWCXKkxeboH1oUyYRyvyTdMAx23
 Q6t8rLpvU9mxw==
To: patches@lists.linux.dev,
	stable@vger.kernel.org
Date: Fri,  8 Aug 2025 13:41:42 -0400
Message-Id: <20250808174146.1272242-2-sashal@kernel.org>
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
 Content preview: From: Jaegeuk Kim <jaegeuk@kernel.org> [ Upstream commit
 e23ab8028de0d92df5921a570f5212c0370db3b5
 ] Let's return errors caught by the generic checks. This fixes generic/494
 where it expects to see EBUSY by setattr_prepare instead of EINVAL by f2fs
 for active swapfile. 
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
X-Headers-End: 1ukR6K-0004lW-Hx
Subject: [f2fs-dev] [PATCH AUTOSEL 6.16-6.6] f2fs: check the generic
 conditions first
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

From: Jaegeuk Kim <jaegeuk@kernel.org>

[ Upstream commit e23ab8028de0d92df5921a570f5212c0370db3b5 ]

Let's return errors caught by the generic checks. This fixes generic/494 where
it expects to see EBUSY by setattr_prepare instead of EINVAL by f2fs for active
swapfile.

Reviewed-by: Chao Yu <chao@kernel.org>
Signed-off-by: Jaegeuk Kim <jaegeuk@kernel.org>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---

LLM Generated explanations, may be completely bogus:

**Backport Status: YES**

This commit should be backported to stable kernel trees for the
following reasons:

## Bug Fix Analysis

1. **Fixes a real bug affecting users**: The commit fixes incorrect
   error code handling for swapfiles. When attempting to modify an
   active swapfile, f2fs was returning `-EINVAL` instead of the correct
   `-EBUSY` error code. This breaks userspace expectations and causes
   test failures in `generic/494`.

2. **Small and contained fix**: The change is minimal - it simply
   reorders the error checking sequence in `f2fs_setattr()` to call
   generic checks (`setattr_prepare`, `fscrypt_prepare_setattr`,
   `fsverity_prepare_setattr`) before f2fs-specific checks. The code
   movement involves only 12 lines being relocated within the same
   function.

## Technical Details

The commit moves three generic preparation calls from lines 1055-1065
(after f2fs-specific checks) to lines 1055-1065 (before f2fs-specific
checks). This ensures that:

- `setattr_prepare()` gets called first, which contains the
  `IS_SWAPFILE()` check that returns `-ETXTBSY` (which gets translated
  to `-EBUSY`)
- The generic VFS layer error codes are returned consistently with other
  filesystems
- F2fs-specific validation (like compression, pinned file checks) only
  happens after generic validation passes

## Risk Assessment

1. **Minimal regression risk**: The change only reorders existing checks
   without adding new logic or modifying the checks themselves. All the
   same validation still occurs, just in a different order.

2. **Follows stable tree rules**: This is a clear bugfix that:
   - Fixes incorrect error reporting to userspace
   - Makes f2fs behavior consistent with VFS expectations
   - Fixes a specific test case (`generic/494`) that validates correct
     swapfile handling
   - Has no feature additions or architectural changes

3. **Limited scope**: The change is confined to a single function in the
   f2fs subsystem and doesn't affect any other kernel components.

4. **Already reviewed**: The commit has been reviewed by a subsystem
   maintainer (Chao Yu) and merged by the f2fs maintainer (Jaegeuk Kim).

The incorrect error code could potentially confuse userspace
applications that rely on specific error codes to determine why an
operation failed. Returning `-EINVAL` (invalid argument) instead of
`-EBUSY` (resource busy) for an active swapfile is semantically
incorrect and breaks POSIX compliance expectations.

 fs/f2fs/file.c | 24 ++++++++++++------------
 1 file changed, 12 insertions(+), 12 deletions(-)

diff --git a/fs/f2fs/file.c b/fs/f2fs/file.c
index 696131e655ed..bb3fd6a8416f 100644
--- a/fs/f2fs/file.c
+++ b/fs/f2fs/file.c
@@ -1047,6 +1047,18 @@ int f2fs_setattr(struct mnt_idmap *idmap, struct dentry *dentry,
 	if (unlikely(f2fs_cp_error(F2FS_I_SB(inode))))
 		return -EIO;
 
+	err = setattr_prepare(idmap, dentry, attr);
+	if (err)
+		return err;
+
+	err = fscrypt_prepare_setattr(dentry, attr);
+	if (err)
+		return err;
+
+	err = fsverity_prepare_setattr(dentry, attr);
+	if (err)
+		return err;
+
 	if (unlikely(IS_IMMUTABLE(inode)))
 		return -EPERM;
 
@@ -1065,18 +1077,6 @@ int f2fs_setattr(struct mnt_idmap *idmap, struct dentry *dentry,
 			return -EINVAL;
 	}
 
-	err = setattr_prepare(idmap, dentry, attr);
-	if (err)
-		return err;
-
-	err = fscrypt_prepare_setattr(dentry, attr);
-	if (err)
-		return err;
-
-	err = fsverity_prepare_setattr(dentry, attr);
-	if (err)
-		return err;
-
 	if (is_quota_modification(idmap, inode, attr)) {
 		err = f2fs_dquot_initialize(inode);
 		if (err)
-- 
2.39.5



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
