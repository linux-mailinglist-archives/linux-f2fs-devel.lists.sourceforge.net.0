Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F75973FBE9
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 27 Jun 2023 14:22:54 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-3.v29.lw.sourceforge.com)
	by sfs-ml-3.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1qE7iU-0001OH-5k;
	Tue, 27 Jun 2023 12:22:42 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-3.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <shengyong@oppo.com>) id 1qE7iR-0001OA-Vs
 for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 27 Jun 2023 12:22:40 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=MIME-Version:Content-Type:Content-Transfer-Encoding
 :Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=RVRJ4yj55AQDnJwiQ4jidx5L+KkMG/7iVIne/1PWLHg=; b=TaO9mmx+UCJvFjm5IYJ5W/nntW
 VTlgtDvHIPbOoSACvpE6crV7CRyhqwmJJANvNcpPlb0BfMR65jMUuCE6HORh5F0061rG6sh2ueRMk
 FD6GKAgdtEKXBHJfmUQbfFWGx5n1Mxdd8W93ny00GuztfcSSRXgt8rYHj5FOnfcJzbAc=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:Date:
 Subject:Cc:To:From:Sender:Reply-To:Content-ID:Content-Description:Resent-Date
 :Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=RVRJ4yj55AQDnJwiQ4jidx5L+KkMG/7iVIne/1PWLHg=; b=H
 sYb1eq+aoA4kbmMtegRC70KKHZR5GOXQmrBtSklV46f6lOIp4t8YM6DjgDrigcidli4jAwz/P0003
 T445SnaIz/hdiS/tME8WeLGe6VzLz0izv3FJZqoxI1UhiLpp59t+BPa8xqZzABvTHTL25C/AcNu49
 muvZHR2xnN9ftDVY=;
Received: from mail-tyzapc01on2064.outbound.protection.outlook.com
 ([40.107.117.64] helo=APC01-TYZ-obe.outbound.protection.outlook.com)
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1qE7iM-00GOOQ-Jn for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 27 Jun 2023 12:22:40 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=mUNv2EBrJPodZxDTZQj1hoFx4sehpadyHMI2jZlHYLyhwwXr5deFqXFxQCM+7C1SNSS8scDVYKy0c1Foo8TUIIsQf7RcByYx8lrzY1D02c6tpiDovGO+TgtlLjUeeZ35NCtwzQboz09z4UCh+vqTL0oEVVh0KdADOeNBduxsGzKJ+jTgR3fNi0wRdccKoCzJdf1+ck2M2yEDkt/kEwri4lpyJHt+HJ2C5MiLwG1T6rS+QV2bt0JSDKXTB1SYOb9mwRKbOZikSdg1N5W/gnl+FPg3E4EZGwhc1NHZ4VduJZ7W8441u1rrSxK7Mz2m11uvxMl/e4Ynu8hL+gvGPzu0pQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=RVRJ4yj55AQDnJwiQ4jidx5L+KkMG/7iVIne/1PWLHg=;
 b=IT159XsOV6MJi30kPEX+kJ4b56Aje2jSFL0F3yr2k/tQJe5XQHqKa1xBFscCRR8RWPEfDXtn1pQQESNqcO5ZzUu+hd1//FzELXncjiTvsP2NryhXY2aEiHi//isxEalSUs+YNe4adkB/6uvv5sz3plQRHBl6ERxh3IeCd//SzCSY8MmiOGNoADUWO5tllWEc/TmpZddBR9pBPlrwwy2JamsOCNEy81yOJGKRrn11rRaYb62TkX7Yf187R35bfMXtH4IsEyb8HA11yUSXGxpSx4Ct+5LN+ctuxV7GH/WBjI5yLzK3lg7xiltJ3HIP5YOmu47k3vswE7VBsvELzPJb8w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oppo.com; dmarc=pass action=none header.from=oppo.com;
 dkim=pass header.d=oppo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oppo.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=RVRJ4yj55AQDnJwiQ4jidx5L+KkMG/7iVIne/1PWLHg=;
 b=P/SYs1ZdVhI1x/AzWcR82nRQY8u/tKfPoNZEm52owc80fTZ4PQTUZ4IFHt6j/PKwi0H5EmRm9yPLRP/+1+MjnZPLtHtNowzsyqivGkh5yc5KVz5BQnnyDe6H9Hi3vtTiGkXy+fsRtalufAS98njAc/xJ9zsP09qdqrWFxZRGXT0=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oppo.com;
