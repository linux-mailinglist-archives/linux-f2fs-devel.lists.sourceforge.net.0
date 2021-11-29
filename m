Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 00B4D460C92
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 29 Nov 2021 03:14:23 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.94.2)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1mrWBN-0002fO-OP; Mon, 29 Nov 2021 02:14:17 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <changfengnan@vivo.com>) id 1mrWBL-0002ei-JM
 for linux-f2fs-devel@lists.sourceforge.net; Mon, 29 Nov 2021 02:14:15 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=MIME-Version:Content-Type:Content-Transfer-Encoding
 :Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=AkJiFSExFkh7yZ33IvNHZHgtTYhb8dDdFx6JSVX1JHQ=; b=Ftic3STBcFPPLu7l3qMA4U5+Wj
 H8zP8p0bQZtk4WMKji6ndtpseJBKXtuZE+8a+Dcie4FNh7Ug/iBSu68agF+Gm7ByWqLt9yBfy7so+
 0cjkUVBumqSlkVGqZojU/xZpe4EoAok7elrpMP51bK+B20Qmv5NbxfcaeMqha+a336/c=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:Date:
 Subject:Cc:To:From:Sender:Reply-To:Content-ID:Content-Description:Resent-Date
 :Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=AkJiFSExFkh7yZ33IvNHZHgtTYhb8dDdFx6JSVX1JHQ=; b=N
 vP+7WlheMLLaolXWytQVPxnsWQV+WtVadkFrlx+NtJOYxDpxlWCeySZRBPiGAs0IpIvmtamXDiZRI
 cU8UyZ+P076HjCHc0W/l5bg5LQrI1A+rFUk6B+CcEMQJAR5cV13QV0K828/eZpMRWUWuoRlaru1vu
 B1ZlktOIDsFADsow=;
Received: from mail-eopbgr1300101.outbound.protection.outlook.com
 ([40.107.130.101] helo=APC01-HK2-obe.outbound.protection.outlook.com)
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.3)
 id 1mrWBG-0001Kz-CY
 for linux-f2fs-devel@lists.sourceforge.net; Mon, 29 Nov 2021 02:14:15 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=jZzwHMyLe4R38F7PIHYUiSMB6ofzJM8uJm5OaKgxD5gk72HM0Qb7aOq8YLl3/xihPzM+RT8RnoMVSWjrXRG9/hqq0OpSf6CtOfFXeLDdiCYlRpW6SBPc/f4FvnKNMM8nUHD+BBPFoX7A2xkRkt+Xn64rGAGwSlGrjX+nS+87plEue/iYK7fuYR+TcjFA1QrzQZhUcHpI1VSoPeGr42airIe4Kj9V1nL5kFWqnGrFOG8nTQ8inIuyp7ZISlJisPoWhYHtJ5fkcZNfxSe5L1boTeEUsozxrK102wkpRuJYYR1tZOsU+EyhNi/pXxrLwKf7dDF8uzD1qMXO7g2Kk3YUBw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=AkJiFSExFkh7yZ33IvNHZHgtTYhb8dDdFx6JSVX1JHQ=;
 b=P29aUQSumkzD2N5p4fadgatVvYtJUZMcZOeJ10EowKzQnEs3rT+BRub2J2TG27E647RyuSrv5qa/5RsthGg8NtXG8zJ2DIftpK/TM/7ice3dOY0x4CZ6AELCmT/IdFekj5RAV9knlK12AQ01ZMFvDPZNfZxOgpNh+nWMHkYMUONtoiTZbbIFCocctZRzmyDiGOGCrBpOm5I018k+EQBaPGaATXnIOp7WypL0+l9T/oClDAakDxBm6dzSeGIhscwjE9evJ7TUmVdnUZc/aNcUdQbZXpCdf1p/PHGHF5RUQXSDpXWOsR4RtkuabYPMcRvbn+j0uoaNUY1ZcL/+CQQISw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vivo.com; dmarc=pass action=none header.from=vivo.com;
 dkim=pass header.d=vivo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vivo0.onmicrosoft.com; 
 s=selector2-vivo0-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=AkJiFSExFkh7yZ33IvNHZHgtTYhb8dDdFx6JSVX1JHQ=;
 b=gjeYRfkyJMGptLuY3yj1mcFaUbrBbKUDwCPl0i1sX+aA0qO3M2p0h4Td/v5w2HxCV1kdnRhUzlLZBrrTFgZQUgl5blnV3tKMeTNx3sLlBXxo68Rt9/wV0dEN2DL88kdE6mwOuGR7ozL4w8bvT61JMpgsJHtwlKfu4PRsy26o6bY=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=vivo.com;
