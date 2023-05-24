Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 91DB170EB78
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 24 May 2023 04:43:05 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1q1eSr-0000Pu-6j;
	Wed, 24 May 2023 02:43:01 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <guochunhai@vivo.com>) id 1q1eSo-0000Pn-1R
 for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 24 May 2023 02:42:58 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=MIME-Version:Content-Type:Content-Transfer-Encoding
 :Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=JUNuGpXUhvqoFOTYCoO8T+lVjTTSsNM4w0CTVeymQQw=; b=cDrop9+WHVyf1PhejyAvPQy5D1
 OBtQX8fYPoNHjtOp85hrSJJMOxPNYAyOAa6YGa/YT4cRWNkwWQTruspaOymVYUEV1wIWzT6OoE1Qx
 otf9Jzn0QCFqnYGV/3FPwcQGjjtoaand/PAKT9oPZnEoqhBJ/Co9+j2pzgRddkRTvZhs=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:Date:
 Subject:Cc:To:From:Sender:Reply-To:Content-ID:Content-Description:Resent-Date
 :Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=JUNuGpXUhvqoFOTYCoO8T+lVjTTSsNM4w0CTVeymQQw=; b=J
 ryEmEZJ3YTmez+pnwX3wFqgPaeQQiPLr7JIGPOmKOnU03Tp/NgWQ7UgudlfduOzHCqxigpfxmlNT2
 p2HjtgRfNyMCk99h7kEYZTzajUTCi/yiFfu4a22JglUo8volY4R9QGyZqwtwXQUPLatkXny41f7dF
 wYNCUmpSjqbe8MXI=;
Received: from mail-psaapc01on2124.outbound.protection.outlook.com
 ([40.107.255.124] helo=APC01-PSA-obe.outbound.protection.outlook.com)
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1q1eSj-0000lH-Jf for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 24 May 2023 02:42:58 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=XyMxc3QnX0IlUTMKcfRx+ZSRvc+fm89kb84xhdwmpUIJsHBNY/A8Vxlqnsn+sbcfTlaf3ltcsy8Y+fCy8/6Wu2wzbD3lRyma5HTqIVR65mU4I6qmPl5oBKP6KTW5W5HxjJvoU/gCqDsiR9seK6lX0LSMTDz8JmcvHOFSxaYawg1pJcgMULAToCN3uhOfFP1ElzeSu0w4FD/1UuyETcP4MyYUv/pQxWs8pr451bEwdbkg8ZJEuOdvwR37PlOz9/FTUpfd+NwgrcPt7fkQulcU/j680RNjOh84m522aK/nrv0hapX8ww1xpgHJ4koI3EP14J1XDhMuYGk1bapfNZlYuw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=JUNuGpXUhvqoFOTYCoO8T+lVjTTSsNM4w0CTVeymQQw=;
 b=V0SuJEefOsqDDTOCin0OYw+ZHO+MgNtUoyphfRWuMLFcyAshK7MvPO7cMrtdn82Dx+yhlgcgY9PVkhNjU294S0XtFUufe1APUxXELeZ+BhVgd66vNVzuk4qX6FQ4fPYghSbAWRa/D5Ma/B0zySfKSiintT4m4hQM30bqqoVoqSN5ywxN5o2Miez9NK7HRIOB15otmbxKMHlMYPQrN9yBiPqhVqKwV43Lgb+HLTXRWPxPTQ+YHX2kiwRZnj2FtrpNZWRhJVcdfUVaU9fWWx7VNSVIeh2yEUJjRQXe6oz/YB+VluluhAPftiprLwllAag8AM57fK2rI/q9rRhm979toA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vivo.com; dmarc=pass action=none header.from=vivo.com;
 dkim=pass header.d=vivo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vivo.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JUNuGpXUhvqoFOTYCoO8T+lVjTTSsNM4w0CTVeymQQw=;
 b=ciwyy3epaVKJic6jmUp2Rm/EJDX2WxwZ2L6qi/Gi4qQxI6bDewl9nXGbwKv2G2TDxFwgkXG3Y2CREGv9/I3XnQkLleuvWnFznbgk56Or1i1fLgNC3uzClN9Nxn8QcyroxGTeQ8g/KnRAGcW3KQV+hCmWZc5pCCejqUaDRo718LdaZuXj2FjWe6fT0M4qIez7AzIIAuoj0f7ZhHj/7m2w9WciDY5hw9Qjq2/Ka6O3YvlkQ+Dcz6CtSjRUbRFyG+V9AHRwCuNqT2PitATgux17xk6TP+99FpKuSHoSS9SILAOdsLRshS5vkUX897Ol9+nUr52k2+29bj7zLQJ9mDI6Rg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=vivo.com;
