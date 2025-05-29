Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 53617AC7D68
	for <lists+linux-f2fs-devel@lfdr.de>; Thu, 29 May 2025 13:50:05 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Subject:References:MIME-Version:In-Reply-To:Message-Id:Date:To:From:Sender:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=2J+slY3Gjwi5TBTd6uL5bR66icwyyNW8PCaG+UyLbg8=; b=Xf9W96jKA6kxwcRjSfH9yW9fvn
	KdeCcO7IUIO187AWcN0UAYvm15pZ6ywVZncMaUz1yX+ZGCbUUkQQBGngBpZYViCpJzyvuzVYoBJVY
	RrvmHPOQoEHNw5YRqcVV2TyAVaAj+h57fm4oRh0veQ+M7HGXT/O9cqVaCowLB9+Jk6Mw=;
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1uKbls-0002sE-6T;
	Thu, 29 May 2025 11:50:04 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <kundan.kumar@samsung.com>) id 1uKblm-0002qi-62
 for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 29 May 2025 11:49:58 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=References:Content-Type:Content-Transfer-Encoding:
 MIME-Version:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=YVQc/WM+0VBSsD0jrWzuyT5Fy00MAzbyaleiZXGhJOs=; b=cUgtMPq8M90i3Dda84oZ9xAl5q
 SlJCnblI11a7B8XmtMIVn+SwwS9MasONryQuSWsXbHL0cCMXUetJlZeZNNuy4Y0sI43IwAP5dcGC0
 ZhwaW1Ba2BCy1of+NOAx9oK2ms+8tyRSKKwDLcTHxQfppAExyvtne+HxYhNO7f7Qv27A=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=References:Content-Type:Content-Transfer-Encoding:MIME-Version:
 In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=YVQc/WM+0VBSsD0jrWzuyT5Fy00MAzbyaleiZXGhJOs=; b=ciykDChbpjo+aaxFwyymH8aTXO
 8XuN+ODZBUQYSCJiSmjGpXxFIjG7V89hxY1wfe0IsgvB8O2MoMS0f7vki5gkm9C/7DeF1Zu8jJoGT
 h8eiDljz33lqFu65Fk4vw7jX20A+PQk2rRh294mU9yo/YT4DATyY4RjVq3DLzFf3EQ+E=;
Received: from mailout4.samsung.com ([203.254.224.34])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1uKbll-0000yU-6o for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 29 May 2025 11:49:58 +0000
Received: from epcas5p1.samsung.com (unknown [182.195.41.39])
 by mailout4.samsung.com (KnoxPortal) with ESMTP id
 20250529113358epoutp048c78385a8bdfcbfe09eef27ab190b6d6~D-EF2Ovde2545625456epoutp04f
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Thu, 29 May 2025 11:33:58 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout4.samsung.com
 20250529113358epoutp048c78385a8bdfcbfe09eef27ab190b6d6~D-EF2Ovde2545625456epoutp04f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
 s=mail20170921; t=1748518438;
 bh=YVQc/WM+0VBSsD0jrWzuyT5Fy00MAzbyaleiZXGhJOs=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=vETbCvxLbscdz42m0xibxK80NvlHSGYC9nSQpC8t2DbiwrsklMr/U4RQh8cRySx4I
 hc/zf7grx5CMxs7zvflWN5KJ77KxVVzZ8Wr9su3Fu6Ui/w1Yiq8xiPp+75XxG+mHD8
 5WrBYDM+zcb2e6Mk5brslJAVtmDfqDmZhH4R2g0A=
Received: from epsnrtp01.localdomain (unknown [182.195.42.153]) by
 epcas5p1.samsung.com (KnoxPortal) with ESMTPS id
 20250529113357epcas5p18de4e7caba809b6bb3565d3e9d982b40~D-EEvRK7r0737107371epcas5p18;
 Thu, 29 May 2025 11:33:57 +0000 (GMT)
Received: from epcas5p3.samsung.com (unknown [182.195.38.175]) by
 epsnrtp01.localdomain (Postfix) with ESMTP id 4b7PQW2YF3z6B9m4; Thu, 29 May
 2025 11:33:55 +0000 (GMT)
Received: from epsmtrp2.samsung.com (unknown [182.195.40.14]) by
 epcas5p2.samsung.com (KnoxPortal) with ESMTPA id
 20250529113236epcas5p2049b6cc3be27d8727ac1f15697987ff5~D-C5wJXZx2930829308epcas5p21;
 Thu, 29 May 2025 11:32:36 +0000 (GMT)
