Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F94D719017
	for <lists+linux-f2fs-devel@lfdr.de>; Thu,  1 Jun 2023 03:38:37 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1q4XGp-0001Ap-Ju;
	Thu, 01 Jun 2023 01:38:31 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <bo.wu@vivo.com>) id 1q4XGm-0001AZ-Pt
 for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 01 Jun 2023 01:38:29 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=MIME-Version:Content-Type:Content-Transfer-Encoding
 :Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=1+xDjwK/G5Ell5goJsjITLwZleVeL666IQ0nhhzjTmQ=; b=FtEyQVH9FK+gqkyQjUOTGz/NwT
 oObPzi+YXsuoS4F4TcVuqfU16NLdEN5D3elC2Vc16dRNlnRbxl/I3MEWaAPh2AwYh9yvZKf51ntlg
 NHHQezxGaGa0AJEoMZCaFuh16bUNwHHbvvwrAmpxKfkpkgkW0Og+gYNUIMicmMXl3qXQ=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:Date:
 Subject:Cc:To:From:Sender:Reply-To:Content-ID:Content-Description:Resent-Date
 :Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=1+xDjwK/G5Ell5goJsjITLwZleVeL666IQ0nhhzjTmQ=; b=K
 d7nrWraV1D51B4DboNUK5lFsrSpKqiJP7pqP61Ohrs6s/6n3md28te4C8bEMhdDuXY1IVKz+FcnuU
 0Hf43gd3WZdoUsjiqPaVW5C1FhYsRLMmYjaJm9QPjM0nGO7Qo4U3YuSBfvjmym3oUY0lzaEPDseuU
 QsC043ICoLZmgM5M=;
Received: from mail-psaapc01on2124.outbound.protection.outlook.com
 ([40.107.255.124] helo=APC01-PSA-obe.outbound.protection.outlook.com)
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1q4XGf-007v22-07 for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 01 Jun 2023 01:38:28 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Bpq4UpBY3i+TzfzeWcBGMtfLeHmi8IryazdDhxgwI4irb5i1ZG5ZxyZiHBBvoqVDEaKosQBpAdLfGkwez4cbM39RKT7lV6pU2XBGlIqvq/X2GbXGeVT6U4Cz1KODiObEFyOETbwTn2LK3gTAWUiOL+kWYfH4ZIWO9NlklFgtq5H2Xdvs4pBn4f2EQ0zHPDKSw/sNskrnxoXOvslNR40b03379zn+o8thn0lxXhau92j6E9kXRuXczI1s9FkObJq1nk1Pk3iB7csuFeIshh1LCotn4kcr1TK8G63hzsRN1+k3JrYPH8SlkGpYI624vfZiv3tBwZB1bm76HM5XOJgBDg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1+xDjwK/G5Ell5goJsjITLwZleVeL666IQ0nhhzjTmQ=;
 b=DIQ+ENCbypw29sqxDV2RJjpoFlwt7QlVmqFDgosu6TipsHNNQhp+wWiVBFRVemLHYSM83SRIoEIIEaKVTIT+iEibKW2q9EZeZcI3bAx4z6+G8x2K1cI3M08JdkXCBVztbd4Db3SJdfwtBn6aSKcsfV7GWPSzeFHdxEbUtAM19NXK/6NEBaWzoQZFPkkjksS86RYoCRlOAxAJxjyaDQnHW9q5NmPsm02zuFtQEnsmLh/6S5+nvQX9RnEmHLhYC0Z1ggz+GOCK12x+rlWtZSIOAllL2lkn9mzhL25u/AFhgvffcStUIInmFWvslP9uYY9G2SR9hgERNkM6srQi6DNa+g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vivo.com; dmarc=pass action=none header.from=vivo.com;
 dkim=pass header.d=vivo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vivo.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1+xDjwK/G5Ell5goJsjITLwZleVeL666IQ0nhhzjTmQ=;
 b=Fu+vJnmJmD3TAoOKATuLT9ZlRq7/JUdmbLQC53ASYUqkBTmOGP4F52v2mnFd3DxOXCp7k8cgKFdxVQd2a5PPQAOLnZZIIQjODfx5WNDN8+fhNRVnE6LjvWpTNj53DxU6nzp6jhPGmB09QV8Dd3Lw/V240yq/mAmnMX7n+cwtfPwRoVTHV6XBpe3vhK6EWNdNY4kB/ytWHb+zv03rvrm/+MJZ3ehSExgNe42yMtQLVHyDw+QQhptH/JWIapsvz5OM5FTJi6jRrTQyW6LZ/JCZNoqz3M/h6vky92cZYAJhFCF9D/jd7sSR6kOLmQsTD+yeAk7h4GhwXsHa9XtbRJDsdw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=vivo.com;
