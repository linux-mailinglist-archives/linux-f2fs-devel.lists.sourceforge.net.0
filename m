Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 5AF4573A5D8
	for <lists+linux-f2fs-devel@lfdr.de>; Thu, 22 Jun 2023 18:18:02 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1qCN0Q-0000vW-I1;
	Thu, 22 Jun 2023 16:17:58 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <heyunlei@oppo.com>) id 1qCN0M-0000vM-7S
 for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 22 Jun 2023 16:17:54 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=MIME-Version:Content-Type:Content-Transfer-Encoding
 :Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=JnIA4eGfMCYXEMlcFnq9u36R1p+VFdYmf3/BF4sqYzI=; b=EwQMJNHpMY+DvqulnjJ09hG7as
 yUkAG4iGLU08MzGSnFq1Wg14KMUBn/TrDvYCmIfCkuQMs6ttg7e4PrnrJVvmKlNEFyPS+A6KOhd1Q
 If9VIsM5b7Je4l3m2cvuiDl6YGbcEKO99XL6niWR17o/zx89/JnkHNlUdFNOOBcfjmq8=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:Date:
 Subject:Cc:To:From:Sender:Reply-To:Content-ID:Content-Description:Resent-Date
 :Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=JnIA4eGfMCYXEMlcFnq9u36R1p+VFdYmf3/BF4sqYzI=; b=k
 9leoYWZrA0ZNmA9gk6tj+qYZeWID1139z5nBPFjZ9cCjvVc/Oxz4uOHElGRsYWkX1kqTVim7RXZCS
 O8NWEyS8truo2LArtXyiaeT1LJv5sdO/L/323OFQtde8BaCGB0SK/uEcyyEfo35vWMZ/vvfEUbKNP
 R6R8Tp1M3nB3fYW0=;
Received: from mail-tyzapc01on2074.outbound.protection.outlook.com
 ([40.107.117.74] helo=APC01-TYZ-obe.outbound.protection.outlook.com)
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1qCN0I-0000Ii-VQ for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 22 Jun 2023 16:17:54 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=a7DoH4PuAJLtDwTbp11kRv8xfcETVREmOFhmUl+g78UUWxPQ4Kv7D31tLlrMFvMekKZtMMdWO3c71yk4gL+bbMTxMLqzwPQEr5Ay9+gZ/+7guAk2fdUG+zpBJ8YgkTAHBytdI+u5N/11HyBgNhhc4RTrAMCA7UiTbbOuOBR6Sly9uXOqfsXSEACk2fgnTIiUMmyOplmNMKGhaoQeIIBKRvDPLhfu/PPxzOhFDk2OPfTdnJFvMRUcAEjv5VxbPm8uoPEBFEdje4iXCrzTH9/GbJGRWOVlsxp3apRy8byQNfWP67kFU/ekgixyPRtOgiDtBiLtFZ2wgRDCFhU7NLuRuw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=JnIA4eGfMCYXEMlcFnq9u36R1p+VFdYmf3/BF4sqYzI=;
 b=gNrA4AuacV2vEQ/Zd4FWjwDzYQhH5fzxixq8V3pRxywWhsvAUoWtl4gMFBOJhYc66VChGZlX7KeJXD7sMcIHxKwpTOwyPlc8GBHEv8nT3xfsBDorPO/260dr74tTputIfUejWKAcxT77/msMQggb9NfFBzDX5FYAYsZVcQuVAoz/krBEnIQ8aM6x6slkobHCzSYXhY8z5C21seK8AdgU0JH0q3WnGcadz6yFPh9KFwf9p7vRXj8q3KZLsHceEdDUo63uIYkZHH6TOKfUsq9Kq9p9DJOgO3wiOiX1HEjJD99yoiGo9jy+r7Dk1goHYpU8PESz1/ofmk1W6ewX7ZuZtQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oppo.com; dmarc=pass action=none header.from=oppo.com;
 dkim=pass header.d=oppo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oppo.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JnIA4eGfMCYXEMlcFnq9u36R1p+VFdYmf3/BF4sqYzI=;
 b=hkELmVS48PWTcdT7ZC1X18JM/+AO+udsJWKQZuBYPoVIbT9p4hkJ+rUN8g679SDzFXf/JYVbhiJDz1sMG/MPpWU9/qVuyYICIPy9oYSSXdVnifMWLU/RDdzqrDBo2nVVMeljvXaBEwvWcKYwXUSwWLc4Qi6LE8sBJuQ0PLkv62U=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oppo.com;
