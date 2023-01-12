Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id B31876678C4
	for <lists+linux-f2fs-devel@lfdr.de>; Thu, 12 Jan 2023 16:13:54 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1pFzH5-0004jg-VZ;
	Thu, 12 Jan 2023 15:13:50 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <frank.li@vivo.com>) id 1pFzH4-0004jU-0Y
 for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 12 Jan 2023 15:13:48 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=MIME-Version:Content-Type:Content-Transfer-Encoding
 :References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=qu0zBJM4Hr0BlEu1LMHIvb5WjxXyz2HMFpMCU68o/IM=; b=htJdcMLIMRh1sZgIB0ycW1KlSf
 uECIohppecAds/LghMQwpBbnhtx1A6ukcEH7syyifzD+6y35vAVC6WQf230KzeJJ46xV6FJZpbb/s
 dLplNRa+XZ0mTXzF3c0KJQyR7dL71eh2hp+vbhpyfM6Ch5DyYwGEULifbBTGmjigdPqc=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=MIME-Version:Content-Type:Content-Transfer-Encoding:References:
 In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=qu0zBJM4Hr0BlEu1LMHIvb5WjxXyz2HMFpMCU68o/IM=; b=S60dUmJuZ9Md86J+mn0xUD0lVq
 7WZEOcBanRlLUTLlIXCAllJiDylsXvoMv81eEldlbIodm02oQLQxgAFAhepOts5QnfLIxJpXWEJTD
 5D2B/ZzwMRvWJLaaOB768z+Mii1vo3nmBndJ4Z1wq7KxZKbnugKKUtconbpbGbv0BIsw=;
Received: from mail-psaapc01on2122.outbound.protection.outlook.com
 ([40.107.255.122] helo=APC01-PSA-obe.outbound.protection.outlook.com)
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1pFzH1-0002xe-0S for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 12 Jan 2023 15:13:48 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=cR2GJxYiDBWuwHQfNctRQRbOFDfhcfH1Sh9i/iIstGAljToeBaNMVw+0Z15TNsiUu7O4xbWhtdVMi32LpFKCt1TE6deceuzwTI6G95QXG6TveK6pn6ke1gZN7zAcqLmYM/bcBtuZU1Uzth6iXVoFPrNs0gRZiLGX7HyquBQYkDhCie9U6eBIJLD9B1wirD/9nq9TaqjFWkhHjrDjSG3RWTBXi4CWYFbG39JpCJuvOzP/hzcmNwSoIb6K/ToCHt4StO0rEI5+iil33WqXqOIVBUPl8inZbOZJJ0evDs3aQovgzdb9n9MrSYpZIxeaAutXf86lNHa5U90FOxref3WIuA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qu0zBJM4Hr0BlEu1LMHIvb5WjxXyz2HMFpMCU68o/IM=;
 b=co6iOaBpelJS4v0Bss+C5eLOIkHDYk+OZL943dnv0u6mt0KJkP0+5H2y0b8sisYbkex2gcISr9vHmVV7WEOK0jA03Ke1OExyD8awj33Apba7XwgZCCto0hfjHc1RLw7ZaPSAwzPU+GSJdeMSKbWebLOTxh/OscU/kNVtRoV+L1BdA/j6b+TZEBbFGdj0AW4o8TWWa6tfSLrOCOcYq5QeqzHPeK4czjUXXS2yR6b5vYN7YC76gdAB7dtxpcwl5a2CON2bZFqEt9pDpcTZRMwkPpI/spwv+a7bcRuxNN9C2zCI3Z0U2VLr8ozDJwG3AXD1FuoMHIYWCXJ2OXpuFDqjog==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vivo.com; dmarc=pass action=none header.from=vivo.com;
 dkim=pass header.d=vivo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vivo.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qu0zBJM4Hr0BlEu1LMHIvb5WjxXyz2HMFpMCU68o/IM=;
 b=aJEQmdEDHnsx5fc6znHLMQtpAQ0PlpgYwlWuWlNXfmMRAQV+bqXr3BcjrBLYQL5EVaPrzQ5KUX/amihIN5UBrrSchTGoE49seXR1cCJryQPZfS/H/P4y+RgUGoOMv/aw+CAJJ/SgHi6vpv+UvU/o0d7RcsdcnYV4kUq670LYge8Fr/tIsuDrS5zuB/0pPR7cUjW0dfjDouneb0jL7OgfWbOHnZpmahqShOQGoQVJMx3igJeMQEQya2CZueEJKsQNAJ+SK6W+xEPFU8iqh3K/Ps3QoCJF7JIeYBASLqebjMKwWYCkWjMy621VmedFPhrTzZDWAQjRf0Io/1UcJelG5A==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=vivo.com;
