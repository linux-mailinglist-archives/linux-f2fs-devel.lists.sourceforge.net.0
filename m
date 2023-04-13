Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 40D126E11FE
	for <lists+linux-f2fs-devel@lfdr.de>; Thu, 13 Apr 2023 18:15:27 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1pmzbW-0000bA-9L;
	Thu, 13 Apr 2023 16:15:23 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <frank.li@vivo.com>) id 1pmzbU-0000b3-1b
 for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 13 Apr 2023 16:15:20 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=MIME-Version:Content-Type:Content-Transfer-Encoding
 :References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=4jamtrcTZUWgeKzoc1VFbcJzG8oRgxzYT3CjFO5UYxs=; b=KGQmMra3X1vbhYKEzCzIJiw6UT
 Wdzsi8JeXS514Bgc10jX9SCT2CUxRzs3j20etPCine6QPGarnbCiVxZgziFOFw3gDxCssGpbeou9N
 cpvbaBK82SfOtiC6WGeb0Lvo/UPVtHOVfxEurfh4KMfVcvE4LJjCGWL9UdIUEXIKvLYw=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=MIME-Version:Content-Type:Content-Transfer-Encoding:References:
 In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=4jamtrcTZUWgeKzoc1VFbcJzG8oRgxzYT3CjFO5UYxs=; b=fXQKIoepb705FrBvdBVwCksa0c
 pWrS9yhb4lqIKdTYugGoQplMsv+6rYWJLriCWbGyT+wXufQVKSPcqY6vKyk0TLImqa/GJcTJomM78
 R32exCY4J2lfOP1y3rcj27zWpCbmETFaEim+6BXC5j6AQSF56SGou213bndsJngaRa50=;
Received: from mail-psaapc01on2118.outbound.protection.outlook.com
 ([40.107.255.118] helo=APC01-PSA-obe.outbound.protection.outlook.com)
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1pmzbP-0007RM-G5 for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 13 Apr 2023 16:15:20 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ahGzNFSLotPVEGzRi+C8WvrYcWe8EPAAvfbKeTQKXNsEggGTBg3GB7KDNWWMhAokC9XNRCIUbVwNWcjdTxq/+WFOqw6qAjE1dJenOoHtldUnuCcPL2fzHkC6dpLH7m2tYBx6yDPpK8dGbHuid9v6Janc9k/DGR23HiPcKPcubkcoFcutAI7vjCTYhl71S20vM23E2Q1TP0VHU07xG7wmJbfGoOQDBrWAV+hY2sj/mysczlUIQAoAJfY0TedxLuX7EKAJWusxXah273/DJRpdVnyzqPau46qebsi6c5PwiKEXnDHz/AXMMi6S5mI9YIiuXX8fVq8Prb8OK/u+nPW2ag==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4jamtrcTZUWgeKzoc1VFbcJzG8oRgxzYT3CjFO5UYxs=;
 b=TljYVIMNX8S+6xPvsQC5O5ht88WrJY7gInrPmFXFZHX49bY1FZpgDB2KA/ezRjB2PUZ6LXI/yTN3YKFNOnlvx98AFcZ43K3y19TJYkZlfg9NVi89daeu5KtZEfb0Rs6Ky7l/evVPjVz0Tnx1O1Oef3y3G/7BjVh62WhYrYlkdNX/6d8M4Bh7sq+irOLJW+//jvuH2ht3I2pacdUtUELowJImsuU4Z+UFnTi1QvtJ0JkCGpKqYMtV2YEyNFhcamUtWHx4gcQhqHAGR1UGgd+77UlOXhnoeIkJnRHIxwUvrME9c0qtYS6/r6WDe3bQRf7wuLfUaH/zwE7KoXDgT5re/g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vivo.com; dmarc=pass action=none header.from=vivo.com;
 dkim=pass header.d=vivo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vivo.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4jamtrcTZUWgeKzoc1VFbcJzG8oRgxzYT3CjFO5UYxs=;
 b=BPGe+lmVcC0U2syzIdUYI4uu/9S2gWSQowRDsIuVHKDp/kCRtegWGWwMhH/pH/qe9E7hG7viWKFu1yU+vNrN+25y3RxDulYWjE/DAGZfmg55xkFBUlQ+BOzY9njXKbqrlPi4mY4ds24F0gEXWHCRdh7WTpRmwcigUoAgAY1aMFSU7HfLyMbIkFmEvtoJLcO8cEgprbTKXTRu3W6mkqhzKkCs30BWmnnYHMSDp92KlDponSev90owdjSz1w+9Cn8EVs0QzSCwGsYgFIBu/9/y2g+y4tgKbiDhbxWtrwa5e/qn5dPT3mlPy6k7vungbQQ9/XlYD75/YCsnppQ7AJJ5Mw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=vivo.com;
