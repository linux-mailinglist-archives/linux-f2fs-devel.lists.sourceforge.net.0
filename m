Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 301FC9A59A0
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 21 Oct 2024 07:03:49 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-3.v29.lw.sourceforge.com)
	by sfs-ml-3.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1t2kZu-0000F8-E0;
	Mon, 21 Oct 2024 05:03:37 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-3.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <yangyongpeng1@oppo.com>) id 1t2kZj-0000Et-IM
 for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 21 Oct 2024 05:03:26 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=MIME-Version:Content-Type:Content-Transfer-Encoding
 :Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=7hjXT0S7+TaQJqbLt4A3vHalCeIZErJ53sRPbk4yV2c=; b=TZICXAD2IupuFwB1ZbiV8Tqk9b
 STs/oAaEYmWmG8UYZvYqfJ5oFwBqbpNJR9yzg+EsCulQUPnSmpwxwRMLBM3iPlJQDtrhhl451tJzU
 tC54qhV8L6dTy7I5keqbUJc+BLE+cCIOXQ91xOFbEsMza7HjBtKgu4h+k25kjXq3PSwM=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:Date:
 Subject:Cc:To:From:Sender:Reply-To:Content-ID:Content-Description:Resent-Date
 :Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=7hjXT0S7+TaQJqbLt4A3vHalCeIZErJ53sRPbk4yV2c=; b=D
 bcFv/35B55o72ZDpTSCJF0VD/baEa/ZACLqIWWoV3ZzR9r5COY+ikY6gnSoYfEFowYv1hp4l4jU0b
 vmNaD5tTlt4Fte68IvyeGvPkccsNf/poIC/GjGrTGIUIPTdGKdiJbnK/6xLfVOapdwfftEljegcpm
 ROIFFO2auHwHxVKE=;
Received: from mail-tyzapc01on2070.outbound.protection.outlook.com
 ([40.107.117.70] helo=APC01-TYZ-obe.outbound.protection.outlook.com)
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1t2kZh-0004dK-Sz for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 21 Oct 2024 05:03:26 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=pEKjRW66zejnKKBmWpd1QspXQuYV1cNJ+UrnOm3OqHWVzBFx/zzMiOd/zfUEEIzEKRDWRhncBkwSGj/9HKgb3oEVeVw7EdZNGDd9YuGsx4ydWoA7UTbttomx1Pg720iLU6WU31nlu6oJqYH4+Zw1uowb2zBZtKTf+ONUsvJNKD/BRglCd4Vaaf4GCsRfgu5kYPRlEcZqvyibrDVSwjjlOMSkKoro8h6zkOrvFpssVEzXdercplrOpSpYRhT+4zri5n8jHSbTeQOQ9H+dAn2e2JWNV6xD6U2NAECCk1wdBiEMI2rUbDMYbMQ6oymsClQE7qdbbQZ/dLcakInyroIwGA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7hjXT0S7+TaQJqbLt4A3vHalCeIZErJ53sRPbk4yV2c=;
 b=BiiqNlJjwnRYxaetBXoOHPkM7320QpEzbvPpVT1hl9cYHmv1kQebwuyFEFu7mh0DmTu9uOQzFzGiy0VQ3ngW8P+PVVQuHvAWkwDSfkPeifUdUj7YOYBHs6by3q35AeOqGpW1zp1CY15+WdsK6AHy17EfDfc+6NNWA+XQofL0KpFgtoEkk66g1WhajCovFTE7TrMWErzBxTd8/yizTNBHw9JDnm+SXdmFxEFO1wk2Xs+lnnyjdR7oXDsJUxnYhME6W56UkOJpra3V1P2GQeMngy8hwC8U+aZa87fCiCkUtC8tphRpmoPr1S2/XCeLHLk8IvQtcgvA3SSg5sDI+jQEnQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oppo.com; dmarc=pass action=none header.from=oppo.com;
 dkim=pass header.d=oppo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oppo.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7hjXT0S7+TaQJqbLt4A3vHalCeIZErJ53sRPbk4yV2c=;
 b=FrU6AZsXzpof5gwsWYWXZgeSIMNqbV7mlsqQATQFOOc15qj4TlMpD/keYRXxKmGSHQIDHG2zh+oLxifwVLiBS/m0pjUXEp0Y02HcxigfZKQp7TaLeKQmOyAZyfx0ttSzN4BUv2Cn69LapNIFHqBBqExCOxIwxMH6iDwzL46tmUE=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oppo.com;
