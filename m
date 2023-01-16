Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id D648566C190
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 16 Jan 2023 15:13:05 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1pHQEO-0006Np-Vj;
	Mon, 16 Jan 2023 14:13:00 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <frank.li@vivo.com>) id 1pHQEM-0006Nh-RH
 for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 16 Jan 2023 14:12:58 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=MIME-Version:Content-Type:Content-Transfer-Encoding
 :Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=zb6iXDGPAlL3TZEXbmMuRTp2IIEdxjSqzG7DS95kCpo=; b=ffcx+8NT92xicsIyZ6cjTlPiBY
 MOLoffID6d22zeXlZZEGNCvhw+j+BdXY2BPQp1VPsRmkU7ohakkD6tD3acOY5u6jhcnDOAt6opoQ3
 v23fHCWnZezavjDNOPNsFv6EoOjp8+6Gtn4PJkPtCJXSO2jJ7xRMB8jpReLit/TSvwGc=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:Date:
 Subject:Cc:To:From:Sender:Reply-To:Content-ID:Content-Description:Resent-Date
 :Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=zb6iXDGPAlL3TZEXbmMuRTp2IIEdxjSqzG7DS95kCpo=; b=X
 fk6UxyKiHQpVtR78D0yH8INr8WvW7/Lnr63PgSPwEdYQB2D8M34l84XaP9BkZsyIJJgCd921dyJIp
 lGIzJM1PstV1N7h5S5k3e/mzmfLNjEbN0Jk8Amyd0EUaG9aJ605lXPG5DOYAaauLk20qD/GOi3USq
 yIGNYTUDY34RfUmA=;
Received: from mail-psaapc01on2121.outbound.protection.outlook.com
 ([40.107.255.121] helo=APC01-PSA-obe.outbound.protection.outlook.com)
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1pHQEF-005jz4-76 for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 16 Jan 2023 14:12:58 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=QytSTJ2fJQ+m1O6mRhCFAz8dVMROcvIlgigXAp1M3cnnc+R+W23P//RuKLwDw3nxoJw6cAMZiHZJUnSnhRBUExVMUsCcWMxOScx59SScqG6Tig9q/MiK3O2jRMAXWUuHkjCs9BnjESMsauQujamnE8u7SMYG6KvuF1gXCxnLMLC5K6fMhebqYgbfwmhRlx7/29v85vsZc1bqG9ruH5jrmOPTmb6oN4qNsQnrJNyrrob8I1PIUdAXVaAL5YD3E66DBJoaYry8mLOftVyT5sJXx29mpRUybLw2gXgAmJbA0AoPKo2BkkH8rVGNCOT7e2FXS+iIb2vCujWZ+bkL4FGWjw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zb6iXDGPAlL3TZEXbmMuRTp2IIEdxjSqzG7DS95kCpo=;
 b=cMH5gk5CTvbMMX2XdO9+A+9Y173lLguZmTffaAqI/2F8OaNVwrA6Q0ItCvhA0wUo1F2awjVkrA9CPhUrv3OD/D3T9lIS4lomrvDW34mcsTrtznIxL7xBJ5PWvTwu/m5YYdLAcbEn80m8cvjhRQRwFZlqmjl/HopJ1iXThWrq6azDLBBzyl8w92aOWeTFgORNqVWeMg3J3yLDos0g25JBLEc9RD4ejGIQ5mMZv/oBgTSw8nmpcsaNNbL9iWNChdvgDagqpekm+EvNMhf5c5MSNGxSjOORVzQdFBOGgzSzHTcjOwGo9WW3L9ngZmovqj3MYAJtmPJiFhJ3PdHqzGo5fw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vivo.com; dmarc=pass action=none header.from=vivo.com;
 dkim=pass header.d=vivo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vivo.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zb6iXDGPAlL3TZEXbmMuRTp2IIEdxjSqzG7DS95kCpo=;
 b=m0ZupkRrTxxuHy/LL/VVH1VOwKjy7X2PqKwGDn/8pHUAP4pvN/bm5LcvFjIOYg2TCvcEBDaDfEvoSUIknK4KbXwOKP5zfIztX4gL/BtD6IBJF+263l0BQQJKQON+InkcMYp0/Ey9/R0JicSog7bXPJBgII/qBMyoLOatFPlo65TPJmaLitlJFjOF7vVEWQOY9C2vRjwfH8YEDqqGuQkT0swWX3ECwiiinM21sYiKb3GQYG9sp9AI7cENZ163n5zg0kiMX1Ln5Q3ZArLrm7s1WeeBYI0Xj3Blf60fv+d9q3nW0MMGbPOPB8jHrkWyfbVyxYP6TtjA89peDspHi88L+Q==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=vivo.com;
