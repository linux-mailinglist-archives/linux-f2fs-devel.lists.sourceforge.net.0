Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id B577D973B1B
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 10 Sep 2024 17:11:20 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1so2WU-0006W0-Q4;
	Tue, 10 Sep 2024 15:11:19 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <joshi.k@samsung.com>) id 1so2WT-0006Vs-Cg
 for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 10 Sep 2024 15:11:18 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=References:Content-Type:Content-Transfer-Encoding:
 MIME-Version:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=Cx4od5b8pH/z+90Z4fWrUdEipftlwMkCWoeWtxKWTrw=; b=KnHrVuHpBnc9zWC6fDfaBhz6mD
 Ia8WsfTwu3nG1OXVcrRkM2AmTnV71OFMYRrFFhUOtzKCzBKfyHqRbyIA1zsqSeqOFVrwJlK0y1TpR
 IQJon6obkdEaWbPCHtR2fCWKaFZ5T944OHDboae2hX3mTrnGz2npZuSJNBqNmBsLHe54=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=References:Content-Type:Content-Transfer-Encoding:MIME-Version:
 In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=Cx4od5b8pH/z+90Z4fWrUdEipftlwMkCWoeWtxKWTrw=; b=gg4Dp1JNrhSvmGXC0ZyKGneey7
 fayc5X+ptG8/2W0gumpmlSqAz/VP0EDMD1RibXvkOEPSYYj1fAieH/8rB3jcIE7qc8qjvx9hmcgms
 Z98mLKzTgpvceiH35oUW8WcKE2zVkL3T+QX1b0aO9IQQjN9nQBYC84ZwMemKez4ox5qo=;
Received: from mailout4.samsung.com ([203.254.224.34])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1so2WS-0006JF-0M for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 10 Sep 2024 15:11:17 +0000
Received: from epcas5p2.samsung.com (unknown [182.195.41.40])
 by mailout4.samsung.com (KnoxPortal) with ESMTP id
 20240910151104epoutp04c0cbdee4eca46beff619cf56ca876cc5~z6qIaO42g1897418974epoutp04o
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Tue, 10 Sep 2024 15:11:04 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout4.samsung.com
 20240910151104epoutp04c0cbdee4eca46beff619cf56ca876cc5~z6qIaO42g1897418974epoutp04o
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
 s=mail20170921; t=1725981064;
 bh=Cx4od5b8pH/z+90Z4fWrUdEipftlwMkCWoeWtxKWTrw=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=tEH0LVYEDUWgmJbiZLMkrGc8noYOXYlKcW6VUF+ihRJmpS92mB42Baz5VMtH+sq6V
 6Hk8qPBF5hB/+XMAypQ5kvt8jQJiwObv7oX8xmxOh938KrIc8KhtX/uaqUv6+XkJDo
 ED7ZSlQkZk4H3mLA5Bzd+RtmcwI/wWV3MvE+hnNU=
Received: from epsnrtp3.localdomain (unknown [182.195.42.164]) by
 epcas5p3.samsung.com (KnoxPortal) with ESMTP id
 20240910151103epcas5p3253379b3a38eaea3aed189624bd0c861~z6qH6ZA8j0202102021epcas5p3o;
 Tue, 10 Sep 2024 15:11:03 +0000 (GMT)
Received: from epsmgec5p1new.samsung.com (unknown [182.195.38.178]) by
 epsnrtp3.localdomain (Postfix) with ESMTP id 4X36bV3Bbhz4x9Pp; Tue, 10 Sep
 2024 15:11:02 +0000 (GMT)
Received: from epcas5p3.samsung.com ( [182.195.41.41]) by
 epsmgec5p1new.samsung.com (Symantec Messaging Gateway) with SMTP id
 2F.86.08855.68160E66; Wed, 11 Sep 2024 00:11:02 +0900 (KST)
Received: from epsmtrp2.samsung.com (unknown [182.195.40.14]) by
 epcas5p1.samsung.com (KnoxPortal) with ESMTPA id
 20240910151101epcas5p1c4e90f7334125fc49106d58d43cffcec~z6qGHmfzO1123511235epcas5p1F;
 Tue, 10 Sep 2024 15:11:01 +0000 (GMT)
