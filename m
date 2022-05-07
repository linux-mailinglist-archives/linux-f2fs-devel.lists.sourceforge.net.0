Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 6565D51E589
	for <lists+linux-f2fs-devel@lfdr.de>; Sat,  7 May 2022 10:17:43 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.94.2)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1nnFdC-0006hZ-Fy; Sat, 07 May 2022 08:17:37 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <changfengnan@vivo.com>) id 1nnFdA-0006hT-Qx
 for linux-f2fs-devel@lists.sourceforge.net; Sat, 07 May 2022 08:17:35 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=MIME-Version:Content-Type:Content-Transfer-Encoding
 :References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=7hUd2iZgKQk80I3fhzy3vagGfsQMoCWWl/zqF5n4Yj8=; b=R7x5j60Mo9vPmH/EB9RFpeoAKg
 XV02h2D7fhj1OwUhQjgXYyX5Oj9t4Io+uTdv6xpzxRcA3nVBMLpkUYW7eADdw0Js0BWC+u+EGIGvB
 oQD9uwXHGfv/Gf2SjsMWHvw2fyUjcado9L2QMhh7In0XtfC8PcORYUDdYuShSD0GBS+I=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=MIME-Version:Content-Type:Content-Transfer-Encoding:References:
 In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=7hUd2iZgKQk80I3fhzy3vagGfsQMoCWWl/zqF5n4Yj8=; b=M+wS8ijqRn5Z5RD6iY6748n+Gv
 0K+sI4YHd3p9UhHo14ApAGGEvTU+auGzCnHAaQrxKG+0yEZMMrz5ZwlKYuNykQ0Cs8I2Ote5NSQEz
 MXQGAOXfMyabqugnthYUf7ik3tqVEYqDf1RUv8ILEOvD4UQ+7vQZMsh+/1ad4goGJE7Q=;
Received: from mail-psaapc01on2131.outbound.protection.outlook.com
 ([40.107.255.131] helo=APC01-PSA-obe.outbound.protection.outlook.com)
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.94.2)
 id 1nnFd9-0003r9-6e
 for linux-f2fs-devel@lists.sourceforge.net; Sat, 07 May 2022 08:17:35 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=jPJExi2H1Oq7g2jv5OJgkQUA7sxi6XchgfQ6n4aNnteOAM2BIF15jQ0xZPXiM2ckxatwCljLtOPnEQWBE0V1haXL99lMFlOn+/OMnoEwHPU/IEUalFsPsAxKFVtso5TMBTx0U4mALgo2LSLIUkDu44R/GIZ4tMsBRoD35mHTLPSV6rqtZpddyU/KZ8AUxuKbzqKhLZZp5LY54pl+NQXaUBceCNXmLtbi0A6eAlL7d00KZHjysdBxgTtWcQwkdCY4PuGVrE2zA9t71Rl07tpXOqW1vnUoDdLxjQCRcEaN1clu0iAdYxHkHXGnslnaKb7d1CKqKbyhPTBu0P9Hbj4MuQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7hUd2iZgKQk80I3fhzy3vagGfsQMoCWWl/zqF5n4Yj8=;
 b=cBpSX1ZABahdpP86EAnI/XKj9MbYRMMkhn6LkjKd2O6H0zSi783y+3zKTs9yid2Q7he1axWQiTV+24afruRUyyK7P4thUaLdqOYdTW6nYQKIh1m5XuV24bTMCPepwDwAxDOMc3w3vj5SOWDxapN5nK8DSytJx4azaMTEFgwSOk24O4WdRrerfy6AI9sU9UR1Xlf6syQpl/giI8iOFGvk+B1q46D2/J++kxbrD/6fq3jIlijsgNRXwDURNGsntFmuIrUfbD3Hx5OupN2ny1W3pqQQq20jlM824SKMygiKsVIrfv0cuqW4JMX97sFGvxuRF7aofadYnnFnVZzib/wREQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vivo.com; dmarc=pass action=none header.from=vivo.com;
 dkim=pass header.d=vivo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vivo0.onmicrosoft.com; 
 s=selector2-vivo0-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7hUd2iZgKQk80I3fhzy3vagGfsQMoCWWl/zqF5n4Yj8=;
 b=FQ/eNUqiHwIJp9IuJdEkxWQMdEqCZL0V7Gst4fqEQfkSQ+SL7Rp/Oxsi19HfMmBhqtUmjn73v4GXHXbd/9Gs6J5ShFlNDziYit1i9PpqkIpUF8c1rw5acjCDuTq/5DZSPyEgdkoy7+0akaMlbeXhfUg6QYdFUHBA4G9YrUTu5LA=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=vivo.com;
