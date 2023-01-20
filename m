Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E71667560A
	for <lists+linux-f2fs-devel@lfdr.de>; Fri, 20 Jan 2023 14:41:30 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1pIre5-00073s-1F;
	Fri, 20 Jan 2023 13:41:28 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <frank.li@vivo.com>) id 1pIrdp-00073f-4A
 for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 20 Jan 2023 13:41:12 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=MIME-Version:Content-Type:Content-Transfer-Encoding
 :References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=mLOdM8LVsxaz86Ehuw6AfCW5Tg8yFGJpSkcggspwKKM=; b=YTwHw93fqUaFOigSm50RIuYuWq
 vzWiMeyqrbTlY0VSgScptP6CtU3xSUxgW6sxSp12lVKThHY/DrD41NjvMLAJIGu4wlqXOSJXZSKt1
 G6sbnXF5UdyckyfM52gFalkMVLIekaBuawJsucm255+vlzm3AXHgLOHqPMHoHSr/VFLw=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=MIME-Version:Content-Type:Content-Transfer-Encoding:References:
 In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=mLOdM8LVsxaz86Ehuw6AfCW5Tg8yFGJpSkcggspwKKM=; b=fR+1XiFQN0kjYyJgvpgmsj8/4R
 oXRxOebCkkJT8uZO47n8pp/nMu3U16Y4PAkIaB2fLQ8IUycVDl9FgUTztUmiLmm3n6z/kUxzJ8anV
 Q3exo2hIH77uHuWYTbgBGLd0p33bq8NRUA7u3VS08xqtk+JsVGVFM7WKQNM6DQPurgUw=;
Received: from mail-psaapc01on2129.outbound.protection.outlook.com
 ([40.107.255.129] helo=APC01-PSA-obe.outbound.protection.outlook.com)
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1pIrdn-00AF7t-IR for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 20 Jan 2023 13:41:12 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=mWygaqxgitnd8dn2c+qGk6UjnUe/RnweViC29rKSi1/7KP2z05Min7QOxMiU3J5lF/I4rrdPgrLdLC3TtFDDLfFtwsIYAvAmXamYjDvdv5ywX13NEn7cNN2SJsAs/XCPZCJY/jxKPDrRHMCOu/3PRJb7lyZzmNXmQKnH9yWA9oP2xv/w7XRjeHJovEqKVyALZ+jMGERnJwjRdj+HIZaUiBAIm2aVGLjIyTkq3Ycx2f4DcPCMq8uf6eMWYwgbqIuD7kB80zf952cF3P1iYGqGLlnmeG8IsRGBocsyKBsgRW+QKy65ua/1lZICyI6W7Yap1/DML3M2QWOJiOVX8wH/aw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mLOdM8LVsxaz86Ehuw6AfCW5Tg8yFGJpSkcggspwKKM=;
 b=kMKr+CsACZYrbp8Hds/N1UgO6q92vPBe9rLHHDSMfpZbO3upH6DQJnM6UPiSzNa/wKMQbS+INgXDhngZq2cXhJejuMWgO/78DH9mK0VcQRT9pK2ZZxKskrH8FCtpxOC3U8lkmkaaW+T2GxfAk0tHOuzuUYlN7aqfVCnQxpKYpCLVE6u4OQQFyJ7awKmdXW2jr9efhoc4mgefyhCLqfNy0pIk+Z5rXt2I1nMnvSbLCpQbIYw1RYTigeHHAsz37jLcXgGCK+IBW/hYEnGKdhwS9SBj9QDAV9OD/r5Jsnbj0SygkJvUV3abszi6aP4mh4rBG/m6NSWTuiMNpzVKlcK6wA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vivo.com; dmarc=pass action=none header.from=vivo.com;
 dkim=pass header.d=vivo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vivo.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mLOdM8LVsxaz86Ehuw6AfCW5Tg8yFGJpSkcggspwKKM=;
 b=kS4Jz2b/8wJAuU/eNVLPGmz/3RGi9hVWb1xyYDMitKXVLbKGfjQi0H9fy/YBGrByPTjmuHI+k7wTUU33fIkWSN5/5xPZvlZSIo4aw3Gi1jJAgdkFb9JTeNxaj51zsHW2HmU/lSE3R2YSW3UGs+ZB4Fu/GM6A3D/2sF+jfg5NqdYWtMTgFAFvuOHrDclLXbALYgmz8966FqRAGQ2jG01mHtOpNwggcwenG63y/j20R0IOuI4aY215fzYNWrU4UQLWokOQ+TcEKaE9raqgZP8OxfzOpHV/2YMtjYR02sG5FKXigxdFOFqrdtYnoRnEpdT3MsxJXd9ZzSga6DjqBZHC9Q==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=vivo.com;
