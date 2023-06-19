Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 07D99735AED
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 19 Jun 2023 17:14:52 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1qBGaa-0004M8-Vm;
	Mon, 19 Jun 2023 15:14:45 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <heyunlei@oppo.com>) id 1qBGaZ-0004M1-2y
 for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 19 Jun 2023 15:14:43 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=MIME-Version:Content-Type:Content-Transfer-Encoding
 :Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=k0CsHNtfxLTQodyJkBTcfGjINEaKjznyfUJgi+yWUpQ=; b=UcLQ0SmtMq8cRN8IboVjVtPevG
 5T5EWAEx71dZeo0Bbs3y9DJMRiHmDyFaOn/4FEGHWPW4ojlj0MtbU/ov/t3R2oouLZLKhjctzZn2R
 qaLZBZaw/6hmPo94HSQHfJoHjYFb9Q+mTCneRvYUp04pkMs4pflob25+26Fx+4hltqBE=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:Date:
 Subject:Cc:To:From:Sender:Reply-To:Content-ID:Content-Description:Resent-Date
 :Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=k0CsHNtfxLTQodyJkBTcfGjINEaKjznyfUJgi+yWUpQ=; b=O
 sMCBFITam9rRjYWSARu+QKM0LBA2fpzh6Qmt8QHge+2Rhz0/q+iGIlZG7p4e9jLTLcId/+dPiBhw+
 7Ha7cLw5Sinpld/u7ilBMQU1yQ0+fsfkK96GOczveXQ/B8Lxv2r6WOvCTQNoy9Hk8A9CWW4IhNUTw
 VUkWebOnrEsO/YEo=;
Received: from mail-psaapc01on2073.outbound.protection.outlook.com
 ([40.107.255.73] helo=APC01-PSA-obe.outbound.protection.outlook.com)
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1qBGaU-0008Mi-Sf for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 19 Jun 2023 15:14:42 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=F+4LxN+zliuEKylx9g7A7l0RoF0dfe0mREeNIrmVI5W70NBVL34zXXZQYVuWeojUesEcmRRO9JhLy2IKyrBuqQ3CgnVR+krtlJToqwsyUY1WxmxEmvG9QNRBBRwEn3Lo9WZnQ8JAZnBGt80QQuY7mNRhQyDIqjMCZsNXURbA9qwlRJvKl7zwdg8mdOKz7NxfipVPZpJCvA7Fnk1BL+0g2fz7NbfHz+i1wbQVdrExCkMecqLpJENqKVnAlxB53CaodHTVsh/UmueHq+JJX8KTT3a4s8dAVYp0fVF3slESeHps56NzqCckJmJ4z+tRyhYhPfNy9/B/j0IQwbYZboM2Uw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=k0CsHNtfxLTQodyJkBTcfGjINEaKjznyfUJgi+yWUpQ=;
 b=gcA2EOkShRCQNyYvsAGsKndjCu96GQZbEaApr4NDcjr2l/xGF6zs2YjWbyxFrhhIiDVBFsroerVQxJH0waJdvfgYvJ1/eGltP8okhaV649n8NHiG9FOS802QdKtcZbRKE2bO3AXUHMEHqq27dAQo9Z645UZYlyhFUme0XyWoxK4NTZOUndthZMUflMzXGbXlLqvnf4PfXN6qSJHLckWosai7TNAQy29XRWhi6DtNvVG6aRpMcYgB4Mh7tmGRQ6IAXaskKE6l2Gow0bxU3x1TYl8pOl/pn0K/HBfswVcT6XJyBbAE2WNBqkq5s9NgndRJTDvxonPJnrU83c0Nw8mUXA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oppo.com; dmarc=pass action=none header.from=oppo.com;
 dkim=pass header.d=oppo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oppo.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=k0CsHNtfxLTQodyJkBTcfGjINEaKjznyfUJgi+yWUpQ=;
 b=TblfEGjYLfoBfoWVrYx5Hla6Cy3omF3CdJrEkMofnPa8ysDqIImbO4Pk2AQ3ndew5C1HRL1oSAdQjrL+jetb3xVtxShjCFqq4O5YHKrhzOJ68uikF6vh6rl5O8QQYHl7PdhUv/N4C88defTiXVo+AEFeM0N2+7l/8e4S1WrjB/M=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oppo.com;
