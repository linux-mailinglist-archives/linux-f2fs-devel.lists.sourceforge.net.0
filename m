Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id D820260C212
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 25 Oct 2022 05:09:11 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1onAJQ-0003VO-Aq;
	Tue, 25 Oct 2022 03:09:08 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <frank.li@vivo.com>) id 1onAJG-0003Uu-5L
 for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 25 Oct 2022 03:08:58 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=MIME-Version:Content-Type:Content-Transfer-Encoding
 :Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=vztr6GBxy9chli7oqmBT+UVadngpfK49wFahpBbZ17s=; b=WqU8JfMzxWC6mOlzdfYJxV4faT
 IdsCMZeER/Q2EnR6/wO1uP69VeBq1GaCOLVRhLu42SOnWkiHLojxXZzacowcGWgZo+87r3qrkdyGx
 tQubHAqK6+uN83nzb5wVfR4tp8FQ24AUZE4F350JXk1eS2o0AwxdOPsHgdlJGHs+SYes=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:Date:
 Subject:Cc:To:From:Sender:Reply-To:Content-ID:Content-Description:Resent-Date
 :Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=vztr6GBxy9chli7oqmBT+UVadngpfK49wFahpBbZ17s=; b=f
 eT0BicdJGRdgt+SSva7U046zhuMbq+Z8CYcUVTkQ1hf7n5/PZTapL6x1Rl7N5Q0JTZwGAGU8Z1cSl
 CEphJmRFllMuCDdjGhV7sHJTFYpg8LEuxb6MPQ4YfQfnDeZMqnyMDx1o/PK/GF1Z56w9wRNlzvlVh
 yBKvvr49hV56pmbs=;
Received: from mail-psaapc01on2096.outbound.protection.outlook.com
 ([40.107.255.96] helo=APC01-PSA-obe.outbound.protection.outlook.com)
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1onAJC-00GK2V-4q for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 25 Oct 2022 03:08:58 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=EpyqrkDb3aDgR+TEv0s96i2jxxARa+kcy9TT5SZOXO4xPfsb39p5PGG5luk1XONTKTEDNxfHpxXntpyyFyd3HZER2b7G6RPj8sKXDgCEfWaYz1niS4LkfqwUFdfzT4EQKIWEsfWyYVQ7kh6lAIslW9BFtncM/VAKSbIemSh7bRM1sjic0uJLdD7jYXBuDWKdb0fyy6i8pyNaQY9JcHdfITJ2pf25vK+Mo2VAQhC8jxa7LqP7lxGKyALmrpPV/4DJKwLVZrS+t1qgwb7+pzKzC/61zvaemsGFzzQzVnFkDmPzWWjjZ1VQ8ehI435dgb4O/g/QS6v1iNwBga6bPJtJfg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vztr6GBxy9chli7oqmBT+UVadngpfK49wFahpBbZ17s=;
 b=D7PR8J2GwAILjpskmUelOUPtSBbt3wfgiLRoB3oCvqFrEVl6ZnlA7Bg+LhOSzICRrFRY/CfsLFy6JMWpO/kJ9DLG2dNefKo8ppdQCvPQph1VPDLmaZ3Nv0WhxSwBN/xboGZOFht5uQmYwwXgBHluq43OGqEODKEGhMBx4br7/MGSA5jT+0w5mcs10yiO6BrWDmQH64QET+cwGjoofyn3VOQMFc5Kr7266hRVrAvMKPlvyi2RqhF+P6LiV05zBwnaoBY8q067vHmlwpot2C3y2bc/S//muvM3e6N3lnFTVCzkjyPM71Gbmvo09b56nJkGs0W3DKYm7+5F5ZyrUHgi8Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vivo.com; dmarc=pass action=none header.from=vivo.com;
 dkim=pass header.d=vivo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vivo.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vztr6GBxy9chli7oqmBT+UVadngpfK49wFahpBbZ17s=;
 b=H8zIHPTRE4vcbhwlx3Um1AYBAJGCUMP9Drd/zDnWluaQu94SRXeT9MHWikXlnsuiFPB7tw4mlSztuxbYirdUzQmP708WaQN9jpgitw2w465HCxlcNbiqigqB1iHKExYHE4/6IjhONVKaEbbMXPl5PcikfHHYedXfGFZl6G1gbiFNzUux+zN2Nv4nXWzxSOjhWAEN8H6vp+5cz9PQvb/TfG0TmnLEC/k44c/bLmqh0hP4mNyw2V0CGpa751i8ulTYUTmOiylroDdRxT2ZMTQgwEalgmy3qJyVqTrm450of9qvnO2XRrUYkdilndpxeFBuugcrkrRGfkhwYqhMD9DHCA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=vivo.com;
