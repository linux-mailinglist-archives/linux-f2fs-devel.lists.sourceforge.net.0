Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 8BF2D6526A0
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 20 Dec 2022 19:55:25 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1p7hlq-00028b-20;
	Tue, 20 Dec 2022 18:55:22 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <frank.li@vivo.com>) id 1p7hlo-00028T-51
 for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 20 Dec 2022 18:55:20 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=MIME-Version:Content-Type:Content-Transfer-Encoding
 :Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=hlYBh0y0FcLRb0xMOAPnPQk/aJccpRT4LiAZomTRAJ4=; b=giHo1lsHfrCPRYDuhKacQQaycX
 VGJQyQtqEFk1QVwbE8PQGPUjKbx718pL7MVlNYQFzXMUC4qat6V4Bn9DQkHhHiA6esvsW+uRsFyos
 0bel7jvzRb3fE6DFN9YysYaVoFTvKbrCdJiWNXq3bIdMUFUK2BknqIaLVrzyUlaNt4Kc=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:Date:
 Subject:Cc:To:From:Sender:Reply-To:Content-ID:Content-Description:Resent-Date
 :Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=hlYBh0y0FcLRb0xMOAPnPQk/aJccpRT4LiAZomTRAJ4=; b=L
 /3Up/+8QJPOjvsqK0vBa50LtI3aURQ1cJU6QAlDo0lOvm1sqOukItK0O6oSZsiBH3Nl+CoNrsva7c
 zHDWS7Rv082UdqGj77p8L0VySfRnIJ8U8I7UqeZ9diCIKvxTKrPHi8U3wmmuko47ww0gaYV4GHY98
 QQJFU+zmXYNLhKXw=;
Received: from mail-psaapc01on2137.outbound.protection.outlook.com
 ([40.107.255.137] helo=APC01-PSA-obe.outbound.protection.outlook.com)
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1p7hlm-0004AB-8a for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 20 Dec 2022 18:55:20 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=NRetAC8GXzrZYqcjGxPFx/tIpWyOOtvo2Ghts4/3YZHvFNFlpbEtL+iRZ6Xcbg4uIINiQ+ymaLMut+ksBoO+EJxS++tmg6sqHzkMwHFCxQImWdnRNwuJhTjxpgpOLP+CBf7gZSDzUqIWOpYsrCh+g7DpV47+SlE27MDUvTxKIvHQIpALGHc0f1qIHHrywIvvVbmJLQ+yohRVkb7hE/zfxIvx+utixdY97oM0ckswSylt/2R0qf4FVW9SMrfXh81odvqEXS6DIHxhXfH1QfZ4SQUdNavN52ru8Lb9MfjYxGvYnIB0NstIT4xw59HwB0qt8suGCFjXyMi6EyvVtHi9pA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hlYBh0y0FcLRb0xMOAPnPQk/aJccpRT4LiAZomTRAJ4=;
 b=gxqXiCx92GbR0hZ9WWl96F9V9HzkcfAKFOcO2Iha7qZCFJ+kTKGWjMt1aHFQD03WQGCCRPRYCQ4VLtAii09FmRILLgwePb9mUSrslyzjVpivjc+VTon6FE8sVc9Xxmhk6YcjdguI0tkKQHAQiw3fW14LNglRI8z3czZb5tcdXRtShST9D7rImbj99B7D2WSAIgputpzk/UlZfU0rKg7PjB45fpRcTgwfpi9laO4WIgd5/VR3+nJBnkNzwZXcl8PkGniT9csAknb8/mWsYLBcuad0dOwBLHRv0t60sK1GR6heI4rCWJoMCKsAdITV/Jsw0RM7SxHT87QfvfExhZrkpQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vivo.com; dmarc=pass action=none header.from=vivo.com;
 dkim=pass header.d=vivo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vivo.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hlYBh0y0FcLRb0xMOAPnPQk/aJccpRT4LiAZomTRAJ4=;
 b=Ln61Elv8CHI1G75+YBA3A3SsjS3cIT5ExCK7J3VZMIsai7PT/bDWiL1Qv6aizMfZtXip+0oVRUW/43xrTxTwjaM+QU70hF4Wj9A46su37ZJWVxjZoeFfDNSVcK63kyBzW+gfSsl5hIh5EF4IhF26YfCl9PhDpEzMo7eRQ2RWdnXtT2F5uybChj0J1Z4Psw+tMDFU4qWvBF0cDbL1K8/k9YDmjOXTUYjkS5fDiuBEbHLEhKn24JsJ2hAR5re8Y+IuMwVqXXE1mcMBLsn75wneRuis7ecnRwjMecuVARZ3+r3JQhOkDRz18z5E5MHpipJr2QfWL1IQCRCtWH/JaSrOvA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=vivo.com;
