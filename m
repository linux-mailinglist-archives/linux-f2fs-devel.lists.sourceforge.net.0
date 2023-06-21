Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F721737ED6
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 21 Jun 2023 11:22:45 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1qBu2x-0005MX-UU;
	Wed, 21 Jun 2023 09:22:39 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <guochunhai@vivo.com>) id 1qBu2w-0005MQ-Q4
 for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 21 Jun 2023 09:22:38 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=MIME-Version:Content-Transfer-Encoding:Content-Type
 :In-Reply-To:From:References:Cc:To:Subject:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=cZY/d2B53044iaxUZWpzbSYhcH9coVogdd5+OC7lzVg=; b=PH/TrxtO/TNjd3h+R8pFprg7t0
 swOMOdjXF//rEggoDzvzHZTJwZVjzN24BVGEnkyM7J6pYMiR5O/sBYn4zo3Ik8Z+Alxc3jrWwhC6Z
 9nyk/WMXsu2c1ZG24Xas0s5eQB4w6CNs3dMouOB5OeP/Nvs+LAhF5h/JvcH/qwJZC5M0=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=MIME-Version:Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
 References:Cc:To:Subject:Date:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=cZY/d2B53044iaxUZWpzbSYhcH9coVogdd5+OC7lzVg=; b=DiWlGfSyjLkB5GRBfRhPsJtRIJ
 OIM3/NMaU8jBPnpuSufGkDfSA/bk9aj5icfs5PYvMxjT1AxmFvuYKZ8GY/sCZx8C4FsJJkNP2A9z+
 UwWtNp+6jU1RooRZrU+ogOjKDa7ATIh/xI41WJupuVG95WEqC43LO6lieKrPlWfCl3Ww=;
Received: from mail-sgaapc01on2097.outbound.protection.outlook.com
 ([40.107.215.97] helo=APC01-SG2-obe.outbound.protection.outlook.com)
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1qBu2t-00AVy6-4E for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 21 Jun 2023 09:22:38 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=PjCERYLKs8JJo+wkGy9k7YXEIZL3yy1E1nUs4mGPVHlD8mFGORjurK3WwhSEQtEJLjqrl8rnox0bUVM1j3kZ4nWXqCcmw/uGq4geS8PB2Xu36jALi+oG/x/JAvTBWFxwteOGq2PjcZCLgU/D7BAwTh2ZzFvvSsuA9UNpNuT83/n3VspTRwx3/MCHp9EGdW7k3vwZhu6Tudxw352M+IjzyuwvGDpmCx32pCUJ6oFnUsknTbw6Tf/GtW1LVotChT7Pgjw4LXLvGkcMmnqZE2bWPbEHj17ysrNKAMN3DtmorFuHENUXHG3smn4OJhwQlKe5PLHBUTWdbZxBMY+HvwL+Bw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=cZY/d2B53044iaxUZWpzbSYhcH9coVogdd5+OC7lzVg=;
 b=ItRHyUyb34TsULmzGZDLFlBR+eOoCoGn30kFlWmdJFv5ykqM/kbSYAQIh6mYST7prwG25D45vaG9Lf4+ENdllz7Yj98PqwzQ1UR1MU7XQdJSSd1QGRA0+mqljEN268Jp/H/lW6EcVa1rmmx7hRCsFR9mt2hzr/FgzxzxnkjXOo2IZiSETmYap+VDE9pUyh0eiULZDNR4DJhfs0v8B911sKXOwK1QnIBVsFfX9tlC7MhEuxQtLnjrXTNDLvtxXkzIODgzpUFQB7fg/QIFK16jdwpzPb3xSJ9fdXqOI5k0gL19tpPTXwLv4E0s1cDd9HhJ1CXjLx+M1A9lJQuvY+uOcw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vivo.com; dmarc=pass action=none header.from=vivo.com;
 dkim=pass header.d=vivo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vivo.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cZY/d2B53044iaxUZWpzbSYhcH9coVogdd5+OC7lzVg=;
 b=VwXtXB/R7ZxyJiugFmO3yW92/z52kdd801JA6yLnELuC5qb4gWjjqc7tNF/SSkx5Q0OrKbtPBNVsQYVAEKS8+/Xgsatwn212ZdQxYAZ48FFfJrY4bUUIOIn4jWBAnI7eLAFrNXEu0xr/nGNQbJazSEicyPhvTLE2nz9QMsOKMT7AlBB3uaS3i6M+4jNc4mqUuF2K6usxA0928eFKhKrvnbmNBfJ1HDmICGX+azpE2CUixhb6e5qOCfyn4oNldxP++s6k612508sewjx2vKvat/dHh3gBQEwGHtkqS8iNw08DoSXFZsaXUM/EJ5f9Oou2hItipspaadBiCq7iBftSAg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=vivo.com;
