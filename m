Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 12D5B60C89D
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 25 Oct 2022 11:45:22 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1onGUn-0000Ap-2g;
	Tue, 25 Oct 2022 09:45:17 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <zhangdongdong1@oppo.com>) id 1onGUb-0000Aa-EY
 for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 25 Oct 2022 09:45:05 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=MIME-Version:Content-Type:Message-Id:Date:Subject:
 Cc:To:From:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=2eGU/XsMxjuJNUWGJXzbLOgaQ5GEFJ482dBFKE64vKI=; b=lCzFXMqNl2Gd4dt5mN2PPwhQUv
 76vcKQh/tsSpQ0QY1ifKd9TxyIgcwwDSv3WPx415NPPMWMH5GW81XWqnNj0m1i5InLkekAWeXFFba
 QmsqIUBbxV9mmTYmXRC0Ps54BWgKMMNRZhDE+5PdsgvK00QfNUCvQHM/hK4njjsZozYQ=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=MIME-Version:Content-Type:Message-Id:Date:Subject:Cc:To:From:Sender:
 Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
 :Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=2eGU/XsMxjuJNUWGJXzbLOgaQ5GEFJ482dBFKE64vKI=; b=Y
 I01cDUec98KIvWlGtkmVGVOBRDW0D98G47PqIw3KKWMtKcoW05jvC9LXswMD0CLlKRAbRRFMY1Ksf
 hIetW3+FTpr7K7IO24O/DmgXE0wME8Ng4IKOcrMqxhSzkxEyfVLOdNPsUmp8RZ/VqebfPTXguQPDI
 TT3mlYuXDzJ9q6M4=;
Received: from mail-sgaapc01on2056.outbound.protection.outlook.com
 ([40.107.215.56] helo=APC01-SG2-obe.outbound.protection.outlook.com)
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1onGUU-00Gmdv-Ql for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 25 Oct 2022 09:45:05 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=GxWFsGJX1oMUY81W2yR42tIKlv6l2sqkm4EKQW+YcUNGoJ5+OVvDf/nJslYII6TcJWw8SYhTG1FLCnCWqj0QeH97CwFo60279buoXaMSg4T+mgxxJZeRDScnISN3ffqxvyvHVF/rxbmd/gJkHEVPMbPUGqSN3OHszJecuv4Bd2U2o7X0LhLnaJRmw24diG+tTZs/kQKUAtcFRZF4S4oklADdiEPvkyZC/iVizIlUckaovXgLB8s43h4xjjr/Ah4exHIheNuHN1c43K3OofW9yrtiodTCUJ8imqoTgWQxBuRyaT4hheukBkQBXmBHRP/bwvSTtlQlkq+XMxlrDq7CmA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2eGU/XsMxjuJNUWGJXzbLOgaQ5GEFJ482dBFKE64vKI=;
 b=JYneApSxEPKutPWLdfhab6oLVvv6WkD38pofMWkdYd+6c2JpmH1wL9eFtYk5VJKtRZcKcrvPLVRdWuqGiXpex7XVW98qh14mFJrLG6W7+OX4GUbTTacifJt+XfH4uzQirmwM4YVE3giHUKkcwqil7uoMmNj6TwxDF3OqfMQkElC4Dpw3fh+CshF+zKXdPuy8nPFGAg4U5D7Ib59A8OQ1YkP05r6Ajw9+R9Ke8/yN8toR9BiSxJN3II9c2Rr9aQqOn93/ntRZP/SUhihjG1DkN7kWsKOqkDyHYKVJvtWUanbTHtJhqGiFfCZxpE6oybksSaIQmwxbpK/fzoTXJ98OIQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oppo.com; dmarc=pass action=none header.from=oppo.com;
 dkim=pass header.d=oppo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oppo.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2eGU/XsMxjuJNUWGJXzbLOgaQ5GEFJ482dBFKE64vKI=;
 b=rsym37EJly/T4Mr68NsB5E69ALoQD157lxTvdOS2gde3iqco2upYEeVWKa7p3gva79BBJ4AWNAGYllg9TrANtLI79TD4OReCEW3kWqRiuJ1CXgq8EJS77RK5dQC+o5TXmkANQFq3DsFw8uUb+IqACldzRhIHwt4p7aqU/f8hITk=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oppo.com;
