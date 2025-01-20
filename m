Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B579A16CB3
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 20 Jan 2025 14:00:12 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1tZrNr-0007o2-Uv;
	Mon, 20 Jan 2025 13:00:04 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <nathan@kernel.org>) id 1tZrNq-0007nt-6z
 for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 20 Jan 2025 13:00:02 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Cc:To:Message-Id:Content-Transfer-Encoding:
 Content-Type:MIME-Version:Subject:Date:From:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=Ih6z30uhktmcLSS6c/j2iQE6rXA+c9H5T/UNowZXOK4=; b=an/8c2AwYeJyApG34ZqyUtA8wR
 CsXhn3POeNi2nO0tuAp+a5pXjLcG8cs+ghR6aADVEK/HW2XUvC9YFjUwSfnO+DXv4iNIhtHBtutnq
 0pyQi8kiN1LaXGOUOSPsJg0NaOONL2ZT5zDczMp2P0japsDVX7fub+nudbQEhvFWn19o=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Cc:To:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:
 Subject:Date:From:Sender:Reply-To:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=Ih6z30uhktmcLSS6c/j2iQE6rXA+c9H5T/UNowZXOK4=; b=e
 W6DE/CfCDbo6nydLV+yAlJY115dFE0JkTeRHVRGn9gIBuVrFxgtdp+RHxmYt2SZwMznJODLM5999B
 Wjv3u1vw+2zun2yD0LoHUWAYvU8xo098UVXyo3kF6zC/Y6pxSh+aElpCqFfn+gNoCRMrvsBvmmv2U
 uDxP3YGDUdylTk/Q=;
Received: from nyc.source.kernel.org ([147.75.193.91])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1tZrNq-0004Cn-40 for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 20 Jan 2025 13:00:02 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id BF73FA40EDD
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Mon, 20 Jan 2025 12:58:03 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 150F6C4CEE1;
 Mon, 20 Jan 2025 12:59:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1737377991;
 bh=O0+0Zri+s/2DueyKTFACsawCn1enHn6tRY8p+PfVw18=;
 h=From:Date:Subject:To:Cc:From;
 b=G6JZdA291903VcvjYxk0sNZ0iYLnsIWGdu+b9Xyy6CpgneOcN9ZUy+gURpchIJa7g
 /l9QA9dcPz9VPx63lXoyyQouJ3yh89AeqKubCvzLHylK6WZdtHMsk0+blqnWoDoRYf
 0fKZqJStDLQXRpL3xCzHFxRego1GB2jw+T+LQeBwnNKDZCENfgrzDQ+eoFzl8QX9gn
 scLQ8ZBRBOSma0bf/JJi/wW10To4hYLQddUWXCLWDszpTNejaXuYLwU1rbTl8RyyJ/
 1OlvPSiLJMP89VHioMuHc1pkO1ijNc7gzxd77mqc85/rSyD1Ma7yzjqkBX29SLMy/h
 VxdHXGgievW2Q==
Date: Mon, 20 Jan 2025 05:59:44 -0700
MIME-Version: 1.0
Message-Id: <20250120-f2fs-fix-wformat-min_inline_xattr_size-v1-1-508cac1474fe@kernel.org>
X-B4-Tracking: v=1; b=H4sIAL9IjmcC/x2N0QrCMAwAf2Xk2UBbV0R/RaSULdWAyyQpOhz79
 5U93sPdrWCkTAa3bgWlLxvP0sCfOhheWZ6EPDaG4EJ0PjgsoRgWXvBXZp1yxYklsbxZKC25Vk3
 Gf8Jr9MN4drHvLwQt9lFq0jG6P7ZtB+TWzhV4AAAA
X-Change-ID: 20250120-f2fs-fix-wformat-min_inline_xattr_size-951cd305447e
To: Jaegeuk Kim <jaegeuk@kernel.org>, Chao Yu <chao@kernel.org>
X-Mailer: b4 0.15-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=2517; i=nathan@kernel.org;
 h=from:subject:message-id; bh=O0+0Zri+s/2DueyKTFACsawCn1enHn6tRY8p+PfVw18=;
 b=owGbwMvMwCUmm602sfCA1DTG02pJDOl9HkdfNdneFDTXPSN8t1CKr/Pr71T9jSdW36vMTd8RO
 f1RNP/8jlIWBjEuBlkxRZbqx6rHDQ3nnGW8cWoSzBxWJpAhDFycAjCRF+oM/5QXFe00czgZu/X7
 CYeqVW6XinlWTpIML14zWdrbMt8rZAXDX9l/0oLreJc818lh8I24t+PQSvGChCO5q6c0eeg/WcE
 TzgkA
