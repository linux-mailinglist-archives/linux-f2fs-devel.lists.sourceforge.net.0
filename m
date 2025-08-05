Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id E58F2B1AE1E
	for <lists+linux-f2fs-devel@lfdr.de>; Tue,  5 Aug 2025 08:19:37 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:MIME-Version:Message-ID:Date:To:Sender:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=tTSSCoHLaAFEnIsgiGM+C7b4164u+eRxqm8w6GFK1J8=; b=detIMmdoG+xibFGH30caQ+s6rQ
	zFZ0nCDAvki2DHCS2sVzlELn1cIZKsUztp5eXWL23UZHrOQWH6aPhf+Lu6xJqcuTDt/2f9wF12cU1
	X3+RL/vuaXe/tC4Ay29jsT5wD/ElCB3aTaOzBlm2UzgBiM05y4ts8uK8m6+thzp/dtp8=;
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1ujB1L-0000n1-3x;
	Tue, 05 Aug 2025 06:19:35 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <chao@kernel.org>) id 1ujB1J-0000ms-MN
 for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 05 Aug 2025 06:19:33 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:Message-ID:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=J59J8guxVVPodt5W64UarY1vroYIU1cEs3+PXa+qLkU=; b=m3O1wMT9fXruXX80mYMb0VfzQQ
 thZ2CFwqFG6LvGHGofndbXZ0+InOI4KU/qBryWVmte47kjPXGwvk30H5oNKQNXf2ojO96HTYdFFLV
 QvysCpJD3Oh5jYmai23o8kn8c/La+1SZeqNmOeCZxYayR97MLvOlEXFz08gm+81bNSyE=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:Cc:To:From
 :Sender:Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=J59J8guxVVPodt5W64UarY1vroYIU1cEs3+PXa+qLkU=; b=Y
 fgD7xWDBecRxluVo06lU8u3EHoUNDE5pwgvjsJwvygoKuISSCHFJRxDoGeoLy7KqsWVXRDWmFOynB
 Mr7XrMxj9EZf2EOrkAw7YGIKRrH/wAUbf5z6sgJN+m/01iufCyEw8wsQiiayx/GwGFkiWZOxElmhI
 GeN37kPW+e1ydTnQ=;
Received: from dfw.source.kernel.org ([139.178.84.217])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1ujB1J-0002xz-CA for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 05 Aug 2025 06:19:33 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 06ABB5C63FE;
 Tue,  5 Aug 2025 06:19:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B9EB0C4CEF4;
 Tue,  5 Aug 2025 06:19:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1754374762;
 bh=DgJ6jHIbxLVmiXFgEe6KR9nH8EMJtdShONp10yEpRuw=;
 h=From:To:Cc:Subject:Date:From;
 b=BoXuP7/XHPnGo8bvR8bgj8MUSC9E/9FMTu198MFG24jHl9lIm/uLA+UpNhinzI8TD
 i8n7rYsycPxIX0+qIXEJVq8RULdbCBvpcP/5lauxCDhKtJYvW+iIYO+X8UDqbU92le
 a4/E50saBbAoJtpky/XRr1S+MLjA0jnAkg+xmlFXQGWnutkWgk84GtA/b1iV0IhLvo
 TWF3YLy137uJaWVvpSeXWXGvXa8hOzf0+L8hdvlNmb7Mbqt6UQRJvOFuPR0INw8V4m
 muDSgIA4h2++f767oY54Ki7VJLOywNprsNdR/Dhf8tebQ+jNBXU29rru6rMzQrAXlU
 w43fINSO6TX0A==
To: jaegeuk@kernel.org
Date: Tue,  5 Aug 2025 14:19:14 +0800
Message-ID: <20250805061914.3067747-1-chao@kernel.org>
X-Mailer: git-send-email 2.50.1.565.gc32cd1483b-goog
MIME-Version: 1.0
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-2.hosts.colo.sdot.me", 
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
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1ujB1J-0002xz-CA
Subject: [f2fs-dev] [PATCH v2] f2fs: fix to return -EOPNOTSUPP for uncached
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
