Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id B6C6BB1AE14
	for <lists+linux-f2fs-devel@lfdr.de>; Tue,  5 Aug 2025 08:18:26 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:MIME-Version:Message-ID:Date:To:Sender:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=tTSSCoHLaAFEnIsgiGM+C7b4164u+eRxqm8w6GFK1J8=; b=IKwXHd2lfNoYIw6jtc6yCdZqic
	FZ24lSpfBNhT8y/3Z9vjwXOkdee8tLFiOZp2wfgwqh30zU96eNkLCFmeFASa2SzRXkNU1HcCBeIpu
	SazFqla61GRfh68POey7GYKYjPnhGbvD56NUOW0aFOGFwu7EVjtKg6Dw9knuFN7UaAgk=;
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1ujB06-0000kR-D8;
	Tue, 05 Aug 2025 06:18:18 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <chao@kernel.org>) id 1ujB04-0000kK-KO
 for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 05 Aug 2025 06:18:16 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:Message-ID:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=J59J8guxVVPodt5W64UarY1vroYIU1cEs3+PXa+qLkU=; b=Nleswe4Su3fRztrK34BKhdjU4H
 hDUBSNa0Gg3+oE2smLNYBjS6539UrmZ02qmJkaRCxxYdfEiM1CgaeX4dsNijC2w9NFdoTKD3ZWW63
 TTGZ997QispuAsQM+/hgqHwt1HBaQ1/9ti2UOBGTqOKmSyBtsmrHz468Wslz0pSsb6Vs=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:Cc:To:From
 :Sender:Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=J59J8guxVVPodt5W64UarY1vroYIU1cEs3+PXa+qLkU=; b=a
 6NEyMhpGDv4Uv0Q08DHOqAdo7jtMXV4JTAdgh2dE2igxI9kb/OqJc5XY++lTx1okdX6fpHDHnxPDK
 JAQhaU2DZDh/EinDsFQk5xuK93Z8tC/eLbqptaNsu6XIt1FZGRDN0qaNwjYdaXRNocaskAShn4Tv2
 nRTCLjXmyr3Bk3f4=;
Received: from tor.source.kernel.org ([172.105.4.254])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1ujB04-0002ve-8u for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 05 Aug 2025 06:18:16 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id A0CB860052;
 Tue,  5 Aug 2025 06:18:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7736AC4CEF4;
 Tue,  5 Aug 2025 06:18:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1754374685;
 bh=DgJ6jHIbxLVmiXFgEe6KR9nH8EMJtdShONp10yEpRuw=;
 h=From:To:Cc:Subject:Date:From;
 b=iugcPsXVN40dyxh6qeY63pueNSJoFp1Su4a2x7lykPOQTZi4OBwcuBDSbV0+Asknt
 8IqffZzhfSURGRH4khM4ql+HmEZcF6d1ZqCWlGs6RitXFfv3quZs1EathBSNBNUjdJ
 6vvIF67bLG6qWDwFZtq61o7VDk6vuoxHeRv8eM0wI8omFXmuUe9nK2jCjx3Fq5tZ0E
 eF3HmIrVWGwbi8kz4hxJyvGSYVkXfp2FlNFxCj/GyW5uT8kc43sSpQa9bIKnemohvF
 43kxj1Q2FDw5uewualYomPHrsx7/EZCHOwK1tQF5PTHGtt8XwJ39OZ7CcFs6Im5E3s
 ESW/yTXLa8rgg==
To: jaegeuk@kernel.org
Date: Tue,  5 Aug 2025 14:17:33 +0800
Message-ID: <20250805061733.3067254-1-chao@kernel.org>
X-Mailer: git-send-email 2.50.1.565.gc32cd1483b-goog
MIME-Version: 1.0
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-1.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  f2fs doesn't support uncached write yet,
 for write() w/ IOCB_DONTCACHE
 flag, let's return -EOPNOTSUPP instead of ignoring IOCB_DONTCACHE flag and
 write w/o uncached IO. Cc: Jens Axboe <axboe@kernel.dk> Cc: Qi Han
 <hanqi@vivo.com>
 Signed-off-by: Chao Yu <chao@kernel.org> --- v2: - fix author info
 fs/f2fs/file.c | 5 +++++ 1 file changed, 5 insertions(+) 
 Content analysis details:   (-0.2 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1ujB04-0002ve-8u
Subject: [f2fs-dev] [PATCH] f2fs: fix to return -EOPNOTSUPP for uncached
 write
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
From: Chao Yu via Linux-f2fs-devel <linux-f2fs-devel@lists.sourceforge.net>
Reply-To: Chao Yu <chao@kernel.org>
Cc: Jens Axboe <axboe@kernel.dk>, Qi Han <hanqi@vivo.com>,
 linux-kernel@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

f2fs doesn't support uncached write yet, for write() w/ IOCB_DONTCACHE
flag, let's return -EOPNOTSUPP instead of ignoring IOCB_DONTCACHE flag
and write w/o uncached IO.

Cc: Jens Axboe <axboe@kernel.dk>
Cc: Qi Han <hanqi@vivo.com>
Signed-off-by: Chao Yu <chao@kernel.org>
---
v2:
- fix author info
 fs/f2fs/file.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/fs/f2fs/file.c b/fs/f2fs/file.c
index 9b8d24097b7a..7f09cad6b6d7 100644
--- a/fs/f2fs/file.c
+++ b/fs/f2fs/file.c
@@ -5185,6 +5185,11 @@ static ssize_t f2fs_file_write_iter(struct kiocb *iocb, struct iov_iter *from)
 		goto out;
 	}
 
+	if (iocb->ki_flags & IOCB_DONTCACHE) {
+		ret = -EOPNOTSUPP;
+		goto out;
+	}
+
 	if (!f2fs_is_compress_backend_ready(inode)) {
 		ret = -EOPNOTSUPP;
 		goto out;
-- 
2.49.0



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