Received: from SEZPR06MB5269.apcprd06.prod.outlook.com (2603:1096:101:78::6)
 by SEYPR06MB5063.apcprd06.prod.outlook.com (2603:1096:101:54::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5746.28; Tue, 25 Oct
 2022 03:08:41 +0000
Received: from SEZPR06MB5269.apcprd06.prod.outlook.com
 ([fe80::c84b:5a6c:d66f:c0fd]) by SEZPR06MB5269.apcprd06.prod.outlook.com
 ([fe80::c84b:5a6c:d66f:c0fd%3]) with mapi id 15.20.5746.023; Tue, 25 Oct 2022
 03:08:41 +0000
To: jaegeuk@kernel.org,
	chao@kernel.org
Date: Tue, 25 Oct 2022 11:08:31 +0800
Message-Id: <20221025030831.53888-1-frank.li@vivo.com>
X-Mailer: git-send-email 2.35.1
X-ClientProxiedBy: SI1PR02CA0013.apcprd02.prod.outlook.com
 (2603:1096:4:1f7::7) To SEZPR06MB5269.apcprd06.prod.outlook.com
 (2603:1096:101:78::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SEZPR06MB5269:EE_|SEYPR06MB5063:EE_
X-MS-Office365-Filtering-Correlation-Id: d23e433a-47ae-481c-d092-08dab6363847
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 7fcwDKSkICzFd/WrrvF9B4kNanDss6Oaov55eLrjxE8CRvAZGFqOZJCoPoP9b2+/Bb1yEqgl8u5XdGqWjYLd6BKldpvcApuQaD6TNfft540yzXv/jv3IQ3cPjShX+7FbyhaDR9XapwLdAq4d9C+pS1eUK8eoU44ZC8eDkSBeKciCuJXyh5FQrWfYc7LfOu+qA5+Qs8mejnBKn6vVaaPHvCakDpfnV6BLK74+5cG1NpPEGdMSMIxNlLWGYNmrXeS//dQvHkF8n4MlIBxVo5rRqM8xDTugEWCIkvQOnzV90BwH9g7/HYOALpX3mOzrLXfNXDVaLWPqftMxYuZBnQIu16ICgT4fHQEZFL/t8J0yg9LeRtSg+A8OA6h6pMeFJ9qyI/LQCISEzNafVD63ymuZOAjBK2WESL96q36bzY4wyOJ6xRYQsQYk3iTcJIxGDutRFF670Wv+fL5o16FQEG7zHsZhjJGF001YwKykpbvOXlNAOtGg+m+7H7hBI+SbfBtMNWW5zDxyFUwHlF2twQikbcYktDR3/YVCIG8WBKSxpLF45C3mQ9vz/BZR7N4n2M363dKE/oliAQRiKy7wjKVOnjKKb7EvTF4sNtR94T/ISKeYGVFYeZUPBZ91qAVKVD6uPubgRT/2/XFilUEG5IaJl1Q402Yn+dQJatI9MRYOZds+E4SSiWmjsmLlOJ9TZRuUPC9lNg1iPYs3eQ+UERQ5fsP26J5KQNYyKQcwtHs7XvN5KvxWQASlykP64SmJnuDoFHjhdrgRbgE+/Vml94nHiQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SEZPR06MB5269.apcprd06.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(4636009)(346002)(136003)(366004)(376002)(39860400002)(396003)(451199015)(83380400001)(1076003)(186003)(6512007)(2616005)(26005)(2906002)(38100700002)(38350700002)(5660300002)(36756003)(41300700001)(6506007)(52116002)(107886003)(6666004)(86362001)(316002)(8936002)(66476007)(8676002)(4326008)(478600001)(66946007)(6486002)(66556008);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?ui+xkZfS9qwprtcAQbZbUFQmEaQmD/t2viX/zfD9DSzRQUs19FA/0mmJ2tKa?=
 =?us-ascii?Q?msiQ+FpJGCXM7cw/oKBNCTRejC6xx3QwVZDQuPNEwIFzNTXfq2xFdgJQbIcX?=
 =?us-ascii?Q?J5ZylbAMQRpwDjWvksLN3Fa+PiLJ+2CW6CyxPNdFas1sk+l6FBbpRBtLif2v?=
 =?us-ascii?Q?TT4wEAvhlEiz6MCiB0nWGgXKvAZ3/+RaIsjrgG5eYY5X3BY9dNuDh97PSoyk?=
 =?us-ascii?Q?VCP87UsrXfHXqEYrKKT5TGVx6XBdCeQfaxBXcfp9RZUgk76Z1EkRqsNLWjxM?=
 =?us-ascii?Q?5bcx6LyXYU5AEjAr95iGzE8W+9oj0xFvPdh0ht4vShqQUtkto3buG1JusHse?=
 =?us-ascii?Q?wXfmhjQkeIDtusEbB+P26Ab/TPopoyLn094aKht7AGt6Aki1PSiqL2RJMNTo?=
 =?us-ascii?Q?7TXq0JiFTbGTo0rl7Bq6cJm/7+0vFChi89HH6tEIEwf3q0zD5XNWs9FvmF/c?=
 =?us-ascii?Q?M3UuY22yipVW9YM0e9lhKdALJyUYSHFn4u7LX+0CbvUBHbZc57ySmXC5qt+n?=
 =?us-ascii?Q?32q8cN7GKcnTqPXGIWYlWbGf7DNgIAyFQVTIKkCaJtnWQCHN/4KCID0lTi9u?=
 =?us-ascii?Q?Y5c1A3SpaTE+DYj9DvL+9iPpW+ujJWcVBxXLF87EubNA9WxJ36ru8fAe4CYw?=
 =?us-ascii?Q?+pOYiHduDdAbl3L1hGMV/I6uq0dQm02aQ1clUzhyqj3UlQiH5qztpcXp5Bc6?=
 =?us-ascii?Q?aiE/VZIiRHAp+Gry8ug+Y43EvJ0h9hiPsSEbeA5n1vBz5lEf2OEMcVQ579L0?=
 =?us-ascii?Q?UOm+xrs9ip/cj5oTBGA2PiGZXfFl0hnG2gVEjR7ixY35Oybevo9qZIc1+5QR?=
 =?us-ascii?Q?wPUWn+EZ2xLBmDA97y+oePsxTRei1DS+c7QxV8/Dj6Iw/+1dvUQ4eqDP6+QQ?=
 =?us-ascii?Q?Q+F1VJELiLbbJFKUV70/+eqIxv9MCZ86nwN+h9vU4nqW7tAbLOLgrO/kHhOH?=
 =?us-ascii?Q?B3JJ8ho9QhrFSB8BYK7EzFPYGJFt/3AY9cY2F+NpZhJNczSuC5qPsUUqPws6?=
 =?us-ascii?Q?6oLc4gX2DRWLb2jpKBkqcFcUspJQIqSx4gyxWVTjE10J545EoBE/8quf6akg?=
 =?us-ascii?Q?WlZs4Qrz8pKNqZt33ixtl0WIjvyhC6FZCRiXD6CJcRAgWYbw/XhcSL3aeRwO?=
 =?us-ascii?Q?6+zHFIPdbLtSUm68xbYv4hze4NGRegfq4YY/nwDXROF/MgMsGddW/Jc2rrgp?=
 =?us-ascii?Q?+K/2Hn/fNQKNVkt4wWU+uCkMh146vdDN8KZlITFqLs33jINzO3bAKfuBUnUM?=
 =?us-ascii?Q?Qsdy3WyC3AqUovWs1dE0yHpaUQrsg1EwUtrqhRk/pL/rpnMQRjmgOCrcR4qc?=
 =?us-ascii?Q?XtskJW9Km6XnKEh0PJZoKlBrqH9LflJINKeS1YhEjwsDMijnNkjkLTqw2iex?=
 =?us-ascii?Q?v/TzUHGiFyEOMu+9AcSfpnqF6FckfHpnWHINOtIt+hI9Xg9iiIslLx1nebMl?=
 =?us-ascii?Q?4KgN+1SXEKNyNmJYjzGcfGDTl6JRT8FmU5SzRjH8HTIb2JO1dS7KpoDxewoL?=
 =?us-ascii?Q?1JeEo4h9BpI3KToD6XegVH4WM/wQ5bwQa+npbwiwBd2nTTr9mWJyndIL+B33?=
 =?us-ascii?Q?57YNRebIJhW1p2vpRnl7inyRRXA2zpPuEreOfI/O?=
X-OriginatorOrg: vivo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d23e433a-47ae-481c-d092-08dab6363847
X-MS-Exchange-CrossTenant-AuthSource: SEZPR06MB5269.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Oct 2022 03:08:41.6004 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 923e42dc-48d5-4cbe-b582-1a797a6412ed
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: /yreVD9NzY+serQ0W3otW02xq+vwYzQuQXAcTciDxouV6Z+TZFTEGH1g9dFb0/vv7QRl7jISXpe0fJHfxzt/Fw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SEYPR06MB5063
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: commit 377224c47118("f2fs: don't split checkpoint in fstrim")
 obsolete batch mode and related sysfs entry. Since this testing sysfs node
 has been deprecated for a long time, let's remove it. Signed-off-by: Yangtao
 Li <frank.li@vivo.com> --- v2: - merge "f2fs: fix to correct invalid
 batched_trim_sections
 node" fs/f2fs/f2fs.h | 3 --- fs/f2fs/sysfs.c | 5 ----- 2 files changed, 8
 deletions(-) 
 Content analysis details:   (-0.2 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
 no trust [40.107.255.96 listed in list.dnswl.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.0 SPF_HELO_PASS          SPF: HELO matches SPF record
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [40.107.255.96 listed in wl.mailspike.net]
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
X-Headers-End: 1onAJC-00GK2V-4q
Subject: [f2fs-dev] [PATCH v2] f2fs: remove batched_trim_sections node
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

commit 377224c47118("f2fs: don't split checkpoint in fstrim") obsolete
batch mode and related sysfs entry.

Since this testing sysfs node has been deprecated for a long time, let's
remove it.

Signed-off-by: Yangtao Li <frank.li@vivo.com>
---
v2:
- merge "f2fs: fix to correct invalid batched_trim_sections node"
 fs/f2fs/f2fs.h  | 3 ---
 fs/f2fs/sysfs.c | 5 -----
 2 files changed, 8 deletions(-)

diff --git a/fs/f2fs/f2fs.h b/fs/f2fs/f2fs.h
index e6355a5683b7..9c480835adab 100644
--- a/fs/f2fs/f2fs.h
+++ b/fs/f2fs/f2fs.h
@@ -1062,9 +1062,6 @@ struct f2fs_sm_info {
 	/* a threshold to reclaim prefree segments */
 	unsigned int rec_prefree_segments;
 
-	/* for batched trimming */
-	unsigned int trim_sections;		/* # of sections to trim */
-
 	struct list_head sit_entry_set;	/* sit entry set list */
 
 	unsigned int ipu_policy;	/* in-place-update policy */
diff --git a/fs/f2fs/sysfs.c b/fs/f2fs/sysfs.c
index df27afd71ef4..926b7a844362 100644
--- a/fs/f2fs/sysfs.c
+++ b/fs/f2fs/sysfs.c
@@ -488,9 +488,6 @@ static ssize_t __sbi_store(struct f2fs_attr *a,
 			return -EINVAL;
 	}
 
-	if (!strcmp(a->attr.name, "trim_sections"))
-		return -EINVAL;
-
 	if (!strcmp(a->attr.name, "gc_urgent")) {
 		if (t == 0) {
 			sbi->gc_mode = GC_NORMAL;
@@ -790,7 +787,6 @@ F2FS_RW_ATTR(DCC_INFO, discard_cmd_control, mid_discard_issue_time, mid_discard_
 F2FS_RW_ATTR(DCC_INFO, discard_cmd_control, max_discard_issue_time, max_discard_issue_time);
 F2FS_RW_ATTR(DCC_INFO, discard_cmd_control, discard_granularity, discard_granularity);
 F2FS_RW_ATTR(RESERVED_BLOCKS, f2fs_sb_info, reserved_blocks, reserved_blocks);
-F2FS_RW_ATTR(SM_INFO, f2fs_sm_info, batched_trim_sections, trim_sections);
 F2FS_RW_ATTR(SM_INFO, f2fs_sm_info, ipu_policy, ipu_policy);
 F2FS_RW_ATTR(SM_INFO, f2fs_sm_info, min_ipu_util, min_ipu_util);
 F2FS_RW_ATTR(SM_INFO, f2fs_sm_info, min_fsync_blocks, min_fsync_blocks);
@@ -919,7 +915,6 @@ static struct attribute *f2fs_attrs[] = {
 	ATTR_LIST(max_discard_issue_time),
 	ATTR_LIST(discard_granularity),
 	ATTR_LIST(pending_discard),
-	ATTR_LIST(batched_trim_sections),
 	ATTR_LIST(ipu_policy),
 	ATTR_LIST(min_ipu_util),
 	ATTR_LIST(min_fsync_blocks),
-- 
2.25.1



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
