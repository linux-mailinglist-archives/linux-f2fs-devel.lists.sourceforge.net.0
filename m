Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 23CCA5142B8
	for <lists+linux-f2fs-devel@lfdr.de>; Fri, 29 Apr 2022 08:55:12 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.94.2)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1nkKWz-0003l4-Ul; Fri, 29 Apr 2022 06:55:09 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <changfengnan@vivo.com>) id 1nkKWz-0003kx-7Q
 for linux-f2fs-devel@lists.sourceforge.net; Fri, 29 Apr 2022 06:55:08 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=MIME-Version:Content-Type:Content-Transfer-Encoding
 :References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=ZEGa8nY85Ar4+e9rwQOCLCc/BS8uI/Th9t5trcPS6qQ=; b=QSeOtnPJ5ejrisZMxcJoAVvsXF
 IgDIhhh3sWIiqhNXg52wvozX/XhrLBTFXD6X9bcDdKbolHG+eRXIEJ0d/x2fGc3//lbMZkeOgL8Dc
 CTkLS5/LnnlTr9wLdcp2KFrH3RrGouOiOhF+wVe9zBqe2wXbBCb1HaP+8NDAuSz6bJ8I=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=MIME-Version:Content-Type:Content-Transfer-Encoding:References:
 In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=ZEGa8nY85Ar4+e9rwQOCLCc/BS8uI/Th9t5trcPS6qQ=; b=GI3cKEOMJ+jJBYHZ5JtL4yRCZ1
 /Jbrok3HL0fbwHngz7G0pYDAMpOtYGqfoit8WGkoTFxZQe3RR7qYHYcWHbJUa8A4Usdr9uR9E/Svt
 wWmnGhyZY7gqeRy6/6XNKBMNsQ7v7q/0Oy2ZVRUCdTPNLdQFjMWDC4avAT+XDMzZ6vyY=;
Received: from mail-psaapc01on2092.outbound.protection.outlook.com
 ([40.107.255.92] helo=APC01-PSA-obe.outbound.protection.outlook.com)
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.94.2)
 id 1nkKWx-0001a9-4e
 for linux-f2fs-devel@lists.sourceforge.net; Fri, 29 Apr 2022 06:55:07 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=j81AcDzinWvWxw3XKf48gDXrLF0fONH2rrBzSg8yztBkYDxFAzkzGQGTVa4juRbDArUENa28ZohMTykLRs+UVkjNTvSeJLvh33SxPlVJAbiQDsKUXyG5Izqb73r5cfU1S7okSLZBCO4VJNaFH79XkG77cWwBXeaHh3xiWmd7V4FmBCdxdKwIj0QEoUdJR925QmxTl7j6fZWOHCKABwCF1mKQQzfoxgFuMgR4HFH2pSLN/8sGH9HIGQ1HA0MqGgHjAiz47MNkVbAWva29Gzer6xqSs61/W/jHmIR2uyUi/l7UaOTC0qvaOcOED270JNchlYrmbqm2mZXamTSGiDOgbg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ZEGa8nY85Ar4+e9rwQOCLCc/BS8uI/Th9t5trcPS6qQ=;
 b=njA2ZDGxefOLbs+0AUZg+3k7GZLZrxagOJ38HwIct+jz/C7UT/sCflhdEt8N9qppvQFasnyFgl8EkNjBgXl9ejdo1A0WBgNlX7q/mhhhTjuYSwavajMCgimftw8mNTPKceEk8x06WFdE5SXjoDLQsR+aPRBKJqcYrkzcWx/0h7ssbHC3B7MhoT4hqK6hfxixC7dSJ9fjAb0CMTBfUt/orddU2HZBu7Ro841Mi/MH9SbrPQ2wd6o8BgxFFaZ5frdiTQ53/6Hn6b6utLTSNgdm9uZT8momtibd/aKLo9zefQs3AQorIzFsZUtQ8R7xGvCVFE6W+j9dP3oU81fQAjaznw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vivo.com; dmarc=pass action=none header.from=vivo.com;
 dkim=pass header.d=vivo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vivo0.onmicrosoft.com; 
 s=selector2-vivo0-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZEGa8nY85Ar4+e9rwQOCLCc/BS8uI/Th9t5trcPS6qQ=;
 b=T7FTuBV3ZBltGytcwFalfCif4NwQsOEj0SZwQ/Q7l+r18oWXVtOocggJwM4VlpTOKfhm5JGp2JTxcEOYSZBGJXcGGBYsuGG0QmAzMxFn+2fZ4i0IsmZDZ4JPx5QPIdRNOv9++RnhCgsBt44BHviv5ExA/qGjdJnaioaIrcHR6Kk=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=vivo.com;
