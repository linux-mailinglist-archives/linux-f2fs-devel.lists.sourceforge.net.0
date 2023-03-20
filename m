Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F18B6C1EA2
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 20 Mar 2023 18:56:10 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1peJjo-0006jz-UH;
	Mon, 20 Mar 2023 17:56:05 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <frank.li@vivo.com>) id 1peJjl-0006jn-M9
 for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 20 Mar 2023 17:56:02 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=MIME-Version:Content-Type:Content-Transfer-Encoding
 :Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=eVnC0dCMA7l0X0Uqw3Q1PT4CR3SQSE4oWtY9DF8V08g=; b=a82Y+pFFcg9p76W7c764nPhU6V
 a0br2TRicoh36dSwWnXHhGyVEARFNYxg9DjgLvqz1TjJFSct29xYk2S87NPkfwSf6zBlCnhrCZ2U3
 /+GmlBee2u5REEyk/k6gqUotCCgpeZfj9k/r0UqdrWm6dSc5Ysah3pZ7kApsfl7PiJmU=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:Date:
 Subject:Cc:To:From:Sender:Reply-To:Content-ID:Content-Description:Resent-Date
 :Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=eVnC0dCMA7l0X0Uqw3Q1PT4CR3SQSE4oWtY9DF8V08g=; b=X
 zTOZnTOdfBxFbKwXVugd0MHig5wp/aQrgh7+yEtpPEUlB0EtjDMjgNEbeT3nmPshRg8EhXXGL41LV
 McjE/8BA+2Vf2x3/4rxom6/QXlz6/Pt/DQHEiy0FWcE/kPwrRHVw4rQ/xyTI5Y00qlzVkd5xJzC63
 ncSWayEFt5Jr6/7U=;
Received: from mail-tyzapc01on2105.outbound.protection.outlook.com
 ([40.107.117.105] helo=APC01-TYZ-obe.outbound.protection.outlook.com)
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1peJjj-0000jZ-9d for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 20 Mar 2023 17:56:02 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=feMaeoJObiF6g9ioNkNtBHMLvmEUma+SOop9+sfHrK1hs+2WAyrZCogSIYHFkVah5BQCmnVEplXdbeuCYi7w+wBblt7V2TNvxZyOpuGiWIF4pk2BOZS/aDjrhsJxPRsNZzAOVGhDP16VV8dxZA5cwMYeyJci8zBsPZkqObSyUyhg9GC3nq/Ro5BuzdHzULYcDAB7O1ZyZ6FmlNg+XXtFuRm3XnNgmfmXU6KNpZr8zszvLklMNdZMw6HEAB06r74DIkJl5rHT+DM24ikZ4c3/1/H0jWZU5E0ix62w9Blaqi2AYRRwnxjVyrbMzvE6wpKYOHZDX7a2uTZoDfVj9KI5wg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=eVnC0dCMA7l0X0Uqw3Q1PT4CR3SQSE4oWtY9DF8V08g=;
 b=PvF11ML/pd3GkFhMysMFFHoMTfiGu+DGMAAWkgw15hi8ZUCR/cFxvJGtP8dk16YUm2AuPNBjn9CYB9LsgmAizqVPaNBGia9Wd4g1ToiNgu+RL+rdCIbCITcSER3mI+wOiFtAApmvOTF/LfMv4bZMXr/Hyp2b3JiMebk5igHFYecERqHPpaCB9o/zACQ4MFWjCMpixn0Y7ZMjYxU0P4YXhCtefIzeLvzAUrp5cnkTNABlZ8byjYlhTrmSeVo4E9Q6jaU/fEIevUETEE+bQOQkNmAgUpPRJHtzJkKsY08hyKYo8orGt9fot2QKIg5LX0ql6Xo5fE73zuLOXYBrMjSPHw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vivo.com; dmarc=pass action=none header.from=vivo.com;
 dkim=pass header.d=vivo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vivo.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=eVnC0dCMA7l0X0Uqw3Q1PT4CR3SQSE4oWtY9DF8V08g=;
 b=G+oO7OJVbcn48GfxHwAVsTVkMiW9vjA0BHxoWXn0hlBLv3/NVpQn8Tbishc3Q0V08Sz4gjhpdSXbxmy9WBDUv3WKa++4MXIDuvut0MHIBYyDJtclwuuUgB3F7dVtu7QUr8YamueplIegx38o6eXNVbo2lYbrBdp7EsDnIuXrqjqbVqZsd1e6V14fereOkDTbDahJqa1+bNB/b0H319d2M/ZICLoWm2pKUOi20Hv+eMimuPsNphm9HwZ+qpHFrWkYsfdASt0AUX0Ll4Olpeh3LHHk2KeWcDAWNoN0ovSZIz2OXmMWjsm2DpvCGBskXZt5bPHq7C+PZMHmAfaSnTtnDg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=vivo.com;
