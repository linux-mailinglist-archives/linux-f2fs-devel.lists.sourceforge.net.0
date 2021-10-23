Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id A1B124381F9
	for <lists+linux-f2fs-devel@lfdr.de>; Sat, 23 Oct 2021 07:32:17 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.92.3)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1me9dc-0000Ew-55; Sat, 23 Oct 2021 05:32:12 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.3)
 (envelope-from <changfengnan@vivo.com>) id 1me9da-0000En-JZ
 for linux-f2fs-devel@lists.sourceforge.net; Sat, 23 Oct 2021 05:32:10 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=MIME-Version:Content-Type:Content-Transfer-Encoding
 :Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=o5mSv1CR7o5X2VkevvLaW3KclgkIM6yqfXcnjFA87gw=; b=YbONb42E8mt/IrR1mKjWRgHp+g
 DDxK0e4AUAWMLo+9qYOxDgTw9uHfbtWYRSnzlSg3p2mfBVILSCl8d6GXhWGikF0MIpwveYCy7GCxD
 Pbr/8gih9Bie1Mj5lXH04wll/NzU57x95EhDcQn1q5tdG8AeCsNZk/Nw7euPKx7DqpsM=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:Date:
 Subject:Cc:To:From:Sender:Reply-To:Content-ID:Content-Description:Resent-Date
 :Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=o5mSv1CR7o5X2VkevvLaW3KclgkIM6yqfXcnjFA87gw=; b=I
 fgS7MNdDBTag/BK3vAdS0cAVzQM6++H/AojXDI+htmYqZ49Asu40rpgOvUL9HX3+ky6a48qrhFiYF
 pw6+GS9hMgjKnyGkMTaWEkiEiEqHyDlBBo+y8s0oN03q6YZrEhWpq9Jrw0WjY5R4ZYnLQTNSB5d9P
 1XlUeVCTRkuH4Grg=;
Received: from mail-eopbgr1300121.outbound.protection.outlook.com
 ([40.107.130.121] helo=APC01-HK2-obe.outbound.protection.outlook.com)
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.3)
 id 1me9dV-00Cpq6-Ed
 for linux-f2fs-devel@lists.sourceforge.net; Sat, 23 Oct 2021 05:32:10 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=DCMT13tQHaAV6oLeKsrg0CWZcq4UyOaqpfE6/QxiH7eLD2aDbY9lJYi72w+KhZp2HwVj28OxNK9+Vi+drvIz7I5Ll3cHqT3VHzPWVoBWBz6cAMPnUUfIQCCXa/Mkjg/X693GhvvuSwuNeTBGe+14XLFohzo03srJtgng3W6T1lTejddu/iClbNi0rvv7PUge0yZI6oaK4SOSwc41osiNsAUUADdLgdf3DSHkwl5OK2uVMSkr0fHoGWMKLDoS4M0vGeG302Kz9PTP3HMgC0TyX44LCPv7RUIE6QQ01Ujy82ZCRob7/QokcVBVHrDo6UY0ZvOD/3Pj/ZK87iPikRPPxw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=o5mSv1CR7o5X2VkevvLaW3KclgkIM6yqfXcnjFA87gw=;
 b=NWwCfi83Fs+Yh/77OKs6D2EMhbrbxSNVEpV277qTSneRdo6dp3QRIhfufc1+n+8fq5zP7xDL+NrmPVQKzurB+gUwVBr/vn80hswQJ5g/olcTU4MXFM4Seew0G4Xz8I/PhYw+q3DHh2pnWRTb2HB6ZTv8ftSjVdwaXzjg4dP5uf2ghxJsDjUM2pggepbkBdH7L8lOEDLHiRyCkFGWypCG7/3NR7Ryl5wpqx0NF+jPk8V1MTO1/51o999XGpOBdLRKBcjdwZ4RNuPAoWLUxQaSkppopZDedYGJobFGwf77UaJ+1S+iF1N2xJM8XlbaiJso4w6srkiuC4oJDxLdQVqyuw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vivo.com; dmarc=pass action=none header.from=vivo.com;
 dkim=pass header.d=vivo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vivo0.onmicrosoft.com; 
 s=selector2-vivo0-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=o5mSv1CR7o5X2VkevvLaW3KclgkIM6yqfXcnjFA87gw=;
 b=Zpf1Y7gbcaSCGPLsGZcnxh7imsFYZljul8y6sR6mXiYcLYs4/tBhygeLm1uCYqoPZXZqQwcLuByfMefvLAUNNZxnOQi73f27OY20UJXADm5QtaPH9ePJFPLev8gWootJbgzFjg7CMzIz5mFIkWuBqJTZ8huYnY0zSWVJ9NUp2RA=
