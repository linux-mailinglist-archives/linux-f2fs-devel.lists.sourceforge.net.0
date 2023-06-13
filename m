Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id B177D72DB8D
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 13 Jun 2023 09:52:28 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1q8yp9-00044v-IB;
	Tue, 13 Jun 2023 07:52:20 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <frank.li@vivo.com>) id 1q8yp8-00044n-HV
 for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 13 Jun 2023 07:52:19 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=MIME-Version:Content-Type:Content-Transfer-Encoding
 :Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=SW4DcOoc1clDIkyQR7TahMkLf+jWstpfGElZUpW8uD0=; b=XX1myBHity6HASDQtHV0RKcB5e
 eXcJLBMb2DOCwk2aFNygmMNTbPjYHyNIp1gNbyUPpHqJ5ONazuqrqjOYiDnuW5D/hXe5rQt0JRLuw
 0NEyU2jzqiVZJCKDN1/YkGtn8divW0c+YJHevQ3E825stmeLNL1r+05ev4TzGwXBbyDE=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:Date:
 Subject:Cc:To:From:Sender:Reply-To:Content-ID:Content-Description:Resent-Date
 :Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=SW4DcOoc1clDIkyQR7TahMkLf+jWstpfGElZUpW8uD0=; b=Y
 6VAMDvYMdf8eKwxnVJj0sZkb5nNrS/+YIFizlokepKN/9oAVokTaIVk4cSxUq7eeETnQEfkks/MDA
 iU7IMBh6s05qWHZ2YAPZgxpH7RClA2DcFQlgSGfMcYZvtlMgg304FxigMdKxUKb9t6FYPUNzumZZa
 LnMdASGw+0iwPrbQ=;
Received: from mail-tyzapc01on2133.outbound.protection.outlook.com
 ([40.107.117.133] helo=APC01-TYZ-obe.outbound.protection.outlook.com)
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1q8yp8-0006Uy-H5 for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 13 Jun 2023 07:52:19 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=COh3ZvLICTasRQyM86+0rnzPAPHIQPU9znWBJrSsZHkZQUirN0ituDNTp6OWgxU/pU3J1lD6EkG1a+ujvQq/oomwcKOvR95Z4YvigGofKU1xegc10SHaBhUu+n33g1XJCjXI+tx5dsC1LonyszB5DtMCEvgUaUdJHbDNrUCgmd/Gw0IPL0ISszGwpMy1aewOo7l3tdc/pEfvWo8chtLYQZCKrBdG2hVj0Xg/0wlXcZJnQuKbpVmNGKScqijqEOi8zpVO8NWljpYrlD4GoVeAJ/F8GeaLn3x/o2bK337q39DfaF/pOk9ofUe7UXMH9+FqDe41qbR6uUgm7R6JFIkDUQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=SW4DcOoc1clDIkyQR7TahMkLf+jWstpfGElZUpW8uD0=;
 b=lBsk46DgtykougCbdjC9rwLT+WsD5voZIi6e0pCYDol3DedRexpljevpTnBz855/PPrITmFIdKhiQS/d0CfeV9yJncH1Cp6pd7DhBYeuYHFyJPIvj4naihlIdPrfvr0rZyZxUAXLDRB7DUTmhynFwDhxHvse292g7M2rKvThHoU8wy8aLM3t6Elhws5eAGZWGjCPNexYywhlO3IUPLOKPaVzNJdBfq6KGRN3QtXlsZPIcrsfUdfiSLq5ZLA2tFWeigm6gbcnzJsFQnGBdP1jAFzrtqdEM77uJuHALZdJgE5IyofoMv1/tyWmeenRZ+UFOxHU5K7WgnriB/5pFu6+7Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vivo.com; dmarc=pass action=none header.from=vivo.com;
 dkim=pass header.d=vivo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vivo.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=SW4DcOoc1clDIkyQR7TahMkLf+jWstpfGElZUpW8uD0=;
 b=lUR+0CQ4YYXv110jqAGcEvlL+/R67dNJPfm2M7sfqKq0nudm3uUMxnBoEYVrwq7LfouOKk+RBcjjT/nO5rvVc/XnjaoyIpUAVQfp+QRy9z4sGckTKzov4iVEo5mRxAQkarBWMvtO3gDR8zYN20P1hTpdz8MJ6c2ZBFmsGARg3pjzIA5sVpOLonvXf6IS4IMCJMXeTNCAVFuTumGttmiq4yhOJSPNnp1FhwWcbVc2Vh9LE1GGbXKS4hHINIPCN7zYAJkEcqN+icJaeBe7eB6T6U7BqlALUJHCWpdo0jAfbLDiVpy4N8s/Z+vh4WANGWtE/IZ3MbWUU0v1BIhfuV5XuQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=vivo.com;
