Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id CB90C6D1573
	for <lists+linux-f2fs-devel@lfdr.de>; Fri, 31 Mar 2023 04:04:25 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1pi47n-0007wB-E9;
	Fri, 31 Mar 2023 02:04:20 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <shengyong@oppo.com>) id 1pi47l-0007w4-P8
 for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 31 Mar 2023 02:04:19 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=MIME-Version:Content-Transfer-Encoding:Content-Type
 :In-Reply-To:From:References:Cc:To:Subject:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=m5KMu5gYXKcFL8cSlHpUbxdcLr5Db8D2yeDxnKEamNE=; b=i8xe/Fq7FOVu9B/4cwWB4qeDtX
 CkavlqRxRIieUI5uXomqMVhs7eFMhKx3/hQph0STag7xGuN2eFMbd+YevXVZWXcsAVD+3dKxzcPrG
 exqI/lYJWJ4yyIGL/x4Vk8lEMsZJIUcql1v4PGbq0njMLkpQj9J+cKKQBJ0q7plmtleg=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=MIME-Version:Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
 References:Cc:To:Subject:Date:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=m5KMu5gYXKcFL8cSlHpUbxdcLr5Db8D2yeDxnKEamNE=; b=VaMIqbnhbhsirmqofF6Cv29Gh9
 C1d2EqKiEyoHI6/BTuztqM/l6ZH9qIAccXlkxdT6MiJwRv/xJvUugN0ITxdW6dmOkKClC+SH+Jiqn
 ZS04YL0iseP4prQK61jz2mawFLWxDxECpgRaUoym14NnEjIzTkLNx71J5M7j4tYdUqJQ=;
Received: from mail-sgaapc01on2055.outbound.protection.outlook.com
 ([40.107.215.55] helo=APC01-SG2-obe.outbound.protection.outlook.com)
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1pi47i-00ALqy-Dj for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 31 Mar 2023 02:04:18 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=SNBQCH17j0dzIqIj1/3ZVXHVfC/ciBk5X1zsusESDwvEjLyg0V+DEzPPpDHil1L03IndH/InuEnljfP7+u4HGNiXWSZVPjUx43OoDKSEkcTUwV0bZSYC8HygHImKe/wb0B7tRPVv4yD6WM/DCP9j72j/coN9cCi3ETT2rOFM/ArNaPuYfL7MZgJEcVUrlUM5VKzogEfFny3dlGKuN3RPMOpi8919d11shKqgdon/gP3OrId2KWWAnyNv61knyhdMP/e8QMet7am1aDZYW6sGfa9ej4QvEv0x5gfAQa8mSTIf83t71+dES+AeCK3OTJ+PusuNJBILK8k8kZM4aIZX8Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=m5KMu5gYXKcFL8cSlHpUbxdcLr5Db8D2yeDxnKEamNE=;
 b=GmJteXAjbAe1+bJDz4J6+1H8jKYVjeobfJiKTgal3YWykqUrlzLCqLgTCVb+BoWWn51lN/HiALdli32Acj7+mM7FyYGFFJLE+HVEAE57/bhWo6zA/5HQkpk6TvtWdsUv8hzDeMwpVQti2nriqy1PwBaeh6IIaOBfMFS8f7nSDRhZYYAwXpH313nNykK7Hkq9H2wmduP65M0l7D984vFMVSEjPF0TAxtogpiFAT0E1dUMrXEWjsSBnsNnHDPfbTinvuMUMnjbihFtiwnkXU2V5UyCIBdjN1D1QEw2m9hSQH6tvZEZb8I+uEL8itLnQbGqoJx8r4joFKXyrIaA/Dn76w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oppo.com; dmarc=pass action=none header.from=oppo.com;
 dkim=pass header.d=oppo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oppo.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=m5KMu5gYXKcFL8cSlHpUbxdcLr5Db8D2yeDxnKEamNE=;
 b=rMCRIalqgQE2C5a0XWqphb2+lFy3WTVqD7mhbVXXmmYuNywFIzAOUhRmuCWbDrRaU/uwfzA51q0g7KaSvZ8jnl4bwRUPOsWIry0VhSGYmzFHS0pEPfd0ZJAnpTO+xzRgnFOACFCNqg28UZagCgNblLfjb+yUgNLyR+RedoaJ0d0=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oppo.com;
