Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F4E57A19C6
	for <lists+linux-f2fs-devel@lfdr.de>; Fri, 15 Sep 2023 10:57:18 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1qh4dR-0005Ap-L9;
	Fri, 15 Sep 2023 08:57:09 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <bo.wu@vivo.com>) id 1qh4dQ-0005Af-MA
 for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 15 Sep 2023 08:57:08 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=MIME-Version:Content-Type:Content-Transfer-Encoding
 :Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=yPtJ74urmQeqN1gu3Mk7RVCkxctDqf5VxvvEmsqBzAY=; b=g0fAP9R3eZHhARXHpwz4pjVlNi
 7nHqBUz5J7MzWJfQh8iKr+Jdk0lFLteCPfZ8SFwLTZtVNw/jG9N0fAFiZo7hrlIgySmWsi7OQwhwC
 lA9f8/8DyYLPc1p/MaYhJ+LKW/awYBVBGafLzs0eoo1H3lIT7TrWpPhyq3CyT72p7TB8=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:Date:
 Subject:Cc:To:From:Sender:Reply-To:Content-ID:Content-Description:Resent-Date
 :Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=yPtJ74urmQeqN1gu3Mk7RVCkxctDqf5VxvvEmsqBzAY=; b=e
 OSkgEkp2C9MSRbGaOr1n8fW9RH0wT0qysj6e0kelAb5GL1Vq0rj07PzWRfcqB4tN9H9MdzLAhpXMw
 wp9mVq4N36jzi2q6YZOSRF7BuB6Vn5d/MBdPgJqTJ5Co46OqxG6Q1mCdKne1g4JeO2/QHIK440Qzk
 vzV7QmrBXmBuQI1s=;
Received: from mail-tyzapc01on2109.outbound.protection.outlook.com
 ([40.107.117.109] helo=APC01-TYZ-obe.outbound.protection.outlook.com)
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1qh4dL-0076BY-Ie for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 15 Sep 2023 08:57:08 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=cJapeBbC4lFX+VLpXuBz+p0KWo19j/2AXRnnpyCGksU+bou91wSJELUqgAzLO/UwPMGifQD6NcsMNNxz4NxCZilQyufdaQaU4oK8fUMAT3Uitllq82XwLNXYss1kQMWNd68KJuJYNTMSCgDdxAAldJruwWmXjID09ETN39kn6MvnbsNvMb7ybfZZOdQgNjn2WLkMud8EeFMWdBxS4hWDE5msL6GhpSu/9cRqoifRoKYqz39PhSiX2K3rVJlVgD6uSNWWL6NUG/Qsot9ENrhG8YGzXdqUJNYPIy34vZ6DiJz/dGItU+TasJddNZIhUNXUBa17ziDTs+Fnv70nlTpyFg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=yPtJ74urmQeqN1gu3Mk7RVCkxctDqf5VxvvEmsqBzAY=;
 b=oUDzt3uuZ2Vu8bacL24h31JAPmjGVxBJ9ahJc8jQReKW4FzrGOYY6F4asPJHcDm5HpNq78ue9HOKk+eNRKF6+fOUbAHE2YtoWo6mCQ1mFz7lA/3V7VeX1LqtpULXW28LdR4Bmm9/4u8G7M0LPnZS3DgxWHnwEM6o6Qt4c0VkFgpXzRVMTsDXglraKxluRqNtLldoOpGgtYPf/tkSdsHqLPVBsO6t4PAzSEoNRGNSvyLogz7jlVEONSt0NKZC3V7xtjInSnsaeXoZgIRq5PO+9XJfnFvNYT7581sXNGtEsl7pBm5qlxnB3Wj089sbvATbQ1078U0UXdAHJBKc6NhYzg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vivo.com; dmarc=pass action=none header.from=vivo.com;
 dkim=pass header.d=vivo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vivo.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=yPtJ74urmQeqN1gu3Mk7RVCkxctDqf5VxvvEmsqBzAY=;
 b=O7vuZelNAQtcbjAYdd8sbTiaUhvWLRE0WbMU9p87wo7BLJ/5PUH3vWcG/tc2FTYTiT0bTRw0mIKxx3OPkudLyYJoG3nXlCZyLNXhnLoG0OaVyteyzkBg9nsW9lzfCUlWASOZd0UUTGGQfAU08TNU7dzbF9pbBKOjsWLtnV2OlGBDFdA9YhffIZTtw8SQ2ZahhMJpeh95HBo/IFysKemUEn2vJqIKfq5npB0siprTGKy1CvP+sUqx3PRwgOTeUJqhmJ/IPQMNeazXieyauasE3zw3ZpPSWjiTSddo+Zf/UfEzRKEzwnP1P/eQmaHU5ygMe48NtPaJbmO3BKsbIVwt3A==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=vivo.com;
