Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id A915F704D6E
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 16 May 2023 14:08:18 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-3.v29.lw.sourceforge.com)
	by sfs-ml-3.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1pytTS-00078l-1u;
	Tue, 16 May 2023 12:08:14 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-3.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <bo.wu@vivo.com>) id 1pytTP-00078b-FE
 for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 16 May 2023 12:08:12 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=MIME-Version:Content-Type:Content-Transfer-Encoding
 :Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=azVh/Z/vDfLnl5EAm8i1j2xbarngxj1S2y4We6ru27Y=; b=RVttwWP3rCmQTfK/UXYpdPa72P
 xpzQW5Zkd+lW20J9Rr91lYDHRpzzDYYcOjgA/JTyO+E2XfuYPRBiNmpUiBwG4Ez5HroelFZxQmfdw
 +e4+gzcRWDbbz1kc45NQl2zRLICndhcp2dzrbIeW5hkg+vjU+cp9MHLQe/5nDQdZPRQM=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:Date:
 Subject:Cc:To:From:Sender:Reply-To:Content-ID:Content-Description:Resent-Date
 :Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=azVh/Z/vDfLnl5EAm8i1j2xbarngxj1S2y4We6ru27Y=; b=L
 IOzOKJRGFDqTIqtXvGw16kr/Ihp3Peu+afigu4IZJVcMNcliOmPpJph4wArijhW6bq1ix0u5oTKvT
 5NGTT24FNI4fjf3ucXsAUWHV8WWV3haRHHxgQBbuj845ZUoeS5dZ1t8ML8e4Ln9eJsJ0RMsvdzYdW
 cjY6+gJPd4Obc34E=;
Received: from mail-psaapc01on2098.outbound.protection.outlook.com
 ([40.107.255.98] helo=APC01-PSA-obe.outbound.protection.outlook.com)
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1pytTK-0004iu-1p for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 16 May 2023 12:08:11 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=TQOvZtDUVaonZikDRNXGnCHOEXzAJ6nswONwtyN6rMv0SkEQXvX3De8eKN1A6KNaPojRGntogwnnZWyg7Yf71H1ACQjIDQghmsLPPhim9kBEEqx/wrZuS6yteVhMFlcSbrKKwv5av2b8KCXv7z9JpVbQAIug85dNMn72tKZA9Nv0qhjXiqPvat84YZbV6DeB11L7PdvWlUXwoRlNDBPy2dM5KSPADg/R0FJMg3dhdXPV1qW/9OSdV1vnfSWkJYqZ1C8WECGJmrVou6o30wDpD01mdLomMsyG3PGMH0/qhdo4Kln7cRAk2lMWopi5mafWcFRTNZbG5+eXdkdVJqbY3Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=azVh/Z/vDfLnl5EAm8i1j2xbarngxj1S2y4We6ru27Y=;
 b=RA2oBjbEz7SdSMi0EDfe7GO6luuY7LNudMnSHC5oZRES8foWme6kQ9kPqS7xctpfOvLHW3lEgwasiWR6vXdyJTWlTVwP62H7dDRJLYUg7b7QTuVmiIbq3H36WN2KXLCAm9c45kbfCO2U/6SOu6IK84Oe+rc8r9D+6SOXZ8mMMRxVDTbYn6DRQ1XX7FzdZrbCxTFtLM48+z+bAQl3Qf51YSIaYUEVcWvuJWErzb6qA0/5TCGVx43rMofx1mKTfXA5q3O0wGXmQR18dSnPEPyCI8RHycNc4CXXomhIWmWpQFK5wIogMfj7L9+gXsKkEuFXmlfzqaYZ3o/Vt7isfC4SoA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vivo.com; dmarc=pass action=none header.from=vivo.com;
 dkim=pass header.d=vivo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vivo.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=azVh/Z/vDfLnl5EAm8i1j2xbarngxj1S2y4We6ru27Y=;
 b=NnowaGlqE4RgF8CA+zQpSSZ/SUBxAUNAjfw+kf5WZH5l/9xs4cUOXPE3kTK6931SSl+6n+C9m8wtDat0f96OJbQU4ClgYlMp3vlDvVDHMLgXIocOD27AVrV2NiOtvMGLOtZDUbFGyQViZpBOn6VvaYlCu4sd+OHGj8x3kaZpiosECoZtZ3SEKjjmyCHnhq3J1aPSn13J1zaKUHNsAhpRh1PYYiv798mv+cboEje2YE3y8WZQEE+UHcXiHPaviEkFjXGq6tBBxQkpBdbiEkkdQG78uaYZIMGTdts+WxNvSvEZfuHaGCH7qF9QZ5eor7wEzfGJPYIHLPIUgF6ra4Yqyg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=vivo.com;
