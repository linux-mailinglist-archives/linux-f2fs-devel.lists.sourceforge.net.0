Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id B3F2464F7A3
	for <lists+linux-f2fs-devel@lfdr.de>; Sat, 17 Dec 2022 05:52:31 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1p6PBQ-0002tj-SB;
	Sat, 17 Dec 2022 04:52:24 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <frank.li@vivo.com>) id 1p6PBP-0002tc-Gm
 for linux-f2fs-devel@lists.sourceforge.net;
 Sat, 17 Dec 2022 04:52:23 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=MIME-Version:Content-Type:Content-Transfer-Encoding
 :References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=k0CuqBwJ5lRRxt79r9iTsFmabkWW1LCP8Nwvvg4/CzU=; b=KjhRLC/T3YTMSTnmq30JL6jLuG
 L0rzfDPwlWdNmJ0lAZFCVKVPEdCQqFORxz9fsNeeCcelwE+iGamBU+4y+36MgvP2qfs9q4T2IIh+K
 bCwNwSmHEQ64RGHIQwnOZM5eI2uIIMfB37DZf9OmUQYN/SYrq3YsFeSygYNVCbUGYhRw=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=MIME-Version:Content-Type:Content-Transfer-Encoding:References:
 In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=k0CuqBwJ5lRRxt79r9iTsFmabkWW1LCP8Nwvvg4/CzU=; b=hJloSE8P8jD4oODW5tofdkK6wy
 d+0Rdc7yEmDVwI///HgzSrWZ7uXFoRx/keFRmYjpArF8WGiR9mdlBAhtvTl7UFXYAL1YQzCgYy8pk
 1ZSW21yJVm2BkkRfMd6nUP2P9BthfCowywEK6Q8rBSbKEgZP2we0bRu5Cg+it7icLUtw=;
Received: from mail-psaapc01on2099.outbound.protection.outlook.com
 ([40.107.255.99] helo=APC01-PSA-obe.outbound.protection.outlook.com)
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1p6PBF-0003dk-9V for linux-f2fs-devel@lists.sourceforge.net;
 Sat, 17 Dec 2022 04:52:20 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=CLS8uPZwK2bI/iZ9p4opvH9N9XBWuMeqqLkNr4JaK4TEMKcUQRx+Uz8YvN2WLcrWkJo/8Pz3Y52QSxgMseAqjw8g2P9p7A4/phdsYl7rnYQdPM5Sg4GQErgbe20gpJ6sCVX/T06mzUUDdSwrONWpH7MJiwKslee4/rDYuVotVriZo38OEvHKl27mycx8fVpnju4qOQs9YhH5gaUvhkhesaunQymydjBra3pK4xrUUx1qTVMKmjqBTbFantoasuOuKF5WEZEqDTsVKMsL5MzGu/8e0lcmn/pjxVWOovwgSFx3d54cLrgBHX0kxBdrQCEVgug73lBQQaXkFdTA0VYtRQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=k0CuqBwJ5lRRxt79r9iTsFmabkWW1LCP8Nwvvg4/CzU=;
 b=EqAtkYvM6NydyWosa3buYlOZx8hpF3F7SubiZMScx61A5XwA11l+R46S45rwDvnW1OxWHPxx7TG2DGGds4uF4fKfejAiFx9wUdUBtvF1WK0orfrJWkoJdS4SmPePhUOyjxylj0cYsa3v0n6dV7TvHFb2ryoyXvubu9+v7pKxAxEZ92rDWoaN9Dbl0EDJIthxylQVVczcI8mQGHSmchK8uSbGRkBI5EP7yNJnzaupXGzZt439yYVUcZbe+WFaJP/4tv9TvGS1Svl7opXur7XDee1LR/tpbUxWl3Dpo5UjD6+SphhGRwvH6ubscadHbQ0ZrfnWU81g+w//aqibBMqnmg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vivo.com; dmarc=pass action=none header.from=vivo.com;
 dkim=pass header.d=vivo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vivo.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=k0CuqBwJ5lRRxt79r9iTsFmabkWW1LCP8Nwvvg4/CzU=;
 b=NyTktvoxgeNQXGBV1xGZx9bHRqXJLSENbhnpfLLPlE0WlSMQiBpzBUZcA+7V/IckB2OqTqDGT2vpyG4hO7JdKPyhRMziHK7S0kI5vSnhb/sAxEFjjeRhDPEFA4OnV6lOWnEKonTz/adC3Dzwr19Qc8A81WY4lR4zDbgRMiDjJRAl9bZ5n4vuifGAHSss8n42co/cJQRtJ9w8RTsxEP3SThPYRMu4ae2sABF0/OCmibfNvlhRxKmsD8flh8lyWkk6XB0vQtD+UPHC8yA5dVy5/GK8jZCeY2pQqPPi6gSM092bP4ZTVIaYCsHlzmFSEkyle1t61xzmY6uUXVOECqPG+A==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=vivo.com;
