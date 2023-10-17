Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id BDDFA7CB90E
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 17 Oct 2023 05:12:33 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-3.v29.lw.sourceforge.com)
	by sfs-ml-3.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1qsaVH-0002HD-Kd;
	Tue, 17 Oct 2023 03:12:18 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-3.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <chao@kernel.org>) id 1qsaVG-0002H7-Ma
 for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 17 Oct 2023 03:12:17 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=EHVaYdPUDo2vzpKuxpRbpzYBWsh4zoGZnTZXqXSDMyk=; b=ixtgyJy2aXhaqmFS6AKuS+9M0s
 fMIsFEopydrhV4fWpZZNHWdGWZnHVEp3DhYALpcxhGNwo5cdNfHuv88TVKBQa6MbVVXa1YUQ+RQ5V
 lzsHNIdL4Uixx2mkyX7Vp4X/zvQ/QP1h+mVw5woA2UBDQQdxncg0W70vEGLvDB+nKwv4=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:Message-Id:Date:Subject:Cc:To:From
 :Sender:Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=EHVaYdPUDo2vzpKuxpRbpzYBWsh4zoGZnTZXqXSDMyk=; b=b
 Ad24FNNyISLhGXW9p+dgxiJ1w3L44IlqZG4V3Y2Vh7Ddpkq1LociF4SgkI+kgjG1tN0TGGZKjtytn
 jn6sOOtgr3uleRkSfi0EwKzvYkOUrfq2zc+GNEtSs6A0EbPUOqTX/bLS1UtYcxO4qD57KY0DyF91i
 kWQ22npiul6dMF4M=;
Received: from dfw.source.kernel.org ([139.178.84.217])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1qsaVE-00HIMj-HW for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 17 Oct 2023 03:12:17 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id E50C5611ED
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Tue, 17 Oct 2023 03:12:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C3AD5C433B6;
 Tue, 17 Oct 2023 03:12:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1697512327;
 bh=sv0R/Q9+YM1uCbiIKSwt+cN6UkQ/XzCyKiBaJyOCj/U=;
 h=From:To:Cc:Subject:Date:From;
 b=tgSjxiQRgBgxdjO2/f75Jx7/zut6vRPlzSPua/kR93zsD5LKqbL7xZp8gAE2Gl6FC
 T2YmUP44G4gOnq1u9ARxDFzUsuBo0kF6PKy8nKCQecsO+wm3iF8RoTAZdrBnP3iTts
 MRXF+gmMWMP1cw+VyvMnSZb/NUs2j8hp18qjCbifF36PWcH3Sx2pFsg154tM0EEucy
 bt2BVXMV4Mt7Fu553+nO9iclSp7DAYgzELjcJUgAy32OJ9dz4YLjevmejSYux7id1u
 5Aar4o0DrN35eGAQ8JDGgkzrMQt2toA+BkD7TCkk15LL9qHd9fnrGYe97hDuiczTvu
 2HITt2jYdDLLQ==
From: Chao Yu <chao@kernel.org>
To: jaegeuk@kernel.org
Date: Tue, 17 Oct 2023 11:11:58 +0800
Message-Id: <20231017031158.2967474-1-chao@kernel.org>
X-Mailer: git-send-email 2.40.1
MIME-Version: 1.0
X-Spam-Score: -5.2 (-----)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: Teach fsck.f2fs to recognize newly introduced error type
 ERROR_INCONSISTENT_NAT.
 Signed-off-by: Chao Yu <chao@kernel.org> --- fsck/mount.c | 1 +
 include/f2fs_fs.h | 1 + 2 files changed, 2 insertions(+) 
 Content analysis details:   (-5.2 points, 6.0 required)
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
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1qsaVE-00HIMj-HW
Subject: [f2fs-dev] [PATCH] fsck.f2fs: recognize ERROR_INCONSISTENT_NAT
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
Cc: linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

Teach fsck.f2fs to recognize newly introduced error type
ERROR_INCONSISTENT_NAT.

Signed-off-by: Chao Yu <chao@kernel.org>
---
 fsck/mount.c      | 1 +
 include/f2fs_fs.h | 1 +
 2 files changed, 2 insertions(+)

diff --git a/fsck/mount.c b/fsck/mount.c
index 9d786ea..a1389ed 100644
--- a/fsck/mount.c
+++ b/fsck/mount.c
@@ -716,6 +716,7 @@ static char *errors_str[] = {
 	[ERROR_CORRUPTED_VERITY_XATTR]		= "corrupted_verity_xattr",
 	[ERROR_CORRUPTED_XATTR]			= "corrupted_xattr",
 	[ERROR_INVALID_NODE_REFERENCE]		= "invalid_node_reference",
+	[ERROR_INCONSISTENT_NAT]		= "inconsistent_nat",
 };
 
 void print_sb_errors(struct f2fs_super_block *sb)
diff --git a/include/f2fs_fs.h b/include/f2fs_fs.h
index 772a6a5..abd5abf 100644
--- a/include/f2fs_fs.h
+++ b/include/f2fs_fs.h
@@ -741,6 +741,7 @@ enum f2fs_error {
 	ERROR_CORRUPTED_VERITY_XATTR,
 	ERROR_CORRUPTED_XATTR,
 	ERROR_INVALID_NODE_REFERENCE,
+	ERROR_INCONSISTENT_NAT,
 	ERROR_MAX,
 };
 
-- 
2.40.1



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
