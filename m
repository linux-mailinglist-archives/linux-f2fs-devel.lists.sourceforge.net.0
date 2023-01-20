Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id E53806759B0
	for <lists+linux-f2fs-devel@lfdr.de>; Fri, 20 Jan 2023 17:17:30 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1pIu54-0005Sz-GM;
	Fri, 20 Jan 2023 16:17:29 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <frank.li@vivo.com>) id 1pIu51-0005SZ-Px
 for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 20 Jan 2023 16:17:27 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=MIME-Version:Content-Type:Content-Transfer-Encoding
 :References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=kQ9sS67a6Hzv5hcd5/XgE4GMoO6QfrFaMRdt6H7dv5Q=; b=QznCgKKAMMDRrsAHfpmhT6XTNA
 ZlKwYMg5e/xu9M1sO1xLUgBfpS5DfJDtwpc41M4FQnhyQt7apPO/ROpaID8OKwvHnY4rxxnkCLpxS
 B2fi4qK4bbn3tCULaEMgnwdPOJZnrwQ4e2mpEjk31Cf0CXgIyjOdGtoGpBgq8vMU0rgc=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=MIME-Version:Content-Type:Content-Transfer-Encoding:References:
 In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=kQ9sS67a6Hzv5hcd5/XgE4GMoO6QfrFaMRdt6H7dv5Q=; b=M9Y+J+ip5d6tcP8JRRPsVun2ir
 iWs64bJybrLbaL/7vvUBaOb+tigXgvj9D9TFRR6a7haKq5Y7B6OHWwUlpIMw+nfd26EzsONCycueK
 KvPTJlRoHUEyLpUBcwh7OBmFlpujOPBTSxffr3iLL9tYNgGRt5cVoTohOK7ttkqZqW3A=;
Received: from mail-psaapc01on2095.outbound.protection.outlook.com
 ([40.107.255.95] helo=APC01-PSA-obe.outbound.protection.outlook.com)
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1pIu4y-00ANvr-Ec for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 20 Jan 2023 16:17:26 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=WzWnufwTPLe4IOXWvmUUG/L4U0H9pY98U3V0ZYdm1h5hjoUyQ3mJ0XmwpIwsCRbLUvCMYO2x1M6mRztyHYVtT9a9l3yo6lAHnjTeDks9cg2wZeNOKVBLeUkiw0/VPpJ5SlUGw4Ly2rQ0GasOLDt81KH4fvyf3qvIUYRZJgfKX1s9vkn3pv9g46PGkifxLsNLEQ11z+Q+zJKlQBqAMD32KGSd2WDdHFF/RD2tSyX7B2N69RcI05OsNmnWBB931gFiXx9LZXc75s5Xdzx4juxBqTx9wXKUS/RXjLhoooiYCkdcTZC7/Rvoo0BRjEapnJ8GnEG6Pq9j4p9+RjIbbZQWWQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kQ9sS67a6Hzv5hcd5/XgE4GMoO6QfrFaMRdt6H7dv5Q=;
 b=XlgkQO8oGaD8qi325S9NQcCU7o56dnDM3mM5I9EL2qC+tVNUTPcuVMKaDaiz+71o8VZJ8Igb5rpCRS3evR7A6lQqUjkCkoaY/GUy29kawaysYvUHIZtNxheA2+teHOnq8svco2cuMYLkMabvfjVwm1uuz/FzLqOvagtizeDDa6mTWCG3UbWZ9mgF4Z3wKyvF4c27o6fep7ULY5q2T4txbPZG8IOVdlDAyoOFkkV+mPLaVSLKTNtjq2yzsan/gDIo+tPmCARYXxZ1SiMHBoeoRzo/am8yPh9dxeUGlWjUmY7U6aM5E/2dKl++KC5vPUVQ4Ru8rsowG2Lfovaxz4jeAg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vivo.com; dmarc=pass action=none header.from=vivo.com;
 dkim=pass header.d=vivo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vivo.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kQ9sS67a6Hzv5hcd5/XgE4GMoO6QfrFaMRdt6H7dv5Q=;
 b=IlYOvnoWZ+vswcU3PF2bdPDdYAxL6/oNK64wK3zuitKO4GwAprwQQIpKjWMIW+IYpz29oo0lKaeSesN5NcOL2jIoUIXAdatq4jhIZ2uFKviQNAWGNK93ixNov6OiTTFdBHC6te2RgWCJ065ktkGutzDkFiLDqCSQ13LizABf/cSrU9gAWWRV5WOVhy2Dh5afSN9oO6ASw7nhQG4ACUxKLZonIHvKwOmfczW9B+tOB9vi3yNuNHiWbE8bjHpOlOERgx62Wp1x2j8oUBs3BOI478ODu03pn2uF67Iny1UAFRnbC00vRUuaJJ9rtEf4XLrh3OEfu8E4KpcjVZlSdOysKQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=vivo.com;
