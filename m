Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 26103771866
	for <lists+linux-f2fs-devel@lfdr.de>; Mon,  7 Aug 2023 04:39:05 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1qSq98-0003kX-LO;
	Mon, 07 Aug 2023 02:39:01 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <bo.wu@vivo.com>) id 1qSq8y-0003kD-Jd
 for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 07 Aug 2023 02:38:52 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=MIME-Version:Content-Type:Content-Transfer-Encoding
 :References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=BIAcp8nYryCw1a+nI3c3XtO+kwKr9rannCACAIGTh7E=; b=VjNA2FkQYAYvsDVb+Wt256atag
 vluFI91meiaf1Jm5H8SSWAZN/eMZhYvi11oIqkOK2ctx2i2JhzVHJ913ltzNn5/Xa8DwLrUbSJvwI
 hRd5d4J7Rb7eMlm13wphLYJY7v6gQwhf4WkPiGNh8BDXGVhmA4aGH+C0rYuHo2M76WMk=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=MIME-Version:Content-Type:Content-Transfer-Encoding:References:
 In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=BIAcp8nYryCw1a+nI3c3XtO+kwKr9rannCACAIGTh7E=; b=cOHRTUwEEHvWAJd/UJiz6QA6JJ
 0+jomf2BP6HKbinruxa6X6UP5RqvZnNhwLTvzrTHC9rv0CSXHCe9458j+FhffWNsIy0dJlL9sDRMW
 9asxAPhaANGCMKX3G/nUJDFsMnXT1f9NhV1vNiK9IWjDNAVT34ndEpZJb8bz8hjh2Pos=;
Received: from mail-psaapc01on2096.outbound.protection.outlook.com
 ([40.107.255.96] helo=APC01-PSA-obe.outbound.protection.outlook.com)
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1qSq8r-0000Ij-53 for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 07 Aug 2023 02:38:50 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=kraoid4IsHoMm7jmkwo3S8eJN6o9ApYJGFqM+SnIj4k4qVFGH5PeWpQTX4mK61spBuHvxAhCbWxQlcHOns+zmivMe4Y4QZB5Xb/7JBk7ShrBKdOD/ZMFTJ0qQXZMQ4iFlstVr/krhuIUt3Vf0NfNLjaydgrBF2XIwlfSBPCmswKDq9iRdWAYXncv25u+oROphkc9nTY2kbl32V5togjkeYv+SVoujrB0IwhyZfpJonLETpLwqL0ltpKu6ARRLPLC0WMcWFr8rrfYQOG/mYDCZC5BZmlKbo4R3DL7Yka2czdoS0hTNse23gLIH22P2UoxmX3PInkR7pMIFruE4Haojg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=BIAcp8nYryCw1a+nI3c3XtO+kwKr9rannCACAIGTh7E=;
 b=AmCbinYh5uwttzPNBmr4jyLfdpeeX0fMgTkYkNeSNOFk8L9HBigk/IehKbfodHw1vnzFLTZakEiLp9cFuwfAZ3Uhaw1t0JzovDVkxZGAZ195vqjQEMbreiX+U/cUkPvnTTPcxM1ty1fByLVSY9gRGfnDWGW6J+pMUztdhsQIdbEGe/fTrCYG7bEUgiKfVgGAHlMW3OwRQw5J5QMsbwchIZ+sHKIOqKYOCpSuOWPnQXebGdzqic7yjBkbK0PfCam/M6M0tlw5VgKylKLkFWhNlJ87H5mSFVjUdZId7BCkn8xO/FA4YnR9SvK7UOHYW7T3rFDANGHEGtqqxQ4MmkR1hA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vivo.com; dmarc=pass action=none header.from=vivo.com;
 dkim=pass header.d=vivo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vivo.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BIAcp8nYryCw1a+nI3c3XtO+kwKr9rannCACAIGTh7E=;
 b=S33D1h6uX5GUQ4sHOdkK9EozzBco4Sf4rUKUNlpr7bQo8YWUOqhKlnUjEot3T9hR10FaxyXDp4nWy4VPPD+xLavyLAJ8loCItwg9PaJSmwxCecjQbKq1QOEWSWFn4X36IgSdtd5oFoeoF3ldOtkv2NRQXFCyxQijfVwkCZGMVkPpjCrp1NAEzEhkyb+keYapWh9qm1j7+3UPLx3ylJNmA13rHStv7ht0YOcESTt5Lz2DvAtwGF/gf8L1RS18nl/wtnaYsW2oryafuC0Di0v2IB1Gyqy9hKloRtYKowac/P0fc4IKg589TupH8HG9sZGB7hZAz0oSAXmYqoA1HJBwmw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=vivo.com;
