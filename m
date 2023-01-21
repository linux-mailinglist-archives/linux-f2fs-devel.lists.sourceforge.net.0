Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 4057D6763F2
	for <lists+linux-f2fs-devel@lfdr.de>; Sat, 21 Jan 2023 06:12:46 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1pJ6BK-0004oq-Eb;
	Sat, 21 Jan 2023 05:12:45 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <frank.li@vivo.com>) id 1pJ6BH-0004oc-L2
 for linux-f2fs-devel@lists.sourceforge.net;
 Sat, 21 Jan 2023 05:12:42 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=MIME-Version:Content-Type:Content-Transfer-Encoding
 :References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=7QlNOhb/vZmUKtW3U4P55tgvX0xlXx7iG2CVOS5BINs=; b=LJNMkN/NKa6N3Ngk3A/MGfc019
 gCwgGDeYxx4WzBX+KYEgoP38yYhUG6iBpnh003ny6xEwKFBAJbyF3Sjs9i6TEcMdVeE8smkcuQcd9
 Aiaq7TU6cFlL5yWsaZzg7fmJCTy7hprVAdtzFgvsOoRhp7446wkP4ssiMosHsGvpviNw=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=MIME-Version:Content-Type:Content-Transfer-Encoding:References:
 In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=7QlNOhb/vZmUKtW3U4P55tgvX0xlXx7iG2CVOS5BINs=; b=E1UD7bm196x4jF2BUzfNUaSEqx
 rXquUT3coXUad7Xhzc27Ktvqqtkvti2IxRIfOU1WMiEAlGoE3r9+Cyw0zTpG/ZfI1fNQ++ahYsr2v
 C72YDV1mtoIFjAqfrjRfujI50YvjnizkT+RYK/IPlw1gpOK4722OHCQeSXXQi2yZbbsE=;
Received: from mail-tyzapc01on2109.outbound.protection.outlook.com
 ([40.107.117.109] helo=APC01-TYZ-obe.outbound.protection.outlook.com)
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1pJ6BF-0004FR-Hq for linux-f2fs-devel@lists.sourceforge.net;
 Sat, 21 Jan 2023 05:12:42 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Ub1qAgIfOpoXscYD1QQo76IABuXtiK0R8gAtjcB3qIYejCCL8tYe3YRnULcez8UIWPU6vbpXi5PXdDzl8bGm/FUIQPXzoGxqyqeeOiYdfp2pW/PRIKEE+e96DSN6/zWwFUyduuytzHQQZHVlQ8TC6e2aRv8ya1nHLc2msi7Kz6MMMfpC9sWhH2QjBXXFVB3wud9szLUKGeyzq1hvNAfeN4H81q81u4HHQuZCoApeQwfgjbtCn4TPQ9xBghplGRZ9G62o1ewpnNSQsz2VyCLTZ9MvwCoCE9wvcBEfpz9yymJD4O7/LwZcNt/M//6Dc/r/i/jxxGqtNYVqY8I56TzYiA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7QlNOhb/vZmUKtW3U4P55tgvX0xlXx7iG2CVOS5BINs=;
 b=evXNVNDzvfEvwVDNKVd5J2FofBLkFpNMG0mC2CIzUPdu98329+05GTmGq8ldCy0GSxVRj8O+x9O/0bmBNAJ0U7mJyYHTbQeiDmMtRM8S4Xkzrou4k1x9TF4GH3Dk3pHhDK3fhAMzOAClJbjITr4h3zun5Yfx9y2IQtvsrsMuFj7uZJM3eLFDrIl/8IbTkrIUlDPwI2MyRLkn1y5tv+4DZ43Xd0LwhmrzJF1mKdAd/NJ5U0y3lOlOTtTVrpOFhl+czZotgTfgblWkdf4zJBJ+2IM7baSILlCmPIQQqk+PAbdFuHuGGj67Z/KCHXIzBDt1WpUrcOkZdHddQe0I6fg0Dw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vivo.com; dmarc=pass action=none header.from=vivo.com;
 dkim=pass header.d=vivo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vivo.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7QlNOhb/vZmUKtW3U4P55tgvX0xlXx7iG2CVOS5BINs=;
 b=ek62lkChsNTqV3ZHXmrmhZ6YdqJkqr/2H6DNnGzHSgjrahqqCH1c5UtaR1hQJeG9PZYebgV/FDlNsdE3s0P2Mfhs2Rah4JkQ6BUtyUHd9S2touDM3w4JU+TyUcr92SYCQ3LUDTvcGhT00YbS0eOGcMRQxH8kdfCq8Gihuo9eizuDDBuHdGw6KTr+ughUnQ/ieXvG2gE0aiRWO3tHl5w8ZBvu+Z7+c/gD7ksCZAmvxflyr+7Qnm3iekYgRLaILdnNw3VQtgZZXMphcvT/5zdbAxtOsYgMhajenWqTefP5MSNBrhD+7E6k6u/SHCKhD1rzxG2r1ZnJfNE04/ryzlY51w==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=vivo.com;
