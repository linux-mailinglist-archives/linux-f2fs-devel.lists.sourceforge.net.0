Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B03B6777A5
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 23 Jan 2023 10:46:41 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1pJtPQ-0003LW-Um;
	Mon, 23 Jan 2023 09:46:35 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <frank.li@vivo.com>) id 1pJtPJ-0003LI-Jw
 for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 23 Jan 2023 09:46:28 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=MIME-Version:Content-Type:Content-Transfer-Encoding
 :Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=EeTah9Sh4ca1NmIFs74cPy3SvfbejDbxJ/JZJfTsga4=; b=AtumThw1B/Pvix91ApTRYDGrZB
 GrlJ4XZstxrjCZwHE+jRC8O2DPMojndZoa1s2/ZY0C2Y8z5YyMvD1XMRrGx/V52bchNeNdXMPAr7j
 MdtHbJdF7+PNULZ8amoU2+Km7vFqLcBqhSRKdhTk7PiB+pOP/urxC/MhQvZPpt87VLIY=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:Date:
 Subject:Cc:To:From:Sender:Reply-To:Content-ID:Content-Description:Resent-Date
 :Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=EeTah9Sh4ca1NmIFs74cPy3SvfbejDbxJ/JZJfTsga4=; b=Z
 8bijW/MQHzDyFTeHi1YFZymA/1RjZeeEhwOqNzl+W7FcXNo30gzmnfBsroTqXXB42dqruwHS5VaZS
 f3Y9eLuvP9pF73GfS7y9KDQ40SK51GDzlQ1KDUbkPd2XTj6yRVpY1UrB96oJ7kRCoHl5LtiPuXWFH
 6SzuHNpmXR0iWA6Q=;
Received: from mail-psaapc01on2136.outbound.protection.outlook.com
 ([40.107.255.136] helo=APC01-PSA-obe.outbound.protection.outlook.com)
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1pJtPB-0000XW-Sf for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 23 Jan 2023 09:46:28 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=icAkN1A2iehOyCBi2478pQ+nhI/AurcC8POZ7Le4KdH6xWeIiS3bqbN3I9II8k8uoGsABOQ5mIDFN3nRZmgMnJ2TQfVHEwIRZLceyuid02AthJrhTZXbtC/XpXksEReJuBqjkgbK6LpoRLuiVdn47E5xHbt0XsYbcikzAz1FBY7sVJPa3y67wsjNeeVC1qU+XGaGiAolYvbRx8PfwHlbYACyqle7sewjWhT2GzXdQJlO6hPFr6a8WueFCAtaVs4iuv18NlTCsIZGh/4vHF7OSyaP6nWYHMg7RZi3HfADZ3yo5l0EqIJIe3Ho6VMg2jcoDBA7KToX9OpiMKAVnqluFA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=EeTah9Sh4ca1NmIFs74cPy3SvfbejDbxJ/JZJfTsga4=;
 b=dVXRSyoTlImG3ZkuTiQUdKPJ8S0oBbFqc3QK/sFpHJsKNubIEFvuUc2AyYCJpH3tV5596kARGwzbUtSInm2pZJtaoJBAVeyxMH0RTQ0nAGXKQCXpepLqB65DZngX5SlIinzjTXDqHHI3478pDBTLEOJizyFMoudzxAe5ZPg2xu4kY1IB7nz+WidgDDB6mVRpQjV5/URvxZOlKM0aaxXjjaI876qcGF8pnxh351rWb6LOBozPWY14obsMZcigpUfxn9BUAHNsFZta3lM74bI6V9NEFOfyJXrznuqWHrW4w6Ng81jUNHsrPrY8KEYCEQdOu95sXsTyVeHmSG1POdKaGQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vivo.com; dmarc=pass action=none header.from=vivo.com;
 dkim=pass header.d=vivo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vivo.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=EeTah9Sh4ca1NmIFs74cPy3SvfbejDbxJ/JZJfTsga4=;
 b=RWbGQ1l95ykdyR8V4woWA/binlDqcjU00dbBgck+ap+jeRNog8VkbRq6eaItAUlDV/ewZNqP9+QvtV3Fqj/5a8v/tH+ItGQ1sebKVnCy346tPiHBc9jnnX+ccobS153ztwhclR4xq7YsHDqgkXlwtcTRgFhMmCBvC0GOXYBVmUtEYjLIdAVr9vpVr8y7fOEHgFhuCji6wJUVLwKAR0LGNswQgRk7X7M9FseB7fspEFdL5+Bvmyz+VjEHdBza/0gRtRbRXUvEvL8LME4wxMCOgfm64kVB9VfG3G8Gt/HJlq59qgCgiaXBxGV3CznX5In7PcQXUgv/7binY8sBSltulA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=vivo.com;
