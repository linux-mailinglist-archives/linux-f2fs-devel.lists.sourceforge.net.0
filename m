Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id A54786DEA35
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 12 Apr 2023 06:12:31 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1pmRqM-0002o3-J2;
	Wed, 12 Apr 2023 04:12:26 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <frank.li@vivo.com>) id 1pmRqK-0002nw-NW
 for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 12 Apr 2023 04:12:25 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=MIME-Version:Content-Type:Content-Transfer-Encoding
 :Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=cRixI1QTEPcUZ6ZF/jBdS6RZiN23k9KQkGs6woANuvY=; b=ZkZ4j0TRP3WgmVtMMGYwUYv9AM
 8nGMaYUzHheMywJAfq/A2+Njz7X1JMKtCjWslPskr5QotirWdWHox2yRofbA0sx5KH9gcDz/wVjw4
 LGKGfYjn+62vQ6aNswIL176qcQWzD8RvImRpUrp1af06dw7H/8TFNyItIk+wJSRUWC1M=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:Date:
 Subject:Cc:To:From:Sender:Reply-To:Content-ID:Content-Description:Resent-Date
 :Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=cRixI1QTEPcUZ6ZF/jBdS6RZiN23k9KQkGs6woANuvY=; b=F
 Zuh+wNWPugesby9Upwi6ERRreRF278hPKIMBCi3BK6RIb+t4C5+jG79hwRVrm6oNyZfUUHgNxHzmW
 sXF60EEX1BtthgsiKPdmj/kYOrLFdEsRhvT+B4YRIMyoX0VkDaMXK+ghbkbTYJwfag34strUCWhw0
 LWM7IGsmlAT4b+qQ=;
Received: from mail-tyzapc01on2138.outbound.protection.outlook.com
 ([40.107.117.138] helo=APC01-TYZ-obe.outbound.protection.outlook.com)
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1pmRqB-0001yC-TF for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 12 Apr 2023 04:12:24 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=PYKsNZndpWOcHRKoENyTL0PVOFWqAoo1R0oLAbM47d/YmhCTgwq0zlgN6cRM0rGN5TN5ZkRBSb4P6K0ZE6fzaFcfNHAJqerTAxx4PGAo+O8sjIdx/tFCLgYlsStRCc6Y0Cn7jJcWUWZljzVHUL1TQ1F44qpKICfSjdNwYDZEJju/fZa2qF5B6gtpFb3Gcd5YeC8L2yJvbWgPyXlMrD8/RbnYNXOUD9BSyzm+MFZqL0836NbZxecXNJbTmEBAYrrLrHvCqRrYIVEyYTnb/W/EjOPG2N0pmYhsNn8Z1PBFmEJ5FNYfcwDkR4CyzEPot4/FqB2GFEREIu1mwWzPbwLkmA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=cRixI1QTEPcUZ6ZF/jBdS6RZiN23k9KQkGs6woANuvY=;
 b=SquRVkGnpS5rvlerYmbSOm1/SquiLmH8RReWppEbHPVhWFbctmV/59zBS7LtC02nfP043Z6KggmDf5R7s8HfFXkf+MgqTNlma4a3GhUk9YvF/O8LP3/TSSbb0/OpQzzKVZCc5xS5gMsCoyv+MRV5hKo5Tn4Aoiloh/SATi66gUPNWj/kO15E59Zy6WAPZ1jOKs2t3xmCF8iIUV78aCHugJPMqgSAz2AHENq+WA4xnXQ9eJfDK8J+RAJt3eZ9evGgeKrWQjydxgk7/TSLe7mg1ohr3xEc3lDXyZbO5PhnKgW9k/j0bdCaLIX3VzBs0Buue/DN+yS9JG3tqV9l+w+Taw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vivo.com; dmarc=pass action=none header.from=vivo.com;
 dkim=pass header.d=vivo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vivo.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cRixI1QTEPcUZ6ZF/jBdS6RZiN23k9KQkGs6woANuvY=;
 b=qwTczu+bXwMmoxvhfWvfe5z5dnJQsNQFri21kXWdjJGjn3MOTP9gwOdhs8f2UjdoK3ZuNXio82CEiT7C7rE2YOpsMlinOh2ZmhGFSTqrvzPYoxGgqMvBDxhb4SGqwbvr5QqF1xSexa8UAWGebo54AMPU8WA3Hw89ueLC65pttK28hyMdUzjqWb1N7KG0N9OeGSUAybj7gZPKeSdnCt3enY1dAsAD/0AWTjYZfFyKSGPII6NIRtNcNc7ofos8Bkqg4XWOyzWG9r/njsCh/Ad73hgEpXjZkCd/Qki+7A/6nilEcD0JhKxMtQEn58PZhnJTZOxT+yxU/7i1kerOa7A0UQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=vivo.com;
