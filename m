Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B40465D14C
	for <lists+linux-f2fs-devel@lfdr.de>; Wed,  4 Jan 2023 12:22:43 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1pD1qw-0003Xc-UW;
	Wed, 04 Jan 2023 11:22:38 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <frank.li@vivo.com>) id 1pD1qv-0003XL-3g
 for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 04 Jan 2023 11:22:37 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=MIME-Version:Content-Type:Content-Transfer-Encoding
 :References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=Ai+JopXKJvC1B6nBPtp1iRnXscgXjQpp2sOPErGoMD4=; b=JeOqpxJWTYkq6o3SEN2LkjspUM
 ZZhfj7lINv3WFXzaxoQzqsHr1TtdFcK5DFibB4ZDNL+k5cxO8zjrVRiUf+mFvVMwIDizy38g8lOX8
 BYOA6zblUQz9wlN7bnQ+4AEqyJE+zFGdV7qjxzR34epb42WqwkqFrmQwEn+koSQI1VYw=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=MIME-Version:Content-Type:Content-Transfer-Encoding:References:
 In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=Ai+JopXKJvC1B6nBPtp1iRnXscgXjQpp2sOPErGoMD4=; b=OLf8L7Ov1IxrJsKUxf6/dDJGJ9
 IWHbas22rwsZew2bFXojHGwD/7rpcHn7+21MWheOxEfm5EgD423jywSasAJgDMCsALCPkROjyP1zP
 OvOYzhG7sZOta38O7ADxSte4ocQjVtidzPqDTXVAFvLSciaXU85ujopb+RV77lOpyC5c=;
Received: from mail-sgaapc01on2121.outbound.protection.outlook.com
 ([40.107.215.121] helo=APC01-SG2-obe.outbound.protection.outlook.com)
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1pD1qr-004Li3-FP for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 04 Jan 2023 11:22:37 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=RhhwM1WabHbZ2fsq8iKNpD1LyWAr5PQ+VEJlaOBmzCtyg3fhmS/hLrVTkI98bMYdPHOE9NkEHT2Pz6WRJI3HJ5HGlGdHsQdmdE+1pg/NSBoy93+i31lgyZj/u5nKdJ7UbT39vCX5J5boC9oejRV6lcFgJHxvCf4lvH/5pfUOKdIUbNIcLBBGdcpf2udd5/KWHIHgMhGCSC4HZOko+NCbs9ez5Dumn2TuM7RmMZtjH6bR89z1qnJsAtR+4w7mJpRF9Nsm2eAYqsicpvBCcXJy8F2S206zjYTc+KbAcUDSkxbwdKDxt83SImQzUZRk5fJrBdFlmC4TpgSZOV5zvDqT/Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Ai+JopXKJvC1B6nBPtp1iRnXscgXjQpp2sOPErGoMD4=;
 b=LzDRiewMOfu2zrT6KBQuXCceyjxCLVqHmz/Xd1aJnQpUpQ0Ck49J6ihZ63MOUjVAENc95TlPBuhDp820ppcYd1LKux4Emtav0iYaL3t/xXI2fF2XWOsh5fZaNL3+2Xqt3JF+hxyhLRwEpIk/SmDaGeO/XAi8/UefpgEdvhkpPRsF2rMsQEPhJpP3yirerCUl6OUWhnsf5n03OZdiYKNC899TOw1duFJxoIuU51Kgku8FkN3LTMR0UkuL5ERiGH3zL74WWPI15LXEmUaJX7YhHCdNqd8wVZcDuKtf+wzAlT34pxQns20kYS3Y52bfsV9cqM8Hg4vQRSVkNiJAbL/LKg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vivo.com; dmarc=pass action=none header.from=vivo.com;
 dkim=pass header.d=vivo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vivo.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Ai+JopXKJvC1B6nBPtp1iRnXscgXjQpp2sOPErGoMD4=;
 b=ZHLgbS/5djIg5/1heBGIHv6ncWGJcHEJCjOwrwLWCXsTHrUAY93vL4yFAYTtlVVKWQGDAKZUkwKKc3MFxaEhFmxNQvxkHlNQTXOUvJYF55EUaUvUsYMjFLI9MXhK37sH4UXUES+A10wsb+DKxN3qxpUahKlxeRmLfadrFedrQ7jeS0LENQTYoQKh11E/LftsA42j6KfBQtoeQ7IVvLCGlx1r9SEGtwH63EV0dR2QUspHO20fNzsCm9qOxEOlHulUSon5kTNyHe07djTxe4qqAzeIA6xrRzs539sESHxBOokZuRvBC5uGbgmwS1kAmC1YOtYy9oaE7pzWWJ8utWJLGg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=vivo.com;
