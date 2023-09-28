Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id E56737B16EB
	for <lists+linux-f2fs-devel@lfdr.de>; Thu, 28 Sep 2023 11:13:33 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1qln5D-0002js-MQ;
	Thu, 28 Sep 2023 09:13:20 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <bo.wu@vivo.com>) id 1qln5C-0002jl-2T
 for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 28 Sep 2023 09:13:19 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=MIME-Version:Content-Type:Content-Transfer-Encoding
 :Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=3KMtsiKHYy1xq1klfJWWqCiGsUG002Vy8S9v3ddjc08=; b=WA7A8aiA4A4rcnVJxEAlU38Hre
 Pk/0i1/1re8Y1dziYDWC3oXi/sc7Ah7R72+z7Sy7FzHPR0rX87aa7d+5XrWeLjRdtcTagERZ20Cf9
 E/bRr6tAZBaqeFHNBIy2x03BIJJUgP2/C/zKAONOQEfFq7fejAHjgpPhGUYkc/8Ymer8=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:Date:
 Subject:Cc:To:From:Sender:Reply-To:Content-ID:Content-Description:Resent-Date
 :Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=3KMtsiKHYy1xq1klfJWWqCiGsUG002Vy8S9v3ddjc08=; b=E
 hU1a5L78ciVwcWFSla9dxZVRL9odE+C2xr5HJ6awtKg6bK+dATZCm/TB858cnwwSu6tj+J8MC0xMh
 iOUGmo8q9uNZv2SkK+G6cbgRD7TMTfTIaMLSycvTZalkdThrvMHcP3qV0BvjpSwi9wV60GJsE858I
 995rBM5SylSA2nww=;
Received: from mail-tyzapc01on2110.outbound.protection.outlook.com
 ([40.107.117.110] helo=APC01-TYZ-obe.outbound.protection.outlook.com)
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1qln57-0004yN-FG for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 28 Sep 2023 09:13:18 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=O66y4y6KSLER9wnFmoLtzN7qOhydMdLezG+KKdUFk8NXWmHDFRF3hy9V2q+E96pmbxbUWsM72ImPwuk9CMBAd8FSwx+MDWSSuNxjvTxuS8qvn5AwGKVfWW8NXZRDOqN9/jIdDs7aTraexYiVoWfao7m09SFfdm1E5JR5lDgSLI5fiC/M9FLQGK0H8e5mMWz69EtLRPqqxQkZW3EYzzESroBgmXLjC/gp9vDyeG1rSY97GavjjSLm9RWxcoa5AdqS4zw3hvRCvHa4YHCk0szf7b48Co5x6W6qUa8GCtalvUyPe3VkVOPVU4EpKfZ1LO8pRTbONQbHYFGHCwSfkjRK0g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3KMtsiKHYy1xq1klfJWWqCiGsUG002Vy8S9v3ddjc08=;
 b=OdSTP1NTgYEyWQYVaKuj7vxLI6oONc/QV6NJc/o6oPeJ6Yrwi4T/GhNSofOFyixtUzg9GV6et0INxw19/KG4QVJW0k1dqguzTh4m4v1BQ9UANRuJk33tL1EvPmX22CnUyDpYDLv2ps8ejU1JIZfI4zf/wQLQhp/4Qdq/DXRAkK90QOZeBVZW4wc2X7KPfQEsC80kZ8rKf8ldCwXKXFyHQBBDgA16TAhz8/dWgFKfc4hENjsUdPe9PdyM/aYqSIaRSZMLfvz0DSdc8GqS685n50zQOqQ+gtwdqIPfggTZ2DIf+AsI7dQuUm5lB0qC5CBbUka03hFFrS14AaeA/RS20w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vivo.com; dmarc=pass action=none header.from=vivo.com;
 dkim=pass header.d=vivo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vivo.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3KMtsiKHYy1xq1klfJWWqCiGsUG002Vy8S9v3ddjc08=;
 b=V9KlbKDnYheWFow/bnJPDBS9xVq/z6PuAqhECzCtqfE0A/+eYDJ24q3LIbzNg+tUsDpY1TcAby2HbxM9vIQ+AH9A+YYp7+4vM+rUgY0W8j7K3Lf1FNFagoN59+Rii+7or4fLReUwTYo5zT92BlIhierrtlXgcQpebb94xyxAflgPaZ/9D/J3mePVdh3RlMyP2TiKJ1I2rejMu1Mt4S3mQoi1/kdHzZ9m2ctkW/zQxOzb3DnK/Y1KOGT4sT6Map6I9RdWlGsANQQAb7NaaKHBl7N5NUpaWO6rxNRlOkZRulk4bCWNFippx+9w3AL2TDuGK9fCVCE++Gmvp/ho0aHBKA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=vivo.com;
