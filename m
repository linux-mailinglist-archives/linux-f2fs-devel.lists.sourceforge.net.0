Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id E9C5D6759AF
	for <lists+linux-f2fs-devel@lfdr.de>; Fri, 20 Jan 2023 17:17:29 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1pIu50-0005SN-3u;
	Fri, 20 Jan 2023 16:17:25 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <frank.li@vivo.com>) id 1pIu4y-0005S8-Ty
 for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 20 Jan 2023 16:17:24 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=MIME-Version:Content-Type:Content-Transfer-Encoding
 :Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=8lJ3yJrB3A8rLWx2XBIG7df0s87Jz6khg7Z8UDThGoo=; b=nAF8Czx017Rmc7WnHT4Yk5dzKS
 hrd6itQb40Oy+eVS42pCOAX0zHBCrQQoMugbLuH5wEaFuKl2n8/sixvYOIkg3bzvNY28pQnSqMcWw
 b7Ze0cH+tMN5RRwwziJIGqUwcEQMPkVL0mRk+y+9P/9ozyLxZg/VSj0WmD7e2AWV6nJg=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:Date:
 Subject:Cc:To:From:Sender:Reply-To:Content-ID:Content-Description:Resent-Date
 :Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=8lJ3yJrB3A8rLWx2XBIG7df0s87Jz6khg7Z8UDThGoo=; b=h
 9KhMLgBdbD9Vu00UohpEHY+KycCCrXUGZ27RvdKOjG6GNmn4JAvA0+krcS1EXgWoKdU3MRnODopq3
 eBaSrQIOVGXWUOw6LAiHffb08VpMvzGvne6dTruAylJoCC8vsWGP6+7xWkbZSUkLXnO1/HeazPRes
 KslbYbmOuudKLMkw=;
Received: from mail-psaapc01on2095.outbound.protection.outlook.com
 ([40.107.255.95] helo=APC01-PSA-obe.outbound.protection.outlook.com)
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1pIu4t-00ANvr-Uo for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 20 Jan 2023 16:17:24 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=URElY5bQB98tco8pTiPkdBQdCR+SxOQBV7R0ggPWCzISblNCpo91+PXrZdf6iFbK4UHNNDHzoVuhK+22IjDpqvxZaehlvX/jafVYyD/+hImLSCIcI/FWpgPGLN0EvCWMg7Wr44boA9yqvh2kELiO8Wv1zD73gxDkDRmsvpCqF0+DkvEKt1PKk7VjSnCTNpY7fEpGs1pMoLDhDjWo6vcE7Tzwrz60pC9jsaqpRSCLO2+KzVfrVpYqYCEKPPOdk9VyS7Z+LyqsvWQ9enrXOe0bF1TlBZ/zMTlBnrsDnfVD2g88Xpc44iXZJuryK+lTsaHHueOAPsNMbL5MhvQy4cH3og==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8lJ3yJrB3A8rLWx2XBIG7df0s87Jz6khg7Z8UDThGoo=;
 b=SCcczmWk5v0nsMD4PGe3Qc18HHc+y5dnL7Y0W9nzErgwwbWKfxc67yJJMFma0m4utvFZJRp/rL9qD/FHKB9Rt+e3eRZL8IbSfd78QpM2EghwKrmfpaXa4UWudMxZ0Ic+OL1iJ5ehOv1TteVZJgHWzE4ZdAwOnPiti2/Jz4lF1e8hPnrga7RQskC2oHJY7n8W3vJZEKw1V2b2wDgkJZAIPLdxpXRCDuW9QSBCoF6iQ1eVNZVdyEU/+iKQ4QwhTok5p3MWGUE3fEd4+ftyXh0+bCAWCsp6YRgyeRp3HZy+R4Dx5Zheic8mCQonUUEak7NEZbsVpYvpsFjSV4f+YBXBmg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vivo.com; dmarc=pass action=none header.from=vivo.com;
 dkim=pass header.d=vivo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vivo.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8lJ3yJrB3A8rLWx2XBIG7df0s87Jz6khg7Z8UDThGoo=;
 b=TsywWlnvbDW7nb5J3CRIuZ2CDkGRDgOaUNcLGhIhExu6y6Nr8ikT5V+WUptKOVqa6MiXjLtCiIRCxL88MrPZzI0Gbe49raZ8qi4wdE5WvIFX7f1o25sfhWHZTLS8Yms4Ure94+4MQZ3Vk69bvU/Xr6Ybt7UeL7jBQMBWg/BH0RS7noyvFD0LyiXEq4/Pmp7wwtZ49SYIlJBd9rqdoXt4G/YzMs3V9m3/KnaAdoxnma4MlWh4m4YnKpsm6wI8LmtANwNrISSf2Bm8EF76MAsCY9LEsnBLvivamKy6gRjeZBHge9cmsa+dpC8jXzUGWtEQetLNe/GrI2+u8iL/JnUlNg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=vivo.com;