Received: from SL2PR06MB3017.apcprd06.prod.outlook.com (2603:1096:100:3a::16)
 by SEYPR06MB6279.apcprd06.prod.outlook.com (2603:1096:101:139::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6387.23; Tue, 16 May
 2023 12:07:56 +0000
Received: from SL2PR06MB3017.apcprd06.prod.outlook.com
 ([fe80::b895:d992:299e:32d4]) by SL2PR06MB3017.apcprd06.prod.outlook.com
 ([fe80::b895:d992:299e:32d4%6]) with mapi id 15.20.6387.030; Tue, 16 May 2023
 12:07:56 +0000
To: Jaegeuk Kim <jaegeuk@kernel.org>,
	Chao Yu <chao@kernel.org>
Date: Tue, 16 May 2023 20:07:47 +0800
Message-Id: <20230516120747.68844-1-bo.wu@vivo.com>
X-Mailer: git-send-email 2.35.3
X-ClientProxiedBy: SI2PR01CA0041.apcprd01.prod.exchangelabs.com
 (2603:1096:4:193::15) To SL2PR06MB3017.apcprd06.prod.outlook.com
 (2603:1096:100:3a::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SL2PR06MB3017:EE_|SEYPR06MB6279:EE_
X-MS-Office365-Filtering-Correlation-Id: e36a2bfa-401c-4c1e-c693-08db56062ef3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: GQjIEFXLZyd7deTyFYTFk49y0KP8C0GmngTOmCU+DKkAoRFD4uHpHC2pXkwi5g47WsUIwn0+isCaOeO8b2KDuSzZL4vmifgp6YLAHjvJfRRWQ3dwzEQp5/ImifgH9Allj9EZhNzcwCWAZnPOFxrKykoAH5zw2yAduWYi3ouPmc8BH2HHfGCUTww66yghRUE7xwYjJXJJzcEagANbQrribM1zApCYu1mMzvavW8AccYUjixffZEqgzUrL/g7CsDYfrBdKIrVxmrT1txv1tNKFGnY/60GINT1ClklhpJMYbUdM8Bl1LUaXN9Mi3lk7I1RnqjuZeQq//gr27TwkvcWsG8DL1wgUddLbfocXF8iQTLKvkAOxLC508iHRLvHx3Jk+kZeLFp5JuivyP8UDT4QksgWw3yl8076szf6VE/0QETOfMSBigK8tMuRCW6Rp2+2rTR35vAGu3HbU1D1iqSRW1UhTDA9otmdHuUjiAobV1+kkwNGv+k7IuvNpehfY/qg56YDGd/cda3ZeTJXivCUPOMKbiv8toK48Z8RJ5/niLVWU5hSGieIrXrZja9iHLcAohtakwsxclCXPCKwweWDQYzF3wqrpXRqWV3FnzcLQoUDTxUQ8/1d0PGxh+jcj1ZNY
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SL2PR06MB3017.apcprd06.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(4636009)(376002)(39860400002)(136003)(346002)(396003)(366004)(451199021)(6486002)(52116002)(38350700002)(6666004)(41300700001)(8676002)(8936002)(4326008)(66946007)(5660300002)(38100700002)(36756003)(66476007)(316002)(66556008)(186003)(1076003)(6512007)(83380400001)(107886003)(6506007)(110136005)(478600001)(2616005)(26005)(2906002)(4744005)(86362001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?JXJy8fPkvIes+c7JbbvrVfqsU/9kojjIL+TYcnOWs7WB18CYSFGoNWiz1KYb?=
 =?us-ascii?Q?Gh1rHcdjHCz00Pt9eCcQkOvSOgPpmf7MwHfAiwo8MtZ0Hu5tlPJqAVCUvHy1?=
 =?us-ascii?Q?HEwYBCSVhfG/TRuZterl+trgoy7IVVCar/3ggw2b+TH+zPevYtHgODVkcFA7?=
 =?us-ascii?Q?2N2WlS1wPo5GiDh3Im1IYseucYsep+oYBNdSBlvoAwNCfbO5Z9s33GcJJM1/?=
 =?us-ascii?Q?sID5AhsfMWYHHFMw0UcFHYR23S0I9oMMx2X4dPSWtiDn9604ZbJxDmQXt8Oy?=
 =?us-ascii?Q?oUBPIBDEQjSZDxJjuTRvKebpZgwCbp7XYlq2BWBHAwJ5/ZiY6n6gJq7W9nNg?=
 =?us-ascii?Q?u68c2mkSjRzqJqJWde9Sox8G+0T+Ylw8xl3ksd/9Z3+BEDbEl1m7b08LFTH9?=
 =?us-ascii?Q?SyWLsZT6ALxKQNvPzme23H9KF6PpdMCyJPA76+LDJbGWXd93KCikSMFUQcWN?=
 =?us-ascii?Q?OGRKOPd7ZPYtZUKYRB/xEBHbwJp3DQTypGmoH7fF+HakdC3FahREZCtsaTh/?=
 =?us-ascii?Q?vIMN4zLuf8Fmbfv3TzwlZv4ZIw/FWzXZlFmBX5m8V9NPrQiw+5HTZ7avI5TN?=
 =?us-ascii?Q?PHgtV1UfKIoLeM3IvsWXJsUhNZ3wyFMhFEXrutOp5t7w12eX0/McfT6wSxD3?=
 =?us-ascii?Q?P3tEIe8FsCIQdVnjbc8/0G5iWYrMVt86AoovWZlQxCNz7bTUcJxfAawqNMv8?=
 =?us-ascii?Q?U+Th3EMyYPxeOqRQ5gWRd38tHGFp3ZHiTx5Igoql7apYoqsZ2Ea0LNS18Ylv?=
 =?us-ascii?Q?X7VuKduSanTJK0U7aK2gZBBlcPi8YYRwItKHOk/HiVOTwTmk30Td0iXys1q5?=
 =?us-ascii?Q?fJPTUJfIinM3QAV/GUTxbNkgvwhFSY0v5MdpiuZhp2xU0kGK4a3NzfoxXYa6?=
 =?us-ascii?Q?0BHXaVBSMP65Ohmne1a1J6TQmhbOgIQbdfdSSRObPQ+4+/YIl2yOsZ7JnNit?=
 =?us-ascii?Q?T2Ab+YBnWSVEu0dJpEZnwEtYdsqDuC8HlkOHUFkBaa9NZFK6YDvdDpXbFVXy?=
 =?us-ascii?Q?N1KIQ8EsVlM9/NA6sdVTY6+BEIzM5NSz/TzQxmBF+YoUs9/NC/3kARU1h30c?=
 =?us-ascii?Q?+8pH654577k+TnbW8/5SeItw9mWkOOQsg1/GErwHDJDbdquvYxp0o3L2CSCE?=
 =?us-ascii?Q?swOuZURHNPnUFXKVKGNFDGKguZXKMHUadjBqdpupBi0qdELZ8n2xBtC8J4NP?=
 =?us-ascii?Q?qKVg9ms4mjDOjTkN90yE7qz31cGg/3nsH5JOtCehQ1Wc1HXRS7MFTWDuFQrj?=
 =?us-ascii?Q?oVSgK0PXsmFDzcV/C0mOrZSM4F6pI0KDD4BJhEyafYsW9IQQpolPBcOvH9Sn?=
 =?us-ascii?Q?hxXGJ8SCn06rBc2YPXZ3oSMXFbJiZ5IorgVOxQ3tRttJy/+egt7Szu3Yj+9K?=
 =?us-ascii?Q?hlXVQLdJ76ox9IR1ZfB0jrzsPhML86FWhQxHs4z/hcG6pMMNszNxEEzbfisL?=
 =?us-ascii?Q?s3n9FfESPl1UZCG99tpjslUrw3RpqXYKtWlS3PMiBfcQLwGBKqBDQw9YpDyA?=
 =?us-ascii?Q?4oqMxLdgbXxaWR2f+2XUiUwlxB2491F2dvz3PSE/cHJtYPf8HPOMNJ+RQUl3?=
 =?us-ascii?Q?2T57IHVTJP8zM5RwcemM3VPEtNl5tM3uHE+Z5Tsv?=
X-OriginatorOrg: vivo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e36a2bfa-401c-4c1e-c693-08db56062ef3
X-MS-Exchange-CrossTenant-AuthSource: SL2PR06MB3017.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 May 2023 12:07:56.3164 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 923e42dc-48d5-4cbe-b582-1a797a6412ed
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: JH7e7yfo177QbnckZkgc0vxbcGbV2Di9QAXbZO2q6hS8BoZoffRR/Py35lCq7WAaz8O4XKZDMcDgMYRhyru+SA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SEYPR06MB6279
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: Modify the order between 'trace_f2fs_iget' &
 'unlock_new_inode', 
 so the I_NEW can pass to the trace event when the inode initialised.
 Signed-off-by:
 Wu Bo <bo.wu@vivo.com> --- fs/f2fs/inode.c | 2 +- 1 file changed,
 1 insertion(+), 1 deletion(-) 
 Content analysis details:   (-0.2 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
 no trust [40.107.255.98 listed in list.dnswl.org]
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [40.107.255.98 listed in wl.mailspike.net]
 -0.0 SPF_HELO_PASS          SPF: HELO matches SPF record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.0 T_SCC_BODY_TEXT_LINE   No description available.
X-Headers-End: 1pytTK-0004iu-1p
Subject: [f2fs-dev] [PATCH 1/1] f2fs: pass I_NEW flag to trace event
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

Modify the order between 'trace_f2fs_iget' & 'unlock_new_inode', so the
I_NEW can pass to the trace event when the inode initialised.

Signed-off-by: Wu Bo <bo.wu@vivo.com>
---
 fs/f2fs/inode.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/fs/f2fs/inode.c b/fs/f2fs/inode.c
index cf4327ad106c..caf959289fe7 100644
--- a/fs/f2fs/inode.c
+++ b/fs/f2fs/inode.c
@@ -577,8 +577,8 @@ struct inode *f2fs_iget(struct super_block *sb, unsigned long ino)
 		file_dont_truncate(inode);
 	}
 
-	unlock_new_inode(inode);
 	trace_f2fs_iget(inode);
+	unlock_new_inode(inode);
 	return inode;
 
 bad_inode:
-- 
2.35.3



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
