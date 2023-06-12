Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id AA18C72B599
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 12 Jun 2023 05:02:25 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1q8Xoz-0002TW-MY;
	Mon, 12 Jun 2023 03:02:21 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <shengyong@oppo.com>) id 1q8Xos-0002T4-F3
 for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 12 Jun 2023 03:02:15 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=MIME-Version:Content-Type:Content-Transfer-Encoding
 :References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=K1K6vKgsEBr9XA5kkiRlKqIymaZ3HjuFwbvqRqXXQqE=; b=l+sDImieMcVP2PufKBr9nKroKl
 RIahQ6pXUaVqFZXmXuYeMJzkTtPmHbWoJ8gaXg09P32GIY8UTtuslc04ncG1g8GL9YEjm+MwyUvOz
 Vbnh1EpcpEhR+oVdmME9mORe5+xPlcqVQutNmhFDw94ugqyODRonwlX9+UZOu4Djvy5A=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=MIME-Version:Content-Type:Content-Transfer-Encoding:References:
 In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=K1K6vKgsEBr9XA5kkiRlKqIymaZ3HjuFwbvqRqXXQqE=; b=eei0Xz8Wk3hlaZLWZ6Pte4LWB1
 M2aaxcyzeGpXj+8uKAh5gE0u1FYOBE92kP4og+IREw46qhhKuUbh9pz7NgF1BaMqnzvta5+x1fxpf
 WOyWA3+ZoOVuo41zqAKBdZwX04S/nMoEgsLdE8B34YrPtYe8DcUOAtOvCeG/24KLEfvs=;
Received: from mail-tyzapc01on2054.outbound.protection.outlook.com
 ([40.107.117.54] helo=APC01-TYZ-obe.outbound.protection.outlook.com)
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1q8Xoo-000MRd-S0 for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 12 Jun 2023 03:02:14 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=gefyTtI6qnFg4mkf8Cn5DbsVqG5gtPdulGlp02XsqhYcswjCBZRs89t/YPauvre5PEt9QW4a9c+FzlBMSooPhRpnKqDqcabw7eGNMsuY7EJjIb4Y/ziF6sCC5uVnMVEjVEi0x7Ux+8ZN+c1uDVnmQaNiAPMtmBFRw9EnVPG6a/hMfpbTku/FcM1bVoPxHjkXc4u+biKLzvMFevFZ8znzUPZ0VjYuKqk6CVM4h3aiJDfAWTrZ0Qhc8X0NLCBSq/9wIB8wz3ulRchfvPKJ7HY8ThOKr61N+9V5TZ7Xq+CjSd3e+NVeqe43v8g0YQF9MBQPpgE9R1wWlxqG+OjFluQcjw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=K1K6vKgsEBr9XA5kkiRlKqIymaZ3HjuFwbvqRqXXQqE=;
 b=f55LxVh15ouqzAbHz1IOQVvf7mnTS6J3tpTuaMwVCp7HGmJgCxQXmlJ7Bw2xm/rrkgMs6gINrWqLNpg9l3L1G94rhRt4uiESbQ9snbCHa3UEW4m+JeQ35DEi5gVa645QoYwch7laUEYjwzXS94+c1TzWOjt5EST02bYJ95/pt0wuFeFgxUaUrWrBhjgIFfiXm6PkCXhxepl6wiRGeBJIjGQcHT7PXN4RSjvQ6vCrC8Lx9ZgJ/nP6TwWLMeoYWPoUApo/PjpJPsQ1BhNwROXif7lCQgQpdTDuqEEsFhYb0nHNk+KaqEcXn0/o43JDAuRVzhYl4F+Gmg6Ta0hPOHKjxQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oppo.com; dmarc=pass action=none header.from=oppo.com;
 dkim=pass header.d=oppo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oppo.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=K1K6vKgsEBr9XA5kkiRlKqIymaZ3HjuFwbvqRqXXQqE=;
 b=u9BdKaewtxNIrKB9JOt2ftXsBKq5qTztTk6EdohVMn9ztNYZix00psdCpf5xQRUqM6syFigK4dWltIYG1eOBhAoD1A3omoKZGFuD+xJFqflAHBxaaqZ1VQCCc3eLDTvzZ6Gq7U9Rs+DHfVEzMMsWDSD3ktIBn1ITT3rcUtOSQcg=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oppo.com;
