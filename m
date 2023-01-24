Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id BAA93679D96
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 24 Jan 2023 16:34:18 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1pKLJR-0006C0-HO;
	Tue, 24 Jan 2023 15:34:16 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <frank.li@vivo.com>) id 1pKLJP-0006Bo-Ms
 for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 24 Jan 2023 15:34:14 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=MIME-Version:Content-Type:Content-Transfer-Encoding
 :References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=pc/HiXG4XACj4UAubJW4YdIEG+BNWkO6yw1S/98YXKA=; b=jlEI9JP3C+xxRRtSc1N9ZlXawV
 ASNHcdgDOGucjYWqv5+Ho2SZyzvAQ1WACP44BKKAckK8kckD7BKISQJRndsZ9K4QVv9UmsIlxzbOb
 HIUByZNyFXghj3smP9IQCxJXjWkF8ASIz0han6nxXJvN7gznoZGJSGzLM1N4XFFExmOs=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=MIME-Version:Content-Type:Content-Transfer-Encoding:References:
 In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=pc/HiXG4XACj4UAubJW4YdIEG+BNWkO6yw1S/98YXKA=; b=YDG9mQW52STO1foy4JixfEUWyz
 4LsSFDgtTK/53vkMHI0XfIpyEhg1+0vfnXCOYzLPq2hU9RAwcrncLtO37B5fBWuO5gaExpiwavtgn
 2XV4lPSecqVvnMohQeb1XMh5U3EYOk9zcO3dSmQ69/3LCgeZqNX++xNezduPRuUFrzUQ=;
Received: from mail-sgaapc01on2135.outbound.protection.outlook.com
 ([40.107.215.135] helo=APC01-SG2-obe.outbound.protection.outlook.com)
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1pKLJN-0004P9-OD for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 24 Jan 2023 15:34:14 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ArCiyjGFtSyxcdn/pS81OMJdeG0y3xXP8Pm3VcjV1cZcFI48dpnV0c31Ew9rL1s8X/frnY4CKdIhHat3PmX8CSyPklUJNlIpA/7s62v6qMqtWvhFhcRypN5WgZbR+gztTEiVNqqzgDJjlU23k0LQv6OctEIZRyMHZQ/s5B9L5bEKh5scvppj45Gqsem4EaC7m0GRbeh0Wdf5PB58msMHyAnIFimagTtYG1S6oO/1zyiJRZ2Aubh//plrVB8m5ry+5L6RaZKpXc2V0fsux6YRb77lpJ/cbRfO5+Ve+BWQr5hOeVEg/616d7RKwlxmVh3KmtiQX9v/eKemiEPKxo2s2g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=pc/HiXG4XACj4UAubJW4YdIEG+BNWkO6yw1S/98YXKA=;
 b=jdhAwo3tugThj1IyfRxNI7BhjrbcU2krN3sEoTnm+lv+uUdwCXDi3zEus9pTK5TIF6PgMTibai/Pce5jN6gQ7v5Hp+coKUMeGXPtzEPzk98LcqmjsMiSBMdCS5LTxRFAsh+QGDaDexYNuYMi8VPMY5kKM0bScggdDBxyANknTdvjM0/OnBjN7u6PfO31j63Ys8SMJ9LjZEc+TqmOXsZpCkTKFLYqCQQNqmI1KIwQ3FzBYyUjZCLdZlIwCjJA/wuPmETF4aSp+9D5L7kfvjS+kWQF4WYFC6cGETJgwOqApSQjr2VDPbQaZ/7nwix0sekfLBPqHfn1RsBA9xqv1gbQBg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vivo.com; dmarc=pass action=none header.from=vivo.com;
 dkim=pass header.d=vivo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vivo.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pc/HiXG4XACj4UAubJW4YdIEG+BNWkO6yw1S/98YXKA=;
 b=kPeE0NVbzveUj+EUCJUxuxQLpXUhxgKNVnUaAQFYH+O6FKGAK8jRgIEGa/5az3MnEfmLMZflExClfgs7jCrhEopGJiufXPGJdobl7FjvIojomQTSfR26pvG7hc8rf4BXy/4d6ii2uN5BaaRGmsQeNDFQtRlJp8uZq7wCbomoBateoUQcoD5NPNMC28EEJlYXgiq5VPHv9bCFHbH1WzKq21z5xyoM3wg9retwGJvJQfpcD182upZ8sisW9rAmx5m+nS5brvUx420M9nWWjd4kdxbJazVyrsNRPOtRt6WW/mBZlLzjGEIIX0HhA1GEG/zr5KzVok1hPhYbECWNDS1QBQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=vivo.com;
