Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id D434163B907
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 29 Nov 2022 05:15:59 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1ozs2E-0004Cw-Pm;
	Tue, 29 Nov 2022 04:15:54 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <frank.li@vivo.com>) id 1ozs2C-0004Co-7G
 for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 29 Nov 2022 04:15:52 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=MIME-Version:Content-Type:Content-Transfer-Encoding
 :Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=VkjS6ES/OUvm2rR7karX8J46E8nxqSPRoAmfZ0+wbAw=; b=Z3YRpUK8yDpMrNFfn9fBvVjAIQ
 97hKdnI088VZ/JvPCU1bxAye58tFZRq3XKrmWwjcCMNNcD+Gkmb8n4SPtdsN3/wd7+oSgd5f6CgS9
 eCmCMpvBbjT172GJu7KqyT7DJchJyhxYsUSqhCaxCIrBw/8O+sfkYCL9lKZsq0uPUT/Y=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:Date:
 Subject:Cc:To:From:Sender:Reply-To:Content-ID:Content-Description:Resent-Date
 :Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=VkjS6ES/OUvm2rR7karX8J46E8nxqSPRoAmfZ0+wbAw=; b=F
 66pFO1adMLWrwaQGoPSONgSw2MpKepqlY9Z/maOEG8KIlWvoQq3W+ywAx0BGcYrs4U4pOylR2vrMM
 VWnJg2VRk6cGXlcapG0IKrphem/JO3jBJNHe/Da94oV388umbtRZWDW9adDvwpO4jFbOtVICT00uQ
 OLsEVoKKhizQwerk=;
Received: from mail-tyzapc01on2102.outbound.protection.outlook.com
 ([40.107.117.102] helo=APC01-TYZ-obe.outbound.protection.outlook.com)
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1ozs25-0006ge-3E for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 29 Nov 2022 04:15:52 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=SYVjGj0A+zP9Hpr0IHtX4Yj8J4FZ1t1XS+F1Y5ogPdspUJTGQPuixl3gLA+vtG/O4HpwBCF2uXKMj3TciV4ZSsLPIFXByfmg1tAFBFeFjLFYhn0NkklLeHANmY+rvkKoD3Z0ma/Mh0KUHhIj5VSn9oqe5p6Z4JJ1zHtmIjH/nyrW1aweWK8HYFDrG7FNTQleuMXMsZBDXev2J6SbQw4vZoWagHmvfpaaROASWcG8/9H/6xWjNbZnbB3sBQW+gTD0wBj0Md/yDzEA5JjiswoetdnHSXgCqb6Z9ltsTiqJQj5JoEcBh/nTSXeGs6sIea5s1kHKpuZijUngDTmyZJHbaA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=VkjS6ES/OUvm2rR7karX8J46E8nxqSPRoAmfZ0+wbAw=;
 b=i6iFGLHkTrZf8t2WTAsnBsiTh0lk76wqyGhu+FuuiCNyGjH/e+bhY+vGF3yrh2hJyK3KhL89Rv5YZH/ABtoyo8jyeVlLx8U1YM8QYrBynDqkJ92pYEY7ax9hWBstp2+f7mi2pyqEDEk79m8fJgk0wFaP6vVGAc+15tl8GOUXM55+6IqCLUm74+REefrPDTISnIDjhA/53NfxK5GbVfGPZ2rgYNpd5FdgJ3PyHbavfHmqW8WboVK2An3L8KBx+ASN4L8gxM3GIbJZ4EuubhC+d9ZITSrjRvRKGiU2DzEelZMO9fnzaBjakwW2HFAG5ggGkrMGiGAFPZRtcjn168CMDg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vivo.com; dmarc=pass action=none header.from=vivo.com;
 dkim=pass header.d=vivo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vivo.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VkjS6ES/OUvm2rR7karX8J46E8nxqSPRoAmfZ0+wbAw=;
 b=MkQVjHmwaxcpw+k+ftL4Q1JjlWkcXDyMR48Xi72427PBVICp3yYg1xzERUvROZSBzMSYxUTFANj6FYsiAo4/mptrWtKwcoULpBJ0CpZA/iFqbjHmG8a2B2nTtexULRgfFMd6NB7yNHLQfEtNWBZEWFv1RSMffML6z/+Z4KJoJi8rO7fNvqcU+Uca0U2x9sPWTn9SSKILMpqDzTwgC6w4dMKPiSZdMnUGZvYf5pf68GYjjhhhO79wZPZSb3Y0o8nirIm8o5dCyHuzslJtRFgSYF/sEXhMJQFpNeIwv15S6TCMvurWXKd6V2wq2uWrcyxMbrWpuVba35Pt9W4FdTwa9w==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=vivo.com;
