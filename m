Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D63C607448
	for <lists+linux-f2fs-devel@lfdr.de>; Fri, 21 Oct 2022 11:40:05 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1oloVT-0007SW-T8;
	Fri, 21 Oct 2022 09:39:59 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <frank.li@vivo.com>) id 1oloVS-0007SO-HO
 for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 21 Oct 2022 09:39:58 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=MIME-Version:Content-Type:Content-Transfer-Encoding
 :Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=MeL1sbpaN1tsh35yh7Cv9PYd8DA5oMBdnIsSRzp43xw=; b=HcbrO6y0MtukpjYspc2UMl360G
 0pwvclwz9T1BOrEea/BAIOyjMjuqd5eMS/CNfpmQHB5GhUVWED+vKZ2dlX2MFgn2URY3OxpMFWqt4
 oWN0/hcmUGQAIRea/2JFVOT2vhKY4LuwTQmcP0B0eehIQ3uQDOiTvg1AO1x4EfNuwejE=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:Date:
 Subject:Cc:To:From:Sender:Reply-To:Content-ID:Content-Description:Resent-Date
 :Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=MeL1sbpaN1tsh35yh7Cv9PYd8DA5oMBdnIsSRzp43xw=; b=D
 jyHVnChVb8vSvUx/TeedRbUtw3bxiDOFLmEpQPbJLt/HXOc4Z1ZSOxs7CNqF5fcoJH6QmUmJXl2hx
 piRosCV9HDpTiMeOBFrbkuzV5UVs08T3p5BtpoWojybcec7fHE31BzsFV19e08q13vqwcy7ke0/ln
 J7P4JYDnm/bw0dI0=;
Received: from mail-psaapc01on2125.outbound.protection.outlook.com
 ([40.107.255.125] helo=APC01-PSA-obe.outbound.protection.outlook.com)
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1oloVO-0000SG-R1 for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 21 Oct 2022 09:39:58 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=jUu5J6UGrFxvkVx53OBj8Hqw36xqCb5M8W/51+6q/G8f5/m6/V7zRsJlAwPRF0RM3jzSX1V0EmF8hKKraKVLGIAR6kVSSYUggCkAXmeJyz8CgXHJUhzJqYo1gNjOIzLl2r06nJ7/zLGr3JgiK3OJSZ1EbmaeWOtZhG4fuH8Xi61BNP0veM6ZNZlvLioIYHzQuaU2Qc+O+Iof+AOK6lPrnvPwWEf9bMIhclMp1RkcnyM5ozVdC6Uj07SHuHWiEFsl6UPuRd7csE49Fib+D83VLUUDBPgdl42c/RAS+ZbDkkZhDHJ4z3Zxeyyixg93j6PqWqb1buDpr5CbZuDeK7AesQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=MeL1sbpaN1tsh35yh7Cv9PYd8DA5oMBdnIsSRzp43xw=;
 b=CXPZYRUtw9Xfx1AYAufAFKooIuCnbzwQwPGEpACGZ5fLWDSUUypxF/PHiR3/dQ0H5MW8QCnTFMC6YF/F4aMjrFsj9dOA59yT1S/VC1YNdFKUHzFOP1psASyJyPAx2GjUZlwn6v6Ey7XEswMo6sXY74w1i2WlaOpDd+ByhHxIPZjA9tMKDGBPF8EeHxESgTd/x3CmtcAr940Pwc2I+4GjOvyVjGyX6TShORZq1PPb2xBviU+wb+Uxo5i0MaanM/vgEkZ//2kvAWh6elColWL2Gn3hYhlWYwEpxkvrVJDDKhC3dQG1D+U51jlTfmM9MUYYdDTzEEP/X9KPoQOf85cukg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vivo.com; dmarc=pass action=none header.from=vivo.com;
 dkim=pass header.d=vivo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vivo.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MeL1sbpaN1tsh35yh7Cv9PYd8DA5oMBdnIsSRzp43xw=;
 b=NmUYkAIb2Bty8riIFT7Sj7WAQ0Pi2fEYmH1A8mUTaGuBHWdU+NWstsi8JaJcRhuNmzGaybn8xNZHoeLV2Vy6qcozdMTVxevJcpSi2q7KGWqGGX5TFeDjxtJPkSTlmMHIyjjPbGEu+tBwEY+wObZIwYia4AMpNTwdBrdI7VR+ZYqOilocj1hrlil5MSpZWz7lq+On/aeGY065EVpazi5dEyEsqRuguSHTyTARgaCiuODdT8yCJIhl5Ip/bBtTFv7acIbQx5M2fRh7HfROr7SoFjclJO2/C7iQQWONJa9VNVFYrCGxOqovyR3sF9imDVANTrsoQPGQKKCbZ1NhPMRoPg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=vivo.com;
