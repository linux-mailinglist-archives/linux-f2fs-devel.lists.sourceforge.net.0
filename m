Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 580496877CE
	for <lists+linux-f2fs-devel@lfdr.de>; Thu,  2 Feb 2023 09:48:53 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1pNVH0-0004qW-CO;
	Thu, 02 Feb 2023 08:48:49 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <frank.li@vivo.com>) id 1pNVGw-0004pJ-Bk
 for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 02 Feb 2023 08:48:45 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=MIME-Version:Content-Type:Content-Transfer-Encoding
 :References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=5LC7c2CJAzq6tVlXVGuvpQutyrfREL0OZTedO1ndBto=; b=DiM6pJWBCCFhxuOqwTF4yIKkxG
 Lnl46dUB0xu6B6xGYnvzk1Cv0n6iMNOL5PJV8rZiFaVc81ShmhJ2l/stchFpdHjI/ihhGEaPMYIit
 v0CrTt+/cMlRadfeOV+IVoNcZHxaIbFgT578ZpeC/ECYLoDk/FJnm52t/vOk+rZmb10A=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=MIME-Version:Content-Type:Content-Transfer-Encoding:References:
 In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=5LC7c2CJAzq6tVlXVGuvpQutyrfREL0OZTedO1ndBto=; b=kqEoOmAEMcSrOr2dtkZT1ZKOi6
 WfSrYGLv1GBB6fy9CStMOTD4TmIn9JGel93NX5AAwi01NTU8JfiiJNMUyIXRufziTjK4bH1sFxY13
 AMBkD4KmAjxe9Y/T3rOiddVl6nnCIPGBO+ArCLhlvKJQBRtNSlVuM2qk3rFbaDSJ6bVU=;
Received: from mail-psaapc01on2104.outbound.protection.outlook.com
 ([40.107.255.104] helo=APC01-PSA-obe.outbound.protection.outlook.com)
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1pNVGq-008Iir-HR for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 02 Feb 2023 08:48:45 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=TADMVfXAJ8I870nxZtu2+X3RGR5IvoAO/MCjlUOcHxm/6YffgckqU5zS7uAIo68odT/3a/hJVSJeYyXP8376EDzgOTKz485zOauqrrjWCzXdKwvFCmEGR0Zldiyb/OR5j/WzOaBbEpWiPkrtVBWq7Hsx98N2RWG1Yyvp+i0N7SBqjJ+ghAzlh/YM3fEDm8MDmfkT5IB1nG+zaaBwk5T6YnwPLCPBLrVlbUepPqqajEC+79/HgpElEgJauFAbqpW9RJFG/7ISV+UlODyKB0skIy/shE22Bz9RlSmG1KTXJhS4JUPMdFuUuO+vuo+uiKF6oOoQ8sHxBYOfTW6D5kkMiA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5LC7c2CJAzq6tVlXVGuvpQutyrfREL0OZTedO1ndBto=;
 b=ZmF0xrbOgPKNUZ08GcVFtX6cFBYpk5gUGn6SSKEjNWFK3yOGeEuYnyYVRt4abvLStuEZEACLqPIKf4dmYzx5Me1KW8ZuVX2s9dNlBjhmil+PcGBz4YqjYgY9nhABekphLvDnj7sqtDVNU+k8ROB+2SotYFPiAzTTyGt5ZpVeCj5JBFvskXp1IkPxI2p9wGjC4AHh0wU830YIt59hdNDnM+Pkchkhkib5GRfPjH+Z/jqK5LaGqiP17gtE71D3oqsVAJPBhnxgLQY8RlUy1qazRKK//1SgRr58A/eORXHUWXC/mpilpzJ5doZtRZH/Y47R2hlDPSzhU48oXz0L3DaCzA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vivo.com; dmarc=pass action=none header.from=vivo.com;
 dkim=pass header.d=vivo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vivo.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5LC7c2CJAzq6tVlXVGuvpQutyrfREL0OZTedO1ndBto=;
 b=BEIkwtKPi2alK2jUsoBACU2uoODscHYD9JaR3ZFqTLm2LHMFCD+9YZbZJ25dbbTAVVseTOcJeo9stXDU4+32PE0H8ClYAHwWmu2ylS6IAt34CfOJl5erOIpv+zCrEFN3MREwFvnN26gZNeXu1siUFYMULdqyvbh7dOWUZuhpCV8Cm58/EXcsx+CZIW2XCmw6tL+w6lB/o+yE4MacOrcVrAiGHl+WNb3skSpdPIt4VNzGU0am5mtoCkhaOp2LYXb28ag6dMy5zNPj+c9vd6MCMOgnQxrIDZ9mF0Crq5X6/A4o2VdhPg/ofuBqnFelwoYojvTY3Q19Nt/BnEYKdiE4uA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=vivo.com;