X-Developer-Key: i=nathan@kernel.org; a=openpgp;
 fpr=2437CB76E544CB6AB3D9DFD399739260CB6CB716
X-Spam-Score: -5.5 (-----)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  When building for 32-bit platforms, for which 'size_t' is
 'unsigned int',
 there is a warning due to an incorrect format specifier:
 fs/f2fs/inode.c:320:6:
 error: format specifies type 'unsigned long' but the argument has type
 'unsigned int' [-Werror, -Wformat] 318 | f2fs_warn(sbi,
 "%s: inode (ino=%lx) has corrupted i_inline_xattr_ [...] 
 Content analysis details:   (-5.5 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -2.3 RCVD_IN_DNSWL_MED      RBL: Sender listed at https://www.dnswl.org/,
 medium trust [147.75.193.91 listed in list.dnswl.org]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 RCVD_IN_VALIDITY_CERTIFIED_BLOCKED RBL: ADMINISTRATOR NOTICE:
 The query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [147.75.193.91 listed in sa-trusted.bondedsender.org]
 0.0 RCVD_IN_VALIDITY_RPBL_BLOCKED RBL: ADMINISTRATOR NOTICE: The
 query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [147.75.193.91 listed in bl.score.senderscore.com]
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -3.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1tZrNq-0004Cn-40
Subject: [f2fs-dev] [PATCH] f2fs: Fix format specifier in
 sanity_check_inode()
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
From: Nathan Chancellor via Linux-f2fs-devel
 <linux-f2fs-devel@lists.sourceforge.net>
Reply-To: Nathan Chancellor <nathan@kernel.org>
Cc: Nathan Chancellor <nathan@kernel.org>, patches@lists.linux.dev,
 linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

When building for 32-bit platforms, for which 'size_t' is 'unsigned int',
there is a warning due to an incorrect format specifier:

  fs/f2fs/inode.c:320:6: error: format specifies type 'unsigned long' but the argument has type 'unsigned int' [-Werror,-Wformat]
    318 |                 f2fs_warn(sbi, "%s: inode (ino=%lx) has corrupted i_inline_xattr_size: %d, min: %lu, max: %lu",
        |                                                                                                 ~~~
        |                                                                                                 %u
    319 |                           __func__, inode->i_ino, fi->i_inline_xattr_size,
    320 |                           MIN_INLINE_XATTR_SIZE, MAX_INLINE_XATTR_SIZE);
        |                           ^~~~~~~~~~~~~~~~~~~~~
  fs/f2fs/f2fs.h:1855:46: note: expanded from macro 'f2fs_warn'
   1855 |         f2fs_printk(sbi, false, KERN_WARNING fmt, ##__VA_ARGS__)
        |                                              ~~~    ^~~~~~~~~~~
  fs/f2fs/xattr.h:86:31: note: expanded from macro 'MIN_INLINE_XATTR_SIZE'
     86 | #define MIN_INLINE_XATTR_SIZE (sizeof(struct f2fs_xattr_header) / sizeof(__le32))
        |                               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

Use the format specifier for 'size_t', '%zu', to resolve the warning.

Fixes: 5c1768b67250 ("f2fs: fix to do sanity check correctly on i_inline_xattr_size")
Signed-off-by: Nathan Chancellor <nathan@kernel.org>
---
 fs/f2fs/inode.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/fs/f2fs/inode.c b/fs/f2fs/inode.c
index 7de33da8b3ea..3dd25f64d6f1 100644
--- a/fs/f2fs/inode.c
+++ b/fs/f2fs/inode.c
@@ -315,7 +315,7 @@ static bool sanity_check_inode(struct inode *inode, struct page *node_page)
 		f2fs_has_inline_xattr(inode) &&
 		(fi->i_inline_xattr_size < MIN_INLINE_XATTR_SIZE ||
 		fi->i_inline_xattr_size > MAX_INLINE_XATTR_SIZE)) {
-		f2fs_warn(sbi, "%s: inode (ino=%lx) has corrupted i_inline_xattr_size: %d, min: %lu, max: %lu",
+		f2fs_warn(sbi, "%s: inode (ino=%lx) has corrupted i_inline_xattr_size: %d, min: %zu, max: %lu",
 			  __func__, inode->i_ino, fi->i_inline_xattr_size,
 			  MIN_INLINE_XATTR_SIZE, MAX_INLINE_XATTR_SIZE);
 		return false;

---
base-commit: 5c1768b6725049e1fcfc841924d65f2872413000
change-id: 20250120-f2fs-fix-wformat-min_inline_xattr_size-951cd305447e

Best regards,
-- 
Nathan Chancellor <nathan@kernel.org>



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
