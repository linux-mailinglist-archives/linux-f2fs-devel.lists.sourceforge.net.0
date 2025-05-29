Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 691D9AC7D82
	for <lists+linux-f2fs-devel@lfdr.de>; Thu, 29 May 2025 13:59:34 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Subject:References:MIME-Version:In-Reply-To:Message-Id:Date:To:From:Sender:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=AoU/ONw0mkPxgRcQ6Pbdhsy4epDACEDPRwuRdxOBtHU=; b=Af0FnRFMYtYxjKr4I0ZxT3dVj0
	VrNJFy6maKBqoONzNobB6H9jYSHuT4/0Nt54qjxPqFVmOyYu9yM5hKFRCq+vV2k86cUY9HHsRgXc9
	xnummZicqg0t/grnYi8ZAhluC0rfIAWe4m7An9nfjPhHJb7nCuLzpe3jqAM9VqB6SHoc=;
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1uKbv0-0003YJ-1W;
	Thu, 29 May 2025 11:59:30 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <kundan.kumar@samsung.com>) id 1uKbux-0003Xx-Io
 for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 29 May 2025 11:59:27 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=References:Content-Type:Content-Transfer-Encoding:
 MIME-Version:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=cE4aGrMWfdfKbV5mbcWv7IOIJ9zK97xR7MCGDQSOGKk=; b=I2ynn/PqJKPTphloH1jkIo8Jur
 8mE6dYH7Bo+zbxyOIjafvO/heWer9s82EL19Mr4IG6ubQRi48DVyJMa4UcV5RMSNspk+5UvMt2mzs
 eaTgM8VW+GUY4SaMoJwE5YGI2sIjvMOw7HHLGPgufTXcx1Es7wp+8Y6dpV+obmEpjOE4=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=References:Content-Type:Content-Transfer-Encoding:MIME-Version:
 In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=cE4aGrMWfdfKbV5mbcWv7IOIJ9zK97xR7MCGDQSOGKk=; b=heI0i7rOrahU8hV5lrf5009jZc
 eFfJgGnXL3k+ZFpbP14X99hER0i7O2xy0VKZdb/he4nvnBJdhNIPHzsUoIJVk3t7+gKqfVmB0UmqQ
 RbSBHlr/KosswPHJLkozkxbY5UCVYYDfKEuQwaAtEXdwapvJiAKLEMPsa/O/PV7cWj1o=;
Received: from mailout1.samsung.com ([203.254.224.24])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1uKbuw-0002Th-3u for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 29 May 2025 11:59:27 +0000
Received: from epcas5p1.samsung.com (unknown [182.195.41.39])
 by mailout1.samsung.com (KnoxPortal) with ESMTP id
 20250529113416epoutp0140ee6aeb33d65cdb815104eddd66dc3c~D-EWP5WM22482824828epoutp01Z
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Thu, 29 May 2025 11:34:16 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.samsung.com
 20250529113416epoutp0140ee6aeb33d65cdb815104eddd66dc3c~D-EWP5WM22482824828epoutp01Z
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
 s=mail20170921; t=1748518456;
 bh=cE4aGrMWfdfKbV5mbcWv7IOIJ9zK97xR7MCGDQSOGKk=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=a2n8UTrOM8mPmjG1GkMf88KfKidjyEHvKIwzrMlx/hgazwXWF/RQruVtbORT+aKhP
 uo4kUlfRMf3JRNFX4TLvxRcDSM+/boX9VMF1IEjCb3f7dZOFrynqPvneCM0bQb5DwX
 Q4vuckXTuFOWlWIHlUGObdxUZKjUZV4KFoF37dso=
Received: from epsnrtp03.localdomain (unknown [182.195.42.155]) by
 epcas5p1.samsung.com (KnoxPortal) with ESMTPS id
 20250529113415epcas5p13c210c73fcbcff52dcc7bb93f4f01f1b~D-EVoaqUQ0281002810epcas5p1n;
 Thu, 29 May 2025 11:34:15 +0000 (GMT)
Received: from epcas5p3.samsung.com (unknown [182.195.38.176]) by
 epsnrtp03.localdomain (Postfix) with ESMTP id 4b7PQs6NQsz3hhT4; Thu, 29 May
 2025 11:34:13 +0000 (GMT)
Received: from epsmtrp2.samsung.com (unknown [182.195.40.14]) by
 epcas5p3.samsung.com (KnoxPortal) with ESMTPA id
 20250529113306epcas5p3d10606ae4ea7c3491e93bde9ae408c9f~D-DVj9Ciy0439204392epcas5p3B;
 Thu, 29 May 2025 11:33:06 +0000 (GMT)
Received: from epsmgms1p1new.samsung.com (unknown [182.195.42.41]) by
 epsmtrp2.samsung.com (KnoxPortal) with ESMTP id
 20250529113306epsmtrp271b91974fef11311e14c484c1a067438~D-DVZrJFM3201832018epsmtrp2_;
 Thu, 29 May 2025 11:33:06 +0000 (GMT)
