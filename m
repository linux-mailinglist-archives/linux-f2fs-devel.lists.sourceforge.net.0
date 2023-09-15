Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id D3B057A19C9
	for <lists+linux-f2fs-devel@lfdr.de>; Fri, 15 Sep 2023 10:57:18 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1qh4dW-0000fc-2O;
	Fri, 15 Sep 2023 08:57:12 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <bo.wu@vivo.com>) id 1qh4dU-0000fV-FX
 for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 15 Sep 2023 08:57:11 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=MIME-Version:Content-Type:Content-Transfer-Encoding
 :References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=55obZ+kvwCHjLjYM2qB+/d5MrTQT4QQR23koeSEhJPE=; b=CBXAvPOxnl0NvZEbixk3r4lATc
 k2ddAR5jvcMm7MwmCI56CHxuy5zfbYV5xi9RXFfdB8VwxxCOOhZvrxN5PVnoSQ5KHn4zekgV4GXcy
 Vj0Dat2tVvTa5ylOaSOMGIpLSGAvm9UHBWkCQEI8HxrMlp82woEHy7km5XTVef6+6SMo=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=MIME-Version:Content-Type:Content-Transfer-Encoding:References:
 In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=55obZ+kvwCHjLjYM2qB+/d5MrTQT4QQR23koeSEhJPE=; b=BKxaJBGnZhc3m2+NbuwxLmnfst
 k9w6mKSXIrLNrekUmKJM/HIqOuv9bIVeAbvuVh6X8OA04kKcDStblVtzW0fFYkJJDe1fYQvCBAXIR
 4F5T60SgmfstOF3y6UAtJHomKOG1HeqORoxLsDZ60aHSoirINQLscwehvIJ3s5D7EA6Q=;
Received: from mail-tyzapc01on2109.outbound.protection.outlook.com
 ([40.107.117.109] helo=APC01-TYZ-obe.outbound.protection.outlook.com)
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1qh4dS-0076BY-OJ for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 15 Sep 2023 08:57:11 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=DaZ20t4mQzqSW6P8auerXgofjVbgufBVaQvsYuQQM4nX4oFXjuuL/VT2WlL1pQSXDH2xVPbpzYelJYs2+pUeQbAQq3Ocxh2bvPsZpe2/G5Wf2HjVstjbm6Pz847Uz4vTFjt45gpeoaNJ2RFuyFFRRvYSgsU5pdV4HpEwqEdsSMMg4zjJnEt5t5Zvr8OlEn8w86Z0zXcAQ3Fnc5m5+tXi4+IE8496USZ4G5kBHpHaw8vW6UUlkp9HhhcBhPOUpd6tLoFTy4OSgikK9Z9HXV1pqgmi6yMtJJ4nu+6ypZqKXCGafzx7S4oN3unrPJETM8GpVqBUdGwZxvAL9Tg285FiTw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=55obZ+kvwCHjLjYM2qB+/d5MrTQT4QQR23koeSEhJPE=;
 b=mjVfdtL49zJJ+qcaKXbApJ+yieQs4n3ozuA4EDMmOfvCi6s9rW0Bg67cV/f6vgw4eIrUXv6GSFWJjfTHooXbRadqEDPa74Idr37TNF2+IyrbRBBCMAmdHOcELsVZEC6++nr0OUfEGC/nVRdOo7vvikDZD6zXNN70Vhtd1gP0OnOBqnRs7uKGCbPQF2mOr3cB+tFhX9qgkKj4fP1llwHtSL4nkPPRG26CqXS3oy8FM8qZsPHcJKUi5xaxnEnPxK2tEgUoAAYA9MZUHSLI5MFDCQyyOGvZihd+lzDrwj1YOV2fbztTm/nhqlyyLEUneecxEcgBEr3CCH8PQqSByD2lGQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vivo.com; dmarc=pass action=none header.from=vivo.com;
 dkim=pass header.d=vivo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vivo.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=55obZ+kvwCHjLjYM2qB+/d5MrTQT4QQR23koeSEhJPE=;
 b=CukVebCn+y2op6HzC8iP1nqME/tUvdjnCxwyBGyhpbH4gz6DxgIyyMygNLUxzGzlUgh8xOc8wUCrdXsoKmPJnAgZgto3vyqfg5p4ulJ9ayJYL2m22kknPRDtx8hQU0L8A3ZrZmiw6hUvK5vFosHJg7mvo3HvXfkEBbE53N3ylfUAkqHHwSrr4xA7dkGv0TV8BOn4/D68d071g7cCzK+Yj7hggOQLkA2VD3AUh1QO3CBB4iWVwuXPseVB6fDxAeZf8Eb7ta5AQLWwuYMnUzRvcaXHeEqj/o/apZjtq7TaMb9JDhAZwDh4HqoFEvOw3tYCwp4NL7GdrubIM8JwQI6OAw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=vivo.com;