Received: from SEZPR06MB5269.apcprd06.prod.outlook.com (2603:1096:101:78::6)
 by TYZPR06MB5844.apcprd06.prod.outlook.com (2603:1096:400:284::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5944.19; Wed, 4 Jan
 2023 11:22:18 +0000
Received: from SEZPR06MB5269.apcprd06.prod.outlook.com
 ([fe80::7969:5a45:8509:7d80]) by SEZPR06MB5269.apcprd06.prod.outlook.com
 ([fe80::7969:5a45:8509:7d80%4]) with mapi id 15.20.5944.019; Wed, 4 Jan 2023
 11:22:18 +0000
To: jaegeuk@kernel.org,
	chao@kernel.org
Date: Wed,  4 Jan 2023 19:21:56 +0800
Message-Id: <20230104112158.15844-2-frank.li@vivo.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20230104112158.15844-1-frank.li@vivo.com>
References: <20230104112158.15844-1-frank.li@vivo.com>
X-ClientProxiedBy: SI1PR02CA0002.apcprd02.prod.outlook.com
 (2603:1096:4:1f7::16) To SEZPR06MB5269.apcprd06.prod.outlook.com
 (2603:1096:101:78::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SEZPR06MB5269:EE_|TYZPR06MB5844:EE_
X-MS-Office365-Filtering-Correlation-Id: dbdb3fc4-e1ae-45c1-3231-08daee45f0aa
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Kca0+7/glkjNtOiJoauv85PRAIXvI6mMDIYIbq0YkDxd1hwpaFdG/DbImubhDGjT4ta6RScL9VOMFyGtOp92ElII6mdB24KWkN2d77kEyvUJAdrseAnlIkNA9C+kiaGAzBt6PVRtJz5d73v9tS7Bhj2ZMzXiM7UK5KZvQm3+NVU+iphRepoccif5HK7gxKIwZz7g7baB6b3sh219X1F6LG19uHw973BTaIuWaeRhVgJg6As/AgQJeJlqPsLWp4KfUvr85nYgs8hLrjdUurzSGm1w0MqkXii3e0KRptEL+LA1iBoZVd7tS0P2oUsoTcZjxlSuBlVWK5wJRWcbRdqYUPiJsl96WbcAlshEojM7A1O3N7ePfgXX0e009k0h+ynceK/0wexXIBqfV3FZlV/VACoS/3f2g3s+KAVzuTclVzgKBuTq+5eGZ51n1NCxTgnD9GGDicd5dqkFxBCR1ASC9M7U+XmpqlWBEkV2WyJEfNk6rBMPQXNmCqC+KnQlxFXY9sn/aFusogF70+Gv+yZnbvLLvW/hG+8RuJpFKkGUjbi8/Wmgyz8fhC7sCsu96wlhnrOAOFydAcgb6D+LP271AC3YBnGMv7U/l2s9uXo5vY6hAkRfNwDAuka969MslAI9LvprgIrwB6FGv0aJMCsqcL8l7JGQGDn5wgSZ/JzuJFgBth4m+XlDMA04/9K6U2W0
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SEZPR06MB5269.apcprd06.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(4636009)(376002)(346002)(366004)(39860400002)(396003)(136003)(451199015)(2616005)(1076003)(83380400001)(186003)(26005)(6512007)(86362001)(36756003)(38100700002)(38350700002)(2906002)(5660300002)(316002)(8676002)(66556008)(66476007)(66946007)(4326008)(4744005)(8936002)(107886003)(6666004)(41300700001)(6506007)(478600001)(52116002)(6486002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?3NpFpwLocz68LR/PWqTmKLHQmrmAx1HRzN9nNIW5QewrU4k+pkz17u017vX8?=
 =?us-ascii?Q?IEh+Ui0tTLhymOf+GYjttCnWOpQe87sjB0lSnaFlskxkby8vdfj+svBJK2VP?=
 =?us-ascii?Q?tXJX/9qEHfHtVQ+OMvng4cmZ6ZSeTrlI1tIkKInN+3zDJD+CpDz8UGzA04Q8?=
 =?us-ascii?Q?dkD6ZJFhe9loLf9Ul54lhhRjTinksAbqTlDdp4vh6JwFkCdirDnJKPMI+DFo?=
 =?us-ascii?Q?2vk91q1DfQAL7AQy88vJPFS+DldACZU1icPGGRkqgu2t+4tCuhVhLuq8Nwy4?=
 =?us-ascii?Q?PhL/g2WIh8xWMEqv9dgSy8JaASAZbzUTAbHO/zPeNAScujkr6D0JuhJPCTnM?=
 =?us-ascii?Q?t3lBtdhYt6Ot0DIrLCTmYpbr3ggwzX5wgEDy9QSiay/TQsO4cfe9GKSS+4k0?=
 =?us-ascii?Q?fxLJlXjgz9dAwCAhLEJnsG92u9ZsJ+6JZp8ZarA2ER65CsHlhv9oAkW4+mfx?=
 =?us-ascii?Q?SppafrbExSZRcS6fZHXr0yWStCyRgL8IdJ3ggxheTyeijnI/DdUosYXhI2Cv?=
 =?us-ascii?Q?KMIxtb2CMACBk8XK4eGBfkt3iJw3qGgiYcZhYOneYkQjZ2OzGarCFfzyygCp?=
 =?us-ascii?Q?Jv7NmHaMP8d2Izx7q1rLTx+VWvGJB7BAhhRAW2zB4NVr+yHGfTWlNTA0VmBL?=
 =?us-ascii?Q?dqBkPR35sHGVgG8gwrW9KVPC4E1mZg1537QUBwMQDIMuMcKI/jbKHGEFYOxe?=
 =?us-ascii?Q?47vsjr8tcl9HQ5G7HDrwCtwCrWYaySWxUnV2fhwIH7RohVHOqfaKGqMyYuiI?=
 =?us-ascii?Q?6fW1tcAG3v1M5XluzGdp3c2ry6aIK0UIUZ8d89eudM833LrWQ7/MVAJyxjaY?=
 =?us-ascii?Q?yHkuhUOpJGdEK8i5ccUFQGV8odCWiy8pEgp7TDBFNBiMYdJcT1cD2lxiBMDc?=
 =?us-ascii?Q?Mjjqxet54zGV2PQ8jfBUWg63G8cPhvdU+ma4mZW8RPfRy7r/pRFbEg/VIHt6?=
 =?us-ascii?Q?Kuscm47Jnm3TPfCbZ9+u9MpSYjxDCZPHrDUQgdepEjzld9cMfndcXVfZEajc?=
 =?us-ascii?Q?RJSmTe1HmxYloDhct71eEl+YzQmZiq0ZiR8PFcE3VxQ3aV0eDUwAResXFeuy?=
 =?us-ascii?Q?QRkIOh9ROXNaau9+e6LHVYJuTQ7HOn+B56wHliSKcuDM8KWE2HB1194OXALZ?=
 =?us-ascii?Q?Xi8IB/Fzt+kqMfuOY2p7Pr5FTl6zfcKtqzLBqjsxMmn3xOm0Acv8biuYaAwC?=
 =?us-ascii?Q?v+xLAeLLV9JIHIlwX7uiGRtqU33BHsasz1Bjpbwt7UOOQZUgL4zz/R34G82h?=
 =?us-ascii?Q?rIXHUVvsAN2z8Z4D8CPKxBbJWKAXYP3iSb2/crRH364XKm4IJImaZ7gj/Pib?=
 =?us-ascii?Q?vhCBpXVMAGO5Q+xamEGXPZLXBTyW4ZkgP/xWiPgQo3bPJBEnvsPtF8ISKhWm?=
 =?us-ascii?Q?UuFYu5uBzB8RJlSD+ENBF5ZhiY3ilT55ofc4B5ol+qeec70xnUdYiOUY8gNh?=
 =?us-ascii?Q?p2gWzakLyKsMQ2/+lP3WvVJTaBOs89QdqcZKnyllhMg6BCxgjacCcIP3J8n0?=
 =?us-ascii?Q?S/Z0M6zcM7GpuAs+QSI1xvWaBrPzGZVDYGV561pXR6Rx9QKbZj6wL5gUhaxu?=
 =?us-ascii?Q?m3Zi4EEZzD45PKjIgVv6/aJ/nNAWC50lo27wRGYB?=
X-OriginatorOrg: vivo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: dbdb3fc4-e1ae-45c1-3231-08daee45f0aa
X-MS-Exchange-CrossTenant-AuthSource: SEZPR06MB5269.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Jan 2023 11:22:18.6529 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 923e42dc-48d5-4cbe-b582-1a797a6412ed
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: hO+6pAc/DeTQcLTZHX/WX0t/u/CUE5Oqe0LieDKqhGUh91lJy/dcBWCW0ntE78zh9HzgmtqfD5v6xh967eWCWA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYZPR06MB5844
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  When the iostat is not enabled, it is meaningless to call
 ktime_get_real_seconds() to assign values to variables. Let's put the call
 to the ktime_get_real_seconds() after iostat is enabled. Signed-off-by:
 Yangtao
 Li <frank.li@vivo.com> --- fs/f2fs/iostat.c | 3 +-- 1 file changed,
 1 insertion(+), 2 deletions(-) 
 Content analysis details:   (-0.2 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
 no trust [40.107.215.121 listed in list.dnswl.org]
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [40.107.215.121 listed in wl.mailspike.net]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.0 SPF_HELO_PASS          SPF: HELO matches SPF record
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
X-Headers-End: 1pD1qr-004Li3-FP
Subject: [f2fs-dev] [PATCH 2/4] f2fs: no need to call
 ktime_get_real_seconds() if iostat is not enabled
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

When the iostat is not enabled, it is meaningless to call
ktime_get_real_seconds() to assign values to variables.

Let's put the call to the ktime_get_real_seconds() after iostat is enabled.

Signed-off-by: Yangtao Li <frank.li@vivo.com>
---
 fs/f2fs/iostat.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/fs/f2fs/iostat.c b/fs/f2fs/iostat.c
index 8460989e9bab..e7d03c446994 100644
--- a/fs/f2fs/iostat.c
+++ b/fs/f2fs/iostat.c
@@ -29,12 +29,11 @@ int __maybe_unused iostat_info_seq_show(struct seq_file *seq, void *offset)
 {
 	struct super_block *sb = seq->private;
 	struct f2fs_sb_info *sbi = F2FS_SB(sb);
-	time64_t now = ktime_get_real_seconds();
 
 	if (!sbi->iostat_enable)
 		return 0;
 
-	seq_printf(seq, "time:		%-16llu\n", now);
+	seq_printf(seq, "time:		%-16llu\n", ktime_get_real_seconds());
 	seq_printf(seq, "\t\t\t%-16s %-16s %-16s\n",
 				"io_bytes", "count", "avg_bytes");
 
-- 
2.25.1



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
