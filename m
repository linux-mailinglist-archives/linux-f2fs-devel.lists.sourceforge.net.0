Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 5910460C245
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 25 Oct 2022 05:32:44 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1onAgB-00089j-Ua;
	Tue, 25 Oct 2022 03:32:39 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <frank.li@vivo.com>) id 1onAg9-00089c-Ta
 for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 25 Oct 2022 03:32:38 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=MIME-Version:Content-Type:Content-Transfer-Encoding
 :Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=cj4zTZ3macccWiiLacYAjItM7uG6VtYsyYX9GCHIlfA=; b=BnfxG30mXcGlpdP7TIyYxDmiBo
 8opYFQ3dQCgl0yN4bFv+7O+6jciRRrzGwX16XKPEVh+xX3Ny3/+cEgy3d/gf+zDI01MCZ8Dklt312
 TOoybL1g/CtqkzgmcqMeRUO+yvSfHmL3Tbsz4u8FJ7rOB2TRycq9H6nirhXjTEMAJ5bg=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:Date:
 Subject:Cc:To:From:Sender:Reply-To:Content-ID:Content-Description:Resent-Date
 :Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=cj4zTZ3macccWiiLacYAjItM7uG6VtYsyYX9GCHIlfA=; b=k
 3imKI2wxg78cObC+6W/bqD6yDd0t1/ev53Rh55kg7Hfi2S/V5QD1vTSatww5NjwvwcrpR8Q0a7ysV
 OBElJ3IBYc2OVyJuF4CTBAJ8eW5tMeXHLQRoV0woh+DiPFRs0jUH3NSKbCfOxnbNA0A+87HxPgZWO
 hP1yuWdkjXFfC42c=;
Received: from mail-tyzapc01on2138.outbound.protection.outlook.com
 ([40.107.117.138] helo=APC01-TYZ-obe.outbound.protection.outlook.com)
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1onAg9-00GKtl-5x for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 25 Oct 2022 03:32:37 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=mMGBG+k0sVOH3aBpjAjS+Tlq5PHcqXaXiMjWnLr2mDJPrzT31Soe0CA9OaLt8M6oUP5rRDfPaj+fmrDeg27zFZidj8ufZ+T1ymjoDotp+BvsAchGRK/xnBAYhXQNlgvOJmmyW7/gO11jqdmYhShTJR1s7yi+cjXI7dQPjLjN9+BwBIOUjcRDXOa8Cpacv0oMml7DBXnKxluaWHs91Eh50lImBPCc/WMfCOXv/D0PHSTbTBuo6P5S0FZdBUF6Ok8i3du2eNsj/VO7stxs+MPN7H1xI5nXhzfvI12tw55S+Gf9FOSkjcmXreN4o99SjrVovVdjbOGSIwE+3b0N6Ha9/g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=cj4zTZ3macccWiiLacYAjItM7uG6VtYsyYX9GCHIlfA=;
 b=ajE5z5ZF9fmU87Bsjx1zcvEG59r7NePndK9nK/XQ/xO2NuJhuoqVZVa7QwlDLd/GZHi8ZVA/HWef3JQ6dwm+SFApRpJSg+xpsMgWE/55XxVcHqAu5gpsQBMs6y9hotf3D34fee4t2Pbk7O1RrIChH4lBYA5hJcVkMGSjMKQLRn5xd+nKf/8N4EadmK7fX2QmyiVl04Jhb6FzmQJXOnbrdXmaqZkLzQhtrh+Qcm8jbdO8Mko9eM4IcgbFI63MZyBWXpVoXrv83vK1WgyQIbJAB4bXgKML9N4EusHBF8paUIXifnHzcPQuCmtMEq6lAvqQy8VUcBsnnc84k1TfpvUOqQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vivo.com; dmarc=pass action=none header.from=vivo.com;
 dkim=pass header.d=vivo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vivo.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cj4zTZ3macccWiiLacYAjItM7uG6VtYsyYX9GCHIlfA=;
 b=SHuHbSu3owuYn2srCGEVacQ4HZcajEfBO6uWse7Ynu8ob2AseGq++MUljO+I5ai8ojXXMjnFljWPYg9hJafOjT1eApgkeH7nEU0ixU+RhdlnnzOKce10BYdLXwuYvhKQ2mqPRkV4CJcCinjT+EnNifqBBE6WE4TBA4Lu7k4j8pnrLZTyn2GfDYdyvoK6yX10izY1VtkZH/qAqR3Q9y5QqBAf0GPElJxy9TA5pg8t2wgBIMqWy+sa0M/wbEOv4vOc3+D167cOQlQIgRjP1U8LWi9ZbXylT9I/V3q7gHD00T7D52tD3ZImeA+GgP5rq8GxZLbDwFEJg7Xmg320QheBuw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=vivo.com;