Received: from SI2PR02MB5129.apcprd02.prod.outlook.com (2603:1096:4:15e::10)
 by SI2PR02MB5610.apcprd02.prod.outlook.com (2603:1096:4:1a9::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5746.28; Tue, 25 Oct
 2022 09:44:50 +0000
Received: from SI2PR02MB5129.apcprd02.prod.outlook.com
 ([fe80::711d:e5bb:1951:139e]) by SI2PR02MB5129.apcprd02.prod.outlook.com
 ([fe80::711d:e5bb:1951:139e%9]) with mapi id 15.20.5746.023; Tue, 25 Oct 2022
 09:44:50 +0000
To: jaegeuk@kernel.org,
	chao@kernel.org
Date: Tue, 25 Oct 2022 17:40:36 +0800
Message-Id: <1666690836-388913-1-git-send-email-zhangdongdong1@oppo.com>
X-Mailer: git-send-email 2.7.4
X-ClientProxiedBy: SI2PR06CA0017.apcprd06.prod.outlook.com
 (2603:1096:4:186::15) To SI2PR02MB5129.apcprd02.prod.outlook.com
 (2603:1096:4:15e::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SI2PR02MB5129:EE_|SI2PR02MB5610:EE_
X-MS-Office365-Filtering-Correlation-Id: b477eeab-1dd8-4fd8-b9ce-08dab66d8f88
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: +u8ETfCUUsdiFKp5iXvDqCyyXJ9CFjKz2dbFM5WVhANWfi2Cw70/j27x5PRub2u26pQeh2bNLWtHz78JnwDX0x2RntEMrphUzhYIJfK8EwqxqnAzHI0P6nWbomhrT5B9REC3k9eF0ICeFw976Knbyi425pMIT/5rrmmf+NMljndkzEaEJn1BEjKSEHSBBxNrkqm3e6ln87OCTbEqKQK5myVAP3AXpCIduBmMWQ7MyP8QJjvP9zI38qnaVn/yS7nBIDxKzrPjk9r4lKMmq+XJz/VGouvPWy7R52l1fCpUbCnz1JRw5a14v3Xp8Xzt3fV1OdSXopDHzYrR6x/21VhurwiX7IMFWJq7SOJWIYIwu+Xhh5jMSOUOBjDoA0e2x3RhZcGWdSCDrGGcx/XCweNfSM8HQ59kdBoNOZskizQYGOkoL1jll69IgEUw5v6QTd3M12cqbBzr3U/kNkq5CXt96WgtggDpNrvnTdeLBCSiQAxENnTd60fhhzu0ZsjidW60JvwBJ+boxA7+qCkZbwVkrH12ieL45wKey8cuxiouMILXBpsWyouumXayaAiH25WzufxWA6ayiq9H964/F4INdnRb/YMY89tzqT7Ta3d/8eHM/voZexHoBg/pN7w06kqQJBShajic8BpTYisPjMo9dKnGSQZM/Vg5Wy3o1d9N/nCJ9at3Sl8Y5PHOvQB5OxiSju/6guhhnD3arWnybzATRXykyjkVacIY24N7bFwcnpRpKD91wWHexspToW2DqtaPmXQz8CM/IGECtMi1/1D1bw==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SI2PR02MB5129.apcprd02.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(4636009)(366004)(396003)(39860400002)(346002)(376002)(136003)(451199015)(36756003)(83380400001)(2616005)(86362001)(186003)(38350700002)(66476007)(66556008)(66946007)(5660300002)(41300700001)(8936002)(2906002)(4326008)(6512007)(478600001)(6666004)(52116002)(107886003)(26005)(6506007)(8676002)(316002)(6486002)(38100700002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?FW48K4pKFuC0rJz7sLSPB80x7Yll1JHp2WFrGmWXA+uzD25gGuoHikwECkqJ?=
 =?us-ascii?Q?QgmU8Mm/p6TXulNa5L2PplDO9rzdnkuCKAIxM21D3qlxPcEyoODcL1tsldKj?=
 =?us-ascii?Q?iu7QoqDubHreWbRnMsWkO09MdkxrD2wbneZK+dk4I33r/B96AK33z1E4N37c?=
 =?us-ascii?Q?mXVKRSDs0JUuZQF8aPfef3PqUYkhxsVxbfpceU5RV/iDBV6Aa1QurV8gmJf0?=
 =?us-ascii?Q?1UHWddNdG/V3hbizKhBrl3TgpYmoh5wp9EWfCM7kkL/+dUtfDR0Bw5AT/L75?=
 =?us-ascii?Q?+JUF4SP0oc2cUQND4+xkR2HOcWWpMJdVZoL07qvGJS9337ZSlif5DuoPuFdb?=
 =?us-ascii?Q?hVOO4s2u+yWY7dUFzuA8DKqX901us/Z3GwCJrsjA7jqppfwAI4oxN9WiScWT?=
 =?us-ascii?Q?3xaH7AThHElrm8tSgSumzP45GRVkM9/WRl9r/Q7ocJJ1EhBKiFr2MvEbBype?=
 =?us-ascii?Q?PWa0F6EKLk8bvzyB7wyASANBPGjB/lIN63+/6k/4VcOlC8cR4MGQA6643Gr+?=
 =?us-ascii?Q?p/+76OeMCzwUIh8kR68TxAnesn9Dm4PLerY2KV4t4EC1pJUEWH39cGOZT2L9?=
 =?us-ascii?Q?twHYd9DKQ58T2r4/buYAvn8rQhlbOdRswVzR6nuTxXgGerN9LfAiFTT/ifE5?=
 =?us-ascii?Q?PXYZgmg1E9TGWVUhLNpEa1Sqd12KZXvw2QD29rCCmBY2YEUqiLPB1T7cslpN?=
 =?us-ascii?Q?ctmjiaYRfAjUMR2KEj/SZZakouxGpBmrAtzxvD4WzEAmKlhtcTnz9M5EcsIz?=
 =?us-ascii?Q?m7s8eW6CWTHhnteyJm5o1z5RYNReWt41ai1KjjCiro5FZA+8HXvRk44nhX73?=
 =?us-ascii?Q?pw7XuY6zBSzloiXEMEA6WDSYEklTn10fBcWu7LnvvJRmJY0q54URSLw+5ZZ3?=
 =?us-ascii?Q?IO/SNEhOLt6pIWxUdnRLk2q7cD0z4NpGC3hE4tQzipNihhDhC6XJQy1fmJjx?=
 =?us-ascii?Q?2v863Fw0GxnGiQqierrvL1+duudl5N2fT0fH9812gedZwf6vjMcMkzSQpZ+6?=
 =?us-ascii?Q?w7Vp6Tk+WD4AmfuAY50HpbA3UMrVDO58EfHcLtkHHR3la7xiaTfA5LZGq3ro?=
 =?us-ascii?Q?h1rfLDvwTnpWkJZGu14ovWn1tEJjpomNw34FC9LI2ClaP7SkR9d1sPkAUKHp?=
 =?us-ascii?Q?FF2cXFIJ3ajsWweUPEjiyVEEy7fI2eF8w1fzecxVME+JVQrbUEBggCPWd1hC?=
 =?us-ascii?Q?8mAXvZg4/eQOr8QvkZh5+DFlDeLwBmqXM4q/3FUafmn/k8JnSSp2jW/1rgE6?=
 =?us-ascii?Q?Bh+h9S+3NV0rwxq1ygzqdXiIb8shdOA2zjIe/+orxyOmZivC4HfrU4uT8MnF?=
 =?us-ascii?Q?Y3pJ7HnP1AydB6EWk1TCVuGYq6gUb4xiAY+/mSE+ZC2lwG5iLUeU+6WRa2X7?=
 =?us-ascii?Q?r9GhVhNIG0UM/CAM0w4LQ/W99aPpc3jPeNqGnJWMjbA0MJY2h2bOqNBzBCdl?=
 =?us-ascii?Q?j0siQUE9ejlhV8u8wkpV++3EyWTaTbIdalv1NM0uamUdABzX0DF9uqyiRTpY?=
 =?us-ascii?Q?x1EKFtsrNnoBKRRKYa8kJK1e6POWUb4z04h9mtGPahyYFVQw+e/ImfKxrbQZ?=
 =?us-ascii?Q?TTYa/fRX0xMtlVI+XvBRuPAzuwAkmLzVedlLOGQJxpN2ZpEnDPoUazIxXU+S?=
 =?us-ascii?Q?XQ=3D=3D?=
X-OriginatorOrg: oppo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b477eeab-1dd8-4fd8-b9ce-08dab66d8f88
X-MS-Exchange-CrossTenant-AuthSource: SI2PR02MB5129.apcprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Oct 2022 09:44:50.4014 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f1905eb1-c353-41c5-9516-62b4a54b5ee6
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: oTXfNQRQyAwyi47Td0cR66CandU5wH/bXRum1NuwWB98i1Zp9YKwXIftwEEGw2Mjfp+ll73YBeWPJe8MUQUTsQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SI2PR02MB5610
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: From: Dongdong Zhang <zhangdongdong1@oppo.com> In the
 DPOLICY_BG mode,
 there is a conflict between the two conditions "i + 1 < dpolicy->granularity"
 and "i < DEFAULT_DISCARD_GRANULARITY". If i = 15, the first condition is
 false, it will enter the [...] 
 Content analysis details:   (-0.2 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
 no trust [40.107.215.56 listed in list.dnswl.org]
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [40.107.215.56 listed in wl.mailspike.net]
 -0.0 SPF_HELO_PASS          SPF: HELO matches SPF record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
X-Headers-End: 1onGUU-00Gmdv-Ql
Subject: [f2fs-dev] [PATCH v2] f2fs: fix normal discard process
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
From: zhangdongdong via Linux-f2fs-devel
 <linux-f2fs-devel@lists.sourceforge.net>
Reply-To: zhangdongdong <zhangdongdong1@oppo.com>
Cc: linux-kernel@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

From: Dongdong Zhang <zhangdongdong1@oppo.com>

In the DPOLICY_BG mode, there is a conflict between
the two conditions "i + 1 < dpolicy->granularity" and
"i < DEFAULT_DISCARD_GRANULARITY". If i = 15, the first
condition is false, it will enter the second condition
and dispatch all small granularity discards in function
 __issue_discard_cmd_orderly. The restrictive effect
of the first condition to small discards will be
invalidated. These two conditions should align.

Fixes: 20ee4382322c ("f2fs: issue small discard by LBA order")
Signed-off-by: Dongdong Zhang <zhangdongdong1@oppo.com>
---
 fs/f2fs/segment.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/fs/f2fs/segment.c b/fs/f2fs/segment.c
index acf3d3f..2fcb140 100644
--- a/fs/f2fs/segment.c
+++ b/fs/f2fs/segment.c
@@ -1448,7 +1448,7 @@ static int __issue_discard_cmd(struct f2fs_sb_info *sbi,
 		if (i + 1 < dpolicy->granularity)
 			break;
 
-		if (i < DEFAULT_DISCARD_GRANULARITY && dpolicy->ordered)
+		if (i + 1 < DEFAULT_DISCARD_GRANULARITY && dpolicy->ordered)
 			return __issue_discard_cmd_orderly(sbi, dpolicy);
 
 		pend_list = &dcc->pend_list[i];
-- 
2.7.4



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
