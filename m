Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 85CE88913F7
	for <lists+linux-f2fs-devel@lfdr.de>; Fri, 29 Mar 2024 07:58:11 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1rq6Bg-0001LK-KG;
	Fri, 29 Mar 2024 06:58:04 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <bo.wu@vivo.com>) id 1rq6Bf-0001LA-QV
 for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 29 Mar 2024 06:58:04 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=MIME-Version:Content-Type:Content-Transfer-Encoding
 :Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=pKyXRhn60POlCyZ0o3zdTcg55ZMiH0OAcfx133JR1T4=; b=N4dsNghPkfgTbu22C7/Hg5KjgB
 v+yUPj/JsVN6cDMQaZNL718sGkfj33AP32X8/CVuRcgglTFj0LE3XGCRjK/wzCzWhCy72NjJ5Orkt
 xr3NMLnG6XqyaFqeMp/v6FoTRSCmH/+JD2PYEVB8CRyUQx80GV+b2/Vm2ms5HIu78UeI=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:Date:
 Subject:Cc:To:From:Sender:Reply-To:Content-ID:Content-Description:Resent-Date
 :Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=pKyXRhn60POlCyZ0o3zdTcg55ZMiH0OAcfx133JR1T4=; b=N
 vFQF6HYTsxj74+BVnzMDagv0nMwO8PZQdsVuYJqsQWEfLvku3DA7hvTsi9V+e0nQCDaSfISIawPR1
 X4zwHhCDxDVPTMgRb0kyrznXPGI2jy2nQJPAGSTlJdh0Cy7ySFsU7BijcY/X7Fi/mRA+aQBsPe5Bi
 LdVebwkbp4ZKSfXU=;
Received: from mail-psaapc01on2136.outbound.protection.outlook.com
 ([40.107.255.136] helo=APC01-PSA-obe.outbound.protection.outlook.com)
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1rq6Bb-0001lY-Nf for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 29 Mar 2024 06:58:04 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=JM6UIzVGVAvMnEQOmOHal11VlNwnWclrPczZ2qa8ckd1b55guLro6o4Xzw/qNNeXlO+Q8mm3464Wh25xPcHGecfchuX1yfHkfBbpvquPGjVWu3LmQgQfXBV5OWDF7QCtB2G+Dx/qpICTjoJlhIgEIC+5+EZpHMItZUbnfmoUzaeU3Jv8M+TaC5XaTDQUb1eepA9Ro27pYwnYZK4alVnasfkC1FFjFqn4jT8LDPigIrR7gVZ7qb5WEI0fsJ3er3pPWufcRd/8WwuJ07R8n9Ug5B8DAHlmXdVBnoykRSZwIWl7uIOL3jvAwmL79fBqKeGgCvXHQvNKlRfsdnj0FsP70A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=pKyXRhn60POlCyZ0o3zdTcg55ZMiH0OAcfx133JR1T4=;
 b=We9TWUWmRoxQgADIDtv39oYg1gRU4ocizlSqoPKt6ZunIkvVC3wa9CPDni7DSs+r8OSVSNV9S7qJIqDup4j5TbSoDGLf7rS5L3X3jZy8lp9lxzBnAWQ6APlvVtK635K64DJtnl0JzrUsWsUWgY+RoGVm79AjlatGF7TwsfObhmiZZKm5xDQjSi+bvoLr2fNBVnWfuEcFqtaICpRucO3AVcLsUcMUR30icJji1POhZAIx2csUPbbsdmCCnRMDMm4ddPYRt+lY59iCMc6PsnLf/c5+jkZCX981ojKUEQz+XclktCyhYoSn76R6i6waTYpNH/DFMNTLl3UWbhXKe0GXhg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vivo.com; dmarc=pass action=none header.from=vivo.com;
 dkim=pass header.d=vivo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vivo.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pKyXRhn60POlCyZ0o3zdTcg55ZMiH0OAcfx133JR1T4=;
 b=dlsUyKhpYZu6IIXWATsOLU0M688us72orek3sminInRZqWsDqGYDl9da52AzB4C4LAVr8ksL7ij0ynukef9iBNEiJdKU6OVq3kyr9NbB8a9v2J5UHDqW8pY9r3dCyCOQCrkAxKFA+AVG31IxQiUqxnR2DKVN0+IP/P93FkBQwmDAa8djKCsTe2+vQPJycFHC6iP/LJTZV/x+Fp7oDRfGAFf6tyObahiWq6Mk4rxTEsqdQDnmf6apxxsSmg4krtPVaC8p0uyg0EMJ6a5dBAbqbN/tXzeRBxnSFiU8TyHii0S6v/nxoCgMXkpa0VdkoRf1+sAOBiGSOlOidUHFraNJfA==
