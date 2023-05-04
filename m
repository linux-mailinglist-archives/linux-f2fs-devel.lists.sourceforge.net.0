Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 4872F6F7229
	for <lists+linux-f2fs-devel@lfdr.de>; Thu,  4 May 2023 20:53:17 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1pue4m-0005CF-B0;
	Thu, 04 May 2023 18:53:12 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <frank.li@vivo.com>) id 1pue4l-0005C8-1l
 for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 04 May 2023 18:53:11 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=MIME-Version:Content-Type:Content-Transfer-Encoding
 :Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=Y+maXVj5Eah4Gu1tQX3jn9hHsB2QLFckWniu1GfK1s0=; b=Pq+rwqtFAAhKQTTsqTn9YWj/Up
 foFNHm3NV34VTf573DFEjJjAB9vxwcGKMLj9KlqT8AOd8UthDsxswwndmG05nKmZ2p1igLODPJj7B
 E4x5kEVf3N+AOVsgqNVKnWyHX6Jxse87XLVdDUgvRVMutJmbnt1Rb4eb9usbJY8xYBYs=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:Date:
 Subject:Cc:To:From:Sender:Reply-To:Content-ID:Content-Description:Resent-Date
 :Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=Y+maXVj5Eah4Gu1tQX3jn9hHsB2QLFckWniu1GfK1s0=; b=n
 LdiiJyMHBk0n3jp93b6Mnkx32SxmMaW3RaYaMRO5k2t6xRhl0uny83MXdj84EdrnWsm15q/3KImnk
 A7LjQvAGG1WG0H2Ta+SX5qyFAArSSqSwoj5LvMtNq2UQMW2i7e9w+35gBTFy7f7X9/ikLxHc2Ujrt
 v+faIQFmMyyPklRg=;
Received: from mail-sgaapc01on2099.outbound.protection.outlook.com
 ([40.107.215.99] helo=APC01-SG2-obe.outbound.protection.outlook.com)
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1pue4e-0002e0-QN for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 04 May 2023 18:53:10 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=nlrWzAr62dkeq+XM2tLJ3j4pU5WBOjhNeYe1KFLDi6yvhF5DR1CpsZM/v0prJX5Z8DMCI6YM9HJD6idYCNPqh1ZD3RII1QWM6WzlKqOeecA2FDi9di4iVymyOnv631ngShucWmBew9T7xhUqaSRgT2Za9olp+dDWKzl/w6eMuZeigW9Pmu5KUsojAW39Q87v1o1Q0XueTttPwmBdIqkoAeLRE/vhSoMW/RYj78KnzqJs/AKcOjb2+egiI3eKE/HCkX/xi/gBQepQ2qY19RgFTu8ZtLIbS93I7UAlcQ5JE9t5r4MS5hE/CKIKtqFehPeRaN6W/fuf8bG91bMneZgr0A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Y+maXVj5Eah4Gu1tQX3jn9hHsB2QLFckWniu1GfK1s0=;
 b=jdX3ZFWbaYrVYkcm1b8lAhI2AlV58Q+UaqMqRBCo95dnErwpmGY58pwdA5gMI718VicPHECw7F9a3jFHypBpg5SDLs61+1hVtXSJ44TqIRSl7NWqeyc/eBbrpcV+hrVGYClICgkpBF5DsdD0kICFtqUqXpr7fGgBXlamJSqh4de3JtbMGEgQPdFoBt67Pv88Ng05ZDrpsQU0tWXvXO/TXw6smSpLddTG/9pzLPLLeHR/tIOIUSseHb700b02Y74ekHvYlTfqWwtZVsFGHmTHgN/MFM9oZu4QI8uDK8G/7smyP9YkBu3KMGH+6+pUmrU8pdNOLZqtr0OnqhajRQoJyQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vivo.com; dmarc=pass action=none header.from=vivo.com;
 dkim=pass header.d=vivo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vivo.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Y+maXVj5Eah4Gu1tQX3jn9hHsB2QLFckWniu1GfK1s0=;
 b=WjZUuvQ6YUUO6zpdIp2wU0PWLMtwgxCj1aawJgc0AYmgZGPdZidflI1HV0rM9vpU5WOdbosHqur8VBBqMelu+4fi6XZ47VNanPtPprYSnwbFfKi/gJkL4J4ox4LzSJ1/4/HRBJKGgqKIBwqtwg2qENP0oYNlpSufYGJM2YeuK1g9QXoQvu6I5NeA7vQaxboXz9CeR7Q0y3lxvs3/7FAwZsqvMVO29gc28rMg/Ebrh26+aQVEla39TvYv+uieyGJUF0KWxaJnEla3wfb3Mh2NtoaSUYwd9nFsOX6wSpAL69y6QypCHctxIrMGD3V0f8k8b+SuTRclLvC1QyJvtaJHXg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=vivo.com;
