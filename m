Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 2DB306243D6
	for <lists+linux-f2fs-devel@lfdr.de>; Thu, 10 Nov 2022 15:08:54 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1ot8Ee-0001ma-KV;
	Thu, 10 Nov 2022 14:08:52 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <shengyong@oppo.com>) id 1ot8EZ-0001mN-Tk
 for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 10 Nov 2022 14:08:47 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=MIME-Version:Content-Type:Content-Transfer-Encoding
 :References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=K+XZBLMDriWo+ACRkqqThmnXj4xIZz5N2H6x/K3HcLc=; b=ZioSIvdimQkAFCAKFMo2CR5bOq
 7ar8GscEMtfmiwwvGaCoYGRfk5+xFZy78BqLKdUki4JRNURONmXc+OHvnNQCsesFV4AyOxkQ0SnYn
 fvzQTMS6Kf2VQUPLAp+MM7aiNkQA+/6VUrV4JycbT46TEZAmEgHcuE01ATcxqZOEoe/4=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=MIME-Version:Content-Type:Content-Transfer-Encoding:References:
 In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=K+XZBLMDriWo+ACRkqqThmnXj4xIZz5N2H6x/K3HcLc=; b=XkjDdYfVd7p8QHlZ+UgYI3cEh7
 v/r0cvknbDAM6AethqCOU9ceIxHR1IFLPRSrDwqPZQnfJZnUumYyBindm1icIfGRncanSFAeu0NWE
 uf6AWpXQwc7i6uGLm3QcYq/WD1EVN1xmvJVCI6LXRfjUO2A1iY16wDflaHRIBXouwY6E=;
Received: from mail-sgaapc01on2087.outbound.protection.outlook.com
 ([40.107.215.87] helo=APC01-SG2-obe.outbound.protection.outlook.com)
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1ot8EY-00067v-MP for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 10 Nov 2022 14:08:47 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=IiZzlLmQ4rku4as/cEswUIgF7S2l07P1gMHk6MtyuA1RA1ovoq3AU99kbidWXNfQ/oFWb7EfuLW1YZCEBdhN5bI119I5D1QPjG5d6fxMXDCdcL4Su81NuAzLs0QBFNc4r4XRNgAGSXnvOED/H1JhLEgLqd7sMvRFrHfsDEtFA/qxOX8tyn6t1th8VLOr6lQ8uyKk0Dw+tLkgCDuFJZv7FM/B5ZbQXhVmj2wm/3DI3p3iKF+aFsg0zPRTC8WZECjzyk20oncvkA67hc6DyRcUJtZRJwBzyEuj/4vlcjfZYgkJ1xuAMLHef3vM4LN9WfyOuNVMeRWc0nWDrEovkkS0oQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=K+XZBLMDriWo+ACRkqqThmnXj4xIZz5N2H6x/K3HcLc=;
 b=Fi58Px2g2coYOPavMmyi2Ve1lg4ZUqewlFi6cYTVc8yhkcD4NJEjfxe1OsMhECagZcZCPbZ3v+xLHBY+zKMYkCltjPW03QWWK2SJ0EPcBECzr8TBPZa7vEKtEpdjGHmXO6EnUT2dZ5p+8P1saQXzRtYpYtMVJLNks3FImBjoi6v3EnAIXrtOEMrCJ9n0mUxBsoq9QkBhuvduOohb/GmLpWMa6jDXhXmpiIlPUh3S5ribIW+WGpCUi4dhLev8Gn/+D/zIFWTnTtw7exklygUiKaVGuwAPe91TXszcbfjh6Z4QcIGn0Va5ZxkW5NHH0CSXH0zzkLnlVtYM4YOXMS1jcQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oppo.com; dmarc=pass action=none header.from=oppo.com;
 dkim=pass header.d=oppo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oppo.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=K+XZBLMDriWo+ACRkqqThmnXj4xIZz5N2H6x/K3HcLc=;
 b=McizuuLdEHmBms6Lb2XvXdPGi+3TUhAUxqZBcoNObrc6phkUphxXGxsm0kuk7z6hVuSnqyA/AdqlwpZMY1PGe0rjSp0hpHhvDyVBpo7SL7+pEZiaBOOveDmaV7KSGfF2pLv55jTIM2yULi7IMyJsR2BSkoU1yBh5jhIY2OxRmrw=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oppo.com;