Authentication-Results: kernel.org; dkim=none (message not signed)
 header.d=none;kernel.org; dmarc=none action=none header.from=vivo.com;
Received: from TYZPR06MB4014.apcprd06.prod.outlook.com (2603:1096:400:7::14)
 by TY2PR06MB2448.apcprd06.prod.outlook.com (2603:1096:404:4d::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4628.16; Sat, 23 Oct
 2021 02:58:42 +0000
Received: from TYZPR06MB4014.apcprd06.prod.outlook.com
 ([fe80::58f6:5881:f1d5:f1b1]) by TYZPR06MB4014.apcprd06.prod.outlook.com
 ([fe80::58f6:5881:f1d5:f1b1%5]) with mapi id 15.20.4628.018; Sat, 23 Oct 2021
 02:58:42 +0000
From: Fengnan Chang <changfengnan@vivo.com>
To: jaegeuk@kernel.org,
	chao@kernel.org,
	corbet@lwn.net
Date: Sat, 23 Oct 2021 10:58:33 +0800
Message-Id: <20211023025833.216030-1-changfengnan@vivo.com>
X-Mailer: git-send-email 2.32.0
X-ClientProxiedBy: HK2PR02CA0207.apcprd02.prod.outlook.com
 (2603:1096:201:20::19) To TYZPR06MB4014.apcprd06.prod.outlook.com
 (2603:1096:400:7::14)
MIME-Version: 1.0
Received: from comdg01144017.vivo.xyz (203.90.234.88) by
 HK2PR02CA0207.apcprd02.prod.outlook.com (2603:1096:201:20::19) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id
 15.20.4628.16 via Frontend Transport; Sat, 23 Oct 2021 02:58:41 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: c94ede08-5003-4125-ef27-08d995d1053f
X-MS-TrafficTypeDiagnostic: TY2PR06MB2448:
X-Microsoft-Antispam-PRVS: <TY2PR06MB2448E6770EEDB61A3E0914AABB819@TY2PR06MB2448.apcprd06.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:854;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: +KDc3Ef4bue8cVxnBahiuw+5M324eY5FUkgM2dwYQFLr9qgv77EspN3uN6pZbc0DDFRr7jn+zvzkyA5Wyga7XW6cZ9WZYqcnGPgg/VQg15I+Fi91y8VuMLEWd+NjIVlpKl4Iz+Am68URLHgn9uHNcXqrFbN+j1CYsj4ZQpVWGZKFQRatReD2ffiRahOCJVIsulAnDg3+8qMAhV1L0CzhyA9dKR+I5dxiQi61QlYPVLfmVTpMdbA+DCsPWTgFJMB52DAM4DQNSxQwBOl+SSlLsv5LqtSgKv3patYMM9H8Tl1YvQi8IlLc93DwXNsv6ZZtoWDKXppjl6d1a0HSeeCwdQ+blt5+FDl9kEQonZvNJ5zqqmpy9Okt+cvmAr8IOfmzZLCHnn7VOvWWTafVNfkUANonsF114JW+jCN/6et2jvlL9y/cuceE+nZebNi84Bpj3R5kdOSGTXYrsJE7xPHCfqYtXl3VnjeLafJJYdB60HQnN3EacZ7W5TT3epPlNvmfBwnXDf2BhVl9LQOV17NIHE9nU9BjNeQbHja+QQ03moL1Q4rcDdopSai2oalna5+kb5/W2FDUrvBhInKXxO/3Yae84m+8D5m236cOpK0+N5UwOGKxB3caf/pQaZNYvgMtBf07ygLf7uMsfu+1kvvLhbV5WSsBIDlP7mXfZMHOrCekWlwIqOe5Tep1JcG7/Dfh01jPKvTdwpSYhO9SHPolrO/UU+yUxchhQ3Padpab02M=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:TYZPR06MB4014.apcprd06.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(6666004)(5660300002)(6506007)(1076003)(36756003)(508600001)(26005)(8936002)(4326008)(6512007)(52116002)(956004)(2906002)(316002)(83380400001)(38100700002)(2616005)(186003)(8676002)(66476007)(66946007)(66556008)(6486002)(107886003)(86362001)(38350700002)(4730100017);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?lNL+UzTmmI3j7GCUk1199qSxVBr2BUy6+HYmR/YntCaAZTtgPpXvMh17CKrb?=
 =?us-ascii?Q?gGlZFFkj3GfL1IyQkCt42a+j18+JScFTQNYLjyRyzzBmArtiol6Fok2ewqlH?=
 =?us-ascii?Q?2/fnhC96jG1LBqe9lmCXKTcC4jXsX3cuqO7gTITlMc7zt+BOMAlzRD8ek54V?=
 =?us-ascii?Q?2C52yPSBJfwFBf8xaidFhK2JHG67cbwihOIjKJs+Qf9P++AGjwQxciPeZv4z?=
 =?us-ascii?Q?5OBu2/2rgCG16aUQMrh4NY60nVQ0ZEGnTQbNXZPysPMIDsv3WOBEQN/ppQyR?=
 =?us-ascii?Q?H12TSlwXVYyLr/Ge+CIfFARTPXOsJSq8uruRs6qVElYQB2ANXdyQyJvYvug5?=
 =?us-ascii?Q?gaQx/Bu/CrhuLCe2cVhefG4/dzRsvJZdVF7y9kKI2skDXmZ9qYNbS/jfZXqE?=
 =?us-ascii?Q?Uf5msC4XLOCrmqVpRMLPar79ZMeoQmBD0vb8C91WiQuyC0MbDfqVqCNBopzk?=
 =?us-ascii?Q?MGVQgHWOOgqDACGLuRJdCffzitehdUYcEYoov01QFNBxj9Gcas24ehcMC6/V?=
 =?us-ascii?Q?Nj7jchO/85lYCNoqJq3EHBzFT1zXOtWPFkCneFIE6kdE/PYfZ7pjc44xovZ/?=
 =?us-ascii?Q?94L8Eic+QOo+Ho+aWCG/sg7Nmc4WJYOjeWMf0NvC0tEZ9dZCP64uLgfO47rp?=
 =?us-ascii?Q?MyjwBBELEbqOuTstYzc66wOZe6LubVf+c3q7JcqGW3l7aQSXB3n9/bxqJpFb?=
 =?us-ascii?Q?LYqfaKno0Q0CbSggIWW8Sv/dVyCLW3uoWtkFOP0Ai0cl8m5mp20jbzZOJAHd?=
 =?us-ascii?Q?/Iq6ELfvZGvTarFcWRe7QnqWQ+5MazgCJEtstoDiLsnhpjAWspEXgQW95Zlt?=
 =?us-ascii?Q?klApcjG4wn9CpzBIBSZetzJlgsUvMcgD5EzJIZFw3rZjYoII/5+mHzg0Bd15?=
 =?us-ascii?Q?uxC0kIN0/8VoR4FPqU5MMzm7lA5+5JEoYpc7yLYSojAJtF2T59LXPq8ERnfA?=
 =?us-ascii?Q?bXYPSHBCmYC+R98PS16tFn8pBISCrSNzHxdMf6R6jvhdiox7d3anq+Nc1R/a?=
 =?us-ascii?Q?kDXmx/ONcLkg5/YTMODx8dhtPMSSU5gWDPEaxmxtOPSW+GnEQj5Kc6ETE5Qj?=
 =?us-ascii?Q?HYWV9kejMUXwz2a5sbnn/s3bO+wVd+YT0CEdp5uiFIWZPFxOpiThM/HiimMg?=
 =?us-ascii?Q?Ph1rc01WaIPWWlH8T2PmfnPs/jOAKSXQZiWlRrkKEXfMobnvBDUzHAwwTChV?=
 =?us-ascii?Q?V5KMc2vn6xij2tgt2HSRMgYBaRA0qV6gzOuABPgOfmCSl3gxN0V59kZlDHNc?=
 =?us-ascii?Q?jHSDt4MBOLwqevr2Uku+VJ924Ixj+wZVbxFcCj8c6leG0wn2cT0HV/IzuIdP?=
 =?us-ascii?Q?W3uGUZ3FNgBlib3LHgRtyr/en3i/6zf81uL9Wkeab2luOJ9Wx10gAoHaz510?=
 =?us-ascii?Q?8BtipCz7f77CBgXBs94wRyrIVMXIxQMriwyf/m2BER9AmVVKM89aTbDwYFdE?=
 =?us-ascii?Q?WrHN/PqOBhzvw7l6JX1VLJEEH/lgIKNZie6au09O3V4B1m98UJW1Fa4okI3s?=
 =?us-ascii?Q?49O+GeoDOX3CIfR0TYHv/3y5j1dVgsQLSMzi4yaaSJPiZh8WHlaugv8LvYzv?=
 =?us-ascii?Q?KsR93h8TvTZPWyHqheiVXusARpMZVpjhY1X/tUnxmUnP/kGxSiICwfDKvH6n?=
 =?us-ascii?Q?kyunDH7DMCtAPYT1201BD5E=3D?=
X-OriginatorOrg: vivo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c94ede08-5003-4125-ef27-08d995d1053f
X-MS-Exchange-CrossTenant-AuthSource: TYZPR06MB4014.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Oct 2021 02:58:41.9908 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 923e42dc-48d5-4cbe-b582-1a797a6412ed
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: R/e8okVKohOpZXx4a3e/iyfyTJJa/3DKq5EQV2tgT5mdUT6yNsWeam6j0mgP/3VwSfGTqrnzFZcf2p0S7TJOvg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY2PR06MB2448
X-Spam-Score: -0.0 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: fix f2fs.rst build warning. Fixes: 151b1982be5d (f2fs:
 compress:
 add nocompress extensions support) Signed-off-by: Fengnan Chang
 <changfengnan@vivo.com>
 --- Documentation/filesystems/f2fs.rst | 2 +- 1 file changed, 1 insertion(+
 [...] Content analysis details:   (-0.0 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
 no trust [40.107.130.121 listed in list.dnswl.org]
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [40.107.130.121 listed in wl.mailspike.net]
 -0.0 SPF_HELO_PASS          SPF: HELO matches SPF record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid 0.0 MSGID_FROM_MTA_HEADER  Message-Id was added by a relay
X-Headers-End: 1me9dV-00Cpq6-Ed
Subject: [f2fs-dev] [PATCH] f2fs: fix f2fs.rst build warning
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
Cc: linux-doc@vger.kernel.org, Fengnan Chang <changfengnan@vivo.com>,
 linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

fix f2fs.rst build warning.

Fixes: 151b1982be5d (f2fs: compress: add nocompress extensions support)
Signed-off-by: Fengnan Chang <changfengnan@vivo.com>
---
 Documentation/filesystems/f2fs.rst | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/filesystems/f2fs.rst b/Documentation/filesystems/f2fs.rst
index 4294db649fa8..6ee2be259f46 100644
--- a/Documentation/filesystems/f2fs.rst
+++ b/Documentation/filesystems/f2fs.rst
@@ -301,7 +301,7 @@ compress_extension=%s	 Support adding specified extension, so that f2fs can enab
 			 For other files, we can still enable compression via ioctl.
 			 Note that, there is one reserved special extension '*', it
 			 can be set to enable compression for all files.
-nocompress_extension=%s	   Support adding specified extension, so that f2fs can disable
+nocompress_extension=%s	 Support adding specified extension, so that f2fs can disable
 			 compression on those corresponding files, just contrary to compression extension.
 			 If you know exactly which files cannot be compressed, you can use this.
 			 The same extension name can't appear in both compress and nocompress
-- 
2.25.1



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