Received: from SEZPR06MB5269.apcprd06.prod.outlook.com (2603:1096:101:78::6)
 by TY0PR06MB5657.apcprd06.prod.outlook.com (2603:1096:400:277::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5857.23; Tue, 29 Nov
 2022 04:15:37 +0000
Received: from SEZPR06MB5269.apcprd06.prod.outlook.com
 ([fe80::ef03:cbfb:f8ef:d88b]) by SEZPR06MB5269.apcprd06.prod.outlook.com
 ([fe80::ef03:cbfb:f8ef:d88b%9]) with mapi id 15.20.5857.023; Tue, 29 Nov 2022
 04:15:37 +0000
To: jaegeuk@kernel.org,
	chao@kernel.org
Date: Tue, 29 Nov 2022 12:15:23 +0800
Message-Id: <20221129041524.81235-1-frank.li@vivo.com>
X-Mailer: git-send-email 2.35.1
X-ClientProxiedBy: SI2PR01CA0045.apcprd01.prod.exchangelabs.com
 (2603:1096:4:193::19) To SEZPR06MB5269.apcprd06.prod.outlook.com
 (2603:1096:101:78::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SEZPR06MB5269:EE_|TY0PR06MB5657:EE_
X-MS-Office365-Filtering-Correlation-Id: ee1abe3a-a49b-403d-5335-08dad1c05dfc
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: ERtfGVaSvXC4c+/7D7iyMLsgJ8GoIcEnhGFdg1cw5jkdf67FGZt4doBQh6hULzrqIk2UVYHU4BuXJNmb1e1i7/Oo8IC//gft3+h7kpzSj2KuepL783MDZFLn8mG1o2BYnAJdgK2Zlz83bbr/Y0Wxp+QqD/At7MLXUvVOU2CYQVGbllizLyh4MHiBsFbcnYf2A77ZvkYF5fewXlf2UB0iGpAp9S815blfYxpGv7jjiWrnR9rixHiSDwUoOG/OJDzj6sYtqe8noX5yuM9B5DEp7shmTcYfGpSIDAxL4hQJ0mJOQedqE36X2PEVfFhk42XRr6f+BPf2PaQQppTsV4zAocw+BgSZoth+CGGgVZUczK3eIu6PYEXA7Ib55WmEzQCh0MVeE4I2yWKzULXeRoRvgCZkg9I2FUWxBQkQY2ekGKogZ++pUUrHkJ5K2OjkFDmVd0B532FpMY+o4YPmxFsnxsTCKZFS46ViQCNX57702kuiI6QRLYe5iKNaGkf7RYq+eHmfHXhUukTp+YoYbA3+nkWV5kCR52m05LeV/JK3NwO/QqvWsgUXQA8efZNjNF/bsHAv39sstkq5ccxrtKnua14ykGtncKQM4a13MSLW+qMdlN6DtP5DhEpNKYvHPcUpvUfM06xfPvf2q7za+Rf7eAwrhyF9jJT2Lp3lLhQOLASnTKtHhxXj25aLoCfKoTpt
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SEZPR06MB5269.apcprd06.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(4636009)(376002)(136003)(39860400002)(366004)(346002)(396003)(451199015)(2906002)(41300700001)(66556008)(66946007)(66476007)(8676002)(36756003)(4326008)(316002)(186003)(8936002)(45080400002)(5660300002)(6512007)(26005)(86362001)(478600001)(107886003)(6666004)(6486002)(6506007)(52116002)(2616005)(1076003)(38350700002)(83380400001)(38100700002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?urowANbL9KSd1Dhbe2niM/wMeeCF0wWktToqKV7+bYY0V10HRm+qWxF3YBnr?=
 =?us-ascii?Q?frX1RKBibthpT9iKVeg0Afh8Oux3tCSLtVrvjAqyd4I37khdYN8Sm9aqvvBH?=
 =?us-ascii?Q?C2nvQG1iM1O4d/eid5/pS968VYanvqHZY8QB5cDgL3PVyQQ+FPYyND+JJgMA?=
 =?us-ascii?Q?aPtXrj7GpVtky4oWOobPMIhpysYzk4EpyTitbWht0/QYVcILXiVaciITvQBT?=
 =?us-ascii?Q?8mjtDZ+/pA3tAMch+ZZaGn2fLIH3yS81cCyEBFruUQ6hdSJUr5Mb325zVj/B?=
 =?us-ascii?Q?1A9F6ZE/XxMmdeGhFlq+oFB6yAqkXR9bwuBabgTkgrwwG7RLPDa3yj76bnX0?=
 =?us-ascii?Q?Vymrb/AINRWS0aJ4Yzy/zwHdyjkF6IdI1B/5FEFjvrCgZKQrvFJ6X40COLbs?=
 =?us-ascii?Q?/jSltm62rLrBAl6mrZ/c+GZKWpeWEBYZqdE+56xlSzO20p6//RyCatqJJupo?=
 =?us-ascii?Q?DtRnxrLzwa9p12KW5Mn94A5scc/ACGD+aGwbNv3TQlvrapLviz4zaGpN+V+7?=
 =?us-ascii?Q?n+pNX1ETRi3f3bwxsyTZpOopc0CyLkSBVqKQQelY3QwbaMukQ4sFOZioj1pX?=
 =?us-ascii?Q?D5krLXpVX0xudXvwKHsf5BP3pRfjAOmPt9RiOKeUerTE5HnGdtVtZ+tGZDB4?=
 =?us-ascii?Q?R/pX0gMRv2oMyaE6KyGYPF9VWv3CM4kyi7gsAiYDkCahouUG7eOR+iQVlaJb?=
 =?us-ascii?Q?+ThUD7oV2GvMbDNB91Q84WXq6wX2qrL/FQUVx9vfZFNu9+wuCQ+K5G0tUOL0?=
 =?us-ascii?Q?uZ+Wj65Je9Gjv2sqnW0+vYKp/BS9iGIlx6qL5lNI++lnixItFEC3XfXoK5h/?=
 =?us-ascii?Q?tSlwKUZxjhDTiRv8qmwG/l/xoy2W7gWFGqLuPfILhWohyn9MU/dYxWQBMfV1?=
 =?us-ascii?Q?Qiw92zclPujaGQzIXajZEj97VUGc+UTAHEfymVoSpEhLBKm1S9BXTzGZ1CpX?=
 =?us-ascii?Q?l5GDiIl49LyqEAyX42YthO5Xp55KP3qHRtK8NukzBbu/W/fhdgleUe1M5v4d?=
 =?us-ascii?Q?Udz4muiZv9GhzMSYHAWXe0/fQiHqJckiSNMXTiXS1SGddztVGKHK5tmOcA8Q?=
 =?us-ascii?Q?Kjz1e3YARY+OOGHquoUJa0OHkrWIEjXMBPMnm5Xy5FRb3Zg8kdEN96hUGFv8?=
 =?us-ascii?Q?hhohOzuGQjbSt6sZ4xUSr4Zk46w9AtOxjClwNI4cu+Zn33bxej+O3siGb2XL?=
 =?us-ascii?Q?aFKG0HSgnvlX3W7mgE41wncDU2DT7+ImPmA8noPFSb2Ia9X1hHMNT7ukRbpF?=
 =?us-ascii?Q?EsEboBbtc9n/0LR9FY37PU77hqJdQeRG5NZaGicUwtd0cQPOSSKBnlycc3gn?=
 =?us-ascii?Q?BDd7a+E12CDLUfnKvql2OxFblSxbgOaqzpKTiAvMO+A/EdfH3FL3AVecg+Ne?=
 =?us-ascii?Q?e0EwJf7kQfAY6ehq5mfYDZdZsAI2DjZZvvRsEg49fYXNxcy4rQOiBdEor/SH?=
 =?us-ascii?Q?DyNkiW74Ne+Bmpdvwxpjgql/xCZgj44pLvrnwwDuzKkx4J9OPtX6UIt3Qi1F?=
 =?us-ascii?Q?PD/0sePRLfO1EhbAzHruAu3BFnzketFpBWn2B/NHkPYjRV28a3a5c1vFfw8D?=
 =?us-ascii?Q?fQigDOLgAcQwtSdV0sjKfH3mrL+qheU0+ZTpoqcS?=
X-OriginatorOrg: vivo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ee1abe3a-a49b-403d-5335-08dad1c05dfc
X-MS-Exchange-CrossTenant-AuthSource: SEZPR06MB5269.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Nov 2022 04:15:36.8183 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 923e42dc-48d5-4cbe-b582-1a797a6412ed
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: EMgb40yo2mBWq+XFie5PAM0foDTfrzyOWIdY4M1bevTNH/Ez0xEH5+Psfruku+u88KQ5Zod5hH5tOwPckONaOQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY0PR06MB5657
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: To fix: WARNING: function definition argument 'struct
 f2fs_attr
 *' should also have an identifier name + ssize_t (*show)(struct f2fs_attr
 *, struct f2fs_sb_info *, char *); WARNING: return sysfs_emit(...) formats
 should include a terminating newline + return sysfs_emit(buf, "(none)"); 
 Content analysis details:   (-0.2 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
 no trust [40.107.117.102 listed in list.dnswl.org]
 0.0 URIBL_BLOCKED          ADMINISTRATOR NOTICE: The query to URIBL was
 blocked.  See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URIs: vivo.com]
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [40.107.117.102 listed in wl.mailspike.net]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.0 SPF_HELO_PASS          SPF: HELO matches SPF record
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
X-Headers-End: 1ozs25-0006ge-3E
Subject: [f2fs-dev] [PATCH 1/2] f2fs: fix some format WARNING in debug.c and
 sysfs.c
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

To fix:

WARNING: function definition argument 'struct f2fs_attr *' should also have an identifier name
+       ssize_t (*show)(struct f2fs_attr *, struct f2fs_sb_info *, char *);

WARNING: return sysfs_emit(...) formats should include a terminating newline
+       return sysfs_emit(buf, "(none)");

WARNING: Prefer 'unsigned int' to bare use of 'unsigned'
+               unsigned npages = NODE_MAPPING(sbi)->nrpages;

WARNING: Missing a blank line after declarations
+               unsigned npages = COMPRESS_MAPPING(sbi)->nrpages;
+               si->page_mem += (unsigned long long)npages << PAGE_SHIFT;

WARNING: quoted string split across lines
+               seq_printf(s, "CP merge (Queued: %4d, Issued: %4d, Total: %4d, "
+                               "Cur time: %4d(ms), Peak time: %4d(ms))\n",

Signed-off-by: Yangtao Li <frank.li@vivo.com>
---
 fs/f2fs/debug.c | 45 +++++++++++++++++++++++----------------------
 fs/f2fs/sysfs.c | 10 +++++-----
 2 files changed, 28 insertions(+), 27 deletions(-)

diff --git a/fs/f2fs/debug.c b/fs/f2fs/debug.c
index a216dcdf6941..733b1bd37404 100644
--- a/fs/f2fs/debug.c
+++ b/fs/f2fs/debug.c
@@ -301,18 +301,19 @@ static void update_mem_info(struct f2fs_sb_info *sbi)
 
 	si->page_mem = 0;
 	if (sbi->node_inode) {
-		unsigned npages = NODE_MAPPING(sbi)->nrpages;
+		unsigned long npages = NODE_MAPPING(sbi)->nrpages;
 
 		si->page_mem += (unsigned long long)npages << PAGE_SHIFT;
 	}
 	if (sbi->meta_inode) {
-		unsigned npages = META_MAPPING(sbi)->nrpages;
+		unsigned long npages = META_MAPPING(sbi)->nrpages;
 
 		si->page_mem += (unsigned long long)npages << PAGE_SHIFT;
 	}
 #ifdef CONFIG_F2FS_FS_COMPRESSION
 	if (sbi->compress_inode) {
-		unsigned npages = COMPRESS_MAPPING(sbi)->nrpages;
+		unsigned long npages = COMPRESS_MAPPING(sbi)->nrpages;
+
 		si->page_mem += (unsigned long long)npages << PAGE_SHIFT;
 	}
 #endif
@@ -460,28 +461,28 @@ static int stat_show(struct seq_file *s, void *v)
 				si->meta_count[META_NAT]);
 		seq_printf(s, "  - ssa blocks : %u\n",
 				si->meta_count[META_SSA]);
-		seq_printf(s, "CP merge (Queued: %4d, Issued: %4d, Total: %4d, "
-				"Cur time: %4d(ms), Peak time: %4d(ms))\n",
-				si->nr_queued_ckpt, si->nr_issued_ckpt,
-				si->nr_total_ckpt, si->cur_ckpt_time,
-				si->peak_ckpt_time);
+		seq_puts(s, "CP merge:\n");
+		seq_printf(s, "  - Queued : %4d\n", si->nr_queued_ckpt);
+		seq_printf(s, "  - Issued : %4d\n", si->nr_issued_ckpt);
+		seq_printf(s, "  - Total : %4d\n", si->nr_total_ckpt);
+		seq_printf(s, "  - Cur time : %4d(ms)\n", si->cur_ckpt_time);
+		seq_printf(s, "  - Peak time : %4d(ms)\n", si->peak_ckpt_time);
 		seq_printf(s, "GC calls: %d (BG: %d)\n",
 			   si->call_count, si->bg_gc);
 		seq_printf(s, "  - data segments : %d (%d)\n",
 				si->data_segs, si->bg_data_segs);
 		seq_printf(s, "  - node segments : %d (%d)\n",
 				si->node_segs, si->bg_node_segs);
-		seq_printf(s, "  - Reclaimed segs : Normal (%d), Idle CB (%d), "
-				"Idle Greedy (%d), Idle AT (%d), "
-				"Urgent High (%d), Urgent Mid (%d), "
-				"Urgent Low (%d)\n",
-				si->sbi->gc_reclaimed_segs[GC_NORMAL],
-				si->sbi->gc_reclaimed_segs[GC_IDLE_CB],
-				si->sbi->gc_reclaimed_segs[GC_IDLE_GREEDY],
-				si->sbi->gc_reclaimed_segs[GC_IDLE_AT],
-				si->sbi->gc_reclaimed_segs[GC_URGENT_HIGH],
-				si->sbi->gc_reclaimed_segs[GC_URGENT_MID],
-				si->sbi->gc_reclaimed_segs[GC_URGENT_LOW]);
+		seq_puts(s, "  - Reclaimed segs :\n");
+		seq_printf(s, "    - Normal : %d\n", si->sbi->gc_reclaimed_segs[GC_NORMAL]);
+		seq_printf(s, "    - Idle CB : %d\n", si->sbi->gc_reclaimed_segs[GC_IDLE_CB]);
+		seq_printf(s, "    - Idle Greedy : %d\n",
+				si->sbi->gc_reclaimed_segs[GC_IDLE_GREEDY]);
+		seq_printf(s, "    - Idle AT : %d\n", si->sbi->gc_reclaimed_segs[GC_IDLE_AT]);
+		seq_printf(s, "    - Urgent High : %d\n",
+				si->sbi->gc_reclaimed_segs[GC_URGENT_HIGH]);
+		seq_printf(s, "    - Urgent Mid : %d\n", si->sbi->gc_reclaimed_segs[GC_URGENT_MID]);
+		seq_printf(s, "    - Urgent Low : %d\n", si->sbi->gc_reclaimed_segs[GC_URGENT_LOW]);
 		seq_printf(s, "Try to move %d blocks (BG: %d)\n", si->tot_blks,
 				si->bg_data_blks + si->bg_node_blks);
 		seq_printf(s, "  - data blocks : %d (%d)\n", si->data_blks,
@@ -505,11 +506,11 @@ static int stat_show(struct seq_file *s, void *v)
 			   si->nr_dio_read, si->nr_dio_write);
 		seq_printf(s, "  - IO_R (Data: %4d, Node: %4d, Meta: %4d\n",
 			   si->nr_rd_data, si->nr_rd_node, si->nr_rd_meta);
-		seq_printf(s, "  - IO_W (CP: %4d, Data: %4d, Flush: (%4d %4d %4d), "
-			"Discard: (%4d %4d)) cmd: %4d undiscard:%4u\n",
+		seq_printf(s, "  - IO_W (CP: %4d, Data: %4d, Flush: (%4d %4d %4d), ",
 			   si->nr_wb_cp_data, si->nr_wb_data,
 			   si->nr_flushing, si->nr_flushed,
-			   si->flush_list_empty,
+			   si->flush_list_empty);
+		seq_printf(s, "Discard: (%4d %4d)) cmd: %4d undiscard:%4u\n",
 			   si->nr_discarding, si->nr_discarded,
 			   si->nr_discard_cmd, si->undiscard_blks);
 		seq_printf(s, "  - atomic IO: %4d (Max. %4d)\n",
diff --git a/fs/f2fs/sysfs.c b/fs/f2fs/sysfs.c
index a4745d596310..024346f0e9ce 100644
--- a/fs/f2fs/sysfs.c
+++ b/fs/f2fs/sysfs.c
@@ -53,9 +53,9 @@ static const char *gc_mode_names[MAX_GC_MODE] = {
 
 struct f2fs_attr {
 	struct attribute attr;
-	ssize_t (*show)(struct f2fs_attr *, struct f2fs_sb_info *, char *);
-	ssize_t (*store)(struct f2fs_attr *, struct f2fs_sb_info *,
-			 const char *, size_t);
+	ssize_t (*show)(struct f2fs_attr *a, struct f2fs_sb_info *sbi, char *buf);
+	ssize_t (*store)(struct f2fs_attr *a, struct f2fs_sb_info *sbi,
+			 const char *buf, size_t len);
 	int struct_type;
 	int offset;
 	int id;
@@ -232,13 +232,13 @@ static ssize_t encoding_show(struct f2fs_attr *a,
 			(sb->s_encoding->version >> 8) & 0xff,
 			sb->s_encoding->version & 0xff);
 #endif
-	return sysfs_emit(buf, "(none)");
+	return sysfs_emit(buf, "(none)\n");
 }
 
 static ssize_t mounted_time_sec_show(struct f2fs_attr *a,
 		struct f2fs_sb_info *sbi, char *buf)
 {
-	return sysfs_emit(buf, "%llu", SIT_I(sbi)->mounted_time);
+	return sysfs_emit(buf, "%llu\n", SIT_I(sbi)->mounted_time);
 }
 
 #ifdef CONFIG_F2FS_STAT_FS
-- 
2.25.1



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