Received: from SI2PR02MB5148.apcprd02.prod.outlook.com (2603:1096:4:153::6) by
 PUZPR02MB6307.apcprd02.prod.outlook.com (2603:1096:301:f9::12) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6254.23; Fri, 31 Mar 2023 01:30:52 +0000
Received: from SI2PR02MB5148.apcprd02.prod.outlook.com
 ([fe80::9a8c:cd43:d810:b523]) by SI2PR02MB5148.apcprd02.prod.outlook.com
 ([fe80::9a8c:cd43:d810:b523%3]) with mapi id 15.20.6254.021; Fri, 31 Mar 2023
 01:30:51 +0000
Message-ID: <6d7ce8e0-216c-0d53-6d13-e33be6365a2f@oppo.com>
Date: Fri, 31 Mar 2023 09:30:47 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
To: Yangtao Li <frank.li@vivo.com>, linux-f2fs-devel@lists.sourceforge.net
References: <20230330153719.3085164-1-shengyong@oppo.com>
 <20230330161538.13233-1-frank.li@vivo.com>
Content-Language: en-US
In-Reply-To: <20230330161538.13233-1-frank.li@vivo.com>
X-ClientProxiedBy: SI2PR01CA0045.apcprd01.prod.exchangelabs.com
 (2603:1096:4:193::19) To SI2PR02MB5148.apcprd02.prod.outlook.com
 (2603:1096:4:153::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SI2PR02MB5148:EE_|PUZPR02MB6307:EE_
X-MS-Office365-Filtering-Correlation-Id: 158f05c8-9a40-4a57-4f4c-08db31879016
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: xV8TbqmQlZ6+fLWWE2LCFZSOot52NRUzpurPrnGYHWIOAicImH4xpxjYF2YmZQYjffHrgMjL7w0bImBm40FsbwsZYJKZyQ+CCCQD8aeOGuT7lhP85DAXfNQS9fhvwZ8ysC2BP1Iv7XGCgkeMhBPda60DABOO7UIkmg/so0zLZNy/z34R7P2KANdyQ/JwnkduU/lxruG0wvS1uuOqR+SjJ7mdSkDChPtSa+FCZ3FsKDq7/agSdtWgQUioxaiGXL6Bk435ErSAt/m5o9wAChI5uuDMBn5whUt/WYLm6SjSXe61t3+47gWFh6RTc4OGXOAtoO2Y2gSsWV7fATJTau2ujkSAdPrU5y8g39J104y+00fcml2+jYd5gUsjBE5tnn6Ueg+s3FF7YEqlEJNZA9XrP7G8xMB/h18xE0ATACvIKP4WcGJRkTZmHe8iv/Zuu+HhOMhmtVE4oCj5cwezXSkWxHeiZW2ozF6ALsVeXzh907xe50rFj5mWwxBbSGE1z+iErN7KBaAR34kgjrqsehgFfq4wmMRSeiaHtrviz287XPI5I5+K1e2kZh0y60yVfMlwL+21w3UADhcgkcqU4ZpyY5xtJf+cvgPh2TCGLIgD+UPl8pXLsUuAoJQRJ8SDETRc
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SI2PR02MB5148.apcprd02.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(4636009)(346002)(376002)(39860400002)(136003)(366004)(396003)(451199021)(478600001)(83380400001)(316002)(26005)(6512007)(186003)(53546011)(6506007)(2616005)(38100700002)(86362001)(31696002)(6666004)(36756003)(966005)(41300700001)(6486002)(4744005)(2906002)(66946007)(66476007)(66556008)(4326008)(31686004)(8936002)(8676002)(5660300002)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?cjdoOXZuR3BTOEpFK3FuTVQ3eTFRUG9DLzRHZHVtZjhJbk9oYk12M1JNdnZm?=
 =?utf-8?B?ZHpDV3R0NXd4bGxPMHk1SWZqbU9sQUdkVEllZVllTmpLNkIxOGlXUU1DL1FW?=
 =?utf-8?B?NXA0bkZOWE9UT0N4K3B1aUlMQ0NCZElvd1FjcjRxbWU5S1Nabmt1WmUyMlB6?=
 =?utf-8?B?emo4ME8ySTBSSURJZytmaHFMVVZZbnFlbnFjSXI0M25hRDZ6MG40ZXFKM2M2?=
 =?utf-8?B?UElnOGhSdkNramZra1BvQy84cnF3cVJiaEdFOW5kUGN5cC84NksrUG95L3gx?=
 =?utf-8?B?Q0xuNmpUMWhIazJIL3NpMnN6MGdqK2xwY2pobTFzMFdtZkFVTkYycjYxb0dL?=
 =?utf-8?B?WUpRRGxQbjdtbktjVmpGek05QzVMcXk0REpheE84MDlIc1p4M3kvTndrK3JM?=
 =?utf-8?B?cXNab3I3dXV0ZVpRWnpSNzBtbjcrL0VlU2kxaDMvckpLNU13WTZmTXRZbkFr?=
 =?utf-8?B?S2ZiSmYwZ1gvOEhsUDhvaVV1bnV4VmplODFPMVZTSTNXVTQ1UEtaeFNScG1j?=
 =?utf-8?B?bVZSVXQ2cUlYbkRKVXJXdXJqV25xdGNOS3VmbW1ZK0N6MGpGTjFEUVBJbFpF?=
 =?utf-8?B?RlY3dnI4eWZLWEM1YlhxUXFobXZ4Qi9KMzBLa0JIMGdHV0d1bFBzenVwQXlP?=
 =?utf-8?B?Rk84Rm1WZEE4K0ZZTVVoOXJLVytSL0pYeGs2N1IrYWc2S3NwcmxMSmRhaTVs?=
 =?utf-8?B?dzlWWEtFQkQ3WmlscEtOb0tzdXdJcnNhUHFybDF5Z01UNG4vbmFORjc5Yzhv?=
 =?utf-8?B?S3JMaFlZMXVKR1crRlNSTXZmejFFN1cxWmFYMld3QVBSNU16Y1MyWThXdjZU?=
 =?utf-8?B?R2UrTzNRcjhyc2dUcisyd3h6cmxXdVlBVFg1eFRvbDBUcFlYRGJLbnF2bWUv?=
 =?utf-8?B?RmFBTkhjZ2Rnb3Zwc0ZYbjA3R25YSTV3djQvQ25ZdHVIb0xhdTA1NytpeUc2?=
 =?utf-8?B?bGlMWml3MVhOSS94TUlrbldoS0ptVTZmYkh6c3hmY2dEbUFJODNtemhyVzJs?=
 =?utf-8?B?R3lRTC9vNmRESEZ0K0g0YWE1SzkxNUl2Zk92cFhRT3ZadG5ldUsrOUNVWHdn?=
 =?utf-8?B?Mk9DRXZwZ0xZWlMwNFdQOTZBaHJRK0VKUFY2L01BRDBlMlZYeVBWV3pYeFRP?=
 =?utf-8?B?cElkTVV6SHRYeFpOUVQzVExWQXMrZ3Z3YkFpNWwvWmo4MGVMa2hBWDE3bC9V?=
 =?utf-8?B?VEliRWpiUkRLNGZTdml6L2VMVGRqZnJrTTBMY1duSGNnUTF2aDQyb3VwZEp5?=
 =?utf-8?B?NkVwNU5GRU5OZk1wU1JvYWlrUEgwdmRzMmYxcWJHNGV6bXdKTnpxVDlDQTd0?=
 =?utf-8?B?T21YNEFjMmpWblRpSUZLRk1kSW9DbDBJWEJmbVNCaXBhSnk5SEluNFlxT1cw?=
 =?utf-8?B?dmN2eDVKTnplTlQrTmY0Z0lyN0tiVGZmaGhpNDBodEhRakoxSWRSSS9TekhF?=
 =?utf-8?B?eHhCZXJhVEhGRE1kazkyRy9VV1dTWlRMQmo4cXgzSzRGMW9hQ2l1ZW5WVVVu?=
 =?utf-8?B?eG1rN3lUdlVpMUM0T056MmZqNzNIdzk4Z0JqUmt5cjJ6UHljRXVvRHZmc1pU?=
 =?utf-8?B?UlBUUXpjaHRCd3hyRllDcFRxbjRjMjlvemRCRkY0NVFvRkk2MHF0S3pGbmRk?=
 =?utf-8?B?dExYZkpDWlJHUURzZGJqSXZWaS8rSEpmbkswVTcySG9DNzJvRXBOQXdDOW5w?=
 =?utf-8?B?b05McGM4ZXNTWEhMbmRob3d0SzZQVXNOR3drRWR1YUI4WTVYWU9OVDJHekFD?=
 =?utf-8?B?bnUvbWk2MWptREpGWTJYaUdibUlyTXFyK1UzbmtGTG5OcmZiRkxZb3dNVy9h?=
 =?utf-8?B?SW9hd2tCbllBZGtISEI5T2xTVzZZVVZIV09BSGVsdkRqQ1B6aFg1VmxzaGRa?=
 =?utf-8?B?dWUxL0xoeTYzcSt1SFFHYUp6Zzgra1J4NTFtQkRyZ0hLc3k4RS9wbzZ0Z0ls?=
 =?utf-8?B?NkpTcU16KzRtODlLWkxIMUNiNEdyNTB3bFdxU280VXYrSTBYOGM1SE1nUWNk?=
 =?utf-8?B?YzdoVEZoMXRCSEcyQmdFS3h0RU0zQ1h5SWRZVTRnK3dqTXZrN1Vmb0JnZHFy?=
 =?utf-8?B?dTlGWmtsYStGci9scWpVa0VEdDVkeW9vS0RHNUYycmowaE1YT05LOWtxR1pj?=
 =?utf-8?Q?i9M2HnP/5MzAHH4Nmj9/5tJ+1?=
X-OriginatorOrg: oppo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 158f05c8-9a40-4a57-4f4c-08db31879016
X-MS-Exchange-CrossTenant-AuthSource: SI2PR02MB5148.apcprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Mar 2023 01:30:51.3828 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f1905eb1-c353-41c5-9516-62b4a54b5ee6
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: XTfNO5qGPbMVPpY3RR9N7zujDa64D8BJ8qWkfubshmE9iSZsrDZJuB9H7SlZeWKziYqJSZwmORmuP5NrcGkA4g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PUZPR02MB6307
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 2023/3/31 0:15, Yangtao Li wrote: > Hi Sheng Yong, > >
 Your idea, I also put forward before. > > And has been sent to version 2,
 but Chao and Jaegeuk have no comments yet. > Time to talk about the [...] 
 Content analysis details:   (-0.2 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [40.107.215.55 listed in wl.mailspike.net]
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
 no trust [40.107.215.55 listed in list.dnswl.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.0 SPF_HELO_PASS          SPF: HELO matches SPF record
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid -0.0 NICE_REPLY_A           Looks like a legit reply (A)
X-Headers-End: 1pi47i-00ALqy-Dj
Subject: Re: [f2fs-dev] [RFC PATCH] f2fs: expand f2fs_compr_option to allow
 ioctl setting compression level
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
Cc: jaegeuk@kernel.org, linux-kernel@vger.kernel.org
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net



On 2023/3/31 0:15, Yangtao Li wrote:
> Hi Sheng Yong,
> 
> Your idea, I also put forward before.
> 
> And has been sent to version 2, but Chao and Jaegeuk have no comments yet.
> Time to talk about the series?
> 
> https://lore.kernel.org/linux-f2fs-devel/20230112133503.16802-1-frank.li@vivo.com/
> 
Hi, Yangtao

Thanks for giving me the information. The f2fs_comp_option_v2 could also help
to get/set more options for compression. And I suggest to add a version or size
at the beginning of the struct so that it is easy to expand the struct in the
future.

Thanks,
shengyong

> Thx,
> Yangtao


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