Received: from SEZPR06MB5269.apcprd06.prod.outlook.com (2603:1096:101:78::6)
 by SEZPR06MB5366.apcprd06.prod.outlook.com (2603:1096:101:7e::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6277.38; Wed, 12 Apr
 2023 04:12:05 +0000
Received: from SEZPR06MB5269.apcprd06.prod.outlook.com
 ([fe80::a3a1:af8e:be1e:437c]) by SEZPR06MB5269.apcprd06.prod.outlook.com
 ([fe80::a3a1:af8e:be1e:437c%6]) with mapi id 15.20.6277.038; Wed, 12 Apr 2023
 04:12:05 +0000
To: Jaegeuk Kim <jaegeuk@kernel.org>,
	Chao Yu <chao@kernel.org>
Date: Wed, 12 Apr 2023 11:49:40 +0800
Message-Id: <20230412034940.41943-1-frank.li@vivo.com>
X-Mailer: git-send-email 2.35.1
X-ClientProxiedBy: SI2PR02CA0038.apcprd02.prod.outlook.com
 (2603:1096:4:196::22) To SEZPR06MB5269.apcprd06.prod.outlook.com
 (2603:1096:101:78::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SEZPR06MB5269:EE_|SEZPR06MB5366:EE_
X-MS-Office365-Filtering-Correlation-Id: 1df07305-9611-457e-2def-08db3b0c1313
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: UlEvkSihMZfho9C8cxVWt+J1xT7d73W4Jigbk/fXuRxCBvrArUak4Jiqk0zj/+dJh5nNEDfC1YAEZP8NOaPqhPeQcYfBZaveQA9vser7tC2eh25OXumBCAMO3szQ9Wxrju3SsN6I26iDr1hyXwxcRSdEw2/YYuQJlsQijIzoN9eksiGVs1gRtpLUsKWDDP1s9FgSKfEa+FK5shj2J1qha4vHeQSbcJm5F5lKhSB6M4IptP8Gjd4aObp7DwUoyDOVsJ/BdBoMts95lSeI3dfhMtczhCkUvE2wKiKkUbb1pWVYZaNtB/zXJvhgsW/c8fdKpPw+8R+ej9YnXCO8+Zc509U0vx0CdQphmdk9q7PthweQRPnQIkjdtHxC2DuOV13PH7KiunZbo5bcNxHzrtSHpaQHk7G896EoRNkxctDFOpEkKh8awj9edr5VkNJYfIsfLD+8Za/1aXCVIVM86sACzhHjMPa0a9mzRvYsEHfQTt42JoZJcoUXrXgB9jMj6eRXtxImCQIChybJqa8q+OynSHOgGESdbXSNPvA+fL5I0nvQcAp2YiA7n06BTeXOUk5YSuLD1VdT1rDiVNtPkTj7qp1BF92WgIPTlA/8kAf4dT0ZDJucTrf3tqGocL4HYsrQ
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SEZPR06MB5269.apcprd06.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(4636009)(39860400002)(396003)(376002)(366004)(136003)(346002)(451199021)(52116002)(8676002)(4326008)(66946007)(66556008)(66476007)(5660300002)(186003)(86362001)(83380400001)(6666004)(41300700001)(110136005)(316002)(8936002)(2906002)(36756003)(26005)(478600001)(6512007)(6506007)(1076003)(6486002)(2616005)(38100700002)(38350700002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?E/PkfKWycbuZVdQH6M/SeLlaASL6TE7osjBvCM18FdMTFnc6clEff2qiAQm0?=
 =?us-ascii?Q?zxEmGDRhVu9dcOoy+kCImWccwfpX+6OMgHnb3ZjylJ/QfMdXYx5baHFusf7o?=
 =?us-ascii?Q?VIL924AhypriOL7nMwfAWtuHbQqGHqxykQZT69TiJsUXYK9OnzYkHIhHv84E?=
 =?us-ascii?Q?3Ut2k9q+HieHafq4ck/HHDfmnAIxBSrKj0XriwegCrdbkhwzbior5BNmk2w5?=
 =?us-ascii?Q?+LsMR1UKbulcmkGY+rXqrckuNlW+7pYPWGBeoP8GdRHNVLvQSGuA9o9tfz44?=
 =?us-ascii?Q?euMKB8T/hbVdoK2hM6GZGPRvYe4BnZN1G4UKE91aQx4bsnLmpVG/GbPvz06X?=
 =?us-ascii?Q?iKaf48StYO0SUfr3SW/NfhssXv/hr66iU54TAstzYf6+znYPH4fMfBUsJMwu?=
 =?us-ascii?Q?hAIcPNIKvfLQobGfgflsRcAYfeRIdfdCW6uurt+ROE4mXtNPYbd2RUdDVgqU?=
 =?us-ascii?Q?tAtLw8f+CcoZS3SFr4cPu+sBKZee1cTvqppvWQAhLaShuLER0/l7cY98RlGj?=
 =?us-ascii?Q?rG094AEPSAxuFqKtLePZ4jhCxct7zn9WDrV5MaSknNWkkJ/GMZTP0f5AWdZ0?=
 =?us-ascii?Q?K+lueGkv2Xk1cbCe9LyiMHC7JBubTGr6kT+EWvPYcht7FLlw5WkpCsfEgK2o?=
 =?us-ascii?Q?kpCwUAEdT0H5ALz3bKG8JTr3GxoJuYtsj8U3cMb7FxLI+68pqHVKtp0Ga7Vg?=
 =?us-ascii?Q?VVoFQQPnH7akgNoKPNgFx9VDL+h3AZDKLiuTCmVZxdu8vUk5aoR0EYLsaC9R?=
 =?us-ascii?Q?2oDNtzRx/Hnqb8cMoCbhJ4GdD4wKGfTjzJAwhAdVDn0vN6lbtaQBkhEMNhPJ?=
 =?us-ascii?Q?HO1bFndn37fP54HT4ZUI0NKUzCo6G53h2l9ccy35z99IVKCdI8Y3wdG/bO4t?=
 =?us-ascii?Q?RBqWEagRpegGEVsw6SYOLLwnj3wR3sGxijuUcfyt9AkFtYKnnjM+EZzWzo6h?=
 =?us-ascii?Q?CHmQYvARlfxkf8L/+kxXBjewyPXbRDiD5hOEhrAXTBuUkaCD3b7cNsiy0d0i?=
 =?us-ascii?Q?xMZA0EQOLCxjvYkGEJ2k8mxIEj14kBfPGpjK3gEzSLJMXfhfa0N5qByRorzF?=
 =?us-ascii?Q?723zbAnJbyhb7OGw5BmYQeUX82s18nm8xXDTymkA0rH26Wb27TAOdf8YlqgH?=
 =?us-ascii?Q?l/0KC6ypNYSnHcWrbA0FD07ax0Ij4aSd7Sro5hUH5iEzuHMESFhu0KpTfVmk?=
 =?us-ascii?Q?5TH1artc2BwkYYil3nnaNvQWCOqCnbnab499i7XFWlAbz+LMyUg22hQ/qrmu?=
 =?us-ascii?Q?5ErzWgRYIsxuPIOmNW/Upp/PZCKc3nW0qrfZ6u3nBVJQy1oFBm873/89FRK9?=
 =?us-ascii?Q?HkwE/354AOS16BPUdB2uMS0RyBjZjCsbpP5slV6cLh0PJHOiYpgsCkDNmMtU?=
 =?us-ascii?Q?YbSIAzBtAOy3R4Phg2Jpj1t64J145M6nRQ0f+RCI4BdMg7oI8CnN/l7PFIIU?=
 =?us-ascii?Q?DfEZoPoXpaJctXxoXgfwTu8PNz0VHpgee1rmE4OiHmNHSEShGQyeL4uxicze?=
 =?us-ascii?Q?OXHwbCZiExJ2ld893IV8rVfMO/bJbXvHAizb7wEYoh71Daad0kOKNHnQsB5A?=
 =?us-ascii?Q?lQvg33qk+htqWUAQh34LpD3dBNTNg75VapCOztNq?=
X-OriginatorOrg: vivo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1df07305-9611-457e-2def-08db3b0c1313
X-MS-Exchange-CrossTenant-AuthSource: SEZPR06MB5269.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Apr 2023 04:12:05.1146 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 923e42dc-48d5-4cbe-b582-1a797a6412ed
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Bqx9jATmutWCIyQ6LgeU+qwBVzIyX87PuO3sco/eGtmlkr26yJ2VwXrrrizbQalcYCfGxg8+Jp4EhDxdRV7G2g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SEZPR06MB5366
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: For the readable and writable f2fs_attr with struct_type of
 F2FS_SBI type, let's directly use the F2FS_SBI_RW_ATTR macro. Signed-off-by:
 Yangtao Li <frank.li@vivo.com> --- fs/f2fs/sysfs.c | 73
 +++++++++++++++++++++++++
 1 file changed, 37 insertions(+), 36 deletions(-) 
 Content analysis details:   (-0.2 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [40.107.117.138 listed in wl.mailspike.net]
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
 no trust [40.107.117.138 listed in list.dnswl.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 T_SPF_HELO_TEMPERROR   SPF: test of HELO record failed (temperror)
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
X-Headers-End: 1pmRqB-0001yC-TF
Subject: [f2fs-dev] [PATCH] f2fs: introduce F2FS_SBI_RW_ATTR macro
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

For the readable and writable f2fs_attr with struct_type of F2FS_SBI type,
let's directly use the F2FS_SBI_RW_ATTR macro.

Signed-off-by: Yangtao Li <frank.li@vivo.com>
---
 fs/f2fs/sysfs.c | 73 +++++++++++++++++++++++++------------------------
 1 file changed, 37 insertions(+), 36 deletions(-)

diff --git a/fs/f2fs/sysfs.c b/fs/f2fs/sysfs.c
index 8ea05340bad9..4d6263e556fa 100644
--- a/fs/f2fs/sysfs.c
+++ b/fs/f2fs/sysfs.c
@@ -850,13 +850,16 @@ static struct f2fs_attr f2fs_attr_##_name = {			\
 	.offset = offsetof(struct _struct_name, _elname),       \
 }
 
+#define  F2FS_SBI_RW_ATTR(name, elname)				\
+	F2FS_RW_ATTR(F2FS_SBI, f2fs_sb_info, name, elname)	\
+
 F2FS_RW_ATTR(GC_THREAD, f2fs_gc_kthread, gc_urgent_sleep_time,
 							urgent_sleep_time);
 F2FS_RW_ATTR(GC_THREAD, f2fs_gc_kthread, gc_min_sleep_time, min_sleep_time);
 F2FS_RW_ATTR(GC_THREAD, f2fs_gc_kthread, gc_max_sleep_time, max_sleep_time);
 F2FS_RW_ATTR(GC_THREAD, f2fs_gc_kthread, gc_no_gc_sleep_time, no_gc_sleep_time);
-F2FS_RW_ATTR(F2FS_SBI, f2fs_sb_info, gc_idle, gc_mode);
-F2FS_RW_ATTR(F2FS_SBI, f2fs_sb_info, gc_urgent, gc_mode);
+F2FS_SBI_RW_ATTR(gc_idle, gc_mode);
+F2FS_SBI_RW_ATTR(gc_urgent, gc_mode);
 F2FS_RW_ATTR(SM_INFO, f2fs_sm_info, reclaim_segments, rec_prefree_segments);
 F2FS_RW_ATTR(DCC_INFO, discard_cmd_control, max_small_discards, max_discards);
 F2FS_RW_ATTR(DCC_INFO, discard_cmd_control, max_discard_request, max_discard_request);
@@ -878,31 +881,29 @@ F2FS_RW_ATTR(NM_INFO, f2fs_nm_info, ram_thresh, ram_thresh);
 F2FS_RW_ATTR(NM_INFO, f2fs_nm_info, ra_nid_pages, ra_nid_pages);
 F2FS_RW_ATTR(NM_INFO, f2fs_nm_info, dirty_nats_ratio, dirty_nats_ratio);
 F2FS_RW_ATTR(NM_INFO, f2fs_nm_info, max_roll_forward_node_blocks, max_rf_node_blocks);
-F2FS_RW_ATTR(F2FS_SBI, f2fs_sb_info, max_victim_search, max_victim_search);
-F2FS_RW_ATTR(F2FS_SBI, f2fs_sb_info, migration_granularity, migration_granularity);
-F2FS_RW_ATTR(F2FS_SBI, f2fs_sb_info, dir_level, dir_level);
-F2FS_RW_ATTR(F2FS_SBI, f2fs_sb_info, cp_interval, interval_time[CP_TIME]);
-F2FS_RW_ATTR(F2FS_SBI, f2fs_sb_info, idle_interval, interval_time[REQ_TIME]);
-F2FS_RW_ATTR(F2FS_SBI, f2fs_sb_info, discard_idle_interval,
-					interval_time[DISCARD_TIME]);
-F2FS_RW_ATTR(F2FS_SBI, f2fs_sb_info, gc_idle_interval, interval_time[GC_TIME]);
-F2FS_RW_ATTR(F2FS_SBI, f2fs_sb_info,
-		umount_discard_timeout, interval_time[UMOUNT_DISCARD_TIMEOUT]);
+F2FS_SBI_RW_ATTR(max_victim_search, max_victim_search);
+F2FS_SBI_RW_ATTR(migration_granularity, migration_granularity);
+F2FS_SBI_RW_ATTR(dir_level, dir_level);
+F2FS_SBI_RW_ATTR(cp_interval, interval_time[CP_TIME]);
+F2FS_SBI_RW_ATTR(idle_interval, interval_time[REQ_TIME]);
+F2FS_SBI_RW_ATTR(discard_idle_interval, interval_time[DISCARD_TIME]);
+F2FS_SBI_RW_ATTR(gc_idle_interval, interval_time[GC_TIME]);
+F2FS_SBI_RW_ATTR(umount_discard_timeout, interval_time[UMOUNT_DISCARD_TIMEOUT]);
 #ifdef CONFIG_F2FS_IOSTAT
-F2FS_RW_ATTR(F2FS_SBI, f2fs_sb_info, iostat_enable, iostat_enable);
-F2FS_RW_ATTR(F2FS_SBI, f2fs_sb_info, iostat_period_ms, iostat_period_ms);
+F2FS_SBI_RW_ATTR(iostat_enable, iostat_enable);
+F2FS_SBI_RW_ATTR(iostat_period_ms, iostat_period_ms);
 #endif
-F2FS_RW_ATTR(F2FS_SBI, f2fs_sb_info, readdir_ra, readdir_ra);
-F2FS_RW_ATTR(F2FS_SBI, f2fs_sb_info, max_io_bytes, max_io_bytes);
-F2FS_RW_ATTR(F2FS_SBI, f2fs_sb_info, gc_pin_file_thresh, gc_pin_file_threshold);
+F2FS_SBI_RW_ATTR(readdir_ra, readdir_ra);
+F2FS_SBI_RW_ATTR(max_io_bytes, max_io_bytes);
+F2FS_SBI_RW_ATTR(gc_pin_file_thresh, gc_pin_file_threshold);
 F2FS_RW_ATTR(F2FS_SBI, f2fs_super_block, extension_list, extension_list);
 #ifdef CONFIG_F2FS_FAULT_INJECTION
 F2FS_RW_ATTR(FAULT_INFO_RATE, f2fs_fault_info, inject_rate, inject_rate);
 F2FS_RW_ATTR(FAULT_INFO_TYPE, f2fs_fault_info, inject_type, inject_type);
 #endif
-F2FS_RW_ATTR(F2FS_SBI, f2fs_sb_info, data_io_flag, data_io_flag);
-F2FS_RW_ATTR(F2FS_SBI, f2fs_sb_info, node_io_flag, node_io_flag);
-F2FS_RW_ATTR(F2FS_SBI, f2fs_sb_info, gc_remaining_trials, gc_remaining_trials);
+F2FS_SBI_RW_ATTR(data_io_flag, data_io_flag);
+F2FS_SBI_RW_ATTR(node_io_flag, node_io_flag);
+F2FS_SBI_RW_ATTR(gc_remaining_trials, gc_remaining_trials);
 F2FS_RW_ATTR(CPRC_INFO, ckpt_req_control, ckpt_thread_ioprio, ckpt_thread_ioprio);
 F2FS_GENERAL_RO_ATTR(dirty_segments);
 F2FS_GENERAL_RO_ATTR(free_segments);
@@ -956,11 +957,11 @@ F2FS_FEATURE_RO_ATTR(casefold);
 F2FS_FEATURE_RO_ATTR(readonly);
 #ifdef CONFIG_F2FS_FS_COMPRESSION
 F2FS_FEATURE_RO_ATTR(compression);
-F2FS_RW_ATTR(F2FS_SBI, f2fs_sb_info, compr_written_block, compr_written_block);
-F2FS_RW_ATTR(F2FS_SBI, f2fs_sb_info, compr_saved_block, compr_saved_block);
-F2FS_RW_ATTR(F2FS_SBI, f2fs_sb_info, compr_new_inode, compr_new_inode);
-F2FS_RW_ATTR(F2FS_SBI, f2fs_sb_info, compress_percent, compress_percent);
-F2FS_RW_ATTR(F2FS_SBI, f2fs_sb_info, compress_watermark, compress_watermark);
+F2FS_SBI_RW_ATTR(compr_written_block, compr_written_block);
+F2FS_SBI_RW_ATTR(compr_saved_block, compr_saved_block);
+F2FS_SBI_RW_ATTR(compr_new_inode, compr_new_inode);
+F2FS_SBI_RW_ATTR(compress_percent, compress_percent);
+F2FS_SBI_RW_ATTR(compress_watermark, compress_watermark);
 #endif
 F2FS_FEATURE_RO_ATTR(pin_file);
 
@@ -970,22 +971,22 @@ F2FS_RW_ATTR(ATGC_INFO, atgc_management, atgc_candidate_count, max_candidate_cou
 F2FS_RW_ATTR(ATGC_INFO, atgc_management, atgc_age_weight, age_weight);
 F2FS_RW_ATTR(ATGC_INFO, atgc_management, atgc_age_threshold, age_threshold);
 
-F2FS_RW_ATTR(F2FS_SBI, f2fs_sb_info, seq_file_ra_mul, seq_file_ra_mul);
-F2FS_RW_ATTR(F2FS_SBI, f2fs_sb_info, gc_segment_mode, gc_segment_mode);
-F2FS_RW_ATTR(F2FS_SBI, f2fs_sb_info, gc_reclaimed_segments, gc_reclaimed_segs);
-F2FS_RW_ATTR(F2FS_SBI, f2fs_sb_info, max_fragment_chunk, max_fragment_chunk);
-F2FS_RW_ATTR(F2FS_SBI, f2fs_sb_info, max_fragment_hole, max_fragment_hole);
+F2FS_SBI_RW_ATTR(seq_file_ra_mul, seq_file_ra_mul);
+F2FS_SBI_RW_ATTR(gc_segment_mode, gc_segment_mode);
+F2FS_SBI_RW_ATTR(gc_reclaimed_segments, gc_reclaimed_segs);
+F2FS_SBI_RW_ATTR(max_fragment_chunk, max_fragment_chunk);
+F2FS_SBI_RW_ATTR(max_fragment_hole, max_fragment_hole);
 
 /* For atomic write */
 F2FS_RO_ATTR(F2FS_SBI, f2fs_sb_info, current_atomic_write, current_atomic_write);
-F2FS_RW_ATTR(F2FS_SBI, f2fs_sb_info, peak_atomic_write, peak_atomic_write);
-F2FS_RW_ATTR(F2FS_SBI, f2fs_sb_info, committed_atomic_block, committed_atomic_block);
-F2FS_RW_ATTR(F2FS_SBI, f2fs_sb_info, revoked_atomic_block, revoked_atomic_block);
+F2FS_SBI_RW_ATTR(peak_atomic_write, peak_atomic_write);
+F2FS_SBI_RW_ATTR(committed_atomic_block, committed_atomic_block);
+F2FS_SBI_RW_ATTR(revoked_atomic_block, revoked_atomic_block);
 
 /* For block age extent cache */
-F2FS_RW_ATTR(F2FS_SBI, f2fs_sb_info, hot_data_age_threshold, hot_data_age_threshold);
-F2FS_RW_ATTR(F2FS_SBI, f2fs_sb_info, warm_data_age_threshold, warm_data_age_threshold);
-F2FS_RW_ATTR(F2FS_SBI, f2fs_sb_info, last_age_weight, last_age_weight);
+F2FS_SBI_RW_ATTR(hot_data_age_threshold, hot_data_age_threshold);
+F2FS_SBI_RW_ATTR(warm_data_age_threshold, warm_data_age_threshold);
+F2FS_SBI_RW_ATTR(last_age_weight, last_age_weight);
 
 #define ATTR_LIST(name) (&f2fs_attr_##name.attr)
 static struct attribute *f2fs_attrs[] = {
-- 
2.35.1



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
