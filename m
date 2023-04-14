Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 302346E212B
	for <lists+linux-f2fs-devel@lfdr.de>; Fri, 14 Apr 2023 12:43:39 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1pnGu0-0004wB-5k;
	Fri, 14 Apr 2023 10:43:35 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <bo.wu@vivo.com>) id 1pnGty-0004vl-DG
 for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 14 Apr 2023 10:43:33 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=MIME-Version:Content-Type:Content-Transfer-Encoding
 :Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=xvBKSpJJ9ur63nZUWjsBRNq3EokGIyECwIcne+79Jjo=; b=hqTuKOReEH/WGfRkWBzrDRZA39
 BArAFCV4ExlgKGS57X1iGNaTYfxHf8ObnFrPKyIoB+5wOwgu+K7bV8zPgYS1Mrsmr2XNyCBkeGimk
 DysnCT9A9Iy1SU3/tkOtw7UOYKrpXdr1Nuh3QssLLFQ4I3nsEDHTNavZqS71A1dNSA5w=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:Date:
 Subject:Cc:To:From:Sender:Reply-To:Content-ID:Content-Description:Resent-Date
 :Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=xvBKSpJJ9ur63nZUWjsBRNq3EokGIyECwIcne+79Jjo=; b=Q
 Q2uCYv/q+4smwG9wuUvKIyxtXvpe3xE5psB7ZD0GAQTgL4HaMhwXTpopS8ujVL3h79j4ZAhOT7e7U
 nr738Luhmsr1BqCN1Pw2vU39SGkKc+XQ8VOBVuVk25QIuhY37K9/Lp9jvqvXEih83zJpsn81uePAm
 MM89Qbns8dGZlEd0=;
Received: from mail-psaapc01on2101.outbound.protection.outlook.com
 ([40.107.255.101] helo=APC01-PSA-obe.outbound.protection.outlook.com)
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1pnGtu-007Wc1-Jm for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 14 Apr 2023 10:43:33 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=a14OofpwAawlHi96AJaTYf2QsCZV1ucLceYDFQXqUrvKUumbo64C4M56R2kVicfjx1lXfBpeS8Gn4YA1glaawbJTrd+1l0AMIIo4jaUaYlJ/3nfQNECa42bVG4mAdAfg1kvqgV747dwXMiR97uXSGdlxDf3uP3JlNuuofGM2hUPlWmRRX6wrrRzBcVE4WFNETQ0jpQFWSHhaJs5O6JhzGNKssrUBwqKMDbM4miFYjDtIk0e+D+aQtXdMou9H4Hghvuk0foDWt1Q1OLXm+Kqr9Z4j8XeUG5RKBOIQWsYcGQmGRUMeqm48nmz7rz2hkp2HGOLVSObkTiXIuXBSoG6HEQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xvBKSpJJ9ur63nZUWjsBRNq3EokGIyECwIcne+79Jjo=;
 b=TIkx3MTfLzkTuTk6LUL9FZKeHKiDJ7FaAtTfHhN1SKZhl2FuhI2ANGJUitn5jjHPlOB+WJYxFdmH7XHUCuP9qWiy7V72H/AzXi05pMSc0TvPZHhDUcJyyJ/O5mFjmPKDBkBXRt7p864l2+PiAh2pH9zHNyky88WMwoFmYghJ4sJkHLm0CUjKN8qZVEeBy8g6SUdQQnwMRZHZcsEye6+JCghN39vqDFTYU8+ALkOc6/bfwcyWaP1mjBOLUx4bzw6rCDvaB8T1R6emveuWHgmULbCVQ+XOO+UGvcfzY0WzNdm4msxnY0uxMsJK4Ap6+KeUZyy8wYZNTDrJ3gL9yuDUnA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vivo.com; dmarc=pass action=none header.from=vivo.com;
 dkim=pass header.d=vivo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vivo.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xvBKSpJJ9ur63nZUWjsBRNq3EokGIyECwIcne+79Jjo=;
 b=btvmRYXb87J7KPoxeVgmc3wqeONZox2Ze3Y8wcV+4PNqAZz9ATfgl3297cG8VeSNY4mO+kpX72nWp3Qx6N6b6x8sjhWIS1iBEoJNKBmIj8unGqcaJ/Q6oEe/A3CPLm9NjN9bXkmm31/ja5kaCInFlOGzHeiZDQPtbX/3PY8XAxQcO+b8RrBLrmufvs0aEMuEPSVSdUkrKfQmtSTmFvjDqCxdX8jEYv26Z4hjHMiuZxTK9pBzcXHr+IYO79QBGJW5o7w/MsHOwZVppFiKXGfHUb2vRXTdUKdlI5byry0BKvEOIib9VMkSBJgZVr/o7INB9VHASGXTc4cEHHx+pD1+CA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=vivo.com;
