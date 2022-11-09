Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 0AA4B622978
	for <lists+linux-f2fs-devel@lfdr.de>; Wed,  9 Nov 2022 12:02:58 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1osir1-00036t-99;
	Wed, 09 Nov 2022 11:02:47 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <shengyong@oppo.com>) id 1osiqs-00035u-Pq
 for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 09 Nov 2022 11:02:40 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=MIME-Version:Content-Type:Content-Transfer-Encoding
 :Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=oC6jl/iGveb1+xic6ksBQLL3yvVSAiWEKtbln4prOc8=; b=kzZHh0Xso2We7Gu6sUiIK3X152
 zL4NkhNKrgjada6nifoxQm9Q9J9Gvkkk6pgCzM3CxziJZ10t8nAzhAGmCE77lsvpfU+AyhD595KfG
 N1Jp37OrhOYI6qsunqkyJw3y3ouprZVrXGysmqQ//0A2r5/ViAD5JOcukdet7eX8ro7o=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:Date:
 Subject:Cc:To:From:Sender:Reply-To:Content-ID:Content-Description:Resent-Date
 :Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=oC6jl/iGveb1+xic6ksBQLL3yvVSAiWEKtbln4prOc8=; b=B
 p3KBlpVJtJU40UudAZQwIRK022AlmtTbrnWXNV6hmXSRPxnFYLyIhymfskeGWugIzLYWaVomjUoeH
 ocxNvh0X6hmbTfQsssdeYnn4XuledY8hwJMhDaVzm2kEOtz/nC3a27DBNA8VgJV68UALfVKKpczDd
 zCOcmOTCjRTDJwkI=;
Received: from mail-tyzapc01on2040.outbound.protection.outlook.com
 ([40.107.117.40] helo=APC01-TYZ-obe.outbound.protection.outlook.com)
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1osiqo-001jGJ-1k for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 09 Nov 2022 11:02:36 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=UTey0wEnEdgp+H97POt26+Be+KBFOev+1kQG8AQdDGItp4HgkH+GUuS4z4E7Y/yZesdbhAjDlXiTy8vXY/XwB50bOFFUP85fnCl3LHRnwduMpmfCkrAo6ksyha5PirjoFJfZyjnN1+88CTWGqXM3r3fb33YR5+xoF7GX9DQWqxrchKD+fpKREGcQGkaDk3I6F7Tmb7uyj3BRO185N9K5jRgpd7DUGdmFbytNRqVxHOxGf+x+1q4RMRvDq4oi6P2d7hirk5rUkPjnU+GIX6uM44zCxl8ooGcxRGHSrG1yvD9uvI56kJzsMI/Cwim3y0wZBpPTMGOFhmFxFUzE1eOyFw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=oC6jl/iGveb1+xic6ksBQLL3yvVSAiWEKtbln4prOc8=;
 b=NU8cq1T4w7BjxAGIcT7ld5/cmkaT+Al2BcygxJnC90GEesdxNgNFC/+yo2KMUl7k6lnNvSKiO2NROid/S0ZWf3TtLthjSKnbX81ph499EzhJ9rzFfpynJ4eHb0SSgHCGKqpimkhBCA4OLmrQFigirH87Me1Jqw2l0qY/gCRZNzQ8lEMkuIlmrwVUvrv0Y1kk98ZToZPl1Z9IgbUkMe3g5Yakc0HLoPONlDThI8EUPqQ/ybYRASn1YJb9N3whNYteYqaUVUXpD0ta9kGhZHJER2jPgPSKBJgGu6j+kCA5okW97xLIUhPfNbZ7g5KIDpX3C2l+6+kQ5XUO58/xo5DVCQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oppo.com; dmarc=pass action=none header.from=oppo.com;
 dkim=pass header.d=oppo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oppo.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=oC6jl/iGveb1+xic6ksBQLL3yvVSAiWEKtbln4prOc8=;
 b=m0zMEAXoKmdRkzFs0zOgxANr8GB+g6Xykcq2cmSvj/oi2f6CHSmlFZy1mvZeoYcqVu/hnB6j1rNodk9tDAPUahJtgTj4GfhYv+liM33YAGw4olWEO2YjGMOUcm8lqqtzvFcZ5Rt54X8o0lpkwQCAuBrsHqkm8NKl0g4bhs973As=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oppo.com;
