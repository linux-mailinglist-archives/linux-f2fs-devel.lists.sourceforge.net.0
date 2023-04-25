Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id D94B26EE484
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 25 Apr 2023 17:12:04 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1prKKo-0000XK-32;
	Tue, 25 Apr 2023 15:12:02 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <frank.li@vivo.com>) id 1prKKl-0000X4-3e
 for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 25 Apr 2023 15:11:59 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=MIME-Version:Content-Type:Content-Transfer-Encoding
 :Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=7zxcHeUvKOMXM5roLckAk48odMFKL16YlwrQe2LB76I=; b=BhrLZ2Vnm8uUMs3Vf5xmYsSbUW
 KitO93uwVZzp7k+OfjMmUD0a9omAbIZJM0JvxFd+7Rgh6ofHHzrJEBZUtYUIQL4xBDigV1SN3cT4p
 u1EiQjWbIpXMFOzqwDsIdl1+qYosvgngZqmiVfGOkVhX0LtarXZXshwCAwyod15FapFw=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:Date:
 Subject:Cc:To:From:Sender:Reply-To:Content-ID:Content-Description:Resent-Date
 :Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=7zxcHeUvKOMXM5roLckAk48odMFKL16YlwrQe2LB76I=; b=T
 gCoEIolUbphHNbXbLkgycT5V61tV5U8wYvyX1ZmBRtHTmPTMxcuyzN96BSSpOKOhNLdI2zRNiuuaI
 d8x8F+8RDR6x6Mucirxoam8R2UsDDp06xvXRHeMhIbHTbnlAJ6nfvW3p0w6taQ8N05B0tqM8k1O2d
 PPY/lVVMWEJQlyRM=;
Received: from mail-tyzapc01on2116.outbound.protection.outlook.com
 ([40.107.117.116] helo=APC01-TYZ-obe.outbound.protection.outlook.com)
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1prKKd-0001wb-P3 for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 25 Apr 2023 15:11:59 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=T/97erlZ2K4xdikQ61uifqx8QYotSfWor28qzDN0toSYo6MARlhwk3h1/RX3903PL6BJMxEDYiQdPFIP05c+5QLF63Mwvz3BsmksIKqzSXV4DyYvck9O/RSJYS5Ex4AMUtziUD0KCW55zJUOUNaoROPcKBbYD3uCDfLf7MhJZXAoruyTohgKm67trvTi5LR7h0Ig4h2raFhqjapO+uQNZvdC8bCY0o8CILBl6ri+7LyjAYy5UljPlV5SXHBofzDyyGfQ9iNB303Cz4M/fqJwLpxeH1h6Nnw5IuMvxfcqW7ociOBoKGJYr1l0GMyaF0g9UCOlbFCmmH7dIbPrv0B/DQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7zxcHeUvKOMXM5roLckAk48odMFKL16YlwrQe2LB76I=;
 b=PJeFn42PsqSB9tEFGuyeQi27iWA4UcPDQjhd8G6uAeI8gcrT7GdS74cw/8iew1VIK5+4NwVSl8wrBny/PpKHry/Y77gXF0lAZZkzls3Dl8c6MBP5skrQkMWTOxe5LDiCwWSp9QXoeMjKvgIZ0sSX/gtcr/kzsbosBsKaQtR2f9IVF33EE7/qhDrk3wHOlhdDJKSN1CMxehuy1YoixaZ+m7tSopF6/kfO1MES+5BmfvYDcRBfzV1d2nyIc+LSWMvQgqy8ZFWeQ0YHhVMN23ZPhnUiAcxj7DTE5hG+KrKFVfAfS0JhS+cNmkwwLE8N4NKyrv9IG5MEwNCDUQoc6jzbmA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vivo.com; dmarc=pass action=none header.from=vivo.com;
 dkim=pass header.d=vivo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vivo.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7zxcHeUvKOMXM5roLckAk48odMFKL16YlwrQe2LB76I=;
 b=oPGG8v7oDHkrLhBUjCPMPh3rn1PlsV1Q0gI7B2V0M52oatDmr4Jj0VzqoIBz+oibzT2BR3kzEHRA8U5UY4a13zwXIsZtlWXPlbKQ6cCicZkYaJtqJ+Ihuf2aZsESNSPGkPdvvt/YYbCk3OSQjrEP5q2/JVHK3mK9sZnYGIZGz4ZJyIv1vjTMeiWTIc/gAqdJLicCzFCA+S5/eqVt8LC61mFb1geZW9PFYxrxLX6ByG1TGM2/Y/eQY5QEjB4E1jW/cQSdDuUQSyvInyxU64QhETNdsUz0eDGP+9lxRRISnPL5DkHuarJPbYhGF6MOu//1YvCLNDmlFV/ozeLDBUsrZQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=vivo.com;
