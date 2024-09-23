Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 4179397E5EE
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 23 Sep 2024 08:22:21 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-3.v29.lw.sourceforge.com)
	by sfs-ml-3.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1sscSY-0006iU-Ix;
	Mon, 23 Sep 2024 06:22:10 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-3.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <bo.wu@vivo.com>) id 1sscSW-0006iK-GE
 for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 23 Sep 2024 06:22:08 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=MIME-Version:Content-Type:Content-Transfer-Encoding
 :Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=N8i4d5da9yORPmkip5timpzrA2WyEM4mn5EMx6DjBug=; b=mib57m4nyfXAEvXNw12kO0Qxim
 tmf2Mz67G8FHGllKhx4NTUxlCITERyIziGRu/81tScZ0ALHTDMLtu9gi45VimCVzLoiF6gmE/XrXV
 dnV7NLM/DCm/L3NLdUSlb0zmGoLPpCWE4L8CD8A635uDG/sZ4cr8ygZMMnUwTMWZza50=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:Date:
 Subject:Cc:To:From:Sender:Reply-To:Content-ID:Content-Description:Resent-Date
 :Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=N8i4d5da9yORPmkip5timpzrA2WyEM4mn5EMx6DjBug=; b=K
 LSrNsSk/BTMO79O0BYWCgjtvwC6gDXDq9k6eyWnwlwZnPKOhRw3lqBdr4RC4nK42k4kFmm0mXekIA
 L0k/ycN6hSnqt3a3tU6XmZ5Oj31UlUewCy8r4RT/6Ud82rYe53HG6qQODcHotJJckduhv4R7GBLqH
 NbZr5UzuizZuz9Sc=;
Received: from mail-sgaapc01on2059.outbound.protection.outlook.com
 ([40.107.215.59] helo=APC01-SG2-obe.outbound.protection.outlook.com)
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1sscSU-0000kW-QV for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 23 Sep 2024 06:22:07 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=t1oV1Q6QycdNMC+qA1poWxsI0//lcb2XOpIHeXfzxoVdt4zhH3I5xBcFmHzXq40JROjjvasV1DE/XJOa42VPMxakD7Saqj9p56LXxVzUJ7f73yUKbG5kqTBYmismGbhWu1kVABVWmFhQ1m+EKuuHgtAZ5TnSwNHHr7TJXG1+P5InjQLgVOAH5V7w2EJdWrzOBsG3qnO61R+/91hwNGltgLmAWqTdRNDlHdR7QjBsIoD8ALmYnYwCaEMGpZUmICTshGaZtzXFPEg6c+TRvyt5d3h4fjO9m283I+WxhcCIWX4Nm0gN/bnIJu34TeRW/Zfkun26qe/IOm6Fwycq6hTq9g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=N8i4d5da9yORPmkip5timpzrA2WyEM4mn5EMx6DjBug=;
 b=qFFmrYAQ1PRKa/lFLRKahdYOqYZpSaTgoI/0+DfewInfJlO8rUY25DgW7TgayPFuY4huo410Rm9yc50q9od7p8AiJDkPSnNfU/AynTe2QdIk5UoADEdxVG1xH3md9rfzV854CwutJT+81GUoW8n8OZY7GLI0anvLqBbugIqWN7iJBPuHKbSMurls4E99FmRSbqHdI/490mlfRw4iZp4pdNYRlX6duYaSOhM52B7a16alOwBD0KLMlTy8YC5XoXFGdCxb7eTS67reztsWsq3+T2KeL637mUIf0RLhvMqQqSeqUbcBwNYTEVjll8CRQmp7P6ZnSI5Zt1nRPi+RYmKoWw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vivo.com; dmarc=pass action=none header.from=vivo.com;
 dkim=pass header.d=vivo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vivo.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=N8i4d5da9yORPmkip5timpzrA2WyEM4mn5EMx6DjBug=;
 b=JwiuYy+2ksHuZGhGeBuCXfBh8gNCTxASlZSag6PgaBk2VbcEzcXoFwxa4Zz0IS9FFLH6jFxFWYYkagxmbu2DoPauD7N8r3s7NJBmRx+3QPN5bqimiCXE60duFv0qdAwyyFav+Bmr+VUbDiKNr+aThMRnWdz7cSM1quPoPq+HklSA4jno4mZY8YoXvS60Qj5lMqcMmQNFY1yRXLhHSF+5Pe/dzFB9p033LxlWzSKphBwCZWzFnVuQ4zy+pNyS3oB2Lu9iK4cvxfQ5152SBndeLm0hiUJZqWFLTm7F3ylttEAM2xNOjwyXJfKSKQqGaAWHrdhYMqDpmAP26SpPx4z/Tw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=vivo.com;