Received: from SI2PR02MB5148.apcprd02.prod.outlook.com (2603:1096:4:153::6) by
 TYUPR02MB6251.apcprd02.prod.outlook.com (2603:1096:400:35a::6) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5791.25; Wed, 9 Nov 2022 11:02:23 +0000
Received: from SI2PR02MB5148.apcprd02.prod.outlook.com
 ([fe80::31b6:afe9:43b5:aaca]) by SI2PR02MB5148.apcprd02.prod.outlook.com
 ([fe80::31b6:afe9:43b5:aaca%8]) with mapi id 15.20.5791.027; Wed, 9 Nov 2022
 11:02:23 +0000
To: jaegeuk@kernel.org,
	chao@kernel.org
Date: Wed,  9 Nov 2022 19:01:48 +0800
Message-Id: <20221109110148.3674340-1-shengyong@oppo.com>
X-Mailer: git-send-email 2.25.1
X-ClientProxiedBy: TYCPR01CA0011.jpnprd01.prod.outlook.com (2603:1096:405::23)
 To SI2PR02MB5148.apcprd02.prod.outlook.com
 (2603:1096:4:153::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SI2PR02MB5148:EE_|TYUPR02MB6251:EE_
X-MS-Office365-Filtering-Correlation-Id: 69f6b7c3-117e-46c5-63f9-08dac241e11d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Ggew26BklmF2uWEtrnRi9ICNziaADnebLZsCnvp7YfSz12Rvs40knS+uglvdaWXiHDmXu1wqdreDdbHf2B7646NEPPzccnZoGGiUd4Gm20Wc2RKfaz9P0AbCyBqMTyL0Y8OxTSFrAJMkHMm51x05C3cJXreUUQwu0ILeZ/t1956frD81o2WO4FKC1ywn0p3I1L6CtKWEocnBEKWKeb27tpcnXTsNhHnmjmrs29d7GIOZff7ctKzqU+289Td0YlBllmnRiZSOU+GJL4Liwuom9lTW34WUjGxfBIfAUVSRLzNtEaIM5U9wA8QxiIT0+d1H9I1SGtnj3XANUU7IWEpGiDlA6lq2ElmH0o+01kNd/+v5SdcR+r5YIbBM43MAHB/PT2fRyhlSvLhwE4uIJ3+wh4cyPkxg10en8xppwkjlunTPXzORZjpZx3G9EeOye9YnJKlj62cNx2DcuFG4b7VrfkiNsGfTMoaguFYgmijLtqCb9gagmy4F/NG9n3UhZ7SCaWJoBtMS5nB8QNYc/MQmDrdjlecgxcNjsRxDKzo029uij5M7JGQJmDyULZeMzUX3eURL3FM6I4+cGMJ42GndhU+LL31f+kw/X6cgXwOW7OJhGnBdq4CfxW+dIe8HAJhIZza/tRPZQgg6cexUdue2OQcbL3Qqfsg54Zy+qAy1jOMl7RX7yLwBTtIuk/LK0Wq4jIS7tbFdYPI8eHTUB/7tIuU/uHPAHKiTUga4avQ4eIqx92s9s4Xth16hnEuvGDXd
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SI2PR02MB5148.apcprd02.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(4636009)(376002)(136003)(346002)(366004)(39860400002)(396003)(451199015)(36756003)(478600001)(26005)(6486002)(8936002)(38350700002)(38100700002)(86362001)(41300700001)(6666004)(52116002)(6512007)(107886003)(186003)(2616005)(1076003)(66946007)(6506007)(5660300002)(316002)(2906002)(66476007)(83380400001)(8676002)(66556008)(4326008);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?RUU5dE1aOEpVTm1DbDRtckdzMk5Zb2xoTklpRVBuUFNNZmxRVVFWK1d3ZWN5?=
 =?utf-8?B?S01DRzJVaVpPc09ISG9xR0pFUDJxYWpweWxlblhkZnBGMldrbGU2d3RGRzNQ?=
 =?utf-8?B?NnIzR0ZjNTNUS003TmQ0dUJtMFc0dWhzY3p3UG1KLytObEQzQXpSZjZkR1lm?=
 =?utf-8?B?RW9jRGFYQytaUTNsV1V6U1JpcTVqeHNuNzc4YVRIc2lqVS9sc2pEaTRXdE5C?=
 =?utf-8?B?OFpCYWt4Y0hlSjlrUEpwckhkQUQrM01lcGwvVWhraTFZOGR5TG1nVW1CQzNS?=
 =?utf-8?B?dGpqa3dhcFByOXZtQnV3U2J2akNXaVQwV1R6Z1R4MzNTZ0JUSE5HczAxSmxk?=
 =?utf-8?B?THNBWHJ2VUxHRGZKMzhCMytpZUhaUFZqMDd3VzNEMUdOMUw4YXZyQVJQNGxZ?=
 =?utf-8?B?SXVJSnhHQVNRbFBscWZ2NENvMXhadXNzM3ZxQ0dlVHo0UXZVdmJMNzl1U2pS?=
 =?utf-8?B?ejlwYkFBZVBLSFFFWTV3R21sVHFiUGdacmxzTk1qMmRyL2RvVlEvZkI2WEM4?=
 =?utf-8?B?UXRaNTFHZ3ZRb0puRE5uR0hwQ1BVamJoeGExUWxHNnVRUnFmSlo0Yk1DenRh?=
 =?utf-8?B?WUVwbFZTS2N3ZVdHWnd6aGRnaVllR1hoTlpaK1BrUnJhU3AzQjFMRmxaeVlj?=
 =?utf-8?B?ZnYxbUtnTlBtbzBqTUJBd0IwNEwwRHFEa01NTGw5bnY3aUZMTUNDdzlCb3lm?=
 =?utf-8?B?R0JRZ28zR1VrdTgyOUx0SnZFTXl1bDZQR0RBWmlTYzVqTnJPK1lYajNEbUlO?=
 =?utf-8?B?Z3RtUlltbmRIajRvV2hyTmdsYktEc3pmOFAydWpUb0VZNjkwdk1mRnQ2TFd0?=
 =?utf-8?B?bG5wdk5NdmJLYnZDTGFwYkh2Wlc4OVV4bGJXd1FoU3BxYkZVSTNDTWZCODlH?=
 =?utf-8?B?aU1RMkw1bUhTVmFXc1B3bEE0dFV2M1AzRlhDdm1aeGdpcnpvTzZZcjg2OGVV?=
 =?utf-8?B?aHBKQXo1WkhBU0xyR3ZkSCtaenF0a3dBQ2hQVTNIR1c2cFAzR2FqSy9yeG5K?=
 =?utf-8?B?dmd2L3BvaExJRG9hNlRPZGExQ2dScUpZQkg2QjkxYWk2T0pabllzamptUzA0?=
 =?utf-8?B?OWNuWENPaXN1KzMvMzJjNG9ITWtNb2JuUmc1ek5EeGJveHAzQk1Kb0xTM3Vq?=
 =?utf-8?B?TXZZM3JibERkT1hpUnIvelFkSEJBT09uU0c5OFlGYmVkT1VGb3lWd1p6Nkxl?=
 =?utf-8?B?SjhnUjZuanhTSmtNdnlaQ2hrSS90ellBOGY2TWUwZ1laTGlkL3lzQktwWjJm?=
 =?utf-8?B?ZldSYlhpRk1zN1lKVzBHb3RORlFjcVZsZHNNaFlCN3N2RjcrdFZGQ01JNUhN?=
 =?utf-8?B?ampsc0ZXK0M4aFgya1BiQzZVNG5aWllscDV4UHZDSzh0UEgxVlJKc0puZms3?=
 =?utf-8?B?Tkt2akcydEpRS3FnU2xBUkxrTnNrU3lHdGFCQ3dlS1d5QlMrVXgyTFRBa0RZ?=
 =?utf-8?B?QjB5Q0djMWpuUDZpZGdjcUhLRFBaVW1wdmhnVS9OSWQwU2MyTSt5dDFzTE1R?=
 =?utf-8?B?akRFVjJsQVNMcXdKelREbWZmcVlmNklSMWM3LzVXTE1pdS9hRmVidkNFZVlI?=
 =?utf-8?B?dUtCRElZaXN2MDI5UjI4RU1acnd0anh6YjBvQkhVZWlGeTVaSmFVZks2WVZv?=
 =?utf-8?B?SEVOZVhIaEtXMXBHRFRMNFJqMVhnS3pPem5mL0t4TXRlVHhxOGVsb25FOFNL?=
 =?utf-8?B?SHZDZFZET1czUUhZc1FHSFE4dis5b04yeHBHK2haVEtpT0svM2lEaUJHS0ps?=
 =?utf-8?B?M0lVcGtYUGRqZ2dVRnM2c1FZb2VsSUJhdmx2dTNRZzFtZlpqUVAxZTJwVVpL?=
 =?utf-8?B?YVcxakQ0UXlveHNIRWx4U3Jrdm5JY3FxbjNwbUVmUmlRZEUyRjhWZXZXejRO?=
 =?utf-8?B?RUFCZ00zZ1doQTVra1BDQzd3ZFNHa0NQTTNsaFJTM25DbEsxc294Y1BHY2pq?=
 =?utf-8?B?RHVYdGJoZHE1QkNXZTFTMW15b2REblFIZ1Y5elBuMGszLytvZmFkM1VEOGNK?=
 =?utf-8?B?S2NQNkd2eFd0dWxXTXRwNGsvNk0zYjdlVEN2QUNKMjR4WXFFVk41NXNXOVIr?=
 =?utf-8?B?ZGRjSG9PUnJESkVtdG9xaDBRbXJpMnJySi8yVnBNSjRScnYxeExFWHBVMjJT?=
 =?utf-8?Q?J5mptrDIoITFto85oJKC3cg/8?=
X-OriginatorOrg: oppo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 69f6b7c3-117e-46c5-63f9-08dac241e11d
X-MS-Exchange-CrossTenant-AuthSource: SI2PR02MB5148.apcprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Nov 2022 11:02:23.3527 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f1905eb1-c353-41c5-9516-62b4a54b5ee6
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: JnL/fAXWh+0yv7+lqJ6qVt4BwLGiAOJrMyPuLxdfB8XHfCT2PedXOw/HXqiDCnLu+VtuR/qlmfO6EGaC8Qehhw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYUPR02MB6251
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  If compress_extension is set,
 and a newly created file matches
 the extension, the file could be marked as compression file. However, if
 inline_data is also enabled, there is no chance to check its ext [...] 
 Content analysis details:   (-0.2 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [40.107.117.40 listed in wl.mailspike.net]
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
 no trust [40.107.117.40 listed in list.dnswl.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.0 SPF_HELO_PASS          SPF: HELO matches SPF record
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
X-Headers-End: 1osiqo-001jGJ-1k
Subject: [f2fs-dev] [PATCH] f2fs: fix to enable compress for newly created
 file if extension matches
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

SWYgY29tcHJlc3NfZXh0ZW5zaW9uIGlzIHNldCwgYW5kIGEgbmV3bHkgY3JlYXRlZCBmaWxlIG1h
dGNoZXMgdGhlCmV4dGVuc2lvbiwgdGhlIGZpbGUgY291bGQgYmUgbWFya2VkIGFzIGNvbXByZXNz
aW9uIGZpbGUuIEhvd2V2ZXIsCmlmIGlubGluZV9kYXRhIGlzIGFsc28gZW5hYmxlZCwgdGhlcmUg
aXMgbm8gY2hhbmNlIHRvIGNoZWNrIGl0cwpleHRlbnNpb24gc2luY2UgZjJmc19zaG91bGRfY29t
cHJlc3MoKSBhbHdheXMgcmV0dXJucyBmYWxzZS4KClNvIGlmIGEgbmV3IGZpbGUgaXMgY3JlYXRl
ZCAoaXRzIGlub2RlIGhhcyBJX05FVyBmbGFnIGFuZCBtdXN0IGhhdmUKbm8gcGluL2F0b21pYy9z
d2FwIGZsYWcpLCBpbnN0ZWFkIG9mIGNhbGxpbmcgZjJmc19zaG91bGRfY29tcHJlc3MoKSwKY2hl
Y2tpbmcgaXRzIGZpbGUgdHlwZSBpcyBlbm91Z2ggaGVyZS4KClNpZ25lZC1vZmYtYnk6IFNoZW5n
IFlvbmcgPHNoZW5neW9uZ0BvcHBvLmNvbT4KLS0tCiBmcy9mMmZzL25hbWVpLmMgfCA3ICsrKysr
Ky0KIDEgZmlsZSBjaGFuZ2VkLCA2IGluc2VydGlvbnMoKyksIDEgZGVsZXRpb24oLSkKCmRpZmYg
LS1naXQgYS9mcy9mMmZzL25hbWVpLmMgYi9mcy9mMmZzL25hbWVpLmMKaW5kZXggZTEwNDQwOWMz
YTBlNS4uOTlkYmQwNTFhZTBiYSAxMDA2NDQKLS0tIGEvZnMvZjJmcy9uYW1laS5jCisrKyBiL2Zz
L2YyZnMvbmFtZWkuYwpAQCAtMjk1LDkgKzI5NSwxNCBAQCBzdGF0aWMgdm9pZCBzZXRfY29tcHJl
c3NfaW5vZGUoc3RydWN0IGYyZnNfc2JfaW5mbyAqc2JpLCBzdHJ1Y3QgaW5vZGUgKmlub2RlLAoK
ICAgICAgICBpZiAoIWYyZnNfc2JfaGFzX2NvbXByZXNzaW9uKHNiaSkgfHwKICAgICAgICAgICAg
ICAgICAgICAgICAgRjJGU19JKGlub2RlKS0+aV9mbGFncyAmIEYyRlNfTk9DT01QX0ZMIHx8Ci0g
ICAgICAgICAgICAgICAgICAgICAgICFmMmZzX21heV9jb21wcmVzcyhpbm9kZSkgfHwKICAgICAg
ICAgICAgICAgICAgICAgICAgKCFleHRfY250ICYmICFub2V4dF9jbnQpKQogICAgICAgICAgICAg
ICAgcmV0dXJuOworICAgICAgIGlmIChpbm9kZS0+aV9zdGF0ZSAmIElfTkVXKSB7CisgICAgICAg
ICAgICAgICBpZiAoIVNfSVNSRUcoaW5vZGUtPmlfbW9kZSkpCisgICAgICAgICAgICAgICAgICAg
ICAgIHJldHVybjsKKyAgICAgICB9IGVsc2UgaWYgKCFmMmZzX21heV9jb21wcmVzcyhpbm9kZSkp
IHsKKyAgICAgICAgICAgICAgIHJldHVybjsKKyAgICAgICB9CgogICAgICAgIGYyZnNfZG93bl9y
ZWFkKCZzYmktPnNiX2xvY2spOwoKLS0KMi4yNS4xCgpfX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fXwpPUFBPCgrmnKznlLXlrZDpgq7ku7blj4rlhbbpmYTku7blkKvmnIlPUFBP5YWs5Y+4
55qE5L+d5a+G5L+h5oGv77yM5LuF6ZmQ5LqO6YKu5Lu25oyH5piO55qE5pS25Lu25Lq677yI5YyF
5ZCr5Liq5Lq65Y+K576k57uE77yJ5L2/55So44CC56aB5q2i5Lu75L2V5Lq65Zyo5pyq57uP5o6I
5p2D55qE5oOF5Ya15LiL5Lul5Lu75L2V5b2i5byP5L2/55So44CC5aaC5p6c5oKo6ZSZ5pS25LqG
5pys6YKu5Lu277yM5YiH5Yu/5Lyg5pKt44CB5YiG5Y+R44CB5aSN5Yi244CB5Y2w5Yi35oiW5L2/
55So5pys6YKu5Lu25LmL5Lu75L2V6YOo5YiG5oiW5YW25omA6L295LmL5Lu75L2V5YaF5a6577yM
5bm26K+356uL5Y2z5Lul55S15a2Q6YKu5Lu26YCa55+l5Y+R5Lu25Lq65bm25Yig6Zmk5pys6YKu
5Lu25Y+K5YW26ZmE5Lu244CCCue9kee7nOmAmuiur+Wbuuaciee8uumZt+WPr+iDveWvvOiHtOmC
ruS7tuiiq+aIqueVmeOAgeS/ruaUueOAgeS4ouWkseOAgeegtOWdj+aIluWMheWQq+iuoeeul+ac
uueXheavkuetieS4jeWuieWFqOaDheWGte+8jE9QUE/lr7nmraTnsbvplJnor6/miJbpgZfmvI/o
gIzlvJXoh7TkuYvku7vkvZXmjZ/lpLHmpoLkuI3mib/mi4XotKPku7vlubbkv53nlZnkuI7mnKzp
gq7ku7bnm7jlhbPkuYvkuIDliIfmnYPliKnjgIIK6Zmk6Z2e5piO56Gu6K+05piO77yM5pys6YKu
5Lu25Y+K5YW26ZmE5Lu25peg5oSP5L2c5Li65Zyo5Lu75L2V5Zu95a625oiW5Zyw5Yy65LmL6KaB
57qm44CB5oub5o+95oiW5om/6K+677yM5Lqm5peg5oSP5L2c5Li65Lu75L2V5Lqk5piT5oiW5ZCI
5ZCM5LmL5q2j5byP56Gu6K6k44CCIOWPkeS7tuS6uuOAgeWFtuaJgOWxnuacuuaehOaIluaJgOWx
nuacuuaehOS5i+WFs+iBlOacuuaehOaIluS7u+S9leS4iui/sOacuuaehOS5i+iCoeS4nOOAgeiR
o+S6i+OAgemrmOe6p+euoeeQhuS6uuWRmOOAgeWRmOW3peaIluWFtuS7luS7u+S9leS6uu+8iOS7
peS4i+ensOKAnOWPkeS7tuS6uuKAne+8ieS4jeWboOacrOmCruS7tuS5i+ivr+mAgeiAjOaUvuW8
g+WFtuaJgOS6q+S5i+S7u+S9leadg+WIqe+8jOS6puS4jeWvueWboOaVheaEj+aIlui/h+WkseS9
v+eUqOivpeetieS/oeaBr+iAjOW8leWPkeaIluWPr+iDveW8leWPkeeahOaNn+WkseaJv+aLheS7
u+S9lei0o+S7u+OAggrmlofljJblt67lvILmiqvpnLLvvJrlm6DkuK3lpJbmlofljJblt67lvILl
vbHlk43vvIzljZXnuq/ku6VZRVNcT0vmiJblhbbku5bnroDljZXor43msYfnmoTlm57lpI3lubbk
uI3mnoTmiJDlj5Hku7bkurrlr7nku7vkvZXkuqTmmJPmiJblkIjlkIzkuYvmraPlvI/noa7orqTm
iJbmjqXlj5fvvIzor7fkuI7lj5Hku7bkurrlho3mrKHnoa7orqTku6XojrflvpfmmI7noa7kuabp
naLmhI/op4HjgILlj5Hku7bkurrkuI3lr7nku7vkvZXlj5fmlofljJblt67lvILlvbHlk43ogIzl
r7zoh7TmlYXmhI/miJbplJnor6/kvb/nlKjor6XnrYnkv6Hmga/miYDpgKDmiJDnmoTku7vkvZXn
m7TmjqXmiJbpl7TmjqXmjZ/lrrPmib/mi4XotKPku7vjgIIKVGhpcyBlLW1haWwgYW5kIGl0cyBh
dHRhY2htZW50cyBjb250YWluIGNvbmZpZGVudGlhbCBpbmZvcm1hdGlvbiBmcm9tIE9QUE8sIHdo
aWNoIGlzIGludGVuZGVkIG9ubHkgZm9yIHRoZSBwZXJzb24gb3IgZW50aXR5IHdob3NlIGFkZHJl
c3MgaXMgbGlzdGVkIGFib3ZlLiBBbnkgdXNlIG9mIHRoZSBpbmZvcm1hdGlvbiBjb250YWluZWQg
aGVyZWluIGluIGFueSB3YXkgKGluY2x1ZGluZywgYnV0IG5vdCBsaW1pdGVkIHRvLCB0b3RhbCBv
ciBwYXJ0aWFsIGRpc2Nsb3N1cmUsIHJlcHJvZHVjdGlvbiwgb3IgZGlzc2VtaW5hdGlvbikgYnkg
cGVyc29ucyBvdGhlciB0aGFuIHRoZSBpbnRlbmRlZCByZWNpcGllbnQocykgaXMgcHJvaGliaXRl
ZC4gSWYgeW91IGFyZSBub3QgdGhlIGludGVuZGVkIHJlY2lwaWVudCwgcGxlYXNlIGRvIG5vdCBy
ZWFkLCBjb3B5LCBkaXN0cmlidXRlLCBvciB1c2UgdGhpcyBpbmZvcm1hdGlvbi4gSWYgeW91IGhh
dmUgcmVjZWl2ZWQgdGhpcyB0cmFuc21pc3Npb24gaW4gZXJyb3IsIHBsZWFzZSBub3RpZnkgdGhl
IHNlbmRlciBpbW1lZGlhdGVseSBieSByZXBseSBlLW1haWwgYW5kIHRoZW4gZGVsZXRlIHRoaXMg
bWVzc2FnZS4KRWxlY3Ryb25pYyBjb21tdW5pY2F0aW9ucyBtYXkgY29udGFpbiBjb21wdXRlciB2
aXJ1c2VzIG9yIG90aGVyIGRlZmVjdHMgaW5oZXJlbnRseSwgbWF5IG5vdCBiZSBhY2N1cmF0ZWx5
IGFuZC9vciB0aW1lbHkgdHJhbnNtaXR0ZWQgdG8gb3RoZXIgc3lzdGVtcywgb3IgbWF5IGJlIGlu
dGVyY2VwdGVkLCBtb2RpZmllZCAsZGVsYXllZCwgZGVsZXRlZCBvciBpbnRlcmZlcmVkLiBPUFBP
IHNoYWxsIG5vdCBiZSBsaWFibGUgZm9yIGFueSBkYW1hZ2VzIHRoYXQgYXJpc2Ugb3IgbWF5IGFy
aXNlIGZyb20gc3VjaCBtYXR0ZXIgYW5kIHJlc2VydmVzIGFsbCByaWdodHMgaW4gY29ubmVjdGlv
biB3aXRoIHRoZSBlbWFpbC4KVW5sZXNzIGV4cHJlc3NseSBzdGF0ZWQsIHRoaXMgZS1tYWlsIGFu
ZCBpdHMgYXR0YWNobWVudHMgYXJlIHByb3ZpZGVkIHdpdGhvdXQgYW55IHdhcnJhbnR5LCBhY2Nl
cHRhbmNlIG9yIHByb21pc2Ugb2YgYW55IGtpbmQgaW4gYW55IGNvdW50cnkgb3IgcmVnaW9uLCBu
b3IgY29uc3RpdHV0ZSBhIGZvcm1hbCBjb25maXJtYXRpb24gb3IgYWNjZXB0YW5jZSBvZiBhbnkg
dHJhbnNhY3Rpb24gb3IgY29udHJhY3QuIFRoZSBzZW5kZXIsIHRvZ2V0aGVyIHdpdGggaXRzIGFm
ZmlsaWF0ZXMgb3IgYW55IHNoYXJlaG9sZGVyLCBkaXJlY3Rvciwgb2ZmaWNlciwgZW1wbG95ZWUg
b3IgYW55IG90aGVyIHBlcnNvbiBvZiBhbnkgc3VjaCBpbnN0aXR1dGlvbiAoaGVyZWluYWZ0ZXIg
cmVmZXJyZWQgdG8gYXMgInNlbmRlciIgb3IgIk9QUE8iKSBkb2VzIG5vdCB3YWl2ZSBhbnkgcmln
aHRzIGFuZCBzaGFsbCBub3QgYmUgbGlhYmxlIGZvciBhbnkgZGFtYWdlcyB0aGF0IGFyaXNlIG9y
IG1heSBhcmlzZSBmcm9tIHRoZSBpbnRlbnRpb25hbCBvciBuZWdsaWdlbnQgdXNlIG9mIHN1Y2gg
aW5mb3JtYXRpb24uCkN1bHR1cmFsIERpZmZlcmVuY2VzIERpc2Nsb3N1cmXvvJpEdWUgdG8gY3Vs
dHVyYWwgZGlmZmVyZW5jZXMgYmV0d2VlbiBDaGluYSBhbmQgZm9yZWlnbiBjb3VudHJpZXMsIGFu
eSByZXBseSB3aXRoIG9ubHkgWUVTXE9LIG9yIG90aGVyIHNpbXBsZSB3b3JkcyBkb2VzIG5vdCBj
b25zdGl0dXRlIGFueSBjb25maXJtYXRpb24gb3IgYWNjZXB0YW5jZSBvZiBhbnkgdHJhbnNhY3Rp
b24gb3IgY29udHJhY3QsIHBsZWFzZSBjb25maXJtIHdpdGggdGhlIHNlbmRlciBhZ2FpbiB0byBl
bnN1cmUgY2xlYXIgb3BpbmlvbiBpbiB3cml0dGVuIGZvcm0uIFRoZSBzZW5kZXIgc2hhbGwgbm90
IGJlIHJlc3BvbnNpYmxlIGZvciBhbnkgZGlyZWN0IG9yIGluZGlyZWN0IGRhbWFnZXMgcmVzdWx0
aW5nIGZyb20gdGhlIGludGVudGlvbmFsIG9yIG1pc3VzZSBvZiBzdWNoIGluZm9ybWF0aW9uLgoK
Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4LWYy
ZnMtZGV2ZWwgbWFpbGluZyBsaXN0CkxpbnV4LWYyZnMtZGV2ZWxAbGlzdHMuc291cmNlZm9yZ2Uu
bmV0Cmh0dHBzOi8vbGlzdHMuc291cmNlZm9yZ2UubmV0L2xpc3RzL2xpc3RpbmZvL2xpbnV4LWYy
ZnMtZGV2ZWwK
