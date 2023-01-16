Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F5A866BE8D
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 16 Jan 2023 14:02:48 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1pHP8R-0004my-3R;
	Mon, 16 Jan 2023 13:02:46 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <frank.li@vivo.com>) id 1pHP8O-0004mr-QA
 for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 16 Jan 2023 13:02:44 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=MIME-Version:Content-Type:Content-Transfer-Encoding
 :Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=LD/fWeUHjzYE+WRwzmlLxSCP9GEFOqaTeuks0H5w1hY=; b=MuZNLNdjnPXegnJNW5xnySsBvQ
 rERQ7i5LO2cMwcw7xQYQPG4NMF7n2sS2myD+bt2hc3rV2qOcFS1G3orUA+bsuTmIn559R1jYCsNkB
 EOjYeiSTEkd/86wQWdq5kgmFiPE0+nsxKyHKUZS5E+MIDI4e3+WQZStsdrix5w1UoZ+M=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:Date:
 Subject:Cc:To:From:Sender:Reply-To:Content-ID:Content-Description:Resent-Date
 :Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=LD/fWeUHjzYE+WRwzmlLxSCP9GEFOqaTeuks0H5w1hY=; b=a
 D3D8oYewiUYVzeoFZ8GmkWPq4x1JbPR08L7PyHXtIzeFm68sZqCwOFOjX2BFzg43UhiP2goiWZcHv
 woTJCIClSdEy8nj/EFupTHek8qr250DTYLR9OY5xO15JLu8pTDxXCiqOD7OkrWiTLXMUb1C3ugpZg
 tsZuAYZhYayw6KbA=;
Received: from mail-tyzapc01on2110.outbound.protection.outlook.com
 ([40.107.117.110] helo=APC01-TYZ-obe.outbound.protection.outlook.com)
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1pHP8N-0007q6-Es for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 16 Jan 2023 13:02:44 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=m3q6xPiOHrqaE8vFIarW2NMhPF34LDQjYt0PP5E7frEXEuYIGGjaKQx9K0FIWWCjAjkXev2LoHsjDvykULxDv76vIc50F+a+B/H4jlDFaKqPt9Eo/2TGTFZ9w0C/JpcR0PuMZr+u6mYCnp2S7CrYbo7kRfrhq68999VmFuX/EoLXAWS3FHKjcQIXPvCTH68/6wtj5cEDbtsCtWhgpOYZ8vLFlDTjK38jQdpj5aDZfN46hI/8lNLi1ZM8N+C5bioJvtWceAeigeg1Dd/SpGirum+Xkj6ll0tFHIQAGunR+orcBZI9yWTba6AUKRpf9SeSg5k9sivCOWF8G9nvFY6UHA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=LD/fWeUHjzYE+WRwzmlLxSCP9GEFOqaTeuks0H5w1hY=;
 b=g0mOksktLBHKTQtG/ykf7H8PhbRdEwYjZROZjv62PsnVl7nRY1jzwbMwvkd4MLklZ+PJtJ+NkP5MRWcj1RTWqhHbKt0HwHTA7Bl8ai14qrDhLYHBCze9qB80fr1qJMC3SFye79tg0EFLegLEVwyJD0jehRLEGMZ0qj1FYszN/KtCzYyCex0qc/db9KkANzhT2OIx6Fj5/LlAoS7ytJnQesuQyYXba7p9IeSE/lNjJxyMYiNxUyHhksuLmpdZ9EqoaUBL8ZZvr2vh7CHUsm0H4Tr4ursmX7SvyLZibLH6uenTz1rMopj6KltsD91by6hbM1IiFmx75lcqHi+xOU3TtQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vivo.com; dmarc=pass action=none header.from=vivo.com;
 dkim=pass header.d=vivo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vivo.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LD/fWeUHjzYE+WRwzmlLxSCP9GEFOqaTeuks0H5w1hY=;
 b=SM5UG69RCE4CgJoWWas4aWvOaAsq2D6NMzeszfLUHzrG/psK8O9GfrFSEjoPvVl6YEjFMLBX/8kffQ2KyO4Evrw4eWJ24OfmMvDcS2FGhqv17OWFaRClS0+PSFVjSEG79S1efaz+dHhcylNkgEA9ZVr8DE8ltDbu7qlgOEwJJma3I/AdZgV8orlsNqE0bQNOm3KJox7tnNZ2ayked0ilntFtMLAo91gwykMGu11myjotcpMZbDEX3SOMZQseJoqZpKVe/NfDuEkXsXN2oCoGyeaxS2SKDxaNIWViEN0uPvGmdP3thy/d6L3lco5W93F9TPZuCrr2qqaxfit+Y1R/fQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=vivo.com;