Received: from SEZPR06MB5269.apcprd06.prod.outlook.com (2603:1096:101:78::6)
 by SEZPR06MB5168.apcprd06.prod.outlook.com (2603:1096:101:42::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6277.38; Thu, 13 Apr
 2023 16:15:05 +0000
Received: from SEZPR06MB5269.apcprd06.prod.outlook.com
 ([fe80::a3a1:af8e:be1e:437c]) by SEZPR06MB5269.apcprd06.prod.outlook.com
 ([fe80::a3a1:af8e:be1e:437c%6]) with mapi id 15.20.6277.038; Thu, 13 Apr 2023
 16:14:59 +0000
To: chao@kernel.org
Date: Fri, 14 Apr 2023 00:14:50 +0800
Message-Id: <20230413161450.81272-1-frank.li@vivo.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <e5dbb307-7337-1f5e-4bfd-b4736616bf57@kernel.org>
References: <e5dbb307-7337-1f5e-4bfd-b4736616bf57@kernel.org>
X-ClientProxiedBy: SI2PR04CA0004.apcprd04.prod.outlook.com
 (2603:1096:4:197::22) To SEZPR06MB5269.apcprd06.prod.outlook.com
 (2603:1096:101:78::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SEZPR06MB5269:EE_|SEZPR06MB5168:EE_
X-MS-Office365-Filtering-Correlation-Id: 58472c20-3ca0-4fbd-b390-08db3c3a3a5d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: xwZKZ8sQrXXc2EEH2TxD+bzUv7iOOBBfQXQBYQ3bks6BalW1kKk3xY8QuYpI3IZpHk6O30zuVTH35D7D41SsIJW4GpcPnqqNdIQDOXut9eEpWXvGLeFlPbMeITOjaQ3vO/nj8yirZcOd/oMvB/YR6iv1TCw7o4Utv7IbWfhqIxaatoq8kMli0ada39yLXZu2HBzPTOxTqlN4WULgnQLrh5aCWzaF/GHdyNnDDMuP8hK4xmwlwyVQgFk70HIzyJsbb3u8NCsOFSXV6VhbsrzkaGFfYKegiEkENXFR981BiBbKidOKWYHl7AcWB6f8cxVWb2UbYC0kX5Dpg5i7Wi9PlFcgUJ6nhDaCDMr8WDaZx14IdoZf3hkcPfNjzZ8pJS0azZ+Nej7tK5neRJfH/BfPRi+g3AzsVpJR1J2NLZ12doixzVOVfpSIIiNZr0CHnHJ7dmIfQRWjYzOFpGSsQ1CvgmIh0J+HPsIse+ncRR1hcI7eBdMjJjyVXCUbK+TejCyOMGPUSZVI8IjpZy7nu9L75U9j1gYNE8iLMVgAy34lR6boR0oXCSWklEsvCgVdV2En5MOX6wJdwEMOzPFjLEhvBy8/Zj5Wdtv4I8asasJKwfY=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SEZPR06MB5269.apcprd06.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(4636009)(346002)(376002)(366004)(136003)(396003)(39860400002)(451199021)(6666004)(52116002)(41300700001)(966005)(6486002)(478600001)(6506007)(316002)(36756003)(26005)(1076003)(6512007)(38100700002)(38350700002)(186003)(2616005)(8936002)(86362001)(4326008)(4744005)(2906002)(5660300002)(8676002)(6916009)(66476007)(66556008)(66946007);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?PaVhPdCUbO1VCITtBX4PeyJ34BsQTkmBzd0n262eI2P2kozCMgvc9Uzz/VYF?=
 =?us-ascii?Q?ejtZJ2+BIxgZWUXZx3jnehTbcvcWI5V0Q8kme0oOeQTitpxU9zfZBMQfhVYm?=
 =?us-ascii?Q?mZZ2U0S+YZl11SfQfoK1bU/sGO6Mr3iC9LnIw2a0uvfL7zZh+4AhwOO9W/cQ?=
 =?us-ascii?Q?wQzRjl2CrDvHtCnYtQDONlD5OgdGrE9es6oRTvrAkekQL8dE2Yld3WpIFIXq?=
 =?us-ascii?Q?5ar6F6wTNA1bBSPQDB860rh/ufVSXuCv/5bW2pNCTxG3y+LlgtYEZArxMbIz?=
 =?us-ascii?Q?lNwRah81Y9HgE4nfis7rHKQosFTjnlCrZuy9gFBdtMPyhFhmjOWEwl7cgokp?=
 =?us-ascii?Q?d2DsHPQmnf//t30fPx/gg8DmI1Bw+SwZ4BAJjjw9+PivLnNcGwvhRkZFbM55?=
 =?us-ascii?Q?dV2oySDFAmxTbzAkaEvBR0Yh58HQpgi6hpjzgVf8690bulNvZBXM/uRVpkBQ?=
 =?us-ascii?Q?WrLlToyamIHMzB2bi91jC123qocG2dG4UjJdNBsnaa03MD7VFE3oMTCKhKPX?=
 =?us-ascii?Q?PzxHkhHlZZqJMUYQWO+x/2jWObmoGrYgBKEgXsIjc6ikcFlPELiAV0R0nj1x?=
 =?us-ascii?Q?iCbklk0vrRRGKJ0/OFbNZSqqWpmxRm82WrMWN0/exDNAmi/TSWUnmkuAf/iV?=
 =?us-ascii?Q?LyQT7SVSiu9SBv3Quwaxkma4PgaYeJrgCYiyI+9O6lLiR0npdAVVRjaP5rf9?=
 =?us-ascii?Q?lEDncDobHUxS7rtZ2QKR4wgfpIJmAl/7OV8CGLIlw3dd2hf6KcUbaW0mGo8x?=
 =?us-ascii?Q?9NQJcb7MWI6wusAHJuzz9FAyEEbZup+tU2iDWaUIF6XYjFyxp4ynjDtCp8WI?=
 =?us-ascii?Q?AHAZayy5EMTmg0n9q90QDJIajU8uarjcH4FkvuYrlTUsQjx9IN9oLPHhDHBR?=
 =?us-ascii?Q?+odnl3N7NL1IECFERcfnkNcbxWypnT1hN2vbQnRqUWOhCsCZ5TLCGhKjExaE?=
 =?us-ascii?Q?5XMtB3nJeRgY4cJcFaPYudqYF83pQaWEPsS9GlWUESQTND9LIAKIA8iooAqt?=
 =?us-ascii?Q?42uigUCGoh8dXPoJk9uxYY7bzn8dvZCPikcGJuLFqD+CY9GPhaz9Xo4Hy81c?=
 =?us-ascii?Q?Och/gmm1WqwnAjljRcTPiLAa8Renr1WJiQlEbaoedApi7HHiT3DuyThWnGXC?=
 =?us-ascii?Q?IZURhtJFIXBSTnEXqjvl3bhB5l4Jw0zRVxazt3Stvf9mtL2LIRc9yx0BRdQO?=
 =?us-ascii?Q?ExPJp1dp7pgUW8bBy9iuQGoH1Dw+WEb0Xt+hMMdplipL2tNLm0xabB/JYKrH?=
 =?us-ascii?Q?skb0OIlnt2lRSIR0sVDjDkTWFfuQniDridaK55GXB+5fsxrddd291CEIXycz?=
 =?us-ascii?Q?y19VqjLFDl0zF9UHVj5562CvfqIgC31k9FeS4OMcN7bQyaNLC4DCOEkGSQrP?=
 =?us-ascii?Q?bjdHKrhHd9alKDAFtPxWxUCl2Zm0Pbei4glrSpUJWDID9LvBqWOjHWGfSGIj?=
 =?us-ascii?Q?26Ub758uHRBUnsFrB3d3xlb+1qfL+17jzud5WFb89fhlCf72CbuEXrt4o9Lr?=
 =?us-ascii?Q?ih+mCgvF1sKkQp+ksRfARok1hkSqAMmpiBiT2aci+5K98clz7ffsMztGl/3+?=
 =?us-ascii?Q?gxPhjwY3GjqeVi+HzW9r1u7RnED0fk8i62niIzSU?=
X-OriginatorOrg: vivo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 58472c20-3ca0-4fbd-b390-08db3c3a3a5d
X-MS-Exchange-CrossTenant-AuthSource: SEZPR06MB5269.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Apr 2023 16:14:59.0239 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 923e42dc-48d5-4cbe-b582-1a797a6412ed
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: pAQNala23h8u2cp270Bndx61oA0Bp0FhsFvQTRqalpsX12RkOhHy2BbaCqcSHe31MX7v7rL/gpVI+GZMhNL0YQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SEZPR06MB5168
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: > What if some app/script is using gc_mode....it breaks its
 use. Similar words, you said before.
 https://lore.kernel.org/lkml/cd6d15e3-b692-d3c1-0f01-33e632f5f94c@kernel.org/
 Content analysis details:   (-0.2 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
 no trust [40.107.255.118 listed in list.dnswl.org]
 -0.0 SPF_HELO_PASS          SPF: HELO matches SPF record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [40.107.255.118 listed in wl.mailspike.net]
X-Headers-End: 1pmzbP-0007RM-G5
Subject: Re: [f2fs-dev] [PATCH] f2fs: export gc_mode in debugfs
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
Cc: jaegeuk@kernel.org, linux-f2fs-devel@lists.sourceforge.net,
 linux-kernel@vger.kernel.org, frank.li@vivo.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

> What if some app/script is using gc_mode....it breaks its use.

Similar words, you said before.

https://lore.kernel.org/lkml/cd6d15e3-b692-d3c1-0f01-33e632f5f94c@kernel.org/

The instructions for these nodes are in the Documentation/ABI/testing/ directory,
not the Documentation/ABI/stable directory.

So, we can still remove unnecessary nodes, right?

Thx,
Yangtao


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
