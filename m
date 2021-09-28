Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 81FC441B2D2
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 28 Sep 2021 17:19:36 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1mVEtK-00073x-Uy; Tue, 28 Sep 2021 15:19:34 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <chao@kernel.org>) id 1mVEtJ-00073Y-AK
 for linux-f2fs-devel@lists.sourceforge.net; Tue, 28 Sep 2021 15:19:33 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=02n7f9iuL2lbjRwGbk1PeKunSACcTSHzDY22tSuclmw=; b=MeFIRG3G/vdcCfjjmPtzWOm1CT
 4r9H1NVKQkUIw5rUJg/Orm8qr2ccTA4/JT1AwVCfL9pzuQiUy/dz2hIlF6L60cvdLXuI1fO9RQWY8
 SuGm85X3Ro2h9QsQWUTrJc2EBQEaUpmDHpDc9rwFK0SdhyA5CNgrBX+7Q78JgzWHoTt0=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:Message-Id:Date:Subject:Cc:To:From
 :Sender:Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=02n7f9iuL2lbjRwGbk1PeKunSACcTSHzDY22tSuclmw=; b=E
 ecb64R9r+DG9G8VnH3D/JHNi9MJN1iWOAOfVpt6ODq4Xo0GwEBkmLOJ0xQm9x0WCAjSzXCKr7zpKb
 kIJ6xd7e74r9fnEEe8F2UdhxitizQX3osUbiLFGYtcxEwGkhdI/f47GtqpHGWUnnFFVOaYq3m7NO4
 w76UgudRJfrH98jI=;
Received: from mail.kernel.org ([198.145.29.99])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.3)
 id 1mVEtI-009fkZ-Pd
 for linux-f2fs-devel@lists.sourceforge.net; Tue, 28 Sep 2021 15:19:33 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id A8CBE61213;
 Tue, 28 Sep 2021 15:19:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1632842366;
 bh=bycBfj7a7y99K5/y/PMobW5rEQpsQjstRkBVVLsg87A=;
 h=From:To:Cc:Subject:Date:From;
 b=Gk6Cm1NdPgAYBtNQQcgvZOeOqFNgX2Rq/ZDqcIBit5BqcgE5nJFu/usr7Cejuz8Yv
 f2wiClv1fwCiKdp1BXpGVk9lXtCftKtafwET6KX/9O30VwRlrduaXn/xWN/VPoq8ie
 ffMFGvWxlRfhlPGZNAFbuEv8htFkKTafxNyPP0Q51j54LPUxbjQabJar3i226mfo5W
 ixoFHf9NsjGfhO6y+Ohg9cfPPCIam86Ep+LXnKopMXH4M1vsLtm5CUl1MzpsadoHJy
 FBpeCkEccqeCTnBb5qasiK1Mm5DP1BPb1yO4bhtP/O5Ueo3bTzcrkic5mhzaMXDNdK
 vQuzrIo0H2+yQ==
From: Chao Yu <chao@kernel.org>
To: jaegeuk@kernel.org
Date: Tue, 28 Sep 2021 23:19:11 +0800
Message-Id: <20210928151911.11189-1-chao@kernel.org>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
X-Spam-Score: -5.9 (-----)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  In f2fs_file_write_iter(), let's use f2fs_overwrite_io() to
 check whethere it is overwrite case, for such case,
 we can skip f2fs_preallocate_blocks()
 in order to avoid f2fs_do_map_lock(), which may be [...] 
 Content analysis details:   (-5.9 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [198.145.29.99 listed in list.dnswl.org]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid -0.7 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1mVEtI-009fkZ-Pd
Subject: [f2fs-dev] [PATCH] f2fs: skip f2fs_preallocate_blocks() for
 overwrite case
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

In f2fs_file_write_iter(), let's use f2fs_overwrite_io() to
check whethere it is overwrite case, for such case, we can skip
f2fs_preallocate_blocks() in order to avoid f2fs_do_map_lock(),
which may be blocked by checkpoint() potentially.

Signed-off-by: Chao Yu <chao@kernel.org>
---
 fs/f2fs/file.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/fs/f2fs/file.c b/fs/f2fs/file.c
index 13deae03df06..51fecb2f4db5 100644
--- a/fs/f2fs/file.c
+++ b/fs/f2fs/file.c
@@ -4321,6 +4321,10 @@ static ssize_t f2fs_file_write_iter(struct kiocb *iocb, struct iov_iter *from)
 		preallocated = true;
 		target_size = iocb->ki_pos + iov_iter_count(from);
 
+		if (f2fs_overwrite_io(inode, iocb->ki_pos,
+						iov_iter_count(from)))
+			goto write;
+
 		err = f2fs_preallocate_blocks(iocb, from);
 		if (err) {
 out_err:
-- 
2.32.0



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
