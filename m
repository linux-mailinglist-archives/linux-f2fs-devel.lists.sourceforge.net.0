Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id F1A45627434
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 14 Nov 2022 02:43:35 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1ouOVV-0006Zv-8r;
	Mon, 14 Nov 2022 01:43:29 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <shengyong@oppo.com>) id 1ouOVT-0006Zp-QY
 for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 14 Nov 2022 01:43:27 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=MIME-Version:Content-Transfer-Encoding:Content-Type
 :In-Reply-To:From:References:Cc:To:Subject:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=CkiXB+KSJpPaRizUuHMOb48ZUVCVB5ifHSu5kTUFGLs=; b=LUv6ilM+/+nL8rPlL2jvGv+HrM
 +aBUgFrSTQuKtdi9+B0OuH1SzLcopqssSCfIPnEk4E40DkSe09Evyc8HjI9blPj1wmjW12D5+aVwM
 dAx5TPIAESD8/t3cPHkKDyfL+bt4gUFn6H3nbv/pSSR2DBMz6P/nOXf0wTPThM22jvws=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=MIME-Version:Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
 References:Cc:To:Subject:Date:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=CkiXB+KSJpPaRizUuHMOb48ZUVCVB5ifHSu5kTUFGLs=; b=lR5art5MMhf9zI3r5hogtc65tq
 EtVonUkyaJ9NOd7d1ZzjbNoOo92srraqBL7eIF8RDSJB87c36pnQe+P6E5yVyVtLzRCBJEXI6tCdS
 28BeplehuUNvC/oaXkG1Yhx9KYw3Ee1YvlbVwHft5Z/ypbO/xLnO29PkGShmfmsHVRgU=;
Received: from mail-tyzapc01on2068.outbound.protection.outlook.com
 ([40.107.117.68] helo=APC01-TYZ-obe.outbound.protection.outlook.com)
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1ouOVL-0000h6-7t for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 14 Nov 2022 01:43:26 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=fnU76cbyFoXjhVXGjxM/c/g7ueTaFTczc5fRuhMAfJtHphs1jiUBfe7+NxiDB0LmVmVGUXiECG/tIfs+NM/ltV248nPW9lGUH33xtLWBz9uhksSL7AFpjg7hzkZSIZ5uGifFkqAiQq5ZCTyXUYnPwACxjKKh7NCJu7UP/V2ZwKYiLGDplqfyE2PX4Zdqvjb3Di0jcQe1B5S7mjF4Emgv/d7aly78rt30H3SCnN5o3WiYHQcDv4FsGYTEC5pjxgTn+eDShkZfKNFMp4jP2HPpQUDRJANzjvwriOd7whZ6BqUz2xbzPzPSEesz8ynLbZ3B20i6NF48is33mTayecz44A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=CkiXB+KSJpPaRizUuHMOb48ZUVCVB5ifHSu5kTUFGLs=;
 b=TnxAfLZVvYngUB8AdiiFvcPCRqcOExfuGcP80WghO2f2uvvHb8crhxUb7s/n2eEQeI8AurYBPA8ifpSEBPLoOdWz5Ptrr/sCLHwgXWINPVdFfX459A2JVAfAGjMdYwjEEKXa9148e2PnoK8C4uYC/WUbZwRCiJ5RBz/q6wd9AE9myEYYxGPzEXbQGnJr3ZVaZ3XD7qYtaMVtvBu2atAAGqxpu841Pu6QPbGuxsi8sJigzjS68bGW9RyPHFMC1tauldk5k7IHqcqadLVCcoy74it1lznCtXk2awEo/k02D109+J9WdZcc8Aa/TVAGW3ucF+ntif+sJdkEECO//LrpyA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oppo.com; dmarc=pass action=none header.from=oppo.com;
 dkim=pass header.d=oppo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oppo.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CkiXB+KSJpPaRizUuHMOb48ZUVCVB5ifHSu5kTUFGLs=;
 b=a544cRARu2+/VaZGCnp2pyczCerd8E/w4CEywKOYmH7U9SIKBcI6timGTcaXoXn/etyOGO0DosBN+qOXC8S34PDRs+IQIsMkcuYO3RPWWubVZw71+/pdNsJyrKVfYYiTJHHKM/MTpCpUlVtgD3ydsDd00z33Jf3Ynk4e9vsH8Yo=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oppo.com;