Received: from SL2PR06MB3017.apcprd06.prod.outlook.com (2603:1096:100:3a::16)
 by PSAPR06MB4470.apcprd06.prod.outlook.com (2603:1096:301:86::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6813.28; Thu, 28 Sep
 2023 09:13:02 +0000
Received: from SL2PR06MB3017.apcprd06.prod.outlook.com
 ([fe80::e1e6:c2aa:6b5b:bc1c]) by SL2PR06MB3017.apcprd06.prod.outlook.com
 ([fe80::e1e6:c2aa:6b5b:bc1c%6]) with mapi id 15.20.6813.027; Thu, 28 Sep 2023
 09:13:02 +0000
To: Jaegeuk Kim <jaegeuk@kernel.org>,
	Chao Yu <chao@kernel.org>
Date: Thu, 28 Sep 2023 03:20:48 -0600
Message-Id: <cover.1695890686.git.bo.wu@vivo.com>
X-Mailer: git-send-email 2.25.1
X-ClientProxiedBy: SG3P274CA0020.SGPP274.PROD.OUTLOOK.COM (2603:1096:4:be::32)
 To SL2PR06MB3017.apcprd06.prod.outlook.com
 (2603:1096:100:3a::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SL2PR06MB3017:EE_|PSAPR06MB4470:EE_
X-MS-Office365-Filtering-Correlation-Id: da962d47-9258-41ec-9c46-08dbc0031d8a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: HBTOBH//uck07RIcQV+eRDfySnm/a0xjBs6hTYvIBAokAr1cUU6wS4DBw9fn7jeU5mORlJSVMpxmI4ZN1rbIN1nN3QVUC97DhMt7LOzkn3xU3GHX63RK3Sx9dasIW0OLeba1cOBJ6jSZ9aTswCzs5WM0b9BXkBTrX00PgipB9rxsRTTl439D/bosF4lVds4Gelv+kwwWqAMbZ9N438lFZqkve1bimOou8B5Pr8F5uZ75oFGX5+CRWPYpWnXwSr/CgHQR4mZzHfJGPeX5ek8liOw3pSySmmb29ha+ApMWmAFynE4S+l/N7vFcdrRT3huFx68qKOK+YOFB645nnlMpwZzY0n/x9fIFo6GFg+zMABJtX8nW65Yiu53du8CwEuTfeZxOESV2RNlpuHBTQLMdzihcS1alQqg1CA723BnYy3cDJhU0MMIuh6pHFGlNCgMNk0vWvLAwSQcZKFzwZdDevBY5/+C6AKL4emSfDYnOVdepBUycII3dmfai/9Bfb4D0DNxXbdSm23XnNqV0HF51I/FI0qSr5mK/BLHBF1XSJy8Zpzba1aat2sG2Qgl3abuGc5J184VPiqcmVPU80FInR1dMD/TFDZUQ+xT0wedpQqc=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SL2PR06MB3017.apcprd06.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(366004)(39850400004)(346002)(396003)(376002)(136003)(230922051799003)(64100799003)(451199024)(186009)(1800799009)(41300700001)(316002)(4744005)(83380400001)(8676002)(36756003)(8936002)(66946007)(2616005)(4326008)(5660300002)(966005)(52116002)(6486002)(110136005)(6512007)(86362001)(6506007)(66556008)(54906003)(6666004)(66476007)(107886003)(26005)(38100700002)(38350700002)(2906002)(478600001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?bBGBGdp8vN+8bA9zki25olaOUBBI6Iey5hYKwFH8MWDMhOeDDiNDRuy1NJEd?=
 =?us-ascii?Q?SK0tHZULAAt7DGCfdfDhfjGfndy7G6o0hfBVC5svSB/Hmmb+To8Sk+RdGkoH?=
 =?us-ascii?Q?XYcbLT8ggZwY7z0N5Utb8+00rGvMWtvgkxLAjM2bb2LkI3hrHIVC+03/7yrZ?=
 =?us-ascii?Q?0xjvE5yaGjq5yETw8bF6JVUg3B/gJxcbr4mR5l5u6E+8o5uZt/45xbOU4qiT?=
 =?us-ascii?Q?LORXLXbkvW+YYuoqOCYfd0YsaPQkT6D/Z+b9wOvj7K0jMDAd3BWZZvSuTwz+?=
 =?us-ascii?Q?4B7fOsuUq5Am3l9qOCGb2S0ywRJkBRyX3eBRcK/IVvPk7Yxtcj6trUlrlx54?=
 =?us-ascii?Q?UZoKWvgrNKHTwFt6EkX9PDUAgfM1wZaynjpt8pIpI9ElQM2x5nx5E2+iiHoH?=
 =?us-ascii?Q?NKF6Fzr18dGtq+fYbzufPqB7Cvg8jgS/o1Ys2V0WCGRyMoE72Ff8d4Ncqlkd?=
 =?us-ascii?Q?YiKP71QjGO0riqIghylVMlhyD0SJv18zTWcFf7m0j4HdFtSY21m30tK8GASG?=
 =?us-ascii?Q?L9NpUuqtD5mwJWs+6O7KxqmR/ii7cLzO70T5sLbbt3mjqDxyBI/OzVbDtSTg?=
 =?us-ascii?Q?XnXBirEelbuYqE5NY5oNfiYKYfRd5jYdu146Fmt9w9V85AIeMxNVgP0+sTUM?=
 =?us-ascii?Q?+VvnOTCJzhkNmCriJTJRdxGa35ShXA/2IhJTzMWfqm5d9Pn6vIvy/tjh/PVE?=
 =?us-ascii?Q?3l86eb8H+rYjyztaEr178SyJiJUySAxIyENWkdnkWrCLCo9Y4hr0py3xvrjT?=
 =?us-ascii?Q?o/JcQ0w48O67FC/qcXCXn174gIFNXZRTYpVzMv78nJ7v39V5oBL9t00R3MGI?=
 =?us-ascii?Q?URT6SC9NFfrZ380xckfO/oO8D0e9Yhy0ckK4jp6CfbJVGDkcND2iQtg7LJZT?=
 =?us-ascii?Q?a1BG+w8sD5p5gilaAGUPYmunB0GOGcMOU4Zgy7ZvtAMcJ0uQ4Owi71TcZ4I3?=
 =?us-ascii?Q?+BFWeB4r+fDJoCR4illlOWuqBwM8wEoH2qP0EbLxqKfCYOhOr5WP34BIbAr1?=
 =?us-ascii?Q?jrzrYYDTiphImZGkp93NXVXwscd4vl4HOOGmV3uVyxbnfqjXGTBquh0nqB27?=
 =?us-ascii?Q?UPI8VIakrhOuWR+lc0d1om+DFk1El+KaezGDC6Rb4KHhNvd6LXIMYlSbXpHC?=
 =?us-ascii?Q?DIILlmK61odTnVGgzPImiY3VcD5fPKoinlpsE5mdUaV1yMpJ4je8A5YskaeK?=
 =?us-ascii?Q?NXut3BMx6S06zyhrWbBn2M+Ye+lCQ6VuQ/MOm7i9hSIffNAeiJe5cGpnbd6Q?=
 =?us-ascii?Q?6okGSzAIfYGLpwMs7MbZqNeH1inPeJO8oRNwWl0QBI4fTTN2fGOxeRjqpEaC?=
 =?us-ascii?Q?umMZaWrmq26mYAg0GwLwqSZ8LOkGMPSvZhMp4IVNoL/Y4SJLAqiCwBTWUAh3?=
 =?us-ascii?Q?s2tJG5C1sr7BS+WC7+FveMjaUVrxwTEC9yguZhpBS9qPtFQ44XulihCkVIr5?=
 =?us-ascii?Q?qP5WV0w32nsAsLlinIbKTZf0Dbt96BK+mAdxm7xzseXt9rqgylgx8E+pQcRV?=
 =?us-ascii?Q?02OIav2eRkvmsx/OlS24zhlNKSVhfHUSLYgQKzkX/uOiiy/dxpyrglibmrwH?=
 =?us-ascii?Q?K/QCCSLCfzBsEOvBkokuoZXhs1hgd1rdUpm/CptV?=
X-OriginatorOrg: vivo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: da962d47-9258-41ec-9c46-08dbc0031d8a
X-MS-Exchange-CrossTenant-AuthSource: SL2PR06MB3017.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Sep 2023 09:13:02.0231 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 923e42dc-48d5-4cbe-b582-1a797a6412ed
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: LpGPiOv8Sjy3+nFAh7niDAgNt24pn5xxoWUYRNtrxLHblRH0l17Tkadas6Mbr78+xUPhcsj5kJHpZkd8y+pLsg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PSAPR06MB4470
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: The performance flame graph of resize shows that
 'get_free_segments()'
 consum most user space time: https://linkthinking.cn/images/resize_flame.jpg
 Every calling 'get_free_segments()',
 it will traverses all segments to calculate
 the free segments count. And this path is called a lot in resize & sload
 & defrag. 
 Content analysis details:   (-0.2 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
 no trust [40.107.117.110 listed in list.dnswl.org]
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [40.107.117.110 listed in wl.mailspike.net]
 -0.0 SPF_HELO_PASS          SPF: HELO matches SPF record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
X-Headers-End: 1qln57-0004yN-FG
Subject: [f2fs-dev] [PATCH v2 0/3] f2fs-tools: cache free segments count to
 improve perfmance
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
From: Wu Bo via Linux-f2fs-devel <linux-f2fs-devel@lists.sourceforge.net>
Reply-To: Wu Bo <bo.wu@vivo.com>
Cc: Wu Bo <wubo.oduw@gmail.com>, Wu Bo <bo.wu@vivo.com>,
 linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

The performance flame graph of resize shows that 'get_free_segments()' consum
most user space time:
https://linkthinking.cn/images/resize_flame.jpg

Every calling 'get_free_segments()', it will traverses all segments to calculate
the free segments count. And this path is called a lot in resize & sload &
defrag.

If the free segments count is cached, these tools performance will be
improved.

Changed in v2:
  - Fixed some logic issues reviewed by Chao Yu

Wu Bo (3):
  f2fs-tools: use 'IS_CUR_SEGNO()' to check if it is current segment
  f2fs-tools: skip not matched segment when finding free block
  f2fs-tools: cache free segments count to improve perfmance

 fsck/f2fs.h    |  1 +
 fsck/mount.c   | 25 ++++++++++++-------------
 fsck/segment.c |  2 ++
 3 files changed, 15 insertions(+), 13 deletions(-)

-- 
2.25.1



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
