Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id F03BF6EE82D
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 25 Apr 2023 21:25:21 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1prOHs-0005VE-Gy;
	Tue, 25 Apr 2023 19:25:17 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <frank.li@vivo.com>) id 1prOHr-0005V7-4X
 for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 25 Apr 2023 19:25:16 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=MIME-Version:Content-Type:Content-Transfer-Encoding
 :Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=0tFjCdDMpDFTQ/GKv3N1dIyCZwdtsJDHja/J46tCzrU=; b=Z7KhzyZMXCnTFqwIWrtn5Qvdav
 rj34zyOrTFtgaDKzWSfRFCVDB3iYBXr8Z5khKACZ0rbvpEx7MFU/7EwtBYZH+ZrF+Q/fS+ythaHpV
 FUTwZvm37++68JERpFaOZKLPX6N6FVhqF84TNWpf+ckutZ2+LvJQp8J8drCImcm4MiAw=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:Date:
 Subject:Cc:To:From:Sender:Reply-To:Content-ID:Content-Description:Resent-Date
 :Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=0tFjCdDMpDFTQ/GKv3N1dIyCZwdtsJDHja/J46tCzrU=; b=N
 F7hzitz3W9kMhUNJh0Xsog65K8eJhbN8cOXHbIPk97Ysv+BJ3t7nq56WaHsQ4ghv+69VZXsm6JGAE
 hp2gzxaOdJLOTL9OMHwY8U3xq4trjYSI7jLmZiTxEsYUm4qIOwy+kSoQfrvxV18Khari7FP+SPwhJ
 mlL6E9kmPOvSviIg=;
Received: from mail-sgaapc01on2129.outbound.protection.outlook.com
 ([40.107.215.129] helo=APC01-SG2-obe.outbound.protection.outlook.com)
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1prOHk-001RCL-Hj for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 25 Apr 2023 19:25:15 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=RE/Nmdv8d6/BW+3A3NtWIs1BllLynZ2kUbJm64zkSKMVT5Hsg+qFYpx8+4Gi70bwk6/A5OiZytS44fT31QiPEEuBhFHMcIOuFRAPbN573Tz/YeAmKTDJY4t2HmcHuvMwcF6np+1j68ngf4+89P4IT2DsassPdNI5aGnRHe8bEmvK6dQRx9jLxDt8Mn2Ch/7FYRgXrcLmw0QX97LBtC8oJHZci7LBbHQB6TJz7HquNRNz64xHkjlB8ywVNgeTI6IN1fMW6KqA4/l4P0ummYgyrjOJXkVGKTa468hgr869IgmC1VzenMCsyvnN2l8Cm4PlUYxx1k5YDYLD/O2q0ZGLfw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0tFjCdDMpDFTQ/GKv3N1dIyCZwdtsJDHja/J46tCzrU=;
 b=D+t8AEefEsHuT1bO4S1ncz5Yfiawtqn3aE+ShLkdT7LN4J32rZ/ZrA8GPD4EVwZ2rOmsz84TfoBnm2OiSwXy5UbcdWmA0FcArHCcD2n7tx7E35g4dEzudTNWumG73T+B1vQwu954iXxKu+o/SpMPePM46ansXadTqLIzvT+645j1bZMua3bb2+5fKcboQnDC99kCayeEJ4rzmxIRy8zNKv2vg2yG6lFBnSAQyAFKK2amLAkAMn6JMjJ3ppG7G7UDR40vx98lwEvno3FrbMY2un+waC5ea3YQdXMwlJjJTKloCVi1v3w6MZS5VTw1PEw1XCLkRqhSQcx1DaNTfMDcWg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vivo.com; dmarc=pass action=none header.from=vivo.com;
 dkim=pass header.d=vivo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vivo.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0tFjCdDMpDFTQ/GKv3N1dIyCZwdtsJDHja/J46tCzrU=;
 b=YSyGii+OJzjxVcb1s/KJyV+g2ERVXyzl/78vP8xAAi7+f0deGXk+sTSV6+F0vP0cZg5HDBhHGe7y2JT+Qo04evuB6oMfs0o6imVqrLY1ndENZsZUArEewpaYj1kRCfaqxEvhP1BDPcPq+Szhv8hYdfhhmcNWKHcsNnq0o9xcnCjgTmWpDyytBeY6IeZmcMpw19NMw9YBhRQRZ1oAmv8LTb2DrsbRUzvAGELzajk+3MDZlMwmWwQqpd2o6uQHUSvsv67ati9TaHXqWAJ3iE6jnEFIMyUMYlNbHK/xm5jnzN726QHek7uVCHn42LvQpNN/o0lwFtZ/xRtsQP8OU32/2A==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=vivo.com;