Received: from epsmgmcp1.samsung.com (unknown [182.195.42.82]) by
 epsmtrp2.samsung.com (KnoxPortal) with ESMTP id
 20250529113236epsmtrp240a2f4a07bb2f63134e2af6d9c4e69f3~D-C5vFydm3187631876epsmtrp2R;
 Thu, 29 May 2025 11:32:36 +0000 (GMT)
X-AuditID: b6c32a52-40bff70000004c16-ed-683845d494c2
Received: from epsmtip2.samsung.com ( [182.195.34.31]) by
 epsmgmcp1.samsung.com (Symantec Messaging Gateway) with SMTP id
 28.82.19478.4D548386; Thu, 29 May 2025 20:32:36 +0900 (KST)
Received: from localhost.localdomain (unknown [107.99.41.245]) by
 epsmtip2.samsung.com (KnoxPortal) with ESMTPA id
 20250529113232epsmtip2bd1005fd88dc0a37d763985b112d9710~D-C15pB1S2452324523epsmtip2I;
 Thu, 29 May 2025 11:32:32 +0000 (GMT)
From: Kundan Kumar <kundan.kumar@samsung.com>
To: jaegeuk@kernel.org, chao@kernel.org, viro@zeniv.linux.org.uk,
 brauner@kernel.org, jack@suse.cz, miklos@szeredi.hu, agruenba@redhat.com,
 trondmy@kernel.org, anna@kernel.org, akpm@linux-foundation.org,
 willy@infradead.org, mcgrof@kernel.org, clm@meta.com, david@fromorbit.com,
 amir73il@gmail.com, axboe@kernel.dk, hch@lst.de, ritesh.list@gmail.com,
 djwong@kernel.org, dave@stgolabs.net, p.raghav@samsung.com,
 da.gomez@samsung.com
Date: Thu, 29 May 2025 16:44:56 +0530
Message-Id: <20250529111504.89912-6-kundan.kumar@samsung.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20250529111504.89912-1-kundan.kumar@samsung.com>
MIME-Version: 1.0
X-Brightmail-Tracker: H4sIAAAAAAAAA02Sa0xTZxjHfc+9JHXHKuEVFllqFEVl6tS8QQf6geyd0WTzLkbhhJ5xK0h6
 wCvjrsGaDJwBpFhBpAZaFMUKkooiijegatmCdSnaSPFGUqHivBUmdCZ+++X5/Z9/ng8PRypc
 VCCXmJoualIFtZLxo5quK4MX/BWFEhZ2XJuNms5aWHS8oZ5B98+aADrQMkahvGIviUyOIga9
 uj4MUGdJN4HMtkjk7mkikMleD5D5Zh9APf2TkaVslEb2thYC1Zk6CFRRlk+g/gYdiS6+GaGR
 rfondLn1DoX66sdodL+tk0YPi10ADVjOk8hjKGDRtbuFLBrWfy65571Fo4/vjjMrZ+C71RC3
 6BwsvlAbinu6M3Cj8RCDG4f/ZPHtYx8p/PxCOcCWKg+BLfYcBlsf7MHuK38z+A+zEeCSimzc
 VXWDxbWlD4hfFNF+K1SiOnGXqPk+ItYvoVAXnWaW7ekb7GRzQC+rBTIO8ktg82AbrQV+nIJv
 BtBd1AV84ltocbTQPp4K60afsb7QEIBvnI8ZLeA4hl8A3+VtHJ9P4+0ktHZ3TSyQ/CiAlpfz
 x3kqHws/PdGS40zxs6D+qJ4YZzn/I6zUmf+/IhiW2/6dYBkfAatrRiaOUHzOGOxnKF9+CrxT
 3k/5+oNh/sUKshjwuq+U7itVBQgj8BfTpJT4lLi0RWGSkCJlpMaHxe1MaQQTnxC67hI43eAN
 awcEB9oB5EjlNHle5LIEhVwl7N0nanbGaDLUotQOgjhKGSCfqT6kUvDxQrqYLIppouaLJThZ
 YA4xw78g4/Yzqb1jbVbSuZc/qPYfdZgoJSypzLI/9Qz22obWR1dkl4ItVY5VTkIVO5wUvrVu
 zilN8pxfLW/LfiN6ucUGoTfTJSz/3bb5iKE18F6rZ5NUO7Qy6qr1xIfw9EfyknNRs/H0rMzF
 +tX/FC43hhSZch7VvD+wC5EDn8JGrqgDd3w4rI2JOji2zenKfvE+yOmc0pWbuTtfT++o+UbW
 Mzd81en5nu+OHT6JXud6Hy6ZvmZw5DJVmlj+uOAEt9nluHlrqXHZvJOTcnm6OcRbqbFmXpIm
 abevKXgbdGbhNnfyBgcc8I+88bN1f4A6ZHJcRIDbkBRzJNK7z50fscFbKCgpKUFYFEpqJOE/
 V5BOyngDAAA=
