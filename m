Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 1093878E704
	for <lists+linux-f2fs-devel@lfdr.de>; Thu, 31 Aug 2023 09:14:53 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1qbbt9-0005ka-OQ;
	Thu, 31 Aug 2023 07:14:46 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <guochunhai@vivo.com>) id 1qbbt8-0005kR-9Z
 for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 31 Aug 2023 07:14:45 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=MIME-Version:Content-Transfer-Encoding:Content-Type
 :In-Reply-To:From:References:Cc:To:Subject:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=KVTsjUqmao8vzIg21RNlkdPj5TbhzcJ4blExuM65Gn4=; b=cQaKfoKgXte9o63MY/J2NULecW
 DDNcOcllmJFyaAO2vTDT/8KgCz1RJoHQndWuJ9GjjV3YVDxhtEQhKMXw/4dvB0pWxJqWdP0gpbs/y
 dpmnk0UdtQg/dBm+CwmjUihVYq4MF2rhW0tYYd+bLv+vNHMQZl6I4rIA2kTKiMltLwlY=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=MIME-Version:Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
 References:Cc:To:Subject:Date:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=KVTsjUqmao8vzIg21RNlkdPj5TbhzcJ4blExuM65Gn4=; b=lJ+CRsqJjTE27FdyShR+b+3jWo
 0aqEjUiU11QaucVZ0tDwwo9dogDx4BKmfxgqqfCuDDcYKtjLj+0JIOLDzmg+74LlW7L8DK0dySvHN
 b/9ysJZbpMKz+yRJRZJqPfdqI4MTCEq3t7FntzF1ffruvGDhcnHzvPyRSHeNc7V4oSBg=;
Received: from mail-tyzapc01on2099.outbound.protection.outlook.com
 ([40.107.117.99] helo=APC01-TYZ-obe.outbound.protection.outlook.com)
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1qbbsk-0001uT-OA for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 31 Aug 2023 07:14:35 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=CPv5bpwqZ73Aq+NyBhOAn1q/J35kIqA0PRXHSODDDlYp7l3h5bYA+v5eLuCvCRKHy2fYe8tjPRI+dIgMbIltGVDfRg9EI+5ylmwam+bIzWdVaN4xOBz6a4Ia8nbDM9PIoJz2FOCJn+j0+yNUKWg+BUq9rtTk2cSKq6xaB4lpH1Gr7kDXPiO/HVtuiCZPYqSCtyjEqvDe9IDnq0SNilhYz/6v+se2Yf/M9/L0YrX4bF9GvdpLeQ9ve0UVXqPNMc+GoPjnsgoA8DxFoKx+1mYF7/53c3AGlUVc2s67XPrrHkCWVUk9VfLKG/mdLbtLniWlmesTLgjWqXihVp/Tcji7XQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KVTsjUqmao8vzIg21RNlkdPj5TbhzcJ4blExuM65Gn4=;
 b=RaL/ITKX+72St/TCDIm/KF4GVb1er86rqIErEmVFHzl8+k64+X7NIP+OWiGS7ZOMBeSibxcpxEC7TecM9J5vngu4XNMjb3+RINWOkKKdhsyx+jjZ4AhqtqWUCAS/L05/Thk57//XoMNSVDSsEyHNZEy/Cysxvcprv42j7FcekKkDjPAF798CYElzD7TgaAYSaK8SrZmWNEu1vskE6zZVHDbB48Hrv2zqOYmTw3VjLfBaHSDf9GrJpBEy89EMltA5qxDFtLHm+j788cBkd5HzCGhi7tYzA4wsubh+Dl4th1Iuagga9M/gnYcqMRvfEaLaijFEpXnB24HKoPYTma7L5w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vivo.com; dmarc=pass action=none header.from=vivo.com;
 dkim=pass header.d=vivo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vivo.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KVTsjUqmao8vzIg21RNlkdPj5TbhzcJ4blExuM65Gn4=;
 b=qBVBbdUP6qkk/2zFuEASXSvvlZ6lMrVxcabli1Lzoa3879CtIbSjk6KqbjpXH9t1BNc+qEDdc84pk96N5kgKW8S1jdKbcroC6U6njjAo+7OG6ciyd3o0JPpTXx9y43vEs5D2Go6Dn8VSkuFW8FSA2G4f6rhEkg+onxjhEp9p9lEIGvjdmOOPZ4JO9FuY1grb7SaZGu7c1EMNmRJs6nYI6je5EGkG5N9TQx/s6xRnHdSe61KyQyMHxONwoFSlS4JhHpjBSlZSOTt2BMrdFxiGgIlkM+fGVdxfl2ZJyVhl63yMHwskcjT7jLBtz5mydySZj+OztpSWvRIs6CXWKF6qXA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=vivo.com;
