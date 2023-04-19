Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id ABCA56E718F
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 19 Apr 2023 05:27:01 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1poyTA-0007eq-8j;
	Wed, 19 Apr 2023 03:26:56 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <frank.li@vivo.com>) id 1poyT8-0007ef-Ql
 for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 19 Apr 2023 03:26:55 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=MIME-Version:Content-Type:Content-Transfer-Encoding
 :Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=OjHzi9FD0wWlg8TEYTy6ZQDafhjTGwCfezsR+jsv0Tw=; b=D/08cMOOG+jaRZi0XO8mvroGS/
 MPWa28xU6TxqFeAADJBvlXTqmbNj/f/BA7lYei1zEDMEvGTB3jM3pLl+Fa2SoPIMmttIB7872bfac
 zjB9JewOW/rg9Oxr/lKBAD2C44MNyXSqatajcrBzGrwD+zvnKpIihiaI6FYTiQxruKWE=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:Date:
 Subject:Cc:To:From:Sender:Reply-To:Content-ID:Content-Description:Resent-Date
 :Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=OjHzi9FD0wWlg8TEYTy6ZQDafhjTGwCfezsR+jsv0Tw=; b=H
 5eY9iCdOG6jafDCsoH1y7rQLHfaDD1krpXBb22lf4ra0PR8Kmu5MJl0Zh1cyFgTDGS6ctBFrJkgPZ
 3o10aDDsEFD0INl5beohkytohl7OLBwAJBwSz4NMRuEJu6eAsW1RDxlPdgZeByTEJJGiOD64K4fwW
 IxDTGDUg6dpKhOBA=;
Received: from mail-sgaapc01on2103.outbound.protection.outlook.com
 ([40.107.215.103] helo=APC01-SG2-obe.outbound.protection.outlook.com)
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1poyT8-0003Qj-7d for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 19 Apr 2023 03:26:55 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=OOE+dzP9MVmKv8ZVuY3O8dwg+EX18mToTNXPMvtXdhbcmht1OGj1Ra6XaN01adfo5BHsNLTD3EzWC/587HPbls6nQ74MnmcT0VdECwLA7mxKv1UOYEtgh+ROQ+BliheRXMpqsEjaCsDWUP7EVrgB6TziBFKtP16MOg5s3NJU5wSZhTie4exq6Mywo6+1uIspevQyaQNz11rTKMPWNrOAX9n1P+igppAdTRZx3nrRUDxGCOvWTgap3k1d7wa4y0d3wTpPIuXkQroR8CW8IE7MW2kiV1y0f3Mfp1zSCZYAspf1jTDP4d4SnAX9XI3SOIUuw7csFfOfu8TOQ7S66Uw1kA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=OjHzi9FD0wWlg8TEYTy6ZQDafhjTGwCfezsR+jsv0Tw=;
 b=Kog3Y9vGQrBg04NQzMipfoMRfQyyKNHB5owrYjPrmbnIcGhzy/TR4t6WuC/6Tjwef+8InfLVAVQcs7Wj5heTOfl2yHmj0jjvBHyI8isbRAOWkPeZHWEuWd4vBoJoI9R7mxnnDJyJDfYlp4JZxwkBYlFK6pINgg0bpb0gq2BT12kWOiQ6rCg1oE3MVEW4+UZQsGPJ60GYl19sDmlazhjQGkwtOcFklI/WPyIOKNhG9w69vwbQrRrTWE257u6H1uBFjfE3wyBYaXeM+vSFZL52PQAenAISm2eGtKuoG8CDXaqOaMOA4BbgmRItry9F1nINSfsJanb6wlqfgD5JA0FhMg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vivo.com; dmarc=pass action=none header.from=vivo.com;
 dkim=pass header.d=vivo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vivo.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OjHzi9FD0wWlg8TEYTy6ZQDafhjTGwCfezsR+jsv0Tw=;
 b=qihesdGykmB0i020UD7vBudSKusn5YvdXAxeGZyNUWNrCbarCcBApWlynRvqjb0KXpCmWFXBQsyfnlImB5pNX8wSmS8/pQWziSKjWkiiOG0rcKJub69bO8zPz2B0rD+8Ch5xavyq+9CMdpdfQQoKxvv/a5fg9JDl4LIMI1WfItfKxNEOPJC8LkKfrp9g9CnBecYcvaUJM9df/BYO4fZoGQCJnk3Oo/8mNb7JGzJ6GI28yF7e0gT8FABnxjf32Gyl9g+9SZ3hIbWhyvqw+voyAHAgUyoJbQvm1AcqPOIzG1kJbiMcYplHNqTuY4yW87LzWdTcrBC9GNHPESog1eqgbw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=vivo.com;
