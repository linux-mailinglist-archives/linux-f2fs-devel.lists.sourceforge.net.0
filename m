Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id B6C08679D95
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 24 Jan 2023 16:34:18 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1pKLJN-0006cR-G2;
	Tue, 24 Jan 2023 15:34:12 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <frank.li@vivo.com>) id 1pKLJM-0006cG-QJ
 for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 24 Jan 2023 15:34:12 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=MIME-Version:Content-Type:Content-Transfer-Encoding
 :Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=wXC+m9eUG+mzMFbxwJuWWalt4+y0c5FzY63l4SuGz8A=; b=H5aX6tR3yII3y8f/dtlFAajio+
 FFLewIbrAqgYBpgryNImSN01VK21PmbxQLnB/kbBOk1+8d2TftN9u070BI4HFlpnsGuXW0Uob91g6
 5Fk7G81n47l6q8LS23oSAw0PDao8iI+o+tgqqEb12HcdJMB3bKxWDEHJzUd7OPM4q7SA=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:Date:
 Subject:Cc:To:From:Sender:Reply-To:Content-ID:Content-Description:Resent-Date
 :Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=wXC+m9eUG+mzMFbxwJuWWalt4+y0c5FzY63l4SuGz8A=; b=g
 F1QjU0iTt7FPdGTeXRilghLbFnhBuykUJilV5YpkTekXu3Dj34eRqjVyN5ZQh6F/95+KYYXUbVzET
 hibNS5eJ/7SYIytHGkWe4aT3zHTh7qzg6gh7tN0RciCzatBMRPxV0Arj5w7kA7l/lm1+5yKsRmOnD
 6PK7dV1rb9ydKeLo=;
Received: from mail-sgaapc01on2135.outbound.protection.outlook.com
 ([40.107.215.135] helo=APC01-SG2-obe.outbound.protection.outlook.com)
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1pKLJG-0004P9-KO for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 24 Jan 2023 15:34:11 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=i0TKAfMY6PqbvlhCn9LFFLEAs5BbEQY+0p9JaZfO86FL3n0rjU8vGe3UU9TetzLyT4cTc/a0tbfRJoaPk+R4RdrDPwmuyrlPEKQ7JelCUlWtllBvxWFZ1UIaT1ft5Jy4S+nNeScZDX32hsngTvj+NsWatstefBh+dSscsUeHn5wTMk2v4KOypBC3Sj6/q/iEUwwrvK2rkO6+LhnGtbAM+ST/wXw0IZNLoduGbwMbS6CsP/8JGv7IHtmoHVmESnywGy4yuM44d4fJC5a+5mRYOy989GmIAciF2IZtwwWlOxiGEzZ2RuGf2l4rSjMfXgH2mu+JtxeN840yOvrTfJ1GJA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wXC+m9eUG+mzMFbxwJuWWalt4+y0c5FzY63l4SuGz8A=;
 b=m8SA6Bc9B0p6Y8b1BHcoXYPD7LdCzZDRIh1ic8xGAzn6xTg7ETbOG8pthKoHuu1adipfLIyt77nONQkpV/FpD2/Hwq5qW5C4vMpvxLd04RVNPwrjSa9uLmccarCteBsD2/roE/vrRJI1OZwityIySOjQ2NIgMn+zqAzYToRGHZ1kfqlynR/gBgcT5yLnKvVVg7BE/BPi/PiR+dGTcxbeFJWtHBYo0FzIoc/emBMlr8Bfq9iooQh0uhmJNKdbylpr9EkVmSVyrt/23h4DKm5723OgqGHpJP2/I1aOkqfnJNN4ZuSh1Oe205NT/H/r0o252fkhx+1bRDyvnIeJLkT5qw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vivo.com; dmarc=pass action=none header.from=vivo.com;
 dkim=pass header.d=vivo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vivo.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wXC+m9eUG+mzMFbxwJuWWalt4+y0c5FzY63l4SuGz8A=;
 b=gfC81AMw9a7dPtCBj28UXcwJxX8p6JiNWmhpyWXaXsBg32t1X0YDdLo0/hd5u/2oCL8P1Swnh3zBMq3XQlgne6HzSXTwrrNjTfWgj/rdI1qqzWjtjHtjhgomN4uB1KF6WEViAgbhCTDJE7k/vY1bvLP4efSaJmJZjAgIoLR4mQnczbrdqXQEmcxrSOQWRd5SESL4SPFGRYUCDyylP7SvMt/yMTMp0ub+5Dr9dKy6rG0QmKCPfH+HAZv9zzKRRymWQfc8ffamq4rYh+fUUB6u/jA/irRtAi2D7wP31XkRfcuLg0hmSKjv8AgWGpL4WkUL+cRvftODCvj8cq3M4MhQrQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=vivo.com;
