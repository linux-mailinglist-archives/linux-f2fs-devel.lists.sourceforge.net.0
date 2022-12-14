Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D19E64C45D
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 14 Dec 2022 08:29:03 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1p5MCG-000196-LG;
	Wed, 14 Dec 2022 07:28:56 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <frank.li@vivo.com>) id 1p5MCF-00018u-6p
 for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 14 Dec 2022 07:28:55 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=MIME-Version:Content-Type:Content-Transfer-Encoding
 :References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=U+evfzJGO5bXzwwuQH40Duf3SYTMz5IIn8OGTLdJpC0=; b=X8ldt6HDvfW5AkILrEU2BH21Mn
 +KSbniL9wIHyRT9oQwm+MFcP4eVKRduv0RsmO3vl5ZUD9Xcj1urhzBTSG3KZRHpWtS4EVqLVeQbGF
 7FKqV6LEfvQ/htw+/c8MFl5FtTCU+YYWYndMXcoP+CumH8Iq74ZqwIFz+ayt9lgdRM/M=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=MIME-Version:Content-Type:Content-Transfer-Encoding:References:
 In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=U+evfzJGO5bXzwwuQH40Duf3SYTMz5IIn8OGTLdJpC0=; b=LTsizgmtdoXfzs/NrwsG8ptITB
 K2+7XJKMIjR80mEoY5H842NH3GViuP7D/YqedwdFMkJJbd20q3gIr1LB2cYNuM8DSP4F0gTGRNcb2
 RqG3wpJ+L4wv17Ouu1W4w5SRLnPuXSeGS2R9wsv65qMhzzv8kJCQG2WmkSTxfQj22wpA=;
Received: from mail-sgaapc01on2132.outbound.protection.outlook.com
 ([40.107.215.132] helo=APC01-SG2-obe.outbound.protection.outlook.com)
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1p5MC6-00Gbw7-N8 for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 14 Dec 2022 07:28:55 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=n8R4/0gcfk6Fwf/REbRVgHB3prN/h5dhWd1tDAdhUD1YG0J4lsQMMQe4NJsyamOZ4SrbKKiF4g6jQ2cCOEIGBuRFOkZveme40R26HXjxFIoMTDQ4hhDmYYlz4moQuy6OG+Z7gBkgDq3gUhtWKW4/MTZWDPeG3Tn35Wk4Vv1UWQjsEmKAth/HIrjaDHF+eUhO6s2Mpiphc5XI8tjKTs2UcfOPdODqNcnmLCHVQ7+/6kXbI1nAfaJ18sISwjnBpnt9IGgfWuSsLaWDF4NiMU1V781gdr4dlhp4rr714QsL0wvw+xs26M7gxRFU/0I/yqReTtl6QY9ETFyKNXnHlTzcIQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=U+evfzJGO5bXzwwuQH40Duf3SYTMz5IIn8OGTLdJpC0=;
 b=EhMjTeMkQWfOHF9gum9i3Pe8DZxdlLrWv9x51YGSTaXPyUyuRzQFScFylSc6hpbKOjyrY3YuaWeC5v+uwTB0RcJd98LxGnwZ7B8hzp8jwxdWblgXOsssQ4iyQML0TeqyirUprWEvdUl8otMFEKgiUqgqC+y5Q1DMyEXx007q0pUiJN5FLd2HSFJ6wMWYSlJf2fRnibY97DWHc/CWK4V0VUuveqBGHhKfR0ZdtFfNLnb3tTJGf241FXrOG2J4bNP3ePd3rFqdFD/X4WgOezn/92OUMw+0wtlob4yYpSNBAeH6YKdOACcuqv4z9XRFT/t6EJT3kYk7zgAmgnOhA9p5GQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vivo.com; dmarc=pass action=none header.from=vivo.com;
 dkim=pass header.d=vivo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vivo.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=U+evfzJGO5bXzwwuQH40Duf3SYTMz5IIn8OGTLdJpC0=;
 b=p2Xif6U51XA2EXQVm5KiYkD7BsA5fTzC3kuIGfY1eEjwzzHCoXm6bR97iA7Zw7WuiKgP0yMp1pffF70FpfuFk65llianGhdSxXMsHIfKECQ/+Yqdmz5E7FxUZUYfQAFnux/MJLDaPd3XGMjIOy7ZfKt+RsZ3Dks1B2x7+O0ZH9QQrgNiS8uog9FWmjv7qTLJFci61nUnWNNN6y5SgGJaGpO1jKBSQSrs+tDjqSkiZW++K2EGWduMnA+WrTQ+H2mF/SO2hJy5KWtZVLYidkQq1SIDNs+d3gPppjjd/1qGovZ8iK6yRXS36PNhVmRzBy3NdqQxlXz+dU5yDgTUwiiqRg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=vivo.com;
