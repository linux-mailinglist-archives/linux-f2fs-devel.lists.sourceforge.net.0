Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 0DB3E76C8A7
	for <lists+linux-f2fs-devel@lfdr.de>; Wed,  2 Aug 2023 10:49:26 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1qR7Xd-0001Yq-AS;
	Wed, 02 Aug 2023 08:49:14 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <guochunhai@vivo.com>) id 1qR7Xa-0001YR-AH
 for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 02 Aug 2023 08:49:12 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=MIME-Version:Content-Transfer-Encoding:Content-Type
 :In-Reply-To:From:References:Cc:To:Subject:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=uHlPwxFiY9xeXaiBbb55FnadWGEHwaSNsxkwkxyyRnM=; b=U0YSz8/bD9/Mzls3iMYe7AWX8W
 ov3IBzAsePF7FrwHrxYCq5Ewkb6WTJdDMizwJq/ocyM1ePfu0qwisbCXk+JWHyUWIGUvaAQfq0qbV
 8RlhUFQmhnat84FO3DqhCv8pZ0eM5N1r5xXJeAUc+Fbs2H2rMMLz6WzR8yWr2JX3gVwY=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=MIME-Version:Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
 References:Cc:To:Subject:Date:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=uHlPwxFiY9xeXaiBbb55FnadWGEHwaSNsxkwkxyyRnM=; b=XSaXrjsG8fAUFB9G2b/KIsNkq2
 UgP9sDluH8LxoYQE0AyQpwWB51MnMCDxzkkt0PLmcQIQJSxfFwyElhCtHCoF9s/EAkk5DFCYH1dUa
 SRlT47At1+XFwNQnmaV4iV1vdtzsRCup2BhmuZfQD3xwRrcdREIvRgCk9OsiarBx9L4Y=;
Received: from mail-psaapc01on2121.outbound.protection.outlook.com
 ([40.107.255.121] helo=APC01-PSA-obe.outbound.protection.outlook.com)
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1qR7XU-00AanF-C3 for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 02 Aug 2023 08:49:11 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=d+d1P0MnQSDRv7BZx3Q5wRbo8hiDcju4R+pbo6lxeYnPkvmHSbut8anVnAyO4u7VD4kTcuS4pJz8crTflzfK+MhFTyDbg9Nkq3+A83GNthLC2Bpv7diixuwsf6NoZOcJET7xNWZcLtT0WU3m+Zwn6CJdKMaEtBwlPx9hKzyiZdqbm//8twgqZZ58Jp9GOy3LmIx3G03oe3pfpu2b9aE08RSnvXwnuQjEBx3jOwx4nt8V3LDo53QRigtdxbjM96wEwVXrUFmr5LxpN7YA5+S7iwQoPmW1GxKlWLohZrjNzRGV1ha943vBdiVSDZeiBskmLhjYY+o6WQzljQVShO1Ieg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=uHlPwxFiY9xeXaiBbb55FnadWGEHwaSNsxkwkxyyRnM=;
 b=m3QmqUrbjA9j8ozysc+W5FT1bEWxo4uzk+Xc+tU3PLL3ZJnF2q1UsmwU3HGCa8kILtX4uUDKL1Z1XmDMdwa/UxsxmOpwHztcXHjpkri2gH/P0BL06A1XzgvmiWtuXGjcxFe0zSDYbgq4nXvFvTYzkY90j7XDyZ3hcYaTF1YlSCXBdGDG9anK5UhzEb9AtJ2cWHiBzE89Cp9MnWAD9agBUmHIq0XAPr+FqJQpikV/eAgCJAtHS7x5qu5sb6MkrVe/GuTDPaD39I03XqFEYh5Ow+YSCim5wUcWI4G7cHQgwM93u6oU4dLfFm7SWXXCojedbaNt095v17E3Kv1pe7rYbg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vivo.com; dmarc=pass action=none header.from=vivo.com;
 dkim=pass header.d=vivo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vivo.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=uHlPwxFiY9xeXaiBbb55FnadWGEHwaSNsxkwkxyyRnM=;
 b=Po3FYu2XRcaM44DJDvt21mxzYccpj5asTeXIPLiwUi4gAXANMqVCqQcjoBCBXUh1dAdkHKLGke5+7OrDRr1vs8+4ViawbKScCyj3GWeQ9EEbyCt617yL9/2oSvvQ1jXgOyaq3dRl/sl1+2vkBQfSPYhwRq7TrffpWTzDaFgMYHVZfVH550sP2YehHEV5NAe+L89PRgahkkYfd0clI2vwe5FE+PB5iQsxZpe7TwqQLECjvEnwxDi+4/vZvn+pnUtJFpEzLmgtpd0ZvZm6iMdpJLTwlWpPyXS3nLlr7lU+NRbM4pd+sIadVF5RxEHZcXLDnLvbdXAialU10cysHmRw1w==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=vivo.com;