Received: from SEZPR06MB5269.apcprd06.prod.outlook.com (2603:1096:101:78::6)
 by SI2PR06MB5019.apcprd06.prod.outlook.com (2603:1096:4:1a3::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6043.9; Tue, 24 Jan
 2023 15:33:57 +0000
Received: from SEZPR06MB5269.apcprd06.prod.outlook.com
 ([fe80::3e52:d08c:ecf4:d572]) by SEZPR06MB5269.apcprd06.prod.outlook.com
 ([fe80::3e52:d08c:ecf4:d572%4]) with mapi id 15.20.6043.016; Tue, 24 Jan 2023
 15:33:57 +0000
To: jaegeuk@kernel.org,
	chao@kernel.org
Date: Tue, 24 Jan 2023 23:33:43 +0800
Message-Id: <20230124153346.74881-1-frank.li@vivo.com>
X-Mailer: git-send-email 2.35.1
X-ClientProxiedBy: SGXP274CA0004.SGPP274.PROD.OUTLOOK.COM (2603:1096:4:b8::16)
 To SEZPR06MB5269.apcprd06.prod.outlook.com
 (2603:1096:101:78::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SEZPR06MB5269:EE_|SI2PR06MB5019:EE_
X-MS-Office365-Filtering-Correlation-Id: b6084881-f20c-4562-0f25-08dafe20683f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Ehd8+5R0/wXTMxYqS8eTIG/duol3nK5o+tAJ7LtB20UXqxmQNIg+DcvC10WO/5giKHaMpOqvK+2/2gYOEB0fh5Vsp8VEm5ILb1NycmpGm4FbXhMBffzZpsODY4R0Ig8Er0FJMrJTm52gWmMz+LDO1eZyMpMolesREkLibgQ730OUzo0A7QUTTqKuUhxxyWLa5BJykeAYSepnAOB+rYyRfL4gkvFm6HfwQBWECHTs0ur1Xxdh2lQSsRF/p1ixI0WqjPxYmINof+iJTqqzXuSQBS4+KSQuLnvpdbb9Opn4/BSA0IIA2RKTP4sfaUYhUQlYwKjzfUIsJsMYEIE3Ydv8uwzI7NYIppJR3QuqQ0fdmLOMRv1InshW7aJGp/IYxXAtpyFPYxHZgonaXO/9BcZPLEqcFTjDvUa2Q4gQ8pFgMFVOb9toq24oNtRMMmKGmuAD999Y2uYhBq+cZbpXWZemdBQ2ljLkVrj8339JQjFW3qFYstfyRFVgj94zGuQsVB51wr9t2xcuvX2BAR91B8zsRKJsCQkhg288GJGlDXC8SucU2TbpkrTrLTZHGoETkIYHvuqfF8SbQbkwqXI3RNmxL/71Gg6Mf8lNqSksZfuPooVHXnEhjv56LPlxIHef3LKWJHXK6f7AZom3+i7SrhcFNU5ojOS59V45c7aSPZn/1CTtqpDrnAnPwGLW/gcTMOYh/KRcTPLyRuTuK885aeut06BYtliii+Fo8rjjJu6Z1xE+txuOpfuUpbOiy3VTTv2E
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SEZPR06MB5269.apcprd06.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(4636009)(376002)(346002)(366004)(136003)(39860400002)(396003)(451199015)(2616005)(2906002)(6512007)(26005)(86362001)(186003)(38350700002)(38100700002)(36756003)(8936002)(52116002)(316002)(5660300002)(83380400001)(41300700001)(6666004)(107886003)(478600001)(6506007)(6486002)(4326008)(8676002)(66476007)(1076003)(66556008)(66946007)(42413004)(32563001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?Ai6EbR4W5iV+luRASWxrMOrzZJqLpY6ZKHtnqutJFN+eW1e3nRaymfrnXYCV?=
 =?us-ascii?Q?h0PvnE+klPVmUsXrzI+4EIlrU8D/LnAJOUzBfRJgz1Pb+sLYuigPYqimWqrO?=
 =?us-ascii?Q?3blED057S9hLaNnVKxRXaWveDjUiQLKbGwaV+UwU8NqpOMXt1VJZ7E7MOelr?=
 =?us-ascii?Q?AuM35L9O22Yuve0yIxEVAkf31ROQhqL/Ssm79chELdNrCeqTsjXqBrctMQHR?=
 =?us-ascii?Q?HycFaELD74Ef9s/MS9TsldHVWMylw9tUdKXEIs5Z7t2EZ86S+GBJg0OFyb1/?=
 =?us-ascii?Q?23mIkHaUN0KoGZVkqJPqszv259ne0euTQuKeU/p5jUpipE6nvWqspB7NwxD+?=
 =?us-ascii?Q?8ik7ta8XN9gaUrU9W4enVJ8zTR8+KMZGsqFfC7g636x4A+/1snyKLtWQe4IQ?=
 =?us-ascii?Q?WQbOLK5Whrld6x+kjd9LBKhHngILsnrE6yK4GQExMp5OQvXq+JSWR61UTLLi?=
 =?us-ascii?Q?LGsZnL1Ippa905OCBjoepgLddPE10CGzojnxVIUHD9kQyoE1Ma5rzIsYx6wC?=
 =?us-ascii?Q?ZHKDdw9wa19kyJ9MjsSgS6nS1BaLCfpgpCWBUorwo6o3aANR3uKUrwRc0wj3?=
 =?us-ascii?Q?mHW4vGQeyyULZJsDnQTVBJ0XJ6hcsh8zR/uI0E6tp58vyNP4qNBplK2AIyc5?=
 =?us-ascii?Q?lXuO1g6/B0KYs4bTarxTb5AmcG3aXCDEhvaTaM8QxhlfXnGSGdZmDf64dyH6?=
 =?us-ascii?Q?98FX25VUZ7Ie4OpjThOA6gWjqLb9QbnDv6gNJNHO+9BgkvqADLyQI0ppa6QH?=
 =?us-ascii?Q?Oi47A3uHU+i0VZe/wt/iPrEbCDf9dbxy6j8Njm1yPr99vy+s4yKWTj2QkDHO?=
 =?us-ascii?Q?9KoSvZzf1DAbBDhJ1NKwg0JpuWJLffSl/CsygFpSJru5nIdGmg50MbVE5gM/?=
 =?us-ascii?Q?LKjjb51mY4jlF1njlt3pbNyhkhU6wsV57Yj2lZUdeSHdSYS70yuT+mSwnMkC?=
 =?us-ascii?Q?r/6OIyBM0XpMQzm/YyF+aw+MBkm6Qe8yDHxjxuFF8lMj42EDuNX5vnYFYjk2?=
 =?us-ascii?Q?FD/j438Znlg7lZi6DmnXqPYJY8aeCFB1oMK2hODiV9St8h1IsmoVm7WO2C/A?=
 =?us-ascii?Q?hqGOkf18/3UBZOyo90OCzMl1ZJeLBwu6xc4Dfbbmv/aO59j3lIG5y71YjPHp?=
 =?us-ascii?Q?qoslzYaP0/v+HuAnV/SCNanlkpjAnO5L7MS9hIEovXomdEUx0L/JfuOJU4rJ?=
 =?us-ascii?Q?OlMiUaeQv+TFwvr/smQBssN3ypcXqgiS0YTFbQEYHyJkc3FuOoF8NtUYAa5A?=
 =?us-ascii?Q?m81A/tQCX/tjaYlsEjB5qdiCIOJp3aQU9AlE6uBbQ91VXGsDYUD9EGBchOuO?=
 =?us-ascii?Q?gMGmVbD9DNeQ/U995YLxWXxWcYXqplNerO4cZxZggE7uvENhKSnTF7LmNkad?=
 =?us-ascii?Q?i+rV97bpfWt+3dZeOzh9GiZoYtSsWXijTsxOBVW5PJTuq2WO4uuoFijhTNIU?=
 =?us-ascii?Q?I0ioU6gJ8FtEcrYDa7AQKsnHBrtsYJEZqkLQ0vPtDskOyfflKq8OjS8XSg8Z?=
 =?us-ascii?Q?OcrrvxWVPSgIt8pQ+PKJV4lI+RVUChOftaZl50m0b7aFxIvWaur0g6C7BSdm?=
 =?us-ascii?Q?If3oWgOPJv/dpgoDQ65AnW3uu45iV2JC74ayIOcm?=
X-OriginatorOrg: vivo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b6084881-f20c-4562-0f25-08dafe20683f
X-MS-Exchange-CrossTenant-AuthSource: SEZPR06MB5269.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Jan 2023 15:33:56.9905 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 923e42dc-48d5-4cbe-b582-1a797a6412ed
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Nd7t5/xm9sKV26iNJSRydXkP2u8ct9mbskUA6JyQmTCUNAMRmq3fkg3Ketxm77zrffT1aVVex7V/pOakxlMVnw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SI2PR06MB5019
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: f2fs supports lz4 compression algorithm and lz4hc compression
 algorithm,
 which the level parameter needs to be passed in. When CONFIG_F2FS_FS_LZ4HC
 is not enabled, even if there is no problem with the [...] 
 Content analysis details:   (-0.2 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
 no trust [40.107.215.135 listed in list.dnswl.org]
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [40.107.215.135 listed in wl.mailspike.net]
 -0.0 SPF_HELO_PASS          SPF: HELO matches SPF record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
X-Headers-End: 1pKLJG-0004P9-KO
Subject: [f2fs-dev] [PATCH 1/4] f2fs: fix to check lz4hc compression when
 CONFIG_F2FS_FS_LZ4HC is not enabled
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

f2fs supports lz4 compression algorithm and lz4hc compression algorithm,
which the level parameter needs to be passed in. When CONFIG_F2FS_FS_LZ4HC
is not enabled, even if there is no problem with the level parameter, add
the level parameter to the lz4 algorithm will cause the mount to fail.

Let's change it to be the same as other compression algorithms. When the
kernel does not enable the algorithm, ignore this parameter and print msg.

Fixes: 3fde13f817e2 ("f2fs: compress: support compress level")
Signed-off-by: Yangtao Li <frank.li@vivo.com>
---
 fs/f2fs/super.c | 31 ++++++++++++++-----------------
 1 file changed, 14 insertions(+), 17 deletions(-)

diff --git a/fs/f2fs/super.c b/fs/f2fs/super.c
index d8a65645ee48..ad5df4d5c39a 100644
--- a/fs/f2fs/super.c
+++ b/fs/f2fs/super.c
@@ -588,19 +588,11 @@ static int f2fs_test_compress_extension(struct f2fs_sb_info *sbi)
 	return 0;
 }
 
-#ifdef CONFIG_F2FS_FS_LZ4
+#ifdef CONFIG_F2FS_FS_LZ4HC
 static int f2fs_set_lz4hc_level(struct f2fs_sb_info *sbi, const char *str)
 {
-#ifdef CONFIG_F2FS_FS_LZ4HC
 	unsigned int level;
-#endif
 
-	if (strlen(str) == 3) {
-		F2FS_OPTION(sbi).compress_level = 0;
-		return 0;
-	}
-
-#ifdef CONFIG_F2FS_FS_LZ4HC
 	str += 3;
 
 	if (str[0] != ':') {
@@ -617,10 +609,6 @@ static int f2fs_set_lz4hc_level(struct f2fs_sb_info *sbi, const char *str)
 
 	F2FS_OPTION(sbi).compress_level = level;
 	return 0;
-#else
-	f2fs_info(sbi, "kernel doesn't support lz4hc compression");
-	return -EINVAL;
-#endif
 }
 #endif
 
@@ -1085,10 +1073,19 @@ static int parse_options(struct super_block *sb, char *options, bool is_remount)
 #endif
 			} else if (!strncmp(name, "lz4", 3)) {
 #ifdef CONFIG_F2FS_FS_LZ4
-				ret = f2fs_set_lz4hc_level(sbi, name);
-				if (ret) {
-					kfree(name);
-					return -EINVAL;
+				if (strlen(name) == 3) {
+					F2FS_OPTION(sbi).compress_level = 0;
+				} else {
+#ifdef CONFIG_F2FS_FS_LZ4HC
+					ret = f2fs_set_lz4hc_level(sbi, name);
+					if (ret) {
+						kfree(name);
+						return -EINVAL;
+					}
+#else
+					f2fs_info(sbi, "kernel doesn't support lz4hc compression");
+					break;
+#endif
 				}
 				F2FS_OPTION(sbi).compress_algorithm =
 								COMPRESS_LZ4;
-- 
2.25.1



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