Received: from TY2PR06MB3342.apcprd06.prod.outlook.com (2603:1096:404:fb::23)
 by SI2PR06MB4060.apcprd06.prod.outlook.com (2603:1096:4:f8::8) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6433.15; Wed, 24 May 2023 02:42:40 +0000
Received: from TY2PR06MB3342.apcprd06.prod.outlook.com
 ([fe80::1e05:3b1e:35f9:87cd]) by TY2PR06MB3342.apcprd06.prod.outlook.com
 ([fe80::1e05:3b1e:35f9:87cd%4]) with mapi id 15.20.6411.029; Wed, 24 May 2023
 02:42:40 +0000
To: jaegeuk@kernel.org
Date: Wed, 24 May 2023 10:42:04 +0800
Message-Id: <20230524024204.13694-1-guochunhai@vivo.com>
X-Mailer: git-send-email 2.39.0
X-ClientProxiedBy: SI2PR02CA0025.apcprd02.prod.outlook.com
 (2603:1096:4:195::21) To TY2PR06MB3342.apcprd06.prod.outlook.com
 (2603:1096:404:fb::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TY2PR06MB3342:EE_|SI2PR06MB4060:EE_
X-MS-Office365-Filtering-Correlation-Id: 5de90240-1b70-4fc4-d305-08db5c008b1a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: PGkcGJI4XEB+tRnXm3HfYgyVDut8X9AuzEm833hmu2J41yygTv3w22rvEY8Q1hQ/phUPOlHMM/nmWeQrS4uSEHV5vfbFAMthBrB6xMIdea6Prs9R0dE3UfzLPhGG2zjT+WtJGUuLkI5EcfPFMKud89iZYvjky8lXUYtM5srY5NI8vwECNfnVkS0IZmtUl7GdbU3ycJepezbQsb8eYCKE4pLCuLYEhCIf6dn95xNf7kpy4caUiO4nIyqPo4Gt8QRBncwmR3y1PI3a4WMG9rsPZGU/rtiWFpmE051rF2ERqm6KNKRNQmpssbjXB5p6rs32/D9yMSO3vZYYTIMBQ4JsJAaMFMvJeQV9JbLcWlUMSqdcZ3A0Agbz/o9uQihmPpy8Eti7/GcJ6dzQoZfvAk9JyKYbCy+DV7pPysAUimL3IokAG1D2xSjablrI5rGZCw15Jiyr0Rb2ITpnYhD+4KQnFpG3Kpnj5z2Xz1oattJpYCgcLWKdM3vllj0ZSrWK6kmqATkUrkW0m1f3rmh+5CnDDMyNedlCW5zzGsXsEa3TnJ2m0ID0+U+YKcyVSiuDVhYiYuVIzPYc6T2MDijZTRoLbk3Hy7QAo4AI0vVQhRHdywg2GIYHwmY7gBpYrrDecdRM
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:TY2PR06MB3342.apcprd06.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(4636009)(366004)(136003)(376002)(396003)(346002)(39860400002)(451199021)(6666004)(66476007)(66946007)(66556008)(4326008)(6916009)(107886003)(6506007)(1076003)(6512007)(26005)(316002)(52116002)(41300700001)(6486002)(478600001)(8676002)(8936002)(5660300002)(83380400001)(86362001)(36756003)(2616005)(38100700002)(38350700002)(186003)(2906002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?DJdb3F6g6JcXr5COfOWHmkrsgXCF5qOqXb4cmPscUP2i0AONfXkwxEJDI4+T?=
 =?us-ascii?Q?x2p30he3gPWCq2AkrFzPF7eGlzWAc0BhmRhvrcgZYfouoxy9F1iKiqbnUvyd?=
 =?us-ascii?Q?79lZoNxPLh8INNgMU6BT4PYdYFuAFLh3bzfRTanhOBiMQ8SbZmiyUTbBKfea?=
 =?us-ascii?Q?+RKfI+2nFFJB2AIJLHvBIaxs+NximS4cjgUNku0Fx3eFhA20Yzj2I+1BYRaW?=
 =?us-ascii?Q?Ei0DhzMs0IFK7P6PkZpj0sV2GPGIAr1UD4KyK/Dau7jGwcR2KaiID7P0gZ9z?=
 =?us-ascii?Q?1eca5J1qOZg54K1sqAS7zzEBmH7bWCM5W6mtY/VnzJA1EtYHXCA/7qUCG9hj?=
 =?us-ascii?Q?bioXmCkx0f3z1xm288Fns0rKkghAkpSAoGv9OfN+6YhLRW08dTmE+SHhQxTH?=
 =?us-ascii?Q?ELeZLx+pVBYkvdzSF3Lp1yNhNt1J3G1jboOh0DlkTTMF9UlJ+BZAJp3lMWhC?=
 =?us-ascii?Q?oQYWnSx5oY943R9o+9ettyaucpgw+/hclWwzljknewDaUe2zxYw+/VeVi2Ny?=
 =?us-ascii?Q?H1EUoMUwzoOSxchUXCxy+/4jD4xY7TdcJsmr2Vz0h9zTJX4hSdoUemrgXIau?=
 =?us-ascii?Q?fC16d5Qn9/DJK1diuTY/fRc+KhajoJn5niW5Kuej3GR0DVTMuo18VMwebY6U?=
 =?us-ascii?Q?IFAgUMIOcKLD7/HZdBYSUCpf3XHA+5hxqOdVyoPI5qTltKN/fucdsW7WjCtt?=
 =?us-ascii?Q?+Ac9F67nOcT4C9k+s7swfRM9AzHkt6qJK6gB/t9QAvNQwVemxXkmrAwk0VPM?=
 =?us-ascii?Q?isfYc5BVY0hq3ia0e2703WBs6jlEYWVQVio4vDRTdMkFOCKlqk0LXvYW+REY?=
 =?us-ascii?Q?VucW40n6x7tIfyBFf8wNP87NkC5d0rsLhBPdUm67RnocGAq/pnm+ABqvKyFa?=
 =?us-ascii?Q?wyS/nTRz4Nk23aEzKAFjrBisg9Z76DjIgoi2yTw2Ur7c7vAMNmfQkYD9WqlZ?=
 =?us-ascii?Q?shdb+KE6Cu5qhuxtt165CfIGmevzib4r7Mna5Vae2zF8njPsRC5GnTzJeaVi?=
 =?us-ascii?Q?2GdvI/2uFD1cYwkd4XrljJu9vbrDTD0lvp3CNDn8/efKFgoFAXXOjvKeYkPz?=
 =?us-ascii?Q?EtyXAppJPoABO8T/V8fqA+S7HlUKjxs4JkSQZ2L8buP+ejUNw7SLnL+oHm5w?=
 =?us-ascii?Q?WPV3G1nRENhYxdV4V/uwqZufZ76loID143j0huxe6kUB70miMz2EtmkfUpF7?=
 =?us-ascii?Q?Vf8ub+HQ2CqUxL2C4xTzMKTxbkChfL1E9VjSR97yEhin7c6SyjPB/U4UStX6?=
 =?us-ascii?Q?5FGZpcMFUAj4gByLlSS7yB5z40kE1MKEOxf9Qu9fqdBsOs2wIyxW9IcFn726?=
 =?us-ascii?Q?3e0p64nSx/ISXXcvJuWSvmfTNnD8Bttnpn5vQuuDAZ0AXkcDRjzd4GYGAjaR?=
 =?us-ascii?Q?k5Y314m9EbygaeAgdNkpwXdKe5LkNj8ZVae+oWpdxpBRB8raGpX5sE9ZVIy2?=
 =?us-ascii?Q?0MyYp8Sr4MxmP7psoTFFWmOTNluo5xjPAObV7v8w6sHG2ZuqApc4T1qjg8F5?=
 =?us-ascii?Q?RNGsrEFmjjcbXCkIhwx4neqOru944ABa1PLJ6Aq3YhEa2fVmqVENvSLAhJNp?=
 =?us-ascii?Q?KCzMbJtfC/PrcEHZraMjqgUdjryrxww67s9V/EdJ?=
X-OriginatorOrg: vivo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5de90240-1b70-4fc4-d305-08db5c008b1a
X-MS-Exchange-CrossTenant-AuthSource: TY2PR06MB3342.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 May 2023 02:42:40.7998 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 923e42dc-48d5-4cbe-b582-1a797a6412ed
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: dJFnAP8rTtRDShGB0mMUFrn5I37zFi15T8ucBb9f2a/UBFV+iH0N9357y++l+Zvvgns3iiZZEk2qNvjwYqnQaA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SI2PR06MB4060
X-Spam-Score: 1.1 (+)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: find_fsync_inode() detect the looped node chain by comparing
 the loop counter with free blocks. While it may take tens of seconds to quit
 when the free blocks are large enough. We can use Floyd's cycl [...] 
 Content analysis details:   (1.1 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 1.3 RCVD_IN_VALIDITY_RPBL  RBL: Relay in Validity RPBL,
 https://senderscore.org/blocklistlookup/
 [40.107.255.124 listed in bl.score.senderscore.com]
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
 no trust [40.107.255.124 listed in list.dnswl.org]
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [40.107.255.124 listed in wl.mailspike.net]
 -0.0 SPF_HELO_PASS          SPF: HELO matches SPF record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.0 T_SCC_BODY_TEXT_LINE   No description available.
X-Headers-End: 1q1eSj-0000lH-Jf
Subject: [f2fs-dev] [PATCH v8] fsck.f2fs: Detect and fix looped node chain
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
Cc: Chunhai Guo <guochunhai@vivo.com>, linux-f2fs-devel@lists.sourceforge.net,
 frank.li@vivo.com
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
v7 -> v8 : Reformat the code to reduce indention.
v6 -> v7 : Correct logic error to handle is_detecting return by
	find_node_blk_fast().
v5 -> v6 : Simplify the code by removing unnecessary retry logic.
v4 -> v5 : Use IS_INODE() to make the code more clear.
v3 -> v4 : Set c.bug_on with ASSERT_MSG() when issue is detected and fix
	it only if c.fix_on is 1.
v2 -> v3 : Write inode with write_inode() to avoid chksum being broken.
v1 -> v2 : Fix looped node chain directly after it is detected.
---
 fsck/mount.c | 127 +++++++++++++++++++++++++++++++++++++++++++++------
 1 file changed, 112 insertions(+), 15 deletions(-)

diff --git a/fsck/mount.c b/fsck/mount.c
index 4c7488840c7c..9d6a222a055c 100644
--- a/fsck/mount.c
+++ b/fsck/mount.c
@@ -3518,22 +3518,90 @@ static void destroy_fsync_dnodes(struct list_head *head)
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
+	if (IS_INODE(node_blk))
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
 	/* get node pages in the current segment */
 	curseg = CURSEG_I(sbi, CURSEG_WARM_NODE);
 	blkaddr = NEXT_FREE_BLKADDR(sbi, curseg);
-
-	node_blk = calloc(F2FS_BLKSIZE, 1);
-	ASSERT(node_blk);
+	blkaddr_fast = blkaddr;
 
 	while (1) {
 		struct fsync_inode_entry *entry;
@@ -3564,19 +3632,48 @@ static int find_fsync_inode(struct f2fs_sb_info *sbi, struct list_head *head)
 		if (IS_INODE(node_blk) && is_dent_dnode(node_blk))
 			entry->last_dentry = blkaddr;
 next:
-		/* sanity check in order to detect looped node chain */
-		if (++loop_cnt >= free_blocks ||
-			blkaddr == next_blkaddr_of_node(node_blk)) {
-			MSG(0, "\tdetect looped node chain, blkaddr:%u, next:%u\n",
-				    blkaddr,
-				    next_blkaddr_of_node(node_blk));
+		blkaddr = next_blkaddr_of_node(node_blk);
+
+		/* Below we will detect looped node chain with Floyd's cycle
+		 * detection algorithm.
+		 */
+		if (!is_detecting)
+			continue;
+
+		err = find_node_blk_fast(sbi, &blkaddr_fast,
+				node_blk_fast, &is_detecting);
+		if (err)
+			break;
+
+		if (!is_detecting)
+			continue;
+
+		if (blkaddr_fast != blkaddr)
+			continue;
+
+		ASSERT_MSG("\tdetect looped node chain, blkaddr:%u\n",
+				blkaddr);
+
+		if (!c.fix_on) {
 			err = -1;
 			break;
 		}
 
-		blkaddr = next_blkaddr_of_node(node_blk);
+		err = loop_node_chain_fix(sbi,
+				NEXT_FREE_BLKADDR(sbi, curseg),
+				node_blk_fast, blkaddr, node_blk);
+		if (err)
+			break;
+
+		/* Since we call get_fsync_inode() to ensure there are no
+		 * duplicate inodes in the inode_list even if there are
+		 * duplicate blkaddr, we can continue running after fixing the
+		 * looped node chain.
+		 */
+		is_detecting = false;
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
