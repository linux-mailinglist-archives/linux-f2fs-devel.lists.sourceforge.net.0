Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 8643EB18A71
	for <lists+linux-f2fs-devel@lfdr.de>; Sat,  2 Aug 2025 04:38:01 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:MIME-Version:Message-ID:Date:To:Sender:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=+kPbnowqFKOWY6N5auJkbNXht2PvWj1dpARGwUFsrPg=; b=m637+IW1Qv+k1y+Qq+dQvunp9p
	oQn424hKyC/8vIw8sqLRyOsBjTNCA8fcU4h5slYwXjSCASPXLVCpn70vEZHgLnCzqKfKoox0As0Vw
	gs/b3Va+tK7N1o0dkhWCZ3jobkjLQzT3MxzBo1RqMD60DBoQnMEA4jQhcv/peqzzhQZ8=;
Received: from [127.0.0.1] (helo=sfs-ml-3.v29.lw.sourceforge.com)
	by sfs-ml-3.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1ui28A-0000Cb-2B;
	Sat, 02 Aug 2025 02:37:54 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-3.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <chao@kernel.org>) id 1ui288-0000CT-Te
 for linux-f2fs-devel@lists.sourceforge.net;
 Sat, 02 Aug 2025 02:37:52 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:Message-ID:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=osM4hxE7Ep6v26ia6KeM1/OaarCJ5VPNY2ADqDdHkdo=; b=bVBSBVUuLaSXlB6Zvm+5IKFDff
 Lu0OT2WymBe/rXDl+ll3Q4drcTtIV+1Yy0O+Ruf5khpWEKVwTG4SvS6/1uYLSfdPIXYWhNwThPvhj
 ZtXasEZbUhrQ13eAs+hSKRpX2mfA6m4W1MNo+yshU5ODsj428EJAXVkvO7MJdD4xzzm8=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:Cc:To:From
 :Sender:Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=osM4hxE7Ep6v26ia6KeM1/OaarCJ5VPNY2ADqDdHkdo=; b=D
 5Jxamef2fI9syKb9OwoPdIuac9M+6TijrC4oEkJFlWrFuf2zvKvM9MKO8dABtp/1s5U/pal+bC4ov
 ZfGOooWR4zleQWhUEHk4yBu5GkfkKNHfUsaA+Egmwc13Y5Qhqic+yZ5hMqpQzykQDLCCnmeZ0ZQQb
 s7AQ/ZzTqMDkhHkw=;
Received: from tor.source.kernel.org ([172.105.4.254])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1ui288-0004Ke-IR for linux-f2fs-devel@lists.sourceforge.net;
 Sat, 02 Aug 2025 02:37:52 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id D4CEA600AE;
 Sat,  2 Aug 2025 02:37:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E105AC4CEE7;
 Sat,  2 Aug 2025 02:37:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1754102261;
 bh=SnMGNBU0WevBcEDt0U0KrwRwiB+AubWXiRuNhkpiDR0=;
 h=From:To:Cc:Subject:Date:From;
 b=mXmhydbWdO5IiuKtmOjWtXxTEy6KJEAmvlSmKZ+6Pa7u1WtZT7IQ2cKpwK2k21484
 TZcTDbt8MzqhrRdexg9BNy6RinGzGdfcBOykVVLm19dfm1HqIIsOIceFHUHis9KQFu
 2+pO66zmKttEODPoSosqRFD6WLYovB8yoeizU5ABg08/OaJmVVr6KZRca2SnB2tltZ
 TTLTj86P+p7wKc9PhOsNGjaZWaRIQlvQshADiltr40iIuyA4z7+dMpwUGDBLi0Oxl1
 4nCqbgRNPOuHRWzt74vbKHWV1L/un0/bye/8p1kfioNky5+vDil334fPiCM7P3z4rv
 WWxa4id4mh1pg==
To: jaegeuk@kernel.org
Date: Sat,  2 Aug 2025 10:37:33 +0800
Message-ID: <20250802023733.1890349-1-chao@kernel.org>
X-Mailer: git-send-email 2.50.1.565.gc32cd1483b-goog
MIME-Version: 1.0
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-1.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: From: Qi Han <hanqi@vivo.com> f2fs doesn't support uncached
 write yet, for write() w/ IOCB_DONTCACHE flag, let's return -EOPNOTSUPP instead
 of ignoring IOCB_DONTCACHE flag and write w/o uncached IO. Cc: Jens Axboe
 <axboe@kernel.dk> Cc: Qi Han <hanqi@vivo.com> Signed-off-by: Chao Yu
 <chao@kernel.org>
 --- fs/f2fs/file.c | 5 +++++ 1 file changed, 5 insertions(+) 
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
 0.0 RCVD_IN_DNSWL_BLOCKED  RBL: ADMINISTRATOR NOTICE: The query to DNSWL
 was blocked.  See
 http://wiki.apache.org/spamassassin/DnsBlocklists#DnsBlocklists-dnsbl-block
 for more information. [172.105.4.254 listed in list.dnswl.org]
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1ui288-0004Ke-IR
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

From: Qi Han <hanqi@vivo.com>

f2fs doesn't support uncached write yet, for write() w/ IOCB_DONTCACHE
flag, let's return -EOPNOTSUPP instead of ignoring IOCB_DONTCACHE flag
and write w/o uncached IO.

Cc: Jens Axboe <axboe@kernel.dk>
Cc: Qi Han <hanqi@vivo.com>
Signed-off-by: Chao Yu <chao@kernel.org>
---
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