Received: from SEZPR06MB5269.apcprd06.prod.outlook.com (2603:1096:101:78::6)
 by KL1PR06MB6233.apcprd06.prod.outlook.com (2603:1096:820:d8::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6043.5; Fri, 20 Jan
 2023 16:17:06 +0000
Received: from SEZPR06MB5269.apcprd06.prod.outlook.com
 ([fe80::3e52:d08c:ecf4:d572]) by SEZPR06MB5269.apcprd06.prod.outlook.com
 ([fe80::3e52:d08c:ecf4:d572%5]) with mapi id 15.20.6002.012; Fri, 20 Jan 2023
 16:17:06 +0000
To: jaegeuk@kernel.org,
	chao@kernel.org
Date: Sat, 21 Jan 2023 00:16:55 +0800
Message-Id: <20230120161656.70308-1-frank.li@vivo.com>
X-Mailer: git-send-email 2.35.1
X-ClientProxiedBy: SI2PR02CA0041.apcprd02.prod.outlook.com
 (2603:1096:4:196::20) To SEZPR06MB5269.apcprd06.prod.outlook.com
 (2603:1096:101:78::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SEZPR06MB5269:EE_|KL1PR06MB6233:EE_
X-MS-Office365-Filtering-Correlation-Id: 607ef2a7-b2db-4734-7847-08dafb01c623
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 2OHeEkaJ4KaNAXkuyCzGVt6LEG+H3Imyc16iHSiQx9ETlNc//FS4SGwwegWl8uKYha0x9UjEf9xaPUjMPhttaDicISvrCyLk99eCyZFl/Jce3FPG1PRzePiVZ2TfWFJCM8v7VPjPY3E7qNBZLg3tKXTEAYb+iCerscllwa/Csv6sGn/3CzeCF6lQfdf7AzUY/EjuBVAULAWJCByLObRNH9VZ8bl+frAw11amWjYONH+9VJiHEA6vEWv+ECif1Yyvros/YIZq4keVlUUf5q6f5mNYC9mEg3yExUGch0NRJQiPJpAze/yLsgFUpEXU3fP46ekRMgl7qIV6sPB8BGgYPJmorl43pfEBDVqc4FhWoMT6gDLduKJQEMvRAKbajXoux45bnqDWdV6MTRHtkFlDEoxsIwtdNlccvgJptHYCTNE5m3el3LhEB3i2IG1zx3MYEmOQd8nejMGzd8cv89+xaWo+cXOeZIZKxwZSgcqWokZkIICU9gYCFTLBkcWW16zy+q2WaVfbbIVQXCJJHVJ1turgX8zo+40lVAxDc+4CmQgJY7Qd43Yihf/XSLIfL3Nw5nByFvNUdaUxb7T+pc095CoLRPDEtcML1dS7+OtnFUS5730Qpa8eUl2w0WG2EYVNFUHrZYolj7I7YrfFuOgFyHlUYKtjSUQvcEBTkziKltHnAxlYElHVxybPMdxf2tt8Fgg5YTMCdwNMy0dqIdb+0A==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SEZPR06MB5269.apcprd06.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(4636009)(376002)(396003)(136003)(346002)(39860400002)(366004)(451199015)(6486002)(5660300002)(41300700001)(8676002)(54906003)(66476007)(66556008)(316002)(66946007)(2906002)(478600001)(1076003)(26005)(6666004)(52116002)(36756003)(186003)(6512007)(6506007)(2616005)(8936002)(4326008)(83380400001)(86362001)(38100700002)(38350700002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?mJT2oE7+ENvW68Ki7r6LEBUFcTmIBnoqGYO+bHgMikq2NXvZjZ4YS85UdsCa?=
 =?us-ascii?Q?pKleo3CBPxbWd2dM71kifd3eX0muQoLnT8fAWg/a7VjdbRH0BZimnMIAer74?=
 =?us-ascii?Q?mU/Sm/eQfBgewmEHS5MOB75m0xZj8vr3A4CuCyoMw8jvFytmmA8eGz24fbq2?=
 =?us-ascii?Q?dB+bJgqZhgLSyMu9fgVlRqx5toUkaPaMyvZ7N7lVqtqT/9g3kfSE+t0G8T/+?=
 =?us-ascii?Q?STA5Pqjg3HnI0HQY8+VfSehRjvlYeo0CCu2r4pfi4xUx2rbhVL9ra0i6Y8M8?=
 =?us-ascii?Q?7QDY3tLL7GHlrGQidzOTdpANp+oTkazpBtvBFw9TWgIxxntdI/5l3ObGFLhx?=
 =?us-ascii?Q?4CzI+dmUiGHocX+4caz5+5BfgPNNMWZNSYBNjaQARJif9o+pnqWgn8njUme1?=
 =?us-ascii?Q?6T6H37Uo5AiRviYXYZYKBbQ+zzk/8jxQ2NQ8pLXlBkXM6lJ2nlQZUSRfiNrs?=
 =?us-ascii?Q?vP7w2Eq4LYD8v3TYj+E42fnqebzo1yGtnmHIKDQC0DC03G8v1UNQjqkKkaSL?=
 =?us-ascii?Q?SfifbjZ5ICH3K9F4fEjkTml08FFK7pu7isU5/9GWDU5Z7/kbpc6BX+2TxNzN?=
 =?us-ascii?Q?tkSkcdE2p6WjLw01xWSeLvyfYCVsJ8HyDaez7pE7seB3o8R8r8Vwm9zp3bgc?=
 =?us-ascii?Q?oc3sEVA3Mau4JjHcz1+zHkYG/rmW7f3Vqu9/B0Axs9uErI4SB0lRRYERVgJs?=
 =?us-ascii?Q?KzSh5OTZ6wgq/cu31AbvPmjIwE05rhqScXJOAWnUyG6JaT1/nTOe0UYe3Xzr?=
 =?us-ascii?Q?vLkdoyPEGLTiYV6x59IAArXz7SnZak1GVW7Ho22qYjRkSxJjd020MS5pgL6u?=
 =?us-ascii?Q?qCUnIGfXsAWbcwWNKGCZ0yuFfx4+J4NxEwIyzSIdPsvybGyjx2bOphXPUiAa?=
 =?us-ascii?Q?6viacEfSUiQYDG8bG1haALUhwvNO3d9oH8BkD9yTeA5iUGjvzk6i3Tgh9YaU?=
 =?us-ascii?Q?GzxYlYsLHiwGtuJIgTRbkwikwVmw8Kb+6ko8kqGy7ElspjFzhx3vqjPL4LTI?=
 =?us-ascii?Q?RhK0jAatwnM8LxDyjo3GBnyEjpIa2MGeAACTH2rnJOsG3pHL/O4UvDsgyc4W?=
 =?us-ascii?Q?1menBJfOdXe7mgDJkT8uXQh6hHp8CG6YyESGERSG20E/c/EVdm/NJm/75olc?=
 =?us-ascii?Q?TKVFAf2X6B6juLR0I2YKZ3LuEpkxE4RLTf8x/1jpnyS4uYyjDuFkx9jbroW+?=
 =?us-ascii?Q?ZGrkrTPseAsf9hKkykGVFsi7BG56fov/BvGxRykgc4naDH6LKUKLxq9MgHj1?=
 =?us-ascii?Q?/n2TOBnES892X7sdIDoKj+dnKwkugnu6XdQmald+2UyJyl8sxe+WFzUxUnyp?=
 =?us-ascii?Q?fV8+8xiO5Y3Ro5B8+uaDjkYgdorbCOzxKXfFaGilKtPjEovvaRtJCmUdwRGC?=
 =?us-ascii?Q?HlV2Lso52DD7EWampQAkwLvEmHcS0y4SJU76p+kJpJp9E48OU7Q6hyIqZcqX?=
 =?us-ascii?Q?xbT8e9oc8obklvse+5cOSm1HZaCTbgi7duh0ZCQBCDiRYsBDUtx2hbihzYfQ?=
 =?us-ascii?Q?B4VXZ5Br7wuJk3rJvtp5UHBRf4JsFsWFbY+SHyujzmjKeBF5cQuINaN9e3fY?=
 =?us-ascii?Q?fqalXUOk5mUdvFn84abb533GEPtnzG2bZIkflBj9?=
X-OriginatorOrg: vivo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 607ef2a7-b2db-4734-7847-08dafb01c623
X-MS-Exchange-CrossTenant-AuthSource: SEZPR06MB5269.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Jan 2023 16:17:06.5504 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 923e42dc-48d5-4cbe-b582-1a797a6412ed
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: UJLCCWrPkiFlpDUO0N3+9TAPX1O9KBzmKBEVm8QQgj3TFHFANwNjUpqXRFfqqt6Re3hAFAVIqy9ktURRWsVWFw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: KL1PR06MB6233
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: Add iotype sanity check to avoid potential memory corruption.
 This is to fix the compile error below: fs/f2fs/iostat.c:231
 __update_iostat_latency()
 error: buffer overflow 'io_lat->peak_lat[type]' 3 <= 3 
 Content analysis details:   (-0.2 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [40.107.255.95 listed in wl.mailspike.net]
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
 no trust [40.107.255.95 listed in list.dnswl.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.0 SPF_HELO_PASS          SPF: HELO matches SPF record
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
X-Headers-End: 1pIu4t-00ANvr-Uo
Subject: [f2fs-dev] [PATCH v3 1/2] f2fs: fix to avoid potential memory
 corruption in __update_iostat_latency()
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
Cc: kernel test robot <lkp@intel.com>, Yangtao Li <frank.li@vivo.com>,
 Dan Carpenter <error27@gmail.com>, linux-kernel@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

Add iotype sanity check to avoid potential memory corruption.
This is to fix the compile error below:

fs/f2fs/iostat.c:231 __update_iostat_latency() error: buffer overflow
'io_lat->peak_lat[type]' 3 <= 3

vim +228 fs/f2fs/iostat.c

  211  static inline void __update_iostat_latency(struct bio_iostat_ctx
	*iostat_ctx,
  212					enum iostat_lat_type type)
  213  {
  214		unsigned long ts_diff;
  215		unsigned int page_type = iostat_ctx->type;
  216		struct f2fs_sb_info *sbi = iostat_ctx->sbi;
  217		struct iostat_lat_info *io_lat = sbi->iostat_io_lat;
  218		unsigned long flags;
  219
  220		if (!sbi->iostat_enable)
  221			return;
  222
  223		ts_diff = jiffies - iostat_ctx->submit_ts;
  224		if (page_type >= META_FLUSH)
                                 ^^^^^^^^^^

  225			page_type = META;
  226
  227		spin_lock_irqsave(&sbi->iostat_lat_lock, flags);
 @228		io_lat->sum_lat[type][page_type] += ts_diff;
                                      ^^^^^^^^^
Mixup between META_FLUSH and NR_PAGE_TYPE leads to memory corruption.

Fixes: a4b6817625e7 ("f2fs: introduce periodic iostat io latency traces")
Reported-by: kernel test robot <lkp@intel.com>
Reported-by: Dan Carpenter <error27@gmail.com>
Suggested-by: Chao Yu <chao@kernel.org>
Suggested-by: Jaegeuk Kim <jaegeuk@kernel.org>
Signed-off-by: Yangtao Li <frank.li@vivo.com>
---
v3:
-convert to warn
 fs/f2fs/iostat.c | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/fs/f2fs/iostat.c b/fs/f2fs/iostat.c
index ed8176939aa5..96637756eae8 100644
--- a/fs/f2fs/iostat.c
+++ b/fs/f2fs/iostat.c
@@ -223,8 +223,12 @@ static inline void __update_iostat_latency(struct bio_iostat_ctx *iostat_ctx,
 		return;
 
 	ts_diff = jiffies - iostat_ctx->submit_ts;
-	if (iotype >= META_FLUSH)
+	if (iotype == META_FLUSH) {
 		iotype = META;
+	} else if (iotype >= NR_PAGE_TYPE) {
+		f2fs_warn(sbi, "%s: %d over NR_PAGE_TYPE", __func__, iotype);
+		return;
+	}
 
 	if (rw == 0) {
 		idx = READ_IO;
-- 
2.25.1



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
