Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 28DB96F6357
	for <lists+linux-f2fs-devel@lfdr.de>; Thu,  4 May 2023 05:32:10 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1puPhN-000586-VE;
	Thu, 04 May 2023 03:32:05 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <guochunhai@vivo.com>) id 1puPhM-00057z-Bi
 for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 04 May 2023 03:32:04 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=MIME-Version:Content-Type:Content-Transfer-Encoding
 :Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=4qZwSS449989yO3DPI6sA/TMm94dVA8g4XmRwbi3ROg=; b=SWvUVNYmL/KLFjzrdWjikH+Wjr
 MLv716depJWVj9y6+HZ3XXTWiGc60CSiF3RxBm4oD3LDxeve1ozctO3KJ0g3hpiIa0MVXveuyzwjD
 5v0f/+DUrIxHIoNK46OyoIq1K+/uCTB2r808nK1+GG0V960YxExgTQINTNNyydUbw1Cg=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:Date:
 Subject:Cc:To:From:Sender:Reply-To:Content-ID:Content-Description:Resent-Date
 :Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=4qZwSS449989yO3DPI6sA/TMm94dVA8g4XmRwbi3ROg=; b=A
 6KPPaTObnJMR8fLtXcWYbnxfmalwLGX/IKS2b/VL8ZahOv4cxjtPfChgPFoVVPy8crfOrxzArchVV
 HVuZehaEWzr6tg+7G7bY0PLQFg2ac5y3hWqviw5PxIr04uoR5Y63E61n1rY+/ZEZ+ORceFFChHwnu
 WwJ6aCleDePG8EjA=;
Received: from mail-psaapc01on2091.outbound.protection.outlook.com
 ([40.107.255.91] helo=APC01-PSA-obe.outbound.protection.outlook.com)
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1puPhF-00DZ9p-3R for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 04 May 2023 03:32:04 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=L2VdHIGLARhrNRqJH+7va5WzszYHEPT64vBBpehfAv34OwP/GVAA9vtwUAFO+u2PZYPqhosKNgUFuzra+jbLzh/7Tb7Y7jdB6foBnWXHfKXapfSMnzIDBEvj1NCHVl8bjogk6r0RhhUJjvDleBsMLy+RSpO1O7isXFvdublkteXma7FgMAvYPF52/c2RPvD23gQ7sAHe5uNlP72Wr0BYWmFAqSLqc+eEe7kfA3dO052NRR+LBYvkJuVJkdoUMo8kB/4Ff77gYhp9+vZ2TWVEzMP/QJDsGYKluDtSVNs/hbnuPwxXwueuluWRlEvWYGtxkyFL1JU7xxfsd6+BpPdgsw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4qZwSS449989yO3DPI6sA/TMm94dVA8g4XmRwbi3ROg=;
 b=dr6TuXIt+Z5oPiXT0pXb6tPMA9xvHlcouuxZreKe9HzUBjbnsvI0h5RZfQG84aiVeXlH1DxXC7mG0Q0+u4B8gd85oqPqr0uISe2UauPY1kP65J9zdHzCsAJ093gN8Qu9ojewX2QbcWJnPfpkY8HyAAQMP0ting+WTPT38EYgSSJ8iADCoj22gkBO/QZjkkX0invR0KgOknLR2hWcg7S/3DJVJGD1cXkXyhVUhOTkjL7wIb+7dyDDGT/ZjDAY0+XslMMyGz9bAxwtVfOc2qEGhxc12QWAko4qkW8WqWQzpTmfbgq5/3CXwCHUhl+ggt+vYdI1gN3RJxnRq1CnN2pvjQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vivo.com; dmarc=pass action=none header.from=vivo.com;
 dkim=pass header.d=vivo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vivo.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4qZwSS449989yO3DPI6sA/TMm94dVA8g4XmRwbi3ROg=;
 b=ZI5sAa2qYYQl4YWP3DOrezolFSitkA0uw9sX/yXH+WK7KFi8QAMYLbNG4YbthXwxYGcQl3sfrndi2Yj9aA5+HIFEm0w1tSxqeoqB1ds1Wt8Km1fmb3qGoeWSrp+Hfw69hPD7BBjj1JPtANpfKeUAIgCzUDi+FbbJyZ0I98Abrg4+oeyNI9IsmIzSwqmZuTB3d+PCm53atf+Dc5ZjGcsdMZDZM4LKNgdNkXbxra2bkS/n+gKbPYhmtXcOqdhJWzc7RykQsiyfwI1wwhglVHcM7HQ3Or9RbwWW985YCGjI1I6hCE/2n5afmGYVrSjc10RRqVvbb79LRLkPVxamyVshHQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=vivo.com;