Received: from SEZPR06MB5269.apcprd06.prod.outlook.com (2603:1096:101:78::6)
 by KL1PR06MB6020.apcprd06.prod.outlook.com (2603:1096:820:d8::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5924.14; Sat, 17 Dec
 2022 04:52:01 +0000
Received: from SEZPR06MB5269.apcprd06.prod.outlook.com
 ([fe80::ef03:cbfb:f8ef:d88b]) by SEZPR06MB5269.apcprd06.prod.outlook.com
 ([fe80::ef03:cbfb:f8ef:d88b%9]) with mapi id 15.20.5924.016; Sat, 17 Dec 2022
 04:52:00 +0000
To: jaegeuk@kernel.org,
	chao@kernel.org
Date: Sat, 17 Dec 2022 12:51:51 +0800
Message-Id: <20221217045151.56195-1-frank.li@vivo.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <0377292c-ba43-06cd-2638-8e41e2e75f3a@kernel.org>
References: <0377292c-ba43-06cd-2638-8e41e2e75f3a@kernel.org>
X-ClientProxiedBy: SI1PR02CA0046.apcprd02.prod.outlook.com
 (2603:1096:4:1f5::14) To SEZPR06MB5269.apcprd06.prod.outlook.com
 (2603:1096:101:78::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SEZPR06MB5269:EE_|KL1PR06MB6020:EE_
X-MS-Office365-Filtering-Correlation-Id: d70fef0e-06e2-486d-60d0-08dadfea6ee7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: xKJI+Ry11jLpXmMNY8H1vGXsRHq4x8qvsffOVjrgdsKO2KY3MO6dXcxnLFrjABYpE8heRnT5QBs4zRaGkpDcNBEtTudXigiR2SaiD4tXI+g+7gQN2IxqrQALzaG5xc22sasO/XcU/+gwrzcfLswMH+ycTFiWjYyUJv7eRaEoiOxgdjguine5LO9Gb5W5GOW/Arl6ZQE7SejWs3NayinRQ69mb9JR8QY+MapQxlKJcmdsGIDBrGq5+y2sAxcLBZQh9++XbRXWKsDjP8wFVx5EwZWuy4f+2Qz5VCeDqCiTpljTaTaU4HBR1thtMQdBNzmyA2N43bEGXqEHHqM5xpdvNhWmY/cF6rm0YwoMmnCtW1xp9gMQnGUH8+VYmTnSIK9mZ5PQxqcbYDCeEIaiOV+Uc6Arspo7YvMG+Da4eBGKSNw3khIiLjdaQprsJh/En4Avzd9Gi6eYhkgVRgDYvxIl40LsBEYe5PHTjdNpBGmsEJwu7fiKiX1JotVht5J1Gm9LcFppH0A2ZU/o95Uk4A2cSApluYy1rWocDwkoXAjOvfDsR7w1yHJzPLSgGJQFLpdf1uj46Qj8AaCno/9Sx5AHD70lD5uck/OhyxHQNt9BltkpvI6soXh5yo3bN+sOyhOznMH1uWQBJIlZZzvS69qMZHT03tYZG5IPoyUQPHFendm1o3DDfoXoFJYUaKowvY/6cM7pYINfm/3xRPt1y5eAlA==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SEZPR06MB5269.apcprd06.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(4636009)(39860400002)(136003)(396003)(376002)(346002)(366004)(451199015)(5660300002)(4326008)(8676002)(8936002)(66556008)(66946007)(66476007)(41300700001)(4744005)(52116002)(478600001)(316002)(36756003)(2906002)(6486002)(2616005)(1076003)(86362001)(6666004)(6512007)(26005)(6506007)(186003)(83380400001)(38100700002)(38350700002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?RIpbMSl+MHsEYg4XVLCNfcWn0TlS20qApKASybgFBaRHFPlp5mfogjonOOgG?=
 =?us-ascii?Q?S2uk4HpaoNSSIUMAPuibdZOBNpABra2KQSk2h33lqQ4IWS0w3ABHtaxz3Jj4?=
 =?us-ascii?Q?qz30WH9BUzlOq4tEEhNNwt0oAqck4z/OUTjp0xDp3+NcWubMkGl1cHLIGCAp?=
 =?us-ascii?Q?GbFGopMKBLjxjIhXhB8G/Ovj+LALzbH09Mf9NI/T56c1HAcXClTFp5Zen3ZI?=
 =?us-ascii?Q?YJ2cL780JtcrnAW8zt4HCsczceVXYw6mSuTqy3oOydC0rCVD9k6AOzsZojaY?=
 =?us-ascii?Q?kK61ii+P1k1iG34uBhAOW9RXA4v3CJ5QjsfkeaSO5pnGFHsqiObTFfmpzz4w?=
 =?us-ascii?Q?qFry/GA7GwuLF0phgYrYa+Bm4UbYouMViJlOgC5Jzwzje+3g5Nf/G+K5JwkZ?=
 =?us-ascii?Q?9XHNVVJs7W0YY243KAzVt3OxvsSdGp28Yse+Boj86NxFYxngyXC4nhAgFldy?=
 =?us-ascii?Q?EuNU67B5nGtlG7iyQWmURXsWv4a0VAYM7PhBmU/NOf3/8VOSEGqKD4oqqtrf?=
 =?us-ascii?Q?zOvO30ZLxxlu6IWsVK4/9GGczFHziUz7ZSkESS02PWphV5f1YeKASeooNxMf?=
 =?us-ascii?Q?SYBSSIaOSj4Ljl4fNUwWKFeqKn703Jf5JyBNf3rkvEyZG/QH8v4q1pyrQK39?=
 =?us-ascii?Q?hxQAsFmQsL9Gp7DNgkt8+Vjreelw2WtyEhm3/kajVLGJfwqNwgK+rUC1cF7r?=
 =?us-ascii?Q?RZG8yKQrpkcKy3Qn0GiWg7Kg2YgKiOF2Wq5pFthHsEFNVK1mOYzSPpCVVzr8?=
 =?us-ascii?Q?71AvJUIr7Kz0yTQXDXetPnRFUete8JOAW/SlnxL8I4ElGl9EGbH8DtEW3RBo?=
 =?us-ascii?Q?dvKlbjLYvPFRz/5741itHHJEDfhZyWMQVii2gUo/nXzXeq41Yk/Ntzl1Z3sU?=
 =?us-ascii?Q?aIPAAhCZQf8/7Ariljxb2M6XQsZ466PxP6DYAHLafRZlyxci2lBCos2dxLrH?=
 =?us-ascii?Q?/RYoiwCl5b2PejlfRh0xVXnheawrNWiAdsTr66xMv40qVHcwpGX9+WL21d1S?=
 =?us-ascii?Q?bxeYAj74u+ADUh98sO1dmn271L0hC7GpXHZQLlHhkcGTg/iGP8rfWdO30dsZ?=
 =?us-ascii?Q?y/0yAHxczLqJcv8Io1Awz3JBUXgXYxg/5MFDeBo86iEgSRysCb+r/0it8JwJ?=
 =?us-ascii?Q?6dp10jt1FA2r0cKacJ9LhUZ43hmDDDk1r6dgDGqY3sX7j5uCnHGd8dCwk4r4?=
 =?us-ascii?Q?pOZXD29jCitZQXqJppPn33OgZIDGM1V2Lknntrv2p/i9QWizIHrJqgWZdsre?=
 =?us-ascii?Q?Tr2++KQRymQY6PoMZIaCcWhDYCmPnUWeQz+hgJbcp2USVk6jP9ZYTnQEiuHU?=
 =?us-ascii?Q?Z8irTb3/8ppJ2fsSsqTOQiFLbTE8+Tv/oVVsJIigT/SOULkh+6E12P2U0xEN?=
 =?us-ascii?Q?kF4saBdXhnEPSb027a1FfWkMk137glu4DKldYSib6OpBDwhE3+G+MpeRcA2x?=
 =?us-ascii?Q?qWd4aQEZtaoBWcPFPQhRhzIXRK1QTcZcvMdm1667N7e0Llg2GifMizEn7s9r?=
 =?us-ascii?Q?lKW817pvK99OSML0uTMFZomy/WOqgz49yLyJudySxK4ZInjpqgSNAjmz3hyn?=
 =?us-ascii?Q?EgXuSAJWOn1+lxbjKSY5EozPBvWWkabdqei7rD1N?=
X-OriginatorOrg: vivo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d70fef0e-06e2-486d-60d0-08dadfea6ee7
X-MS-Exchange-CrossTenant-AuthSource: SEZPR06MB5269.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Dec 2022 04:52:00.5157 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 923e42dc-48d5-4cbe-b582-1a797a6412ed
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: pF2o0lImHlbZlivUY5jC2E2DNGUasOKjfazEgQyEpflWj3fEdyeEllj8/UXFHHIxDhJBr+PK7K/n0VSFTnpXDg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: KL1PR06MB6020
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  Hi Chao, > Yeah, but it depends on compile option, right?
 If user use -O0 or -fno-inline option, inline function will not be expanded...
 This is not a problem, we just need to mark it as __always_inline. 
 Content analysis details:   (-0.2 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
 no trust [40.107.255.99 listed in list.dnswl.org]
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [40.107.255.99 listed in wl.mailspike.net]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.0 SPF_HELO_PASS          SPF: HELO matches SPF record
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
X-Headers-End: 1p6PBF-0003dk-9V
Subject: Re: [f2fs-dev] [PATCH] f2fs: merge f2fs_show_injection_info() into
 time_to_inject()
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

Hi Chao,

> Yeah, but it depends on compile option, right? If user use -O0 or -fno-inline option, inline function will not be expanded...

This is not a problem, we just need to mark it as __always_inline.

static __always_inline bool __time_to_inject(struct f2fs_sb_info *sbi, int type,
                                    const char *func_name)

> How about using deterministic implementation?

This way works, or do you have a better suggestion. After marking the function as __always_inline,
there will be no problem you mentioned.

Thx,
Yangtao


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
