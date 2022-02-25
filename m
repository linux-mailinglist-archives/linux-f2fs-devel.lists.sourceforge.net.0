Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B3494C3AD9
	for <lists+linux-f2fs-devel@lfdr.de>; Fri, 25 Feb 2022 02:24:31 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.94.2)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1nNPLO-00066r-Ra; Fri, 25 Feb 2022 01:24:25 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <chao.yu@oppo.com>) id 1nNPLM-00066g-OO
 for linux-f2fs-devel@lists.sourceforge.net; Fri, 25 Feb 2022 01:24:23 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=MIME-Version:Content-Transfer-Encoding:Content-Type
 :In-Reply-To:From:References:Cc:To:Subject:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=TN2eGYIGUdBWJuWQCufz1iNK8GG8lItzumFv19ugFOU=; b=Wyb7NPXvHgl6kvQ1p/CCPXjJ08
 cZ9X8L1m/LCsOVfOZ0zTde5rvEzEkVHuzEdtv/FTNC5dfOS86QUZ4acAPD2w8uhTM9KzmSZkTgGpi
 7zNOBUW0/KCSZZNg45aVf0sAqc7RRhLHlzJXSZbhH0lvlJpPYnzFUpOrF9mG792QCtvM=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=MIME-Version:Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
 References:Cc:To:Subject:Date:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=TN2eGYIGUdBWJuWQCufz1iNK8GG8lItzumFv19ugFOU=; b=hFq+f3NCsYntHybdAPhxjPGOQf
 6rPWgbORBTksYK8PqNPxavaFtlQstvoPxT1bl3Nywq3JqRR5yRefe/tvJEaYn+0rAEMqNavZ8kaWG
 FJ8FrEb/lS/Gga0OkUXDEiYQy8PkxWECsmkCbfeKMJ5F6Au/7OD2yRt00Nm8PAAmAVmE=;
Received: from mail-sgaapc01on2061.outbound.protection.outlook.com
 ([40.107.215.61] helo=APC01-SG2-obe.outbound.protection.outlook.com)
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.94.2)
 id 1nNPLC-00073M-Mo
 for linux-f2fs-devel@lists.sourceforge.net; Fri, 25 Feb 2022 01:24:23 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=W4bbaHdOEzQmwa0XaBBG2WSJA1RQ5L/7QrgjogjDdN0gViXLeBduazrqZev5fpKEoX96ZLbdQJRQGgJp3VrF1pcSfBdb2UTFbqj5QZyHWBIH+1P7Z7hZV3qLshEpIOTRTu4rLhmaPwuEh8cqLrz5jrXIkNlgX+wiSL/BCo/rHKy1oC12OIH5sit+FZNMR4iYUlfONgSBzDU73Y9FPXm5QlcsHRTltM5pDaknekcUn+ICxFGX75CE06nZDPN91ecsA5NrwWvAbKQEK5z4m9HkAKFOig6f1KVtxlzktBJE0LXLE0x3pXDkrs0NaYChhFbGiG4UWaBT4pHCAo6pkIKuAg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=TN2eGYIGUdBWJuWQCufz1iNK8GG8lItzumFv19ugFOU=;
 b=JeCRK1j29QrqeZjrAOquiqWtYK9Tok5ztsjMSq+AFRwBApTpRsDU6213IuEsKYFCFUj6nzwF9XHmvVxlbvHyBmRc1WtMwFyRN7R3dU95M8FoSwDbuH01BHQraHx7MDWWdNn7MP0W+H8LeWmG9EPxtwNOW/KRKetMSNRP7w+uh40naM7Z1BsNl9MgXJUAO9/Yqq1GB0mik7xVOSufeA73rjI6ycYpzVN1RRqpQi/e5R9dVrFTAN2jdpL+xI/3cHDg/8zYOa85ojFuqm+q8yhsrMuEUlncOyqJJefGAp8jklnAZgMnvkrS8vCf4ImlwzptR91rpzyHwKdemcfwpInFlQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oppo.com; dmarc=pass action=none header.from=oppo.com;
 dkim=pass header.d=oppo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oppo.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=TN2eGYIGUdBWJuWQCufz1iNK8GG8lItzumFv19ugFOU=;
 b=RlHJp5vfsOxSjOhtGB0T6fsTgtf+dpxlewQp6p8UMO2laP4MUQQf3hA6Ltji9nhvgGL3W1fmgarDyAURCjYPi1s/U2NdMwN8P6zFUaFFMarsEQcN64Q0RHn/TtkBA3Hk3UOlqBpE2SrLSgi8v/p53Y1Nmmj9iCQ1zqH1DounjWE=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oppo.com;