Received: from epsmgmcp1.samsung.com (unknown [182.195.42.82]) by
 epsmtrp2.samsung.com (KnoxPortal) with ESMTP id
 20240910151101epsmtrp2c76da231088379ef89540de084989473~z6qGGk5730449204492epsmtrp2y;
 Tue, 10 Sep 2024 15:11:01 +0000 (GMT)
X-AuditID: b6c32a44-107ff70000002297-0b-66e06186e7d6
Received: from epsmtip2.samsung.com ( [182.195.34.31]) by
 epsmgmcp1.samsung.com (Symantec Messaging Gateway) with SMTP id
 89.F3.19367.58160E66; Wed, 11 Sep 2024 00:11:01 +0900 (KST)
Received: from localhost.localdomain (unknown [107.99.41.245]) by
 epsmtip2.samsung.com (KnoxPortal) with ESMTPA id
 20240910151057epsmtip2777beeea22e07b64173647c11eb57f55~z6qB_xFoG1829618296epsmtip2D;
 Tue, 10 Sep 2024 15:10:57 +0000 (GMT)
From: Kanchan Joshi <joshi.k@samsung.com>
To: axboe@kernel.dk, kbusch@kernel.org, hch@lst.de, sagi@grimberg.me,
 martin.petersen@oracle.com, James.Bottomley@HansenPartnership.com,
 brauner@kernel.org, viro@zeniv.linux.org.uk, jack@suse.cz,
 jaegeuk@kernel.org, jlayton@kernel.org, chuck.lever@oracle.com,
 bvanassche@acm.org
