Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id AEF70677033
	for <lists+linux-f2fs-devel@lfdr.de>; Sun, 22 Jan 2023 16:37:05 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1pJcP1-0008Gs-4z;
	Sun, 22 Jan 2023 15:37:02 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <frank.li@vivo.com>) id 1pJcP0-0008GQ-CV
 for linux-f2fs-devel@lists.sourceforge.net;
 Sun, 22 Jan 2023 15:37:01 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=MIME-Version:Content-Type:Content-Transfer-Encoding
 :References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=xU88Qgp8Gk9+VsEUbTvac4/6+o+e0MtIneaxHAfF3Zw=; b=bt+jv8STbiIbUiTMzpUZy7Ab/E
 MYSM9FZX4SaDkFd2+CVM8L42WSJMCq1x1g40ha7KFxxwAhfuP8jz1KbFzrgzqjLNs5Oky6jO0pPul
 hO6sCt0BQ8rB+IfQYq/ZELgV+JVGpSenwe5OUSEC16283EWe9erPezS9RuMZ/+NK+Vds=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=MIME-Version:Content-Type:Content-Transfer-Encoding:References:
 In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=xU88Qgp8Gk9+VsEUbTvac4/6+o+e0MtIneaxHAfF3Zw=; b=BcbX7ufD7VduB25KF5+RxvjuU7
 IxkvGbB8FAG96s7B6SMZhkecuPD/e9jAWKkisn8NLLRVdMgLfQ4OcBV5k2D11SwIWb5V4Dz6cNrzw
 8XVLo2XiWAV/4KgIL5bt1yD7fSJ3hsWuessBCRJ8d1BK1E1yr+7usy8knHfYor+AITiI=;
Received: from mail-psaapc01on2119.outbound.protection.outlook.com
 ([40.107.255.119] helo=APC01-PSA-obe.outbound.protection.outlook.com)
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1pJcOl-00CZ8K-VR for linux-f2fs-devel@lists.sourceforge.net;
 Sun, 22 Jan 2023 15:37:01 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=hK+2w8/AmSr9RW1TIaa7sapKXj4h9NWQXWjS1eTs1pD9tfnmXqIDZJWKS8slQlFapvhC0U3J3FvixzlePiX/a/CZiumCVZIy95RxLAhP4r6f2xU4vdZvy0wfcKS+Utx9CGvxXHKG8ls4JK+DmQ5v4D6Ubn7cX3ONtrjPGLtVH+y3J9x2hOdPEMqLENpsezeCJEyzmNwh+d/1imHeQDMwsBBEe2sYnzyPjWOyPevSaF6IPNsVPdOuTYDpeLOylASoE2nzdn82kW+8qg2BuVXRLKHzs7yjeTYzOwsWeeJOnUA4goSwW+IK8R7tIDdn6eg3uhdnsS22YQPaDBmDNxMPDA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xU88Qgp8Gk9+VsEUbTvac4/6+o+e0MtIneaxHAfF3Zw=;
 b=nsMNWDOYartGipKAq/M5NHM+9jjMJZJUMWdySVeYl+842qwmAgmvcNdu5EJ2jLzRRTo0IqLB4iG4w1De4uY5pcQE40JmqewtHhh+is8m7sYIxQN92XLqqNBKkzjkjWpeYKzmz3E5BnnXLUUHdVO2JA2Ya9k0X+wrlzIdY3B3DAYLNSiXBFVJkVVpFp3oe8ifTelwNbJupNcBGxW5d4nxhIFXjzocoQIngZ1jV8KY0nCnN1wXvhbVfZvErYTvhLuDwXkhEnaG7alia5tkQYUEyYKu+yG1KRq3jMhYn7g2jaFcwVHCbD/RxvN9J96/Z2QH9a1AvGN5puzIL4MuRUlMGQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vivo.com; dmarc=pass action=none header.from=vivo.com;
 dkim=pass header.d=vivo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vivo.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xU88Qgp8Gk9+VsEUbTvac4/6+o+e0MtIneaxHAfF3Zw=;
 b=BY7OcHjnGhiT+gVh6X3KJMbMZublOIgxWtYsU78Qn+tY8WhXOqnEuYCzqI9jwmDszuHzJYjX+QJBeGCZXfUuRwYyzYzxApruXp1Gv3gWYYHUvn2KA0Sy6NqYV6rM0AdbaTnNIrdvpEQSFr+lo8eSWnjKixJD5G1zK93hAREpVzlh3vlKrXzbdiWnYw5r8wNOKS6sGcBNO960MOhuYrKS8Btb66Dfv2kRZqLApFKfxG04ywR7/KF+fsgMCgGvFzDxfSs+sgsrbuPicZ/knwd4rbPF/Iuy5DUD+KbksegwZ0NZfdjuThL3yDTb1UnwLiZlsfa/1JdDh0fejsdTqx53fw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=vivo.com;