Received: from SL2PR06MB3017.apcprd06.prod.outlook.com (2603:1096:100:3a::16)
 by TYSPR06MB6693.apcprd06.prod.outlook.com (2603:1096:400:478::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6792.20; Fri, 15 Sep
 2023 08:57:05 +0000
Received: from SL2PR06MB3017.apcprd06.prod.outlook.com
 ([fe80::deb4:b884:ed42:e52e]) by SL2PR06MB3017.apcprd06.prod.outlook.com
 ([fe80::deb4:b884:ed42:e52e%4]) with mapi id 15.20.6792.020; Fri, 15 Sep 2023
 08:57:05 +0000
To: Jaegeuk Kim <jaegeuk@kernel.org>,
	Chao Yu <chao@kernel.org>
Date: Fri, 15 Sep 2023 03:04:45 -0600
Message-Id: <3d8d905f27aafb2a8f376eda423b406720cea310.1694768423.git.bo.wu@vivo.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1694768423.git.bo.wu@vivo.com>
References: <cover.1694768423.git.bo.wu@vivo.com>
X-ClientProxiedBy: SG2P153CA0037.APCP153.PROD.OUTLOOK.COM (2603:1096:4:c6::6)
 To SL2PR06MB3017.apcprd06.prod.outlook.com
 (2603:1096:100:3a::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SL2PR06MB3017:EE_|TYSPR06MB6693:EE_
X-MS-Office365-Filtering-Correlation-Id: 8b1321f8-1b5b-4f8e-d113-08dbb5c9bbdc
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 5Kc6B+aFtH1mvHp+Jmoft1V3T7Kk4vFFpkVmKEQseKiNJ+at3qr8UncZfWNOpo+ljjYhV1ESO7Tj8RYykcw9DMNHCh8j5f+UnVfKLj0co7jYXAAlQGA+FCFJQiIKR9peofisynNnevdyiKj0gOiRLPU36ITR3TNLN5/6yIDGgefxt6C9aTVmJjk5N1u3HmzT51p2p2watu92WOfcgUEGWPe5ZFYis8ZyNT6LnwhYMNp8AKN8gQ22fUyF77OTGnJ8t0dlwrNhUMmkrWyN6q0GX0QdGpM+quouZwhxKC4yUbhlRWYrmwS8JCub2IkLMGagy57A4U3gbS0DXtC1ZOnRAyWHDIuXvNmfAO5kpGpLYzKXL7NncPM9Xgv/7h4yCnq+RnheiESdfR6jXKe5ENvZ5tl0WIDHpyxsyV/HTSo5GXCGIhzzXfn2uJq+q7hi9s3hs2qe5d70IrJiksoZ3v/vgDFRvQXh3ylj9xvDgq9RPh6LCj0UGURBO8XaMoXHGiXk1nlkRS/LEpLznnPG53I5Vk/klLvvuAzBfnzTNWmySpBeGVhSB/+Qc8Q9SH8LsR1yIWcW4m5/5fI3Ri7Tppu6l0q+8cXCZi530sEPU3fkplqzG6m1SjIkkAgROSmDi0vA
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SL2PR06MB3017.apcprd06.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(366004)(396003)(346002)(376002)(136003)(39860400002)(451199024)(1800799009)(186009)(86362001)(83380400001)(6512007)(2906002)(2616005)(26005)(107886003)(6666004)(6506007)(6486002)(52116002)(478600001)(38350700002)(54906003)(66556008)(66476007)(66946007)(316002)(36756003)(38100700002)(5660300002)(41300700001)(110136005)(8936002)(4326008)(8676002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?WKJch64WlVynJWy1EKOwMnYxu+OYdDrI/npGBSosqEC5wH88Kg8j9xId4Q+G?=
 =?us-ascii?Q?RlJC8Rl+16x6aXQR0Eakiwe4XZmDjbasuCRVMitsclHQwjTIXtJ9jGxbjI2r?=
 =?us-ascii?Q?zzqICTHQ1mIR5qBciYz/RPfyqT82ma8jYjrlIKO4TIrOodiVypsv7zK0Pd75?=
 =?us-ascii?Q?ByWza16zRKu3K6CqAy8aZ1jz65JuSvwN6MvPZ2sF8wvr6OAkPdw8E/8vl2/t?=
 =?us-ascii?Q?qy2xj5BxxkE9TX5ue48+GI/4WS6Dy6qJ8X9iVlHCjlytKXEJifIGQIka5tby?=
 =?us-ascii?Q?LJAqd7RHwLyWAVe1OONvKia05oS1tXn7uM8M1SMQrc3/2VTbRKlR+qzK4sT0?=
 =?us-ascii?Q?NwOCXniyHPPsgpYWX76yp+MmWRAYx9XKeSHB5DSeZ+scO6N8ZaPKbY+2/t1O?=
 =?us-ascii?Q?BTfOCh90/O8Nm9/toSjCdbFaSSC7JcohNYVCTfv0EDA112WtDqhaAIBPIrmI?=
 =?us-ascii?Q?ErU+dhxRnclv9GLOLWmWQG2hFilSYo8Y9pJhXIPhBcTm734CBvYXFCmmcPgU?=
 =?us-ascii?Q?of/xOP9tRZrklFwPtTDQ0OgW5+/MKw2ww3fSjjICCe8+TifDX7c6SAyao87C?=
 =?us-ascii?Q?M8ktt0v1QGdoQm0Byo/VmsA5vg6NK4p/8WcbQpGkPTi1DRxQP0Xlz5g9LI6o?=
 =?us-ascii?Q?bIZibJh0pi4XIoSWh+kYLA0iFRArl3vWcviZG1HWAczWhAxUm6hAMdBakoKM?=
 =?us-ascii?Q?abJxunv55XnzfdRfi6gL/q92b3p2wF9j0Quophhd7WTF8fU55yqI4bNPiZcN?=
 =?us-ascii?Q?IZQ7fMGF+HoLV9B8bBb3jaYTYLtLYwcYWYaBtudYKHYf0GO9cMlEPHTQIuab?=
 =?us-ascii?Q?bqyTb8o4hmIkA2CwiZ9fVrs7Pl0okceanlM+lNJPc76yy1JI0uBpWnDJ/Xt3?=
 =?us-ascii?Q?NMPGXdy6xjkdGgXBRqxxxvtqnBmkOvlfq/ycs2SIXC45i8VAn9KOBdLG4y91?=
 =?us-ascii?Q?Mrm/MXgjyrxlmNaEasUYDoAFMyin2WRFwm+t2yhXH+Iuc/I+6tyC5tQj8SR9?=
 =?us-ascii?Q?MDGbhmMow03hi0DQESibggI7xnTlChu+V+8EH+egsD7OYSqzyub17bdTc/+x?=
 =?us-ascii?Q?XAQ6ixH5VMV3+GCpXRzHiUEaSH2GIBAuh7CKO/dATVFdRDTlEgmbh1QnBz/a?=
 =?us-ascii?Q?825cX4F1kKqAWLrIiKqC2Ud9mec4JOYKUZb+b89rpB7lsNvEWKHXkuFfMBVw?=
 =?us-ascii?Q?49k/GY8FjGksE1fpt+cOs16b1VR5JedvlL1IeTs7eaKgAwTnLEJlVyALjGzU?=
 =?us-ascii?Q?bm+wVcy1Zp2GtjJrQ6U0rnkt1XeIScRxg77Uon5j5GRnTOr7dbGSwmncxE8D?=
 =?us-ascii?Q?hj9fnyfiIJtCA48A0Cme1zeyiH5w8JukDFkdTBWolMEW+L+VWWSLSddN9Zc5?=
 =?us-ascii?Q?PjbaWBv2XOLA6UJAHL8zqHIKzzYQYmhM0ySMFHJKICHrFUojhQ3tXKIRuM1k?=
 =?us-ascii?Q?xG/sAzso5eR71lqR/JUmC/dtG32Zx5q4iUUodBtwW2uomPBcIfshFMhDIn/F?=
 =?us-ascii?Q?0X72Z91NyiCdj4u94v4fryZ786xnxsGrdKVc03qIiSIGniKWQ49jUUs3L2GO?=
 =?us-ascii?Q?lIe6oV3likZ+c3WH320JDCvtGkHP1vVhlYv/3Fql?=
X-OriginatorOrg: vivo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8b1321f8-1b5b-4f8e-d113-08dbb5c9bbdc
X-MS-Exchange-CrossTenant-AuthSource: SL2PR06MB3017.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Sep 2023 08:57:05.0032 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 923e42dc-48d5-4cbe-b582-1a797a6412ed
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Q13QSXcG8dsQffS1qOUGgVc1skds0lLihUAcowqTaVdVMYZjwoKtBJar/PrHZDeld9PBSeCbqYzEiCq8MAkVEA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYSPR06MB6693
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: 'get_free_segments()' is implemented by traversing all
 segments
 to calculate the total free segments. It cosume much time. Every time when
 call 'find_next_free_block()' this calculation will do it again. So if we
 cache the free segments count, it will greatly improve performance of dfrag
 & resize & sload. --- fsck/f2fs.h [...] 
 Content analysis details:   (-0.2 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
 no trust [40.107.117.109 listed in list.dnswl.org]
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [40.107.117.109 listed in wl.mailspike.net]
 -0.0 SPF_HELO_PASS          SPF: HELO matches SPF record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
X-Headers-End: 1qh4dS-0076BY-OJ
Subject: [f2fs-dev] [PATCH 3/3] f2fs-tools: cache free segments count to
 improve perfmance
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
From: Wu Bo via Linux-f2fs-devel <linux-f2fs-devel@lists.sourceforge.net>
Reply-To: Wu Bo <bo.wu@vivo.com>
Cc: Wu Bo <wubo.oduw@gmail.com>, Wu Bo <bo.wu@vivo.com>,
 linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

'get_free_segments()' is implemented by traversing all segments to
calculate the total free segments. It cosume much time.

Every time when call 'find_next_free_block()' this calculation will
do it again. So if we cache the free segments count, it will greatly
improve performance of dfrag & resize & sload.
---
 fsck/f2fs.h    | 1 +
 fsck/mount.c   | 9 +++++++--
 fsck/segment.c | 2 ++
 3 files changed, 10 insertions(+), 2 deletions(-)

diff --git a/fsck/f2fs.h b/fsck/f2fs.h
index e65644e..a7cdc4c 100644
--- a/fsck/f2fs.h
+++ b/fsck/f2fs.h
@@ -197,6 +197,7 @@ struct f2fs_sm_info {
 	unsigned int main_segments;
 	unsigned int reserved_segments;
 	unsigned int ovp_segments;
+	unsigned int free_segments;
 };
 
 struct f2fs_dentry_ptr {
diff --git a/fsck/mount.c b/fsck/mount.c
index dccaae2..b965c5d 100644
--- a/fsck/mount.c
+++ b/fsck/mount.c
@@ -123,7 +123,7 @@ void update_free_segments(struct f2fs_sb_info *sbi)
 	if (c.dbg_lv)
 		return;
 
-	MSG(0, "\r [ %c ] Free segments: 0x%x", progress[i % 5], get_free_segments(sbi));
+	MSG(0, "\r [ %c ] Free segments: 0x%x", progress[i % 5], SM_I(sbi)->free_segments);
 	fflush(stdout);
 	i++;
 }
@@ -2430,6 +2430,10 @@ static int build_sit_entries(struct f2fs_sb_info *sbi)
 
 			check_block_count(sbi, segno, &sit);
 			seg_info_from_raw_sit(sbi, se, &sit);
+			if (se->valid_blocks == 0x0 &&
+				is_usable_seg(sbi, segno) &&
+				!IS_CUR_SEGNO(sbi, segno))
+				SM_I(sbi)->free_segments++;
 		}
 		start_blk += readed;
 	} while (start_blk < sit_blk_cnt);
@@ -2485,6 +2489,7 @@ static int early_build_segment_manager(struct f2fs_sb_info *sbi)
 	sm_info->ovp_segments = get_cp(overprov_segment_count);
 	sm_info->main_segments = get_sb(segment_count_main);
 	sm_info->ssa_blkaddr = get_sb(ssa_blkaddr);
+	sm_info->free_segments = 0;
 
 	if (build_sit_info(sbi) || build_curseg(sbi)) {
 		free(sm_info);
@@ -2805,7 +2810,7 @@ int find_next_free_block(struct f2fs_sb_info *sbi, u64 *to, int left,
 
 	if (*to > 0)
 		*to -= left;
-	if (get_free_segments(sbi) <= SM_I(sbi)->reserved_segments + 1)
+	if (SM_I(sbi)->free_segments <= SM_I(sbi)->reserved_segments + 1)
 		not_enough = 1;
 
 	while (*to >= SM_I(sbi)->main_blkaddr && *to < end_blkaddr) {
diff --git a/fsck/segment.c b/fsck/segment.c
index 0307bdd..1cb7d02 100644
--- a/fsck/segment.c
+++ b/fsck/segment.c
@@ -77,6 +77,8 @@ int reserve_new_block(struct f2fs_sb_info *sbi, block_t *to,
 	se = get_seg_entry(sbi, GET_SEGNO(sbi, blkaddr));
 	offset = OFFSET_IN_SEG(sbi, blkaddr);
 	se->type = type;
+	if (se->valid_blocks == 0)
+		SM_I(sbi)->free_segments--;
 	se->valid_blocks++;
 	f2fs_set_bit(offset, (char *)se->cur_valid_map);
 	if (need_fsync_data_record(sbi)) {
-- 
2.25.1



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