Received: from SEZPR06MB5269.apcprd06.prod.outlook.com (2603:1096:101:78::6)
 by KL1PR06MB6233.apcprd06.prod.outlook.com (2603:1096:820:d8::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6043.5; Fri, 20 Jan
 2023 16:17:08 +0000
Received: from SEZPR06MB5269.apcprd06.prod.outlook.com
 ([fe80::3e52:d08c:ecf4:d572]) by SEZPR06MB5269.apcprd06.prod.outlook.com
 ([fe80::3e52:d08c:ecf4:d572%5]) with mapi id 15.20.6002.012; Fri, 20 Jan 2023
 16:17:08 +0000
To: jaegeuk@kernel.org,
	chao@kernel.org
Date: Sat, 21 Jan 2023 00:16:56 +0800
Message-Id: <20230120161656.70308-2-frank.li@vivo.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20230120161656.70308-1-frank.li@vivo.com>
References: <20230120161656.70308-1-frank.li@vivo.com>
X-ClientProxiedBy: SI2PR02CA0041.apcprd02.prod.outlook.com
 (2603:1096:4:196::20) To SEZPR06MB5269.apcprd06.prod.outlook.com
 (2603:1096:101:78::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SEZPR06MB5269:EE_|KL1PR06MB6233:EE_
X-MS-Office365-Filtering-Correlation-Id: f2895943-8783-4bc6-0512-08dafb01c780
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: MeYXorIS3ykowvbnAqJe6goDTQXl1vB57w56E2oQDIvF86geZsiTmEtE9n/ga+czGiCr7iOR0jJGOsoeHdNLBtrNrMGdv3rKIPZms5V654xlGm+MMMCvTm5pWSND1EmPhIQQq5honOqk5HGw9LvkiG7PFzLnCL9EdyGNaXCdAbfHPFK3AoE8n8gkeoz+GRaG4ZHhwYLrR3x9yh18chs3vBVnx0FnGhAGLtiDlZelNhIT01Z+GkVByH3GNy/qq9tjnfA7UKB8OtNFKr0dmsXaCaM3rURPSkeAB6KkHzJHC7+JdqAsMYs5FfiLJ1baXRUu5yLeqaKWL2bCDVjTMwM6vm1rRSMFsNK5y13wXIdSX7sr4MLDoqxq4NHtn/ep5i/7qaSa50PKSi0pZMDes55VfD148rNPEnykngO8wTTeocuHG1DXuvmx22f81hH+MarT5/5KI4uYSDFOEpqGs9YWiS4FUpfa0sfSNdAw4Dk4EDDpeTwoTO/5OnE3OoPteGzmfDJsqaESyM9YvLL0p729pkb9O/B3d2O8CHxff8n31jdzmf5IfTEghhFW/CU0LWbVPhvf0tMYNSUPoLiHB3LWiVZ1Re0leRxm+qhPSRFIfcfQuc0VBgJf8R2/H40oA979wz7cvHconr1DHw7nZtZMV2AAQZmbRRxgPuxaQVJasc07MfH8axz42RWoaNrP8QYYxcIcdUOTl7aq4tvlSn3+PQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SEZPR06MB5269.apcprd06.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(4636009)(376002)(396003)(136003)(346002)(39860400002)(366004)(451199015)(6486002)(5660300002)(41300700001)(8676002)(54906003)(66476007)(66556008)(316002)(66946007)(2906002)(478600001)(1076003)(26005)(6666004)(52116002)(36756003)(186003)(6512007)(6506007)(2616005)(8936002)(4326008)(83380400001)(86362001)(38100700002)(38350700002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?6zD0JJcL9OIH7d7Prtn8YnyeW512UCMLPBT9Olnm3LT2iNVSEsduLsqenk/9?=
 =?us-ascii?Q?JtZIKbryNweNqEOG54QGD/ij9R7JNVOd3gSqOjsWl2XktekfmL2Hbx1d2Pdl?=
 =?us-ascii?Q?XRl6HAJWh14OcbUxch+Q0PMitUCTJ1Tvffd1cJklvEePOkrXvrMwJKTr3Oqn?=
 =?us-ascii?Q?6KYnZYvRC4drvqZIZXpSZAIKe+bJKebZcFeRkYaxEBQa0DtaA0/ZNZ4XGenX?=
 =?us-ascii?Q?pDYVlYX8dUJad5b0ui++D5OLtdppn7U6YD9vgg2Gmu/L98UZh28nC5CL+vUh?=
 =?us-ascii?Q?oufrIOpXnej1GwZiLMWpzphoaMRfGq373VHFp1t6Bh9p3wRkZq7elfw89LHj?=
 =?us-ascii?Q?75GdRSqDJP+I+vrvjXiD6hY0Sh7stXaHF3OWFhg/z7GeWDKlBdeDKQcYKPmP?=
 =?us-ascii?Q?SVidrvEL3nMNmqMUWq8Pn8lNmHYN1HR3sVSUYxUsisNS69QIUDF061d+TYHo?=
 =?us-ascii?Q?13w8hkIM+sbBgwFP53STaxCWt6dn+JP7qbf3zJs6f3ekqZaUOkfbVUzHlf+Q?=
 =?us-ascii?Q?aJVnvTj6SE9rXqzFr6lKovYseaVeIdX6cA6GtBa12K7aVsn75P8POs5Zn+JS?=
 =?us-ascii?Q?J+OeII8Fds4dIAjErf+07ROzDgpRIc+IGaslANGsHw8J4ycY1hwoHBNpH7hD?=
 =?us-ascii?Q?+MH0AHqnK7zCi39ZKu2P6OCqxD7qsCFcQeoW7bDNPt3jvVCKX+G+pHjjQLfK?=
 =?us-ascii?Q?TveaUwcCPY2bOm69lJ/MuyGZaNit/VQ8Ldp++g8ceQ9+m/kfOyNMlfckSpIr?=
 =?us-ascii?Q?nXE45s25SJPLNTbzCZD3cXg972ztI7HBDKaHoHPsMRl6IXBmY5BtLZkV160e?=
 =?us-ascii?Q?TEkb20uWAZFt2nBNXkN77MBAer+iSp5OaAqR+IEoG83KD4WPqYzKhFFFC3i7?=
 =?us-ascii?Q?QkM4XEXMnfG20TeC2XKkO4OyCc1l+mpN1D9mZ5/jRpoZKT/Qk92IJWy/Hnce?=
 =?us-ascii?Q?2NJD41c08xD/nIGl42GCt9xUgqcuVmMoW8QZReIJaksY44FdEctBPu0kMGoH?=
 =?us-ascii?Q?Gl79xArViwzDWmMGgPSTlCU6hHFwOzwvRAW+DxP5v3p0+e4Gv4hmPV+m0XMh?=
 =?us-ascii?Q?28t6/M3NvUPPxV9Lwut1x3SiO5MAPP06ZL5LS+U1LXezr5TUInLqA9vj8rII?=
 =?us-ascii?Q?FuiWFrxZ99d3pmO8Mex7hv6RARDjyrnUNRrfuqdlrzFsXTROQK2Z4Rq5uQkZ?=
 =?us-ascii?Q?oexmdsB1rhmwJ+8fp2JKL12ypRsv3xrTfLoYamKrX757193ckcJh28jV78pL?=
 =?us-ascii?Q?OARa3WEfmOfsxmFBm2REWbV0FwhLtXUMu/GhKMC02Y7lfdap3NCAHzu4P7uy?=
 =?us-ascii?Q?5ETLwM/OJwtT3+LZ0ENTzThLFURb8wEDrQW3YEtqokn3D06AR7wgA82UdMVl?=
 =?us-ascii?Q?xI71AbFSXYQMSSYU+g8Ro6SlHPBdYewvMRV28P3biqHKDfV0FDWJuN8hE1Xk?=
 =?us-ascii?Q?Rqp5MWEFzVWK84rBneTAfzfadjjnd1BMNK9lrKBP3iNdCJfiKKV3wYlG+8vL?=
 =?us-ascii?Q?1O3mpOyK+QIPhHUYUD0WA31RIKFiWxMGnczl0Icp2838INoO+gu+rpFDEvGy?=
 =?us-ascii?Q?RdepLeXWT9cPSoVuyuZbkmgYUOMffwln1SZP1+an?=
X-OriginatorOrg: vivo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f2895943-8783-4bc6-0512-08dafb01c780
X-MS-Exchange-CrossTenant-AuthSource: SEZPR06MB5269.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Jan 2023 16:17:08.8035 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 923e42dc-48d5-4cbe-b582-1a797a6412ed
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: TjE6VVfUZzPbHuuKvgwolwqyX2+WQr2MXOFYBxzV9IPZvbW8qAuxZBfPMNoMVR0K7QK+joeDN3yCkVq+6p30Fg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: KL1PR06MB6233
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  Convert to use iostat_lat_type as parameter instead of raw
 number. BTW, move NUM_PREALLOC_IOSTAT_CTXS to the header file, and rename
 iotype to page_type to match the definition. Reported-by: kernel test robot
 <lkp@intel.com> Reported-by: Dan Carpenter <error27@gmail.com> Signed-off-by:
 Yangtao Li <frank.li@vivo.com> --- v3: -convert to f2fs_warn() fs/f2fs/data.c
 | 4 ++-- fs/f [...] 
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
X-Headers-End: 1pIu4y-00ANvr-Ec
Subject: [f2fs-dev] [PATCH v3 2/2] f2fs: use iostat_lat_type directly as a
 parameter in the iostat_update_and_unbind_ctx()
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

Convert to use iostat_lat_type as parameter instead of raw number.
BTW, move NUM_PREALLOC_IOSTAT_CTXS to the header file, and rename
iotype to page_type to match the definition.

Reported-by: kernel test robot <lkp@intel.com>
Reported-by: Dan Carpenter <error27@gmail.com>
Signed-off-by: Yangtao Li <frank.li@vivo.com>
---
v3:
-convert to f2fs_warn()
 fs/f2fs/data.c   |  4 ++--
 fs/f2fs/iostat.c | 39 ++++++++++++++++-----------------------
 fs/f2fs/iostat.h | 19 ++++++++++---------
 3 files changed, 28 insertions(+), 34 deletions(-)

diff --git a/fs/f2fs/data.c b/fs/f2fs/data.c
index 1645b8a1b904..710d4acde187 100644
--- a/fs/f2fs/data.c
+++ b/fs/f2fs/data.c
@@ -292,7 +292,7 @@ static void f2fs_read_end_io(struct bio *bio)
 	struct bio_post_read_ctx *ctx;
 	bool intask = in_task();
 
-	iostat_update_and_unbind_ctx(bio, 0);
+	iostat_update_and_unbind_ctx(bio, READ_IO);
 	ctx = bio->bi_private;
 
 	if (time_to_inject(sbi, FAULT_READ_IO))
@@ -330,7 +330,7 @@ static void f2fs_write_end_io(struct bio *bio)
 	struct bio_vec *bvec;
 	struct bvec_iter_all iter_all;
 
-	iostat_update_and_unbind_ctx(bio, 1);
+	iostat_update_and_unbind_ctx(bio, bio->bi_opf & REQ_SYNC ? WRITE_SYNC_IO : WRITE_ASYNC_IO);
 	sbi = bio->bi_private;
 
 	if (time_to_inject(sbi, FAULT_WRITE_IO))
diff --git a/fs/f2fs/iostat.c b/fs/f2fs/iostat.c
index 96637756eae8..c767a2e7d5a9 100644
--- a/fs/f2fs/iostat.c
+++ b/fs/f2fs/iostat.c
@@ -14,7 +14,6 @@
 #include "iostat.h"
 #include <trace/events/f2fs.h>
 
-#define NUM_PREALLOC_IOSTAT_CTXS	128
 static struct kmem_cache *bio_iostat_ctx_cache;
 static mempool_t *bio_iostat_ctx_pool;
 
@@ -210,53 +209,47 @@ void f2fs_update_iostat(struct f2fs_sb_info *sbi, struct inode *inode,
 }
 
 static inline void __update_iostat_latency(struct bio_iostat_ctx *iostat_ctx,
-				int rw, bool is_sync)
+				enum iostat_lat_type lat_type)
 {
 	unsigned long ts_diff;
-	unsigned int iotype = iostat_ctx->type;
+	unsigned int page_type = iostat_ctx->type;
 	struct f2fs_sb_info *sbi = iostat_ctx->sbi;
 	struct iostat_lat_info *io_lat = sbi->iostat_io_lat;
-	int idx;
 	unsigned long flags;
 
 	if (!sbi->iostat_enable)
 		return;
 
 	ts_diff = jiffies - iostat_ctx->submit_ts;
-	if (iotype == META_FLUSH) {
-		iotype = META;
-	} else if (iotype >= NR_PAGE_TYPE) {
-		f2fs_warn(sbi, "%s: %d over NR_PAGE_TYPE", __func__, iotype);
+	if (page_type == META_FLUSH) {
+		page_type = META;
+	} else if (page_type >= NR_PAGE_TYPE) {
+		f2fs_warn(sbi, "%s: %d over NR_PAGE_TYPE", __func__, page_type);
 		return;
 	}
 
-	if (rw == 0) {
-		idx = READ_IO;
-	} else {
-		if (is_sync)
-			idx = WRITE_SYNC_IO;
-		else
-			idx = WRITE_ASYNC_IO;
+	if (lat_type >= MAX_IO_TYPE) {
+		f2fs_warn(sbi, "%s: %d over MAX_IO_TYPE", __func__, lat_type);
+		return;
 	}
 
 	spin_lock_irqsave(&sbi->iostat_lat_lock, flags);
-	io_lat->sum_lat[idx][iotype] += ts_diff;
-	io_lat->bio_cnt[idx][iotype]++;
-	if (ts_diff > io_lat->peak_lat[idx][iotype])
-		io_lat->peak_lat[idx][iotype] = ts_diff;
+	io_lat->sum_lat[lat_type][page_type] += ts_diff;
+	io_lat->bio_cnt[lat_type][page_type]++;
+	if (ts_diff > io_lat->peak_lat[lat_type][page_type])
+		io_lat->peak_lat[lat_type][page_type] = ts_diff;
 	spin_unlock_irqrestore(&sbi->iostat_lat_lock, flags);
 }
 
-void iostat_update_and_unbind_ctx(struct bio *bio, int rw)
+void iostat_update_and_unbind_ctx(struct bio *bio, enum iostat_lat_type lat_type)
 {
 	struct bio_iostat_ctx *iostat_ctx = bio->bi_private;
-	bool is_sync = bio->bi_opf & REQ_SYNC;
 
-	if (rw == 0)
+	if (lat_type == READ_IO)
 		bio->bi_private = iostat_ctx->post_read_ctx;
 	else
 		bio->bi_private = iostat_ctx->sbi;
-	__update_iostat_latency(iostat_ctx, rw, is_sync);
+	__update_iostat_latency(iostat_ctx, lat_type);
 	mempool_free(iostat_ctx, bio_iostat_ctx_pool);
 }
 
diff --git a/fs/f2fs/iostat.h b/fs/f2fs/iostat.h
index 2c048307b6e0..1f827a2fe6b2 100644
--- a/fs/f2fs/iostat.h
+++ b/fs/f2fs/iostat.h
@@ -8,20 +8,21 @@
 
 struct bio_post_read_ctx;
 
+enum iostat_lat_type {
+	READ_IO = 0,
+	WRITE_SYNC_IO,
+	WRITE_ASYNC_IO,
+	MAX_IO_TYPE,
+};
+
 #ifdef CONFIG_F2FS_IOSTAT
 
+#define NUM_PREALLOC_IOSTAT_CTXS	128
 #define DEFAULT_IOSTAT_PERIOD_MS	3000
 #define MIN_IOSTAT_PERIOD_MS		100
 /* maximum period of iostat tracing is 1 day */
 #define MAX_IOSTAT_PERIOD_MS		8640000
 
-enum {
-	READ_IO,
-	WRITE_SYNC_IO,
-	WRITE_ASYNC_IO,
-	MAX_IO_TYPE,
-};
-
 struct iostat_lat_info {
 	unsigned long sum_lat[MAX_IO_TYPE][NR_PAGE_TYPE];	/* sum of io latencies */
 	unsigned long peak_lat[MAX_IO_TYPE][NR_PAGE_TYPE];	/* peak io latency */
@@ -57,7 +58,7 @@ static inline struct bio_post_read_ctx *get_post_read_ctx(struct bio *bio)
 	return iostat_ctx->post_read_ctx;
 }
 
-extern void iostat_update_and_unbind_ctx(struct bio *bio, int rw);
+extern void iostat_update_and_unbind_ctx(struct bio *bio, enum iostat_lat_type type);
 extern void iostat_alloc_and_bind_ctx(struct f2fs_sb_info *sbi,
 		struct bio *bio, struct bio_post_read_ctx *ctx);
 extern int f2fs_init_iostat_processing(void);
@@ -67,7 +68,7 @@ extern void f2fs_destroy_iostat(struct f2fs_sb_info *sbi);
 #else
 static inline void f2fs_update_iostat(struct f2fs_sb_info *sbi, struct inode *inode,
 		enum iostat_type type, unsigned long long io_bytes) {}
-static inline void iostat_update_and_unbind_ctx(struct bio *bio, int rw) {}
+static inline void iostat_update_and_unbind_ctx(struct bio *bio, enum iostat_lat_type type) {}
 static inline void iostat_alloc_and_bind_ctx(struct f2fs_sb_info *sbi,
 		struct bio *bio, struct bio_post_read_ctx *ctx) {}
 static inline void iostat_update_submit_ctx(struct bio *bio,
-- 
2.25.1



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