Received: from TY2PR06MB3342.apcprd06.prod.outlook.com (2603:1096:404:fb::23)
 by SEZPR06MB5524.apcprd06.prod.outlook.com (2603:1096:101:a8::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6363.26; Thu, 4 May
 2023 03:31:45 +0000
Received: from TY2PR06MB3342.apcprd06.prod.outlook.com
 ([fe80::a3ea:d1dd:131a:d653]) by TY2PR06MB3342.apcprd06.prod.outlook.com
 ([fe80::a3ea:d1dd:131a:d653%6]) with mapi id 15.20.6340.036; Thu, 4 May 2023
 03:31:45 +0000
To: jaegeuk@kernel.org
Date: Thu,  4 May 2023 11:30:43 +0800
Message-Id: <20230504033043.55761-1-guochunhai@vivo.com>
X-Mailer: git-send-email 2.39.0
X-ClientProxiedBy: SI2PR02CA0030.apcprd02.prod.outlook.com
 (2603:1096:4:195::17) To TY2PR06MB3342.apcprd06.prod.outlook.com
 (2603:1096:404:fb::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TY2PR06MB3342:EE_|SEZPR06MB5524:EE_
X-MS-Office365-Filtering-Correlation-Id: e0091702-a316-4727-d005-08db4c5015d3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: o96jbX2UIPp2l5XOkuDcjz+WkkrYwMK9SxiF3t8fSdjx8WMu+3gO1Y+Jr/6dL0MCm7CAMasCwVWG82hLJyaHi6uuc6yjCSqe6Mo47Jvi4lqW2qKiN6E/qkLbi/6OD3SMo8Bo5mZIVXnZe3xnuc4o2Cpo+G+OCuqMzux0HxePjIKxzba+xQSUgV43ekJ1N5KKZwRPhHmgFsaE2eSVOS/Kz0pMSkh5t6xEi915r2OePEBv920bAkrKby1hK1vAIl5gI9VWqI+NAWKiWAjI2mAiO0sNpA4Y1dL7DED58vXQLhPXz8N2Xg44NO4yqyF8bGGXrRoerGnSWvwSqHwbStVdKjWq41pVxav1ZQGPwxBRr+RhIzlnZN8xe2j+XsvWvfan7p9clZ3RWZaS8Gbk8HLPnpXelTlkZvYSVT0KIopP+a+yukmgHLsxU921URgZ0JVohhKRUUwlr5DxkVFbUhSB5GxtU5A2yM35qEo4fskLe2P1z8qAVGSoEwxiQmOV+zMVKCRq+PUfBU0dp+u8I4Ate/z3U+HqvilSFmH0Re5fpJHaelJliBHjrrSImsKciMJwjLAYk3FnPah7i0WACQjq/3be2wreKCOYTGCyFRFIgnJnhIlDIGw3babx2wGUEc9h
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:TY2PR06MB3342.apcprd06.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(4636009)(396003)(136003)(39860400002)(346002)(376002)(366004)(451199021)(478600001)(38350700002)(8936002)(5660300002)(8676002)(38100700002)(2616005)(1076003)(26005)(86362001)(6512007)(66946007)(66556008)(66476007)(6916009)(6486002)(4326008)(83380400001)(107886003)(6506007)(52116002)(316002)(186003)(41300700001)(2906002)(36756003);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?bAwh8U9yo0tYoktPq3xhcp40OOqEJv6wZCXezPpeiUEn+JB32qm23+vThaIK?=
 =?us-ascii?Q?EtrBtB8hkuV1O0vH2VgCLYYsDVyVQQIg5BePweGoxfim+ZeQbZgZdhD3embF?=
 =?us-ascii?Q?RRNNP8+t2ge/6/4jA8CnfY+8Fc/u7IYciyHjUoAgRcMlrz016L5PH1QWaWt0?=
 =?us-ascii?Q?HcokMmqW+Thz1murIywB+5znMNGE+kQE+5hcD5SJORTPVgZUw5fJdoGsHnUp?=
 =?us-ascii?Q?F8rhfaGDXNEKXok0gd6BMS20PNi53zcHRN5mZsYbTsCaW2S8lM6y1QZAxCnI?=
 =?us-ascii?Q?RJ/Z+En8ZjRYaDMQKDkSFlS83UjA2cQKIjTwusVlX0LB8CJSc23+7BpnZw38?=
 =?us-ascii?Q?BxSjH0RyJxaNKQVimt497/3RCV7IqyfeKrAf1hpHEhxbceVNt2naLxEW5qqw?=
 =?us-ascii?Q?Oe/OdRN2tlWjK8o07nVTyE7HXqkHh39cMTZaAp8aTkZ2eo2hWdytcRUmLeOD?=
 =?us-ascii?Q?Xoc5tUj+buu04/RTuOiPxMsB+VUAky1/kILHVP5iVKyBLdx1ul2TrEuCNVoJ?=
 =?us-ascii?Q?ADod+X49plXTdQRK5KD0kb1HylAnfcC9kx8FAcVC6PVWGfSBOu3f5YYPi6Ib?=
 =?us-ascii?Q?B7/HeFoAw8TJVdVUqs1PD2bJS1rmXz0VtZILHMGrSZskX5uX9DZXGz33ca8c?=
 =?us-ascii?Q?LVf+8w4DWOVWpGaHzm1ogwV2tUqlPxyzmbF5lD84DwCWNB3mSEuI6DIgbyMA?=
 =?us-ascii?Q?kLpNZg/aDzVydW2mHrij655PsvbI+RuTopC3b09nJQ7uPMHAEccJdnTgvomq?=
 =?us-ascii?Q?/kS0ZaMmd8cIq3fIpKVHL9f3Yoq7PM8U1J/ZiylYWyDMKUhw4N9iD+9UpZ20?=
 =?us-ascii?Q?txDxJer2oySoqE3uWoRy9PW5xF/mIwRZSQPalwHHJIGbi5f2VZIAriu04wB1?=
 =?us-ascii?Q?W52GsaGbWzzbUBSfcaV7Kr5HrHblTrS53P9Ro3MA53NzLPlgLLTEmcHikw7z?=
 =?us-ascii?Q?Kt/QPoppB6gbccn3tINaD7gzeboVYLhUwCiCARYJQ7akAVgeLJiHRUcEAHdO?=
 =?us-ascii?Q?XcMm3s90gV/xvX7ySDmw0n7K8fun2+1EzUph0xkzqsXiXJrhid+3HhZ1E8mh?=
 =?us-ascii?Q?6b7YSiYiDMeTciyX07M7PYYonlBSzmfYBZ23LG/juihLbQLXVm8jYz7H4kgQ?=
 =?us-ascii?Q?M33W0Q8OTEBY9Twju0DKRf3FA/Cm/88/0fphIRF7yqz8bdigFwweg7lcK7Bm?=
 =?us-ascii?Q?E4DRgMDMi284PBpyqiDOKL58DFiJ1E/q4T4/O9K7P2vYV5IrxJSXsVQIZaOG?=
 =?us-ascii?Q?OnXiBg7Q+G4ZlaUZUzmO2/mQHc6dtfEEkPxX8YnGMaJhR5IQX9qfLqd5ghOQ?=
 =?us-ascii?Q?B+CUI0oqnFSaRgtrZoU6qCUAgLpENCEG+/TUUarkVQbSpqWuuq6MAGyq+8ba?=
 =?us-ascii?Q?xEtO0qYHOzMt6piBL/X6gZKuY+9F8O4YrykzhM2g1TFUFe3jPitdr1kO0daG?=
 =?us-ascii?Q?2CKzWMTdJsIn3LjE0FBvcPqfcYz2Ujop1qu/BYEHDds5kryLaR7PNrLJ0F+A?=
 =?us-ascii?Q?5PWeCz2oKae9Nu+cQdMY30TRRug6VJdfjW5cpq6lUZeT48o9bKUahZLKTsew?=
 =?us-ascii?Q?UmSE79hqo3C7YCc/uC+zw7W7jqA6upY/hqcquNXQ?=
X-OriginatorOrg: vivo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e0091702-a316-4727-d005-08db4c5015d3
X-MS-Exchange-CrossTenant-AuthSource: TY2PR06MB3342.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 May 2023 03:31:45.2498 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 923e42dc-48d5-4cbe-b582-1a797a6412ed
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: dn3DgH+SXW1iaff/KpBLggEY8EuwE6b7w9NHGX9NunUtW9BdpUDN5PUDJfHsjITelVzAzXwy3PA80ah5ax/+Kw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SEZPR06MB5524
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  Now we detect the looped node chain by comparing the loop
 counter with free blocks. While it may take tens of seconds to quit when the
 free blocks are large enough. We can use Floyd's cycle detection [...] 
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
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid -0.0 T_SCC_BODY_TEXT_LINE   No description available.
X-Headers-End: 1puPhF-00DZ9p-3R
Subject: [f2fs-dev] [PATCH] fsck.f2fs: Detect looped node chain more
 efficiently.
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
Cc: Chunhai Guo <guochunhai@vivo.com>, linux-f2fs-devel@lists.sourceforge.net,
 frank.li@vivo.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

Now we detect the looped node chain by comparing the loop counter with
free blocks. While it may take tens of seconds to quit when the free
blocks are large enough. We can use Floyd's cycle detection algorithm to
make it more efficient.

Below is the log we encounter on a 256GB UFS storage and it takes about
25 seconds to detect looped node chain. After changing the algorithm, it
takes about 20ms to finish the same job.

    [   10.822904] fsck.f2fs: Info: version timestamp cur: 17, prev: 430
    [   10.822949] fsck.f2fs: [update_superblock: 762] Info: Done to
update superblock
    [   10.822953] fsck.f2fs: Info: superblock features = 1499 :
encrypt verity extra_attr project_quota quota_ino casefold
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
 fsck/mount.c | 57 ++++++++++++++++++++++++++++++++++++++++++----------
 1 file changed, 46 insertions(+), 11 deletions(-)

diff --git a/fsck/mount.c b/fsck/mount.c
index df0314d..2e919d9 100644
--- a/fsck/mount.c
+++ b/fsck/mount.c
@@ -3394,22 +3394,48 @@ static void destroy_fsync_dnodes(struct list_head *head)
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
 
 	/* get node pages in the current segment */
 	curseg = CURSEG_I(sbi, CURSEG_WARM_NODE);
 	blkaddr = NEXT_FREE_BLKADDR(sbi, curseg);
+	blkaddr_fast = blkaddr;
 
 	node_blk = calloc(F2FS_BLKSIZE, 1);
-	ASSERT(node_blk);
+	node_blk_fast = calloc(F2FS_BLKSIZE, 1);
+	ASSERT(node_blk && node_blk_fast);
 
 	while (1) {
 		struct fsync_inode_entry *entry;
@@ -3424,6 +3450,16 @@ static int find_fsync_inode(struct f2fs_sb_info *sbi, struct list_head *head)
 		if (!is_recoverable_dnode(sbi, node_blk))
 			break;
 
+		/* Here we use Floyd's cycle detection algorithm to detect
+		 * looped node chain more effeciently.
+		 */
+		if (is_detecting) {
+			err = find_node_blk_fast(sbi, &blkaddr_fast,
+					node_blk_fast, &is_detecting);
+			if (err)
+				break;
+		}
+
 		if (!is_fsync_dnode(node_blk))
 			goto next;
 
@@ -3441,11 +3477,9 @@ static int find_fsync_inode(struct f2fs_sb_info *sbi, struct list_head *head)
 			entry->last_dentry = blkaddr;
 next:
 		/* sanity check in order to detect looped node chain */
-		if (++loop_cnt >= free_blocks ||
-			blkaddr == next_blkaddr_of_node(node_blk)) {
-			MSG(0, "\tdetect looped node chain, blkaddr:%u, next:%u\n",
-				    blkaddr,
-				    next_blkaddr_of_node(node_blk));
+		if (is_detecting && (blkaddr_fast == blkaddr)) {
+			MSG(0, "\tdetect looped node chain, blkaddr:%u\n",
+				    blkaddr);
 			err = -1;
 			break;
 		}
@@ -3453,6 +3487,7 @@ next:
 		blkaddr = next_blkaddr_of_node(node_blk);
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