Received: from SEZPR06MB5269.apcprd06.prod.outlook.com (2603:1096:101:78::6)
 by SI2PR06MB4457.apcprd06.prod.outlook.com (2603:1096:4:154::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6002.10; Mon, 16 Jan
 2023 14:12:37 +0000
Received: from SEZPR06MB5269.apcprd06.prod.outlook.com
 ([fe80::3e52:d08c:ecf4:d572]) by SEZPR06MB5269.apcprd06.prod.outlook.com
 ([fe80::3e52:d08c:ecf4:d572%5]) with mapi id 15.20.6002.012; Mon, 16 Jan 2023
 14:12:37 +0000
To: jaegeuk@kernel.org,
	chao@kernel.org
Date: Mon, 16 Jan 2023 22:12:28 +0800
Message-Id: <20230116141228.43239-1-frank.li@vivo.com>
X-Mailer: git-send-email 2.35.1
X-ClientProxiedBy: SI2PR06CA0001.apcprd06.prod.outlook.com
 (2603:1096:4:186::21) To SEZPR06MB5269.apcprd06.prod.outlook.com
 (2603:1096:101:78::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SEZPR06MB5269:EE_|SI2PR06MB4457:EE_
X-MS-Office365-Filtering-Correlation-Id: e91521c3-511b-46ee-227a-08daf7cbb84b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: QKHzXoHRCM3Iz2M3rfg4t3Lu/4bm1/tXqK6MN/z0hKN/FA3ZjJz9Gus8qVsa5397XoQaBU7wHAryaXH2K8ixrZF3b7mwpkqPlUmW2yFxAADa6G2LLfH/5uiNgCrFi4+bLr4EeqaDMx2TMnoZk+Am72K9mT0/DMwljba2pKnmTqAKUH/KPcmnpibhYSyTwRJDsbE5+l9qA24k3bAFwLlLjT0wR/qrQgNPj8C7KaEx/4JjRlKtaHAp66lteO9AxlnRzW6e2cwNgxpxt1c5cCZtDsvLiuUOvVsOA1lB8+t5vaqoYUKCQQyBfGnG0gxiaO/o+nprKFBnfkaNIlXQ5JiYlFCL0bp2ZXPAqDXxXHQTJtjBCrPMkKWiP7bOD7S91oju4SBHgmdyI4PMM5d7+rF4jekfNx8sZVBfHLjSi0txQ9H5t1bvK0bX4ttcplAjDwX7rVreJpGjvZRaWxhRWpkUsG+1csBUZGuSVZSYahVvM9TRuMBhlKoK3UKKPzQLqGO5Owv3PEC008YsNiXaBN/qNi4q+OytnrjgjIIkR9sA+zKemkhj+se+04LY/c2EY/X8lMQE4NQLlK0vJso/pLmX3s6N2OWyEagZCT3kJeYaWq0dC/ifbkCjkmyLBBx+gW+g6NOc4NU6N7Ar+cCHxhunY5Am7A2HbC/87KosB6kaaPxoEhcr9PS9TIJ57uu+w+6v
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SEZPR06MB5269.apcprd06.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(4636009)(136003)(346002)(366004)(376002)(396003)(39860400002)(451199015)(2906002)(316002)(5660300002)(36756003)(86362001)(8936002)(66476007)(52116002)(38350700002)(4326008)(26005)(66946007)(38100700002)(66556008)(6506007)(83380400001)(41300700001)(8676002)(2616005)(6486002)(1076003)(6512007)(6666004)(107886003)(186003)(478600001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?GbHQpTlKIi6i9ni7auhBn2cOk6tw5YmoftKJg6ac0ctGaZiPNaEJ5Y4FW3M7?=
 =?us-ascii?Q?EIaEduXH0Ga2EHS/8fbQZX7BNeJq9z/qx+v5KcERAx447hlVKOVKTtKyOd6J?=
 =?us-ascii?Q?5YdjZALA4M47x0Ab2QSTY6u6mG2kiHD+CZty25hyw80krFf0+CRQhz2+YyfB?=
 =?us-ascii?Q?sl1ULPsZkHp1H659UXpdplRMc9lesVDIOI7mB4FqcRDPf8aYYxOedkp0PcVn?=
 =?us-ascii?Q?lQLGO1FhvHpUENBC5LJMPbk31Heb0VkmW/VOY0gNNV0KmuSoj/ypWBLa1XCl?=
 =?us-ascii?Q?0fV3/o0rJy4immTRibCHSVEzyHwLEE+GFaqYLZFKArewkfWdzR2FApcxVFdv?=
 =?us-ascii?Q?zPqOrJh47oCfkxnMSlH/6y/pHfjVez+aylKtVDxbS80MwHkC2gZNyI+9SeHc?=
 =?us-ascii?Q?nLq2JLQc88aTaFq41NUXZ1+b9zWtbNgYs/yFnSt5+6tXP0XgQt1ToctddPHG?=
 =?us-ascii?Q?ooovPgZmVswegLoCs8MNNrEg0NQgGNJirwy4TzQHGs/KXbrfklUxilmG+R4n?=
 =?us-ascii?Q?IDFxr0Xts+6lpLZr/xRA/fun4Qzi2uAAWXKJe5PZjrAFBX275lexEUbkHIo0?=
 =?us-ascii?Q?3r1/ZN06yWCmFJZk1u7I4HfAigJPPSXHFVG2L6hA4udRZXuRyMWWKM+o9W8U?=
 =?us-ascii?Q?RHqiWgKtQn0dhOONpbOlZErwD5vBu75rgj3Q23cJEL8TR4aWtRW6c2rhDZbA?=
 =?us-ascii?Q?B3RGuhHVPY5W9zIodRXRxzsDtWJruAWWyRI4Tv0hdP9Z4fSNuo9jeUEHdQqg?=
 =?us-ascii?Q?LCECZMdAdSpzcFDLIIfTs8CGUPbFeL539Kori69lf3tAK9htpXLMwaeQIIi9?=
 =?us-ascii?Q?o9Zox7XZXMTWsTpOW2CEKnFBagdkIk8nzr+GTdRjnsfkrLAn9skLjQvavaW5?=
 =?us-ascii?Q?ERXQvlgxMmmTHpG1o7b9HYZuluQqH7GywhswfUO0anYbjw6eWBM1irQXZ5Fu?=
 =?us-ascii?Q?3asL554GNy5xP7vXNEHO0fi8oq1s21Ilcz6aSt4J/WKXY9aAObS05+olktmb?=
 =?us-ascii?Q?meZYxoNWm513e11WfQBxWrR3JVoj4sRt9xw3qAbhWpET6xSFLvgCEzuPxSvp?=
 =?us-ascii?Q?Xw5xskxWHiqIyajfToR3bv9u1A3lFfgqJNxgIwGcNG9XyX5UXOJCOolR2ELY?=
 =?us-ascii?Q?kFTBWHa8lf1WJAP0Z3lG63S9wfgjXxW5zBw0nSeKNPksI6540ld5giDuMgUr?=
 =?us-ascii?Q?LqcSA0DEuCgGYLkAoikI6LWsl9Vp/x/Ktid+fNH7LckpQCfLoL7Hk3TwuZDF?=
 =?us-ascii?Q?LcrokbuOjfb9vfOFSVGJ/6WT3w9c5dzguYVImNN8EPAvvgIShJriXaBS4nx2?=
 =?us-ascii?Q?9C/I/x+ar0ywDY2m7Xz/tUSJ16WdasqfVpGYazx2UoiOEBs/vR+7lzR7C90n?=
 =?us-ascii?Q?I50yvPTK0W6+NYjhPc+UpXwNgtPe9XzLIDfcsxEstJehviEJ1dQMTR4+rLim?=
 =?us-ascii?Q?slLTwXYuPtNQBqaAF8C4LyCkpdw+MJwnyhc8a516qEWY20v3Xc7QTxXRN5rI?=
 =?us-ascii?Q?ccTRochS2RnbSCYu0jrrxDKuDTjEPPzbDw0m55XHX8hs6MGHRo+VMTWW9Hak?=
 =?us-ascii?Q?g+Ds1xya3dQPh6U9XUZJYabh9oZ+dIzWYx0ngba7?=
X-OriginatorOrg: vivo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e91521c3-511b-46ee-227a-08daf7cbb84b
X-MS-Exchange-CrossTenant-AuthSource: SEZPR06MB5269.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Jan 2023 14:12:36.9949 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 923e42dc-48d5-4cbe-b582-1a797a6412ed
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: JW7MZFBHjYMG8Yg49zSsEso2ixOgfmcqY7oF/+YBUqnF5V63I5WzKpJ7OBvSZ+7GhC3YOPwyaIiDo5uY4ArxWg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SI2PR06MB4457
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: Convert to show discard_unit only when has DISCARD opt.
 Signed-off-by:
 Yangtao Li <frank.li@vivo.com> --- fs/f2fs/super.c | 18 +++++++++---------
 1 file changed, 9 insertions(+), 9 deletions(-) diff --git a/fs/f2fs/super.c
 b/fs/f2fs/super.c index 5fc83771042d..ab8a77ffc1f4 100644 ---
 a/fs/f2fs/super.c +++ b/fs/f2fs/super.c @@ -1908, 10 +1908,
 17 @@ static int f2fs_show_options(struct seq_file [...] 
 Content analysis details:   (-0.2 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
 no trust [40.107.255.121 listed in list.dnswl.org]
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [40.107.255.121 listed in wl.mailspike.net]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.0 SPF_HELO_PASS          SPF: HELO matches SPF record
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
X-Headers-End: 1pHQEF-005jz4-76
Subject: [f2fs-dev] [PATCH] f2fs: fix to show discard_unit mount opt
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

Convert to show discard_unit only when has DISCARD opt.

Signed-off-by: Yangtao Li <frank.li@vivo.com>
---
 fs/f2fs/super.c | 18 +++++++++---------
 1 file changed, 9 insertions(+), 9 deletions(-)

diff --git a/fs/f2fs/super.c b/fs/f2fs/super.c
index 5fc83771042d..ab8a77ffc1f4 100644
--- a/fs/f2fs/super.c
+++ b/fs/f2fs/super.c
@@ -1908,10 +1908,17 @@ static int f2fs_show_options(struct seq_file *seq, struct dentry *root)
 		seq_puts(seq, ",disable_roll_forward");
 	if (test_opt(sbi, NORECOVERY))
 		seq_puts(seq, ",norecovery");
-	if (test_opt(sbi, DISCARD))
+	if (test_opt(sbi, DISCARD)) {
 		seq_puts(seq, ",discard");
-	else
+		if (F2FS_OPTION(sbi).discard_unit == DISCARD_UNIT_BLOCK)
+			seq_printf(seq, ",discard_unit=%s", "block");
+		else if (F2FS_OPTION(sbi).discard_unit == DISCARD_UNIT_SEGMENT)
+			seq_printf(seq, ",discard_unit=%s", "segment");
+		else if (F2FS_OPTION(sbi).discard_unit == DISCARD_UNIT_SECTION)
+			seq_printf(seq, ",discard_unit=%s", "section");
+	} else {
 		seq_puts(seq, ",nodiscard");
+	}
 	if (test_opt(sbi, NOHEAP))
 		seq_puts(seq, ",no_heap");
 	else
@@ -2035,13 +2042,6 @@ static int f2fs_show_options(struct seq_file *seq, struct dentry *root)
 	if (test_opt(sbi, ATGC))
 		seq_puts(seq, ",atgc");
 
-	if (F2FS_OPTION(sbi).discard_unit == DISCARD_UNIT_BLOCK)
-		seq_printf(seq, ",discard_unit=%s", "block");
-	else if (F2FS_OPTION(sbi).discard_unit == DISCARD_UNIT_SEGMENT)
-		seq_printf(seq, ",discard_unit=%s", "segment");
-	else if (F2FS_OPTION(sbi).discard_unit == DISCARD_UNIT_SECTION)
-		seq_printf(seq, ",discard_unit=%s", "section");
-
 	if (F2FS_OPTION(sbi).memory_mode == MEMORY_MODE_NORMAL)
 		seq_printf(seq, ",memory=%s", "normal");
 	else if (F2FS_OPTION(sbi).memory_mode == MEMORY_MODE_LOW)
-- 
2.25.1



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
