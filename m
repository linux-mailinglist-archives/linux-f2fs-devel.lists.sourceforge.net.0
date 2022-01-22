Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 6896C496C70
	for <lists+linux-f2fs-devel@lfdr.de>; Sat, 22 Jan 2022 14:00:48 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.94.2)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1nBG0T-0004Yy-4k; Sat, 22 Jan 2022 13:00:36 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <harryausten@hotmail.co.uk>) id 1nBG0R-0004Ys-RY
 for linux-f2fs-devel@lists.sourceforge.net; Sat, 22 Jan 2022 13:00:34 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=MIME-Version:Content-Type:Content-Transfer-Encoding
 :Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=yghdBw56YF1paU336NuMlPRTxRasqAjVNHkVFgJN45c=; b=ljueEgAmzlAIlnO4e4l2feaQAd
 IhVEy+TZBLyb0PcroWf8iqCI5W132ybf9OO62j/CbMxqOanunCcqh+grJ3BvS+hXuheDRMjxMak/t
 05lPdUJEO97DgQ9WN9quKlTGroJjk4kjRzM+OREQW3tiYjEQ6ZrC7GobpRaU3MjVC7v8=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=MIME-Version:Content-Type:Content-Transfer-Encoding:Message-ID:Date:
 Subject:Cc:To:From:Sender:Reply-To:Content-ID:Content-Description:Resent-Date
 :Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=yghdBw56YF1paU336NuMlPRTxRasqAjVNHkVFgJN45c=; b=e
 LWgnchVjQO1AkT+mii/o5Yo5oYraoQbDEY8QVwvxhyAPKDAh7wyj1qaOaMyx5O6u7bhWp7iA+3gPr
 TAE43LsqkhRCu2lkwg8TGH4i4Ctqt5rae5fR6epi6AyNjq2EVSdXH4Yoi6iAXdgaeVRobA6K8G5hG
 R4umcda2GFxhlue8=;
Received: from mail-oln040092067051.outbound.protection.outlook.com
 ([40.92.67.51] helo=EUR02-AM5-obe.outbound.protection.outlook.com)
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.3)
 id 1nBG0O-0007x5-Fw
 for linux-f2fs-devel@lists.sourceforge.net; Sat, 22 Jan 2022 13:00:34 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=CxgsALpat1JAB235Ds39rFRMq9XTflYj89fjbbG9lD0cIwxCcrF0ab6GqRrS81+WijrAqT6aI/KsaJfb0XAgG3LKw3CtkpBG6QGbZvlLd2wy/WYn0mI/FCQJlt0/tCedJV0inrMRwBADeQdQw7soN+/96VI+iem4N7PtFMBaN0FrQgWRcZSaHgnllap3tK/0m+TIkm18SLLvlG8ZG6gHRQgfeWPQbTCYJ0rF2GsgkV/nMYB8IBcS+PtJIi7duOXMh/MG6h5L6XKXPUyk3UnYxUVS3VHhvlLgwc7UsGC0+IilTNB1Bj/cv8Bodw6i4MvclHJtYT0Y/Ym3iqAnrPDvkw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=yghdBw56YF1paU336NuMlPRTxRasqAjVNHkVFgJN45c=;
 b=MnDhJEYW60fITpxxkKA7USS1LV3XHR70VwJbgU6+8Imd87iHShmUWSdi6phgfFKJN+BrlbYM96JgkNHj6UyCl3AxvLi4FgQOfv5EwXIWOpi0ubKPh6v8V9rA5MntZI4Dpns6yiWr9bqrLptLJgx0gjrn3JlL85DbaEx2J1zwrZuIApX9sdQo1ci/wKgRuw/NVtqGyGlev+NfXqnsw9AJpcghahGypNbZpQZNIzjahfUe5KJHGQ3podZ2ezxcfWhGuRWoYrDyuNiNiQTb+cPtoVvjnyrhcS8HfAcwSKlMJ07KOP4/3mCdJc3U0pBORXxD09pd6X0UGdkTWdwq2sR1Ew==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
Received: from AM6PR10MB2838.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:20b:a2::21)
 by AM0PR10MB3364.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:208:166::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4909.12; Sat, 22 Jan
 2022 13:00:15 +0000
Received: from AM6PR10MB2838.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::29d8:5a1d:50be:a0b6]) by AM6PR10MB2838.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::29d8:5a1d:50be:a0b6%6]) with mapi id 15.20.4909.014; Sat, 22 Jan 2022
 13:00:15 +0000
From: Harry Austen <harryausten@hotmail.co.uk>
To: linux-f2fs-devel@lists.sourceforge.net
Date: Sat, 22 Jan 2022 12:59:03 +0000
Message-ID: <AM6PR10MB2838873D61CE1C0DB91EEDB9FA5C9@AM6PR10MB2838.EURPRD10.PROD.OUTLOOK.COM>
X-Mailer: git-send-email 2.34.1
X-TMN: [fC2plWrq20jE4T6IRc+NStzQ//BfjA3h]
X-ClientProxiedBy: LO2P123CA0059.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:1::23) To AM6PR10MB2838.EURPRD10.PROD.OUTLOOK.COM
 (2603:10a6:20b:a2::21)
