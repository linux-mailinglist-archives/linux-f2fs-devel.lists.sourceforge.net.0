Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 3241F686BF1
	for <lists+linux-f2fs-devel@lfdr.de>; Wed,  1 Feb 2023 17:41:21 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1pNGAc-0004L5-PG;
	Wed, 01 Feb 2023 16:41:14 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <nathan@kernel.org>) id 1pNGAb-0004Kv-EW
 for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 01 Feb 2023 16:41:12 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Cc:To:Message-Id:Content-Transfer-Encoding:
 Content-Type:MIME-Version:Subject:Date:From:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=XqIDRrIQ/XWxRn7txj83XoytVvol06KD2IM5PyA2ikM=; b=BqO62OYzGZh4e5eo7OQnAqjP4U
 APY5dMJ9wY3aBoQ5aEqBAO9SfAB5rS4mPtMte2fX97VMb349/NhcXwtGNhIBMV0QpnoZusrSbeeWO
 u2IJ3C16QcvBLQ+hqLyK5nt58YdKn2R/KAVWiueohY3ChtyS1RQAzmuM7lzzvAxFQ7eg=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Cc:To:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:
 Subject:Date:From:Sender:Reply-To:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=XqIDRrIQ/XWxRn7txj83XoytVvol06KD2IM5PyA2ikM=; b=L
 LQSeu45+yMyudzuRZ99x5WvvTcO1rX77v+ErXYazTLPi690vwa+vY9ZkvfQ1HkravveqnqPOgXLIM
 KEwSnongkqBVj9YpSurFANHJeog54xDrGHY615qOTyC1f7SOHevJg1u4NeRhv0EA6CTQh0AbsvScz
 ouSYteTRcLcZ53AU=;
Received: from dfw.source.kernel.org ([139.178.84.217])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1pNGAW-007Wvz-Hg for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 01 Feb 2023 16:41:12 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 250246186D;
 Wed,  1 Feb 2023 16:40:55 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 092EBC433EF;
 Wed,  1 Feb 2023 16:40:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1675269654;
 bh=KSq1dYBd01CzJMTzCKqs3/YS7g3At35mPs1z5Nkv6oc=;
 h=From:Date:Subject:To:Cc:From;
 b=pLn5/92olQ9nSSmkCMuwj0xDGN1IQyrCHURuiCr6Yvz7DZZ1xzj0xwncGpVapYgKQ
 x4UvvH4nl69IDx71CiE4rchBSe1rgHO7f9apalpCeBREUYDCz5ElsKhCTxmdqgeWZb
 HW3kqmUR7ema+E5KwMX9p8Qw1Wt9kTg+3tJ54GAdsVBSliJTPlexPoHFX6Pqs9vHNt
 FuWxniMl4FOnxoOb63OEjHbv+Hy4djOvVAgfbC4PE9ZSstEA/uplUO9Uw69qKeOtjv
 eD10TIBYkwn0+/8XsYM8lWlorSD3E6DFhdMAVsb1GF5LWCWnkOCnMzd0JPjaGuvswv
 cEBdt5pe/n7VA==
From: Nathan Chancellor <nathan@kernel.org>
Date: Wed, 01 Feb 2023 09:40:22 -0700
MIME-Version: 1.0
Message-Id: <20230201-f2fs-fix-single-length-bitfields-v1-1-e386f7916b94@kernel.org>
X-B4-Tracking: v=1; b=H4sIAPWV2mMC/x3NywoCMQyF4VcZsjbQqQuLryIueknbQK2SFBkY5
 t3tuPw58J0dlIRJ4b7sIPRl5XefsV4WiNX3QshpNlhjr8aaFbPNipk3VO6lETbqZVQMPDJTS4o
 puxhvjpwzHiYTvBIG8T3WE3p5HSTn8BGazv/78TyOHxPv+SWLAAAA
To: jaegeuk@kernel.org, chao@kernel.org
X-Mailer: b4 0.12.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=2740; i=nathan@kernel.org;
 h=from:subject:message-id; bh=KSq1dYBd01CzJMTzCKqs3/YS7g3At35mPs1z5Nkv6oc=;
 b=owGbwMvMwCEmm602sfCA1DTG02pJDMm3ponK+HZaB8susOx5+HD3Be2z2eVxq2sn7JBWWu25+
 rurt5dkRykLgxgHg6yYIkv1Y9XjhoZzzjLeODUJZg4rE8gQBi5OAZjI9mWMDPfVpHOfPMr9qxNd
 +XXlDeYXhpfDFJcrCvdG5SS3y3AxcjH8Zu25G351up/Ea2X55u0n3/jZu72XDg3IWCFu69pUIRL
 ADgA=