Received: from SI2PR02MB5148.apcprd02.prod.outlook.com (2603:1096:4:153::6) by
 TY0PR02MB5744.apcprd02.prod.outlook.com (2603:1096:400:1b4::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5791.25; Thu, 10 Nov
 2022 14:08:29 +0000
Received: from SI2PR02MB5148.apcprd02.prod.outlook.com
 ([fe80::31b6:afe9:43b5:aaca]) by SI2PR02MB5148.apcprd02.prod.outlook.com
 ([fe80::31b6:afe9:43b5:aaca%8]) with mapi id 15.20.5791.027; Thu, 10 Nov 2022
 14:08:28 +0000
To: chao@kernel.org,
	jaegeuk@kernel.org
Date: Thu, 10 Nov 2022 22:07:22 +0800
Message-Id: <20221110140723.92752-3-shengyong@oppo.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20221110140723.92752-1-shengyong@oppo.com>
References: <20221110140723.92752-1-shengyong@oppo.com>
X-ClientProxiedBy: SG2PR02CA0103.apcprd02.prod.outlook.com
 (2603:1096:4:92::19) To SI2PR02MB5148.apcprd02.prod.outlook.com
 (2603:1096:4:153::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SI2PR02MB5148:EE_|TY0PR02MB5744:EE_
X-MS-Office365-Filtering-Correlation-Id: d7b37bdb-ed05-4eac-4a79-08dac3250ab6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 6164+x0A1tKhquF2O3wAcybFWsT8t+0HzeJC5MZpH8y59c0YyqvOvkVdMfa51/0RbsvJUDTlEY6uNN8LGiVjwvJk6DK9YVcSFlK6Svwq0jUc92WfcozWI/MSw8r2ETSM1ooJPu7iLZcCT5lMldsCVoYrkfQH11BWaa6kSTp8kGz0OIBxwaMy2+1ojQLdKla+MDViBjPeteePzaK82xKXIOXXUfspdOsacYPqKHoHA0SA3EAiXhPsFRPP42P0YLNMv12adL+HDCKdQQ3P34+ahtEMrS9onBRL80e5PoB0vl+qbJ9lJ4aDZNox3WPajbo0wme1v8qzzVkHqRxHu6g+A0kxJ/MNIAU69Y7b4LofzfygUFSt9rFPYUkr78R2/mZoz3V1iu/YzPFAMtT93AsoSGE+Ziph7ofmHbdQxRNPARGUs0cKlqxrF1qNGIDGEa4+NI6FY94D1SaYp5wuktMzR6yKD+5lIx6vHgADr9WFosI6xTylZ73WbrWjqRev8sa1w2jTDeCQ6l8fOM2FOy1nGoMr7Xe6b//JXnxxogA8rDvviMq+AJa5Yk5zDkd88RwdDH9jbo6cn/TqBYKFTC4rPblZQ8IdqZAt3ymuBFqc7Cj9rK3GbJnpIHqOHbKJFmdsmPJ5Nasw6LlradenyQaEMEkn14yPPz2c81ffDEGmVFKYPb3Ge5c+b8yVyfdA5yM9Kddj8ZJYNzILL9oe9spdeK/7wIARj1I2wPb9lo/suNC5UJngNFFEN+XOfh2pZ0O4
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SI2PR02MB5148.apcprd02.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(4636009)(136003)(346002)(396003)(376002)(39860400002)(366004)(451199015)(52116002)(1076003)(186003)(83380400001)(36756003)(6506007)(6512007)(26005)(2616005)(38350700002)(38100700002)(6486002)(478600001)(86362001)(41300700001)(8936002)(5660300002)(66476007)(66556008)(4326008)(66946007)(8676002)(4744005)(316002)(107886003)(6666004)(2906002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?lb0RIVqLU7m1SqUs4rHOhwgEmbYvf8zROa9Ar1Smpgs8C8rZcjkGdvKFL/9O?=
 =?us-ascii?Q?SHk8TMF2MPXMUei8cFTOhQIO1UwW/gXxxZj48E3UTmX6ykUaSFJ836QJBb5y?=
 =?us-ascii?Q?jMF1BjpJmo7ZHsXA/sqwaPy0hHspV6BYP2T72mdgBl+uTO0RSjupISw8bZfu?=
 =?us-ascii?Q?bljw2gEqWJ/6WDePHSkn4U/Sg1lwV8k+opY543gx2MmY31kkYt50L28Zvz+C?=
 =?us-ascii?Q?jkkQ/psI/Xu6UjCcLgABs6Ama+gD3c24ehiZkYwe+Zda1s0hF6f24SFEuNGP?=
 =?us-ascii?Q?GlEKqpWoMsUUX5eO9avkOATxdHKX2roZm7h77OhSkijX9JAgYXQhxFuIcjYd?=
 =?us-ascii?Q?K+kAyVEJveeKyfE9ksDmgfYqjgzViJsADpZwshqBGSEmNsauQWnIl+19yuDN?=
 =?us-ascii?Q?3V1GFpT4QXl8B3xelju7NoBnJ3mfHOOqKneMDVDAd1enlEsrzksjrAWuPqTZ?=
 =?us-ascii?Q?XaNKliq6GytIZHELESs6gXtAA8uFuDRDiGRq6pMg+ZKSUhLIYpvxQwE6q+45?=
 =?us-ascii?Q?FraQXSaeAnG5cuiluPHNO0pc/0LRdvBfnDItUkWYUwQ8n2TFPkOJYf0+hpvK?=
 =?us-ascii?Q?I17RbZMqnPiW1KJLddrA1ygmjgCdMfrX9h9rzhXEWmVmp2+snBnXiZn4+67T?=
 =?us-ascii?Q?7v72xnWWW6/7GJIU5Fq56CPaKaotQDD3p9cIqJ1TFESSF7t3LapPwtmx+m3f?=
 =?us-ascii?Q?myFVVPP9zfF++9Nw2RGiGn1nE7IKs3reQNB3qSCqXqCPGVgDTTK4EwJQNqiB?=
 =?us-ascii?Q?rrcNgmSHVvJSqmGjAU4IU8xuZfu3pbfSkFJgAOE2znBrkNVRqyX6Qc1Lmw7M?=
 =?us-ascii?Q?wFJpqjtkLfeQc3EaD8rssiLXAYCOyVE27Cdw2WnASILB89AYSvGTDjcyPhN/?=
 =?us-ascii?Q?BPNwEB+WPNeJtWIq/WLtI8YRS3rZ/S3paRJvpYARQzc1uzOaDW+lS2dy3MKr?=
 =?us-ascii?Q?18V/riJM9iB8ijCSD/jDEZHYLdHXZBAEPlIfutWlqEXuyPN3n0bTBF3yJcR2?=
 =?us-ascii?Q?KKbjT9n2uS/vdTAcaCYlB/qRccTZMdh4FbTJotaFeugqxrD1bH2RQ5Ehr0F8?=
 =?us-ascii?Q?V+S3Rid0ckEKnSSlUTR+UiR1XaSHM5ODLfVYjTRxExi+M3v8nhyWmgele5lw?=
 =?us-ascii?Q?wkQXUEqnh0BmpEUFlzepD0ekDEfT4S61jAOgW7eay3Zu1XNz0R0p4taATK+S?=
 =?us-ascii?Q?uwNPqOiQcij+j3tHJHJHzglOUHLHGuHhJttFwcqbgMIqPZKBxa6WmPdPWvgc?=
 =?us-ascii?Q?kv53D2HV/ev/Iip0Zei/xeOnlEY2hzJ65ymhx2dengsj+5jPQ+jCi4vj2UMi?=
 =?us-ascii?Q?8KbtPjWK8V9XDcdeX5bX3krSe3tmrWhoPnTPho4Va5naEixnPjmaCqRnVBqv?=
 =?us-ascii?Q?fOKk/2W7SjU36ZhBhu4umsAD7kcHkaC5gI9jSXjLh+g8ooRy4yQ3JqAOz2cI?=
 =?us-ascii?Q?/zAlaPLJ90+7PB6f13z5w0Cs3ZigT/ADmpdG6NOZR3dnVK3p8MBDc+jMRmNB?=
 =?us-ascii?Q?I1Sd1clViO9lMLnX03OVKpdeUlz1Pv304gA3CZy3F0A0w5lQ5TOBhHEh34c3?=
 =?us-ascii?Q?urtpJ8ZrIXP2+ZCEyQXSCcgOpNGjKr5Ir1DaGWCV?=
X-OriginatorOrg: oppo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d7b37bdb-ed05-4eac-4a79-08dac3250ab6
X-MS-Exchange-CrossTenant-AuthSource: SI2PR02MB5148.apcprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Nov 2022 14:08:28.9614 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f1905eb1-c353-41c5-9516-62b4a54b5ee6
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: bcOgYVwheeIYPCrwTvj9ywP1W4sdd6Eo6E28MBLTm/o6rwpU73zBRgYYmII1hXQJCymzByszieGAWdsmkj4w6A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY0PR02MB5744
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  If i_namelen is corrupted,
 there may be an overflow when doing
 memcpy. Signed-off-by: Sheng Yong <shengyong@oppo.com> --- fsck/fsck.c |
 6 ++++-- 1 file changed, 4 insertions(+),
 2 deletions(-) diff --git a/fsck/fsck.c
 b/fsck/fsck.c index 036a834..ebc60ad 100644 --- a/fsck/fsck.c +++
 b/fsck/fsck.c @@ -742,8 +742,10 @@ check_next: 
 Content analysis details:   (-0.2 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
 no trust [40.107.215.87 listed in list.dnswl.org]
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [40.107.215.87 listed in wl.mailspike.net]
 -0.0 SPF_HELO_PASS          SPF: HELO matches SPF record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
X-Headers-End: 1ot8EY-00067v-MP
Subject: [f2fs-dev] [PATCH 3/4] fsck.f2fs: fix potential overflow of copying
 i_name
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
Cc: linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

If i_namelen is corrupted, there may be an overflow when doing memcpy.

Signed-off-by: Sheng Yong <shengyong@oppo.com>
---
 fsck/fsck.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/fsck/fsck.c b/fsck/fsck.c
index 036a834..ebc60ad 100644
--- a/fsck/fsck.c
+++ b/fsck/fsck.c
@@ -742,8 +742,10 @@ check_next:
 
 	if (ftype == F2FS_FT_DIR) {
 		f2fs_set_main_bitmap(sbi, ni->blk_addr, CURSEG_HOT_NODE);
-		memcpy(child.p_name, node_blk->i.i_name,
-					node_blk->i.i_namelen);
+		namelen = le32_to_cpu(node_blk->i.i_namelen);
+		if (namelen > F2FS_NAME_LEN)
+			namelen = F2FS_NAME_LEN;
+		memcpy(child.p_name, node_blk->i.i_name, namelen);
 	} else {
 		if (f2fs_test_main_bitmap(sbi, ni->blk_addr) == 0) {
 			f2fs_set_main_bitmap(sbi, ni->blk_addr,
-- 
2.25.1



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