Received: from SI2PR02MB5148.apcprd02.prod.outlook.com (2603:1096:4:153::6) by
 PSBPR02MB4469.apcprd02.prod.outlook.com (2603:1096:301:e::15) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6521.23; Tue, 27 Jun 2023 12:22:26 +0000
Received: from SI2PR02MB5148.apcprd02.prod.outlook.com
 ([fe80::6297:13a6:41f1:e471]) by SI2PR02MB5148.apcprd02.prod.outlook.com
 ([fe80::6297:13a6:41f1:e471%7]) with mapi id 15.20.6521.026; Tue, 27 Jun 2023
 12:22:25 +0000
To: jaegeuk@kernel.org,
	chao@kernel.org
Date: Tue, 27 Jun 2023 20:21:53 +0800
Message-Id: <20230627122153.1557656-1-shengyong@oppo.com>
X-Mailer: git-send-email 2.40.1
X-ClientProxiedBy: SI2P153CA0001.APCP153.PROD.OUTLOOK.COM (2603:1096:4:140::7)
 To SI2PR02MB5148.apcprd02.prod.outlook.com
 (2603:1096:4:153::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SI2PR02MB5148:EE_|PSBPR02MB4469:EE_
X-MS-Office365-Filtering-Correlation-Id: 1ad00763-6d3d-4fe7-bace-08db77092a39
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: yQRSpoBPYRELFqlsPMVlDhgnnzsj6qluOWxxJe0joJDX4pS9NzV5E1uWamu5y/czaSdWFJ7HPHtBozgN9AwkoPESbUPbhUk0oZVvAwYWVveRPiNVukuKACj4C2L9/icTnOz6lcqcLxVwB3Vy9GHjgf1m7T8i/55IA89TQ2i1dxpCiIYCZRjgeoOp3TCDe+dHt3j/rKRwpj7p5KFrwPvEzUN4HQYKWoB4HbSu3ooRVokIjT5CAWaqY+sqmYnLDZkihw1USGfvHy5zM58npQ3Z/OmRAbT1tKobZQINp77rUctiU9tIquRp9ddSlHrUa0ARrE5koglKdpuLHsiv13gU5Fkp9RspdDbVibQjwPVU0WKChZILCOZt+xZ6yfwMiOLTmQ3REAw3d28xgjkimOSpNBqpyf16gYT0jdr/nc0Mj+txDsGvjMNmwFXf32MI0/FlrIhtipSAEnYa/LFLsOC9eVQ0E+TpKiHZvMXd/Tzl5IW/owyRwVIZWngrnKoZBdsyVTDlhv1Wyem3Nnp1YaCly1ltLGr5IdLSt/e3u/SEGzdXj44oiItlT4R/BVExgrD//9wUXmge1r+B6w7EcpwxhSCB5e89RLjBopJIcuJYq0cPqsFF5xquhBt3IEuS4J4d
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SI2PR02MB5148.apcprd02.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(4636009)(136003)(39860400002)(366004)(376002)(346002)(396003)(451199021)(6506007)(66476007)(36756003)(38100700002)(5660300002)(41300700001)(8676002)(66556008)(86362001)(66946007)(38350700002)(6486002)(186003)(1076003)(2616005)(316002)(107886003)(52116002)(478600001)(26005)(4326008)(4744005)(6512007)(2906002)(83380400001)(8936002)(6666004);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?vb+thm+6V7MtjslUv3qRt8aUCbVPia0/WsPdSJnW6YeJdxKPm3I31PXQ4Q7j?=
 =?us-ascii?Q?6alSSSulo40wwY4A3bmnbtLRt5a4lJE+98MsVuxRRvmsEnNT4ixxnM4cOWfp?=
 =?us-ascii?Q?VfnHXRN2FO05yifKdPl6ex+eS34wVQkT/X0/hMRPtQ3H+Tn60dWN6DUqnl32?=
 =?us-ascii?Q?GQehw3FcOPL5zavmsTs2nOkxcwLge2kMwLZGxVhxCG0twYc31JVVzIvDOVaL?=
 =?us-ascii?Q?k23kfB3ZJmRXsD7b18fg5gNlAoLRbuyxS470NKqZ1gqLhUI9XzeRttexGBRE?=
 =?us-ascii?Q?NWcyofH1n+vrVdxQgh3rWLvYLZPc/7xMNveTnZhGlzVxl5dvrZJJFb1gVrU+?=
 =?us-ascii?Q?O48tvBFze4At75usEeELLzbgfYUbg4AEEtbCs9W5HjZ/eeaxN1FSHEyyfK9t?=
 =?us-ascii?Q?3oeeKH3o6zRdmKvVnp+Jxm8dlKKdPKUTx5OmHvkrct/qXrnUSmX/0nfAqXQj?=
 =?us-ascii?Q?fgqgj5vCO9ACQMHYYmWQAXIqcitYy2yrO+hxjFiHZZgeA4PwUAaxnwPXF8tl?=
 =?us-ascii?Q?FlSq4ZLXzzfjhD9fd5tVj7qjWw/D5MwGhR2RGCPjNAORooEscg8uXrnzP2fh?=
 =?us-ascii?Q?Kxeddf2puz3R89VfY5ku91S7HtlIgL3iuldsZMMD2cmZFKvuW9p9HuQDcGtZ?=
 =?us-ascii?Q?Tq5MvjdDs766+TALZ8NKaKINBfZ0MS6UY8PHqwXcfOBF01/HgU33I51bqice?=
 =?us-ascii?Q?6vekKJdmrOcBePiJ5gUo4b/jcrDTKhYiNOmBypzHhtrey1Q5EgoV/ZThRyiZ?=
 =?us-ascii?Q?vTtgyR6gWcONh0Ed5dUZ5ocN4txl0AEMqPjGd3yG2O1nbUEvsVCchfwY7OBF?=
 =?us-ascii?Q?0dV7uBnWrP+UppentSvubLGGxfIAXniQA8LjlzELsdwzVSVPtPuingv4MnmZ?=
 =?us-ascii?Q?Sm0RT9akx9h96xOyohZXn9iPr5mkH1OOY5IzotCPFGUUpa2QA7S+oopGfNjO?=
 =?us-ascii?Q?bnh087lrjfNWnUnYdtBIZAPQovv1UasPmMyXfMNKFsCBiOzFIygD7SPKw+fk?=
 =?us-ascii?Q?+ePPU36I0/ucQEF32FKfIzid3c5HLsU687ZAzOyWd5b9+PTFT2YewNsqFZ18?=
 =?us-ascii?Q?6dbCcf/sQcVfaHa7XWFaHW51EVYhNvHn+vmAEL1zRPQECNRV9RfguWtzsX3j?=
 =?us-ascii?Q?NlRNJJcVnPsAWDwbjB/ZVT/63pljRE1yShDCMC5kQHin8MlPb3qUpDBjvTPn?=
 =?us-ascii?Q?JO0/DWHvNtwM5oc2U6PQaWAU1NgqpY/B4zyvDNmZ4+YhdHbFVduSqIWkgYx9?=
 =?us-ascii?Q?clCqkaidvMnPHiG91x7/LOIq/W62YyiFiWYAArdSyYJV0mKMyFyl7Xbpqvut?=
 =?us-ascii?Q?2KnTaDuF/0jR+dvLxsNYyA/dUr/hx9qvUbcPAv0hFYKUB3nOhcVQK+RhqOvR?=
 =?us-ascii?Q?zQSVhRcjh/xXI8iGrqE4VIp5WuJwapm39PGn2IPzG+nX1UCkLHbKpX3nLfhI?=
 =?us-ascii?Q?S88jSWwiBHQKNQZRCEo9og4KPUiuCSXBgYJt8umrBd1JVCTZeDWF/xxmVkQi?=
 =?us-ascii?Q?0kvpoDUmJqgkfHZ/2NMlQad9YEBxzYdXR+w9Z0gWV/RM+xIVno9UKtPHQ/xT?=
 =?us-ascii?Q?pdPSJVc2PxYnHe2h82qoktr6Jb4j/k+gE3wV7FFu?=
X-OriginatorOrg: oppo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1ad00763-6d3d-4fe7-bace-08db77092a39
X-MS-Exchange-CrossTenant-AuthSource: SI2PR02MB5148.apcprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Jun 2023 12:22:25.1357 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f1905eb1-c353-41c5-9516-62b4a54b5ee6
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: gfc7DhzkzDk24AOHR4mAAsinEVnXqiNHAuBKChIY0x4E/0bE13HBzMzbq6RrViLlQSOMzUVnQulolw5RCz01aw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PSBPR02MB4469
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  If a file is not comprssed yet or does not have compressed
 data, for example, its data has a very low compression ratio, do not set
 FI_COMPRESS_RELEASED flag. Signed-off-by: Sheng Yong <shengyong@oppo.com>
 --- fs/f2fs/file.c | 8 +++++--- 1 file changed, 5 insertions(+), 3 deletions(-)
 Content analysis details:   (-0.2 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
 no trust [40.107.117.64 listed in list.dnswl.org]
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [40.107.117.64 listed in wl.mailspike.net]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.0 SPF_HELO_PASS          SPF: HELO matches SPF record
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
X-Headers-End: 1qE7iM-00GOOQ-Jn
Subject: [f2fs-dev] [PATCH RFC] f2fs: only set release for file that has
 compressed data
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
From: Sheng Yong via Linux-f2fs-devel <linux-f2fs-devel@lists.sourceforge.net>
Reply-To: Sheng Yong <shengyong@oppo.com>
Cc: linux-kernel@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

If a file is not comprssed yet or does not have compressed data,
for example, its data has a very low compression ratio, do not
set FI_COMPRESS_RELEASED flag.

Signed-off-by: Sheng Yong <shengyong@oppo.com>
---
 fs/f2fs/file.c | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

diff --git a/fs/f2fs/file.c b/fs/f2fs/file.c
index b1a4de3b53e01..0f54c1ff02f71 100644
--- a/fs/f2fs/file.c
+++ b/fs/f2fs/file.c
@@ -3510,13 +3510,15 @@ static int f2fs_release_compress_blocks(struct file *filp, unsigned long arg)
 	if (ret)
 		goto out;
 
+	if (!atomic_read(&F2FS_I(inode)->i_compr_blocks)) {
+		ret = -EPERM;
+		goto out;
+	}
+
 	set_inode_flag(inode, FI_COMPRESS_RELEASED);
 	inode->i_ctime = current_time(inode);
 	f2fs_mark_inode_dirty_sync(inode, true);
 
-	if (!atomic_read(&F2FS_I(inode)->i_compr_blocks))
-		goto out;
-
 	f2fs_down_write(&F2FS_I(inode)->i_gc_rwsem[WRITE]);
 	filemap_invalidate_lock(inode->i_mapping);
 
-- 
2.40.1



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