Received: from SEZPR06MB5269.apcprd06.prod.outlook.com (2603:1096:101:78::6)
 by TYZPR06MB4079.apcprd06.prod.outlook.com (2603:1096:400:7::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5746.28; Tue, 25 Oct
 2022 03:32:28 +0000
Received: from SEZPR06MB5269.apcprd06.prod.outlook.com
 ([fe80::c84b:5a6c:d66f:c0fd]) by SEZPR06MB5269.apcprd06.prod.outlook.com
 ([fe80::c84b:5a6c:d66f:c0fd%3]) with mapi id 15.20.5746.023; Tue, 25 Oct 2022
 03:32:28 +0000
To: jaegeuk@kernel.org,
	chao@kernel.org
Date: Tue, 25 Oct 2022 11:32:16 +0800
Message-Id: <20221025033217.14840-1-frank.li@vivo.com>
X-Mailer: git-send-email 2.35.1
X-ClientProxiedBy: SG2PR06CA0248.apcprd06.prod.outlook.com
 (2603:1096:4:ac::32) To SEZPR06MB5269.apcprd06.prod.outlook.com
 (2603:1096:101:78::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SEZPR06MB5269:EE_|TYZPR06MB4079:EE_
X-MS-Office365-Filtering-Correlation-Id: 28e34aa0-944c-411c-a7bd-08dab6398ad2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 8wF79c9ctwh2U5WXi6fKLvbUvNOKuhYHAIvRo/VXnWWc0zXO/ayucqvks4EIntLkxqsc7Sh5fZDckgRhUAalzu6j/tKLSD83lIkbeHHhGBgU/lb8CwM1rc/Aacdi/l0uSRQzNTNqglcMV4r8iJAMi3jhP+CuiDOnHglej8PZMkws2/4ke2DlwGa/hA4JOX68oeD93QwFoeopPFWwRhkmDcw+u1T2tzVrFKVlyTCF9RpDUD3uzS00UQDFBoLZkjKBWEhQTRgOlyBz5iJhnXIEIU2quEtV+z1Z+H8S89KTpC/B4Y2nHynWCZ8vEG2t56x28mTvvtmbKzb759fTNIZFRDuQFCN1L8Z1jslpFTkvaA2TYIJPryaLxv3euG3wsh2fm2SKnOVMpDLfNYoRZIcC8Pz/xNYrJ49e/43tgDp4bBn9ld4Pcn0K/WRuZmay/6PmOIySZGPAfmUbsf2mscOM+6xUZ0sNhviH/9twZnDjScYGGKFyDM3cpo1+MmWpw9p0IpzF+htIn6MYPqaswglaBVlPj08hDpbtSa/TRFW9qs1FRGdZWDgCSm9ioekPtRi+B9lSjXfiFvhSbzVLrWWGgQTwk1c2n4rUSkHXEVdHuDl+awlvwssnVxW1SPB1dtwmMby7qsu9OHG1/xTI3bmgM7DNrtnlkopyd6pk3ZYaOBuSblsxxCu5gGpetIOunEbtnX1aAfe5l3zM+82XPxJzqDq6uvjYYJEMlKELsAjVUotRdeb661N4airc5R5z0GXE
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SEZPR06MB5269.apcprd06.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(4636009)(39860400002)(346002)(376002)(396003)(366004)(136003)(451199015)(2906002)(8936002)(4326008)(8676002)(86362001)(66476007)(66556008)(186003)(2616005)(316002)(1076003)(5660300002)(36756003)(66946007)(41300700001)(52116002)(6506007)(38350700002)(6512007)(6666004)(38100700002)(26005)(107886003)(83380400001)(478600001)(6486002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?3OQ3L+5R514tXhAlKWEjGiKd/hs/MMB3cktmAvL4NYf1kgFaLfWiMXQnS58E?=
 =?us-ascii?Q?mt7Pl3Fj46kvxY47lTf4fG4eE5f4SEgpUIEqfl0/suAX7vvK2aLKJUIUAOCu?=
 =?us-ascii?Q?fMa9sTOGlziLssnJWX+i1ejzTJsCPKAijS76ZnWmg/ZxH36SwRv5Xt2Bo7h+?=
 =?us-ascii?Q?rV/nNk35vGby0mRRhSpjjrM4Ivt6bHkCvuUdwUOg/pT3y3Y2slpe3tKJIXfa?=
 =?us-ascii?Q?XZRMvxPqPxsfyn0OW4raPQUW9OIGhL1rn9sZxJ1UeMOG8a45uVu1Wt6iiFhv?=
 =?us-ascii?Q?8NZMBuRb95CiniyCpLhidhv/xnvR0jIs7lkmGYSUidKQy0r0Uk5R9sUviXNI?=
 =?us-ascii?Q?K6OAdRXrIXMj23WBstBMQkQOFH0Z8//XgIwAronI0Gl0tBrLv4sQwnWu95c5?=
 =?us-ascii?Q?OYce9tK3FdjZwC3IJya8pduwaukLWLEZM+XZsZfdpYa8EYnWsqX28zGf/IR/?=
 =?us-ascii?Q?bVOqUF1qzmxa+wUNqyMepbZhwkfsDgCbtzXz4Vwv0KVfqcsHFDaBxSyu8ROR?=
 =?us-ascii?Q?uQ/p/P/33UskTJIHDvc1oJs54w4pBh3fZF9lpZ90URL7laTqUApiAoQyV8js?=
 =?us-ascii?Q?63I6gm1IY33iuEnZIVpIG/r48czuGm+wSzAtxlVc1WjBhkAPvjsZEU39yFFp?=
 =?us-ascii?Q?7kJiySWtvKkZDLLmudxB8DtPCMlyv8Wu4zzA2JSveNmW6HOfXjMPD356dPlT?=
 =?us-ascii?Q?5pMNHhjwZ3W5zIoQE8tLnd5O1GNvIS4/cGtKJKZU1TLcbRKijZtPt+AlXhcZ?=
 =?us-ascii?Q?C9+hv1tdKNFfh6QQ9a0RbVhFwtTnPkVP4mnGE7jpR1zNvhgvtfP3zM7XbIBk?=
 =?us-ascii?Q?eaMaxhEAaum+8CwgXMuuI5IvR3FHYYYcNCyXF1tG60VYx6p9O6jK10hK/efT?=
 =?us-ascii?Q?xIfH6x8xTMK3OZCumkn5r0mbsaq6NKcapqbqKdLmMLFkNKYpZzBRtuLFsYWc?=
 =?us-ascii?Q?UtMAdGICWbFLEi+cRQwCmopkEBWidpf39tEfFeFC0fLKP+sj1tnGPIIpMqfk?=
 =?us-ascii?Q?oSXLo5tjkfKhPb1de41e31axIPnj51n6V06gE2kEVWjjogq01QNIF8yBS9jN?=
 =?us-ascii?Q?cTA2BiGn5JwUfHoLUHQijEOLkpf05myenMeiGN0ZsFZkCS5Neq36dWrOqUYV?=
 =?us-ascii?Q?avBv9x4BAYlNh2+8jqd8f27XlSnBIJsPyT0MENDHudBqyjn9IFZsinVdj4+L?=
 =?us-ascii?Q?UWnXEKlyJGrRULpAkUlFkKjTJSVzgC/BQMT04z+8sQ247e9TY6VBzD4yDune?=
 =?us-ascii?Q?WqmNHeryxVCcqRM4W8OQLmcT2sQjPsfjFvXyJGWyNKRcYd4ornvor0Wfuv5c?=
 =?us-ascii?Q?imUx/M/mQn7smFu4rue/ZGc60m8AV/owouCPyrhZY05prg6iM0AhrJboE6PR?=
 =?us-ascii?Q?Yr8wYPgOavnfRfA/Qwlnq19Se14PvSmNrVFRIpvfxh7V91iGGG0CDTtO93Q5?=
 =?us-ascii?Q?cHQds5lJqqMVtaw0pwxAYfqVIUlHY1sQ0gqqdnD/1xOAEOn3vSQqla9vixuQ?=
 =?us-ascii?Q?ayz6Fsib2dRjtz3O0fjGmvlIFPGEOcpDW+ThdpN0ulC0bz8mfFASPlA+zrTv?=
 =?us-ascii?Q?Muu1aIlv5c76bqgCNs8JwxDyAY2sXXyacsyrB/zg?=
X-OriginatorOrg: vivo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 28e34aa0-944c-411c-a7bd-08dab6398ad2
X-MS-Exchange-CrossTenant-AuthSource: SEZPR06MB5269.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Oct 2022 03:32:28.6673 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 923e42dc-48d5-4cbe-b582-1a797a6412ed
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: E/H03IGL8vAKhECHHvl/Zu9CiQBUM8T2rKMmPyzfyEGhxK5xTOED7/e1qVu+Er1shKTUA9R3mhhC3BOJ791dgw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYZPR06MB4079
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: This change breaks forward compatibility of gc_idle interface,
 so reverts commit it. Signed-off-by: Yangtao Li <frank.li@vivo.com> ---
 fs/f2fs/sysfs.c
 | 17 + 1 file changed, 1 insertion(+), 16 deletions(-) 
 Content analysis details:   (-0.2 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
 no trust [40.107.117.138 listed in list.dnswl.org]
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [40.107.117.138 listed in wl.mailspike.net]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.0 SPF_HELO_PASS          SPF: HELO matches SPF record
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
X-Headers-End: 1onAg9-00GKtl-5x
Subject: [f2fs-dev] [PATCH 1/2] f2fs: Revert "f2fs: make gc_urgent and
 gc_segment_mode sysfs node readable"
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

This change breaks forward compatibility of gc_idle interface,
so reverts commit it.

Signed-off-by: Yangtao Li <frank.li@vivo.com>
---
 fs/f2fs/sysfs.c | 17 +----------------
 1 file changed, 1 insertion(+), 16 deletions(-)

diff --git a/fs/f2fs/sysfs.c b/fs/f2fs/sysfs.c
index df27afd71ef4..49898a7243ba 100644
--- a/fs/f2fs/sysfs.c
+++ b/fs/f2fs/sysfs.c
@@ -41,16 +41,6 @@ enum {
 	ATGC_INFO,	/* struct atgc_management */
 };
 
-static const char *gc_mode_names[MAX_GC_MODE] = {
-	"GC_NORMAL",
-	"GC_IDLE_CB",
-	"GC_IDLE_GREEDY",
-	"GC_IDLE_AT",
-	"GC_URGENT_HIGH",
-	"GC_URGENT_LOW",
-	"GC_URGENT_MID"
-};
-
 struct f2fs_attr {
 	struct attribute attr;
 	ssize_t (*show)(struct f2fs_attr *, struct f2fs_sb_info *, char *);
@@ -332,13 +322,8 @@ static ssize_t f2fs_sbi_show(struct f2fs_attr *a,
 		return sysfs_emit(buf, "%u\n", sbi->compr_new_inode);
 #endif
 
-	if (!strcmp(a->attr.name, "gc_urgent"))
-		return sysfs_emit(buf, "%s\n",
-				gc_mode_names[sbi->gc_mode]);
-
 	if (!strcmp(a->attr.name, "gc_segment_mode"))
-		return sysfs_emit(buf, "%s\n",
-				gc_mode_names[sbi->gc_segment_mode]);
+		return sysfs_emit(buf, "%u\n", sbi->gc_segment_mode);
 
 	if (!strcmp(a->attr.name, "gc_reclaimed_segments")) {
 		return sysfs_emit(buf, "%u\n",
-- 
2.25.1



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