Received: from SEZPR06MB5269.apcprd06.prod.outlook.com (2603:1096:101:78::6)
 by TYZPR06MB3885.apcprd06.prod.outlook.com (2603:1096:400:6::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6043.9; Sat, 21 Jan
 2023 05:12:24 +0000
Received: from SEZPR06MB5269.apcprd06.prod.outlook.com
 ([fe80::3e52:d08c:ecf4:d572]) by SEZPR06MB5269.apcprd06.prod.outlook.com
 ([fe80::3e52:d08c:ecf4:d572%5]) with mapi id 15.20.6002.012; Sat, 21 Jan 2023
 05:12:24 +0000
To: jaegeuk@kernel.org,
	chao@kernel.org
Date: Sat, 21 Jan 2023 13:12:03 +0800
Message-Id: <20230121051204.81251-4-frank.li@vivo.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20230121051204.81251-1-frank.li@vivo.com>
References: <20230121051204.81251-1-frank.li@vivo.com>
X-ClientProxiedBy: SI2PR01CA0008.apcprd01.prod.exchangelabs.com
 (2603:1096:4:191::10) To SEZPR06MB5269.apcprd06.prod.outlook.com
 (2603:1096:101:78::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SEZPR06MB5269:EE_|TYZPR06MB3885:EE_
X-MS-Office365-Filtering-Correlation-Id: 14d3cdba-a721-4d2d-5a0e-08dafb6e1531
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 4ZEnPrBsUMrLyJR6zajh61C1G5cOdeyvmCrzUiieHidjHFev0sd1k7f8Cj9ElzlKpLhkMEoLXXrd3k89oD3uYIaL0Wc63l40y8UTFNMHqbb2e/V/aQcXi4c9lNnFnLaNtnmpKim3OzIrqSi+1Pr5VSnGHygwZKbFbdgPI2RyOOnNOA70RbULOx8l+xR6X0xSKHCCIgvhqHC/za2DmP6X+e60eq3Jp4e6QDew6vzoxeZXSzAia7QR4jAA1u8u2QmCc2Tx83w4YUcC+RmRhefoCIb1a9nbm4FPfo6pd05bV6I4nUap18fCKzwcM5hlR6TFLjOUvYrMgN0JxsZrS4UH/7Th7wkuNqA7t913cU5CwyE7iSG8fnwRZbqJSK6whTpPwyj8MqR1BmDDLSrI7NNfoAmUFAzqvb1TupZtdzVzJHN2ZzDzid4O7PgJVDpRqFQocRfUjYOAgddbTpIEYyHNp+CqvVVqRxfwbnVJm/c3OIk2K+QqgiTXon6Ad9RnQt1xxZtOAsJch7sI+rQxhoyc4r8pi8mCMEAhgu5/gzDJqkmnAsRbsh2uJMQCc0aBmOq8tE9FnX9qhUxQmpnP/z/k8SyZL0zkmJJO0ui3CJWWSta135+6S/S+smJ7Ge+bZ6TsbVv/v8llIArWzBRnQZ0Fhk9owbIyrlRQE95HUyKlidMj/pFQnzEI3TF8oUataCXXw3/NRoLbjYX3OeMqILDoTg==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SEZPR06MB5269.apcprd06.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(4636009)(396003)(39850400004)(136003)(346002)(376002)(366004)(451199015)(38350700002)(38100700002)(86362001)(6666004)(5660300002)(8936002)(2906002)(66556008)(66476007)(8676002)(4326008)(66946007)(41300700001)(1076003)(2616005)(6506007)(6512007)(186003)(26005)(83380400001)(19627235002)(316002)(107886003)(52116002)(478600001)(6486002)(36756003);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?lxvugdCBnbopGCgsu+l2VKEJR6sPbIFpbIoS7ygx6P904pthxVuTLztXOVXj?=
 =?us-ascii?Q?jAzzLzxDaLzUT4DiX8+Sxya9BskOWWHuwxQfXehx82YZLO/iaTMwvY5ruQIW?=
 =?us-ascii?Q?HAb3+pUSC1Fkquh8vim/t59ADNtBpvgQFWBhw02HprNdjUDPSiZ3X50UUz1q?=
 =?us-ascii?Q?epmzKnOKUYoLCgVMVm+PynyxWyZNWCps7CH9k7PD8pxaM4Ip91IdYpmbOAOT?=
 =?us-ascii?Q?D7rfItz8xY+kGeui8BFI4fnyetUoTlFbciRzsLfYWWElTRI9f6wUBslrJzwU?=
 =?us-ascii?Q?Uo4zS+C2dSDc4FhT66RhnetLkxgJ7/0SDxswuYp9LhIdUJIxADCyB4qVayMO?=
 =?us-ascii?Q?y039m+qovPXGNkmuuKYskWghSpi8cleo/YnOoFkLodpjnDn8yB2F9w/4WnG3?=
 =?us-ascii?Q?ccX6eRLv3SHFqlB+O4G9x7hGtaZR0uhj2oN3+PY+ieWpXCdzzp+tO9/y3Qz7?=
 =?us-ascii?Q?XbZEn/HyeGJ7s+pOm0cpV5lfIVwstmz9J/fda2jrpSH6d1xaev0KSIKG0zjW?=
 =?us-ascii?Q?q/vEWtTg19ZKCurkaUnnqyAYJW7hKoxiP2yOjvGgRUrUoAUC/BqvJRP19Wvl?=
 =?us-ascii?Q?u9q6tQO+LV4Nkn7g/cToIwOEKHwTaEpw8hVNb53+adiJtIgPC66a5Iib07Cx?=
 =?us-ascii?Q?Uw+gNiq1VBfLpH9xe4WkImFYv9eFLHeuD08psAvEEoX6q7JJFtChaBnCLV8K?=
 =?us-ascii?Q?KjiYS70Md+WtJhSQCfSfxijVrnQTvk0zA+7QJyIAcKl1B8W3dBPDYpc3E9Vp?=
 =?us-ascii?Q?aUUaS/EgCFw/lOJ4Jli3qhbV6MWfxFIyYrx9hR66rrD2rm40p1CKjiFm0ztC?=
 =?us-ascii?Q?ekvyApVefaJOqNXtN1CVSlcKQsqCzW1EDUWvNQoH/XV7RQd4a2DE/G6fHFjX?=
 =?us-ascii?Q?SOiGl5vtgBgVJJZhrnacdCvX2tM8JVyyhZdae8v0eT2OGV5POoeu7E55mnYh?=
 =?us-ascii?Q?l3/U3/Kf3+KJxXDSglozwjXs0QxzoVVZj+/yRXRgqAonk0/NdafqpJtLtBQG?=
 =?us-ascii?Q?YIsd/wQyikUaIpj1r/mGYZeIY9Tk1KwBAU8V2Fd9o5RV4YSBzblnmiAEc71T?=
 =?us-ascii?Q?0F3rc+PL4udxAm+T7c6JTpht5CsEBZJPnFv/FF6WD2D+4kC9kfBFXrB6IcPL?=
 =?us-ascii?Q?/05FMppsbLLxze+qfF6pPzR1BR2V3dFLeaGSxVXOJRExWAP/UekXff9f7UjX?=
 =?us-ascii?Q?fPWZ+xbaKhSWvNWpxx7iepy6HOxvYIVYuQfREJfMIx4HwY6XUL8w8YFlSw1G?=
 =?us-ascii?Q?3JstBNHxQHCT2s6oKchkhnsjjizgTYw9s8E1gx151gRCwGUovp8e85OJnR6W?=
 =?us-ascii?Q?JzDs8fSFzlk0667zBb+5obNTPgP5QL4sS+7sRvVlDFyeCFMJ6SpuLpv7Whzd?=
 =?us-ascii?Q?X27YkMeBTAaJMjwlDCkN9fZmSMefu/fpLanr0pkTySATyz+XXvTpfD0uwd4B?=
 =?us-ascii?Q?KiOkSbzinsmRwLgGT9RmE4ZFkFGau8oK8WCrYqxY2S4l8wwv1NCo7i5V2C/j?=
 =?us-ascii?Q?uB+BCk6+XuNcybQSvND6bVhp6nThJfeXgUQh4rb4M0F1mUD1q5AejuZh50La?=
 =?us-ascii?Q?xwj1cs9XrfVSey0crqsBu+x+oeF3eJzbMrIQNhTd?=
X-OriginatorOrg: vivo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 14d3cdba-a721-4d2d-5a0e-08dafb6e1531
X-MS-Exchange-CrossTenant-AuthSource: SEZPR06MB5269.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Jan 2023 05:12:24.8594 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 923e42dc-48d5-4cbe-b582-1a797a6412ed
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: wWao6zwkOyVyj/t6gP7HFHoP01QyPseeDM3pnbNw8/rvJc61z2BTF8ENkkhIwILNM8e98IfOoR56Z1MOhsI8eg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYZPR06MB3885
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: Add a ipu_mode sysfs node to show the current ipu policy as
 a string. Since we use ipu_policy as a bitmap, and the bitmap API parameter
 is unsigned long type data, let's change ipu_policy to unsigned [...] 
 Content analysis details:   (-0.2 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [40.107.117.109 listed in wl.mailspike.net]
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
 no trust [40.107.117.109 listed in list.dnswl.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.0 SPF_HELO_PASS          SPF: HELO matches SPF record
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
X-Headers-End: 1pJ6BF-0004FR-Hq
Subject: [f2fs-dev] [PATCH v2 4/5] f2fs: introduce ipu_mode sysfs node
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

Add a ipu_mode sysfs node to show the current ipu policy as a string.
Since we use ipu_policy as a bitmap, and the bitmap API parameter is
unsigned long type data, let's change ipu_policy to unsigned long type.

Signed-off-by: Yangtao Li <frank.li@vivo.com>
---
v2:
-remove type conversion in sbi_store() 
-convert old_ipu_policy to unsigned long
 Documentation/ABI/testing/sysfs-fs-f2fs |  6 ++++++
 fs/f2fs/f2fs.h                          |  4 ++--
 fs/f2fs/segment.h                       |  1 +
 fs/f2fs/super.c                         |  3 +--
 fs/f2fs/sysfs.c                         | 28 ++++++++++++++++++++++++-
 5 files changed, 37 insertions(+), 5 deletions(-)

diff --git a/Documentation/ABI/testing/sysfs-fs-f2fs b/Documentation/ABI/testing/sysfs-fs-f2fs
index 0f17adc80488..64b15a28fe30 100644
--- a/Documentation/ABI/testing/sysfs-fs-f2fs
+++ b/Documentation/ABI/testing/sysfs-fs-f2fs
@@ -722,3 +722,9 @@ What:		/sys/fs/f2fs/<disk>/last_age_weight
 Date:		January 2023
 Contact:	"Ping Xiong" <xiongping1@xiaomi.com>
 Description:	When DATA SEPARATION is on, it controls the weight of last data block age.
+
+What:		/sys/fs/f2fs/<disk>/ipu_mode
+Date:		January 2023
+Contact:	"Yangtao Li" <frank.li@vivo.com>
+Description:	Show the current ipu policy as a string.
+		This is a read-only entry.
diff --git a/fs/f2fs/f2fs.h b/fs/f2fs/f2fs.h
index 9edad9ccc2cd..b221a3bdb3fe 100644
--- a/fs/f2fs/f2fs.h
+++ b/fs/f2fs/f2fs.h
@@ -1071,7 +1071,7 @@ struct f2fs_sm_info {
 
 	struct list_head sit_entry_set;	/* sit entry set list */
 
-	unsigned int ipu_policy;	/* in-place-update policy */
+	unsigned long ipu_policy;	/* in-place-update policy */
 	unsigned int min_ipu_util;	/* in-place-update threshold */
 	unsigned int min_fsync_blocks;	/* threshold for fsync */
 	unsigned int min_seq_blocks;	/* threshold for sequential blocks */
@@ -1323,7 +1323,7 @@ enum {
 	MAX_TIME,
 };
 
-/* Note that you need to keep synchronization with this gc_mode_names array */
+/* Modification on enum should be synchronized with gc_mode_names array */
 enum {
 	GC_NORMAL,
 	GC_IDLE_CB,
diff --git a/fs/f2fs/segment.h b/fs/f2fs/segment.h
index 2cbc24f64a5f..7d98ba537241 100644
--- a/fs/f2fs/segment.h
+++ b/fs/f2fs/segment.h
@@ -672,6 +672,7 @@ static inline int utilization(struct f2fs_sb_info *sbi)
 
 #define F2FS_IPU_DISABLE 0
 
+/* Modification on enum should be synchronized with ipu_mode_names array */
 enum {
 	F2FS_IPU_FORCE,
 	F2FS_IPU_SSR,
diff --git a/fs/f2fs/super.c b/fs/f2fs/super.c
index 1d2796863f8c..ed4a0a721116 100644
--- a/fs/f2fs/super.c
+++ b/fs/f2fs/super.c
@@ -2155,8 +2155,7 @@ static int f2fs_remount(struct super_block *sb, int *flags, char *data)
 {
 	struct f2fs_sb_info *sbi = F2FS_SB(sb);
 	struct f2fs_mount_info org_mount_opt;
-	unsigned long old_sb_flags;
-	unsigned int old_ipu_policy;
+	unsigned long old_sb_flags, old_ipu_policy;
 	int err;
 	bool need_restart_gc = false, need_stop_gc = false;
 	bool need_restart_ckpt = false, need_stop_ckpt = false;
diff --git a/fs/f2fs/sysfs.c b/fs/f2fs/sysfs.c
index 576e6416ffb9..15e9921dcb01 100644
--- a/fs/f2fs/sysfs.c
+++ b/fs/f2fs/sysfs.c
@@ -51,6 +51,17 @@ static const char *gc_mode_names[MAX_GC_MODE] = {
 	"GC_URGENT_MID"
 };
 
+static const char *ipu_mode_names[F2FS_IPU_MAX] = {
+	"FORCE",
+	"SSR",
+	"UTIL",
+	"SSR_UTIL",
+	"FSYNC",
+	"ASYNC",
+	"NOCACHE",
+	"HONOR_OPU_WRITE",
+};
+
 struct f2fs_attr {
 	struct attribute attr;
 	ssize_t (*show)(struct f2fs_attr *a, struct f2fs_sb_info *sbi, char *buf);
@@ -149,6 +160,19 @@ static ssize_t gc_mode_show(struct f2fs_attr *a,
 	return sysfs_emit(buf, "%s\n", gc_mode_names[sbi->gc_mode]);
 }
 
+static ssize_t ipu_mode_show(struct f2fs_attr *a,
+		struct f2fs_sb_info *sbi, char *buf)
+{
+	int len = 0, i = 0;
+
+	if (SM_I(sbi)->ipu_policy == F2FS_IPU_DISABLE)
+		return sysfs_emit(buf, "DISABLE\n");
+
+	for_each_set_bit(i, &SM_I(sbi)->ipu_policy, F2FS_IPU_MAX)
+		len += scnprintf(buf + len, PAGE_SIZE - len, "%s\n", ipu_mode_names[i]);
+	return len;
+}
+
 static ssize_t features_show(struct f2fs_attr *a,
 		struct f2fs_sb_info *sbi, char *buf)
 {
@@ -711,7 +735,7 @@ static ssize_t __sbi_store(struct f2fs_attr *a,
 			return -EINVAL;
 		if (t >= BIT(F2FS_IPU_MAX))
 			return -EINVAL;
-		SM_I(sbi)->ipu_policy = (unsigned int)t;
+		SM_I(sbi)->ipu_policy = t;
 		return count;
 	}
 
@@ -907,6 +931,7 @@ F2FS_GENERAL_RO_ATTR(mounted_time_sec);
 F2FS_GENERAL_RO_ATTR(main_blkaddr);
 F2FS_GENERAL_RO_ATTR(pending_discard);
 F2FS_GENERAL_RO_ATTR(gc_mode);
+F2FS_GENERAL_RO_ATTR(ipu_mode);
 #ifdef CONFIG_F2FS_STAT_FS
 F2FS_STAT_ATTR(STAT_INFO, f2fs_stat_info, cp_foreground_calls, cp_count);
 F2FS_STAT_ATTR(STAT_INFO, f2fs_stat_info, cp_background_calls, bg_cp_count);
@@ -997,6 +1022,7 @@ static struct attribute *f2fs_attrs[] = {
 	ATTR_LIST(max_ordered_discard),
 	ATTR_LIST(pending_discard),
 	ATTR_LIST(gc_mode),
+	ATTR_LIST(ipu_mode),
 	ATTR_LIST(ipu_policy),
 	ATTR_LIST(min_ipu_util),
 	ATTR_LIST(min_fsync_blocks),
-- 
2.25.1



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
