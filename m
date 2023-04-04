Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A47E6D5763
	for <lists+linux-f2fs-devel@lfdr.de>; Tue,  4 Apr 2023 06:01:23 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1pjXrC-0000IH-6F;
	Tue, 04 Apr 2023 04:01:19 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <frank.li@vivo.com>) id 1pjXrA-0000IA-0J
 for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 04 Apr 2023 04:01:16 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=MIME-Version:Content-Type:Content-Transfer-Encoding
 :Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=r1OiDib/D5yfL0i4HU/G/wu+9pDHLxc636AnGzvuiYo=; b=bKhg9oeiN625FNYcetOGCmOw3+
 8HYF9aZ8Zqerz06fY9JJXsp78bOJf/jwhnQ7SlHtHfa7Pv+YOJ2yxs1MPWu/vLur+B+SxIX4IDcif
 1DBKb4OEBTK9hsRYsSNTZEd0S2LWCkavzPT7K2mkyDCUChwk0UO4a8n3+RD9JGj0CmWI=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:Date:
 Subject:Cc:To:From:Sender:Reply-To:Content-ID:Content-Description:Resent-Date
 :Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=r1OiDib/D5yfL0i4HU/G/wu+9pDHLxc636AnGzvuiYo=; b=m
 LHL8I/VG876uyrYPgCV+KTU86lQ6bbcacKvp3zG15ula5g2XCl08kkqBy9O1e1kGe9Z7CYH3pd7fj
 N5N9+U4s8WjtdJxLrxvF/p1VOz0H7VtsolRRqUJf/pyFd32MUkfeHKb5R432kHlYE5IwGr6aciCu5
 W6E7UNGEyYWii23I=;
Received: from mail-tyzapc01on2113.outbound.protection.outlook.com
 ([40.107.117.113] helo=APC01-TYZ-obe.outbound.protection.outlook.com)
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1pjXr9-0007Td-Sp for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 04 Apr 2023 04:01:16 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=bNXS6D5IG6mb+GUYSsEUHO5i/SZuO6xqfmVkoHdzrgC0CyiZUxl/4/UDLgx7Dz7kCbkbqrG+aWrofFDvBWr0HjaPi703roR5XOJzIZhMLXdJoH36fueHR4dUVmytt5BrjRH9a8G57KJY1hWMVY86XKnzs7OplXV306fFwkeKJqOePQTOWxvykR5f7V1AZsIaVbInss1RzSS2AkQZj9R2P1FDB3yKyfaY8CXtD3+C/XdRKVESFqFG7tAZllLrU80DCWytIszs8zCD/Tt7n7Md3vJqzzy8/jPESd04NfAODTXOD11f+pPoJGTe+Nin8t5mbVQv9jfM67g3vuur32EU2Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=r1OiDib/D5yfL0i4HU/G/wu+9pDHLxc636AnGzvuiYo=;
 b=Wn31euivro9W56LD0AvysPkF4W+k2+TMfWba8GwgIGxRasy4IjL/Brx7205kYYsKVljunrJJXusIekmE5BEus440tBeqvGDX5WxmpTCx81WwvPq8gJ1gpMhmrlDB/eBJ3XJ1MciDBpdNtJNEG1rAfVY49YBLILPkajTFllelKXpV4H3+iWEFKZDsxPnA4iqG0tt2QwEClFkNnlg0h4iPEFJ5g1aGIQlyBLwtO+bLp6XE7hZDFehiC5WmxrKNk0yjvaFUuyOkMOCg3UDHaQvurAaB5tBqCRn+cpx6ukoEBCyiWcSOiUpqkoAn9B6gqrj9/surQvnSfYZnYOrdWMF/iQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vivo.com; dmarc=pass action=none header.from=vivo.com;
 dkim=pass header.d=vivo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vivo.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=r1OiDib/D5yfL0i4HU/G/wu+9pDHLxc636AnGzvuiYo=;
 b=iFkBQ2cHpKIMLE2D7FEcbbIKdMMeoL34iL/MVHFRa8/XVJdNUUMUn4gkTADtREyOZ9NDLeto3D6/0YvjjFBI8zq6xjtRzkY318JstEqMXtmum4Q+Ps/p1G7LRKwN8Vh7Ved0hTj6VFzWaWWMFTHYSTjKx29hvyatV9yP2C3wvqn4KzHDrdyvKX1Bx7SMGrlpwRv7lWXR/Q873hkQF5Q49XoD6kSCpMOLiwps2CFLj4QFVR5CgJgqwot0Oj1Vkfrib7sKv0uiRfc39mYZqH2kqDOo7yPghcV6mhKNypgug/TSCxLtcd4oi6kEPOTS+td4b9YGMkLRLh5ReDVIUEpZ2A==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=vivo.com;