Received: from SEZPR06MB5269.apcprd06.prod.outlook.com (2603:1096:101:78::6)
 by TYZPR06MB4048.apcprd06.prod.outlook.com (2603:1096:400:22::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6319.33; Tue, 25 Apr
 2023 19:25:00 +0000
Received: from SEZPR06MB5269.apcprd06.prod.outlook.com
 ([fe80::76d6:4828:7e80:2965]) by SEZPR06MB5269.apcprd06.prod.outlook.com
 ([fe80::76d6:4828:7e80:2965%7]) with mapi id 15.20.6319.033; Tue, 25 Apr 2023
 19:24:59 +0000
To: Jaegeuk Kim <jaegeuk@kernel.org>,
	Chao Yu <chao@kernel.org>
Date: Wed, 26 Apr 2023 03:24:48 +0800
Message-Id: <20230425192448.35767-1-frank.li@vivo.com>
X-Mailer: git-send-email 2.39.0
X-ClientProxiedBy: SI2PR01CA0026.apcprd01.prod.exchangelabs.com
 (2603:1096:4:192::16) To SEZPR06MB5269.apcprd06.prod.outlook.com
 (2603:1096:101:78::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SEZPR06MB5269:EE_|TYZPR06MB4048:EE_
X-MS-Office365-Filtering-Correlation-Id: e1bf3b41-dcd1-4f87-59f1-08db45c2c21c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: mDmv/zH1wmxPwF2TFCxjwbtb+va8R2El/PCzN7Qwy0jPdCxB41+qJBxabNchu9jJZfFavirQVW6Kjmi0RTvPc5lXQARGVrJEi3w1JH/UwNT9S3xg9fDGhHKqU7LXo0BFK/cZZSlCfPih2NgwDja8Fu9gWQ4b+amLEN62Kgek3QeNQTDMtpz+lV8K92I4F9XIh23NrIwVLkVLiRjMg4acOipHMDexIQuPnGhE6xD9prQMNV4YG71TXJQmAPeDO85rTesTnat3OmmsN709y6ETkzOg7IX8TFkuPzSJHMmgQUlH13zlj0tiLzHhqNLLjWcmTKptyhzFVJ/F5zEbmXB9xUO97IyHICq7YmrgdiCn04w98hrZHSctKy5WAwIA5PbMPCM1fUkRZkqO5ImC3CY3N5PkronVJp71zBzZgMYsZ5ocEAMAgyXDynZ8JcBnWggzMsShTHcNqDfmGdO9Hm5VOdFWxEBffq+JgIzSzCyw9U6iiN0WouVkzcayk0y+v65OVjn9OzM2HKoNUAnXrPo8/CtumnMEXUVxyZcxpDCQFNr+NpPzYjA+PXgWATZQyNxv79cRXw524FjsCbVvCNs5jZ72u3r14y5Ki8E2lRynkli517kTIGOF4zOgn6P8YVRI
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SEZPR06MB5269.apcprd06.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(4636009)(396003)(376002)(136003)(346002)(366004)(39860400002)(451199021)(478600001)(38350700002)(38100700002)(52116002)(6666004)(6486002)(6512007)(26005)(186003)(1076003)(110136005)(83380400001)(6506007)(2616005)(5660300002)(8936002)(8676002)(41300700001)(4744005)(2906002)(316002)(4326008)(66556008)(66476007)(66946007)(86362001)(36756003);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?/N38AohhIiZgfryyl5Jfh1c5wO4/5R6G91tQyIZHnuk94tK4W4UZNCyvTKKM?=
 =?us-ascii?Q?61jXibpIijT1m2KBLeV7ZuAJegFCqVyorI/Tbv3ELfF7hP2LCn/t94a63jta?=
 =?us-ascii?Q?3BlZb1z8O5ApOJAuXhHHGBe+hT/o4TePKMTLpZ5NltJC9V1gkWv/yHjk1Xa+?=
 =?us-ascii?Q?0P+5TL7gY7D+Lu5vS8+QcAFRUSzBKzhZFNEZexVm1viXL21ZUsQDUl10iEhq?=
 =?us-ascii?Q?cpzmirbvNfvm3ukQeJ4rx55KrA6Bs7eg4n0u96Nr/g1ZxAJZJmNp4t2P6Xnm?=
 =?us-ascii?Q?tEBZEPlIS5VyMm1rumeIk3z72Vdx+zGYL0AmXzXjVkT79Zfgx+Vq579CpAri?=
 =?us-ascii?Q?+MBVpeAjVgzq4HsQA7m7VanUSa12szw+11uxFmt3pxQj3bMUc3UMZha1Dgs0?=
 =?us-ascii?Q?kiAy7Yt/XlUoFVISfKN8TRmDAlazCbvlp2izxUdKwJjbOj7GjVPCGgSIOq10?=
 =?us-ascii?Q?D6/1HAMNBNc9JtZ83awTqDSAGgcBwiMjUhGQvXqkRpe+MBX0asUaQTe2zDhm?=
 =?us-ascii?Q?cNfHiPd7tLvbO4JJ9sr4xCYxKawlEYh7p+hWwi6kTbe28+5TpO3GGRifsd5U?=
 =?us-ascii?Q?I07jhioFe8o21ccaWYVNDcydUiJC6hnFPlz/XXD+C4/y15CtPvx0w3b2n4s8?=
 =?us-ascii?Q?rHShtulZjn6h6swUfZAnNOUbpxWlCEoks+dsyGSnC7LxY3HiIb/T+1Z4gdSB?=
 =?us-ascii?Q?EIlumML7QqZohcNUMUK3ExOhjTm92/2HFH7vydDfxQ1LiAxZMy/xO3TfbX+W?=
 =?us-ascii?Q?iX45GxhCg+zpdvPsm98uN543oPLll2p70x5xUBSEmfVBC7tYT5FDz4QCpLFP?=
 =?us-ascii?Q?mf5RllAgvvtiW8nDyyeOj7BvURdPsCOAmJ0KB+lIPlURWYMxk9JrehKl4i7F?=
 =?us-ascii?Q?7bNeYMugZ68jQs2AQ/7Z4r55dy5AC6ePU7Hypw7DO3t5cn7lToKpuVvAvL2F?=
 =?us-ascii?Q?6EWt+yVWf9sHxEEccTvgxaAbLt31KnRhV7Q67Fz7r2QWXIVFtFyUWACGsDgi?=
 =?us-ascii?Q?1ePiv/WHZSKbXtR/TVgCgz6BkHmE/aBQ84gOu4C5PLTDAO5zFTZQvmeAjq0S?=
 =?us-ascii?Q?lLOJOhrGTBCj7m58O0gNWWwra5YLkgjdi029LqOI1ewI+qU6t8LlC2SBerMv?=
 =?us-ascii?Q?aCL7WQASHfq/fiC1y/sZmYL8EutO+NzMFHxddNKs3xRkicyVZOUY0oSZlFiL?=
 =?us-ascii?Q?N3iUNNC+7QRyx1tP/+9nDz3EhjLskRHwLt0+drjBmZ7FDebtm6kUbeMF2XPP?=
 =?us-ascii?Q?0V5Ms7IIKYWBuVbJ5Xb8vyFMskEcgpDQMd2pomKQtJcdB7Pgnvi2tPnI0d4l?=
 =?us-ascii?Q?zvq9v0oI79uM+Kis+gZ3TSh12ioTrABg3GBr3hRwf5KV9pVSphTpsX8d67Bx?=
 =?us-ascii?Q?ns8bNgPrsnyQfcO1sAyy6lDhsnG+N1USMA3hb38Qm3HecowmLP3rjGxJFFmv?=
 =?us-ascii?Q?D3OXBaEspnT0vD/mJSx/GIYItVNlVg1xy3AnxhqeBsubywSZGIilgplgaBZe?=
 =?us-ascii?Q?Y+TtvzdoLFXtV+cSP3wWpqxWf15luYocawMc+r62wKjfrBplZjP0hsmSF260?=
 =?us-ascii?Q?TsAU0huj+KGdGQljT062ZNi3FFJOAuar64+YFPC5?=
X-OriginatorOrg: vivo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e1bf3b41-dcd1-4f87-59f1-08db45c2c21c
X-MS-Exchange-CrossTenant-AuthSource: SEZPR06MB5269.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Apr 2023 19:24:58.8179 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 923e42dc-48d5-4cbe-b582-1a797a6412ed
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: KwJvUT7gNFWkq7dfVDENyvN6OHRH1mTnh9CX/K3RVnvLPGgxFMmhwaZjmrbAsB2Wd+Z56aTlhRpk0FeXoSSfbQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYZPR06MB4048
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  Replace if (a > 0) { a--; } with: 
 Content analysis details:   (-0.2 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
 no trust [40.107.215.129 listed in list.dnswl.org]
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [40.107.215.129 listed in wl.mailspike.net]
 -0.0 SPF_HELO_PASS          SPF: HELO matches SPF record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
X-Headers-End: 1prOHk-001RCL-Hj
Subject: [f2fs-dev] [PATCH] f2fs: simplify the processing logic of retry_cnt
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
Cc: linux-f2fs-devel@lists.sourceforge.net, linux-kernel@vger.kernel.org,
 Yangtao Li <frank.li@vivo.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

Replace

    if (a > 0) {
        a--;
    }

with:

    if (a-- > 0) {

    }

Signed-off-by: Yangtao Li <frank.li@vivo.com>
---
 fs/f2fs/super.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/fs/f2fs/super.c b/fs/f2fs/super.c
index 107585797ffa..cbab0cc2c82e 100644
--- a/fs/f2fs/super.c
+++ b/fs/f2fs/super.c
@@ -4769,8 +4769,7 @@ static int f2fs_fill_super(struct super_block *sb, void *data, int silent)
 	kfree(sbi);
 
 	/* give only one another chance */
-	if (retry_cnt > 0 && skip_recovery) {
-		retry_cnt--;
+	if (skip_recovery && retry_cnt-- > 0) {
 		shrink_dcache_sb(sb);
 		goto try_onemore;
 	}
-- 
2.39.0



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