Received: from SEZPR06MB5269.apcprd06.prod.outlook.com (2603:1096:101:78::6)
 by SI2PR06MB4251.apcprd06.prod.outlook.com (2603:1096:4:154::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6002.11; Mon, 16 Jan
 2023 13:02:35 +0000
Received: from SEZPR06MB5269.apcprd06.prod.outlook.com
 ([fe80::3e52:d08c:ecf4:d572]) by SEZPR06MB5269.apcprd06.prod.outlook.com
 ([fe80::3e52:d08c:ecf4:d572%5]) with mapi id 15.20.6002.012; Mon, 16 Jan 2023
 13:02:35 +0000
To: jaegeuk@kernel.org,
	chao@kernel.org
Date: Mon, 16 Jan 2023 21:02:25 +0800
Message-Id: <20230116130225.34600-1-frank.li@vivo.com>
X-Mailer: git-send-email 2.35.1
X-ClientProxiedBy: SG2P153CA0054.APCP153.PROD.OUTLOOK.COM (2603:1096:4:c6::23)
 To SEZPR06MB5269.apcprd06.prod.outlook.com
 (2603:1096:101:78::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SEZPR06MB5269:EE_|SI2PR06MB4251:EE_
X-MS-Office365-Filtering-Correlation-Id: 4ed2704a-8bcc-4fd4-f5ce-08daf7c1f02c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: oRrFugrkq18RlDKdsOoLwk2VbiP3wuvW/iY+yH6C1rigEpo2754LdiKJMVCeTYWgbZP7DtjoGfVhOe2W225PinHlZHIObOmrXuvINQpSyKLDM3IAjYfQMelVkHU0MLP7DrN3GdFaF1Sk1TU9q53PMp/wSasQh7c3wg+O49NI8Gxr7RmDwLZXRwQkIhVJBRdwJAcDNm5/RYGJMe4BtZ4pb1LsS/05mXkQFA256VY05Yvto+1pnkk+NHRiiWn7HIZwgbMgInxfaNTdAT8dCQuvLMHWXqqZy/LVy/OEyBAbjmMVUqwsNLXuwh/qRvWOOeDx78AC6kRAaQu8bx+cS7rotTQEVNN/p43qiPPmk+GgFD2osj1I2HaHL9+YEwMP66qlBb4HRJgxTCaAKB2mrVhV/s8+97gmiHkUPicAsbfIYD0Fn1DaFuSy2rYNMBUx5zjsxSTmZQ+H7uProLhOC5W/iKUaoEv/M9u7qOjnOsm4wmEUZtx7TqmdrUF9+LAvq3QRtP3KfIoi564sjBsy1imggrKvrd5Y69pOmh/mw4j6Dtz60wGm2nP4wTdDwwzUGQ/i+521c8250JrAfaWtcBTPokNANRXWHMoGwGLcEw4VDCQbaKQkqJOBGLBZdvmMa03bsPFjRD4JT2USN2Yho4IoNRuZgwW5sKKQQGbl8+n1bWfX0rKkPFNieBimlbMVY7GP2Vuwi0DW5ggf9YS2t6NAwg==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SEZPR06MB5269.apcprd06.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(4636009)(396003)(346002)(376002)(366004)(39860400002)(136003)(451199015)(36756003)(86362001)(6512007)(186003)(26005)(4326008)(8676002)(66556008)(41300700001)(66946007)(2616005)(66476007)(316002)(52116002)(6506007)(1076003)(478600001)(6666004)(54906003)(6486002)(2906002)(38100700002)(38350700002)(83380400001)(5660300002)(8936002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?a0wnBheJLXLU7jSjhnX9nbTHEEbLPiqEGUhcPj4YRHyYtDA1skEh3Ybb+qRz?=
 =?us-ascii?Q?JQl08jRsL2bWXEakp63L7PlvHH31er3CO8aLN09cDwBTvPz0HWV5//4FF4eg?=
 =?us-ascii?Q?LACuCKRYfB6eBO9MHUdUdc80RYv6AM3caoWMbwpbRozOIE34JuB1ef0+I65s?=
 =?us-ascii?Q?XWerhu0mC5rQXU+zu4zgaGpTkzV/EMAKUOmA19to6ZmpFclLTsLo4zrO/5lK?=
 =?us-ascii?Q?yKTSfTfHpWviF4J+K9syAORIqHsinkjbTkD+i8l/bsC22D48uESOJBgjrBSy?=
 =?us-ascii?Q?5BHIAi5VwuzQZzd9Um+mNtbCOrcadXLfoMAnyn14NIlAxCp9laHcFmcosPIm?=
 =?us-ascii?Q?VpZXw566vx45kQKk5in4uc/k6fJLgi1t5C4Cw/SN5vNcUcDH2X8ZGvKrnMZE?=
 =?us-ascii?Q?kjnb1vIGIVnWHcw2mTwEXOjI9TULpXe70x1RJSsYt9CKsk7uVXqT8Tk/SdPW?=
 =?us-ascii?Q?kwP03h4OmWHCPpn8o7MR/SnMBFt4dpGmZqmAS5J3kHheHxkUs6r9MJydL62i?=
 =?us-ascii?Q?bho8faQ5tYWei7xwJK26l8kKCYppSyMTkVCgFNnXHRUG+oQTQazmu8ukmj2Q?=
 =?us-ascii?Q?IgjBDXmxCiiIILnZpWzxYuOOPPnWU3/HNMC/kEj2C5i/Qc9tEAAt641oPzAY?=
 =?us-ascii?Q?QwfGxjWXk5svhZoUb2nuZlIpfknpcoCzz6eBzR/ig5VteHka8hPabEGVvLGS?=
 =?us-ascii?Q?MxvM9P1x6NcQk6wWr9Sce4OlkQqx/T9B9y2Mo5Xlq5uP270rZBaLHpbYq4Xh?=
 =?us-ascii?Q?0i/nlTJ/D2ONO6/lJdvWKFmVfkBH/5q4m5VPijNk4N19/P6EPQo4elORLErD?=
 =?us-ascii?Q?EQ0ANgPZUIoZcwgS3X7rOtKBVEyX805enmlyUcguh2Iyx/THXs+fyQ0ww9rZ?=
 =?us-ascii?Q?9A8FZ02vTRJUYzUv+3h1t42EwE3aHqye5k+ZhRJtkbE7/hqgw3rpRB9W6ujX?=
 =?us-ascii?Q?JHIds95y3X2Ng2pUnTA6YTom7yR/30NN/H0fLjawvm+rklXUvI29BgG8XBKi?=
 =?us-ascii?Q?4hjcxEF6kYz4sF62LDxAH0BFYLiQrtm3YXpx2ktoQb9PqibGk3wEdSPsE4Hv?=
 =?us-ascii?Q?i+cEA+Wbc/rsaVq9/bJpW5npU+h5T0x6s8Yq1qOIopRsXsd4PNAk4Rl7Oqnz?=
 =?us-ascii?Q?PXDNiisqPrunitka2jc6dtQFRei5+h2v73YrtjrWh+qZRZ/WqzGlRjPW7uGp?=
 =?us-ascii?Q?WVb7uWb1a1IPQcSQcHXzll2Qa/uE5zIrCITFkSLScjkY9hWT4Pnw75lZym7Q?=
 =?us-ascii?Q?OyWShC2TIzMPZPgAI2HJj9iNcEjv9MeHgoWZ9MYuidaF4zpUml4X/blCC+2g?=
 =?us-ascii?Q?Zlrmj8XfvhAQEiPTF4uSzRAcoIOhjMBWoYNiXJGtlFzapzyyh22qWPvOxsLd?=
 =?us-ascii?Q?ALj3yH7PqRUeyv0WKxTj43tMhiB8ueklU+x1fXpfd3cEnN/4PyfsPMXTrCDw?=
 =?us-ascii?Q?hG6zY5xTY0lJ7zntxdPAscnfwBFNxJcWa0N665K2s68kbfHb1RzNXHkBetpF?=
 =?us-ascii?Q?4E10y8vuje4a9ksrsNY5M0wvcJLjnBnLijMcWWPafVqeotqSQKO91xUAfhuB?=
 =?us-ascii?Q?XI5BPqr9WVtrYvxLfw4/4pL8FkCFHDs4NpXX9z3/?=
X-OriginatorOrg: vivo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4ed2704a-8bcc-4fd4-f5ce-08daf7c1f02c
X-MS-Exchange-CrossTenant-AuthSource: SEZPR06MB5269.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Jan 2023 13:02:35.8604 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 923e42dc-48d5-4cbe-b582-1a797a6412ed
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: rguwMTYMihRZq4TJukKRZAmlYzWuUACtc+DMwRmS40bP1asIz2XZ9Ws0iDv1qt8x3WeTqt0T4ju+OGF6Jq5RBg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SI2PR06MB4251
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
 Yangtao Li <frank.li@vivo.com> --- fs/f2fs/data.c | 4 ++-- fs/f2fs/iostat.c
 | 36 ++++++++++ [...] 
 Content analysis details:   (-0.2 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
 no trust [40.107.117.110 listed in list.dnswl.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.0 SPF_HELO_PASS          SPF: HELO matches SPF record
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [40.107.117.110 listed in wl.mailspike.net]
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
X-Headers-End: 1pHP8N-0007q6-Es
Subject: [f2fs-dev] [PATCH v2 2/2] f2fs: use iostat_lat_type directly as a
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
 fs/f2fs/data.c   |  4 ++--
 fs/f2fs/iostat.c | 36 ++++++++++++------------------------
 fs/f2fs/iostat.h | 19 ++++++++++---------
 3 files changed, 24 insertions(+), 35 deletions(-)

diff --git a/fs/f2fs/data.c b/fs/f2fs/data.c
index c940da1c540f..6153647d93b0 100644
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
index e9a3df7ce4d9..bc6a9c80a026 100644
--- a/fs/f2fs/iostat.c
+++ b/fs/f2fs/iostat.c
@@ -14,7 +14,6 @@
 #include "iostat.h"
 #include <trace/events/f2fs.h>
 
-#define NUM_PREALLOC_IOSTAT_CTXS	128
 static struct kmem_cache *bio_iostat_ctx_cache;
 static mempool_t *bio_iostat_ctx_pool;
 
@@ -210,54 +209,43 @@ void f2fs_update_iostat(struct f2fs_sb_info *sbi, struct inode *inode,
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
-	if (iotype == META_FLUSH)
-		iotype = META;
-
-	if (rw == 0) {
-		idx = READ_IO;
-	} else {
-		if (is_sync)
-			idx = WRITE_SYNC_IO;
-		else
-			idx = WRITE_ASYNC_IO;
-	}
+	if (page_type == META_FLUSH)
+		page_type = META;
 
-	if (iotype >= NR_PAGE_TYPE) {
+	if (lat_type >= MAX_IO_TYPE || page_type >= NR_PAGE_TYPE) {
 		f2fs_bug_on(sbi, 1);
 		return;
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