X-CMS-MailID: 20250529113236epcas5p2049b6cc3be27d8727ac1f15697987ff5
X-Msg-Generator: CA
X-Sendblock-Type: REQ_APPROVE
CMS-TYPE: 105P
cpgsPolicy: CPGSC10-542,Y
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20250529113236epcas5p2049b6cc3be27d8727ac1f15697987ff5
References: <20250529111504.89912-1-kundan.kumar@samsung.com>
 <CGME20250529113236epcas5p2049b6cc3be27d8727ac1f15697987ff5@epcas5p2.samsung.com>
X-Spam-Score: -5.4 (-----)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  Since we have multiple cgwb per bdi,
 embedded in writeback_ctx now,
 we iterate over all of them to find the associated writeback. Signed-off-by:
 Kundan Kumar <kundan.kumar@samsung.com> Signed-off-by: Anuj Gupta
 <anuj20.g@samsung.com>
 --- fs/fs-writeback.c | 7 ++++++- 1 file changed, 6 insertions(+),
 1 deletion(-)
 Content analysis details:   (-5.4 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 URIBL_BLOCKED          ADMINISTRATOR NOTICE: The query to URIBL was
 blocked.  See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URIs: samsung.com]
 0.0 RCVD_IN_VALIDITY_SAFE_BLOCKED RBL: ADMINISTRATOR NOTICE: The
 query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [203.254.224.34 listed in sa-trusted.bondedsender.org]
 0.0 RCVD_IN_VALIDITY_RPBL_BLOCKED RBL: ADMINISTRATOR NOTICE: The
 query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [203.254.224.34 listed in bl.score.senderscore.com]
 -2.3 RCVD_IN_DNSWL_MED      RBL: Sender listed at https://www.dnswl.org/,
 medium trust [203.254.224.34 listed in list.dnswl.org]
 -0.0 SPF_HELO_PASS          SPF: HELO matches SPF record
 0.0 SPF_NONE               SPF: sender does not publish an SPF Record
 0.0 RCVD_IN_MSPIKE_H3      RBL: Good reputation (+3)
 [203.254.224.34 listed in wl.mailspike.net]
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
 -2.9 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1uKbll-0000yU-6o
Subject: [f2fs-dev] [PATCH 05/13] writeback: modify bdi_writeback search
 logic to search across all wb ctxs
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

Since we have multiple cgwb per bdi, embedded in writeback_ctx now, we
iterate over all of them to find the associated writeback.

Signed-off-by: Kundan Kumar <kundan.kumar@samsung.com>
Signed-off-by: Anuj Gupta <anuj20.g@samsung.com>
---
 fs/fs-writeback.c | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/fs/fs-writeback.c b/fs/fs-writeback.c
index 9529e16c9b66..72b73c3353fe 100644
--- a/fs/fs-writeback.c
+++ b/fs/fs-writeback.c
@@ -1091,6 +1091,7 @@ int cgroup_writeback_by_id(u64 bdi_id, int memcg_id,
 	struct backing_dev_info *bdi;
 	struct cgroup_subsys_state *memcg_css;
 	struct bdi_writeback *wb;
+	struct bdi_writeback_ctx *bdi_wb_ctx;
 	struct wb_writeback_work *work;
 	unsigned long dirty;
 	int ret;
@@ -1114,7 +1115,11 @@ int cgroup_writeback_by_id(u64 bdi_id, int memcg_id,
 	 * And find the associated wb.  If the wb isn't there already
 	 * there's nothing to flush, don't create one.
 	 */
-	wb = wb_get_lookup(bdi->wb_ctx_arr[0], memcg_css);
+	for_each_bdi_wb_ctx(bdi, bdi_wb_ctx) {
+		wb = wb_get_lookup(bdi_wb_ctx, memcg_css);
+		if (wb)
+			break;
+	}
 	if (!wb) {
 		ret = -ENOENT;
 		goto out_css_put;
-- 
2.25.1



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
