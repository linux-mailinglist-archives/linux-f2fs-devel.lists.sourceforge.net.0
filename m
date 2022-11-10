Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 6646A6239CE
	for <lists+linux-f2fs-devel@lfdr.de>; Thu, 10 Nov 2022 03:32:47 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1osxMt-0004hU-PO;
	Thu, 10 Nov 2022 02:32:39 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <shengyong@oppo.com>) id 1osxMr-0004hJ-Du
 for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 10 Nov 2022 02:32:37 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=MIME-Version:Content-Transfer-Encoding:Content-Type
 :In-Reply-To:From:References:Cc:To:Subject:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=jUa8qLOqTuBEbSrfq+ZFzyIuKvGuKpept6jinQ3tA8g=; b=Q2/6O8o+aACkaIETVAJNpOrD/O
 4PgXri2S1ST4K8rFlhc7X1M/Y2dlm6JudL6+fFjUiQHFL2WJryDep7S3q1EGSk675w9z14LRiOCzC
 h8iylladundDfxTz/TpVJcwYSTvXektsnL0Iebc53Hfx0YkunpT1ao5Dmj6Egf6SHBSI=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=MIME-Version:Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
 References:Cc:To:Subject:Date:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=jUa8qLOqTuBEbSrfq+ZFzyIuKvGuKpept6jinQ3tA8g=; b=jaqphAyxsafhrULWRNihz/vGnj
 QmzkV52V9p3hXHLQ8jvZFyz7iIocYKT5TcibU9wBkyZgfRRulTXA8Y1TyS/wkOPH3tsYcVUQyYQ1u
 4HsAqA6b30PCUqjewsPDiykNLN9euS5BjcsBQlPVnZe2rYGsV/LRizROCNqXwzqXYM70=;
Received: from mail-tyzapc01on2052.outbound.protection.outlook.com
 ([40.107.117.52] helo=APC01-TYZ-obe.outbound.protection.outlook.com)
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1osxMj-002bc5-Sl for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 10 Nov 2022 02:32:37 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=RE5L1bgJ6VDsDGKGQ6RF4k4PfDpH6l05HveGh2MUo94HaDqxc2Ugy5TMYact9YoTrwFFmpVYzDdlI9+ZqRoGYnygE/UTLcGmrCcnB6Ez5NacfzsVp72CIhwsPZpENLVwMygOea7pgw//76PgJHNT/E4mbnn7hi3KK2gYySqoIWJUKUqoHjPXKrvAOTCQYfxH4uS+fmKtaU9ARdgw6e4TLRrljsVf4cMt2y1QQB0b03GQ9/T7XlVCLzEhfCwDoo6HpZF4tDXPhKeYv3NlaUZ943LmtdW4cwR9hdd17lcB+QmUtM7hINg7F42nkbj4EpLQtbHmX+akXk/Nhcy4KAbHOw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jUa8qLOqTuBEbSrfq+ZFzyIuKvGuKpept6jinQ3tA8g=;
 b=P0i2ksICQuiMxCELttRsdDIYPLNn0Cg8HP54lJMVZqY0L1sPgKPo0GiQvRjft96ZRhXfQaNM+Ca9Np2WSVX9jqdT6AxWPqbuaYeqMw7HxIcqlj8bq/aicxpvYqKrUSMCzQgiFX5QDhqjP0TMyV1iZnXMNbQb7zWE3VJZmi0x0f5vqs3bLAa11ppw1fLGKw87NgKvR67sg37Xv6VqpYrWeHmy1SmNKLRcyMTDx5KqPAsjZ7lcaOWUJC1O6shox2N8m0ikyZ0z0Zy1kLWpvxSWOW9FBwgCpuRfKGrEJQyUe4fXjSjOfIEgoMTXjg0P6kGModXiV1BRXY0N+NgwXzAhmg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oppo.com; dmarc=pass action=none header.from=oppo.com;
 dkim=pass header.d=oppo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oppo.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jUa8qLOqTuBEbSrfq+ZFzyIuKvGuKpept6jinQ3tA8g=;
 b=qRvdLbWWN6LYEEzA8zf0EM2/YY+jk23GPgVpTufckPOItZOuAClfSYMb2BRZJC03SIBPcJAYC+e7kwjq8hYN+46wvoyJfQUVag/nVMZ4ssylltJHdQ59PJ/wA1rLq2jxjzMg+BvV3tqL81iye7OGJb+c9RiB9R4beT61maQBTrI=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oppo.com;