Received: from SEZPR06MB5269.apcprd06.prod.outlook.com (2603:1096:101:78::6)
 by TYZPR06MB5227.apcprd06.prod.outlook.com (2603:1096:400:1fc::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5924.16; Tue, 20 Dec
 2022 18:55:10 +0000
Received: from SEZPR06MB5269.apcprd06.prod.outlook.com
 ([fe80::ef03:cbfb:f8ef:d88b]) by SEZPR06MB5269.apcprd06.prod.outlook.com
 ([fe80::ef03:cbfb:f8ef:d88b%9]) with mapi id 15.20.5924.016; Tue, 20 Dec 2022
 18:55:10 +0000
To: jaegeuk@kernel.org,
	chao@kernel.org
Date: Wed, 21 Dec 2022 02:54:59 +0800
Message-Id: <20221220185459.55950-1-frank.li@vivo.com>
X-Mailer: git-send-email 2.35.1
X-ClientProxiedBy: SI2P153CA0001.APCP153.PROD.OUTLOOK.COM (2603:1096:4:140::7)
 To SEZPR06MB5269.apcprd06.prod.outlook.com
 (2603:1096:101:78::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SEZPR06MB5269:EE_|TYZPR06MB5227:EE_
X-MS-Office365-Filtering-Correlation-Id: e112560d-3051-4d56-2365-08dae2bbb843
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 0QRjDmUic+WcdsPzsCVE5mr0j9fc4RvRMPb/XfIiXJvH44bXAdia2+jPK1QA/8JhbWdhDqvdtkqZ94Zd5wFNuPOlD2KE4NwIkZPHb3Ost1IZb/QWd/s86t7p0/C9Saawbk+p9FjCWc7Lcmlc1hZmgyAKCuj6YQLOw3b7q0qPjShKLacojmNp2a5trYHRClLgZdjjohWvOiNshMAJXwKBKSxsm2mW27KN+hglud367HcLwuVak0VRyxN1jorva/AXGKvZSCwlVZh3xlLCfUnarNumf/34CgvA6mrNVuDSkNr3ulBdT9wAwWZD+aDUZ8OgZvgXtYyn8KeT0nWHP9S5BrEvI/r9oECBTHdZy/csZqD6y02xC83WYiNqzHnU6bERjPRKjrilEDDUJ3Mg7JirGEWAFKEYu9wRVAPZg7KxHZTTkG+v3XOxCkUrlslwVKxoXhuPx4DyYeKwDuVWfmZrOhek5w9sL5GvKAZ4sjSczvTaTypu0u7VOxBYJ25KgbOzKRltSm9UhTrBk7wKlf2/jr0N0fg0CdMaoi66YIPAwjtTjxc+XaUNEaXiXUPSCiuDfC75FMFKDwC3GWk/3OJqs7fy7MZS2H7PJJEssaWQSA0yT6GpDaXP4hFG+1ru3xf7cMd3+hoXv/VOd2u1RwDkdPnk2xKYZ5K2i3y7iqwPzYFtb6feThZ5DkreuYK9nzGPJtsXVdvcwJaoClcYPG0aIA==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SEZPR06MB5269.apcprd06.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(4636009)(136003)(366004)(39860400002)(346002)(396003)(376002)(451199015)(6506007)(6512007)(6666004)(478600001)(52116002)(107886003)(6486002)(66946007)(66476007)(2616005)(186003)(66556008)(8676002)(4326008)(316002)(26005)(38100700002)(83380400001)(1076003)(38350700002)(15650500001)(2906002)(41300700001)(4744005)(5660300002)(8936002)(36756003)(86362001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?RN1u9WrVtG4raNsRMRTNZRW5s0KzsQ9oL04WDN9KlSnrs29WGHmFrD4Urn+A?=
 =?us-ascii?Q?ohFyrob+7loOPgHnkbmgkDvNnHp3Xx9P36VCXskT1lpwCeRyHy5SDOMGfm3k?=
 =?us-ascii?Q?LYk1UsUn7CxDW9KA2ZeG0Un7Zx1MGVaWBThXW7hVwdCucJMtvZltdmH2QqS1?=
 =?us-ascii?Q?dJ3jaPnp7QtMDXoaGT0xib73xtVUHdyXZM1GM9WngdgHHdc9mWdWmCn5JUPL?=
 =?us-ascii?Q?ygvnFtaYwyIS/DaGVn+nBQMghsO6nJQHBX8e97q1C0+v1vc+uW0/Q2dMxkg6?=
 =?us-ascii?Q?ckV6fO80pqHnfY8apgbvzqZm1i2r0sop+90uS0kvC7wToltMjgPpYUJh0dx6?=
 =?us-ascii?Q?UUqZfCgR+HBZNc9eTeSEOIkv8W1U1m3f30ciXVZKueNQrFtSH0BtC3qyM7Ju?=
 =?us-ascii?Q?Kuxm15QKANv45wHrPqwjSQTyXvhNRG7SkUnl49iROwibEz505ClYNx7Ez7nx?=
 =?us-ascii?Q?c7nAI85Aq75Ncb3NCo00/bZo0mvnNji7WSZ8fGoIv8AEs46Vjs/yx99YAl8Y?=
 =?us-ascii?Q?YcijjNWVihfw8bE8i+ySa0ZcsxsMJ2BLL/tYCaxV8ATPzvn0iwNT+EZeRqdU?=
 =?us-ascii?Q?LqpM4euWJLcTRrjfMfECAo5LuH1JlFx/HmDYNfBnYz00ip8wpcuOil4FZk/W?=
 =?us-ascii?Q?/iZatKfyYjmutP5LSPf4GdZucyTVZNwMAkvcD9laDN/jrYf0E+ZwnFtMO1Lm?=
 =?us-ascii?Q?6ylYYV2nIjBAYSQKnzNHMUcree8SrO0Iukx43/sA52tEzkYOfOKwj7l42dzG?=
 =?us-ascii?Q?oJEdD+h8/btRnvYbNUJP5a0aVwySAZZL1cL9HbioBRpveDUGrrrJkgKqRQby?=
 =?us-ascii?Q?Ufn7aK0Fsu9EifZyPgGF/vJXN2rxeo1GQPMlSM7zEASDg/5S5wbM2NxD4Nfq?=
 =?us-ascii?Q?lS9qhDGenAEBeQeGRaISqBvR70xueGfOXly05mrBC9FULWTWHnLp+oI2IQtN?=
 =?us-ascii?Q?W/y/xo+O58jYFUPZpSv0dq6ZHhCcNqgbxZxH1C5ZxEf922gETwJgGhLP0DLl?=
 =?us-ascii?Q?N0sGI30NeKtcJ9L5/l3Mqn9cajc8VjV4s8Np5n5pz+poMglD8RKAIRkPW25k?=
 =?us-ascii?Q?gAlkOzUjrMh5JF74E5LyrFx5s3Eppxf4zVxC7XIlKbgYO37dimK0lqGhDh9/?=
 =?us-ascii?Q?6fFV4TdQ1hMoVnXNjPYrNEhhfOh3TTurapgPBxYOC6Sh2SjVhHEX9kdtvHmm?=
 =?us-ascii?Q?dpIsTcm9pERvr1ALO7LIcx+gDl5mCHh7jzoRUYKmxPtQNW013AJvifPiEMQA?=
 =?us-ascii?Q?N3thbfJVNSer8wXejtUOXtQmx1orhJjWa9mMDP2EOYBTKpqVI4JHHINNKgyw?=
 =?us-ascii?Q?e+ajkDGj8ti8gAUXpsPOtwepUK5WjGN1POXtDlnZrnKKGsG3dvbZgJgX2gYi?=
 =?us-ascii?Q?7ZwqpXkrB7010MIBu11pjW8tNsxK1Ah6skbr5fVQxlk3ANCbrodB0Okmp3Wa?=
 =?us-ascii?Q?rSTYDACnlWkjfbQv7OqGb/06/FovxLsAst5PQGlHI/HA4F337Xg6ie18ixGw?=
 =?us-ascii?Q?J90ZrLRIFHwCuys0KZj4v7VCFnRh3AC1vNSDzbKn6ZdOxgkuod+yWfAMxe/Y?=
 =?us-ascii?Q?nw8wkWcsdlQzmWSdVfvE1jDA/Gl4cXxCXQrXb5Dp?=
X-OriginatorOrg: vivo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e112560d-3051-4d56-2365-08dae2bbb843
X-MS-Exchange-CrossTenant-AuthSource: SEZPR06MB5269.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Dec 2022 18:55:10.6859 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 923e42dc-48d5-4cbe-b582-1a797a6412ed
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: DmbxiXRip0V6BSGxo2XwPm/h8TFAcCjcf2k6jBtpz/AZCGFs2SFmQwcZUMeHqald6qa+9jKJi9chi4k0qkhIpQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYZPR06MB5227
X-Spam-Score: 1.1 (+)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: After commit 4d67490498ac ("f2fs: Don't create discard thread
 when device doesn't support realtime discard"), f2fs_issue_discard_timeout()
 is not only called by f2fs_put_super(). Let's update it. Signed-off-by:
 Yangtao
 Li <frank.li@vivo.com> --- fs/f2fs/segment.c | 2 +- 1 file changed,
 1 insertion(+), 1 deletion(-) 
 Content analysis details:   (1.1 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 1.3 RCVD_IN_VALIDITY_RPBL  RBL: Relay in Validity RPBL,
 https://senderscore.org/blocklistlookup/
 [40.107.255.137 listed in bl.score.senderscore.com]
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [40.107.255.137 listed in wl.mailspike.net]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.0 SPF_HELO_PASS          SPF: HELO matches SPF record
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
X-Headers-End: 1p7hlm-0004AB-8a
Subject: [f2fs-dev] [PATCH] f2fs: update comment about
 f2fs_issue_discard_timeout()
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

After commit 4d67490498ac ("f2fs: Don't create discard thread when
device doesn't support realtime discard"), f2fs_issue_discard_timeout()
is not only called by f2fs_put_super().

Let's update it.

Signed-off-by: Yangtao Li <frank.li@vivo.com>
---
 fs/f2fs/segment.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/fs/f2fs/segment.c b/fs/f2fs/segment.c
index af2d522b1a89..fd3b16f68ffc 100644
--- a/fs/f2fs/segment.c
+++ b/fs/f2fs/segment.c
@@ -1654,7 +1654,7 @@ void f2fs_stop_discard_thread(struct f2fs_sb_info *sbi)
 	}
 }
 
-/* This comes from f2fs_put_super */
+/* This comes from f2fs_put_super() and f2fs_remount() */
 bool f2fs_issue_discard_timeout(struct f2fs_sb_info *sbi)
 {
 	struct discard_cmd_control *dcc = SM_I(sbi)->dcc_info;
-- 
2.25.1



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