Received: from TY2PR06MB3342.apcprd06.prod.outlook.com (2603:1096:404:fb::23)
 by SEZPR06MB5576.apcprd06.prod.outlook.com (2603:1096:101:c9::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6745.21; Thu, 31 Aug
 2023 07:14:11 +0000
Received: from TY2PR06MB3342.apcprd06.prod.outlook.com
 ([fe80::60d3:1ef9:d644:3959]) by TY2PR06MB3342.apcprd06.prod.outlook.com
 ([fe80::60d3:1ef9:d644:3959%4]) with mapi id 15.20.6745.020; Thu, 31 Aug 2023
 07:14:11 +0000
Message-ID: <069d91d2-5eb8-4ea1-aeaa-7200278f8a7c@vivo.com>
Date: Thu, 31 Aug 2023 15:14:10 +0800
User-Agent: Mozilla Thunderbird
To: Chao Yu <chao@kernel.org>, "jaegeuk@kernel.org" <jaegeuk@kernel.org>
References: <20230830035248.4051323-1-guochunhai@vivo.com>
 <eb97c111-4ea8-787c-b3e3-ce02909e1f3d@kernel.org>
In-Reply-To: <eb97c111-4ea8-787c-b3e3-ce02909e1f3d@kernel.org>
X-ClientProxiedBy: SG2PR02CA0124.apcprd02.prod.outlook.com
 (2603:1096:4:188::9) To TY2PR06MB3342.apcprd06.prod.outlook.com
 (2603:1096:404:fb::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TY2PR06MB3342:EE_|SEZPR06MB5576:EE_
X-MS-Office365-Filtering-Correlation-Id: 70a3ca09-e8fd-46eb-2ad9-08dba9f1e01a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: uZXLxKDtKX1LeiqexH3aBpdo5B5jjoOICQGgkxj8xZa4zXurUwpqKZwOz+iKxJvVt1b+x+OXBBBxNtdfgsqTmJlwjqrf2VLyqkrZNrKOYa6E8y3MtHD+xLftR6rU+BmMSS9enY58agLz85koeu4oFoBdZMg3RuGeYpYI2sX3Oa8gxsjheQ4a52cv2LFCaErqLb+1KdnbtY7f/RltWBTu1+o53n35PvKeAguqLtD5CVkVDv8e5UM/L7n+l1rELbtlD0Bs4mLCG5B/HEZuhL6W5K0MFnRbqj19/S7pSsO/Oh6isaxx0dQd4P6qGUTUbIp8RAQEGq1QvWHVPlwmN5htjxSqExw4hC70oh2kfZ17HzAGaVvrL/7UejMnXul8PnoPRvB1jpKYQ29PzfmG1fLyn51fNedyihoJx10lFFjkAV+WDNb+0cF63YUfXl9lGTg1QVr9SVMFj6DG0EYukLCs5xHTnQT87dGl9pGDqNHAYpbN49O3YAXJjHic8LbVuXHA1MqxbmFobOx4d/PooaROycYTTZNuno8Y+eo7ZJelOIK33chGxJ4YoEqrOCeVNZKDH4zX6oQm7Tda96CrHsvPe3lcTjbI0ZdqnS/CmGyHCEBmT+7t4Cd6euvg6zTPRc0sg6vJl1K+BaWYZ0R1sjRRFQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:TY2PR06MB3342.apcprd06.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(136003)(396003)(346002)(376002)(366004)(39860400002)(1800799009)(186009)(451199024)(38100700002)(478600001)(2906002)(5660300002)(4326008)(8676002)(8936002)(316002)(66476007)(66946007)(66556008)(110136005)(41300700001)(36756003)(86362001)(26005)(2616005)(83380400001)(6486002)(53546011)(6506007)(31696002)(31686004)(6512007)(45980500001)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?UkgxU3VOMEVFQlNYUFNHZXdLRDRyMmc2MzRoUGQxOG5VVWFQclF6REh0cTEv?=
 =?utf-8?B?b3JYT3dSMUpkVUdGS3dZeFZuZkhaSlIzSHBnM1hEL2R1Si9UTVdSWURhakUv?=
 =?utf-8?B?bzkvTGs3dmhvUEc3dEhYRkphZDEwYndHOGg3U3phMExNVk1MRzREelJxcnJV?=
 =?utf-8?B?RTdFOWJERXhKeFNOb2I5bkVNOVkyakdnQkhhNXp6blYvRzhNUkplNlFjRUI1?=
 =?utf-8?B?YnY2cU1pTGpBSHFEWExtVU5rTFgwQlBLOUR5bFpwaHk5b3hsMDhnZlRZL0RH?=
 =?utf-8?B?QTc0cENwVHZHWEZxeXI2OE81cStkUVBUSWFYcmlCNmlkYjRFWXpiUmoyVTk3?=
 =?utf-8?B?MTMzVGVOSzRka2xJRVc1L1BjaE5CWUVTQlJiRWRBbXVpWUROT2Q2UDRsZWV3?=
 =?utf-8?B?M3NEUEF0VzU3eU5pemNySXBxMks2OVRDUXdIUU1DeVZ6REE3MGxrRlZrYk9a?=
 =?utf-8?B?Njl1UkNmRURlL3BOK1RBcnI5cTRiMkRxc1ByZ0l1QzNNaVA0SHpPM3dkMmQ4?=
 =?utf-8?B?SHNhcUZ1OHFpKyt1Y1ExTFNRVE1ySFgvRXVMd3VZUnJuV0h2azlKWGV1YlNr?=
 =?utf-8?B?UWN0aXk5T3JWTExpT1Jldmh3UCtYOTZNNzQ4ZndKcWNZVm9XVlFiS21Bci9T?=
 =?utf-8?B?UVc2V0FuYnVRN2pHbmRuWldHWlAvQys5cmdTUkdLNlJKQ1MwMDRwdHBGZkll?=
 =?utf-8?B?WlpVM013a2k1SmIrMHI5YVo4bU1Bam5IUnF1ZDZrbHk0a0N6cGswNFZhMFpR?=
 =?utf-8?B?eWdkWlNpdXdIbCtNT2twdDRZMlkvQ1pNdkJ5STloK1lxWXdMVnJWeUwvbnI2?=
 =?utf-8?B?dGsxNzFDQjlaRkFsT0lzM28vaWRYMWNhUnRYNTUrNmhFcG1YVUd3Z2U2Q3Rl?=
 =?utf-8?B?cVlGc3NlZzExdm0rU0lvNmZRemNsbXNQeFpjOTdLWE5aTUVFNnRYeGlHZndV?=
 =?utf-8?B?eG9xS3IySjlXVnpGdXlsOFR1UFg2K3QwSjllUjJSNm00TThWaGpDUGVGdThq?=
 =?utf-8?B?OGpvVnZOeElOcExoeVZkZWIyUG1nTjBoSW5jaWhzZkVHSmJEdVJjY0FrVWt0?=
 =?utf-8?B?ajVNMWFsYjJVU3BjRnNMTFRtcTNGb3ZDeE9jbm04c3NCL3N6R3gybXBNSHBT?=
 =?utf-8?B?bU9PSEowUnI2a2lmSkduQXNkQUZiUFMzY25ZTUFSOG05M0l6dlhJNjZXRmwz?=
 =?utf-8?B?M0JrM1J5akp1d3BpcXhsOE9uNnZUeWpCUjZqcEJpTjMwRVZRQjFuMS8yU1lo?=
 =?utf-8?B?ZnJ2MkFmTDZ0Y05kTVB3aGNyYjhqUFZZZDUrQkZmdUdrTzNSTW4vRXdobEZE?=
 =?utf-8?B?Um1QOFlwN1ZsSkx2KzArSitvUm1FZS9VQ1dZTzJlWkJrclM1SWlwSzY3RHY4?=
 =?utf-8?B?c3JWalFkSVlxRTdVbTd4VG1Pd0s5c3VHSS9wTGNyMnBEbXFML0k4VHdwMjVs?=
 =?utf-8?B?QjlmQnhaQnltQTdiQU0xNStSTTBMS3g3Y1pWY3RqYzJtWEljMUx3ejNMYnFw?=
 =?utf-8?B?YytDNDdSeXFhVzUxcUE4VFJoVTNMZmVmcVg0dlg5aVpIUWdaZTd3dXc4S0s0?=
 =?utf-8?B?QkdyZHZUUTl6dGtaaGlON0Z1RU9kMTVVcUp5THMycXc5dnhERWRpSXdqQ0VC?=
 =?utf-8?B?RnQzTGFtdjN6S0JFUXRJQUc2V3k4QnNJSUYrRjJLQjBWemlyVnhLRXVUbXhG?=
 =?utf-8?B?WGdOMVdlSEpPanc4MlJGQXlQa0ZybGxnMjk1Mnh6UEd3emNQelR1RUtsQjh2?=
 =?utf-8?B?bnNMR2RzbVBzZkwrNmVYNENQQkxVSzYvSE1rc1pxdTFLUU9QLy9RcGZkWFBx?=
 =?utf-8?B?OTBVdHJUNE9ieStpNGVrQ1ZKZnNrQ1czRnB1enNhSzRkQlFrUWhhMW5HQUwr?=
 =?utf-8?B?aE5DUWErM3YwV3lZUk8zRGg4bm1lc0cyODlCNS92dWhtSUh6MlRYWTdJYjdm?=
 =?utf-8?B?WU5nNUZBaGJKcFdxVFYrYlNGZ3lmK2ZIVFNGMVlRSHRwTGhtTDRPN09LaGVV?=
 =?utf-8?B?cFc2Q3BvczNLMnBqVXkwTGRBY2EwWFE3ZUlKTWZtRjEraGMrNUlycWNxQmpa?=
 =?utf-8?B?SUNDWHdqYnVpZGR0WnF2WWVGNGY5ZCtpdzh0SDl3OEtxMHUvTCthak9jakJD?=
 =?utf-8?Q?PrLCiDb/3To91S37+IBkpUNB+?=
X-OriginatorOrg: vivo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 70a3ca09-e8fd-46eb-2ad9-08dba9f1e01a
X-MS-Exchange-CrossTenant-AuthSource: TY2PR06MB3342.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Aug 2023 07:14:11.6750 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 923e42dc-48d5-4cbe-b582-1a797a6412ed
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: lgVHqT/TmUNsOaHp6amLhmcxBP5nso7AVkej0CHFjo+C0xa3aRutx3uiRpjJBlxUwaYXou5lT4Qa8YqWp5AcUQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SEZPR06MB5576
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software, running on the system "util-spamd-1.v13.lw.sourceforge.com",
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 
 Content preview:  在 2023/8/30 22:05, Chao Yu 写道: > On 2023/8/30 11:52,
    Chunhai Guo wrote: >> The commit 344150999b7f ("f2fs: fix to avoid potential
    deadlock") only >> requires unplugging current->plug. Using blk_ [...] 
 
 Content analysis details:   (-0.2 points, 6.0 required)
 
  pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
                             [40.107.117.99 listed in wl.mailspike.net]
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
                              no trust
                             [40.107.117.99 listed in list.dnswl.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.0 SPF_HELO_PASS          SPF: HELO matches SPF record
  0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
                             valid
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
                             author's domain
 -0.1 DKIM_VALID             Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
                             envelope-from domain
X-Headers-End: 1qbbsk-0001uT-OA
Subject: Re: [f2fs-dev] [PATCH] f2fs: replace blk_finish_plug() with
 blk_flush_plug()
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

5ZyoIDIwMjMvOC8zMCAyMjowNSwgQ2hhbyBZdSDlhpnpgZM6Cj4gT24gMjAyMy84LzMwIDExOjUy
LCBDaHVuaGFpIEd1byB3cm90ZToKPj4gVGhlIGNvbW1pdCAzNDQxNTA5OTliN2YgKCJmMmZzOiBm
aXggdG8gYXZvaWQgcG90ZW50aWFsIGRlYWRsb2NrIikgb25seQo+PiByZXF1aXJlcyB1bnBsdWdn
aW5nIGN1cnJlbnQtPnBsdWcuIFVzaW5nIGJsa19maW5pc2hfcGx1ZygpIGlzIHVubmVjZXNzYXJ5
Cj4+IGFzIGl0IHNldHMgY3VycmVudC0+cGx1ZyBhcyBOVUxMIGFuZCBwcmV2ZW50cyB3Yl93cml0
ZWJhY2soKSBmcm9tIHVzaW5nCj4+IHBsdWcgaW4gc3Vic2VxdWVudCBsb29wcy4gSW5zdGVhZCwg
dXNlIGJsa19mbHVzaF9wbHVnKCkgYXMgYSByZXBsYWNlbWVudC4KPj4KPj4gU2lnbmVkLW9mZi1i
eTogQ2h1bmhhaSBHdW8gPGd1b2NodW5oYWlAdml2by5jb20+Cj4+IC0tLQo+PiAgICBmcy9mMmZz
L2RhdGEuYyB8IDMgKy0tCj4+ICAgIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMiBk
ZWxldGlvbnMoLSkKPj4KPj4gZGlmZiAtLWdpdCBhL2ZzL2YyZnMvZGF0YS5jIGIvZnMvZjJmcy9k
YXRhLmMKPj4gaW5kZXggNWQ5Njk3NzE3MzUzLi45MzZhOTU0NjQxODYgMTAwNjQ0Cj4+IC0tLSBh
L2ZzL2YyZnMvZGF0YS5jCj4+ICsrKyBiL2ZzL2YyZnMvZGF0YS5jCj4+IEBAIC0zMzQzLDggKzMz
NDMsNyBAQCBzdGF0aWMgaW50IF9fZjJmc193cml0ZV9kYXRhX3BhZ2VzKHN0cnVjdCBhZGRyZXNz
X3NwYWNlICptYXBwaW5nLAo+IAo+IEl0IG1pc3NlZCB0byBjb3ZlciBmMmZzX3dyaXRlX25vZGVf
cGFnZXMoKT8KClllcy4gU29ycnkgdGhhdCBJIG1pc3MgaXQuIEkgaGF2ZSBzZW50IGFub3RoZXIg
cGF0Y2ggd2l0aCB0aGlzLgoKVGhhbmtzLgo+IAo+IFRoYW5rcywKPiAKPj4gICAgCQlhdG9taWNf
aW5jKCZzYmktPndiX3N5bmNfcmVxW0RBVEFdKTsKPj4gICAgCWVsc2UgaWYgKGF0b21pY19yZWFk
KCZzYmktPndiX3N5bmNfcmVxW0RBVEFdKSkgewo+PiAgICAJCS8qIHRvIGF2b2lkIHBvdGVudGlh
bCBkZWFkbG9jayAqLwo+PiAtCQlpZiAoY3VycmVudC0+cGx1ZykKPj4gLQkJCWJsa19maW5pc2hf
cGx1ZyhjdXJyZW50LT5wbHVnKTsKPj4gKwkJYmxrX2ZsdXNoX3BsdWcoY3VycmVudC0+cGx1Zywg
ZmFsc2UpOwo+PiAgICAJCWdvdG8gc2tpcF93cml0ZTsKPj4gICAgCX0KPj4gICAgCgoKX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXgtZjJmcy1kZXZl
bCBtYWlsaW5nIGxpc3QKTGludXgtZjJmcy1kZXZlbEBsaXN0cy5zb3VyY2Vmb3JnZS5uZXQKaHR0
cHM6Ly9saXN0cy5zb3VyY2Vmb3JnZS5uZXQvbGlzdHMvbGlzdGluZm8vbGludXgtZjJmcy1kZXZl
bAo=