X-Developer-Key: i=nathan@kernel.org; a=openpgp;
 fpr=2437CB76E544CB6AB3D9DFD399739260CB6CB716
X-Spam-Score: -5.9 (-----)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: Clang warns: ../fs/f2fs/data.c:995:17: error: implicit
 truncation
 from 'int' to a one-bit wide bit-field changes value from 1 to -1 [-Werror,
 -Wsingle-bit-bitfield-constant-conversion]
 fio->submitted = 1; ^ ~ ../f [...] 
 Content analysis details:   (-5.9 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [139.178.84.217 listed in list.dnswl.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid -0.7 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1pNGAW-007Wvz-Hg
Subject: [f2fs-dev] [PATCH] f2fs: Fix type of single bit bitfield in
 f2fs_io_info
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
Cc: kernel test robot <lkp@intel.com>, trix@redhat.com, llvm@lists.linux.dev,
 ndesaulniers@google.com, patches@lists.linux.dev, linux-kernel@vger.kernel.org,
 Nathan Chancellor <nathan@kernel.org>, linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

Clang warns:

  ../fs/f2fs/data.c:995:17: error: implicit truncation from 'int' to a one-bit wide bit-field changes value from 1 to -1 [-Werror,-Wsingle-bit-bitfield-constant-conversion]
          fio->submitted = 1;
                         ^ ~
  ../fs/f2fs/data.c:1011:15: error: implicit truncation from 'int' to a one-bit wide bit-field changes value from 1 to -1 [-Werror,-Wsingle-bit-bitfield-constant-conversion]
                          fio->retry = 1;
                                     ^ ~

  ../fs/f2fs/segment.c:3320:16: error: implicit truncation from 'int' to a one-bit wide bit-field changes value from 1 to -1 [-Werror,-Wsingle-bit-bitfield-constant-conversion]
                  fio->in_list = 1;
                               ^ ~

There is not a bug here because the value of these fields is never
explicitly compared against (just whether it is zero or non-zero) but
it is easy to silence the warning by using an unsigned type to allow
an assignment of 0 or 1 without implicit conversion.

Fixes: 998863dadd2c ("f2fs: reduce stack memory cost by using bitfield in struct f2fs_io_info")
Link: https://github.com/ClangBuiltLinux/linux/issues/1796
Reported-by: kernel test robot <lkp@intel.com>
Signed-off-by: Nathan Chancellor <nathan@kernel.org>
---
 fs/f2fs/f2fs.h | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/fs/f2fs/f2fs.h b/fs/f2fs/f2fs.h
index 08dc64c5050e..89f6fdfeed19 100644
--- a/fs/f2fs/f2fs.h
+++ b/fs/f2fs/f2fs.h
@@ -1213,12 +1213,12 @@ struct f2fs_io_info {
 	int compr_blocks;	/* # of compressed block addresses */
 	int need_lock:8;	/* indicate we need to lock cp_rwsem */
 	int version:8;		/* version of the node */
-	int submitted:1;	/* indicate IO submission */
-	int in_list:1;		/* indicate fio is in io_list */
-	int is_por:1;		/* indicate IO is from recovery or not */
-	int retry:1;		/* need to reallocate block address */
-	int encrypted:1;	/* indicate file is encrypted */
-	int post_read:1;	/* require post read */
+	unsigned int submitted:1;	/* indicate IO submission */
+	unsigned int in_list:1;		/* indicate fio is in io_list */
+	unsigned int is_por:1;		/* indicate IO is from recovery or not */
+	unsigned int retry:1;		/* need to reallocate block address */
+	unsigned int encrypted:1;	/* indicate file is encrypted */
+	unsigned int post_read:1;	/* require post read */
 	enum iostat_type io_type;	/* io type */
 	struct writeback_control *io_wbc; /* writeback control */
 	struct bio **bio;		/* bio for ipu */

---
base-commit: de6b3a5e09b29c014bd04044b023896107cfa2ee
change-id: 20230201-f2fs-fix-single-length-bitfields-df8cc78e880a

Best regards,
-- 
Nathan Chancellor <nathan@kernel.org>



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
