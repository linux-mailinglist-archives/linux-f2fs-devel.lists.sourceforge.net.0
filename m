Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id C5F90625E85
	for <lists+linux-f2fs-devel@lfdr.de>; Fri, 11 Nov 2022 16:39:55 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1otW8C-0003wg-N6;
	Fri, 11 Nov 2022 15:39:48 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <frank.li@vivo.com>) id 1otW8A-0003wN-F6
 for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 11 Nov 2022 15:39:46 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=MIME-Version:Content-Type:Content-Transfer-Encoding
 :Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=ZaeKaENs8WG2Pv4U/z3tkmq4mtsLM1KaJvKjIxYvF/w=; b=kIZJCjuILocLLT1C9qp5f4dzVf
 lbSndrcvYyCJQSX0gnBytaEwKWPKnZiKicnSWmsocQew/YGSMloNKHAnW9jaPo7C11Nq+/pbm4C48
 1Q9PQmkgYeNpR57O9N8ADRIGHvrnhu1ospik2K8phMa7m27UQ2lALUAQ0Uwt5fpSCwoQ=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:Date:
 Subject:Cc:To:From:Sender:Reply-To:Content-ID:Content-Description:Resent-Date
 :Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=ZaeKaENs8WG2Pv4U/z3tkmq4mtsLM1KaJvKjIxYvF/w=; b=T
 3C3AU6lqhtbNs8hkxyRdMMzkgCFEqM1rwxGRumgR+r480tw4MWCaIS8yJs+VucHBJZd4HQfzNkqmS
 muLheIZ5tc2K25CKRrNesFcCGxCbvYtbhZQQ38Sasv17ZyQxCSubMcPrxaBasuIwwug1yOdVJk9ba
 VLg+r2E8D0QMKT1M=;
Received: from mail-psaapc01on2136.outbound.protection.outlook.com
 ([40.107.255.136] helo=APC01-PSA-obe.outbound.protection.outlook.com)
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1otW86-0005CN-Ne for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 11 Nov 2022 15:39:46 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=gGphHm2n828ZNRdQUK6n/P0/0qB2Wre9pGMNwwH8z/sHDBmQZOztk0B0nltSQK+EuGpU8+JaP4CLbIKsMiz/HE3vrUP58wqiW9+qG8LCVLu4xbiEScfv97AQ80mCkyOd4Oe6PbgOm0JsaMvfO1VTPVGdXmZFgr5DwonOWvWKAvhbOyjHQCt2UctQ9W810wStYmkvQf+yggicxLwM2SV+NdoFI+QAzlCaer6K1k20uPNU2mro3n9r89N2+cXNlHYMfMdkhHIYfYeWTIlRfbVURHlPz9yienzfBiZqK7IqugF10XMjhk39kjY+FBj5kgfBCQA2whuRSr4sY1y0d5I/NQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ZaeKaENs8WG2Pv4U/z3tkmq4mtsLM1KaJvKjIxYvF/w=;
 b=TsyK15bg9j/dEoWAJ4n2VOnJQnnAMFbLTeBzlaKQ46Yb8xx8OTyDyXRnPGxWVcI1J8wQuaPAT4xqLAz4CMna/0Ksr4Sf4s639NlFj7d4yLx6UvdZE55UJUaAPj3weZlX2KX3jWl8QOw8qRGomDGUVHp0p7G1cfwcDQeP4+CO4hwfiRdkL/USQeCBcL0nJ2/mRd06ng+VrV8Zs7xixKFoVpWNNFy31SXEHCBEZ7Ennevpm4oWLQiBh/+pIJG04++bKECNwVq1zXDUX8le7+cO3yA+JmYxURdSnuwMwQEsYiVs1BeEy0Senj79iqlJHm2YVC/3bnUr9Qg6Gg0qBDjYFg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vivo.com; dmarc=pass action=none header.from=vivo.com;
 dkim=pass header.d=vivo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vivo.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZaeKaENs8WG2Pv4U/z3tkmq4mtsLM1KaJvKjIxYvF/w=;
 b=SYbPUJssgYUq9yk7xY1QTy3jfD0JqcaJul5wb5Q1VzmTEQKyjzphKd8un0oLjV4Bafm4giQ9Ue6eibL47pjeJWCVNvjtdefVy5OHG3pofBIvpBHdnV72lvK0YVEGxXmuqb2oOtO2K/9WG/77sLWZYt+geGGEk1fi+AEELsAeECjMurQibMbrSDIkAKL55xAbCmCQdRy/J4XkjlSeHFwjTbeFn39Hwi+SEIzAKL+7YbELIPyAkU26VbY89ZfilR0lkDRnno4a1Kiy/bQkTZLqXWPR5a1ZTNsz7vf9qtY4daoOa4XFZ420jFxcSjwnBFHlEdsxlzhIfimw5wCl/UTmPw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=vivo.com;
