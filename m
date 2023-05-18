Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C58D7078CA
	for <lists+linux-f2fs-devel@lfdr.de>; Thu, 18 May 2023 06:11:57 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-3.v29.lw.sourceforge.com)
	by sfs-ml-3.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1pzUzY-00018a-2v;
	Thu, 18 May 2023 04:11:52 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-3.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <guochunhai@vivo.com>) id 1pzUzV-00018T-Pc
 for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 18 May 2023 04:11:50 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=MIME-Version:Content-Type:Content-Transfer-Encoding
 :Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=p7JclodLj7OI5T/S1DbhRztXvFZgIJsTPtG1EJibHDk=; b=O8BTGm8CRkMhWsnzyS82nxDFS0
 VDbM/CU4N8KetjQc8UboAEW/GTf/Cdms+UlBLHe1AqyB113SMjH6HIPd+kLbBAa3N2Z2mNZif1p9A
 upqvIkfWhx1FZJrDtRyrnZLjnA7A6jdQhWV9r2sssUNA+hHykrVP8MT86e/wtoNuoLIc=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:Date:
 Subject:Cc:To:From:Sender:Reply-To:Content-ID:Content-Description:Resent-Date
 :Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=p7JclodLj7OI5T/S1DbhRztXvFZgIJsTPtG1EJibHDk=; b=Q
 HEC93GhxJfxmWCitGcOtzMaB7DlyP02g1EoX7ssBSTDojpvLdEKvE70btCpKJKtc1xYw4kLb9+xea
 eM2CNRpjb4ai4QlJzUOR0L63CgQ8WNobBcCgR3cdnQsyD0PJQMNQDLA6Mdl/YvZB3KxADr/ak/98j
 orMigdeheyugVuz4=;
Received: from mail-psaapc01on2091.outbound.protection.outlook.com
 ([40.107.255.91] helo=APC01-PSA-obe.outbound.protection.outlook.com)
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1pzUzN-00Bu4I-HH for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 18 May 2023 04:11:50 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=lEBNuiiiUnjUccADNBEwVA40gUkIRLZuGN64JzJ3n1AAcPoLMWcocM9sT3CTweO+jkTvF1s7xxE1BFenPzS8dUnCDxiGsQXRXFTAajM+6Q6phTNZ56zL3rxqbwAITggMK4x1ZDFO796hRiBeNMiUatFgq2ULXZtZ83uMHpm8PY26DU5KCSbJJEqYxLQuxmCVLuY5NPgh/j9bRwmpBo6winwwS3pEpdsVDzH0K7IkDHqnXqTFC1nqEoy5+yO0RgLC+jtYqV9a81Pmt+rr3EUL6t67Ua03cUQDUE+Pv2neyB3wjRJUfz598mwWivl6FzgvYSSUqhzU0cWzCu6DnFysRQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=p7JclodLj7OI5T/S1DbhRztXvFZgIJsTPtG1EJibHDk=;
 b=KbVZDOKeUHVXwcTE+83N68p0BhlGKHPUfYpqtNIx1k1zVjz4sLN3YTNHYMYvo/HOEDMuyr/szHb9DkUdtWRcV3pVyQ+0CTUCDQ1UE5kdfEBiipnt/4YaCVVDDIXtuw3u7vU42RpP/QP5jLn5J4sC/82upKR9feoxbfMw6klMZruMDxHpJiHB+5U9XzpIO5NNtSrYKgugwScEPr6aZkwuACmPll/U7zMiqBZUlFLuytUzZQGxfJTDZyoj6u8RZALwhJWz955xcr0yHsYpvI4R6D/UwLQg0pdsMlWWnqSPXXjrUTrHERoEkCHz5RTqx2sPclGwsk1mmvjEP92+RFugbA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vivo.com; dmarc=pass action=none header.from=vivo.com;
 dkim=pass header.d=vivo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vivo.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=p7JclodLj7OI5T/S1DbhRztXvFZgIJsTPtG1EJibHDk=;
 b=ZrPS33Cn+LNYRuX79FI/bxWG3FY3QBd4rUFLMZ9AXY/w0oIK/5G6/mKd4JSOwxh3VeeMqQB4g0SsyrP4NIlbZLc9/+s1Rf15j41vCJfhVsmYfjUPym5Xhd1eYnIQmYmP+qSZMP8f3Tpf1yQTtwnJau3iuwGUMRKlU2cdZwKW/n0iQb4jJ/ncrSwcLXjIW2096lWrlTf7Pp+CPT2daDCuLUAtmJ7BXcS0ymfFJrciGG/duNMZz9r+VVq5JGdshtqHztwxKR6qDt7dxf1ELHH+ktcD1dCR2wGIQvG82vaR4hpCIxL3IUZdeUeY1QMWdFVfVU+Ykol540K9s/5bqu+M9A==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=vivo.com;