Received: from SEZPR06MB5269.apcprd06.prod.outlook.com (2603:1096:101:78::6)
 by SI2PR06MB5019.apcprd06.prod.outlook.com (2603:1096:4:1a3::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6043.9; Tue, 24 Jan
 2023 15:34:01 +0000
Received: from SEZPR06MB5269.apcprd06.prod.outlook.com
 ([fe80::3e52:d08c:ecf4:d572]) by SEZPR06MB5269.apcprd06.prod.outlook.com
 ([fe80::3e52:d08c:ecf4:d572%4]) with mapi id 15.20.6043.016; Tue, 24 Jan 2023
 15:34:01 +0000
To: jaegeuk@kernel.org,
	chao@kernel.org
Date: Tue, 24 Jan 2023 23:33:45 +0800
Message-Id: <20230124153346.74881-3-frank.li@vivo.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20230124153346.74881-1-frank.li@vivo.com>
References: <20230124153346.74881-1-frank.li@vivo.com>
X-ClientProxiedBy: SGXP274CA0004.SGPP274.PROD.OUTLOOK.COM (2603:1096:4:b8::16)
 To SEZPR06MB5269.apcprd06.prod.outlook.com
 (2603:1096:101:78::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SEZPR06MB5269:EE_|SI2PR06MB5019:EE_
X-MS-Office365-Filtering-Correlation-Id: df2e40b9-e6a6-46f6-37de-08dafe206ad1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: jrg3L6RYuFdiIjmeCGqFMuwNLG5QQUZeEQwai5Kf2DTTtorl9OhI53W3s+Q9/jvjSCQjTy/Yd6QXwEkvEwo6JH08MNDZunE1qlYcigOAknzMRFi1jrkhB68OJPf0kiYU90NtDSZRrbFIrduw+5JrbqMqgWaQrJsPxeipxVyvbP8/9EqVSJIfd0LdI8+HInZy0dcYRBwl8Y8vr3JPUeffpGnsnEKXf7sHKnyiulDh5ObFr87bN/It9TEXsmDqeEJt+8ssXbM6OVbR/4VW1C6Gcr3i3bA/JrZbb44i4OCL6cehp0alF4vdmQpRmhh57RjBZmwXCYP+1faNDyyuMS1Qd5NEMlqruyUYt79dHvEz3yQY5rRjRMhXm7mJvO7Mb1ToC/DSXaUbMf/sUlOuVuEcenPimJzP8HiB13+8OSifT8nuhyjqFU3d2GZt9cN+E222WvWBx/W6v8jsUBaKobhYHm9HZ5KejFXUwvAhz8+nx56J62CDKP94LCkpd/8FK5t0JPGKQM+qtVuocM0WMReMEbRWcadrVFWcIDqQrwtprszk/JWoE87di//NCPTiU+zm0xPBXXtuAxIId3pioj+SCToFTC4hxhLhrky6Orik7WOVn6OMoOJtkeA+15uzj0GHaeXQsEe1DItPxtfHvrk4jr1kqA46BkS1cH2PviaV6ShrACQCvUyPZT+3y/3GPMj96k8NzrRsnnZ+IH/6KXdi3Q==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SEZPR06MB5269.apcprd06.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(4636009)(376002)(346002)(366004)(136003)(39860400002)(396003)(451199015)(2616005)(2906002)(6512007)(26005)(86362001)(186003)(38350700002)(38100700002)(36756003)(8936002)(52116002)(316002)(5660300002)(83380400001)(41300700001)(6666004)(107886003)(478600001)(6506007)(6486002)(4326008)(8676002)(66476007)(1076003)(66556008)(66946007);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?Kvtfq6J8WcGROyBOYeqYq8sbAEcy9yJJeKhtXmd2CJqaPowV4mVaXfPRswBn?=
 =?us-ascii?Q?j8Mm2xdj/io/Ntq5LBxvr7rqsfzUTW5O/DiN8+6kHrUO+k/JHk5jBFZ1Vpq1?=
 =?us-ascii?Q?iuXNMBdgN6N6YuWdbloKI1yCwwJ2W7RUwKCOqBPMqUZ6cF/ispHyu4kWgVEp?=
 =?us-ascii?Q?w57xEtVmXEyhtGimSuANJtKhxE90EJtFGzR5j+riyMZABiPBVjH6aAyVDnuV?=
 =?us-ascii?Q?kYVLjQIxLVEWca+qtDlLW6x7X/HlK8An/fM61F7F/+nMuIOqyttYRbxG1W9Q?=
 =?us-ascii?Q?bVU1AjGGdFJD2fV4gE+XUqSgiBsjWg3aUUGG3YmYcSLKDCFAC6697ByyZP1Q?=
 =?us-ascii?Q?PtahlMDpjiKyxSTqPMAWBEWUo4QSdZ1TVPz62W7Fmyz6Lh5CTfIvlzFvZ/iu?=
 =?us-ascii?Q?zl5cwP+lRH0R9aveqwRNP5nLx+hFKQ067iZN3a8EXJrBY/DZccQGXZ//d29d?=
 =?us-ascii?Q?w7knsm2/BLP8qRVuXvb0jGwEx5wyE4kS2KfMs5IOwwWYBMJLTem0DXvEHE0B?=
 =?us-ascii?Q?efqx2/n2R9B0NeZvQp9wu/KMK4zOxeS6JRHHHre43Gtcn9hMrNIF6fz0FIeH?=
 =?us-ascii?Q?6DRPbzFyvnhB1tQBxClY+uUyoCeKtrSy5vswPaL6FeDQVqPUcEzisWkmPjMz?=
 =?us-ascii?Q?JSH3qkJ3KSAw1flKkHTTlJD6Dvuhgact7CqkpVoXWm1Ixmk7m7GDH5RDbS7e?=
 =?us-ascii?Q?PKpG2LIEz9YA1LXu5uRTjzmvtCXMbJ/zHRZurtedoMQ5PJLMO4nW2rHa1tZt?=
 =?us-ascii?Q?b8i/+o1hYpXG3uop4/OtOR/TKFgJKh+O9+EMFQ9m/WEJT1geuhG8/xqHI67B?=
 =?us-ascii?Q?+K307NRy2FrvNdLLfxgmrl94zEBceIYTDVSNzaesW1hgyjMUv33WeIs3q2Hb?=
 =?us-ascii?Q?VcpOwk2Bt7akoKk6DMxFt+1d7Hcj8s7OFMSLf57ROMv3XihsKCHAod66ER75?=
 =?us-ascii?Q?M/rmkr8Zh87YfV+44IDy64KSb9v80ITm9SJr5PnCRB/HZFUsE/ENIbQ3goCF?=
 =?us-ascii?Q?EKx0JqkalPqejR0lqmAgPaKl+FXlC9+rVm8afF3RITTYgnbBbe3Qdj7lKs4k?=
 =?us-ascii?Q?nA3bGuTa7C4eDg6xSEI9Ch5+BgntX6vihPRdYyvnsoU2jZDyDAtDzyqMSq6B?=
 =?us-ascii?Q?Rn8HlJkkjH3Xtk6CiV37GHWtcp1IvR/POL7ScGb2gO2dlxx1utTCb8XanUaW?=
 =?us-ascii?Q?85wTy50Nt6upaWhN43YoZN2eOGvR3DjD2WwtbYKaHmm4UANu85r9EcTfjpS0?=
 =?us-ascii?Q?kSyti2k1K8MNghftQ09GNO1bzqqe/c/0ksUVo3n6vW5sk3ky4empQJ2wRNZM?=
 =?us-ascii?Q?IQ37h1mhBhe2kn1wbsEWH53MYa3bvUDPZMBfSdvhrAvbdnUdEgWKZ6giP8s5?=
 =?us-ascii?Q?NPqfeaUYDHlopXsR+PmmGkYy5zWYHxjaftIxeKJPaF73q54RDKAvUa4hKDSl?=
 =?us-ascii?Q?1tE5MGB0PaIhu8MZs1cBNotOyKg1+Pzk7rZK/kaDbp8DOATQfl+oLkfyHMXX?=
 =?us-ascii?Q?CsFLQ07upNGPeyexECNGYw2etNc4zUTxp864k678Be/D3Ljo0QROf3uqUW8p?=
 =?us-ascii?Q?+IUc7sBGD1TD3GBFP4lkh9U52GEPo6LOFPN0QM0K?=
X-OriginatorOrg: vivo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: df2e40b9-e6a6-46f6-37de-08dafe206ad1
X-MS-Exchange-CrossTenant-AuthSource: SEZPR06MB5269.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Jan 2023 15:34:01.2737 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 923e42dc-48d5-4cbe-b582-1a797a6412ed
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: LHIZjphWEmRJx4iGLswuuG7oX95MAKgZUhkpZkWgz61nRV3DdCcpL3MzuYpthR0y0haO0DZD/sQX1E68Vc8qMw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SI2PR06MB5019
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  If the compress feature is not enabled, there is no need to
 set compress-related parameters. Signed-off-by: Yangtao Li <frank.li@vivo.com>
 --- fs/f2fs/super.c | 10 ++++++---- 1 file changed, 6 insertions(+),
 4 deletions(-)
 Content analysis details:   (-0.2 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
 no trust [40.107.215.135 listed in list.dnswl.org]
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [40.107.215.135 listed in wl.mailspike.net]
 -0.0 SPF_HELO_PASS          SPF: HELO matches SPF record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
X-Headers-End: 1pKLJN-0004P9-OD
Subject: [f2fs-dev] [PATCH 3/4] f2fs: set default compress option only when
 sb_has_compression
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

If the compress feature is not enabled, there is no need to set
compress-related parameters.

Signed-off-by: Yangtao Li <frank.li@vivo.com>
---
 fs/f2fs/super.c | 10 ++++++----
 1 file changed, 6 insertions(+), 4 deletions(-)

diff --git a/fs/f2fs/super.c b/fs/f2fs/super.c
index b5fbe9939390..68ccc9f54c2d 100644
--- a/fs/f2fs/super.c
+++ b/fs/f2fs/super.c
@@ -2039,10 +2039,12 @@ static void default_options(struct f2fs_sb_info *sbi)
 	F2FS_OPTION(sbi).fsync_mode = FSYNC_MODE_POSIX;
 	F2FS_OPTION(sbi).s_resuid = make_kuid(&init_user_ns, F2FS_DEF_RESUID);
 	F2FS_OPTION(sbi).s_resgid = make_kgid(&init_user_ns, F2FS_DEF_RESGID);
-	F2FS_OPTION(sbi).compress_algorithm = COMPRESS_LZ4;
-	F2FS_OPTION(sbi).compress_log_size = MIN_COMPRESS_LOG_SIZE;
-	F2FS_OPTION(sbi).compress_ext_cnt = 0;
-	F2FS_OPTION(sbi).compress_mode = COMPR_MODE_FS;
+	if (f2fs_sb_has_compression(sbi)) {
+		F2FS_OPTION(sbi).compress_algorithm = COMPRESS_LZ4;
+		F2FS_OPTION(sbi).compress_log_size = MIN_COMPRESS_LOG_SIZE;
+		F2FS_OPTION(sbi).compress_ext_cnt = 0;
+		F2FS_OPTION(sbi).compress_mode = COMPR_MODE_FS;
+	}
 	F2FS_OPTION(sbi).bggc_mode = BGGC_MODE_ON;
 	F2FS_OPTION(sbi).memory_mode = MEMORY_MODE_NORMAL;
 
-- 
2.25.1



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
