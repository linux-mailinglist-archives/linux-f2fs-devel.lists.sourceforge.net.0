Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id E89E960F6CD
	for <lists+linux-f2fs-devel@lfdr.de>; Thu, 27 Oct 2022 14:08:39 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1oo1gX-0006RL-Nz;
	Thu, 27 Oct 2022 12:08:33 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <frank.li@vivo.com>) id 1oo1gW-0006Qu-55
 for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 27 Oct 2022 12:08:32 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=MIME-Version:Content-Type:Content-Transfer-Encoding
 :Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=+YtFBksY2m45tgD3PKbTXJC+mVQ36+UJNFhpAC0UhIU=; b=IvNikfxEx7bBoof4sF445o6Tsr
 WetX8FvmS1JFahHBdq/Lk6rKibpksEbEUSljJOkCHxk0iCCnK5EbTa1JwUAlegoMyhMYlb1ERpUPA
 Hz3HcOAD6EdTvVVnS+8AhgO3Gld9WHYWB7T57heqAwqMA9MgJkL2PhvIT74BbDPbeh90=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:Date:
 Subject:Cc:To:From:Sender:Reply-To:Content-ID:Content-Description:Resent-Date
 :Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=+YtFBksY2m45tgD3PKbTXJC+mVQ36+UJNFhpAC0UhIU=; b=b
 BgQSZv3A2oIC4Bzp1UcnxSci4L/bDSS6khqEOADlSLodqIiWpNokSkzVp4tM/i90SYKXMg3nvLt8t
 OoRs7aQ050890roG1K0rdHrHiVJjSsSrlGxI9hTp+sthYWSuC/58bd4qACoXrGQ2YTrivAlm7niMb
 nh2eBglq1I3yPVIk=;
Received: from mail-sgaapc01on2122.outbound.protection.outlook.com
 ([40.107.215.122] helo=APC01-SG2-obe.outbound.protection.outlook.com)
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1oo1gQ-00054b-SO for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 27 Oct 2022 12:08:32 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=gbg/8c0H5LKQTL5yTaJoMnzvYdPoNVYAfZLHkstV/X2WvQsnkmxKWYSLPkTGUlSooHHN6bXlTdzER64z0d6PmNqzousbAV2tnCcbasVMJbOlrZ0X7ZRShCrjGl0g3MocICYzk/nmRy4qzbWw++Y+w6haiqZy1jKgythdz1RdmH6NWOtYghHZeAERmcQu5WOfMgkbLdxT6H40LeJ2jWG1h9ynZhiqF5LQMfScijqSutkyQOWji97rJVTZ1HT1CkMdBTQraWnSSKtSMN0VRaX4Mr2eo5RnJc6I9S4dB/5un68jfY1DrOH6cH9nzzHk3Zg3r59784AOWHZPdyJ2Fy4bUg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+YtFBksY2m45tgD3PKbTXJC+mVQ36+UJNFhpAC0UhIU=;
 b=oepfvvkEUD64sOEeuAux1WEsFmjJR/QASHpXAu4kQtClY/VlsBb7kohexL/PZxY7/aUCcUNLliScn/daur4DuW53OZMckNP/evL6M/dymH93h+7AjS2Xrm8FgwLdesNvvxBYvPXIjbRZw6nwM7Q8baxmzeoOh+5LvhZBYjxGNGB32MQKwi863jlYhahKpDAG+QviZZPwg4AT/xBpqGDyBCZ7bfhRTEvGW+HFUwELX+K5LLcNWQ5xGM06MADNhkQBK0DmjjlI4w5wyrP/NaoaZr240AvD2UKt8pkUOejhqSSd9CLjp+GHXKLhb3WrjcH27maJ2wo7kC7eXB+m07BHCw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vivo.com; dmarc=pass action=none header.from=vivo.com;
 dkim=pass header.d=vivo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vivo.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+YtFBksY2m45tgD3PKbTXJC+mVQ36+UJNFhpAC0UhIU=;
 b=a9M3bWpMnlXK0uxCVZKBFfYniltp0YTAXMys8jylO4+H1woRzAg12c8sPMF6hrxn6BQl2SEKjfEhyBQce5p+5KWcUc+WZ6PEbXYpkyxUmtKKNyfjdrfG9/HVn3LqppFqV7x8xdIUvWmgNsLdEwUDVvuv10+DaAyXxOGa08ll7Dj02OaYSSoKY7XND9MwQAOW8M3klQauvej3LV0Izu13BNLp6kGDekWBR7BRqDdDN4r3WWOVBym8UzntYM1h8ao/opiqAhmxptbD2fsDI/dvCYxQQe9tvviy3svEGkgqUJLlBMFYpEF0M7OLjlQAQyWa15T04mwNM5EdZ9vvgxm1Jg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=vivo.com;