Received: from SI2PR02MB5148.apcprd02.prod.outlook.com (2603:1096:4:153::6) by
 SEZPR02MB6078.apcprd02.prod.outlook.com (2603:1096:101:95::11) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5813.15; Mon, 14 Nov 2022 01:42:55 +0000
Received: from SI2PR02MB5148.apcprd02.prod.outlook.com
 ([fe80::2954:8e56:dcd1:452c]) by SI2PR02MB5148.apcprd02.prod.outlook.com
 ([fe80::2954:8e56:dcd1:452c%3]) with mapi id 15.20.5813.017; Mon, 14 Nov 2022
 01:42:55 +0000
Message-ID: <0119143d-6841-761f-93c1-159f424ee5e0@oppo.com>
Date: Mon, 14 Nov 2022 09:42:52 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Content-Language: en-US
To: Jaegeuk Kim <jaegeuk@kernel.org>
References: <20221111100830.953733-1-shengyong@oppo.com>
 <Y272nVjzr6CynmyQ@google.com>
In-Reply-To: <Y272nVjzr6CynmyQ@google.com>
X-ClientProxiedBy: SI2PR02CA0019.apcprd02.prod.outlook.com
 (2603:1096:4:195::13) To SI2PR02MB5148.apcprd02.prod.outlook.com
 (2603:1096:4:153::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SI2PR02MB5148:EE_|SEZPR02MB6078:EE_
X-MS-Office365-Filtering-Correlation-Id: 88d24e6d-b537-4e4f-9547-08dac5e18d3b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: lQI4tmfQTS2AwMDzTTIeZzlFMxXaBt3hUB8YB97SbAy9Qm0FUZE+n1wxY8TC90OU6FZ9Hnq3nJRkpPd0hbNlXPxGRvWqueGCKTBvP8v3ZVp8jDTy7l8/1F0W7yN3bGXpRxcyiZsaYvV3iGJ87BKgv6AnHmTpQrmoXmeupxW4Lzmy5Hfl0N/2YybYjqiDEHCu+GEKNDkxBde5O+77RpuSwYBeReK1Elzvl/8oS8dy2+J7ihEpdhvCk8KHK4hHOaN/W18dvxmJaHE3XHkTdJr83K1K83w7R0AQHS8gExLFsTXlt790aG1Enrip9QJRVD0duSMp2tZSkbRKe4muR7qkuFZ6xWhpk2ybiLfEeM25Hq5Steyav29Y+E3SdQ3JSmhPEfy7YlgvnS7xTH8KXsoj6Y5nXyIxoR2Q/R4PVtQXEN1M/ypJMNDoMdZs4VjMSBNfLV33s0tjKAApT/SMgJpygBcsps2UNt0uc7evXeFXrl+aRH1JSEiAcjrqVPWlPvK8Afb3LtaIMA7oVLno9//vZv3TPWyxII1e3eAbXtPgY9cYRRU9xHoFFP7V9mw07+ZKc4e1OtlIzTymVUcIe9PAqbIcoYTAymm+jke5VTH6UUKU2yLwiiKFCZr34etBcsmuYk45EmGKnrHkG+RpGzeaf2ynD7HWbCe8InxmIe0yvYjvM0eou91XIBeqrMWrcIQIJWJwXuxqeIa4Q40BS7U0cMAVCcST47/GAZnSvRfBIi/9lFXqv1yTt4Wvg2nz7I8t1qOhqpxPTUnidBfKROtmDXJJtLGwXe5RIx4va93NBoHHr77viCrWaVTmyinp0N4H
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SI2PR02MB5148.apcprd02.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(4636009)(376002)(346002)(39860400002)(366004)(396003)(136003)(451199015)(83380400001)(2906002)(31686004)(36756003)(8936002)(41300700001)(86362001)(31696002)(186003)(2616005)(5660300002)(6486002)(966005)(38100700002)(6506007)(6666004)(66556008)(26005)(66476007)(4326008)(66946007)(8676002)(478600001)(6512007)(6916009)(316002)(53546011)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?dDEwMUhWM2REMU1FWkJhOC9iZE0zd2tTT3hrbzgzOWs2Zm5pTFZwYXFXRVoy?=
 =?utf-8?B?bjVETlN2alRwTkRiSHhzd1NpcSt5UUZjblJRSTAwR25sQ0JlMURQRldZaEFl?=
 =?utf-8?B?K2VWV3ZDTW0zbDZZUHErdnYxK3N2MDhtMFpCalVPSnJ0bnJuYjFJY0JtNmZw?=
 =?utf-8?B?Y2xodEJzOE0vbzBrUWwvTkxFWHlGK0Y1VTFxY2hJTFJ6S3czTlJJMm5RL3ph?=
 =?utf-8?B?UW0rVCttUmpZZkttTFoySVgvUTVaa1ZOWjVtYWRRbHUzMVZDTENmU041WlBR?=
 =?utf-8?B?dWlDWTMrUXZYbGY1UHljRWRkU0hyRmVteTVKOHU3Skt4WDVlTi8yZWZMZHNl?=
 =?utf-8?B?MkZqbUVWSjVWSHIyem41cjJVZ2svbW5jeHdDZmd1dFQ2R0JvNWpnL2E0eXNK?=
 =?utf-8?B?amN3UW85dnQ1eWxta3l1UHdoWkkwK3VqT1dONTJ5OUFVWjZMc3ZnenE2Sldp?=
 =?utf-8?B?aDRRSGZidkR1bE5zSkhJZ3FVQmIyQlBSNkJEZ0w0Z0xpcEVWSlY0NkF0Z2Jz?=
 =?utf-8?B?VnB3VnFWeTErMEVDVzJMUXJGQmVmcTk2Zm54Uy9lTHJjTjNOenpIWmJhTVVW?=
 =?utf-8?B?OE81cWExdC9FL1dJZDl5eFVCU29yNGF1azN4QStvcVk3UWt5MWFYUWVReHF0?=
 =?utf-8?B?N2M0NGloam81b1d3ZXFyNC8wK2xubDJvZWhxWDhLelJESUM1d2FVRGFmQis1?=
 =?utf-8?B?WmJhQmdsL2JpdW5RazdaMEFBU3J2UVRybzFCcThJRlE3Q0wyQnl1ZThRSVNn?=
 =?utf-8?B?MzdqOHVMWG1icnBmM3I4SEl0R3NtRTJZRlk5bnQxTFN1aUFLOTFkYURKamEv?=
 =?utf-8?B?ZERCd3krVFFNdW1Nd25EZ2Jqa0FsV29zOStXMmRpNk8wanY3RFYyMDJqOFhB?=
 =?utf-8?B?V3hUUVV1LzJ2dDJKK3FBRWowbmRXNlJoWXd1QXQ1SDg0UXAreW1iT1hYUENY?=
 =?utf-8?B?blNuRk9SWERLUEVBUHhFV1lZNUNMc2RYdllXalR0UitXNGRQNG9jNUJyOTRI?=
 =?utf-8?B?SklHVzFpdDNvQ0tKcGtwRXVLeG1NMUwwWTdkNHFiMUdMbU9mckFML09Hcmdm?=
 =?utf-8?B?VmpFNnpXakVLZERLaXQ3anRZRlZLSGNBM0cxZFNjMXBWbVlSN1VrWXVKeDJo?=
 =?utf-8?B?UFpWMGlQMXN4ZVc4YnJ2TktNcUhaa2E5eFdDRy9JeFBkNDFlU01DZlFkNE0y?=
 =?utf-8?B?YWVQelY1cDhlU2x3a2xiSS9GZjVKU29OQmFuU1N0NlNMY0VZcVorQ2tzT1Zz?=
 =?utf-8?B?T2k3WG8vMEtpZVB0d1EzN0dQTkwwOXNmN3pDZS9ENC9HZ0c4ek15Z1BLYVUy?=
 =?utf-8?B?N0dsRnhCbXBXeFRiRndHeVk3dW5PQTVHREc5Uzd3a2gyUDJFK2x2Qm40L2dU?=
 =?utf-8?B?NnVpYk05UmF6djNXUEJqV2pOUG1kZmlhakJNRUo3OG5Vc1hhcFRwQVhnMkR6?=
 =?utf-8?B?Q2plajlEN0lSMlhoenN6NElGaXR1RVVFRTZQTzRldC93bVVkVjhvUUttb1RZ?=
 =?utf-8?B?V1VIbGlHaktLTDZxaWxKN1JmdXlFeDMxU0ZQNDZmT1lmd1lCYlJsczAyUG5h?=
 =?utf-8?B?VEJDeVE4UnBMUUwvYTVIYlJLSVBjVldSUmp6K2hjNzJFL1FKdnZEQ1ZNMHZC?=
 =?utf-8?B?QU5vckhpa29tT1duUDk2UVFkcmkxQlUyUjJOKzUxam9SY3oxb3ExR211bmFz?=
 =?utf-8?B?cXRaeDdZVEdUTkV5NmxWajA5Tk4yMzNVVU9wNUtHa2Rpc2xKQWFkRDF2a2Jq?=
 =?utf-8?B?Y3Z5cWNkT0hjZVZaZU0yVHBYaTZsUEtHUnRBVjcyL2E2VGEvSk0zTUNyVVBM?=
 =?utf-8?B?MHBETzFUOGpGU1J6RkR6Q2NnazNaTDQwNXNhSVVWWlg4RCtUSVd5cGdaNGov?=
 =?utf-8?B?S01XQVBVY1QwZFB1NUhnMmg2aVl1UEZhQklvd2FwT281aGdnYWdSM2gyZ3JW?=
 =?utf-8?B?L2hXU2w4SFN1eTJ3RVU0dkZ6V1ppWEg0M0IxVW5sZXFOZVAra2VLQk1QTzJn?=
 =?utf-8?B?N1dnbkdOVGE2NDFCSS9oTDFMNThObmo4QzlVTlAweFNKVzA4N00zdW5TcThw?=
 =?utf-8?B?MlFqTlpXenJFL2NIYS85bFJtZmw0Ly9tWElWNTA1dkV1NFZ2dDFTL3hpTS9i?=
 =?utf-8?Q?hRHsLoXzBxOs5O73/hVnW8Fnb?=
X-OriginatorOrg: oppo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 88d24e6d-b537-4e4f-9547-08dac5e18d3b
X-MS-Exchange-CrossTenant-AuthSource: SI2PR02MB5148.apcprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Nov 2022 01:42:55.5089 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f1905eb1-c353-41c5-9516-62b4a54b5ee6
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: C+aEPCywxofsGF5f6F1W4kogbtKkLs8VOyRwwRN0vdcSW/PjznPPWE8ZaPdX6LFUMJ/f2ODZNyosLFGuTImiLA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SEZPR02MB6078
X-Spam-Score: -2.2 (--)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 2022/11/12 9:27,
 Jaegeuk Kim wrote: > Does thes make sense? > >
 https://git.kernel.org/pub/scm/linux/kernel/git/jaegeuk/f2fs.git/commit/?h=dev-test&id=608460dfae20b9d23aa222f7448710a086778222
 > htt [...] 
 Content analysis details:   (-2.2 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
 no trust [40.107.117.68 listed in list.dnswl.org]
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [40.107.117.68 listed in wl.mailspike.net]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.0 SPF_HELO_PASS          SPF: HELO matches SPF record
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -2.0 NICE_REPLY_A           Looks like a legit reply (A)
X-Headers-End: 1ouOVL-0000h6-7t
Subject: Re: [f2fs-dev] [PATCH v2 1/2] f2fs: fix to enable compress for
 newly created file if extension matches
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net



On 2022/11/12 9:27, Jaegeuk Kim wrote:
> Does thes make sense?
> 
> https://git.kernel.org/pub/scm/linux/kernel/git/jaegeuk/f2fs.git/commit/?h=dev-test&id=608460dfae20b9d23aa222f7448710a086778222
> https://git.kernel.org/pub/scm/linux/kernel/git/jaegeuk/f2fs.git/commit/?h=dev-test&id=962379487b5cb9f3b85ea367b130c2c6ca584edf
> 
Hi, Jaegeuk,

Absolutely. Thanks for addressing it.

> Second one is needed to address build error.

Sorry for missing adding a hunk of that patch :(
The above 2 commits are already tested, shall I resend a new patchset?

thanks,
shengyong
> 
> On 11/11, Sheng Yong wrote:
>> If compress_extension is set, and a newly created file matches the
>> extension, the file could be marked as compression file. However,
>> if inline_data is also enabled, there is no chance to check its
>> extension since f2fs_should_compress() always returns false.
>>
>> This patch moves set_compress_inode(), which do extension check, in
>> f2fs_should_compress() to check extensions before setting inline
>> data flag.
>>
>> Fixes: 7165841d578e ("f2fs: fix to check inline_data during compressed inode conversion")
>> Signed-off-by: Sheng Yong <shengyong@oppo.com>
>> ---
>>   fs/f2fs/namei.c | 27 +++++++++++++--------------
>>   1 file changed, 13 insertions(+), 14 deletions(-)
>>
>> ---
>> v1->v2: add filename parameter for f2fs_new_inode, and move
>>          set_compress_inode into f2fs_new_inode
>>
>> diff --git a/fs/f2fs/namei.c b/fs/f2fs/namei.c
>> index e104409c3a0e5..36e251f438568 100644
>> --- a/fs/f2fs/namei.c
>> +++ b/fs/f2fs/namei.c
>> @@ -22,8 +22,12 @@
>>   #include "acl.h"
>>   #include <trace/events/f2fs.h>
>>   
>> +static void set_compress_inode(struct f2fs_sb_info *sbi, struct inode *inode,
>> +						const unsigned char *name);
>> +
>>   static struct inode *f2fs_new_inode(struct user_namespace *mnt_userns,
>> -						struct inode *dir, umode_t mode)
>> +						struct inode *dir, umode_t mode,
>> +						const char *name)
>>   {
>>   	struct f2fs_sb_info *sbi = F2FS_I_SB(dir);
>>   	nid_t ino;
>> @@ -119,6 +123,8 @@ static struct inode *f2fs_new_inode(struct user_namespace *mnt_userns,
>>   		if ((F2FS_I(dir)->i_flags & F2FS_COMPR_FL) &&
>>   					f2fs_may_compress(inode))
>>   			set_compress_context(inode);
>> +		if (name)
>> +			set_compress_inode(sbi, inode, name);
>>   	}
>>   
>>   	/* Should enable inline_data after compression set */
>> @@ -293,8 +299,7 @@ static void set_compress_inode(struct f2fs_sb_info *sbi, struct inode *inode,
>>   	unsigned char noext_cnt = F2FS_OPTION(sbi).nocompress_ext_cnt;
>>   	int i, cold_count, hot_count;
>>   
>> -	if (!f2fs_sb_has_compression(sbi) ||
>> -			F2FS_I(inode)->i_flags & F2FS_NOCOMP_FL ||
>> +	if (F2FS_I(inode)->i_flags & F2FS_NOCOMP_FL ||
>>   			!f2fs_may_compress(inode) ||
>>   			(!ext_cnt && !noext_cnt))
>>   		return;
>> @@ -326,10 +331,6 @@ static void set_compress_inode(struct f2fs_sb_info *sbi, struct inode *inode,
>>   	for (i = 0; i < ext_cnt; i++) {
>>   		if (!is_extension_exist(name, ext[i], false))
>>   			continue;
>> -
>> -		/* Do not use inline_data with compression */
>> -		stat_dec_inline_inode(inode);
>> -		clear_inode_flag(inode, FI_INLINE_DATA);
>>   		set_compress_context(inode);
>>   		return;
>>   	}
>> @@ -352,15 +353,13 @@ static int f2fs_create(struct user_namespace *mnt_userns, struct inode *dir,
>>   	if (err)
>>   		return err;
>>   
>> -	inode = f2fs_new_inode(mnt_userns, dir, mode);
>> +	inode = f2fs_new_inode(mnt_userns, dir, mode, dentry->d_name.name);
>>   	if (IS_ERR(inode))
>>   		return PTR_ERR(inode);
>>   
>>   	if (!test_opt(sbi, DISABLE_EXT_IDENTIFY))
>>   		set_file_temperature(sbi, inode, dentry->d_name.name);
>>   
>> -	set_compress_inode(sbi, inode, dentry->d_name.name);
>> -
>>   	inode->i_op = &f2fs_file_inode_operations;
>>   	inode->i_fop = &f2fs_file_operations;
>>   	inode->i_mapping->a_ops = &f2fs_dblock_aops;
>> @@ -689,7 +688,7 @@ static int f2fs_symlink(struct user_namespace *mnt_userns, struct inode *dir,
>>   	if (err)
>>   		return err;
>>   
>> -	inode = f2fs_new_inode(mnt_userns, dir, S_IFLNK | S_IRWXUGO);
>> +	inode = f2fs_new_inode(mnt_userns, dir, S_IFLNK | S_IRWXUGO, NULL);
>>   	if (IS_ERR(inode))
>>   		return PTR_ERR(inode);
>>   
>> @@ -760,7 +759,7 @@ static int f2fs_mkdir(struct user_namespace *mnt_userns, struct inode *dir,
>>   	if (err)
>>   		return err;
>>   
>> -	inode = f2fs_new_inode(mnt_userns, dir, S_IFDIR | mode);
>> +	inode = f2fs_new_inode(mnt_userns, dir, S_IFDIR | mode, NULL);
>>   	if (IS_ERR(inode))
>>   		return PTR_ERR(inode);
>>   
>> @@ -817,7 +816,7 @@ static int f2fs_mknod(struct user_namespace *mnt_userns, struct inode *dir,
>>   	if (err)
>>   		return err;
>>   
>> -	inode = f2fs_new_inode(mnt_userns, dir, mode);
>> +	inode = f2fs_new_inode(mnt_userns, dir, mode, NULL);
>>   	if (IS_ERR(inode))
>>   		return PTR_ERR(inode);
>>   
>> @@ -856,7 +855,7 @@ static int __f2fs_tmpfile(struct user_namespace *mnt_userns, struct inode *dir,
>>   	if (err)
>>   		return err;
>>   
>> -	inode = f2fs_new_inode(mnt_userns, dir, mode);
>> +	inode = f2fs_new_inode(mnt_userns, dir, mode, NULL);
>>   	if (IS_ERR(inode))
>>   		return PTR_ERR(inode);
>>   
>> -- 
>> 2.25.1


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