Received: from SEZPR06MB5269.apcprd06.prod.outlook.com (2603:1096:101:78::6)
 by TY0PR06MB5127.apcprd06.prod.outlook.com (2603:1096:400:1b2::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6043.5; Fri, 20 Jan
 2023 13:40:56 +0000
Received: from SEZPR06MB5269.apcprd06.prod.outlook.com
 ([fe80::3e52:d08c:ecf4:d572]) by SEZPR06MB5269.apcprd06.prod.outlook.com
 ([fe80::3e52:d08c:ecf4:d572%5]) with mapi id 15.20.6002.012; Fri, 20 Jan 2023
 13:40:55 +0000
To: jaegeuk@kernel.org,
	chao@kernel.org
Date: Fri, 20 Jan 2023 21:40:29 +0800
Message-Id: <20230120134029.69200-4-frank.li@vivo.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20230120134029.69200-1-frank.li@vivo.com>
References: <20230120134029.69200-1-frank.li@vivo.com>
X-ClientProxiedBy: SG2PR06CA0234.apcprd06.prod.outlook.com
 (2603:1096:4:ac::18) To SEZPR06MB5269.apcprd06.prod.outlook.com
 (2603:1096:101:78::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SEZPR06MB5269:EE_|TY0PR06MB5127:EE_
X-MS-Office365-Filtering-Correlation-Id: d5d70597-7217-44d4-9901-08dafaebf4c8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: ZUlJPiQfTYT0/hMnJM5SlxgETyLURTu0prdUkakWb/9gaVOYw0b5OIsbch6UF6TlwvhzbNpCo/3ajfPSYFbGYYjZaZg9dFvRGg9wOw+fPl5oxk1kIofmSGKLVsr2wymnQHloAnu6d/gZwlzXRHTnB9SxRbEPc7LpU04rpoawbWj1bZ2UGLuN0WJzUPHCiH8wv2IP1zOhg+0A1cRmaGePugbFvdBzDtqNqxhFbT7rR1lzQyslRkQ8yjRi6btuQG5LHXbDQcJePJpQqzksuNl9h39D0SXO+2QAqJxWYWG4xrK2baJcR9ECztA38XPUfpciwP5Qkyn/WlcRRoB1qEp7/s3OmfjRAWNpPs22yzgl6+Viucu8FLRHBRARq0TuktJ2I+kkTMGNGUN/Xx2luHbZCmKzsXiU76dNKw0a7Ebk0YSQTaeFMrcyWnOD+XU3Ks1bmmC+9AxHyFfrVuxIJuD/+PmbQQ4TxLy46XzJm+dg2KB0/buqXIb56pi0msv+ESUhoJf3pVM1e4BAMLG7kVV8X9O91TqVQ3fSCntjqJOJT6ZhcONRz7VcC3irugfHaNyznm5jUYLewqkQoq3DnKHU51MRH9VPTESEUInEWvPPwD5QBiqsp5I3Q5L7MA+b/rx1lZKUCyDjUaoJml74IKhx1P9H2GJ/klc5QelyLWtravmnL763cHsyRjsWk5BALk6/YdpUVWVY6g7zEX23KCEm2w==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SEZPR06MB5269.apcprd06.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(4636009)(366004)(376002)(346002)(136003)(396003)(39860400002)(451199015)(19627235002)(316002)(38350700002)(6506007)(38100700002)(66556008)(66476007)(66946007)(6666004)(107886003)(2906002)(1076003)(2616005)(4326008)(26005)(52116002)(478600001)(8676002)(8936002)(186003)(6512007)(5660300002)(83380400001)(36756003)(41300700001)(86362001)(6486002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?svZaHbfGHIEgDb0RXUIDDxW9kdW7bKoYatlAxP4NTrzy4Nnq9QKpWGTCXWPJ?=
 =?us-ascii?Q?q098ji+LH9PJZS25+gfykaOU9WIJbLaOT0Y59ucMp5DiKKyudxLyBV8QRffN?=
 =?us-ascii?Q?qhwl976riDwk0aRCRKhqobL/2Gtf32zjcfVEXIdAjzyzQSwiap2QjWKTWRJJ?=
 =?us-ascii?Q?HsfDc5ivGHVt4XwLeSKSR6HYq4hScu2v6tD8HBl7Vey74I/pkw6i5TCI8BLV?=
 =?us-ascii?Q?1N5jMc6KEmMIDn9AuPulGKIoRFGfB2fNHgGWqgtC296VxbChpxG3LQpKkW/j?=
 =?us-ascii?Q?0QNYde5NiZMPz+4OtCQaoOF/MXZByEezYZeVOxzK9LeIPUeamtKzyKS2LAmJ?=
 =?us-ascii?Q?NP7k3YvrEO0XX1s0YWMRC1vxXDGMKFOZ8xgTKQZNfDdgC+TAcUFS703K6xPE?=
 =?us-ascii?Q?8OtiD852ct2fPkm2LLjddJ8piGj4t2VYG/1ivBz27psyw/VG8rp8/Ru8HA7g?=
 =?us-ascii?Q?l4lX0qJfA3VUECguXCFxabsNjM3s8lk6+iVOUVMrSd8Oo6bhJDEHbzbwkx5g?=
 =?us-ascii?Q?ZYP+b9XAbjRho1UKg9YZvW2vdnywGqVeXTJlGZj5lWwAyoOxeho+kSbF9orK?=
 =?us-ascii?Q?/8+B59K2zS6IegNizTuU6Vf/sBLuFt0CraPlEkDKNVMIJCKh217f6AvADVvH?=
 =?us-ascii?Q?S4uSQqkFntqdWFj15PBDKyzrKc8MEXoIH4Xl667UjqsNw1oHBbAx444aNKjy?=
 =?us-ascii?Q?2CQ5T5IR980p6EfJGXI/0RkhylMNL1KSBPqAJX0h6Fjbk8A8AEhHBTPloOug?=
 =?us-ascii?Q?CmJqfhvjluH+emLzoSOCAhx9/9kbImsdFpa4pouoKb2fOuZ/WotqNCNU6Pz2?=
 =?us-ascii?Q?jnUg/RwforTohVeozP7rP8Vinuf/L2d7gMmznNpz6IwyFhsWT1iKy/uzVfAN?=
 =?us-ascii?Q?ugJK3sYtMuAu9Nynwb/dVpIvNN0xFpTQsPzHdilCmh1AgQ8QROhBrHoFq7cB?=
 =?us-ascii?Q?e33jPwA2n32Q5XgWAeod3n4YMwCR9xXdwysxXmF3Pg8Co79t+xZLWKv3HYJ8?=
 =?us-ascii?Q?b0Rvrlp70PwCOHBfpu5O5GCyJBWJIG4aMD1cZcivaVbT3bJdga0uVzvBBfuL?=
 =?us-ascii?Q?9qI/+tk8EQoHRlYz5F+ab6E+GrRAxzoV6DykcgkHxifPWKxS1Lhly+rxLjeQ?=
 =?us-ascii?Q?CkNq9ID2QOCa+gCbDqSGrCOkeLcu6PWbIvoJ13RM+m0dnVg7zI2dcDw5SLmU?=
 =?us-ascii?Q?aCF/bQh42ijk8AC4iZ8NRyCCMTwjpLK9HGonyMpRPqNh3hMdVba3915mzrPk?=
 =?us-ascii?Q?Q12DrdHMY8DSv+JfUu81g2ABe1aNGfaYfMc9qx5EgEwN9PdrO9rAr54n65Tb?=
 =?us-ascii?Q?Z0H96JMcKR1QHzruT0MPQeRvnRIo/7QpB2PjnXR58eJ46xHQUzzLbDcbG93A?=
 =?us-ascii?Q?0JX1nuYLmk70XYd2ZIJ6XGTWj5IScwdrNMhiacPlBz6g7A3CuvjHVZHOGyHk?=
 =?us-ascii?Q?Z2pBrkzwPv+sTK61PneDjJj/gWHsJi6YOpfStnwynLiCZB1zIAjmSwhViczA?=
 =?us-ascii?Q?Rk1yUiN6d1MiMhW+jF8mPdnVVFpr0mxdWqk2ZWERUk8bKng2Up0coUesDCNl?=
 =?us-ascii?Q?rGC6HrRXH0UXfO+cmQtv/JeMva6NjegAc6wDf3kM?=
X-OriginatorOrg: vivo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d5d70597-7217-44d4-9901-08dafaebf4c8
X-MS-Exchange-CrossTenant-AuthSource: SEZPR06MB5269.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Jan 2023 13:40:55.8485 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 923e42dc-48d5-4cbe-b582-1a797a6412ed
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: PneOskVXex82iWQAgRf65AkqA2+J76zUPd/HGGDA2ZZyvfHrztIWu+sfGZtd1zDZNGoZJn+bd+3/HRLGPF9bcw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY0PR06MB5127
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: User can control f2fs ipu policy through
 /sys/fs/f2fs/<disk>/ipu_policy, 
 export related definitions and introduce new macro to make it more convenient
 for users to use. Signed-off-by: Yangtao Li <frank.li@vivo.com> ---
 Documentation/ABI/testing/sysfs-fs-f2fs
 | 25 ++++++------ fs/f2fs/segment.c | 2 +- fs/f2fs/segment.h | 37 ++
 fs/f2fs/super.c | 2 +- fs/ [...] 
 Content analysis details:   (-0.2 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [40.107.255.129 listed in wl.mailspike.net]
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
 no trust [40.107.255.129 listed in list.dnswl.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.0 SPF_HELO_PASS          SPF: HELO matches SPF record
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
X-Headers-End: 1pIrdn-00AF7t-IR
Subject: [f2fs-dev] [PATCH 4/4] f2fs: move ipu_policy definitions to
 separated file
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

User can control f2fs ipu policy through /sys/fs/f2fs/<disk>/ipu_policy,
export related definitions and introduce new macro to make it more
convenient for users to use.

Signed-off-by: Yangtao Li <frank.li@vivo.com>
---
 Documentation/ABI/testing/sysfs-fs-f2fs | 25 ++++++------
 fs/f2fs/segment.c                       |  2 +-
 fs/f2fs/segment.h                       | 37 ++---------------
 fs/f2fs/super.c                         |  2 +-
 fs/f2fs/sysfs.c                         |  2 +-
 include/uapi/linux/f2fs.h               | 54 +++++++++++++++++++++++++
 6 files changed, 73 insertions(+), 49 deletions(-)

diff --git a/Documentation/ABI/testing/sysfs-fs-f2fs b/Documentation/ABI/testing/sysfs-fs-f2fs
index 64b15a28fe30..d05ad2bc56d1 100644
--- a/Documentation/ABI/testing/sysfs-fs-f2fs
+++ b/Documentation/ABI/testing/sysfs-fs-f2fs
@@ -49,18 +49,19 @@ Contact:	"Jaegeuk Kim" <jaegeuk.kim@samsung.com>
 Description:	Controls the in-place-update policy.
 		updates in f2fs. User can set:
 
-		====  =================
-		0x01  F2FS_IPU_FORCE
-		0x02  F2FS_IPU_SSR
-		0x04  F2FS_IPU_UTIL
-		0x08  F2FS_IPU_SSR_UTIL
-		0x10  F2FS_IPU_FSYNC
-		0x20  F2FS_IPU_ASYNC
-		0x40  F2FS_IPU_NOCACHE
-		0x80  F2FS_IPU_HONOR_OPU_WRITE
-		====  =================
-
-		Refer segment.h for details.
+		====  ============================
+		0x00  SET_F2FS_IPU_DISABLE
+		0x01  SET_F2FS_IPU_FORCE
+		0x02  SET_F2FS_IPU_SSR
+		0x04  SET_F2FS_IPU_UTIL
+		0x08  SET_F2FS_IPU_SSR_UTIL
+		0x10  SET_F2FS_IPU_FSYNC
+		0x20  SET_F2FS_IPU_ASYNC
+		0x40  SET_F2FS_IPU_NOCACHE
+		0x80  SET_F2FS_IPU_HONOR_OPU_WRITE
+		====  ============================
+
+		Refer include/uapi/linux/f2fs.h for details.
 
 What:		/sys/fs/f2fs/<disk>/min_ipu_util
 Date:		November 2013
diff --git a/fs/f2fs/segment.c b/fs/f2fs/segment.c
index a007f5084e84..c56f5a80d3a6 100644
--- a/fs/f2fs/segment.c
+++ b/fs/f2fs/segment.c
@@ -5138,7 +5138,7 @@ int f2fs_build_segment_manager(struct f2fs_sb_info *sbi)
 		sm_info->rec_prefree_segments = DEF_MAX_RECLAIM_PREFREE_SEGMENTS;
 
 	if (!f2fs_lfs_mode(sbi))
-		sm_info->ipu_policy = BIT(F2FS_IPU_FSYNC);
+		sm_info->ipu_policy = SET_F2FS_IPU_FSYNC;
 	sm_info->min_ipu_util = DEF_MIN_IPU_UTIL;
 	sm_info->min_fsync_blocks = DEF_MIN_FSYNC_BLOCKS;
 	sm_info->min_seq_blocks = sbi->blocks_per_seg;
diff --git a/fs/f2fs/segment.h b/fs/f2fs/segment.h
index 50c63155ad56..c064ddffe91b 100644
--- a/fs/f2fs/segment.h
+++ b/fs/f2fs/segment.h
@@ -7,6 +7,7 @@
  */
 #include <linux/blkdev.h>
 #include <linux/backing-dev.h>
+#include <uapi/linux/f2fs.h>
 
 /* constant macro */
 #define NULL_SEGNO			((unsigned int)(~0))
@@ -646,51 +647,19 @@ static inline int utilization(struct f2fs_sb_info *sbi)
 					sbi->user_block_count);
 }
 
-/*
- * Sometimes f2fs may be better to drop out-of-place update policy.
- * And, users can control the policy through sysfs entries.
- * There are five policies with triggering conditions as follows.
- * F2FS_IPU_FORCE - all the time,
- * F2FS_IPU_SSR - if SSR mode is activated,
- * F2FS_IPU_UTIL - if FS utilization is over threashold,
- * F2FS_IPU_SSR_UTIL - if SSR mode is activated and FS utilization is over
- *                     threashold,
- * F2FS_IPU_FSYNC - activated in fsync path only for high performance flash
- *                     storages. IPU will be triggered only if the # of dirty
- *                     pages over min_fsync_blocks. (=default option)
- * F2FS_IPU_ASYNC - do IPU given by asynchronous write requests.
- * F2FS_IPU_NOCACHE - disable IPU bio cache.
- * F2FS_IPU_HONOR_OPU_WRITE - use OPU write prior to IPU write if inode has
- *                            FI_OPU_WRITE flag.
- * F2FS_IPU_DISABLE - disable IPU. (=default option in LFS mode)
- */
 #define DEF_MIN_IPU_UTIL	70
 #define DEF_MIN_FSYNC_BLOCKS	8
 #define DEF_MIN_HOT_BLOCKS	16
 
 #define SMALL_VOLUME_SEGMENTS	(16 * 512)	/* 16GB */
 
-#define F2FS_IPU_DISABLE	0
-
-/* Modification on enum should be synchronized with ipu_mode_names array */
-enum {
-	F2FS_IPU_FORCE,
-	F2FS_IPU_SSR,
-	F2FS_IPU_UTIL,
-	F2FS_IPU_SSR_UTIL,
-	F2FS_IPU_FSYNC,
-	F2FS_IPU_ASYNC,
-	F2FS_IPU_NOCACHE,
-	F2FS_IPU_HONOR_OPU_WRITE,
-	F2FS_IPU_MAX,
-};
-
 #define F2FS_IPU_POLICY(name)					\
 static inline int IS_##name(struct f2fs_sb_info *sbi)		\
 {								\
-	return SM_I(sbi)->ipu_policy & BIT(name);		\
+	return TEST_##name(SM_I(sbi)->ipu_policy);		\
 }
 
+F2FS_IPU_POLICY(F2FS_IPU_DISABLE);
 F2FS_IPU_POLICY(F2FS_IPU_FORCE);
 F2FS_IPU_POLICY(F2FS_IPU_SSR);
 F2FS_IPU_POLICY(F2FS_IPU_UTIL);
diff --git a/fs/f2fs/super.c b/fs/f2fs/super.c
index ebc76683f05d..b19085fa335a 100644
--- a/fs/f2fs/super.c
+++ b/fs/f2fs/super.c
@@ -4085,7 +4085,7 @@ static void f2fs_tuning_parameters(struct f2fs_sb_info *sbi)
 		if (f2fs_block_unit_discard(sbi))
 			SM_I(sbi)->dcc_info->discard_granularity = MIN_DISCARD_GRANULARITY;
 		if (F2FS_OPTION(sbi).fs_mode != FS_MODE_LFS)
-			SM_I(sbi)->ipu_policy = BIT(F2FS_IPU_FORCE) | BIT(F2FS_IPU_HONOR_OPU_WRITE);
+			SM_I(sbi)->ipu_policy = SET_F2FS_IPU_FORCE | SET_F2FS_IPU_HONOR_OPU_WRITE;
 	}
 
 	sbi->readdir_ra = true;
diff --git a/fs/f2fs/sysfs.c b/fs/f2fs/sysfs.c
index aaf5d8650518..375ace5f330d 100644
--- a/fs/f2fs/sysfs.c
+++ b/fs/f2fs/sysfs.c
@@ -165,7 +165,7 @@ static ssize_t ipu_mode_show(struct f2fs_attr *a,
 {
 	int len = 0, i = 0;
 
-	if (SM_I(sbi)->ipu_policy == F2FS_IPU_DISABLE)
+	if (IS_F2FS_IPU_DISABLE(sbi))
 		return sysfs_emit(buf, "DISABLE\n");
 
 	for_each_set_bit(i, &SM_I(sbi)->ipu_policy, F2FS_IPU_MAX)
diff --git a/include/uapi/linux/f2fs.h b/include/uapi/linux/f2fs.h
index 955d440be104..1b672fb6af91 100644
--- a/include/uapi/linux/f2fs.h
+++ b/include/uapi/linux/f2fs.h
@@ -5,6 +5,60 @@
 #include <linux/types.h>
 #include <linux/ioctl.h>
 
+/*
+ * For /sys/fs/f2fs/<disk>/ipu_policy entry
+ *
+ * Sometimes f2fs may be better to drop out-of-place update policy.
+ * And, users can control the policy through sysfs entries.
+ * There are five policies with triggering conditions as follows.
+ * F2FS_IPU_FORCE - all the time,
+ * F2FS_IPU_SSR - if SSR mode is activated,
+ * F2FS_IPU_UTIL - if FS utilization is over threashold,
+ * F2FS_IPU_SSR_UTIL - if SSR mode is activated and FS utilization is over
+ *                     threashold,
+ * F2FS_IPU_FSYNC - activated in fsync path only for high performance flash
+ *                     storages. IPU will be triggered only if the # of dirty
+ *                     pages over min_fsync_blocks. (=default option)
+ * F2FS_IPU_ASYNC - do IPU given by asynchronous write requests.
+ * F2FS_IPU_NOCACHE - disable IPU bio cache.
+ * F2FS_IPU_HONOR_OPU_WRITE - use OPU write prior to IPU write if inode has
+ *                            FI_OPU_WRITE flag.
+ * F2FS_IPU_DISABLE - disable IPU. (=default option in LFS mode)
+ */
+#define F2FS_IPU_DISABLE	0
+/* Modification on enum should be synchronized with ipu_mode_names array */
+enum {
+	F2FS_IPU_FORCE,
+	F2FS_IPU_SSR,
+	F2FS_IPU_UTIL,
+	F2FS_IPU_SSR_UTIL,
+	F2FS_IPU_FSYNC,
+	F2FS_IPU_ASYNC,
+	F2FS_IPU_NOCACHE,
+	F2FS_IPU_HONOR_OPU_WRITE,
+	F2FS_IPU_MAX,
+};
+
+#define SET_F2FS_IPU_DISABLE				F2FS_IPU_DISABLE
+#define SET_F2FS_IPU_FORCE					BIT(F2FS_IPU_FORCE)
+#define SET_F2FS_IPU_SSR					BIT(F2FS_IPU_SSR)
+#define SET_F2FS_IPU_UTIL					BIT(F2FS_IPU_UTIL)
+#define SET_F2FS_IPU_SSR_UTIL				BIT(F2FS_IPU_SSR_UTIL)
+#define SET_F2FS_IPU_FSYNC					BIT(F2FS_IPU_FSYNC)
+#define SET_F2FS_IPU_ASYNC					BIT(F2FS_IPU_ASYNC)
+#define SET_F2FS_IPU_NOCACHE				BIT(F2FS_IPU_NOCACHE)
+#define SET_F2FS_IPU_HONOR_OPU_WRITE		BIT(F2FS_IPU_HONOR_OPU_WRITE)
+
+#define TEST_F2FS_IPU_DISABLE(val)			((val) == F2FS_IPU_DISABLE)
+#define TEST_F2FS_IPU_FORCE(val)			((val) & BIT(F2FS_IPU_FORCE))
+#define TEST_F2FS_IPU_SSR(val)				((val) & BIT(F2FS_IPU_SSR))
+#define TEST_F2FS_IPU_UTIL(val)				((val) & BIT(F2FS_IPU_UTIL))
+#define TEST_F2FS_IPU_SSR_UTIL(val)			((val) & BIT(F2FS_IPU_SSR_UTIL))
+#define TEST_F2FS_IPU_FSYNC(val)			((val) & BIT(F2FS_IPU_FSYNC))
+#define TEST_F2FS_IPU_ASYNC(val)			((val) & BIT(F2FS_IPU_ASYNC))
+#define TEST_F2FS_IPU_NOCACHE(val)			((val) & BIT(F2FS_IPU_NOCACHE))
+#define TEST_F2FS_IPU_HONOR_OPU_WRITE(val)	((val) & BIT(F2FS_IPU_HONOR_OPU_WRITE))
+
 /*
  * f2fs-specific ioctl commands
  */
-- 
2.25.1



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
