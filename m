Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 93BDD57DAB2
	for <lists+linux-f2fs-devel@lfdr.de>; Fri, 22 Jul 2022 09:14:22 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.94.2)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1oEmrd-0005wv-2K; Fri, 22 Jul 2022 07:14:21 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <ebiggers@kernel.org>) id 1oEmrb-0005we-9W
 for linux-f2fs-devel@lists.sourceforge.net; Fri, 22 Jul 2022 07:14:19 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=R3yPlL04mTlr+crM3nBVweheRISvQZlJ3AFTrymz+CM=; b=VbkwmX/I49eVpw9ukuSYCdiAwA
 1D7pdfwpXmUxz4/T1GZqRDuUBfahjS1H3vegAxsIqMUW30JyWiBHdjFMk0cyMJdS4WM+wYJsHVLlV
 ecOvnDqOShpQSrnHLiJmDqNdoBCwnFs3PiVrVhrh+mO8dYhlAaCnvDQcjDrqxo9frDmk=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=R3yPlL04mTlr+crM3nBVweheRISvQZlJ3AFTrymz+CM=; b=EvlwWJYGhW7iftQRis6Q9VRAnc
 M09ZKvsKdtHeGwOwbX5q42vtJdoa+NiYAlxnH5MH/f/o11jthTDlFXJTCYd06wukEmX55oLvJeDGz
 GuYhM/q1F/D3rhEA5hD7qW6+vMeqDrprLIDfK6fhcIo6C+kye/4DaWQyfbmLzfTVLfTY=;
Received: from ams.source.kernel.org ([145.40.68.75])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.94.2)
 id 1oEmra-006eDl-Dx
 for linux-f2fs-devel@lists.sourceforge.net; Fri, 22 Jul 2022 07:14:19 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 50B3BB8275C
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Fri, 22 Jul 2022 07:14:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B0077C385A5;
 Fri, 22 Jul 2022 07:14:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1658474046;
 bh=vRMBs3p3k29TcKDOjHrOzYfkIvFsVQJZG7mrxyu++ts=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=eKeG5bGyliUl/1pyKmdtZZa0HOvtmSTtj9U4sC95NA5D8IDsq+Vegw9IPhy3zbjWv
 VqBDKe1x8aTlQjYpZmOMT+hUh8Aesxl0g1m7dUutCmVaHepkeaFHOzBQ+bMhojs9ly
 /WvlzVL8NEAuDYHcRJY4G6MbYT3B+y7a85CKNjHSv7sa9w11u6gXPuSWPqIx6s8FEq
 CBjT4NrDoDakb2YfI9wXiBl4aVMWoXX5NaOKuAMrM65vruCbF1lQRkQWGIdtzy3DOj
 HyUTCFpCWZcPAT8omY/l/15TzbUHaoqDQY9UCrKT6K/a1YkdC2IqrFuYv6I7tmEbOh
 F8uJYZfxDcI0A==
From: Eric Biggers <ebiggers@kernel.org>
To: linux-fsdevel@vger.kernel.org
Date: Fri, 22 Jul 2022 00:12:28 -0700
Message-Id: <20220722071228.146690-10-ebiggers@kernel.org>
X-Mailer: git-send-email 2.37.0
In-Reply-To: <20220722071228.146690-1-ebiggers@kernel.org>
References: <20220722071228.146690-1-ebiggers@kernel.org>
MIME-Version: 1.0
X-Spam-Score: -3.4 (---)
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
 fs/xfs/xfs_iops.c | 9 +++++++++ 1 file changed, 9 insertions(+) 
 Content analysis details:   (-3.4 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [145.40.68.75 listed in list.dnswl.org]
 2.5 SUSPICIOUS_RECIPS      Similar addresses in recipient list
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.7 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1oEmra-006eDl-Dx
Subject: [f2fs-dev] [PATCH v4 9/9] xfs: support STATX_DIOALIGN
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
 fs/xfs/xfs_iops.c | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/fs/xfs/xfs_iops.c b/fs/xfs/xfs_iops.c
index 29f5b8b8aca69a..bac3f56141801e 100644
--- a/fs/xfs/xfs_iops.c
+++ b/fs/xfs/xfs_iops.c
@@ -605,6 +605,15 @@ xfs_vn_getattr(
 		stat->blksize = BLKDEV_IOSIZE;
 		stat->rdev = inode->i_rdev;
 		break;
+	case S_IFREG:
+		if (request_mask & STATX_DIOALIGN) {
+			struct xfs_buftarg	*target = xfs_inode_buftarg(ip);
+
+			stat->result_mask |= STATX_DIOALIGN;
+			stat->dio_mem_align = target->bt_logical_sectorsize;
+			stat->dio_offset_align = target->bt_logical_sectorsize;
+		}
+		fallthrough;
 	default:
 		stat->blksize = xfs_stat_blksize(ip);
 		stat->rdev = 0;
-- 
2.37.0



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