Date: Tue, 10 Sep 2024 20:32:00 +0530
Message-Id: <20240910150200.6589-6-joshi.k@samsung.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240910150200.6589-1-joshi.k@samsung.com>
MIME-Version: 1.0
X-Brightmail-Tracker: H4sIAAAAAAAAA01Ta1BUZRie75zds2ephcPCygem0jZlYMCuwfrhgDaJdcqmwcphuhhsu4fL
 LHt220saUTJeQKVEoRCWBMZB2BACuQmsEGJEQIIhI5cSQRYMGAJZGsdQaNlF89/zPt/zvO88
 7zcviQv/JXzIBNbA6Fh5ophw4dRd8fMLSJWPxEo6+13R+ZsZBJq+Mg9Q9tx9HC3fvIOhwZYG
 DP1wvg1DDcXlPJR3+hCGrBUmHF3IINHYnzYeul9cykNtyzMEymy9AVDT0CbUe/Z1dKmpg4MK
 isd5KL2/nkAl7UsYqlsswNGP07Mc1POwnYt6TN/zXoH09b5ddM/wBQ6dndlJ0NevGumq0mME
 XV10gLYU2jDaMphC0HfHhzj0iZpSQP9W+DOPtlWtp6usM1ik4ANVWDwjVzI6X4ZVaJQJbFy4
 eNe70TuiQ2QSaYA0FG0R+7JyNRMujngrMuC1hER7erHvZ/JEo52KlOv14qBtYTqN0cD4xmv0
 hnAxo1UmaoO1gXq5Wm9k4wJZxrBVKpFsDrELY1Txh2t8tZMh+++llvNSQM+m44BPQioYfptj
 xY8DF1JIWQAc6F8mnMU8gD91j4DHha27DjyyXKxN4zgfGgBs6qhaVdkANJtT7c1IkqD84LUs
 4wrvSeVj8JdrbQ4RTg1h0DJpdrTyoCQws2SYt4I51POwZPi2AwuoLfDyyfnVcRtgbu89B8+n
 ELxTUoY5Ne6wI9fKWcG4XXOoNs+RAlJZfHiwuXPVHAEPmmyEE3vAqfYanhP7QNvfTau8Co7c
 HuE4cTKsrz7BdeLtMOXBAHclDW5PU9EY5JzlCr9ZtGIrNKQE8Giq0Kl+Fg5njq86veBoThHX
 KaGhxfyMcz/pAI6OZXFPgg2mJxKYnkhg+n9YIcBLgTej1avjGEWIVsoy+x5/rEKjrgKOI/CP
 qAcDBUuBrQAjQSuAJC72FGRsG44VCpTyz5MYnSZaZ0xk9K0gxL7iU7iPSKGxXxFriJYGh0qC
 ZTJZcOjLMqnYSzB95IxSSMXJDYyKYbSM7pEPI/k+KZjwXHvx4CdvRx3e+sKU6OhcaYM/bcy7
 kfSpkcjevp/zID0tyl01kWO1baw1NKfudQmXvjk61fjeZs9fu/h/fPT+ua/+2quar3d1cwvV
 tRQKlhuPhB74YoIlTkksgwvNfnsWq8fPlE1K1HMSPvtU+aU1Hv7rdn6ZC/zNyTHdz1V2zTX+
 3tK31HH26s7YsTHRh71kgOh0tehrsnVmTWFFf1qlKz43u5unku5zeYhd9gLviF6dWH8sivou
 LCZfyXbtjunj3jrK3/PGdOUAUzbtljxqeWljiUIfcPeWW/zaot6gMZ6AmHXJ92Y9MhdcZZhS
 4i1QvGh++p809cLHSevcG9dmX5SKOfp4udQf1+nl/wGQfpnQjQQAAA==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFtrJIsWRmVeSWpSXmKPExsWy7bCSvG5r4oM0gy2rlSxW3+1ns3h9+BOj
 xbQPP5kt/t99zmRx88BOJouVq48yWexctpbdYvb0ZiaLJ+tnMVts7OeweHznM7vFz2Wr2C2O
 /n/LZjHp0DVGi723tC0uLXK32LP3JIvF/GVP2S26r+9gs1h+/B+Txbbf85kt1r1+z2Jx/u9x
 Vovzs+awO0h4XL7i7XH+3kYWj2mTTrF5XD5b6rFpVSebx+Yl9R67F3xm8th9s4HN4+PTWywe
 fVtWMXqcWXCE3ePzJjmPTU/eMgXwRnHZpKTmZJalFunbJXBltGxRKHhpWvG9bS17A+N57S5G
 Tg4JAROJ7VvbWboYuTiEBLYzSrxoe8oKkRCXaL72gx3CFpZY+e85O0TRR0aJ6WtWM3cxcnCw
 CWhKXJhcClIjIrCOSWLFNB+QGmaBZ0wSd2dvYQJJCAsYSExafg9sEIuAqsTye4/AbF4Bc4mD
 Ez4xQiyQl5h56TtYnFPAQuL58jVgvUJANR/6F7BC1AtKnJz5hAXEZgaqb946m3kCo8AsJKlZ
 SFILGJlWMYqmFhTnpucmFxjqFSfmFpfmpesl5+duYgTHrlbQDsZl6//qHWJk4mA8xCjBwawk
 wttvdy9NiDclsbIqtSg/vqg0J7X4EKM0B4uSOK9yTmeKkEB6YklqdmpqQWoRTJaJg1OqgSnz
 q6KXTX7ejmP+JmueR4oZHPr28srUS75eM3NlGZbUTGljT0psjJ5a+bOwTjGdszZF/fSL5v8/
 13ep5Srlrvjf0Hah8YZmYo5EY7h2SahwSMflpHefd/U/ObZZ72NC4l7G6oPuOuYC725J2u8r
 fsJbbb9XTTj007m2SvMznvNaGnvC6nbN2li7Q9bR2ezNCwG3Q1fmfdqVoOp+f86cIkU31VtS
 ORJHmj7bOHj1nJ558/XGnGkXf+q1rEr8vNzo8vWJIb1M7fe2uOsZXjuycONGmVOXQrIKJFk9
 V97eezH2e0kMq9T02p6Xi1ov7jPJzZ/yIEaz0Tz++srlH7vT7jalHhOQSr526amAae9kCSWW
 4oxEQy3mouJEAD1N3XNMAwAA
