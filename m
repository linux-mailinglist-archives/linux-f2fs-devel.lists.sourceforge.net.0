Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 88ABB6243D4
	for <lists+linux-f2fs-devel@lfdr.de>; Thu, 10 Nov 2022 15:08:53 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1ot8Eb-0000r8-7s;
	Thu, 10 Nov 2022 14:08:49 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <shengyong@oppo.com>) id 1ot8EY-0000qn-7f
 for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 10 Nov 2022 14:08:46 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=MIME-Version:Content-Type:Content-Transfer-Encoding
 :References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=KVSnsq4pP4pEPl2BX6qAYO+bZNvnUWqDrQp1g2O3mFE=; b=QZTFQu1odw3lJnNoRibJzQyAAZ
 D+kSqGAZX/evLqTX+OMn0sajhZUs5tzQ/hDKh1Vy8bttmTPFUmYg/ayxg0018jxXCP8qfGVnJhtYO
 W1zeJkXA9BajRqfLumWlTqipRS683EqNG4MV+EAfuKpS7kViIWnWTxvrG6XEMHQP8TK0=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=MIME-Version:Content-Type:Content-Transfer-Encoding:References:
 In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=KVSnsq4pP4pEPl2BX6qAYO+bZNvnUWqDrQp1g2O3mFE=; b=m0iQX2R+sKCRHoYflYWBCq7upc
 pr7lowHlc5Do1LPEL+xhEeJAI+Z6YoYZBnG2fCw4B9bP4KfHSfp0FBDjwXDvYnXScZheoS+ynHOi3
 FfvpmeCKnfoncPl7UMIDeU/s6ovjHZOJ9qbW8WQ6qXjPdx3ABfjZ8DvUAoK3Ph7x7rmU=;
Received: from mail-sgaapc01on2087.outbound.protection.outlook.com
 ([40.107.215.87] helo=APC01-SG2-obe.outbound.protection.outlook.com)
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1ot8ER-00067v-Ua for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 10 Nov 2022 14:08:46 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=iiCCglPoTvurhCrnBM3WAKvypri095NZmBd+aBWY6alrYifHjLZhEfilDxjDMWHCLyTsjqlFFB1Ues8/CULzh+zCuoGsTy4e46p4MysLdVgVCa+zJQpnnmkGMAkwu0fSRIldnPhVUMImbs90mhZjnOfkjbvcAtsOvVoByvpiHKUiwCIVmK87S51c1gbmdjqHQWDOG+blvzQXeChUihopl2Qco/O2HDS87H5qJkFB3VgT2lrrDO0xpNJPURK4hDTHBe4ffIxlw77rSoS/0+wBtTk7VUjT42mhHMqvj2nYB4jW777cpaWYyyfwA8n1nFdo4q+NSah9a3LR4/vdVNR7vg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KVSnsq4pP4pEPl2BX6qAYO+bZNvnUWqDrQp1g2O3mFE=;
 b=Hv8e2hdRbLQR9sJxY9nMJ13IFNdQvneDYWOlPFNU7+I6k2m+UjNj/hKjMASAArHyAPaZdWRFLffvh02QaaQDej4niNin5hUmAEoJ6mkjaQjnBmBhtfKWSFVBwywnkKbY3UouPdl8ARoZLFoa8i60M05PkbkAkEw9yYgCv18c/KeZZwpUjUMh34wbz8Z2+7l2y0KYWFYIQ5q7MHpf5pDp2f3J8vX7Q7PG4bb8A3i2fhWBN+TjLXxesfJDWbwEb6oe5sIAKhxhZp/jjLSJPBqgKb+EZI5Dv4qgcari+5mAcXXAKXPxnbZc69COL2tSEtS+ThaN5DrvkYjgQkztubJziw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oppo.com; dmarc=pass action=none header.from=oppo.com;
 dkim=pass header.d=oppo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oppo.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KVSnsq4pP4pEPl2BX6qAYO+bZNvnUWqDrQp1g2O3mFE=;
 b=KmIqPVXdxKA+huTibXWKyGJmbseJ9awRWfIyewdWWmkW3m+sABKYbYcLyHi/IDTpJF9+ybYEEZQSJtq9BhaSNxk8Q2kY+xpFWwqRh86XjNMaJzl0AY6VQr4W8WZ3JM0eae7o7vYOh6IIfTHYt66R0ywhUoq1Z9/UsvovI17adjo=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oppo.com;