Received: from PSAPR06MB4486.apcprd06.prod.outlook.com (2603:1096:301:89::11)
 by OS8PR06MB7466.apcprd06.prod.outlook.com (2603:1096:604:288::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7409.32; Fri, 29 Mar
 2024 06:42:52 +0000
Received: from PSAPR06MB4486.apcprd06.prod.outlook.com
 ([fe80::45e1:65db:1bb:70d4]) by PSAPR06MB4486.apcprd06.prod.outlook.com
 ([fe80::45e1:65db:1bb:70d4%6]) with mapi id 15.20.7409.031; Fri, 29 Mar 2024
 06:42:51 +0000
To: Jaegeuk Kim <jaegeuk@kernel.org>,
	Chao Yu <chao@kernel.org>
Date: Fri, 29 Mar 2024 00:55:08 -0600
Message-Id: <20240329065508.2398202-1-bo.wu@vivo.com>
X-Mailer: git-send-email 2.25.1
X-ClientProxiedBy: SG2PR02CA0121.apcprd02.prod.outlook.com
 (2603:1096:4:188::21) To PSAPR06MB4486.apcprd06.prod.outlook.com
 (2603:1096:301:89::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PSAPR06MB4486:EE_|OS8PR06MB7466:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: M3X1slR6IDaekK6e0oNbGBL6g+BMRhH+5jYYYTJj2O8TkcaJxiBO8IYsSp7Cok6aiB7KfmuBrcfyESt80PkLE2VT+3hWbKGFpjHxO5QBPOvPq/5b5whYcdWsVc9URLK3Rk0uXfJ2y4CpFBs0qLYg1e/hUcGXOpRyRi5zWQZj/TAW+qleE7SEC9PBlszdZjsjQwdVGD2TnUL+ZxQMKR+O5lCFaAkb9yBNaFTde549Cm5vasDlFJ7q2lkugV/sbiHmGJ1bbvT4kVZ/P/m+sGDFEQLjVh24cuXeL0Xcu0M31qx+qgsSMJ39gcRhPz7r9u/x85GzSQRUvRvYZcO4IINYCjE31Oet3c5qAgmR+guukc04fCLl69tkUcI7PlkIGoWQ7f2P/VEg/KCq3J+bJkJlTxX+S6bWsRFdtstfMn3409Ok4xKy/ipdPrGHpfjZYmI4LUeVZKAyImM9gMN279jAdHAoyU8EL3g9COlAI1dl5aff7fOzVqF3KQNvQxmCIewJe3iUw3LOP1hypm/BIH862zw3RgVoIIzd/2A+kBlnw00h5t9dZvaB+rPeCP1vDVmCmKcO85vQmqbVHxbR1pu4jzLYWiWPgp0T4fb7KWxY1/fmJ6RSASo3epAPg4PH67ug1lcl0msOWXGJ5Xgop1XBoiUhV4mgz8rStwDQnA+S2eDkhRyt6DwvLmLYQ8jw5AP26s1Xs5bZqnTUvgsXvA5UzdeEGlRtRGCaIk22b99dHQk=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PSAPR06MB4486.apcprd06.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(376005)(52116005)(1800799015)(366007)(38350700005); DIR:OUT;
 SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?FnHEEaAoa7+SqxWpEDZQiX1pQK7abpNOly3MySgj/gQWxQ7TuVqSq1AVrXKw?=
 =?us-ascii?Q?guEuBO4StMuOWTOmGLM+HK5yorc3ZpLicaIssOpSrgeiALq9r/8bZYgtmOGh?=
 =?us-ascii?Q?zgVnAvg6N1GLKvXWYlE8wQq48qSYiJhC/1DdAilSMGgbb11kKi9qJ5oTlXCv?=
 =?us-ascii?Q?ycCp1zV9XHYSTltkMnjHM0kYLnOn/0F7LCl3gkZQtlbuB6JgZmW67jbwI+en?=
 =?us-ascii?Q?3JfhSAAhx4cbYYQ+BuS8kaS3uinIeDb9v3Qzb3b43+oyQ2NjfzUzTt/xaCG7?=
 =?us-ascii?Q?ptf3ycJFblQU69CqloFx7Xsngx9b6tZcdLQt3SeiFgLXxDyv2Rm7Z+5Wf2Cg?=
 =?us-ascii?Q?pj2xiz/QDYNRjnIKYudfhTMO3fdaBi0MyvfbR7c1jW94WqwIQwtj9wlBZ31A?=
 =?us-ascii?Q?UfDic42H0gW2D58/okVlNOYK//utbgLwNzpcKumWquDSOR4PGK584/dNnDLF?=
 =?us-ascii?Q?cOpTPMoXb7NcW05qv837BFWQvCXUfCUF5gKrHJ/DuUTEx8pdDoZuMeSeWoHX?=
 =?us-ascii?Q?9AkzcQVLUVNDig/ydaMCWXawxKzbpS70eVjZ0k+VDHeRP4I6OjRbLiUZXDvv?=
 =?us-ascii?Q?KzWLVwMUjuV46lNULkxBHolCIL9wIW0Gjl+F0LmeZhiLF8QH4NvJTNykg6RM?=
 =?us-ascii?Q?kOLd80kbJHo8P7VB/29z4hh+PGGpa6ilWrXqCWiS7EAbAXkrsOteDY8P2T3G?=
 =?us-ascii?Q?qtGQZQf/hRfuR/OwQ0RHAGio7iDMmxA3sGGa+6O6FsUlFxc7S/T3Cf2M2HAx?=
 =?us-ascii?Q?PrDektI5HazZMwGqLrl6u5PQM7JfBJ4MI7OJ9FeHAMIIyKjLjCkg9LCgNObx?=
 =?us-ascii?Q?hUxbTSXaQwmipHqIpePIcXuPBRjWHeidDVHaYpaL2OKFE09K4xMNX0SN14rr?=
 =?us-ascii?Q?pSpNY03HZw3W0NmCLTgzudyFsbPgaNBQ8nQNM66qDNGR5IO4FzxjiWZtwaKE?=
 =?us-ascii?Q?kahfV3NaX82u1G29tpskXQjyaEs1xUNQANqoFWh/TjRdtpY/0GVt49P1bXCq?=
 =?us-ascii?Q?wvbbCMlziCgjCzIowaFQrqAwLxoApymGxQaP197t6m9SnJ9sSAgH6CTj8qqD?=
 =?us-ascii?Q?qAyLtTZWG8VeLG69Kr+9dvfWZx/8JOPxC5aGXn+NQAdk/QJ/vFIpM0pQcGI1?=
 =?us-ascii?Q?lI8IBNe4UKhWa3uzUwYLPdoZi9w/ZDEDu57IJL2cPrrIORAiKXAL3ISitec9?=
 =?us-ascii?Q?Zg28E30hpNyaKbAKoG18/I2aIcRMeyvi9iL3WXY59csJClPapjVMuHBwmny2?=
 =?us-ascii?Q?r8mx2EbnuBpz3M/8sCw8NghfpFTAV1BVDgkwmZQb4uHvIvSbAJkCyYLkPuyO?=
 =?us-ascii?Q?kgJAUygA1zBJQzeIa4+9V6TzTGTFzSyNWE33j6xKF0L96bO+wgwGlYmAaYu3?=
 =?us-ascii?Q?d2YwLbxwZXRwRNoRLZEEAg52BVD/yGvhILwsMQfgem25J8fUeu7msO3SOlO4?=
 =?us-ascii?Q?9IrjDvSgORemPPBKcdn8B6dH0aDu1g3vh2C4We9CRB4FZ6vdZfel4h2Vig7d?=
 =?us-ascii?Q?0xDsS0IHGDr+ItES+eP5KZeDo8WHrH6WUrtek9i1nRWR7tjgr1gLakXotVsk?=
 =?us-ascii?Q?Q9wIDooAw85/l66SlCVgPmUzydv03luyToDErDjf?=
X-OriginatorOrg: vivo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3afa1f57-006f-4476-babf-08dc4fbb743a
X-MS-Exchange-CrossTenant-AuthSource: PSAPR06MB4486.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Mar 2024 06:42:51.0069 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 923e42dc-48d5-4cbe-b582-1a797a6412ed
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: mDXRMn2f7Kvh4HGPA9YAymmX4p1C2LHckevlHvZCsDIofJ9hdei+duFR87fOC4P+ojFCbDDGux/wXMT9FtYT1w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS8PR06MB7466
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  Consider of a f2fs system with 2 devices: Info: Device[0]
 : /dev/block/dm-46 blkaddr = 0--3fffff Info: Device[1] : /dev/block/dm-47
 blkaddr = 400000--67fffff f2fs_map_blocks will return logical addr of fs when
 doing buffered io: f2fs_map_blocks: dev = (254,46), ino = 40020, file offset
 = 462865, start blkaddr = 0x400000 
 Content analysis details:   (-0.2 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [40.107.255.136 listed in wl.mailspike.net]
 -0.0 SPF_HELO_PASS          SPF: HELO matches SPF record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
X-Headers-End: 1rq6Bb-0001lY-Nf
Subject: [f2fs-dev] [PATCH] f2fs: fix 0 addr of multi devices when dio
 mapping
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
Cc: Wu Bo <wubo.oduw@gmail.com>, linux-kernel@vger.kernel.org,
 Wu Bo <bo.wu@vivo.com>, linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

Consider of a f2fs system with 2 devices:
Info: Device[0] : /dev/block/dm-46 blkaddr = 0--3fffff
Info: Device[1] : /dev/block/dm-47 blkaddr = 400000--67fffff

f2fs_map_blocks will return logical addr of fs when doing buffered io:
f2fs_map_blocks: dev = (254,46), ino = 40020, file offset = 462865, start blkaddr = 0x400000

While dio mapping will return the addr of device:
f2fs_map_blocks: dev = (254,47), ino = 40020, file offset = 462865, start blkaddr = 0x0

So the addr=0 is valid when the map.m_bdev is not s_bdev.

Fixes: 8d3c1fa3fa5e ("f2fs: don't rely on F2FS_MAP_* in f2fs_iomap_begin")
Signed-off-by: Wu Bo <bo.wu@vivo.com>
---
 fs/f2fs/data.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/fs/f2fs/data.c b/fs/f2fs/data.c
index d9494b5fc7c1..dca3628932c7 100644
--- a/fs/f2fs/data.c
+++ b/fs/f2fs/data.c
@@ -4185,7 +4185,8 @@ static int f2fs_iomap_begin(struct inode *inode, loff_t offset, loff_t length,
 	if (WARN_ON_ONCE(map.m_pblk == COMPRESS_ADDR))
 		return -EINVAL;
 
-	if (map.m_pblk != NULL_ADDR) {
+	if (map.m_pblk != NULL_ADDR ||
+		(map.m_multidev_dio && map.m_bdev != inode->i_sb->s_bdev)) {
 		iomap->length = blks_to_bytes(inode, map.m_len);
 		iomap->type = IOMAP_MAPPED;
 		iomap->flags |= IOMAP_F_MERGED;
-- 
2.25.1



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
