Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id BF5F1BD9403
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 14 Oct 2025 14:10:54 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Subject:References:MIME-Version:In-Reply-To:Message-Id:Date:To:From:Sender:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=LUTneEOOfWsyiEWTnz/FirLxl3A1YP/zfWRfpn9twxM=; b=gvb89WACngyWwccHciSljEaVoZ
	KntD5AiRe2+gDEQq9OVSjIzxMliqYcNa+2lhS/9pU8JbScODK7Cdj6Ky6t+a2gUtrd5zZ6sajBbF6
	tUJ2/Kg2J7urZz0KxduTTuV9ftSH8ioBYHMgrGufccFwaza1MK+7g5O2vV/MhTC7SmnY=;
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1v8drg-00023J-PX;
	Tue, 14 Oct 2025 12:10:53 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <kundan.kumar@samsung.com>) id 1v8drf-000231-6l
 for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 14 Oct 2025 12:10:52 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=References:Content-Type:Content-Transfer-Encoding:
 MIME-Version:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=O2U42LWZMM8201UpxKxW6f/AsVjv4jB1OSfEppuAbYw=; b=eii/jB5VrZiwby91v4MV8d7JQ2
 TywyF+FmiU1dzuOiSR0NFWLIBmdTKaa1c36QrLW1W11rnHOjbgkGmuRmMT3OXC3RlQWABbZMxycgp
 fZyW4toxRuwqNuV5cGBm+W/ZSDaKU8g6NpZm6n0+1Olb9p7JfG93rtkVZnY02oSGamlQ=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=References:Content-Type:Content-Transfer-Encoding:MIME-Version:
 In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=O2U42LWZMM8201UpxKxW6f/AsVjv4jB1OSfEppuAbYw=; b=RSwJZaxBpS4CsQ4loauuxCa6cz
 s2EV3q/UXIB2FfL2eQAL2HnEuTBIHebQlYLgjPVcviP67uJX9TmmIN3QQFHAw+YDzp5TWa0Lx2LqC
 5z55WWQWWAwPplRlUxpnrwSjO9AQFs4YkXO4oZOMVCo0qSg0zEoQ89wIkrcwaUDb/XvY=;
Received: from mailout1.samsung.com ([203.254.224.24])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1v8dre-0001Mc-VA for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 14 Oct 2025 12:10:51 +0000
Received: from epcas5p1.samsung.com (unknown [182.195.41.39])
 by mailout1.samsung.com (KnoxPortal) with ESMTP id
 20251014121039epoutp01670e5450c5966b099372c0ac4f876f28~uWlg7xuTC1133811338epoutp01K
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Tue, 14 Oct 2025 12:10:39 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.samsung.com
 20251014121039epoutp01670e5450c5966b099372c0ac4f876f28~uWlg7xuTC1133811338epoutp01K
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
 s=mail20170921; t=1760443839;
 bh=O2U42LWZMM8201UpxKxW6f/AsVjv4jB1OSfEppuAbYw=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=j4EoRb052CyFlWparM6vJ+IGSCEWjIS6wVo+S87KDQqDA0Ocmw/12pWxJHIIh31zH
 Esi8h9OyxeOyR15xYVX5wm7qtnvdwsg04HJRPmJ/1moWx5u2peXU8xFWHwP0Tb4pM0
 +fUQ0OawY0mVdzW1x06h3YX1hssKOUzItdHKdfpU=
Received: from epsnrtp04.localdomain (unknown [182.195.42.156]) by
 epcas5p4.samsung.com (KnoxPortal) with ESMTPS id
 20251014121038epcas5p4685b828d668366916b45d174d16a3637~uWlgJt7Oo0610406104epcas5p4-;
 Tue, 14 Oct 2025 12:10:38 +0000 (GMT)
Received: from epcas5p1.samsung.com (unknown [182.195.38.95]) by
 epsnrtp04.localdomain (Postfix) with ESMTP id 4cmCj93Ktwz6B9m6; Tue, 14 Oct
 2025 12:10:37 +0000 (GMT)
Received: from epsmtip1.samsung.com (unknown [182.195.34.30]) by
 epcas5p1.samsung.com (KnoxPortal) with ESMTPA id
 20251014121036epcas5p17c607955db032d076daa2e5cfecfe8ea~uWleqppMN1447514475epcas5p1j;
 Tue, 14 Oct 2025 12:10:36 +0000 (GMT)