Received: from TY2PR06MB3342.apcprd06.prod.outlook.com (2603:1096:404:fb::23)
 by TYZPR06MB5975.apcprd06.prod.outlook.com (2603:1096:400:33e::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6631.45; Wed, 2 Aug
 2023 08:48:55 +0000
Received: from TY2PR06MB3342.apcprd06.prod.outlook.com
 ([fe80::9df2:1896:b020:b51a]) by TY2PR06MB3342.apcprd06.prod.outlook.com
 ([fe80::9df2:1896:b020:b51a%5]) with mapi id 15.20.6631.045; Wed, 2 Aug 2023
 08:48:55 +0000
Message-ID: <6854602b-6b6c-a26f-5cfb-992c76df5c1e@vivo.com>
Date: Wed, 19 Jul 2023 19:44:22 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.1
To: "chao@kernel.org" <chao@kernel.org>,
 "jaegeuk@kernel.org" <jaegeuk@kernel.org>
References: <20230620141035.69782-1-guochunhai@vivo.com>
In-Reply-To: <20230620141035.69782-1-guochunhai@vivo.com>
X-ClientProxiedBy: SI2PR04CA0017.apcprd04.prod.outlook.com
 (2603:1096:4:197::15) To TY2PR06MB3342.apcprd06.prod.outlook.com
 (2603:1096:404:fb::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TY2PR06MB3342:EE_|TYZPR06MB5975:EE_
X-MS-Office365-Filtering-Correlation-Id: 19b8cf14-f2d9-413d-ce6e-08db93354d11
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: oQ+22mAkPB/638TMJvnXGM1h+fiITu3r3mM5WMUga2j+8O2ukZqHjjh9+0jTOts8bEc4nP//nCkezfOzZTRq8Q94D2MWTVoxOMpeLjSv97afzCKZ76cvTO+qoknFDPEhCbDvFTb+Q5s8IuUr4TZ2c8cj/RSvvLz1rtc/ZfEWF+PWIcCn1LuzRsiyjaZNEaSGTWkvnwcpz3UIgztOmcl+CxBTwMxPLL/M/n3se9Bm6ECTVTg9khGKg5OBdfxZGkHmSNwUI5ihvwQCmdTZcuuECuGautsb1KJ+AKlNzR3cUqrrigHcQAY4EEEHmmk5ACvnczqbhIfdl2bfCQ4yl/pBWtjjUnt3aIXkZRILnJ9V0RrLWpJrc+SZgyXYdgxt6mBJmPL5H2h2zkmyPHjMLZpeOr4QcRy/CIMw4kMsyAEqHbmN0m+uqFRtZMcTWLPG0SWpwp7SaYhGZusmNHo5eZnmxl/vlFYtLgpumh+0O5NGe5Yen9+bpfQmxs1YcGKJaDROPHQwRJRe1UX48+8vyOGNpPRn3glKA/75ZOlyZJQUksusiFgmdE8SAsJjRGTtEC0Q4IgmesWMCuydT8uxsKeG5FeEXOK27v10+ckfMdMK1jZNsyE/NMLHUarmmWPJ95/zO5hJOzdcjqYK3vn8a4pvvQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:TY2PR06MB3342.apcprd06.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(4636009)(366004)(346002)(136003)(376002)(39850400004)(396003)(451199021)(66476007)(66946007)(66556008)(4326008)(316002)(6512007)(83380400001)(2906002)(86362001)(31696002)(186003)(26005)(5660300002)(6506007)(53546011)(36756003)(2616005)(38100700002)(41300700001)(8936002)(8676002)(6486002)(110136005)(31686004)(6666004)(478600001)(45980500001)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?dGpLSGNNY1ppdzRoVjBtWDI0N0FENS96Qi9zZ0N1TVdYdEl1dzhkSHUzczNa?=
 =?utf-8?B?UGYwbGN2MmN2WFd6d0JhcDJhbTVXbElZUlZOZ0Y4WDVIcXFEZzQ1MEJZQmVi?=
 =?utf-8?B?a25Xc21sR0JpSWVxcG5PZHlhTGhJOUR2WFUwa0tnSmw5UnpudUg5TEpXOThD?=
 =?utf-8?B?RDJHZ21NUURmdXNYdmFnVEt2RHlvc0VseUt1ZVZBNmVHR0VET0o0NmFtUTdH?=
 =?utf-8?B?aEx5VW1MSzROV1JLbStVd2oybnUwaEtzTnhXRkhXSUZ1bEhlNEppNVdLVzJS?=
 =?utf-8?B?dy9sMmhLQm5DNWVKN3NqVUdvNXJ2SDZjZDJmdkUyRlh4ZXZDTEtobG5ZNUcw?=
 =?utf-8?B?RkZtazFyR0hlbjZvY2NEMWpqQWdENHpKL2xIdUxCVWJ0LzdoZFQvcE1LUHZN?=
 =?utf-8?B?UENHSlpVT0Q5Y2tPNTBYTUVsNGNEVjN0NXY2a0g5cmtZamF1bEM0S0o0a05O?=
 =?utf-8?B?akRrZUQ2b2FZRmpLL3FOK0c3YUlNYnNaRU9ub09EZ3NuR2thVXQzRkZvc0tk?=
 =?utf-8?B?QndDYUl5NHpyZ3hhKzZXczc1anFBMnBXdzNQSE1LYVhRT0h4eFVBa3Z2WWlH?=
 =?utf-8?B?RzV4WENIRjAyaHBtQk1YSUlIdG5IRmN6L2t3bE0rMWZJVmI5Zks2SmZhMmZq?=
 =?utf-8?B?cG5sTThuT2RmdjFaSjRWQ20xNmRmeEpKajMwZVl1dFRJZXh0NGZYcm04elNT?=
 =?utf-8?B?bVA5SXBGVkZ0amJBUDllNXdpQUFmUkc2bzFib3JMVm04WWU5ZzNUajBJOEFq?=
 =?utf-8?B?NDdCUk1mVWJxZGh4Zk9WNENTU3NJSzJDSFNQQUw1Nkg0T3BUTGJUd0xvZ3Vt?=
 =?utf-8?B?cE91MWpGM1d5bkRHSE1xajVWWE9JbUZmektPTmZxNkVQTzVCZk5LK1pJa3BO?=
 =?utf-8?B?b09xMzFkVER0bmpVTmxxR3phcGhCM1BZby9oVlBITzF3YThWd2c4Z2poVFEy?=
 =?utf-8?B?aXZDR25hNjRPTG91ZnNYaU03L2xNNUZXMXVtTEFBV0RCeTNzOUNVSUI3eU1r?=
 =?utf-8?B?ZER6bmJwQ283OVVKb1lhTUxQOFFJMjdrbk5OOWZxNjhWem9Gb0F3UjBrQ2g5?=
 =?utf-8?B?VktBSHVjMk84TjU0YStnaW5CU2xldGFrc2VCc3ZFcC9KME5NVWxya2NLTHRI?=
 =?utf-8?B?VjJ0aG1Wb3JyOUdrRHpBd0w3R0JjTS9hS2JubWs3ZFhiQ1VkMHNER0FqUnlZ?=
 =?utf-8?B?N21nckphS1d0SWxnQjNIQVNZYkJXRGpIdVUxeEFQa1BVK0RQREw5ODlUTFJT?=
 =?utf-8?B?WHdoSVNKQjQrOG9EZGg1Qlg2V2tBcExXaWMzUExCMUpobDQwdlIzUnhEemJR?=
 =?utf-8?B?a0RzZ1pwTWNmNTRZcXhYVG5DNWFwUTlVaVkrY2xrY2p2dy91Y2JZWlVGYUEv?=
 =?utf-8?B?UWZiemZXdHFvMlYveXRZWkRiWTZTWDZmNG9xenJXTjhMM081T1BwNG11TWln?=
 =?utf-8?B?djQ0RUVqYzNING9QVHkvOFR1THBNVlVscFJXbFN5bjNCbXQxTW1sNXc4L1F0?=
 =?utf-8?B?U0ZuV3hQbCsyQ2MyRCtiT0xpTFRSOExqK1g0S1ZuYTdaQ0RFTEdWdWpHZDFM?=
 =?utf-8?B?RHZOOGh4UVdsOVhRaFdjMXcrR2hET0NXeEpydlJ4WlNmYWpjL1d5OVhoc21W?=
 =?utf-8?B?NllNSzI0YU9oTDRSM2puZnBYaTBXeXdKUWNFQ29LN1ZLem9MbkJuUnB1Wk9s?=
 =?utf-8?B?QzNBQzJtOVJweVkrY1BnYno5UHoxNU0xVnUrTU1UaTQ1WDJBL0ExZFhrTTNJ?=
 =?utf-8?B?STJ4VDZ0U3M1azVtZlBISkZGbVlSRVlWMzlIa0R5blpIdnducEJuZU0zNXk4?=
 =?utf-8?B?R2dCTWZQOXRyTjFzWU5HQWY0RDZQbDVUSlNNNDBEZzErUVVCZTFaMVBKODJ2?=
 =?utf-8?B?eEhpakk0QmZQdkJ5MW5MN3lsN2IwR2YveDFNbXdGOFNNaDI3QzdWaEMyWml3?=
 =?utf-8?B?enpqYjEyS2NpcXU5UExYbXY4VUF2R1FwaGVWMytCOUxTV0RIeW9XMSszWncr?=
 =?utf-8?B?bE9vYm9aczhnY2RqZk5aUFp3bnpVc21maUg5a2Zxbmw5dER5cmVFRkw3eWVk?=
 =?utf-8?B?aWViWXNVaGlsVm9aVUNPZVRyY2N0OWdmcWh2QzI2eEpaczdmWFo2QVhEMzRs?=
 =?utf-8?Q?lWHWOSpaPse0hrNxNT7qmHEBS?=
X-OriginatorOrg: vivo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 19b8cf14-f2d9-413d-ce6e-08db93354d11
X-MS-Exchange-CrossTenant-AuthSource: TY2PR06MB3342.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Aug 2023 08:48:54.8050 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 923e42dc-48d5-4cbe-b582-1a797a6412ed
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: gphjwe+313VQBKag8iSgxFhdo6ypo9/nm3omUCb49uTMP2fOIjlUPComRZktCFfhDJrdt5j2HUYqWBRv0TYmuA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYZPR06MB5975
X-Spam-Score: 1.8 (+)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  Hi Chao & Jaegeuk,
 Could you please help to review this patch? Thanks. 
 Content analysis details:   (1.8 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
 no trust [40.107.255.121 listed in list.dnswl.org]
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [40.107.255.121 listed in wl.mailspike.net]
 2.1 DATE_IN_PAST_96_XX     Date: is 96 hours or more before Received:
 date -0.0 SPF_HELO_PASS          SPF: HELO matches SPF record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.0 T_SCC_BODY_TEXT_LINE   No description available.
 -0.1 NICE_REPLY_A           Looks like a legit reply (A)
X-Headers-End: 1qR7XU-00AanF-C3
Subject: Re: [f2fs-dev] [PATCH] f2fs: Only lfs mode is allowed with zoned
 block device feature
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
From: Chunhai Guo via Linux-f2fs-devel <linux-f2fs-devel@lists.sourceforge.net>
Reply-To: Chunhai Guo <guochunhai@vivo.com>
Cc: "linux-f2fs-devel@lists.sourceforge.net"
 <linux-f2fs-devel@lists.sourceforge.net>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

SGkgQ2hhbyAmIEphZWdldWssCgpDb3VsZCB5b3UgcGxlYXNlIGhlbHAgdG8gcmV2aWV3IHRoaXMg
cGF0Y2g/CgpUaGFua3MuCgpPbiAyMDIzLzYvMjAgMjI6MTAsIOmDree6r+a1tyB3cm90ZToKPiBO
b3cgZjJmcyBzdXBwb3J0IGZvdXIgYmxvY2sgYWxsb2NhdGlvbiBtb2RlczogbGZzLCBhZGFwdGl2
ZSwKPiBmcmFnbWVudDpzZWdtZW50LCBmcmFnbWVudDpibG9jay4gT25seSBsZnMgbW9kZSBpcyBh
bGxvd2VkIHdpdGggem9uZWQgYmxvY2sKPiBkZXZpY2UgZmVhdHVyZS4KPiAKPiBTaWduZWQtb2Zm
LWJ5OiBDaHVuaGFpIEd1byA8Z3VvY2h1bmhhaUB2aXZvLmNvbT4KPiAtLS0KPiAgIGZzL2YyZnMv
c3VwZXIuYyB8IDEyICsrKysrKystLS0tLQo+ICAgMSBmaWxlIGNoYW5nZWQsIDcgaW5zZXJ0aW9u
cygrKSwgNSBkZWxldGlvbnMoLSkKPiAKPiBkaWZmIC0tZ2l0IGEvZnMvZjJmcy9zdXBlci5jIGIv
ZnMvZjJmcy9zdXBlci5jCj4gaW5kZXggYzkxN2ZhNzcxZjBlLi42MjQ5NDgzYmU5MDUgMTAwNjQ0
Cj4gLS0tIGEvZnMvZjJmcy9zdXBlci5jCj4gKysrIGIvZnMvZjJmcy9zdXBlci5jCj4gQEAgLTg2
MSwxMiArODYxLDE0IEBAIHN0YXRpYyBpbnQgcGFyc2Vfb3B0aW9ucyhzdHJ1Y3Qgc3VwZXJfYmxv
Y2sgKnNiLCBjaGFyICpvcHRpb25zLCBib29sIGlzX3JlbW91bnQpCj4gICAKPiAgIAkJCWlmICgh
bmFtZSkKPiAgIAkJCQlyZXR1cm4gLUVOT01FTTsKPiArCj4gKwkJCWlmIChzdHJjbXAobmFtZSwg
ImxmcyIpICYmIGYyZnNfc2JfaGFzX2Jsa3pvbmVkKHNiaSkpIHsKPiArCQkJCWYyZnNfd2Fybihz
YmksICJPbmx5IGxmcyBtb2RlIGlzIGFsbG93ZWQgd2l0aCB6b25lZCBibG9jayBkZXZpY2UgZmVh
dHVyZSIpOwo+ICsJCQkJa2ZyZWUobmFtZSk7Cj4gKwkJCQlyZXR1cm4gLUVJTlZBTDsKPiArCQkJ
fQo+ICsKPiAgIAkJCWlmICghc3RyY21wKG5hbWUsICJhZGFwdGl2ZSIpKSB7Cj4gLQkJCQlpZiAo
ZjJmc19zYl9oYXNfYmxrem9uZWQoc2JpKSkgewo+IC0JCQkJCWYyZnNfd2FybihzYmksICJhZGFw
dGl2ZSBtb2RlIGlzIG5vdCBhbGxvd2VkIHdpdGggem9uZWQgYmxvY2sgZGV2aWNlIGZlYXR1cmUi
KTsKPiAtCQkJCQlrZnJlZShuYW1lKTsKPiAtCQkJCQlyZXR1cm4gLUVJTlZBTDsKPiAtCQkJCX0K
PiAgIAkJCQlGMkZTX09QVElPTihzYmkpLmZzX21vZGUgPSBGU19NT0RFX0FEQVBUSVZFOwo+ICAg
CQkJfSBlbHNlIGlmICghc3RyY21wKG5hbWUsICJsZnMiKSkgewo+ICAgCQkJCUYyRlNfT1BUSU9O
KHNiaSkuZnNfbW9kZSA9IEZTX01PREVfTEZTOwoKCl9fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fCkxpbnV4LWYyZnMtZGV2ZWwgbWFpbGluZyBsaXN0CkxpbnV4
LWYyZnMtZGV2ZWxAbGlzdHMuc291cmNlZm9yZ2UubmV0Cmh0dHBzOi8vbGlzdHMuc291cmNlZm9y
Z2UubmV0L2xpc3RzL2xpc3RpbmZvL2xpbnV4LWYyZnMtZGV2ZWwK