Received: from SEZPR06MB5269.apcprd06.prod.outlook.com (2603:1096:101:78::6)
 by SI2PR06MB4297.apcprd06.prod.outlook.com (2603:1096:4:15c::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6043.9; Sun, 22 Jan
 2023 15:36:37 +0000
Received: from SEZPR06MB5269.apcprd06.prod.outlook.com
 ([fe80::3e52:d08c:ecf4:d572]) by SEZPR06MB5269.apcprd06.prod.outlook.com
 ([fe80::3e52:d08c:ecf4:d572%5]) with mapi id 15.20.6043.009; Sun, 22 Jan 2023
 15:36:36 +0000
To: jaegeuk@kernel.org,
	chao@kernel.org
Date: Sun, 22 Jan 2023 23:36:28 +0800
Message-Id: <20230122153628.70625-1-frank.li@vivo.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20230122150049.66607-1-frank.li@vivo.com>
References: <20230122150049.66607-1-frank.li@vivo.com>
X-ClientProxiedBy: SI2P153CA0028.APCP153.PROD.OUTLOOK.COM (2603:1096:4:190::9)
 To SEZPR06MB5269.apcprd06.prod.outlook.com
 (2603:1096:101:78::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SEZPR06MB5269:EE_|SI2PR06MB4297:EE_
X-MS-Office365-Filtering-Correlation-Id: fbf9d0c9-7657-41d8-ebf4-08dafc8e72a3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Lni8LsQau6PslOhAKY1PfHNxjE2J3Iub1SLDQnLygiKHA6D/jALDOlmseutBGGThPWdTHMukphYdVJeKgdI/UWfWYEegRAYfaq0e357wuVJaLS3s0vZaTI2EUmKcFnE2RCdYChYvjUG6Fs/L2PLt4WMNw7JueMKHS2d51S+CbPEJAoMc5viNBGApWQj9D4dpmQf2AgCAiegRvd7Gdhd+7v5CeqGBDeCebs1anoaGHkfSRxt53g1P4/JAjbvrawnnKQnzL8pq2WIxJb66sgPNW639erWww+YmwllqJatuEZhGKEqPj6htW94ytx0G8rDZQ60vg1EEkokVxribNQunHMdo9zudvFfu/FKmzZgFrayGW5mxOdhl5DR1QKq0sX1H+J6SAaiWJASfRfSUmem0aSvWeO3fMqYRyDlFALxbyZc+7tEcflPaT/D0i/EHEPVM
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SEZPR06MB5269.apcprd06.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(4636009)(136003)(39850400004)(376002)(346002)(366004)(396003)(451199015)(38100700002)(38350700002)(558084003)(86362001)(8936002)(6486002)(66476007)(4326008)(66556008)(8676002)(2906002)(66946007)(6666004)(41300700001)(2616005)(1076003)(6506007)(186003)(26005)(6512007)(316002)(52116002)(478600001)(36756003);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?SjLNmLypV2Rd65jlOX5aUVJlSw7gGu1xQOeSsCWlZWkqgescOJ0H+tCR7Vsj?=
 =?us-ascii?Q?3eWdJGc23jYhE+GGzWIkTN7fZfbfdJqGtrXYOwBJ/AP3eTDAobBe1vc5OqWA?=
 =?us-ascii?Q?fFZROFWl95Uv8tHs3+IRg2MbxJW6azNy2IEj6B1mtvV1j9ZCsd661BJA683n?=
 =?us-ascii?Q?o+Xy1+Gj0Is4fpqfxtm6IDfuhHPdYLJAYA0QUUrEtxhHqSyXqhxD8f7OI/SO?=
 =?us-ascii?Q?lcG+jWCZtzBB7zHmhMRtXA0Uk2DR/co/M/ML9t5ZN9OwM/+wiPXJUcvBVTzM?=
 =?us-ascii?Q?xx7RjdbRAG6PZf/HWc5kI55H0LFf9WOcaIyktg11MCfM2aCWV394wAy+e9de?=
 =?us-ascii?Q?TykKL5NBe1h/n8LKWPi3R483h3d+LjjioWAHZBVujffZoCgImOKxGCQnHq3y?=
 =?us-ascii?Q?hsLe83IaERyi63fNg48h+RuqXVSgJckr6YSiLXTrRGnWQDIjHnXczF2XO6de?=
 =?us-ascii?Q?qp65uXoO79Q7xZU6Q2g0gsynLraa1Fx2ka8C7a6LZiP7ciTouDtUOyW96l1J?=
 =?us-ascii?Q?YfTnfvsGpXRpGxacAdzvy1JQzSUnCncZQp+b+KK9qL+KkbwSRDDsALPxs9G2?=
 =?us-ascii?Q?JrP5M6JWBJuxyJNxxspeMrDK+E+nfJ8vu0JmMc76qDRIH9DIOCsLmm2u9Wk7?=
 =?us-ascii?Q?AasLXvS8alJesvY7zYFQGMDXp+5If+qKF+ovO8Qwpn/f+FP6VNviRoYLKGu4?=
 =?us-ascii?Q?Ad8taW+jmDLXfoNpEyyUDaYF4MC+WEWc1AYKnpVHVeGeiTmvpNpqymIMNQoN?=
 =?us-ascii?Q?gQCMftdIn8teirTE+tgQ/YZtDk2Te0U6ewUMwRoGpX1DE+7GgS2tdj7QOUGT?=
 =?us-ascii?Q?/DrGP/UblWSkNZi5bZXLiSh0YRhaRpYY9DllFjJLKf2lko3L1hvZ3aATzsCZ?=
 =?us-ascii?Q?lLRu2KDhZjd4ToLO1001+1FMzsuy5RZp1J7DXx63gDxd9ivatCdOKwXyuWnp?=
 =?us-ascii?Q?orFIWXZlqt/r3zumaPEyF2qqB4S2SYLJ6j/98tLtHp0QBju8PMGIX/rfuAmu?=
 =?us-ascii?Q?l3DTteUjhmvzeSJuk2OoWJ1i1zCkYSEFs6XGLTsj62stSSm/Pll3a5jLm8p9?=
 =?us-ascii?Q?fEdLHpbHoek4qlllTBAtP2A5OJIjZCWQK8sslRrmjeRxdiv/rm9QHjWN69IB?=
 =?us-ascii?Q?c5lP2ZntSzxDIilim6ld+IHu+sczFfswyWm9lxZ2FTY3DwTRO9uJBAXl7ASL?=
 =?us-ascii?Q?gzepEDT0P6d/nS4jwdaLvpAMkY0zMeUu2oKIlI8+bQq4q8reYwAx/pa2jQJh?=
 =?us-ascii?Q?AeW9QP/VmE324u1gSRZg4E/TKVe10RWLlQQ6iLRajYKxwgtoGKz15yuygMko?=
 =?us-ascii?Q?0wPVdpxCr95XdyPi0y82NFDi3VVBMxyMBWIZ+V52nFqbnAjM+IANZLAdWmJy?=
 =?us-ascii?Q?v8qXqbB9FSpz2Uwflx09Zabs7NJAEmw8tDPTC/wGI51FDoZbzu8zfMZpLFFU?=
 =?us-ascii?Q?uZoCTcA4ia49k0lKrAbRBP0MzbntMX9UniWfBQbcVtPgzWhcsAwjYf3tFFGL?=
 =?us-ascii?Q?8NNOqNE0XHuOYOZ8+Fst+bIeiVU2UKKyFVD11y0oRSd46Esnoo0pA5D1DFtf?=
 =?us-ascii?Q?yWH/0PmEbArEzlsEP4fKxHcFxHUW9vFhIH07OG86?=
X-OriginatorOrg: vivo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fbf9d0c9-7657-41d8-ebf4-08dafc8e72a3
X-MS-Exchange-CrossTenant-AuthSource: SEZPR06MB5269.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Jan 2023 15:36:36.7590 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 923e42dc-48d5-4cbe-b582-1a797a6412ed
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: lFUmRuMuEEzJzNihbLFBOYasK0TF2R4+bhepxy4g7fQYE1YLIFtLwT7+KnrAsKX6w9SBBsAFU4NPEEd3YFq1kA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SI2PR06MB4297
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  +CC Nick Terrell 
 Content analysis details:   (-0.2 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
 no trust [40.107.255.119 listed in list.dnswl.org]
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [40.107.255.119 listed in wl.mailspike.net]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.0 SPF_HELO_PASS          SPF: HELO matches SPF record
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
X-Headers-End: 1pJcOl-00CZ8K-VR
Subject: Re: [f2fs-dev] f2fs: add F2FS_IOC_SET_COMPRESS_OPTION_V2 ioctl
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

+CC Nick Terrell


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