X-AuditID: b6c32a29-566fe7000000223e-ae-683845f23ae6
Received: from epsmtip2.samsung.com ( [182.195.34.31]) by
 epsmgms1p1new.samsung.com (Symantec Messaging Gateway) with SMTP id
 62.F0.08766.2F548386; Thu, 29 May 2025 20:33:06 +0900 (KST)
Received: from localhost.localdomain (unknown [107.99.41.245]) by
 epsmtip2.samsung.com (KnoxPortal) with ESMTPA id
 20250529113302epsmtip2ad463f8678ba29c64da9a5eb397e2892~D-DRiEkXT2424224242epsmtip2B;
 Thu, 29 May 2025 11:33:02 +0000 (GMT)
From: Kundan Kumar <kundan.kumar@samsung.com>
To: jaegeuk@kernel.org, chao@kernel.org, viro@zeniv.linux.org.uk,
 brauner@kernel.org, jack@suse.cz, miklos@szeredi.hu, agruenba@redhat.com,
 trondmy@kernel.org, anna@kernel.org, akpm@linux-foundation.org,
 willy@infradead.org, mcgrof@kernel.org, clm@meta.com, david@fromorbit.com,
 amir73il@gmail.com, axboe@kernel.dk, hch@lst.de, ritesh.list@gmail.com,
 djwong@kernel.org, dave@stgolabs.net, p.raghav@samsung.com,
 da.gomez@samsung.com
Date: Thu, 29 May 2025 16:45:03 +0530
Message-Id: <20250529111504.89912-13-kundan.kumar@samsung.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20250529111504.89912-1-kundan.kumar@samsung.com>
MIME-Version: 1.0
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFnrJIsWRmVeSWpSXmKPExsWy7bCSvO4nV4sMg7b1whbb1u1mt5izfg2b
 xYV1qxktWnf+Z7FomvCX2WL13X42i9eHPzFanJ56lsliyyV7i/eXtzFZrL65htFiy7F7jBaX
 n/BZ7J7+j9Xi5oGdTBYrVx9lspg9vZnJ4sn6WcwWW798ZbW4tMjdYs/ekywW99b8Z7W4cOA0
 q8WNCU8ZLZ7t3shs8XlpC7vFwVMd7Baf5gINOf/3OKvF7x9z2BzkPE4tkvDYOesuu8fmFVoe
 l8+Wemxa1cnmsenTJHaPEzN+s3i82DyT0WP3gs9MHrtvNrB5nLtY4fF+31U2j74tqxg9ps6u
 9ziz4Ai7x4ppF5kChKK4bFJSczLLUov07RK4MrYdfcBc8IS34sRS3gbGldxdjJwcEgImEgt+
 zGfqYuTiEBLYzShxc+FuRoiEjMTuuztZIWxhiZX/nrNDFH1klJh9+wdzFyMHB5uArsSPplCQ
 uIjATWaJc2fPgDUwC/xjlNj9SgfEFhYIkTj9fxkbiM0ioCqx5FUDmM0rYCexafIFqGXyEjMv
 fWcHsTmB4ouWfAWLCwnYSiy9uZYFol5Q4uTMJywQ8+UlmrfOZp7AKDALSWoWktQCRqZVjJKp
 BcW56bnFhgWGeanlesWJucWleel6yfm5mxjBqUFLcwfj9lUf9A4xMnEwHmKU4GBWEuFtsjfL
 EOJNSaysSi3Kjy8qzUktPsQozcGiJM4r/qI3RUggPbEkNTs1tSC1CCbLxMEp1cAU633n10k1
 d2v/ThdDY8P5q4xkpB0yZ4idC1tVcftNR67buyu3WPe5RzNtWH2tvmW1jP/cy7fellk7b/zm
 N/PiFW2WLV/d/jVWRe4rFSwrvVsSF6MT/tpXL1qAKXT36vS0SR/Sph6U1Q9aaBNepmItNj9w
 6e1Dx9Prvadc7fhve3ZZWWnT1o8BO17x7O/elK9vFn3z2rXtPI27ew3m+1dt/JJjdkezcc+K
 V3dLdiXe3PnJe4GK6bHOvHsTw82TSrzf9ajsyw1l/NUr8UMq6OvUNPmYKWqqe5luNOxVXCIg
 tJTpRvyN0xztR2w07daISReu/a90uuxXSdWltcdV7aSWn5ybzObi/t72y8071RuUWIozEg21
 mIuKEwHp2L7efAMAAA==
X-CMS-MailID: 20250529113306epcas5p3d10606ae4ea7c3491e93bde9ae408c9f
X-Msg-Generator: CA
X-Sendblock-Type: REQ_APPROVE
CMS-TYPE: 105P
cpgsPolicy: CPGSC10-542,Y
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20250529113306epcas5p3d10606ae4ea7c3491e93bde9ae408c9f
References: <20250529111504.89912-1-kundan.kumar@samsung.com>
 <CGME20250529113306epcas5p3d10606ae4ea7c3491e93bde9ae408c9f@epcas5p3.samsung.com>
