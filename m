Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E7B373504A
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 19 Jun 2023 11:32:11 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-3.v29.lw.sourceforge.com)
	by sfs-ml-3.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1qBBEw-0000XU-RM;
	Mon, 19 Jun 2023 09:32:03 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-3.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <frank.li@vivo.com>) id 1qBBEt-0000XE-9l
 for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 19 Jun 2023 09:32:00 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=MIME-Version:Content-Transfer-Encoding:Content-Type
 :In-Reply-To:From:References:Cc:To:Subject:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=9HkI8VeoGXjKhoA5tcoleC6UJuKEf8+EikTBpU0LDDU=; b=ihtBiPbUdWVLO/dqV9YL7m+Pco
 YeD8tDhDpN/zGUEojQ+Uk/26u5N0RPtY2kxaH0gTOIJ1PbXsdJXzPSMIqWX4rR5qc8tfa5ltYhgjJ
 Jzgz3/lYzKtE7kdJnqUdZgZsLBvclVqUJDUE1RBGwGdbDRpzHZIoMUGybic728n1785I=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=MIME-Version:Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
 References:Cc:To:Subject:Date:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=9HkI8VeoGXjKhoA5tcoleC6UJuKEf8+EikTBpU0LDDU=; b=fPuQJJwWbyldPO3QJCMEq8QOlL
 XzkWvsKZ+xMsnCFEFl0/jEC5Z165uDl/qZ2okfuitCKU/F0PiMJvqE3uIvnO0VpXwp/zzJgLlvnEf
 K0mey/dGYyGnwM4QF2u/+hI2RanxoTZTWkFiGkuPqoYoxVPrjuzd1ebqcTIStERHwTn8=;
Received: from mail-tyzapc01on2098.outbound.protection.outlook.com
 ([40.107.117.98] helo=APC01-TYZ-obe.outbound.protection.outlook.com)
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1qBBEo-0004Uh-4Z for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 19 Jun 2023 09:31:59 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=mCVMFr2uOu88MTRMITVu6t5zClP+w484lKkvdv4RLpiBWPLPwJQIbmMB9YjABxeo0KaqAtDozbh09SKFwZptt0FWno04NEhvRG6fgvsVMJkT5w8aLtdEb+d/AprR+g1rRKH4EzTeAhH7SlCYPAbzyyFYlW40vYfgWt2sqPtBJlfO7yywDY5mTYi7XaKtSzgPH8pKUJvlm9gbiJmQve9Zux9Kh7mIqVnX0bzsOAOB5StGR9DF//JU8cR8IzGdeH4L6hC+5zNXTYNFeeRywd/bCqb7dhHl1RsJ2YUlOx6uIUMG7f2TwrkcVvOCaP/YNvdDPt6ggUIHnUOkw+UaWbsbjw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9HkI8VeoGXjKhoA5tcoleC6UJuKEf8+EikTBpU0LDDU=;
 b=H8pAyiR8jxIQL1+seQlLM0w5XotFtxWTntGQjpFtQ9ZTFvD/MZAZqI6/UPzdXrZ+OO/hXahLFW+WsdDVQFRPsV7QBa0qp8EgNoxUfJBzcqqYwZtXME3yIPA4qI1jqU46ehqyzgLgU/yNtIsxRm4niyxUssi945JxbppYhDItBQkj8VZ0ODOlnsetJzpp2RTEkMGYlNi27yN+grfrSihJxCbb2pXsJXtT357WgqQurrQiHdGfcj7ECkAd3OC7ZdTW3E9S9EJfCqZJyvoLxsMR8AZf5v1dI9rUr4rga73ZnDxh1484FxvUTSZcrtixrnHaBt6i/o8dEm+n8C2B7ZyJmg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vivo.com; dmarc=pass action=none header.from=vivo.com;
 dkim=pass header.d=vivo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vivo.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9HkI8VeoGXjKhoA5tcoleC6UJuKEf8+EikTBpU0LDDU=;
 b=XVNigIRT9sv/jEaWE5oYQ2/j4BPMMWLCjm5cfpSmR+hPbUbZ+97X+7+k3pN1lU+XcES7CsaMpcIamsye3HtgvF7batT7wVAequJtTOU+YDGXKXxB6hJ5dmFLhls69CDF4tv0u/gsDIj5CBM2THgAjecHKO8YDnshAf2jioagDrT67nZ3ByrMqASATy3G4MQlhuYmXnbcCfWzi7Dvsja0WFBB7bjZ4Q8yxtSa+Urw0XmxfNHU0aiBmtSuUv48c0uDc8tN66qBFpTdSWcBLMSnpkFWPaIMqBnOU4uyF5m96tpHSGCNNME88Q6NZlwc7khKFXIsT8Y0BGO4ihV+cq2VzQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=vivo.com;
