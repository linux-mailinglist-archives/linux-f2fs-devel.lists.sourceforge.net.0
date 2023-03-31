Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 056E66D1F1B
	for <lists+linux-f2fs-devel@lfdr.de>; Fri, 31 Mar 2023 13:33:39 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1piD0g-0002Qb-Lr;
	Fri, 31 Mar 2023 11:33:35 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <frank.li@vivo.com>) id 1piD0e-0002QR-5o
 for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 31 Mar 2023 11:33:32 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=MIME-Version:Content-Type:Content-Transfer-Encoding
 :Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=eGSITIJrBWwIZ7Nqw5Ue/DsjkECv6uOpDsIe6hFOqRU=; b=lJS4Xp6Q/yimJf42KvwBpmntuB
 UsHynCEgcgY/A6zbXTdKIrcBW97e4hUPqVwdZh2rCeFRNi8uSPBtSod85U/Efx2ir6bu01xGWr3Wa
 c95WJsEG5QzSIQqpK/RU5nzybVJg4aNo2X7eoaTyHgogSgJoN1mg7DgeCRhgrYy7X424=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:Date:
 Subject:Cc:To:From:Sender:Reply-To:Content-ID:Content-Description:Resent-Date
 :Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=eGSITIJrBWwIZ7Nqw5Ue/DsjkECv6uOpDsIe6hFOqRU=; b=W
 IATOT2WeZ8EMtMZ07UXeT9f/6WGrUC0cHFeSgVJZnj3zvX6kDXJsCy9Tsp7l3+X55WykVk/H8fUsy
 +yvL5D7SW9UIl2b3t4JOGRme+gmT4eMg1EzJ6W0qPVKGeZmbI4yBjpAjH8E9dgj2mAfwX3NvLhYo7
 f+YotvLqTOCwPAYs=;
Received: from mail-tyzapc01on2119.outbound.protection.outlook.com
 ([40.107.117.119] helo=APC01-TYZ-obe.outbound.protection.outlook.com)
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1piD0Z-00Ao2A-4Y for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 31 Mar 2023 11:33:32 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=PddGbR2SdEJOtbAsV8P86k8LT0FIdtmngIe+KcmcvtOFdaxLTL8dOkWbBFRA88lI+jlOzzBxpJSYJ0PKuPEkyJQ9AG8MeT/U/y4Tcn8FYygnZnG2MIyrSNwOdLilYJH7flDCfhovVuBGAz0DeB65en9Le60b/8Lqc93AK7SLP6B7U6JLJHV9NkAZba+Jr1BR3EyBMA4/JraVGOc4sI2q3ZMV7OiK9jh7uJbQoZT2A/B7xXAed8ZhD5JQfqyxW4HI9CV/evejtZHpw6bcAOcpXB8ZuyxZ2MjyQ886Pqa9R8cbaJwSUyyRFXkl+bnzSQ+t0MYKJwlfoDrih4GOFLazpg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=eGSITIJrBWwIZ7Nqw5Ue/DsjkECv6uOpDsIe6hFOqRU=;
 b=OrCXg0I1floCZ8MwFvRo8GtPlZlFQURlIyl6lHUL4YHgxTj8piz9FtSjMiBy6e3Jb/t8s7g5nyjSMpFLD9tYFGPVHSEue6ZAa1SJ8p0/FcBwZXJpaSbLlB35aGmwC4qOVO3Zd/ms53KjivQ1ETPJqSmR45opB/top9WDlPr95Ycf/e1kV7wAd8wY7xDltJTPOlNj93Tjh1+cBxs8G488ABnK+jJkskh3bisQPOEBcnx90g1zrIUi/QYGFjQd6RVMtMs6qgAKDud9XpkVI40CpyUtO+5qzlpNJDRYCZeF2XoP8cx6RwNB75pQvXA9nk4KRyAxJqudSdpzTQvMFuQ6Og==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vivo.com; dmarc=pass action=none header.from=vivo.com;
 dkim=pass header.d=vivo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vivo.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=eGSITIJrBWwIZ7Nqw5Ue/DsjkECv6uOpDsIe6hFOqRU=;
 b=QZy+v6f7mWv/kkcfckIljzC6+zgOaG5e3IhT5L1pmZx/728J9Y963IzFDLbGIx7va9rojN8qDPCBqtqcDFfzCwFZUxVTZpS9QlzFAUN1lxK1Nfnwu+zq6GSG+8QNbm4uUnx0UbGqcE+Tg20LZpkBvIRNqWNj4xtK02Rm5M8RyjzcVNNlMUUWgfjw2yqnnL4NnKvJQiq6bV5w3NK3jhorvcNtWtY6GIOQi88kY5MHr0G6zk71aBdcoI+6zHg0NRhpGtNciBEY7XmutQqog6tnxWeaQAYaNLLmank0Ty1DnezoBs0Oq6PgZ/SMsPa/BXLCYQ5SA7FJ4B2oXC6gYg0+jA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=vivo.com;