Received: from KL1PR0601MB4003.apcprd06.prod.outlook.com (2603:1096:820:26::6)
 by KL1PR0601MB3767.apcprd06.prod.outlook.com (2603:1096:820:17::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4734.23; Mon, 29 Nov
 2021 02:13:53 +0000
Received: from KL1PR0601MB4003.apcprd06.prod.outlook.com
 ([fe80::2598:abcb:1fca:a01a]) by KL1PR0601MB4003.apcprd06.prod.outlook.com
 ([fe80::2598:abcb:1fca:a01a%5]) with mapi id 15.20.4734.024; Mon, 29 Nov 2021
 02:13:52 +0000
From: Fengnan Chang <changfengnan@vivo.com>
To: jaegeuk@kernel.org,
	chao@kernel.org
Date: Mon, 29 Nov 2021 10:13:40 +0800
Message-Id: <20211129021341.162422-1-changfengnan@vivo.com>
X-Mailer: git-send-email 2.32.0
X-ClientProxiedBy: HK2PR06CA0017.apcprd06.prod.outlook.com
 (2603:1096:202:2e::29) To KL1PR0601MB4003.apcprd06.prod.outlook.com
 (2603:1096:820:26::6)
MIME-Version: 1.0
Received: from comdg01144017.vivo.xyz (203.90.234.88) by
 HK2PR06CA0017.apcprd06.prod.outlook.com (2603:1096:202:2e::29) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id
 15.20.4734.20 via Frontend Transport; Mon, 29 Nov 2021 02:13:50 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 4e3879a0-f730-46da-e1ea-08d9b2dde2b5
X-MS-TrafficTypeDiagnostic: KL1PR0601MB3767:
X-Microsoft-Antispam-PRVS: <KL1PR0601MB37673995DA2A1ABB5F109B9CBB669@KL1PR0601MB3767.apcprd06.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:3826;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: YE7gRchGXbBtkx6NrdMFAXVDHybfeF/F1p0drEeeb60mr127fXjUWdWoGnVlObCHbgGiexRzwkti1g5FwtVM/yJ+J+hO3pMFqOmxR0/5wxvE7J0a2kpbwKqBfFbZ3wwcp7QG0jBP8k4+K46Bdd531Vq9mYcOl35bxmrUBGTmEVC5GXIxe3LstQdqcGpEVS3UbtqrwgJwA9io7uBYitvdjw+BQUOydEhCw0q/Bn/xCkHz0lMae8U3gyHy7jUVNVeNVSE8h0C2nG7W+NL500+mJOuOVqzbgysuzbCF0Ijl8NgVl66ZWLn4UR0JpJjw+TUGKCQrm121Pj1NbtQDawWjAVm9GhRtHVgFl2FDhvACNEvszOzha4xwVOS34DKCHjfmP3ML0Gp2jLxY4RDvWHyg9Byu56Cv2QOFAeEBnxVLoEZpT2JHZqhG6CnzCgXBauYYIIWkadjQy7CLQ+Vm2/5TlSUI6sd6k75gH9MWB1dazQiYh4zfr5fgb8MyE5uuVxgWIOUpydWPshTWPjKzc3jxFCHWaogohoqSmvaEwXNqoftxXYpG+LsL/zFD1EP5q8Lta+tZxcokzQYDTI03h1vhXUmonVisMBmsPqJvShlIx5AsM/ssyPBbSiC3H37sRhOlbn5uZ7l1VbOiDyxiN8SzNC3sKHqYs0ZNGBn4YpphA0m0H3LCxvJk1p3q7t3ag/++GYOfSOhAQkGgVghI3QuO4fn8qykn19tyDEapcEM9MkY=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:KL1PR0601MB4003.apcprd06.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(6666004)(316002)(6512007)(6486002)(36756003)(83380400001)(2616005)(956004)(186003)(107886003)(4744005)(26005)(38350700002)(6506007)(52116002)(38100700002)(2906002)(4326008)(8936002)(86362001)(66556008)(66946007)(66476007)(1076003)(5660300002)(8676002)(508600001)(182500001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?w2i/6pbngBBjAC4DJBS0vbX41LGCC6cHSGv3Rfw07Gq/QdTk7pYoCDSTDmYV?=
 =?us-ascii?Q?Kjnc5JiEAbxe/kTc+e5jT6GOZxrXjoU58cLz1mqQM7163hebffwrzUc35ucO?=
 =?us-ascii?Q?UhzZDvzRftRfHhfM/IRTdw9Tx+6Darrc2Z6eE6MSpKMs8ObJJ1kku98rFeJc?=
 =?us-ascii?Q?FQfFMLqcctzQ/ekVDqeLNyaKtIHV7D5FTcgYetrHhHURpoV324uwTvH6zfw7?=
 =?us-ascii?Q?X3pnM1TuT7YniqHP/opAAacoEFkx1dT/xla6zuNwqPe6LbwS39L3PSclWZc+?=
 =?us-ascii?Q?ROB8TeNKG23e6Yn468h0NnaXtpY2D1GXYQFlwVWZ1D6OvbmmDsDczMdp4Ja+?=
 =?us-ascii?Q?LlXR5vaOlXtH0P8YYr9ORwjuM8jE7sVUY+QUeXBtIFonnoXOJzeaKW0U3epG?=
 =?us-ascii?Q?5984vx+o83AXAVeNo5xh01CmebHlVBdzUnngq33/MM3pAJiLFrKVdwyr43sp?=
 =?us-ascii?Q?M7kO4YiEfP5QXHo+xk4KfBLzijhDIlgZlr9sujinPgjaFVU7FrYXxVkhINhC?=
 =?us-ascii?Q?gPezi382uQrw2vBVkR7KtJ6uF8Zr3J/hHjBPoNQPgJ5QUkg1E5p0CeYYs+iv?=
 =?us-ascii?Q?E2WAq5tjaQsdcmIVIn+oMEb0px63rvgukJCzbJAdaShmhAoWMNPvm944Gfs2?=
 =?us-ascii?Q?97J7LutRYUfc4n08IlsukIMeiNDEc6BkxiVSfHcSV2t8xv9JeXNrBkykRXnz?=
 =?us-ascii?Q?S1+psAsnJkkoEH35p1GkJaluzqpNX1WbXpvVjK51s08qwMQ6Yg1e8/KZ06s1?=
 =?us-ascii?Q?3bFAxFYl9DGo2y99kfQdYF6jntJMUtZVNkRbYWs/4k1UbCVrg/VSlGCsVv0L?=
 =?us-ascii?Q?3KGqwcmcpOg/qSDeYRy+RI9pn+OKQ1XuUJfFUDzCHBhQ7vaNtOEXs3gVQ9Em?=
 =?us-ascii?Q?DLcOPW4I0sXzbaDdqgtXpbQi2kjFQKCwzBPiOkrYR7Mq+I1QRKsOvhLXQSJJ?=
 =?us-ascii?Q?AqTS7G7wkySuNKRJhWFA00HEdfHSBz3O/0XtrTdep2XPd2J8aDOgkiNjas1a?=
 =?us-ascii?Q?/jrJO3R6Ai8GGRXhjqU2Pc3YffnFRuby3e5qaUAaqi8VPNk3jtJNJHvWWHOi?=
 =?us-ascii?Q?ecd5imKxp+i35gWqAGteMJoiydaqF6zj1vWmPew+Gkbd3Ri7azMP5KN8UfO8?=
 =?us-ascii?Q?jo8EDBa2boJJ0l/Ug5CAtgqWmXWzT9FH9XX5S9qZUBs3A+5LH9L3q1pvVgUE?=
 =?us-ascii?Q?7cDXjx+xgt243r+E0zm/lOTeoYbg+7AOB07pXYCd9nJR1fAfALljuoVjdmyK?=
 =?us-ascii?Q?b/o5Koj8NPl+/QscvBj19nx2RSgY4JMKD13V0xiZ/zfQO8eayvdEml+SnJpP?=
 =?us-ascii?Q?IVhesd0FpCi/zGfUGonzTncIkgXbCHFHDUVrdMFPEUlX+kwwru8sIcMNmHiI?=
 =?us-ascii?Q?+8NOxMRePaRgNaVXb80cLwcUA3Z/B8hE03+M16ZC9CuYdSWmXXAQ6Ph8nSnU?=
 =?us-ascii?Q?wQys4MZyUKDQfMfhVnJo6v/gPTj4jfbDjJlTYXVRu/mcAbre+R3SMbgrLNu6?=
 =?us-ascii?Q?W5iUkasWgtC7qnN7nSlt/hVH/5fsGFY1fUvqSAISi9dKeldnzPmGt6XJNmQ6?=
 =?us-ascii?Q?03D25H6W9WTGsoG7mN6zyPVNI7H9rLCYiFO/0WqnFHAKHnPaEXW6dKhDv41b?=
 =?us-ascii?Q?efuyUzq9N7cTdiwGoKrv0iE=3D?=
X-OriginatorOrg: vivo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4e3879a0-f730-46da-e1ea-08d9b2dde2b5
X-MS-Exchange-CrossTenant-AuthSource: KL1PR0601MB4003.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Nov 2021 02:13:51.4277 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 923e42dc-48d5-4cbe-b582-1a797a6412ed
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: XyqGMcIIpKGqFfKgQDh50sEBImbpEavUl/CgOC6Z6gHM8IQyNwTF4Qc/Z7LaE4q5JCLeFWvJB7iyMrF8otKjWw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: KL1PR0601MB3767
X-Spam-Score: -0.0 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  Since compress inode not a regular file,
 generic_error_remove_page
 in f2fs_invalidate_compress_pages will always be failed, set compress inode
 as a regular file to fix it. Fixes: 6ce19aff0b8c ("f2fs: compress: add
 compress_inode
 to cache compressed blocks") Signed-off-by: Fengnan Chang
 <changfengnan@vivo.com>
 Reviewed-by: Chao Yu <chao@kernel.org> --- fs/f2fs/inode.c | [...] 
 Content analysis details:   (-0.0 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [40.107.130.101 listed in wl.mailspike.net]
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
 no trust [40.107.130.101 listed in list.dnswl.org]
 -0.0 SPF_HELO_PASS          SPF: HELO matches SPF record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid 0.0 MSGID_FROM_MTA_HEADER  Message-Id was added by a relay
X-Headers-End: 1mrWBG-0001Kz-CY
Subject: [f2fs-dev] [PATCH v3 1/2] f2fs: fix remove page failed in
 invalidate compress pages
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
Cc: Fengnan Chang <changfengnan@vivo.com>,
 linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

Since compress inode not a regular file, generic_error_remove_page in
f2fs_invalidate_compress_pages will always be failed, set compress
inode as a regular file to fix it.

Fixes: 6ce19aff0b8c ("f2fs: compress: add compress_inode to cache compressed
blocks")
Signed-off-by: Fengnan Chang <changfengnan@vivo.com>
Reviewed-by: Chao Yu <chao@kernel.org>
---
 fs/f2fs/inode.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/fs/f2fs/inode.c b/fs/f2fs/inode.c
index 0f8b2df3e1e0..1db7823d5a13 100644
--- a/fs/f2fs/inode.c
+++ b/fs/f2fs/inode.c
@@ -516,6 +516,11 @@ struct inode *f2fs_iget(struct super_block *sb, unsigned long ino)
 	} else if (ino == F2FS_COMPRESS_INO(sbi)) {
 #ifdef CONFIG_F2FS_FS_COMPRESSION
 		inode->i_mapping->a_ops = &f2fs_compress_aops;
+		/*
+		 * generic_error_remove_page only truncates pages of regular
+		 * inode
+		 */
+		inode->i_mode |= S_IFREG;
 #endif
 		mapping_set_gfp_mask(inode->i_mapping,
 			GFP_NOFS | __GFP_HIGHMEM | __GFP_MOVABLE);
-- 
2.32.0



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
