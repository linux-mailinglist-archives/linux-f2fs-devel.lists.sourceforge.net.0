Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 1063162C608
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 16 Nov 2022 18:11:59 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1ovLx3-0000Ix-Gb;
	Wed, 16 Nov 2022 17:11:53 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <frank.li@vivo.com>) id 1ovLx0-0000Iq-T4
 for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 16 Nov 2022 17:11:51 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=MIME-Version:Content-Type:Content-Transfer-Encoding
 :Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=rEekV2IMUnHLGt28XYGpXnCuMMx28Cx287rx2Ab1uOw=; b=cUazm7zroW6Is2OBraq+dVBhVQ
 vNVnx9QoLQkDZAqb+tV/rmpspHa3P2Cnr0vFzAkPkm0OxnZEGvKDSGG/0tQJa+OkpsxGBUge3E3Lu
 I6IMcbriPcfHT++/ArcD9Uib3gFHIUmUf60Y1lHJr+457LVRbxUsvq4COgg8JZj7xq2A=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:Date:
 Subject:Cc:To:From:Sender:Reply-To:Content-ID:Content-Description:Resent-Date
 :Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=rEekV2IMUnHLGt28XYGpXnCuMMx28Cx287rx2Ab1uOw=; b=n
 K7IxW7cF8o7ZLJXfKplrTbmjSUZ+OhTfNNgtQLVbT/U3lSno9FXswRkk7mhxm80YBdhQSf3MNQzF1
 VUL5/Dnf5qiyC2Nl9FSt01hLbT/K/9AsC0GOIGwh/zDhJ1pcq1uAJY+AsQ5NqMIO5KjmDXybBLH11
 ZHaAfkSD+U5X9X3I=;
Received: from mail-psaapc01on2102.outbound.protection.outlook.com
 ([40.107.255.102] helo=APC01-PSA-obe.outbound.protection.outlook.com)
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1ovLww-0004YV-CL for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 16 Nov 2022 17:11:50 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=IWXB87QHsELR9vtYEKilinMQOi9DVURbWRPatzoCUZ0S4vBBsnZozttaKXZ8R+1db8T4GiePuk43bWZ/yAZsrfo7nz3XDDF0wAgR0eFsMSUMgN7hKTER4yTeh4M8LTisKx3hMiXAY9tsddUAmbT9KkNUqx8T3ccYmfB9rR+BjZLzrkfU01i1FbwowHU/gR34AsTjvz1J6NlLR8BC9LZaxrOQzIT86c+CLI2U4cfutbYNKmfwSqRfTtAIqaTVEWJcTizFh5srhGh91ekxuLp57HD3Qe0yJmcc+/xJvMwf8hWUFR+dQrt238xWeSZOsdxpnetJMLS9yjNQRd5MiddmZA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rEekV2IMUnHLGt28XYGpXnCuMMx28Cx287rx2Ab1uOw=;
 b=nycHTtGOIAL1mHNTJsGLLSa6jtjXpEq9QjlB4qzItoPfc/PFFWr81OEkH+N9pUTMu0K5HLkVTR50E2OvGkvJPgzB7HT9ilwg81ni4WWx95m8Oo+ypPgDyKvR+I91rozCh2DKcjzbU3IVqBjNI7r9Q/zS3mM98tpeGY33JlzQIxsl/xNSqY+O8b/UMVlS/b4iQ9XGHjiHJHcpzfgtal0xofpF6ysmZgTkNZvNDjO4gMLOjlWjXIyaw+uYcnZSXx/buyDXP+C1Cbmub0h++opa2UzwqB03HHUx5n6k9u6MZkxTxgOzPxUxma+FhZahWCdjlCpRvqsWd3Mnz16IW/YtRQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vivo.com; dmarc=pass action=none header.from=vivo.com;
 dkim=pass header.d=vivo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vivo.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rEekV2IMUnHLGt28XYGpXnCuMMx28Cx287rx2Ab1uOw=;
 b=J4PKEVXMq16CiEJRBoLlgRlza4AiUY69pXC5EK3zqd/ndbCQx5EBpnuuVYIrs+0rBZIcTcc3PBSThPtuDMDAzfZ7j7sMnbLSK0y3MHiH2j+BAbJcm4gldMUNYYeTn/7PI5MF/UKG/NqJzzRncvK1svGXcF8lVxISWfWJE9FhvvaCYOhvqsVcBjCp3eq134rz+Ub9IOPrlx3Yug5B19+oTCc+xVbOdpWSQxHioJNpxW7dbViDRHXBlhXPGFuYQNd2mohwdvWCN7I/sNukMyBmn2urFdrI3ZX8Mp4GoLmCIU9J/uxFc4rdanl1PmQXIPaouugbPbUxmSc1+sPittLRyQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=vivo.com;