Received: from SEZPR06MB5269.apcprd06.prod.outlook.com (2603:1096:101:78::6)
 by PSAPR06MB3958.apcprd06.prod.outlook.com (2603:1096:301:36::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6254.20; Fri, 31 Mar
 2023 11:33:18 +0000
Received: from SEZPR06MB5269.apcprd06.prod.outlook.com
 ([fe80::a3a1:af8e:be1e:437c]) by SEZPR06MB5269.apcprd06.prod.outlook.com
 ([fe80::a3a1:af8e:be1e:437c%6]) with mapi id 15.20.6222.033; Fri, 31 Mar 2023
 11:33:18 +0000
To: Jaegeuk Kim <jaegeuk@kernel.org>,
	Chao Yu <chao@kernel.org>
Date: Fri, 31 Mar 2023 19:33:05 +0800
Message-Id: <20230331113305.77217-1-frank.li@vivo.com>
X-Mailer: git-send-email 2.35.1
X-ClientProxiedBy: SG2PR04CA0207.apcprd04.prod.outlook.com
 (2603:1096:4:187::9) To SEZPR06MB5269.apcprd06.prod.outlook.com
 (2603:1096:101:78::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SEZPR06MB5269:EE_|PSAPR06MB3958:EE_
X-MS-Office365-Filtering-Correlation-Id: 891097a4-7903-42cc-3a04-08db31dbb90b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: EYGiYENh61tB6XfD4z9WFkl/ZxP+er4YO7U8FN1p9LUbIb28WPoq+nv8qFAuGMidqYXj1Mhf2f+oBJR/AiXbBmgChG5d+GvhEHma3/9nRJnobLcmb+V9giTaIWjgyV6YhDC0+oDrJhJwHxiZeHR5AgZIalH0MIbBARDHoLOCgX87bP2iYSSRzTgSfqIyCILibH6vR9IQYNb5dPaRfpz030f6aZjyYsfZ8aEfyN4rg2fpilDpvEhl66BcZq3BQPbwZMsTPaQ8jXbWD3WA8JWGGH0HQod6nytLFYBBzWixevZZ4Af7QVjxmOjiUd+eEbM1YVYK1XYiBojbbRdqBSaomqS+UHZ32wpi6DL3BPf/ya0bpAyeqpLo9VP/JlU8vUTFI6CnLkzuDSIwKQEBkNVoFKBV6rGtbmWfXwjX7JJDlGyXG+LBaqCZdqggU84d22mAoEzSjg7gqfh/wB9+gNFuUE719QkE7S+xVeDJd77xKJoS0i+osEKO0sQBoyEdYlWtk31ruW826Dj7BQVkLCSI+bbJJtqly8Xng4/8O4V1bsdcOenJg68P8bnUubstWWamxh7di37fTkHqZU95gCi35orfZx9dqKzia5oibTINzvf5DFPJBt4wUr/SeS1Wow6V
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SEZPR06MB5269.apcprd06.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(4636009)(366004)(376002)(396003)(136003)(346002)(39860400002)(451199021)(66476007)(8676002)(66946007)(66556008)(4326008)(5660300002)(316002)(38350700002)(8936002)(38100700002)(52116002)(2906002)(110136005)(41300700001)(186003)(86362001)(6666004)(6506007)(1076003)(36756003)(26005)(6512007)(6486002)(83380400001)(2616005)(478600001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?5gims8J94d1e4/LFr4imnx9UVUuRDuyWJK3/03i3PGWW6yUkd9RHxnbquCGO?=
 =?us-ascii?Q?2Dx2qa5NjSMV8QQ60EqzfOhI/eKcQMg9E0Wt5S4DtHyHPLkKhEk2PgNcfNG3?=
 =?us-ascii?Q?jyoDMUlO/G5JwsT8RIE4K4I9wLTi9JvFR682Sicald/ASBjXqN5ecHXhLyim?=
 =?us-ascii?Q?RcLBV56wniYpNcNkRfvFY85M56WF0XgeU7Qk2rCCL4aT61N8Uh/9aPtvyJA2?=
 =?us-ascii?Q?itzD8FlaVbX/EpzGwItGmWQTK8HIRxRf5SgUyVpeWwRt8UfpzVNmuXK8zQm7?=
 =?us-ascii?Q?MZuk7Kt4yPTXQTqFDSoXp6phjPG9H7cVQNdaRJtYCMSaCiLLqJxkZOKBnVIy?=
 =?us-ascii?Q?g+hrc6scPkhcpOIMMuxXJN7cw/fhnGTkqv3apeEscdYhS3bYXoy6DPUcMwDP?=
 =?us-ascii?Q?ATz0fBCrz0OSimQZ7dMZgP+JzYteZ1CZHgkkRP4Vs+3m63jw2IBqCsgPw5Qh?=
 =?us-ascii?Q?H/SbY3GeSF39KoUK4XmyyEwTf4Dfn4hCOmFdpQCpuixcAzdxG7lAzKPNuQSn?=
 =?us-ascii?Q?kGtrD0Qs/LN1XZaQdxE7Ao7tWZvP3+CId16Ng5jOKT0+im1D6MSpghwvfug2?=
 =?us-ascii?Q?HO4yQNfVwSAATlwuV6gyI6yD5el8hHxbxSM02nWnl4OqUCFIQAgh/8vcGfK/?=
 =?us-ascii?Q?mv6Q9ZnmdxGxaVc1Fg4sUxJmv1r2cYnuRzehkKnjLxgOpBms0RKuX6wbiWz2?=
 =?us-ascii?Q?p+bdcKkQ3xgORJARXqDXdR2Uqw4/KtEjPuWYSUIk4qPJRqwCoODMubi1To2n?=
 =?us-ascii?Q?CLhpnn5ZlSV6dmICUXh497LTVmj5MLuaiVq+P7MVlHKFHMLj3DycH2lvo2dQ?=
 =?us-ascii?Q?Bn5RXXR8Zn5Ws9S539RH404iq4E0G+y9G7i9yzZaUWomV826kBcGuaRkGMg5?=
 =?us-ascii?Q?BWxLfY9fnIsh1Mxnp7Arc3lzPj6ty1jsd3U2J+Y7cZPzL9qufvFpJ88K2YoM?=
 =?us-ascii?Q?Jr315WT3HbmEj52TFw0ieHbXF3NevozghXquVmh2YOGVtwTlWNLnGeIKZhAB?=
 =?us-ascii?Q?mf5W4g3xgOYp9TyRJEVkvWYlTw8f5qKvVqU4I3MmqtfXuhUwxYuch1YSZZMX?=
 =?us-ascii?Q?g0a3kplY/0XmUD5E0ARKBeCZLOeH4a2JVnSEPJlp/w35kO0+Zm+Yta8wMM+1?=
 =?us-ascii?Q?90Gjjsjy3Ety2vI7UC6vbsxO4lp7mduiCoTaYMeM3r5S067c2SYykb/krz95?=
 =?us-ascii?Q?PI1U0DefGk8fZvK/DeDJe1YcngHR1CALyrKbdeiVbI7NT85gk8xLY9FP5H8x?=
 =?us-ascii?Q?uG671zLb7EF+yhv4LywBqTZKh43BzaKWYA4DLyWcfk9bhxTnFUHAfvYBaPT9?=
 =?us-ascii?Q?xhRaMrvidAN2FiMrvaINEngR4HYKW9irxY4JL5LFSUOqVFQPdZgi7Nlhm2fD?=
 =?us-ascii?Q?XUgof0vGogMuivN1s39ef8FzeBBItg7JoWoqh+6ePC0aBfxfi9tOcGgXP4fE?=
 =?us-ascii?Q?4LpvxoE+0ok5wDGFIUilLZ2mlWm1Ff4jbF6v92aVUPo3/brVfhgJWJcr4CAH?=
 =?us-ascii?Q?Cr75oenFYtTIcPCcYbcIaIi9u7LdcBt5m10v/TPPfkT5bwZ2kV8fIN/v9qbp?=
 =?us-ascii?Q?sA/dvMnXMOuWGTYDFd3fMVDxH4MU8GL9PdAwXG1N?=
X-OriginatorOrg: vivo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 891097a4-7903-42cc-3a04-08db31dbb90b
X-MS-Exchange-CrossTenant-AuthSource: SEZPR06MB5269.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Mar 2023 11:33:17.8517 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 923e42dc-48d5-4cbe-b582-1a797a6412ed
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: rNGwQo+TaachPIFPXLHXCfKwpv+a+01YIfGrdLdGYwCy90MvciL60eEX99IJ0lAtPVy8iBvc5ydPvhgrwMzdMg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PSAPR06MB3958
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: Let's use sysfs_emit. Signed-off-by: Yangtao Li
 <frank.li@vivo.com>
 --- fs/f2fs/sysfs.c | 10 ++-------- 1 file changed, 2 insertions(+),
 8 deletions(-)
 diff --git a/fs/f2fs/sysfs.c b/fs/f2fs/sysfs.c index
 9ddc6ee19433..2c0b2cb05a3a
 100644 --- a/fs/f2fs/sysfs.c +++ b/fs/f2fs/sysfs.c @@ -312,19 +312,13 @@
 static ssize_t f2fs_sbi_show(struct f2fs_attr * [...] 
 Content analysis details:   (-0.2 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 SPF_HELO_PASS          SPF: HELO matches SPF record
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
 no trust [40.107.117.119 listed in list.dnswl.org]
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [40.107.117.119 listed in wl.mailspike.net]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
X-Headers-End: 1piD0Z-00Ao2A-4Y
Subject: [f2fs-dev] [PATCH] f2fs: convert to use sysfs_emit
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
Cc: linux-f2fs-devel@lists.sourceforge.net, linux-kernel@vger.kernel.org,
 Yangtao Li <frank.li@vivo.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

Let's use sysfs_emit.

Signed-off-by: Yangtao Li <frank.li@vivo.com>
---
 fs/f2fs/sysfs.c | 10 ++--------
 1 file changed, 2 insertions(+), 8 deletions(-)

diff --git a/fs/f2fs/sysfs.c b/fs/f2fs/sysfs.c
index 9ddc6ee19433..2c0b2cb05a3a 100644
--- a/fs/f2fs/sysfs.c
+++ b/fs/f2fs/sysfs.c
@@ -312,19 +312,13 @@ static ssize_t f2fs_sbi_show(struct f2fs_attr *a,
 
 	if (!strcmp(a->attr.name, "ckpt_thread_ioprio")) {
 		struct ckpt_req_control *cprc = &sbi->cprc_info;
-		int len = 0;
 		int class = IOPRIO_PRIO_CLASS(cprc->ckpt_thread_ioprio);
 		int data = IOPRIO_PRIO_DATA(cprc->ckpt_thread_ioprio);
 
-		if (class == IOPRIO_CLASS_RT)
-			len += scnprintf(buf + len, PAGE_SIZE - len, "rt,");
-		else if (class == IOPRIO_CLASS_BE)
-			len += scnprintf(buf + len, PAGE_SIZE - len, "be,");
-		else
+		if (class != IOPRIO_CLASS_RT && class != IOPRIO_CLASS_BE)
 			return -EINVAL;
 
-		len += scnprintf(buf + len, PAGE_SIZE - len, "%d\n", data);
-		return len;
+		return sysfs_emit(buf, "%s,%d\n", class == IOPRIO_CLASS_RT ? "rt" : "be", data);
 	}
 
 #ifdef CONFIG_F2FS_FS_COMPRESSION
-- 
2.35.1



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