Received: from SI2PR02MB5148.apcprd02.prod.outlook.com (2603:1096:4:153::6) by
 TY0PR02MB5744.apcprd02.prod.outlook.com (2603:1096:400:1b4::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5791.25; Thu, 10 Nov
 2022 14:08:28 +0000
Received: from SI2PR02MB5148.apcprd02.prod.outlook.com
 ([fe80::31b6:afe9:43b5:aaca]) by SI2PR02MB5148.apcprd02.prod.outlook.com
 ([fe80::31b6:afe9:43b5:aaca%8]) with mapi id 15.20.5791.027; Thu, 10 Nov 2022
 14:08:28 +0000
To: chao@kernel.org,
	jaegeuk@kernel.org
Date: Thu, 10 Nov 2022 22:07:21 +0800
Message-Id: <20221110140723.92752-2-shengyong@oppo.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20221110140723.92752-1-shengyong@oppo.com>
References: <20221110140723.92752-1-shengyong@oppo.com>
X-ClientProxiedBy: SG2PR02CA0103.apcprd02.prod.outlook.com
 (2603:1096:4:92::19) To SI2PR02MB5148.apcprd02.prod.outlook.com
 (2603:1096:4:153::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SI2PR02MB5148:EE_|TY0PR02MB5744:EE_
X-MS-Office365-Filtering-Correlation-Id: ea833989-0024-4e6e-0aca-08dac3250a2c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: bM+uT9ekgFsOBXuFZwrOOoLrW8F1hzdipaAD/q/w2ojObr0MLt/6vkXQV98SjE2qkdjF5SzEg7qdzRs9kdYULI8Yh9g/zHwuLDHvQcoOT2pe8FyW5WfOP3XAGaByy4l/aYS5B0lFj9tmHSFwv7ZwicSKpi5LG4iLuFWHvsg8SKnvAxp/01fAu6PEqXOp1TQRZ9S17zV2Y+cpHdh9G09xdMGEfRyzENVzIHHSxlsgS0TqXUwIrm3T1OwM9MCqnE/B5KZAYiHkyENiUHZzNFKzPdzRPnB7xMUi1sgwi93zuqXXCaaPoypqZPpQ3tZRjM4+hzRWDI8DIt5LWSvvnAGDdq+xoBqOAd/ZAdEbNozvkTarPFwpl3VC7PyhF8t0UD/aVRkBre5rfJsRdipLLMR3y+aXe+mL89io74V8R2X+yBwEjr8rSReZ+EXsXzc7pP1OWYFikP6wE4sE2Fj0RFD6nllv2XV4/lx1BXXAPW2XzsZ0ag07+UCo+hjb1NlTl5RRKHaEHE2vlCkQN47AIUJdgrvFQ8TeQvFOKaoJIRKUXtH6qJQTPCiCvZ2X8Ak9ZI+UAd68RAGBWfiyCUhj2WPOCrEln5rWqeueg8b+fV6IPXAsnVnrP8pgEg4lb9vTU+5Dhg6vUsDGRUSb0Hhi+G4Cx/W7yke466xq/Odo8cFgIqNpeJM8JW5EQR1YSc9+1glPnvlCop9jt/m1BRj1jZd81BXvT0HbgORuv9vdn8i3H1MoiqkjsKQ878je+nfQYwFGfoLA8RVdDkhy8vnSif0K6g==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SI2PR02MB5148.apcprd02.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(4636009)(136003)(346002)(396003)(376002)(39860400002)(366004)(451199015)(52116002)(1076003)(186003)(83380400001)(36756003)(6506007)(6512007)(26005)(2616005)(38350700002)(38100700002)(6486002)(478600001)(86362001)(41300700001)(8936002)(5660300002)(66476007)(66556008)(4326008)(66946007)(8676002)(4744005)(316002)(107886003)(6666004)(2906002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?BPuhDMJOA+/f4yTqnUb7JoFfFwOjQcwnMxoVjAS2CCR5cPWGTrWbW5pUXW8g?=
 =?us-ascii?Q?od3EjptN+yjEZCVrbWvlN/Ju3+8Caybelnq9VRlaCrZgOoHjWh1Y2CIv/qef?=
 =?us-ascii?Q?Il13hQzTV4vrSOYZ7rkOEKKkE4YFfSerVxs+yTeKDuhJVQI6h7cFWSZk1LKB?=
 =?us-ascii?Q?Jg6mpQgsgzSotdA0vvjWTjObMNOC/wWG0ZcvTAj2uanZAFKBBRPtMR6bNoXi?=
 =?us-ascii?Q?/eh7ySrEx52pJWSj87Jq5P6fcgDoxqLJ7bDqwtH1UGghosJn8ritdhYCtPV0?=
 =?us-ascii?Q?Yfs8AqNpcExPIx461/yiFKFW2vppzW9S6J0z1BfI5MlbgBcdzR1aANy6cpVd?=
 =?us-ascii?Q?YojuETrrZrj01SYOH5Yx5abqOySlnFsu3Bx7RmG1ka2niqSjDkESYDfKBEFu?=
 =?us-ascii?Q?v6UZizWkrO3kIw3G3i5Zva8o4+7/j6q+k/CXYPFzfmCwKg/oSOng/7CKyXAN?=
 =?us-ascii?Q?kK1cvWmLdYzKli994grUa3WcoUexdp1V3HIAZaW+vAB/j5drEhugOIAZNC7g?=
 =?us-ascii?Q?numIgIK/hp9gNOghbDsGuwo0HyQPFaKPJ85v/NvHRgR3YdN4cPWCMZOCYFcB?=
 =?us-ascii?Q?B5tHovyoUBP0aFOJAzTPbGNjMNX8EkxP/vvoWotidrV073fOIAspvnKEtErp?=
 =?us-ascii?Q?MBANZraeCHT3Rdfrho07abvYaCt64x9go8t7bUi2PZqyY7va/EnbE6Rjl53e?=
 =?us-ascii?Q?HbiNidAqar3bymY5N/y4XzhiYDUiCOKI491JXOn0NRou/fW5B04S3qCvxivu?=
 =?us-ascii?Q?D4C0ZK8LJMPWxffwSyRbl+P/H/fkZDMa17dJwA9b6GGNEOLr+AR3AqkpY9oc?=
 =?us-ascii?Q?vLkwtizMDEnN9VakEbURqg9Cj3oAML0RLKdISuz6IPTPMNQUfzQd1yX6t+v/?=
 =?us-ascii?Q?vv1ANzCMhELq/qLqP66Dl0vEiZ/U4xACTHwn/AqhPpZk4Uy6E3XcXdiSjero?=
 =?us-ascii?Q?C8DzRh/qaqIw6mPzGYwb1ncbAhp2KqkZAMOoVJfuc2jeEal87ZJk4xaVKRx9?=
 =?us-ascii?Q?vixybMYuG2zEyndvYRVQTv5LghqazfA6uxQcZa3YzPY10fNoJxJQpyQSyA3x?=
 =?us-ascii?Q?7B4hf1XJ0saYQaIUoh16PN+lmyHQhPYPBu/QMmrnqA/7Y3U0ztfkBrlycKTX?=
 =?us-ascii?Q?eirfhT0Zd3bLReNHRjwQ+5dgBtErinwwofm1asJK1AqVDN1rD67mV7yl+bGe?=
 =?us-ascii?Q?UfpiqP+JLtpOY8CC1vYlZOVBraTPr953fmEGi0W2ivcQmnqucWUt256VKLEN?=
 =?us-ascii?Q?nilQPgRPUMTqfJ+RiFxFz4EfTNdD8AJ2y5T0jOqqJpjgxS7Dt3khTVNXcuMW?=
 =?us-ascii?Q?XAyRYmZHDiP6UzLFtmJG2CSQgsYc3Yg/HWEAs4p+NVUkZjZjcPDToPFyakc/?=
 =?us-ascii?Q?GWFQHfqMjtVTYDRWtvJH/qYQj5WVRMo8aXuLrdkuGdzHM+PH3/cZSHqUJNg/?=
 =?us-ascii?Q?iOSJ0ZbpKvIEBZzwcC7YSk8avr58faNtgdAsgUPm6Y15V9ACgVkk1vYprSyr?=
 =?us-ascii?Q?A2vWSIrvZtUV1JhHqVEy08vJl/zX+sOM/0g9NijCJtlK5599VKgTscG8wWdV?=
 =?us-ascii?Q?ZlWtZ1x5yNiGrKDdg9x/4+ax1HUI1cEtHFN86gGV?=
X-OriginatorOrg: oppo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ea833989-0024-4e6e-0aca-08dac3250a2c
X-MS-Exchange-CrossTenant-AuthSource: SI2PR02MB5148.apcprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Nov 2022 14:08:28.0710 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f1905eb1-c353-41c5-9516-62b4a54b5ee6
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: eVyf7tmbwu7K2t6gW4xrLJUeAs3mU+14a4Lj2cvesHsaG2V1jhzVyJZPkY3dVdt4upJtGrrvQT6j1lnfTakUqw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY0PR02MB5744
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: Signed-off-by: Sheng Yong <shengyong@oppo.com> ---
 fsck/fsck.h
 | 2 +- 1 file changed, 1 insertion(+), 1 deletion(-) diff --git a/fsck/fsck.h
 b/fsck/fsck.h index 939450f..dabd8b9 100644 --- a/fsck/fsck.h +++
 b/fsck/fsck.h @@ -50,7 +50,7 @@ enum SB_ADDR { SB_MAX_ADDR, }; 
 Content analysis details:   (-0.2 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [40.107.215.87 listed in wl.mailspike.net]
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
 no trust [40.107.215.87 listed in list.dnswl.org]
 -0.0 SPF_HELO_PASS          SPF: HELO matches SPF record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
X-Headers-End: 1ot8ER-00067v-Ua
Subject: [f2fs-dev] [PATCH 2/4] fsck.f2fs: add parentheses for SB_MASK
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
From: Sheng Yong via Linux-f2fs-devel <linux-f2fs-devel@lists.sourceforge.net>
Reply-To: Sheng Yong <shengyong@oppo.com>
Cc: linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

Signed-off-by: Sheng Yong <shengyong@oppo.com>
---
 fsck/fsck.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/fsck/fsck.h b/fsck/fsck.h
index 939450f..dabd8b9 100644
--- a/fsck/fsck.h
+++ b/fsck/fsck.h
@@ -50,7 +50,7 @@ enum SB_ADDR {
 	SB_MAX_ADDR,
 };
 
-#define SB_MASK(i)	(1 << i)
+#define SB_MASK(i)	(1 << (i))
 #define SB_MASK_ALL	(SB_MASK(SB0_ADDR) | SB_MASK(SB1_ADDR))
 
 /* fsck.c */
-- 
2.25.1



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