Received: from SEZPR06MB5269.apcprd06.prod.outlook.com (2603:1096:101:78::6)
 by SEZPR06MB5591.apcprd06.prod.outlook.com (2603:1096:101:c9::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6500.36; Mon, 19 Jun
 2023 09:31:45 +0000
Received: from SEZPR06MB5269.apcprd06.prod.outlook.com
 ([fe80::fa0e:6c06:7474:285c]) by SEZPR06MB5269.apcprd06.prod.outlook.com
 ([fe80::fa0e:6c06:7474:285c%4]) with mapi id 15.20.6500.036; Mon, 19 Jun 2023
 09:31:44 +0000
Message-ID: <6fb1d0be-b9d5-ce0a-7984-56b2e1a1a242@vivo.com>
Date: Mon, 19 Jun 2023 17:31:19 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.1
To: Chao Yu <chao@kernel.org>, Jaegeuk Kim <jaegeuk@kernel.org>
References: <20230609131555.56651-1-frank.li@vivo.com>
 <8097d4d9-815e-2527-0fb7-90ec0609a4a3@kernel.org>
 <dde6972a-e98c-8a6e-493b-9aff5668101d@vivo.com>
 <7ab6b6f9-37fa-9bf2-69ce-7b1b1944d9f3@kernel.org>
 <fe223231-5445-61ef-1ba8-0d46f4f4ed5f@vivo.com>
 <65ce42d6-889a-5e1d-8f04-af8f66fd0afa@kernel.org>
In-Reply-To: <65ce42d6-889a-5e1d-8f04-af8f66fd0afa@kernel.org>
X-ClientProxiedBy: SGXP274CA0023.SGPP274.PROD.OUTLOOK.COM (2603:1096:4:b8::35)
 To SEZPR06MB5269.apcprd06.prod.outlook.com
 (2603:1096:101:78::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SEZPR06MB5269:EE_|SEZPR06MB5591:EE_
X-MS-Office365-Filtering-Correlation-Id: 0d94bb1a-4d60-45d4-ef92-08db70a7fefb
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: NMl7Te0A0YJeFBtjFlZr2uIjOA1cpZbQjF1UDv2oABHEHuKaVsLZLQaqNzm7zVnnrkXBQpbbvEDsAzIm4fbraAZzl3v+4odj1ikx+XYJaRK7BPyAbh4upIGgStkTAvl/U7EOJIqeDzxkWrQdrtCFg0gl60HLLn/RO5PenK1gbTzo9IYhaMokoEGkzv/5R/Zf/jcbbokBuYHP8gdGpbD8BXUQPF4SHhyr97GQcfSuWNooGrSiel7S/jPej/z7/Jn5WRGnNAFJnqN8mYlK6jroDzEpZlE3NRAFgDGHw37bQQfP1fY8yUeqEqkAE7sKEuLFms94R0ujyiaw2PjIlsiWeYK5tQzl/+WE9EedBBjroo3f0XupqOaqbWtheiWGko4s4/0GPbYKfPj3R+BVuuJHZ3LK3pTQOWuj4KC4XFMTAR1AGnxpuNXSOJgGNy4uA2/xV0zTvZaFucHZ/s5x1CRcLt14+vTl9W07iPbvkjQhKn279bF9Tc+YnH4sU1yuFmIFaXxfJlxicCPD0T/CmbCUOU95u3830XNvz/nqVb7Q5+2GuBHcnuGPWBaMCZbV6C7R1XiPCq3uPH1EGC6xOBS5NmEFY1NFr4nhQBmopSlPhaMdCiVr1SPecVmT67bnZWttaiQnnVNBGdbriS72l7mDypNVd//QRf3f44FuLvDHdm/S9UEGYvZpmnxFeujMjYmO
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SEZPR06MB5269.apcprd06.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(4636009)(136003)(346002)(376002)(39860400002)(366004)(396003)(451199021)(2616005)(31696002)(86362001)(2906002)(31686004)(83380400001)(5660300002)(110136005)(66476007)(8936002)(186003)(66946007)(8676002)(66556008)(36756003)(26005)(478600001)(40140700001)(38100700002)(41300700001)(4326008)(6512007)(53546011)(6506007)(52116002)(6486002)(6666004)(316002)(38350700002)(43740500002)(45980500001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?WEp4TUpBanY4YnNkZGVtVGh0a1g5UUlDeEg1L3FHSEd0YTAyRXR6YUNTMFVT?=
 =?utf-8?B?QUY5TG9LMVM3bHI3ODFXSFdzNVZWT295cVhqSk9PcFEvQ24vbWZXeDhxbjdh?=
 =?utf-8?B?OGtmVFo4UlFJVVc5Y0FCZzBYWmJxY2w4QWdtZW5iTUdFeG5HR216Y0VpNzda?=
 =?utf-8?B?Q3VUUjRwSzN2LzZZZWhzdTlIaEhQaktlQ3BuVjRMSEJKVXhyczBublg4YWsz?=
 =?utf-8?B?anoxb0JCUlB3UTRDL1RhSm1rODRtM1l3b1AzWTd0RlpCS0RROWpqa1lvdTFw?=
 =?utf-8?B?dzNoMVNQZHhrUVI2NzVTYUdRNC9qdi9icnFraXdQUnhlcGQ2Yi93RVd6YWs0?=
 =?utf-8?B?NkxXczdVK3RwaW03NEpVZ3BaOFZ1QWpsV1R1b3FpbDFYTzlXN3VqSm95MURk?=
 =?utf-8?B?RFRlaVBYWjJEUmdVc0FTMk5EQlpWQ2lMNE9rMm03bk1WMG1pMkEyd3NMRmpu?=
 =?utf-8?B?TWxYVEg5LzhMWTExYis1Y2ZCeGdIVDlXd2ljVjUzZ2hNZGx2aXhyL1FSY2FG?=
 =?utf-8?B?ZzdGaXdldysxc2JCVURIUjk3MElYYW5LQWw2Z2lBaU1RZko2TjZKTW5Qb2E4?=
 =?utf-8?B?MXpObUNyMXE0TXdCUE16dklMbDlNeGx1VUhLbXR4ODlXejNxSWhyeCtJRVdQ?=
 =?utf-8?B?VHorMWFFbzRtU2xpYy9tWmJPdUpBWjBDd0ZCREFaR1FrVUF3aU9UaGZZRmdF?=
 =?utf-8?B?WHlZTkwwWEJtU0hZRjFYMm1rZG9YZkxPamR6R1I0VGd1UXpwbFFTMmk3UU1K?=
 =?utf-8?B?dDlIaThnQU1mbklEaEljSU9qYUMxMUZjMlNZR1hmTVFiZjh1ayszb3N5Q0R3?=
 =?utf-8?B?RXBKb0E1M0VuM3RHQVBQV0k5WFVlTEhJQ2dWeWNEMExUSk9pdnhZT1JwRGll?=
 =?utf-8?B?Mzd4allhUG5hYWZPOXRvMGdnKzE3SWJFWVE2Y3lJUlJNWlQza1lwcnVJQlZG?=
 =?utf-8?B?QVdqTHdsenNVMWtjSHdaWWJxeVQrOFJ4WWtkMm0ydDJvMUVldEFNZnRNM1pr?=
 =?utf-8?B?QVkzTndtSHBGYjY0emx5RmgwNWJxOXpVQmNaVE5zSDN5cEtsRFRBOXRRVktQ?=
 =?utf-8?B?UVBCK25KQUlYMlZsT0RwMXlObzExeGNTRS84UHJLbm51UStYVElWVVZlZ2Za?=
 =?utf-8?B?bWpycnkrM24xZUFkMi9jV0VaQkdJWkxZWEM4azBhUnZvaXV0MTJwVHRldE5P?=
 =?utf-8?B?S0pLNkpRbkt3M1JxSWRZdUdlTVllb1ErMlZBS0tZK3ZvRW16MS85K2I1TlFa?=
 =?utf-8?B?STR0aE1vK0pOUkVjaCtkTmd6WmtIN3paTHdqbElWWC9RaU5hZVA0V3RZLzl0?=
 =?utf-8?B?dGQzSEtwYVhtSDNqUThQME90aWp5dWxZMWdjRS93ZG9rUjJua0g1cEpuM2Zz?=
 =?utf-8?B?MitmTGNGRlNqbUk1Q2JzOU9iVStLNTJUVWUxVm14RkJ4VHVDVk9DL0V3Q0cx?=
 =?utf-8?B?RlBseW9QMVkxN1hqS3Z3YmNPV0t3MWVZalpTWVJJYldjTUdDYVYwUHBLcE1U?=
 =?utf-8?B?MmgzUXpacGpZdW1ZcE4yeE55aVo3ekhaTkpUZ3RXWWdMb2J3UE9seVYvNWxH?=
 =?utf-8?B?Rzl2blFGQ0RQZkVyRmF0Nms0WituTXJweUJESXZPTWlGKy82d0UyYjdWeFlX?=
 =?utf-8?B?bkZ3VFQ5Yk85ckZBRmNvZjZleXhZM3F0QnVUcFM2cDBhRU9yM2owOFRHVDlU?=
 =?utf-8?B?U1BJQloyVFBlbTNKUjc0RHRQQVR2N0lxR0drSGN2aXo5UmM5bmVhcU51eXV4?=
 =?utf-8?B?Uy9teG9xVzlzSTIwTjF6ckV4eGN6cVNhM3NsbnVjY0xzUjkydWgzN214KzUx?=
 =?utf-8?B?UW1NbVpiRWJ2UEFneUJwT3h5ZDloRGtnaEYvazN0YnJPdTNxbVlWOHhycGhu?=
 =?utf-8?B?MHhlMVczN3p5SUJvRnovM3RYSVNwZlJGNU9VNk5IWXc4OCtWa1BVNkkwaGJ3?=
 =?utf-8?B?bXQrS0EvbHZULzdONWxBN2tvSXRlU1pnUm0xbzgzdmJIdTdYUVBSa0NEOVlJ?=
 =?utf-8?B?UDhyR0FRZk1HdkxaZ1F0bXZHazJrZ2FVRTJZWm1DbXNaeUlXb1JUSGlGenhG?=
 =?utf-8?B?WEllb21NT09TWmhBTlB3WmE2ejVlMC9xd3k5VXpyWk5hS05TbnlSZUhBQnlh?=
 =?utf-8?Q?p/SYWKDiRCKE7NsXPpYToHY4n?=
X-OriginatorOrg: vivo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0d94bb1a-4d60-45d4-ef92-08db70a7fefb
X-MS-Exchange-CrossTenant-AuthSource: SEZPR06MB5269.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Jun 2023 09:31:44.5953 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 923e42dc-48d5-4cbe-b582-1a797a6412ed
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: bhNCMl7dPVS3R+DT0F8fc/HMKi+C51BiC82T5UdXzehCuINzezh9kwN9iLY2FWCSkqi6gREDRuoCQvJlEGZmHg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SEZPR06MB5591
X-Spam-Score: -0.3 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 2023/6/19 12:04, Chao Yu wrote: > On 2023/6/19 11:11,
 Yangtao
 Li wrote: >> On 2023/6/19 8:54, Chao Yu wrote: >> >>> On 2023/6/13 12:14,
 Yangtao Li wrote: >>>> >>>> On 2023/6/12 22:38,
 Chao Yu wrote: >>>>> On 2023/6/9 21:15, Yangtao [...] 
 Content analysis details:   (-0.3 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [40.107.117.98 listed in wl.mailspike.net]
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
 no trust [40.107.117.98 listed in list.dnswl.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.0 SPF_HELO_PASS          SPF: HELO matches SPF record
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid -0.0 T_SCC_BODY_TEXT_LINE   No description available.
 -0.1 NICE_REPLY_A           Looks like a legit reply (A)
X-Headers-End: 1qBBEo-0004Uh-4Z
Subject: Re: [f2fs-dev] [PATCH] f2fs: compress: don't force buffered io when
 in COMPR_MODE_USER mode
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
Cc: Qi Han <hanqi@vivo.com>, linux-kernel@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

T24gMjAyMy82LzE5IDEyOjA0LCBDaGFvIFl1IHdyb3RlOgoKPiBPbiAyMDIzLzYvMTkgMTE6MTEs
IFlhbmd0YW8gTGkgd3JvdGU6Cj4+IE9uIDIwMjMvNi8xOSA4OjU0LCBDaGFvIFl1IHdyb3RlOgo+
Pgo+Pj4gT24gMjAyMy82LzEzIDEyOjE0LCBZYW5ndGFvIExpIHdyb3RlOgo+Pj4+Cj4+Pj4gT24g
MjAyMy82LzEyIDIyOjM4LCBDaGFvIFl1IHdyb3RlOgo+Pj4+PiBPbiAyMDIzLzYvOSAyMToxNSwg
WWFuZ3RhbyBMaSB3cm90ZToKPj4+Pj4+IEl0IGlzIG9ic2VydmVkIHRoYXQgd2hlbiBpbiB1c2Vy
IGNvbXByZXNzaW9uIG1vZGUKPj4+Pj4+IChjb21wcmVzc19leHRlbnNpb249KiksCj4+Pj4+PiBl
dmVuIHRob3VnaCB0aGUgZmlsZSBpcyBub3QgY29tcHJlc3NlZCwgdGhlIGZpbGUgaXMgc3RpbGwg
Zm9yY2VkIAo+Pj4+Pj4gdG8gdXNlCj4+Pj4+PiBidWZmZXIgaW8sIHdoaWNoIG1ha2VzIHRoZSBB
bmRyb0JlbmNoIHNlcXVlbnRpYWwgcmVhZCBhbmQgd3JpdGUgZHJvcAo+Pj4+Pj4gc2lnbmlmaWNh
bnRseS4gSW4gZmFjdCwgd2hlbiB0aGUgZmlsZSBpcyBub3QgY29tcHJlc3NlZCwgd2UgZG9uJ3Qg
Cj4+Pj4+PiBuZWVkCj4+Pj4+PiB0byBmb3JjZSBpdCB0byBidWZmZXIgaW8uCj4+Pj4+Pgo+Pj4+
Pj4gwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIHwgdy9vIHBhdGNoIHwgdy8g
cGF0Y2ggfAo+Pj4+Pj4gc2VxIHJlYWTCoCAoTUIvcykgfCAxMzIwLjA2OMKgIHwgMzY5Ni4xNTQg
fAo+Pj4+Pj4gc2VxIHdyaXRlIChNQi9zKSB8IDYxNy45OTbCoMKgIHwgMjk3OC40NzggfAo+Pj4+
Pj4KPj4+Pj4+IEZpeGVzOiA0YzhmZjcwOTViZWYgKCJmMmZzOiBzdXBwb3J0IGRhdGEgY29tcHJl
c3Npb24iKQo+Pj4+Pj4gU2lnbmVkLW9mZi1ieTogUWkgSGFuIDxoYW5xaUB2aXZvLmNvbT4KPj4+
Pj4+IFNpZ25lZC1vZmYtYnk6IFlhbmd0YW8gTGkgPGZyYW5rLmxpQHZpdm8uY29tPgo+Pj4+Pj4g
LS0tCj4+Pj4+PiDCoMKgIGZzL2YyZnMvZjJmcy5oIHwgMTQgKysrKysrKysrKysrKysKPj4+Pj4+
IMKgwqAgZnMvZjJmcy9maWxlLmMgfMKgIDIgKy0KPj4+Pj4+IMKgwqAgMiBmaWxlcyBjaGFuZ2Vk
LCAxNSBpbnNlcnRpb25zKCspLCAxIGRlbGV0aW9uKC0pCj4+Pj4+Pgo+Pj4+Pj4gZGlmZiAtLWdp
dCBhL2ZzL2YyZnMvZjJmcy5oIGIvZnMvZjJmcy9mMmZzLmgKPj4+Pj4+IGluZGV4IDFlZmNmZDll
NWE5OS4uN2Y1NDcyNTI1MzEwIDEwMDY0NAo+Pj4+Pj4gLS0tIGEvZnMvZjJmcy9mMmZzLmgKPj4+
Pj4+ICsrKyBiL2ZzL2YyZnMvZjJmcy5oCj4+Pj4+PiBAQCAtMzE2OCw2ICszMTY4LDIwIEBAIHN0
YXRpYyBpbmxpbmUgaW50IGYyZnNfY29tcHJlc3NlZF9maWxlKHN0cnVjdAo+Pj4+Pj4gaW5vZGUg
Kmlub2RlKQo+Pj4+Pj4gwqDCoMKgwqDCoMKgwqDCoMKgwqAgaXNfaW5vZGVfZmxhZ19zZXQoaW5v
ZGUsIEZJX0NPTVBSRVNTRURfRklMRSk7Cj4+Pj4+PiDCoMKgIH0KPj4+Pj4+IMKgwqAgK3N0YXRp
YyBpbmxpbmUgYm9vbCBmMmZzX2lzX2NvbXByZXNzZWRfZmlsZShzdHJ1Y3QgaW5vZGUgKmlub2Rl
KQo+Pj4+Pj4gK3sKPj4+Pj4+ICvCoMKgwqAgaW50IGNvbXByZXNzX21vZGUgPSAKPj4+Pj4+IEYy
RlNfT1BUSU9OKEYyRlNfSV9TQihpbm9kZSkpLmNvbXByZXNzX21vZGU7Cj4+Pj4+PiArCj4+Pj4+
PiArwqDCoMKgIGlmIChjb21wcmVzc19tb2RlID09IENPTVBSX01PREVfRlMpCj4+Pj4+PiArwqDC
oMKgwqDCoMKgwqAgcmV0dXJuIGYyZnNfY29tcHJlc3NlZF9maWxlKGlub2RlKTsKPj4+Pj4+ICvC
oMKgwqAgZWxzZSBpZiAoYXRvbWljX3JlYWQoJkYyRlNfSShpbm9kZSktPmlfY29tcHJfYmxvY2tz
KSB8fAo+Pj4+Pgo+Pj4+PiBTaG91bGQgY2hlY2sgZGlydHkgcGFnZSBhcyB3ZWxsPyBpX2NvbXBy
X2Jsb2NrcyBtYXkgaW5jcmVhc2UgYWZ0ZXIKPj4+Pj4gZGF0YSB3cml0ZWJhY2suCj4+Pj4+Cj4+
Pj4gSUlVQywgaW4gQ09NUFJfTU9ERV9VU0VSIG1vZGUsIGlfY29tcHJfYmxvY2tzIHdpbGwgb25s
eSBiZSB1cGRhdGVkIAo+Pj4+IHdoZW4KPj4+PiBGSV9FTkFCTEVfQ09NUFJFU1MgaXMgZW5hYmxl
ZC4KPj4+Pgo+Pj4+IElmIEZJX0VOQUJMRV9DT01QUkVTUyBpcyBub3QgZW5hYmxlZCwgaV9jb21w
cl9ibG9ja3Mgd2lsbCBuZXZlciBiZQo+Pj4+IHVwZGF0ZWQgYWZ0ZXIgZGF0YSB3cml0ZWJhY2su
Cj4+Pj4KPj4+PiBTbyB0aGVyZSBpcyBubyBuZWVkIHRvIGFkZGl0aW9uYWxseSBqdWRnZSB3aGV0
aGVyIHRoZXJlIGlzIGEgZGlydHkgCj4+Pj4gcGFnZT8KPj4+Cj4+PiBPaCwgdXNlciBtb2RlLCB0
aGF0J3MgY29ycmVjdC4KPj4+Cj4+PiBJZiB3ZSBhbGxvdyBkaW8vYWlvIG9uIGNvbXByZXNzIGZp
bGUsIGl0IG5lZWRzIHRvIGNvbnNpZGVyIHJhY2UgY2FzZSBpbgo+Pj4gYmV0d2VlbiBhaW8gYW5k
IGlvY19jb21wcmVzc19maWxlLgo+Pgo+Pgo+PiBUaGUgaW5vZGVfbG9jayBpcyBhbHJlYWR5IGhl
bGQgaW4gZjJmc19maWxlX3dyaXRlX2l0ZXIgYW5kIAo+PiBmMmZzX2lvY19jb21wcmVzc19maWxl
LCBJIGd1ZXNzIHRoaXMgaXMgZW5vdWdoPwo+Pgo+PiBXaGF0IGVsc2U/Cj4KPiBhaW8gbWF5IGNv
bXBsZXRlIG91dHNpZGUgaW5vZGUgbG9jaywgc28gaXQgbmVlZHMgdG8gY2FsbCBpbm9kZV9kaW9f
d2FpdCgpCj4gaW4gZjJmc19pb2NfY29tcHJlc3NfZmlsZSgpIHRvIGF2b2lkIHRoZSByYWNlIGNh
c2U/CgoKSG93IGFib3V0IGFkZGluZyB0aGlzIGJlbG9377yfCgpkaWZmIC0tZ2l0IGEvZnMvZjJm
cy9maWxlLmMgYi9mcy9mMmZzL2ZpbGUuYwppbmRleCBmNDVkMDVjMTNhZTUuLjUwMjFkMTNlNzg4
YiAxMDA2NDQKLS0tIGEvZnMvZjJmcy9maWxlLmMKKysrIGIvZnMvZjJmcy9maWxlLmMKQEAgLTQx
NDYsNiArNDE0NiwxMCBAQCBzdGF0aWMgaW50IGYyZnNfaW9jX2NvbXByZXNzX2ZpbGUoc3RydWN0
IGZpbGUgKmZpbHApCiDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgZ290byBvdXQ7CiDC
oMKgwqDCoMKgwqDCoCB9CgorwqDCoMKgwqDCoMKgIC8qIGF2b2lkIHJhY2UgY2FzZSBiZXR3ZWVu
IGFpbyBhbmQgaW9jX2NvbXByZXNzX2ZpbGUgKi8KK8KgwqDCoMKgwqDCoCBpZiAoRjJGU19PUFRJ
T04oc2JpKS5jb21wcmVzc19tb2RlID09IENPTVBSX01PREVfVVNFUikKK8KgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqAgaW5vZGVfZGlvX3dhaXQoaW5vZGUpOworCiDCoMKgwqDCoMKgwqDCoCBy
ZXQgPSBmaWxlbWFwX3dyaXRlX2FuZF93YWl0X3JhbmdlKGlub2RlLT5pX21hcHBpbmcsIDAsIExM
T05HX01BWCk7CiDCoMKgwqDCoMKgwqDCoCBpZiAocmV0KQogwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgIGdvdG8gb3V0OwoKClRoYW5rcywKCgo+Cj4gVGhhbmtzLAo+Cj4+Cj4+Cj4+IDQ2
OTEgc3RhdGljIHNzaXplX3QgZjJmc19maWxlX3dyaXRlX2l0ZXIoc3RydWN0IGtpb2NiICppb2Ni
LCBzdHJ1Y3QgCj4+IGlvdl9pdGVyICpmcm9tKQo+PiA0NjkyIHsKPj4gNDY5M8KgwqDCoMKgwqDC
oMKgwqAgc3RydWN0IGlub2RlICppbm9kZSA9IGZpbGVfaW5vZGUoaW9jYi0+a2lfZmlscCk7Cj4+
IDQ2OTTCoMKgwqDCoMKgwqDCoMKgIGNvbnN0IGxvZmZfdCBvcmlnX3BvcyA9IGlvY2ItPmtpX3Bv
czsKPj4gNDY5NcKgwqDCoMKgwqDCoMKgwqAgY29uc3Qgc2l6ZV90IG9yaWdfY291bnQgPSBpb3Zf
aXRlcl9jb3VudChmcm9tKTsKPj4gNDY5NsKgwqDCoMKgwqDCoMKgwqAgbG9mZl90IHRhcmdldF9z
aXplOwo+PiA0Njk3wqDCoMKgwqDCoMKgwqDCoCBib29sIGRpbzsKPj4gNDY5OMKgwqDCoMKgwqDC
oMKgwqAgYm9vbCBtYXlfbmVlZF9zeW5jID0gdHJ1ZTsKPj4gNDY5OcKgwqDCoMKgwqDCoMKgwqAg
aW50IHByZWFsbG9jYXRlZDsKPj4gNDcwMMKgwqDCoMKgwqDCoMKgwqAgc3NpemVfdCByZXQ7Cj4+
IDQ3MDEKPj4gNDcwMsKgwqDCoMKgwqDCoMKgwqAgaWYgKHVubGlrZWx5KGYyZnNfY3BfZXJyb3Io
RjJGU19JX1NCKGlub2RlKSkpKSB7Cj4+IDQ3MDPCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoCByZXQgPSAtRUlPOwo+PiA0NzA0wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAg
Z290byBvdXQ7Cj4+IDQ3MDXCoMKgwqDCoMKgwqDCoMKgIH0KPj4gNDcwNgo+PiA0NzA3wqDCoMKg
wqDCoMKgwqDCoCBpZiAoIWYyZnNfaXNfY29tcHJlc3NfYmFja2VuZF9yZWFkeShpbm9kZSkpIHsK
Pj4gNDcwOMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIHJldCA9IC1FT1BOT1RTVVBQ
Owo+PiA0NzA5wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgZ290byBvdXQ7Cj4+IDQ3
MTDCoMKgwqDCoMKgwqDCoMKgIH0KPj4gNDcxMQo+PiA0NzEywqDCoMKgwqDCoMKgwqDCoCBpZiAo
aW9jYi0+a2lfZmxhZ3MgJiBJT0NCX05PV0FJVCkgewo+PiA0NzEzwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqAgaWYgKCFpbm9kZV90cnlsb2NrKGlub2RlKSkgewo+PiA0NzE0wqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIHJldCA9IC1FQUdBSU47
Cj4+IDQ3MTXCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAg
Z290byBvdXQ7Cj4+IDQ3MTbCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCB9Cj4+IDQ3
MTfCoMKgwqDCoMKgwqDCoMKgIH0gZWxzZSB7Cj4+IDQ3MTjCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoCBpbm9kZV9sb2NrKGlub2RlKTsKPj4gNDcxOcKgwqDCoMKgwqDCoMKgwqAgfQo+
Pgo+Pgo+PiA0MTE1IHN0YXRpYyBpbnQgZjJmc19pb2NfY29tcHJlc3NfZmlsZShzdHJ1Y3QgZmls
ZSAqZmlscCkKPj4gNDExNiB7Cj4+IDQxMTfCoMKgwqDCoMKgwqDCoMKgIHN0cnVjdCBpbm9kZSAq
aW5vZGUgPSBmaWxlX2lub2RlKGZpbHApOwo+PiA0MTE4wqDCoMKgwqDCoMKgwqDCoCBzdHJ1Y3Qg
ZjJmc19zYl9pbmZvICpzYmkgPSBGMkZTX0lfU0IoaW5vZGUpOwo+PiA0MTE5wqDCoMKgwqDCoMKg
wqDCoCBwZ29mZl90IHBhZ2VfaWR4ID0gMCwgbGFzdF9pZHg7Cj4+IDQxMjDCoMKgwqDCoMKgwqDC
oMKgIHVuc2lnbmVkIGludCBibGtfcGVyX3NlZyA9IHNiaS0+YmxvY2tzX3Blcl9zZWc7Cj4+IDQx
MjHCoMKgwqDCoMKgwqDCoMKgIGludCBjbHVzdGVyX3NpemUgPSBGMkZTX0koaW5vZGUpLT5pX2Ns
dXN0ZXJfc2l6ZTsKPj4gNDEyMsKgwqDCoMKgwqDCoMKgwqAgaW50IGNvdW50LCByZXQ7Cj4+IDQx
MjMKPj4gNDEyNMKgwqDCoMKgwqDCoMKgwqAgaWYgKCFmMmZzX3NiX2hhc19jb21wcmVzc2lvbihz
YmkpIHx8Cj4+IDQxMjXCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqAgRjJGU19PUFRJT04oc2JpKS5jb21wcmVzc19tb2RlICE9IAo+PiBDT01QUl9NT0RFX1VT
RVIpCj4+IDQxMjbCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCByZXR1cm4gLUVPUE5P
VFNVUFA7Cj4+IDQxMjcKPj4gNDEyOMKgwqDCoMKgwqDCoMKgwqAgaWYgKCEoZmlscC0+Zl9tb2Rl
ICYgRk1PREVfV1JJVEUpKQo+PiA0MTI5wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAg
cmV0dXJuIC1FQkFERjsKPj4gNDEzMAo+PiA0MTMxwqDCoMKgwqDCoMKgwqDCoCBpZiAoIWYyZnNf
Y29tcHJlc3NlZF9maWxlKGlub2RlKSkKPj4gNDEzMsKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgIHJldHVybiAtRUlOVkFMOwo+PiA0MTMzCj4+IDQxMzTCoMKgwqDCoMKgwqDCoMKgIGYy
ZnNfYmFsYW5jZV9mcyhzYmksIHRydWUpOwo+PiA0MTM1Cj4+IDQxMzbCoMKgwqDCoMKgwqDCoMKg
IGZpbGVfc3RhcnRfd3JpdGUoZmlscCk7Cj4+IDQxMzfCoMKgwqDCoMKgwqDCoMKgIGlub2RlX2xv
Y2soaW5vZGUpOwo+Pgo+Pgo+PiBUaGFua3MsCj4+Cj4+Pgo+Pj4gVGhhbmtzLAo+Pj4KPj4+Pgo+
Pj4+Cj4+Pj4gVGhhbmtzLAo+Pj4+Cj4+Pj4+IFRoYW5rcywKPj4+Pj4KPj4+Pj4+ICvCoMKgwqDC
oMKgwqDCoCBpc19pbm9kZV9mbGFnX3NldChpbm9kZSwgRklfQ09NUFJFU1NfUkVMRUFTRUQpIHx8
Cj4+Pj4+PiArwqDCoMKgwqDCoMKgwqAgaXNfaW5vZGVfZmxhZ19zZXQoaW5vZGUsIEZJX0VOQUJM
RV9DT01QUkVTUykpCj4+Pj4+PiArwqDCoMKgwqDCoMKgwqAgcmV0dXJuIHRydWU7Cj4+Pj4+PiAr
Cj4+Pj4+PiArwqDCoMKgIHJldHVybiBmYWxzZTsKPj4+Pj4+ICt9Cj4+Pj4+PiArCj4+Pj4+PiDC
oMKgIHN0YXRpYyBpbmxpbmUgYm9vbCBmMmZzX25lZWRfY29tcHJlc3NfZGF0YShzdHJ1Y3QgaW5v
ZGUgKmlub2RlKQo+Pj4+Pj4gwqDCoCB7Cj4+Pj4+PiDCoMKgwqDCoMKgwqAgaW50IGNvbXByZXNz
X21vZGUgPSAKPj4+Pj4+IEYyRlNfT1BUSU9OKEYyRlNfSV9TQihpbm9kZSkpLmNvbXByZXNzX21v
ZGU7Cj4+Pj4+PiBkaWZmIC0tZ2l0IGEvZnMvZjJmcy9maWxlLmMgYi9mcy9mMmZzL2ZpbGUuYwo+
Pj4+Pj4gaW5kZXggNzRlY2M5ZTIwNjE5Li4wNjk4MTI5YjIxNjUgMTAwNjQ0Cj4+Pj4+PiAtLS0g
YS9mcy9mMmZzL2ZpbGUuYwo+Pj4+Pj4gKysrIGIvZnMvZjJmcy9maWxlLmMKPj4+Pj4+IEBAIC04
MjEsNyArODIxLDcgQEAgc3RhdGljIGJvb2wgZjJmc19mb3JjZV9idWZmZXJlZF9pbyhzdHJ1Y3Qg
aW5vZGUKPj4+Pj4+ICppbm9kZSwgaW50IHJ3KQo+Pj4+Pj4gwqDCoMKgwqDCoMKgwqDCoMKgwqAg
cmV0dXJuIHRydWU7Cj4+Pj4+PiDCoMKgwqDCoMKgwqAgaWYgKGZzdmVyaXR5X2FjdGl2ZShpbm9k
ZSkpCj4+Pj4+PiDCoMKgwqDCoMKgwqDCoMKgwqDCoCByZXR1cm4gdHJ1ZTsKPj4+Pj4+IC3CoMKg
wqAgaWYgKGYyZnNfY29tcHJlc3NlZF9maWxlKGlub2RlKSkKPj4+Pj4+ICvCoMKgwqAgaWYgKGYy
ZnNfaXNfY29tcHJlc3NlZF9maWxlKGlub2RlKSkKPj4+Pj4+IMKgwqDCoMKgwqDCoMKgwqDCoMKg
IHJldHVybiB0cnVlOwo+Pj4+Pj4gwqDCoCDCoMKgwqDCoMKgIC8qIGRpc2FsbG93IGRpcmVjdCBJ
TyBpZiBhbnkgb2YgZGV2aWNlcyBoYXMgdW5hbGlnbmVkIAo+Pj4+Pj4gYmxrc2l6ZSAqLwoKCl9f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4LWYyZnMt
ZGV2ZWwgbWFpbGluZyBsaXN0CkxpbnV4LWYyZnMtZGV2ZWxAbGlzdHMuc291cmNlZm9yZ2UubmV0
Cmh0dHBzOi8vbGlzdHMuc291cmNlZm9yZ2UubmV0L2xpc3RzL2xpc3RpbmZvL2xpbnV4LWYyZnMt
ZGV2ZWwK
