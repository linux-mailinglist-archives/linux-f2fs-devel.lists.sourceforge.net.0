Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 904F2636554
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 23 Nov 2022 17:06:53 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1oxsGv-0004Nj-Fp;
	Wed, 23 Nov 2022 16:06:49 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <frank.li@vivo.com>) id 1oxsGt-0004NX-Ly
 for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 23 Nov 2022 16:06:48 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=MIME-Version:Content-Type:Content-Transfer-Encoding
 :References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=tpGYq8BNuqxB4oD6Ky6HddTrWOvGwfUwHl4As9dC/mY=; b=U//3DX8SK7iY2U0ZklfFTxJlrm
 dmcbr4NUAk/kWokevrwTL67vNSlxAJgTymc2f1voCoOWYt3VSfw4EFjrwqad/SwBJGqpNOG7VcNjX
 MLGYBwwjgWPi9F38ZwVNHz35gnd4EHTmtboOxnxkWlIfgV4vrcoAsnuciWOSsKYt4Ff0=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=MIME-Version:Content-Type:Content-Transfer-Encoding:References:
 In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=tpGYq8BNuqxB4oD6Ky6HddTrWOvGwfUwHl4As9dC/mY=; b=g+a35xS8cYrzIpe+ar0d85bLk5
 FSuSp6soQqMbbZlZLeT3yip2KR8rSQ3toJoReGKcgA2EVz+0VJ2zDY4xfl9ob6KCx9BO+xE+e5mLn
 0E8URifTlsYin5gPpS17tvf/CnjeV0H7KSmICXHpQisZxahd+2Id2K24wvbT/7xOgLss=;
Received: from mail-psaapc01on2102.outbound.protection.outlook.com
 ([40.107.255.102] helo=APC01-PSA-obe.outbound.protection.outlook.com)
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1oxsGo-00GJMh-Pa for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 23 Nov 2022 16:06:47 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=QM1zDMBfTdGl/J2lJv82s73/dA4elMdFUXrGl+e57ZBoaWbMpdVxIz12nhR690YQu0KD5bDdL9AkQ37mcUpdAK7ZAVYVvy4IV7Mp9R8YR7YptqyCkwSjLUpG/6/dspPQWhnKPDqj0RKssIijru2zpR2A6DdLFxOAGNpdjgBFQtcayRJtCD5FU56s8CaF8C5r+cnMZxAMnrMw3zfdmIR+ZvWk+cUehOMZ3VpnW1FuCPh5EjbXoPT3/UP8YdWgyXCcz3d//jceF4Gbn5a+BD7EydxpGnWHaeFqmXYuMvJByOyUNgwnL0l/WP9skDwVuIrlFgp5LW4qaTFwUQjo2IyXhw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tpGYq8BNuqxB4oD6Ky6HddTrWOvGwfUwHl4As9dC/mY=;
 b=bUiRyKVucrTEa10ymlub9GTH2As16+4eBomwtBY7shBxC5YSExXDRzzhqRH2G5gC+/yRsVVDBQdA5YSJQ9mMvwmPR2XpMpCzsiGVAz01fxCzKlipAji+nzqJf1j0Rh/HHxb6Et7pW6k6bpVcz6Ed6Gj3QAVC0jvAgaXqHjhmde0ed8aeQTt5qR44dnHQkW+/M5oFDgpALeDwWMrgJC72uPVZXTELvSqsKtoclZsLAhlsGhvB25BaRbIx3K+K6zyNDpl9QqTRXFhAcNKsVGgecQvQscs2L0qiUO7BBLoNBiuAi458zRy9A7YFal335Dd084z9s07ARw1TAMnfW+A/LQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vivo.com; dmarc=pass action=none header.from=vivo.com;
 dkim=pass header.d=vivo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vivo.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tpGYq8BNuqxB4oD6Ky6HddTrWOvGwfUwHl4As9dC/mY=;
 b=iqECvdju+egHW6bWU8o46KvM5MzeGRHv4JRZEnIwPvJ82HZEOLTMDH0JTwd3XWjvqjWUy2Q1CtUQODblCoyZnV+vudEaa+jGIgIcFTsPIPZ4BlxdrcEoVo3ieq6KWiOyM2LY0hPESXfTPSz+JKNbVT/kV0w7KxFU0eBreuhLyLQW8m/uThZkOWlH6kZZH8MA/1JaSWJVocgNwWnh1MtGvhRQE8CH2c7/QQ7W9acurDcUj+uj5glOkK6vI+sHh6u35pDKQHpk89x2Kqo2yATFyiFX+EKFgvAHWyoUS/eTi8BqnUfC5g/W4O5C2wI6WlPgS48NE5+Ad2aSzNgHwhZjhA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=vivo.com;
