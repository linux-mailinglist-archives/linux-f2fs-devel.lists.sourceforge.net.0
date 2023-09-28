Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id E9ED27B16EC
	for <lists+linux-f2fs-devel@lfdr.de>; Thu, 28 Sep 2023 11:13:33 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1qln5K-0006JY-JZ;
	Thu, 28 Sep 2023 09:13:26 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <bo.wu@vivo.com>) id 1qln5G-0006JJ-FC
 for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 28 Sep 2023 09:13:22 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=MIME-Version:Content-Type:Content-Transfer-Encoding
 :References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=qWoJu4PSEp567e/EuMA/5swa5Pr0+sbKXkJpGDnC5eA=; b=MjO9hJLf1EyKf+XZ4ifJQCj++N
 bQYLzoxX/D/4Rz+QcLCKwk2qv8Jy9D/KYYOEIjn42m8tVS6sLaIBdMJQzHi7AxhhFsUR9zq/Ty71r
 tp5tI52iP8mbKwcQ6XLKWObcDrc/TJfyy+jCicBYaVbL8Qhi1NFguZ7LUMHchS/sbcnk=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=MIME-Version:Content-Type:Content-Transfer-Encoding:References:
 In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=qWoJu4PSEp567e/EuMA/5swa5Pr0+sbKXkJpGDnC5eA=; b=UC6X5kKExTHjs4vZwkQCGpLHM3
 W/G68Kx2YNvnaXdEAtBxSCCAHPH43vAYjCTw0LA8cm0Zl2cMfE9ND5bsfDPi8niu+y41uo/kVvzZI
 UB1lIIdJkl5moWs5opMGeUzB77kUD7YI0XvXIdyo8FvNnO9C+Tb0zvKYzoYvSoypx3n0=;
Received: from mail-tyzapc01on2110.outbound.protection.outlook.com
 ([40.107.117.110] helo=APC01-TYZ-obe.outbound.protection.outlook.com)
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1qln5E-0004yN-RT for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 28 Sep 2023 09:13:21 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=NwirVr+Pf7XWxxuWBG7oqjrnFQbF281jg+V3yNw/vZ6lcRbJVj8sOFy4FIDMwhpVjTGpBOxhaWr1llLhvaZuljxdiyNVNSDhEkKg3FSRfSjMLsB8jhPQV6qscDx1ZaoLPeIiqnA2QKBdfqB2nig7PN8Xc86MF5kqPkQmoSl0BcxrC63apQBJbafuoQAqxniEudpLU0SJhcmlublGw0vqGQVT9mA45eQouxKkGmebNUo71Gn270veRKAdkl0AjsjXfe7jZMTPxbdTKiOGntBmqBtN6hUKvzjL9oX7HliqX6Vj4yQMtya0ferWZK1jV+8iC7bT1g/uDDZIyO1V2FxqTQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qWoJu4PSEp567e/EuMA/5swa5Pr0+sbKXkJpGDnC5eA=;
 b=On+HvQLeHn2c1ShaNHOlLIDv/xCz6CR95aGHj+FJeAdGvi0RUOzpqNwdpPrwnrkpNquNJvo3eknx7H2QHBpq8QaKMaL0GiZfjq/2JR8LuDdeZ9Kh6xeWATiGW6bHxc8M2WXP/mqJXQHvhENzi8e+vFGh++c591CJV3r64n1sa/RssTCdVUSAFMo7sGE5wU95L1tfcvrbKEc33rLeEAA5LkfKzKgZDTg102rLsfJIFV5CcG9KNHaBkrsGCEjvwTuoEEB63NXt/036UWpfoY9PkJn7HsFT7Hu/5beKFi+R5r1gyEHkV++dBHttLZZCbTkfRfnVAfrIuEB7Khje4LK9JA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vivo.com; dmarc=pass action=none header.from=vivo.com;
 dkim=pass header.d=vivo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vivo.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qWoJu4PSEp567e/EuMA/5swa5Pr0+sbKXkJpGDnC5eA=;
 b=PyOnjX7XkBDRAeh+L21YRGAG92mTIDZo6YeaqHh7xh9XipW6MR45oSQJxv6JJaegq37w4SdLBExttjjJx6Bn1zdK09H1sPfKsN+JnhHTr3tEudNl/m8xE8S+YjXbXQtEvp1dShg4EtoL+fKMrBUljdUpOzILrCm0cnSFkDOljc6eShI3BhLf+ZwTYPpSUbYDtc2eqOBQi3bWKtNtr4vnfe+jiol3EdzHNuLswwA+ySLXtmmlViN4bPju4N2MXDsqfCqRP6YJtEl5JG6aJyAoRo7Wc1OupEPO9J5pcd+RyVMelAxnsr6l9EdGDMdve6hXC4wT7BEC++0d/Xd26cxysw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=vivo.com;