Received: from SL2PR06MB3017.apcprd06.prod.outlook.com (2603:1096:100:3a::16)
 by SEYPR06MB5645.apcprd06.prod.outlook.com (2603:1096:101:c2::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6455.22; Thu, 1 Jun
 2023 01:38:11 +0000
Received: from SL2PR06MB3017.apcprd06.prod.outlook.com
 ([fe80::a9b5:e147:e85a:96d5]) by SL2PR06MB3017.apcprd06.prod.outlook.com
 ([fe80::a9b5:e147:e85a:96d5%6]) with mapi id 15.20.6455.020; Thu, 1 Jun 2023
 01:38:11 +0000
To: Jaegeuk Kim <jaegeuk@kernel.org>,
	Chao Yu <chao@kernel.org>
Date: Thu,  1 Jun 2023 09:37:59 +0800
Message-Id: <20230601013759.75500-1-bo.wu@vivo.com>
X-Mailer: git-send-email 2.35.3
X-ClientProxiedBy: SG2PR04CA0156.apcprd04.prod.outlook.com (2603:1096:4::18)
 To SL2PR06MB3017.apcprd06.prod.outlook.com (2603:1096:100:3a::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SL2PR06MB3017:EE_|SEYPR06MB5645:EE_
X-MS-Office365-Filtering-Correlation-Id: d28b7ccc-e8b5-4bba-dd88-08db6240db36
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: D38IGCYG+B52zXqu0AC487yO5ibeY6sFqcDs7oW/MuSn9bqgEWiRtnttBZsEMVPx1EEdDyLMTpPLEryiz67E9oc79zq2bW/DZqamOQLqoiu6ykdpxqA0lYhacctqAWSK7T4zvHfz7vuuzEhar1Y/KLYAtdYlfOtq4+bYaEzUShg18dYj1jcsxoTmUrzA0p6UcrmhuiYie/Ep8MeTlsVVrP6xWZSpPCKz5+GIv7YvojOhRKEzuvAglYSk1AuOoy4CcydfK+e2CLmN7ez3K1gKeNJqVfHlbrUN2J9i3H0Jcq+CRXE0Y3BzLVGOXxmQhbrgb+IIWQFdMfIlWdX019laSqSoXYXY1oK36XC7aDwHOXGWBAQxRl/nIqmJ8pRKW7h/7kdNQqe60QiUIgpF1gBYhY17Cm0m5l+emnoI7TPLg0yHKRpXG3Ej/w1rpB4gpD7l4GJEDoMxDtkAjZ5IUiQ1k912apUM+kJ75975Ju/dlpaY/UR2EFh6kgUXMclnK0eLttsuOsKlyrc+cVStrbNTBBnoJxiDa9vhwUESLwl31iwlcMTwwRkxBQM3nbjpD0P4LMGeNovZHhxhJfbtoyC0Grg8nINpO4vXl4ZwfPidzJDLW7XUaGwPUJ4O3+TzXye9
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SL2PR06MB3017.apcprd06.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(4636009)(396003)(346002)(366004)(39860400002)(136003)(376002)(451199021)(8936002)(8676002)(5660300002)(186003)(478600001)(110136005)(52116002)(6486002)(41300700001)(6666004)(316002)(6512007)(6506007)(4326008)(1076003)(26005)(107886003)(66476007)(66946007)(66556008)(2616005)(2906002)(83380400001)(38350700002)(38100700002)(86362001)(36756003);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?HDo9W5zc6mJt5ud6KufUcGEr9YlSckh+p8/Boaq4zVG2smMAO9Lh3TsyVLo+?=
 =?us-ascii?Q?6aMLB5Zuz1PLpJaN36xLFzfILDqaY5QjPfNO8ns/WkXF8jF61dLNY7hx8aHp?=
 =?us-ascii?Q?keOd5hxYURnHOJdCUUjhoraFS3veRVK9e264eTZVs7DV7oroBHVQeZc+0SZK?=
 =?us-ascii?Q?UU9/xw0+sgn0l7MegBsieem6CeRbQn9yVKNSQ/ArLmMwkT/qIyhKQyJ93XuC?=
 =?us-ascii?Q?eqobDfk1mGyj9GuIzyrq6IV7f9+WLPL83iN60LM8e8RfnJTHWWlPSIV1VBNR?=
 =?us-ascii?Q?GMJud4oO0gRSm7BXdc7kV5jGvH82DepDCCxaXnAkQHaCq2AlQchc+IK0s4C8?=
 =?us-ascii?Q?aqEsMlEJlEC9Z6Y8+znNTBgr9AoGE3CDy6aI3KYV1rt/IrFtEPik8yY3GATs?=
 =?us-ascii?Q?tO0WzrPJkz5KeQyubin8bp5lhFIqAImtnqUIYzMjWW+H8XzurnFvRu+T8jrV?=
 =?us-ascii?Q?TZeksT0LPwEMpAmguAg2FhkUNtJ/eeSZrC6FzSGqPg6pVMAAX1heh/vxOOCw?=
 =?us-ascii?Q?xwZ/gMFXM5olhEE07O+8977M5wzFFnu0gnLkKv/e09jfM7j8NilI6umwJBF6?=
 =?us-ascii?Q?gW9Lltl+PnA6GegDriMvv1q9tfE6vGMBzrTCQwlyL0mvjetDC/9hSupXnxca?=
 =?us-ascii?Q?KxY4k6aZ7ZP+pFVODH/PkH0jkbbat9ALU27DY/DNxP+D/AdAOUgJfedQtE5O?=
 =?us-ascii?Q?fV1bP5P0SQR7gyWipQYHf1sAk2TpQ12xR0BCBRni5De4fZCQmjTXL3iWn+1J?=
 =?us-ascii?Q?LizuYtFOPaAoQ+Qk93Gx2/u4nI+dE3gOPxZDYFmJ2nOVBEyww2/vkSGD9O9g?=
 =?us-ascii?Q?8dWzaUV6NO6R5mkZSdRaPHjjIDTOV7/OX+Qn9EVBJxDOHrk1gbqwDYQeKtNn?=
 =?us-ascii?Q?nNTf0hfXclzEVn8llGuqHHgsg36sozNsIGULFLUMGzdzPMJQ6Fu6gdYmCkmD?=
 =?us-ascii?Q?tWkqmhrAJf5/qKhOoLhZKJQ9WDtKn7YGIEp+38NcmO+mfNYCqJmHkBPrjA8R?=
 =?us-ascii?Q?JjLeb1dh1MNOe+9Tvten44vvU0/XQ45XCc2MKKFDj1xQ0g4PSMiAPpevLAV0?=
 =?us-ascii?Q?I9+I9ISygHRTMXidDpN2El1c2wMfVE0AHmGPDc0BDTWoTW0Z2IH75P7ZYehY?=
 =?us-ascii?Q?CXWuU3dVQpGJwIwVkSUhuIi/wDck/x6CK+OeeR1wl+DKwR+gL/X/w2XF1H6O?=
 =?us-ascii?Q?cSQfpS54Mkg98nU7Q0N+vlg+ICT5Xl3eftwk0roP/7ntKPmH7TUReJlJt28j?=
 =?us-ascii?Q?a6rKAPt60F3UOPbCEopHkGvuYjhWjBXTbzsjfFG1SES1LUUOn5RRW2c68UT7?=
 =?us-ascii?Q?je8xzfI65NqGIcgnQhLpna3/tpMOfHgY9q58saHL7Vi4K9GXoskMw1BfLBuQ?=
 =?us-ascii?Q?DloZ9XI4w3W9amjgCt//H+0BQNKPKz9nRRQ8C/vSaUYpuIRNMkS8S1+ANAnM?=
 =?us-ascii?Q?fx1cn4LzJQ/2NqPmyi2LkwzVASiKxC8ViEMVcdyXVZCM1U1DD64so7jtxdsk?=
 =?us-ascii?Q?wbB7nQ9jVISU4S2TUWPGk7kNRz7KWm9uhEraw1WijCtz1Sa1BDmiERRH0+AR?=
 =?us-ascii?Q?lrzrn0dZqg3JMI6PWe28aHEsLm1MLDDBAuI8jcua?=
X-OriginatorOrg: vivo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d28b7ccc-e8b5-4bba-dd88-08db6240db36
X-MS-Exchange-CrossTenant-AuthSource: SL2PR06MB3017.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Jun 2023 01:38:10.5433 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 923e42dc-48d5-4cbe-b582-1a797a6412ed
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 4T5eeC7vEkX34E+cMzWptOQowqg+p+a8Zu7DGec4tWXwkI5qSH5pZ5y4PsGIO9n9fqTE6lhKEoNzUdkI7mHpSw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SEYPR06MB5645
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: The NULL return of 'd_splice_alias' dosen't mean error. Thus
 the successful case will also return NULL, which makes the tracepoint always
 print 'err=-ENOENT'. And the different cases of 'new' & 'err' are list as
 following: 1) dentry exists: err(0) with new(NULL) --> dentry, err=0 2) dentry
 exists: err(0) with new(VALID) --> new, err=0 3) dentry exists: err( [...]
 Content analysis details:   (-0.2 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
 no trust [40.107.255.124 listed in list.dnswl.org]
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [40.107.255.124 listed in wl.mailspike.net]
 -0.0 SPF_HELO_PASS          SPF: HELO matches SPF record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid -0.0 T_SCC_BODY_TEXT_LINE   No description available.
X-Headers-End: 1q4XGf-007v22-07
Subject: [f2fs-dev] [PATCH v3 1/1] f2fs: fix args passed to
 trace_f2fs_lookup_end
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
From: Wu Bo via Linux-f2fs-devel <linux-f2fs-devel@lists.sourceforge.net>
Reply-To: Wu Bo <bo.wu@vivo.com>
Cc: wubo.oduw@gmail.com, linux-kernel@vger.kernel.org, Wu Bo <bo.wu@vivo.com>,
 linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

The NULL return of 'd_splice_alias' dosen't mean error. Thus the
successful case will also return NULL, which makes the tracepoint always
print 'err=-ENOENT'.

And the different cases of 'new' & 'err' are list as following:
1) dentry exists: err(0) with new(NULL) --> dentry, err=0
2) dentry exists: err(0) with new(VALID) --> new, err=0
3) dentry exists: err(0) with new(ERR) --> dentry, err=ERR
4) no dentry exists: err(-ENOENT) with new(NULL) --> dentry, err=-ENOENT
5) no dentry exists: err(-ENOENT) with new(VALID) --> new, err=-ENOENT
6) no dentry exists: err(-ENOENT) with new(ERR) --> dentry, err=ERR

Signed-off-by: Wu Bo <bo.wu@vivo.com>
---
 fs/f2fs/namei.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/fs/f2fs/namei.c b/fs/f2fs/namei.c
index 77a71276ecb1..3e35eb7dbb8f 100644
--- a/fs/f2fs/namei.c
+++ b/fs/f2fs/namei.c
@@ -576,8 +576,8 @@ static struct dentry *f2fs_lookup(struct inode *dir, struct dentry *dentry,
 	}
 #endif
 	new = d_splice_alias(inode, dentry);
-	err = PTR_ERR_OR_ZERO(new);
-	trace_f2fs_lookup_end(dir, dentry, ino, !new ? -ENOENT : err);
+	trace_f2fs_lookup_end(dir, !IS_ERR_OR_NULL(new) ? new : dentry,
+				ino, IS_ERR(new) ? PTR_ERR(new) : err);
 	return new;
 out_iput:
 	iput(inode);
-- 
2.35.3



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