X-CMS-MailID: 20240910151101epcas5p1c4e90f7334125fc49106d58d43cffcec
X-Msg-Generator: CA
CMS-TYPE: 105P
DLP-Filter: Pass
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20240910151101epcas5p1c4e90f7334125fc49106d58d43cffcec
References: <20240910150200.6589-1-joshi.k@samsung.com>
 <CGME20240910151101epcas5p1c4e90f7334125fc49106d58d43cffcec@epcas5p1.samsung.com>
X-Spam-Score: -2.6 (--)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  Flexible Data Placement (FDP), as ratified in TP 4146a,
 allows
 the host to control the placement of logical blocks so as to reduce the SSD
 WAF. Userspace can send the data placement information using the write hints.
 Fetch the placement-identifiers if the device supports FDP. 
 Content analysis details:   (-2.6 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -2.3 RCVD_IN_DNSWL_MED      RBL: Sender listed at https://www.dnswl.org/,
 medium trust [203.254.224.34 listed in list.dnswl.org]
 0.0 RCVD_IN_MSPIKE_H3      RBL: Good reputation (+3)
 [203.254.224.34 listed in wl.mailspike.net]
 0.0 SPF_NONE               SPF: sender does not publish an SPF Record
 -0.0 SPF_HELO_PASS          SPF: HELO matches SPF record
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
 -0.1 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1so2WS-0006JF-0M
Subject: [f2fs-dev] [PATCH v5 5/5] nvme: enable FDP support
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
Cc: Hui Qi <hui81.qi@samsung.com>, vishak.g@samsung.com,
 linux-scsi@vger.kernel.org, gost.dev@samsung.com,
 linux-nvme@lists.infradead.org, linux-f2fs-devel@lists.sourceforge.net,
 linux-block@vger.kernel.org, linux-fsdevel@vger.kernel.org,
 javier.gonz@samsung.com, Nitesh Shetty <nj.shetty@samsung.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

Flexible Data Placement (FDP), as ratified in TP 4146a, allows the host
to control the placement of logical blocks so as to reduce the SSD WAF.

Userspace can send the data placement information using the write hints.
Fetch the placement-identifiers if the device supports FDP.

The incoming placement hint is mapped to a placement-identifier, which
in turn is set in the DSPEC field of the write command.

Signed-off-by: Kanchan Joshi <joshi.k@samsung.com>
Signed-off-by: Nitesh Shetty <nj.shetty@samsung.com>
Signed-off-by: Hui Qi <hui81.qi@samsung.com>
Acked-by: Keith Busch <kbusch@kernel.org>
---
 drivers/nvme/host/core.c | 81 ++++++++++++++++++++++++++++++++++++++++
 drivers/nvme/host/nvme.h |  4 ++
 include/linux/nvme.h     | 19 ++++++++++
 3 files changed, 104 insertions(+)

diff --git a/drivers/nvme/host/core.c b/drivers/nvme/host/core.c
index cb846521a77f..5fee63dbb80b 100644
--- a/drivers/nvme/host/core.c
+++ b/drivers/nvme/host/core.c
@@ -44,6 +44,20 @@ struct nvme_ns_info {
 	bool is_removed;
 };
 
+struct nvme_fdp_ruh_status_desc {
+	u16 pid;
+	u16 ruhid;
+	u32 earutr;
+	u64 ruamw;
+	u8  rsvd16[16];
+};
+
+struct nvme_fdp_ruh_status {
+	u8  rsvd0[14];
+	__le16 nruhsd;
+	struct nvme_fdp_ruh_status_desc ruhsd[];
+};
+
 unsigned int admin_timeout = 60;
 module_param(admin_timeout, uint, 0644);
 MODULE_PARM_DESC(admin_timeout, "timeout in seconds for admin commands");
@@ -657,6 +671,7 @@ static void nvme_free_ns_head(struct kref *ref)
 	ida_free(&head->subsys->ns_ida, head->instance);
 	cleanup_srcu_struct(&head->srcu);
 	nvme_put_subsystem(head->subsys);
+	kfree(head->plids);
 	kfree(head);
 }
 