X-Microsoft-Original-Message-ID: <20220122125903.4601-1-harryausten@hotmail.co.uk>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 04641f32-9a1f-4562-b91b-08d9dda72207
X-MS-Exchange-SLBlob-MailProps: mBRmoEB1kyIDyj55spNzzZ0EJ7K7ysKeR+bYmYtegQd5R3Cnw9k8mH5LlUVF0NFx+jtjQnxCJDMv4TI93VyHxMgggD1P1c3rQzsm0Xw3asW7L5AELp4kmE8spnD6AQFV8q8NSHhfq/DJk0u4GaiVB3arq/pxT5+EFEXZpj6fRQ2p3ztXToJpdLKGDEPssrbx8ZoxEpvPn40N307QBGPrkTWhrVIPOaLOJ9YeqIHfJwG5JjLoFCGS3pRlg6okAAQlBfHN4y1lSrMWJHNUA0A3+bLQsOhov0BoXqlZrbwK36DSqb/Fzz49xVQ9vKh+6xwD+nJWMgt/zXg8PhZOma/ZybVzjW83ZwDWtSbW/bcZw/v26+Hl2XoKpLoSngg65sii8hwLk7zo+oLENV7u0rDcQxKOr3DWqw7y+vlB/yQGHe2gHCm5h9y1M6IcsYkyVv4/6m9iEAN/CUXpJfY4QUUXwG6g+3ru2iDyWFSQ+YR7oP1oFgPF15gAc+PCbys/ZM8LxBd9P3XFwb6ZBfs91E96fQ/4BDuXDTz8wYU4I8GR/pZczrQ9sbYFJjpOonBx0IBBynt5LUDf5U1krjpFeSBDu9QE3JX40m5Ev+6hoOxW+O0ZsZuDekqkwpVQBCnhhGCBpY3TC8/jxUvrvOeFTq6UI56ao5xBupZsDn59fLUq2Z5zc//DrORdAUyoPJGJGDFpJECRU+gXN9c67OF/7bTbfZ41SUp0Y41dNIOk3dj4eQIkfmDi6UCYgYloJ3wqSAaxWhlzBytmZYE=
X-MS-TrafficTypeDiagnostic: AM0PR10MB3364:EE_
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: sk2+lQO8vkE8xTUQ/x0Wwrti/XUG77m5q921JKfRX/XVYFO7hozWMx3f/jq4QdXFbqb8NEPTeQqZLkzr1yI/XLclyo77OEUuXB+ctZhOJxBuR0C7uPb8TIx0Tpq40E5/PVJ7needQFhtOk8P/2tdNmRLSvAzFeW/UPoVOYnwuGOaXPJ8T9RG+JYwFx0aUbTgDyd5JVIcAJMALaM2MTdGvJqOv3bjG1k2+Y1UzZdZ9/UPV3iHrLaqQqSnypieTvf7K6vpMY3wmmLhNqKqNBHhaop2uasVSMcg0caMI1/0IvJNK4iGD88rhYD0rQCpz9tG5bKHkjAHTVtdI4fdZLfyNF5L1T0UDo3Q0+/9fyhsvn2vP5Qf5AXxBzxdslwqZuJaTx6p1owpw/iquCJ0St8vnw55ziqu/0YIerXmfQzMqVGKLzyCP0tx/mbDE3i7owWOVKPEqSWkX3jMSlFauK0Q1Qtcq5TmFYGC5EGsa8966FP/aoyOwlwyB354ijbfxE+00yWcDmON2+0XjzX/Vc1QQiajvIQL7hJ9DMYyeuPSMvNOhBPUKh5EdACAAXQHqxyNIYDN1OhBMGpZ5b3hGPMWgA==
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?yCG8s0Eh9l7HEK9LSrIpy7KXYpGk3kwGY54Z93oeNRRzloVFq0NRH0RRb3GJ?=
 =?us-ascii?Q?I2F2h5FHdJDCiN5BBsW4Kla+5oeB0Wn5pIPIMaSA2VQUmOOGWQUDTO0jfgkM?=
 =?us-ascii?Q?aB3MwYnzZjQM9O+7mAt+FtSfkC9b0ar/DN3sMdDH8nQS6S8S8VTEmmc8vkxJ?=
 =?us-ascii?Q?cswC++fnT8afVIhZ8EmkWI8ZlBXWwRUAl5/ZSDG7UxpbHWccAJYvofk15UU1?=
 =?us-ascii?Q?gwPnAslmJ25epCIKm0DmZP0ZYtKPndkf9dHJkpVM2YsonRtRH0e+9VR68Ul0?=
 =?us-ascii?Q?gJwee2zoVykhWl9PE+n++7NTia2x74Te3jH531PHI/O9+LntIw0PgkwvdOgf?=
 =?us-ascii?Q?o1fy4Y7Z2eltd23picE4E5PZgWv01kEReYrGSiqC58XEJPwC3OJHp2PndYCH?=
 =?us-ascii?Q?1kfryiCSnO886Xae1TpLLdbl4w213dbjFaYNbExFsFunQTtDAqLhqTqYGorS?=
 =?us-ascii?Q?NSxb6zVkrTFYGTB2zNtAupZwNws2xUfk5u5Szsrg3hrXZXDBqUUlZd9psydY?=
 =?us-ascii?Q?Zv3v9Nn3DlULjV9x3VeaLk/PpH49yHwD1jl+gbBkKQI517fbzN4IEPY+VlbE?=
 =?us-ascii?Q?VfREcuyyhc3GmaYU7fx54N7J28FZkJqnfQl71HErD09afcjXsrgYpKdynnMV?=
 =?us-ascii?Q?0a/zy2S2hCSQ6MyjklTp62b/6roiEBZY8zV3xfgV5ETMNF1VZD3iZSzOj79E?=
 =?us-ascii?Q?SpL//Pgb/YPapR+itmFVw+0rGHzP+so9xzMzrre+vO4lOZEeRlz2YvFtHaZa?=
 =?us-ascii?Q?xpaZ2XZW2oxImnQFzHSHgdDargVdwG7Vzw8W84z+TAnMpkUIULQYgrRsYzuD?=
 =?us-ascii?Q?/QX+qzTP+92C6LO2Y+9HMbgqXTbhQzVuSFnkQMpe2cJz2W1iVkJmvfxKlVf7?=
 =?us-ascii?Q?6HDDbpszBAdJKxDybjm3AhYv6Jl9MAM0zDoLpZ1adqQHDuZsnWDhBmby36cw?=
 =?us-ascii?Q?MOG9/PolXbrdA9tqFYCMlw=3D=3D?=
