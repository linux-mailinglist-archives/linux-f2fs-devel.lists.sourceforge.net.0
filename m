Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 5645481C39A
	for <lists+linux-f2fs-devel@lfdr.de>; Fri, 22 Dec 2023 04:46:20 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1rGWUH-0005Js-5h;
	Fri, 22 Dec 2023 03:46:13 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <yangyongpeng1@oppo.com>) id 1rGWUF-0005Jl-OT
 for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 22 Dec 2023 03:46:12 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=MIME-Version:Content-Type:Content-Transfer-Encoding
 :References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=d0mVLmUNurb82uxuruWyA2X8QDMT6g/E0iyAKS82mp0=; b=dicldOpQSmaHxgZiW4TLrXTIz9
 JaVYPpDksZ7m08CZqlBx/DuwyLgLirylSma/+mYAT9dpowMsl4bI19ZKQSYhNDfjpEt01nGsX5Yf3
 VbIO7CpesdBr2DofNleAuiwJZCrl7n9eWrj5c17+HfWci6NNbbqq31b/sO90PY+um1r0=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=MIME-Version:Content-Type:Content-Transfer-Encoding:References:
 In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=d0mVLmUNurb82uxuruWyA2X8QDMT6g/E0iyAKS82mp0=; b=EN8CUrSbQHZUQro9ITFaHkTXXk
 5O34lJ5ek4122UOOQwpiEcxNMZXn2HhRbsRV8bNWxLnO+aDjXR6t1vBqlJDXuxldJ+YrwAwzKoyJo
 U1Spf5nkCxOedrok5qzAWevDdOQDI9cSOTjYbg9Onz/Ax1Y2srA8wb+RjFptaY/U6FIQ=;
Received: from mail-sgaapc01on2069.outbound.protection.outlook.com
 ([40.107.215.69] helo=APC01-SG2-obe.outbound.protection.outlook.com)
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1rGWUC-0002nz-Jc for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 22 Dec 2023 03:46:12 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=NUJRCcRe9PvvIBiCiivQCT2y1v+wqLdb4qQEJSIXrSt6ykbOdJv3R9FGEYP5zC0VaNW9YQSTubkJdzCCzUT5H7KKV6w89OLymEEFV1Mx9jMmGzEo1vCo9F6bjZJzKfb8W1SHPEXT1FWlPunIiR7c52wgqVFyVDJFZUu5xtcysiRob/yFnRjInsWJG9IjlLSB8+GEx390Y5dhpneOI7K6LvnKUqyK0W8bXltOqoXNdG10Rd/chSsP5+fvfNKtRlxb3lsK+e1rXY19Hp/l8GGTj5ycZb5dAAOfi5SRDS5LlYJDQzAfiY6SZ54SibGV4iu9P0FuSvYt8kemyiDBHOOpEQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=d0mVLmUNurb82uxuruWyA2X8QDMT6g/E0iyAKS82mp0=;
 b=IDt2P8PU9iAL2M7frqc/5q7jpNl8H3LCxldNcj3a38xvdrDl+gp83pxgyIQQAObweVX4FY0oySpuIW2WkxwoCpY8ROhmp/9MQfsetLAiTMYQJMd8i3AyVYQ5IQN/q/fv1kKb5W2dudjsekdKFvQ8tbwdgi3TjluZIHQ6SO7xM8B+oA7cGxB6bpBkV/GR5JrwUivGhZfx5sYWLADayh4f9iIenlb2lszPIRzkiJef52Najrfoz2oWOqRINoYoKoGeSg75mTIMSrMzj1vYLPw0/r6Xoud7H4ixK7bdXuMcBaoSXRYtWuTGzQYQ6or8uVTrR8rov0SyGimlsLzvBbsYyg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oppo.com; dmarc=pass action=none header.from=oppo.com;
 dkim=pass header.d=oppo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oppo.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=d0mVLmUNurb82uxuruWyA2X8QDMT6g/E0iyAKS82mp0=;
 b=XOMP6BurVU8V+mBYf/YwrAlMmKLbCvieid64BznYPw2TLvk2W1ctllsppEtbChSSgT18Sb3LfC9F+rh3c5Gipw1vi/avRqe/6Gda6HEcblgm5HkpTR5tejKwQ1+KsigMJh57+xKVu83+x8ae8DXZ7be86Bt0Vt7TfX/3m/1NSrQ=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oppo.com;