Received: from SEZPR06MB5269.apcprd06.prod.outlook.com (2603:1096:101:78::6)
 by KL1PR0601MB4162.apcprd06.prod.outlook.com (2603:1096:820:2b::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6363.26; Thu, 4 May
 2023 18:52:54 +0000
Received: from SEZPR06MB5269.apcprd06.prod.outlook.com
 ([fe80::76d6:4828:7e80:2965]) by SEZPR06MB5269.apcprd06.prod.outlook.com
 ([fe80::76d6:4828:7e80:2965%7]) with mapi id 15.20.6363.021; Thu, 4 May 2023
 18:52:53 +0000
To: Jaegeuk Kim <jaegeuk@kernel.org>,
	Chao Yu <chao@kernel.org>
Date: Fri,  5 May 2023 02:52:38 +0800
Message-Id: <20230504185238.19488-1-frank.li@vivo.com>
X-Mailer: git-send-email 2.39.0
X-ClientProxiedBy: SG2P153CA0030.APCP153.PROD.OUTLOOK.COM (2603:1096:4:c7::17)
 To SEZPR06MB5269.apcprd06.prod.outlook.com
 (2603:1096:101:78::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SEZPR06MB5269:EE_|KL1PR0601MB4162:EE_
X-MS-Office365-Filtering-Correlation-Id: 4762bb70-cc00-451d-b20b-08db4cd0c41d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: VJqPfdwgr7tVYecnQnr1Kd4Mltv3x+86Z+kMEgDclVOQqj/J/7LtAnoyYW8EYEQx1HQDQvB6qoKahr7UpE5iVErdQx2yKPm6JaM33k8DZ0apcOOhwAx+AKC+JyHDq9jnHu8D+p/rGb/ijy0xNztiU8EYbq4ZVcUls9g+2AGd9NZVRG+NBseoueIwA/3VpLiO+BTAO1Oh+bNXCLLPW2Fitd6jP1rJEiaLrXgIOd8625oqceZM2tgnf45uVlDwtdpJQDVgtzBnThTWYrHiSFd54UkGdeIjQLn/euGL3fhLDFpzcSgq6WBFW3SNPuGFKKVg4LAO37OrI5M0RS6xJwbDrjjJSBzsAaaTTQNCTM/7rt9krX/CE8zzg0Di/JgLixUhTzbfPaEG8wGxv5VTBFb7I+dlzVVfqxGRbazSOwrL7fWsqXJHyTtyfdS2pMvKFMiPdlEInzzpy7/mGy20WpDjIxlNOS7tBCb7laprxmD25pN3TPvPIveInX1xkLkzaY0vWBX+Ww235zQ9v4sL7ppGjlODNZzieEGKfMkE1Izavo91K1DuUtLSDUs95Ch2dwzGp+zsL/hckYOwDGaW7Cg/AQHG/bpM5DjuQoLOPrJPj2rzPOPbEobvFjJGGs6+OK2E
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SEZPR06MB5269.apcprd06.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(4636009)(136003)(39860400002)(346002)(376002)(366004)(396003)(451199021)(41300700001)(2906002)(186003)(83380400001)(5660300002)(110136005)(38100700002)(38350700002)(8936002)(8676002)(316002)(6506007)(6512007)(26005)(6666004)(86362001)(4326008)(52116002)(1076003)(6486002)(36756003)(2616005)(478600001)(66946007)(66556008)(66476007);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?ZOODIV0zazTOtaGgkEJ9G5d/uSAZMhFVRpHRQU7lJFCDAILGlsHMCgM3yXpE?=
 =?us-ascii?Q?D/pLVpoUyF488GjZHCzyGROz4PmCW6IUz+wZ1nLe6KHqKBTtv1Qb8FktfWYg?=
 =?us-ascii?Q?Y+MytbKx1T/ghApWhTGj+Znkt5yfwbR3mOlAm3WHY/26nSRG4COw3w+/i5g8?=
 =?us-ascii?Q?ZESqDUksOzJydzY+cjQmSKaHDh24mywnDQX4h9qHTM096WtKXVq3d2EO0auP?=
 =?us-ascii?Q?/gAVsKnQVKK30gZ1LOu18W4yeHLEtxzKCJBS+dfHYg4sRtnlCGN4i1zq6daI?=
 =?us-ascii?Q?9AScxvQ8r0R4qord/AzMkmx80YWR23r3Xp5RuOo99toSjFTLSSJLymDy2+pZ?=
 =?us-ascii?Q?LaDPnVMbwNLaL6dCDb9W/zOklSqWaAp6yZ4Mt7dtK30DYjG6c997ipFnuXV9?=
 =?us-ascii?Q?f6UKrqB5IVpzSoEzm8Mi1G1ekFAQZE8F/B9nDfDjpAN6m8KnmqvAliqR1rlU?=
 =?us-ascii?Q?PknM7HdsyI/5o6Zg9CN/mnVZ0dItNISiZehnShbJ6l+1cugeV2bZKWlLNeZw?=
 =?us-ascii?Q?ZEvQgWk9k73vo0Q4gYwHo/tBpZYkX8aEJyVxkICPOUD1v3nn0HlSLqm8DpPh?=
 =?us-ascii?Q?zRiYZV4cGjt7coZEi4dnpqEGbIivqIQXYO8Vao0vAc47P6E5HCwYnhyiBhP1?=
 =?us-ascii?Q?1iqfqVaEzN5meGkZZ8qyG0URDvCx7wIduFqT5JMK4a2DBBPzQy24d3Ll9bfi?=
 =?us-ascii?Q?JI1CcBmCezX2ZPi9KhhWz6Ut0Tr9+Xz5m45/k70MjzRbhuxP2ePE8mxV2gjy?=
 =?us-ascii?Q?5Arv2m9UnJ9nu1sS31YixNS/VPRBR7Ptleq0APguCM7PwGGWT4AZRWs88yPw?=
 =?us-ascii?Q?dyBNoM4XBCqYNX4wjcxcKE0yHqjEP3XKe+MPSD+BXBj+TJY48wuMmxGZhyP4?=
 =?us-ascii?Q?0ntfY6+VV73b2bvv6lnLpQXcZcDta4GUsl4jSpymBsJ7WpgS0TuO6LgMYhhL?=
 =?us-ascii?Q?ZPzBv/6RjOsl5SZkn3rPQm2YeujWrio8uKJhpsFiY7rZd0mgidtY7/MuKlyk?=
 =?us-ascii?Q?Xe5VPtAtiBR5oEt5sn1yfpUso2JEREgkt09TR0+CvpSuiLCMms+cArEWR1DG?=
 =?us-ascii?Q?ZXMugZPpwciqE5V7N1TnfeiT/KSp9fIadjz3m+0RCin5DzGoToIfhAAFf3mQ?=
 =?us-ascii?Q?7QCDTx+LcUhaGcEzaPGaIHQRFdABPEmw1JBf4PE1DuOrJ+1obG3JAvo7I998?=
 =?us-ascii?Q?VHbFb/89aY98R8IZkQn483xEwA4B6IpQk5tuzl/Vot45ZGD6LpsA3NEm85dG?=
 =?us-ascii?Q?IzQpjYihp0GYS8p4uG9Unkdk0FQquAROg8dI09V2RC3TvzHiJUC3bGMvCkGh?=
 =?us-ascii?Q?/WF70lX7ig0wAoVup6v1edRCBPK8rcajzziAUjEkHVRE1jIT7+QbOcWVp63C?=
 =?us-ascii?Q?PL4E13qsviMhomJgJtR615XOeD8pm+I1o4+tUSSVO6o5RXdEH2PphnZWxafs?=
 =?us-ascii?Q?T7DTAEMrVSGblmF5XkNNMqLFVi8MYs+/dMml6DmjSryGcMvkzc70bvC1KBXe?=
 =?us-ascii?Q?MBBKhTsG4TNkn1LVklPWWCBPah/n6InDthabI8DTO6KlvivVKWcNt7KCucJ9?=
 =?us-ascii?Q?AY8xHCBgDuuNf4YgsMv2PmyaHKc3R1KMIHICOlBH?=
X-OriginatorOrg: vivo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4762bb70-cc00-451d-b20b-08db4cd0c41d
X-MS-Exchange-CrossTenant-AuthSource: SEZPR06MB5269.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 May 2023 18:52:53.2942 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 923e42dc-48d5-4cbe-b582-1a797a6412ed
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: LGCQ9q6uUskk1zT5W/xupUv4q5XXhh7XUArcalJy10d5ZcT0WU4kMSigy/jB3RTu3cKRWuA+kQuQlVj//pSWFw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: KL1PR0601MB4162
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  In the following scenario, after executing the move_range
 ioctl syscall, the block size of the source file is 0, but data can still
 be read. # stat test File: test Size: 6 Blocks: 8 IO Block: 4096 regular file
 # ./new_f2fs_io move_range test test_move_range 0 0 0 move range ret=0 #
 stat test File: test Size: 6 Blocks: 0 IO Block: 4096 reg [...] 
 Content analysis details:   (-0.2 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [40.107.215.99 listed in wl.mailspike.net]
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
 no trust [40.107.215.99 listed in list.dnswl.org]
 -0.0 SPF_HELO_PASS          SPF: HELO matches SPF record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid -0.0 T_SCC_BODY_TEXT_LINE   No description available.
X-Headers-End: 1pue4e-0002e0-QN
Subject: [f2fs-dev] [PATCH] f2fs: fix to call invalidate_mapping_pages in
 f2fs_move_file_range
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

In the following scenario, after executing the move_range ioctl syscall,
the block size of the source file is 0, but data can still be read.

  # stat test
  File: test
  Size: 6               Blocks: 8          IO Block: 4096   regular file
  # ./new_f2fs_io move_range test test_move_range 0 0 0
  move range ret=0
  # stat test
  File: test
  Size: 6               Blocks: 0          IO Block: 4096   regular file
  # cat test
  nihao

Let's fix to call invalidate_mapping_pages() after __exchange_data_block()
success.

Fixes: 4dd6f977fc77 ("f2fs: support an ioctl to move a range of data blocks")
Signed-off-by: Yangtao Li <frank.li@vivo.com>
---
 fs/f2fs/file.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/fs/f2fs/file.c b/fs/f2fs/file.c
index 78aa8cff4b41..ae7752c5cd0a 100644
--- a/fs/f2fs/file.c
+++ b/fs/f2fs/file.c
@@ -2870,6 +2870,9 @@ static int f2fs_move_file_range(struct file *file_in, loff_t pos_in,
 			f2fs_i_size_write(dst, dst_max_i_size);
 		else if (dst_osize != dst->i_size)
 			f2fs_i_size_write(dst, dst_osize);
+
+		invalidate_mapping_pages(src->i_mapping,
+				pos_out, pos_in + len);
 	}
 	f2fs_unlock_op(sbi);
 
-- 
2.39.0



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