Received: from SEZPR06MB5269.apcprd06.prod.outlook.com (2603:1096:101:78::6)
 by TYZPR06MB4029.apcprd06.prod.outlook.com (2603:1096:400:23::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6254.35; Tue, 4 Apr
 2023 04:01:04 +0000
Received: from SEZPR06MB5269.apcprd06.prod.outlook.com
 ([fe80::a3a1:af8e:be1e:437c]) by SEZPR06MB5269.apcprd06.prod.outlook.com
 ([fe80::a3a1:af8e:be1e:437c%6]) with mapi id 15.20.6254.028; Tue, 4 Apr 2023
 04:01:04 +0000
To: Jaegeuk Kim <jaegeuk@kernel.org>,
	Chao Yu <chao@kernel.org>
Date: Tue,  4 Apr 2023 12:00:51 +0800
Message-Id: <20230404040051.50726-1-frank.li@vivo.com>
X-Mailer: git-send-email 2.35.1
X-ClientProxiedBy: SG2P153CA0035.APCP153.PROD.OUTLOOK.COM (2603:1096:4:c7::22)
 To SEZPR06MB5269.apcprd06.prod.outlook.com
 (2603:1096:101:78::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SEZPR06MB5269:EE_|TYZPR06MB4029:EE_
X-MS-Office365-Filtering-Correlation-Id: 54775c97-6e91-44eb-9ea9-08db34c13645
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: z/pxdkLIWko5hzA0gyXn8hikAZ8lMwrS5ktPsgPtY4neE/aDNkaRQXSJ/ZR+NAIo2yKLRzyRcw0HGjgiP0AEPexZ+KE5M4RfIebp1CqS61Ld7Rfws6LbQFlpaSGWTIz68h5byyMR1WfncJullW4epI+ckxvHEtV7nBWXXHdI0EyX9sqn9aEOeoQi68GVmwxQU3lPnjDEouBxiixAAKEVFWnja8opCSldvKrthtS1v6eXqm2RcY7eBBZR4N49jOEmfOXbPWliVVBypu7B3rduoulrqzoRuon0b+DCla1F3jeCR9952wMCuTSMljRnkVDrlWKetkD/6XJpOhk+xM+lu43jideFm3I1/o7Zpe3gNN0cnD3Lso7R7mAFn9FEMrtZbhSvwyGVc8b+RqIoPYhbTSj4Ae8yMHeJcL6ot7YkA2ntexgqp90/lZe7VbOv5szDLGEh82tgiqF1QwN70CI4OZc25sdKd9zx+AjcBielhyDqr8/zCIFAbZv5gUifwilgArMndQM7zntQ++sjJRAou2LqmV8bqnrNHpkv4P2XbI1Fj3PsCOJ6/f5w9cw2YQbE8a5Z3yl2dJjlp7CYJVNbYV/QFeFEjUER7ecYnzRHNpLS7j4g3A6AzhamTOdtKrqJ
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SEZPR06MB5269.apcprd06.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(4636009)(396003)(39860400002)(346002)(366004)(376002)(136003)(451199021)(2906002)(86362001)(36756003)(2616005)(52116002)(186003)(83380400001)(6512007)(6506007)(1076003)(6666004)(26005)(6486002)(41300700001)(4326008)(8676002)(66946007)(66556008)(66476007)(5660300002)(38100700002)(38350700002)(316002)(110136005)(478600001)(8936002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?wzcmwx4w2zUAnfZRRBsP5MYfiNjRWkOQIsBoB5+8/4wUUZcu+QJ1Udh16cb7?=
 =?us-ascii?Q?VrA5MTdOtMsETEjqCxbrl6VhkPrR3a/uiM5LZ/obJ7ruX1YGRmfiTXlCP9Eg?=
 =?us-ascii?Q?Bp9lnY5qeU/QT2s9Wnz/J1kulVQetDC0mOdGcIe/eFvCRzlCCRM9/zduFGXg?=
 =?us-ascii?Q?u232suPuiX8tjg3TL8zCz1bPwpR7GklTxddnkxMAY5fAfb8tImZIuXUqiKUw?=
 =?us-ascii?Q?gxJn4fRLBPkhZkIUCF0aM4uork95bEzu8OAI/tlrE6PSiZsZVtMhkTc83zLD?=
 =?us-ascii?Q?oUfokkYZTh1774l7FREPTG7FVOjcP77YcARwxTHbLOdjQey8B3o4ohZ9Z9g6?=
 =?us-ascii?Q?U2nGkH11uySKWRPCeCF2aXsplyF3DI4eQXJ1mk4KllPziEGwdS4SFs7Z3mAR?=
 =?us-ascii?Q?UO/Y1hVjFeDud4zWPW7Cd/brBbJ7nlRkD7gOqFDPgSx5GbmvdScCaChvv/bp?=
 =?us-ascii?Q?F8NW08Q8ZOYbqrAtOSiocvIecnchBqKTXPOrGGc5KCpGNXsfvFVoCCRfDxPi?=
 =?us-ascii?Q?jdoUWBnbpnuMQGLvixabMG9+lMtRsRrP0Wy31XyKFkBkllDoFRYbfJCFHUe6?=
 =?us-ascii?Q?5I++Sp2RV+wBKk9XFfcWxfTD6atozFlxAxIv8yuQotqG12R/97nfqMgVpQXv?=
 =?us-ascii?Q?7eiBf8xsygWzB2ihQFXSk2pIJURhgKf/vULpUqN2aYbRrHtNTsOZJuwMtpnh?=
 =?us-ascii?Q?CMJ2Yjm3hd1fXqW4GHwAQKVXwluTBr+4HdS3vosD0bxNG+RvxF7Mcotsj3k1?=
 =?us-ascii?Q?Gkm3buleyEw8bOxJN5mzyQzAVZOPmWo9XFwYW/frgtE9EZjIxpQcF50DSgr6?=
 =?us-ascii?Q?pV3baF+QIQgLvlyCn1c3vRb+61385fJOfS3RLgcTqnFALJlbue6/jUDIGD8i?=
 =?us-ascii?Q?2V3zC49dW57Oh7QgcDR8m3yGMXm2m2nJ8vtFEGJAiz/sK+PthISZq9PuogK3?=
 =?us-ascii?Q?QSG9FbF3DDEOc4gWzWEcwiS82blcGEe6ugXUFxOgnB1arfVoz1mkCb9rTvfX?=
 =?us-ascii?Q?IKXn2pag9+mGpiUZQMZcF07aQc+kR+0gpWzoIM83X0BxyksmGFCLryHt4FNg?=
 =?us-ascii?Q?cv1AgixW0jyBELkDn6QV8+RviKpnviNzN0hDxzJNmq7qT4+6Vxe3D9rx6ASq?=
 =?us-ascii?Q?Ak82cck81m5TToOlbrLMreRIPYoS9/FdFUub36aQZT3nAugYVj6nwk5AwFOr?=
 =?us-ascii?Q?m1IuJrHNQLG/apKcMskga4/C+bAHXPdTfD4PnkC+bOxCb7iTWtpp6/eMp44h?=
 =?us-ascii?Q?iJtpYb3LC7kSOERHkMei9FcJiJWVjOBKmdXjMf2LGzLsTqGdQ1UNV4vFszZ2?=
 =?us-ascii?Q?TJy/DgQJLJdlPg5ceaU9KCYAYn7vGWJy5xQ9f9LXwceIOgDR+9okd5dFFlXb?=
 =?us-ascii?Q?9X8nORgnRi46zepA8UIV19G8IMcWbDISr4p//vobAmlySA1Znv7Z5yfusXFT?=
 =?us-ascii?Q?TPrKqI4cxvUKvN4b4FTmeEFxR2+6iM8o0zMxWB8rF6R+EDoeb2JoYJTHytIW?=
 =?us-ascii?Q?hS2TGfzHksHFfGvSsjp7dTbcGFACbFoT5Ole3mRpPqqRyWmmTLvxMSRQDX7X?=
 =?us-ascii?Q?AX0CNSzsjfhiPc97k2oeC3qMh7xxTe87gsCGfMox?=
X-OriginatorOrg: vivo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 54775c97-6e91-44eb-9ea9-08db34c13645
X-MS-Exchange-CrossTenant-AuthSource: SEZPR06MB5269.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Apr 2023 04:01:04.8261 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 923e42dc-48d5-4cbe-b582-1a797a6412ed
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 6ucDf07s76XF6cEjeXMBXJ6Ps0IYPK9GNBn7EZ7JKXaSZPpE6GfUZlTpx/K+PH83nsiJ/bhUXzONwVtv3+PkNw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYZPR06MB4029
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  There is only single instance of these ops, and Jaegeuk point
 out that: Originally this was intended to give a chance to provide other
 allocation option. Anyway, it seems quit hard to do it anymore. 
 Content analysis details:   (-0.2 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [40.107.117.113 listed in wl.mailspike.net]
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
 no trust [40.107.117.113 listed in list.dnswl.org]
 -0.0 SPF_HELO_PASS          SPF: HELO matches SPF record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
X-Headers-End: 1pjXr9-0007Td-Sp
Subject: [f2fs-dev] [PATCH v2] f2fs: remove struct victim_selection
 default_v_ops
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

There is only single instance of these ops, and Jaegeuk point out that:

    Originally this was intended to give a chance to provide other
    allocation option. Anyway, it seems quit hard to do it anymore.

So remove the indirection and call f2fs_get_victim() directly.

Signed-off-by: Yangtao Li <frank.li@vivo.com>
---
v2:
-rename to f2fs_get_victim()
 fs/f2fs/f2fs.h    |  4 ++++
 fs/f2fs/gc.c      | 15 ++++-----------
 fs/f2fs/segment.c |  5 ++---
 fs/f2fs/segment.h |  7 -------
 4 files changed, 10 insertions(+), 21 deletions(-)

diff --git a/fs/f2fs/f2fs.h b/fs/f2fs/f2fs.h
index ea571e602dca..7a09c5228e1b 100644
--- a/fs/f2fs/f2fs.h
+++ b/fs/f2fs/f2fs.h
@@ -3871,6 +3871,10 @@ void f2fs_build_gc_manager(struct f2fs_sb_info *sbi);
 int f2fs_resize_fs(struct f2fs_sb_info *sbi, __u64 block_count);
 int __init f2fs_create_garbage_collection_cache(void);
 void f2fs_destroy_garbage_collection_cache(void);
+/* victim selection function for cleaning and SSR */
+int f2fs_get_victim(struct f2fs_sb_info *sbi, unsigned int *result,
+			int gc_type, int type, char alloc_mode,
+			unsigned long long age);
 
 /*
  * recovery.c
diff --git a/fs/f2fs/gc.c b/fs/f2fs/gc.c
index f1e0e01a5dd1..35e25a2ac4cc 100644
--- a/fs/f2fs/gc.c
+++ b/fs/f2fs/gc.c
@@ -741,9 +741,9 @@ static int f2fs_gc_pinned_control(struct inode *inode, int gc_type,
  * When it is called from SSR segment selection, it finds a segment
  * which has minimum valid blocks and removes it from dirty seglist.
  */
-static int get_victim_by_default(struct f2fs_sb_info *sbi,
-			unsigned int *result, int gc_type, int type,
-			char alloc_mode, unsigned long long age)
+int f2fs_get_victim(struct f2fs_sb_info *sbi, unsigned int *result,
+			int gc_type, int type, char alloc_mode,
+			unsigned long long age)
 {
 	struct dirty_seglist_info *dirty_i = DIRTY_I(sbi);
 	struct sit_info *sm = SIT_I(sbi);
@@ -937,10 +937,6 @@ static int get_victim_by_default(struct f2fs_sb_info *sbi,
 	return ret;
 }
 
-static const struct victim_selection default_v_ops = {
-	.get_victim = get_victim_by_default,
-};
-
 static struct inode *find_gc_inode(struct gc_inode_list *gc_list, nid_t ino)
 {
 	struct inode_entry *ie;
@@ -1671,8 +1667,7 @@ static int __get_victim(struct f2fs_sb_info *sbi, unsigned int *victim,
 	int ret;
 
 	down_write(&sit_i->sentry_lock);
-	ret = DIRTY_I(sbi)->v_ops->get_victim(sbi, victim, gc_type,
-					      NO_CHECK_TYPE, LFS, 0);
+	ret = f2fs_get_victim(sbi, victim, gc_type, NO_CHECK_TYPE, LFS, 0);
 	up_write(&sit_i->sentry_lock);
 	return ret;
 }
@@ -1969,8 +1964,6 @@ static void init_atgc_management(struct f2fs_sb_info *sbi)
 
 void f2fs_build_gc_manager(struct f2fs_sb_info *sbi)
 {
-	DIRTY_I(sbi)->v_ops = &default_v_ops;
-
 	sbi->gc_pin_file_threshold = DEF_GC_FAILED_PINNED_FILES;
 
 	/* give warm/cold data area from slower device */
diff --git a/fs/f2fs/segment.c b/fs/f2fs/segment.c
index cb8aacbc5df6..813b431e60d1 100644
--- a/fs/f2fs/segment.c
+++ b/fs/f2fs/segment.c
@@ -2881,7 +2881,6 @@ static int get_ssr_segment(struct f2fs_sb_info *sbi, int type,
 				int alloc_mode, unsigned long long age)
 {
 	struct curseg_info *curseg = CURSEG_I(sbi, type);
-	const struct victim_selection *v_ops = DIRTY_I(sbi)->v_ops;
 	unsigned segno = NULL_SEGNO;
 	unsigned short seg_type = curseg->seg_type;
 	int i, cnt;
@@ -2890,7 +2889,7 @@ static int get_ssr_segment(struct f2fs_sb_info *sbi, int type,
 	sanity_check_seg_type(sbi, seg_type);
 
 	/* f2fs_need_SSR() already forces to do this */
-	if (!v_ops->get_victim(sbi, &segno, BG_GC, seg_type, alloc_mode, age)) {
+	if (!f2fs_get_victim(sbi, &segno, BG_GC, seg_type, alloc_mode, age)) {
 		curseg->next_segno = segno;
 		return 1;
 	}
@@ -2917,7 +2916,7 @@ static int get_ssr_segment(struct f2fs_sb_info *sbi, int type,
 	for (; cnt-- > 0; reversed ? i-- : i++) {
 		if (i == seg_type)
 			continue;
-		if (!v_ops->get_victim(sbi, &segno, BG_GC, i, alloc_mode, age)) {
+		if (!f2fs_get_victim(sbi, &segno, BG_GC, i, alloc_mode, age)) {
 			curseg->next_segno = segno;
 			return 1;
 		}
diff --git a/fs/f2fs/segment.h b/fs/f2fs/segment.h
index d66c9b636708..89619969ec85 100644
--- a/fs/f2fs/segment.h
+++ b/fs/f2fs/segment.h
@@ -289,7 +289,6 @@ enum dirty_type {
 };
 
 struct dirty_seglist_info {
-	const struct victim_selection *v_ops;	/* victim selction operation */
 	unsigned long *dirty_segmap[NR_DIRTY_TYPE];
 	unsigned long *dirty_secmap;
 	struct mutex seglist_lock;		/* lock for segment bitmaps */
@@ -300,12 +299,6 @@ struct dirty_seglist_info {
 	bool enable_pin_section;		/* enable pinning section */
 };
 
-/* victim selection function for cleaning and SSR */
-struct victim_selection {
-	int (*get_victim)(struct f2fs_sb_info *, unsigned int *,
-					int, int, char, unsigned long long);
-};
-
 /* for active log information */
 struct curseg_info {
 	struct mutex curseg_mutex;		/* lock for consistency */
-- 
2.35.1



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