X-Spam-Score: -5.4 (-----)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  Fetch writeback context to which an inode is affined. Use
 it to perform writeback related operations. Signed-off-by: Kundan Kumar
 <kundan.kumar@samsung.com>
 Signed-off-by: Anuj Gupta <anuj20.g@samsung.com> --- fs/nfs/internal.h |
 5 +++-- fs/nfs/write.c | 6 +++--- 2 files changed, 6 insertions(+), 5 de [...]
 Content analysis details:   (-5.4 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 URIBL_BLOCKED          ADMINISTRATOR NOTICE: The query to URIBL was
 blocked.  See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URIs: samsung.com]
 -2.3 RCVD_IN_DNSWL_MED      RBL: Sender listed at https://www.dnswl.org/,
 medium trust [203.254.224.24 listed in list.dnswl.org]
 0.0 RCVD_IN_VALIDITY_SAFE_BLOCKED RBL: ADMINISTRATOR NOTICE: The
 query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [203.254.224.24 listed in sa-trusted.bondedsender.org]
 0.0 RCVD_IN_VALIDITY_RPBL_BLOCKED RBL: ADMINISTRATOR NOTICE: The
 query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [203.254.224.24 listed in bl.score.senderscore.com]
 0.0 RCVD_IN_MSPIKE_H3      RBL: Good reputation (+3)
 [203.254.224.24 listed in wl.mailspike.net]
 -0.0 SPF_HELO_PASS          SPF: HELO matches SPF record
 0.0 SPF_NONE               SPF: sender does not publish an SPF Record
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
 -2.9 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1uKbuw-0002Th-3u
Subject: [f2fs-dev] [PATCH 12/13] nfs: add support in nfs to handle multiple
 writeback contexts
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
Cc: linux-nfs@vger.kernel.org, gost.dev@samsung.com,
 Anuj Gupta <anuj20.g@samsung.com>, linux-f2fs-devel@lists.sourceforge.net,
 gfs2@lists.linux.dev, linux-mm@kvack.org, linux-fsdevel@vger.kernel.org,
 Kundan Kumar <kundan.kumar@samsung.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

Fetch writeback context to which an inode is affined. Use it to perform
writeback related operations.

Signed-off-by: Kundan Kumar <kundan.kumar@samsung.com>
Signed-off-by: Anuj Gupta <anuj20.g@samsung.com>
---
 fs/nfs/internal.h | 5 +++--
 fs/nfs/write.c    | 6 +++---
 2 files changed, 6 insertions(+), 5 deletions(-)

diff --git a/fs/nfs/internal.h b/fs/nfs/internal.h
index fd513bf9e875..a7cacaf484c9 100644
--- a/fs/nfs/internal.h
+++ b/fs/nfs/internal.h
@@ -838,14 +838,15 @@ static inline void nfs_folio_mark_unstable(struct folio *folio,
 {
 	if (folio && !cinfo->dreq) {
 		struct inode *inode = folio->mapping->host;
+		struct bdi_writeback_ctx *bdi_wb_ctx =
+						fetch_bdi_writeback_ctx(inode);
 		long nr = folio_nr_pages(folio);
 
 		/* This page is really still in write-back - just that the
 		 * writeback is happening on the server now.
 		 */
 		node_stat_mod_folio(folio, NR_WRITEBACK, nr);
-		wb_stat_mod(&inode_to_bdi(inode)->wb_ctx_arr[0]->wb,
-			    WB_WRITEBACK, nr);
+		wb_stat_mod(&bdi_wb_ctx->wb, WB_WRITEBACK, nr);
 		__mark_inode_dirty(inode, I_DIRTY_DATASYNC);
 	}
 }
diff --git a/fs/nfs/write.c b/fs/nfs/write.c
index ec48ec8c2db8..ca0823debce7 100644
--- a/fs/nfs/write.c
+++ b/fs/nfs/write.c
@@ -932,11 +932,11 @@ static void nfs_folio_clear_commit(struct folio *folio)
 {
 	if (folio) {
 		long nr = folio_nr_pages(folio);
-		struct inode *inode = folio->mapping->host;
+		struct bdi_writeback_ctx *bdi_wb_ctx =
+				fetch_bdi_writeback_ctx(folio->mapping->host);
 
 		node_stat_mod_folio(folio, NR_WRITEBACK, -nr);
-		wb_stat_mod(&inode_to_bdi(inode)->wb_ctx_arr[0]->wb,
-			    WB_WRITEBACK, -nr);
+		wb_stat_mod(&bdi_wb_ctx->wb, WB_WRITEBACK, -nr);
 	}
 }
 
-- 
2.25.1



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
