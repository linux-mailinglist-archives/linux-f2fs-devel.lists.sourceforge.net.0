Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id DE893CF4693
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 05 Jan 2026 16:31:46 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Subject:MIME-Version:References:In-Reply-To:Message-Id:Date:To:From:Sender:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=kEPar+IunaxmUmHJfr6FcxNL+/1EnbOpLWCKUmLf1eE=; b=m0QTboVyXBkhGfeqdoCh+dX1fD
	IxNYerYn4zC36+pIX5JpuMdsrxbQs74zTm4wOKK1JR9cEWhKzbhrUU84CCntrQ2Bp87q1r62bA/3O
	i66R7Uq+tLYNrm90A8tMsO1YjI3I+PlhX0YUrYxLdu3f5njKlc1PCDsYqJk1voVXLzcw=;
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1vcmYY-0002FE-C5;
	Mon, 05 Jan 2026 15:31:43 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <nzzhao@126.com>) id 1vcmYX-0002F1-0N
 for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 05 Jan 2026 15:31:42 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=bFFmAVAmIX+RPOqrfHAqM7ezbKNEISuZL8Xxh41Ccqw=; b=NpFy6Be4+1UxD6jeBl6EUZvIZ6
 MyEVkVOMG2MI6+50FNf4KuMrkcZpcl5uTY2bYCtGWE/rI3jY62O21hPa0nroM0XmeZIBunzK0aQeD
 l/uENndkUo+SYk2fq5xTGPu9XqHsHhDZNMb1NAl25YKplSzxut7sEfAbLbWNZXGrfyAY=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=bFFmAVAmIX+RPOqrfHAqM7ezbKNEISuZL8Xxh41Ccqw=; b=a2Q4Wqj4UH8aLXpJSPKd9V66EB
 za9QAYMC9baSbo4x+Av3S9ETkYv0qUXliYc6CO+zwijpazIOxMFwChSb/X4s9Eb8Ixuc1hup5HjMm
 RzTgAS9soiYJEx8ckolI9h+4Yf8Pr4sXdiN20BMFhqSz6YOi6R2KtTmfuMXJxMvcty0k=;
Received: from m16.mail.126.com ([220.197.31.8])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1vcmYW-0006EU-W3 for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 05 Jan 2026 15:31:41 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=126.com;
 s=s110527; h=From:To:Subject:Date:Message-Id:MIME-Version; bh=bF
 FmAVAmIX+RPOqrfHAqM7ezbKNEISuZL8Xxh41Ccqw=; b=btf4AX9fjc1P66WLjq
 otpUXAaoMUL3RMDHCCxt6p4B7BtzM8F+ByqjyurnLlB6j06LlGnVup6NpiUIw1rO
 d5ySJplZCIFiqR/MOmNVH2ComQ0NbXBm24z7dCCEF5fnU9gVAsvnCuN31+6NFU8i
 j0QriKjA38gITw1/SoJwye1H0=
Received: from YLLaptop.. (unknown [])
 by gzga-smtp-mtada-g0-1 (Coremail) with SMTP id _____wD3t6092Vtp4nHABA--.665S6;
 Mon, 05 Jan 2026 23:31:12 +0800 (CST)
From: Nanzhe Zhao <nzzhao@126.com>
To: Kim Jaegeuk <jaegeuk@kernel.org>
Date: Mon,  5 Jan 2026 23:31:00 +0800
Message-Id: <20260105153101.152892-5-nzzhao@126.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260105153101.152892-1-nzzhao@126.com>
References: <20260105153101.152892-1-nzzhao@126.com>
MIME-Version: 1.0
X-CM-TRANSID: _____wD3t6092Vtp4nHABA--.665S6
X-Coremail-Antispam: 1Uf129KBjvJXoW7Aw4xurWrCw4DKryrXryUAwb_yoW8Cry8pr
 ykKF95KFZ8JFW8ur48t3Z0vw1Sk348Wa1UGFWfCw1fAasxXas5KFyvq3WY9F1UtFn5J3WI
 qF4FvryUWFsrtF7anT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
 9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x0zRkwIgUUUUU=
X-Originating-IP: [2409:8a20:4df7:2871:d124:26e2:5013:1aa3]
X-CM-SenderInfo: xq22xtbr6rjloofrz/xtbBsAG3h2lb2UFHhQAA3p
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-1.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: f2fs_read_data_large_folio() can build a single read BIO
 across
 multiple folios during readahead. If a folio ends up having none of its
 subpages
 added to the BIO (e.g. all subpages are zeroed / treate [...] 
 Content analysis details:   (-0.2 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 0.0 FREEMAIL_FROM Sender email is commonly abused enduser mail provider
 [nzzhao(at)126.com]
 0.0 RCVD_IN_MSPIKE_H4      RBL: Very Good reputation (+4)
 [220.197.31.8 listed in wl.mailspike.net]
 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
 0.0 UNPARSEABLE_RELAY Informational: message has unparseable relay lines
X-Headers-End: 1vcmYW-0006EU-W3
Subject: [f2fs-dev] [PATCH v1 4/5] f2fs: add 'folio_in_bio' to handle
 readahead folios with no BIO submission
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
Cc: Nanzhe Zhao <nzzhao@126.com>, linux-kernel@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

f2fs_read_data_large_folio() can build a single read BIO across multiple
folios during readahead. If a folio ends up having none of its subpages
added to the BIO (e.g. all subpages are zeroed / treated as holes), it
will never be seen by f2fs_finish_read_bio(), so folio_end_read() is
never called. This leaves the folio locked and not marked uptodate.

Track whether the current folio has been added to a BIO via a local
'folio_in_bio' bool flag, and when iterating readahead folios, explicitly
mark the folio uptodate (on success) and unlock it when nothing was added.

Signed-off-by: Nanzhe Zhao <nzzhao@126.com>
---
 fs/f2fs/data.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/fs/f2fs/data.c b/fs/f2fs/data.c
index 66ab7a43a56f..ac569a396914 100644
--- a/fs/f2fs/data.c
+++ b/fs/f2fs/data.c
@@ -2430,6 +2430,7 @@ static int f2fs_read_data_large_folio(struct inode *inode,
 	unsigned nrpages;
 	struct f2fs_folio_state *ffs;
 	int ret = 0;
+	bool folio_in_bio = false;

 	if (!IS_IMMUTABLE(inode))
 		return -EOPNOTSUPP;
@@ -2445,6 +2446,7 @@ static int f2fs_read_data_large_folio(struct inode *inode,
 	if (!folio)
 		goto out;

+	folio_in_bio = false
 	index = folio->index;
 	offset = 0;
 	ffs = NULL;
@@ -2530,6 +2532,7 @@ static int f2fs_read_data_large_folio(struct inode *inode,
 					offset << PAGE_SHIFT))
 			goto submit_and_realloc;

+		folio_in_bio = true;
 		inc_page_count(F2FS_I_SB(inode), F2FS_RD_DATA);
 		f2fs_update_iostat(F2FS_I_SB(inode), NULL, FS_DATA_READ_IO,
 				F2FS_BLKSIZE);
@@ -2539,6 +2542,11 @@ static int f2fs_read_data_large_folio(struct inode *inode,
 	}
 	trace_f2fs_read_folio(folio, DATA);
 	if (rac) {
+		if (!folio_in_bio) {
+			if (!ret)
+				folio_mark_uptodate(folio);
+			folio_unlock(folio);
+	}
 		folio = readahead_folio(rac);
 		goto next_folio;
 	}
--
2.34.1



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