Received: from TY2PR06MB3342.apcprd06.prod.outlook.com (2603:1096:404:fb::23)
 by TYZPR06MB6788.apcprd06.prod.outlook.com (2603:1096:400:44f::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6500.36; Wed, 21 Jun
 2023 09:22:27 +0000
Received: from TY2PR06MB3342.apcprd06.prod.outlook.com
 ([fe80::e008:38cc:5ce6:769a]) by TY2PR06MB3342.apcprd06.prod.outlook.com
 ([fe80::e008:38cc:5ce6:769a%3]) with mapi id 15.20.6500.036; Wed, 21 Jun 2023
 09:22:26 +0000
Message-ID: <efb30864-37cc-25d0-c641-4dfb79157f0c@vivo.com>
Date: Wed, 21 Jun 2023 17:18:08 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.1
To: Chao Yu <chao@kernel.org>, "jaegeuk@kernel.org" <jaegeuk@kernel.org>
References: <20230524024204.13694-1-guochunhai@vivo.com>
 <12df63c7-71b3-3223-b9fa-0dff6c1d6d14@vivo.com>
 <3ba141d6-f011-7c4f-accd-8d60aed7a683@kernel.org>
In-Reply-To: <3ba141d6-f011-7c4f-accd-8d60aed7a683@kernel.org>
X-ClientProxiedBy: SI2P153CA0013.APCP153.PROD.OUTLOOK.COM
 (2603:1096:4:140::12) To TY2PR06MB3342.apcprd06.prod.outlook.com
 (2603:1096:404:fb::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TY2PR06MB3342:EE_|TYZPR06MB6788:EE_
X-MS-Office365-Filtering-Correlation-Id: 99ec8365-9199-43c0-0221-08db7239072f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: yJ22bDrXQWrDZIUwbPRP/+oSXwQ/gEfrvPPl+q03Bbd/zdwwXyK3znfgx1zvuo+td/M1v7ZlAeG2jpa0DWBxiug9pIKLNcMJw9VKSPZlk0sFD4vbOCkCcleNDi06NqtyO5O17DIlxgf9R04yrknR4Jg/CMSj20JoTdjIyj+6ExdyI1OwTEXotDqi8leZntv/JlWAYOYuqZEDp8MXZcWCfZ/ttEIajkNQhnEQIRwUSNfI0iwqDC3fSeSqq31gpZBcNdxphasAiReKC8/oUY8QeNM22/jT4gLojVnVz1tjd4UGIqb9nlz3M4vTdP/rNj9c++S0LTZ24YDYvkbqrJlS8SaCXM7kVA322hcxcHaoI26ilCrDNpqRkLlX7lCBEeJ8gZXcIbwt1+1kd9qPQkVOAOJp2PN7Q6PNgVp6rXh7r3xBGDehgD+YzMNQkWIA9hZeJwaXpeLv1qoHeuEFGtodBgbu17BtsJNAxTdVKeXUpfCjVzQGVfpwkoEv+RVxjLOHD3lwe72AExTPfP8VqldaX1+2zPF3Q6dd766fyFZoI2SWCCK9vGVrNhE3yZTcJGopWgSVVXJasmXO5HrvNEPtAqx1lNQhtNH3w+pQGF3F9+A42d7Snr4ug5aznkcX0ocwfcpqjtEXmfBtLbuvKSoLjw==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:TY2PR06MB3342.apcprd06.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(4636009)(39850400004)(396003)(346002)(366004)(376002)(136003)(451199021)(478600001)(2906002)(66946007)(66556008)(66476007)(54906003)(110136005)(31686004)(41300700001)(4326008)(316002)(5660300002)(53546011)(6486002)(6666004)(8676002)(8936002)(6512007)(26005)(186003)(6506007)(2616005)(83380400001)(38100700002)(31696002)(36756003)(86362001)(45980500001)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?em4xTDlqNmlhTWsxVG53TUJUdGlnSWxhVzlsY0drbTBxWHVvdHN6aUZMd2xi?=
 =?utf-8?B?blVMUG0rTW5HWU53bEFqMTZ3Q0lrWEZReW5nZWVuQmRFRUt6OWJYZTIzdmZh?=
 =?utf-8?B?Mm5yMWUwTVo3ekM2d083ODNXcmorT1RQdFNLdmxLS2Vuak9rbnNSRHUxbVhn?=
 =?utf-8?B?SCt0cllhOTdEL2JmaVlHRHMzOFU0M2hwdCtJMU9VZ1U3aExsVkVpUmR3NC8v?=
 =?utf-8?B?TW03NWlpUHkweVFnaER2WXVyMmo2SDF2eVZiV0VaNXgwYUM4NnZqemxQSHZ5?=
 =?utf-8?B?K1FHY3g3WG1QVEFFakIzRllpbzRRREtHRElVYURTMnRLOEJ0bVp5QjZPdnJx?=
 =?utf-8?B?S05RSnBGVEJ6Z040Y2lrRHY4NTlqMS9wSjlDUGJzei9TZFNtSEN3N0pucVUv?=
 =?utf-8?B?MGtqUmFqU1Qwcm5TbnJLSVJvZ2NyNEE3OW9hSlU5M25yMmRNNUtQVWJlRUFI?=
 =?utf-8?B?bFZmYTRTa1JsMHpCL2UrV28ydzJKdjY1VzVMeVZPRlo1UVYyUHZBZThjdjNV?=
 =?utf-8?B?VkFwbmF0bkYzUTRVV0xUdGN2UTdhdnEyeG1ncU9MSjZxVXArblN2Q05Ldlo1?=
 =?utf-8?B?cGd2M0FqZEhvZm5CM0x6M0xQSC9tM2VmWWR3czdWT1p2eFYyaE9jeVQzelNS?=
 =?utf-8?B?VnBQNnZWUDJFdG16Z2tIcWxQVDRTcDQ1MlVya3l1eG5vWHJiTmRmbXlBS0w3?=
 =?utf-8?B?OU5DSTF0dVFIWWNqTS9XelVjMWJGTTVsWldvSWErVXBWRkFndllFNHpZMUJr?=
 =?utf-8?B?OVUxY3MwU0c0cTU3OEdCeDVpcEw1VzFPSzRNQTN4SG5HajFkTGtmRVE0SFI4?=
 =?utf-8?B?ZlZLRTdhb29LYzBkZDZHVklvNkFZQ0ZkdkNwRlZzcUI0Y3AxOVdIeEQrc09E?=
 =?utf-8?B?MzhDaTV4MEJPQnlvYWpVUUxwZ3p3Szl3V1BMczVGbjU2QVc0bDlucnJWZUR4?=
 =?utf-8?B?NGZybHhGOThxLzc0eU9zcmpubVFQMEQ4STBjYSt1dVJFTlRBUUszTmRka3ZC?=
 =?utf-8?B?dlZhR2MrTXh3Y1d0Ly9jS29ZT3UvaWRxSXpkbm1RYVU0SkhtZHRZZEhvckdX?=
 =?utf-8?B?b2JkTUdTWkc1ZlhhZVZXU0pNQnV1Tmo4dmE4NWVBbWRLMzM0QllrbVo1S3ho?=
 =?utf-8?B?Nkh3dHl1eG5lQWU4eThVUUFxZ1g2ZFRqWFZwRmJWQWRHVzBWclpodTU1WmJ2?=
 =?utf-8?B?MVF0Vmo3b3AwS1BuSWpQeFZUZUxabGRZUW9XT0hXNGUwbWpWcWVVQWk0N1dS?=
 =?utf-8?B?Q3ZkS1BjTjE0SzByWHhuT1M3R1FiRTR0TEphVGE1T1MrT3I3TDVjMlI2U1JO?=
 =?utf-8?B?c3diZkhWakR5RnNQTU9KYUlsY1hrTnVxUTkreElQRnV4KzlKY2h3azArOXVU?=
 =?utf-8?B?aVNtbW5iamNIRVNDRkgwUVZYN1FBdzYzT2NZR2piRE82eXVGcXNmZzdIMFpX?=
 =?utf-8?B?VHE1SlFRbFBoQkdyMWcrUTJYbENzc3d1NmRaQkNhRTZOTVZja3lPelVrazk0?=
 =?utf-8?B?bEVrdkhlbGp5QkRKUUVrNWJWVU0wam0wUTNwQkZVa095dlMrZWpaT2lPMGE1?=
 =?utf-8?B?NlpKZjZUS2czcW5PMGxldE1Na0g2bnBHTDhIb3BlbVM0WUR2NmJmTEpzU2F0?=
 =?utf-8?B?YkdmQVdRd3Z1VXJxNUx4RENaeG14bVpvSEtsRFJVci9sS3BkUFErTmxmRVlP?=
 =?utf-8?B?a1VZb3lFUWNpT0tTcGxsdXA1ZW01ZURvWkhyR3ZJdy8rQUpBeS84YXhTUHRa?=
 =?utf-8?B?dC9JNFJlV0R6TGRoNUdnK1hNR25La3hQZldDTyt0M3RMbG5ndlpCNjJoYy8w?=
 =?utf-8?B?c3NYM0hNT1JTYW9xaHVHdFpPMWV1WkhQckdUaHFYbi9wTUVKQ0djSmUrZUNE?=
 =?utf-8?B?QmN6NnBJTjd6Q0ZzZXJGd0Y5UVVJMG5qUUZqL2pZZzA4V0MrRjY1bWNFcjNv?=
 =?utf-8?B?Ym5zaEFTQmIwS2UwUnlwd0hqUlJJTGYycDBSNHd6ZjVFU1pIa1FZNi9DeXpt?=
 =?utf-8?B?VDRZdzNYdUVTaVQrTE0yN2Ztem9HV013eGRUTFlyb2tyclpFcGl5U2ZqalJF?=
 =?utf-8?B?bEZ2OE5aR3ZPTFVQKzZqS2dPU2JlRnNNUXBYUGFNdy9xcWx0aGhZMEdsMm5J?=
 =?utf-8?Q?VSNBECQqMyb4bXuJRgFDtRsxX?=
X-OriginatorOrg: vivo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 99ec8365-9199-43c0-0221-08db7239072f
X-MS-Exchange-CrossTenant-AuthSource: TY2PR06MB3342.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Jun 2023 09:22:26.6011 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 923e42dc-48d5-4cbe-b582-1a797a6412ed
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: qVzEG0H1EEVqIVLxpnnIYLavzVCoDL59EZMrduk7SvzMOXXlM6dbhjh3ZhqFEPZI1ZTXQ8r92bTmnzpRHUQl6g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYZPR06MB6788
X-Spam-Score: -0.3 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  Hi Chao, Sorry for replying late,
 I have send patch "fsck.f2fs:
 refactor looped node chain detetected logic for cleanup" as you suggested.
 Thanks. Content analysis details:   (-0.3 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
 no trust [40.107.215.97 listed in list.dnswl.org]
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [40.107.215.97 listed in wl.mailspike.net]
 -0.0 SPF_HELO_PASS          SPF: HELO matches SPF record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.0 T_SCC_BODY_TEXT_LINE   No description available.
 -0.1 NICE_REPLY_A           Looks like a legit reply (A)
X-Headers-End: 1qBu2t-00AVy6-4E
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

SGkgQ2hhbywKClNvcnJ5IGZvciByZXBseWluZyBsYXRlLCBJIGhhdmUgc2VuZCBwYXRjaCAiZnNj
ay5mMmZzOiByZWZhY3RvciBsb29wZWQgCm5vZGUgY2hhaW4gZGV0ZXRlY3RlZCBsb2dpYyBmb3Ig
Y2xlYW51cCIgYXMgeW91IHN1Z2dlc3RlZC4KClRoYW5rcy4KCk9uIDIwMjMvNi8xNyAxMDoyMCwg
Q2hhbyBZdSB3cm90ZToKPiBPbiAyMDIzLzYvMTQgMTc6MjcsIENodW5oYWkgR3VvIHdyb3RlOgo+
PiBIaSBKYWVnZXVrLAo+Pgo+PiBDb3VsZCB5b3UgcGxlYXNlIGhlbHAgdG8gY29uZmlybSBpZiB0
aGlzIHBhdGNoIGhhcyBiZWVuIG1lcmdlZD8gSSBjYW5ub3QKPj4gc2VlIHRoZSBwYXRjaCBpbiB0
aGUgZGV2LXRlc3Qgb3IgZGV2IGJyYW5jaC4KPj4KPj4gVGhhbmtzLgo+Pgo+PiBPbiAyMDIzLzUv
MjQgMTA6NDIsIOmDree6r+a1tyB3cm90ZToKPj4+IGZpbmRfZnN5bmNfaW5vZGUoKSBkZXRlY3Qg
dGhlIGxvb3BlZCBub2RlIGNoYWluIGJ5IGNvbXBhcmluZyB0aGUgbG9vcAo+Pj4gY291bnRlciB3
aXRoIGZyZWUgYmxvY2tzLiBXaGlsZSBpdCBtYXkgdGFrZSB0ZW5zIG9mIHNlY29uZHMgdG8gcXVp
dCB3aGVuCj4+PiB0aGUgZnJlZSBibG9ja3MgYXJlIGxhcmdlIGVub3VnaC4gV2UgY2FuIHVzZSBG
bG95ZCdzIGN5Y2xlIGRldGVjdGlvbgo+Pj4gYWxnb3JpdGhtIHRvIG1ha2UgdGhlIGRldGVjdGlv
biBtb3JlIGVmZmljaWVudCwgYW5kIGZpeCB0aGUgaXNzdWUgYnkKPj4+IGZpbGxpbmcgYSBOVUxM
IGFkZHJlc3MgaW4gdGhlIGxhc3Qgbm9kZSBvZiB0aGUgY2hhaW4uCj4+Pgo+Pj4gQmVsb3cgaXMg
dGhlIGxvZyB3ZSBlbmNvdW50ZXIgb24gYSAyNTZHQiBVRlMgc3RvcmFnZSBhbmQgaXQgdGFrZXMg
YWJvdXQKPj4+IDI1IHNlY29uZHMgdG8gZGV0ZWN0IGxvb3BlZCBub2RlIGNoYWluLiBBZnRlciBj
aGFuZ2luZyB0aGUgYWxnb3JpdGhtLCBpdAo+Pj4gdGFrZXMgYWJvdXQgMjBtcyB0byBmaW5pc2gg
dGhlIHNhbWUgam9iLgo+Pj4KPj4+ICAgICAgICBbICAgMTAuODIyOTA0XSBmc2NrLmYyZnM6IElu
Zm86IHZlcnNpb24gdGltZXN0YW1wIGN1cjogMTcsIHByZXY6IDQzMAo+Pj4gICAgICAgIFsgICAx
MC44MjI5NDldIGZzY2suZjJmczogW3VwZGF0ZV9zdXBlcmJsb2NrOiA3NjJdIEluZm86IERvbmUg
dG8KPj4+IHVwZGF0ZSBzdXBlcmJsb2NrCj4+PiAgICAgICAgWyAgIDEwLjgyMjk1M10gZnNjay5m
MmZzOiBJbmZvOiBzdXBlcmJsb2NrIGZlYXR1cmVzID0gMTQ5OSA6Cj4+PiBlbmNyeXB0IHZlcml0
eSBleHRyYV9hdHRyIHByb2plY3RfcXVvdGEgcXVvdGFfaW5vIGNhc2Vmb2xkCj4+PiAgICAgICAg
WyAgIDEwLjgyMjk1Nl0gZnNjay5mMmZzOiBJbmZvOiBzdXBlcmJsb2NrIGVuY3J5cHQgbGV2ZWwg
PSAwLCBzYWx0ID0KPj4+IDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwCj4+PiAgICAg
ICAgWyAgIDEwLjgyMjk2MF0gZnNjay5mMmZzOiBJbmZvOiB0b3RhbCBGUyBzZWN0b3JzID0gNTky
NDk4MTEgKDIzMTQ0NAo+Pj4gTUIpCj4+PiAgICAgICAgWyAgIDM1Ljg1MjgyN10gZnNjay5mMmZz
OglkZXRlY3QgbG9vcGVkIG5vZGUgY2hhaW4sCj4+PiBibGthZGRyOjExMTQ4MDIsIG5leHQ6MTEx
NDgwMwo+Pj4gICAgICAgIFsgICAzNS44NTI4NDJdIGZzY2suZjJmczogW2YyZnNfZG9fbW91bnQ6
Mzg0Nl0gcmVjb3JkX2ZzeW5jX2RhdGEKPj4+IGZhaWxlZAo+Pj4gICAgICAgIFsgICAzNS44NTYx
MDZdIGZzY2suZjJmczogZnNjay5mMmZzIHRlcm1pbmF0ZWQgYnkgZXhpdCgyNTUpCj4+Pgo+Pj4g
U2lnbmVkLW9mZi1ieTogQ2h1bmhhaSBHdW8gPGd1b2NodW5oYWlAdml2by5jb20+Cj4+PiAtLS0K
Pj4+IHY3IC0+IHY4IDogUmVmb3JtYXQgdGhlIGNvZGUgdG8gcmVkdWNlIGluZGVudGlvbi4KPj4+
IHY2IC0+IHY3IDogQ29ycmVjdCBsb2dpYyBlcnJvciB0byBoYW5kbGUgaXNfZGV0ZWN0aW5nIHJl
dHVybiBieQo+Pj4gCWZpbmRfbm9kZV9ibGtfZmFzdCgpLgo+Pj4gdjUgLT4gdjYgOiBTaW1wbGlm
eSB0aGUgY29kZSBieSByZW1vdmluZyB1bm5lY2Vzc2FyeSByZXRyeSBsb2dpYy4KPj4+IHY0IC0+
IHY1IDogVXNlIElTX0lOT0RFKCkgdG8gbWFrZSB0aGUgY29kZSBtb3JlIGNsZWFyLgo+Pj4gdjMg
LT4gdjQgOiBTZXQgYy5idWdfb24gd2l0aCBBU1NFUlRfTVNHKCkgd2hlbiBpc3N1ZSBpcyBkZXRl
Y3RlZCBhbmQgZml4Cj4+PiAJaXQgb25seSBpZiBjLmZpeF9vbiBpcyAxLgo+Pj4gdjIgLT4gdjMg
OiBXcml0ZSBpbm9kZSB3aXRoIHdyaXRlX2lub2RlKCkgdG8gYXZvaWQgY2hrc3VtIGJlaW5nIGJy
b2tlbi4KPj4+IHYxIC0+IHYyIDogRml4IGxvb3BlZCBub2RlIGNoYWluIGRpcmVjdGx5IGFmdGVy
IGl0IGlzIGRldGVjdGVkLgo+Pj4gLS0tCj4+PiAgICAgZnNjay9tb3VudC5jIHwgMTI3ICsrKysr
KysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKy0tLS0tLQo+Pj4gICAgIDEg
ZmlsZSBjaGFuZ2VkLCAxMTIgaW5zZXJ0aW9ucygrKSwgMTUgZGVsZXRpb25zKC0pCj4+Pgo+Pj4g
ZGlmZiAtLWdpdCBhL2ZzY2svbW91bnQuYyBiL2ZzY2svbW91bnQuYwo+Pj4gaW5kZXggNGM3NDg4
ODQwYzdjLi45ZDZhMjIyYTA1NWMgMTAwNjQ0Cj4+PiAtLS0gYS9mc2NrL21vdW50LmMKPj4+ICsr
KyBiL2ZzY2svbW91bnQuYwo+Pj4gQEAgLTM1MTgsMjIgKzM1MTgsOTAgQEAgc3RhdGljIHZvaWQg
ZGVzdHJveV9mc3luY19kbm9kZXMoc3RydWN0IGxpc3RfaGVhZCAqaGVhZCkKPj4+ICAgICAJCWRl
bF9mc3luY19pbm9kZShlbnRyeSk7Cj4+PiAgICAgfQo+Pj4gICAgIAo+Pj4gK3N0YXRpYyBpbnQg
ZmluZF9ub2RlX2Jsa19mYXN0KHN0cnVjdCBmMmZzX3NiX2luZm8gKnNiaSwgYmxvY2tfdCAqYmxr
YWRkcl9mYXN0LAo+Pj4gKwkJc3RydWN0IGYyZnNfbm9kZSAqbm9kZV9ibGtfZmFzdCwgYm9vbCAq
aXNfZGV0ZWN0aW5nKQo+Pj4gK3sKPj4+ICsJaW50IGksIGVycjsKPj4+ICsKPj4+ICsJZm9yIChp
ID0gMDsgaSA8IDI7IGkrKykgewo+Pj4gKwkJaWYgKCFmMmZzX2lzX3ZhbGlkX2Jsa2FkZHIoc2Jp
LCAqYmxrYWRkcl9mYXN0LCBNRVRBX1BPUikpIHsKPj4+ICsJCQkqaXNfZGV0ZWN0aW5nID0gZmFs
c2U7Cj4+PiArCQkJcmV0dXJuIDA7Cj4+PiArCQl9Cj4+PiArCj4+PiArCQllcnIgPSBkZXZfcmVh
ZF9ibG9jayhub2RlX2Jsa19mYXN0LCAqYmxrYWRkcl9mYXN0KTsKPj4+ICsJCWlmIChlcnIpCj4+
PiArCQkJcmV0dXJuIGVycjsKPj4+ICsKPj4+ICsJCWlmICghaXNfcmVjb3ZlcmFibGVfZG5vZGUo
c2JpLCBub2RlX2Jsa19mYXN0KSkgewo+Pj4gKwkJCSppc19kZXRlY3RpbmcgPSBmYWxzZTsKPj4+
ICsJCQlyZXR1cm4gMDsKPj4+ICsJCX0KPj4+ICsKPj4+ICsJCSpibGthZGRyX2Zhc3QgPSBuZXh0
X2Jsa2FkZHJfb2Zfbm9kZShub2RlX2Jsa19mYXN0KTsKPj4+ICsJfQo+Pj4gKwo+Pj4gKwlyZXR1
cm4gMDsKPj4+ICt9Cj4+PiArCj4+PiArc3RhdGljIGludCBsb29wX25vZGVfY2hhaW5fZml4KHN0
cnVjdCBmMmZzX3NiX2luZm8gKnNiaSwKPj4+ICsJCWJsb2NrX3QgYmxrYWRkcl9mYXN0LCBzdHJ1
Y3QgZjJmc19ub2RlICpub2RlX2Jsa19mYXN0LAo+Pj4gKwkJYmxvY2tfdCBibGthZGRyLCBzdHJ1
Y3QgZjJmc19ub2RlICpub2RlX2JsaykKPj4+ICt7Cj4+PiArCWJsb2NrX3QgYmxrYWRkcl9lbnRy
eSwgYmxrYWRkcl90bXA7Cj4+PiArCWludCBlcnI7Cj4+PiArCj4+PiArCS8qIGZpbmQgdGhlIGVu
dHJ5IHBvaW50IG9mIHRoZSBsb29wZWQgbm9kZSBjaGFpbiAqLwo+Pj4gKwl3aGlsZSAoYmxrYWRk
cl9mYXN0ICE9IGJsa2FkZHIpIHsKPj4+ICsJCWVyciA9IGRldl9yZWFkX2Jsb2NrKG5vZGVfYmxr
X2Zhc3QsIGJsa2FkZHJfZmFzdCk7Cj4+PiArCQlpZiAoZXJyKQo+Pj4gKwkJCXJldHVybiBlcnI7
Cj4+PiArCQlibGthZGRyX2Zhc3QgPSBuZXh0X2Jsa2FkZHJfb2Zfbm9kZShub2RlX2Jsa19mYXN0
KTsKPj4+ICsKPj4+ICsJCWVyciA9IGRldl9yZWFkX2Jsb2NrKG5vZGVfYmxrLCBibGthZGRyKTsK
Pj4+ICsJCWlmIChlcnIpCj4+PiArCQkJcmV0dXJuIGVycjsKPj4+ICsJCWJsa2FkZHIgPSBuZXh0
X2Jsa2FkZHJfb2Zfbm9kZShub2RlX2Jsayk7Cj4+PiArCX0KPj4+ICsJYmxrYWRkcl9lbnRyeSA9
IGJsa2FkZHI7Cj4+PiArCj4+PiArCS8qIGZpbmQgdGhlIGxhc3Qgbm9kZSBvZiB0aGUgY2hhaW4g
Ki8KPj4+ICsJZG8gewo+Pj4gKwkJYmxrYWRkcl90bXAgPSBibGthZGRyOwo+Pj4gKwkJZXJyID0g
ZGV2X3JlYWRfYmxvY2sobm9kZV9ibGssIGJsa2FkZHIpOwo+Pj4gKwkJaWYgKGVycikKPj4+ICsJ
CQlyZXR1cm4gZXJyOwo+Pj4gKwkJYmxrYWRkciA9IG5leHRfYmxrYWRkcl9vZl9ub2RlKG5vZGVf
YmxrKTsKPj4+ICsJfSB3aGlsZSAoYmxrYWRkciAhPSBibGthZGRyX2VudHJ5KTsKPj4+ICsKPj4+
ICsJLyogZml4IHRoZSBibGthZGRyIG9mIGxhc3Qgbm9kZSB3aXRoIE5VTExfQUREUi4gKi8KPj4+
ICsJbm9kZV9ibGstPmZvb3Rlci5uZXh0X2Jsa2FkZHIgPSBOVUxMX0FERFI7Cj4+PiArCWlmIChJ
U19JTk9ERShub2RlX2JsaykpCj4+PiArCQllcnIgPSB3cml0ZV9pbm9kZShub2RlX2JsaywgYmxr
YWRkcl90bXApOwo+Pj4gKwllbHNlCj4+PiArCQllcnIgPSBkZXZfd3JpdGVfYmxvY2sobm9kZV9i
bGssIGJsa2FkZHJfdG1wKTsKPj4+ICsJaWYgKCFlcnIpCj4+PiArCQlGSVhfTVNHKCJGaXggbG9v
cGVkIG5vZGUgY2hhaW4gb24gYmxrYWRkciAldVxuIiwKPj4+ICsJCQkJYmxrYWRkcl90bXApOwo+
Pj4gKwlyZXR1cm4gZXJyOwo+Pj4gK30KPj4+ICsKPj4+ICAgICBzdGF0aWMgaW50IGZpbmRfZnN5
bmNfaW5vZGUoc3RydWN0IGYyZnNfc2JfaW5mbyAqc2JpLCBzdHJ1Y3QgbGlzdF9oZWFkICpoZWFk
KQo+Pj4gICAgIHsKPj4+ICAgICAJc3RydWN0IGN1cnNlZ19pbmZvICpjdXJzZWc7Cj4+PiAtCXN0
cnVjdCBmMmZzX25vZGUgKm5vZGVfYmxrOwo+Pj4gLQlibG9ja190IGJsa2FkZHI7Cj4+PiAtCXVu
c2lnbmVkIGludCBsb29wX2NudCA9IDA7Cj4+PiAtCXVuc2lnbmVkIGludCBmcmVlX2Jsb2NrcyA9
IE1BSU5fU0VHUyhzYmkpICogc2JpLT5ibG9ja3NfcGVyX3NlZyAtCj4+PiAtCQkJCQkJc2JpLT50
b3RhbF92YWxpZF9ibG9ja19jb3VudDsKPj4+ICsJc3RydWN0IGYyZnNfbm9kZSAqbm9kZV9ibGss
ICpub2RlX2Jsa19mYXN0Owo+Pj4gKwlibG9ja190IGJsa2FkZHIsIGJsa2FkZHJfZmFzdDsKPj4+
ICsJYm9vbCBpc19kZXRlY3RpbmcgPSB0cnVlOwo+Pj4gICAgIAlpbnQgZXJyID0gMDsKPj4+ICAg
ICAKPj4+ICsJbm9kZV9ibGsgPSBjYWxsb2MoRjJGU19CTEtTSVpFLCAxKTsKPj4+ICsJbm9kZV9i
bGtfZmFzdCA9IGNhbGxvYyhGMkZTX0JMS1NJWkUsIDEpOwo+Pj4gKwlBU1NFUlQobm9kZV9ibGsg
JiYgbm9kZV9ibGtfZmFzdCk7Cj4+PiArCj4+PiAgICAgCS8qIGdldCBub2RlIHBhZ2VzIGluIHRo
ZSBjdXJyZW50IHNlZ21lbnQgKi8KPj4+ICAgICAJY3Vyc2VnID0gQ1VSU0VHX0koc2JpLCBDVVJT
RUdfV0FSTV9OT0RFKTsKPj4+ICAgICAJYmxrYWRkciA9IE5FWFRfRlJFRV9CTEtBRERSKHNiaSwg
Y3Vyc2VnKTsKPj4+IC0KPj4+IC0Jbm9kZV9ibGsgPSBjYWxsb2MoRjJGU19CTEtTSVpFLCAxKTsK
Pj4+IC0JQVNTRVJUKG5vZGVfYmxrKTsKPj4+ICsJYmxrYWRkcl9mYXN0ID0gYmxrYWRkcjsKPj4+
ICAgICAKPj4+ICAgICAJd2hpbGUgKDEpIHsKPj4+ICAgICAJCXN0cnVjdCBmc3luY19pbm9kZV9l
bnRyeSAqZW50cnk7Cj4+PiBAQCAtMzU2NCwxOSArMzYzMiw0OCBAQCBzdGF0aWMgaW50IGZpbmRf
ZnN5bmNfaW5vZGUoc3RydWN0IGYyZnNfc2JfaW5mbyAqc2JpLCBzdHJ1Y3QgbGlzdF9oZWFkICpo
ZWFkKQo+Pj4gICAgIAkJaWYgKElTX0lOT0RFKG5vZGVfYmxrKSAmJiBpc19kZW50X2Rub2RlKG5v
ZGVfYmxrKSkKPj4+ICAgICAJCQllbnRyeS0+bGFzdF9kZW50cnkgPSBibGthZGRyOwo+Pj4gICAg
IG5leHQ6Cj4+PiAtCQkvKiBzYW5pdHkgY2hlY2sgaW4gb3JkZXIgdG8gZGV0ZWN0IGxvb3BlZCBu
b2RlIGNoYWluICovCj4+PiAtCQlpZiAoKytsb29wX2NudCA+PSBmcmVlX2Jsb2NrcyB8fAo+Pj4g
LQkJCWJsa2FkZHIgPT0gbmV4dF9ibGthZGRyX29mX25vZGUobm9kZV9ibGspKSB7Cj4+PiAtCQkJ
TVNHKDAsICJcdGRldGVjdCBsb29wZWQgbm9kZSBjaGFpbiwgYmxrYWRkcjoldSwgbmV4dDoldVxu
IiwKPj4+IC0JCQkJICAgIGJsa2FkZHIsCj4+PiAtCQkJCSAgICBuZXh0X2Jsa2FkZHJfb2Zfbm9k
ZShub2RlX2JsaykpOwo+Pj4gKwkJYmxrYWRkciA9IG5leHRfYmxrYWRkcl9vZl9ub2RlKG5vZGVf
YmxrKTsKPj4+ICsKPj4+ICsJCS8qIEJlbG93IHdlIHdpbGwgZGV0ZWN0IGxvb3BlZCBub2RlIGNo
YWluIHdpdGggRmxveWQncyBjeWNsZQo+Pj4gKwkJICogZGV0ZWN0aW9uIGFsZ29yaXRobS4KPj4+
ICsJCSAqLwo+Pj4gKwkJaWYgKCFpc19kZXRlY3RpbmcpCj4+PiArCQkJY29udGludWU7Cj4+PiAr
Cj4+PiArCQllcnIgPSBmaW5kX25vZGVfYmxrX2Zhc3Qoc2JpLCAmYmxrYWRkcl9mYXN0LAo+Pj4g
KwkJCQlub2RlX2Jsa19mYXN0LCAmaXNfZGV0ZWN0aW5nKTsKPj4+ICsJCWlmIChlcnIpCj4+PiAr
CQkJYnJlYWs7Cj4+PiArCj4+PiArCQlpZiAoIWlzX2RldGVjdGluZykKPj4+ICsJCQljb250aW51
ZTsKPj4+ICsKPj4+ICsJCWlmIChibGthZGRyX2Zhc3QgIT0gYmxrYWRkcikKPj4+ICsJCQljb250
aW51ZTsKPj4+ICsKPj4+ICsJCUFTU0VSVF9NU0coIlx0ZGV0ZWN0IGxvb3BlZCBub2RlIGNoYWlu
LCBibGthZGRyOiV1XG4iLAo+Pj4gKwkJCQlibGthZGRyKTsKPj4+ICsKPj4+ICsJCWlmICghYy5m
aXhfb24pIHsKPj4+ICAgICAJCQllcnIgPSAtMTsKPj4+ICAgICAJCQlicmVhazsKPj4+ICAgICAJ
CX0KPj4+ICAgICAKPj4+IC0JCWJsa2FkZHIgPSBuZXh0X2Jsa2FkZHJfb2Zfbm9kZShub2RlX2Js
ayk7Cj4+PiArCQllcnIgPSBsb29wX25vZGVfY2hhaW5fZml4KHNiaSwKPj4+ICsJCQkJTkVYVF9G
UkVFX0JMS0FERFIoc2JpLCBjdXJzZWcpLAo+Pj4gKwkJCQlub2RlX2Jsa19mYXN0LCBibGthZGRy
LCBub2RlX2Jsayk7Cj4+PiArCQlpZiAoZXJyKQo+Pj4gKwkJCWJyZWFrOwo+Pj4gKwo+Pj4gKwkJ
LyogU2luY2Ugd2UgY2FsbCBnZXRfZnN5bmNfaW5vZGUoKSB0byBlbnN1cmUgdGhlcmUgYXJlIG5v
Cj4+PiArCQkgKiBkdXBsaWNhdGUgaW5vZGVzIGluIHRoZSBpbm9kZV9saXN0IGV2ZW4gaWYgdGhl
cmUgYXJlCj4+PiArCQkgKiBkdXBsaWNhdGUgYmxrYWRkciwgd2UgY2FuIGNvbnRpbnVlIHJ1bm5p
bmcgYWZ0ZXIgZml4aW5nIHRoZQo+Pj4gKwkJICogbG9vcGVkIG5vZGUgY2hhaW4uCj4+PiArCQkg
Ki8KPj4+ICsJCWlzX2RldGVjdGluZyA9IGZhbHNlOwo+IAo+IEhpIENodW5oYWksCj4gCj4gV2hh
dCBhYm91dCBjbGVhbmluZyB1cCBhYm92ZSBsb2dpYyBsaWtlIHdlIGRpZCBpbiBrZXJuZWwgc2lk
ZT8KPiAKPiBUaGFua3MsCj4gCj4+PiAgICAgCX0KPj4+ICAgICAKPj4+ICsJZnJlZShub2RlX2Js
a19mYXN0KTsKPj4+ICAgICAJZnJlZShub2RlX2Jsayk7Cj4+PiAgICAgCXJldHVybiBlcnI7Cj4+
PiAgICAgfQoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
CkxpbnV4LWYyZnMtZGV2ZWwgbWFpbGluZyBsaXN0CkxpbnV4LWYyZnMtZGV2ZWxAbGlzdHMuc291
cmNlZm9yZ2UubmV0Cmh0dHBzOi8vbGlzdHMuc291cmNlZm9yZ2UubmV0L2xpc3RzL2xpc3RpbmZv
L2xpbnV4LWYyZnMtZGV2ZWwK