@@ -959,6 +974,17 @@ static bool nvme_valid_atomic_write(struct request *req)
 	return true;
 }
 
+static inline void nvme_assign_placement_id(struct nvme_ns *ns,
+					struct request *req,
+					struct nvme_command *cmd)
+{
+	u8 h = umin(ns->head->nr_plids - 1,
+				WRITE_PLACEMENT_HINT(req->write_hint));
+
+	cmd->rw.control |= cpu_to_le16(NVME_RW_DTYPE_DPLCMT);
+	cmd->rw.dsmgmt |= cpu_to_le32(ns->head->plids[h] << 16);
+}
+
 static inline blk_status_t nvme_setup_rw(struct nvme_ns *ns,
 		struct request *req, struct nvme_command *cmnd,
 		enum nvme_opcode op)
@@ -1078,6 +1104,8 @@ blk_status_t nvme_setup_cmd(struct nvme_ns *ns, struct request *req)
 		break;
 	case REQ_OP_WRITE:
 		ret = nvme_setup_rw(ns, req, cmd, nvme_cmd_write);
+		if (!ret && ns->head->nr_plids)
+			nvme_assign_placement_id(ns, req, cmd);
 		break;
 	case REQ_OP_ZONE_APPEND:
 		ret = nvme_setup_rw(ns, req, cmd, nvme_cmd_zone_append);
@@ -2114,6 +2142,52 @@ static int nvme_update_ns_info_generic(struct nvme_ns *ns,
 	return ret;
 }
 
