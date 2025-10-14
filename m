Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 8AEAFBD943C
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 14 Oct 2025 14:11:43 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Subject:References:MIME-Version:In-Reply-To:Message-Id:Date:To:From:Sender:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=CFOEXMf1BpNHJtMAlp2LLL0deXncFW48vM/y53fCqhk=; b=cVc+V9S7fvtPFZVxdqXKBENEtm
	5GFVwtod9diglR2uC+ajcNfFAOJ8iqoY3aEcUTn4r8vSIe+6SjGGVsQEFIKXaARsMi0EQ5+u5i3Qk
	stq3tQjIKmURnjGZsxQoQ0ewz8CX6oGD4cKkhOXe6v27Ds7LeEMAtTVDKOU8CvnuYScc=;
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1v8dsP-00029L-50;
	Tue, 14 Oct 2025 12:11:37 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <kundan.kumar@samsung.com>) id 1v8dsM-00028z-MN
 for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 14 Oct 2025 12:11:35 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=References:Content-Type:Content-Transfer-Encoding:
 MIME-Version:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=61qDs/uNLNIIdKnnYQdqSL+IPjVsVRa8wMEMFzbI1Ig=; b=Oqb7mDPCnwK8i/4yo18INEJHYD
 8/yCZGipRPxLa/HAyGc8uAMTGQmV41N9FRDYua/85JQzRZkvOAcR3YIXNQ5igw+S2mxazYcQKf+Ds
 QN9ngClsOFFCYG7xioPtQRlxhImHF9MlK+BnS1dtduFFTL0WSTo8NuoMz36oyfFXnGUI=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=References:Content-Type:Content-Transfer-Encoding:MIME-Version:
 In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=61qDs/uNLNIIdKnnYQdqSL+IPjVsVRa8wMEMFzbI1Ig=; b=Gtp2LolXVJLFsWPL4+4PpVUWIc
 eF/l/n0xEsj82wuGwbwMc0G27ZecSdqgJtcrB8swjBzlNLzPzdPvOHP/k0Nt95xNfKrv3eFdmh/I6
 2qR1kDWEOy6dTjQi2jfShzhpFO7s7IeQ9VAlLRmDrecou/5wS5+Si2sLzjVdhY0Tz/cQ=;
Received: from mailout3.samsung.com ([203.254.224.33])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1v8dsJ-0001PW-Mo for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 14 Oct 2025 12:11:32 +0000
Received: from epcas5p1.samsung.com (unknown [182.195.41.39])
 by mailout3.samsung.com (KnoxPortal) with ESMTP id
 20251014121120epoutp032c4d48bde0248123a472686c39294e92~uWmG3L8b80652206522epoutp032
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Tue, 14 Oct 2025 12:11:20 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout3.samsung.com
 20251014121120epoutp032c4d48bde0248123a472686c39294e92~uWmG3L8b80652206522epoutp032
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
 s=mail20170921; t=1760443880;
 bh=61qDs/uNLNIIdKnnYQdqSL+IPjVsVRa8wMEMFzbI1Ig=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=XE/sU7vVXE/e7MnP7E7r0AmM0u0xHWNb0WuN2b/dUX9/kpXzsXJmeIxfhY+/Ey9jP
 cFgzwX4SMWh/mvWFDEFlps9TZ+TGhqvUXvUIkeflj27ofVsdAoY5dhzLdy5cNAElfS
 gHxIpSt4QFXj7OwCKUo0FtsoDs2jDAzA8y40Ny5s=
Received: from epsnrtp01.localdomain (unknown [182.195.42.153]) by
 epcas5p3.samsung.com (KnoxPortal) with ESMTPS id
 20251014121119epcas5p37555d2e9cbae9ba706e6102f72c13305~uWmGQctVW1718117181epcas5p3b;
 Tue, 14 Oct 2025 12:11:19 +0000 (GMT)
Received: from epcas5p1.samsung.com (unknown [182.195.38.93]) by
 epsnrtp01.localdomain (Postfix) with ESMTP id 4cmCjy2l8sz6B9m6; Tue, 14 Oct
 2025 12:11:18 +0000 (GMT)
Received: from epsmtip1.samsung.com (unknown [182.195.34.30]) by
 epcas5p3.samsung.com (KnoxPortal) with ESMTPA id
 20251014121117epcas5p3f095fc3e8c279700c7256e07cd780c5f~uWmEts7qX1002310023epcas5p3P;
 Tue, 14 Oct 2025 12:11:17 +0000 (GMT)