Received: from TY2PR06MB3342.apcprd06.prod.outlook.com (2603:1096:404:fb::23)
 by KL1PR0601MB4371.apcprd06.prod.outlook.com (2603:1096:820:74::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6411.19; Thu, 18 May
 2023 04:11:22 +0000
Received: from TY2PR06MB3342.apcprd06.prod.outlook.com
 ([fe80::a567:9fc1:447f:c912]) by TY2PR06MB3342.apcprd06.prod.outlook.com
 ([fe80::a567:9fc1:447f:c912%4]) with mapi id 15.20.6387.032; Thu, 18 May 2023
 04:11:22 +0000
To: chao@kernel.org
Date: Thu, 18 May 2023 12:11:04 +0800
Message-Id: <20230518041104.78285-1-guochunhai@vivo.com>
X-Mailer: git-send-email 2.39.0
X-ClientProxiedBy: SG2PR06CA0244.apcprd06.prod.outlook.com
 (2603:1096:4:ac::28) To TY2PR06MB3342.apcprd06.prod.outlook.com
 (2603:1096:404:fb::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TY2PR06MB3342:EE_|KL1PR0601MB4371:EE_
X-MS-Office365-Filtering-Correlation-Id: 0035a693-39ad-412d-6bab-08db5755f0bd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Cl35h5TOypeg7NKHfHTx97VnpgGYMyJQj8TmUZjJW2oXKIsVLPi8EmdTzKQPlA21t+pegWmp7eD3x81T6qQu6dDjl7kekdWteg+jBVV9fu9nWXxSX5xDGUkjuJnvHJ0k8u1NTTXhSyCPxIoMAu+wrd+7Ol4sq9Qkjyt6pUxW1IC7Xj7aQj8NNsxBAenLwLwqD5Rvadr6LKu7HHlAZdw9J3W7QdPpV+zbULyDGn9fZfUv5ZEHUWiZ+1sV53/kslmkPzV6Aj9Oc3knk/Zc2zGh6CoW80SYlF3pr5GYkQRP8wJVTwpcECC1JVEXSQ/Ng0Fo9AUwShEL1M2zOGADk8mnsqCooUyrrv0OFGKuOBH0GQ/5GHJVoPypvcwBPyIWbs1IpGbD3q09i4ngvlx3rpT2nifIBjFYK5CYDUgtVmYfPaQyO4vVFKCmlEKjB/LWY/WHtC8OkNkuHugas4ukmlXwugLqaj0QdWyOSv+URzXlREWao8twauerRb7F8H1i8Hkr/iP0pr5h0EhLy3d3QMbkykW2FeLWs7MrFz7kiMP2YZp0RmCyrfSYagUdPID7/9SnTNwnifqZI3VC7SMw+PKwpT4nF3/f+XPfNQXshAVarVEk8NFRIP3hdmrwS5JFiJxwCcupoN/orR65wXuzEgEE7tSCU6t3fQ8bomXJqMjhZzI=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:TY2PR06MB3342.apcprd06.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(4636009)(396003)(366004)(346002)(136003)(376002)(39860400002)(451199021)(6486002)(4326008)(2906002)(5660300002)(8936002)(8676002)(86362001)(83380400001)(316002)(66946007)(66556008)(38350700002)(38100700002)(41300700001)(66476007)(6916009)(186003)(107886003)(6512007)(26005)(36756003)(1076003)(6506007)(6666004)(52116002)(478600001)(2616005);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?jZxXfXM9tzPyyzdDlRfkAzXaUOAWH8RPf/xBjHXCgE2+vT3Hbtj2Uin60+Lg?=
 =?us-ascii?Q?F+aN4y83FjZ1E+peF0oR90jFdOLvLMJkjtIRuzetkFFP0Ig85oLylQvdVTNE?=
 =?us-ascii?Q?PT0NJcgQgFytanEqlWiQQBgLUCvioc2gfgqQJb/8RePixCMZ4mgVpud6XABO?=
 =?us-ascii?Q?JEQO2rsJdTvBszgDCSXnzCneETmeh+qJpdcsu2lqSLl5W98Uwfl+iGmljWbl?=
 =?us-ascii?Q?ihWfCQIma6I6moyWtn8n2tl7HgB9FUCSw77i14grYROsY3CwdNN2uFncWUCZ?=
 =?us-ascii?Q?m7KgUR7YuYqRWQ/nQoBu3dULGkpz2EHcm/OA/Muraos77WxlCqLZ7LvGSzKn?=
 =?us-ascii?Q?976FFiLzWFyHyY8sE/7v+T40ucERQ/HA8/voYJyjVDQeVQUFGexgrMtp/kaR?=
 =?us-ascii?Q?QkXDPs5wqGbnrFDPnPJuNyOb4DJ+xeoGDBjBP+vJLYGNt68s3390TRSYZnw3?=
 =?us-ascii?Q?F9HpS5nyZi/jlAhnu6Ml8gE5gg+F6WZeJRdOIdNOmZLNtFtNVKWbO/Qe2QIa?=
 =?us-ascii?Q?bmdYz7MYu1P6Ul7iTAzRxPU4dNd9MPwaHJbMV8xRxQVqe4vCl5AwUGGy6asb?=
 =?us-ascii?Q?ujKj0Oj5APqUuGQOo1TeJyLVI1zAlF5dl0vFb/VU8P7K5+5msf58J4+7mNa3?=
 =?us-ascii?Q?Ktw4+5sGPgmi6AyOpIVUT/UwgOqiigDQ30eAhQiMl2cjNiINeJvLgwV2vhhP?=
 =?us-ascii?Q?XtmQJEho+ROx9NDEOgxU6OIp41XD/Mfpd2aXVFONxMhyX8UVn6a3gDE6qAMr?=
 =?us-ascii?Q?GM7xOsck9gHZu4Oz0HlocEaoaN+YznXRqhGiHe2lFSNWNWj1IBbNDJBq6Nwh?=
 =?us-ascii?Q?w1kxFtF7VwZJFquixHMzWGcdsku8w/9xliVbx/vUx4yZ9l0l21SRTaRxJ46L?=
 =?us-ascii?Q?OZeOElfZwo8usZDfUMi7/5k2IWtEGKko8dEfYraZUQ/3XKL95nEJS03y3LiX?=
 =?us-ascii?Q?ksJ9deyAG3U4uIBCrdXE9HLyNHHIE+vuTEYOuE8c2YjU0eaO1Y/wc28vfKVZ?=
 =?us-ascii?Q?kpQXHWPk8Rt/aRabGRhRVE28U7wGbJo5y35rN68GcO+mdgRlicfpppGDmE84?=
 =?us-ascii?Q?+FCg71kGHkLe8v+IL+9bq0UodsU7DhoaJW+3/1adH0gQYUOF9yLDprXLDCak?=
 =?us-ascii?Q?TmLU7oIR35sBmVSGsk2l5QmsQXwpCdDNRnTplEl2kqvF1Sl84acpKNJtn4g7?=
 =?us-ascii?Q?q07krXwtFFM7/Viv6EtvATsCiii0ve2XAJJmmb3nYh0dc6VN3tZ9wo8/+EMD?=
 =?us-ascii?Q?pxp9FJ7YBrpAQ3TJhGkmlz/O7VK1YawmvP7xCOQvlg0/kzq9vvndmuiVISFa?=
 =?us-ascii?Q?FvmjYZryQb6bxRsLlkF11D3B5zZ1difo6soeH7+XD5dOdGgvm4uu/WfJrxFs?=
 =?us-ascii?Q?KNtMAT+N8RXBvqWLekxmMLwNlzspZ6fMcAH+wGfXGUfybiszc7UJbbihavp4?=
 =?us-ascii?Q?/5bYQsdIfbSNmVZhIvOoqqGDCBlUyS1fU5W0Egdx2imt2p7IjjwX6mnuU1j0?=
 =?us-ascii?Q?hM0cBJMBJatyfg+kcGMYT++Hwvxxd4OERGOuiOHJo1WRLGY+uAkVIM9Fj0yH?=
 =?us-ascii?Q?79j8XUBXvEAE88b3poY13krHuaIayrn/UZnhnGyk?=
X-OriginatorOrg: vivo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0035a693-39ad-412d-6bab-08db5755f0bd
X-MS-Exchange-CrossTenant-AuthSource: TY2PR06MB3342.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 May 2023 04:11:22.7626 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 923e42dc-48d5-4cbe-b582-1a797a6412ed
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: xF/dxJqyjU2c1JwUiiLgqDiZeuTjz6AodEPy7QGCm3PnhNCjzLAMfkxE7qa5vgcbW2VbnzqmewO/xarNa2bw2A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: KL1PR0601MB4371
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: find_fsync_inode() detect the looped node chain by comparing
 the loop counter with free blocks. While it may take tens of seconds to quit
 when the free blocks are large enough. We can use Floyd's cycl [...] 
 Content analysis details:   (-0.2 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
 no trust [40.107.255.91 listed in list.dnswl.org]
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [40.107.255.91 listed in wl.mailspike.net]
 -0.0 SPF_HELO_PASS          SPF: HELO matches SPF record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
X-Headers-End: 1pzUzN-00Bu4I-HH
Subject: [f2fs-dev] [PATCH v4] fsck.f2fs: Detect and fix looped node chain
 efficiently
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
From: Chunhai Guo via Linux-f2fs-devel <linux-f2fs-devel@lists.sourceforge.net>
Reply-To: Chunhai Guo <guochunhai@vivo.com>
Cc: jaegeuk@kernel.org, linux-f2fs-devel@lists.sourceforge.net,
 Chunhai Guo <guochunhai@vivo.com>, frank.li@vivo.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

find_fsync_inode() detect the looped node chain by comparing the loop
counter with free blocks. While it may take tens of seconds to quit when
the free blocks are large enough. We can use Floyd's cycle detection
algorithm to make the detection more efficient, and fix the issue by
filling a NULL address in the last node of the chain.

Below is the log we encounter on a 256GB UFS storage and it takes about
25 seconds to detect looped node chain. After changing the algorithm, it
takes about 20ms to finish the same job.

    [   10.822904] fsck.f2fs: Info: version timestamp cur: 17, prev: 430
    [   10.822949] fsck.f2fs: [update_superblock: 762] Info: Done to
update superblock
    [   10.822953] fsck.f2fs: Info: superblock features = 1499 :
encrypt verity extra_attr project_quota quota_ino casefold
    [   10.822956] fsck.f2fs: Info: superblock encrypt level = 0, salt =
00000000000000000000000000000000
    [   10.822960] fsck.f2fs: Info: total FS sectors = 59249811 (231444
MB)
    [   35.852827] fsck.f2fs:	detect looped node chain,
blkaddr:1114802, next:1114803
    [   35.852842] fsck.f2fs: [f2fs_do_mount:3846] record_fsync_data
failed
    [   35.856106] fsck.f2fs: fsck.f2fs terminated by exit(255)

Signed-off-by: Chunhai Guo <guochunhai@vivo.com>
---
 fsck/mount.c | 128 +++++++++++++++++++++++++++++++++++++++++++--------
 1 file changed, 110 insertions(+), 18 deletions(-)

diff --git a/fsck/mount.c b/fsck/mount.c
index df0314d57caf..755b659f0c27 100644
--- a/fsck/mount.c
+++ b/fsck/mount.c
@@ -3394,22 +3394,91 @@ static void destroy_fsync_dnodes(struct list_head *head)
 		del_fsync_inode(entry);
 }
 
+static int find_node_blk_fast(struct f2fs_sb_info *sbi, block_t *blkaddr_fast,
+		struct f2fs_node *node_blk_fast, bool *is_detecting)
+{
+	int i, err;
+
+	for (i = 0; i < 2; i++) {
+		if (!f2fs_is_valid_blkaddr(sbi, *blkaddr_fast, META_POR)) {
+			*is_detecting = false;
+			return 0;
+		}
+
+		err = dev_read_block(node_blk_fast, *blkaddr_fast);
+		if (err)
+			return err;
+
+		if (!is_recoverable_dnode(sbi, node_blk_fast)) {
+			*is_detecting = false;
+			return 0;
+		}
+
+		*blkaddr_fast = next_blkaddr_of_node(node_blk_fast);
+	}
+
+	return 0;
+}
+
+static int loop_node_chain_fix(struct f2fs_sb_info *sbi,
+		block_t blkaddr_fast, struct f2fs_node *node_blk_fast,
+		block_t blkaddr, struct f2fs_node *node_blk)
+{
+	block_t blkaddr_entry, blkaddr_tmp;
+	int err;
+
+	/* find the entry point of the looped node chain */
+	while (blkaddr_fast != blkaddr) {
+		err = dev_read_block(node_blk_fast, blkaddr_fast);
+		if (err)
+			return err;
+		blkaddr_fast = next_blkaddr_of_node(node_blk_fast);
+
+		err = dev_read_block(node_blk, blkaddr);
+		if (err)
+			return err;
+		blkaddr = next_blkaddr_of_node(node_blk);
+	}
+	blkaddr_entry = blkaddr;
+
+	/* find the last node of the chain */
+	do {
+		blkaddr_tmp = blkaddr;
+		err = dev_read_block(node_blk, blkaddr);
+		if (err)
+			return err;
+		blkaddr = next_blkaddr_of_node(node_blk);
+	} while (blkaddr != blkaddr_entry);
+
+	/* fix the blkaddr of last node with NULL_ADDR. */
+	node_blk->footer.next_blkaddr = NULL_ADDR;
+	if (node_blk->footer.nid == node_blk->footer.ino)
+		err = write_inode(node_blk, blkaddr_tmp);
+	else
+		err = dev_write_block(node_blk, blkaddr_tmp);
+	if (!err)
+		FIX_MSG("Fix looped node chain on blkaddr %u\n",
+				blkaddr_tmp);
+	return err;
+}
+
 static int find_fsync_inode(struct f2fs_sb_info *sbi, struct list_head *head)
 {
 	struct curseg_info *curseg;
-	struct f2fs_node *node_blk;
-	block_t blkaddr;
-	unsigned int loop_cnt = 0;
-	unsigned int free_blocks = MAIN_SEGS(sbi) * sbi->blocks_per_seg -
-						sbi->total_valid_block_count;
+	struct f2fs_node *node_blk, *node_blk_fast;
+	block_t blkaddr, blkaddr_fast;
+	bool is_detecting = true;
 	int err = 0;
 
+	node_blk = calloc(F2FS_BLKSIZE, 1);
+	node_blk_fast = calloc(F2FS_BLKSIZE, 1);
+	ASSERT(node_blk && node_blk_fast);
+
+retry:
 	/* get node pages in the current segment */
 	curseg = CURSEG_I(sbi, CURSEG_WARM_NODE);
 	blkaddr = NEXT_FREE_BLKADDR(sbi, curseg);
-
-	node_blk = calloc(F2FS_BLKSIZE, 1);
-	ASSERT(node_blk);
+	blkaddr_fast = blkaddr;
 
 	while (1) {
 		struct fsync_inode_entry *entry;
@@ -3440,19 +3509,42 @@ static int find_fsync_inode(struct f2fs_sb_info *sbi, struct list_head *head)
 		if (IS_INODE(node_blk) && is_dent_dnode(node_blk))
 			entry->last_dentry = blkaddr;
 next:
-		/* sanity check in order to detect looped node chain */
-		if (++loop_cnt >= free_blocks ||
-			blkaddr == next_blkaddr_of_node(node_blk)) {
-			MSG(0, "\tdetect looped node chain, blkaddr:%u, next:%u\n",
-				    blkaddr,
-				    next_blkaddr_of_node(node_blk));
-			err = -1;
-			break;
-		}
-
 		blkaddr = next_blkaddr_of_node(node_blk);
+
+		/* sanity check to detect looped node chain with Floyd's cycle
+		 * detection algorithm
+		 */
+		if (is_detecting) {
+			err = find_node_blk_fast(sbi, &blkaddr_fast,
+					node_blk_fast, &is_detecting);
+			if (err)
+				break;
+
+			if (blkaddr_fast != blkaddr)
+				continue;
+
+			ASSERT_MSG("\tdetect looped node chain, blkaddr:%u\n",
+					blkaddr);
+
+			if (!c.fix_on) {
+				err = -1;
+				break;
+			}
+
+			err = loop_node_chain_fix(sbi,
+					NEXT_FREE_BLKADDR(sbi, curseg),
+					node_blk_fast, blkaddr, node_blk);
+			if (err)
+				break;
+
+			/* After fixing the looped node chain, retry agian. */
+			is_detecting = false;
+			destroy_fsync_dnodes(head);
+			goto retry;
+		}
 	}
 
+	free(node_blk_fast);
 	free(node_blk);
 	return err;
 }
-- 
2.25.1



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