Received: from SEZPR06MB5269.apcprd06.prod.outlook.com (2603:1096:101:78::6)
 by SG2PR06MB5288.apcprd06.prod.outlook.com (2603:1096:4:1dc::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6178.37; Mon, 20 Mar
 2023 17:55:45 +0000
Received: from SEZPR06MB5269.apcprd06.prod.outlook.com
 ([fe80::daf6:5ebb:a93f:1869]) by SEZPR06MB5269.apcprd06.prod.outlook.com
 ([fe80::daf6:5ebb:a93f:1869%9]) with mapi id 15.20.6178.037; Mon, 20 Mar 2023
 17:55:45 +0000
To: Jaegeuk Kim <jaegeuk@kernel.org>, Chao Yu <chao@kernel.org>,
 Steven Rostedt <rostedt@goodmis.org>,
 Masami Hiramatsu <mhiramat@kernel.org>
Date: Tue, 21 Mar 2023 01:55:29 +0800
Message-Id: <20230320175529.39129-1-frank.li@vivo.com>
X-Mailer: git-send-email 2.35.1
X-ClientProxiedBy: SG2P153CA0003.APCP153.PROD.OUTLOOK.COM (2603:1096::13) To
 SEZPR06MB5269.apcprd06.prod.outlook.com (2603:1096:101:78::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SEZPR06MB5269:EE_|SG2PR06MB5288:EE_
X-MS-Office365-Filtering-Correlation-Id: 4f5eb618-79d2-4371-af9f-08db296c547a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: aDk/FQCNo8R9EGxf0IUCZrn8gKhaTJBP+m8UMjYz7U2Giv2HxGXcKQdCKOk+oHqTd97mLKhPuD4jQjgPKwCAuNeEL1W58hgA4FxcqyXqGN+BrsU4np+f8DU3gSnaPTRi3irzwlpCO6UbiIt2CT55FaUzmiMqdU0GdHVOM66lGLYsdmsb/qReupUNNXFObHtVopKUYl7wAD1M0g2NRysOBWuXOCWQKNVErOpSC3y09aMwbXPV48sUyGjTnvL/srhZJEj2Ry2+M5v73f+EdAZI/AImF2AYcVitdeBnNTW4iFKU25Hrz2B2TlDsCWXBuqzFDCOx4LJQT7YxAQ84xZqhq0+Y2wMWGPC8oeXQNX0FnwGzY/xBRsTrSlnAdYf6e9XzDG/pM1tkgpnEaNr6IuetuIm/ygb8r+bqGfklDIFD/jqvSaLRs1y3d45oISYcuIcgnVFJqmYcO5s4UvLEKfYteiyq9l7uF9iUTCNWYJBTfRtdo5RZsueguKNXruUgvxK20gtZUqf3P4SCu2eoGgcAp7q3XiDBgL1j/d4JDfzguRwpVGeaFx7FVCZ1IywotGJQRn3bqIt7DsdTsMpVuFBnkaQ3YMqt1J8Zp/jQoLi8IXe3YM4X54P4g1Ic/Jj9KO5sS0qCn1HbRkJKzateqMRgDxhKluHMPxL1tWGvObCndsHddpBjSJso8JeEAwofwxr5wFyLT0zdHp69pNH4WtckLw==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SEZPR06MB5269.apcprd06.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230025)(4636009)(376002)(366004)(39860400002)(346002)(136003)(396003)(451199018)(2616005)(83380400001)(86362001)(38350700002)(38100700002)(110136005)(4326008)(8676002)(66556008)(36756003)(66476007)(2906002)(66946007)(8936002)(30864003)(41300700001)(478600001)(316002)(5660300002)(186003)(6666004)(1076003)(26005)(6486002)(6506007)(6512007)(52116002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?g+Br6yzrGReO4HRsK1hutFNw4WokKxQsOrHDkkl6A7xwTN8htvsvDXgZsAXY?=
 =?us-ascii?Q?o7bJhosu6RuUOIaOjcAHAf8Bm2wzKZknW3fl5oIbrqIWVF8IWJPhpHQmma6p?=
 =?us-ascii?Q?zKLtE6MJM79xJlHWyJLBbGZuPDVOp00yc41J2vThcLloBkjtvXAcnr/QGZt8?=
 =?us-ascii?Q?yxesAetRPhU5M/l+whDjnlh4NWqSavzMBUDp665dU02CvrG2gP3wDhtgZNwa?=
 =?us-ascii?Q?rdSaq0ySJzDmxBYBLVjkbZ9hKGYWvwoww0TT0XLKLsDKvAUHW+mkiv17vZp9?=
 =?us-ascii?Q?12KuCtf952riya7j2iUBZMMtHf1P2nrB5apIIKSbalqoFqt7nkmNSvQkcPiU?=
 =?us-ascii?Q?iZPjZgubKW+KC4NIKLJZ7kFTp3KTreS0BHLbJ6MV4k7MIOHRYcBtUHWuhQbv?=
 =?us-ascii?Q?0Shf/z6rbJvva63vf6QdNZnPRufZ9j845mcnqLoQ09+wu405YkhQH46Ss04c?=
 =?us-ascii?Q?TxTt/LN667n+M6cUj3XqSshTEQRY6sQ1i2etIgIqBXSWGJkG/TtVjoRub/pm?=
 =?us-ascii?Q?dkJ1vS7VrSGGuVCXZaTUp17dlauOgERpovNXngdgvfZbAUduM89gUGChkgXO?=
 =?us-ascii?Q?pmzREnuQPTqAfNZqXKb0T0hcuAmQpw9e2F+93dz2Nu6/b+MLebAcdt2PrWhV?=
 =?us-ascii?Q?9SsMFXsT6LHBWGcYDDRvif20dHKG7wqiunIOY5AQo6lJoNiGHA6bEzS5Nqb1?=
 =?us-ascii?Q?fAY0mU/OgjmzVXnkGw2+9tFJYKiTf5wtLdsPKqkMXS23bQm6TtE3DyAWfJpw?=
 =?us-ascii?Q?bRWBL4V3cSm/41IaI+9FKE15Y0Pd/DOfbe9kmxP2TeQ2BU7JlK1G+Wl+A8XJ?=
 =?us-ascii?Q?ZNxH07MGADHqc1oR/T1P2Bb3gPHkc5sek9Ufl+ycrE3x/3VDEn2i96QR+I/Y?=
 =?us-ascii?Q?r10jJYTMTratPCdjK6Ff9mPSFl1deC7OmgvCFgR3PSJF1R2PsrdSqh00/xZe?=
 =?us-ascii?Q?53tXDgwMHrUh1lgzaZx7Vb4M7/Gs+bVvnHqcWyg+p/52vvcImvMNXUjQS0oO?=
 =?us-ascii?Q?rv7AilvvgfVX5d1Hn5+SEed3rlRoztMi2X1SjMLL97a8jGWacOICJs0biznV?=
 =?us-ascii?Q?9snq0PkSj5O73xAbasGWwOz0WT1X8ohVFIcstYSTvX/98eASp7+9eKv+GVBW?=
 =?us-ascii?Q?HW8dHiR2fRP7NGL2Pr+2a9vDsvsIU7hz4Jl4Zd4RryaeiGoGaGlZAL5FDq3I?=
 =?us-ascii?Q?zBffS7ZVsQ8ZDjfHDKxFAvOI6x8ouVCZm4/n1aghbfcsKH0tXh4JJtC+qaEA?=
 =?us-ascii?Q?kmVAO3ktqz+b5er64X5yiLdWEhMqUXFqUUWuo/MPGrTDXy1oluYcL6sUzM4x?=
 =?us-ascii?Q?m++HYbmKKeFed9KcZsVkf91Pwqmfh4oO6y7wP8OrUjOMhOROYLF9MRy9kIwz?=
 =?us-ascii?Q?Ll6btVVUiu1x3b9E2FlvH+3uBIg54nRiXPdQdZovpjmJOHIRKldlCtOi8vGe?=
 =?us-ascii?Q?G++gBgaLLMrpJbq9D+PtFEUL4szFel5yJdoIpIXK9DF3SOXie3Nn6niQW8f7?=
 =?us-ascii?Q?RKMOWjrLigpTnL8arsxhxb+S/+P+0ugpfK6jmKpFJS2/7+dLSSqzowPoNKlk?=
 =?us-ascii?Q?m/QjXZpyeG9PzxMWlkak3CKW369NKzes30IdZAPD?=
X-OriginatorOrg: vivo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4f5eb618-79d2-4371-af9f-08db296c547a
X-MS-Exchange-CrossTenant-AuthSource: SEZPR06MB5269.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Mar 2023 17:55:45.5152 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 923e42dc-48d5-4cbe-b582-1a797a6412ed
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 3MWsGgUtHE5mWa/3rTq3Xuw8bjxJ3wRMydmsK2AD6ph2v8DZT1prZL0/pyuOo1wi3y98KROoAWFLbxSKhBpchQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SG2PR06MB5288
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  In this patch,
 it adds to account discard latency. Signed-off-by:
 Yangtao Li <frank.li@vivo.com> --- v2: -rename get_bio_iostat_private to
 iostat_get_bio_private fs/f2fs/data.c | 2 +- fs/f2fs/f2fs.h | 1 +
 fs/f2fs/iostat.c | 83 +++++++++++++++++++++--- [...] 
 Content analysis details:   (-0.2 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
 no trust [40.107.117.105 listed in list.dnswl.org]
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [40.107.117.105 listed in wl.mailspike.net]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.0 SPF_HELO_PASS          SPF: HELO matches SPF record
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
X-Headers-End: 1peJjj-0000jZ-9d
Subject: [f2fs-dev] [PATCH v2] f2fs: add iostat latency statistics support
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
Cc: linux-f2fs-devel@lists.sourceforge.net, linux-kernel@vger.kernel.org,
 linux-trace-kernel@vger.kernel.org, Yangtao Li <frank.li@vivo.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

In this patch, it adds to account discard latency.

Signed-off-by: Yangtao Li <frank.li@vivo.com>
---
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
index bf51e6e4eb64..b80aaf5e6f50 100644
--- a/fs/f2fs/data.c
+++ b/fs/f2fs/data.c
@@ -2311,7 +2311,7 @@ int f2fs_read_multi_pages(struct compress_ctx *cc, struct bio **bio_ret,
 		if (bio_add_page(bio, page, blocksize, 0) < blocksize)
 			goto submit_and_realloc;
 
-		ctx = get_post_read_ctx(bio);
+		ctx = iostat_get_bio_private(bio);
 		ctx->enabled_steps |= STEP_DECOMPRESS;
 		refcount_inc(&dic->refcnt);
 
diff --git a/fs/f2fs/f2fs.h b/fs/f2fs/f2fs.h
index 9c3ddebd28e3..26de577fb98f 100644
--- a/fs/f2fs/f2fs.h
+++ b/fs/f2fs/f2fs.h
@@ -1131,6 +1131,7 @@ enum page_type {
 	META_FLUSH,
 	IPU,		/* the below types are used by tracepoints only. */
 	OPU,
+	DISCARD,	/* used by iostat */
 };
 
 enum temp_type {
diff --git a/fs/f2fs/iostat.c b/fs/f2fs/iostat.c
index 3d5bfb1ad585..304235b4f543 100644
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
+		lat_type += type;
 	} else {
-		lat_type = READ_IO;
-		bio->bi_private = iostat_ctx->post_read_ctx;
+		lat_type = READ_DATA_LAT;
+		lat_type += type;
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
index 227e25836173..9a6c45a62e8b 100644
--- a/fs/f2fs/segment.c
+++ b/fs/f2fs/segment.c
@@ -1012,9 +1012,12 @@ static void __remove_discard_cmd(struct f2fs_sb_info *sbi,
 
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
@@ -1188,6 +1191,9 @@ static int __submit_discard_cmd(struct f2fs_sb_info *sbi,
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