X-OriginatorOrg: sct-15-20-4755-11-msonline-outlook-6b909.templateTenant
X-MS-Exchange-CrossTenant-Network-Message-Id: 04641f32-9a1f-4562-b91b-08d9dda72207
X-MS-Exchange-CrossTenant-AuthSource: AM6PR10MB2838.EURPRD10.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Jan 2022 13:00:15.2500 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR10MB3364
X-Spam-Score: -0.0 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  FS_IOC_SETFLAGS ioctl should return EOPNOTSUPP if the file
 attribute (e.g. FS_NOCOW_FL) is not supported, rather than silently ignoring
 it and returning success. Fixes: 9b1bb01c8ae7 (f2fs: convert to fileattr)
 Signed-off-by: Harry Austen --- fs/f2fs/file.c | 3 +-- 1 file changed, 1
 insertion(+), 2 deletions(-) 
 Content analysis details:   (-0.0 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [40.92.67.51 listed in wl.mailspike.net]
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
 no trust [40.92.67.51 listed in list.dnswl.org]
 -0.0 SPF_HELO_PASS          SPF: HELO matches SPF record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 FREEMAIL_FROM          Sender email is commonly abused enduser mail
 provider [harryausten[at]hotmail.co.uk]
X-Headers-End: 1nBG0O-0007x5-Fw
Subject: [f2fs-dev] [PATCH] f2fs: fix fileattr_set unsupported attribute
 handling
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
Cc: jaegeuk@kernel.org, linux-kernel@vger.kernel.org,
 Harry Austen <harryausten@hotmail.co.uk>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

FS_IOC_SETFLAGS ioctl should return EOPNOTSUPP if the file attribute
(e.g. FS_NOCOW_FL) is not supported, rather than silently ignoring it
and returning success.

Fixes: 9b1bb01c8ae7 (f2fs: convert to fileattr)
Signed-off-by: Harry Austen <harryausten@hotmail.co.uk>
---
 fs/f2fs/file.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/fs/f2fs/file.c b/fs/f2fs/file.c
index 92ec2699bc85..061bf35c2582 100644
--- a/fs/f2fs/file.c
+++ b/fs/f2fs/file.c
@@ -3085,9 +3085,8 @@ int f2fs_fileattr_set(struct user_namespace *mnt_userns,
 		return -EIO;
 	if (!f2fs_is_checkpoint_ready(F2FS_I_SB(inode)))
 		return -ENOSPC;
-	if (fsflags & ~F2FS_GETTABLE_FS_FL)
+	if (fsflags & ~F2FS_SETTABLE_FS_FL)
 		return -EOPNOTSUPP;
-	fsflags &= F2FS_SETTABLE_FS_FL;
 	if (!fa->flags_valid)
 		mask &= FS_COMMON_FL;
 
-- 
2.34.1



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