Received: from PSAPR06MB4486.apcprd06.prod.outlook.com (2603:1096:301:89::11)
 by KL1PR06MB6273.apcprd06.prod.outlook.com (2603:1096:820:ec::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7982.25; Mon, 23 Sep
 2024 06:21:56 +0000
Received: from PSAPR06MB4486.apcprd06.prod.outlook.com
 ([fe80::43cb:1332:afef:81e5]) by PSAPR06MB4486.apcprd06.prod.outlook.com
 ([fe80::43cb:1332:afef:81e5%5]) with mapi id 15.20.7982.022; Mon, 23 Sep 2024
 06:21:56 +0000
To: linux-kernel@vger.kernel.org
Date: Mon, 23 Sep 2024 00:37:32 -0600
Message-Id: <20240923063732.2730521-1-bo.wu@vivo.com>
X-Mailer: git-send-email 2.25.1
X-ClientProxiedBy: SG2PR01CA0179.apcprd01.prod.exchangelabs.com
 (2603:1096:4:28::35) To PSAPR06MB4486.apcprd06.prod.outlook.com
 (2603:1096:301:89::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PSAPR06MB4486:EE_|KL1PR06MB6273:EE_
X-MS-Office365-Filtering-Correlation-Id: 37f6ef91-d6ab-496b-d0ae-08dcdb9805bc
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|52116014|376014|1800799024|38350700014; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?XjM8xb6WfSpjqSGJGNO5xtAywNEC6YDeK+U3aLXWfpFPH51CHaYybVnw624B?=
 =?us-ascii?Q?pq2SqopJ+3K/0ix+4+tSxSR4TCFtu/txvgFJMRUaeWFUnAYBLOofyCXXIN55?=
 =?us-ascii?Q?UMSsdn8cHju7dLffMKvVYVjp+o+Y+9LVxINq1segol7ehKL0FWpBYWeBtDiy?=
 =?us-ascii?Q?VVoI6ibqXALXhtXe9Qv0y5t/OePjBoOumDG2G/8yXwfxtt8JyKJGbJYeYVSm?=
 =?us-ascii?Q?awvxr6UIyYQ5zPC+YuPtpzmJ/yIeCkWzbglLjnT5HLN2NKt6UsJDMqQ38HMg?=
 =?us-ascii?Q?j1YI+f+d7mCsOm4RVMNmvSgBFGQ8xMl4GRgGJhxE3pir3ex20I+1AYCsSW6c?=
 =?us-ascii?Q?y/hNPDpqMxNfnPgKs/EGjo3DlhKdGkaiWUUBIkAwGEsM2tvvTnVE7Tk7GCly?=
 =?us-ascii?Q?ork2eLspj1wPm1ztvM6+YzT4k6eYoJ2tPNEpClW6ll7axrpcxsklDxTKcI2W?=
 =?us-ascii?Q?LijliMd2IL2nWy91yYsGN4YYhrUuq+/Rq0MhEuO0J0h+YBq4+7mNt8jol4Bh?=
 =?us-ascii?Q?MwXJljvFzF5QHbEFL0VFbLVBf4Z7cj4KmMOsYZAaq5N8cO/5pdBZrMbM7yxk?=
 =?us-ascii?Q?vDupHugkpJm5gAkU/HQNZdPDA/2udKsSgMssMLPmX7ZCcwUIahxfTE80zFY5?=
 =?us-ascii?Q?p92QWHeg3bGzGoXTHQT4hN93xHJ/8lOR7jQJq1RJSuClLp/a1nx44S35JRwj?=
 =?us-ascii?Q?cixWqUGwICM2GqmxBBHom8utKf13Bd82yo/kEpjuOWkpxG+9V0Fgc9YQzZ7C?=
 =?us-ascii?Q?UTjeT/URoBlCPN3YTVx49jVj3q3llu1IjmUev9V2pHN+3ylxc/DF7rOYXjed?=
 =?us-ascii?Q?/HKcIhEfIRxs0OTXUQjQ6mSKgreRj6Gxj2I0jSPKoF7fP4cWGGKju62HxKoy?=
 =?us-ascii?Q?PfAgLLOR8idLE1Ni9CB6x7noCx83RAU63koP9dcQMldvdBeoD5qTMvelVRSm?=
 =?us-ascii?Q?X6hd9i3XYXyrmi7uaLpJ0QdiQ1ktsidTX+z7TkYqo4vbwK8pwOTJZblmaQSa?=
 =?us-ascii?Q?uSPxMUMSvB/+vGq25fw9I4rcn5kGvvxA8NYUvCeaWn0/c+750gcdft7bYqaE?=
 =?us-ascii?Q?cPpjYnfgV1hvtdoObuAT74RZQdoxXJfr4nlBK+ucRhRT9dH3fqh23FWYCOIK?=
 =?us-ascii?Q?+xwrd5oHpuvMBEq4B6Z0jLF4aJksO/1huRQoJqbhVri2Xq45LNpg4l854ZBH?=
 =?us-ascii?Q?D7DnJhtoNpupuZOaIJv7UovpVzi5m+lx3Zu+y6LtHYA4e6NA7I/Z29HI51Jc?=
 =?us-ascii?Q?ZQWy2JVuA+WlLJ41puYBMUis6mnOMZ4bUBWUK3UtYBRUe8sMs9W2ZoLGSkE0?=
 =?us-ascii?Q?yqQmYwCN3/6lN7ag6k4boiOs9zO2mqVr7Di2UFhJAY3HEQ=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PSAPR06MB4486.apcprd06.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(52116014)(376014)(1800799024)(38350700014); DIR:OUT;
 SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?i7yL8/+yyp8/vaixGEw/rFADmhJKbgskRFeNH9WTreHSrcxuValRRSi8TyJR?=
 =?us-ascii?Q?s+AoxdjU+nySduH8JqpLvP2qE6Uzd1ar1ZEmC4sRgowBTsDouR7XPE3YsKx7?=
 =?us-ascii?Q?bqxdGsbSX0G7tmQbY5IFdODodecXoPN4jwDUegjal++Z/8UEKef2aoNBulFA?=
 =?us-ascii?Q?3Oet56Q9if2zf6cVVOy0e0DKPnm1xGttUpvL3F69e5Sw6wIXcU5Zzjqou/ck?=
 =?us-ascii?Q?Rrcup+IYVto8HXcS2WILPbMTk7wm3JnZo/szewlBADC5jHfO0z7toePq2ZcB?=
 =?us-ascii?Q?hEbahbC1fzzpJhibj6y07TP6tB0HH2frFRAqvlfPJ8o52cNurU9vQ+vFCcyo?=
 =?us-ascii?Q?kfhyJG8xifPEL1jvgA86Rlsw/g6RA7cnZY8dfVhZfSZQK9Y76BEt16BBMydL?=
 =?us-ascii?Q?YK6l/botA8pRcdlBk5hhZb5/9kUztDz0T5/oQCDJ2dNPno77ktuLR/ZaymRU?=
 =?us-ascii?Q?+LYBWx7QXW1CAUJNUJZUlmPeKQXuYQbXcb/+XBG9kQXEBDAHGKPdx3n3X/Qj?=
 =?us-ascii?Q?LwYCxo58toJ5Rvi7X6MdU9I1iD4R3mw143+1EAfFJGBgRlg4Nc/8wVyjQOEC?=
 =?us-ascii?Q?efIE89+bdr8Ly9t8UAjOZ2lFIVLYP3gYTMDKmnBP76o8OkERHdS59jnF11e/?=
 =?us-ascii?Q?t4LUypUhc5x1j3pXTr012cgyFLo89mzIQusTBRVW+7V6yOSuuo3spbCxjjm7?=
 =?us-ascii?Q?2dzyaInOHEAgKDfF+rnCvZ2Sdr4M5vdiltYnmZ2f8Yca5mnElb9dosPFmxDn?=
 =?us-ascii?Q?BLnIkZip2x6uFrB2TZqe3dSJCSg9UN6PY4cXgFGM7T6M1GTVIkuiK42pmwI0?=
 =?us-ascii?Q?5GNWZlThuWc6wX6jxF0cu4MeMuA9zxlq8cRTYtHhL4bGcllyi9wv8VqPY+bV?=
 =?us-ascii?Q?JUMd4pNzL7jzZZKg6BAGF2do7hMy2S5b4ouuCTr5mhVNA0p5v7ZVr/eBRYpE?=
 =?us-ascii?Q?qyH8V5cxKgyxUlgObNRyAWSjd6VOx+NY1OraPzmA8tgKSDCCIBriOli+VoNQ?=
 =?us-ascii?Q?V6wHo7RbHr7Z6XLW7+8VU39Vx1R0KWTHehW2fJ7VPzEh9KYAVLVepu1/HFY2?=
 =?us-ascii?Q?rOgw4+kmje5VwVsejhRrihGUX55O8SZ7/xAUpf1JVcIJ+0klhXgiUHzJjYzo?=
 =?us-ascii?Q?c2nlecO3CCdCxuTp+x+uZUTLF2UqMNzZEK0gsHaEiDB7VYzEqz9UcPBsAScg?=
 =?us-ascii?Q?ZChPaExtJO2Bz5XvEbLwnSfc/1JZv8/vUB03ojEQi+9WENHlbTCww/nMk86Y?=
 =?us-ascii?Q?VC8eUp0o/KHPI+O5LlASID/mavvOUe3KJwUTTIrxjWyV0mloGA0NLiZ1qh7p?=
 =?us-ascii?Q?TXYmwMQJ00KOOg3QyvO3/43nIQpunqpjh+tRUkoKIdBQL3l7foWbJNGR4JWJ?=
 =?us-ascii?Q?k/3ng3mv8GtpbgRBbWoEFqBLneloVqEyR1Ag0adVybBqiUN+0iFVDmxKgGdg?=
 =?us-ascii?Q?xS5Zh1KkiNB9qHoqbDshgrFkQulOvainjwterM7rCUz+ab5jEXjlO3GWNRd1?=
 =?us-ascii?Q?tzmWwg8sNtO899cjDsmzN4DJPTh+8O+llJTSRQQh9VtzHlb2e2o5KMSzhk/G?=
 =?us-ascii?Q?EZki63RM2qQNs8m+Mgd3Ae+NNu7M2/yzeNAJVkEo?=
X-OriginatorOrg: vivo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 37f6ef91-d6ab-496b-d0ae-08dcdb9805bc
X-MS-Exchange-CrossTenant-AuthSource: PSAPR06MB4486.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Sep 2024 06:21:56.0695 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 923e42dc-48d5-4cbe-b582-1a797a6412ed
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: pWFMALCb7guTiFUkInIniPar17634EufSGZ0TTA5C31QsDoYB56fsGr/NAk4a9DiYYCk7vLGBk1VhdVjnM9cHw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: KL1PR06MB6273
X-Spam-Score: -1.1 (-)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: According to the definition of statx.stx_mask: It simply
 informs
 the caller which values are supported by the kernel and filesystem via the
 statx.stx_mask field. (quote from the "Linux Programmer's Ma [...] 
 Content analysis details:   (-1.1 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.9 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [40.107.215.59 listed in wl.mailspike.net]
 -0.0 SPF_HELO_PASS          SPF: HELO matches SPF record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
X-Headers-End: 1sscSU-0000kW-QV
Subject: [f2fs-dev] [PATCH] f2fs: do not set STATX_DIOALIGN if dio is not
 supported
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
Cc: Wu Bo <wubo.oduw@gmail.com>, Jaegeuk Kim <jaegeuk@kernel.org>,
 Wu Bo <bo.wu@vivo.com>, linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

According to the definition of statx.stx_mask:
It simply informs the caller which values are supported by the kernel
and filesystem via the statx.stx_mask field.
(quote from the "Linux Programmer's Manual").

Therefore, if the filesystem does not support DIO, it should not set
the STATX_DIOALIGN flag.

Signed-off-by: Wu Bo <bo.wu@vivo.com>
---
 fs/f2fs/file.c | 9 ++++-----
 1 file changed, 4 insertions(+), 5 deletions(-)

diff --git a/fs/f2fs/file.c b/fs/f2fs/file.c
index 168f08507004..bbb66be0deba 100644
--- a/fs/f2fs/file.c
+++ b/fs/f2fs/file.c
@@ -908,14 +908,13 @@ int f2fs_getattr(struct mnt_idmap *idmap, const struct path *path,
 	 * f2fs sometimes supports DIO reads but not DIO writes.  STATX_DIOALIGN
 	 * cannot represent that, so in that case we report no DIO support.
 	 */
-	if ((request_mask & STATX_DIOALIGN) && S_ISREG(inode->i_mode)) {
+	if ((request_mask & STATX_DIOALIGN) && S_ISREG(inode->i_mode) &&
+			!f2fs_force_buffered_io(inode, WRITE)) {
 		unsigned int bsize = i_blocksize(inode);
 
 		stat->result_mask |= STATX_DIOALIGN;
-		if (!f2fs_force_buffered_io(inode, WRITE)) {
-			stat->dio_mem_align = bsize;
-			stat->dio_offset_align = bsize;
-		}
+		stat->dio_mem_align = bsize;
+		stat->dio_offset_align = bsize;
 	}
 
 	flags = fi->i_flags;
-- 
2.25.1



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
