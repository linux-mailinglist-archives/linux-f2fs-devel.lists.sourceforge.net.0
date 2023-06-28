Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A9AF7407D2
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 28 Jun 2023 03:54:17 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1qEKNi-0006CJ-QJ;
	Wed, 28 Jun 2023 01:54:07 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <guochunhai@vivo.com>) id 1qEKNg-0006CB-7n
 for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 28 Jun 2023 01:54:05 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=MIME-Version:Content-Transfer-Encoding:Content-Type
 :In-Reply-To:From:References:Cc:To:Subject:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=1M9FG7vjX6oww3CdV5HybQRpVi/idbzhx7MzWaxD2tY=; b=APLvrefvs+8cIXA/4XzQlwwJrj
 MnXJopb3Y6rkjI6jUQxzeJqLfsOm6NbbEjByORZ1sVrBS+4etaKH8p2NE7FvfmgBBhRwtiKpZvtMp
 s7CHjodtwzIV82qr9Es18OK48fFtp0ce8OjY0BaQ2fumJwZu2ZLrHxCpOBuh9GniHc6E=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=MIME-Version:Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
 References:Cc:To:Subject:Date:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=1M9FG7vjX6oww3CdV5HybQRpVi/idbzhx7MzWaxD2tY=; b=Nfy21tvxYnzu3DDw/VvvbOllTC
 FRVqklypgmE3WAv9fH4ATczWATXoUsrniU9igG/t9UOBPGHYQ4KNPtTJDbPf04+UdA5YAsL6HTSqS
 X1V2m+U1YhPGUETISiktsFMOT+Ucwy87q0+r8rUeILL4OC30GqPJFhXPwb+xpCYJ9f7E=;
Received: from mail-psaapc01on2126.outbound.protection.outlook.com
 ([40.107.255.126] helo=APC01-PSA-obe.outbound.protection.outlook.com)
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1qEKNa-00Gv2d-AY for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 28 Jun 2023 01:54:05 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=lZYXHy0j8M2ol9MN1jFx8a1QmlONXyzF12Zrg47DjJcUaZzoiMbIo5EgQ9LaqwzK1OHAKsf/hLKHUw5EnX/+KtIHyYIx+9zDcntXhkot7oXfpzpg1gIUgfl2yqcWvbi5xHexX07hOJ8NF61a+B97GJTLyqaJ+RVCac4TvRHQJ9qIKT3zzN3++n7BJ0wboZEBwhu7IsH3R7WyyL0NcxmSe5T4VLr7ma3/0d131rBeQMpWCW3i3b61XFtPEDTasNTRBNRC3DbK+XyWhJowqi09eit3FQCEiPlAnj8uscshyIqXRN5D+eXC6M0rxPzpFXqRe4kGxCz+ytVnJcii2/8L0Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1M9FG7vjX6oww3CdV5HybQRpVi/idbzhx7MzWaxD2tY=;
 b=b/GDOAtlEX6E3kKSaZUIu3KjeMHXjwi2Ny9OCHgepRfFCv8e1ThitcWmnGhApK6krIuchBRa1MyEhaTByJJSrzpX1m5lLTOQgTAIJecpVvksZQBHo4/bxUmTAl8QN4XQpX04cnKZbo87/6BMFFeOUnM94dGNsD1Q7VmD/f0LFNzlUr8A8vmpo5h8Z19n/anZWy5oIDFJ11h0gtgbAyNm89Z1C7PHGfC0ezvL+E5ZM0rqk9ieHEf+tLiWe3KUxVlpjd6LEUps1oM1WzFtcl5KkpMzNpiC1f+NyChcv0GEOKm/rfc/QtJqe8JeGnci1mLl4pAa0ijVKV3A5oh/T2uwEg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vivo.com; dmarc=pass action=none header.from=vivo.com;
 dkim=pass header.d=vivo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vivo.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1M9FG7vjX6oww3CdV5HybQRpVi/idbzhx7MzWaxD2tY=;
 b=auGAOZo/L/jPGnXlqWvttzsp8nDm/8ot22zm1cPDp6UcvTwGdzgofNV98OPZGmVErBUtS6j7ZTUsOoChi867/lMrH8Phyi6UvC+3bBp+ggKx9Dcn6i6dGWKazMVp6BlQZBH6Okkm/BfdCOyfXM31ofh7wb6JydYWbeaNYvR7hEwEmOeXvP+XL60LNKJZ3Sd/AxeTRxRtdXZSKA5oXaeQsYNqyFDvfJyIto5JjC1m6ABy5NEuKHKyXDZA/PvASiWxjdzYc6ZdSMg4K2r/LubrR6qqcENJnnmiqE9gg34mr7YZX1iI78xvsLmhj7Do7bDxi3RHgjE5KZk6lt/rcuUOKw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=vivo.com;