Received: from SL2PR06MB3017.apcprd06.prod.outlook.com (2603:1096:100:3a::16)
 by PSAPR06MB4470.apcprd06.prod.outlook.com (2603:1096:301:86::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6813.28; Thu, 28 Sep
 2023 09:13:17 +0000
Received: from SL2PR06MB3017.apcprd06.prod.outlook.com
 ([fe80::e1e6:c2aa:6b5b:bc1c]) by SL2PR06MB3017.apcprd06.prod.outlook.com
 ([fe80::e1e6:c2aa:6b5b:bc1c%6]) with mapi id 15.20.6813.027; Thu, 28 Sep 2023
 09:13:17 +0000
To: Jaegeuk Kim <jaegeuk@kernel.org>,
	Chao Yu <chao@kernel.org>
Date: Thu, 28 Sep 2023 03:20:50 -0600
Message-Id: <ea4273b977dcd05522ffbe4c6d84d44ce202d0c7.1695890686.git.bo.wu@vivo.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1695890686.git.bo.wu@vivo.com>
References: <cover.1695890686.git.bo.wu@vivo.com>
X-ClientProxiedBy: SG3P274CA0020.SGPP274.PROD.OUTLOOK.COM (2603:1096:4:be::32)
 To SL2PR06MB3017.apcprd06.prod.outlook.com
 (2603:1096:100:3a::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SL2PR06MB3017:EE_|PSAPR06MB4470:EE_
X-MS-Office365-Filtering-Correlation-Id: 7e94b392-2a00-4a12-564b-08dbc00326cc
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: mUrwDAisnuspFwO1TQYUusi2/3SQ3a/7BOwWDUWvRWAQl/DP9NPR/gHCLRlUjab9fOXmcDTII/SSh0wzg7DNXWRkkmnz1ruVBSp8yqi4hTqt2idVQgKdeA1B2iO4iZaiQBcPDM/dmXbvI3vegCJuS8Z1JnNYQn2TwQkxXK9wdp2I+uJPNW2wFQEduBYlJrFkCKYy3jdWh3C7fLnRcZVVyogdnqWvOOBimE1qCbdDE/SN6RvqmYCtWp/00NLabK7D8QmyBKUBOBx+LS7FNB2wNdKR6KqfF6MnEWF2sqwqBUr254J/gEGqe9yR88FSZmjUyYf2MENMHY5+6Mn07pS7Ap8do1E1GUhq52qXdA9z4rQnXqZJKtgal98/dT6987ExsAwK3fRGSainvGn/Zw5rDHcZxQhsBUg9xE4HOWZBiEfelrQz0DKd4iJs46yp7IrPy2tAxQaQHY99GDYQO1s2INQIw02g2ufWMHNp5RlWtXWY36LUFHZXLf7HvxObCb8zWEo5+MvWmV/8fpgAth1CvReMIaP1LcQOD0Fh8FT+zgmD1KWZ0hwRxyKJ8VAQ/CK+qXhYuBBDdIWuUkrMuYRbHJcvHekzBP2j3GA3if2qMZ3iEsdZeYbC0mzSGxWqrlEA
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SL2PR06MB3017.apcprd06.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(366004)(39850400004)(346002)(396003)(376002)(136003)(230922051799003)(64100799003)(451199024)(186009)(1800799009)(41300700001)(316002)(4744005)(83380400001)(8676002)(36756003)(8936002)(66946007)(2616005)(4326008)(5660300002)(52116002)(6486002)(110136005)(6512007)(86362001)(6506007)(66556008)(54906003)(6666004)(66476007)(107886003)(26005)(38100700002)(38350700002)(2906002)(478600001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?rRnbNGXXBVXd+fhq68b9MPKXMusBBYbpYUqZ8VJIwVRDsdx8uKRfo13dCUr9?=
 =?us-ascii?Q?R6Pqg9h7WmnZvkNt0IEOzJm76ZQiBXTYdML1W19yEBvhxzqgTnRAyt4xEA1R?=
 =?us-ascii?Q?gDbD4CffUoAyipyqYOOxPC7oLVgd6bNhiSs7s9fmvtyb1SCpMdHfOsE2rqvO?=
 =?us-ascii?Q?IbB8JRLc82bJ8Li90fAAV3NvrsTythmcpaLHv65BA6fpExR2eplsSUB1BrL4?=
 =?us-ascii?Q?RUiTGw0RDzWo0tPJRyhdsg1tcJpiOZiYZZgMCGqNDiOdUyeX3qoqdC2j7HPb?=
 =?us-ascii?Q?EQLhhtdN1QbJ8voCMLKMsz4NJp9Oij3JB7ZguWuEmdzhkt3/uyVuTN6+NcBt?=
 =?us-ascii?Q?prpcQ6ceJP1i9da16GtRXHsDyFrR0EQbAmVLcnoCm6fXrOGYBIkvKovE60YM?=
 =?us-ascii?Q?1hOCAV866MNwYuNtGHaUIEPkZznaDAmPV3fW7XzQGjsklXRvLGclHljrJKz5?=
 =?us-ascii?Q?Kw9ApDHaoXXWb4Xj5M0oIdLmbgjRLiqeyHAQ9kdFj1MncEaZFOcB6GUtAf+c?=
 =?us-ascii?Q?giErEegqvAZm1Fg+MPLRb0+zwbBXshN9FANObC1rpiveHuOOQwECFL3RxEa0?=
 =?us-ascii?Q?ybuHIKhoi6KO0tfQEtR91jSGS0fMZL9tAAPDdYJx8w3DKO/ilzC85J5neLVH?=
 =?us-ascii?Q?90VDbA8YQeYCNFiFXwJ/igfqTkKVIA4E4V6Z0RPeLsjUD9vsQgEF3mutVwa3?=
 =?us-ascii?Q?1nR81vOBPrCBP3q1XXqIKfXpVc3+dZHh7kTNCk0KrkZICXCou54EP1JKhEfG?=
 =?us-ascii?Q?oNo4rc3QfVzSxYAJO0CHnqmvbVIYC2iqTsPiQsz0w0wvB6ln26L85nsRINrj?=
 =?us-ascii?Q?S+qSqbBVdP5I/05cWgyt0pj4J7A4tPmETMaib5oisA6I6N9kZ17bg6lEgtlb?=
 =?us-ascii?Q?lqJ5uUOPHxZNsW5b+Ap2aUriQ4rXNv9/7WdlKh9CHudrBI3QJT8D7UI92TnF?=
 =?us-ascii?Q?zJoa42KPAtX8+jxoD3+RE0uadeGJ5bamc4BEvvTf0jetpk7hUY8pFm+l5hg5?=
 =?us-ascii?Q?YghM3MXJZNxeyArGaL7IggcK8+zX/MsSuKBwstzupFnreyw+mVKmbL7LYtB8?=
 =?us-ascii?Q?YS4DJZq0MldiKo8zjSlc4CAoamF6HEB3T/rWAeqkIQqaxREqx3ArVO6BBO1W?=
 =?us-ascii?Q?4N3ktiZTDURSUIojl2vEE5EvXr8FM5qzvAqG5HpEt4N10HrDF0n90f9C4o1C?=
 =?us-ascii?Q?oMY985HVfO8ciwdmEjptRCFwZRerzX/SNSMMpEWLuetQHnHxpCctOeY6JVV+?=
 =?us-ascii?Q?Pg63AOk5kF6fBJG4PlGD5scQcRLl/54JpB/rNXXTdKYtS2IYS7HdU6VKQ01C?=
 =?us-ascii?Q?Me+A6KY1j2pdu+myu6QJcARiXfkUvH6HKjGm+xwDDWqloefxexxo4aLPYIbA?=
 =?us-ascii?Q?eANAjpdkh+PC987mhydw/0mg50qq+OzLYNIvO13nV7d1Ldsz3Z3z09N3KkNw?=
 =?us-ascii?Q?Hsf6XSKP3oBJ9yGHsNAoka+XYLLevtFqtQsXCQhKPjvnxH7fNf5tza6joLyU?=
 =?us-ascii?Q?m0cChZbVr0mug5DpKiQnaQNlNabxjIN4+VD+BTePVrJdumPSZbkl4FAqeC+o?=
 =?us-ascii?Q?LZOfX5yFmMClHqLZglHmmxHmqyYT8fCLB2QxPBW6?=
X-OriginatorOrg: vivo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7e94b392-2a00-4a12-564b-08dbc00326cc
X-MS-Exchange-CrossTenant-AuthSource: SL2PR06MB3017.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Sep 2023 09:13:17.3706 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 923e42dc-48d5-4cbe-b582-1a797a6412ed
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 4aFFXu6B0DnKRXLBuhYqQyuB8XCjfHnrINYeUNDGpi4YWCSHtG2rKErQFwXTCchpB5zRp5hUDuaV8oWkhqhHbA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PSAPR06MB4470
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  If the segment type is not matched, goto next segment to save
 time. --- fsck/mount.c | 6 ++++-- 1 file changed, 4 insertions(+),
 2 deletions(-)
 diff --git a/fsck/mount.c b/fsck/mount.c index e4372cf..098e73d 100644 ---
 a/fsck/mount.c +++ b/fsck/mount.c @@ -2852,8 +2852,10 @@ next_segment: }
 } Content analysis details:   (-0.2 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [40.107.117.110 listed in wl.mailspike.net]
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
 no trust [40.107.117.110 listed in list.dnswl.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.0 SPF_HELO_PASS          SPF: HELO matches SPF record
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
X-Headers-End: 1qln5E-0004yN-RT
Subject: [f2fs-dev] [PATCH v2 2/3] f2fs-tools: skip not matched segment when
 finding free block
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

If the segment type is not matched, goto next segment to save time.
---
 fsck/mount.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/fsck/mount.c b/fsck/mount.c
index e4372cf..098e73d 100644
--- a/fsck/mount.c
+++ b/fsck/mount.c
@@ -2852,8 +2852,10 @@ next_segment:
 			}
 		}
 
-		if (type == want_type && !new_sec &&
-			!f2fs_test_bit(offset, (const char *)bitmap))
+		if (type != want_type)
+			goto next_segment;
+		else if (!new_sec &&
+				!f2fs_test_bit(offset, (const char *)bitmap))
 			return 0;
 
 		*to = left ? *to - 1: *to + 1;
-- 
2.25.1



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