Received: from SEZPR06MB5269.apcprd06.prod.outlook.com (2603:1096:101:78::6)
 by PSAPR06MB4519.apcprd06.prod.outlook.com (2603:1096:301:7a::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5813.13; Fri, 11 Nov
 2022 15:39:32 +0000
Received: from SEZPR06MB5269.apcprd06.prod.outlook.com
 ([fe80::1230:5f04:fe98:d139]) by SEZPR06MB5269.apcprd06.prod.outlook.com
 ([fe80::1230:5f04:fe98:d139%9]) with mapi id 15.20.5813.013; Fri, 11 Nov 2022
 15:39:31 +0000
To: jaegeuk@kernel.org,
	chao@kernel.org
Date: Fri, 11 Nov 2022 23:39:21 +0800
Message-Id: <20221111153921.55694-1-frank.li@vivo.com>
X-Mailer: git-send-email 2.35.1
X-ClientProxiedBy: SG2PR06CA0232.apcprd06.prod.outlook.com
 (2603:1096:4:ac::16) To SEZPR06MB5269.apcprd06.prod.outlook.com
 (2603:1096:101:78::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SEZPR06MB5269:EE_|PSAPR06MB4519:EE_
X-MS-Office365-Filtering-Correlation-Id: 694d581f-d2e0-40bf-0f9c-08dac3faed19
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: CKva0totuSPNUcp89/yCEbPSo9S0ZTjro+lE3ZpI1qP8zybWTMt0TYJqqbZH2l3Xk1vudJhyN8bdS3zcQjYKUB8jwmf2EO0urCVL4XhOc+kLfo/x6QScB/uTQg90D1BBq3n9Xm2SjeFze8NEimivGbw1qc4bM3mCpDRof+Ytl4gTOddYfzTaOxX6Qg/Xk6raNNRu/B1f07V/7QVjeaVZSpGbyCRsGhC37/Qf+Tw8tQ1suWypMZ1d4D0HyWx0cT43MgnWvIPH4SnnMpneIl9DbtAvIYZkefUqJgH1ga1rUfNoCUcWyW+wUq6xz/JjHOVEoeB2LZ9xlZlLQelGuMgmOXA819VS1yYvMmedT3Id3FJy2ysu0V9vvv085kRccPkGnkFD8CzjdG4JS+U09JsBSN6NKf2Omplz+kHkzGFd1bGbffnes8VB9O6kq0JopMWt1/RyeDQ8Q/Sv0XpE684HPlh5ic+zZlgEY0Elx/a3f3im+k6CS2QMy5H+ZtzAYGQj3mT+KYVnsOtXKxKBL+EyLBP+Ij89GVwBu6UKsq2dwSlXlsbt18trG1DP2ZI55e9cVcVH/DsZEY0kj75dXpRTpSUJl9rfki0RVTGnc4Jt30w7WdwxmHgL0deeUJsHmD8Js0xiojTk8O2b3y4hAv8Yo+ANqnPP4G5NHQEyCwfKmwAqyYXe+Lj76FSBuLD+ipABaq8k2FQaMx8+gKSbvMRQbxeOUSvDzjINvI7stiGgHnXuBRe3JyXlTWFrfHtNHNo6
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SEZPR06MB5269.apcprd06.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(4636009)(346002)(136003)(39860400002)(396003)(366004)(376002)(451199015)(478600001)(66556008)(8676002)(6486002)(186003)(66476007)(2616005)(1076003)(8936002)(316002)(5660300002)(66946007)(4326008)(86362001)(6512007)(26005)(6506007)(107886003)(41300700001)(6666004)(52116002)(2906002)(36756003)(83380400001)(38350700002)(38100700002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?IOq6hHnvShy9NLXzo7TiZ1qN5VcTsM2D4M1vbF6n0lw+QES+MpQgW/8t6kKA?=
 =?us-ascii?Q?F9zztyCi4pkxCH4lDkJQphk8h7dQrpr5nuwHiLiuAfY9KNO1R7eM8Lh8TwFn?=
 =?us-ascii?Q?sBOdjrHnhF9XgS89f5RJFQYxkFEE1W6rgHtnOM+tTNcr4c6OoBqEwNBkPWEz?=
 =?us-ascii?Q?BvlKePHmVxy6EikvKkqPj3Q8XrRvCoiN1RUfP7QsQ8pi09EK4WG+DlwLVr67?=
 =?us-ascii?Q?tpV9DLcJRfQmA0pggyqL0Ap2LNp2kHhIgGTZLiz//hjBHu0Xg/9VoliukMhM?=
 =?us-ascii?Q?BKRo4M2StQsevKzaYbuZEkT+Uvf5Uh3Rco76f1mm3OQxHYzgW+yKng9t8SVA?=
 =?us-ascii?Q?CvpYyZQg62I/yP3FEqa75zCjoiXH42l+XEkY0/tWXtTf//6zjj8NAg4u89LT?=
 =?us-ascii?Q?tr9ZzdvEenFBfjZAO0CH7EDGcFsNQNsSKwMyi7IFh8bqfldrAsrTKoH9fHIu?=
 =?us-ascii?Q?/h5/heN+cUPL0D3H/MJesVLVWPYZbiNwvxU/ywguS9ObPiPoIqfJlbdHeSMm?=
 =?us-ascii?Q?kPl1/RbBY6rhMboyKH9/9FLR2pWrJcMfZFR89XdhkDWnj4Jt2ITfnslWxqDb?=
 =?us-ascii?Q?vB7EaOZvyDT++tnkY8AmlXn5CBEJ3C8SbeIjfjeo+SySLcSgT3QWoTVLXuHA?=
 =?us-ascii?Q?lbndMIAniYYMGWBUrs4WTrVIYXl8ql6U94970uXLDf9ZCW/ASylFWkXpLAqC?=
 =?us-ascii?Q?H3ZvCK98vL1JicrU4uSzKrd9px25/6W8fJyr1EPG4ptbwuJKuZhxXa0Yk1v3?=
 =?us-ascii?Q?KytLTW8AK9WnMo5VxzbVworpockHm4tOGb4PLGtNg5YloIzxuZhhHhQ9uU3L?=
 =?us-ascii?Q?18RWnE41yr6h9ZzNuTnNLIJaHj2gbpCM6RjQ8rGiSxdSPpwMatSV1WZAO5E9?=
 =?us-ascii?Q?HM0I6dviU+T8zJBuwPnp2HFaYFGq+EdbPwEB5ujn1lOQ48VixEPFrugjGN/A?=
 =?us-ascii?Q?QFc7kC7Z5qHUNFYPFVjQZ0irCSI+3CzIa7/Y9Cs8AZ1dBF/XDR2QRmz8s7AJ?=
 =?us-ascii?Q?9zLJxr+48iWfhTih6WrYhqreYwKvF1Qr2oxzpXZM132bHHccGDYdoSZQHjnK?=
 =?us-ascii?Q?RC5UOxHHn7qzjglobvfu0ICLv8eznilO2izzB3DA7bpJ45HOARBPFb0we5ac?=
 =?us-ascii?Q?ywTdE4fTkFyZ27fKykKDdnB4ROGq0Jy6m8iNPDikWRHrNrBwun+VyJ16Y9QQ?=
 =?us-ascii?Q?yeXtL/XqdBABQYjipbfJgWbsrEfQjivdzUlgR742lma2BbFky9MUuDjaa5Tc?=
 =?us-ascii?Q?yGIFflp6hWvxbCKrU+m8DYi6Zj4z+axLOcU2a06eLXTdcGf5GU0Xb06/k2Tp?=
 =?us-ascii?Q?0g6OuEckmK8VX+EOvJZ6osRMlsP2NajzNIYhsheLMJNAMM7Ekrg8d2Ihpuvu?=
 =?us-ascii?Q?eKq6GkC30xbLiXF2yId5a/rGTtZpaBD5O5qA23taXPpNgjbm9tEXxL58BdnO?=
 =?us-ascii?Q?Aob7TNFTsHJrOiD+J1fqUgJo59UOYXKG1xE6RrQxTsvkZpdQ61ChGbEKq4OY?=
 =?us-ascii?Q?dErS/18oNQo5XtBRFNEOcpWkOBNoODkwhjWNHYgnlK7N0mHApFkpxheeqBm9?=
 =?us-ascii?Q?vF3sK7T1Echg6ve4RIJnweeg4BRDRZUKVju+U77M?=
X-OriginatorOrg: vivo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 694d581f-d2e0-40bf-0f9c-08dac3faed19
X-MS-Exchange-CrossTenant-AuthSource: SEZPR06MB5269.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Nov 2022 15:39:31.6240 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 923e42dc-48d5-4cbe-b582-1a797a6412ed
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: TewwMT2ntP9jjw/BiQY5lhEow6SKdmWKOejDgZiKAMCnRiLmaRVLTp3GeAFlxVNywGfhl0maF/DLloazcmoLCA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PSAPR06MB4519
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: This patch adds a new proc entry to show discard_plist
 information
 in more detail, which is very helpful to know the discard pend list count
 clearly. Such as: Discard pending list(Show diacrd command count on each
 entry): 0 4943 138 66 29 21 9 8 12 8 4 7 4 6 3 2 0 1 16 1 2 2 0 0 1 0 0 24
 0 1 1 0 0 1 1 0 32 0 1 0 0 0 0 0 0 ...... 
 Content analysis details:   (-0.2 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
 no trust [40.107.255.136 listed in list.dnswl.org]
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [40.107.255.136 listed in wl.mailspike.net]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.0 SPF_HELO_PASS          SPF: HELO matches SPF record
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
X-Headers-End: 1otW86-0005CN-Ne
Subject: [f2fs-dev] [PATCH v3] f2fs: add proc entry to show discard_plist
 info
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
From: Yangtao Li via Linux-f2fs-devel <linux-f2fs-devel@lists.sourceforge.net>
Reply-To: Yangtao Li <frank.li@vivo.com>
Cc: Yangtao Li <frank.li@vivo.com>, linux-kernel@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

This patch adds a new proc entry to show discard_plist
information in more detail, which is very helpful to
know the discard pend list count clearly.

Such as:

Discard pending list(Show diacrd command count on each entry):
0                4943         138          66          29          21           9           8          12
8                   4           7           4           6           3           2           0           1
16                  1           2           2           0           0           1           0           0
24                  0           1           1           0           0           1           1           0
32                  0           1           0           0           0           0           0           0
......

Signed-off-by: Yangtao Li <frank.li@vivo.com>
---
 fs/f2fs/f2fs.h    |  1 +
 fs/f2fs/segment.c | 22 ++++++++++++++++------
 fs/f2fs/sysfs.c   | 29 +++++++++++++++++++++++++++++
 3 files changed, 46 insertions(+), 6 deletions(-)

diff --git a/fs/f2fs/f2fs.h b/fs/f2fs/f2fs.h
index 04ef4cce3d7f..a0226c970cbc 100644
--- a/fs/f2fs/f2fs.h
+++ b/fs/f2fs/f2fs.h
@@ -405,6 +405,7 @@ struct discard_cmd_control {
 	wait_queue_head_t discard_wait_queue;	/* waiting queue for wake-up */
 	unsigned int discard_wake;		/* to wake up discard thread */
 	struct mutex cmd_lock;
+	unsigned int nr_pending[MAX_PLIST_NUM];	/* # of pending discards */
 	unsigned int nr_discards;		/* # of discards in the list */
 	unsigned int max_discards;		/* max. discards to be issued */
 	unsigned int max_discard_request;	/* max. discard request per round */
diff --git a/fs/f2fs/segment.c b/fs/f2fs/segment.c
index aa4be7f25963..72e60d5ee70f 100644
--- a/fs/f2fs/segment.c
+++ b/fs/f2fs/segment.c
@@ -921,6 +921,7 @@ static struct discard_cmd *__create_discard_cmd(struct f2fs_sb_info *sbi,
 	dc->bio_ref = 0;
 	atomic_inc(&dcc->discard_cmd_cnt);
 	dcc->undiscard_blks += len;
+	dcc->nr_pending[plist_idx(len)]++;
 
 	return dc;
 }
@@ -1169,6 +1170,7 @@ static int __submit_discard_cmd(struct f2fs_sb_info *sbi,
 		submit_bio(bio);
 
 		atomic_inc(&dcc->issued_discard);
+		dcc->nr_pending[plist_idx(len)]--;
 
 		f2fs_update_iostat(sbi, NULL, FS_DISCARD, 1);
 
@@ -1210,9 +1212,11 @@ static void __insert_discard_tree(struct f2fs_sb_info *sbi,
 }
 
 static void __relocate_discard_cmd(struct discard_cmd_control *dcc,
-						struct discard_cmd *dc)
+						struct discard_cmd *dc, unsigned int index)
 {
 	list_move_tail(&dc->list, &dcc->pend_list[plist_idx(dc->len)]);
+	dcc->nr_pending[plist_idx(dc->len)]++;
+	dcc->nr_pending[index]--;
 }
 
 static void __punch_discard_cmd(struct f2fs_sb_info *sbi,
@@ -1230,9 +1234,10 @@ static void __punch_discard_cmd(struct f2fs_sb_info *sbi,
 	dcc->undiscard_blks -= di.len;
 
 	if (blkaddr > di.lstart) {
+		block_t old_len = dc->len;
 		dc->len = blkaddr - dc->lstart;
 		dcc->undiscard_blks += dc->len;
-		__relocate_discard_cmd(dcc, dc);
+		__relocate_discard_cmd(dcc, dc, plist_idx(old_len));
 		modified = true;
 	}
 
@@ -1243,11 +1248,12 @@ static void __punch_discard_cmd(struct f2fs_sb_info *sbi,
 					di.lstart + di.len - 1 - blkaddr,
 					NULL, NULL);
 		} else {
+			block_t old_len = dc->len;
 			dc->lstart++;
 			dc->len--;
 			dc->start++;
 			dcc->undiscard_blks += dc->len;
-			__relocate_discard_cmd(dcc, dc);
+			__relocate_discard_cmd(dcc, dc, plist_idx(old_len));
 		}
 	}
 }
@@ -1306,9 +1312,10 @@ static void __update_discard_tree_range(struct f2fs_sb_info *sbi,
 			prev_dc->bdev == bdev &&
 			__is_discard_back_mergeable(&di, &prev_dc->di,
 							max_discard_blocks)) {
+			block_t old_len = prev_dc->di.len;
 			prev_dc->di.len += di.len;
 			dcc->undiscard_blks += di.len;
-			__relocate_discard_cmd(dcc, prev_dc);
+			__relocate_discard_cmd(dcc, prev_dc, plist_idx(old_len));
 			di = prev_dc->di;
 			tdc = prev_dc;
 			merged = true;
@@ -1318,13 +1325,16 @@ static void __update_discard_tree_range(struct f2fs_sb_info *sbi,
 			next_dc->bdev == bdev &&
 			__is_discard_front_mergeable(&di, &next_dc->di,
 							max_discard_blocks)) {
+			block_t old_len = next_dc->di.len;
 			next_dc->di.lstart = di.lstart;
 			next_dc->di.len += di.len;
 			next_dc->di.start = di.start;
 			dcc->undiscard_blks += di.len;
-			__relocate_discard_cmd(dcc, next_dc);
-			if (tdc)
+			__relocate_discard_cmd(dcc, next_dc, plist_idx(old_len));
+			if (tdc) {
+				dcc->nr_pending[plist_idx(tdc->len)]--;
 				__remove_discard_cmd(sbi, tdc);
+			}
 			merged = true;
 		}
 
diff --git a/fs/f2fs/sysfs.c b/fs/f2fs/sysfs.c
index 032c03e09580..2176553f97c9 100644
--- a/fs/f2fs/sysfs.c
+++ b/fs/f2fs/sysfs.c
@@ -1252,6 +1252,32 @@ static int __maybe_unused victim_bits_seq_show(struct seq_file *seq,
 	return 0;
 }
 
+static int __maybe_unused discard_plist_seq_show(struct seq_file *seq,
+						void *offset)
+{
+	struct super_block *sb = seq->private;
+	struct f2fs_sb_info *sbi = F2FS_SB(sb);
+	struct discard_cmd_control *dcc = SM_I(sbi)->dcc_info;
+	int i;
+
+	seq_puts(seq, "Discard pending list(Show diacrd command count on each entry):\n");
+	if (!f2fs_realtime_discard_enable(sbi))
+		return 0;
+
+	for (i = 0; i < MAX_PLIST_NUM; i++) {
+		if (i % 8 == 0)
+			seq_printf(seq, "%-10d", i);
+		seq_printf(seq, " %10d", dcc->nr_pending[i]);
+		if (i % 8 == 7)
+			seq_putc(seq, '\n');
+		else
+			seq_putc(seq, ' ');
+	}
+	seq_putc(seq, '\n');
+
+	return 0;
+}
+
 int __init f2fs_init_sysfs(void)
 {
 	int ret;
@@ -1322,6 +1348,8 @@ int f2fs_register_sysfs(struct f2fs_sb_info *sbi)
 #endif
 		proc_create_single_data("victim_bits", 0444, sbi->s_proc,
 				victim_bits_seq_show, sb);
+		proc_create_single_data("discard_plist", 0444, sbi->s_proc,
+				discard_plist_seq_show, sb);
 	}
 	return 0;
 put_feature_list_kobj:
@@ -1345,6 +1373,7 @@ void f2fs_unregister_sysfs(struct f2fs_sb_info *sbi)
 		remove_proc_entry("segment_info", sbi->s_proc);
 		remove_proc_entry("segment_bits", sbi->s_proc);
 		remove_proc_entry("victim_bits", sbi->s_proc);
+		remove_proc_entry("discard_plist", sbi->s_proc);
 		remove_proc_entry(sbi->sb->s_id, f2fs_proc_root);
 	}
 
-- 
2.25.1



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