Received: from SEZPR06MB5269.apcprd06.prod.outlook.com (2603:1096:101:78::6)
 by SEYPR06MB5867.apcprd06.prod.outlook.com (2603:1096:101:d0::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5813.18; Wed, 16 Nov
 2022 17:11:37 +0000
Received: from SEZPR06MB5269.apcprd06.prod.outlook.com
 ([fe80::1230:5f04:fe98:d139]) by SEZPR06MB5269.apcprd06.prod.outlook.com
 ([fe80::1230:5f04:fe98:d139%9]) with mapi id 15.20.5813.019; Wed, 16 Nov 2022
 17:11:37 +0000
To: jaegeuk@kernel.org,
	chao@kernel.org
Date: Thu, 17 Nov 2022 01:10:45 +0800
Message-Id: <20221116171045.13407-1-frank.li@vivo.com>
X-Mailer: git-send-email 2.35.1
X-ClientProxiedBy: SGXP274CA0020.SGPP274.PROD.OUTLOOK.COM (2603:1096:4:b8::32)
 To SEZPR06MB5269.apcprd06.prod.outlook.com
 (2603:1096:101:78::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SEZPR06MB5269:EE_|SEYPR06MB5867:EE_
X-MS-Office365-Filtering-Correlation-Id: 6edbda3d-be9b-419f-3d16-08dac7f59e79
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: tvdrW/LgvCDDilXlnHT7ZL/gUo4f916TVP3dT80/qOSgfu9YR4Of4RORccdYn0EOyp0OVGP60sa57leQQLetrLMOU007eDjHvd20moeEtBzI4VlTlHlez4RNiwLiq09yCiKw+o9tYo2GaLZY5OHLZUeaOGYQcK+0nB5BVhV8mQwYIGLVhM8DFdaGCQ5WP++3D7DC/6mNlU3Zd2Aao6Uc1tJA9/PwPBJOIGiPKP2HUA8NJ5VhnxxLgcp6ieUw91hlNz1dkd6wKyX2U0c9obbPR7jn0BZpIeqADtjhOJxFQboGR1hHBi8YGaBNxFGXRbqGI5cH9mcx9iFJioPyE4F1EYISmwvh6ONT8f/e/6R90w/ItinqgattpUJV7NyOpE73eimsw+g74fQgtYqA//h0MxZQ2wvVHHu123nKG2bZ6xX30UgW5puio5Y9AaVy/2eNbuT/Q0NCFUjFrzWiJY6HUGIoTeYF7CAkUUtjyJT5QmMDuYW5dgrX/4PKhsMjedjv9B+d6VDPpGzJ5iZHrIxLfVCG1CS5KtPjUwPYiGSggbbpOOCyH0rKWohRoQrnHvZwPnGuqqBGQTEemtBHNdHlm+yVAzo0jNNgBGq8aQMogqLc2Nsii0nsrBuhIIi4AwMWIKtS7R5Yf6aGNfAXBnLAcQvZCp/vIlTpaJoNIAbkXEsYJYnnW/dnocixnjKGhFkdC7xGDUFwrsxMGh2DpLIHw+V/5Mphj/PYaakaFnCexPkFxdOXp76yxX6xwnhp9ngU
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SEZPR06MB5269.apcprd06.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(4636009)(346002)(376002)(366004)(136003)(396003)(39860400002)(451199015)(6506007)(6512007)(186003)(26005)(2616005)(38100700002)(52116002)(38350700002)(83380400001)(1076003)(2906002)(5660300002)(66476007)(6486002)(4326008)(316002)(478600001)(41300700001)(6666004)(8936002)(8676002)(66556008)(66946007)(107886003)(36756003)(86362001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?bfT9vgy08V16FHVcm47xyxc/3LLjQAXgpmgOr/6L2bz/UUO5oHypeYnT/ud+?=
 =?us-ascii?Q?HClY7D4WyPIYbKLQs51UxArDokSeb5TeVLMXqaP3ugB7Qfl1yCaVKOWknKmj?=
 =?us-ascii?Q?LGauJ86GkWinYhipdiYVvhFXxz/Yxpgh4Sov1hcimJzzNTd5xF9vsIHUt0oj?=
 =?us-ascii?Q?3ZL+spzPJzzfg2PY98rsNRDIjpJnqPlw20t7MsIdeABDoQ/6Z0gEuyY4uEXr?=
 =?us-ascii?Q?dQq4hpcgn6+o0DYLX9AhpNCUXeAFZinlOGQtDfW+RRT0/lb07XGJapG1cYn5?=
 =?us-ascii?Q?JOg4Bx5x8IUn+AdHzki+eRN09oUT0X5SMTOGf4p6zA+JoaLq7o97Co70HXPD?=
 =?us-ascii?Q?qynprBJrvyokf84K0w2jResGgJYIBDANbnRsmdCX700PjizxzcOv2bEAUJSF?=
 =?us-ascii?Q?bXXP2j0/8QVSxIPGo22rAL2QsxXI5967MxfU3ItRguuiwcO/LaJ28SC15SZM?=
 =?us-ascii?Q?mJ3LiWn3KQq6XfoEwDcpkB070spxPLeXxAcw3Oe4dz7UnitBYwEsMqJXU3HW?=
 =?us-ascii?Q?YJMyIgmzpUC4OAV7xf72+HFDHiTlb+ArfF12xtcrj+zq734f36rzDH2nCfzP?=
 =?us-ascii?Q?e5QXUPun9VNdI/RQS3fQWiVGBc1hJbbOHElclUD7yDoTEtdwKIlK53kLU6Pr?=
 =?us-ascii?Q?j8wuu5MVtunpkiNNkjrCJLAWPuyUI/XZMbxNIXG+2DHp9Z85hsYM1RKCcr8z?=
 =?us-ascii?Q?zVCHbZljwSXYbah/8PZo+tNOmf2irgoUL6u6Amg9olO4Q9HOPhgrX2X7PUuW?=
 =?us-ascii?Q?niwlacXp0pRroDSmvIDCQGwupY4sN6ex0rEDNYwPqRF6lPdf/ZiixY5DSUJp?=
 =?us-ascii?Q?TdnwU80agykzLw2EB+xpiqgzaTN6s9jCAyFurktzNAQwpdWfYTsRdI4t9z72?=
 =?us-ascii?Q?m0SBRAm5d69OskiQHih+tGhrLfcPF4mejyWPBgmNTI8ZtOzT+ZyQMnhpHyV+?=
 =?us-ascii?Q?vwEgp0Es04LqVJrWrNNuD50bU5zUPzFxmQ55EQ7anyppFMJsaAGG9DJwLKx4?=
 =?us-ascii?Q?b6LD+WlPbaHwzCQJCEb6v7DidKnmmmBPs/dUBnaAFzMX6KqIuzTpvcGtoCON?=
 =?us-ascii?Q?b06C3VhULaE7rcHj3Z32aRB0mAElaHYKxkEFXOis8fOzSrv3Rai2FwW8Klqf?=
 =?us-ascii?Q?ibIOHMH3ekY9OrXHOLDc3gxqFxSY8UiPIUym6FNyuIKqyZ7DCeywR9mATTXN?=
 =?us-ascii?Q?no66YiZJYyAseGSZC+Vw+V+o0bl8vzI+Q2s+afoRb+BVG/0rUrnQJJhO7VxV?=
 =?us-ascii?Q?wOQEQLM4Nb6q2jZMXQLc09+4Zzi2SA0yYbei+n0X4u8iuD0GZBPs/jfX2iiB?=
 =?us-ascii?Q?zTdlbTmmJ49tjvulQ8sbhi3cPRZNsGej1NVFb0ADOtB59K+S1RhpY27T1+6W?=
 =?us-ascii?Q?LcI0yHOWkoUVxm0SKBUNyIWf7LDew+4wLQ+kHKFsLXbfnH3coVu5pbkuCKFC?=
 =?us-ascii?Q?hrlx0qzJ1rIA2BWNSvPopyLocxJHJidT8c7G7bk1FrRY47GI+wR5FuEx3q7V?=
 =?us-ascii?Q?niyijtSZGIGeQT2oPLqgOfJUa4GprhS8NqEJlJ6/pUCTZsWS6MkUikQ5QFz7?=
 =?us-ascii?Q?NMZzkhG4uzWzPI/b8etYgNrQ+nfMZP2HwIf9qkce?=
X-OriginatorOrg: vivo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6edbda3d-be9b-419f-3d16-08dac7f59e79
X-MS-Exchange-CrossTenant-AuthSource: SEZPR06MB5269.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Nov 2022 17:11:36.8037 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 923e42dc-48d5-4cbe-b582-1a797a6412ed
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: GFDyq+W47AzbzO3lBfwbQAuwdrclBAn2eG6EjMMx6RqcPY1OdwOXivLKsanLmvsuHRQ7o/7LCs08FTKDPxncQA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SEYPR06MB5867
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  Since __queue_discard_cmd() never returns an error, let's
 make it return void. Signed-off-by: Yangtao Li <frank.li@vivo.com> ---
 fs/f2fs/segment.c
 | 11 ++++++----- 1 file changed, 6 insertions(+), 5 deletions(-) 
 Content analysis details:   (-0.2 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
 no trust [40.107.255.102 listed in list.dnswl.org]
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [40.107.255.102 listed in wl.mailspike.net]
 0.0 URIBL_BLOCKED          ADMINISTRATOR NOTICE: The query to URIBL was
 blocked.  See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URIs: vivo.com]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.0 SPF_HELO_PASS          SPF: HELO matches SPF record
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
X-Headers-End: 1ovLww-0004YV-CL
Subject: [f2fs-dev] [PATCH] f2fs: make __queue_discard_cmd() return void
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

Since __queue_discard_cmd() never returns an error,
let's make it return void.

Signed-off-by: Yangtao Li <frank.li@vivo.com>
---
 fs/f2fs/segment.c | 11 ++++++-----
 1 file changed, 6 insertions(+), 5 deletions(-)

diff --git a/fs/f2fs/segment.c b/fs/f2fs/segment.c
index 8b0b76550578..14ece4bf7c7e 100644
--- a/fs/f2fs/segment.c
+++ b/fs/f2fs/segment.c
@@ -1358,13 +1358,13 @@ static void __update_discard_tree_range(struct f2fs_sb_info *sbi,
 	}
 }
 
-static int __queue_discard_cmd(struct f2fs_sb_info *sbi,
+static void __queue_discard_cmd(struct f2fs_sb_info *sbi,
 		struct block_device *bdev, block_t blkstart, block_t blklen)
 {
 	block_t lblkstart = blkstart;
 
 	if (!f2fs_bdev_support_discard(bdev))
-		return 0;
+		return;
 
 	trace_f2fs_queue_discard(bdev, blkstart, blklen);
 
@@ -1376,7 +1376,6 @@ static int __queue_discard_cmd(struct f2fs_sb_info *sbi,
 	mutex_lock(&SM_I(sbi)->dcc_info->cmd_lock);
 	__update_discard_tree_range(sbi, bdev, lblkstart, blkstart, blklen);
 	mutex_unlock(&SM_I(sbi)->dcc_info->cmd_lock);
-	return 0;
 }
 
 static unsigned int __issue_discard_cmd_orderly(struct f2fs_sb_info *sbi,
@@ -1776,7 +1775,8 @@ static int __f2fs_issue_discard_zone(struct f2fs_sb_info *sbi,
 	}
 
 	/* For conventional zones, use regular discard if supported */
-	return __queue_discard_cmd(sbi, bdev, lblkstart, blklen);
+	__queue_discard_cmd(sbi, bdev, lblkstart, blklen);
+	return 0;
 }
 #endif
 
@@ -1787,7 +1787,8 @@ static int __issue_discard_async(struct f2fs_sb_info *sbi,
 	if (f2fs_sb_has_blkzoned(sbi) && bdev_is_zoned(bdev))
 		return __f2fs_issue_discard_zone(sbi, bdev, blkstart, blklen);
 #endif
-	return __queue_discard_cmd(sbi, bdev, blkstart, blklen);
+	__queue_discard_cmd(sbi, bdev, blkstart, blklen);
+	return 0;
 }
 
 static int f2fs_issue_discard(struct f2fs_sb_info *sbi,
-- 
2.25.1



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