Received: from SEZPR06MB5269.apcprd06.prod.outlook.com (2603:1096:101:78::6)
 by KL1PR0601MB4514.apcprd06.prod.outlook.com (2603:1096:820:72::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6064.22; Thu, 2 Feb
 2023 08:48:31 +0000
Received: from SEZPR06MB5269.apcprd06.prod.outlook.com
 ([fe80::3e52:d08c:ecf4:d572]) by SEZPR06MB5269.apcprd06.prod.outlook.com
 ([fe80::3e52:d08c:ecf4:d572%5]) with mapi id 15.20.6064.022; Thu, 2 Feb 2023
 08:48:31 +0000
To: jaegeuk@kernel.org,
	chao@kernel.org
Date: Thu,  2 Feb 2023 16:48:14 +0800
Message-Id: <20230202084815.70791-2-frank.li@vivo.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20230202084815.70791-1-frank.li@vivo.com>
References: <20230202084815.70791-1-frank.li@vivo.com>
X-ClientProxiedBy: SG2PR04CA0184.apcprd04.prod.outlook.com
 (2603:1096:4:14::22) To SEZPR06MB5269.apcprd06.prod.outlook.com
 (2603:1096:101:78::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SEZPR06MB5269:EE_|KL1PR0601MB4514:EE_
X-MS-Office365-Filtering-Correlation-Id: a2bc3ae4-314a-4eed-630c-08db04fa42b2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: iMtuVnziWyaLDZXm+nGI0C8Z/cm2GW2PKCx+kYGSJxYuvTg7mrZePDli925seF9zg8Wue/0BBIUCPPcSs3cLICllL1pAn3M1qtgpmFyOZwpXjt7Z7jW4CPeXcpa/SjgctRs9TkzXc+KqFPcwHOvdL/fKTODX3LYErTXQ4QAtCGtYkHzhmYvlrX82bn8Ryqth3aXhv7+RCpIQAm9cYuQkv39fyrueRSDJij0RNHWZ3gtsBrTrjiR9rGJ8RtpwO8xAExg6fWQ73rNAZSW2TV8sn/9xrMmR63TGtMdc2ORr4YuCn8OkSEeAFT1qxj0tXHPcNFEnd/fhogC9IeSFEu1i9km73iEBoy9307LcYvKLQk0tlt78DzSiCjoKVYDUIgfoCiznCGPAY6NbYdb6a1kM9DS/n0QkRofAREPbrKP/uP6tOYam39Y3vAB6Fyyw7UY22WOcIMVgvupjPP8QoJdtpUK/cRsTHeg9P6xhvJpPbRTZNWZtZ39VsfyZPyK9RtLYJSQFpZczju4+iPXLq7ADVnqzzsEzAadhEA1jent8SScAimgu//CSRIkLhW4aWB9ktGJeiM4QN/gNqIQZ/c2qKB8wud+cpjNJCgmeRAnjvX/5emdNxxD25erGa8lVuBxypC7Xq/K+/RzExXpA9At6pFbrqqUm0lAcs/QOv0wV/30xWCdhPmDaGxABCQ32Hkvg3IYqnjS8IBSJQGnEDT2L4g==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SEZPR06MB5269.apcprd06.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230025)(4636009)(376002)(396003)(346002)(39860400002)(136003)(366004)(451199018)(6512007)(1076003)(478600001)(8936002)(186003)(2906002)(107886003)(26005)(6666004)(52116002)(6506007)(2616005)(6486002)(86362001)(8676002)(5660300002)(83380400001)(4326008)(41300700001)(38350700002)(38100700002)(316002)(19627235002)(66556008)(66946007)(66476007)(36756003);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?jDqImtme//JzpkhgPKLEaxrOK6cpKtaWJAWpn4oPiO0zjrhYSRh7ejly7789?=
 =?us-ascii?Q?3NGEgOo+rEcwXPoPqfNjoB5+FpvAVyWSRkJlRxCJJLmqi9mAfTv6/6pXtgp/?=
 =?us-ascii?Q?QnfGe7gg+DX8IPb65B426ilPYsyNu/hDOy52Jd2WpxGc4kFosKaSulyJxais?=
 =?us-ascii?Q?8u8LihOfYNKDA7Bosm6fH7QYDxzrh+qPA63EpBq7Dyjhe+1wKXT8iQ15G4QZ?=
 =?us-ascii?Q?YxaGMiNsoizu4fqAyuvqbWSRGJnXEGp/nLq8yntXnplfGWg9X6cYdEJav7gk?=
 =?us-ascii?Q?7cu0acd3ZbGo7wsv/wBWUSuVyMRMB2TkYPlozPpjVAfu7q7y7Cu7l10D9qgJ?=
 =?us-ascii?Q?tpHvqlLfyVm7Z+RTwvaaZfhvRtA3MCQteVo1Om9A1Rpx0nCv0nPLhXUocBhA?=
 =?us-ascii?Q?btr+lWw4oRxwgVdis37lQhTfmKcTM/Hs4+c5PyoBNpvhFbZEhQllJIwVRgb0?=
 =?us-ascii?Q?YFLkcHEA7f8cMLGQvTtPHvivYRrf5Rh8Z5fvn3aNPaXGP0KXtmtrkUrjAtKA?=
 =?us-ascii?Q?hw4NAwz+5tArrOnyFkdzXjAY//n0uUKWQOYaPJOsUA8KWyABjZxJvy+Yz/TL?=
 =?us-ascii?Q?uBCVfPy/VdRDEgkt2haBGqXouKcE6SDtJmtVI5uUUkh9bhX9umxpgJaBbQtE?=
 =?us-ascii?Q?VfzULqgVrZ9YJEYQb3bMkjdelH/epe5rITF9FYlylgdUVd0kNpckAIvs4C2h?=
 =?us-ascii?Q?F5mckw1CAjKXFNEvEoW6EBc+Rp2Y91BMPXdcpa/JsWDk6/7cSXHleEitX3BB?=
 =?us-ascii?Q?D0MfPQqxhH8wXq5LFDaBOnxxaTEJQrLnXTIT3TphccabMj+y0nAcPNL4WaGF?=
 =?us-ascii?Q?T3GsGga9ztgt5h+SukaQDK2YbVdOcfQgzFUrz9YO/LNPlEzYjtoyBXuZ4CtS?=
 =?us-ascii?Q?H3QG/5pvKTth+d54v7WdgalMKClGpSveEqAe7u5iVVLE/VNxICeZangEy8tF?=
 =?us-ascii?Q?5ITEA54m6r9Bkupeb5JLhHIfqSGL+D8pimxXzN04lajRLErzoW420XUWeYPl?=
 =?us-ascii?Q?v0hJ/X+RhqUHqBwgVjluqgZjHZAK5g9tZ9NVfbSf08qiiR6dQ7AHr6BhnJDJ?=
 =?us-ascii?Q?FLg8dfCt4WtcF6TGioF1RgDdYJjy+lQoA17qXKbGugEQM8LwS0lGEFGLmIMT?=
 =?us-ascii?Q?lL45mM8y/+WJOotYwqtZCfWQSrdvSruLTLTsVOhzva0aYd4K5PANY0UxWzOB?=
 =?us-ascii?Q?JKDJPKXVtGyB001SdbsSFhaWVNqgTnsVUECw+SALlakdS/Dur6X4VZE34njf?=
 =?us-ascii?Q?bi8bWnwwXvWRjOVyOeewf7z9L+lnH0iSh5ZRrCZdW4qaeBejjrSPMWD4Qngx?=
 =?us-ascii?Q?G5aBkuhRh4SbR34P8whUySBdxGsvQHFYQKNUbH09mvhNPSShXQIStKB6zsir?=
 =?us-ascii?Q?jRDNtT6sahJXh3yKLPw+IzFDoQG8m4onGaOLwMV+XFGbNR80VSCIqLKTRLVK?=
 =?us-ascii?Q?m7S/69YNal3Tm8hgqY2BfV0Kfc/tsL7eGKUyEpNlchcV9R7qKDGtdiu1RKhK?=
 =?us-ascii?Q?33rcaTNiaT6+G7/6zxSPm56qpQXzsdTFR3001yfrn5gEZErGtB5ze0dG0/4M?=
 =?us-ascii?Q?eew8uvPAyVGehxlee3YtNfvd1X1Pu7Kk1wej3H0R?=
X-OriginatorOrg: vivo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a2bc3ae4-314a-4eed-630c-08db04fa42b2
X-MS-Exchange-CrossTenant-AuthSource: SEZPR06MB5269.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Feb 2023 08:48:31.1785 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 923e42dc-48d5-4cbe-b582-1a797a6412ed
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: PcJNfPctUHhfyQnPLovz0Q2ip47wl+RHNwZ70NmXEOKs4aIeBbu7Ys+XFeT3l8q6PY6moygtb4z9hqzjyf5HjA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: KL1PR0601MB4514
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  IPU policy can be disabled, let's add description for it and
 other policy. Signed-off-by: Yangtao Li <frank.li@vivo.com> ---
 Documentation/ABI/testing/sysfs-fs-f2fs
 | 27 ++++++++++++++++--------- 1 file changed, 17 insertions(+),
 10 deletions(-)
 Content analysis details:   (-0.2 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [40.107.255.104 listed in wl.mailspike.net]
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
 no trust [40.107.255.104 listed in list.dnswl.org]
 -0.0 SPF_HELO_PASS          SPF: HELO matches SPF record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
X-Headers-End: 1pNVGq-008Iir-HR
Subject: [f2fs-dev] [PATCH v3 2/3] f2fs: add missing description for
 ipu_policy node
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

IPU policy can be disabled, let's add description for it and other policy.

Signed-off-by: Yangtao Li <frank.li@vivo.com>
---
 Documentation/ABI/testing/sysfs-fs-f2fs | 27 ++++++++++++++++---------
 1 file changed, 17 insertions(+), 10 deletions(-)

diff --git a/Documentation/ABI/testing/sysfs-fs-f2fs b/Documentation/ABI/testing/sysfs-fs-f2fs
index 75420c242cc4..8a71397fa060 100644
--- a/Documentation/ABI/testing/sysfs-fs-f2fs
+++ b/Documentation/ABI/testing/sysfs-fs-f2fs
@@ -49,16 +49,23 @@ Contact:	"Jaegeuk Kim" <jaegeuk.kim@samsung.com>
 Description:	Controls the in-place-update policy.
 		updates in f2fs. User can set:
 
-		====  =================
-		0x01  F2FS_IPU_FORCE
-		0x02  F2FS_IPU_SSR
-		0x04  F2FS_IPU_UTIL
-		0x08  F2FS_IPU_SSR_UTIL
-		0x10  F2FS_IPU_FSYNC
-		0x20  F2FS_IPU_ASYNC
-		0x40  F2FS_IPU_NOCACHE
-		0x80  F2FS_IPU_HONOR_OPU_WRITE
-		====  =================
+		===== =============== ===================================================
+		value policy          description
+		0x00  DISABLE         disable IPU(=default option in LFS mode)
+		0x01  FORCE           all the time
+		0x02  SSR             if SSR mode is activated
+		0x04  UTIL            if FS utilization is over threashold
+		0x08  SSR_UTIL        if SSR mode is activated and FS utilization is over
+		                      threashold
+		0x10  FSYNC           activated in fsync path only for high performance
+		                      flash storages. IPU will be triggered only if the
+		                      # of dirty pages over min_fsync_blocks.
+		                      (=default option)
+		0x20  ASYNC           do IPU given by asynchronous write requests
+		0x40  NOCACHE         disable IPU bio cache
+		0x80  HONOR_OPU_WRITE use OPU write prior to IPU write if inode has
+		                      FI_OPU_WRITE flag
+		===== =============== ===================================================
 
 		Refer segment.h for details.
 
-- 
2.25.1



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