Received: from SEZPR06MB5269.apcprd06.prod.outlook.com (2603:1096:101:78::6)
 by SEYPR06MB5253.apcprd06.prod.outlook.com (2603:1096:101:87::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6319.33; Tue, 25 Apr
 2023 15:11:39 +0000
Received: from SEZPR06MB5269.apcprd06.prod.outlook.com
 ([fe80::76d6:4828:7e80:2965]) by SEZPR06MB5269.apcprd06.prod.outlook.com
 ([fe80::76d6:4828:7e80:2965%7]) with mapi id 15.20.6319.033; Tue, 25 Apr 2023
 15:11:38 +0000
To: Jaegeuk Kim <jaegeuk@kernel.org>, Chao Yu <chao@kernel.org>,
 Daeho Jeong <daehojeong@google.com>
Date: Tue, 25 Apr 2023 23:11:25 +0800
Message-Id: <20230425151126.50566-1-frank.li@vivo.com>
X-Mailer: git-send-email 2.39.0
X-ClientProxiedBy: SI2PR02CA0021.apcprd02.prod.outlook.com
 (2603:1096:4:195::10) To SEZPR06MB5269.apcprd06.prod.outlook.com
 (2603:1096:101:78::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SEZPR06MB5269:EE_|SEYPR06MB5253:EE_
X-MS-Office365-Filtering-Correlation-Id: be28077f-6553-4610-3ea6-08db459f5dd7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: hfo6Mvj163J5KSxgJ4I37tkORI121hEnZfsuugIDiqhXYOpyReCjwMttEV3VQn60i4RR5Wy53qWH4cySFN11QBOYjcEv3tNodN2AkuiXmAPMDvMmqgTpjoia76DeCck5tounfpDIpclaqvNhAApXNK/dFbGuEgjsm1OvbH2iOuU52CkIkjadMctxpumApCy80MZTjyMRN8IqyLJ1gJio0p6oeZkSxk/QE5KqeRNPq+bQzUlkxpoJPjThx6Eje1OirvhbRciM11h+dM+v6mnajgazIooVrtD88XtVbBc6Fekh+HGH5hMTBIw5Hn1xY2CqMDI2mggCqf+BAGNiWIRokttQR9wzHZz0GwBLyrbYsSGMPCQlo5xEBvRyMtYXlodX9cFu+F9e4i0qW+1YhnIU19YFERDBYkeqy1/+0woeMuRQjMD0flmKZv9OkJLl4qyaF0VLqmR1mVDu0NF/BGPRKsBqfLxnpHMU0R80tUGDMYCXDzhMFmsY3p+FPvfweZYVB4oQXEs15Iun6voTWpNekVe2UF9vq2Eyp/JeOo7/XlIoKaXYaLLCHa0Irk8/9wrzEJfFNX00es7Wa4fPk6pEThL5AxghogBo1pEIN7gujPar593dJxrM35XJcTwRPcb5
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SEZPR06MB5269.apcprd06.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(4636009)(136003)(376002)(39860400002)(366004)(396003)(346002)(451199021)(1076003)(6512007)(26005)(6506007)(8676002)(8936002)(54906003)(4326008)(316002)(66556008)(66476007)(66946007)(110136005)(36756003)(41300700001)(478600001)(52116002)(6486002)(6666004)(5660300002)(38350700002)(38100700002)(86362001)(2906002)(4744005)(2616005)(186003);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?8VcDrusjZr921/vMO7yhdRDpQ9O5FJHxdlJpHJyxrshfU4/zYK0TFCpS4DFS?=
 =?us-ascii?Q?sju1wjpB0ei48/YLPJrxiWfQ4/eAA/y5Gtdp81on2U7stFgJtpO8+r3b8aby?=
 =?us-ascii?Q?BFW3bh04MlYs6HYnnQpmd06t7wmqfFmiMdl7xZ3MUTqT/e4Xc0l6XNePWuJ+?=
 =?us-ascii?Q?alpMvoYlJ/MLy4QnBloZSvRor9v8jB2GJL2N2Fbvm9bMsrS92uCh4NpVzZgv?=
 =?us-ascii?Q?NoWazBlzCRDXuL2gADZZJFTjS8/1i4x+O5CGDifuS4i1UkPJvKCcNchN2gO7?=
 =?us-ascii?Q?gDW9u/5tm4LHBzU8C0b6JOXWk5VnpijkJSYvpPEaaQQi7xk5fdjssZr10ja/?=
 =?us-ascii?Q?9D//dMUqb0CX/vRObbfztRXygQSZKi+szHpa2dW7XfJCjE7Vu0KfV2vjq3yw?=
 =?us-ascii?Q?Z2c4ido7HV2YKjP2h00+5s6AcBVvGgw8La69Lu/CczJQRqbpe+qXFPvXdu8F?=
 =?us-ascii?Q?1d+h0Uqa7ynRx/E8sGz9iYspXphGAqUxoAWKfPUp7s0ECn9g6eoAtttTdVY+?=
 =?us-ascii?Q?c3r2MhE6Av+BRU5M83yMZkNZ1DzPnWHoyE+OsT0P4cCjL00nJPpXVC0M8sQj?=
 =?us-ascii?Q?cgSPVbGd8zl6EdL5R9irPUHtWvEd3udTBhTRxP/BP7yboFVTVOTjxoKA6jZN?=
 =?us-ascii?Q?6TTK2qSl/UhtdqzVb1S8/IwyH7GW4qd7VEINoSNBwQ7lRNrFfayeMiJBlNEn?=
 =?us-ascii?Q?rQmsd1wsyT6hFfEoA3qY8Efxa7Qdf0Qd63PLKmw3l14LMUSQBWD44/fcIcSx?=
 =?us-ascii?Q?uh3UPZr1S/u3zQuAjnjt2Pd8ZDdlF9oB0zmZsSLPgEsMr1P3o1xuydIulsbT?=
 =?us-ascii?Q?fdVu8oNBjSxhlHQCfCapUD6P87wO2Arvf8dT/49gIwkRRmyaj7lUuiyiuKyb?=
 =?us-ascii?Q?GiVuMe1ToAl1xUcQsGdNGBZZidcAXh6YydbQL/eVuC1bLGUa7jLIuCDCeP8w?=
 =?us-ascii?Q?QokqHCNjJHHfBGOfGkd1IBXsAIRMnEcq8ZAafWsxIJ3bbMv8DIaDqA6hHoi/?=
 =?us-ascii?Q?lHupK1tGk98OvjLkvbYdGHaqx1iuSG3xAYIjJTPewKvYSP0LwkkvSfOH3VUz?=
 =?us-ascii?Q?6709drSEseiRNpdVNW59ESTiSZ4aVvxe3ntXu2itCZt3NBrMIaGDYasaA3MH?=
 =?us-ascii?Q?uO905iiXo8axu9OQjsmP+FFNlKot7YmTSkwgv51Cztv5K6E4p21ejKf2jJH7?=
 =?us-ascii?Q?tzTJ3BE/7fsgSWxkrSvJ9e38aeasuVVq7SBbZCZUJ4ySHr7zElKZ3RWrQbpv?=
 =?us-ascii?Q?KN+oaGPTStoRuaHaD73T1WEjDQtlL2lyHIQ+xk5oT5lLePkgOM3/oV/yXjaC?=
 =?us-ascii?Q?CJiZ7nGaP3fm+6v8d/AkM5fokvPtTKPm1Fu1n+rmA7R+NqAGXpRsu/Wg2mCk?=
 =?us-ascii?Q?ENnCsaijzD9GgsszomPk36dHz0DHHEHuHojzcmgrH9NbdgWioTW1G4S/QzoU?=
 =?us-ascii?Q?w+eV3yOVtN68BWYTqazjYPkva0fRd7bsCyCTvxOn+YofDfHkAVS6G/Fnc6W7?=
 =?us-ascii?Q?mBlrG/mftxTD21uQE74VvdtWokfI0ZbzfO94nK3xEpmVKCq833MIxiJgp2rx?=
 =?us-ascii?Q?xXo1RJamsqDc69SjF07tknG/pjxDHbymHtfsm+qo?=
X-OriginatorOrg: vivo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: be28077f-6553-4610-3ea6-08db459f5dd7
X-MS-Exchange-CrossTenant-AuthSource: SEZPR06MB5269.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Apr 2023 15:11:38.1760 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 923e42dc-48d5-4cbe-b582-1a797a6412ed
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: R6ri9OpAeCWupiK15S+ZF1vy1an44f7255BniM7SaoTaZqSSqFCK10CFH5EVqZVD+qRTIOeW5yYtboWCQDs5Ow==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SEYPR06MB5253
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  If a file has FI_COMPRESS_RELEASED, all writes for it should
 not be allowed. Fixes: 5fdb322ff2c2 ("f2fs: add F2FS_IOC_DECOMPRESS_FILE
 and F2FS_IOC_COMPRESS_FILE") Signed-off-by: Qi Han <hanqi@vivo.com>
 Signed-off-by:
 Yangtao Li <frank.li@vivo.com> --- fs/f2fs/file.c | 3 +++ 1 [...] 
 Content analysis details:   (-0.2 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
 no trust [40.107.117.116 listed in list.dnswl.org]
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [40.107.117.116 listed in wl.mailspike.net]
 -0.0 SPF_HELO_PASS          SPF: HELO matches SPF record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.0 T_SCC_BODY_TEXT_LINE   No description available.
X-Headers-End: 1prKKd-0001wb-P3
Subject: [f2fs-dev] [PATCH] f2fs: do not allow to defragment files have
 FI_COMPRESS_RELEASED
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
Cc: linux-f2fs-devel@lists.sourceforge.net, Qi Han <hanqi@vivo.com>,
 linux-kernel@vger.kernel.org, Yangtao Li <frank.li@vivo.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

If a file has FI_COMPRESS_RELEASED, all writes for it should not be
allowed.

Fixes: 5fdb322ff2c2 ("f2fs: add F2FS_IOC_DECOMPRESS_FILE and F2FS_IOC_COMPRESS_FILE")
Signed-off-by: Qi Han <hanqi@vivo.com>
Signed-off-by: Yangtao Li <frank.li@vivo.com>
---
 fs/f2fs/file.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/fs/f2fs/file.c b/fs/f2fs/file.c
index 9c9c3f660e01..c21d6a829c4a 100644
--- a/fs/f2fs/file.c
+++ b/fs/f2fs/file.c
@@ -2734,6 +2734,9 @@ static int f2fs_ioc_defragment(struct file *filp, unsigned long arg)
 	if (f2fs_readonly(sbi->sb))
 		return -EROFS;
 
+	if (is_inode_flag_set(inode, FI_COMPRESS_RELEASED))
+		return -EINVAL;
+
 	if (copy_from_user(&range, (struct f2fs_defragment __user *)arg,
 							sizeof(range)))
 		return -EFAULT;
-- 
2.39.0



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