Received: from KL1PR0601MB4003.apcprd06.prod.outlook.com (2603:1096:820:26::6)
 by TYZPR06MB4176.apcprd06.prod.outlook.com (2603:1096:400:2c::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5186.14; Fri, 29 Apr
 2022 06:54:57 +0000
Received: from KL1PR0601MB4003.apcprd06.prod.outlook.com
 ([fe80::fc26:a0b5:8bfd:7c02]) by KL1PR0601MB4003.apcprd06.prod.outlook.com
 ([fe80::fc26:a0b5:8bfd:7c02%5]) with mapi id 15.20.5206.013; Fri, 29 Apr 2022
 06:54:57 +0000
To: jaegeuk@kernel.org,
	chao@kernel.org
Date: Fri, 29 Apr 2022 14:54:44 +0800
Message-Id: <20220429065446.208019-2-changfengnan@vivo.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20220429065446.208019-1-changfengnan@vivo.com>
References: <20220429065446.208019-1-changfengnan@vivo.com>
X-ClientProxiedBy: SI2P153CA0005.APCP153.PROD.OUTLOOK.COM
 (2603:1096:4:140::11) To KL1PR0601MB4003.apcprd06.prod.outlook.com
 (2603:1096:820:26::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 1932b373-3cc5-4945-3a10-08da29ad2b34
X-MS-TrafficTypeDiagnostic: TYZPR06MB4176:EE_
X-Microsoft-Antispam-PRVS: <TYZPR06MB4176BEBC2CB240918610AE61BBFC9@TYZPR06MB4176.apcprd06.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 6dGKxBb92E5/yBu+tukzh6BfcH4XaNCLCrrsfumPz8FkVehX6cHbaqy5OxNiNFyq5JaQT9qf1zbq/aNYciQhoEloMcn7f7hJepVdsv+OaTHdCIwVefRyT++Pt3T4JjjGG1Np/hr51H9KNBQNSHrmpEdxwuvPPYX1AVk8yrikHWj5/f5M+WlvqHO1z9qP/Kgr4O/zUGH9DlzJZ2/qC2Q7GFnIO010zY0Uih8ne/evdBv//H/iQS2dqlR0fjCfWFhgqGzEmfkgd1uoVy/C7KUncxq2bk3VzTkASNeC3Q4mIzINYC+2AvJPOtMQ1jWDKgeGCLBsLufOkZTdLMQVewX4y3jWAQxi2W3/6H/egpLIKupoVw+saxFg49M7NyY35h5375y20xHUm/5E+KCrIURGw3jyPL7M6F5AAIkPEej4PN0U2Y8vCoLm8VT5NzMXZRdqAUbic3BsV3PJTGFlbeYdaOs4DXtTlKhNJOWsdm1L9M9x476l6OsAxu9pguyRICeFxyN4BheAHdr+0KheM1GTbqQlo9FHmWqEl667D4EYnOSZMA69EQOrF6m7crChSeG1wha0m3BS28eihrCf44OkzTTyZZ/IdJEdOHQgG/zQh6o8Vu1+vzLNCtSs1bpV21YNZw0bMXoHZXaHc5CAMdWNHlkSoNA4GbKui50UJKoxUe3CKIXcrthnrUzMrUmqY2J4UtuPOBJvp8Mh7nKlHR8WRQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:KL1PR0601MB4003.apcprd06.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(4636009)(366004)(316002)(66556008)(186003)(66476007)(36756003)(2616005)(6666004)(83380400001)(8676002)(4326008)(6512007)(86362001)(52116002)(26005)(6506007)(508600001)(107886003)(66946007)(2906002)(5660300002)(6486002)(1076003)(8936002)(38100700002)(38350700002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?O3J01swzZZJMRoYkpRz+pmKXuHMhwrAYwdLj2tSO1E4FCc47d/rzASMdopve?=
 =?us-ascii?Q?y6u4mBMBZNZa1pdhADJiDK7k0l51y0PVNyNwSVLwiDdyoFy73Kf1J5CdrJ2E?=
 =?us-ascii?Q?l0QbWMDhhhJQiW8firrtgqhroI4qC30ZSSOINoPldScEBYa88dolQPU6ohiW?=
 =?us-ascii?Q?FQHPjiXwaCubkfQtzdZICFY6+2cEAIfHp9KtFXtNdWbCr2Aiwc+67sbMMnJ8?=
 =?us-ascii?Q?abU34UJELRMk+jAId7AVmw/6/Gl13hg+pzAFVsWGFei6cO39dQKWINEEDSpf?=
 =?us-ascii?Q?96PdI7ktJftfc1fCMngFZVGr6T/A1iOg3Nye71cHHelrEv2X07Z4HalXobkh?=
 =?us-ascii?Q?nXx/XNUrz6QwVRw/9aOPYuOhscMVnhxTW2pU2VxLaSLe353LLgseBuxjnISk?=
 =?us-ascii?Q?XdtbtFYdI0WM5gzaqMznejOHWX8gZ6cBo9d5+XqViBlxhVFUR6FVsOY+IPC5?=
 =?us-ascii?Q?e1gTxxWai9UWYY4vSRAIKlZTLD1EmgUtD4tbBFvnCtZJ0ukOd3tiYTQcu9Ov?=
 =?us-ascii?Q?vv1NQVG97Hdcy+xdOKq2DxGSudbPAwzbj6vW+78ysEq2m1Inf6Ul85tK7Ijm?=
 =?us-ascii?Q?6VC/8lhdWQUgDANJce9N8avlowRF0uxtS/WY4B4PIQ2fRBaHF8siG5pEaMXr?=
 =?us-ascii?Q?G4SOzc+JpdjTDGT+Y9YKh+xPAMj1OmbHVMkd1qKbwKdvFocZc9WflK+nISp2?=
 =?us-ascii?Q?QYbfWC1EhXqSz/R33B4JDBvq/J9/J4QSoDYKF8gQoFfEEaKgVxKvb1hJ80iD?=
 =?us-ascii?Q?2m3DXn0+lJ7mCKua8ItpOBaxcyYNMVNdyTiOXb3m8Tm7Gt3Aab7OKIq87/Ni?=
 =?us-ascii?Q?oXHZEt13hNw5l0yqh14nKnpIZO1BRewbzwC47aPILnkZ0wpHq704z/wMq6RW?=
 =?us-ascii?Q?DpeDLLCA19fIoqttQQq5z1SU9eQGZ2fZ+w5/JQTECYADrsAKWW1ithW+FxrH?=
 =?us-ascii?Q?U4yuUx9+/vgY2xLnkMAEVPBP8m0rkA5FCqtH/y4sq7rWu6xPjhJK3Ejm1/WH?=
 =?us-ascii?Q?knvABvHBgTt7KwB+70ZFAN6CqkORGLfJdjmXMCBAy/0DM/rZ6EZr1cyQ920k?=
 =?us-ascii?Q?CvOMyDEn5lqCwCpLhM03BcVPwUHb0+CAOHS7UEfavUJp6S6hoXHNars8MIht?=
 =?us-ascii?Q?2mlEEs5vKaDeMI5vOSQLxAEJsgE3TvL5VKShYZkfcCT6wm3VXg5yM4UsL9Hp?=
 =?us-ascii?Q?cNTUgt5mB5AiPkK/zbS9u/37yid8yHuPV+vWylwTRykqvhr0+1cMZ3dzLp5g?=
 =?us-ascii?Q?5LN//C8GlBINE3mUS4zioPbeJoa65Yxwisq8IMAh9z79FxeeC5DmglFRZdyn?=
 =?us-ascii?Q?MQBNSQUp2S5mkZEBzVFQZVmQJd9kXNBig8E3VFB2MqO2+tD12NhQk5eXoYFy?=
 =?us-ascii?Q?35+KDepIrMDUPyMmKLp6+V0zmh3PVLA3HBRQraoGpiFRiun3K8ejUivJMANN?=
 =?us-ascii?Q?HDSesBTJU12bBfL4Fw3wlJOwTlu8MxYmWqkdAJ2qr8Bu7Eswewiw+tz6xWzQ?=
 =?us-ascii?Q?0EgatZYMN44e9SHxaz0TyZVTCGsnlCoMaQzYs6BP7NNesvCuZRtW30Q32Jpy?=
 =?us-ascii?Q?rRx6EwkeUo8WJQm4+QwSrLan+tNoKXWJAxBR5t2Sz1jDBe8C+OVUsRGmucMX?=
 =?us-ascii?Q?cPD43vXne1q26R2hepBcjB7xKZl5uDTzG39crMsPjqBKiPKhmXt7JMWV0+5c?=
 =?us-ascii?Q?4V7YwWH1Hy9DeqDLsfqNuzPtnJdpcTNaclhIMEJG1QtBrRijaRFqTlVJsV5o?=
 =?us-ascii?Q?UrYZFcn7cQ=3D=3D?=
X-OriginatorOrg: vivo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1932b373-3cc5-4945-3a10-08da29ad2b34
X-MS-Exchange-CrossTenant-AuthSource: KL1PR0601MB4003.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Apr 2022 06:54:55.9613 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 923e42dc-48d5-4cbe-b582-1a797a6412ed
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: m2GnV7M8AmbRepW6Xv66SemcJ2BzKy3XwSQ005/PuvhU3AhsdofxFSTLmUdrQD6DAwVK/8PYJIR4gC5yFrHiew==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYZPR06MB4176
X-Spam-Score: -0.0 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  Intorduce f2fs_all_cluster_page_uptodate, try to reduce call
 f2fs_prepare_compress_overwrite. Signed-off-by: Fengnan Chang
 <changfengnan@vivo.com>
 --- fs/f2fs/compress.c | 23 ++++++++++++++++++++++- fs/f2fs/data.c | 5 +++++
 fs/f2fs/f2fs.h | 2 ++ 3 files changed, 29 insertions(+), 1 deletion(-) 
 Content analysis details:   (-0.0 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [40.107.255.92 listed in wl.mailspike.net]
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
 no trust [40.107.255.92 listed in list.dnswl.org]
 -0.0 SPF_HELO_PASS          SPF: HELO matches SPF record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
X-Headers-End: 1nkKWx-0001a9-4e
Subject: [f2fs-dev] [PATCH 1/3] f2fs: intorduce
 f2fs_all_cluster_page_uptodate
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
From: Fengnan Chang via Linux-f2fs-devel
 <linux-f2fs-devel@lists.sourceforge.net>
Reply-To: Fengnan Chang <changfengnan@vivo.com>
Cc: Fengnan Chang <changfengnan@vivo.com>,
 linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

Intorduce f2fs_all_cluster_page_uptodate, try to reduce call
f2fs_prepare_compress_overwrite.

Signed-off-by: Fengnan Chang <changfengnan@vivo.com>
---
 fs/f2fs/compress.c | 23 ++++++++++++++++++++++-
 fs/f2fs/data.c     |  5 +++++
 fs/f2fs/f2fs.h     |  2 ++
 3 files changed, 29 insertions(+), 1 deletion(-)

diff --git a/fs/f2fs/compress.c b/fs/f2fs/compress.c
index 12a56f9e1572..11499fd3dd6b 100644
--- a/fs/f2fs/compress.c
+++ b/fs/f2fs/compress.c
@@ -871,6 +871,28 @@ bool f2fs_cluster_can_merge_page(struct compress_ctx *cc, pgoff_t index)
 	return is_page_in_cluster(cc, index);
 }
 
+bool f2fs_all_cluster_page_uptodate(struct compress_ctx *cc, struct pagevec *pvec,
+				int index, int nr_pages)
+{
+	unsigned long pgidx;
+	int i;
+
+	pgidx = pvec->pages[index]->index;
+	if (pgidx % cc->cluster_size)
+		return false;
+
+	if (nr_pages - index < cc->cluster_size)
+		return false;
+
+	for (i = 0; i < cc->cluster_size; i++) {
+		if (pvec->pages[index + i]->index != pgidx + i)
+			return false;
+		if (!PageUptodate(pvec->pages[index + i]))
+			return false;
+	}
+
+	return true;
+}
 bool f2fs_all_cluster_page_loaded(struct compress_ctx *cc, struct pagevec *pvec,
 				int index, int nr_pages)
 {
@@ -881,7 +903,6 @@ bool f2fs_all_cluster_page_loaded(struct compress_ctx *cc, struct pagevec *pvec,
 		return false;
 
 	pgidx = pvec->pages[index]->index;
-
 	for (i = 1; i < cc->cluster_size; i++) {
 		if (pvec->pages[index + i]->index != pgidx + i)
 			return false;
diff --git a/fs/f2fs/data.c b/fs/f2fs/data.c
index 9a1a526f2092..b8204d91fed4 100644
--- a/fs/f2fs/data.c
+++ b/fs/f2fs/data.c
@@ -2967,6 +2967,11 @@ static int f2fs_write_cache_pages(struct address_space *mapping,
 				if (!f2fs_cluster_is_empty(&cc))
 					goto lock_page;
 
+				if (f2fs_all_cluster_page_uptodate(&cc,
+					&pvec, i, nr_pages)) {
+					goto lock_page;
+				}
+
 				ret2 = f2fs_prepare_compress_overwrite(
 							inode, &pagep,
 							page->index, &fsdata);
diff --git a/fs/f2fs/f2fs.h b/fs/f2fs/f2fs.h
index 38cbed0f544e..b4bed1e983bb 100644
--- a/fs/f2fs/f2fs.h
+++ b/fs/f2fs/f2fs.h
@@ -4180,6 +4180,8 @@ bool f2fs_cluster_can_merge_page(struct compress_ctx *cc, pgoff_t index);
 bool f2fs_all_cluster_page_loaded(struct compress_ctx *cc, struct pagevec *pvec,
 				int index, int nr_pages);
 bool f2fs_sanity_check_cluster(struct dnode_of_data *dn);
+bool f2fs_all_cluster_page_uptodate(struct compress_ctx *cc, struct pagevec *pvec,
+				int index, int nr_pages);
 void f2fs_compress_ctx_add_page(struct compress_ctx *cc, struct page *page);
 int f2fs_write_multi_pages(struct compress_ctx *cc,
 						int *submitted,
-- 
2.32.0



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