Received: from SEZPR06MB5269.apcprd06.prod.outlook.com (2603:1096:101:78::6)
 by TYZPR06MB5001.apcprd06.prod.outlook.com (2603:1096:400:1ce::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5880.19; Wed, 14 Dec
 2022 07:28:38 +0000
Received: from SEZPR06MB5269.apcprd06.prod.outlook.com
 ([fe80::ef03:cbfb:f8ef:d88b]) by SEZPR06MB5269.apcprd06.prod.outlook.com
 ([fe80::ef03:cbfb:f8ef:d88b%9]) with mapi id 15.20.5880.019; Wed, 14 Dec 2022
 07:28:37 +0000
To: jaegeuk@kernel.org,
	chao@kernel.org
Date: Wed, 14 Dec 2022 15:28:30 +0800
Message-Id: <20221214072830.32911-1-frank.li@vivo.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <Y5jPyEiAtDPx7VSI@google.com>
References: <Y5jPyEiAtDPx7VSI@google.com>
X-ClientProxiedBy: SG3P274CA0004.SGPP274.PROD.OUTLOOK.COM (2603:1096:4:be::16)
 To SEZPR06MB5269.apcprd06.prod.outlook.com
 (2603:1096:101:78::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SEZPR06MB5269:EE_|TYZPR06MB5001:EE_
X-MS-Office365-Filtering-Correlation-Id: ef74d7c3-f84d-4d4e-7aca-08dadda4d0d8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: PpsV3I/okrGWKkicxUxjv5VlrM0eMhkn1hJ7nIlhKL8u59bdB0pCROtFeggzy6fVgQp4+xpNROrlW4dDoLc/jK0BrOKStAvmwqps6SaI8uPr2wATD/KYsJ8Gh0i3YPh5jpLnu9l9FucuZDujJvnMh9jsyBF9ZPfuDxsv7NZC7/YvjQveFtQMPavNC3QIVIA9mH62CbSmDEJnNlP22+i70EWplyMxMo4G/NKhRt+pJnEZsDunChOVWkPxX9Cs3Z3sFZbs8yTmlHQHAlY3iNUEGHhaycsPQsZo9kQSqK/1eTxeIV35Qv2ei6TATspUR8jBv9o2fFfD6jsHeRavh44jM61YLTvu2301AXuLqUomw2wCKVO4czI5Tuw/uDH5XzpFDa/4CnyUQcd1hV4kvE/H1klxmAmSxWYU3Sy+lZbZOZeX6feqR44mfyPeGt5PjFw/mjht2Rys5RXxERFDe+51upTcvrdKG1ufFX2mDyZ/h22z5lnko0JgCJ6k/998Zje3uC6reheh8aCwtYgsg45MCj4JAywHuTazSHm786DQxMWspWsH6rcC05Geco1D2H6PDGg41/rGjygQWv150AaaQqi5AB+V9yd+QTEblqFldR7bpqPDUjHb7zB7vT435ZJ/rqE1F7DYr37PotIxOuemiQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SEZPR06MB5269.apcprd06.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(4636009)(396003)(366004)(39860400002)(346002)(136003)(376002)(451199015)(66946007)(86362001)(4326008)(8936002)(1076003)(186003)(66556008)(478600001)(41300700001)(2616005)(966005)(66476007)(6486002)(6506007)(52116002)(6666004)(38100700002)(38350700002)(83380400001)(316002)(5660300002)(2906002)(4744005)(8676002)(6512007)(26005)(36756003);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?NT+hYrRzF418qxLQrZlBQF1uqxYouTaz4uSHqNl7fti16wrqvw9yToVZCK1J?=
 =?us-ascii?Q?VJ8fXhObVDild5a6U1x5yUJfR2xjXNY0qswj7utcaVUHIOwa+aVPpmuFAtyJ?=
 =?us-ascii?Q?pRvU0cbQ7jS18FkmdM+J2zjaKBhHQpkvBcYmMPsdx9ItNFZtVCczjqcaBcmX?=
 =?us-ascii?Q?vQD1EOxE983146dhx/zl9nbU6PeoBAwzQQ/iAhbkIG0tDmHhCVWXCDbnuuBA?=
 =?us-ascii?Q?a1KfLdDJ4hn/sC7ytcZo2GQFBCe8yqaTiOhiq2nBCygh3OMoGdcOsv+GjN/n?=
 =?us-ascii?Q?3T+SNgig5vcXHvQgdzkl1LMQiDMUaEW6yJd4pYxP2SgQA9cS1sUdqmWwEiOj?=
 =?us-ascii?Q?Z1sA2Q6PajV1c8aKn1yoO5NqpyqZ64AmuUQsVraSt6fVHZCSFs7cTsWg8RJL?=
 =?us-ascii?Q?OxPK/8O14Jfnh8MaUxRqfQl/oUf/FeJh0Z1GuoBmd4ONd0nLs3a3KLw5Snfv?=
 =?us-ascii?Q?i5yKMoTvX8ieSyaqLW8RanpE68f4Ztro61xLAvUMtivt0YkStDqzZncKFVIg?=
 =?us-ascii?Q?77f5zEh7tkoJrUj93HrGE6RERgStp8c9S/HkTfb2Pcd1Neh5hI2EugktEdF6?=
 =?us-ascii?Q?VQ3oDXBj5LQM32vjX2Yu+Fm6TxI1EYbOKqAjp8oUB6OC416VckkvWBb0sv1G?=
 =?us-ascii?Q?iZJV92z5rf2QVhhXFlyWEURFeKaV3N1rDnQk7majcME8xGUJtpuhU2ed6SBj?=
 =?us-ascii?Q?dMUJiRbGOriLKWD2c5r8cCAQeS7nGU67k5iS9GXo+PHyQSVA2QiCvxOQ1p+/?=
 =?us-ascii?Q?8bR4jAr5T6ixDNtNHhfUxWAMQJDwYIxjxV/TYG88o/ge7kKH36okBeBcW80J?=
 =?us-ascii?Q?rVUUlKLw/nlUetvlRLV+1b3JXK5dllbDEy+CBMPbbb70o1txpZC/8viwU9EL?=
 =?us-ascii?Q?2O1vdTdbxiI+UyskFHH8O7ukPepnKQl6Lm4ZjpDOMVW9p1SvZ2grkwFE/JLj?=
 =?us-ascii?Q?y8eMr5Zh13ZtPiEKZgdiS5oLEVNII0x3J9VxdqLAOcBD2QofFtvh3Fa/PRtG?=
 =?us-ascii?Q?6xwqjSZxojX2LIdVq39IxrS5pKZ3OTR3ovKR888VdaSeb6k/XiQmlU1zDjzb?=
 =?us-ascii?Q?WZ3SDvtcJSHg41qK9/37sgHIjn3biQaqvGoWUzDpQzjvox6FnzW6Svxrulk2?=
 =?us-ascii?Q?pSLqGyyll0SBBpkHweZD67aysZU5yZR/d76IrWPEeQZAuAA84FyU26u5GVis?=
 =?us-ascii?Q?o1//DUi5cg6hjU318/gE4DARi2y6nOKfFtOc/UqtCNjJvfea+sdqs/4o7rYi?=
 =?us-ascii?Q?2QM7keHBkWQboGj6LRF8l8dP+NETZCdzGEEvATGf4N5gpA6W6jUDaNtRVc4u?=
 =?us-ascii?Q?I/WRKbu0nrp3accRPpW4qWqPydkj08W30RgXaEwrvFI1YQpA6sdktK+1DUaO?=
 =?us-ascii?Q?+OPssAMVTSTrERiPREvexYdb2jKQhf0ZmcDUlYnLX/4lSU/I87L+STbgCy5G?=
 =?us-ascii?Q?X6Ff2woY2olfXJBtzcbx7TQeM7M+vfaxXbEDkj0D85fMRdKY3A5/ywOT3+dU?=
 =?us-ascii?Q?leAVX1pIPKGeOW0OHiF8Kl5cVRfJJtBnJEXJsYKzJaNl1kXnjI59ofrfmnUm?=
 =?us-ascii?Q?3koC4g8KugPiiRnE9yP5bccBrxnIMzad+cfKoKDd?=
X-OriginatorOrg: vivo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ef74d7c3-f84d-4d4e-7aca-08dadda4d0d8
X-MS-Exchange-CrossTenant-AuthSource: SEZPR06MB5269.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Dec 2022 07:28:37.7381 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 923e42dc-48d5-4cbe-b582-1a797a6412ed
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: AoVwQqfvttasCARd289UC8Ty6INQZd4U7XT5l42j/KaYKltJvI74BsXpz/u087RngS+V77l5eimLhYWmjsCTVw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYZPR06MB5001
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  Hi Jaegeuk, > I cut off the patches for this merge window.
 Please consider next release. Alright, thanks for your reminder. 
 Content analysis details:   (-0.2 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
 no trust [40.107.215.132 listed in list.dnswl.org]
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [40.107.215.132 listed in wl.mailspike.net]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.0 SPF_HELO_PASS          SPF: HELO matches SPF record
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
X-Headers-End: 1p5MC6-00Gbw7-N8
Subject: Re: [f2fs-dev] [PATCH v2] f2fs: add support for counting time of
 submit discard cmd
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

Hi Jaegeuk,

> I cut off the patches for this merge window. Please consider next release.

Alright, thanks for your reminder.

> BTW, could you please send a patch set instead of random posts?

Most of the patches were noticed when I looked at the code, and they were scattered.
On the one hand, there is not much relationship between them, so I send patches based
on the f2fs-dev branch every time. On the other hand, it is also to avoid that a patch
may not be received and block subsequent patches.

> It's quite hard to find which one was merged or not.

Why not to use patchwork to manage patches?
This tool is used by many kernel subsystems. And This tool has a more friendly
interface and can mark the status of the patch.

https://korg.wiki.kernel.org/userdoc/patchwork#adding_patchwork-bot_integration

Thx,
Yangtao


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
