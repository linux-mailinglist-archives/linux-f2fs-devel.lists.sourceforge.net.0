Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 75DD9635F66
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 23 Nov 2022 14:25:35 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1oxpkm-0008AN-5m;
	Wed, 23 Nov 2022 13:25:28 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <frank.li@vivo.com>) id 1oxpkj-0008AB-H9
 for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 23 Nov 2022 13:25:26 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=MIME-Version:Content-Type:Content-Transfer-Encoding
 :Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=V6RZHRvRat957QOJppzHSoWWgIQtYgkYdWiy0+6mMjw=; b=jrWMUPwKR4dNEn6oS+cRLITWcL
 V2MuzEl6ZnP36DFER69y+h4IViQcirmkBETZzVoI6/E/Zj4fyzbLaj/sr24zbSzP+unfM6Ynivz2j
 iMwRGkjY9FjaA7P6z9p5N2l5vuPYGYKJLCj2F16NdzImtjCvq3Cq0BFWvvfcvITGi5e0=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:Date:
 Subject:Cc:To:From:Sender:Reply-To:Content-ID:Content-Description:Resent-Date
 :Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=V6RZHRvRat957QOJppzHSoWWgIQtYgkYdWiy0+6mMjw=; b=b
 vLBhghB4blWdPlQwvIw2BVhjCcQz6WcpHeXTQmSYduhdViSzI51qlPXoYL61hZrBQZtN0ERjKbQ/n
 hJoeJ6jPqmQzSaYkFBdlbBpRqgffWlDm6wg+BhtB8g2w9E0NEKJquOeP98MGXVCeCG4ctPMtbZunw
 rm2BYAcKPLXGIj3c=;
Received: from mail-psaapc01on2108.outbound.protection.outlook.com
 ([40.107.255.108] helo=APC01-PSA-obe.outbound.protection.outlook.com)
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1oxpkg-0007Xg-CV for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 23 Nov 2022 13:25:25 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=PtSkzpBwQLyawi56RyH4MOZqsH08zkonE/O200jkM7zCzXY0ZuP9rMC6pmgV4WB9n01n3+Nlc4mWZxIPDIFx+NdKf2rBjENGY6wgF2Sg0Qwv3P5yHe8v9TO7yDz8E8OFkg04LDoOLnkVVBGDkSu+RzmkoAnqF+GBkIS6wdnrBSsmrI7epuroPH/Ql9bZAl17p3KIifq9YhxJQQnoKXcNEhaqKCvM1mIIP10Q5t7CXHQq4fK4x35xrZ0CLIk6Viu+5p1n+uZUKGwWQVfySf7URbebJwxJ6fYZLaqlySkmkTKKXAvhXkMRiP3YWpbWbbnv2L0/bcgBdqLUkjyLdjyiEQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=V6RZHRvRat957QOJppzHSoWWgIQtYgkYdWiy0+6mMjw=;
 b=P7l7qSUepPo69dG+lNDtMfmoBMd2jNFNqb5mqKft6LlPTWW9liCrqCetLZy9uV7oqoIdHOkm3sJ5455LJv95m2VDpa7kYBqptfrFJYJYqFBP54HgiIKYQIz1TIP9zDdMm5yjIWrkDoIwqw9XIOH/uRSiAUwsgQAGg66eshUj9SWUssqRMxQvh8uieFxKa0zduZztrXkVdHe8Dk73QOyTPjgSvCcxtJwHpYD54TGCKEo3KAo+7wj+UmekbjIEwvbjxaUWyL8CJllhHpGrHh3jrNUX5SCUO8vW7jkUUwyt8BuS+W23+sHqGR/gS78TcV0bQj/iK9saZ9bIUinB3v0lXw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vivo.com; dmarc=pass action=none header.from=vivo.com;
 dkim=pass header.d=vivo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vivo.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=V6RZHRvRat957QOJppzHSoWWgIQtYgkYdWiy0+6mMjw=;
 b=UP5+ogZulIKdhe2qW+JinZQXG7rlgR1FinAxQf6FMFa7qg/zRCv4z/uVAOfIbLwwnMTk08RG4rxYE/P9L3WcI1rNbDkQEfZqgHiH/AT/dURJ+2MWVmvceAEE4vgiPk/yLfKdRwSRak9Emo+Yp6yer09WteONmpCHU5vSGCjKFCbjGJdFvZqn06Wy65UD4xKq281DXwn+Lr8qYbvUpiUZ/0MXGGgNNLdSa4nc2QZQPO15mfHP2h9vHwHlSOFSVpaww+ii003X1w+xE7ks98rTIO6y8nNUxP9Y8MTfiVOPCOMx7NYqSaD3WoHQh/RP98VGTEzmySRd7m/buegOLFGQRQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=vivo.com;