Received: from PSAPR02MB4727.apcprd02.prod.outlook.com (2603:1096:301:90::7)
 by PSAPR02MB4678.apcprd02.prod.outlook.com (2603:1096:301:41::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7113.21; Fri, 22 Dec
 2023 03:29:51 +0000
Received: from PSAPR02MB4727.apcprd02.prod.outlook.com
 ([fe80::f4:dbf7:9c0c:5388]) by PSAPR02MB4727.apcprd02.prod.outlook.com
 ([fe80::f4:dbf7:9c0c:5388%4]) with mapi id 15.20.7113.019; Fri, 22 Dec 2023
 03:29:51 +0000
To: Jaegeuk Kim <jaegeuk@kernel.org>,
	Chao Yu <chao@kernel.org>
Date: Fri, 22 Dec 2023 11:29:01 +0800
Message-Id: <20231222032901.3861649-2-yangyongpeng1@oppo.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20231222032901.3861649-1-yangyongpeng1@oppo.com>
References: <20231222032901.3861649-1-yangyongpeng1@oppo.com>
X-ClientProxiedBy: SG2P153CA0043.APCP153.PROD.OUTLOOK.COM (2603:1096:4:c6::12)
 To PSAPR02MB4727.apcprd02.prod.outlook.com
 (2603:1096:301:90::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PSAPR02MB4727:EE_|PSAPR02MB4678:EE_
X-MS-Office365-Filtering-Correlation-Id: d8a37732-b8c8-4bb5-d0cb-08dc029e41bd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: ASB0/cI0ecYNJfUT0p7eVmGJ0qDaUvXyrZMBybwYgEwRZMizpqNM4Ae3JTEvbJIYUnrEtwAS1xhSYSdm/eO5A8i6UzzhtG6Ew/OnZZ+i2tAUI1NaTtasfcF5YCV1fha/KhYlaYeJckTymKGB1dbVaFevUM0lKE+BEqDADAyloCt3IJ/Yp76+Cd8+0Zks03+mpcuogALdd/ic11FQRHPDGsZBULhZpA2LdezaDjelCEAnUWwt07k5tIcVFQmLbs2vIApLC05EOH5KBdOpYQY+BjqxkTA4F758UrKHBNSvoriFVMAUZVzC46a1H1VdehBwxkufyOAkiN/m2D0NcpzTucGRluIO835/vcj8T1P/apsOQgm3X/8JK7wnYAWOXiAbP0wSPmmW2/VJSzVNPou2VLPViaGAK9NALDBb0eYHEufQNJpT3yppWtvcxQVV1PElm8/4VbCyhuR24mhOJ9eUnBb2qUlXI9FckLaPjNfeFIRV5zBakkPiyWZww21OE7lv5XCXjjPvKdACcUoAdZ+1vbyigXz4pqDtPpdbXvxHQ2EFYv5cXb6Rdvz1L9bvQV9R7EbvnEIXHshHaD7mKSKNxiJDqzw4Vu4KXW2ZEHdCVfICqb5/dNr5Sy5ONRp6InqN
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PSAPR02MB4727.apcprd02.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(366004)(346002)(39860400002)(376002)(396003)(136003)(230922051799003)(64100799003)(186009)(451199024)(1800799012)(26005)(83380400001)(86362001)(41300700001)(38100700002)(6486002)(5660300002)(8936002)(4326008)(8676002)(110136005)(316002)(66476007)(66556008)(66946007)(6512007)(2616005)(107886003)(1076003)(478600001)(6506007)(52116002)(6666004)(2906002)(36756003)(38350700005);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?kFCdkY/A4epg/4YJytQRMpOlIUhhXiHzSSA04r4MOS7U128ZRwAJrbQPxelG?=
 =?us-ascii?Q?CeGCQ4jDdlpVYrek4t2E4t/bHv+ForaHN8pE1Zecc/+qj/hpQZTLuJ7RMPU6?=
 =?us-ascii?Q?58yhLoe9Bvdcqb/+0IhMepaZhPU/raZ4qAoSr1HPCkG9o18zXwRszXzhW8QW?=
 =?us-ascii?Q?Q6Fm1k0jCXgEv28r7dbhBu7lqrMQNKdEtyLBZRKK30QJYErUSQYwgzV+Unfx?=
 =?us-ascii?Q?7V98oXIb7WGqGoAz7h/BLn6aSYpJ6CujBap81JeT8+3GBwsM+raALFrDv+8i?=
 =?us-ascii?Q?IfWqP93VCJezZe4a8xCY5ZQWJYrcmJcUW7ulgJVKvs/Uq9I+zhq2hkxoRZdQ?=
 =?us-ascii?Q?aSt53gc5mJ7hDR+8Wp0WzcRjpxjhqLKlApM9eL18DkIPXaJ4DPnBSUmhrvmM?=
 =?us-ascii?Q?g7cas/zdVbvuX+OsTmt4KAxmF2clmTN7+iseYg0WGVoFLnpUd24ahoaUgdep?=
 =?us-ascii?Q?7nEXa76iUXXJI27zP0RrNkFcOVXzCrgC1mmDE1xQhzKcTt3qseJr64YHd4x1?=
 =?us-ascii?Q?gZn/t9F5DscA3k3OZHSwLl8KnD4ZlJhKF+cRlkANHlqtQz6tRrOBkCAYqJf2?=
 =?us-ascii?Q?LX5rn4sqDMW68faYmlLzTicYTDdRMg3yI16KkbSj9J86n8vg5Vlep6vnEAVV?=
 =?us-ascii?Q?5EZXTWzK90wFTrxeKxC6clmm4t135CTSIW9K+5sJ46dnKR3bokNonDYx+AUQ?=
 =?us-ascii?Q?NwQ+lAHiQsuxR+E47f2rnTPQ+hD2IBcn95cxkT3aIaSnevgB6Fm7QkyUQoVI?=
 =?us-ascii?Q?BzUzYncRvUm+tbJpyVRcNVyDjduPDhwmTnJ5KPEzmkCb4AK3zPYWFBZ/q9iE?=
 =?us-ascii?Q?gUpgUhFPkDNFYrp+sC62uNvraBZ4lV5yFnUyY+FHyhveg12juj9G+zNxnYGI?=
 =?us-ascii?Q?anwQDN7Eh7PZW6YaNnzwZ6X7k6nexp9Ocae9tUXktPpOU44JNCgc9aQf08oj?=
 =?us-ascii?Q?yP3iXsn7i1BnQmtx18/yMk+hXke6Y4qwRV59wvoUvVCAAMcUyZRJx8XQVSrC?=
 =?us-ascii?Q?SQAkHvt+7JAubnIUit+0HKAUaqe4yqh6RBqqSpo9Nytf6KlJJ/pNiIWjIvI1?=
 =?us-ascii?Q?M8PaCZ+Otofq3wKuYyHSszx9MqlyceuFHcLYTKOc0dGrBFEkJmsNJBb1XYVU?=
 =?us-ascii?Q?WDlwbnZCh7HMm77ZSGh1GellMfnx99bIWUIiWmc9Xh+kEShuRqaV2xcrs++d?=
 =?us-ascii?Q?lLI7YCssuJ1VLx6z5DsEnwEMPyGBHELlJTfnhEvN8mzQ6XeSD45n7Zc/SY2x?=
 =?us-ascii?Q?iK271R0fL+tpPqXo8Z/5U5uuaTJsCDy4H/tjo6UjVgPVzZ4IZaMnYjwuoy52?=
 =?us-ascii?Q?/er3zrXT504wxqzjjIJGbAHg7I8+Epig99nuwOMz6ienU03xc+QQZ5A1oqCg?=
 =?us-ascii?Q?Rz5gPBsqXMTTyC4cpDb1b/wr6HksEAaU/jy3fN9WTXhYY1h4pOzYwOrpi9If?=
 =?us-ascii?Q?dgKjBbRFw+uDXQU8M7mZGYkjYHWs3ccaP60i51Nv8HaDVOKzdRivvGHLSo53?=
 =?us-ascii?Q?THxJ5PMLE7rF/cPe/pXq1LUji4RxjkDXelihbZuvqZwcdDx5CwyOzkGJxrma?=
 =?us-ascii?Q?jzAP1dsNevY6PrBrfQlLTc+kdOWokqADQP1X/Ch9IxyKemZkmT0zskSwT4ER?=
 =?us-ascii?Q?tA=3D=3D?=
X-OriginatorOrg: oppo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d8a37732-b8c8-4bb5-d0cb-08dc029e41bd
X-MS-Exchange-CrossTenant-AuthSource: PSAPR02MB4727.apcprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Dec 2023 03:29:51.3076 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f1905eb1-c353-41c5-9516-62b4a54b5ee6
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: gfo3BqM2WEp5v20SjRMDvZ07EJT4zh5BNK/HO+ZrNQWGX7NftWUi8jxOTEKu++drMYuEi5txaDAzsszI4fbeqA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PSAPR02MB4678
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: The function do_garbage_collect can return a value less than
 0 due to f2fs_cp_error being true or page allocation failure, as a result
 of calling f2fs_get_sum_page. However, f2fs_gc does not account f [...] 
 Content analysis details:   (-0.2 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
 no trust [40.107.215.69 listed in list.dnswl.org]
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [40.107.215.69 listed in wl.mailspike.net]
 -0.0 SPF_HELO_PASS          SPF: HELO matches SPF record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid -0.0 T_SCC_BODY_TEXT_LINE   No description available.
X-Headers-End: 1rGWUC-0002nz-Jc
Subject: [f2fs-dev] [PATCH 2/2] f2fs: Add error handling for negative
 returns from do_garbage_collect
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
From: Yongpeng Yang via Linux-f2fs-devel
 <linux-f2fs-devel@lists.sourceforge.net>
Reply-To: Yongpeng Yang <yangyongpeng1@oppo.com>
Cc: linux-kernel@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

The function do_garbage_collect can return a value less than 0 due
to f2fs_cp_error being true or page allocation failure, as a result
of calling f2fs_get_sum_page. However, f2fs_gc does not account for
such cases, which could potentially lead to an abnormal total_freed
and thus cause subsequent code to behave unexpectedly. Given that
an f2fs_cp_error is irrecoverable, and considering that
do_garbage_collect already retries page allocation errors through
its call to f2fs_get_sum_page->f2fs_get_meta_page_retry, any error
reported by do_garbage_collect should immediately terminate the
current GC.

Signed-off-by: Yongpeng Yang <yangyongpeng1@oppo.com>
---
 fs/f2fs/gc.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/fs/f2fs/gc.c b/fs/f2fs/gc.c
index 405a6077bd83..771d56b0bfb8 100644
--- a/fs/f2fs/gc.c
+++ b/fs/f2fs/gc.c
@@ -1865,6 +1865,9 @@ int f2fs_gc(struct f2fs_sb_info *sbi, struct f2fs_gc_control *gc_control)
 
 	seg_freed = do_garbage_collect(sbi, segno, &gc_list, gc_type,
 				gc_control->should_migrate_blocks);
+	if (seg_freed < 0)
+		goto stop;
+
 	total_freed += seg_freed;
 
 	if (seg_freed == f2fs_usable_segs_in_sec(sbi, segno)) {
-- 
2.40.1



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