Received: from localhost.localdomain (unknown [107.99.41.245]) by
 epsmtip1.samsung.com (KnoxPortal) with ESMTPA id
 20251014121113epsmtip19fc785cad0e58b227dd7ca61b631f1b3~uWmApRSVh1306813068epsmtip1l;
 Tue, 14 Oct 2025 12:11:13 +0000 (GMT)
From: Kundan Kumar <kundan.kumar@samsung.com>
To: jaegeuk@kernel.org, chao@kernel.org, viro@zeniv.linux.org.uk,
 brauner@kernel.org, jack@suse.cz, miklos@szeredi.hu, agruenba@redhat.com,
 trondmy@kernel.org, anna@kernel.org, akpm@linux-foundation.org,
 willy@infradead.org, mcgrof@kernel.org, clm@meta.com, david@fromorbit.com,
 amir73il@gmail.com, axboe@kernel.dk, hch@lst.de, ritesh.list@gmail.com,
 djwong@kernel.org, dave@stgolabs.net, wangyufei@vivo.com
Date: Tue, 14 Oct 2025 17:38:41 +0530
Message-Id: <20251014120845.2361-13-kundan.kumar@samsung.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20251014120845.2361-1-kundan.kumar@samsung.com>
MIME-Version: 1.0
X-CMS-MailID: 20251014121117epcas5p3f095fc3e8c279700c7256e07cd780c5f
X-Msg-Generator: CA
CMS-TYPE: 105P
cpgsPolicy: CPGSC10-542,Y
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20251014121117epcas5p3f095fc3e8c279700c7256e07cd780c5f
References: <20251014120845.2361-1-kundan.kumar@samsung.com>
 <CGME20251014121117epcas5p3f095fc3e8c279700c7256e07cd780c5f@epcas5p3.samsung.com>
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-2.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  Fetch writeback context to which an inode is affined. Use
 it to perform writeback related operations. Signed-off-by: Kundan Kumar
 <kundan.kumar@samsung.com>
 Signed-off-by: Anuj Gupta <anuj20.g@samsung.com> --- fs/nfs/internal.h |
 3 +-- fs/nfs/write.c | 3 +-- 2 files changed, 2 insertions(+), 4 deletio [...]
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
 0.0 RCVD_IN_MSPIKE_H3      RBL: Good reputation (+3)
 [203.254.224.33 listed in wl.mailspike.net]
 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
X-Headers-End: 1v8dsJ-0001PW-Mo
Subject: [f2fs-dev] [PATCH v2 12/16] nfs: add support in nfs to handle
 multiple writeback contexts
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
Cc: linux-nfs@vger.kernel.org, gost.dev@samsung.com, anuj20.g@samsung.com,
 vishak.g@samsung.com, linux-f2fs-devel@lists.sourceforge.net,
 gfs2@lists.linux.dev, linux-mm@kvack.org, linux-fsdevel@vger.kernel.org,
 kundan.kumar@samsung.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

Fetch writeback context to which an inode is affined. Use it to perform
writeback related operations.

Signed-off-by: Kundan Kumar <kundan.kumar@samsung.com>
Signed-off-by: Anuj Gupta <anuj20.g@samsung.com>
---
 fs/nfs/internal.h | 3 +--
 fs/nfs/write.c    | 3 +--
 2 files changed, 2 insertions(+), 4 deletions(-)

diff --git a/fs/nfs/internal.h b/fs/nfs/internal.h
index 5b3c84104b5b..99eb6a5d5d01 100644
--- a/fs/nfs/internal.h
+++ b/fs/nfs/internal.h
@@ -857,8 +857,7 @@ static inline void nfs_folio_mark_unstable(struct folio *folio,
 		 * writeback is happening on the server now.
 		 */
 		node_stat_mod_folio(folio, NR_WRITEBACK, nr);
-		wb_stat_mod(&inode_to_bdi(inode)->wb_ctx[0]->wb,
-			    WB_WRITEBACK, nr);
+		bdi_wb_stat_mod(inode, nr);
 		__mark_inode_dirty(inode, I_DIRTY_DATASYNC);
 	}
 }
diff --git a/fs/nfs/write.c b/fs/nfs/write.c
index 4317b93bc2af..0fe6ae84c4a2 100644
--- a/fs/nfs/write.c
+++ b/fs/nfs/write.c
@@ -868,8 +868,7 @@ static void nfs_folio_clear_commit(struct folio *folio)
 		struct inode *inode = folio->mapping->host;
 
 		node_stat_mod_folio(folio, NR_WRITEBACK, -nr);
-		wb_stat_mod(&inode_to_bdi(inode)->wb_ctx[0]->wb,
-			    WB_WRITEBACK, -nr);
+		bdi_wb_stat_mod(inode, -nr);
 	}
 }
 
-- 
2.25.1



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
