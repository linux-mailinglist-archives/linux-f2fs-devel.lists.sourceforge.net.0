Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 6707B72B597
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 12 Jun 2023 05:02:21 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1q8Xow-0002bN-Qc;
	Mon, 12 Jun 2023 03:02:19 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <shengyong@oppo.com>) id 1q8Xou-0002bH-Ng
 for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 12 Jun 2023 03:02:17 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=MIME-Version:Content-Type:Content-Transfer-Encoding
 :References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=GRcY7XIgJXp+hNexvFH7YBp7/dL6xWDdR/4H3MeDN3s=; b=DOUrLC8zabmrMenQcWmEM5ZJXW
 neVeyYGKXcE8Kyi2bSIix5FKGTVs8VeX4MEtssdqfudqDnIOhX5gTh7MfwTbt2D66ZOo2bgoU07ol
 uyE8mTqF14CUXGN8uX0re/Li70TLFy4E7nekzCLQgCPId5y3Ow2OVz5XyOoSuTIwFnoc=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=MIME-Version:Content-Type:Content-Transfer-Encoding:References:
 In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=GRcY7XIgJXp+hNexvFH7YBp7/dL6xWDdR/4H3MeDN3s=; b=dqEc+l44lMpdKpT9TaeJnlW/Ih
 opS918funeu7k7Xz0xMzuQAVpnF2kbBXrTiuy0bfyb1VatxmiCMSyyyBOKuAm6cPXHFrOaZR1nGkZ
 XouowHm9zJNDwdyQWAyHh8Vdb8uPvVjNgJPkFrq0Dlbc8pN9QeHhiCOtXEIJ+OI3EwmM=;
Received: from mail-tyzapc01on2054.outbound.protection.outlook.com
 ([40.107.117.54] helo=APC01-TYZ-obe.outbound.protection.outlook.com)
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1q8Xou-000MRd-PW for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 12 Jun 2023 03:02:17 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=hOu2emvJb1VmRZHFZuGWicxfihOap46Yv/2xIJJH8e3tassfPvtMqZHYFrq7fnnRMEfnT+a2pnvPP67hLuyAhYIwF5upjLJ73oaP1deuuuZzlYNgyfNdb+KaxX/6V6vjM9ZTIBgWIdrFVYnhgZ1I61YqoL/rq9HhERVOqAqZwE2ZgSA54XCNVpSuEwYB9rIv6hCwq2oew9mhlwdFU+vqs/r4kDtLpWDSzf6OzTxI29sZE8MqkAJm49fiCwrL84gHdCjD6UmciTP6nmJgpYz7Wr6PlAhgRbkj76OYblvzHGbygKTuiFy6t/OHwYLVsqRVJcXfRsmPLEnblFSkgdASgg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=GRcY7XIgJXp+hNexvFH7YBp7/dL6xWDdR/4H3MeDN3s=;
 b=Br+VkzOS1kuiIPWRBPNl+EuHj2vNfxF8h3rzLkpyMHQDKUnzMrj+It2kBmaSI22klEI1WJ9nQmdn3anf6sFx5mjtf7tiURzvdd8OwQ1kiJVwNkMtBX8pyTsHcIFnoRABdRHDaXwbeHkGZth4VA+hwCqtywON+dyKlF6JCZUzVmUzX9w84mei72wZ1/TyhLWa7VodqNTn49dnmqVrDaTLfsG7bAwyfNeJLIbawaWpb7T58xxQvfcUMln7oRz0LbLK05WSC325rws74P50/Vx8ZfLMZjIYZ/g4r4XB+KVFWtIp07SBAj5t6vIGhdNE8H5kRHR4ADT7d/Tk1UdXOamP7w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oppo.com; dmarc=pass action=none header.from=oppo.com;
 dkim=pass header.d=oppo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oppo.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GRcY7XIgJXp+hNexvFH7YBp7/dL6xWDdR/4H3MeDN3s=;
 b=ONJ8Jjyz2B9HAE1oRh41D/aji9DLLUiMVbA3UXVdpLQlp4UhsaxdWTg5jrmDTRRCX64cx3XRNBrYRO2A2eIkiBl7bD+8jUO4O3dWTMEapPmNPHUXKfLWGIjhk9JTcJcFDPN7ZbXjl0neS+0im4uYZCMQiEDMWQC7bv1jgrhycRo=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oppo.com;
Received: from SI2PR02MB5148.apcprd02.prod.outlook.com (2603:1096:4:153::6) by
 KL1PR02MB6259.apcprd02.prod.outlook.com (2603:1096:820:dc::9) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6500.21; Mon, 12 Jun 2023 03:01:49 +0000