Received: from TY2PR02MB4479.apcprd02.prod.outlook.com (2603:1096:404:800e::7)
 by KL1PR02MB6189.apcprd02.prod.outlook.com (2603:1096:820:bd::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6521.23; Thu, 22 Jun
 2023 16:17:33 +0000
Received: from TY2PR02MB4479.apcprd02.prod.outlook.com
 ([fe80::bc4a:4d7a:4c73:76eb]) by TY2PR02MB4479.apcprd02.prod.outlook.com
 ([fe80::bc4a:4d7a:4c73:76eb%4]) with mapi id 15.20.6521.020; Thu, 22 Jun 2023
 16:17:32 +0000
To: jaegeuk@kernel.org,
	chao@kernel.org
Date: Fri, 23 Jun 2023 00:16:46 +0800
Message-Id: <20230622161647.742012-1-heyunlei@oppo.com>
X-Mailer: git-send-email 2.40.1
X-ClientProxiedBy: SG2PR04CA0178.apcprd04.prod.outlook.com
 (2603:1096:4:14::16) To TY2PR02MB4479.apcprd02.prod.outlook.com
 (2603:1096:404:800e::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TY2PR02MB4479:EE_|KL1PR02MB6189:EE_
X-MS-Office365-Filtering-Correlation-Id: a996395c-a53a-40dc-10c0-08db733c2e7d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: NV8P1aPqqZ7W3CaKpdGUvXr6grTgOg3DPSQ+JRVvWF3F+3bAY3goFj29jpdVgn4bALsR7TExN03CtJxoXikOaCBhBUIOLaNLmrV3WYc1kueDTsA1j97HXuP24iEozCd1dFr+hO86YxUrS7217PyENz9ZunC6K8BZWsLqlSPB0WJgCFVNSoqklNb/rOzZpK7/2KwviNUK342lVS4WDy3JZdyfIXNfVMk8BDknl2uLAXdZslI9KohdvgwnqCEPRUF9RjtQGOOABxApY0R4pe7R3o26KLSpSRBWu8oepX0IUwiMl1x+fatW0OC69kPLSwzfDmduRIwN4HT3HqDXJMkPooxCfD/CN7nTNFgcYJOpaxslxA8/Tytt707RcN3jOYbRcb5Y3DBa28yUTnlMg655lsp3NLUmKfslbYTTqwikawgcYGHHYypzGwIPq3qG1La3hizptjFtHMEtxU2hQ7ap6Kha1quufnxkLQ3lsrB6QNRLKFnMTQwy4OkztsZWWHwsp3VYfh8bCWtXTayWHX3cvZ/KrwTTa9I8uwiKCnRyAcdtlvEfOdBvknm6CLHcwFBxKkleinRwRAp0Q9Y1UGvefwjpMieOlFSl/cy/mgfR2nE8b55Y4rqEViP6+v8+gtjf
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:TY2PR02MB4479.apcprd02.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(4636009)(39860400002)(136003)(346002)(376002)(396003)(366004)(451199021)(5660300002)(478600001)(66476007)(66556008)(66946007)(52116002)(4326008)(6666004)(6486002)(316002)(36756003)(86362001)(2616005)(83380400001)(1076003)(26005)(6512007)(6506007)(186003)(38100700002)(107886003)(4744005)(8936002)(2906002)(8676002)(41300700001)(15650500001)(38350700002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?QHaSTlsaJVQ/P/ieDFpkaIlw1T4YKm9MaOBIFRUP7rxF2U1ZucIzaDfAlQ9d?=
 =?us-ascii?Q?4vDdqDyg1xZC/C1Gvs1GiGXNyWeUzerf2FFpVlTrQkyxWVgma6DKKnTQImAS?=
 =?us-ascii?Q?rkMwN7Xgmayl3TiSR7s+DwNSMUYpUKEXAR9TI39abRrW/zp34olZCivJMHdx?=
 =?us-ascii?Q?jPGTBiEu1AeKWmgcTfqLJ4+4oCunJjVDPnkaYPTZEUxqslFIw3ZGHS/iXi+1?=
 =?us-ascii?Q?IJprDAS4nZ9knoMa9Xo36iaAXqyabr1FJXXJ6cUd7tHLutYf6vu7vfNsxS+L?=
 =?us-ascii?Q?6LRbznem5spKT90KeeAEogv5JxhazwJBJvxBRCscGv9FYeemw+8uQkdbYzj0?=
 =?us-ascii?Q?lY2n9HZSl0XDspaUD3qYfxyRGYcdBSKLzE3mnFyoJl8r2rOgE21wouTHmEzT?=
 =?us-ascii?Q?AaIjYy82dTNARd3Gbiane8YQw0S2xSTAIW1qSlo4pSRy/xdFojiYUIJ1ufRQ?=
 =?us-ascii?Q?H0OekxCjwtS4TpMjDVAUn8G6CM+PWLIjSIeg1kHzUracG2S7LR9QzxhV5/kH?=
 =?us-ascii?Q?/pF9pgD9ExdoPY5Eej9RiNp8TqHjK1Hesr9UvGXEhrqi9unEBSAxAXx6wRqV?=
 =?us-ascii?Q?cBI9WoqjQvsNEPxadOflUxCXnmLbcy8kRsWaT2BKjxZ1B0FCLMjpLdlPLt1D?=
 =?us-ascii?Q?v2JBWG8CD9pFcOkgVWvuymVb5sreIQUOU/hqMksC3V7JK3ZNkXX8gXBVWhVw?=
 =?us-ascii?Q?BU9bu+fd29v0VJTUEZvZTKImDpOV4eA51WprTbA4nBrJbnCgMl0mUuWgQ/9o?=
 =?us-ascii?Q?4+Y0p6WpMqL94vaRB5ogYcYAuHUFqDMD4ykyCDp9Sn5mP9TYn8EdllTlQUOS?=
 =?us-ascii?Q?uxDQYcEWr0Dm5+jGJuPxSkXUbSAzbjhLePTwMV9sPXzmVX7VcaK2sZ1qvGjf?=
 =?us-ascii?Q?2EYEsQxxmqF4DGd9oJbfNeS1JGegV3rx5Jn42V9XTyQI8EADwIE/VFpDK7kj?=
 =?us-ascii?Q?d81OoT8huafroqIdJXt6IoF+HFh4QEjKZ+aMdvAmhlZ8jsfZp2G/I3m9QPAK?=
 =?us-ascii?Q?nZOiFAH2lh1P4+lsT+JNbSklTSTIcghToFmtmPtHIYseTz95wFVGret5e9JV?=
 =?us-ascii?Q?Uj0opAeR4GWk8ytAbbCvVzHP6DAr7V34aqEmE3RJkopokIIeusL4Dv/cgnYA?=
 =?us-ascii?Q?pk0UlepwgCnRVniZd+iL37HP6hNQlkZqAfl8cUcCeMCJeBOVQkL02DM/k2gl?=
 =?us-ascii?Q?N6Fpp5jKUbcAoQ5xuYT7xbATW3PzBef9CnNUSg49uk+GK0gYSACbBBhWTD6P?=
 =?us-ascii?Q?cGUM8ecPJqG1yyg5CJft2gsOUsugQPHIPTfDqvkNeKLog6KYE9Cg//zaMTMF?=
 =?us-ascii?Q?2Bpt8xqxDWrLETnbLqvAMzlCgIjfjKGhDEpMarBu1AVih7WUtIJF6cmKbgDE?=
 =?us-ascii?Q?qbW67kikmRfLSTrPXA/50CefiOfwrPaBOlC9awuIxkUcxciPnpy0vSe7kA5f?=
 =?us-ascii?Q?75+7d75l7HRdRty1sYlmBMpytg0UazFOjmv9BWDaXhO+1TYK+lw9J4ohs1ef?=
 =?us-ascii?Q?33k8L059vG/qbOD0roLC+CcuMJe3fJ4wTdbPb/MaF/PPosCW8FMOKN4tCfc8?=
 =?us-ascii?Q?+bYCB3O6ZlB/Sn09MGux3J2P3cuyOxrJX+VUtYk4?=
X-OriginatorOrg: oppo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a996395c-a53a-40dc-10c0-08db733c2e7d
X-MS-Exchange-CrossTenant-AuthSource: TY2PR02MB4479.apcprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Jun 2023 16:17:32.0384 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f1905eb1-c353-41c5-9516-62b4a54b5ee6
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: kOKcSgoPpX7h2FoRIuybf9PwlFUwwNu7b6Q9Gl4UotHJR05/RHbxTC9o7RK8VIxEyxRBz+HDPQCEpu1NdvWO5w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: KL1PR02MB6189
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: Mtime and ctime stay old value without update after move file
 range ioctl. This patch add time update. Signed-off-by: Yunlei He
 <heyunlei@oppo.com>
 --- v2: -update both src and dst inode fs/f2fs/file.c | 13 +++++++++++++
 1 file changed, 13 insertions(+) 
 Content analysis details:   (-0.2 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [40.107.117.74 listed in wl.mailspike.net]
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
 no trust [40.107.117.74 listed in list.dnswl.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.0 SPF_HELO_PASS          SPF: HELO matches SPF record
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
X-Headers-End: 1qCN0I-0000Ii-VQ
Subject: [f2fs-dev] [PATCH 1/2 v2] f2fs: update mtime and ctime in move file
 range method
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
From: Yunlei He via Linux-f2fs-devel <linux-f2fs-devel@lists.sourceforge.net>
Reply-To: Yunlei He <heyunlei@oppo.com>
Cc: linux-kernel@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

Mtime and ctime stay old value without update after move
file range ioctl. This patch add time update.

Signed-off-by: Yunlei He <heyunlei@oppo.com>
---
v2:
-update both src and dst inode
 fs/f2fs/file.c | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/fs/f2fs/file.c b/fs/f2fs/file.c
index cb42d8464ad9..e59fc8faa035 100644
--- a/fs/f2fs/file.c
+++ b/fs/f2fs/file.c
@@ -2886,6 +2886,19 @@ static int f2fs_move_file_range(struct file *file_in, loff_t pos_in,
 		f2fs_up_write(&F2FS_I(dst)->i_gc_rwsem[WRITE]);
 out_src:
 	f2fs_up_write(&F2FS_I(src)->i_gc_rwsem[WRITE]);
+
+	if (!ret) {
+		src->i_mtime = src->i_ctime = current_time(src);
+		f2fs_mark_inode_dirty_sync(src, false);
+
+		if (src != dst) {
+			dst->i_mtime = dst->i_ctime = current_time(dst);
+			f2fs_mark_inode_dirty_sync(dst, false);
+		}
+
+		f2fs_update_time(sbi, REQ_TIME);
+	}
+
 out_unlock:
 	if (src != dst)
 		inode_unlock(dst);
-- 
2.40.1



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
