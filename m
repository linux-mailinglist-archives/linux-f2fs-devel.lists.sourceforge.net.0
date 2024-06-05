Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id D46D08FCAE3
	for <lists+linux-f2fs-devel@lfdr.de>; Wed,  5 Jun 2024 13:49:52 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-3.v29.lw.sourceforge.com)
	by sfs-ml-3.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1sEp9G-00086K-VM;
	Wed, 05 Jun 2024 11:49:46 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-3.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <sashal@kernel.org>) id 1sEp9F-00086A-2c
 for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 05 Jun 2024 11:49:44 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=OMeCHY93rQK2Eb+35tSieGKzGI2V0YPm8zUhNYxsM4Y=; b=DFGXxwuTUQPm7Ynj5Y8KCOeK8V
 Qe70W/4jzD+uK47WezG6amXj8CXsd2CflmUoWHTVlWItojtcY/sIRsQvDhWUiRv2HIX3LffPUodn2
 /E8oIKvO0OSYAYCF/IbvnvjxFGnxu/erEvVbgLSYMuULI3OujwJjlypCTNqlHixx0OUM=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=OMeCHY93rQK2Eb+35tSieGKzGI2V0YPm8zUhNYxsM4Y=; b=DBFHwmhDW0o1oXI4vcyUH/FNeN
 OjO6s8ave6SVxMjSzq4OrPxNrpo6whQO7RCGzDoa2wlhqSpvta6qcUL0dGYlS55Gg/0hKQBklOqeI
 uLlo2wWn1PNmZipG0L279UC2x95Qxw9E38iYLqYHKwVM13QYXvUbx+ldHLb9lxqnAK0o=;
Received: from sin.source.kernel.org ([145.40.73.55])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1sEp9E-00089t-FX for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 05 Jun 2024 11:49:44 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id 0289ECE178B;
 Wed,  5 Jun 2024 11:49:32 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CE39CC32781;
 Wed,  5 Jun 2024 11:49:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1717588171;
 bh=eV6sMHKwD9VA0h9HbtB16fn0ZR00vEFh0Zl0/uBJR/w=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=e9cbWHgpGnMDApaTwYBlpzh6/WyXGAkXpoXH7oDMhQmJJ6r6lSLDzJTmiDdI2UMFb
 /NW81+7BaKCcd8I+LCgHHDO+Dt6HNFSJ5fTpVI2yuobZg9EJ4599zkV41tJ0HkiDgd
 jH3CygmjBKdKJ+2d2CWPM1m6/cumL0b2H9lX5UKSwLPFLA1A6Jsdz8eLRwHTO0byHV
 B5Ws9ivvcVu2a4CKRcwtGpnEaGKQNl4WURUbwQQVfSlkJTyCvSURIVhAN2KD8tOQAu
 K17vFVFsyF+e++tIxJnWfFfIS1fC2zuPAN6pPNq4sBB/Ox/hh3azIfRSi3NlB9HPYS
 Grtuk7VtMVIYA==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Date: Wed,  5 Jun 2024 07:48:32 -0400
Message-ID: <20240605114927.2961639-3-sashal@kernel.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240605114927.2961639-1-sashal@kernel.org>
References: <20240605114927.2961639-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 6.9.3
X-Spam-Score: -2.5 (--)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: From: Yunlei He <heyunlei@oppo.com> [ Upstream commit
 ac5eecf481c29942eb9a862e758c0c8b68090c33
 ] In f2fs_remount, SB_INLINECRYPT flag will be clear and re-set. If create
 new file or open file during this gap, these files will not use inlinecrypt.
 Worse case, it may lead to data corruption if wrap [...] 
 Content analysis details:   (-2.5 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -2.3 RCVD_IN_DNSWL_MED      RBL: Sender listed at https://www.dnswl.org/,
 medium trust [145.40.73.55 listed in list.dnswl.org]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 RCVD_IN_VALIDITY_SAFE_BLOCKED RBL: ADMINISTRATOR NOTICE: The
 query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [145.40.73.55 listed in sa-accredit.habeas.com]
 0.0 RCVD_IN_VALIDITY_RPBL_BLOCKED RBL: ADMINISTRATOR NOTICE: The
 query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [145.40.73.55 listed in bl.score.senderscore.com]
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.0 T_SCC_BODY_TEXT_LINE   No description available.
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1sEp9E-00089t-FX
Subject: [f2fs-dev] [PATCH AUTOSEL 6.9 03/28] f2fs: remove clear
 SB_INLINECRYPT flag in default_options
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
Cc: Sasha Levin <sashal@kernel.org>, Jaegeuk Kim <jaegeuk@kernel.org>,
 linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

From: Yunlei He <heyunlei@oppo.com>

[ Upstream commit ac5eecf481c29942eb9a862e758c0c8b68090c33 ]

In f2fs_remount, SB_INLINECRYPT flag will be clear and re-set.
If create new file or open file during this gap, these files
will not use inlinecrypt. Worse case, it may lead to data
corruption if wrappedkey_v0 is enable.

Thread A:                               Thread B:

-f2fs_remount				-f2fs_file_open or f2fs_new_inode
  -default_options
	<- clear SB_INLINECRYPT flag

                                          -fscrypt_select_encryption_impl

  -parse_options
	<- set SB_INLINECRYPT again

Signed-off-by: Yunlei He <heyunlei@oppo.com>
Reviewed-by: Chao Yu <chao@kernel.org>
Signed-off-by: Jaegeuk Kim <jaegeuk@kernel.org>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 fs/f2fs/super.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/fs/f2fs/super.c b/fs/f2fs/super.c
index a4bc26dfdb1af..e4c795a711f0f 100644
--- a/fs/f2fs/super.c
+++ b/fs/f2fs/super.c
@@ -2132,8 +2132,6 @@ static void default_options(struct f2fs_sb_info *sbi, bool remount)
 	F2FS_OPTION(sbi).memory_mode = MEMORY_MODE_NORMAL;
 	F2FS_OPTION(sbi).errors = MOUNT_ERRORS_CONTINUE;
 
-	sbi->sb->s_flags &= ~SB_INLINECRYPT;
-
 	set_opt(sbi, INLINE_XATTR);
 	set_opt(sbi, INLINE_DATA);
 	set_opt(sbi, INLINE_DENTRY);
-- 
2.43.0



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
