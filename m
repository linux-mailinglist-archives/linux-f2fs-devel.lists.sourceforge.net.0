Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id AA14D89727D
	for <lists+linux-f2fs-devel@lfdr.de>; Wed,  3 Apr 2024 16:25:06 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1rs1Xw-00051V-BJ;
	Wed, 03 Apr 2024 14:25:00 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <chao@kernel.org>) id 1rs1Xt-00051K-Pn
 for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 03 Apr 2024 14:24:57 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=39YpkMBQjzvgy6s8uu9uqzcUMvVLkasOJ6iIVaO2Mfg=; b=Xr1nLHx1YK+ucwzG4IVmNidfAK
 rBdsnLuc6Aj2u95Dr6Qqdgja0rZHndn/t4F36IveHXHoufsVrrZDnaB9b2t0Qd17DFuDQD3iNc4zW
 xNgT9iQMgi+bXNNz/MizDYg5O33yy4nwntCgO0osI4aJBlFENlScpQlGh8bP2I8X/+FQ=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=39YpkMBQjzvgy6s8uu9uqzcUMvVLkasOJ6iIVaO2Mfg=; b=bIRlmOQtCjvCl4QAgPNqz7s0rl
 iHNDHs4zfAQC4wvg9RTqWcJNYPl0lySNuomGXGAyLPscBrS4boTu1rRFRSdTFHJUzYP6O0OCUC8bH
 dNxD0a1iM2Jil/ou3HXY1IjUDF0bPp4xet7fUlSySoVN7VZjCRNTg+FoomTCuuFzWuWk=;
Received: from sin.source.kernel.org ([145.40.73.55])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1rs1Xs-0004fO-Tl for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 03 Apr 2024 14:24:57 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id 4B373CE2B0A
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Wed,  3 Apr 2024 14:24:48 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 62CD0C43394;
 Wed,  3 Apr 2024 14:24:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1712154269;
 bh=ptc7NY5ggY3TRPp0+wwY3rbiFNHckWsv1H/R/8taUtk=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=QIJTsiIzCdJdwWYGjp/u10rqGF6STRdrYu5daHJrNF0Ilj8MwByFD1robyv8kB4Rw
 ncGg5D8fGbH1Fg6XreO6hduB7R0vlIqXQB+ikUHsLpNNMaw5tdMZ+JBCipa4oOppvp
 PwHRPkt5tYRTLsZRAtDOnGmpC2uhS6scXaofJOeLjo1Wrf/agWc63O+F7ttg7PnNTV
 viU2x4znYXfmNnfUZymJM/Y0JLuzjLayo563dot94WwAMAqlwZTsUMC43TNFi1+tm0
 n8/Y1IX2t3GaJ/7jWKl18Fn8oF/c8/XpmbkUbPALrMr3na+GjIFi+9bE2/5xWzHVVe
 69ayxwHis7jxA==
From: Chao Yu <chao@kernel.org>
To: jaegeuk@kernel.org
Date: Wed,  3 Apr 2024 22:24:20 +0800
Message-Id: <20240403142420.2042498-2-chao@kernel.org>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20240403142420.2042498-1-chao@kernel.org>
References: <20240403142420.2042498-1-chao@kernel.org>
MIME-Version: 1.0
X-Spam-Score: -2.5 (--)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: ioctl(F2FS_IOC_MOVE_RANGE) can truncate or punch hole on
 pinned
 file, fix to disallow it. Fixes: 5fed0be8583f ("f2fs: do not allow partial
 truncation on pinned file") Signed-off-by: Chao Yu <chao@kernel.org> ---
 fs/f2fs/file.c | 3 ++- 1 file changed, 2 insertions(+), 1 deletion(-) 
 Content analysis details:   (-2.5 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -2.3 RCVD_IN_DNSWL_MED      RBL: Sender listed at https://www.dnswl.org/,
 medium trust [145.40.73.55 listed in list.dnswl.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1rs1Xs-0004fO-Tl
Subject: [f2fs-dev] [PATCH 2/2] f2fs: fix to check pinfile flag in
 f2fs_move_file_range()
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
Cc: linux-kernel@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

ioctl(F2FS_IOC_MOVE_RANGE) can truncate or punch hole on pinned file,
fix to disallow it.

Fixes: 5fed0be8583f ("f2fs: do not allow partial truncation on pinned file")
Signed-off-by: Chao Yu <chao@kernel.org>
---
 fs/f2fs/file.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/fs/f2fs/file.c b/fs/f2fs/file.c
index 83a807e25e31..0d1bcdf61a09 100644
--- a/fs/f2fs/file.c
+++ b/fs/f2fs/file.c
@@ -2858,7 +2858,8 @@ static int f2fs_move_file_range(struct file *file_in, loff_t pos_in,
 			goto out;
 	}
 
-	if (f2fs_compressed_file(src) || f2fs_compressed_file(dst)) {
+	if (f2fs_compressed_file(src) || f2fs_compressed_file(dst) ||
+		f2fs_is_pinned_file(src) || f2fs_is_pinned_file(dst)) {
 		ret = -EOPNOTSUPP;
 		goto out_unlock;
 	}
-- 
2.40.1



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