Received: from SEZPR06MB5269.apcprd06.prod.outlook.com (2603:1096:101:78::6)
 by TY0PR06MB5460.apcprd06.prod.outlook.com (2603:1096:400:32f::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6002.11; Thu, 12 Jan
 2023 15:13:37 +0000
Received: from SEZPR06MB5269.apcprd06.prod.outlook.com
 ([fe80::3e52:d08c:ecf4:d572]) by SEZPR06MB5269.apcprd06.prod.outlook.com
 ([fe80::3e52:d08c:ecf4:d572%5]) with mapi id 15.20.6002.012; Thu, 12 Jan 2023
 15:13:37 +0000
To: jaegeuk@kernel.org,
	chao@kernel.org
Date: Thu, 12 Jan 2023 23:13:28 +0800
Message-Id: <20230112151328.29124-1-frank.li@vivo.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <Y78LNobSXGF5N3tn@google.com>
References: <Y78LNobSXGF5N3tn@google.com>
X-ClientProxiedBy: SI2PR02CA0024.apcprd02.prod.outlook.com
 (2603:1096:4:195::18) To SEZPR06MB5269.apcprd06.prod.outlook.com
 (2603:1096:101:78::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SEZPR06MB5269:EE_|TY0PR06MB5460:EE_
X-MS-Office365-Filtering-Correlation-Id: 0cf2817c-bae3-496f-d021-08daf4af944c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: p7ncpTRynvLzu/Hi374WnYPuXjlT1kKLghVUDlKCIpRZyVLoPgPhlqvhYujziN6SgKzyZ/Z6FvYje6/3N6Px7iqcHd1XmKKOEAfVscNJCRMnV3rV1MhPN/zrOb8tDToV21/rpGjJSErZobXXbx930AyCHEy6rrwednnVEooDBJewUX5rzIpYVe09jNJXX9kpCWnzsVweBzeLb2xSivaTln2LHM4dS3/Z6dlXpJDgV1weiW//GqRS+/+1GutvICGNjVP2S7B8rgQ2qrg7mtIyaACX7nV6L4Fbd4PCOh05VEp8ZMaKkTFlo43DjoagTgZ4VYN8M8q5YahZiS0SHdof1vxQt4gKPoLHVk+P8SRLvi/JVaL/VItlZkzzg0LFUibkWDyHjyRLnSNW8sCyAxe5CXwXoF4YWTHMAcFkj5cBwZTYpKQ+JRkSsBSUXJ7d5PK2LoD38s9xE4lU7O/T6VDy5V35iAaX5cJJTDVxmmWaFJod1aiaQLqULMI29shLnPZUIP6ECIN8Gad1jB+Hh8O0E8LGZ4J1RCYdtSbNLf8gsMUwrKB5UggOVUg8FTY4uvRiDDwjNY7dYSf24TeGDeV+ihZz9f8PDSv3NElcrsjuxvK/zn68YhvzjLxUaVGYKB2qPZdUPxmp8mu5d5AOJjKaB41N4KBLyceQTKikZKTZWh4EtTE3opTz0iDahwHW/8N3Vizj+aHvQX4ThhswSTmhl/bdctr6UOUxIDwL+RyF3Kc=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SEZPR06MB5269.apcprd06.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(4636009)(136003)(376002)(39860400002)(346002)(396003)(366004)(451199015)(38100700002)(83380400001)(38350700002)(4326008)(86362001)(66476007)(4744005)(8936002)(8676002)(66556008)(2906002)(5660300002)(2616005)(6666004)(41300700001)(186003)(6506007)(26005)(6512007)(478600001)(966005)(6486002)(316002)(52116002)(66946007)(1076003)(36756003);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?ECJROhaOqy84cUKAI9QExPiiZxaYvmDCt4Ft2UndvwiSy4pBAiVBufJ4IV9v?=
 =?us-ascii?Q?zxOT4ld0mEJlim3NWx+ZOkLTb5cunQPmY4VYYOjGtFpyGDLC0fZSB2Y4IFSM?=
 =?us-ascii?Q?habWk7ng/2bRWB3GwwonjoyQuxhX78KkZQ/l4RkpwR9veMlerAtTHedTCsIO?=
 =?us-ascii?Q?/jyFDcnOyDJc2JNIzL+U6ewCn3lhtU9MazNsoiISbj4F8FWr22gNqE37K0cU?=
 =?us-ascii?Q?vWj3q9OXtML5422wV5qRtt6M0kerVGp4N3/beAowPQWjkBQMPg6xQMz8Ml5r?=
 =?us-ascii?Q?8YTSywF4PmmsrLfO3jrtQZlfO72biPwNwk9iRRDeaVvZDY5aUl0DWNsMkV7g?=
 =?us-ascii?Q?BitiRNVlrINyZBXVfnqyA8e+K2hQ/L/x2fmga9IAJxu1pu+fu0keXtkXmLOK?=
 =?us-ascii?Q?8zOzL5+JLtg3jW9hHjuEMalwhWVTEwp6Jn6d3GgyMdOn3x8EZPJNof6gWxWp?=
 =?us-ascii?Q?EdMKzxVfYuzvfFe+rqxhhKD9YNKPhSixpd3tKz3oizO6h9ER2rGnWpb/9Fal?=
 =?us-ascii?Q?cXfBzbE46hV+2NyJypqIghbrHoThqFFBJkAVx8gHs6tzJ04imOBQlAZQM36j?=
 =?us-ascii?Q?PMbyUCwYOWCrztr5OP9akq9dpSF0wAVz7CZtwa9bRVxL79PPQyE94x7DOgVk?=
 =?us-ascii?Q?fOJdtG1m5RiDqWHRtmcWeOVi23gLurbv6TFndLUiDLYh8+W3DzZJgjr2vUdO?=
 =?us-ascii?Q?AS4zdRX0rGk5txOA96r4oZI6vaJ8RvyKrYOtYUt1Y182mKZFWy6DP9Lv0BPD?=
 =?us-ascii?Q?9nr1U+WAXs5sluT7gsoRfNX5P82Yqk95f7hjJZSsVyA19tVbsnCdtLdNbF9b?=
 =?us-ascii?Q?8PUlbBoG7Snx3l2kukNxMGH3i02HpjTqG7Jau5v4tysx2+U0qO/N2nU9SHEM?=
 =?us-ascii?Q?AAM5KZz+dCYB94J8ze5MGzZHjxsbR2C9LznR5t25+2D4G/e/8/1sZdVEorJP?=
 =?us-ascii?Q?qMqwcHe2P+UaiDyXgZoYE3Mc6SCRD5ICNnKtnN2UomDT4f3OoNQPa6hu5sgC?=
 =?us-ascii?Q?CSmeqVXVnsyXAXYgQK9CySfpqrLOv/ouUufzjPN0/iwZ4hKKRHMiXmrY66sc?=
 =?us-ascii?Q?3Z0/4hbjaQ/mcIkofrXJXhru7rlxZsy5QEIi4Um1HRXlAVLxK+Ih3y+O6gLC?=
 =?us-ascii?Q?v7nBn9hcFUH2j/oCwKNIMzJM+5QrsnIoFsvUtcHDDPvS/UBrtzs0IS6cJfY2?=
 =?us-ascii?Q?7z2QxKE5aqJHXrTQoJS/17p3bJTcVZP+K9G1CuQP+EEgXaRiRX2Czmy0VAln?=
 =?us-ascii?Q?B/Wf1xnQbyrTQjJFe4yimkDBzcrvIxbgDK05d+jN2n8yS9V/fva7P4ezQF08?=
 =?us-ascii?Q?8uFWgZx8jfLsQIsIQnB3PQOhCT5L7AcxJdmTB/AlNh6EvjwU1eWRvKOGPfB/?=
 =?us-ascii?Q?GaoHaWGRd0z5hpl0fIEfqEVqbAfnHS32drpOdLBVnvoXDW7x0Z7ki8Mm/zbj?=
 =?us-ascii?Q?0UyGVmtS4qkVNoyrBaa6xkXBbpAi35wiZJfP/NL/08g8gQuFP3NZXoXyIKVc?=
 =?us-ascii?Q?ebF9HKOuwvCP1m6OJQGgAxnE7El8e0S5BSpmpLz7ssiLvy+DnV1+KjbcMg0m?=
 =?us-ascii?Q?5DKOc13Gii/tmn+eSSDJpjs/fGmBv0kfDisElOCy?=
X-OriginatorOrg: vivo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0cf2817c-bae3-496f-d021-08daf4af944c
X-MS-Exchange-CrossTenant-AuthSource: SEZPR06MB5269.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Jan 2023 15:13:37.3049 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 923e42dc-48d5-4cbe-b582-1a797a6412ed
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 0DnC1Pttgxw3X3J4n5Axlnhedf0R9FJnM1a+314t/btdRwHaI9rxcIFaoCcpIVW7d39WOwoWdyYwnfu8Zk6VOQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY0PR06MB5460
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  Dear Jaegeuk, > Hi Yangtao, > > These are all in dev-test
 branch, which means you don't need to stack up more > patches on top of it.
 I just integrated most of them into two original patches. Ok, I'll merge
 the previous commits and resend next time. 
 Content analysis details:   (-0.2 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
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
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
 no trust [40.107.255.122 listed in list.dnswl.org]
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [40.107.255.122 listed in wl.mailspike.net]
X-Headers-End: 1pFzH1-0002xe-0S
Subject: Re: [f2fs-dev] [PATCH 1/4] f2fs: reset iostat_count in
 f2fs_reset_iostat()
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
Cc: linux-kernel@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

Dear Jaegeuk,

> Hi Yangtao,
> 
> These are all in dev-test branch, which means you don't need to stack up more
> patches on top of it. I just integrated most of them into two original patches.

Ok, I'll merge the previous commits and resend next time.

> Could you please take a look at this?

LGTM.

> Applied with the fix.

Thanks!

BTW, I would like to ask whether it is possible to maintain discard in separated file.

https://patchwork.kernel.org/project/f2fs/patch/20221217132318.37718-1-frank.li@vivo.com/

MBR,
Yangtao


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
