Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id B2F9A6D0917
	for <lists+linux-f2fs-devel@lfdr.de>; Thu, 30 Mar 2023 17:08:21 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1phtsu-0007ZB-6w;
	Thu, 30 Mar 2023 15:08:15 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <frank.li@vivo.com>) id 1phtss-0007Yr-Cm
 for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 30 Mar 2023 15:08:13 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=MIME-Version:Content-Type:Content-Transfer-Encoding
 :Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=Ep6jCiBZFOK5sfmIWmS+t9P8InWyzWCE3IlL3A1eAps=; b=ZjX0SVogwtIek1W9bmbkpztgkx
 EQOI6BzxSlw656XMxD37HNh1oKPVXzSvJxxMi1QaucGAcwvu47Wk988x8TDaQ0SD1sFHARPDZNvkp
 p3dccdd+XXAk/TQbqAZxsN1T8AhNvvKQqrTKoNJWt7vPXD3CvsR56Q+sAOUD4gtzoatA=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:Date:
 Subject:Cc:To:From:Sender:Reply-To:Content-ID:Content-Description:Resent-Date
 :Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=Ep6jCiBZFOK5sfmIWmS+t9P8InWyzWCE3IlL3A1eAps=; b=N
 aXMb5A7zhsSe8oWoAJIL5UglCVqE/LgMQmdJHg1C/aV6Gj0/1CscOd192wuo2aTZ+Rf+g11mGpTx/
 X16XmwIA1q+I2Tnl537F9Rbgyx+ztctkQN3/VJ2u2DrPDpJTjhtQPV7mCIb61RDDQGFNG0KKGxZJU
 3rmdNIYctgNFz5ZY=;
Received: from mail-tyzapc01on2097.outbound.protection.outlook.com
 ([40.107.117.97] helo=APC01-TYZ-obe.outbound.protection.outlook.com)
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1phtsl-009ob1-Hz for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 30 Mar 2023 15:08:13 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=XtTsp/1BJ2Nao9u5+/qZcxYWQhouCvxpa9ICEYgHs6T4ZSQ4DpTnrKuhsJr4KzgZ5B3+spLuYVa03Ce4OhkwpzNC0AWKFAh37tDYF7TUq7z/UTFNCnAUhXSS/Gbqa1dTFmtKVTN6OSMznCENOnWCOMLV6vvJijxYl9sCcGrGF2K5ZP8LhvccBkrcGFBIznKlP6S4pLxl5zT7Zv/S8q0dbQqD4JNc/2wrqfk8OVhRJLDD2P0kCYK0uTE3fjHa60pezTPmTu3K4hHapnoXt9IXfgbUh943peAPy2UW37Juv2MWBjimCz+fyy6QUVeZ2nkv0bf1V6W5B8gsVS/+vHVxiw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Ep6jCiBZFOK5sfmIWmS+t9P8InWyzWCE3IlL3A1eAps=;
 b=lmZEDqpFdHgcvWhD7EcV8LNRAyniFyrygXUYPcr96FjQt/dJs9rR+/tGRQ2CHXKo0IewrCkRO5wFbouqUYE5zt91K1v4i7dDhUDHKFpSX5dRbMXJeAYsCA6JHqbLFfomlyn1o09VlrCaYX/infbzd3O1154+IVw/Tpm+CWNj1isyOXAzKfTEzm9pc77OA8VgZ7Pxk41uwyLVuBJt2IHa9XGe9MM6R5r2YbEHFxFV2ih4v7zOTrpVm3O2jwnm3hqQwJ5iBG5TADQIq7bojmC8dlkkBr4qsiFYnjjnbV8y+9BEdzq91AUQ1yAuP28TL/KV1B1Rt89WqsNnvlzkD+Jn/A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vivo.com; dmarc=pass action=none header.from=vivo.com;
 dkim=pass header.d=vivo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vivo.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Ep6jCiBZFOK5sfmIWmS+t9P8InWyzWCE3IlL3A1eAps=;
 b=BhLgDseUADhHBR1bEHYKdXW/M2alwBjzjLESTXJ23ULcwkSILdC4mep4UDXc1LDBUgSbB6dt8Y8zYUQZpNsHImMMpZv6JflRdn0dnjTj4Q1wHML3a3jt0pU1+vsiwTfaOqHVR49v4BLkna7lydPVpi+YSPm/znZwY1c1Vu36PqFjhsABzyVPMheq7KyfpNcGu0fm7hCQP527GiSa3bPRBfuTy4GSS82VNQWCDGbWxYp0WhANFT5lb8DF07DRbZsCfLqtyPBXDYDVJmg1fiq2w9pck+W5SxWBPg33M4FyYY1yK7RFC2+0EstivZpvisxoPdQv+Dfwappzct4iLjOp2Q==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=vivo.com;