Received: from PSAPR02MB4727.apcprd02.prod.outlook.com (2603:1096:301:90::7)
 by SEZPR02MB7421.apcprd02.prod.outlook.com (2603:1096:101:1ee::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8069.27; Mon, 21 Oct
 2024 04:48:14 +0000
Received: from PSAPR02MB4727.apcprd02.prod.outlook.com
 ([fe80::a138:e48f:965e:36f9]) by PSAPR02MB4727.apcprd02.prod.outlook.com
 ([fe80::a138:e48f:965e:36f9%3]) with mapi id 15.20.8069.027; Mon, 21 Oct 2024
 04:48:14 +0000
To: Jaegeuk Kim <jaegeuk@kernel.org>,
	Chao Yu <chao@kernel.org>
Date: Mon, 21 Oct 2024 12:48:01 +0800
Message-Id: <20241021044801.1358850-1-yangyongpeng1@oppo.com>
X-Mailer: git-send-email 2.40.1
X-ClientProxiedBy: SI1PR02CA0011.apcprd02.prod.outlook.com
 (2603:1096:4:1f7::19) To PSAPR02MB4727.apcprd02.prod.outlook.com
 (2603:1096:301:90::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PSAPR02MB4727:EE_|SEZPR02MB7421:EE_
X-MS-Office365-Filtering-Correlation-Id: e9b87d65-8777-48ad-8dd3-08dcf18b9287
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|52116014|376014|1800799024|38350700014; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?Njl3m8jaRqL86+M8d+wd8j9f2Rp+YReKg+fhb9jDf0Mo8Ba5RegKTAsnfNF1?=
 =?us-ascii?Q?cb0WryRqCLJvHEvOBzr2/IsaTDYLMoG+eUVoAoxZOCHba8u6dYE9fT66HW30?=
 =?us-ascii?Q?bJliWNxRKNDb2tC9/DF1EUtp1v6MRue+3ABilVEIw3clcp1ScuPDBZdDenx5?=
 =?us-ascii?Q?B4hny/AmNlk23QpOWTiVht68TJGMz98PDWRbK9HHFFO9s9IEc82bgfbpZYKI?=
 =?us-ascii?Q?MPf5AAVFzRoKp0mY5RvdR97XuAkotPqwws9/B89CU29Zhrg730Hwvsm1uMla?=
 =?us-ascii?Q?8kA69mjSCsuulbYgJ+oOXbIBroTKh0/grV02Dym98aPNczn5rjzDJl7y7wBu?=
 =?us-ascii?Q?+4ZIkPV4LJuFQfTHivG2rFRF7mFI8rJwAGZ5akLIwK0vGpGye6Oyp0dSegF6?=
 =?us-ascii?Q?Dj4FstvRTKV+lNh6J5+TKYVnmb2d4nNkRCMn2vqKW1W+6t9ppomywTsXioyP?=
 =?us-ascii?Q?y4oXpmuONkoMjsktVOplgpdTAGO2B8L/R0O71MKby14WC5o9HXjDWYVXpA2I?=
 =?us-ascii?Q?+6EWtKAuv8k98fLuTMvIpfwDS3UG8K4EF9L36zqlVkzX63PF3NT1PQ+36eJu?=
 =?us-ascii?Q?pYmouIRX/Zjt8nrwRp0/+uWzsUEs/pwxbtPGOrpgpiEzYlL2xdiG12B58EYU?=
 =?us-ascii?Q?/6GE97NkLUkUkDWxkDrS2QgpD+ZoUJXz03SFxlQT5ITSVc9JFRoQ0PIsXD4z?=
 =?us-ascii?Q?n3cfF4785+sxWx8t19zdm8q5g0Naz3nsTX1DYVf0P0KnZvfYccB+lRUiSyjB?=
 =?us-ascii?Q?yYk039K3CnpxzVQUMSUkITLTLynIVxpuxhUfSixfQQ6HqMgkt7/VG9ryPbiT?=
 =?us-ascii?Q?L2mo29fPpcBq7HWeqUiGFlU3Co2nQQ6055jxTUDCiIrUoeVWekxHWmmyN6Od?=
 =?us-ascii?Q?Kb5x/lgx92KJWI4WnCe5bAIzzSkPIGD4dQQt0eTtIzg14/tirFfaSxP+bUbV?=
 =?us-ascii?Q?iEm5OBYrq+ZblkeNGzPd8C+EfBqSOsbwmgPdx38KaQwX6b0D9xzST0FM0r8f?=
 =?us-ascii?Q?PwF7zsLK+CVSowc2YvK51zaCHxk2VCvND2ZpZ1Jm1nmCj77eeRevNujtwhvy?=
 =?us-ascii?Q?oJ3LFeeJIbdM+NKBVOSG9U3QPKctKNCLghbTnOcDL8U3hNng2raQ4Nlx//Vb?=
 =?us-ascii?Q?BryuvOhEZDgKs4lf2VMe8Khw+hdr7GS+djWeHM6VGryL8JByWnYf5A0jBYpS?=
 =?us-ascii?Q?8oPxsnBr85UsElllTj6ZIC5zjn4K95ak/pbFXXHVh/ngC6B0B7Zw8xpEenQr?=
 =?us-ascii?Q?K+QvMWxND8CsM2DBXdYskpEdSVRF8zueIqcEc4ux2w+QL1khFVUi+aDhfDaP?=
 =?us-ascii?Q?IXgZ7opAmK8FO600LCKWzECMoOOIDXaQacBANGjRN7rX9N8SgFwNEfL6spxS?=
 =?us-ascii?Q?Y57eQz4=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PSAPR02MB4727.apcprd02.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(52116014)(376014)(1800799024)(38350700014); DIR:OUT;
 SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?BL7UgaWjp1VAoebcfxcLCyqR71YCYrR1hwqI7sWZOlJmAngpY1ZQp9cHSlOk?=
 =?us-ascii?Q?eOeNJtpSnPb43q1ystEjU7UKQ9tFVQnp8z8ruhtREJ77yGY83368WKFwz4DS?=
 =?us-ascii?Q?j8kvKEQjDCg7hAe3O4zqocWnP9j8T37VZtTswQhj1TJhcaHhy0thxvciknbe?=
 =?us-ascii?Q?VAWfg6u9E2UD0rWsjU9papmq+sMwFAuOOuZkWLi1U98Mw8hWPNk/meOokGsY?=
 =?us-ascii?Q?ddu2r/VPdJpDEJxwHEyy5Exej3KiGVeNsLWw5WJ5g1/iQeoMRKSLk0jiLFbb?=
 =?us-ascii?Q?TFncHLl6yNTaiUFC2RHsOeSihsQxfayc5wmCVpJyMyHiIBkXnXKjmHf97/gt?=
 =?us-ascii?Q?cjcqboBUnvmX9pmBMVU6H0RYq3Y2sMftG4bBZBzhNDsL8jhhIgw76SIO1EPe?=
 =?us-ascii?Q?bK0C+axBuDsuib3w6yfUz+2BX029qF/T4SjfNEjnlykmjhkHibVspcEx7ciq?=
 =?us-ascii?Q?sEj04ZEQaCRmmf3ncg29rGGPZHhRUKh4muQcFETyAQdtSn6hSqOhD9Ido66V?=
 =?us-ascii?Q?+c1B9Y1zQhZRUb3wPvN1QmYNjaQ5nViposlL52Oj/J4lnP5UI5ss1fBCp6fo?=
 =?us-ascii?Q?oK6xOeLIMMShDSsuLzpij8laVyV4F+cyV3qpLhj0MglchTtd7xbm93yGOnnl?=
 =?us-ascii?Q?Uuz/ox284drmtheY323vO6/DvX6Bx7+Dd69JXD96XIv6MY5LSCUmSNXv626X?=
 =?us-ascii?Q?Bc1Qsk7bLPU00KBEH7gAVMM/XIB6OuyRHK/VuGozCvpJKU+PSXCFhsI2FoP6?=
 =?us-ascii?Q?QWLv4hOGvGFI3owT6VOaVrKoHWYJgXzgY2UEkN+CVG5FT3CkUg5jn2z/FH11?=
 =?us-ascii?Q?MpTWW332sKLTxqkYlvc8+nCpQuLt1di7YXj5f0KqeDHI905J1XNH08tyDqb5?=
 =?us-ascii?Q?xlQTLVflQVR0JGeNjHQeJl05G7mVLsbPjb9VaHYM0Gz/ofVXnQc7irmkzVHT?=
 =?us-ascii?Q?wg7HYmemvwet2gmP9Ur+XYVa9hkg2+gB21ucAxEvDYo1AvZGXJH0N1k2CFzF?=
 =?us-ascii?Q?0GsOteI3CNQjdk/0MxDJjieqzy9ncEXb4UgtP/dfXXQXIHuLLRcSu4wZJ+kt?=
 =?us-ascii?Q?aJ+i3uDAYerrCxLE/mMYwTggmxQNJ41O/eObV0UAq8cMd7bGRTZ21WiRihU1?=
 =?us-ascii?Q?mFtIn+PDfHa7duEilTPQ4W2w0MiklxJwbh2hrm+baBMplFPbAWY3gk51pMkW?=
 =?us-ascii?Q?zQmAY0i+XWD7yYA35T5YEyCJj3Ne89HBdxIGobb5Rnynclp7/0MBGheTEzy3?=
 =?us-ascii?Q?3yPBNiOi2Z5Lo6sZjrrQ3y2BKtl2Wagf6saCBRt7PahekCPgo+eSivFsiOz5?=
 =?us-ascii?Q?FQY+DGkB4XG42FE4PUiQdD22nW6KoFuZ5FaoHGSVjvRu+UCnSlgCojV7y87N?=
 =?us-ascii?Q?Azf5YxH9ArSKozZcENkNQXoKI6Arl1X+MlFe9t58a7l2978LPH2WIMkGUdzv?=
 =?us-ascii?Q?CUEXsDXiiXwR7XpbrYDDcgQk0PZ/Wqkt0NtQUjFIbT7lsZMie/3BKiKbJNfA?=
 =?us-ascii?Q?moorHk2oLDuTTPuYqVmnvdXg2JXNCTeCA0uhPw3rXBHDB8X6xLJNVPyBlRmK?=
 =?us-ascii?Q?stlnypCQ+Ys/0p+cSqr1lhD6eBctJ2lFIbFxmtCFvdawSKpFR3yvv2CIgn0w?=
 =?us-ascii?Q?kA=3D=3D?=
X-OriginatorOrg: oppo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e9b87d65-8777-48ad-8dd3-08dcf18b9287
X-MS-Exchange-CrossTenant-AuthSource: PSAPR02MB4727.apcprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Oct 2024 04:48:14.2962 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f1905eb1-c353-41c5-9516-62b4a54b5ee6
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: QbSUKXCg3jY7PdIX2glmy+p3xjyOrdBLE67cXWfPIjr7ijYg5iDAuIa3V6HKmqVRbFpYQlDmmv+/TSROH09UGA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SEZPR02MB7421
X-Spam-Score: -1.9 (-)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  In the __f2fs_init_atgc_curseg->get_atssr_segment calling,
 curseg->segno is NULL_SEGNO, indicating that there is no summary block that
 needs to be written. Signed-off-by: Yongpeng Yang <yangyongpeng1@oppo.com>
 --- fs/f2fs/segment.c | 3 ++- 1 file changed, 2 insertions(+), 1 deletion(-)
 Content analysis details:   (-1.9 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -1.7 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [40.107.117.70 listed in wl.mailspike.net]
 -0.0 SPF_HELO_PASS          SPF: HELO matches SPF record
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
X-Headers-End: 1t2kZh-0004dK-Sz
Subject: [f2fs-dev] [PATCH] f2fs: check curseg->inited before write_sum_page
 in change_curseg
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
From: Yongpeng Yang via Linux-f2fs-devel
 <linux-f2fs-devel@lists.sourceforge.net>
Reply-To: Yongpeng Yang <yangyongpeng1@oppo.com>
Cc: linux-kernel@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

In the __f2fs_init_atgc_curseg->get_atssr_segment calling,
curseg->segno is NULL_SEGNO, indicating that there is no summary
block that needs to be written.

Signed-off-by: Yongpeng Yang <yangyongpeng1@oppo.com>
---
 fs/f2fs/segment.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/fs/f2fs/segment.c b/fs/f2fs/segment.c
index 1766254279d2..35f0b5065554 100644
--- a/fs/f2fs/segment.c
+++ b/fs/f2fs/segment.c
@@ -2926,7 +2926,8 @@ static int change_curseg(struct f2fs_sb_info *sbi, int type)
 	struct f2fs_summary_block *sum_node;
 	struct page *sum_page;
 
-	write_sum_page(sbi, curseg->sum_blk, GET_SUM_BLOCK(sbi, curseg->segno));
+	if (curseg->inited)
+		write_sum_page(sbi, curseg->sum_blk, GET_SUM_BLOCK(sbi, curseg->segno));
 
 	__set_test_and_inuse(sbi, new_segno);
 
-- 
2.40.1



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