Received: from SI2PR02MB5148.apcprd02.prod.outlook.com (2603:1096:4:153::6) by
 KL1PR02MB6259.apcprd02.prod.outlook.com (2603:1096:820:dc::9) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6500.21; Mon, 12 Jun 2023 03:01:47 +0000
Received: from SI2PR02MB5148.apcprd02.prod.outlook.com
 ([fe80::6297:13a6:41f1:e471]) by SI2PR02MB5148.apcprd02.prod.outlook.com
 ([fe80::6297:13a6:41f1:e471%6]) with mapi id 15.20.6500.020; Mon, 12 Jun 2023
 03:01:47 +0000
To: jaegeuk@kernel.org,
	chao@kernel.org
Date: Mon, 12 Jun 2023 11:01:18 +0800
Message-Id: <20230612030121.2393541-4-shengyong@oppo.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230612030121.2393541-1-shengyong@oppo.com>
References: <20230612030121.2393541-1-shengyong@oppo.com>
X-ClientProxiedBy: SI1PR02CA0029.apcprd02.prod.outlook.com
 (2603:1096:4:1f4::20) To SI2PR02MB5148.apcprd02.prod.outlook.com
 (2603:1096:4:153::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SI2PR02MB5148:EE_|KL1PR02MB6259:EE_
X-MS-Office365-Filtering-Correlation-Id: 13e7c429-77f1-4b3a-143d-08db6af15c16
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 7I4/FA2hFiQuVVAz9R1yGywr3BSyyNCCeOGFWK/DDCND8Q3TgWMzzdJ77ZYZjCp28Kg9CiNAHOfMf4zUSEfAyW5sJ9qVCAnqVUQ37qiQBgl7Zc2FAchop24Wq+sumgsuO1l+/gkuFCOiwvWqiRBh5yI8rN2XKpx1o3d8inEBJ1my2Meh/uS8fkDt7d/hWcrlgVJfQSkOmew251XggV+Z/5DV6i0UVUSvh6EuKPfXR+1yQnVhvVsppP1Q2WH4qw6k7dbpBmRMZsCLsY1Ecj5IBtZVsuG789R577hgApLdvGisD0eWhmpDwAjWWsRSQjJ7d0Jk3O3F6nNquTGcsddUny2fqdIgHOM5TAk+k2IKKvwD/G6QfWAbYIFhAp8A2HLwUa5oRj2Q5mu3RXAI0oxwaehiB7d+8jYI1ogt7A1mg1SkzXD2r9d7FJgZh7tiAn40skelpacIkDA13/f307ML+pBL7MBY6OfBqMCJEWC6nMVj8pjzgn96N0BdL+S2QlyVMMSgNPe0tPhq8FlDj/Ir2AEUvDflFp1H/FGvyj4RxroW13q7XqhSiZvdWICxbl8qGipWpU5ircVxqBV6dXsanIoHKk9MO9vokY66mphoOfPYVC5PkKNGt2xjmuxiGnAV
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SI2PR02MB5148.apcprd02.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(4636009)(346002)(39860400002)(366004)(376002)(396003)(136003)(451199021)(66476007)(66556008)(8936002)(5660300002)(8676002)(36756003)(66946007)(4326008)(478600001)(6666004)(41300700001)(52116002)(6486002)(316002)(38100700002)(38350700002)(6512007)(6506007)(1076003)(26005)(186003)(2906002)(107886003)(2616005)(86362001)(83380400001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?1oKzPXMpSFmRfjZLMxqYewpPNuxV4U5B/mePqkADj40sDpDTYWgkQ8xtfqOA?=
 =?us-ascii?Q?9xS0RN7c3KH4fjHxlTjljPJ+fZgc2t5xKIe4kXeAcXIlbExYSL2Yp5Dw/U8Z?=
 =?us-ascii?Q?M8FUYxOm4qOVYLstU356bWQSMerWEyeMhyaKjnyOD4TYi1sg4bZmKNwm20AX?=
 =?us-ascii?Q?3ycUSi9WsqAmgqPqAKj061eGbeojguWNnnjM00mZQT8jHWip5+1bkgiq7oVD?=
 =?us-ascii?Q?5SHquULCaTeu8+CEFZicXGZdhS4uhQIKVD7hAth0qpAJSmMwlJs0tKm4kIUc?=
 =?us-ascii?Q?JKLY8YKOKYsdKp+XPGoBBpGu1QFXpuZAceG2lE43JQllX+JEU0Ai8mQg2q4r?=
 =?us-ascii?Q?8iuRn42NqL37Wj+svZ99MumzizLBL7zXJwQFGHocvuK6cO9v6/M0cffnHYHE?=
 =?us-ascii?Q?Sz8XLMoDJEmIkw91pw3Wru2WhvNDxKihKZXUHRiCSoIXgj/SZRt36fujHmG2?=
 =?us-ascii?Q?AWXfpioux9CnDUJ16xJ1HFQjByezHHjcT/+iVtYqbpx57Drnwvb5kc/hrSux?=
 =?us-ascii?Q?PgNSpx8Zs2GsH/rDf/9wb0hmptAOGvs+uyeF/7tJBUroyyBzFILeCiRHmd/2?=
 =?us-ascii?Q?DyiQi39po/p31Joe4EFJnSlfzAy6cCZ5NhVgysRL//DNjXsgEBw2Yw5S9KnG?=
 =?us-ascii?Q?+2lQyLMIITo9sxzgr8Pkiur/7vCAsJPI34v2TmM//ws1t4z3qkmv/6Ymjsi0?=
 =?us-ascii?Q?QtOqjfHWe/O+DjocNAvO0NeAmkMCuVsRxb3UR6WRI+B6Ug778KTcXoGGSvBS?=
 =?us-ascii?Q?cZTY9AlnawowSB1RSChOhpxwG/xDToA6p1bn4Tp7Iq3t3qP+8AltX/d/+Gng?=
 =?us-ascii?Q?Kp2lcYC/lX7RAcKOO0I8vcRs+XKcyLe2dPxME7mmidT/Td/B7wc6st5NKDN5?=
 =?us-ascii?Q?wfT87Rekg07lD060zRtC3yK9ooUpn6GnIbYSdmq9z7ONDFvhsdf922YCFMzo?=
 =?us-ascii?Q?UQJyqvzZwdmlciuiqa/GoaXTyRbalKbenCJXyeFLzvBSsVcC8wbmI3HmsENr?=
 =?us-ascii?Q?zvU6eL9BMDJwWPvsAFfTBmvzOGvKY17f7TFPr/8aMv7LZu6rJCWHSNs2IUll?=
 =?us-ascii?Q?RDLeFehGWdekET62FM/Ehjni+G7uLw8mYac49pNwDHtFISATvEq8RzyayPl4?=
 =?us-ascii?Q?vFuK0Hr/ExaDdWalTJEt4jGFbTzFyqpeJ5ejR2cdIagOas3WqgMUO7SJj5IF?=
 =?us-ascii?Q?YaFkteTT6RQ1aoSUK4PcSy8Nx5EDv7kYTw/LkFicxhlcAdbOYaUAHx/ft+cz?=
 =?us-ascii?Q?6PlcnkF0bp1+fEgN/rabONFEovxpQDxux0FT1kKDhGIlXn10Hv42/+bpzr7i?=
 =?us-ascii?Q?FZ8C+CcsE4Z7nPrqriGqab9esiCTLMr67PDlWQWiCceiJlFlbgfFac2TvpEn?=
 =?us-ascii?Q?5kYt9r6CJpc0GBR2cVEVsvfwmG8al5s0J8JIUA0mhviPLTgYopHKdM5ViZmb?=
 =?us-ascii?Q?1bd3aF9U0nYkMmNnfas31rILU3IMzmOtVvqcehO9C+jAHy8Lz/pZSyQeUhMh?=
 =?us-ascii?Q?E9kwuSI01NmjwGQAus8HovbtK6IYKwhX0FBQ27KhE31aVOxuSd+JwXD/vFdj?=
 =?us-ascii?Q?8AdmaEBs+ZfGzR2KJWJlNzMgxow8JWAnhaUlN+Sv?=
X-OriginatorOrg: oppo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 13e7c429-77f1-4b3a-143d-08db6af15c16
X-MS-Exchange-CrossTenant-AuthSource: SI2PR02MB5148.apcprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Jun 2023 03:01:46.9602 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f1905eb1-c353-41c5-9516-62b4a54b5ee6
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: mgWw5wjkY7sxwyorLErmFc6VP/7e97rVTxegs4d31L6M0exywRVwEEJ8zlCNNzFDcIVG3jrftUgQAXZDK4iFKg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: KL1PR02MB6259
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: Signed-off-by: Sheng Yong <shengyong@oppo.com> ---
 fs/f2fs/f2fs.h
 | 2 ++ fs/f2fs/inode.c | 21 +++++++++++++++++++++ 2 files changed,
 23 insertions(+)
 diff --git a/fs/f2fs/f2fs.h b/fs/f2fs/f2fs.h index
 1b17bbe7e8656..a30c81ac7299d
 100644 --- a/fs/f2fs/f2fs.h +++ b/fs/f2fs/f2fs.h @@ -3478,6 +3478,8 @@ int
 f2fs_pin_file_control(struct inode *inode, bo [...] 
 Content analysis details:   (-0.2 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [40.107.117.54 listed in wl.mailspike.net]
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
 no trust [40.107.117.54 listed in list.dnswl.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.0 SPF_HELO_PASS          SPF: HELO matches SPF record
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid -0.0 T_SCC_BODY_TEXT_LINE   No description available.
X-Headers-End: 1q8Xoo-000MRd-S0
Subject: [f2fs-dev] [PATCH v4 3/6] f2fs: add helper to get inode chksum from
 inode page
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
From: Sheng Yong via Linux-f2fs-devel <linux-f2fs-devel@lists.sourceforge.net>
Reply-To: Sheng Yong <shengyong@oppo.com>
Cc: ebiggers@kernel.org, linux-kernel@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

Signed-off-by: Sheng Yong <shengyong@oppo.com>
---
 fs/f2fs/f2fs.h  |  2 ++
 fs/f2fs/inode.c | 21 +++++++++++++++++++++
 2 files changed, 23 insertions(+)

diff --git a/fs/f2fs/f2fs.h b/fs/f2fs/f2fs.h
index 1b17bbe7e8656..a30c81ac7299d 100644
--- a/fs/f2fs/f2fs.h
+++ b/fs/f2fs/f2fs.h
@@ -3478,6 +3478,8 @@ int f2fs_pin_file_control(struct inode *inode, bool inc);
 void f2fs_set_inode_flags(struct inode *inode);
 bool f2fs_inode_chksum_verify(struct f2fs_sb_info *sbi, struct page *page);
 void f2fs_inode_chksum_set(struct f2fs_sb_info *sbi, struct page *page);
+int f2fs_inode_chksum_get(struct f2fs_sb_info *sbi, struct inode *inode,
+			  u32 *chksum);
 struct inode *f2fs_iget(struct super_block *sb, unsigned long ino);
 struct inode *f2fs_iget_retry(struct super_block *sb, unsigned long ino);
 int f2fs_try_to_free_nats(struct f2fs_sb_info *sbi, int nr_shrink);
diff --git a/fs/f2fs/inode.c b/fs/f2fs/inode.c
index 1e49009831c12..098d1ee72bfcb 100644
--- a/fs/f2fs/inode.c
+++ b/fs/f2fs/inode.c
@@ -204,6 +204,27 @@ void f2fs_inode_chksum_set(struct f2fs_sb_info *sbi, struct page *page)
 	ri->i_inode_checksum = cpu_to_le32(f2fs_inode_chksum(sbi, page));
 }
 
+int f2fs_inode_chksum_get(struct f2fs_sb_info *sbi,
+			  struct inode *inode, u32 *chksum)
+{
+	struct page *ipage;
+	struct f2fs_inode_info *fi = F2FS_I(inode);
+	struct f2fs_inode *ri;
+
+	if (!f2fs_sb_has_inode_chksum(sbi) ||
+	    !f2fs_has_extra_attr(inode) ||
+	    !F2FS_FITS_IN_INODE(ri, fi->i_extra_isize, i_inode_checksum))
+		return -EOPNOTSUPP;
+
+	ipage = f2fs_get_node_page(sbi, inode->i_ino);
+	if (IS_ERR(ipage))
+		return PTR_ERR(ipage);
+
+	*chksum = f2fs_inode_chksum(sbi, ipage);
+	f2fs_put_page(ipage, true);
+	return 0;
+}
+
 static bool sanity_check_compress_inode(struct inode *inode,
 			struct f2fs_inode *ri)
 {
-- 
2.40.1



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