Received: from SEZPR06MB5269.apcprd06.prod.outlook.com (2603:1096:101:78::6)
 by SEZPR06MB6572.apcprd06.prod.outlook.com (2603:1096:101:184::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6455.31; Tue, 13 Jun
 2023 07:52:10 +0000
Received: from SEZPR06MB5269.apcprd06.prod.outlook.com
 ([fe80::76d6:4828:7e80:2965]) by SEZPR06MB5269.apcprd06.prod.outlook.com
 ([fe80::76d6:4828:7e80:2965%3]) with mapi id 15.20.6455.039; Tue, 13 Jun 2023
 07:52:10 +0000
To: Jaegeuk Kim <jaegeuk@kernel.org>,
	Chao Yu <chao@kernel.org>
Date: Tue, 13 Jun 2023 15:51:56 +0800
Message-Id: <20230613075157.41065-1-frank.li@vivo.com>
X-Mailer: git-send-email 2.39.0
X-ClientProxiedBy: SI1PR02CA0032.apcprd02.prod.outlook.com
 (2603:1096:4:1f6::12) To SEZPR06MB5269.apcprd06.prod.outlook.com
 (2603:1096:101:78::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SEZPR06MB5269:EE_|SEZPR06MB6572:EE_
X-MS-Office365-Filtering-Correlation-Id: 4c942304-0db3-435d-2561-08db6be31758
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 2vPI/VSErlUpMCN6mGFnpY+Q+jnUpTV0FpYgze7sOlHDCQyxyAII7m+kSh3Y4UKboxJFtMcmL9keG1NFfC1tnaZytrkSY4j4Y6s+sbiSQjRYk9DzVAPb5QdMUi3x93x2OoBxwXV8oU/N4242pCYJ0W3kh2WM3pSkEfwapi+mRIZdfUGsx9wlMRgHmlJRLFQ899FHsX47LFuslj2eWcbAmGnLhF1hP6rvf2hXKYqcTo69S3erJZUZpYF2A8IQaVHLbNkuWWXTXbIRbIhHfj1wksgVvJN2x6QIVpEcPclxkU98gK9G2HIOu7VTTe95CI+CkycicVD+KAM1le2dIk1EFbNBlsa6ZfnBYmmwKH+AXPhjIjwXdLxHxSPISfUiiMocwYDaeMOmoqvPU8pK+IxYEbdwIHHn7CZxWVn554CC2Qe3FclyRtHkg21P/AaXjBJ4TOW22yBN6eaPTfD2wM4toJUR04teIVY60/myRTE5jVyJ9W/DaVuCcKUXBJLb77JhjAAQNWfVVxfC/kr3w6UOY7NKC5otMKcP0htkzS6y/oIXKQIRdMk+fP3oo/Y4j+dJUE74+o2mVHukLrsUJTZY/NNmcCoGJZwggfC5Bkvhwx0gOa07tXdDAk/K14NpiFKx
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SEZPR06MB5269.apcprd06.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(4636009)(39860400002)(396003)(346002)(136003)(366004)(376002)(451199021)(186003)(52116002)(2906002)(6666004)(83380400001)(478600001)(1076003)(36756003)(6486002)(2616005)(38100700002)(86362001)(26005)(6506007)(38350700002)(6512007)(66476007)(66946007)(66556008)(5660300002)(110136005)(8936002)(4326008)(8676002)(41300700001)(316002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?46Zj3cMloDWuxwXHbCtVrhOOlOG2k8X4KiIq/D5kC6/Ematfh15jZ4DKuBHl?=
 =?us-ascii?Q?zpTvzqOlJKgPrfcxUrxdR43kc7ZW6ohoj39zNji/xE4Ig6Ypuijko222WsZa?=
 =?us-ascii?Q?jT5JY4cc1j/bx8rdvCjp2drrm/HMffpVBiacDnx5eB7/rYhLRz06Q7rfdTAZ?=
 =?us-ascii?Q?R4j/LSWxW1JS4JGKopcD7Omwb3dMA2dMjIfS12JGyRKFKAR6+tQiMVpOtSUN?=
 =?us-ascii?Q?bGL63sqbr1fAUAeWnRBdusBQDVWLYS2znhadJbvMpMt+nH37zPEPHTUEN3eC?=
 =?us-ascii?Q?3nT0SXyp0HwuzDkrZN+GjRTfRfPV58ZkRDmfRbtwPnUhjEFIkWuI417aKQQu?=
 =?us-ascii?Q?VYzUNeeJZcqRFJFY+6Ny4zMTqFroBK3eLZJQ4YoTDJ19l/NL8YdIE/AZFpCT?=
 =?us-ascii?Q?LHsmxWBRXqDDnJjmsMsDbCgAyetUvYN/WksoE7qNJLseZon1u9LeBKHItkFA?=
 =?us-ascii?Q?RoX1+wiy+SrQBJK+1lnrfV9JNZhDx0LOa+Yu1SD2y2EYPV6FlYWRvSZvP19Q?=
 =?us-ascii?Q?JoHuTt4HX6AbYoaLgGfgMVKq1kwp+gF8jHWR8ywY9o6TaA01fmbHtj25o6QM?=
 =?us-ascii?Q?gfoRp/8ldZGniWU4QQWn755IZBI5ddfEjQXf2yUlcMKFaYkOzm+o79LqR+F2?=
 =?us-ascii?Q?5Q7T8mbvGOtTEldwFXNAFwCbSiWrUgPpZcIwJnlEA7fl74WO+DXVj4C1kjuZ?=
 =?us-ascii?Q?+xEguUhikY+Nt6+BikOktla7GD5fCkbAI8x7bdI5d+Nmsp9UqU+OXLj5FX7a?=
 =?us-ascii?Q?d2OZcyjwb4rfuwS7ViWjRlYDq5v5B7sqi5ktjenJt4fGNgkzwjAoAHlkbmBM?=
 =?us-ascii?Q?MMDMCcSCQu8p78J2cjrUgrTgq0LGiImStDYR2NKm+oRN3xSlHWaZVDvPtc9v?=
 =?us-ascii?Q?SvCXQTIWvKJMjDt6MLt9A6F3AM0h555eIuObdrueSkrkl1jBlOcveEmEaV1N?=
 =?us-ascii?Q?R4PdDqfFq4NSy+dohzevPDQJT08l97VGWRWQDoshBsuWhTrlOFkhxvpQL98f?=
 =?us-ascii?Q?+uMUrL7oWnXdxcwMXiH4REJ321TZBxa164KQK2jxUDZMHVJZS1Xx0Jp2fwEE?=
 =?us-ascii?Q?ZvCdXNUXa6oNuQGmSqKvw75ZK1tbYUucvyGIPqjtwuzCou00wxVzLOM5cvP/?=
 =?us-ascii?Q?DMFop5FZmJmdcQBPk2naajOlPE2cN9VNk/Zqno1y9Msn5S6o70Up8YX6MHeN?=
 =?us-ascii?Q?CN3icH4Jj61o7wwcn3aXs+x5DG5YIolqX3WOhOODR8fNZS35X+dODVJv15X9?=
 =?us-ascii?Q?gYKkICMmUsct8HPbHm7O+FTko2Fslyj67Scz+cqQUtR63J75YWCBGiXRbnzp?=
 =?us-ascii?Q?cxV9gkbCeUbeYRegf0jQS9Ub1jL8F0VXP2Cl/4vOBczXgFmQv6DpKClcMqd3?=
 =?us-ascii?Q?zXZbjcF3dso2XknT6A6Z9FQActdoqGUAaq8nY/8n5xZOMkDryvsCYvqQ/LRq?=
 =?us-ascii?Q?QbgmRNS7eEpI1PUcLxDcy/NGlunRzhCj955gWXMVZBUudBYGZ2K5oxq39W5f?=
 =?us-ascii?Q?f1qZgQHfFeIIgT5b8kvk7zENQjQhP315hmUr/NttGmwTiFYn0w7OftkueVKA?=
 =?us-ascii?Q?bpGswcTdR6AnrbVlNxqWpkYZp1TnN2z/Djj/KmpY?=
X-OriginatorOrg: vivo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4c942304-0db3-435d-2561-08db6be31758
X-MS-Exchange-CrossTenant-AuthSource: SEZPR06MB5269.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Jun 2023 07:52:10.0159 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 923e42dc-48d5-4cbe-b582-1a797a6412ed
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: anRW8rs3XoDcVjg5pdFiylXah5dRujMsPqe/eBTpMjybpfPM93e02YJDXXCp0/PBjDdVUx0rqL0AY38c7Itsdw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SEZPR06MB6572
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: Just for cleanup. Signed-off-by: Yangtao Li
 <frank.li@vivo.com>
 --- fs/f2fs/segment.h | 2 ++ fs/f2fs/super.c | 3 +-- 2 files changed,
 3 insertions(+), 
 2 deletions(-) diff --git a/fs/f2fs/segment.h b/fs/f2fs/segment.h index
 2ca8fb5d0dc4..28ccbaffe546
 100644 --- a/fs/f2fs/segment.h +++ b/fs/f2fs/segment.h @@ -708,6 +708,8 @@
 enum { F2FS_IPU_MAX, }; 
 Content analysis details:   (-0.2 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
 no trust [40.107.117.133 listed in list.dnswl.org]
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [40.107.117.133 listed in wl.mailspike.net]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.0 SPF_HELO_PASS          SPF: HELO matches SPF record
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
X-Headers-End: 1q8yp8-0006Uy-H5
Subject: [f2fs-dev] [PATCH 1/2] f2fs: convert to use
 F2FS_SMALL_VOLUME_IPU_POLICY macro
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
 Yangtao Li <frank.li@vivo.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

Just for cleanup.

Signed-off-by: Yangtao Li <frank.li@vivo.com>
---
 fs/f2fs/segment.h | 2 ++
 fs/f2fs/super.c   | 3 +--
 2 files changed, 3 insertions(+), 2 deletions(-)

diff --git a/fs/f2fs/segment.h b/fs/f2fs/segment.h
index 2ca8fb5d0dc4..28ccbaffe546 100644
--- a/fs/f2fs/segment.h
+++ b/fs/f2fs/segment.h
@@ -708,6 +708,8 @@ enum {
 	F2FS_IPU_MAX,
 };
 
+#define F2FS_SMALL_VOLUME_IPU_POLICY (BIT(F2FS_IPU_FORCE) | BIT(F2FS_IPU_HONOR_OPU_WRITE))
+
 static inline bool IS_F2FS_IPU_DISABLE(struct f2fs_sb_info *sbi)
 {
 	return SM_I(sbi)->ipu_policy == F2FS_IPU_DISABLE;
diff --git a/fs/f2fs/super.c b/fs/f2fs/super.c
index 1b2c788ed80d..375a178540d6 100644
--- a/fs/f2fs/super.c
+++ b/fs/f2fs/super.c
@@ -4314,8 +4314,7 @@ static void f2fs_tuning_parameters(struct f2fs_sb_info *sbi)
 			SM_I(sbi)->dcc_info->discard_granularity =
 						MIN_DISCARD_GRANULARITY;
 		if (!f2fs_lfs_mode(sbi))
-			SM_I(sbi)->ipu_policy = BIT(F2FS_IPU_FORCE) |
-						BIT(F2FS_IPU_HONOR_OPU_WRITE);
+			SM_I(sbi)->ipu_policy = F2FS_SMALL_VOLUME_IPU_POLICY;
 	}
 
 	sbi->readdir_ra = true;
-- 
2.39.0



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