Received: from localhost.localdomain (unknown [107.99.41.245]) by
 epsmtip1.samsung.com (KnoxPortal) with ESMTPA id
 20251014121032epsmtip1fbff11e9fef5c6232ce81ec58fd0763b~uWlaFqXYA1256112561epsmtip1p;
 Tue, 14 Oct 2025 12:10:31 +0000 (GMT)
From: Kundan Kumar <kundan.kumar@samsung.com>
To: jaegeuk@kernel.org, chao@kernel.org, viro@zeniv.linux.org.uk,
 brauner@kernel.org, jack@suse.cz, miklos@szeredi.hu, agruenba@redhat.com,
 trondmy@kernel.org, anna@kernel.org, akpm@linux-foundation.org,
 willy@infradead.org, mcgrof@kernel.org, clm@meta.com, david@fromorbit.com,
 amir73il@gmail.com, axboe@kernel.dk, hch@lst.de, ritesh.list@gmail.com,
 djwong@kernel.org, dave@stgolabs.net, wangyufei@vivo.com
Date: Tue, 14 Oct 2025 17:38:34 +0530
Message-Id: <20251014120845.2361-6-kundan.kumar@samsung.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20251014120845.2361-1-kundan.kumar@samsung.com>
MIME-Version: 1.0
X-CMS-MailID: 20251014121036epcas5p17c607955db032d076daa2e5cfecfe8ea
X-Msg-Generator: CA
CMS-TYPE: 105P
cpgsPolicy: CPGSC10-542,Y
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20251014121036epcas5p17c607955db032d076daa2e5cfecfe8ea
References: <20251014120845.2361-1-kundan.kumar@samsung.com>
 <CGME20251014121036epcas5p17c607955db032d076daa2e5cfecfe8ea@epcas5p1.samsung.com>
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-1.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  Since we have multiple cgwb per bdi,
 embedded in writeback_ctx now,
 we iterate over all of them to find the associated writeback. Signed-off-by:
 Kundan Kumar <kundan.kumar@samsung.com> Signed-off-by: Anuj Gupta
 <anuj20.g@samsung.com>
 --- fs/fs-writeback.c | 9 +++++++-- 1 file changed, 7 insertions(+),
 2 deletions(-)
 Content analysis details:   (-0.2 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 RCVD_IN_MSPIKE_H3      RBL: Good reputation (+3)
 [203.254.224.24 listed in wl.mailspike.net]
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1v8dre-0001Mc-VA
Subject: [f2fs-dev] [PATCH v2 05/16] writeback: modify bdi_writeback search
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
Cc: linux-nfs@vger.kernel.org, gost.dev@samsung.com, anuj20.g@samsung.com,
 vishak.g@samsung.com, linux-f2fs-devel@lists.sourceforge.net,
 gfs2@lists.linux.dev, linux-mm@kvack.org, linux-fsdevel@vger.kernel.org,
 kundan.kumar@samsung.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

Since we have multiple cgwb per bdi, embedded in writeback_ctx now, we
iterate over all of them to find the associated writeback.

Signed-off-by: Kundan Kumar <kundan.kumar@samsung.com>
Signed-off-by: Anuj Gupta <anuj20.g@samsung.com>
---
 fs/fs-writeback.c | 9 +++++++--
 1 file changed, 7 insertions(+), 2 deletions(-)

diff --git a/fs/fs-writeback.c b/fs/fs-writeback.c
index 56c048e22f72..93f8ea340247 100644
--- a/fs/fs-writeback.c
+++ b/fs/fs-writeback.c
@@ -1090,7 +1090,8 @@ int cgroup_writeback_by_id(u64 bdi_id, int memcg_id,
 {
 	struct backing_dev_info *bdi;
 	struct cgroup_subsys_state *memcg_css;
-	struct bdi_writeback *wb;
+	struct bdi_writeback *wb = NULL;
+	struct bdi_writeback_ctx *bdi_wb_ctx;
 	struct wb_writeback_work *work;
 	unsigned long dirty;
 	int ret;
@@ -1114,7 +1115,11 @@ int cgroup_writeback_by_id(u64 bdi_id, int memcg_id,
 	 * And find the associated wb.  If the wb isn't there already
 	 * there's nothing to flush, don't create one.
 	 */
-	wb = wb_get_lookup(bdi->wb_ctx[0], memcg_css);
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