Received: from SEZPR06MB5269.apcprd06.prod.outlook.com (2603:1096:101:78::6)
 by TYZPR06MB6113.apcprd06.prod.outlook.com (2603:1096:400:335::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6043.14; Mon, 23 Jan
 2023 09:46:13 +0000
Received: from SEZPR06MB5269.apcprd06.prod.outlook.com
 ([fe80::3e52:d08c:ecf4:d572]) by SEZPR06MB5269.apcprd06.prod.outlook.com
 ([fe80::3e52:d08c:ecf4:d572%4]) with mapi id 15.20.6043.016; Mon, 23 Jan 2023
 09:46:12 +0000
To: jaegeuk@kernel.org,
	chao@kernel.org
Date: Mon, 23 Jan 2023 17:46:01 +0800
Message-Id: <20230123094601.32940-1-frank.li@vivo.com>
X-Mailer: git-send-email 2.35.1
X-ClientProxiedBy: SI2PR02CA0003.apcprd02.prod.outlook.com
 (2603:1096:4:194::13) To SEZPR06MB5269.apcprd06.prod.outlook.com
 (2603:1096:101:78::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SEZPR06MB5269:EE_|TYZPR06MB6113:EE_
X-MS-Office365-Filtering-Correlation-Id: dd66e5a6-2872-4427-682d-08dafd26a96e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: rX3mVstUKBsCw3FnUd3EbpPGDbcUk70XR9ZgKSTkY6AW/mdhVfzQ4DihpTA7Zh+3vTMsBAtg1Y3qUgvbCuUwZbC0Qmo0RCdQeu4hyYUiTjm87c1h5DkWgL731aFx1qifBtTl3w7QZAlu1iEPkAyf9U+FPHq8amgyDCTci1cv+gHMLEuNeQelHvYM3AvePeBGXKtrE9NexbwO4/GCmf8EBDgwQiUFWa3FTAIU0IFxZWGkJPwV1NeQQ2bDfggUrWDIWRFt4AFWUlfrf8Zv9frHaAT4fJ34aS85sixRdxelSL4tqpxJwp6nr+MJ36JGNCIgeEaRh23UDO/nRQ9fYej2J+/i44YGJetfvQkQyFt1DTN4iU4emPigcjcWdGW3NwpH5U02YXZDzhWdilqSahSo2oJbTASSkpuKWV6dlDglcs3k892n0t4ei8m6TLpsx0BAR9CJ4XllPOLg0amJmHCV4+xsFxefUuEem3nFiNT3fXEBO4gyBay49zbOa7yXmjKZZNw5zIhrM1gUBeXjDKq/ya9CNgjt07xHl6/SqW1MbPw/VoQwVFR+0MuuLJNsxa7VwWLpOLSFR2RtCIOF0EHXvnhbOFJ7GwW+hJ874uDKAa2EGLHfNyOj4YjIetVJwWjb74OhrkZYdxjeOmyarCIs/AwqjhVU5Dt9wWWU4jfAJfBkWQvWtF1CrNAe/k/kjuVV
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SEZPR06MB5269.apcprd06.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(4636009)(366004)(346002)(396003)(39850400004)(136003)(376002)(451199015)(36756003)(2906002)(5660300002)(38100700002)(38350700002)(8936002)(4326008)(4744005)(41300700001)(83380400001)(86362001)(478600001)(6486002)(52116002)(66476007)(8676002)(6512007)(26005)(186003)(6506007)(316002)(2616005)(66946007)(107886003)(1076003)(6666004)(66556008);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?a+Df6vxTxX5QEb7EV6RzGb1K1F12rPvPZ29N9FGOZkfFmkLjN4yfvFMfTbgD?=
 =?us-ascii?Q?wBEJlzwfgYDzG/ZjBLbouLsQLisnlFqao1hpA4HWDpLLe6boH31ub8As/1s8?=
 =?us-ascii?Q?QDbf50w1rKdNtdYQ/XgMZFV0XsiH0yTyYZIng8Wz6MpDg596qtk+ql+PUQOs?=
 =?us-ascii?Q?ccoBC6rFQ278Uwl6aaAA9COjK4XXKs2oAanp/6i73x4yHcOPxzunWKxcTUfO?=
 =?us-ascii?Q?2Ii0gf8tLEX2ArasDZDOx4LgPpM0+e76/InUDHwihGrBqe/2cZxYAO8QOz4A?=
 =?us-ascii?Q?E8mgAcJCyT4n/dFf2GOEqL8jDJXmBLZlB5MvevctwxXL89M8GNskXj2V8xRO?=
 =?us-ascii?Q?pwsGkBcZMuJIotF4M94wFn8Agv17VFzfb3cdIEYJnc4yfkS3Za/mgDynBnRg?=
 =?us-ascii?Q?+FA/m4c5XqDYL7i3Dm1hI/0NfxJqB0Qa1Ahe8sBLx7gny3pc5QZSk6vkmefk?=
 =?us-ascii?Q?0tzFrA/tDYkF6NNZOq+bP7YzCiKSuwbep36NuyrMyw3TiRKx6+8+SFgywV18?=
 =?us-ascii?Q?XBLFuAvXLh/82J/rkJpz7cH8iC0nlkLAL9gi8LnTx6K1wsJ1oc/Fsx7S6keQ?=
 =?us-ascii?Q?Ia8fgM6QnANJbkXUQLTx496RME/YbC9/qgJub3fMqDKnZJJPLrXf/jpPmAaz?=
 =?us-ascii?Q?T2uHGcn54gaBNY0tNy5OlN2RFClQ79GfxWpr5Ks6IplKxRpQt4geqIlYXHbN?=
 =?us-ascii?Q?1lpe9Ib4NyejlkQwTDClIV5CnOdSgESx7HwbRorvKIfag+FFk/24IXt7oSVs?=
 =?us-ascii?Q?+eNySmxoNUt5+h90GDGcnO3pqO1ypslZymV+3JnaaWDkTyYIyhzIP3KIN5Zo?=
 =?us-ascii?Q?wQr5UNwB44pxpVbYYCnLbOnKwc20L/VpcYSnClPPWeBfTV6vzHqyc383UqDB?=
 =?us-ascii?Q?K5kGdwxUqB4ET14wnCelhlB+t/v1A+fft13bAvZmLW8P6XtFSNsw+8nhPRb2?=
 =?us-ascii?Q?6EtfOJRadriLu4UfzLcOhPZm1BPEdpqiquaTdlOQhBdg2s4+913zZ6DcZ67h?=
 =?us-ascii?Q?duL6CQR8LvmXUwZ9LfTTnnwb96UY3zbvNvMQ7yc0cPcBgLnlRPuvZLzHyhn0?=
 =?us-ascii?Q?pMNrOldnoFj+d3G8Avr4o7qgx8mubv3JgtPwj6h+vRCv1m1TGY3Z+pvUu4f+?=
 =?us-ascii?Q?I+OUvK3A8Y0OWQOgsIQx1WgH8DKK6dFgWvmyOiUN9nd+C4TNdbj0faSTgUSO?=
 =?us-ascii?Q?D1Tj5gzdGrEswVLpVWTI2Vwt5FHR69oFlKhYavDKyoXSqPGCKhOnVE5TXo4L?=
 =?us-ascii?Q?ZAS58wcLq3Sv8y8hJym8lArKqiGli+1NWxLbR6aaATP4h0P3pGPYMzG7wUjs?=
 =?us-ascii?Q?HkfY++rqndmJ8G2S0yVFTVoaqSBCclWvn/m/4CUNIudscHkOvYsOjGs92hNR?=
 =?us-ascii?Q?Jcf3BepEeZJD57uK5gq+iWt5AgUO9Ml0NzZM6saSrptdYH/oz14xGi9l/4Pz?=
 =?us-ascii?Q?tN0JxuBUnbvsf33xfOrbMy8RhtRk9dOfsXCU5fYENoQnh/ICYMmpmWigJ+Wg?=
 =?us-ascii?Q?x8+GAXrs33VG9quZ+z+4qhCDAB4PzzyleNn6yorW+ciLzMpU3wrKsIbf6zPJ?=
 =?us-ascii?Q?xzRax5HtpW98PqyIV9AoXvKLEntclChBUk5TIX3e?=
X-OriginatorOrg: vivo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: dd66e5a6-2872-4427-682d-08dafd26a96e
X-MS-Exchange-CrossTenant-AuthSource: SEZPR06MB5269.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Jan 2023 09:46:12.2171 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 923e42dc-48d5-4cbe-b582-1a797a6412ed
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 3u9YkSieTPgzpjqhBTivHb9pnWbT2NoNfeyMikPv0QeeTZ6KLlFGRsh9nzRK8BveD0aak8iJPqxyJoexX+SGeg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYZPR06MB6113
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  Files created by truncate have a size but no blocks, so they
 can be allowed to set compression option. Fixes: e1e8debec656 ("f2fs: add
 F2FS_IOC_SET_COMPRESS_OPTION ioctl") Signed-off-by: Yangtao Li
 <frank.li@vivo.com>
 --- fs/f2fs/file.c | 2 +- 1 file changed, 1 insertion(+), 1 deletion(-) 
 Content analysis details:   (-0.2 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [40.107.255.136 listed in wl.mailspike.net]
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
 no trust [40.107.255.136 listed in list.dnswl.org]
 -0.0 SPF_HELO_PASS          SPF: HELO matches SPF record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
X-Headers-End: 1pJtPB-0000XW-Sf
Subject: [f2fs-dev] [PATCH] f2fs: allow set compression option of files
 without blocks
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

Files created by truncate have a size but no blocks, so
they can be allowed to set compression option.

Fixes: e1e8debec656 ("f2fs: add F2FS_IOC_SET_COMPRESS_OPTION ioctl")
Signed-off-by: Yangtao Li <frank.li@vivo.com>
---
 fs/f2fs/file.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/fs/f2fs/file.c b/fs/f2fs/file.c
index b3bcb50490bd..fda04c37b48c 100644
--- a/fs/f2fs/file.c
+++ b/fs/f2fs/file.c
@@ -3990,7 +3990,7 @@ static int f2fs_ioc_set_compress_option(struct file *filp, unsigned long arg,
 		goto out;
 	}
 
-	if (inode->i_size != 0) {
+	if (F2FS_HAS_BLOCKS(inode)) {
 		ret = -EFBIG;
 		goto out;
 	}
-- 
2.25.1



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