Received: from SL2PR06MB3017.apcprd06.prod.outlook.com (2603:1096:100:3a::16)
 by SEZPR06MB5521.apcprd06.prod.outlook.com (2603:1096:101:a5::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6298.28; Fri, 14 Apr
 2023 10:43:20 +0000
Received: from SL2PR06MB3017.apcprd06.prod.outlook.com
 ([fe80::4d33:acf:26b3:3d4a]) by SL2PR06MB3017.apcprd06.prod.outlook.com
 ([fe80::4d33:acf:26b3:3d4a%7]) with mapi id 15.20.6298.030; Fri, 14 Apr 2023
 10:43:20 +0000
To: Jaegeuk Kim <jaegeuk@kernel.org>,
	Chao Yu <chao@kernel.org>
Date: Fri, 14 Apr 2023 18:43:08 +0800
Message-Id: <20230414104308.6591-1-bo.wu@vivo.com>
X-Mailer: git-send-email 2.35.3
X-ClientProxiedBy: SG2PR01CA0171.apcprd01.prod.exchangelabs.com
 (2603:1096:4:28::27) To SL2PR06MB3017.apcprd06.prod.outlook.com
 (2603:1096:100:3a::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SL2PR06MB3017:EE_|SEZPR06MB5521:EE_
X-MS-Office365-Filtering-Correlation-Id: 2864380f-5eb2-4b87-6a84-08db3cd50fbb
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: K6BSkZFOOFX4Rrktwyofy4fDn/e/+tBMpq4jy9muEtZqpJrquj7KEhiul9ZUqNeeQ/D0RGytXw22NROULv7twpPAJgDxpgmlRrD7L5xzxa0HhCc3SW0TMaINOkbOfdNMyXiXDjnDRcS5w2/xHLuRXNKFtNZrrA3kCUlxVB0HOWxzzYktYoKOaucNJsMmdinajP0JQNbqpPzkt+xUDLyBk5hG3o9f4vFC7Zm7+x35Au+YMoruaMBzede1awDzG+8zYMA/aMtunegxjoEq7qhE/daLT4RdyCyH9Q4bqFDfCiU4C0nznJVQ4cXrx5cn7ZFR9UEiE9TkDr6cqwwzfq9ohc2cmcUSTL5ts98hj7FgAtVdX/1fvC+shYzbekJcYSTgGeo4H3MquFmn8tw+HLq9QqnCLy43DZytdbOFasu9pKjRUIBs9KbF4+oqpaEAsZVhj0UffYOkw9n6ZXlo82ctNstfwS0Dx4NLyA7kv/5Qvvt+UMzsAqDofjpBjSo5pk2Nkk2q8QzDHKpmYeebVHPBbl+2X9QTGGzvaQ07sfsFFbyYQwe9p4cYEl3qSOypyVAWmaCJQihDYOcn8/UY8UopHV1BzgCClo1AQnO6KCRPmsoOyE5w2vySIBfv65deSsTf
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SL2PR06MB3017.apcprd06.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(4636009)(136003)(346002)(366004)(376002)(396003)(39860400002)(451199021)(36756003)(38100700002)(5660300002)(6512007)(2906002)(38350700002)(4326008)(316002)(86362001)(66946007)(8676002)(8936002)(4744005)(66556008)(41300700001)(66476007)(110136005)(83380400001)(2616005)(186003)(107886003)(26005)(6506007)(1076003)(52116002)(6486002)(6666004)(478600001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?fKGi03lDbvM1Y0Sz/oWwMyVGeiwityG4sMvlqx5DWMacI2FlufxMYCYO5jkC?=
 =?us-ascii?Q?j9qsVJKNfW0O0IROF2vbKmj8YaNPHEKmx2dAiptH0G6smG3TozhJtStHrjR7?=
 =?us-ascii?Q?/waEE9eqsXtu1CwbDWmuoOQ8UpjBixlpf2h/GyLQFdq//SVprsFC9oglikMU?=
 =?us-ascii?Q?nUsiaLwGZiEmONrRW2CwhpdQgzUYSZlaxedIaVuUTbQ211agzzk67ID9eCYg?=
 =?us-ascii?Q?Be7VR71UPsyaXdgPl7nenPOSYWId5ACueVhKeaxY8Ej8GNgsesrT3VMhZb/v?=
 =?us-ascii?Q?Lcf1PXob7BPC5QUAXFVG2TwxQ3ePs6swkppMHq9ppYC6I0ntgihmt/2F4Gg9?=
 =?us-ascii?Q?xNZAo+XDqtAwz+EoE7s/A2fIqP+3qGiyS+dZh9pBQI0VEP5Umjwtpknc4nrr?=
 =?us-ascii?Q?VHUtNZBTVxEMLKP0c64CBHkCYbno8R5SRFnzE4m5cLDFZ1I0Gv5XL2lkIlJi?=
 =?us-ascii?Q?qe797KhdwkR+0QR6PstJ2I7Job59+92MVsdMoZGKkVzqcyU6F8Gen/N/v7iI?=
 =?us-ascii?Q?yidgpejrSDMRIf0SCjvyDST58svqovYce748wEUz3OdoI4f/QaUV8JSKfzrg?=
 =?us-ascii?Q?XmCfknrU0Eo+mpcK/cYZU0U+CEMjOsBQpMciCI0n3+cpZWd6cstGq40OOsl8?=
 =?us-ascii?Q?ljSIT/XvbxMIiBUjgD4ucgReAAgRNt8k2VVoVxqcp7fLsTNO41GAt7NU0KT9?=
 =?us-ascii?Q?4SAoOU8rby/OeMIrdpvwXMo7LP7WxVegTo+j5X8ExOW6Ab0nYEkirdiXia6Z?=
 =?us-ascii?Q?5GFR3uUNIc9BLQxBb2UUq6+6GCa947mKdz1Jsdiq+Lmd0DsMq0z6GPNgeRqK?=
 =?us-ascii?Q?+2IX4Tbj4d7Q59QDpOhKxxAuXcQh8oE3MT2SrCX9VVoTJWmr9FClZeVwZK5R?=
 =?us-ascii?Q?g/oebclvrV97rrgwB4HjIDX1nF0XbhKvx7Asm2Q9tIj9ZZH6Ywwsd3TUczCa?=
 =?us-ascii?Q?JnkKSu0/z2CUu8f9mvZ8fkUl0qNHbFc1LTdrZdivk2XKEy41y5h58foai1hG?=
 =?us-ascii?Q?EMBmCYIBH++7OnxSCk3cmuJVEIOGARvc5d7yaNE69VIHbDHgDCCTRkggqbtR?=
 =?us-ascii?Q?w+blstMHG5gbP4solqNhSwywqFah0LjmcfQxa+dw2WGJJ5JUOE8G2faAyPRe?=
 =?us-ascii?Q?ozRToGnwj9FdXxEo3NyCSTRCFXhMCVFKLnj6P8qPxGHO8NJo0P8X+l2p68jn?=
 =?us-ascii?Q?xyhbO5DyjhIkNXcecJDQlyhxGuXlJTCbw6mVn8f45eIMpnl/vZhSMMOaeiwx?=
 =?us-ascii?Q?cX8rqOBSL0CGSSPZkten2QHzidJhcKb5f1cFOa4+dZ4eYrbGyk9CldD8wK/X?=
 =?us-ascii?Q?BzHlXaj2W3oP/1dQVc7felArm5pEk6AwavTFx1lftrAmWBmGQqbMzgcbWU/W?=
 =?us-ascii?Q?sUq5Vu5K7QAnon7q4HgtzRY/ZqJNeK6xsWtYhh/XG6JUqKxIkGFsqjZc5Xue?=
 =?us-ascii?Q?d6zDgp46NJTlnwb6Vhu/IVWliQsfG6jqCKpnPnPjRp9gl551pNyn/EMoFCQ5?=
 =?us-ascii?Q?pstZbjbW2JLs9KjBbbMi1BCgJlCt2qIk/+zbfvilJ4gLjIshDGLqdgSwrdei?=
 =?us-ascii?Q?qejWK+kiVzeOSXLfGQQSShmRtxJPR7f+rcX8Ev9m?=
X-OriginatorOrg: vivo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2864380f-5eb2-4b87-6a84-08db3cd50fbb
X-MS-Exchange-CrossTenant-AuthSource: SL2PR06MB3017.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Apr 2023 10:43:20.2026 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 923e42dc-48d5-4cbe-b582-1a797a6412ed
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: O0pxef0ZQE8w50W+Si621QXgDxM7bOWA9FToNLpGqjRK8maX9FyoUMAY4enBsqi7Z4erKw1RH7yLlj0JFwG5aQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SEZPR06MB5521
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: It would be better to use the dedicated slab to store path.
 Signed-off-by: Wu Bo <bo.wu@vivo.com> --- fs/f2fs/file.c | 4 ++-- 1 file
 changed, 2 insertions(+),
 2 deletions(-) diff --git a/fs/f2fs/file.c b/fs/f2fs/file.c
 index 15dabeac4690..27137873958f 100644 --- a/fs/f2fs/file.c +++
 b/fs/f2fs/file.c
 @@ -4361,7 +4361,7 @@ static void f2fs_trace_rw_file_path(struct kiocb *i
 [...] Content analysis details:   (-0.2 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
 no trust [40.107.255.101 listed in list.dnswl.org]
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [40.107.255.101 listed in wl.mailspike.net]
 -0.0 SPF_HELO_PASS          SPF: HELO matches SPF record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
X-Headers-End: 1pnGtu-007Wc1-Jm
Subject: [f2fs-dev] [PATCH 1/1] f2fs: allocate trace path buffer from
 names_cache
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
Cc: wubo.oduw@gmail.com, linux-kernel@vger.kernel.org, Wu Bo <bo.wu@vivo.com>,
 linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

It would be better to use the dedicated slab to store path.

Signed-off-by: Wu Bo <bo.wu@vivo.com>
---
 fs/f2fs/file.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/fs/f2fs/file.c b/fs/f2fs/file.c
index 15dabeac4690..27137873958f 100644
--- a/fs/f2fs/file.c
+++ b/fs/f2fs/file.c
@@ -4361,7 +4361,7 @@ static void f2fs_trace_rw_file_path(struct kiocb *iocb, size_t count, int rw)
 	struct inode *inode = file_inode(iocb->ki_filp);
 	char *buf, *path;
 
-	buf = f2fs_kmalloc(F2FS_I_SB(inode), PATH_MAX, GFP_KERNEL);
+	buf = __getname();
 	if (!buf)
 		return;
 	path = dentry_path_raw(file_dentry(iocb->ki_filp), buf, PATH_MAX);
@@ -4374,7 +4374,7 @@ static void f2fs_trace_rw_file_path(struct kiocb *iocb, size_t count, int rw)
 		trace_f2fs_dataread_start(inode, iocb->ki_pos, count,
 				current->pid, path, current->comm);
 free_buf:
-	kfree(buf);
+	__putname(buf);
 }
 
 static ssize_t f2fs_file_read_iter(struct kiocb *iocb, struct iov_iter *to)
-- 
2.35.3



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