Received: from SI2PR02MB5148.apcprd02.prod.outlook.com (2603:1096:4:153::6) by
 SG2PR02MB4377.apcprd02.prod.outlook.com (2603:1096:0:8::15) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5813.12; Thu, 10 Nov 2022 02:32:17 +0000
Received: from SI2PR02MB5148.apcprd02.prod.outlook.com
 ([fe80::31b6:afe9:43b5:aaca]) by SI2PR02MB5148.apcprd02.prod.outlook.com
 ([fe80::31b6:afe9:43b5:aaca%8]) with mapi id 15.20.5791.027; Thu, 10 Nov 2022
 02:32:17 +0000
Message-ID: <80630b6a-a7cf-be84-7f05-7b89a4a95757@oppo.com>
Date: Thu, 10 Nov 2022 10:32:14 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
To: Chao Yu <chao@kernel.org>, jaegeuk@kernel.org
References: <20221109110148.3674340-1-shengyong@oppo.com>
 <2a474126-ae64-ac31-9ba4-8d6b68f31bd6@kernel.org>
In-Reply-To: <2a474126-ae64-ac31-9ba4-8d6b68f31bd6@kernel.org>
X-ClientProxiedBy: SI2PR01CA0034.apcprd01.prod.exchangelabs.com
 (2603:1096:4:192::9) To SI2PR02MB5148.apcprd02.prod.outlook.com
 (2603:1096:4:153::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SI2PR02MB5148:EE_|SG2PR02MB4377:EE_
X-MS-Office365-Filtering-Correlation-Id: 0166c029-f354-4d35-0226-08dac2c3c8ea
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: xmefBSNCQe5B/WarykxjhVygVLX3+l4fgm/Myc5D5rMj9QJJssoNhFh6tdKVJn65Rfa8DPZbqwDHKHZIraHYTbRGc+Spoh87z9MPzLAQ8qp0LWuenWtfjPhOdSZYW/9mrC1ZMI15xnSgyE1E92z+Mn0qiBZTYMXwD1x0VxJ4td/qrRVsjMTIJssLulmB6hTZxAHgQX2IPhZBnQ3G9nM/dzirXUJ0wE4joB2YH28I3AhUanG7h82S8vPibx/wsaJFiMtvzkuNA4dgz+2ADhibPa4ReJZBdQ8N2bksyl+xafV32JnOlXfkuEhtJEc5fgcLWgqfkoOPxpl0YMEzuWj+zwSrVmNKpRRsMrVHSu/sfrsgyN339OPFRGqfpup1I5EWu3ob2duhHEzja9cIeWzixJFQ2puNdv6Bo0MQrdbBr8VJnrkTu6Ro/Z0+KTLTXySbaH6smqW9wx/EBonTT1t5TzeyhKw4CxJQsV7dTIAXiMJJJPNwsmMJ4ycSiyqEKJj6OJpumY1Bt1XdFn98tirEF+xNw92yU3oO8SdZyya1LCU0D+nH+N6jQQ7oXXmKLIyIGsQWMKqZyOYe3BkCMv/5KyuPjJUkCUte5HUFrdSlBDr7AN0AVhq8Qhc0yb8lk6IbR0Ii09gA0kUEUCPto4+GUUXk0vA0Yvk6IDAJ4OiXsxuJClRM53sv+/kDVNX7EsFXbPOlzWyvv2D5h8kBaVglUg62RCPDxao+ot0M/aToYy6GXG1+V56wjq0dtKaad+9IC7io/E+qRalXe3Fp1xjj0Oj2HT339HWDmAaMi69tOK4=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SI2PR02MB5148.apcprd02.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(4636009)(376002)(39860400002)(136003)(346002)(396003)(366004)(451199015)(478600001)(2906002)(186003)(2616005)(66556008)(8676002)(66946007)(4326008)(66476007)(6506007)(53546011)(8936002)(5660300002)(26005)(6512007)(41300700001)(83380400001)(31686004)(38100700002)(31696002)(86362001)(6486002)(6666004)(36756003)(316002)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?c2U4VEQ1ZzN1TE80TE9nOS9FSU1iMnd1Z3hrcHY3OTg0MTlOdXBVYVFEU1hT?=
 =?utf-8?B?RlNaT2lVRE1nNWp1YzhxbktZK3pwY0IxZE1NVWF5dnNmVGgvZXVTUEhUVUxt?=
 =?utf-8?B?NGFRVDVmc3k0R0lLeDZtK3NaRDFRV3Ftb1VmRHpuOUxBZXplVmcydFl4Y2Fh?=
 =?utf-8?B?SWtic2ErR1lZRjBpcWdVeHEwNmx1L3g0NlpoV3psOGRPOTI1SExhblR4bmhT?=
 =?utf-8?B?b01MSytMWVU3cERQSE8wd0wxd0FJclBmVS80UHdneEtETDFWck1icHhONHFV?=
 =?utf-8?B?L1FUdmY3cGJ4dHVDTCtQWHVJZVRVTXp0TXNXMjVXUXVXQlFtaW1BUmVQOGxu?=
 =?utf-8?B?dnZ0Ni8yUFNWSkU5UkdCaEFCZkt6WVp6Nm50Y1J4UjdFZGs3a3JhaDJWVC8v?=
 =?utf-8?B?QmE1ajQrUzUzSVFiQmx2V1B0WlA3QUJRUTZOcnZ6YXhVN1VGb2dVRXdkSG5C?=
 =?utf-8?B?WVduOHBvQUxQeUQ5QVhDMXNKYTd3RitoY1BwL2VaVkpmcHZaaVVnbWdnY0Mz?=
 =?utf-8?B?Q211TUNReG9LRnhNenBRdlJ6RDZ6MW5Zc3R5QWExTDhQSW5oTkRySWtmaC9w?=
 =?utf-8?B?OTdiemFVblFneTY5aWpjQXc2bWZrK1NhYmJjYWJLOWRscW5wSUNzSVIxdUtr?=
 =?utf-8?B?RXovZlhLNEhRUDl2OEw2TkhjQmo2M3pDQjNMVVdTaFpoV3VIVEJ2cDVpL1Bv?=
 =?utf-8?B?S25sWUxSK2M4bXF6akVtbUppbkljVGF2OCtaNXhmUU5jdW90dGZsakZuQkcr?=
 =?utf-8?B?SFhFMlhFZ2JPZTVkM2dtMk9iRGdWYjdZVm52QVI4M3c4dGIxZ0lVT00vNWVv?=
 =?utf-8?B?RlVNL3owa1VmUlNIdWV6blRmbGgrNmc0cVY1NnpoT2gvNVlQSERUT1lUQTk5?=
 =?utf-8?B?Y2IwOEh1MEFPRk5tZCt2cFhaU25ISWlhcTlNdURsaTNQcGhzT01DQmtTWDR6?=
 =?utf-8?B?c0I0eFFHZzlleUxsdzRpL1BPdmNQL0J4T0oxSms2WElkbk1la2ptMzJGRFFt?=
 =?utf-8?B?TVdEbUlUQ0tuM2oyNFVNaVhubmRsZnZCMXBSMmI0cThac0dIWWxxa1ZUUWdD?=
 =?utf-8?B?MjdLeEdiUXBGKzZHYkZvWVFvb3VCTjRwbThpWXdBZ0hHWmh6eEdaSm9Da3ZJ?=
 =?utf-8?B?WWt0dS93bk1HMzZISXM3d3RHNHMzWTd4ZitNMlBjdkVtdjEvSE5yU0Jndm9S?=
 =?utf-8?B?R2ZBYnpTbkcvWExoK1RsdER0cUNXZmgrSWFHU1IzZFlSQ3FEL2pPcXhjRkdj?=
 =?utf-8?B?YWNLa085bFZkcnNUeFNRdHVGMGVkMDBWby96ZFl3NjAwUitvUml0VDBZaElU?=
 =?utf-8?B?Ry9kdFd2NjlPOGpCMXpjNFoyQ2pWTjBXUEhaVCs0a2VURktCUEwrQjB0YnFk?=
 =?utf-8?B?RmNSRE81V2xvd2t4T0lDdlZvbkxIZ2lLK2dhYktPckNYc1N4cXQwZzJWMXUw?=
 =?utf-8?B?eEMrRXlncUNSRUs4Vk9iZ1BJdkkwODZ3bHN6VkY4eFNMeS9oMzhKNW1YVWdo?=
 =?utf-8?B?bVNHcFlQcEJ3V3QwUUhYZSthUkNCSHJCekFhaGpEOEJvaUxlcjRCaXBtYllO?=
 =?utf-8?B?eU9tN3IrWmxEMWNHY1lCN0FvRlplWmQyUUh2VUtaUDJPcHliZHd5TkdHSi9v?=
 =?utf-8?B?b2VVc1ZjSXAvR09iRlk3R2JUOEVIdXdsdU1PS0JRNHVFS1h0eUw3bDNpbldt?=
 =?utf-8?B?cXdMZHpGc0lFWVlnbFFPU1ozK2krTGlncnJIalV2dTRJWnRuZ2MrNHdJbDVG?=
 =?utf-8?B?c25tVzVmWkQwbGMwTWpGNW1nYkZ1bEhQWDFiNjlHTE8ydGRrWlRHbVlmQ0tR?=
 =?utf-8?B?c0tNY0g5bVRIMDZZRXJ3dXZJR01sU2VwT0prcUpSRWJxdkpDeDhwcVFsR1h2?=
 =?utf-8?B?NGZaZW8zY3RoMGZySmV6ci84azVtaHBWbnNhU0NNakp2b3BDcnVmK2VwMWt0?=
 =?utf-8?B?NmI0WHo0UlBqRFRsYm8vV1lNemp0dGNUa0lNRW80Und5TnBVWTZxQ1dFbzFl?=
 =?utf-8?B?SDhCYThQcWZTTHFjRXkwc29HT1JUa2Vyci9DUnduRW05bHFHMzgxcHB3OTNz?=
 =?utf-8?B?Z2FyYVJ5dmhldklyd1JMUEdud2Zybm1pTzhoR3pKVmRaUlZBNmVMQkw1dllh?=
 =?utf-8?Q?1JIPqW6gViSfXndh83nDimhsS?=
X-OriginatorOrg: oppo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0166c029-f354-4d35-0226-08dac2c3c8ea
X-MS-Exchange-CrossTenant-AuthSource: SI2PR02MB5148.apcprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Nov 2022 02:32:17.2942 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f1905eb1-c353-41c5-9516-62b4a54b5ee6
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: pGoa5VT6t5XQIsXdUgEAPT7XhV6roUbg2O4MyZRtTHL2SsTm8Vyzr87U1QmRpqxnzUuUSlVIJpaVd8d/mRa2fg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SG2PR02MB4377
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software, running on the system "util-spamd-2.v13.lw.sourceforge.com",
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 
 Content preview:  在 2022/11/9 21:57, Chao Yu 写道: > On 2022/11/9 19:01,
    Sheng Yong wrote: >> If compress_extension is set, and a newly created file
    matches the >> extension, the file could be marked as compression [...] 
 
 Content analysis details:   (-0.2 points, 6.0 required)
 
  pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
                              no trust
                             [40.107.117.52 listed in list.dnswl.org]
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
                             [40.107.117.52 listed in wl.mailspike.net]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.0 SPF_HELO_PASS          SPF: HELO matches SPF record
  0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
                             valid
 -0.1 DKIM_VALID             Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
                             envelope-from domain
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
                             author's domain
 -0.0 NICE_REPLY_A           Looks like a legit reply (A)
X-Headers-End: 1osxMj-002bc5-Sl
Subject: Re: [f2fs-dev] [PATCH] f2fs: fix to enable compress for newly
 created file if extension matches
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
From: Sheng Yong via Linux-f2fs-devel <linux-f2fs-devel@lists.sourceforge.net>
Reply-To: Sheng Yong <shengyong@oppo.com>
Cc: linux-kernel@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

CgrlnKggMjAyMi8xMS85IDIxOjU3LCBDaGFvIFl1IOWGmemBkzoKPiBPbiAyMDIyLzExLzkgMTk6
MDEsIFNoZW5nIFlvbmcgd3JvdGU6Cj4+IElmIGNvbXByZXNzX2V4dGVuc2lvbiBpcyBzZXQsIGFu
ZCBhIG5ld2x5IGNyZWF0ZWQgZmlsZSBtYXRjaGVzIHRoZQo+PiBleHRlbnNpb24sIHRoZSBmaWxl
IGNvdWxkIGJlIG1hcmtlZCBhcyBjb21wcmVzc2lvbiBmaWxlLiBIb3dldmVyLAo+PiBpZiBpbmxp
bmVfZGF0YSBpcyBhbHNvIGVuYWJsZWQsIHRoZXJlIGlzIG5vIGNoYW5jZSB0byBjaGVjayBpdHMK
Pj4gZXh0ZW5zaW9uIHNpbmNlIGYyZnNfc2hvdWxkX2NvbXByZXNzKCkgYWx3YXlzIHJldHVybnMg
ZmFsc2UuCj4+Cj4+IFNvIGlmIGEgbmV3IGZpbGUgaXMgY3JlYXRlZCAoaXRzIGlub2RlIGhhcyBJ
X05FVyBmbGFnIGFuZCBtdXN0IGhhdmUKPj4gbm8gcGluL2F0b21pYy9zd2FwIGZsYWcpLCBpbnN0
ZWFkIG9mIGNhbGxpbmcgZjJmc19zaG91bGRfY29tcHJlc3MoKSwKPj4gY2hlY2tpbmcgaXRzIGZp
bGUgdHlwZSBpcyBlbm91Z2ggaGVyZS4KPj4KPj4gU2lnbmVkLW9mZi1ieTogU2hlbmcgWW9uZyA8
c2hlbmd5b25nQG9wcG8uY29tPgo+PiAtLS0KPj4gwqAgZnMvZjJmcy9uYW1laS5jIHwgNyArKysr
KystCj4+IMKgIDEgZmlsZSBjaGFuZ2VkLCA2IGluc2VydGlvbnMoKyksIDEgZGVsZXRpb24oLSkK
Pj4KPj4gZGlmZiAtLWdpdCBhL2ZzL2YyZnMvbmFtZWkuYyBiL2ZzL2YyZnMvbmFtZWkuYwo+PiBp
bmRleCBlMTA0NDA5YzNhMGU1Li45OWRiZDA1MWFlMGJhIDEwMDY0NAo+PiAtLS0gYS9mcy9mMmZz
L25hbWVpLmMKPj4gKysrIGIvZnMvZjJmcy9uYW1laS5jCj4+IEBAIC0yOTUsOSArMjk1LDE0IEBA
IHN0YXRpYyB2b2lkIHNldF9jb21wcmVzc19pbm9kZShzdHJ1Y3QgCj4+IGYyZnNfc2JfaW5mbyAq
c2JpLCBzdHJ1Y3QgaW5vZGUgKmlub2RlLAo+Pgo+PiDCoMKgwqDCoMKgwqDCoMKgIGlmICghZjJm
c19zYl9oYXNfY29tcHJlc3Npb24oc2JpKSB8fAo+PiDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgRjJGU19JKGlub2RlKS0+aV9mbGFncyAmIEYyRlNfTk9D
T01QX0ZMIHx8Cj4+IC3CoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oCAhZjJmc19tYXlfY29tcHJlc3MoaW5vZGUpIHx8Cj4+IMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCAoIWV4dF9jbnQgJiYgIW5vZXh0X2NudCkpCj4+IMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIHJldHVybjsKPj4gK8KgwqDCoMKgwqDCoCBp
ZiAoaW5vZGUtPmlfc3RhdGUgJiBJX05FVykgewo+PiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoCBpZiAoIVNfSVNSRUcoaW5vZGUtPmlfbW9kZSkpCj4+ICvCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCByZXR1cm47Cj4+ICvCoMKgwqDCoMKgwqAgfSBlbHNl
IGlmICghZjJmc19tYXlfY29tcHJlc3MoaW5vZGUpKSB7Cj4+ICvCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgIHJldHVybjsKPj4gK8KgwqDCoMKgwqDCoCB9Cj4gCj4gSG93IGFib3V0IG1vdmlu
ZyBzZXRfY29tcHJlc3NfaW5vZGUoKSBpbnRvIGYyZnNfbmV3X2lub2RlKCk/CgpIaSwgQ2hhbwoK
SSBwcmVmZXIgbm90IHRvIG1vdmUgaXQuIEJlY2F1c2Ugc2V0X2NvbXByZXNzX2lub2RlKCkgbmVl
ZHMgCmRlbnRyeS0+ZF9uYW1lIGFzIGEgcGFyYW1ldGVyLCBidXQgZGVudHJ5IGlzIG5vdCBwYXNz
ZWQgdG8gCmYyZnNfbmV3X2lub2RlKCkuIEkgdGhpbmsgdGhhdCdzIHdoeSBpdCB3YXMgY2FsbGVk
IG91dHNpZGUgb2YgCmYyZnNfbmV3X2lub2RlKCkgaW4gdGhlIGZpcnN0IHBsYWNlLgoKdGhhbmtz
LApzaGVuZ3lvbmcKCj4gCj4gIMKgwqDCoMKgaWYgKGYyZnNfc2JfaGFzX2NvbXByZXNzaW9uKHNi
aSkpIHsKPiAgwqDCoMKgwqDCoMKgwqAgLyogSW5oZXJpdCB0aGUgY29tcHJlc3Npb24gZmxhZyBp
biBkaXJlY3RvcnkgKi8KPiAgwqDCoMKgwqDCoMKgwqAgaWYgKChGMkZTX0koZGlyKS0+aV9mbGFn
cyAmIEYyRlNfQ09NUFJfRkwpICYmCj4gIMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgIGYyZnNfbWF5X2NvbXByZXNzKGlub2RlKSkKPiAgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oCBzZXRfY29tcHJlc3NfY29udGV4dChpbm9kZSk7Cj4gCj4gIMKgwqDCoMKgwqDCoMKgIHNldF9j
b21wcmVzc19pbm9kZShzYmksIGlub2RlLCBuYW1lKTsKPiAgwqDCoMKgwqB9Cj4gCj4gIMKgwqDC
oMKgLyogU2hvdWxkIGVuYWJsZSBpbmxpbmVfZGF0YSBhZnRlciBjb21wcmVzc2lvbiBzZXQgKi8K
PiAgwqDCoMKgwqBpZiAodGVzdF9vcHQoc2JpLCBJTkxJTkVfREFUQSkgJiYgZjJmc19tYXlfaW5s
aW5lX2RhdGEoaW5vZGUpKQo+ICDCoMKgwqDCoMKgwqDCoCBzZXRfaW5vZGVfZmxhZyhpbm9kZSwg
RklfSU5MSU5FX0RBVEEpOwo+IAo+Pgo+PiDCoMKgwqDCoMKgwqDCoMKgIGYyZnNfZG93bl9yZWFk
KCZzYmktPnNiX2xvY2spOwo+Pgo+PiAtLSAKPj4gMi4yNS4xCgoKX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXgtZjJmcy1kZXZlbCBtYWlsaW5nIGxp
c3QKTGludXgtZjJmcy1kZXZlbEBsaXN0cy5zb3VyY2Vmb3JnZS5uZXQKaHR0cHM6Ly9saXN0cy5z
b3VyY2Vmb3JnZS5uZXQvbGlzdHMvbGlzdGluZm8vbGludXgtZjJmcy1kZXZlbAo=