Received: from TY2PR02MB3165.apcprd02.prod.outlook.com (2603:1096:404:4f::13)
 by KL1PR02MB4705.apcprd02.prod.outlook.com (2603:1096:820:3b::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5017.25; Fri, 25 Feb
 2022 01:24:05 +0000
Received: from TY2PR02MB3165.apcprd02.prod.outlook.com
 ([fe80::cc04:c674:b67b:baac]) by TY2PR02MB3165.apcprd02.prod.outlook.com
 ([fe80::cc04:c674:b67b:baac%6]) with mapi id 15.20.5017.024; Fri, 25 Feb 2022
 01:24:05 +0000
Message-ID: <12abac3b-1a37-e35d-e0c5-bc86f76b77f3@oppo.com>
Date: Fri, 25 Feb 2022 09:24:01 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.0
Content-Language: en-US
To: Sun Ke <sunke32@huawei.com>, fstests@vger.kernel.org, guan@eryu.me
References: <20220208071624.1095904-1-sunke32@huawei.com>
In-Reply-To: <20220208071624.1095904-1-sunke32@huawei.com>
X-ClientProxiedBy: HK2PR03CA0050.apcprd03.prod.outlook.com
 (2603:1096:202:17::20) To TY2PR02MB3165.apcprd02.prod.outlook.com
 (2603:1096:404:4f::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: e4680252-2dcb-4acd-6181-08d9f7fd830e
X-MS-TrafficTypeDiagnostic: KL1PR02MB4705:EE_
X-Microsoft-Antispam-PRVS: <KL1PR02MB4705F569504CD28F2C8856C8923E9@KL1PR02MB4705.apcprd02.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: gfwJiI0AkvKk+Fe/z8TZeZch41qLVD9Nkzp7S7FBsY+HnQvRunpJ2deIhu+I1Q7WJwIlbrc+c5+1cZvPATBUQ7pvtR5T7PSqa7HOWvC0G9NHjsNG92xTsOmZk8uc3wWdl3yNFwMlyxh4hRvUDZsBUQlmh+45bh9sk78JbVn+qn9CWIC6RMoe8BJAi9E/rZ8FtaC9tzPmPWrZzkc2L92ErZCdUCwPqdlak5GeJupb7jJ90Bdr9gyVqp5BQ0B9UJX4ICY/ule8w4DhGGHb8PavW2c+A1bnPTuhDtGmB/pJSt+FhkXHmCX2nliZuNhw7WeBYq20IcZtkproo/E2j6eR/5q+VoinMk9PabvfnvuVSGPHVZ3uLdEYGlN9+lo8WZC1m2NfAyWEZ5VwmulAIyNpkrRIsp4TW78sOVlfelFUG66bQ26qiWH3UgUgHqsB1JFcnxYbqCUaBg6Z36gMLmRuhpGoHYTEwprxH0gYM9b3f0FYKzC0BM7y/2BlBk2ioUZm5P3BD9FM3dzlpdsLyJ0MlA+hEGss3t39tJOhtIoJRWyt2MYt8F9yLYS0ajoETMHapfFLaZ8OtJTzdXDj5KUsoGDqZRvmu+llLoG5CMQeu2fXuqeHd6IdRrYiipKqlUV7gxH5QH3vg0lgcpaa/unIbj0I/24Ep+IGDgfopkwgQZV6gJm0qBsWOCErbIqrVCtQOCUNxS1HBAohQNpkihaKbK4adk7SKZRRPisvoCl2Kqy+1a3ibASzmdQ5h+4nyFkgzpka5zWTuqCOhL2vCzjN9Q==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:TY2PR02MB3165.apcprd02.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(4636009)(366004)(6506007)(316002)(52116002)(53546011)(8936002)(4744005)(44832011)(26005)(186003)(6512007)(83380400001)(6666004)(5660300002)(38350700002)(38100700002)(2616005)(31686004)(6486002)(66946007)(2906002)(4326008)(8676002)(31696002)(66476007)(66556008)(86362001)(36756003)(508600001)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?OVR6emNZQ25HSDFvUmZ0T2hIRmVsMFNGaXcrdmdlQmlFVWExUmxHTENIOU5F?=
 =?utf-8?B?ZGVUbkFIdkErVHJjQUJUMDBLTXVEUjdURGl3NWFabzZiY3hJU05HbDJwYVZz?=
 =?utf-8?B?eC9wTXlneTdrVmxSb3MzcVJaOXFIakF1TVlLL3E4NlkvQ3FmdmtzZkJsT1JK?=
 =?utf-8?B?emlyZHErT0hNbWZxc0NXRm85akloQk9DcThHK2hFY1A3Wldka1JtbTNhUmdR?=
 =?utf-8?B?NEJGSDZVUHhsdHF0aURzWFlwRmNvV2E1WXgxaDRWMXp5S3ZsMnd1WDRHejhR?=
 =?utf-8?B?N0FRUkxjMVpVVlZIdkJrZ2RhaGNiNDV6b21uSTc1L29oMktROXlGQVdUMzhz?=
 =?utf-8?B?eUFOVGFMWCtubWtyeHN3eXBqWTE1cy9BbUhRdUVDcndFTjFwQ2xHWEdSQXZy?=
 =?utf-8?B?REZwcUdYbE5pRTVldmZCNktISThTbkR1NnA3RVRBZTZsdDNiUlFsNDNnNytD?=
 =?utf-8?B?bENQK1hTUWhJVnJMbWtLRXBzSWNOZlBPdEVjaEhiY0I1bzhZVU5vcGJQeXBI?=
 =?utf-8?B?bGlycWpraEIvcitTdUlnWTVMVTJ4Y2VSNHhEL3RkK3VNb1hXbVMrL0VYdHFq?=
 =?utf-8?B?RUcvUElxSzFSYW5BTWs3d1FYTWc0eXBuQUpTZUNSSWVSYTNwS3BwVHVjYytr?=
 =?utf-8?B?NTZ4TDJSSnhNbmx5ZlBtY2E1QmJWekFJZ285Z2x6TTRCM3ppZVRHWHVUZ3Zh?=
 =?utf-8?B?ekNvU1V1Y29jenJHNm82a3dNUk5hMTRRd0RYQ1hOenhNV01pNVlGTjFDLzgr?=
 =?utf-8?B?WlE2Qm9jSmdZU2hpTjNmUHBsZmVGdjlBNlc2VEFWdWJWRXNnYS9TYkEvUFk3?=
 =?utf-8?B?WCszdzdBZTltU29kS0k5aHkzNXdQdmMwMHFSdnJ0VVA3cVAxaWs1RkFtdXZR?=
 =?utf-8?B?TllMUzBCMWY5OFl0SVBqeGhETThTQU4wOUlxOVhpN2dxRVMzMS8wWGZRSjhp?=
 =?utf-8?B?RGRsSC83VE51cGtDektJUnlJVEtjTExzWVV6OG1NUlJJM1V1MG1vemRsVjhJ?=
 =?utf-8?B?WWVmMjFLLzB3YVpPWm5yYlZ0NVBlYVplOWpGdm55TlVIcTgvTmQ5SUh3Vi9K?=
 =?utf-8?B?YldSZkVWRU9Cemc0aUsvaGpSdkJST3kxNWJteUcxY3ZtV2MvZXJ5VTJRTDZM?=
 =?utf-8?B?cDQ5LzZydlFVNGRJcHFhc2dsVXZlMGRNSTZYdnI0ZlFwZ0tvdU8xWmZBdDZK?=
 =?utf-8?B?bUZOSmlhdkxiRnN5bWJBdWVWbVdNYUM5d3JhcEFTd3d0a1FhTmZGUkJKU2h0?=
 =?utf-8?B?cGdZZTZEVDVranQ1Uk5RWVpTMzhYa1VSNVMrVnN4a0dvZXdsSnhJajNkM3di?=
 =?utf-8?B?TTZMK01zZUVxbVozYm04RVhZampiNVVKdks2SjZoRlBHb3BUazAxTkQ0WTVv?=
 =?utf-8?B?R2V3MFYrRktpTUFnRUprekh5QTV3QlpsUUt0eVVtVVVrblRnUnc0OGlFZi81?=
 =?utf-8?B?d3Y3ZHBpYTZiZ0Y1Ty9HbzlPd1p6QjhEOVhkbURGdElHUTd6SUp6bVJoNHgz?=
 =?utf-8?B?QWxpNUJRTC9kL2g2cDdSRkFWMFIrSUdSQ1l5QUJkWVV2VURvdmhYV216bkYr?=
 =?utf-8?B?MDk5a0l2MXp1SUdVUDh3cTF4YXQ4RHZjY1ZuaWxPT1Rjck8rWDFsdERINW9o?=
 =?utf-8?B?K3hzK1FQaDgrU09GMXZQQVhBY0hFS1k0WEh3OE10NEpzK25YaWlrcFBGMHJY?=
 =?utf-8?B?VnNWOWdkcGh1OWZmaWhtcVljeG0zV1J1ZUkwQXh2cWFVSnU4YXJiaktKVkt3?=
 =?utf-8?B?S05zZlRFN3B0VmtQRHM4SGwrbVNyd1ZkbGtlayszM2x2cUdxNlR2OFg3cU9V?=
 =?utf-8?B?aGxsVzlPWTdXMWNUOWgyS0VHN0MzU1lZK2hYai9UZ0cwWFZGMHlTeHBpT0sw?=
 =?utf-8?B?SVpsVGtOb0gyVHduYVg1dnNMQmNBazZSalZQQ3dBdi83Qnh2d2ttY3crV3Nt?=
 =?utf-8?B?MWZ5ODRlWXU2dm8zb0c0VjdpVlpKZHppaEQySjhmWVNJUEh5bllDMlN5TC9E?=
 =?utf-8?B?TTIzdnhnQWQ5MDBQdXYzdEJhSEIweGZFL3JheDFRdC91RzlxZWRwc3J1ZmNS?=
 =?utf-8?B?ZnR5M1NpNG1Ma3lZbkVwVjlhMlUycVR4blFtN1ZVQWZhd1VLUmFiMjdYeTRu?=
 =?utf-8?B?c2xIZUNwV09FYUFhaTJESEg4NENTZmNFWFdlR0hZUlBSNU9KSEZGWjBiWkpF?=
 =?utf-8?Q?f2kk8NPGh8KSkcFtzXUkvWo=3D?=
X-OriginatorOrg: oppo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e4680252-2dcb-4acd-6181-08d9f7fd830e
X-MS-Exchange-CrossTenant-AuthSource: TY2PR02MB3165.apcprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Feb 2022 01:24:05.1867 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f1905eb1-c353-41c5-9516-62b4a54b5ee6
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: YgIo8sS9yVs4PcmPkEHNzG1Eju1q8YADQD/CizbYxyBg4fkHkzeCArgkuRZ3tym3UMb10ag+zxWVQxiZ5/4NIA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: KL1PR02MB4705
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 2022/2/8 15:16, Sun Ke via Linux-f2fs-devel wrote: > f2fs
 has set inline_xattr as a default option, and introduced a new > option named
 'noinline_xattr' for disabling default inline_xattr option. > [...] 
 Content analysis details:   (-0.2 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [40.107.215.61 listed in wl.mailspike.net]
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
 no trust [40.107.215.61 listed in list.dnswl.org]
 -0.0 SPF_HELO_PASS          SPF: HELO matches SPF record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid -0.0 T_SCC_BODY_TEXT_LINE   No description available.
 -0.0 NICE_REPLY_A           Looks like a legit reply (A)
X-Headers-End: 1nNPLC-00073M-Mo
Subject: Re: [f2fs-dev] [PATCH] common/attr: adbjust acl_max of f2fs
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
From: Chao Yu via Linux-f2fs-devel <linux-f2fs-devel@lists.sourceforge.net>
Reply-To: Chao Yu <chao.yu@oppo.com>
Cc: linux-f2fs-devel@lists.sourceforge.net
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On 2022/2/8 15:16, Sun Ke via Linux-f2fs-devel wrote:
> f2fs has set inline_xattr as a default option, and introduced a new
> option named 'noinline_xattr' for disabling default inline_xattr option.
> So in _acl_get_max we need to check 'noinline_xattr' string in fs
> option, otherwise we may select the wrong max acl number since we always
> found the string 'inline_xattr' in fs option.
> 
> Additionally, f2fs has changed disk layout of xattr block a bit, so will
> contain one more entry in both inline and noinline xattr inode, this
> patch will modify the max acl number to adjust it.
> 
> Suggested-by: Chao Yu <chao@kernel.org>
> Signed-off-by: Sun Ke <sunke32@huawei.com>

Reviewed-by: Chao Yu <chao@kernel.org>

Thanks,


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