Received: from SEZPR06MB5269.apcprd06.prod.outlook.com (2603:1096:101:78::6)
 by PSAPR06MB4151.apcprd06.prod.outlook.com (2603:1096:301:2b::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6298.45; Wed, 19 Apr
 2023 03:26:40 +0000
Received: from SEZPR06MB5269.apcprd06.prod.outlook.com
 ([fe80::76d6:4828:7e80:2965]) by SEZPR06MB5269.apcprd06.prod.outlook.com
 ([fe80::76d6:4828:7e80:2965%6]) with mapi id 15.20.6298.045; Wed, 19 Apr 2023
 03:26:40 +0000
To: Jaegeuk Kim <jaegeuk@kernel.org>,
	Chao Yu <chao@kernel.org>
Date: Wed, 19 Apr 2023 11:26:26 +0800
Message-Id: <20230419032627.15421-1-frank.li@vivo.com>
X-Mailer: git-send-email 2.39.0
X-ClientProxiedBy: SI1PR02CA0041.apcprd02.prod.outlook.com
 (2603:1096:4:1f6::18) To SEZPR06MB5269.apcprd06.prod.outlook.com
 (2603:1096:101:78::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SEZPR06MB5269:EE_|PSAPR06MB4151:EE_
X-MS-Office365-Filtering-Correlation-Id: e6d489d3-5c9c-4818-8fd5-08db4085e3ab
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: CUP56xiZ6KiEg3/RgNyHVqHPwzGggOQbR5VdsOlKcSwqsShVx1dfcuexqRr8B2H1/92lMvjGPDDX/xlwksQ/8C2Y7wDeWQYksqnLwaKiFJS1SB431yXTxY41FdhWiI/vPEzgTCIveL1Yz3DOeXXebjYhJarxDNv6WR8RVibITcuIKE2RyieO0OE/yBQP4kzvpiUbSfkGAvk0+KxDHL9/qMkVvKuO/3G05k8Sw4MQtyEsp3CVmg1Va2J4O41VqhMOQUJgEsxlsqwJcxFxPSzxHZtJNn+6GbE/sKHGlR3yYU1J1lrPn1hGFI6rNilCh3UmMQWpf+BZ/Q7RDxIKPltcY5L7+m6IDyci9Dy2eQgkRMU3JDR5hsGmKkXBIPtA8rvamZqX15TkzV3aLrot0cCpDNXvKiDvCrPyANSJUAPmgPj/WOxnj9eOrHqNxrN91Fp4YWv7p+Pjv7Xmto+wzETM/RNh41k5c0OOnGbVRM3J6Hdh47E7yj5+35C7J9EbXjQGu/0l2KTHm8eLynQqGwBhh9qzNBC5d4LTVIBAEL2hJ8xVgQFPgmBS4legjeoLiK2atK3mFMV+m3zQEx1kzC4QMmY19OWCkaYJKa3VGC4jV141Pd1+atrUBQxN410R/J30
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SEZPR06MB5269.apcprd06.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(4636009)(396003)(376002)(39860400002)(366004)(346002)(136003)(451199021)(6666004)(6486002)(110136005)(86362001)(478600001)(2616005)(26005)(83380400001)(6506007)(6512007)(186003)(38350700002)(38100700002)(52116002)(1076003)(4744005)(66556008)(66946007)(66476007)(316002)(2906002)(4326008)(5660300002)(8936002)(36756003)(8676002)(41300700001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?i33j5wdNWCxEsOFmhHqhW3TJnd3jhMADr8lU1TL0iqgtnp4EAoaVUjz9tu5j?=
 =?us-ascii?Q?s+XGWscLNGvW3PHD67xulQE3KR3ODi3d2MzzjONYEq+E1NL38BXFCLV1KBfc?=
 =?us-ascii?Q?Ir1Rdgv3YxHiQDgfhUeao3X4kwg3kxaxvpJ3ec+3Kd8tSduo2+cTosQB7Yjv?=
 =?us-ascii?Q?mThEDXgnAMmzKpLSn3b0tCeZk4U/G0WvoJlPx6uirDh8d1Ujp7WkDXy/y2ro?=
 =?us-ascii?Q?ci9YZbAVQ5VsWT3iVWvEYRTe97P4R9bMqDVRDZ4SaK4FItQVACSEUXXY5xWx?=
 =?us-ascii?Q?rehZdh8DravJ9tRiystOqaGabtuygr2iNmwWXMxuz+wA/iqmf4Uid2l67fjb?=
 =?us-ascii?Q?XT60ZhdE1XnzPx00/zBY9+Lsi+dhPajo7Xjm/Bwz1egPTDjcnDjR4THW/R6j?=
 =?us-ascii?Q?F8qLcMCrG9vD29Jh00pfB3fIUhymkFJLtLjGsikT5fa4hshp7nl8j7Cgff3C?=
 =?us-ascii?Q?qcCvgoj07ekcdfqHK4i82bJe0+H2DDVKmdhmqjj57ZJ8UfsVBprNzfL5pGX8?=
 =?us-ascii?Q?qaBEMN+c0EPdwivb42PQe3j8qLTRVvJJ7keVrUVj1zVUVJ8s1dL/QN908gXh?=
 =?us-ascii?Q?y/oZ1l2I+A9V4o+3f3Nmd+DwhQHVFRmOvhi22vz07gg4kZoke+EDz0ai0Len?=
 =?us-ascii?Q?O0mQUt07Zsb2N0ZmIGK6rjiSVwj8rc9xzN183RCjfA6IXc0Y1XOB7FUxAzUe?=
 =?us-ascii?Q?cr+erZrG2fxFamgsEdAfaZ1BRlfjeG1eDDw5KaGv1Mvjj/D3qHTLDHInhUbS?=
 =?us-ascii?Q?6qLiNRHp7r93im77YHxVf7wdClWWBgKo0eiAsjyJvJXQWnQXnclRKXGauraG?=
 =?us-ascii?Q?N9SEx3JXhMBqeQPck/TZ/gedvpdDpTVpbUU3mzRaKQIkDEYLIfUR+AjSmNbw?=
 =?us-ascii?Q?OJW45VyfTrGNoipzbHvhEKe82GYDeCDZq/Zf4klF0SrcyzY0tPi50ZZSkL8C?=
 =?us-ascii?Q?i+MimLFkn9emqwdQsJ+G01l6UkGYi6jrwG1WVNYDBTTLj7kh+UwXIS4mXTqQ?=
 =?us-ascii?Q?t92wizSRbsZ2gXnWxKyzu/TeeA9KHzNLewuTfxHfWGOBaS5rvwl0YuQ6S36V?=
 =?us-ascii?Q?YGZy/r01CSMBes4u+LBYylRv05vagP/tWU+lLEcOKH2Aj0INg/zwn8zQBKeI?=
 =?us-ascii?Q?W1jWosV/IMRbqtaEZUwvgaRuDST7ANSuNI4hfyOpRRIMus0ltLSZsvxckDAC?=
 =?us-ascii?Q?lMqEiHU3NnCf313b58+i7C6jzo9hNOHiWebUKyEqk/98jh/eL8LYAvSXEwgq?=
 =?us-ascii?Q?ZynoWAu22OZzWLrRSMmhozNVxq1E3wwwgj/vbjI6bR52ODqxNKP78yNUbVrX?=
 =?us-ascii?Q?DaCYfHHXkh5CVhd/HD5xugwjilgR0XHgPhhdMFpKwIa8JVkBOhDpliDcyyNp?=
 =?us-ascii?Q?RCnPYGIoUypZftctCiARMcZSmHS8crGZQ+IPhzItz85oQOAYZMpe3O/clArW?=
 =?us-ascii?Q?ghQniXaQAOiqyRlswBvd17tT9t5haJm0ejC2XE3X5uFTRkA/L+wuWY9fifmo?=
 =?us-ascii?Q?6C5V2cLmeQ2euKGgl533q3aKX00lpvgJHcrqwJpWX8AmAnlysLPY4Y2rw7nU?=
 =?us-ascii?Q?UZmUZ7u/dOJo3+TVkSS2t4B6igD1CfXz+kYnN0ws?=
X-OriginatorOrg: vivo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e6d489d3-5c9c-4818-8fd5-08db4085e3ab
X-MS-Exchange-CrossTenant-AuthSource: SEZPR06MB5269.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Apr 2023 03:26:39.9841 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 923e42dc-48d5-4cbe-b582-1a797a6412ed
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: mLt0GLn/0OG/2nVjMjb2/c3MYIfGeqExFCmCfN8+HfETvxj6xTB7kiptbNMXCtOTOYlILrsP9/7KNP0tr+hpVg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PSAPR06MB4151
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: Add missing 'is'. Signed-off-by: Yangtao Li
 <frank.li@vivo.com>
 --- fs/f2fs/super.c | 4 ++-- 1 file changed, 2 insertions(+), 2 deletions(-)
 diff --git a/fs/f2fs/super.c b/fs/f2fs/super.c index
 9f15b03037db..357d45e49635
 100644 --- a/fs/f2fs/super.c +++ b/fs/f2fs/super.c @@ -1362,7 +1362,7 @@
 static int parse_options(struct super_block *sb [...] 
 Content analysis details:   (-0.2 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [40.107.215.103 listed in wl.mailspike.net]
 -0.0 SPF_HELO_PASS          SPF: HELO matches SPF record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
 no trust [40.107.215.103 listed in list.dnswl.org]
X-Headers-End: 1poyT8-0003Qj-7d
Subject: [f2fs-dev] [PATCH] f2fs: fix typo
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
Cc: linux-f2fs-devel@lists.sourceforge.net, linux-kernel@vger.kernel.org,
 Yangtao Li <frank.li@vivo.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

Add missing 'is'.

Signed-off-by: Yangtao Li <frank.li@vivo.com>
---
 fs/f2fs/super.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/fs/f2fs/super.c b/fs/f2fs/super.c
index 9f15b03037db..357d45e49635 100644
--- a/fs/f2fs/super.c
+++ b/fs/f2fs/super.c
@@ -1362,7 +1362,7 @@ static int parse_options(struct super_block *sb, char *options, bool is_remount)
 	}
 
 	if (f2fs_is_readonly(sbi) && test_opt(sbi, FLUSH_MERGE)) {
-		f2fs_err(sbi, "FLUSH_MERGE not compatible with readonly mode");
+		f2fs_err(sbi, "FLUSH_MERGE is not compatible with readonly mode");
 		return -EINVAL;
 	}
 
@@ -2356,7 +2356,7 @@ static int f2fs_remount(struct super_block *sb, int *flags, char *data)
 
 	if ((*flags & SB_RDONLY) && test_opt(sbi, DISABLE_CHECKPOINT)) {
 		err = -EINVAL;
-		f2fs_warn(sbi, "disabling checkpoint not compatible with read-only");
+		f2fs_warn(sbi, "disabling checkpoint is not compatible with read-only");
 		goto restore_opts;
 	}
 
-- 
2.39.0



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
