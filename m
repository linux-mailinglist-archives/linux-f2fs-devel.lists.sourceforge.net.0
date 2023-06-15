Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id E509A730D0A
	for <lists+linux-f2fs-devel@lfdr.de>; Thu, 15 Jun 2023 04:13:29 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-3.v29.lw.sourceforge.com)
	by sfs-ml-3.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1q9cUD-0003LF-4Q;
	Thu, 15 Jun 2023 02:13:21 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-3.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <guochunhai@vivo.com>) id 1q9cU8-0003L8-DJ
 for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 15 Jun 2023 02:13:16 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=MIME-Version:Content-Transfer-Encoding:Content-Type
 :In-Reply-To:From:References:Cc:To:Subject:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=KOpVARtoL+JZfry20saZTAh6vtlO5vkjHgiSJBVrjsY=; b=MR5uUyY/Y06i7tNX6Wmm0d3c17
 udco1VfIEe1b0h8//QPVNOJyHxy4Ldp1+8fxLzuUd7Oudf1N2cG7HbuQ6YKX0IE2vEdda62gZtrmP
 aj5b5diUQT0Xgrj0ja8qowbmTrr7pU69QBqncv2n1INsXDzNFVpBsaQLcVIbVwDTT8qE=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=MIME-Version:Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
 References:Cc:To:Subject:Date:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=KOpVARtoL+JZfry20saZTAh6vtlO5vkjHgiSJBVrjsY=; b=nOQgdvvztnCxEpoD4p3CmfayZG
 SLYqYe4MJKecbq3NsqtsebUQfpZ/llg2+pQMiNv5SaLuVTV7WksEtlAiIhBK6uNYYS/i0FPVAgWwH
 5wn626NdSjQ34dL0EmkWB79fMDfSD8K0m60e2IHPbqkRj80Oja6N0CIwaYUtiq0gsNz4=;
Received: from mail-sgaapc01on2095.outbound.protection.outlook.com
 ([40.107.215.95] helo=APC01-SG2-obe.outbound.protection.outlook.com)
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1q9cU1-003W1X-2r for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 15 Jun 2023 02:13:16 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=epfRfZz1Az2NacwmDtiwelS78eBgo1bQsiBBRdR3L31IdUbeOPQ/4TRuN5FDNla6g2FOCEBC3zgYsZ3b0vOFedLeUQrPPMUGuff3tI75yI/bc9b+pEIMAQAYUX6F38+ZFgh4RgHxyPB/+GTErfj0UA3S/wDl/GUxhPO0YpJV/xzUP26Zjbb9W+1pw2rk67cD5ScCw2X/oHhGHetTia5+4QzddyzwkZ6+Pysp4MoO5sp8x3GA87qgbjHD9RtKEWmVD0O6cRH/EBPL7N2foLJr5DNJX49boniLW0xE5hi9NAlhLWVVzlgK4nwqXxqjnCocPhYkcTyJA/54qFllUH1PEQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KOpVARtoL+JZfry20saZTAh6vtlO5vkjHgiSJBVrjsY=;
 b=kGOALzGZHbpCT9A8+0g1md56RPY+Yiny7WG/qeHEBmDVfv/4hdnzeUUuJzExSd+x5xbmjE6ye9xI1aUriUYQP0UYozhV7AZ2+y+ukJI0ToVvArAxW69rKRbeZVDIOED1j+RoDyNNKGMcNaJdhsuP3PryLzSooKQ5tmv7I9duUqCLTKE1FkhCaWba8/faKDxgORlHmaeHue5GQPG6zhnsRgeGj6hAkM4Z3yREFBKv4jTz+zP0RQFtcTLNb1UwJ7gyB1YOZcAjQP9ggxoChHLXzDU/6ga67u502XPcmu4WQm3a2XnyLaygOaTlojdB7EsD1awhQXp8A0fi+PxI4THyCg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vivo.com; dmarc=pass action=none header.from=vivo.com;
 dkim=pass header.d=vivo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vivo.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KOpVARtoL+JZfry20saZTAh6vtlO5vkjHgiSJBVrjsY=;
 b=l3wAbVrjLeCYKnzmLW4H8mN5oWo0k+527xYwXagKuCSl7OwcfKJVJKrg+1IYgYJcTufwOZevOe5tiBvsOani8E7RWIltl57lHqNfqx08iAhF9QnAzEjROkuvSwDS4aqfrTicx/xW1osOhGcCVZaRVdSzAQUmnF6T0wF6k6DMDDlzlSjqx2moFQ6x0JZGu+4YtEDq5O7PcMCbLvql0JW5jQCyw0XFxSUVdQ7CLHGlPKk89E1BFtvLto9Q6utC6Fzf+mByToADS22pq5i2AjHotBs4mDrX6FYKeWHcQyRkifPufv3vMx3wu88oZoA3r+v5kGgduxPOk06NpPvhMqCKHw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=vivo.com;