Received: from SL2PR06MB3017.apcprd06.prod.outlook.com (2603:1096:100:3a::16)
 by TYSPR06MB6693.apcprd06.prod.outlook.com (2603:1096:400:478::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6792.20; Fri, 15 Sep
 2023 08:56:54 +0000
Received: from SL2PR06MB3017.apcprd06.prod.outlook.com
 ([fe80::deb4:b884:ed42:e52e]) by SL2PR06MB3017.apcprd06.prod.outlook.com
 ([fe80::deb4:b884:ed42:e52e%4]) with mapi id 15.20.6792.020; Fri, 15 Sep 2023
 08:56:54 +0000
To: Jaegeuk Kim <jaegeuk@kernel.org>,
	Chao Yu <chao@kernel.org>
Date: Fri, 15 Sep 2023 03:04:42 -0600
Message-Id: <cover.1694768423.git.bo.wu@vivo.com>
X-Mailer: git-send-email 2.25.1
X-ClientProxiedBy: SG2P153CA0037.APCP153.PROD.OUTLOOK.COM (2603:1096:4:c6::6)
 To SL2PR06MB3017.apcprd06.prod.outlook.com
 (2603:1096:100:3a::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SL2PR06MB3017:EE_|TYSPR06MB6693:EE_
X-MS-Office365-Filtering-Correlation-Id: 50a0af92-9813-409c-fb03-08dbb5c9b595
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: wBsYAE28a396jpXE6RZNnhj3MuD107SQ7DGK1sFRwxSckHi3G7jttRHgkC6uSQu3rMYI3fv7CdarNokRuBonm3ZQTzIj1rUN8kiYEn2sHzwWa6ADEvYgSKNY67npWKZubl5O6OZ/d3f/AFV0K5Spxkhh+OY1tnUV5rpH6Y4zDcJUYrIznxHNqOolBi0U3npBdL5PzgoPipxR9KBBVBaa6lzQycUX/4jCYOmzemwRXq10xr/lwjUA+X6IJq9ulAW7K5U70L36t7uDrCdQy3dSE4ackRJaTA8lPL6WrW/qfO9ctXcXEC5NfZw5QcXZXsocz6vDuNHAuagPHNuCrE/7fKWm84IqLX0tM7+hlD31pKy2qb8qEW9dT/XwfCf7kyNW6v7CzxtoySoQj/tJcl1xHovOGcw2P3qHULsHQX0l933YNTU4EAxP0vWP7LzVX4NNZEQwaJT/pJ8Mc/JGXLkt92FSFfe62bGphWLx5qCSY0anUdSOXTguzXDnXNwHpEN8a0yjwYaqekwB/VZ06+Jsb+0ACMp+ce5FPlaadsYwm00ezflH0DZSIF8G0cKwGtibwXRLO1CYRqiZjUFWXx618wLRbLnVt1DQ8R0JsLFMeOPa7NMVNa479JOBV7jqngJi
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SL2PR06MB3017.apcprd06.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(366004)(396003)(346002)(376002)(136003)(39860400002)(451199024)(1800799009)(186009)(86362001)(83380400001)(6512007)(2906002)(2616005)(26005)(107886003)(6666004)(6506007)(6486002)(52116002)(478600001)(38350700002)(54906003)(66556008)(66476007)(66946007)(316002)(36756003)(38100700002)(5660300002)(41300700001)(110136005)(4744005)(8936002)(4326008)(8676002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?iO1b1KgVNsozxK2xfwL2uP5KubpqfeL+xU5jF0g/HmyDhq2L6SJkIihL6wtr?=
 =?us-ascii?Q?soH8d7loj5+WqapnbUlF8BQNDlF7IQwUPQOQXJbaVG2bR+OvL/ctxLy6XEwD?=
 =?us-ascii?Q?4mqJUxyUyt4GH1MGH9z/voIuZ97v8OaV/F2p5s/DDgc/Ro58SexQJpzrgeJi?=
 =?us-ascii?Q?e9zTh9j0mGe+MCvSMPFQQiESJ2Bu7/QGn9FFal1uo01tc38S/WN1bfr522eY?=
 =?us-ascii?Q?YDC6oekro/YftkWH70dnC7CmbQCzs001ocwsvrNZJj+hjMKdkkLT3ZyoOwv+?=
 =?us-ascii?Q?4AHa9+PSnT14TxhxuH4YO69t7dTTSptsDESvDeV+vZVNDXw6+uH/h2ytK0D4?=
 =?us-ascii?Q?MmppZ++cQ+oOYZsMNLK1tQwNfHw8WUYnEzkCewshWdWSyUCDTy0CsVBFgf1j?=
 =?us-ascii?Q?spzbSw+2sp9u4fmk3SDXBxzETA0pERaxgU5I6WNMdlnwjPxVbLNoaJy/WSXh?=
 =?us-ascii?Q?b/qpiRla+sIq6EzvAxmUQBT66AUntASBOhcHbn5ytztm1dXOHZMTG8DyyjTP?=
 =?us-ascii?Q?PYSoNCn+LdWq2cCgGVpF1xMPemhBUxzichRoX2BuQPWeCtoiYJ9fOxu8m5iu?=
 =?us-ascii?Q?I4kI/ZO4cfzS4XqXK+hp8u3b70rB4WpSsHaQuLJwSzTLEajwQ2uhVpthosJA?=
 =?us-ascii?Q?qoIeuRvEXR0hxQ3HVVqP+q4MIUMg6M8avN1BWrRg3FOqWlWUD0p2eZCpxW9t?=
 =?us-ascii?Q?SHrFiZuP4jJnbwkmllJAmDcGE1Rq4ZQHyTVEx28xF0g6NlcGjirwfgbIGLUW?=
 =?us-ascii?Q?nzZ3QrgTpwp7z4D7BECAa1xPMyLqmApbtgGxaTF4CNCaaJskFQaHdn+hP0dl?=
 =?us-ascii?Q?uwWJwIT9yCd/Y9IVbD3lp9JME7kIEritLbyXiTi1yuVBhzmsR51XixnkvlIt?=
 =?us-ascii?Q?94ENVtRWcvIeFwB52XKKmrb7So4H+Nh0dUcBFcxj4V0q/AI9iAp4r0DrwQN/?=
 =?us-ascii?Q?eSie9nS2sO3nlFhHpey3JwxKgcp0wiY1JhQHGyY19qVJxBJH5J+5UJq+JRON?=
 =?us-ascii?Q?9ECTQy4FCBaCdPx3mSiwcn/PXZqc5OZV6Drm8WX4m0r8HaIgz940Pfec+76y?=
 =?us-ascii?Q?j0YuG5az/f04KMLC4XeNNeiGtRAKcpTFh0tg4oHXrH/bnL5d0JB+GdRwTzHi?=
 =?us-ascii?Q?lJFj1Peqg9f4juNHZ56fRXrzCOuShZFXrRVV3zAD/zwVwdK5xLV5CM8q23mY?=
 =?us-ascii?Q?GtGcJqV57mPf+96stOsPOEcXJJEpNMo5/5Qb1tmFkcZTSzDXJBH8pNM7ULLV?=
 =?us-ascii?Q?6s2sXe2td4AqqfCczD8WCvwz2ztfnfR81gUFu+JghB+YAYg49ULLRnoLYvOq?=
 =?us-ascii?Q?hHelZR+qZ8PBTljeNRTz/j3LZSaV9ATwKSRTyv7tlhIzDN/6QyrfrQe50cVB?=
 =?us-ascii?Q?ML/bRUkpqHRo37+fbPcQnkFwsKihUh7Nez7LgWhoTqEOhUc36Iderg7Lo3yU?=
 =?us-ascii?Q?ilhdcIiooZH2V1vsd9EiFGjGGjorzX40wGThO8LjS++r2hfd3pmK8Y70dSmV?=
 =?us-ascii?Q?gGa71m+ExS4tC4CvPqG2FIDC64YzPyeium5Pa8077fmhy321POBH29+b8ihD?=
 =?us-ascii?Q?icfSonfE0lVrKqQSpKC6qE7cDqfWsOHR+9AHTaXH?=
X-OriginatorOrg: vivo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 50a0af92-9813-409c-fb03-08dbb5c9b595
X-MS-Exchange-CrossTenant-AuthSource: SL2PR06MB3017.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Sep 2023 08:56:54.4762 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 923e42dc-48d5-4cbe-b582-1a797a6412ed
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: WtypZcHaRwmagFW05yOt42qRLhp6Q/t5hQrktC4asvRa8k6lh7V8yZh9A3aPTjOVtFSpBxI77AMAVnSKN5L1wA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYSPR06MB6693
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  When I looking at the performance of resize via flame graph, 
 I can see that 'find_next_free_block()->get_free_segments()' cosume most
 user space time. Every calling 'get_free_segments()', it will traverses all
 segments to calculate the free segments count. And this path is called a
 lot in resize & sload & defrag. 
 Content analysis details:   (-0.2 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
 no trust [40.107.117.109 listed in list.dnswl.org]
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [40.107.117.109 listed in wl.mailspike.net]
 -0.0 SPF_HELO_PASS          SPF: HELO matches SPF record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
X-Headers-End: 1qh4dL-0076BY-Ie
Subject: [f2fs-dev] [PATCH 0/3] f2fs-tools: cache free segments count to
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

When I looking at the performance of resize via flame graph, I can see that
'find_next_free_block()->get_free_segments()' cosume most user space time.

Every calling 'get_free_segments()', it will traverses all segments to calculate
the free segments count. And this path is called a lot in resize & sload &
defrag.

If the free segments count is cached, these tools performance will be
improved.

Wu Bo (3):
  f2fs-tools: use 'IS_CUR_SEGNO()' to check if it is current segment
  f2fs-tools: skip not matched segment when finding free block
  f2fs-tools: cache free segments count to improve perfmance

 fsck/f2fs.h    |  1 +
 fsck/mount.c   | 28 +++++++++++++---------------
 fsck/segment.c |  2 ++
 3 files changed, 16 insertions(+), 15 deletions(-)

-- 
2.25.1



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
