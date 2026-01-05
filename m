Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B0B4CF469B
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 05 Jan 2026 16:31:48 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Subject:MIME-Version:References:In-Reply-To:Message-Id:Date:To:From:Sender:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=JUJGrK91qVw4QguewK7N5bNbjn3wfk2YQY/Aw+ygrgc=; b=IQyeaz1EvdrWLnDtv5OynXotQk
	TrZXoTQcghom8Wu/2Nwi7MU8E4aW44nRslZYXCam+H/j4/bdxha2KD/K/+yxs/aG+sUHNzismI/Xi
	ywStl817t64LRY4P265zbUkwtqLmNHuiaW9rGSacJJJswnTKhRUNj3qNTJ3G+A1JI8Qk=;
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1vcmYV-000164-1w;
	Mon, 05 Jan 2026 15:31:39 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <nzzhao@126.com>) id 1vcmYU-00015v-29
 for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 05 Jan 2026 15:31:38 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=GO3itdCPSkQnHkTqXXvHziXTo77mdzcUY7oiBvS+ZkM=; b=Y7JI5go2Tdhwomt++a69o0nma2
 1jiiNrw6v1r/tubK00E+0dvLIDlef7EL5S0Mb0rvnPd1Twykktt06GAJrB26z2iyDrwmHPMVsXWF2
 gnzhq/HhFlDATg+ELuBGHhnIbmkRNYxzGobyaymBgyI1ueFKVJV24xCfkGlxd/5IRAis=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=GO3itdCPSkQnHkTqXXvHziXTo77mdzcUY7oiBvS+ZkM=; b=dlV9AOIWjrMPG67r9W7DvgNoO7
 8Ph8aF36mUHERF+PH7GgeHUEGQ5URuhJXIGZliVpi52YBry+p7g902W1J34tnzBJdIxjA4o9XUcdM
 bb2WtFrg7n0RzNM1//eHMhnsfmLeyTa4x6q92NZG2xvnOo5RFoDTpmbZpHT5HJlAgpPE=;
Received: from m16.mail.126.com ([220.197.31.9])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1vcmYT-0006E2-3v for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 05 Jan 2026 15:31:37 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=126.com;
 s=s110527; h=From:To:Subject:Date:Message-Id:MIME-Version; bh=GO
 3itdCPSkQnHkTqXXvHziXTo77mdzcUY7oiBvS+ZkM=; b=YAAnvHaW97WrvTlYfu
 OTnPAeRIcTWTEqFuXnjZvQxnHAVI/cO/gfn9rDj6yMholkwkqXc/qUMLOtl51XEz
 r7u+1No//ElGC+LDSvBNhBNkIjTdTZj9c1kVwjSdzQQ6fy2tQwv53kM4qCFbVsXH
 bAAZD9zv+G2OfGzDmuEVRlv60=
Received: from YLLaptop.. (unknown [])
 by gzga-smtp-mtada-g0-1 (Coremail) with SMTP id _____wD3t6092Vtp4nHABA--.665S7;
 Mon, 05 Jan 2026 23:31:13 +0800 (CST)
From: Nanzhe Zhao <nzzhao@126.com>
To: Kim Jaegeuk <jaegeuk@kernel.org>
Date: Mon,  5 Jan 2026 23:31:01 +0800
Message-Id: <20260105153101.152892-6-nzzhao@126.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260105153101.152892-1-nzzhao@126.com>
References: <20260105153101.152892-1-nzzhao@126.com>
MIME-Version: 1.0
X-CM-TRANSID: _____wD3t6092Vtp4nHABA--.665S7
X-Coremail-Antispam: 1Uf129KBjvdXoW7JFy3KrW7Cw45Cr4rAFW5Jrb_yoWkCwb_Zr
 1kArs7A3y09rW3Kr4qyw4rt3s2qw4kWr15uFWUJFWUCr98ZrWfAa90vFZ3Ar1kW3yayFsI
 93ykXw1rA34DujkaLaAFLSUrUUUUjb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
 9fnUUvcSsGvfC2KfnxnUUI43ZEXa7xREuyI5UUUUU==
X-Originating-IP: [2409:8a20:4df7:2871:d124:26e2:5013:1aa3]
X-CM-SenderInfo: xq22xtbr6rjloofrz/xtbBsQG3h2lb2UFI0wAA3x
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-2.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  In f2fs_read_data_large_folio(), the block zeroing path calls
 folio_zero_range() and then continues the loop. However, it fails to advance
 index and offset before continuing. This can cause the loop to repeatedly
 process the same subpage of the folio, leading to stalls/hangs and incorrect
 progress when reading large folios with holes/zeroed blocks. 
 Content analysis details:   (-0.2 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 0.0 FREEMAIL_FROM Sender email is commonly abused enduser mail provider
 [nzzhao(at)126.com]
 0.0 RCVD_IN_MSPIKE_H5      RBL: Excellent reputation (+5)
 [220.197.31.9 listed in wl.mailspike.net]
 0.0 UNPARSEABLE_RELAY Informational: message has unparseable relay lines
 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
X-Headers-End: 1vcmYT-0006E2-3v
Subject: [f2fs-dev] [PATCH v1 5/5] f2fs: advance index and offset after
 zeroing in large folio read
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

In f2fs_read_data_large_folio(), the block zeroing path calls
folio_zero_range() and then continues the loop. However, it fails to
advance index and offset before continuing.

This can cause the loop to repeatedly process the same subpage of the
folio, leading to stalls/hangs and incorrect progress when reading large
folios with holes/zeroed blocks.

Fix it by incrementing index and offset in the zeroing path before
continuing.

Signed-off-by: Nanzhe Zhao <nzzhao@126.com>
---
 fs/f2fs/data.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/fs/f2fs/data.c b/fs/f2fs/data.c
index ac569a396914..07c222bcc5e0 100644
--- a/fs/f2fs/data.c
+++ b/fs/f2fs/data.c
@@ -2446,7 +2446,7 @@ static int f2fs_read_data_large_folio(struct inode *inode,
 	if (!folio)
 		goto out;

-	folio_in_bio = false
+	folio_in_bio = false;
 	index = folio->index;
 	offset = 0;
 	ffs = NULL;
@@ -2483,6 +2483,8 @@ static int f2fs_read_data_large_folio(struct inode *inode,
 				ret = -EIO;
 				goto err_out;
 			}
+			index++;
+			offset++;
 			continue;
 		} else if((map.m_flags & F2FS_MAP_MAPPED)) {
 			block_nr = map.m_pblk + index - map.m_lblk;
--
2.34.1



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
