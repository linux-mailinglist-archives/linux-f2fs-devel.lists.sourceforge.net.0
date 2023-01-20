Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D4CB675867
	for <lists+linux-f2fs-devel@lfdr.de>; Fri, 20 Jan 2023 16:20:55 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1pItCG-00063v-D4;
	Fri, 20 Jan 2023 15:20:50 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <frank.li@vivo.com>) id 1pItC6-00063f-40
 for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 20 Jan 2023 15:20:40 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=MIME-Version:Content-Type:Content-Transfer-Encoding
 :Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=VbygLgkTF7IWrIPpwCniLbpMYjCnpoehimvcP3XA45c=; b=FCNDjgwVS+IJle8mR5FVsgvkZP
 vsH51f6bNif9HYBT8vv4K7Jt4VaFLyoKabZ5zs0lzC5o8gmClFbpHbHQv0J93Du2wt+CzRPIDdnHO
 +fdpHbT0ENye7WnvIiMYU241kbDkhZLgXInixBh2U+z3Br2NPsSAMkejnXQPQWXiO1AI=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:Date:
 Subject:Cc:To:From:Sender:Reply-To:Content-ID:Content-Description:Resent-Date
 :Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=VbygLgkTF7IWrIPpwCniLbpMYjCnpoehimvcP3XA45c=; b=i
 DvrZoEZyUOIJzz5Giyij7M7s+r34B3CoM0WTWfqa9xwtgngu0pMbbP7hQMB/PKYp8Jb2WZ0KkZ4H7
 LeOYcv2M9UOQj1ebQ6KiOdBCUlU3iyR12BWRTnNxIEYIS+iekZGyRGAtQLKunNqOMS31xQUmu7NCt
 l/cWJWpOJd6VR6M0=;
Received: from mail-tyzapc01on2123.outbound.protection.outlook.com
 ([40.107.117.123] helo=APC01-TYZ-obe.outbound.protection.outlook.com)
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1pItC2-00AJqU-Na for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 20 Jan 2023 15:20:40 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=eyJuuPUm6TGGos1xG42gXIvxpLBnpbwrjx5OctrLN/SE5LYl9L94RKelPMEPt/kV+Ja831oVMzRSOgVtlUPR0RX+lhcF8kvXa0JR1eWDxuUe83Bdl4DE0t0yIoYzl5NSDuVbptgiD+egjs9ZLvySuaKwrKrDRCemN0TNgh+dwBKdIPdK68b/8O00cjg68IXMHtd3q/VAvOdco7Uj2xcXD473fLVnUdbOqpKh1nZdT+eYs3N7x0bd9RRttviW4KUo68rtW4I/DunS9uMwjNCfcONX+WnvR2iKmaGlxBkpP6mNuaT7d4pNbo42ZIcqgjzt2Iwv4B8PMi0nUOaDCLMs8A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=VbygLgkTF7IWrIPpwCniLbpMYjCnpoehimvcP3XA45c=;
 b=dbW6+WGtWITNKKeEfmAuNe3mdX4Q5iL+kLEUO0MiTyihGq1mciP284+k+VVaOz94v8jH5h1AgH3KPvzye29GDcdHd+zLS98T/fu1PKWh3np6uJ65DZunNIz393+iESEFwg9WtyJuSUeAnYeMX7XrKbhNKMU2xt58KIjhsMGD+MgLb5GSTus37ON0hhuqA3i0Kne9VozHpc4CpVk1sk4YtQDDTGLd7cgehfxNPtbzKlDAxx2lyDoIq0oCOGLvhA0JP0T7sJUSjRhSoGhnn2YdumjItPoLEw5cB3ddzHowpsrq97p2c+MRu1iDjsYdQArjCLQWFsMK0AzbyfT2Y8/PnA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vivo.com; dmarc=pass action=none header.from=vivo.com;
 dkim=pass header.d=vivo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vivo.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VbygLgkTF7IWrIPpwCniLbpMYjCnpoehimvcP3XA45c=;
 b=T7iA2S2qkDX+tJNhU47OcJBPP/0Cy7wVWgQi2zJv6GAB9CihSc31dllY3mRaT2hRlhc2fftGK06ZeXm+bgp00qUsHM82wZLtrzyhIYYFhmhHvMk3pqpI1NfgwixdowY5ZK64MHF6CQlzmpNnRK5vq3gV/znyqyger5LNgHoB8/uCfzZ999wm0ewLNeQbb9TiNBnj3PcfYBKEWQEKxPQs0xtmy8nDnUGCLVZPMvibdwa0bjja6+qGLeh14UEQuU17C5YjyIyL5HNSp0Zpr5R5MNsysQHzyPIal2XQCWQdF/+Y4pr16OGVyKNIBztEoNyf6c4p0FxRZM6hYqAel7/Y/g==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=vivo.com;