Received: from SEZPR06MB5269.apcprd06.prod.outlook.com (2603:1096:101:78::6)
 by KL1PR0601MB4468.apcprd06.prod.outlook.com (2603:1096:820:73::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5746.28; Thu, 27 Oct
 2022 12:08:18 +0000
Received: from SEZPR06MB5269.apcprd06.prod.outlook.com
 ([fe80::c84b:5a6c:d66f:c0fd]) by SEZPR06MB5269.apcprd06.prod.outlook.com
 ([fe80::c84b:5a6c:d66f:c0fd%3]) with mapi id 15.20.5746.023; Thu, 27 Oct 2022
 12:08:18 +0000
To: jaegeuk@kernel.org,
	chao@kernel.org
Date: Thu, 27 Oct 2022 20:08:05 +0800
Message-Id: <20221027120807.6337-1-frank.li@vivo.com>
X-Mailer: git-send-email 2.35.1
X-ClientProxiedBy: SG2PR01CA0187.apcprd01.prod.exchangelabs.com
 (2603:1096:4:189::12) To SEZPR06MB5269.apcprd06.prod.outlook.com
 (2603:1096:101:78::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SEZPR06MB5269:EE_|KL1PR0601MB4468:EE_
X-MS-Office365-Filtering-Correlation-Id: 6a795a56-99e9-4dbd-06cc-08dab813eedc
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: b9z7lCcxZT0ejF9rp4ip75V7Mqwbch4efHFEsYXClSKhPnYiUiIZfXAttwUYkJapHNDmTyYMp4v6Cglp1OiY1c7UhwUDZDc3d7mESpKKci0KtZ6NIWdpAFZzFaYQDrhf2qBRGdyQGMhdLJg71nFHobnEpbmWsmjLzcoG7SjbJ2Bn+5UIPk+fpm6ZFeP5dSL4t2MWBQlSmxIXIYlRVel23BpdPA8ahD8rIBFGIb2U9320P/n8UZHxCGvEj9W7Hd1FOOnH0pUJNxaiQ3MrhheTZpksSdvRwQbCJfmG9Qzlfg+5pXOo5qRG9Is8Sa135M2rV9IhHUq/Xbfdf09S7nmWpuFGSnIsumq4oAfD/Uz8/wskUZAF4aEYDi5TNYKOdzl/jwLJ+52t/TnoUCw2XPHGiwGvg5y0wtyshdgHhUiohT15SPZDau3UOX+Ozww3u7zuxKiaatLPR3g7ZPQFocY4H842DBFDZUt2vZcfT5Y43oyIVp7mKiSF7NXYjKWMtuEvFmK7UP3TVoaqbKgNnpsO/tsLp4uqOBjMlL203JBhArXtK/X+7SFZqNxhQaiJm3O2qkAEgX0CmMcDRQUWPe/NPYH8V8eYu6lbMlEKCZGi5eP6eAfHFutajR8zcfRvKv4LD1FP0BGric/7ExfALPuUn3G+QGW303GvXCSyDI3X9wTF77ot3R0AszSkFszdVl01ySYvSpjPYzQ9nBL9oyG1mz6S6+BEnK/dlH0G3SqIRkJTBMgfZYOgej4XY+kUAWJkuskuRCupqxzSRehuvqhRVg==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SEZPR06MB5269.apcprd06.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(4636009)(346002)(39860400002)(396003)(376002)(366004)(136003)(451199015)(36756003)(186003)(1076003)(6486002)(52116002)(83380400001)(6506007)(6666004)(478600001)(107886003)(2616005)(5660300002)(8936002)(66556008)(4326008)(26005)(38350700002)(38100700002)(316002)(6512007)(41300700001)(2906002)(66476007)(8676002)(86362001)(66946007);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?3f8JQ4tu6Yha8D3F0WNv384iSNrgtijNsSCvkqFnVoy64YF5oqCqveiJ3625?=
 =?us-ascii?Q?2DOuJ2S8SLURQrNzh24cCb4OFqmn6p2LmbE9EYoQll7oMcGQi0jKuZAPUcEC?=
 =?us-ascii?Q?cQSNL8zzcvvu4Whe1lxFWa/hzzot41KnzZz4+npsrhRPA1t5mLHz66FRcTym?=
 =?us-ascii?Q?eV1ineO9BDIR5N0ExIfY2FkZvTmy7mjStR/3ksCvkbwXgVkRP2PK7k3ZzeDW?=
 =?us-ascii?Q?97Av41ofBhHx7pkaXYt9Pv30mO489WAr/OQ/qnMWpIecvzvAV4kjpPXb6U9a?=
 =?us-ascii?Q?5O3X3zigInMg/WQqk6+omLyZseySruPK7qN3XDgsLvCKkbML6Ms58v4BZvHL?=
 =?us-ascii?Q?zMSjR39JTbbs30wE8xHq3bDGW5M6p9FdKFxVZebO9oTpa7FWCHwB1ujfC/RO?=
 =?us-ascii?Q?HUWkq4wwUVdqMaFS8A5J9CkPpUoDE+71AU5XrO2oRd0TeX8NVYdj38iww3tp?=
 =?us-ascii?Q?JmrgTPpQHUyMNTSxP9F5UWxvIc751sdiCDNE5nd+oRI8JjKBPAjigAlqZVvh?=
 =?us-ascii?Q?JVOd+hw+5VrSCW3bqKwkyRNZSwKTYfqciL28Jpwxh1/BhSfr7pVi0++cZ0ND?=
 =?us-ascii?Q?L1TbqHN9/WizYRYAO2+t+PohcLZtvv+6uGt0ruMdxwFoU71ucZJcDZKd64a4?=
 =?us-ascii?Q?OU2LHBk/9jdCC21Sru78H8LpQ3fOfpxt8ldaHhTbICpRz8SoMOBG+tKfLbg6?=
 =?us-ascii?Q?CJw10kVcmpEr2YIMzVvaWuAaKnQk7o0dL7rTGIUYbTJvBEazKKO4akTwNuEz?=
 =?us-ascii?Q?+iHrn6hDBDHlUifpyzVrkWiOOaspb77xqzgB5oTAWKvPmPbiSiQackaSa6sY?=
 =?us-ascii?Q?w9eckUaqqgHZ3dJ+GbqR/kJkAP25tIr6myUjmfgmERZeoJVcE6pyLwc6oltO?=
 =?us-ascii?Q?bChrokJi82iqURL28URP6rpl8oZFDi4N+Kw+56pdafwCXWtqRc1hyCTypdhm?=
 =?us-ascii?Q?iAk7gCLSUkV8to967Ic2bGRSHSXE0M9c2E/VkMusfAZ7y8tKfwdTP9zIFE8t?=
 =?us-ascii?Q?910qdzm5ZiiCJTkVykUzTd1G3PQRGVgYS8odmeRs0aio5/A74YUgnI35a1Bz?=
 =?us-ascii?Q?BJoICxDSn5zCogJf73ff7939bJL7yV3Age9eOPoGMobwPflNzLoDiFzDdy7c?=
 =?us-ascii?Q?hn/xktNxR79rs4PqLQ2xIxRQnDx1wk3PxGOpsUryoyMIZiovBQcbGsKnjbg1?=
 =?us-ascii?Q?/JM89Bscqcg1eK0MGfUT5kA9tVEwuvlDUPww0mg63cweCvcGX4kWBoYuv6vC?=
 =?us-ascii?Q?wmjOdinbF2xjGJpZVKFQ4TTe1iEbtJGqGyihvq9sxvfzPoWOlAMZUsJDYrJe?=
 =?us-ascii?Q?6zNXJenFqtnfIu78O7juBfJ2SK+VT+89upfPWpt130+1AUc2ASWFn92MUbdy?=
 =?us-ascii?Q?8kY3Z66X0zCo3wbP34ZT59fv+3G7ZUYT3jt3iRu1NNl2bJEF7y63Vh2wY6GG?=
 =?us-ascii?Q?olL0FdAayBkoaATfI5UYYjZ4epuZCmRlnezgZvvKDAqwCFtqVsjvMxhB05RM?=
 =?us-ascii?Q?uJedUEDeeI8dVPc7rvEjsPQCFlVD7YEFLJHrzVl8PWBptYEaWJVif5tzLIPF?=
 =?us-ascii?Q?wlkE1brxM/r1HD7lOstTUS+Pm6+mv2mq5p+crDuN?=
X-OriginatorOrg: vivo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6a795a56-99e9-4dbd-06cc-08dab813eedc
X-MS-Exchange-CrossTenant-AuthSource: SEZPR06MB5269.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Oct 2022 12:08:17.9675 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 923e42dc-48d5-4cbe-b582-1a797a6412ed
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 3IgFmGvEP0H7Lq9RBYKYleIZK+zuETQVpGaSoI9nFYYBKPOWoJMlUfDISELVuIKEvRUH6Bh4AknT14sriiDFGg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: KL1PR0601MB4468
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  Since it is an f2fs module, it is best to prefix function
 names with f2fs_. At the same time, there is already a flush thread and related
 functions in the system, rename flush_error_work() to f2fs_rec [...] 
 Content analysis details:   (-0.2 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [40.107.215.122 listed in wl.mailspike.net]
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
 no trust [40.107.215.122 listed in list.dnswl.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.0 SPF_HELO_PASS          SPF: HELO matches SPF record
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
X-Headers-End: 1oo1gQ-00054b-SO
Subject: [f2fs-dev] [PATCH 1/3] f2fs: rename flush_error_work() to
 f2fs_record_error_work()
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

Since it is an f2fs module, it is best to prefix function names
with f2fs_. At the same time, there is already a flush thread
and related functions in the system, rename flush_error_work()
to f2fs_record_error_work().

Signed-off-by: Yangtao Li <frank.li@vivo.com>
---
 fs/f2fs/super.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/fs/f2fs/super.c b/fs/f2fs/super.c
index a241e4073f1d..fc220b5c5599 100644
--- a/fs/f2fs/super.c
+++ b/fs/f2fs/super.c
@@ -4019,7 +4019,7 @@ void f2fs_handle_critical_error(struct f2fs_sb_info *sbi, unsigned char reason,
 	f2fs_stop_discard_thread(sbi);
 }
 
-static void flush_error_work(struct work_struct *work)
+static void f2fs_record_error_work(struct work_struct *work)
 {
 	struct f2fs_sb_info *sbi = container_of(work,
 					struct f2fs_sb_info, s_error_work);
@@ -4374,7 +4374,7 @@ static int f2fs_fill_super(struct super_block *sb, void *data, int silent)
 		goto free_devices;
 	}
 
-	INIT_WORK(&sbi->s_error_work, flush_error_work);
+	INIT_WORK(&sbi->s_error_work, f2fs_record_error_work);
 	spin_lock_init(&sbi->error_lock);
 	memcpy(sbi->errors, raw_super->s_errors, MAX_F2FS_ERRORS);
 	memcpy(sbi->stop_reason, raw_super->s_stop_reason, MAX_STOP_REASON);
-- 
2.25.1



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