Received: from SL2PR06MB3017.apcprd06.prod.outlook.com (2603:1096:100:3a::16)
 by TYZPR06MB5321.apcprd06.prod.outlook.com (2603:1096:400:1f3::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6652.26; Mon, 7 Aug
 2023 02:38:32 +0000
Received: from SL2PR06MB3017.apcprd06.prod.outlook.com
 ([fe80::1528:9c5d:20bf:e5e0]) by SL2PR06MB3017.apcprd06.prod.outlook.com
 ([fe80::1528:9c5d:20bf:e5e0%5]) with mapi id 15.20.6652.026; Mon, 7 Aug 2023
 02:38:32 +0000
To: chao@kernel.org
Date: Mon,  7 Aug 2023 10:38:23 +0800
Message-Id: <20230807023823.49564-1-bo.wu@vivo.com>
X-Mailer: git-send-email 2.35.3
In-Reply-To: <791fbf71-093e-3ef5-b02b-6d6bba72b57f@kernel.org>
References: <791fbf71-093e-3ef5-b02b-6d6bba72b57f@kernel.org>
X-ClientProxiedBy: SG2PR06CA0234.apcprd06.prod.outlook.com
 (2603:1096:4:ac::18) To SL2PR06MB3017.apcprd06.prod.outlook.com
 (2603:1096:100:3a::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SL2PR06MB3017:EE_|TYZPR06MB5321:EE_
X-MS-Office365-Filtering-Correlation-Id: 0a921fc4-8c16-42db-87c1-08db96ef6378
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: GZzRPwgGzQaFazUwerSXI4SgMVKpikbRJnNwibobiWUCIEb8E5HlibpkkP9rOFrL6PBmGdpRtPSQsCMHdLvYWPnxggH/t8iKML/7vIMdw5OVBK/ee8QxZlVvh+ggcQVKcfkr/kLBc6GfsVUzIyH1AQeKaQouZSzF7xaIlqvzLKBLqK4k/HkEIqi8TpFqVNp5IcN2WKmYjwI3WlUGu38i9jtNbhwI1O6y6k/r8lsgIGX823YpWNA6v1g9qrVhh0yt9p82G2HCE64rZ6hvO6LpSiz7uga0sxA5b0PSelkUyQBefka4ZljfbZh0du0yLn8tuiQjN6hbAXj2XFLe82za3M+r30Mja0Gs1f3ivsuf7eFy+ecWWuzGW3UsPtYWlJDVfxXBT1FPiK1hNKSglJ4aP4yRasXk3TuRQEFAZcHfpjzIrBIRdZR9Xk5fsNS+Xpjx03H8MZB4ZehhJoWuIfDvCazQyNrRAsb7Tt+USS5pjT9Bae3/jDEHZmh/VPpOmQKV0BWnexSOdOyqgXhR2AYwmclU+07u/uNdd9UFjoWw19l5znDez2JMo7mgeEhG4XdYBnuz6Uqe+x7YO/XFxRleOK4DSgUTp5xws4Gvr557w9bPSFmoRoSMUvbh8lm+w7cx
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SL2PR06MB3017.apcprd06.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(4636009)(136003)(396003)(366004)(376002)(39850400004)(346002)(451199021)(186006)(1800799003)(2616005)(36756003)(966005)(6512007)(4326008)(316002)(6916009)(86362001)(478600001)(38350700002)(38100700002)(52116002)(6666004)(66946007)(6486002)(66556008)(66476007)(53546011)(6506007)(41300700001)(1076003)(26005)(8936002)(8676002)(4001150100001)(2906002)(83380400001)(5660300002)(562404015);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?xKLLU8XAfRmNMJxvAZj6m6oje5wHrHK7S3W+K7jm3s+XDb3j4wQcm2JJ9HYO?=
 =?us-ascii?Q?XlsNZu888Opv77riwzQe7/2GuLf4vmwjAYs12IiVmom87stKUJMSEW3xoBqK?=
 =?us-ascii?Q?j1qWSrWnwvPbFL634yy4m+gcmGesM8uAXMGjaPjn4JDPJjNq+B/Yu5rk+mMA?=
 =?us-ascii?Q?6jyTh2cuXWTxLRA2PWc3oSr2MsqIownwkNaq6db5fhLo+B5Cdff9I0qAS+w6?=
 =?us-ascii?Q?dPFYjc9seh6M/Otz0sA0YjX0G/sY684uEo1DrRs2nlS2NYkXqCiBYfLIMAy3?=
 =?us-ascii?Q?MJ1kAYG4xG9p22H4bynRZd+zQwQeZ2kdgv5QvEYR9x5/dUFKNZhYPMb4iEXb?=
 =?us-ascii?Q?VyVtmf0JfviQgioFrHqFDJ+DS7Ysof2+kFGFjDpi1OFfJxDfzs2jP7WMbGVG?=
 =?us-ascii?Q?Zi/tcaXkiNQOh3Ck1pEGHWq5ojr2NkLQS7RjDSbN7of9Tv6rV3NkOq6K7krk?=
 =?us-ascii?Q?QIJXg0tMf+fTYDFT2sErlXvouHTDt2LnkiE6HbMlPjZOlO4BFNvFcFcSqqOb?=
 =?us-ascii?Q?3iXygJotMkFdIdZL2hrVnxy+PmGC94NI49mY/t1ZkcJUL2c1k6nDJCLCfBSo?=
 =?us-ascii?Q?snoVPRWngcuTAyogGUR9nFwBY4digDFJ0UA4wjM31VCb6ohjaWN1NGNt0vRg?=
 =?us-ascii?Q?AwM/6wRjI3jjPUpt2X1U5UOdC5mI05BIVtETcz+w+6TcphDbFDjCRkxJexI9?=
 =?us-ascii?Q?BslzlUeiYBkDPVJAgIUOdnPL5XAfT2Szon4+rEVkt5TusTxbXnPVE/9w0LZw?=
 =?us-ascii?Q?0Yc8hdgPh9TPRIRM8kZZSfMizG9rk92O+OoOsvtIryX00lzwOLCbdBiJUdPD?=
 =?us-ascii?Q?yvbO8uf3CsO8WzYtv8p7WGljPJrtR4L4HJKKIX1w38hcBNPtDfiTp2HSt5yZ?=
 =?us-ascii?Q?ZBNlf4f/2SrMPB23rjB6LUrcQSvP1cr8MSDLPprZVr+oL4J3z8GYjQ/Qada6?=
 =?us-ascii?Q?3mC5NjYkUfIIkOmsANgiBoeSzpuhCOsyh4aUc7oIYJlbjHgprHeL/gvJvyjQ?=
 =?us-ascii?Q?tSOHLmdvfxTS8rYzqQqNT84zFpMOfmKW0mPS5x8ppBozLTadZwsaEwrA1hXQ?=
 =?us-ascii?Q?+wLH1UL/R+G4Inz5Wq+ze6maJ0htiEQwV7IdLuFW/wgCUO6MG2TvUbT4Msbj?=
 =?us-ascii?Q?cqRLdA6cXZxFaVqrmhMjU20XFh/eG98z5sMidXR6AEMi/VQZmsdc0wtygRtc?=
 =?us-ascii?Q?nQbB8TWJ/wUI5h4TKbQ3As9AWI+Rozv02L9WfdB13zHVpfM4bfeXxty9qYMC?=
 =?us-ascii?Q?7wPzGKRdr646JliceiEaHeNmGZDjlB83WUBvoSXlSmwtuHNBpMLX+ECQw6iT?=
 =?us-ascii?Q?Ia9zbXLx+YQQZJ/JIIE1/NYwHLtL+HJjL1ksAgIR5xnL0IWLiUSzT/98Z5Tm?=
 =?us-ascii?Q?4g667Noi4ndf/nPPjR/CJjs5TrOK3/H0mAvI7azqcXeS5IvpR0bYgv8gKGvY?=
 =?us-ascii?Q?DNfun4v90Nyc8lmZHrj4tVVA2BpjwmnTgiU/KkOphd0qftyuCYY5mSjIBuVs?=
 =?us-ascii?Q?phzpp74YAf57ekG6DKE3hyl3RKxbjkYlQ37sod1g9wbMssSekCwna7AOUasd?=
 =?us-ascii?Q?TAbjfBbjTllyf1Jm0T03ShYkntsAVu00PAUptpQ/?=
X-OriginatorOrg: vivo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0a921fc4-8c16-42db-87c1-08db96ef6378
X-MS-Exchange-CrossTenant-AuthSource: SL2PR06MB3017.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Aug 2023 02:38:31.9501 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 923e42dc-48d5-4cbe-b582-1a797a6412ed
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 2/D6yI6WeWrJWDLNdy+j1t01mYwAUVexQr7U8327As5V2i4r9b+XrHCOJBqnn7N668oyrHGbUsoYEnAtPl54xw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYZPR06MB5321
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 2023/8/6 10:05, Chao Yu wrote: > On 2023/7/31 9:26, Wu
 Bo wrote: >> This patch has been tested with xfstests by running 'kvm-xfstests
 -c >> f2fs -g auto' with and without this patch; no regressions were seen.
 >> >> Some tests fail [...] 
 Content analysis details:   (-0.2 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
 no trust [40.107.255.96 listed in list.dnswl.org]
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [40.107.255.96 listed in wl.mailspike.net]
 -0.0 SPF_HELO_PASS          SPF: HELO matches SPF record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
X-Headers-End: 1qSq8r-0000Ij-53
Subject: Re: [f2fs-dev] [PATCH 1/1] f2fs: move fiemap to use iomap framework
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
From: Wu Bo via Linux-f2fs-devel <linux-f2fs-devel@lists.sourceforge.net>
Reply-To: Wu Bo <bo.wu@vivo.com>
Cc: daehojeong@google.com, linux-kernel@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net, bo.wu@vivo.com, wubo.oduw@gmail.com,
 jaegeuk@kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On 2023/8/6 10:05, Chao Yu wrote:

> On 2023/7/31 9:26, Wu Bo wrote:
>> This patch has been tested with xfstests by running 'kvm-xfstests -c
>> f2fs -g auto' with and without this patch; no regressions were seen.
>>
>> Some tests fail both before and after, and the test results are:
>> f2fs/default: 683 tests, 9 failures, 226 skipped, 30297 seconds
>>    Failures: generic/050 generic/064 generic/250 generic/252 generic/459
>>        generic/506 generic/563 generic/634 generic/635
>
> Can you please take a look at gerneic/473 ?

This generic/473 case is failed on xfs too. It's an issue of iomap.

>
> generic/473 1s ... - output mismatch (see
> /media/fstests/results//generic/473.out.bad)
>     --- tests/generic/473.out    2022-11-10 08:42:19.231395230 +0000
>     +++ /media/fstests/results//generic/473.out.bad    2023-08-04
> 02:02:01.000000000 +0000
>     @@ -6,7 +6,7 @@
>      1: [256..287]: hole
>      Hole + Data
>      0: [0..127]: hole
>     -1: [128..255]: data
>     +1: [128..135]: data
>      Hole + Data + Hole
>      0: [0..127]: hole
>     ...
>     (Run 'diff -u /media/fstests/tests/generic/473.out
> /media/fstests/results//generic/473.out.bad'  to see the entire diff)

The layout of the test file is:
fiemap.473:
 EXT: FILE-OFFSET      BLOCK-RANGE      TOTAL FLAGS
   0: [0..127]:        hole               128
   1: [128..255]:      5283840..5283967   128 0x1000
   2: [256..383]:      hole               128
   3: [384..511]:      5283968..5284095   128 0x1000

And the test command is:
xfs_io -c "fiemap -v 0 65k" fiemap.473

So the difference is about when to stop traversal the extents.
The iomap stop when the length beyond it is requested from fiemap command:
...
xfs_io-7399    [001] .....  1385.656328: f2fs_map_blocks: dev = (254,48), ino = 5, file offset = 15, start blkaddr = 0x0, len = 0x0, flags = 0, seg_type = 8, may_create = 0, multidevice = 0, flag = 1, err = 0                                                                                       
xfs_io-7399    [001] .....  1385.656328: f2fs_map_blocks: dev = (254,48), ino = 5, file offset = 16, start blkaddr = 0x3400, len = 0x1, flags = 2, seg_type = 8, may_create = 0, multidevice = 0, flag = 1, err = 0            

While previous logic is that stop traversal until next data extent is found:
...
xfs_io-2194    [000] .....   116.046690: f2fs_map_blocks: dev = (254,48), ino = 5, file offset = 15, start blkaddr = 0x0, len = 0x0, flags = 0, seg_type = 8, may_create = 0, multidevice = 0, flag = 1, err = 0
xfs_io-2194    [000] .....   116.046690: f2fs_map_blocks: dev = (254,48), ino = 5, file offset = 16, start blkaddr = 0xa1400, len = 0x10, flags = 2, seg_type = 8, may_create = 0, multidevice = 0, flag = 1, err = 0
xfs_io-2194    [000] .....   116.046691: f2fs_map_blocks: dev = (254,48), ino = 5, file offset = 32, start blkaddr = 0x0, len = 0x0, flags = 0, seg_type = 8, may_create = 0, multidevice = 0, flag = 1, err = 0
...
xfs_io-2194    [000] .....   116.046706: f2fs_map_blocks: dev = (254,48), ino = 5, file offset = 48, start blkaddr = 0xa1410, len = 0x10, flags = 2, seg_type = 8, may_create = 0, multidevice = 0, flag = 1, err = 0

>
> Other concern is, it needs to test this implementation on compressed
> file,
> since the logic is a little bit complicated.

To be honest, all the complex logic is try to handle compressed file situation.

I used enwiki8 dataset to test compressed file:
    mkfs.f2fs -f -O extra_attr,compression f2fs.img
    mount f2fs.img f2fs -o compress_algorithm=lz4,compress_log_size=3,compress_mode=user
    touch compressed_file
    f2fs_io setflags compression compressed_file
    cat enwiki8 > compressed_file
    f2fs_io compress compressed_file
    f2fs_io release_cblocks compressed_file
    xfs_io -c fiemap compressed_file | awk '{print $2 $3}'

enwiki8 download url: http://mattmahoney.net/dc/enwik8.zip

And the result is:
--- a/orig
+++ b/new
@@ -1750,8 +1750,8 @@
 [111872..111935]:323448..323511
 [111936..111999]:323488..323551
 [112000..112063]:323520..323583
-[112064..112087]:323560..323583
-[112088..112127]:53248..53287
+[112064..112095]:323560..323591
+[112096..112127]:53248..53279
 [112128..112191]:53256..53319
 [112192..112255]:53288..53351
 [112256..112319]:53328..53391
@@ -2078,10 +2078,8 @@
 [132800..132863]:65408..65471
 [132864..132927]:65448..65511
 [132928..132991]:65488..65551
-[132992..132999]:65528..65535
-[133000..133007]:65528..65535
-[133008..133039]:69632..69663
-[133040..133055]:hole
+[132992..133007]:65528..65543
+[133008..133055]:69632..69679
 [133056..133119]:69664..69727
 [133120..133183]:69704..69767
 [133184..133247]:69744..69807

The first diff is I count the space of COMPRESS_ADDR belong to the head of one
compressed cluster while previous count at the rear of cluster.
The secound diff show the previous print a 'hole' in one cluster. I think a
compressed cluster should not include a 'hole', so there may have a bug before.

Also, as discussed in this thread:
https://lore.kernel.org/linux-f2fs-devel/ZJmBmt3WmUpWR3+2@casper.infradead.org/T/#t
If f2fs can support async buffer write, the performance can be greatly improved
when using io_uring. 

I think it's time to move f2fs to iomap framework. And really looking forward
to hearing your opinion on this.

Thanks


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