Received: from KL1PR0601MB4003.apcprd06.prod.outlook.com (2603:1096:820:26::6)
 by PS2PR06MB2917.apcprd06.prod.outlook.com (2603:1096:300:52::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5227.20; Sat, 7 May
 2022 08:17:20 +0000
Received: from KL1PR0601MB4003.apcprd06.prod.outlook.com
 ([fe80::fc26:a0b5:8bfd:7c02]) by KL1PR0601MB4003.apcprd06.prod.outlook.com
 ([fe80::fc26:a0b5:8bfd:7c02%7]) with mapi id 15.20.5227.021; Sat, 7 May 2022
 08:17:20 +0000
To: jaegeuk@kernel.org,
	chao@kernel.org
Date: Sat,  7 May 2022 16:17:08 +0800
Message-Id: <20220507081710.117162-2-changfengnan@vivo.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220507081710.117162-1-changfengnan@vivo.com>
References: <20220507081710.117162-1-changfengnan@vivo.com>
X-ClientProxiedBy: SI2PR02CA0021.apcprd02.prod.outlook.com
 (2603:1096:4:195::10) To KL1PR0601MB4003.apcprd06.prod.outlook.com
 (2603:1096:820:26::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: f1fff1cf-2018-4de6-130e-08da30020176
X-MS-TrafficTypeDiagnostic: PS2PR06MB2917:EE_
X-Microsoft-Antispam-PRVS: <PS2PR06MB2917DBEBFDF7CD2413E8833BBBC49@PS2PR06MB2917.apcprd06.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 1ZFuQm5mOz38o5yWE1GESzYTNjgRfcPKk7qPMzeIO9jAGNIzsSAWz+fRFes/1IyYHbCspLTmuA8sZ/KMphmJs5g/Ue71HAttcoUh657zkqH8ETnnh3rujT2hL0ZHlCx0/FAqJ8eNbJ+V0zgrnLZcVnEPhdp1FkKVmvZFYWkwxH/6Uu3ZeGvachAtkgTdbbGgGou37REbri2iQ6yXfkov4fYQCRZKH6tK3W9nsrXgmkNmgkLdd4tKRNOYzYlYMHdBsOKAC8Z4XBxAdlpZRcIUlvEl6eHpCptEH+tezicdnnKLzlea5eK/4lePJyrEssa6/dZGQg8z3lpbReEe+b6D2rxmVbLxTWo7qyb0/g6FnMRg6PfloCDf5uIPVar6+vPClPpMEWFB5x4BvmjFVt2Zxv5jSCYHJdjyiKiEd+4pWSsWQRudWH3Q+6NhMSNjFprJL7c91/GNLqz+7YAi63bD9l+rOImiku+imYguzFfNbNFMMxiAZbDihyYP9gITgR/HTT781SehRTe5XCCTS4lUOz/JGQE9JsVCVCjnITNjO9ZEyO7++KJU6AVoe+MEonQzF+p7YtUDqFYNI7oAcbXipUFDmioOah4MJThU5gZOVbqZshW0S74gb3XjPVso0R8EIb/zmlYDJa4f8HNvCRP5PM0xk3ojl4NiMKrRNdkrf9iYt0N+gqVzKJ69pdtyGGrAprkjCs45mGpvGJjDq+KSJg==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:KL1PR0601MB4003.apcprd06.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(4636009)(366004)(52116002)(6486002)(107886003)(83380400001)(66946007)(1076003)(8676002)(66556008)(508600001)(4326008)(8936002)(66476007)(6506007)(186003)(316002)(36756003)(38100700002)(38350700002)(2616005)(6666004)(5660300002)(2906002)(26005)(6512007)(86362001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?nroq/GyNCdevREnbgg300CZmrqKPlNUh/wxFclklnHsLt4DjdFJvPQVYs8g/?=
 =?us-ascii?Q?aIDo2mlG2RLaFDNa49MiRU7qX/1rVhjn8lcUV+LBZfZGgQ8AZ2d4yMap2aUg?=
 =?us-ascii?Q?Z1UCb6FiJVRGBcXbU/snGtNCOopzEA5zUJV0Q8i6QEUNyjLdhyN5eVCmn0mA?=
 =?us-ascii?Q?OlfiqUfkFE6sXZFA2qhMBkdMkmDlFW2nUR3bN7jnjD51KjDTbuQ18Rd7GDoW?=
 =?us-ascii?Q?PD5kewnjXlDV7dwWaj/va/jygCi4m5rvcaDuu/SaJvz2E/eXA6JmDpzaUG6F?=
 =?us-ascii?Q?tBLNcjPa01uSSOi7uK709p/4eC6P0xZ/0vmHhP41nEcPjLnKUyxLggEGOS+L?=
 =?us-ascii?Q?S8xe/iq2LS8AM3A791xR/fqEUoaqPbVzhBXcAsSSk8kM2mxGrdZBNq5o5477?=
 =?us-ascii?Q?7byxwAqTuKJCreHi87Y6ktiLxpkrsGvQVNruM3/Nu4Y+3ItqRzJidUljujXD?=
 =?us-ascii?Q?zMlCRxfCPiaAgnOD6qDUxZwvQQL1AMppEylyHzvB86p+dOitEmmFTjHphL64?=
 =?us-ascii?Q?GncwLrRN28Gjne9x9TEsOMTf+6ipGsk9r70sFXxegMtpYWYDCJIZFGGVbBxR?=
 =?us-ascii?Q?2pR5o6Ay90npiPgkXlUmB9stupsDlKDDAsWgVE0F2cPkSEen3xdHSPz5nAow?=
 =?us-ascii?Q?PWysBWsw4sEdM9po+Qwa4JD1Kk4BulsWoBezqKbDVxwX4TWZencVLF14sxBk?=
 =?us-ascii?Q?0TvLgShuC6sjRdfQpiJcO5nZXWZIZB0uEpNqj2tUTICgj4m8dreqPoFX5c1u?=
 =?us-ascii?Q?NKuNddNHwH543C4BUpO5kK4iXczq6d+UdkRxdGjBjmwHwl+U1pjJ3ObKwIHt?=
 =?us-ascii?Q?2iDqP2Y13qDvYfZUZJ21eKOBpJ66CSRgtEwdZyNVh4gfVoQJXu4vmcOZlA7H?=
 =?us-ascii?Q?Nxc5hgskOpeKFyGqDqrG0rTCEkTTK6ULyg/+q7vDI/7m6vSjX0ARanS9mr1o?=
 =?us-ascii?Q?tD++aK8P/VGQff+ZiipEQPpRUL5bsmtg58TcEVQlN6OZUARbHIB39Rj4t9hf?=
 =?us-ascii?Q?j2ENVqMm6hstPiGcl4qzzkoiKhXI9Lm6JiUFkj/JHwimQjUY1j+nAL1RYZgf?=
 =?us-ascii?Q?Ksc5+r26UDsO2dVle7Qvs0ey7qsWbwwnfO2xBtoXnLuaa9E23pIOGqbcOksg?=
 =?us-ascii?Q?wRvf/W4qXn99dpjpiDg1P/4mVdcOWaRAFPxDzouwYZ6OzbZGVKWBvrV6feHD?=
 =?us-ascii?Q?NIx4Oo6jtWq9v3o2Xav54NrZfY9aVlBj6pcrmovnOEVeiiFslW11yt3unF6c?=
 =?us-ascii?Q?EY1IEbtpW0XPV5kgfJ/Puv3pXOimHQFCWc5fz8AgDYau5M26NIel+MClzaBT?=
 =?us-ascii?Q?32lIeO/hazg3VNqd+wfhoFISW4Lg5E09xfLisW5KS5TJr4KEjQ0t7YV8Q5Uv?=
 =?us-ascii?Q?FEpfeBOObftOMsXaJpoP1u4mqUAIFR0ShXEOtDeNmktK2xHRqZtMjR98F3W1?=
 =?us-ascii?Q?edqiybPr6CCTPKL2tNF3+u6UDEapC2iBph6xjONggNNqqqwuGAbF3sZQ2mtq?=
 =?us-ascii?Q?ReNUpyklam5tQNTPwvgTpofH8GxxlCwkIdbp9pew+JWtAbS3NQBe9JLxLIoe?=
 =?us-ascii?Q?/x9nPBeFYi3N8w0n96Q11aEVN06Sa1eYRge0sYsFjy0y0EkLgbauH3XMvm6p?=
 =?us-ascii?Q?aqryDDmMSDGGSqPdg8UtFoB/FqFPmznPQd/vjp/oC7ITt7KFaXtJ9gfb1EXr?=
 =?us-ascii?Q?ldinNKynYzbk1TMnZrdfJhn498M6SoeoSHW+tChSsVbzpUZX7Acs6swUkLbF?=
 =?us-ascii?Q?XqT05yPFlQ=3D=3D?=
X-OriginatorOrg: vivo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f1fff1cf-2018-4de6-130e-08da30020176
X-MS-Exchange-CrossTenant-AuthSource: KL1PR0601MB4003.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 May 2022 08:17:20.0491 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 923e42dc-48d5-4cbe-b582-1a797a6412ed
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ucMf9YmN7sle6LMsF7DQc7JZfhIsDY18dP2LmzrX3XTE4JQmqKFVQ0/sLRJ13l6ivKOc2JjK3WFK1iYH7VUbjQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PS2PR06MB2917
X-Spam-Score: -0.0 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  When write total cluster, all pages is uptodate, there is
 not need to call f2fs_prepare_compress_overwrite,
 intorduce f2fs_all_cluster_page_ready
 to avoid this. Signed-off-by: Fengnan Chang <changfengnan@vivo.com> ---
 fs/f2fs/compress.c
 | 11 ++++++++--- fs/f2fs/data.c | 9 +++++++-- fs/f2fs/f2fs.h | 4 ++-- 3 files
 changed, 17 insertions(+), 7 deletions(-) 
 Content analysis details:   (-0.0 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [40.107.255.131 listed in wl.mailspike.net]
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
 no trust [40.107.255.131 listed in list.dnswl.org]
 -0.0 SPF_HELO_PASS          SPF: HELO matches SPF record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
X-Headers-End: 1nnFd9-0003r9-6e
Subject: [f2fs-dev] [PATCH v2 1/3] f2fs: intorduce
 f2fs_all_cluster_page_ready
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
From: Fengnan Chang via Linux-f2fs-devel
 <linux-f2fs-devel@lists.sourceforge.net>
Reply-To: Fengnan Chang <changfengnan@vivo.com>
Cc: Fengnan Chang <changfengnan@vivo.com>,
 linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

When write total cluster, all pages is uptodate, there is not need to call
f2fs_prepare_compress_overwrite, intorduce f2fs_all_cluster_page_ready
to avoid this.

Signed-off-by: Fengnan Chang <changfengnan@vivo.com>
---
 fs/f2fs/compress.c | 11 ++++++++---
 fs/f2fs/data.c     |  9 +++++++--
 fs/f2fs/f2fs.h     |  4 ++--
 3 files changed, 17 insertions(+), 7 deletions(-)

diff --git a/fs/f2fs/compress.c b/fs/f2fs/compress.c
index 12a56f9e1572..fd28844aa53f 100644
--- a/fs/f2fs/compress.c
+++ b/fs/f2fs/compress.c
@@ -871,20 +871,25 @@ bool f2fs_cluster_can_merge_page(struct compress_ctx *cc, pgoff_t index)
 	return is_page_in_cluster(cc, index);
 }
 
-bool f2fs_all_cluster_page_loaded(struct compress_ctx *cc, struct pagevec *pvec,
-				int index, int nr_pages)
+bool f2fs_all_cluster_page_ready(struct compress_ctx *cc, struct pagevec *pvec,
+				int index, int nr_pages, bool uptodate)
 {
 	unsigned long pgidx;
 	int i;
 
+	if (uptodate && (pgidx % cc->cluster_size))
+		return false;
+
 	if (nr_pages - index < cc->cluster_size)
 		return false;
 
 	pgidx = pvec->pages[index]->index;
 
-	for (i = 1; i < cc->cluster_size; i++) {
+	for (i = 0; i < cc->cluster_size; i++) {
 		if (pvec->pages[index + i]->index != pgidx + i)
 			return false;
+		if (uptodate && !PageUptodate(pvec->pages[index + i]))
+			return false;
 	}
 
 	return true;
diff --git a/fs/f2fs/data.c b/fs/f2fs/data.c
index 9a1a526f2092..77af65838a7c 100644
--- a/fs/f2fs/data.c
+++ b/fs/f2fs/data.c
@@ -2967,6 +2967,11 @@ static int f2fs_write_cache_pages(struct address_space *mapping,
 				if (!f2fs_cluster_is_empty(&cc))
 					goto lock_page;
 
+				if (f2fs_all_cluster_page_ready(&cc,
+					&pvec, i, nr_pages, true)) {
+					goto lock_page;
+				}
+
 				ret2 = f2fs_prepare_compress_overwrite(
 							inode, &pagep,
 							page->index, &fsdata);
@@ -2977,8 +2982,8 @@ static int f2fs_write_cache_pages(struct address_space *mapping,
 				} else if (ret2 &&
 					(!f2fs_compress_write_end(inode,
 						fsdata, page->index, 1) ||
-					 !f2fs_all_cluster_page_loaded(&cc,
-						&pvec, i, nr_pages))) {
+					 !f2fs_all_cluster_page_ready(&cc,
+						&pvec, i, nr_pages, false))) {
 					retry = 1;
 					break;
 				}
diff --git a/fs/f2fs/f2fs.h b/fs/f2fs/f2fs.h
index 38cbed0f544e..5a33f2d4aee8 100644
--- a/fs/f2fs/f2fs.h
+++ b/fs/f2fs/f2fs.h
@@ -4177,8 +4177,8 @@ void f2fs_end_read_compressed_page(struct page *page, bool failed,
 							block_t blkaddr);
 bool f2fs_cluster_is_empty(struct compress_ctx *cc);
 bool f2fs_cluster_can_merge_page(struct compress_ctx *cc, pgoff_t index);
-bool f2fs_all_cluster_page_loaded(struct compress_ctx *cc, struct pagevec *pvec,
-				int index, int nr_pages);
+bool f2fs_all_cluster_page_ready(struct compress_ctx *cc, struct pagevec *pvec,
+				int index, int nr_pages, bool uptodate);
 bool f2fs_sanity_check_cluster(struct dnode_of_data *dn);
 void f2fs_compress_ctx_add_page(struct compress_ctx *cc, struct page *page);
 int f2fs_write_multi_pages(struct compress_ctx *cc,
-- 
2.35.1



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