Received: from SI2PR02MB5148.apcprd02.prod.outlook.com
 ([fe80::6297:13a6:41f1:e471]) by SI2PR02MB5148.apcprd02.prod.outlook.com
 ([fe80::6297:13a6:41f1:e471%6]) with mapi id 15.20.6500.020; Mon, 12 Jun 2023
 03:01:49 +0000
To: jaegeuk@kernel.org,
	chao@kernel.org
Date: Mon, 12 Jun 2023 11:01:20 +0800
Message-Id: <20230612030121.2393541-6-shengyong@oppo.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230612030121.2393541-1-shengyong@oppo.com>
References: <20230612030121.2393541-1-shengyong@oppo.com>
X-ClientProxiedBy: SI1PR02CA0029.apcprd02.prod.outlook.com
 (2603:1096:4:1f4::20) To SI2PR02MB5148.apcprd02.prod.outlook.com
 (2603:1096:4:153::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SI2PR02MB5148:EE_|KL1PR02MB6259:EE_
X-MS-Office365-Filtering-Correlation-Id: bd2b2fd8-2927-4d84-0f06-08db6af15d21
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: boPyc20m893HVloBn6RuZSNcS+lu9RPashWxU6mu11ym/OUtiWAshaeh9CZGkm8aghw2tMUNqQtuo2yeAZbI8dhzITQoCDjrPHJ69SYyxaGAMvYlKg6ZpQxvSUOP9X2Y5JOMeRe3c+tk4N3/JqYJKtWWuzLsXTSDSxsixZq6GaD/zevDFBWwAk3qn1GL8aPkxTZ5j+Z7/raz2euqGVEV67lDdm3MZ+ieSdPvfRyCMa2vD/hSMUp5xsA0Tgfv9CcrN3+4qnyKNf0lSQtPh8kLvBlO9zfYxh9BZCbcKUJO9YYKe7DM26W9Wee5PsUv6eneoRcSsOZhEt/+63OYjj2iQNC4w99b+1L4X2Sl93fTtQINwavW7P7QVUlfn98UT/X8YLPNpa3sUatwP5CMdCixi4fuTWHPD8G1NCYspw6ITrBnXe7MuZxaJbH2c/ShpQJ1BVQiAYZS4yXsL1YJ22GdtLW0X6bfa/8nQFCv5CugT0vQIt2ToaugVhDSZPtcb0RQslQMBREgJdJIu4jS8Fj9Nj02riNIyPuXm5NHo+VDfZd454k7qe0pq07UE1DVoAF+KeOgsoJ9XhTibsunIAHQ3uwf70ccvBdxYuDwmIUF09AWXPk6NO9N1QuqiE9ktKV9
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SI2PR02MB5148.apcprd02.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(4636009)(346002)(39860400002)(366004)(376002)(396003)(136003)(451199021)(66476007)(66556008)(8936002)(5660300002)(8676002)(36756003)(66946007)(4326008)(478600001)(6666004)(41300700001)(52116002)(6486002)(316002)(38100700002)(38350700002)(6512007)(6506007)(1076003)(26005)(186003)(2906002)(107886003)(2616005)(86362001)(83380400001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?nwvYdKHyqrLbbGj+z5WqeTCaJIkdZ3MkDXlE3EoiXhZrU26gbGq3KepjH+fU?=
 =?us-ascii?Q?mNRlERRaqxFZCgDGAEvJTbgXcr6DmC0CnCEiPC3YzmN8yVYRhIPzd7RuFZbb?=
 =?us-ascii?Q?IVy61WHorF6XhYVBy/gZI8SMlyThP1zgAEmM9hsvMvG4xfrh+GvUtWehKNsj?=
 =?us-ascii?Q?IPSh0yQvyvQ4a9qqjxpqi93brIVzcmTL9PFEa6qvQctsJJ+vY9BOLSNdB+ed?=
 =?us-ascii?Q?YuESnWO0vw+uNA33i04EZhmzqadk7O1QqkAJPS/KsrIWUvd2qM51/sLHZbgx?=
 =?us-ascii?Q?HFQIp/W79PmmxhiXUDEr3COv0EeESNtVb3CYVdrXAWkXnhs78sc9AMB3Gm6E?=
 =?us-ascii?Q?X3xyRg0Mhj+/t1wbUnOJIHh8XGc3FsdDpmmNjvPrTj+Mnk4OsC13HPST6TI0?=
 =?us-ascii?Q?3YSzZOqzDpUeiCBHqDdhD/2LRSWAj9H97prKPYixXtFSwbXC+cUAx7PaDPwS?=
 =?us-ascii?Q?x6pHdTrLxwrgPV8YABOaFuyQRKrWAowOuoVK1XLiEagng7K7bckQJI4Zjl1I?=
 =?us-ascii?Q?M/51R0Z7KbauVFvDMbPjdzt3Teq0/Gi31Ixsyuh8mG3Y0vfIJGAGIpx6i6NI?=
 =?us-ascii?Q?aKMrE4Q9clFNpHA+YlkHExMuk7q0tamRwW9B2WcOYabezrzoeqQfIdE2pvym?=
 =?us-ascii?Q?g9khs/Zg0E+7AtWH3zu4mS/tP36VhqQSTuDsXUQ7jBBAr7Y56VkTQEnaABXb?=
 =?us-ascii?Q?n59ujTGstZfj54Etgnc+1RCAOXaaB/GxidVq41SJ6Ho6y8guJ98sQkuh2xVV?=
 =?us-ascii?Q?FhhvCVs9uKCDgmAl8SF+tFH9Q+iUoWSgo59+A2OJNs26H6utGgfcniWUDcK7?=
 =?us-ascii?Q?yK7ZTaE23wTUnlRTjwdGCm93qxJgDzWD2owmLMSanMGaGAhejnPw+B1NmOaR?=
 =?us-ascii?Q?PxJIWRO2GBUN+vSVzOhRGwKUyO3dfdzvmBm+Lob5Kr2VnfBAwMs0I/FoVtXi?=
 =?us-ascii?Q?4WKf5uwADE3SsLHTpRSve2zz4s1tuCptKx12GJj32SijT3j+ldqZSzJTprEZ?=
 =?us-ascii?Q?7dGiHL418yuDLKaITkFwN0DFnmnUgrj4Ups2a4acw7FaMBPd1ZWj4z2Gm65h?=
 =?us-ascii?Q?2hLiDtAWMkKme/ciR+a5IGVU9+DwiM5k5eKK0aIQkDLoSCbGZ5OBWYQ2KGPy?=
 =?us-ascii?Q?0OshsVQyOuDg3YRpLuRo2+oQKxMvcJsR7Q2Rf7hyIhf0+1uRMTLI4Wn9XYq+?=
 =?us-ascii?Q?CzTFyq+R91W2AzxHCj9QfU0A6PscwcCCTQUFhDjdvaLjL/R0Jh0qJanfJIxO?=
 =?us-ascii?Q?W+6bj6tzXWh3d/9niDM1SqML0bCUoengkqer4aIffyW+XikeJFfyfv/1YbiN?=
 =?us-ascii?Q?LWvA0oFBqKqOsaWN/fftWs0/+j0Jf4JOL1MTN3tO2vNzjPeaL6+/N4LnZqfT?=
 =?us-ascii?Q?Y5pk8Mdg6yeJgP/Dt2OYfB7ECAlxsA61Bc/opiX39hAZ2QNM2crgRSbAUhQh?=
 =?us-ascii?Q?2wyz587wr1lhuw9ijSj0s8T3sEKkj+fu74KK7vJSWYsOlh7E+XzePPJCOrBc?=
 =?us-ascii?Q?YE0NOTtaBSwEjCSEf/3K0QfMszSluU0/19eCdFVl2df97K2VPuD/ZufXDfd7?=
 =?us-ascii?Q?vrstF7WmKoQuYh33wnOK4KydELo58Ls7MtNDzViC?=
X-OriginatorOrg: oppo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bd2b2fd8-2927-4d84-0f06-08db6af15d21
X-MS-Exchange-CrossTenant-AuthSource: SI2PR02MB5148.apcprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Jun 2023 03:01:48.6708 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f1905eb1-c353-41c5-9516-62b4a54b5ee6
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: CF8GmtYK18E6ACHGVN8x/nAmpIthzaFz6iXgt5VIimcXbSMpRxM6DJre4zS+30uJpjDAHUlueuINHYqOk2m69w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: KL1PR02MB6259
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: This patch introduces two ioctls: * f2fs_ioc_get_extra_attr
 * f2fs_ioc_set_extra_attr to get or modify values in f2fs_inode's extra
 attribute
 area. The argument of these two ioctls is `struct f2fs_extra_attr', which
 has three members: * field: indicates which field in extra attribute area
 is handled * attr: value or userspace pointer * attr_size: [...] 
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
X-Headers-End: 1q8Xou-000MRd-PW
Subject: [f2fs-dev] [PATCH v4 5/6] f2fs: add f2fs_ioc_[get|set]_extra_attr
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

This patch introduces two ioctls:
  * f2fs_ioc_get_extra_attr
  * f2fs_ioc_set_extra_attr
to get or modify values in f2fs_inode's extra attribute area.

The argument of these two ioctls is `struct f2fs_extra_attr', which has
three members:
  * field: indicates which field in extra attribute area is handled
  * attr: value or userspace pointer
  * attr_size: size of `attr'

The `field' member could help extend functionality of these two ioctls
without modify or add new interfaces, if more fields are added into
extra attributes ares in the feture.

Signed-off-by: Sheng Yong <shengyong@oppo.com>
---
 fs/f2fs/file.c            | 205 ++++++++++++++++++++++++++++++++++++++
 include/uapi/linux/f2fs.h |  25 +++++
 2 files changed, 230 insertions(+)

diff --git a/fs/f2fs/file.c b/fs/f2fs/file.c
index f8aa842b5d233..39d04f8f0bb6b 100644
--- a/fs/f2fs/file.c
+++ b/fs/f2fs/file.c
@@ -4179,6 +4179,207 @@ static int f2fs_ioc_compress_file(struct file *filp)
 	return ret;
 }
 
+static bool extra_attr_fits_in_inode(struct inode *inode, int field)
+{
+	struct f2fs_inode_info *fi = F2FS_I(inode);
+	struct f2fs_inode *ri;
+
+	switch (field) {
+	case F2FS_EXTRA_ATTR_TOTAL_SIZE:
+	case F2FS_EXTRA_ATTR_ISIZE:
+	case F2FS_EXTRA_ATTR_INLINE_XATTR_SIZE:
+		return true;
+	case F2FS_EXTRA_ATTR_PROJID:
+		if (!F2FS_FITS_IN_INODE(ri, fi->i_extra_isize, i_projid))
+			return false;
+		return true;
+	case F2FS_EXTRA_ATTR_INODE_CHKSUM:
+		if (!F2FS_FITS_IN_INODE(ri, fi->i_extra_isize, i_inode_checksum))
+			return false;
+		return true;
+	case F2FS_EXTRA_ATTR_CRTIME:
+		if (!F2FS_FITS_IN_INODE(ri, fi->i_extra_isize, i_crtime))
+			return false;
+		return true;
+	case F2FS_EXTRA_ATTR_COMPR_BLOCKS:
+	case F2FS_EXTRA_ATTR_COMPR_OPTION:
+		if (!F2FS_FITS_IN_INODE(ri, fi->i_extra_isize, i_compr_blocks))
+			return false;
+		return true;
+	default:
+		BUG_ON(1);
+		return false;
+	}
+}
+
+static int f2fs_ioc_get_extra_attr(struct file *filp, unsigned long arg)
+{
+	struct inode *inode = file_inode(filp);
+	struct f2fs_inode_info *fi = F2FS_I(inode);
+	struct f2fs_sb_info *sbi = F2FS_I_SB(inode);
+	struct f2fs_extra_attr attr;
+	u32 chksum;
+	int ret = 0;
+
+	if (!f2fs_has_extra_attr(inode))
+		return -EOPNOTSUPP;
+
+	if (copy_from_user(&attr, (void __user *)arg, sizeof(attr)))
+		return -EFAULT;
+
+	if (attr.field >= F2FS_EXTRA_ATTR_MAX)
+		return -EINVAL;
+
+	if (!extra_attr_fits_in_inode(inode, attr.field))
+		return -EOPNOTSUPP;
+
+	switch (attr.field) {
+	case F2FS_EXTRA_ATTR_TOTAL_SIZE:
+		attr.attr = F2FS_TOTAL_EXTRA_ATTR_SIZE;
+		break;
+	case F2FS_EXTRA_ATTR_ISIZE:
+		attr.attr = fi->i_extra_isize;
+		break;
+	case F2FS_EXTRA_ATTR_INLINE_XATTR_SIZE:
+		if (!f2fs_has_inline_xattr(inode))
+			return -EOPNOTSUPP;
+		attr.attr = get_inline_xattr_addrs(inode);
+		break;
+	case F2FS_EXTRA_ATTR_PROJID:
+		if (!f2fs_sb_has_project_quota(F2FS_I_SB(inode)))
+			return -EOPNOTSUPP;
+		attr.attr = from_kprojid(&init_user_ns, fi->i_projid);
+		break;
+	case F2FS_EXTRA_ATTR_INODE_CHKSUM:
+		ret = f2fs_inode_chksum_get(sbi, inode, &chksum);
+		if (ret)
+			return ret;
+		attr.attr = chksum;
+		break;
+	case F2FS_EXTRA_ATTR_CRTIME:
+		if (!f2fs_sb_has_inode_crtime(sbi))
+			return -EOPNOTSUPP;
+		if (attr.attr_size == sizeof(struct timespec64)) {
+			if (put_timespec64(&fi->i_crtime,
+					(void __user *)(uintptr_t)attr.attr))
+				return -EFAULT;
+		} else if (attr.attr_size == sizeof(struct old_timespec32)) {
+			if (put_old_timespec32(&fi->i_crtime,
+					(void __user *)(uintptr_t)attr.attr))
+				return -EFAULT;
+		} else {
+			return -EINVAL;
+		}
+		break;
+	case F2FS_EXTRA_ATTR_COMPR_BLOCKS:
+		if (attr.attr_size != sizeof(__u64))
+			return -EINVAL;
+		ret = f2fs_get_compress_blocks(inode, &attr.attr);
+		break;
+	case F2FS_EXTRA_ATTR_COMPR_OPTION:
+		ret = f2fs_ioc_get_compress_option(filp, attr.attr);
+		break;
+	default:
+		return -EINVAL;
+	}
+
+	if (ret < 0)
+		return ret;
+
+	if (copy_to_user((void __user *)arg, &attr, sizeof(attr)))
+		return -EFAULT;
+
+	return 0;
+}
+
+static int f2fs_ioc_set_extra_attr(struct file *filp, unsigned long arg)
+{
+	struct inode *inode = file_inode(filp);
+	struct f2fs_sb_info *sbi = F2FS_I_SB(inode);
+	struct f2fs_extra_attr attr;
+	struct page *ipage;
+	void *inline_addr;
+	int ret;
+
+	if (!f2fs_has_extra_attr(inode))
+		return -EOPNOTSUPP;
+
+	if (copy_from_user(&attr, (void __user *)arg, sizeof(attr)))
+		return -EFAULT;
+
+	if (attr.field >= F2FS_EXTRA_ATTR_MAX)
+		return -EINVAL;
+
+	if (!extra_attr_fits_in_inode(inode, attr.field))
+		return -EOPNOTSUPP;
+
+	switch (attr.field) {
+	case F2FS_EXTRA_ATTR_TOTAL_SIZE:
+	case F2FS_EXTRA_ATTR_ISIZE:
+	case F2FS_EXTRA_ATTR_PROJID:
+	case F2FS_EXTRA_ATTR_INODE_CHKSUM:
+	case F2FS_EXTRA_ATTR_CRTIME:
+	case F2FS_EXTRA_ATTR_COMPR_BLOCKS:
+		/* read only attribtues */
+		return -EOPNOTSUPP;
+	case F2FS_EXTRA_ATTR_INLINE_XATTR_SIZE:
+		if (!f2fs_sb_has_flexible_inline_xattr(sbi) ||
+		    !f2fs_has_inline_xattr(inode))
+			return -EOPNOTSUPP;
+		if (attr.attr < MIN_INLINE_XATTR_SIZE ||
+		    attr.attr > MAX_INLINE_XATTR_SIZE)
+			return -EINVAL;
+		inode_lock(inode);
+		f2fs_lock_op(sbi);
+		f2fs_down_write(&F2FS_I(inode)->i_xattr_sem);
+		if (i_size_read(inode) || F2FS_I(inode)->i_xattr_nid) {
+			/*
+			 * it is not allowed to set this field if the inode
+			 * has data or xattr node
+			 */
+			ret = -EFBIG;
+			goto xattr_out_unlock;
+		}
+		ipage = f2fs_get_node_page(sbi, inode->i_ino);
+		if (IS_ERR(ipage)) {
+			ret = PTR_ERR(ipage);
+			goto xattr_out_unlock;
+		}
+		inline_addr = inline_xattr_addr(inode, ipage);
+		if (!IS_XATTR_LAST_ENTRY(XATTR_FIRST_ENTRY(inline_addr))) {
+			ret = -EFBIG;
+		} else {
+			struct f2fs_xattr_header *hdr;
+			struct f2fs_xattr_entry *ent;
+
+			F2FS_I(inode)->i_inline_xattr_size = (int)attr.attr;
+			inline_addr = inline_xattr_addr(inode, ipage);
+			hdr = XATTR_HDR(inline_addr);
+			ent = XATTR_FIRST_ENTRY(inline_addr);
+			hdr->h_magic = cpu_to_le32(F2FS_XATTR_MAGIC);
+			hdr->h_refcount = cpu_to_le32(1);
+			memset(ent, 0, attr.attr - sizeof(*hdr));
+			set_page_dirty(ipage);
+			ret = 0;
+		}
+		f2fs_put_page(ipage, 1);
+xattr_out_unlock:
+		f2fs_up_write(&F2FS_I(inode)->i_xattr_sem);
+		f2fs_unlock_op(sbi);
+		inode_unlock(inode);
+		if (!ret)
+			f2fs_balance_fs(sbi, true);
+		break;
+	case F2FS_EXTRA_ATTR_COMPR_OPTION:
+		ret = f2fs_ioc_set_compress_option(filp, attr.attr);
+		break;
+	default:
+		return -EINVAL;
+	}
+
+	return ret;
+}
+
 static long __f2fs_ioctl(struct file *filp, unsigned int cmd, unsigned long arg)
 {
 	switch (cmd) {
@@ -4265,6 +4466,10 @@ static long __f2fs_ioctl(struct file *filp, unsigned int cmd, unsigned long arg)
 		return f2fs_ioc_decompress_file(filp);
 	case F2FS_IOC_COMPRESS_FILE:
 		return f2fs_ioc_compress_file(filp);
+	case F2FS_IOC_GET_EXTRA_ATTR:
+		return f2fs_ioc_get_extra_attr(filp, arg);
+	case F2FS_IOC_SET_EXTRA_ATTR:
+		return f2fs_ioc_set_extra_attr(filp, arg);
 	default:
 		return -ENOTTY;
 	}
diff --git a/include/uapi/linux/f2fs.h b/include/uapi/linux/f2fs.h
index 955d440be1046..2b53e90421bfc 100644
--- a/include/uapi/linux/f2fs.h
+++ b/include/uapi/linux/f2fs.h
@@ -43,6 +43,10 @@
 #define F2FS_IOC_DECOMPRESS_FILE	_IO(F2FS_IOCTL_MAGIC, 23)
 #define F2FS_IOC_COMPRESS_FILE		_IO(F2FS_IOCTL_MAGIC, 24)
 #define F2FS_IOC_START_ATOMIC_REPLACE	_IO(F2FS_IOCTL_MAGIC, 25)
+#define F2FS_IOC_GET_EXTRA_ATTR		_IOR(F2FS_IOCTL_MAGIC, 26,	\
+						struct f2fs_extra_attr)
+#define F2FS_IOC_SET_EXTRA_ATTR		_IOW(F2FS_IOCTL_MAGIC, 27,	\
+						struct f2fs_extra_attr)
 
 /*
  * should be same as XFS_IOC_GOINGDOWN.
@@ -96,4 +100,25 @@ struct f2fs_comp_option {
 	__u8 log_cluster_size;
 };
 
+enum {
+	F2FS_EXTRA_ATTR_TOTAL_SIZE,		/* ro, size of extra attr area */
+	F2FS_EXTRA_ATTR_ISIZE,			/* ro, i_extra_isize */
+	F2FS_EXTRA_ATTR_INLINE_XATTR_SIZE,	/* rw, i_inline_xattr_size */
+	F2FS_EXTRA_ATTR_PROJID,			/* ro, i_projid */
+	F2FS_EXTRA_ATTR_INODE_CHKSUM,		/* ro, i_inode_chksum */
+	F2FS_EXTRA_ATTR_CRTIME,			/* ro, i_crtime, i_crtime_nsec */
+	F2FS_EXTRA_ATTR_COMPR_BLOCKS,		/* ro, i_compr_blocks */
+	F2FS_EXTRA_ATTR_COMPR_OPTION,		/* rw, i_compress_algorithm,
+						 *     i_log_cluster_size
+						 */
+	F2FS_EXTRA_ATTR_MAX,
+};
+
+struct f2fs_extra_attr {
+	__u8 field;		/* F2FS_EXTRA_ATTR_* */
+	__u8 rsvd1;
+	__u16 attr_size;	/* size of @attr */
+	__u32 rsvd2;
+	__u64 attr;		/* attr value or pointer */
+};
 #endif /* _UAPI_LINUX_F2FS_H */
-- 
2.40.1



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
