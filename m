Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 605D3D0E8C2
	for <lists+linux-f2fs-devel@lfdr.de>; Sun, 11 Jan 2026 11:12:54 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Subject:MIME-Version:References:In-Reply-To:Message-Id:Date:To:From:Sender:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=MNyOpKZG1XY8UsEqrAhxKz42MoVuojqW9G8Dz6afzAw=; b=PhyphyKdbJrDTLd7hmJY8K09Af
	a7xUZTSWSpVVnudExWFJIPY+dlwen7JTGw9LPT/tP6SQEKubK/x1ArYS0+zEXRozG9dIDmGaGld5B
	yekgtrBuSH3JKIpkbRUidHyE7D6MGtsaMeFjhqbUHO9nw0olE8i8HnS0AiDrruqEvNmE=;
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1vesRD-0007DF-M4;
	Sun, 11 Jan 2026 10:12:48 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <nzzhao@126.com>) id 1vesRB-0007Cv-IF
 for linux-f2fs-devel@lists.sourceforge.net;
 Sun, 11 Jan 2026 10:12:46 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=IM7pmdN0D6eT9k9LQNRMMJ4aBDmgeZu02mUdCD87x9g=; b=hin2rGlrt2xu2uIW23leRH3mOg
 w1yKDWMtSiZuqzH7FqJlvM0dc9D+SLKxjeH+uFgM9l7w5NcJUg230dOzaY7nQLTqAQbOL52o+2yBJ
 sveGNZFrpqJRfLATna97gA06Zv6cpTXK3wHxWr2qXtalpNynhfB9jr0AzlAmdzcgH8Ow=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=IM7pmdN0D6eT9k9LQNRMMJ4aBDmgeZu02mUdCD87x9g=; b=ScqrmqplyxjTqdK3qX9VOVQJgI
 vSL5+btZp4hZCeNBHFZPnKkU54K6kS7/agS1Y6uQZCbnfAPqeciDc/uwqtkK+HlVNXboeQUFcRynG
 VnIhRyTY/nVsbOBptxjHpa8cdgYnEk4VByC+a27a8VhkgmkLqXsuw8ltzk4/wBiqH0kk=;
Received: from m16.mail.126.com ([117.135.210.6])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1vesRB-0004ud-Hs for linux-f2fs-devel@lists.sourceforge.net;
 Sun, 11 Jan 2026 10:12:46 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=126.com;
 s=s110527; h=From:To:Subject:Date:Message-Id:MIME-Version; bh=IM
 7pmdN0D6eT9k9LQNRMMJ4aBDmgeZu02mUdCD87x9g=; b=iLxSAjyM8Q1N/I2dth
 xGTuq1imvTF/WMlRTgF+s71hZMh7wzshiv0meNraTJ8zQ8p3agCwYriRJtM1ClUA
 VFcdW/jDHQDNvmGUfogGeoHnP0/DV5BUXgUFADyvnEhIBkQ7pJcOqHYv5pZdahRn
 weqb2RyyP1u6Nak+2fue90CmQ=
Received: from YLLaptop.. (unknown [])
 by gzga-smtp-mtada-g1-3 (Coremail) with SMTP id
 _____wD3lx+Ad2Np0FddBg--.65279S3; 
 Sun, 11 Jan 2026 18:12:20 +0800 (CST)
From: Nanzhe Zhao <nzzhao@126.com>
To: Jaegeuk Kim <jaegeuk@kernel.org>, linux-f2fs-devel@lists.sourceforge.net,
 linux-fsdevel@vger.kernel.org
Date: Sun, 11 Jan 2026 18:09:40 +0800
Message-Id: <20260111100941.119765-2-nzzhao@126.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260111100941.119765-1-nzzhao@126.com>
References: <20260111100941.119765-1-nzzhao@126.com>
MIME-Version: 1.0
X-CM-TRANSID: _____wD3lx+Ad2Np0FddBg--.65279S3
X-Coremail-Antispam: 1Uf129KBjvJXoW7Aw4xurWrCw4DKryrXryUAwb_yoW8Cr43pF
 yDKF95KFs8Gay8ur48tws0vw1Sk348Wa1UGFWfCw1fAasxXa4rKFy0q34Y9F1UtFn5JF1I
 qF4FvryUWa1UtF7anT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
 9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x0zRaLvtUUUUU=
X-Originating-IP: [2409:8a20:4df2:4050:484a:1889:71da:fb99]
X-CM-SenderInfo: xq22xtbr6rjloofrz/xtbBsAQyAmljd4SbEAAA32
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
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 0.0 FREEMAIL_FROM Sender email is commonly abused enduser mail provider
 [nzzhao(at)126.com]
 0.0 UNPARSEABLE_RELAY Informational: message has unparseable relay lines
X-Headers-End: 1vesRB-0004ud-Hs
Subject: [f2fs-dev] [PATCH v2 1/2] f2fs: add 'folio_in_bio' to handle
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
Cc: Nanzhe Zhao <nzzhao@126.com>
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
index f32eb51ccee4..ddabcb1b9882 100644
--- a/fs/f2fs/data.c
+++ b/fs/f2fs/data.c
@@ -2436,6 +2436,7 @@ static int f2fs_read_data_large_folio(struct inode *inode,
 	unsigned nrpages;
 	struct f2fs_folio_state *ffs;
 	int ret = 0;
+	bool folio_in_bio;

 	if (!IS_IMMUTABLE(inode))
 		return -EOPNOTSUPP;
@@ -2451,6 +2452,7 @@ static int f2fs_read_data_large_folio(struct inode *inode,
 	if (!folio)
 		goto out;

+	folio_in_bio = false;
 	index = folio->index;
 	offset = 0;
 	ffs = NULL;
@@ -2536,6 +2538,7 @@ static int f2fs_read_data_large_folio(struct inode *inode,
 					offset << PAGE_SHIFT))
 			goto submit_and_realloc;

+		folio_in_bio = true;
 		inc_page_count(F2FS_I_SB(inode), F2FS_RD_DATA);
 		f2fs_update_iostat(F2FS_I_SB(inode), NULL, FS_DATA_READ_IO,
 				F2FS_BLKSIZE);
@@ -2545,6 +2548,11 @@ static int f2fs_read_data_large_folio(struct inode *inode,
 	}
 	trace_f2fs_read_folio(folio, DATA);
 	if (rac) {
+		if (!folio_in_bio) {
+			if (!ret)
+				folio_mark_uptodate(folio);
+			folio_unlock(folio);
+		}
 		folio = readahead_folio(rac);
 		goto next_folio;
 	}
--
2.34.1



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