Received: from TY2PR02MB4479.apcprd02.prod.outlook.com (2603:1096:404:800e::7)
 by PUZPR02MB6211.apcprd02.prod.outlook.com (2603:1096:301:f8::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6521.19; Mon, 19 Jun
 2023 15:14:29 +0000
Received: from TY2PR02MB4479.apcprd02.prod.outlook.com
 ([fe80::bc4a:4d7a:4c73:76eb]) by TY2PR02MB4479.apcprd02.prod.outlook.com
 ([fe80::bc4a:4d7a:4c73:76eb%4]) with mapi id 15.20.6521.020; Mon, 19 Jun 2023
 15:14:29 +0000
To: jaegeuk@kernel.org,
	chao@kernel.org
Date: Mon, 19 Jun 2023 23:14:16 +0800
Message-Id: <20230619151416.2168499-1-heyunlei@oppo.com>
X-Mailer: git-send-email 2.40.1
X-ClientProxiedBy: SI1PR02CA0052.apcprd02.prod.outlook.com
 (2603:1096:4:1f5::20) To TY2PR02MB4479.apcprd02.prod.outlook.com
 (2603:1096:404:800e::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TY2PR02MB4479:EE_|PUZPR02MB6211:EE_
X-MS-Office365-Filtering-Correlation-Id: 3f992703-b743-4f7e-392e-08db70d7e0dc
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Wp96vUwAx8bmp9/X1JYnQgh1qoc1o438krUcPGjAmFZUzN9v8AeoJ8SPbOciQZaiCgvcjFDrTV5lYLst7Az08WphNVGm6CHZytHygCVGibBC/HY/aQ/FVjS5Enb9krrMxLZM7raDGCMYIZTzN1oz2UXlZCFbbgX9VnN9103Jb3+RC7oOKKvXDCXQTkpF32kEiTn85L3O/jq9dzG9NyEdDabxmDBkcFZ6FkUtLXyJMoHjmtN6vwZUGaGoLIqqhTefaHmbf207HTzZOw+oKVU0DBUpBy2gYQdHIRISpTXoHWp4Ejx7Vf8GNoffLM8CCfqGhsP+PCnUoUUtfLId8Piu0sEaVtkjW82ZBIq42LJ/I0J053F/U5wju3rU6zthb8zZLRrPVvO6qoj9lTE0poN/ewHh6bzIPf1kmBYbIvOqc0kcObsxoiazS6bHgfk+wgjGu4E8ZPCs5fPAEBWVm3xP00vrEDs06ZxFpiN3Jp6Z8JM65bYhi1YQm4jQ/GrVjKDOufLCrerV1C5qXxYhj7VhSiEgLDi1IVJxES2RMMff/MXX8cbqAZpylTkeNSHUjQM/JW073g4wxlkbcT+NoNPbYdB4qlaPFMTJhwPhmcwFi6kRtfAmMD61AXEOTu3qPKL7
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:TY2PR02MB4479.apcprd02.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(4636009)(366004)(136003)(346002)(396003)(39860400002)(376002)(451199021)(107886003)(2616005)(86362001)(4744005)(2906002)(83380400001)(5660300002)(66476007)(8936002)(186003)(66946007)(8676002)(66556008)(36756003)(26005)(478600001)(38100700002)(41300700001)(4326008)(6512007)(1076003)(6506007)(52116002)(6486002)(38350700002)(6666004)(316002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?hMMTFB7dLkYek2PdYwVOE4uz72l8/9U8LFSMhkBk1uXwoEoO5D0AWnWFY3sq?=
 =?us-ascii?Q?+8GOQf5z2NTP4SkRS50cFOsc07dRXntjo1EGMT3WoWwi0X1pP5IP/brwqoMs?=
 =?us-ascii?Q?RkOFs4FvpSaSihGXU0u5SXo1YuCY6y35oqtgtvOUGSlc0FPrmR7xvfGFhDCP?=
 =?us-ascii?Q?PpstTBsVKuLBHguJyKKGu9HgfC9J6ICEl597X8S2Xm9HVrimhKHlcxP8nj0s?=
 =?us-ascii?Q?7FK/Bkb2giCVmOyBDv+ndfd9k35AC4Wv3zQYtVjbuTQQCWRxiDi6XNERlrT1?=
 =?us-ascii?Q?o3MTqCPZJc1KN+fm64C6syjUM8LnV0XI1xdMiRiNmB3k8HFVONqgrQOPcz1A?=
 =?us-ascii?Q?K38vm2B2s/7NVFSiBJa8/7R3/Rkpj52TdOpdS+olpalyw7l6LzYUp+4ChPg2?=
 =?us-ascii?Q?EB1OZpd7kux8bIdZECS4duyLSzwUEj3LTWAMl8CEXslJfPamsfmZQYdUrd4Y?=
 =?us-ascii?Q?ykFKXAf0b4rPFAvlAB9RX4r7lktyCEkOZ+851PsE/Bfq6sX7yePJsHNnVJ1J?=
 =?us-ascii?Q?srbK7QBIITrYuBUuRrzMogHYw8EjzDQvmPlQ+aQwzbi0ktV60j8Pv3NSwgO6?=
 =?us-ascii?Q?wT/Lbi/Nr2wfj66sv3JkfLAcMWJOr+wOAZgfv2lmEd337B0mfP9lEmffKlSg?=
 =?us-ascii?Q?n9xBVyZVr5tzTlxETDKkl8KDGRqwgQTL6lI3CdCehEihPJU1R/yAzfp6gj+l?=
 =?us-ascii?Q?tqjJFd+rROV20Pl4x6vtoGdy8E3nGP23bn/thmp1hDKvg79BFZu/KN+Yl6PM?=
 =?us-ascii?Q?yO7ufoOrZMMLnrW9B/81+kax9mtXHSvyBx2ialFnXniGxhQCsgGp+D14iptG?=
 =?us-ascii?Q?94FCzr4rjb7ucshPUobXQqIRUSdQRej7B0aLUjcnu2tE1ntrO5nupfX966U8?=
 =?us-ascii?Q?SleVQVmAkg4uJxbXQXaO5U/RHiT2UCjt1Io6URcrhtN32Lng5rnYsCzdglxT?=
 =?us-ascii?Q?rgieoSUV86rdkQdLOkKW3fhbil+8B3o5aNli1Y5cUG7pMK+6w+1xN2WdUYRr?=
 =?us-ascii?Q?12AWkRSP8PUE2Qh6sggeNugguOJhLiTMFnHoT4tNBYewvFKj02fbs6WE9gW5?=
 =?us-ascii?Q?bVeISEHzWtY+Q48JJtsar1He4gMnZeKoq9v4V0pIMd3D3tUUuaAFdXbUaZ4r?=
 =?us-ascii?Q?emF0+V3miDHKHgw5Z1wtPHS8uY6hlQbdEijyqj3r/3WJbEzy6a/vHTgbBy2t?=
 =?us-ascii?Q?GQrF9X+kBDqkOyL17n+ygYTT0OXlunl4iF0TOjkyK4foyTGQRbs74Oc1R4s6?=
 =?us-ascii?Q?M7LxQOMobqDualkUYZDMKq0mndTfCb7YrezlWyZw63uDJ37mVvb2OFubl1jN?=
 =?us-ascii?Q?i0FWJ7GKpGqLrhrAdVdzTbh5uW5tC/jPuwN0+H+ujbutOoYh6azN9Zup9PfT?=
 =?us-ascii?Q?r1Pevt6w0qPzObeS3tXDPu9gXRpZKggR9RAapNbHwkW4er85xg6T4g16J/mC?=
 =?us-ascii?Q?MvcP69oLWjn0ab1v6doCK2ZAJL1/E+G0gXcADoBquaCH8GmfRe5+5edbfZVG?=
 =?us-ascii?Q?CE9vh0lbEwZn6Wj+tEVjKDR62+UkOLQJZqT67yDmY3IerxOMWBVxoEDLk2HZ?=
 =?us-ascii?Q?iZ/QWnoz2HFSL/KdoiLgk7ovqOk6jvxJ1Xl5Ph69?=
X-OriginatorOrg: oppo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3f992703-b743-4f7e-392e-08db70d7e0dc
X-MS-Exchange-CrossTenant-AuthSource: TY2PR02MB4479.apcprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Jun 2023 15:14:29.7645 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f1905eb1-c353-41c5-9516-62b4a54b5ee6
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: AHpADtPM64H8UmGCyvkjbVKDGy/FSMKwA+W8fV+Xzwmq4owtijalaZr474nYn6FTl2wS0eaZOH/dHD6O/mzPVA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PUZPR02MB6211
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: This patch count mmap write io more accurately.
 Signed-off-by:
 Yunlei He <heyunlei@oppo.com> --- fs/f2fs/file.c | 2 +- 1 file changed, 1
 insertion(+), 1 deletion(-) diff --git a/fs/f2fs/file.c b/fs/f2fs/file.c
 index 41e7c2b80f31..147ab24ae579 100644 --- a/fs/f2fs/file.c +++
 b/fs/f2fs/file.c
 @@ -152,11 +152,11 @@ static vm_fault_t f2fs_vm_page_mkwrite(struct vm_fa
 [...] Content analysis details:   (-0.2 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.0 SPF_HELO_PASS          SPF: HELO matches SPF record
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [40.107.255.73 listed in wl.mailspike.net]
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
 no trust [40.107.255.73 listed in list.dnswl.org]
 -0.0 T_SCC_BODY_TEXT_LINE   No description available.
X-Headers-End: 1qBGaU-0008Mi-Sf
Subject: [f2fs-dev] [PATCH] f2fs: count mmap write io more accurately
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
From: Yunlei He via Linux-f2fs-devel <linux-f2fs-devel@lists.sourceforge.net>
Reply-To: Yunlei He <heyunlei@oppo.com>
Cc: linux-kernel@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

This patch count mmap write io more accurately.

Signed-off-by: Yunlei He <heyunlei@oppo.com>
---
 fs/f2fs/file.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/fs/f2fs/file.c b/fs/f2fs/file.c
index 41e7c2b80f31..147ab24ae579 100644
--- a/fs/f2fs/file.c
+++ b/fs/f2fs/file.c
@@ -152,11 +152,11 @@ static vm_fault_t f2fs_vm_page_mkwrite(struct vm_fault *vmf)
 	if (!PageUptodate(page))
 		SetPageUptodate(page);
 
+out_sem:
 	f2fs_update_iostat(sbi, inode, APP_MAPPED_IO, F2FS_BLKSIZE);
 	f2fs_update_time(sbi, REQ_TIME);
 
 	trace_f2fs_vm_page_mkwrite(page, DATA);
-out_sem:
 	filemap_invalidate_unlock_shared(inode->i_mapping);
 
 	sb_end_pagefault(inode->i_sb);
-- 
2.40.1



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