Received: from SEZPR06MB5269.apcprd06.prod.outlook.com (2603:1096:101:78::6)
 by SI2PR06MB4347.apcprd06.prod.outlook.com (2603:1096:4:15b::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5834.15; Wed, 23 Nov
 2022 16:06:34 +0000
Received: from SEZPR06MB5269.apcprd06.prod.outlook.com
 ([fe80::1230:5f04:fe98:d139]) by SEZPR06MB5269.apcprd06.prod.outlook.com
 ([fe80::1230:5f04:fe98:d139%7]) with mapi id 15.20.5834.015; Wed, 23 Nov 2022
 16:06:33 +0000
To: jaegeuk@kernel.org,
	chao@kernel.org
Date: Thu, 24 Nov 2022 00:06:25 +0800
Message-Id: <20221123160625.9309-1-frank.li@vivo.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <6258327d-8205-644e-9879-c96448841720@kernel.org>
References: <6258327d-8205-644e-9879-c96448841720@kernel.org>
X-ClientProxiedBy: TYWPR01CA0048.jpnprd01.prod.outlook.com
 (2603:1096:400:17f::18) To SEZPR06MB5269.apcprd06.prod.outlook.com
 (2603:1096:101:78::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SEZPR06MB5269:EE_|SI2PR06MB4347:EE_
X-MS-Office365-Filtering-Correlation-Id: f4ea80fb-cdc9-43d7-28aa-08dacd6cb0fb
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: qCDCgJyuhGO6h93NSgwvnKqWvQCowWFPhT8iWeAVTAewwECHNptmK+jMcLlNv3t3PRHdjegHCTBbQdGoDvTjL9UzFonTvxI8AvNiA4tb13CKc0+pKvA6emxYjZkKLGpcby1fAzJGAn1Ytja4q4VI9tbIwYHtbz/xdByfLQezRpvb2jmBOnGWWlhBfm9b+Jpd3Iz38XikV/VWsu92lFL+8CknuXdqJ1TxJ0fqkbYmVWJHIx6KgpgGFwqbDqOv2hKWy8tFu2hdfvJGn74a+wG3kg7OuzFhNncV2OKWTDODzJXJ51wb021YT5v8TRRgZ3gNWZsEXk1fLWdoEb+Jn9P2BruqFlAn+XXVRQPPn6vwO2/NymjHtaDFJHL3BMblTDc60oozMjtcAQs5XCLXMo1Ox/ffYdFkmypJrk03gwJ5WNniEiALzF5kATOGvP0r1kvft2d9TzAwCtjSmT27pl6wKLxqboPz19AUid51q81KhO89+bWTtdZ3uUhM1Nc0Iwc3Eyhm97Cd6OuQc5W0IHZN65pdarTH61VuVFeikjEJtbSSDgKFbHeOVDhndNGgXUw9xy/W+U9mAFgENOzMqHx/vtVC1DzIiZ25IO7KTbOrhHZ03SwR6YCKW136BFN0GNkZAxSHA48BJf/FjgRQh8/wScPeySctzVRx6gnl8xpqWjJI92XX3XPy3WqVXD2m+1i5
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SEZPR06MB5269.apcprd06.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(4636009)(396003)(136003)(39860400002)(346002)(366004)(376002)(451199015)(38100700002)(26005)(38350700002)(558084003)(86362001)(6666004)(52116002)(66556008)(478600001)(6506007)(66946007)(4326008)(8676002)(66476007)(41300700001)(316002)(6486002)(2616005)(1076003)(2906002)(186003)(6512007)(8936002)(5660300002)(36756003);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?3i1lXNIVufzf24QEMM589K1bIzl0jh7MNEhpdGI3eWFuxvcsuNpaEch4OU0I?=
 =?us-ascii?Q?agN9YFw4XL1At0GlhsenukL73SzLgKt+MwgdDxfsKR/1lPTT0MLLLnf7LN/a?=
 =?us-ascii?Q?5VIhKd6uV4M5XoLiTAsM0USe08cdi0HmlcYasIvOEhKvZcayNVg1IuubR/JD?=
 =?us-ascii?Q?xFj3KtuKdO5O4HunCpAO6k4sMQ64X9cd+9fAl0Pr8gqRDbNuss+8tPutH7Oh?=
 =?us-ascii?Q?+uJNYotQ2f++tjWU9UVZXUklW0YdcMS+0484ICwJy1X0lSse1aeMxO6ZSvVT?=
 =?us-ascii?Q?/CvR3ikWqMEVt94rgdYwIJrORroKaLbOb/CyhdwzCsKf3lfDkotoz1VjTTxz?=
 =?us-ascii?Q?JHeumN6jB+GXap//NWBToApZf6/ELiZIIifE5NzpIozWnEwyHk20mVrqS5aw?=
 =?us-ascii?Q?HMvgFOIebN5k8T/6QUmYdzWsXruogMiokNny8oerIbSzVdiWIqGfo2vICdjj?=
 =?us-ascii?Q?8mVN1FYHD2wFgMGHNCOrBICGyXiUCJXSqH9Gng3fA7Q2pwCilGEx1cRfG9MX?=
 =?us-ascii?Q?Sw/6C5f4EppKRiEtVbaVc44Q8aA39LZNna6Vov1Np6c1IZ9LwJzZQKpn940y?=
 =?us-ascii?Q?6T77Cqy4yiY6sOSWLU1aH2YWuBC4X4mU2tLuhaF0CV1hH+jBtjyTqRiIgKa2?=
 =?us-ascii?Q?GzJpe5gKY7mEpklHNIkkBzStm0ULvKqGCX3J0WN6DkjFYXeF60qaLX632df/?=
 =?us-ascii?Q?aLwKgcth4/xPB+4G6YWggOzXiNRhKB5dIqAkrnAwEkAvs+pzMn+wPg1gvmCc?=
 =?us-ascii?Q?NYJ04Sbg4KCXbMEnET1303Fwj5GMYGQI2eT5IyJVq3PMdMhCJVzxNn3nZpnj?=
 =?us-ascii?Q?hVsOFha2XpZQW+z6NUYrqyig2jW5yccnh4O8zh1KA09O/JziG2k/mnSsbFs4?=
 =?us-ascii?Q?Y1e4GQnOl2H4ikw50Nf8qeIKvkuDj1U55I0BiwStXA9YSbXxPBKmDe1ZJQkL?=
 =?us-ascii?Q?RJ/w/lDv17grfA9G9ozr7OpZLNjH1PMDJza2IW4f4+oasa7QWS1/CAQc0N8Z?=
 =?us-ascii?Q?QHERqCJiC1HKnZOphPShtEzV7NYBxT2OkTVIzluJ0PwItQGXq9zZJF/qUiKR?=
 =?us-ascii?Q?X8kxc1f07IZpVDYM4W+H42inSXTXUge67P+nf9u/eMQwZqLTcRi0VomvCpkU?=
 =?us-ascii?Q?0O8kXR5V8XO3xbTXuRscdLJt+jRknGOp+2PqPKCApu8By/teOdkVaXxbGWQa?=
 =?us-ascii?Q?J04rt2Phj4452QW/JUG/QfGlT3o+3W3h00ncP0P1ngwfpKS+/eS8Qw/3m8cO?=
 =?us-ascii?Q?moDwENccwUP62urqKB8VpASSSRn0XXZMtTdHE94/aNSgCldvW8wouMXhiwfw?=
 =?us-ascii?Q?HSx3Y1Mxtu3OuynUOtlaoZdLYEx2tBvIlsQ//45XiYLQEuhkXjjd1lMxalLt?=
 =?us-ascii?Q?o202MQLHnQZCDTQWpdL1qBJAFmxe3ezu6Ls45d9GRBb90Z7Qe0n8iygg8Jdj?=
 =?us-ascii?Q?2VSPVK7PPtuE8cyc5CEVbriX5ps4cnZRslmsuHcrhrQb0V8aRKjFmoGAr9UO?=
 =?us-ascii?Q?xXq/4Muv4f9oooOsgIzqEoWdxxrSag4W8ETW2zi5/iRwP56jSDGhKUC/aYTt?=
 =?us-ascii?Q?LXBJYf1ALJG0Ds9Z13QX0fgmlB5pw+k945NI9ply?=
X-OriginatorOrg: vivo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f4ea80fb-cdc9-43d7-28aa-08dacd6cb0fb
X-MS-Exchange-CrossTenant-AuthSource: SEZPR06MB5269.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Nov 2022 16:06:33.7476 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 923e42dc-48d5-4cbe-b582-1a797a6412ed
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: YnTLRygl0BxOrf9qsvjKaRACFjsSTMdUs7eA1sKJekLjYh8yy08UIXWS9ggDfE5Dtgl38uXeKM0Dl/yNV1uEXQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SI2PR06MB4347
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  HI Chao, >> set_freezable();
 >> >> do { > > if (!atomic_read(&dcc->discard_cmd_cnt))
 > wait_ms = dpolicy.max_interval; dpolicy has not been initialized for the
 first time, and the value in the stack is unstable. 
 Content analysis details:   (-0.2 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
 no trust [40.107.255.102 listed in list.dnswl.org]
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [40.107.255.102 listed in wl.mailspike.net]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.0 SPF_HELO_PASS          SPF: HELO matches SPF record
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
X-Headers-End: 1oxsGo-00GJMh-Pa
Subject: Re: [f2fs-dev] [PATCH] f2fs: init discard policy after thread wakeup
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
Cc: linux-kernel@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

HI Chao,
>>		set_freezable();
>>   
>>		do {
>
>		if (!atomic_read(&dcc->discard_cmd_cnt))
>		       wait_ms = dpolicy.max_interval;

dpolicy has not been initialized for the first time, and the value in the stack is unstable.

Thx,
Yangtao


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