Received: from SEZPR06MB5269.apcprd06.prod.outlook.com (2603:1096:101:78::6)
 by KL1PR0601MB5727.apcprd06.prod.outlook.com (2603:1096:820:b0::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6043.5; Fri, 20 Jan
 2023 15:20:26 +0000
Received: from SEZPR06MB5269.apcprd06.prod.outlook.com
 ([fe80::3e52:d08c:ecf4:d572]) by SEZPR06MB5269.apcprd06.prod.outlook.com
 ([fe80::3e52:d08c:ecf4:d572%5]) with mapi id 15.20.6002.012; Fri, 20 Jan 2023
 15:20:26 +0000
To: jaegeuk@kernel.org,
	chao@kernel.org
Date: Fri, 20 Jan 2023 23:20:16 +0800
Message-Id: <20230120152016.63430-1-frank.li@vivo.com>
X-Mailer: git-send-email 2.35.1
X-ClientProxiedBy: SG2PR03CA0114.apcprd03.prod.outlook.com
 (2603:1096:4:91::18) To SEZPR06MB5269.apcprd06.prod.outlook.com
 (2603:1096:101:78::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SEZPR06MB5269:EE_|KL1PR0601MB5727:EE_
X-MS-Office365-Filtering-Correlation-Id: 309966bf-e486-4b58-8262-08dafaf9db81
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: gTOxAk1novSzc6KNdNPHeUj5wsaUpxkb8X05Dq/9edwz1hfuS0Yk18xOQt6ODlmjortviBBvDixQZs31N0/kuslp5nJMIWc3LRyYwvhwUEG0D7MXu7fpFTIFIrnkpbaVRhBdGDHEHJWn/CsCeWqh+uE+DCCPWIGkNz8KBXFmEfvCaNPS74sIk0XX3JhHJf5NNigKzL0eOHr2np9Lwh972eteIWR8egd9yoVJ2tGdme1+KwHmhWc7INh9+uID+cBuV7cdJWWnvmY8m9WSOPktMVuSHmLt+MGqp8su6J2SWgLgIVeccE/PdOdIfo8W3WLgx8HAA0slIE2ShFLG3ou8NjOMWjJ5rVgZyGPz46lmTSUkRdG/popiIHe/y0gWcEcLUZjiGcWc4YbAONXxx51VWc4eVU3ifM/EYnfTKG/19p7CawJ1rHgXDzGEgRsyo+kdg102i0sTQKgNZV2ooa7EeJD+SMjg4Aj5XpYTVMdKi3ub9KeYuv0UM4CsnQIxO+ZuytaDcROoWPMagYdb0IdjECNvAQA/tdLBWDhaH5lLAzX9RhhPGWIFVAGmcxRJL/9UG7/dpdGvp1lq4W0RkcTnprQMOPTgzmnombh3hO9J29dTYJ+aBiZxqkw7lhkzESCUgh2RKqVnErtmI+IG0HqnK/TTyRLRjqFAn9fmPFtIjqFJww51u7e0celKY7MNxRrsbJTO1IKhBnMyLTngxtmOxg==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SEZPR06MB5269.apcprd06.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(4636009)(346002)(366004)(39860400002)(396003)(136003)(376002)(451199015)(41300700001)(2616005)(36756003)(66476007)(83380400001)(8936002)(66556008)(1076003)(8676002)(4326008)(66946007)(38350700002)(38100700002)(86362001)(5660300002)(2906002)(52116002)(107886003)(6666004)(6506007)(26005)(6512007)(186003)(478600001)(6486002)(316002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?prN3/9qgibHj8SYqASP+V6V1muSnNAkpUH4kCW4cNbjAWIXseCCYu4DDYMR2?=
 =?us-ascii?Q?7KYiajZiUiEfILYk06bMMhQI2NqVCck2EEr5T2HGtnff3LgmWja8hgkoGUAo?=
 =?us-ascii?Q?wJWVWQpws90q7kR2mj7YqNwNJW7vdL5RBYpyeHAo+nC76qxmytqP7DbzkY5E?=
 =?us-ascii?Q?LrqvoeyIKincqmrfv4RCzH50LPpI7yBA2njIM9L9561HENSTIYTMRuqvAGYc?=
 =?us-ascii?Q?09+qzcpGDj9BG1LIk+GdnKjKby1MHkdXlSsDZDLcjyB11N8VCPGeZemCqalk?=
 =?us-ascii?Q?XryUz5udIiIpaCVNLUqCCxQe22mRVLmoymP/+PqYDnn2gqOUDelL5ER4c63m?=
 =?us-ascii?Q?8ZGIecfz/6dn6CousT0l72t6zN82Qg5BRp7ov0+YpaH0H7o51VyrZ6OqdwJv?=
 =?us-ascii?Q?vHemhgFXGvLRasqotcgXku8oiv0o9MPDE0spMp2ojOdf/oXlKGleN8RoCDMB?=
 =?us-ascii?Q?XRHqIPbZcoWUMGi2vxTfELvdVkwvzMqtCykUDuWK9OIoXpTSreyMHoVyCbDS?=
 =?us-ascii?Q?k4UzkHHSsX+vB8xXnDacNZb7eeTW4bv7uPeofO0A/+q8aOvJOzIi3dwWvljk?=
 =?us-ascii?Q?zvLX9WH97MEZ1NPpFAtHQVfJyHd6ofYzpkcdwDjf08iyEQ0NhVVCCzhlaJNp?=
 =?us-ascii?Q?lQsTyPhfHsIYVySx7/qHNtKwgLvVjxS6ti57Ww/DChPBdDyrA21KoSd8U4oi?=
 =?us-ascii?Q?bhIREi0gWK66yDpKSpZCvfUHkCTadE3e3FqG7SiN/pj7NQY7xZu1F5bEHqSb?=
 =?us-ascii?Q?kE3mvdbKxCOa3MNCpjHazT4gtJPteK57i6QQ1zwwEQTUCuJtuUqp6/nHJHM3?=
 =?us-ascii?Q?PEwJG3+fxv58v395kzjeuwbTHkQYB4nMNe8Ck9Z3d69o3aJOVRoit9ogpzJV?=
 =?us-ascii?Q?uz/IktqgS6Hfhec7w14Ndcwbok+OEC9yrMIRbVXF/9kUCtkxmQR+VJb47ybA?=
 =?us-ascii?Q?nNqLRQnlOPhHARO+HDVJiZU+FUq8KRuTbjH8jtRAvYZmYpMeQDuoaEs5WnpX?=
 =?us-ascii?Q?Ynu3MbqQH12BY4FlR/igk2PHhCtpuO9CSQypoiGXwwQ82Z4NWv15klNBjInK?=
 =?us-ascii?Q?Y18xlvBmUUt0bdu2mDgkSfufDe2UrKwbk97n9DlGXnmV2t43LGeHHlv14zh/?=
 =?us-ascii?Q?0jtIu7gvfzyvkmcTaa9EmS+tHOd+/RKC6DEc8CEOKS/V6eGCm+cfR+LpWDHf?=
 =?us-ascii?Q?/hfY1TsbMtlkK75gF1KIgwIL2ic8jfLbRC2QxSz/tc+ECa4QLF2twfeM3x6a?=
 =?us-ascii?Q?BPRk71ldjPWGHxke2A9wMKoFQ/aWzreFd0Y1KopbDHO2ww/4IBzFigKSL2V+?=
 =?us-ascii?Q?hmkR/NEdwSXITElXqoX2i7unzwP+It1sB8Rtoc6UT0M+1rYOsGBiUch7BlJG?=
 =?us-ascii?Q?LDP1ubbU4h6fefT7OdXv5pEpfZsaHKk8I5ukB56ZYgySMJmyjmDArZLnqyrZ?=
 =?us-ascii?Q?iVRFzWtbQVFslBeUiROeo0kGcrXl+w6GEC5IeOY86oluHA/o1rZmfyvAjyH2?=
 =?us-ascii?Q?+ba945glpoSxUkaWQbo81fi0mQ06FiNgJ8rLwVGjk4KvlK/YU0jF8NwG6m2/?=
 =?us-ascii?Q?ATJ3F3KMJfGg9l197CtbB9OYASI81z/D8yvQ4x4Q?=
X-OriginatorOrg: vivo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 309966bf-e486-4b58-8262-08dafaf9db81
X-MS-Exchange-CrossTenant-AuthSource: SEZPR06MB5269.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Jan 2023 15:20:26.4407 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 923e42dc-48d5-4cbe-b582-1a797a6412ed
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: jSruoXWfbJpaMGdTfVfq6dklCdwyQFT/bfRgl8OCzb3euoaOTmrNqaatZ4XwwiVb3681aDymdo06tyXVuVIfNA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: KL1PR0601MB5727
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  There are very similar codes in release_compress_blocks()
 and reserve_compress_blocks() which is used for data blocks check. This patch
 introduces a new helper sanity_check_blocks() to include those common codes,
 and used it instead for cleanup. 
 Content analysis details:   (-0.2 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
 no trust [40.107.117.123 listed in list.dnswl.org]
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [40.107.117.123 listed in wl.mailspike.net]
 -0.0 SPF_HELO_PASS          SPF: HELO matches SPF record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
X-Headers-End: 1pItC2-00AJqU-Na
Subject: [f2fs-dev] [PATCH v2] f2fs: introduce sanity_check_blocks()
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

There are very similar codes in release_compress_blocks() and
reserve_compress_blocks() which is used for data blocks check.

This patch introduces a new helper sanity_check_blocks()
to include those common codes, and used it instead for cleanup.

Signed-off-by: Yangtao Li <frank.li@vivo.com>
---
v2:
- s/rc/err/
 fs/f2fs/file.c | 36 ++++++++++++++++++++----------------
 1 file changed, 20 insertions(+), 16 deletions(-)

diff --git a/fs/f2fs/file.c b/fs/f2fs/file.c
index 5e4b8c6daa1f..3967f6976b6f 100644
--- a/fs/f2fs/file.c
+++ b/fs/f2fs/file.c
@@ -3383,11 +3383,9 @@ static int f2fs_get_compress_blocks(struct file *filp, unsigned long arg)
 	return put_user(blocks, (u64 __user *)arg);
 }
 
-static int release_compress_blocks(struct dnode_of_data *dn, pgoff_t count)
+static int sanity_check_blocks(struct dnode_of_data *dn, pgoff_t count)
 {
 	struct f2fs_sb_info *sbi = F2FS_I_SB(dn->inode);
-	unsigned int released_blocks = 0;
-	int cluster_size = F2FS_I(dn->inode)->i_cluster_size;
 	block_t blkaddr;
 	int i;
 
@@ -3404,6 +3402,21 @@ static int release_compress_blocks(struct dnode_of_data *dn, pgoff_t count)
 		}
 	}
 
+	return 0;
+}
+
+static int release_compress_blocks(struct dnode_of_data *dn, pgoff_t count)
+{
+	struct f2fs_sb_info *sbi = F2FS_I_SB(dn->inode);
+	unsigned int released_blocks = 0;
+	int cluster_size = F2FS_I(dn->inode)->i_cluster_size;
+	block_t blkaddr;
+	int i, err;
+
+	err = sanity_check_blocks(dn, count);
+	if (err)
+		return err;
+
 	while (count) {
 		int compr_blocks = 0;
 
@@ -3553,20 +3566,11 @@ static int reserve_compress_blocks(struct dnode_of_data *dn, pgoff_t count)
 	unsigned int reserved_blocks = 0;
 	int cluster_size = F2FS_I(dn->inode)->i_cluster_size;
 	block_t blkaddr;
-	int i;
-
-	for (i = 0; i < count; i++) {
-		blkaddr = data_blkaddr(dn->inode, dn->node_page,
-						dn->ofs_in_node + i);
+	int i, err;
 
-		if (!__is_valid_data_blkaddr(blkaddr))
-			continue;
-		if (unlikely(!f2fs_is_valid_blkaddr(sbi, blkaddr,
-					DATA_GENERIC_ENHANCE))) {
-			f2fs_handle_error(sbi, ERROR_INVALID_BLKADDR);
-			return -EFSCORRUPTED;
-		}
-	}
+	err = sanity_check_blocks(dn, count);
+	if (err)
+		return err;
 
 	while (count) {
 		int compr_blocks = 0;
-- 
2.25.1



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