Received: from SEZPR06MB5269.apcprd06.prod.outlook.com (2603:1096:101:78::6)
 by SEYPR06MB5860.apcprd06.prod.outlook.com (2603:1096:101:bf::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5723.34; Fri, 21 Oct
 2022 09:24:44 +0000
Received: from SEZPR06MB5269.apcprd06.prod.outlook.com
 ([fe80::c84b:5a6c:d66f:c0fd]) by SEZPR06MB5269.apcprd06.prod.outlook.com
 ([fe80::c84b:5a6c:d66f:c0fd%3]) with mapi id 15.20.5723.034; Fri, 21 Oct 2022
 09:24:44 +0000
To: jaegeuk@kernel.org,
	chao@kernel.org
Date: Fri, 21 Oct 2022 17:24:35 +0800
Message-Id: <20221021092435.17124-1-frank.li@vivo.com>
X-Mailer: git-send-email 2.35.1
X-ClientProxiedBy: SI2PR01CA0003.apcprd01.prod.exchangelabs.com
 (2603:1096:4:191::16) To SEZPR06MB5269.apcprd06.prod.outlook.com
 (2603:1096:101:78::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SEZPR06MB5269:EE_|SEYPR06MB5860:EE_
X-MS-Office365-Filtering-Correlation-Id: d4f29a73-d755-4fc4-8bc0-08dab346171b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: O1AO8FZy4YU0H4VWZ8zGjl9UIhU3X7+c/l9LSBHv4FABDPhN13hbdgg9Ai4nQwHCNvuMzCgWDUVENOb4C2XtfrWzYeA1j2GI+2jb6NxN4wayZAMG648vnJWrqruIVXegqcEVDNcmgW4dRMYJZJKFZhQ3Q5wJ8FcGXMT+lr8K8aCoMTH96Aa+tUu4cPx+Y/f2G5JkYvDQIPIfsf1+6YLqp4IR3o6AUMxVtfzPMCXdBkANWv5rtMrI56vXxEL3uQiww7ymsfLaFl8dRkiu6FrewOFAj+n4Q/ilgzkQZeSPx0eGFOHZtXSwLvwdZoeNYVe2ARyZVQbwKITLsgw2pniqHaicFdgzfOTBWiHeTxJVrJlFvHQq8qtWAZ1mpCGAnKUjD8/Ipphfo9lxAPhdIYr+AOqzztLQbn6+SGm6743KewkzPYVLM0pxOuL3Csk9+Feab3NWc5OQzDNEQJVaiv/nv3SJHze+lSosTTk/ncGgmnkhBvQJ3hHsLFTWl6m5aMM5rfM39qyUfjdvPbSO/eYNnrAIS5uHMgYecurAtrRKePk0N5syMZF69HlwGAxJhXQThK+W0P1JUVESjTcZ2e8605UHc5ZQRMw70sNBxB6C62icRueKl41RwqFUOBgRNVNiBRbrP7zFH9iYzYzwtvNb2kHrHHNjyhYbYBC6vWHmZ9QFIr/PEMnITqAJ4FahkyeN9S+hHdfbYqFO4tPZWpPApw25IgAR9my5MjnYqlumC8iy2AoPYIUr3fjymr4Lf/NOxVVWI6v9Ejk5qJFAq220Lw==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SEZPR06MB5269.apcprd06.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(4636009)(376002)(366004)(346002)(396003)(136003)(39860400002)(451199015)(41300700001)(316002)(186003)(8936002)(6512007)(6506007)(2616005)(26005)(6666004)(2906002)(66476007)(1076003)(5660300002)(4326008)(107886003)(86362001)(66946007)(83380400001)(52116002)(66556008)(36756003)(8676002)(478600001)(38100700002)(38350700002)(6486002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?wNc2Yji/kbtrQGyLurBSpbf4qugLAMT6/avwOOSl/z+mnXSIRWlD66NGpvQO?=
 =?us-ascii?Q?iAACseX0jInmP7u/i4/ve1hTujKGR0E8D7mNrxboFcREmywzgYOrfuAG7TfF?=
 =?us-ascii?Q?1KQZOApKMht6rtysC3kNgZHHc19rYLIElKOa3inX+tl91nwtJYsyaOyq1ssJ?=
 =?us-ascii?Q?CdOR7jJ37IWuxv8bcNoipoPUa9XrJ9+xvqKX+LqIufVBLRFY+6yOZfHMl6Kj?=
 =?us-ascii?Q?M7Q0FT4bBNg2T15dzlgeSIsaJwRd6EU8E2aNheZZ9xlPi0UO4SJxdTd/P6NT?=
 =?us-ascii?Q?CA+aKdIjCwl7ZKbfdzjdgoAV/wj4sBx/Z16uugR8GUNBSgbKYnyCI5hP6pC7?=
 =?us-ascii?Q?44wvdONg8GUhQZe1KGqbISHoX7X1rol8WPrYdrRWD5n1iYUTDXYRTGXSzUBK?=
 =?us-ascii?Q?XKGw2+bvJsrdqkWRcJTQfnageF5CESOQKpyqgaAxPAKY+IHqy6zrxIHNAugo?=
 =?us-ascii?Q?t/1fqP7GAZBjt0z6bYxuGbBHjHKMu88AM4OdxXu07ws45AVJoWKwMus9nzWc?=
 =?us-ascii?Q?OCSJLZTDvoCe6UkdBWhsJPuRa3Q5v7Ch1y34wzuyMHCuzZ2LK7/ZJzWG6589?=
 =?us-ascii?Q?hee+NXmfqguHKaI/wF0vre8vU3byZnxPOBPZFJRzjg5CcYcHAbJLCZTx84OM?=
 =?us-ascii?Q?oU4ovBfnXoT6zHsuflx8gFSb4Dz7mbsZ3U2fDgRy0towoUyOc4lkcnEeesqw?=
 =?us-ascii?Q?hkLCaLWZjgae8tY7B+WlfgGHlecgrN+5L7f8+JirD9u3FeB8jopqnsYuOMHp?=
 =?us-ascii?Q?Rixigd5gCaVonojxcZloaQJlcPDCygs7aUmuM4hKSXkeerAe9pCZH/s6b4zi?=
 =?us-ascii?Q?fC3hdZzy3sZXs4pw6JjX/dA7W7ZRapTtHn+ym2fTI9tuuISG2kX3oliLx7Ig?=
 =?us-ascii?Q?5H0COHgBZCx2n/EXAYC7Kf0tIZx9w1yvdRtIfjVNpUluqXFBuDTTzihmsMLI?=
 =?us-ascii?Q?q2HwXHgJQ++7RV7GDrCzYUt+z/ZGRG4GPAgFyS/Hj7GeRxzIxK9fjSNeSNse?=
 =?us-ascii?Q?qUp0vMI7KLB0D1KuuXKvk8TWdlG+bKcVyjoDgGl63ow0M3+SsKcGLQ78UKr+?=
 =?us-ascii?Q?dWXcUNa5tbGGoDNrzcdF1E/Ncn4rjdqem4RHUL2pdVew/gVzPbyrNC8GUqpV?=
 =?us-ascii?Q?a9ADw8xReHCJKsGIQWmwHNvYwDnzgTUVX/mFBMF88qDt9XPZ50fIyyrmg0D8?=
 =?us-ascii?Q?feDwoKOr/Xyitg5vRnX8lO8n/m94T8qKodM6qxhHhdrc4Tgw0fUi9+nULb9L?=
 =?us-ascii?Q?vBWXbPnGHiddz3lmhu000KcoA/923nj5DOZ+vRtI9X+AgaYWkMLnE+JyGzfA?=
 =?us-ascii?Q?Ewet/PRQNNPKsdDEISAraivfmTXBuZJ//EBQH35LHGBJvTLlyzzmaCGDRhfB?=
 =?us-ascii?Q?nJMj9Xfym9qIiNfzhBohUXVISd+BJxaOEOWDLNZSEPWz+bq3s/IpNwfi/gGO?=
 =?us-ascii?Q?b4dwbKTI1o4Ceu0B8n4U3+HvoNsuoakK45Wmu7euSVjbVTTmOlbVlTAbXGht?=
 =?us-ascii?Q?eMMNNxvj8inEAjpKShuA22KWw6kHyUBYJfCTSdm+JQvS//DgWK2TuZJUuAHJ?=
 =?us-ascii?Q?chvAPJYOIbifoTKcK79Px/d0/7d8XvhHvuNJhPR8?=
X-OriginatorOrg: vivo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d4f29a73-d755-4fc4-8bc0-08dab346171b
X-MS-Exchange-CrossTenant-AuthSource: SEZPR06MB5269.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Oct 2022 09:24:44.4203 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 923e42dc-48d5-4cbe-b582-1a797a6412ed
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 44NKpmeo+3EJaMmNYrNgxGma+kgKdk5YLlu+VZlLPCCP5s6S+CNfYNsTPgUuys7HuTBv/+gGFkl0k6fcg1JUBA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SEYPR06MB5860
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: This patch shows the discard pend list information: Discard
 pend list(X:exist .:not exist): 0 X X X X X X X X X X X X X X X X X X X X
 X X X X X X X X X X X X 32 X X X X . X X . X X X X X X X X X X X X . X X
 . X X . X X . X X 64 . . X X . X X . . X . . [...] 
 Content analysis details:   (-0.2 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
 no trust [40.107.255.125 listed in list.dnswl.org]
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [40.107.255.125 listed in wl.mailspike.net]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.0 SPF_HELO_PASS          SPF: HELO matches SPF record
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
X-Headers-End: 1oloVO-0000SG-R1
Subject: [f2fs-dev] [PATCH] f2fs: show more debug info for discard pend list
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
Cc: Yangtao Li <frank.li@vivo.com>, linux-kernel@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

This patch shows the discard pend list information:

Discard pend list(X:exist .:not exist):
  0   X X X X X X X X X X X X X X X X X X X X X X X X X X X X X X X X
  32  X X X X . X X . X X X X X X X X X X X X . X X . X X . X X . X X
  64  . . X X . X X . . X . . . X X . X . X . X X . X . X X . . . X .
  96  . X . . . . X . . . . X . . . X X . . . . . . . . . X . . X X .
  128 . X . . . X . . X X X . . . . . X X X . . X . . . . . . . X . X
  160 . . X . . . . . X . . . . . . . . . X . . . X X . . . X . X . .
  192 . . . . . . . . . . . . . . . . X . . . . . . . . . . . . . . .
  224 . X . . . . X . . X . . . . . . . X . . . . . . . X . . . X . .
  256 . . . . . . X . . . . . . . . . . . . . . . . . . . . . . . X .
  288 . . . . . . . . . . X . . . . . . . X . . . . . . . . . . . . .
  320 . . . . . . X X . . X . . . X X . . . . . . . X . . . . . . . .
  352 . . . . . X . . . . . . . . . . . . . . X . . . . . . . . X . .
  384 . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . X
  416 X . . . . X . . . . . . . . . . . . . . . . . . . . . . . . . .
  448 . . . . . . . . X . . . . . . . . . . . . . . . . X . . . . . .
  480 . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . .

Signed-off-by: Yangtao Li <frank.li@vivo.com>
---
 fs/f2fs/debug.c | 23 +++++++++++++++++++++++
 fs/f2fs/f2fs.h  |  1 +
 2 files changed, 24 insertions(+)

diff --git a/fs/f2fs/debug.c b/fs/f2fs/debug.c
index a216dcdf6941..343e0fa3b1be 100644
--- a/fs/f2fs/debug.c
+++ b/fs/f2fs/debug.c
@@ -109,6 +109,7 @@ static void update_general_status(struct f2fs_sb_info *sbi)
 			llist_empty(&SM_I(sbi)->fcc_info->issue_list);
 	}
 	if (SM_I(sbi)->dcc_info) {
+		struct discard_cmd_control *dcc = SM_I(sbi)->dcc_info;
 		si->nr_discarded =
 			atomic_read(&SM_I(sbi)->dcc_info->issued_discard);
 		si->nr_discarding =
@@ -116,6 +117,14 @@ static void update_general_status(struct f2fs_sb_info *sbi)
 		si->nr_discard_cmd =
 			atomic_read(&SM_I(sbi)->dcc_info->discard_cmd_cnt);
 		si->undiscard_blks = SM_I(sbi)->dcc_info->undiscard_blks;
+		mutex_lock(&dcc->cmd_lock);
+		for (i = 0; i < MAX_PLIST_NUM; i++) {
+			if (!list_empty(&dcc->pend_list[i]))
+				si->discard_pend_list_exist[i] = true;
+			else
+				si->discard_pend_list_exist[i] = false;
+		}
+		mutex_unlock(&dcc->cmd_lock);
 	}
 	si->nr_issued_ckpt = atomic_read(&sbi->cprc_info.issued_ckpt);
 	si->nr_total_ckpt = atomic_read(&sbi->cprc_info.total_ckpt);
@@ -549,6 +558,20 @@ static int stat_show(struct seq_file *s, void *v)
 		for (j = 0; j < si->util_free; j++)
 			seq_putc(s, '-');
 		seq_puts(s, "]\n\n");
+
+		/* Discard pend list info */
+		if (SM_I(si->sbi)->dcc_info) {
+			seq_puts(s, "Discard pend list(X:exist .:not exist):\n");
+			for (j = 0; j < MAX_PLIST_NUM; j++) {
+				if (j % 32 == 0)
+					seq_printf(s, "  %-3d", j);
+				seq_printf(s, " %c", si->discard_pend_list_exist[j] ? 'X' : '.');
+				if (j % 32 == 31)
+					seq_putc(s, '\n');
+			}
+			seq_putc(s, '\n');
+		}
+
 		seq_printf(s, "IPU: %u blocks\n", si->inplace_count);
 		seq_printf(s, "SSR: %u blocks in %u segments\n",
 			   si->block_count[SSR], si->segment_count[SSR]);
diff --git a/fs/f2fs/f2fs.h b/fs/f2fs/f2fs.h
index 2f33d6f23a26..c444f3f86608 100644
--- a/fs/f2fs/f2fs.h
+++ b/fs/f2fs/f2fs.h
@@ -3875,6 +3875,7 @@ struct f2fs_stat_info {
 	int nr_discarding, nr_discarded;
 	int nr_discard_cmd;
 	unsigned int undiscard_blks;
+	bool discard_pend_list_exist[MAX_PLIST_NUM];
 	int nr_issued_ckpt, nr_total_ckpt, nr_queued_ckpt;
 	unsigned int cur_ckpt_time, peak_ckpt_time;
 	int inline_xattr, inline_inode, inline_dir, append, update, orphans;
-- 
2.25.1



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