Received: from TY2PR06MB3342.apcprd06.prod.outlook.com (2603:1096:404:fb::23)
 by TYUPR06MB6176.apcprd06.prod.outlook.com (2603:1096:400:351::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6455.38; Thu, 15 Jun
 2023 02:12:59 +0000
Received: from TY2PR06MB3342.apcprd06.prod.outlook.com
 ([fe80::e008:38cc:5ce6:769a]) by TY2PR06MB3342.apcprd06.prod.outlook.com
 ([fe80::e008:38cc:5ce6:769a%3]) with mapi id 15.20.6477.037; Thu, 15 Jun 2023
 02:12:58 +0000
Message-ID: <200686e4-496e-f75c-2ccb-9819f03d56ee@vivo.com>
Date: Thu, 15 Jun 2023 10:12:54 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.1
To: Jaegeuk Kim <jaegeuk@kernel.org>
References: <20230524024204.13694-1-guochunhai@vivo.com>
 <12df63c7-71b3-3223-b9fa-0dff6c1d6d14@vivo.com> <ZInnlBef7lNbBZbV@google.com>
In-Reply-To: <ZInnlBef7lNbBZbV@google.com>
X-ClientProxiedBy: SI2P153CA0015.APCP153.PROD.OUTLOOK.COM
 (2603:1096:4:140::21) To TY2PR06MB3342.apcprd06.prod.outlook.com
 (2603:1096:404:fb::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TY2PR06MB3342:EE_|TYUPR06MB6176:EE_
X-MS-Office365-Filtering-Correlation-Id: a74e7e51-d6a9-4ed8-df9d-08db6d4609c7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: /LoDonljZdJkt11mgn0m0gGXXbDEadGNI3dotHnp0g0x5A38ZP7tU8gJ/UbsWelZJJ7gxVBP38Ub0X8nO6a7FDW6B2Gv6Bqmcdx6fK9qslAGQyKrRlMhQTNB2uE7LcpQRibhEua2SJu0uNMZLoYb9DvmIEimcGzvV1TsAlNxvBbeJ82Je0+H59OjWGD6ijxOIpON5qYb1OXGxK44sMqUVcc9KzPDr31WQQ62RfSFWi0pkqFl8bWH7+gEhS1rpqjiGcnQmqDgn2S6Di5BCvyN5NSzNgZFt3RYvIBxmsxKkswyXm0nnXJCSOU27QdBEP7ZW5XKwD3Quol3VgbiKrIwxxcfC7IRRut/dAyzTlkD2QAwWA7eCDIu0Woa+UgATFROVTB1EW8g2Vh8YqRboAJETue88RFa7n47CpjsS7uEXB3gciMQXcUQDWYg1feqWYbfTOLulHBeQjZW1OmSsZfj/4p9+EBLMW7woOAAqggb1k69srznK8N43vNXZ19hBcunKyS/KO3EMAu6ZAdZPyqKEYj8eDMjf/5wZQn0O/U2PvUcP5KChR7HzaGIUiLjVtYj2b8xHblTm2j+EApBDmkEHyu9m94oFotSWMfIDabbIfutDk2HBkieUOn/+PyNyDe7TDqGWlA7tm3tdlZXA0nUpQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:TY2PR06MB3342.apcprd06.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(4636009)(136003)(39860400002)(346002)(366004)(396003)(376002)(451199021)(478600001)(6666004)(36756003)(186003)(38100700002)(83380400001)(86362001)(26005)(2616005)(6486002)(6506007)(6512007)(31696002)(53546011)(8676002)(5660300002)(41300700001)(31686004)(2906002)(316002)(54906003)(8936002)(6916009)(4326008)(66556008)(66476007)(66946007)(43740500002)(45980500001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?b0VIZnRFaU1Kd0pKOEJnalhRY0NiS242SDhmRUEvRjVIaVExNmg0Q3lyVzhr?=
 =?utf-8?B?Smh6TFM0RVhnaE9YTFNGWFhWTFJmV2h4dHBjNnE1K0k2N1ZWWjN2a2dsL2VC?=
 =?utf-8?B?NDd1N09saHhpSFVnb0NXYXNlZW00YnRGbHlWMW1OUzFEamdJajM2Z3BuUTlr?=
 =?utf-8?B?NFdBeGhsQ3hOaldLUjNhT2ZTY1pYb2ZjeTk5ODZpVEFYcTdMSmVoS2NhTXB2?=
 =?utf-8?B?WUNLWG5mRVVobEVFQTRTYzVzNDVQWUx6MmhxVFRoMUgzazdOemdoNm9yNnZs?=
 =?utf-8?B?aG9aSndvcUpxbzNvaSs2MnhYU0pUakJjNENTbG9TVkNnOWgvRm1SUFZ1Y1ZQ?=
 =?utf-8?B?UTlSWU9LSTdubmNwZnI3TmlsV0NEUVRwdGFtZDJ6TGNnUEl1STVpQkpqR1A5?=
 =?utf-8?B?cndzUzltN2NXaFArVFNFbVJITzVVSkxMQk14allONFE4OVF3cnIxRTY0TWt3?=
 =?utf-8?B?VFpFTnZmb2VsdGFibDVFQnNlRElOQUJUaktKN3VuMlVPeUk5aEJ5TUgxWmZk?=
 =?utf-8?B?TGNVdTltbklKa3U2Z3lxQlNNdStCNEdoTThOcXU1ejE2aEIvakE5aWdBdWJi?=
 =?utf-8?B?T3JUTURFWkJPRHA5dlB3eDY1NzNnM3BiejhHVWVvQk5oL1Y1ZzA4WS9xM09m?=
 =?utf-8?B?RHdhRWg3b3o3WVRpT0IxaTR6ODd6M0JWZXhVL084RlJsbzdLbVRpNTl1UUg3?=
 =?utf-8?B?ZTVFVXFpRHN1dE4wemw0VTZhR3BtVklIS3lhcGlSQ0RhdHd6M2RkOWFRQkRZ?=
 =?utf-8?B?VE1TN3pJS3F4SlE4eEpmdHp6aGZPM29kRVVCN2pqN05kRnF0SFd2cjR0VGs4?=
 =?utf-8?B?dU56aTRhUVRsVzZWejJHUWpha0dnVzZOeHBJa1MxcStYWDdCOEFYVnFGWE1h?=
 =?utf-8?B?QWsyYm9Id1dGVkNWM2NQcGtPK0krKzlTaFpyU1Vrd2E0SC80aktKM1dQRFFU?=
 =?utf-8?B?bDE2cWVjWmVPS0w3dnlnUkZGa1I2L2xhaU5UODcyY200eHM3cmdrMFduT1ZE?=
 =?utf-8?B?akxmM3BkOC9FYWdjRkIxZUc2aEs5ZkpFbi9rb3FSZFBKRjJyeThNNnREV1lE?=
 =?utf-8?B?WG5rM1l2Y3E5a282MlExNmNTTGk0akhFNW1PVExwUW1xcmZlN0t4Y2F1dDlC?=
 =?utf-8?B?UVVDWGhVRFpqcGRaTzM4QmpkZjVEVWRGUUJMd0lYVDhYak9wbXJrckxtbTZP?=
 =?utf-8?B?WUJmaVRpNDN3azlxcklxYkxKY1pBMVpxMlBxeDlsNElsSlpaNjdRelBkcmRG?=
 =?utf-8?B?YUFyd1JaYnRLMjltTHR6amRySjlxam1TWkkrSFNKTm1sM0lscXI1VWFZZmYy?=
 =?utf-8?B?Q2l3cWt0SmNsN0tMVnp0clJoelUzaHE2bWhGS1c3V21wMEdoMHdPcEN3clY3?=
 =?utf-8?B?SXJGaU5lck4rTHUva2dROU5yV2hZY3IzV3VZUFVpdW8zTnpIb3RzTlFnSlA5?=
 =?utf-8?B?L3F2N0RRN0NHQzErYmVraWFwbDhULzNMQndSSUk3eGU1dGJXU0Nnako1cDc3?=
 =?utf-8?B?T0MrdWwyOWt1VnlpM3VBaVdKWm81U3FieGFLb2lxSmt6cy84TmFiZFZYeTR1?=
 =?utf-8?B?c24xc21Qbm00aTM0TWpKUVFkaWxoUWNlejlaamd2di9WbTlJajJjNlFqdmRi?=
 =?utf-8?B?ZGpXaUU1NnlOOTJIeDZCeHBZSUVjSzJScG9RamRkd1dkcEk3eXpRNWRWaDBp?=
 =?utf-8?B?dk5sWk16WnhyWDRWNlhWQm9udWdhVm8zMlIzVmdyNzNnK3FWc0Jsc3pKNm1X?=
 =?utf-8?B?amd4Ly9jUkwraU50aEt3ZUQ5bTJSY2orYnRHMC9lRUNENzZlS0N2a0JrdWli?=
 =?utf-8?B?eU9yT1ZISXhTMEpqU3BZZ2JNTHdDVndiTmFHYU9rdTh6R0d0aTlKa1FkZGhG?=
 =?utf-8?B?QXBGWHlETzFMRDJBT2tWUTRGTnRXQTB5R3BUQUZJYTUvYmNaNWZpNjlTbDJB?=
 =?utf-8?B?SHRRR1dyd1RCeUhvZnJnQnAzT2t6YnVDT1ZXL1BtbDIzWDd4T094dlk3c3lz?=
 =?utf-8?B?K1FYa1ZXTkNweXlqU3dIcnlYRmpEaWdKaDBDcERnVHhCdWdQK0RnTENXUEpE?=
 =?utf-8?B?WmI5QUI0eW1BUXVCL0pxOXQvcW1BU1RoUGtMdExrelJyMlVCL2xXRW5ZSWJU?=
 =?utf-8?Q?o9GvCibjnyrv9uCsg+3GYLsuZ?=
X-OriginatorOrg: vivo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a74e7e51-d6a9-4ed8-df9d-08db6d4609c7
X-MS-Exchange-CrossTenant-AuthSource: TY2PR06MB3342.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Jun 2023 02:12:58.4980 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 923e42dc-48d5-4cbe-b582-1a797a6412ed
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: oaQkNyKxXS74w+Zl/arhUNh78YMWKAilFa+TyQW84Qx+EX7CVMFx/P53qilPMVzox4e6SLiRgJZqq76xgY1NGw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYUPR06MB6176
X-Spam-Score: -0.3 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  Got it. Thanks. On 2023/6/15 0:15, Jaegeuk Kim wrote: > On
 06/14, Chunhai Guo wrote: >> Hi Jaegeuk, >> >> Could you please help to confirm
 if this patch has been merged? I cannot see >> the patch in the dev-test
 or d [...] 
 Content analysis details:   (-0.3 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
 no trust [40.107.215.95 listed in list.dnswl.org]
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [40.107.215.95 listed in wl.mailspike.net]
 -0.0 SPF_HELO_PASS          SPF: HELO matches SPF record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.0 T_SCC_BODY_TEXT_LINE   No description available.
 -0.1 NICE_REPLY_A           Looks like a legit reply (A)
X-Headers-End: 1q9cU1-003W1X-2r
Subject: Re: [f2fs-dev] [PATCH v8] fsck.f2fs: Detect and fix looped node
 chain efficiently
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
 <linux-f2fs-devel@lists.sourceforge.net>,
 =?UTF-8?B?5p2O5oms6Z+s?= <frank.li@vivo.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

R290IGl0LiBUaGFua3MuCgpPbiAyMDIzLzYvMTUgMDoxNSwgSmFlZ2V1ayBLaW0gd3JvdGU6Cj4g
T24gMDYvMTQsIENodW5oYWkgR3VvIHdyb3RlOgo+PiBIaSBKYWVnZXVrLAo+Pgo+PiBDb3VsZCB5
b3UgcGxlYXNlIGhlbHAgdG8gY29uZmlybSBpZiB0aGlzIHBhdGNoIGhhcyBiZWVuIG1lcmdlZD8g
SSBjYW5ub3Qgc2VlCj4+IHRoZSBwYXRjaCBpbiB0aGUgZGV2LXRlc3Qgb3IgZGV2IGJyYW5jaC4K
PiAKPiBUaGFua3MuIFNvbWVob3cgaXQgd2FzIGRyb3BwZWQuIEkgc3RhcnQgdG8gdGVzdCBhZ2Fp
bi4KPiAKPj4KPj4gVGhhbmtzLgo+Pgo+PiBPbiAyMDIzLzUvMjQgMTA6NDIsIOmDree6r+a1tyB3
cm90ZToKPj4+IGZpbmRfZnN5bmNfaW5vZGUoKSBkZXRlY3QgdGhlIGxvb3BlZCBub2RlIGNoYWlu
IGJ5IGNvbXBhcmluZyB0aGUgbG9vcAo+Pj4gY291bnRlciB3aXRoIGZyZWUgYmxvY2tzLiBXaGls
ZSBpdCBtYXkgdGFrZSB0ZW5zIG9mIHNlY29uZHMgdG8gcXVpdCB3aGVuCj4+PiB0aGUgZnJlZSBi
bG9ja3MgYXJlIGxhcmdlIGVub3VnaC4gV2UgY2FuIHVzZSBGbG95ZCdzIGN5Y2xlIGRldGVjdGlv
bgo+Pj4gYWxnb3JpdGhtIHRvIG1ha2UgdGhlIGRldGVjdGlvbiBtb3JlIGVmZmljaWVudCwgYW5k
IGZpeCB0aGUgaXNzdWUgYnkKPj4+IGZpbGxpbmcgYSBOVUxMIGFkZHJlc3MgaW4gdGhlIGxhc3Qg
bm9kZSBvZiB0aGUgY2hhaW4uCj4+Pgo+Pj4gQmVsb3cgaXMgdGhlIGxvZyB3ZSBlbmNvdW50ZXIg
b24gYSAyNTZHQiBVRlMgc3RvcmFnZSBhbmQgaXQgdGFrZXMgYWJvdXQKPj4+IDI1IHNlY29uZHMg
dG8gZGV0ZWN0IGxvb3BlZCBub2RlIGNoYWluLiBBZnRlciBjaGFuZ2luZyB0aGUgYWxnb3JpdGht
LCBpdAo+Pj4gdGFrZXMgYWJvdXQgMjBtcyB0byBmaW5pc2ggdGhlIHNhbWUgam9iLgo+Pj4KPj4+
ICAgICAgIFsgICAxMC44MjI5MDRdIGZzY2suZjJmczogSW5mbzogdmVyc2lvbiB0aW1lc3RhbXAg
Y3VyOiAxNywgcHJldjogNDMwCj4+PiAgICAgICBbICAgMTAuODIyOTQ5XSBmc2NrLmYyZnM6IFt1
cGRhdGVfc3VwZXJibG9jazogNzYyXSBJbmZvOiBEb25lIHRvCj4+PiB1cGRhdGUgc3VwZXJibG9j
awo+Pj4gICAgICAgWyAgIDEwLjgyMjk1M10gZnNjay5mMmZzOiBJbmZvOiBzdXBlcmJsb2NrIGZl
YXR1cmVzID0gMTQ5OSA6Cj4+PiBlbmNyeXB0IHZlcml0eSBleHRyYV9hdHRyIHByb2plY3RfcXVv
dGEgcXVvdGFfaW5vIGNhc2Vmb2xkCj4+PiAgICAgICBbICAgMTAuODIyOTU2XSBmc2NrLmYyZnM6
IEluZm86IHN1cGVyYmxvY2sgZW5jcnlwdCBsZXZlbCA9IDAsIHNhbHQgPQo+Pj4gMDAwMDAwMDAw
MDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAKPj4+ICAgICAgIFsgICAxMC44MjI5NjBdIGZzY2suZjJm
czogSW5mbzogdG90YWwgRlMgc2VjdG9ycyA9IDU5MjQ5ODExICgyMzE0NDQKPj4+IE1CKQo+Pj4g
ICAgICAgWyAgIDM1Ljg1MjgyN10gZnNjay5mMmZzOglkZXRlY3QgbG9vcGVkIG5vZGUgY2hhaW4s
Cj4+PiBibGthZGRyOjExMTQ4MDIsIG5leHQ6MTExNDgwMwo+Pj4gICAgICAgWyAgIDM1Ljg1Mjg0
Ml0gZnNjay5mMmZzOiBbZjJmc19kb19tb3VudDozODQ2XSByZWNvcmRfZnN5bmNfZGF0YQo+Pj4g
ZmFpbGVkCj4+PiAgICAgICBbICAgMzUuODU2MTA2XSBmc2NrLmYyZnM6IGZzY2suZjJmcyB0ZXJt
aW5hdGVkIGJ5IGV4aXQoMjU1KQo+Pj4KPj4+IFNpZ25lZC1vZmYtYnk6IENodW5oYWkgR3VvIDxn
dW9jaHVuaGFpQHZpdm8uY29tPgo+Pj4gLS0tCj4+PiB2NyAtPiB2OCA6IFJlZm9ybWF0IHRoZSBj
b2RlIHRvIHJlZHVjZSBpbmRlbnRpb24uCj4+PiB2NiAtPiB2NyA6IENvcnJlY3QgbG9naWMgZXJy
b3IgdG8gaGFuZGxlIGlzX2RldGVjdGluZyByZXR1cm4gYnkKPj4+IAlmaW5kX25vZGVfYmxrX2Zh
c3QoKS4KPj4+IHY1IC0+IHY2IDogU2ltcGxpZnkgdGhlIGNvZGUgYnkgcmVtb3ZpbmcgdW5uZWNl
c3NhcnkgcmV0cnkgbG9naWMuCj4+PiB2NCAtPiB2NSA6IFVzZSBJU19JTk9ERSgpIHRvIG1ha2Ug
dGhlIGNvZGUgbW9yZSBjbGVhci4KPj4+IHYzIC0+IHY0IDogU2V0IGMuYnVnX29uIHdpdGggQVNT
RVJUX01TRygpIHdoZW4gaXNzdWUgaXMgZGV0ZWN0ZWQgYW5kIGZpeAo+Pj4gCWl0IG9ubHkgaWYg
Yy5maXhfb24gaXMgMS4KPj4+IHYyIC0+IHYzIDogV3JpdGUgaW5vZGUgd2l0aCB3cml0ZV9pbm9k
ZSgpIHRvIGF2b2lkIGNoa3N1bSBiZWluZyBicm9rZW4uCj4+PiB2MSAtPiB2MiA6IEZpeCBsb29w
ZWQgbm9kZSBjaGFpbiBkaXJlY3RseSBhZnRlciBpdCBpcyBkZXRlY3RlZC4KPj4+IC0tLQo+Pj4g
ICAgZnNjay9tb3VudC5jIHwgMTI3ICsrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysr
KysrKysrKysrKy0tLS0tLQo+Pj4gICAgMSBmaWxlIGNoYW5nZWQsIDExMiBpbnNlcnRpb25zKCsp
LCAxNSBkZWxldGlvbnMoLSkKPj4+Cj4+PiBkaWZmIC0tZ2l0IGEvZnNjay9tb3VudC5jIGIvZnNj
ay9tb3VudC5jCj4+PiBpbmRleCA0Yzc0ODg4NDBjN2MuLjlkNmEyMjJhMDU1YyAxMDA2NDQKPj4+
IC0tLSBhL2ZzY2svbW91bnQuYwo+Pj4gKysrIGIvZnNjay9tb3VudC5jCj4+PiBAQCAtMzUxOCwy
MiArMzUxOCw5MCBAQCBzdGF0aWMgdm9pZCBkZXN0cm95X2ZzeW5jX2Rub2RlcyhzdHJ1Y3QgbGlz
dF9oZWFkICpoZWFkKQo+Pj4gICAgCQlkZWxfZnN5bmNfaW5vZGUoZW50cnkpOwo+Pj4gICAgfQo+
Pj4gK3N0YXRpYyBpbnQgZmluZF9ub2RlX2Jsa19mYXN0KHN0cnVjdCBmMmZzX3NiX2luZm8gKnNi
aSwgYmxvY2tfdCAqYmxrYWRkcl9mYXN0LAo+Pj4gKwkJc3RydWN0IGYyZnNfbm9kZSAqbm9kZV9i
bGtfZmFzdCwgYm9vbCAqaXNfZGV0ZWN0aW5nKQo+Pj4gK3sKPj4+ICsJaW50IGksIGVycjsKPj4+
ICsKPj4+ICsJZm9yIChpID0gMDsgaSA8IDI7IGkrKykgewo+Pj4gKwkJaWYgKCFmMmZzX2lzX3Zh
bGlkX2Jsa2FkZHIoc2JpLCAqYmxrYWRkcl9mYXN0LCBNRVRBX1BPUikpIHsKPj4+ICsJCQkqaXNf
ZGV0ZWN0aW5nID0gZmFsc2U7Cj4+PiArCQkJcmV0dXJuIDA7Cj4+PiArCQl9Cj4+PiArCj4+PiAr
CQllcnIgPSBkZXZfcmVhZF9ibG9jayhub2RlX2Jsa19mYXN0LCAqYmxrYWRkcl9mYXN0KTsKPj4+
ICsJCWlmIChlcnIpCj4+PiArCQkJcmV0dXJuIGVycjsKPj4+ICsKPj4+ICsJCWlmICghaXNfcmVj
b3ZlcmFibGVfZG5vZGUoc2JpLCBub2RlX2Jsa19mYXN0KSkgewo+Pj4gKwkJCSppc19kZXRlY3Rp
bmcgPSBmYWxzZTsKPj4+ICsJCQlyZXR1cm4gMDsKPj4+ICsJCX0KPj4+ICsKPj4+ICsJCSpibGth
ZGRyX2Zhc3QgPSBuZXh0X2Jsa2FkZHJfb2Zfbm9kZShub2RlX2Jsa19mYXN0KTsKPj4+ICsJfQo+
Pj4gKwo+Pj4gKwlyZXR1cm4gMDsKPj4+ICt9Cj4+PiArCj4+PiArc3RhdGljIGludCBsb29wX25v
ZGVfY2hhaW5fZml4KHN0cnVjdCBmMmZzX3NiX2luZm8gKnNiaSwKPj4+ICsJCWJsb2NrX3QgYmxr
YWRkcl9mYXN0LCBzdHJ1Y3QgZjJmc19ub2RlICpub2RlX2Jsa19mYXN0LAo+Pj4gKwkJYmxvY2tf
dCBibGthZGRyLCBzdHJ1Y3QgZjJmc19ub2RlICpub2RlX2JsaykKPj4+ICt7Cj4+PiArCWJsb2Nr
X3QgYmxrYWRkcl9lbnRyeSwgYmxrYWRkcl90bXA7Cj4+PiArCWludCBlcnI7Cj4+PiArCj4+PiAr
CS8qIGZpbmQgdGhlIGVudHJ5IHBvaW50IG9mIHRoZSBsb29wZWQgbm9kZSBjaGFpbiAqLwo+Pj4g
Kwl3aGlsZSAoYmxrYWRkcl9mYXN0ICE9IGJsa2FkZHIpIHsKPj4+ICsJCWVyciA9IGRldl9yZWFk
X2Jsb2NrKG5vZGVfYmxrX2Zhc3QsIGJsa2FkZHJfZmFzdCk7Cj4+PiArCQlpZiAoZXJyKQo+Pj4g
KwkJCXJldHVybiBlcnI7Cj4+PiArCQlibGthZGRyX2Zhc3QgPSBuZXh0X2Jsa2FkZHJfb2Zfbm9k
ZShub2RlX2Jsa19mYXN0KTsKPj4+ICsKPj4+ICsJCWVyciA9IGRldl9yZWFkX2Jsb2NrKG5vZGVf
YmxrLCBibGthZGRyKTsKPj4+ICsJCWlmIChlcnIpCj4+PiArCQkJcmV0dXJuIGVycjsKPj4+ICsJ
CWJsa2FkZHIgPSBuZXh0X2Jsa2FkZHJfb2Zfbm9kZShub2RlX2Jsayk7Cj4+PiArCX0KPj4+ICsJ
YmxrYWRkcl9lbnRyeSA9IGJsa2FkZHI7Cj4+PiArCj4+PiArCS8qIGZpbmQgdGhlIGxhc3Qgbm9k
ZSBvZiB0aGUgY2hhaW4gKi8KPj4+ICsJZG8gewo+Pj4gKwkJYmxrYWRkcl90bXAgPSBibGthZGRy
Owo+Pj4gKwkJZXJyID0gZGV2X3JlYWRfYmxvY2sobm9kZV9ibGssIGJsa2FkZHIpOwo+Pj4gKwkJ
aWYgKGVycikKPj4+ICsJCQlyZXR1cm4gZXJyOwo+Pj4gKwkJYmxrYWRkciA9IG5leHRfYmxrYWRk
cl9vZl9ub2RlKG5vZGVfYmxrKTsKPj4+ICsJfSB3aGlsZSAoYmxrYWRkciAhPSBibGthZGRyX2Vu
dHJ5KTsKPj4+ICsKPj4+ICsJLyogZml4IHRoZSBibGthZGRyIG9mIGxhc3Qgbm9kZSB3aXRoIE5V
TExfQUREUi4gKi8KPj4+ICsJbm9kZV9ibGstPmZvb3Rlci5uZXh0X2Jsa2FkZHIgPSBOVUxMX0FE
RFI7Cj4+PiArCWlmIChJU19JTk9ERShub2RlX2JsaykpCj4+PiArCQllcnIgPSB3cml0ZV9pbm9k
ZShub2RlX2JsaywgYmxrYWRkcl90bXApOwo+Pj4gKwllbHNlCj4+PiArCQllcnIgPSBkZXZfd3Jp
dGVfYmxvY2sobm9kZV9ibGssIGJsa2FkZHJfdG1wKTsKPj4+ICsJaWYgKCFlcnIpCj4+PiArCQlG
SVhfTVNHKCJGaXggbG9vcGVkIG5vZGUgY2hhaW4gb24gYmxrYWRkciAldVxuIiwKPj4+ICsJCQkJ
YmxrYWRkcl90bXApOwo+Pj4gKwlyZXR1cm4gZXJyOwo+Pj4gK30KPj4+ICsKPj4+ICAgIHN0YXRp
YyBpbnQgZmluZF9mc3luY19pbm9kZShzdHJ1Y3QgZjJmc19zYl9pbmZvICpzYmksIHN0cnVjdCBs
aXN0X2hlYWQgKmhlYWQpCj4+PiAgICB7Cj4+PiAgICAJc3RydWN0IGN1cnNlZ19pbmZvICpjdXJz
ZWc7Cj4+PiAtCXN0cnVjdCBmMmZzX25vZGUgKm5vZGVfYmxrOwo+Pj4gLQlibG9ja190IGJsa2Fk
ZHI7Cj4+PiAtCXVuc2lnbmVkIGludCBsb29wX2NudCA9IDA7Cj4+PiAtCXVuc2lnbmVkIGludCBm
cmVlX2Jsb2NrcyA9IE1BSU5fU0VHUyhzYmkpICogc2JpLT5ibG9ja3NfcGVyX3NlZyAtCj4+PiAt
CQkJCQkJc2JpLT50b3RhbF92YWxpZF9ibG9ja19jb3VudDsKPj4+ICsJc3RydWN0IGYyZnNfbm9k
ZSAqbm9kZV9ibGssICpub2RlX2Jsa19mYXN0Owo+Pj4gKwlibG9ja190IGJsa2FkZHIsIGJsa2Fk
ZHJfZmFzdDsKPj4+ICsJYm9vbCBpc19kZXRlY3RpbmcgPSB0cnVlOwo+Pj4gICAgCWludCBlcnIg
PSAwOwo+Pj4gKwlub2RlX2JsayA9IGNhbGxvYyhGMkZTX0JMS1NJWkUsIDEpOwo+Pj4gKwlub2Rl
X2Jsa19mYXN0ID0gY2FsbG9jKEYyRlNfQkxLU0laRSwgMSk7Cj4+PiArCUFTU0VSVChub2RlX2Js
ayAmJiBub2RlX2Jsa19mYXN0KTsKPj4+ICsKPj4+ICAgIAkvKiBnZXQgbm9kZSBwYWdlcyBpbiB0
aGUgY3VycmVudCBzZWdtZW50ICovCj4+PiAgICAJY3Vyc2VnID0gQ1VSU0VHX0koc2JpLCBDVVJT
RUdfV0FSTV9OT0RFKTsKPj4+ICAgIAlibGthZGRyID0gTkVYVF9GUkVFX0JMS0FERFIoc2JpLCBj
dXJzZWcpOwo+Pj4gLQo+Pj4gLQlub2RlX2JsayA9IGNhbGxvYyhGMkZTX0JMS1NJWkUsIDEpOwo+
Pj4gLQlBU1NFUlQobm9kZV9ibGspOwo+Pj4gKwlibGthZGRyX2Zhc3QgPSBibGthZGRyOwo+Pj4g
ICAgCXdoaWxlICgxKSB7Cj4+PiAgICAJCXN0cnVjdCBmc3luY19pbm9kZV9lbnRyeSAqZW50cnk7
Cj4+PiBAQCAtMzU2NCwxOSArMzYzMiw0OCBAQCBzdGF0aWMgaW50IGZpbmRfZnN5bmNfaW5vZGUo
c3RydWN0IGYyZnNfc2JfaW5mbyAqc2JpLCBzdHJ1Y3QgbGlzdF9oZWFkICpoZWFkKQo+Pj4gICAg
CQlpZiAoSVNfSU5PREUobm9kZV9ibGspICYmIGlzX2RlbnRfZG5vZGUobm9kZV9ibGspKQo+Pj4g
ICAgCQkJZW50cnktPmxhc3RfZGVudHJ5ID0gYmxrYWRkcjsKPj4+ICAgIG5leHQ6Cj4+PiAtCQkv
KiBzYW5pdHkgY2hlY2sgaW4gb3JkZXIgdG8gZGV0ZWN0IGxvb3BlZCBub2RlIGNoYWluICovCj4+
PiAtCQlpZiAoKytsb29wX2NudCA+PSBmcmVlX2Jsb2NrcyB8fAo+Pj4gLQkJCWJsa2FkZHIgPT0g
bmV4dF9ibGthZGRyX29mX25vZGUobm9kZV9ibGspKSB7Cj4+PiAtCQkJTVNHKDAsICJcdGRldGVj
dCBsb29wZWQgbm9kZSBjaGFpbiwgYmxrYWRkcjoldSwgbmV4dDoldVxuIiwKPj4+IC0JCQkJICAg
IGJsa2FkZHIsCj4+PiAtCQkJCSAgICBuZXh0X2Jsa2FkZHJfb2Zfbm9kZShub2RlX2JsaykpOwo+
Pj4gKwkJYmxrYWRkciA9IG5leHRfYmxrYWRkcl9vZl9ub2RlKG5vZGVfYmxrKTsKPj4+ICsKPj4+
ICsJCS8qIEJlbG93IHdlIHdpbGwgZGV0ZWN0IGxvb3BlZCBub2RlIGNoYWluIHdpdGggRmxveWQn
cyBjeWNsZQo+Pj4gKwkJICogZGV0ZWN0aW9uIGFsZ29yaXRobS4KPj4+ICsJCSAqLwo+Pj4gKwkJ
aWYgKCFpc19kZXRlY3RpbmcpCj4+PiArCQkJY29udGludWU7Cj4+PiArCj4+PiArCQllcnIgPSBm
aW5kX25vZGVfYmxrX2Zhc3Qoc2JpLCAmYmxrYWRkcl9mYXN0LAo+Pj4gKwkJCQlub2RlX2Jsa19m
YXN0LCAmaXNfZGV0ZWN0aW5nKTsKPj4+ICsJCWlmIChlcnIpCj4+PiArCQkJYnJlYWs7Cj4+PiAr
Cj4+PiArCQlpZiAoIWlzX2RldGVjdGluZykKPj4+ICsJCQljb250aW51ZTsKPj4+ICsKPj4+ICsJ
CWlmIChibGthZGRyX2Zhc3QgIT0gYmxrYWRkcikKPj4+ICsJCQljb250aW51ZTsKPj4+ICsKPj4+
ICsJCUFTU0VSVF9NU0coIlx0ZGV0ZWN0IGxvb3BlZCBub2RlIGNoYWluLCBibGthZGRyOiV1XG4i
LAo+Pj4gKwkJCQlibGthZGRyKTsKPj4+ICsKPj4+ICsJCWlmICghYy5maXhfb24pIHsKPj4+ICAg
IAkJCWVyciA9IC0xOwo+Pj4gICAgCQkJYnJlYWs7Cj4+PiAgICAJCX0KPj4+IC0JCWJsa2FkZHIg
PSBuZXh0X2Jsa2FkZHJfb2Zfbm9kZShub2RlX2Jsayk7Cj4+PiArCQllcnIgPSBsb29wX25vZGVf
Y2hhaW5fZml4KHNiaSwKPj4+ICsJCQkJTkVYVF9GUkVFX0JMS0FERFIoc2JpLCBjdXJzZWcpLAo+
Pj4gKwkJCQlub2RlX2Jsa19mYXN0LCBibGthZGRyLCBub2RlX2Jsayk7Cj4+PiArCQlpZiAoZXJy
KQo+Pj4gKwkJCWJyZWFrOwo+Pj4gKwo+Pj4gKwkJLyogU2luY2Ugd2UgY2FsbCBnZXRfZnN5bmNf
aW5vZGUoKSB0byBlbnN1cmUgdGhlcmUgYXJlIG5vCj4+PiArCQkgKiBkdXBsaWNhdGUgaW5vZGVz
IGluIHRoZSBpbm9kZV9saXN0IGV2ZW4gaWYgdGhlcmUgYXJlCj4+PiArCQkgKiBkdXBsaWNhdGUg
YmxrYWRkciwgd2UgY2FuIGNvbnRpbnVlIHJ1bm5pbmcgYWZ0ZXIgZml4aW5nIHRoZQo+Pj4gKwkJ
ICogbG9vcGVkIG5vZGUgY2hhaW4uCj4+PiArCQkgKi8KPj4+ICsJCWlzX2RldGVjdGluZyA9IGZh
bHNlOwo+Pj4gICAgCX0KPj4+ICsJZnJlZShub2RlX2Jsa19mYXN0KTsKPj4+ICAgIAlmcmVlKG5v
ZGVfYmxrKTsKPj4+ICAgIAlyZXR1cm4gZXJyOwo+Pj4gICAgfQoKCl9fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4LWYyZnMtZGV2ZWwgbWFpbGluZyBs
aXN0CkxpbnV4LWYyZnMtZGV2ZWxAbGlzdHMuc291cmNlZm9yZ2UubmV0Cmh0dHBzOi8vbGlzdHMu
c291cmNlZm9yZ2UubmV0L2xpc3RzL2xpc3RpbmZvL2xpbnV4LWYyZnMtZGV2ZWwK