Received: from TY2PR06MB3342.apcprd06.prod.outlook.com (2603:1096:404:fb::23)
 by TYZPR06MB4078.apcprd06.prod.outlook.com (2603:1096:400:4::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6521.24; Wed, 28 Jun
 2023 01:53:47 +0000
Received: from TY2PR06MB3342.apcprd06.prod.outlook.com
 ([fe80::4823:1d86:1665:5a02]) by TY2PR06MB3342.apcprd06.prod.outlook.com
 ([fe80::4823:1d86:1665:5a02%7]) with mapi id 15.20.6521.024; Wed, 28 Jun 2023
 01:53:46 +0000
Message-ID: <3d7ec519-2544-760b-4552-cee8cfb19f65@vivo.com>
Date: Wed, 28 Jun 2023 09:53:42 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.1
To: "chao@kernel.org" <chao@kernel.org>,
 "jaegeuk@kernel.org" <jaegeuk@kernel.org>
References: <20230626140223.61209-1-guochunhai@vivo.com>
In-Reply-To: <20230626140223.61209-1-guochunhai@vivo.com>
X-ClientProxiedBy: SI2PR04CA0003.apcprd04.prod.outlook.com
 (2603:1096:4:197::23) To TY2PR06MB3342.apcprd06.prod.outlook.com
 (2603:1096:404:fb::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TY2PR06MB3342:EE_|TYZPR06MB4078:EE_
X-MS-Office365-Filtering-Correlation-Id: 04020031-8ffd-444a-4cae-08db777a82a9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: /Ajb1xnIob64A1VSuzG60gkFRyLlDeiR3FRq9+2ePUgQWygKUnBl8UYh4zN08pddWNd5wylOBxstCkuVLmQJ62vt0wcdykBVQdvoY3QAs7PhxRMJTZcToJnlUuGz239WMx5jj8LJD6Zwz7p+pgHznFBONz4gNFjMdKVj1AT3/lTkB9vFwFu5cvyAI5waExNg/pzmTUVE4kuyOyVjz+OzLTyUhYmmI4FRq4r66pVMMdinLltPdtNN9u4ECtsJImqZE+INfpVEryvalgLTeIRu43nswbnwi1jVXCVYWUCRW17ATapBqHfQfrh+6HU6UD1lGFfNvXdcsN65YDR51NGvXAWpSu75X7mR2yyGSmLT/nQDcm8SLUEmN/d5dzuWAnbZG4QTccvafz3a6AH8x1Mjjdm33FTl8IXMgs9ybKJqStACDTdm2ysQkyYao1PXa2r8cdhILid+D8O61veRuQthGbJSpkc0UjYzQi3j+Fb/6fujZMKesWsDQD0BzqhVYNwLHWEREUJahlMywqYevM+B2JCmv42pHcOWXLfZh0/k+CPt8BVyO1ny6QVYeKgTmTp6SWJHxGmYOecT/mBlnZk7fWnSW32bCLXsmtaE73U9zkYuu8q30QDtobfD5zRrdxsQREtRvq7+kp+RISkepPwCRA==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:TY2PR06MB3342.apcprd06.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(4636009)(136003)(396003)(39850400004)(366004)(346002)(376002)(451199021)(6506007)(5660300002)(31686004)(66476007)(66556008)(316002)(66946007)(36756003)(478600001)(4326008)(8676002)(8936002)(86362001)(2906002)(6512007)(110136005)(31696002)(41300700001)(6666004)(6486002)(186003)(26005)(38100700002)(53546011)(2616005)(83380400001)(43740500002)(45980500001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ZjhILytPdjY4ZEhZQ1VOUjJRd0k0RFZINitEQytWSHdBSWE3V3cyeXRROThn?=
 =?utf-8?B?SkRlMmpXVENmSmp1MUlJSG82eTJTRU9YcUNYY2pBekd4VGQxczlNVndXVEhm?=
 =?utf-8?B?Q2FmcEtJdEVRcElmc1hmTHJJVkhSSUhYVTMxeG5nMXFJMG1JTUp3Zmk2aVNB?=
 =?utf-8?B?WnRjOHphdFF3TWFObU9HUEtvUFRNT0Nuc3JNSDRPQWpUTW1zY0MyL0MyWnJ1?=
 =?utf-8?B?SzVCTm5tZm8xRkgwSndJN2pqVk9PWG41ekJzVmhFbXNKZjNITU5sQ3lLQStq?=
 =?utf-8?B?M1diVWROT2RDRnhSK2FwVWcvZEF6dUlHcW9uVXVKY0JjeHQxbllXWmkwRHpz?=
 =?utf-8?B?R1hudjI0blV1ZDZPNkdKYWJERG9JRE95Q2NsTkxGUnFIU3lEN3R5TzUxOHBC?=
 =?utf-8?B?dUlHemg1R0NjOU9ERHQvQWxzbjNBRWRXSFJmcWhHVEpMeTlyVUcvYUZWWHgz?=
 =?utf-8?B?TW9VN1RsY3dmcEFNMG5STjhLb0I0cjlrck9HbEI3N2NER3RLUEgvMmFXQjJn?=
 =?utf-8?B?RnZNM0I1UFFZQ3h2MzFERVRvUlJCVGhFWldRU0d4Qjlnd0daaThWT3RUWkIx?=
 =?utf-8?B?WmZ6aGdiU1F1dG9sOUYxSFRuVUJCb2R3QXNWM3ZYRVM4bUpwNjdpMkxzcDFo?=
 =?utf-8?B?U0gwZ3hZQnlVMXUwQ0xiUlhJbkZ0WDhhY0VtOE5SbWNUeFYvNjl5bUcrYzdG?=
 =?utf-8?B?OVBkWlc0WGlsNS9Ya3hmdERaN01vamF3eGp2b0xsOXQ2bjlQbFBNUkNMd2ll?=
 =?utf-8?B?MG5NUjRtY2Jlek9YNnQ4WHZPS2loNVUvU2JjcmJlaHhZZGlCZFdGeGJCZk5Y?=
 =?utf-8?B?SXh0OHhWUlFUV3VudkREN3VvQ3QxbnVuT0h1czV4eE1yOXV6ZXE3UkE1Uklq?=
 =?utf-8?B?YTduTzlvQ3JtOWVvcVJHUTdoT1p5UU9yV0s4VjEvc25GV2pKQncwdDNPS1RS?=
 =?utf-8?B?RUxNU0UyNWVVY2I2YThmK2ZuUXFweHpZSUVvaCtXdDFmdFN1R3R1ekdrSjdL?=
 =?utf-8?B?OTRtakowSGx2T2JNWUU1RGJBQ0pmd0oxN3M4TXBWYVd3TVpnc3ZIT2ZjYVhx?=
 =?utf-8?B?NWQwWWl3bjd0ZEcycUEvRUxRREpYYk5PbjgwMkJaOCtYY2JpUlBENFpmRmJ2?=
 =?utf-8?B?RzVJam1ZQWRwbHdjdUtSbm5laWMzSUdrTWRONHFnbUYvKzRvWmZsUHhVWWx5?=
 =?utf-8?B?dURwdi9BbmgrS2E2RUxKQzlNV216TC90T2tGenk0by8zNDZvM0VpeitrTVkw?=
 =?utf-8?B?WnRvODhYTTh2MkUxSHRocXFiNVRjc3VBZm9vaFozL1JCQm5xOU5UdzA4Q1Uz?=
 =?utf-8?B?Q0o2S2IwWktSK041bXFnb1hlQUVDUTZzMDZDZ2VkNms2MWpkZVFhcTlZdkpI?=
 =?utf-8?B?eTJWc2N2NUY0TFZvVmJjQlptTXJwclY5QUplSDlwK0QyanNVRkJGTEl3ZzYy?=
 =?utf-8?B?YUt6YStMb09YZktQS1RDanFiQkxyd0VxeTZLVk00eHBuWXRQaU5XMWhGSklz?=
 =?utf-8?B?Z2hTWnZxMEloUGZXYXBobDRRdGpZQjExRFVVb3pONFFwRXlxc1U5eGF4RjZM?=
 =?utf-8?B?QlF1bjNNeUI0Sm5RZVA5Q1l4MkMxK3lBRzhsME9RZnJLak55UjFZdTkzM2Jn?=
 =?utf-8?B?SktUQ3dRTHI0UWFGNlh4aUdqYXYvT3FtOGoxNmVCWng2a2RwUVJPSmVrRXNF?=
 =?utf-8?B?VENrZVFHRnNVM1R5M0FMQkRueEN6YjlxVkVKSWNBZldqNHZlK200VDg2OUJm?=
 =?utf-8?B?MWtQQlU5ZnBBVDlkSnk5U0dMeCtsOXk1S1ltaG02eEszdUFvQXNnRUV5WUd6?=
 =?utf-8?B?UWVzOCtZZnF3NUFCUm5vMkJyQzVwejFtU3U1WTR4TC9iNzFEeWZEdXg0SzM1?=
 =?utf-8?B?K05ySUZJWHVESStVSjF2bTRrTnZoMEhWUG9QUS9Ic2RqeHlIa3A5c051c0U1?=
 =?utf-8?B?d3AzSG5VSFk1ai9kN1BpKytOTmUvNnRCS2pUR3JnZFVKNnBYY0tadS9jdHJi?=
 =?utf-8?B?WHpMek5XMUtNMjUrOWMyRGRJUWU1ZzZoVXJnOTlkNGtNWHNkVGk5cmhTMDJ1?=
 =?utf-8?B?RjE0RlVDVlZ4eU1ENHA3Q1R5Y3NiVzVTcGVvbUgycXp4cTBPYzM1M3dmKzNZ?=
 =?utf-8?Q?YEuNLsqVJ6W9yuzbaZIwDWdk7?=
X-OriginatorOrg: vivo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 04020031-8ffd-444a-4cae-08db777a82a9
X-MS-Exchange-CrossTenant-AuthSource: TY2PR06MB3342.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Jun 2023 01:53:46.7309 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 923e42dc-48d5-4cbe-b582-1a797a6412ed
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 15XrmezJHgaHAt7WAaqIJtLeuFOSChihzm5kCkE+bi1KvIRACE49/xVRWIKy9ykdBIggkLFTRv9dUTU2grnubQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYZPR06MB4078
X-Spam-Score: -2.2 (--)
X-Spam-Report: Spam detection software, running on the system "util-spamd-1.v13.lw.sourceforge.com",
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 
 Content preview:  Please ignore this patch. Sorry that I make a mistake. 720037f939fa
    ("f2fs: don't overwrite node block by SSR") has fixed this issue aleady.
   On 2023/6/26 22:02, 郭纯海 wrote: > The fsync node chain can break when
    a node block is used, freed and reused > in the chain. To avoid this, all
    blocks in the chain should be recorded and > not re [...] 
 
 Content analysis details:   (-2.2 points, 6.0 required)
 
  pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
                             [40.107.255.126 listed in wl.mailspike.net]
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
                              no trust
                             [40.107.255.126 listed in list.dnswl.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.0 SPF_HELO_PASS          SPF: HELO matches SPF record
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
                             envelope-from domain
 -0.1 DKIM_VALID             Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
                             author's domain
  0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
                             valid
 -2.0 NICE_REPLY_A           Looks like a legit reply (A)
X-Headers-End: 1qEKNa-00Gv2d-AY
Subject: Re: [f2fs-dev] [PATCH] f2fs: fix to avoid breaking fsync node chain
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

UGxlYXNlIGlnbm9yZSB0aGlzIHBhdGNoLiBTb3JyeSB0aGF0IEkgbWFrZSBhIG1pc3Rha2UuIDcy
MDAzN2Y5MzlmYSAKKCJmMmZzOiBkb24ndCBvdmVyd3JpdGUgbm9kZSBibG9jayBieSBTU1IiKSBo
YXMgZml4ZWQgdGhpcyBpc3N1ZSBhbGVhZHkuCgpPbiAyMDIzLzYvMjYgMjI6MDIsIOmDree6r+a1
tyB3cm90ZToKPiBUaGUgZnN5bmMgbm9kZSBjaGFpbiBjYW4gYnJlYWsgd2hlbiBhIG5vZGUgYmxv
Y2sgaXMgdXNlZCwgZnJlZWQgYW5kIHJldXNlZAo+IGluIHRoZSBjaGFpbi4gVG8gYXZvaWQgdGhp
cywgYWxsIGJsb2NrcyBpbiB0aGUgY2hhaW4gc2hvdWxkIGJlIHJlY29yZGVkIGFuZAo+IG5vdCBy
ZXVzZWQgYmVmb3JlIHRoZSBuZXh0IGNoZWNrcG9pbnQuIEhvd2V2ZXIsIHRoaXMgYXBwcm9hY2gg
bWF5IHJlcXVpcmUKPiB0b28gbWFueSByZXNvdXJjZXMuIEluc3RlYWQsIHRoaXMgcGF0Y2ggcmVj
b3JkcyBhbGwgcmVsYXRlZCBzZWdtZW50cyBpbiBhCj4gYml0bWFwIGFzIGEgY29tcHJvbWlzZSBz
b2x1dGlvbi4KPiBTaW5jZSBMRlMgYWxsb2NhdGlvbiBtb2RlIGFuZCBHQyBvcGVyYXRpb25zIGRv
IG5vdCByZXVzZSBvciBtb2RpZnkgb2Jzb2xldGUKPiBibG9jayBiZWZvcmUgdGhlIG5leHQgY2hl
Y2twb2ludCwgd2UganVzdCBuZWVkIHRvIGVuc3VyZSB0aGUgc2VnbWVudHMgaW4KPiB0aGUgYml0
bWFwIGFyZW4ndCByZWFsbG9jYXRlZCBpbiBTU1IgYWxsb2NhdGlvbiBtb2RlLgo+IAo+IFNpZ25l
ZC1vZmYtYnk6IENodW5oYWkgR3VvIDxndW9jaHVuaGFpQHZpdm8uY29tPgo+IC0tLQo+ICAgZnMv
ZjJmcy9jaGVja3BvaW50LmMgfCAxMSArKysrKysrKysrKwo+ICAgZnMvZjJmcy9nYy5jICAgICAg
ICAgfCAxNCArKysrKysrKysrKysrKwo+ICAgZnMvZjJmcy9zZWdtZW50LmMgICAgfCAxMCArKysr
KysrKysrCj4gICBmcy9mMmZzL3NlZ21lbnQuaCAgICB8ICAzICsrKwo+ICAgNCBmaWxlcyBjaGFu
Z2VkLCAzOCBpbnNlcnRpb25zKCspCj4gCj4gZGlmZiAtLWdpdCBhL2ZzL2YyZnMvY2hlY2twb2lu
dC5jIGIvZnMvZjJmcy9jaGVja3BvaW50LmMKPiBpbmRleCA4ZmQzYjdmOWZiODguLjk0MGY3YTU1
NjhjMCAxMDA2NDQKPiAtLS0gYS9mcy9mMmZzL2NoZWNrcG9pbnQuYwo+ICsrKyBiL2ZzL2YyZnMv
Y2hlY2twb2ludC5jCj4gQEAgLTE0NDcsNiArMTQ0NywxNSBAQCB1NjQgZjJmc19nZXRfc2VjdG9y
c193cml0dGVuKHN0cnVjdCBmMmZzX3NiX2luZm8gKnNiaSkKPiAgIAlyZXR1cm4gZ2V0X3NlY3Rv
cnNfd3JpdHRlbihzYmktPnNiLT5zX2JkZXYpOwo+ICAgfQo+ICAgCj4gK3ZvaWQgZjJmc19yZXNl
dF9ub2RlX2NoYWluX3NlZ21hcChzdHJ1Y3QgZjJmc19zYl9pbmZvICpzYmkpCj4gK3sKPiArCXN0
cnVjdCBzaXRfaW5mbyAqc2l0X2kgPSBTSVRfSShzYmkpOwo+ICsKPiArCXNwaW5fbG9jaygmc2l0
X2ktPnNlZ21hcF9sb2NrKTsKPiArCW1lbXNldChzaXRfaS0+bm9kZV9jaGFpbl9zZWdtYXAsIDAs
IGYyZnNfYml0bWFwX3NpemUoTUFJTl9TRUdTKHNiaSkpKTsKPiArCXNwaW5fdW5sb2NrKCZzaXRf
aS0+c2VnbWFwX2xvY2spOwo+ICt9Cj4gKwo+ICAgc3RhdGljIGludCBkb19jaGVja3BvaW50KHN0
cnVjdCBmMmZzX3NiX2luZm8gKnNiaSwgc3RydWN0IGNwX2NvbnRyb2wgKmNwYykKPiAgIHsKPiAg
IAlzdHJ1Y3QgZjJmc19jaGVja3BvaW50ICpja3B0ID0gRjJGU19DS1BUKHNiaSk7Cj4gQEAgLTE1
OTQsNiArMTYwMyw4IEBAIHN0YXRpYyBpbnQgZG9fY2hlY2twb2ludChzdHJ1Y3QgZjJmc19zYl9p
bmZvICpzYmksIHN0cnVjdCBjcF9jb250cm9sICpjcGMpCj4gICAKPiAgIAlmMmZzX3Jlc2V0X2Zz
eW5jX25vZGVfaW5mbyhzYmkpOwo+ICAgCj4gKwlmMmZzX3Jlc2V0X25vZGVfY2hhaW5fc2VnbWFw
KHNiaSk7Cj4gKwo+ICAgCWNsZWFyX3NiaV9mbGFnKHNiaSwgU0JJX0lTX0RJUlRZKTsKPiAgIAlj
bGVhcl9zYmlfZmxhZyhzYmksIFNCSV9ORUVEX0NQKTsKPiAgIAljbGVhcl9zYmlfZmxhZyhzYmks
IFNCSV9RVU9UQV9TS0lQX0ZMVVNIKTsKPiBkaWZmIC0tZ2l0IGEvZnMvZjJmcy9nYy5jIGIvZnMv
ZjJmcy9nYy5jCj4gaW5kZXggMDFlZmZkM2ZjYjZjLi5lODk5Yzc3NWI3ZmEgMTAwNjQ0Cj4gLS0t
IGEvZnMvZjJmcy9nYy5jCj4gKysrIGIvZnMvZjJmcy9nYy5jCj4gQEAgLTczMyw2ICs3MzMsMTUg
QEAgc3RhdGljIGludCBmMmZzX2djX3Bpbm5lZF9jb250cm9sKHN0cnVjdCBpbm9kZSAqaW5vZGUs
IGludCBnY190eXBlLAo+ICAgCXJldHVybiAtRUFHQUlOOwo+ICAgfQo+ICAgCj4gK3N0YXRpYyBi
b29sIGYyZnNfc2VnX2luX25vZGVfY2hhaW4oc3RydWN0IHNpdF9pbmZvICpzbSwgdW5zaWduZWQg
aW50IHNlZ25vKQo+ICt7Cj4gKwlib29sIHJldDsKPiArCj4gKwlzcGluX2xvY2soJnNtLT5zZWdt
YXBfbG9jayk7Cj4gKwlyZXQgPSB0ZXN0X2JpdChzZWdubywgc20tPm5vZGVfY2hhaW5fc2VnbWFw
KTsKPiArCXNwaW5fdW5sb2NrKCZzbS0+c2VnbWFwX2xvY2spOwo+ICsJcmV0dXJuIHJldDsKPiAr
fQo+ICAgLyoKPiAgICAqIFRoaXMgZnVuY3Rpb24gaXMgY2FsbGVkIGZyb20gdHdvIHBhdGhzLgo+
ICAgICogT25lIGlzIGdhcmJhZ2UgY29sbGVjdGlvbiBhbmQgdGhlIG90aGVyIGlzIFNTUiBzZWdt
ZW50IHNlbGVjdGlvbi4KPiBAQCAtODcxLDYgKzg4MCwxMSBAQCBpbnQgZjJmc19nZXRfdmljdGlt
KHN0cnVjdCBmMmZzX3NiX2luZm8gKnNiaSwgdW5zaWduZWQgaW50ICpyZXN1bHQsCj4gICAJCQl9
Cj4gICAJCX0KPiAgIAo+ICsJCS8qICBpZiBzZWdubyBpcyB1c2VkIGJ5IG5vZGUgY2hhaW4sIGZp
bmQgYW5vdGhlciBvbmUuICovCj4gKwkJaWYgKChwLmFsbG9jX21vZGUgPT0gU1NSIHx8IHAuYWxs
b2NfbW9kZSA9PSBBVF9TU1IpCj4gKwkJCQkmJiBmMmZzX3NlZ19pbl9ub2RlX2NoYWluKHNtLCBz
ZWdubykpCj4gKwkJCWdvdG8gbmV4dDsKPiArCj4gICAJCWlmIChnY190eXBlID09IEJHX0dDICYm
IHRlc3RfYml0KHNlY25vLCBkaXJ0eV9pLT52aWN0aW1fc2VjbWFwKSkKPiAgIAkJCWdvdG8gbmV4
dDsKPiAgIAo+IGRpZmYgLS1naXQgYS9mcy9mMmZzL3NlZ21lbnQuYyBiL2ZzL2YyZnMvc2VnbWVu
dC5jCj4gaW5kZXggMDQ1N2Q2MjAwMTFmLi4wZjM3ZWZiODhhZDMgMTAwNjQ0Cj4gLS0tIGEvZnMv
ZjJmcy9zZWdtZW50LmMKPiArKysgYi9mcy9mMmZzL3NlZ21lbnQuYwo+IEBAIC0zNDc1LDYgKzM0
NzUsMTAgQEAgdm9pZCBmMmZzX2FsbG9jYXRlX2RhdGFfYmxvY2soc3RydWN0IGYyZnNfc2JfaW5m
byAqc2JpLCBzdHJ1Y3QgcGFnZSAqcGFnZSwKPiAgIAl1cF93cml0ZSgmc2l0X2ktPnNlbnRyeV9s
b2NrKTsKPiAgIAo+ICAgCWlmIChwYWdlICYmIElTX05PREVTRUcodHlwZSkpIHsKPiArCQlzcGlu
X2xvY2soJnNpdF9pLT5zZWdtYXBfbG9jayk7Cj4gKwkJc2V0X2JpdChHRVRfU0VHTk8oc2JpLCAq
bmV3X2Jsa2FkZHIpLCBzaXRfaS0+bm9kZV9jaGFpbl9zZWdtYXApOwo+ICsJCXNwaW5fdW5sb2Nr
KCZzaXRfaS0+c2VnbWFwX2xvY2spOwo+ICsKPiAgIAkJZmlsbF9ub2RlX2Zvb3Rlcl9ibGthZGRy
KHBhZ2UsIE5FWFRfRlJFRV9CTEtBRERSKHNiaSwgY3Vyc2VnKSk7Cj4gICAKPiAgIAkJZjJmc19p
bm9kZV9jaGtzdW1fc2V0KHNiaSwgcGFnZSk7Cj4gQEAgLTQ0NDIsNiArNDQ0NiwxMiBAQCBzdGF0
aWMgaW50IGJ1aWxkX3NpdF9pbmZvKHN0cnVjdCBmMmZzX3NiX2luZm8gKnNiaSkKPiAgIAkJcmV0
dXJuIC1FTk9NRU07Cj4gICAjZW5kaWYKPiAgIAo+ICsJc2l0X2ktPm5vZGVfY2hhaW5fc2VnbWFw
ID0gZjJmc19rdnphbGxvYyhzYmksCj4gKwkJCQkJbWFpbl9iaXRtYXBfc2l6ZSwgR0ZQX0tFUk5F
TCk7Cj4gKwlpZiAoIXNpdF9pLT5ub2RlX2NoYWluX3NlZ21hcCkKPiArCQlyZXR1cm4gLUVOT01F
TTsKPiArCj4gKwlzcGluX2xvY2tfaW5pdCgmc2l0X2ktPnNlZ21hcF9sb2NrKTsKPiAgIAlzaXRf
aS0+c2l0X2Jhc2VfYWRkciA9IGxlMzJfdG9fY3B1KHJhd19zdXBlci0+c2l0X2Jsa2FkZHIpOwo+
ICAgCXNpdF9pLT5zaXRfYmxvY2tzID0gc2l0X3NlZ3MgPDwgc2JpLT5sb2dfYmxvY2tzX3Blcl9z
ZWc7Cj4gICAJc2l0X2ktPndyaXR0ZW5fdmFsaWRfYmxvY2tzID0gMDsKPiBkaWZmIC0tZ2l0IGEv
ZnMvZjJmcy9zZWdtZW50LmggYi9mcy9mMmZzL3NlZ21lbnQuaAo+IGluZGV4IDJjYThmYjVkMGRj
NC4uZTBkZTA3NWY5NTliIDEwMDY0NAo+IC0tLSBhL2ZzL2YyZnMvc2VnbWVudC5oCj4gKysrIGIv
ZnMvZjJmcy9zZWdtZW50LmgKPiBAQCAtMjY0LDYgKzI2NCw5IEBAIHN0cnVjdCBzaXRfaW5mbyB7
Cj4gICAJdW5zaWduZWQgbG9uZyBsb25nIGRpcnR5X21heF9tdGltZTsJLyogcmVyYW5nZSBjYW5k
aWRhdGVzIGluIEdDX0FUICovCj4gICAKPiAgIAl1bnNpZ25lZCBpbnQgbGFzdF92aWN0aW1bTUFY
X0dDX1BPTElDWV07IC8qIGxhc3QgdmljdGltIHNlZ21lbnQgIyAqLwo+ICsKPiArCXNwaW5sb2Nr
X3Qgc2VnbWFwX2xvY2s7CQkJLyogbm9kZSBjaGFpbiBzZWdtYXAgbG9jayAqLwo+ICsJdW5zaWdu
ZWQgbG9uZyAqbm9kZV9jaGFpbl9zZWdtYXA7CS8qIHNlZ21lbnQgYml0bWFwIHVzZWQgYnkgbm9k
ZSBjaGFpbiAqLwo+ICAgfTsKPiAgIAo+ICAgc3RydWN0IGZyZWVfc2VnbWFwX2luZm8gewoKCl9f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4LWYyZnMt
ZGV2ZWwgbWFpbGluZyBsaXN0CkxpbnV4LWYyZnMtZGV2ZWxAbGlzdHMuc291cmNlZm9yZ2UubmV0
Cmh0dHBzOi8vbGlzdHMuc291cmNlZm9yZ2UubmV0L2xpc3RzL2xpc3RpbmZvL2xpbnV4LWYyZnMt
ZGV2ZWwK
