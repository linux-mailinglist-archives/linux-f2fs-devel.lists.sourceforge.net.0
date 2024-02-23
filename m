Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B45F861E34
	for <lists+linux-f2fs-devel@lfdr.de>; Fri, 23 Feb 2024 21:55:54 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1rdcaD-0005U2-6u;
	Fri, 23 Feb 2024 20:55:49 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <jaegeuk@kernel.org>) id 1rdcaB-0005Tv-IY
 for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 23 Feb 2024 20:55:47 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=KEK4PKZpiKuqikEuPIITFI5x9Ipginm3gnaq5OfdLpo=; b=X6rhagSA1j24FgZDIl0SeJa3Id
 Z4ibOA5x/sD7WuJGxRAORVi9QvkTEbRWJs8Dy919IH8DYdb+MkI3lJdMLgVD2CO7uTgAMnY7ODxpD
 UKJIaoY/og06/gMQpVYZXsj3gvpS16wFH/AbZdLqlIvrybyL0qrQZSe5sOZr2nz88m94=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=KEK4PKZpiKuqikEuPIITFI5x9Ipginm3gnaq5OfdLpo=; b=TEEa4rhy7uHCeY+4Ss70jSHEyC
 upbMd50VVwxvz9Ss2YMp9lbELOqWJVanyRJRfM9Z2P4at84/JXG81ejfpszN4Q64QtG751nkP70cQ
 QMOutHR2/ejzs8PukZ7pnt1dsyh/oPQxOO0NNdZYin0WJkrroVZudYetHgCHJe6dMYqc=;
Received: from dfw.source.kernel.org ([139.178.84.217])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1rdca9-0002pL-TH for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 23 Feb 2024 20:55:47 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 757FF617C7
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Fri, 23 Feb 2024 20:55:40 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 351D1C43390;
 Fri, 23 Feb 2024 20:55:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1708721740;
 bh=Dks7ZYdpho4cTIrGeKroPJwikwZpUsV1Ym/LDVuEhMY=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=hmh02COfYfzXOAY/wQfnzDRk4Ol3gGYIn1gDcG02Bf2LrYPE/K1cx7LX/SVL2WF9Y
 WqtEQE8K4EUTV2MyulSisJi14ElRtimAP1qCg6blP4+VPLcEwhbntU9XTDIWE/O1uo
 5lUk4hBsmPYcD6+EtNZWUM12c0f53Af/Wqjv6SyFL+PV0rqTv30oxOySWjpKKJJFlb
 rKjLFIb9CQXbR8X0t/AlGQCS5xV28QufjgyMHagNp6LWXie1aXQR5TuaDqINBkqCrR
 ToQ3A0XaoLjbIBW1jxCWMyUBzQW/LHF72Vvv1eMGAY5df4w/yuz5kj/kgyGhoyltk3
 j410fPAfilfUA==
From: Jaegeuk Kim <jaegeuk@kernel.org>
To: linux-kernel@vger.kernel.org,
	linux-f2fs-devel@lists.sourceforge.net
Date: Fri, 23 Feb 2024 12:55:35 -0800
Message-ID: <20240223205535.307307-5-jaegeuk@kernel.org>
X-Mailer: git-send-email 2.44.0.rc0.258.g7320e95886-goog
In-Reply-To: <20240223205535.307307-1-jaegeuk@kernel.org>
References: <20240223205535.307307-1-jaegeuk@kernel.org>
MIME-Version: 1.0
X-Spam-Score: -5.3 (-----)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  Don't block mounting the partition,
 if cap is 100%. Signed-off-by:
 Jaegeuk Kim <jaegeuk@kernel.org> --- fs/f2fs/segment.c | 3 +++ 1 file changed, 
 3 insertions(+) diff --git a/fs/f2fs/segment.c b/fs/f2fs/segment.c index
 6d586ae8b55f..f11361152d2a 100644 --- a/fs/f2fs/segment.c +++
 b/fs/f2fs/segment.c
 @@ -904,6 +904,9 @@ int f2fs_disable_cp_again(struct f2fs_sb_ [...] 
 Content analysis details:   (-5.3 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [139.178.84.217 listed in list.dnswl.org]
 -0.0 T_SCC_BODY_TEXT_LINE   No description available.
 -0.1 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1rdca9-0002pL-TH
Subject: [f2fs-dev] [PATCH 5/5] f2fs: allow to mount if cap is 100
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
Cc: Jaegeuk Kim <jaegeuk@kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

Don't block mounting the partition, if cap is 100%.

Signed-off-by: Jaegeuk Kim <jaegeuk@kernel.org>
---
 fs/f2fs/segment.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/fs/f2fs/segment.c b/fs/f2fs/segment.c
index 6d586ae8b55f..f11361152d2a 100644
--- a/fs/f2fs/segment.c
+++ b/fs/f2fs/segment.c
@@ -904,6 +904,9 @@ int f2fs_disable_cp_again(struct f2fs_sb_info *sbi, block_t unusable)
 {
 	int ovp_hole_segs =
 		(overprovision_segments(sbi) - reserved_segments(sbi));
+
+	if (F2FS_OPTION(sbi).unusable_cap_perc == 100)
+		return 0;
 	if (unusable > F2FS_OPTION(sbi).unusable_cap)
 		return -EAGAIN;
 	if (is_sbi_flag_set(sbi, SBI_CP_DISABLED_QUICK) &&
-- 
2.44.0.rc0.258.g7320e95886-goog



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