+static int nvme_fetch_fdp_plids(struct nvme_ns *ns, u32 nsid)
+{
+	struct nvme_command c = {};
+	struct nvme_fdp_ruh_status *ruhs;
+	struct nvme_fdp_ruh_status_desc *ruhsd;
+	int size, ret, i;
+
+refetch_plids:
+	size = struct_size(ruhs, ruhsd, ns->head->nr_plids);
+	ruhs = kzalloc(size, GFP_KERNEL);
+	if (!ruhs)
+		return -ENOMEM;
+
+	c.imr.opcode = nvme_cmd_io_mgmt_recv;
+	c.imr.nsid = cpu_to_le32(nsid);
+	c.imr.mo = 0x1;
+	c.imr.numd =  cpu_to_le32((size >> 2) - 1);
+
+	ret = nvme_submit_sync_cmd(ns->queue, &c, ruhs, size);
+	if (ret)
+		goto out;
+
+	if (!ns->head->nr_plids) {
+		ns->head->nr_plids = le16_to_cpu(ruhs->nruhsd);
+		ns->head->nr_plids =
+			min_t(u16, ns->head->nr_plids, NVME_MAX_PLIDS);
+
+		if (!ns->head->nr_plids)
+			goto out;
+
+		kfree(ruhs);
+		goto refetch_plids;
+	}
+	ns->head->plids = kzalloc(ns->head->nr_plids * sizeof(u16), GFP_KERNEL);
+	if (!ns->head->plids)
+		return -ENOMEM;
+
+	for (i = 0; i < ns->head->nr_plids; i++) {
+		ruhsd = &ruhs->ruhsd[i];
+		ns->head->plids[i] = le16_to_cpu(ruhsd->pid);
+	}
+out:
+	kfree(ruhs);
+	return ret;
+}
+
 static int nvme_update_ns_info_block(struct nvme_ns *ns,
 		struct nvme_ns_info *info)
 {
@@ -2205,6 +2279,13 @@ static int nvme_update_ns_info_block(struct nvme_ns *ns,
 		if (ret && !nvme_first_scan(ns->disk))
 			goto out;
 	}
+	if (ns->ctrl->ctratt & NVME_CTRL_ATTR_FDPS) {
+		ret = nvme_fetch_fdp_plids(ns, info->nsid);
+		if (ret)
+			dev_warn(ns->ctrl->device,
+				"FDP failure status:0x%x\n", ret);
+	}
+
 
 	ret = 0;
 out:
diff --git a/drivers/nvme/host/nvme.h b/drivers/nvme/host/nvme.h
index c717c051c6fd..e7fe39598507 100644
--- a/drivers/nvme/host/nvme.h
+++ b/drivers/nvme/host/nvme.h
@@ -449,6 +449,8 @@ struct nvme_ns_ids {
 	u8	csi;
 };
 
+#define NVME_MAX_PLIDS   (MAX_PLACEMENT_HINT_VAL  + 1)
+
 /*
  * Anchor structure for namespaces.  There is one for each namespace in a
  * NVMe subsystem that any of our controllers can see, and the namespace
@@ -470,6 +472,8 @@ struct nvme_ns_head {
 	struct kref		ref;
 	bool			shared;
 	bool			passthru_err_log_enabled;
+	u16			nr_plids;
+	u16			*plids;
 	struct nvme_effects_log *effects;
 	u64			nuse;
 	unsigned		ns_id;
diff --git a/include/linux/nvme.h b/include/linux/nvme.h
index b58d9405d65e..a954eaee5b0f 100644
--- a/include/linux/nvme.h
+++ b/include/linux/nvme.h
@@ -275,6 +275,7 @@ enum nvme_ctrl_attr {
 	NVME_CTRL_ATTR_HID_128_BIT	= (1 << 0),
 	NVME_CTRL_ATTR_TBKAS		= (1 << 6),
 	NVME_CTRL_ATTR_ELBAS		= (1 << 15),
+	NVME_CTRL_ATTR_FDPS		= (1 << 19),
 };
 
 struct nvme_id_ctrl {
@@ -843,6 +844,7 @@ enum nvme_opcode {
 	nvme_cmd_resv_register	= 0x0d,
 	nvme_cmd_resv_report	= 0x0e,
 	nvme_cmd_resv_acquire	= 0x11,
+	nvme_cmd_io_mgmt_recv	= 0x12,
 	nvme_cmd_resv_release	= 0x15,
 	nvme_cmd_zone_mgmt_send	= 0x79,
 	nvme_cmd_zone_mgmt_recv	= 0x7a,
@@ -864,6 +866,7 @@ enum nvme_opcode {
 		nvme_opcode_name(nvme_cmd_resv_register),	\
 		nvme_opcode_name(nvme_cmd_resv_report),		\
 		nvme_opcode_name(nvme_cmd_resv_acquire),	\
+		nvme_opcode_name(nvme_cmd_io_mgmt_recv),	\
 		nvme_opcode_name(nvme_cmd_resv_release),	\
 		nvme_opcode_name(nvme_cmd_zone_mgmt_send),	\
 		nvme_opcode_name(nvme_cmd_zone_mgmt_recv),	\
@@ -1015,6 +1018,7 @@ enum {
 	NVME_RW_PRINFO_PRCHK_GUARD	= 1 << 12,
 	NVME_RW_PRINFO_PRACT		= 1 << 13,
 	NVME_RW_DTYPE_STREAMS		= 1 << 4,
+	NVME_RW_DTYPE_DPLCMT		= 2 << 4,
 	NVME_WZ_DEAC			= 1 << 9,
 };
 
@@ -1102,6 +1106,20 @@ struct nvme_zone_mgmt_recv_cmd {
 	__le32			cdw14[2];
 };
 
+struct nvme_io_mgmt_recv_cmd {
+	__u8			opcode;
+	__u8			flags;
+	__u16			command_id;
+	__le32			nsid;
+	__le64			rsvd2[2];
+	union nvme_data_ptr	dptr;
+	__u8			mo;
+	__u8			rsvd11;
+	__u16			mos;
+	__le32			numd;
+	__le32			cdw12[4];
+};
+
 enum {
 	NVME_ZRA_ZONE_REPORT		= 0,
 	NVME_ZRASF_ZONE_REPORT_ALL	= 0,
@@ -1822,6 +1840,7 @@ struct nvme_command {
 		struct nvmf_auth_receive_command auth_receive;
 		struct nvme_dbbuf dbbuf;
 		struct nvme_directive_cmd directive;
+		struct nvme_io_mgmt_recv_cmd imr;
 	};
 };
 
-- 
2.25.1



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
