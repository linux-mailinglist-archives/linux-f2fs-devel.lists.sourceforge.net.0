Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id BEB3F5A354D
	for <lists+linux-f2fs-devel@lfdr.de>; Sat, 27 Aug 2022 09:01:55 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1oRppK-0000H0-Hg;
	Sat, 27 Aug 2022 07:01:54 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <ebiggers@kernel.org>) id 1oRppI-0000Gj-HD
 for linux-f2fs-devel@lists.sourceforge.net;
 Sat, 27 Aug 2022 07:01:52 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=tTpnCfvInqs7O6qNarChX9fIUovVF3mKMXEyPgvQQws=; b=DBAZYnRdi1EnXXXqAzxu+9Z8WZ
 Nod8nxX8rtKhe92a/WzEk4ZJaofJBEX20rq4t2HSZsFjh2IvhW6b/tVKenBaL7+Rj8G4Tk+UcuGIh
 Fmo0hJo4W9MlL3S8oGVZDdi/c1/ClZZAOW9luVi4o24BpnfpIymuO0fTQfYNZlN7Yu4c=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=tTpnCfvInqs7O6qNarChX9fIUovVF3mKMXEyPgvQQws=; b=GzCDjLt2uc28+wZnto+r1Yn/U7
 ZRadbB2e6xrvv09fEBM7B5NNlVP/4vTsgc2CqRy8j9DEMEq3EVFmGX6NoALKvRWNJ6ylm7X+knIAf
 i3bDbNeRePx7OBVIPWA50+tFj6F0FBJf4ZV/Wrn4qYvC0jYIvbvrdLNMzAsy7LqsJ1z0=;
Received: from dfw.source.kernel.org ([139.178.84.217])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1oRppI-0006pC-0W for linux-f2fs-devel@lists.sourceforge.net;
 Sat, 27 Aug 2022 07:01:52 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 6AF8360FF6
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Sat, 27 Aug 2022 07:01:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 88DB1C43470;
 Sat, 27 Aug 2022 07:01:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1661583693;
 bh=0xuShhm2dGVlVdS35K/psQMXih/7EA3C0nxlthmzrd0=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=pedZYWIoNW+9lCIp8+WakPS5vapg3nIeS1G4/mysv6CfIZndcJTyFf+55ZsuA+aoX
 Xdxp1ueHBL0vwGMKdhP0aU5LtCqsXe8WsW8LhTz8F7hpOiJnrPVkiKkzcu3lp+y0E7
 llWBt5CZ4CIdjIhOsdRdJYxaxOIwvwI9gQB12Oj/V61yCCzR2tpROudUnv4gbqNlLl
 8UlxBfBIyMt3TQf7vsDjgDAw3nyZWmoGWLAu9ea3XxRiDAsbBFueT1r59i4i2W4diN
 G5c+MDjU1hRMW+b3c3tnXbKIMnNrsaWpg/h9XW7XmikreLpz2cX9EqaF6JT/a64zmD
 s/bGohFpVzqcg==
From: Eric Biggers <ebiggers@kernel.org>
To: linux-fsdevel@vger.kernel.org
Date: Fri, 26 Aug 2022 23:58:51 -0700
Message-Id: <20220827065851.135710-9-ebiggers@kernel.org>
X-Mailer: git-send-email 2.37.2
In-Reply-To: <20220827065851.135710-1-ebiggers@kernel.org>
References: <20220827065851.135710-1-ebiggers@kernel.org>
MIME-Version: 1.0
X-Spam-Score: -2.7 (--)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: From: Eric Biggers <ebiggers@google.com> Add support for
 STATX_DIOALIGN
 to xfs, so that direct I/O alignment restrictions are exposed to userspace
 in a generic way. Signed-off-by: Eric Biggers <ebiggers@google.com> ---
 fs/xfs/xfs_iops.c
 | 10 ++++++++++ 1 file changed, 10 insertions(+) 
 Content analysis details:   (-2.7 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [139.178.84.217 listed in list.dnswl.org]
 2.5 SUSPICIOUS_RECIPS      Similar addresses in recipient list
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.0 T_SCC_BODY_TEXT_LINE   No description available.
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1oRppI-0006pC-0W
Subject: [f2fs-dev] [PATCH v5 8/8] xfs: support STATX_DIOALIGN
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
Cc: linux-block@vger.kernel.org, linux-api@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net,
 linux-xfs@vger.kernel.org, linux-fscrypt@vger.kernel.org,
 Keith Busch <kbusch@kernel.org>, linux-ext4@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

From: Eric Biggers <ebiggers@google.com>

Add support for STATX_DIOALIGN to xfs, so that direct I/O alignment
restrictions are exposed to userspace in a generic way.

Signed-off-by: Eric Biggers <ebiggers@google.com>
---
 fs/xfs/xfs_iops.c | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/fs/xfs/xfs_iops.c b/fs/xfs/xfs_iops.c
index 45518b8c613c9a..f51c60d7e2054a 100644
--- a/fs/xfs/xfs_iops.c
+++ b/fs/xfs/xfs_iops.c
@@ -604,6 +604,16 @@ xfs_vn_getattr(
 		stat->blksize = BLKDEV_IOSIZE;
 		stat->rdev = inode->i_rdev;
 		break;
+	case S_IFREG:
+		if (request_mask & STATX_DIOALIGN) {
+			struct xfs_buftarg	*target = xfs_inode_buftarg(ip);
+			struct block_device	*bdev = target->bt_bdev;
+
+			stat->result_mask |= STATX_DIOALIGN;
+			stat->dio_mem_align = bdev_dma_alignment(bdev) + 1;
+			stat->dio_offset_align = bdev_logical_block_size(bdev);
+		}
+		fallthrough;
 	default:
 		stat->blksize = xfs_stat_blksize(ip);
 		stat->rdev = 0;
-- 
2.37.2



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