Received: from SEZPR06MB5269.apcprd06.prod.outlook.com (2603:1096:101:78::6)
 by PUZPR06MB4630.apcprd06.prod.outlook.com (2603:1096:301:b1::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6222.34; Thu, 30 Mar
 2023 15:07:54 +0000
Received: from SEZPR06MB5269.apcprd06.prod.outlook.com
 ([fe80::a3a1:af8e:be1e:437c]) by SEZPR06MB5269.apcprd06.prod.outlook.com
 ([fe80::a3a1:af8e:be1e:437c%6]) with mapi id 15.20.6222.033; Thu, 30 Mar 2023
 15:07:54 +0000
To: jaegeuk@kernel.org,
	chao@kernel.org
Date: Thu, 30 Mar 2023 23:07:41 +0800
Message-Id: <20230330150741.73158-1-frank.li@vivo.com>
X-Mailer: git-send-email 2.35.1
X-ClientProxiedBy: SI2PR02CA0047.apcprd02.prod.outlook.com
 (2603:1096:4:196::14) To SEZPR06MB5269.apcprd06.prod.outlook.com
 (2603:1096:101:78::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SEZPR06MB5269:EE_|PUZPR06MB4630:EE_
X-MS-Office365-Filtering-Correlation-Id: 03097127-c38a-4f56-075e-08db31308955
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: BwkvKK1M7D0tZTMjTNQzgng03y1whT0Cqi2wbSgUOnqdpvvLXa2qsQI1JcrJXHj7amE46LxiSLYL4x+oo/P9mH5xrNL8it/ar72w0uLD/cI20vJt4Okua2OC3fCPXGQm4cxkDb8XqAuiFHvJBV3bzeisS7pgxLkkCdfz4P6btYS7Zm8DUqd5LotiaE00Ku7+gDTgDetSiWFGNkP3aSxLGomv3z1Fot8S8zaEua+1NDuG4zUCXoemEyJ3yivIegaVBibAHTUO8/nMSMJmxzzi+1sUF4U0ovQxbGW5LHTw/UQhFz5dNmY2QzZIBhuBW6UPKpA5nZNduIpCVHNFvNA+Bz8a91gBcBmuuph1q+iGratJaax1TA264lptBXp4RMQRLpsvMXevKFKXBw2+1LBUIX/XuypfUoTZROfRVirDm943AAglrIRWJmcGpR5fPlY3ZQbuFEDk3Z6PkwAFeVbHpw/MbPfqq9w9/iMrXz3/fJenxRa2IlV42kAhUbV9NcKefi0Rq6Y4dyw0t+sba/mZGoZI9EGSSVF+/SHEtaUpzDvwDl5+ANVJK7pfzS763TR74CjZTebg29xR11FAgt1LZLpdvHDk4S+WMtaazprqBVo=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SEZPR06MB5269.apcprd06.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(4636009)(346002)(136003)(396003)(366004)(39860400002)(376002)(451199021)(6666004)(4326008)(66946007)(66556008)(6506007)(1076003)(26005)(966005)(66476007)(6512007)(8676002)(52116002)(186003)(83380400001)(316002)(2616005)(41300700001)(478600001)(54906003)(2906002)(8936002)(6486002)(5660300002)(38100700002)(38350700002)(30864003)(86362001)(36756003);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?arEYM6TGGJKlOJXnIp2/pUbJH2wwK0ymOS7gjK1ukALJFeXGmqMvvrH7T05I?=
 =?us-ascii?Q?SgqB5DPyRM6XpJoLQ6fDbOZXyyu430gF9Wa167RnNl55siL1Z+61CqnIZ0pi?=
 =?us-ascii?Q?W3kVViuiGv/vJylJpH5jBa32oa5ooj8yI4I4x7TbKNFH5zUQX3Am6w5doDGe?=
 =?us-ascii?Q?8iVyWdU4eiZAHp0LgBm3fCC2q7Cm09UQ0QiWhtnRmJBlgFaUl/UTWPJC6uJ8?=
 =?us-ascii?Q?sULmdMjhYgp4ltwz/nGyrlxPyU1XOv+ldcIsv6LL6OPRMsow+Nmo/VUaTAj2?=
 =?us-ascii?Q?PJZR8AfbJcrPCnNekBXtMZz2G2ctP6CcVS66C5Rm/89gCHdOKe9NtpWc4eVM?=
 =?us-ascii?Q?yEtBJOp6u4GlqBpGElQfPUpC1OkJkc2oQ21NTBGohocet0z/WiXaz/cpjnAS?=
 =?us-ascii?Q?dmNhVUR81pDYsjWryiN3cEBWxqh83QmTpX7AQ8qXcyY3DLEe2V1w3hT3yKbk?=
 =?us-ascii?Q?hcvfQYNdACU1UIwfiaLgrU1Zw03lPN16AS4PtaKWt7RsliWTHnB7VI/+OzZt?=
 =?us-ascii?Q?zvKVWFS9prVQrhPGw0XXj+mRsvpCLwfCL3F/WqzGuhs+tzsT0L9QrRmYvAzr?=
 =?us-ascii?Q?ODs8DqtcXJeovcrATqLzdQJwhFY+qtLDJyrP1Y7djhKuxy86wGSXTThy+4k5?=
 =?us-ascii?Q?XxXzUz5kQpWBDovDzg9eFjpkhZMXe90UduZHUGdlZ8egiGQHnA5GdyNW7RS0?=
 =?us-ascii?Q?ljKJ6A76zujL5f5BAAmcJSlBo/xf+rlvG4aFzHSz8HQWxS9SxHuvDpl64Fu1?=
 =?us-ascii?Q?smU6BNyQlQNeKFWqNe/ulOeIh/e4dS00R1LUuQK68f0vvhLGTiEDp72atjIC?=
 =?us-ascii?Q?TSyBt3PHXdaGZhGD9Ogj1UnB9+819iODxLGJDe7X03p5p67jdFcRUS4muScc?=
 =?us-ascii?Q?VX5eFotEABLr0O29WYGpZp2yXhwWZjQJKc7/3ckcoPA0WfgJ0x86vpjEYzjr?=
 =?us-ascii?Q?9gSBLh+Kvdhi1zU9x/UzFVjH8m6Us8p73aDYip64S+7ED9XNoT8irqJrygNV?=
 =?us-ascii?Q?5NbZnUdW5N7WTUHCorwibaF5umtxKB8uXKdIJc7W/1eiBT2xfjCoZURwdQqP?=
 =?us-ascii?Q?t4WoJo5CGCACNwb9KqOXqhST/1JXtbsl2xpdCAnfPGdn1eZB9csYGIg1/hTx?=
 =?us-ascii?Q?7knISG/b/pxS+HRSG3FGsbNlRddAn/chhUaSKOWjxEFWeuSNzdML6SatGWC+?=
 =?us-ascii?Q?TLNy3jeNSV8pibQMgO1CLXNgNShou4tENZ/j0sKXqMBkkVRZt3tr5qUc7dDK?=
 =?us-ascii?Q?h2yAbTR2PZNE4kfmtIgbQzHQm0VvZSUbM23EegkNvwgl/UJUwETMNXoYnLbJ?=
 =?us-ascii?Q?EIDkZLpPjHvlRAlSh1QvUg34a1UHOtuwPn8ODvgLPP6WbH01akqAFEtm6PbY?=
 =?us-ascii?Q?nSFp8ILivE7F+Z4ISwx22pyXoCdKfEC6yH0f+NWBGp/Z/vU7zvVHuB/D073I?=
 =?us-ascii?Q?Krkt3NYqVUlB60T5iOBA9daknIj3Uk+hi5SQO/ioFnZ2h02DC9+lKJeW/ItD?=
 =?us-ascii?Q?m29P2hUloaPPCO+i5dlQg4KrDo0LPYC5KuxOIef+SWP8jC5LiissnOm24sij?=
 =?us-ascii?Q?6AvTJbfMHEQNm4w3RVT7ZgX7NQZkR1bJTy8e+Rha?=
X-OriginatorOrg: vivo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 03097127-c38a-4f56-075e-08db31308955
X-MS-Exchange-CrossTenant-AuthSource: SEZPR06MB5269.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Mar 2023 15:07:53.7602 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 923e42dc-48d5-4cbe-b582-1a797a6412ed
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: YwSE+d8PpNFY3Fo77nUBmAcOcUWHworwLZ0ggZZnKADDUIkUuqyvRnUhjqNRJeoHs8ORuKSjI9NyHKzFvoNAiw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PUZPR06MB4630
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  In this patch,
 it adds to account discard latency. Reported-by:
 kernel test robot <lkp@intel.com> Link:
 https://lore.kernel.org/oe-kbuild-all/202303211005.RGxljvli-lkp@intel.com/
 Signed-off-by: Yangtao Li <frank.li@vivo.com> --- v3: -force conversion [...]
 Content analysis details:   (-0.2 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
 no trust [40.107.117.97 listed in list.dnswl.org]
 -0.0 SPF_HELO_PASS          SPF: HELO matches SPF record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
X-Headers-End: 1phtsl-009ob1-Hz
Subject: [f2fs-dev] [PATCH v3] f2fs: add iostat latency statistics support
 for discard
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
 linux-kernel@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

In this patch, it adds to account discard latency.

Reported-by: kernel test robot <lkp@intel.com>
Link: https://lore.kernel.org/oe-kbuild-all/202303211005.RGxljvli-lkp@intel.com/
Signed-off-by: Yangtao Li <frank.li@vivo.com>
---
v3:
-force conversion to enum iostat_lat_type type
v2:
-rename get_bio_iostat_private to iostat_get_bio_private
 fs/f2fs/data.c              |  2 +-
 fs/f2fs/f2fs.h              |  1 +
 fs/f2fs/iostat.c            | 83 +++++++++++++++++++++----------------
 fs/f2fs/iostat.h            | 49 +++++++++++-----------
 fs/f2fs/segment.c           |  8 +++-
 include/trace/events/f2fs.h | 68 ++++++++++++++++--------------
 6 files changed, 118 insertions(+), 93 deletions(-)

diff --git a/fs/f2fs/data.c b/fs/f2fs/data.c
index 359de650772e..6bcd71a0dbac 100644
--- a/fs/f2fs/data.c
+++ b/fs/f2fs/data.c
@@ -2307,7 +2307,7 @@ int f2fs_read_multi_pages(struct compress_ctx *cc, struct bio **bio_ret,
 		if (bio_add_page(bio, page, blocksize, 0) < blocksize)
 			goto submit_and_realloc;
 
-		ctx = get_post_read_ctx(bio);
+		ctx = iostat_get_bio_private(bio);
 		ctx->enabled_steps |= STEP_DECOMPRESS;
 		refcount_inc(&dic->refcnt);
 
diff --git a/fs/f2fs/f2fs.h b/fs/f2fs/f2fs.h
index 4e2596dacbf1..e73fefe0d8fb 100644
--- a/fs/f2fs/f2fs.h
+++ b/fs/f2fs/f2fs.h
@@ -1112,6 +1112,7 @@ enum page_type {
 	META_FLUSH,
 	IPU,		/* the below types are used by tracepoints only. */
 	OPU,
+	DISCARD,	/* used by iostat */
 };
 
 enum temp_type {
diff --git a/fs/f2fs/iostat.c b/fs/f2fs/iostat.c
index 3d5bfb1ad585..f40b8915ae1b 100644
--- a/fs/f2fs/iostat.c
+++ b/fs/f2fs/iostat.c
@@ -86,23 +86,21 @@ int __maybe_unused iostat_info_seq_show(struct seq_file *seq, void *offset)
 
 static inline void __record_iostat_latency(struct f2fs_sb_info *sbi)
 {
-	int io, idx;
-	struct f2fs_iostat_latency iostat_lat[MAX_IO_TYPE][NR_PAGE_TYPE];
+	struct f2fs_iostat_latency iostat_lat[MAX_LAT_TYPE];
 	struct iostat_lat_info *io_lat = sbi->iostat_io_lat;
+	unsigned int lat_type;
 	unsigned long flags;
 
 	spin_lock_irqsave(&sbi->iostat_lat_lock, flags);
-	for (idx = 0; idx < MAX_IO_TYPE; idx++) {
-		for (io = 0; io < NR_PAGE_TYPE; io++) {
-			iostat_lat[idx][io].peak_lat =
-			   jiffies_to_msecs(io_lat->peak_lat[idx][io]);
-			iostat_lat[idx][io].cnt = io_lat->bio_cnt[idx][io];
-			iostat_lat[idx][io].avg_lat = iostat_lat[idx][io].cnt ?
-			   jiffies_to_msecs(io_lat->sum_lat[idx][io]) / iostat_lat[idx][io].cnt : 0;
-			io_lat->sum_lat[idx][io] = 0;
-			io_lat->peak_lat[idx][io] = 0;
-			io_lat->bio_cnt[idx][io] = 0;
-		}
+	for (lat_type = 0; lat_type < MAX_LAT_TYPE; lat_type++) {
+		iostat_lat[lat_type].peak_lat =
+		   jiffies_to_msecs(io_lat->peak_lat[lat_type]);
+		iostat_lat[lat_type].cnt = io_lat->bio_cnt[lat_type];
+		iostat_lat[lat_type].avg_lat = iostat_lat[lat_type].cnt ?
+		   jiffies_to_msecs(io_lat->sum_lat[lat_type]) / iostat_lat[lat_type].cnt : 0;
+		io_lat->sum_lat[lat_type] = 0;
+		io_lat->peak_lat[lat_type] = 0;
+		io_lat->bio_cnt[lat_type] = 0;
 	}
 	spin_unlock_irqrestore(&sbi->iostat_lat_lock, flags);
 
@@ -208,62 +206,75 @@ void f2fs_update_iostat(struct f2fs_sb_info *sbi, struct inode *inode,
 	f2fs_record_iostat(sbi);
 }
 
-static inline void __update_iostat_latency(struct bio_iostat_ctx *iostat_ctx,
-				enum iostat_lat_type lat_type)
+static inline void __update_iostat_latency(struct bio_iostat_ctx *iostat_ctx)
 {
-	unsigned long ts_diff;
-	unsigned int page_type = iostat_ctx->type;
 	struct f2fs_sb_info *sbi = iostat_ctx->sbi;
 	struct iostat_lat_info *io_lat = sbi->iostat_io_lat;
+	unsigned int lat_type = iostat_ctx->lat_type;
+	unsigned long ts_diff;
 	unsigned long flags;
 
 	if (!sbi->iostat_enable)
 		return;
 
-	ts_diff = jiffies - iostat_ctx->submit_ts;
-	if (page_type == META_FLUSH) {
-		page_type = META;
-	} else if (page_type >= NR_PAGE_TYPE) {
-		f2fs_warn(sbi, "%s: %d over NR_PAGE_TYPE", __func__, page_type);
+	if (lat_type >= MAX_LAT_TYPE) {
+		f2fs_warn(sbi, "%s: %d over MAX_LAT_TYPE", __func__, lat_type);
 		return;
 	}
+	ts_diff = jiffies - iostat_ctx->submit_ts;
 
 	spin_lock_irqsave(&sbi->iostat_lat_lock, flags);
-	io_lat->sum_lat[lat_type][page_type] += ts_diff;
-	io_lat->bio_cnt[lat_type][page_type]++;
-	if (ts_diff > io_lat->peak_lat[lat_type][page_type])
-		io_lat->peak_lat[lat_type][page_type] = ts_diff;
+	io_lat->sum_lat[lat_type] += ts_diff;
+	io_lat->bio_cnt[lat_type]++;
+	if (ts_diff > io_lat->peak_lat[lat_type])
+		io_lat->peak_lat[lat_type] = ts_diff;
 	spin_unlock_irqrestore(&sbi->iostat_lat_lock, flags);
 }
 
 void iostat_update_and_unbind_ctx(struct bio *bio)
+{
+	struct bio_iostat_ctx *iostat_ctx = bio->bi_private;
+
+	if (op_is_write(bio_op(bio)) && !op_is_discard(bio_op(bio)))
+		bio->bi_private = iostat_ctx->sbi;
+	else
+		bio->bi_private = iostat_ctx->iostat_private;
+
+	__update_iostat_latency(iostat_ctx);
+	mempool_free(iostat_ctx, bio_iostat_ctx_pool);
+}
+
+void iostat_update_submit_ctx(struct bio *bio, enum page_type type)
 {
 	struct bio_iostat_ctx *iostat_ctx = bio->bi_private;
 	enum iostat_lat_type lat_type;
 
-	if (op_is_write(bio_op(bio))) {
+	iostat_ctx->submit_ts = jiffies;
+
+	if (type == DISCARD) {
+		lat_type = DISCARD_LAT;
+	} else if (op_is_write(bio_op(bio))) {
 		lat_type = bio->bi_opf & REQ_SYNC ?
-				WRITE_SYNC_IO : WRITE_ASYNC_IO;
-		bio->bi_private = iostat_ctx->sbi;
+				WRITE_SYNC_DATA_LAT : WRITE_ASYNC_DATA_LAT;
+		lat_type = (enum iostat_lat_type)(lat_type + type);
 	} else {
-		lat_type = READ_IO;
-		bio->bi_private = iostat_ctx->post_read_ctx;
+		lat_type = READ_DATA_LAT;
+		lat_type = (enum iostat_lat_type)(lat_type + type);
 	}
 
-	__update_iostat_latency(iostat_ctx, lat_type);
-	mempool_free(iostat_ctx, bio_iostat_ctx_pool);
+	iostat_ctx->lat_type = lat_type;
 }
 
 void iostat_alloc_and_bind_ctx(struct f2fs_sb_info *sbi,
-		struct bio *bio, struct bio_post_read_ctx *ctx)
+		struct bio *bio, void *private)
 {
 	struct bio_iostat_ctx *iostat_ctx;
 	/* Due to the mempool, this never fails. */
 	iostat_ctx = mempool_alloc(bio_iostat_ctx_pool, GFP_NOFS);
 	iostat_ctx->sbi = sbi;
 	iostat_ctx->submit_ts = 0;
-	iostat_ctx->type = 0;
-	iostat_ctx->post_read_ctx = ctx;
+	iostat_ctx->lat_type = 0;
+	iostat_ctx->iostat_private = private;
 	bio->bi_private = iostat_ctx;
 }
 
diff --git a/fs/f2fs/iostat.h b/fs/f2fs/iostat.h
index eb99d05cf272..67b468691498 100644
--- a/fs/f2fs/iostat.h
+++ b/fs/f2fs/iostat.h
@@ -6,17 +6,24 @@
 #ifndef __F2FS_IOSTAT_H__
 #define __F2FS_IOSTAT_H__
 
+#ifdef CONFIG_F2FS_IOSTAT
+
 struct bio_post_read_ctx;
 
 enum iostat_lat_type {
-	READ_IO = 0,
-	WRITE_SYNC_IO,
-	WRITE_ASYNC_IO,
-	MAX_IO_TYPE,
+	READ_DATA_LAT = 0,
+	READ_NODE_LAT,
+	READ_META_LAT,
+	WRITE_SYNC_DATA_LAT,
+	WRITE_SYNC_NODE_LAT,
+	WRITE_SYNC_META_LAT,
+	WRITE_ASYNC_DATA_LAT,
+	WRITE_ASYNC_NODE_LAT,
+	WRITE_ASYNC_META_LAT,
+	DISCARD_LAT,
+	MAX_LAT_TYPE,
 };
 
-#ifdef CONFIG_F2FS_IOSTAT
-
 #define NUM_PREALLOC_IOSTAT_CTXS	128
 #define DEFAULT_IOSTAT_PERIOD_MS	3000
 #define MIN_IOSTAT_PERIOD_MS		100
@@ -24,9 +31,9 @@ enum iostat_lat_type {
 #define MAX_IOSTAT_PERIOD_MS		8640000
 
 struct iostat_lat_info {
-	unsigned long sum_lat[MAX_IO_TYPE][NR_PAGE_TYPE];	/* sum of io latencies */
-	unsigned long peak_lat[MAX_IO_TYPE][NR_PAGE_TYPE];	/* peak io latency */
-	unsigned int bio_cnt[MAX_IO_TYPE][NR_PAGE_TYPE];	/* bio count */
+	unsigned long sum_lat[MAX_LAT_TYPE];	/* sum of io latencies */
+	unsigned long peak_lat[MAX_LAT_TYPE];	/* peak io latency */
+	unsigned int bio_cnt[MAX_LAT_TYPE];	/* bio count */
 };
 
 extern int __maybe_unused iostat_info_seq_show(struct seq_file *seq,
@@ -38,29 +45,21 @@ extern void f2fs_update_iostat(struct f2fs_sb_info *sbi, struct inode *inode,
 struct bio_iostat_ctx {
 	struct f2fs_sb_info *sbi;
 	unsigned long submit_ts;
-	enum page_type type;
-	struct bio_post_read_ctx *post_read_ctx;
+	enum iostat_lat_type lat_type;
+	void *iostat_private;
 };
 
-static inline void iostat_update_submit_ctx(struct bio *bio,
-			enum page_type type)
-{
-	struct bio_iostat_ctx *iostat_ctx = bio->bi_private;
-
-	iostat_ctx->submit_ts = jiffies;
-	iostat_ctx->type = type;
-}
-
-static inline struct bio_post_read_ctx *get_post_read_ctx(struct bio *bio)
+static inline struct bio_post_read_ctx *iostat_get_bio_private(struct bio *bio)
 {
 	struct bio_iostat_ctx *iostat_ctx = bio->bi_private;
 
-	return iostat_ctx->post_read_ctx;
+	return iostat_ctx->iostat_private;
 }
 
+extern void iostat_update_submit_ctx(struct bio *bio, enum page_type type);
 extern void iostat_update_and_unbind_ctx(struct bio *bio);
 extern void iostat_alloc_and_bind_ctx(struct f2fs_sb_info *sbi,
-		struct bio *bio, struct bio_post_read_ctx *ctx);
+		struct bio *bio, void *private);
 extern int f2fs_init_iostat_processing(void);
 extern void f2fs_destroy_iostat_processing(void);
 extern int f2fs_init_iostat(struct f2fs_sb_info *sbi);
@@ -70,10 +69,10 @@ static inline void f2fs_update_iostat(struct f2fs_sb_info *sbi, struct inode *in
 		enum iostat_type type, unsigned long long io_bytes) {}
 static inline void iostat_update_and_unbind_ctx(struct bio *bio) {}
 static inline void iostat_alloc_and_bind_ctx(struct f2fs_sb_info *sbi,
-		struct bio *bio, struct bio_post_read_ctx *ctx) {}
+		struct bio *bio, void *private) {}
 static inline void iostat_update_submit_ctx(struct bio *bio,
 		enum page_type type) {}
-static inline struct bio_post_read_ctx *get_post_read_ctx(struct bio *bio)
+static inline struct bio_post_read_ctx *iostat_get_bio_private(struct bio *bio)
 {
 	return bio->bi_private;
 }
diff --git a/fs/f2fs/segment.c b/fs/f2fs/segment.c
index 72bce3808394..5a2b162812c6 100644
--- a/fs/f2fs/segment.c
+++ b/fs/f2fs/segment.c
@@ -1100,9 +1100,12 @@ static void __remove_discard_cmd(struct f2fs_sb_info *sbi,
 
 static void f2fs_submit_discard_endio(struct bio *bio)
 {
-	struct discard_cmd *dc = (struct discard_cmd *)bio->bi_private;
+	struct discard_cmd *dc;
 	unsigned long flags;
 
+	iostat_update_and_unbind_ctx(bio);
+	dc = bio->bi_private;
+
 	spin_lock_irqsave(&dc->lock, flags);
 	if (!dc->error)
 		dc->error = blk_status_to_errno(bio->bi_status);
@@ -1276,6 +1279,9 @@ static int __submit_discard_cmd(struct f2fs_sb_info *sbi,
 		bio->bi_private = dc;
 		bio->bi_end_io = f2fs_submit_discard_endio;
 		bio->bi_opf |= flag;
+
+		iostat_alloc_and_bind_ctx(sbi, bio, dc);
+		iostat_update_submit_ctx(bio, DISCARD);
 		submit_bio(bio);
 
 		atomic_inc(&dcc->issued_discard);
diff --git a/include/trace/events/f2fs.h b/include/trace/events/f2fs.h
index 99cbc5949e3c..385291ac9ad5 100644
--- a/include/trace/events/f2fs.h
+++ b/include/trace/events/f2fs.h
@@ -2045,7 +2045,7 @@ struct f2fs_iostat_latency {
 
 TRACE_EVENT(f2fs_iostat_latency,
 
-	TP_PROTO(struct f2fs_sb_info *sbi, struct f2fs_iostat_latency (*iostat_lat)[NR_PAGE_TYPE]),
+	TP_PROTO(struct f2fs_sb_info *sbi, struct f2fs_iostat_latency *iostat_lat),
 
 	TP_ARGS(sbi, iostat_lat),
 
@@ -2078,37 +2078,43 @@ TRACE_EVENT(f2fs_iostat_latency,
 		__field(unsigned int,	m_wr_as_peak)
 		__field(unsigned int,	m_wr_as_avg)
 		__field(unsigned int,	m_wr_as_cnt)
+		__field(unsigned int,	discard_peak)
+		__field(unsigned int,	discard_avg)
+		__field(unsigned int,	discard_cnt)
 	),
 
 	TP_fast_assign(
 		__entry->dev		= sbi->sb->s_dev;
-		__entry->d_rd_peak	= iostat_lat[READ_IO][DATA].peak_lat;
-		__entry->d_rd_avg	= iostat_lat[READ_IO][DATA].avg_lat;
-		__entry->d_rd_cnt	= iostat_lat[READ_IO][DATA].cnt;
-		__entry->n_rd_peak	= iostat_lat[READ_IO][NODE].peak_lat;
-		__entry->n_rd_avg	= iostat_lat[READ_IO][NODE].avg_lat;
-		__entry->n_rd_cnt	= iostat_lat[READ_IO][NODE].cnt;
-		__entry->m_rd_peak	= iostat_lat[READ_IO][META].peak_lat;
-		__entry->m_rd_avg	= iostat_lat[READ_IO][META].avg_lat;
-		__entry->m_rd_cnt	= iostat_lat[READ_IO][META].cnt;
-		__entry->d_wr_s_peak	= iostat_lat[WRITE_SYNC_IO][DATA].peak_lat;
-		__entry->d_wr_s_avg	= iostat_lat[WRITE_SYNC_IO][DATA].avg_lat;
-		__entry->d_wr_s_cnt	= iostat_lat[WRITE_SYNC_IO][DATA].cnt;
-		__entry->n_wr_s_peak	= iostat_lat[WRITE_SYNC_IO][NODE].peak_lat;
-		__entry->n_wr_s_avg	= iostat_lat[WRITE_SYNC_IO][NODE].avg_lat;
-		__entry->n_wr_s_cnt	= iostat_lat[WRITE_SYNC_IO][NODE].cnt;
-		__entry->m_wr_s_peak	= iostat_lat[WRITE_SYNC_IO][META].peak_lat;
-		__entry->m_wr_s_avg	= iostat_lat[WRITE_SYNC_IO][META].avg_lat;
-		__entry->m_wr_s_cnt	= iostat_lat[WRITE_SYNC_IO][META].cnt;
-		__entry->d_wr_as_peak	= iostat_lat[WRITE_ASYNC_IO][DATA].peak_lat;
-		__entry->d_wr_as_avg	= iostat_lat[WRITE_ASYNC_IO][DATA].avg_lat;
-		__entry->d_wr_as_cnt	= iostat_lat[WRITE_ASYNC_IO][DATA].cnt;
-		__entry->n_wr_as_peak	= iostat_lat[WRITE_ASYNC_IO][NODE].peak_lat;
-		__entry->n_wr_as_avg	= iostat_lat[WRITE_ASYNC_IO][NODE].avg_lat;
-		__entry->n_wr_as_cnt	= iostat_lat[WRITE_ASYNC_IO][NODE].cnt;
-		__entry->m_wr_as_peak	= iostat_lat[WRITE_ASYNC_IO][META].peak_lat;
-		__entry->m_wr_as_avg	= iostat_lat[WRITE_ASYNC_IO][META].avg_lat;
-		__entry->m_wr_as_cnt	= iostat_lat[WRITE_ASYNC_IO][META].cnt;
+		__entry->d_rd_peak	= iostat_lat[READ_DATA_LAT].peak_lat;
+		__entry->d_rd_avg	= iostat_lat[READ_DATA_LAT].avg_lat;
+		__entry->d_rd_cnt	= iostat_lat[READ_DATA_LAT].cnt;
+		__entry->n_rd_peak	= iostat_lat[READ_NODE_LAT].peak_lat;
+		__entry->n_rd_avg	= iostat_lat[READ_NODE_LAT].avg_lat;
+		__entry->n_rd_cnt	= iostat_lat[READ_NODE_LAT].cnt;
+		__entry->m_rd_peak	= iostat_lat[READ_META_LAT].peak_lat;
+		__entry->m_rd_avg	= iostat_lat[READ_META_LAT].avg_lat;
+		__entry->m_rd_cnt	= iostat_lat[READ_META_LAT].cnt;
+		__entry->d_wr_s_peak	= iostat_lat[WRITE_SYNC_DATA_LAT].peak_lat;
+		__entry->d_wr_s_avg	= iostat_lat[WRITE_SYNC_DATA_LAT].avg_lat;
+		__entry->d_wr_s_cnt	= iostat_lat[WRITE_SYNC_DATA_LAT].cnt;
+		__entry->n_wr_s_peak	= iostat_lat[WRITE_SYNC_NODE_LAT].peak_lat;
+		__entry->n_wr_s_avg	= iostat_lat[WRITE_SYNC_NODE_LAT].avg_lat;
+		__entry->n_wr_s_cnt	= iostat_lat[WRITE_SYNC_NODE_LAT].cnt;
+		__entry->m_wr_s_peak	= iostat_lat[WRITE_SYNC_META_LAT].peak_lat;
+		__entry->m_wr_s_avg	= iostat_lat[WRITE_SYNC_META_LAT].avg_lat;
+		__entry->m_wr_s_cnt	= iostat_lat[WRITE_SYNC_META_LAT].cnt;
+		__entry->d_wr_as_peak	= iostat_lat[WRITE_ASYNC_DATA_LAT].peak_lat;
+		__entry->d_wr_as_avg	= iostat_lat[WRITE_ASYNC_DATA_LAT].avg_lat;
+		__entry->d_wr_as_cnt	= iostat_lat[WRITE_ASYNC_DATA_LAT].cnt;
+		__entry->n_wr_as_peak	= iostat_lat[WRITE_ASYNC_NODE_LAT].peak_lat;
+		__entry->n_wr_as_avg	= iostat_lat[WRITE_ASYNC_NODE_LAT].avg_lat;
+		__entry->n_wr_as_cnt	= iostat_lat[WRITE_ASYNC_NODE_LAT].cnt;
+		__entry->m_wr_as_peak	= iostat_lat[WRITE_ASYNC_META_LAT].peak_lat;
+		__entry->m_wr_as_avg	= iostat_lat[WRITE_ASYNC_META_LAT].avg_lat;
+		__entry->m_wr_as_cnt	= iostat_lat[WRITE_ASYNC_META_LAT].cnt;
+		__entry->discard_peak	= iostat_lat[DISCARD_LAT].peak_lat;
+		__entry->discard_avg	= iostat_lat[DISCARD_LAT].avg_lat;
+		__entry->discard_cnt	= iostat_lat[DISCARD_LAT].cnt;
 	),
 
 	TP_printk("dev = (%d,%d), "
@@ -2116,7 +2122,8 @@ TRACE_EVENT(f2fs_iostat_latency,
 		"rd_data [%u/%u/%u], rd_node [%u/%u/%u], rd_meta [%u/%u/%u], "
 		"wr_sync_data [%u/%u/%u], wr_sync_node [%u/%u/%u], "
 		"wr_sync_meta [%u/%u/%u], wr_async_data [%u/%u/%u], "
-		"wr_async_node [%u/%u/%u], wr_async_meta [%u/%u/%u]",
+		"wr_async_node [%u/%u/%u], wr_async_meta [%u/%u/%u], "
+		"discard [%u/%u/%u]",
 		show_dev(__entry->dev),
 		__entry->d_rd_peak, __entry->d_rd_avg, __entry->d_rd_cnt,
 		__entry->n_rd_peak, __entry->n_rd_avg, __entry->n_rd_cnt,
@@ -2126,7 +2133,8 @@ TRACE_EVENT(f2fs_iostat_latency,
 		__entry->m_wr_s_peak, __entry->m_wr_s_avg, __entry->m_wr_s_cnt,
 		__entry->d_wr_as_peak, __entry->d_wr_as_avg, __entry->d_wr_as_cnt,
 		__entry->n_wr_as_peak, __entry->n_wr_as_avg, __entry->n_wr_as_cnt,
-		__entry->m_wr_as_peak, __entry->m_wr_as_avg, __entry->m_wr_as_cnt)
+		__entry->m_wr_as_peak, __entry->m_wr_as_avg, __entry->m_wr_as_cnt,
+		__entry->discard_peak, __entry->discard_avg, __entry->discard_cnt)
 );
 #endif
 
-- 
2.35.1



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