Received: from SEZPR06MB5269.apcprd06.prod.outlook.com (2603:1096:101:78::6)
 by SI2PR06MB3948.apcprd06.prod.outlook.com (2603:1096:4:fd::6) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5834.15; Wed, 23 Nov 2022 13:25:14 +0000
Received: from SEZPR06MB5269.apcprd06.prod.outlook.com
 ([fe80::1230:5f04:fe98:d139]) by SEZPR06MB5269.apcprd06.prod.outlook.com
 ([fe80::1230:5f04:fe98:d139%7]) with mapi id 15.20.5834.015; Wed, 23 Nov 2022
 13:25:14 +0000
To: jaegeuk@kernel.org,
	chao@kernel.org
Date: Wed, 23 Nov 2022 21:25:02 +0800
Message-Id: <20221123132502.72078-1-frank.li@vivo.com>
X-Mailer: git-send-email 2.35.1
X-ClientProxiedBy: SI2PR06CA0014.apcprd06.prod.outlook.com
 (2603:1096:4:186::11) To SEZPR06MB5269.apcprd06.prod.outlook.com
 (2603:1096:101:78::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SEZPR06MB5269:EE_|SI2PR06MB3948:EE_
X-MS-Office365-Filtering-Correlation-Id: 18d25546-d9ff-4e50-d207-08dacd56276e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: W8Yzv7Kh3zLMehWUlLXk63E7pC7c/ZAGep7l9kqxgNG6r9RxHbP7r4FKQhLKK6FdBfU1OIj+apxDuHu7eKi5TFfPeQWFCSx5K3UNTvPqzDXUzTOsxoll/rAK4WBY0MuTEEXb/HW+u9/DQZNPzjRaSJSZXL33smEUVAmUEa5qk5PFt4VlF7Z+XGxpzRh3p2MD6INllDL1T1fHVj9JOjCfRgOvOBsV04fNNpF7rWdX7L3U35pphNKAlrkjF0j8YsXj6Vy8mKiNpdLeqX1xGMJVGa+0jiavMY52Prwetzz7ZZb+ZtK459yT4/gTERZJDlAVVwRT1EVzsESwFYBme/qzHqRHVcJEO5eDqLPlQVL456NjjuP0dqQ+208ciLnMvBWx9cJXofpa/4nuCADPKiFq6hsT6Vczg3GlDkDPQRGcvKS1D8LmgUJQ0lZRYjF9vnTN/TJeSC2XlPojlhXfJGuB8ox19TkMTsxYKuntGnsC1ywui1lhRsLIF+7/3jNb1bnCK0SBzpNtCg3L5bNv0/FUYR/gJw1BRzJ7GSgKjiv2X3IGZUsfpYFeIoTfja5N9Mq1TjuLxSfMXuxKVzAo5B7FNcSMuYUvDD7Lt5gqBo1sNbJnQSR/DHsSQkbMtCEaYUw+ZxVgVkFMP2rxEFx2buTGWdOmoMp6vMF8Ncy9ngFCcT85QNBQo6zd7HsgyQ6GHZsj
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SEZPR06MB5269.apcprd06.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(4636009)(346002)(39860400002)(136003)(376002)(366004)(396003)(451199015)(36756003)(86362001)(26005)(38100700002)(38350700002)(186003)(2616005)(107886003)(2906002)(6512007)(1076003)(83380400001)(8936002)(5660300002)(52116002)(6506007)(478600001)(66556008)(6666004)(41300700001)(8676002)(66476007)(6486002)(316002)(66946007)(4326008);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?IXh11TEYXC3PBb+qDYaLdrJkD8f4vBCjLVHbTdXHTtSUFIhFllxP7btps5/s?=
 =?us-ascii?Q?xNWWIqJh+Ky8s7781dBa9OyNufh2aD5brJon53N0gD6Clsm8nyP70b+V/Lxr?=
 =?us-ascii?Q?AttYdZg0zB/zBJe142DMviXQ4bRJN3swQ9qST91GGuXg/goDnkw8xnDeFAr/?=
 =?us-ascii?Q?sWX36q+VBNraHrnj7iqYffanSbCIQ4th2adzc7B04fnC5gSZFIuNyEOdlrvU?=
 =?us-ascii?Q?FL9PvgD329k91jXyyYh0/KwkkZWFTcPZ2N+dIk2so1y85J41TnrWBAQNJXRI?=
 =?us-ascii?Q?xXiZJQpbTmgKcs8+wRPmu51Goz/+aX9MIb6Rs7YrqAyxdIoKUE4+3x9+ub7P?=
 =?us-ascii?Q?JAKJpvl5sxd8Lh1zp+msFIJvOxZKSlTe5gth+IEno/0nCaDrTt1bm2oxtxbD?=
 =?us-ascii?Q?EagxDxdcfe50v9EUbgYJvBkm/nuK6H6WXrwOFY9qTKEYzeny7g5q1ZZa6Pz2?=
 =?us-ascii?Q?yoIz8ODf277GDtGUCxGPf+Wpl6TFHkLGicKgdJ2F7M3eXWPpwTxNGHJ9jmPh?=
 =?us-ascii?Q?6XfLyGZmwb41hcWBhRwk9vPyyvnzENZmIVI8RBVeC1yDNEllFwNj3MgIR3Wj?=
 =?us-ascii?Q?Oz6PfEIpkpQSjClKIZ1tRBXQnDFXheAG56la+VX5Ag0Y0mgt6oN1XdV0C76G?=
 =?us-ascii?Q?W6ROZTZk+Yr38R2rdxaMdaf4v63tyLddpJiYGfcct9A4rTCpxkZVCcfxOhOe?=
 =?us-ascii?Q?oRPcu5EwRGT/ldWyxNuQp+90eIiEqP8RwKl07ds/e2Mxav8k6SgXRIVnSgJR?=
 =?us-ascii?Q?q7Kxfv+FU8zoehaE0FbtPA3z485rdZZ4ICF9QaA4cRJeNIB2OXiTpLHGRJ5K?=
 =?us-ascii?Q?qWmC2yqQLj2vova/FjtKy6BlAK5OVzDuyXVrOMnhfS+wzRfC8KwMqxrWef0Q?=
 =?us-ascii?Q?s6C9dtzYrkJlTgdJJVX3mFH1GRbDY7OgOq4XGXl4R9PDLTb/tyl3YmYTxiq2?=
 =?us-ascii?Q?b/6HNI/DGg4CBU/d6Px6CzyA4cRzcbBzKuQuRNQ+bIGXNvhdEVYiUeHdqDmc?=
 =?us-ascii?Q?1QGmwKY6+8sh6aLnVM54eqyRXMkwU9JP9nH7nMwsZYrSinNub9UdZpC13bN7?=
 =?us-ascii?Q?7ON/4cRjTHD6OHYAmxoOkZJPjb0PP3+KOKmA14a/Q7mNXb4dY5AfiVX/nYdq?=
 =?us-ascii?Q?v8TV+n9bnUOzdFrAA6vOR4fTBPhCXxkgIe0ZLMC2Q9l4YvaY2E2/8rK3oNYu?=
 =?us-ascii?Q?w5A6jycAG3eTucofWNRkXKFp2YuRvVJmN9j7J9VYrLvGkwZMXC7+fN5VXDI5?=
 =?us-ascii?Q?0pZhKwK79WCDtgBx5Z4cXVxJI9j1KL3f9KVJ3A0eCH2z7VLi2SOgpG0535OJ?=
 =?us-ascii?Q?JetSyPrL+t4kWLTydZkhC/bx8pHzuwtUmIsOc9nPuCALHsSIeJGa/xjeq4IH?=
 =?us-ascii?Q?aKQaLB3faUy80NEFh0T3BgryRd1DNvAPxiTiSzo/qZJGNmmC+9vcLCh1YIA7?=
 =?us-ascii?Q?/Su80YVPJtimuWV2kANJ/+cEacj6QhAM+IHdLURipTndHJnWGyWnKjBGJ5al?=
 =?us-ascii?Q?V4V83q/74W8gZr+6FrWnnhLy5tPYHTh02BhKWrKTlIo+StdBX7a7NhQRoOKs?=
 =?us-ascii?Q?214BcyiTZ+Jl4dl0v5vbllCXZ2It29oXG7qAtkMJ?=
X-OriginatorOrg: vivo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 18d25546-d9ff-4e50-d207-08dacd56276e
X-MS-Exchange-CrossTenant-AuthSource: SEZPR06MB5269.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Nov 2022 13:25:14.0989 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 923e42dc-48d5-4cbe-b582-1a797a6412ed
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: i0tTwedMJT2t08jwQdqPyMRj+MkrncF8XfgSx1LClqGgeQCFH/iPUIjQRSZYXzDaZKL6b3ZXmTiGx30Q4SWg7w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SI2PR06MB3948
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: This patch adds support for counting the average time of
 submit
 discard command, and we can see its value in debugfs. Signed-off-by: Yangtao
 Li <frank.li@vivo.com> --- fs/f2fs/debug.c | 7 +++++-- fs/f2fs/f2fs.h | 5
 +++++ fs/f2fs/segment.c | 17 +++++++++++++++-- 3 files changed,
 25 insertions(+), 4 deletions(-) 
 Content analysis details:   (-0.2 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
 no trust [40.107.255.108 listed in list.dnswl.org]
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [40.107.255.108 listed in wl.mailspike.net]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.0 SPF_HELO_PASS          SPF: HELO matches SPF record
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
X-Headers-End: 1oxpkg-0007Xg-CV
Subject: [f2fs-dev] [PATCH] f2fs: add support for counting the average time
 of submit discard cmd
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

This patch adds support for counting the average time of submit discard
command, and we can see its value in debugfs.

Signed-off-by: Yangtao Li <frank.li@vivo.com>
---
 fs/f2fs/debug.c   |  7 +++++--
 fs/f2fs/f2fs.h    |  5 +++++
 fs/f2fs/segment.c | 17 +++++++++++++++--
 3 files changed, 25 insertions(+), 4 deletions(-)

diff --git a/fs/f2fs/debug.c b/fs/f2fs/debug.c
index a216dcdf6941..ede862cb178d 100644
--- a/fs/f2fs/debug.c
+++ b/fs/f2fs/debug.c
@@ -109,6 +109,9 @@ static void update_general_status(struct f2fs_sb_info *sbi)
 			llist_empty(&SM_I(sbi)->fcc_info->issue_list);
 	}
 	if (SM_I(sbi)->dcc_info) {
+		struct discard_cmd_control *dcc = SM_I(sbi)->dcc_info;
+
+		si->discard_avg = dcc->discard_time_avg;
 		si->nr_discarded =
 			atomic_read(&SM_I(sbi)->dcc_info->issued_discard);
 		si->nr_discarding =
@@ -506,11 +509,11 @@ static int stat_show(struct seq_file *s, void *v)
 		seq_printf(s, "  - IO_R (Data: %4d, Node: %4d, Meta: %4d\n",
 			   si->nr_rd_data, si->nr_rd_node, si->nr_rd_meta);
 		seq_printf(s, "  - IO_W (CP: %4d, Data: %4d, Flush: (%4d %4d %4d), "
-			"Discard: (%4d %4d)) cmd: %4d undiscard:%4u\n",
+					  "Discard: (%4d %4d avg:%4lldns)) cmd: %4d undiscard:%4u\n",
 			   si->nr_wb_cp_data, si->nr_wb_data,
 			   si->nr_flushing, si->nr_flushed,
 			   si->flush_list_empty,
-			   si->nr_discarding, si->nr_discarded,
+			   si->nr_discarding, si->nr_discarded, ktime_to_us(si->discard_avg),
 			   si->nr_discard_cmd, si->undiscard_blks);
 		seq_printf(s, "  - atomic IO: %4d (Max. %4d)\n",
 			   si->aw_cnt, si->max_aw_cnt);
diff --git a/fs/f2fs/f2fs.h b/fs/f2fs/f2fs.h
index f0833638f59e..6891467fdb6a 100644
--- a/fs/f2fs/f2fs.h
+++ b/fs/f2fs/f2fs.h
@@ -372,6 +372,8 @@ struct discard_cmd {
 	int error;			/* bio error */
 	spinlock_t lock;		/* for state/bio_ref updating */
 	unsigned short bio_ref;		/* bio reference count */
+	struct discard_cmd_control *dcc; /* global discard cmd control */
+	ktime_t submit_start;		/* submit start time */
 };
 
 enum {
@@ -415,6 +417,8 @@ struct discard_cmd_control {
 	unsigned int max_ordered_discard;	/* maximum discard granularity issued by lba order */
 	unsigned int undiscard_blks;		/* # of undiscard blocks */
 	unsigned int next_pos;			/* next discard position */
+	spinlock_t discard_time_lock;	/* for discard time statistics */
+	ktime_t discard_time_avg;		/* issued discard cmd avg time */
 	atomic_t issued_discard;		/* # of issued discard */
 	atomic_t queued_discard;		/* # of queued discard */
 	atomic_t discard_cmd_cnt;		/* # of cached cmd count */
@@ -3883,6 +3887,7 @@ struct f2fs_stat_info {
 	int nr_dio_read, nr_dio_write;
 	unsigned int io_skip_bggc, other_skip_bggc;
 	int nr_flushing, nr_flushed, flush_list_empty;
+	ktime_t	discard_avg;
 	int nr_discarding, nr_discarded;
 	int nr_discard_cmd;
 	unsigned int undiscard_blks;
diff --git a/fs/f2fs/segment.c b/fs/f2fs/segment.c
index 8b0b76550578..dd67e936615a 100644
--- a/fs/f2fs/segment.c
+++ b/fs/f2fs/segment.c
@@ -936,6 +936,7 @@ static struct discard_cmd *__create_discard_cmd(struct f2fs_sb_info *sbi,
 	list_add_tail(&dc->list, pend_list);
 	spin_lock_init(&dc->lock);
 	dc->bio_ref = 0;
+	dc->dcc = dcc;
 	atomic_inc(&dcc->discard_cmd_cnt);
 	dcc->undiscard_blks += len;
 
@@ -1005,9 +1006,13 @@ static void __remove_discard_cmd(struct f2fs_sb_info *sbi,
 static void f2fs_submit_discard_endio(struct bio *bio)
 {
 	struct discard_cmd *dc = (struct discard_cmd *)bio->bi_private;
+	struct discard_cmd_control *dcc = dc->dcc;
 	unsigned long flags;
+	ktime_t submit_time;
+	int nr_discarded;
 
 	spin_lock_irqsave(&dc->lock, flags);
+	submit_time = ktime_sub(ktime_get(), dc->submit_start);
 	if (!dc->error)
 		dc->error = blk_status_to_errno(bio->bi_status);
 	dc->bio_ref--;
@@ -1017,6 +1022,13 @@ static void f2fs_submit_discard_endio(struct bio *bio)
 	}
 	spin_unlock_irqrestore(&dc->lock, flags);
 	bio_put(bio);
+
+	spin_lock_irqsave(&dcc->discard_time_lock, flags);
+	nr_discarded = atomic_read(&dcc->issued_discard);
+	dcc->discard_time_avg = div_u64(ktime_add(nr_discarded * dcc->discard_time_avg, submit_time),
+									nr_discarded + 1);
+	atomic_inc(&dcc->issued_discard);
+	spin_unlock_irqrestore(&dcc->discard_time_lock, flags);
 }
 
 static void __check_sit_bitmap(struct f2fs_sb_info *sbi,
@@ -1165,6 +1177,7 @@ static int __submit_discard_cmd(struct f2fs_sb_info *sbi,
 		 * right away
 		 */
 		spin_lock_irqsave(&dc->lock, flags);
+		dc->submit_start = ktime_get();
 		if (last)
 			dc->state = D_SUBMIT;
 		else
@@ -1184,8 +1197,6 @@ static int __submit_discard_cmd(struct f2fs_sb_info *sbi,
 		bio->bi_opf |= flag;
 		submit_bio(bio);
 
-		atomic_inc(&dcc->issued_discard);
-
 		f2fs_update_iostat(sbi, NULL, FS_DISCARD, 1);
 
 		lstart += len;
@@ -2076,9 +2087,11 @@ static int create_discard_cmd_control(struct f2fs_sb_info *sbi)
 	INIT_LIST_HEAD(&dcc->wait_list);
 	INIT_LIST_HEAD(&dcc->fstrim_list);
 	mutex_init(&dcc->cmd_lock);
+	spin_lock_init(&dcc->discard_time_lock);
 	atomic_set(&dcc->issued_discard, 0);
 	atomic_set(&dcc->queued_discard, 0);
 	atomic_set(&dcc->discard_cmd_cnt, 0);
+	dcc->discard_time_avg = 0;
 	dcc->nr_discards = 0;
 	dcc->max_discards = MAIN_SEGS(sbi) << sbi->log_blocks_per_seg;
 	dcc->max_discard_request = DEF_MAX_DISCARD_REQUEST;
-- 
2.25.1



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
