Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 15E1E6F92A5
	for <lists+linux-f2fs-devel@lfdr.de>; Sat,  6 May 2023 17:16:43 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1pvJeJ-0001Fd-97;
	Sat, 06 May 2023 15:16:39 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <frank.li@vivo.com>) id 1pvJeE-0001FV-Ik
 for linux-f2fs-devel@lists.sourceforge.net;
 Sat, 06 May 2023 15:16:34 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=MIME-Version:Content-Type:Content-Transfer-Encoding
 :Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=8sZAHsPQCHwWNE1SoVsERf8imz0MB6/YZgiCcjXLnHc=; b=WJu7QI8llMhyT7HRI7G50ZxIxD
 3sVubSgcmflZf5N4L7pqTrLkh/N4S6NxMbhzWYk1sYrUnHE5hkclxSOw2dUBne0Lh/UleRZ2eDnax
 arF921gyAtDRRDnxeoXmMnGWB3JYMFgHuyHtYho2AEV4+66Xzthnil6HCo7Pc14WRoGU=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:Date:
 Subject:Cc:To:From:Sender:Reply-To:Content-ID:Content-Description:Resent-Date
 :Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=8sZAHsPQCHwWNE1SoVsERf8imz0MB6/YZgiCcjXLnHc=; b=P
 My2nh1qxBCYp0AOFu1RcFbFNHRmpAKd4Nimxl7inwrMTI5zd/Ue+Idg8tdIIGYDoTiCCtaz32uUO5
 yaQRYyhXRTGlRbstviD0Ax3WjdV2X6MRYkzY57R1HBt/0f56TdNsCAARQ05efhT+BZCXZqkEFJoP4
 XDreLEv5PwjP7oXA=;
Received: from mail-sgaapc01on2138.outbound.protection.outlook.com
 ([40.107.215.138] helo=APC01-SG2-obe.outbound.protection.outlook.com)
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1pvJeA-0004p0-0Z for linux-f2fs-devel@lists.sourceforge.net;
 Sat, 06 May 2023 15:16:34 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=PzXOXF9SvL7zvylq1ZJDnFIOYCDamMklMzMmoU/1HD5+zeK4hn/tOjJfD8TkQO7HpfWcpRXlQgvHiN2GQwPCh+xkGr5xFhKy6yhX4QPFprnk79MUom0nEw1vSRoEydqycVihm1eaSUlmUMP1Mhv/MIia7lDDLR/pRrKaTGv655Q2/aRfhP6xW5Q/ToEmxCkGj+M187/gVFVDGYuhz/VhgvTXANjgVWHc7GxaD9Yp2IoqgHKPHVdHDKaZTOBFeV73nzJmLGLrDrah8DEhCBRSe8bIJ8sGmY8IsdNB2Ku5GKE8vHnSX/ywyvM8MabXxfG5uuzSxID/s8sbdTmKwDesyg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8sZAHsPQCHwWNE1SoVsERf8imz0MB6/YZgiCcjXLnHc=;
 b=BWw4I6DKO8c4KBq6ZXtwQciNn3Dlrt+h6ofF27hgDlZK7d8qKDk0EfYcWbYAkihN24NPfotrUt1z9jWvhM1haD7tAmXZb1zjvjTrosvFJzkf2lxOlVo1thobatbCawDn5xIPuYrZrhFk3L0HTuv862tKeNsSrdx+wPWF30QKc8Z9ewOgOnnlCdlMdyzk/RnwBh+efMWRXErRHrsUxiON8cBxtLao/gXH3xYkIQbZQxKyiQ1uqs380j3jpCmPAKoRfTZKmlugzy+n5eiZmBZnBpZiQmVXuh3KzaJ9OrN/7gt9Bktjw8PXKkWLzsPvP+HgZJAO7Qq8QNTIXaaTUj+NIQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vivo.com; dmarc=pass action=none header.from=vivo.com;
 dkim=pass header.d=vivo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vivo.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8sZAHsPQCHwWNE1SoVsERf8imz0MB6/YZgiCcjXLnHc=;
 b=i+YztswliKCNBPzxSR4n0dV4yFkK4dcoNa7Z10iNkjCCzB+M2/Y88nVgDDUlmrEFdz3cPjc9vMnGbQXmSPIOZMKptuzgKtuhmChI2h1rxtKOK77QO7kRNJqW+iX4SEgWY2fHnLaB4eCuiy0o95YEWnlKE3E7NO2XHoBdxgAettpeTYaAU73oGUk7pgOfrkKPA3LHp35R9bVScF27FeiE6wNP2EAQ1GhE6yQaHqEnStiP5OwCrLrRXYZeRCEdCqvYzBPFYj2pJYyptgSBsZJeVxOI5npn/aaOHW7y4Ff/L4ITZta5jvZiTNuZjJi4TwUIhEusia+sv+bf0OmqNfHGEA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=vivo.com;
Received: from SEZPR06MB5269.apcprd06.prod.outlook.com (2603:1096:101:78::6)
 by SI2PR06MB4521.apcprd06.prod.outlook.com (2603:1096:4:157::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6363.29; Sat, 6 May
 2023 15:16:16 +0000
Received: from SEZPR06MB5269.apcprd06.prod.outlook.com
 ([fe80::76d6:4828:7e80:2965]) by SEZPR06MB5269.apcprd06.prod.outlook.com
 ([fe80::76d6:4828:7e80:2965%7]) with mapi id 15.20.6363.029; Sat, 6 May 2023
 15:16:15 +0000
To: Jaegeuk Kim <jaegeuk@kernel.org>,
	Chao Yu <chao@kernel.org>
Date: Sat,  6 May 2023 23:16:03 +0800
Message-Id: <20230506151604.36890-1-frank.li@vivo.com>
X-Mailer: git-send-email 2.39.0
X-ClientProxiedBy: SG2PR06CA0218.apcprd06.prod.outlook.com
 (2603:1096:4:68::26) To SEZPR06MB5269.apcprd06.prod.outlook.com
 (2603:1096:101:78::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SEZPR06MB5269:EE_|SI2PR06MB4521:EE_
X-MS-Office365-Filtering-Correlation-Id: ab6ebe1f-1587-45b8-1580-08db4e44d5ac
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: D/RXxqMsRMXvGu7lewD9CjBh4wU4Nkzg0abnOUcJ05aGYDhJXWfj4LGAq+g915ehBqxUAJvKnGaS7Sb0Rh3kShZ6rJdsRPoNy0yXp3Y6BrshvzimcED46vRv95bMEZxVDRqALRFKul1R3M28Oua1JN7lOOxEYh3t2n8XedEO5UvwNsQ1NYUHRLWCqP9E9+Z6zjMg8dIfQJjo5FbzxLSf9kmZpIjxq85IXuku5fRLqK2zniRZ735QVgLvzUMeJkcDMu/Fg+8LpiMPbAAPIWyWKaFC+Yc5GA/QZ5ERDigjHnt21bPqI02mWaDOUo910SvHAIOIksm5hRGCHzqgDEs6nn8lFIST5h5EcpMlVLbxN1yHiG1aiBFCSlzS5CXNNGZnWFkxtjfw24/0n+HQLaKga0NNwT8m8bCDAGUuSjBRCj95pkgP3dCPC/JQfNSUgOpxpXY0RFKlNxRXT5BqTRBg5kewVypmM99RLjC8ub04D47II4EcTlEQzumx1oeNWVnhdq6ESbIRxFvLrNrxqEnY5sqahsE8amuOVZCAK0+8fMOnllhBT/p0fy9czzxlCKrFRqN7s+01yBzRQhHIAxWrAZgcK+R2UKCfJJfAl0hVG4s=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SEZPR06MB5269.apcprd06.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(4636009)(396003)(39860400002)(346002)(376002)(136003)(366004)(451199021)(86362001)(8676002)(8936002)(966005)(6486002)(52116002)(66946007)(66476007)(66556008)(4326008)(5660300002)(36756003)(38100700002)(38350700002)(478600001)(83380400001)(110136005)(2616005)(41300700001)(26005)(186003)(2906002)(30864003)(1076003)(316002)(6512007)(6506007)(54906003)(6666004);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?LOoitHujUM+qKcYNSSzA8EEE8Kh3uBuYBYsYLCU1A5efHum8Dnch/YZ2r4/q?=
 =?us-ascii?Q?HyWrWLn+gSfCtG2tRCakzS1oOUsCuEKh1hDHigDsNybVCphfwCxOT2Rep4Nz?=
 =?us-ascii?Q?9M+aTdH6yWEsaQBjedu+YjmyW5MfF201jREcmxITNoYliIQ9ga5IIVVtemdx?=
 =?us-ascii?Q?rrgUlLc9kdTGQI4dnRSRArfMM36DbllqyH1t/OeT449HLkOaC/x9YYXAUJRX?=
 =?us-ascii?Q?az3pY10eeY3mSjwIPVD8aDkxIA4R6GX89gTKdyyzEHe3uMfKl7O1fa2uTOnZ?=
 =?us-ascii?Q?v9vGGCiw9erx5WmVSbOoBxvYiCBE/KMCYj+VhugV17EP6ez55K/CRaGHf9V0?=
 =?us-ascii?Q?XktGrzXAySzoFUUY1gHSNYNSgucyCkNvMVHy114JzMOW2cagYS7YelvAlv5F?=
 =?us-ascii?Q?jXi7LRox8AhqDzjvts1J6jaS1DWeKN/tIXE+qTApqC/96uWmG5oAN8E1FLFD?=
 =?us-ascii?Q?trExga4g3J86ZDG8DNbfVoW6bjuQtukiLZ7phzBKOq38MrjxXQsex2ftt9I8?=
 =?us-ascii?Q?FLYmElhmO6q/HK+L8rshebF5ZAGthBI9JRLXpSpRy3Naq54jtLornTHPPaFk?=
 =?us-ascii?Q?gp3HSQ3vFAzE/M7BNwvImH0T7Udp8R8TKwB3kxjR4v3XCPpuWErKEZ6y0qTl?=
 =?us-ascii?Q?A3jNxJoKHvWDSPPV1SCQ36EPJPIui120PzrUC+2fr5DrhZvMJpGnmCyuoCyY?=
 =?us-ascii?Q?RGMkb6/Vdgz5QPIACWRUCqjk0sYnXm6SHd22Z4WxCwDTIUwfpbkC0445f54R?=
 =?us-ascii?Q?7g6l8eiRrBHfAETAj8CmgQCR79ki7K77F2GE2p5j3bu2npjU+h4QhOC/zY2b?=
 =?us-ascii?Q?RI/75xK11JxibboEVj4Mz0HwWIRR9LMKogdDa2qxgbPwgktRYwNejr3FKFsB?=
 =?us-ascii?Q?mVncBWmiUWBipzGbgtcRrIEWJGQa8ZsnWO5sJjo2zTgfhwp8tUqe+u2BaUuW?=
 =?us-ascii?Q?+77nZJ5p6HUExFJ01yenDehxQ93Im+SnTCiz4lmfZsT4eZYElLz9b9a0Wooh?=
 =?us-ascii?Q?qrDURyIiAjzjEzA4rmiNWDawSXFSG4rzvtKckszw9dPw+1ivxsQw3TKAOenm?=
 =?us-ascii?Q?kLg2sXhsMn7nej22PBbx/dErlaot9kRcKmH/4Hlpv+LlsumVTit+SMhX6uRD?=
 =?us-ascii?Q?ZbTEbF30Yn+j1pYqzjS0mHd4vphzd56aEUswJG0/Q+AkNzVBzlL5XOfIV5h+?=
 =?us-ascii?Q?1WMmmRe7tdjxHSCuSDNozg4D/e2Uw9DMct3WKvNRpFeaLyDE1ttrhKk2D9lM?=
 =?us-ascii?Q?3thi4WSyrpJMKxyWAqB3G3EQiE9AUQ9dOWLAhGpDAkhWzSCInDPg8Xt37Gze?=
 =?us-ascii?Q?0MMfuRmpqctaQ3TdfgNVx3oObUqR2ed9TBFx5PCihKF5jYnanZ2emCbg3xfU?=
 =?us-ascii?Q?HUxpZ5hOxGSzz71MhCwWVgvli3l5betkHgOfqELfXtpWUOPjWjNGNM7G8qCu?=
 =?us-ascii?Q?JztRY3ULE0U/YnYnN30NBiYysrWY0S9pA5A8r3zJdBhqZQqQgoTa6WN6ZJQM?=
 =?us-ascii?Q?GoI9p80X0vgo+jGCumJiIaCnsiO7vmDYmYtCGj1SoRKe+OdPbdPjReXJ+0uC?=
 =?us-ascii?Q?56k3bFuzC2+WnFG1tbNEy1SbHQo+Sl2I5q8TGAM5?=
X-OriginatorOrg: vivo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ab6ebe1f-1587-45b8-1580-08db4e44d5ac
X-MS-Exchange-CrossTenant-AuthSource: SEZPR06MB5269.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 May 2023 15:16:15.5742 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 923e42dc-48d5-4cbe-b582-1a797a6412ed
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: QGqxJn/U6h9SOeUsDocrA7D3ppvfPJ6Vokp/Fnm37ywRj+NRiAH8amsmb+h9a6EvfPfUjNTj4dTMwJh8Ourx8g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SI2PR06MB4521
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: This patch provides a large number of variants of
 F2FS_RW_ATTR and F2FS_RO_ATTR macros,
 reducing the number of parameters required to initialize
 the f2fs_attr structure. Reported-by: kernel test robot <lkp@intel.com> Link:
 https://lore.kernel.org/oe-kbuild-all/202304152234.wjaY3IYm-lkp@intel.com/
 Signed-off-by: Yangtao Li <frank.li@vivo.com> --- v4: - add FAULT_INFO_G
 [...] Content analysis details:   (-0.2 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 SPF_HELO_PASS          SPF: HELO matches SPF record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
 no trust [40.107.215.138 listed in list.dnswl.org]
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [40.107.215.138 listed in wl.mailspike.net]
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid -0.0 T_SCC_BODY_TEXT_LINE   No description available.
X-Headers-End: 1pvJeA-0004p0-0Z
Subject: [f2fs-dev] [PATCH v4] f2fs: refactor struct f2fs_attr macro
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
Cc: linux-kernel@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net,
 kernel test robot <lkp@intel.com>, Yangtao Li <frank.li@vivo.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

This patch provides a large number of variants of F2FS_RW_ATTR
and F2FS_RO_ATTR macros, reducing the number of parameters required
to initialize the f2fs_attr structure.

Reported-by: kernel test robot <lkp@intel.com>
Link: https://lore.kernel.org/oe-kbuild-all/202304152234.wjaY3IYm-lkp@intel.com/
Signed-off-by: Yangtao Li <frank.li@vivo.com>
---
v4:
- add FAULT_INFO_GENERAL_RW_ATTR(type, elname)
- remove redundant '\'
 fs/f2fs/sysfs.c | 240 ++++++++++++++++++++++++++++++------------------
 1 file changed, 149 insertions(+), 91 deletions(-)

diff --git a/fs/f2fs/sysfs.c b/fs/f2fs/sysfs.c
index 467d743c801f..48b7e0073884 100644
--- a/fs/f2fs/sysfs.c
+++ b/fs/f2fs/sysfs.c
@@ -842,68 +842,160 @@ static struct f2fs_attr f2fs_attr_##_name = {			\
 #define F2FS_GENERAL_RO_ATTR(name) \
 static struct f2fs_attr f2fs_attr_##name = __ATTR(name, 0444, name##_show, NULL)
 
-#define F2FS_STAT_ATTR(_struct_type, _struct_name, _name, _elname)	\
-static struct f2fs_attr f2fs_attr_##_name = {			\
-	.attr = {.name = __stringify(_name), .mode = 0444 },	\
-	.show = f2fs_sbi_show,					\
-	.struct_type = _struct_type,				\
-	.offset = offsetof(struct _struct_name, _elname),       \
-}
+#ifdef CONFIG_F2FS_STAT_FS
+#define STAT_INFO_RO_ATTR(name, elname)				\
+	F2FS_RO_ATTR(STAT_INFO, f2fs_stat_info, name, elname)
+#endif
 
-F2FS_RW_ATTR(GC_THREAD, f2fs_gc_kthread, gc_urgent_sleep_time,
-							urgent_sleep_time);
-F2FS_RW_ATTR(GC_THREAD, f2fs_gc_kthread, gc_min_sleep_time, min_sleep_time);
-F2FS_RW_ATTR(GC_THREAD, f2fs_gc_kthread, gc_max_sleep_time, max_sleep_time);
-F2FS_RW_ATTR(GC_THREAD, f2fs_gc_kthread, gc_no_gc_sleep_time, no_gc_sleep_time);
-F2FS_RW_ATTR(F2FS_SBI, f2fs_sb_info, gc_idle, gc_mode);
-F2FS_RW_ATTR(F2FS_SBI, f2fs_sb_info, gc_urgent, gc_mode);
-F2FS_RW_ATTR(SM_INFO, f2fs_sm_info, reclaim_segments, rec_prefree_segments);
-F2FS_RW_ATTR(DCC_INFO, discard_cmd_control, max_small_discards, max_discards);
-F2FS_RW_ATTR(DCC_INFO, discard_cmd_control, max_discard_request, max_discard_request);
-F2FS_RW_ATTR(DCC_INFO, discard_cmd_control, min_discard_issue_time, min_discard_issue_time);
-F2FS_RW_ATTR(DCC_INFO, discard_cmd_control, mid_discard_issue_time, mid_discard_issue_time);
-F2FS_RW_ATTR(DCC_INFO, discard_cmd_control, max_discard_issue_time, max_discard_issue_time);
-F2FS_RW_ATTR(DCC_INFO, discard_cmd_control, discard_io_aware_gran, discard_io_aware_gran);
-F2FS_RW_ATTR(DCC_INFO, discard_cmd_control, discard_urgent_util, discard_urgent_util);
-F2FS_RW_ATTR(DCC_INFO, discard_cmd_control, discard_granularity, discard_granularity);
-F2FS_RW_ATTR(DCC_INFO, discard_cmd_control, max_ordered_discard, max_ordered_discard);
-F2FS_RW_ATTR(RESERVED_BLOCKS, f2fs_sb_info, reserved_blocks, reserved_blocks);
-F2FS_RW_ATTR(SM_INFO, f2fs_sm_info, ipu_policy, ipu_policy);
-F2FS_RW_ATTR(SM_INFO, f2fs_sm_info, min_ipu_util, min_ipu_util);
-F2FS_RW_ATTR(SM_INFO, f2fs_sm_info, min_fsync_blocks, min_fsync_blocks);
-F2FS_RW_ATTR(SM_INFO, f2fs_sm_info, min_seq_blocks, min_seq_blocks);
-F2FS_RW_ATTR(SM_INFO, f2fs_sm_info, min_hot_blocks, min_hot_blocks);
-F2FS_RW_ATTR(SM_INFO, f2fs_sm_info, min_ssr_sections, min_ssr_sections);
-F2FS_RW_ATTR(NM_INFO, f2fs_nm_info, ram_thresh, ram_thresh);
-F2FS_RW_ATTR(NM_INFO, f2fs_nm_info, ra_nid_pages, ra_nid_pages);
-F2FS_RW_ATTR(NM_INFO, f2fs_nm_info, dirty_nats_ratio, dirty_nats_ratio);
-F2FS_RW_ATTR(NM_INFO, f2fs_nm_info, max_roll_forward_node_blocks, max_rf_node_blocks);
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
-#ifdef CONFIG_F2FS_IOSTAT
-F2FS_RW_ATTR(F2FS_SBI, f2fs_sb_info, iostat_enable, iostat_enable);
-F2FS_RW_ATTR(F2FS_SBI, f2fs_sb_info, iostat_period_ms, iostat_period_ms);
+#define GC_THREAD_RW_ATTR(name, elname)				\
+	F2FS_RW_ATTR(GC_THREAD, f2fs_gc_kthread, name, elname)
+
+#define SM_INFO_RW_ATTR(name, elname)				\
+	F2FS_RW_ATTR(SM_INFO, f2fs_sm_info, name, elname)
+
+#define SM_INFO_GENERAL_RW_ATTR(elname)				\
+	SM_INFO_RW_ATTR(elname, elname)
+
+#define DCC_INFO_RW_ATTR(name, elname)				\
+	F2FS_RW_ATTR(DCC_INFO, discard_cmd_control, name, elname)
+
+#define DCC_INFO_GENERAL_RW_ATTR(elname)			\
+	DCC_INFO_RW_ATTR(elname, elname)
+
+#define NM_INFO_RW_ATTR(name, elname)				\
+	F2FS_RW_ATTR(NM_INFO, f2fs_nm_info, name, elname)
+
+#define NM_INFO_GENERAL_RW_ATTR(elname)				\
+	NM_INFO_RW_ATTR(elname, elname)
+
+#define F2FS_SBI_RW_ATTR(name, elname)				\
+	F2FS_RW_ATTR(F2FS_SBI, f2fs_sb_info, name, elname)
+
+#define F2FS_SBI_GENERAL_RW_ATTR(elname)			\
+	F2FS_SBI_RW_ATTR(elname, elname)
+
+#define F2FS_SBI_GENERAL_RO_ATTR(elname)			\
+	F2FS_RO_ATTR(F2FS_SBI, f2fs_sb_info, elname, elname)
+
+#ifdef CONFIG_F2FS_FAULT_INJECTION
+#define FAULT_INFO_GENERAL_RW_ATTR(type, elname)		\
+	F2FS_RW_ATTR(type, f2fs_fault_info, elname, elname)
 #endif
-F2FS_RW_ATTR(F2FS_SBI, f2fs_sb_info, readdir_ra, readdir_ra);
-F2FS_RW_ATTR(F2FS_SBI, f2fs_sb_info, max_io_bytes, max_io_bytes);
-F2FS_RW_ATTR(F2FS_SBI, f2fs_sb_info, gc_pin_file_thresh, gc_pin_file_threshold);
+
+#define RESERVED_BLOCKS_GENERAL_RW_ATTR(elname)			\
+	F2FS_RW_ATTR(RESERVED_BLOCKS, f2fs_sb_info, elname, elname)
+
+#define CPRC_INFO_GENERAL_RW_ATTR(elname)			\
+	F2FS_RW_ATTR(CPRC_INFO, ckpt_req_control, elname, elname)
+
+#define ATGC_INFO_RW_ATTR(name, elname)				\
+	F2FS_RW_ATTR(ATGC_INFO, atgc_management, name, elname)
+
+/* GC_THREAD ATTR */
+GC_THREAD_RW_ATTR(gc_urgent_sleep_time, urgent_sleep_time);
+GC_THREAD_RW_ATTR(gc_min_sleep_time, min_sleep_time);
+GC_THREAD_RW_ATTR(gc_max_sleep_time, max_sleep_time);
+GC_THREAD_RW_ATTR(gc_no_gc_sleep_time, no_gc_sleep_time);
+
+/* SM_INFO ATTR */
+SM_INFO_RW_ATTR(reclaim_segments, rec_prefree_segments);
+SM_INFO_GENERAL_RW_ATTR(ipu_policy);
+SM_INFO_GENERAL_RW_ATTR(min_ipu_util);
+SM_INFO_GENERAL_RW_ATTR(min_fsync_blocks);
+SM_INFO_GENERAL_RW_ATTR(min_seq_blocks);
+SM_INFO_GENERAL_RW_ATTR(min_hot_blocks);
+SM_INFO_GENERAL_RW_ATTR(min_ssr_sections);
+
+/* DCC_INFO ATTR */
+DCC_INFO_RW_ATTR(max_small_discards, max_discards);
+DCC_INFO_GENERAL_RW_ATTR(max_discard_request);
+DCC_INFO_GENERAL_RW_ATTR(min_discard_issue_time);
+DCC_INFO_GENERAL_RW_ATTR(mid_discard_issue_time);
+DCC_INFO_GENERAL_RW_ATTR(max_discard_issue_time);
+DCC_INFO_GENERAL_RW_ATTR(discard_io_aware_gran);
+DCC_INFO_GENERAL_RW_ATTR(discard_urgent_util);
+DCC_INFO_GENERAL_RW_ATTR(discard_granularity);
+DCC_INFO_GENERAL_RW_ATTR(max_ordered_discard);
+
+/* NM_INFO ATTR */
+NM_INFO_RW_ATTR(max_roll_forward_node_blocks, max_rf_node_blocks);
+NM_INFO_GENERAL_RW_ATTR(ram_thresh);
+NM_INFO_GENERAL_RW_ATTR(ra_nid_pages);
+NM_INFO_GENERAL_RW_ATTR(dirty_nats_ratio);
+
+/* F2FS_SBI ATTR */
 F2FS_RW_ATTR(F2FS_SBI, f2fs_super_block, extension_list, extension_list);
+F2FS_SBI_RW_ATTR(gc_idle, gc_mode);
+F2FS_SBI_RW_ATTR(gc_urgent, gc_mode);
+F2FS_SBI_RW_ATTR(cp_interval, interval_time[CP_TIME]);
+F2FS_SBI_RW_ATTR(idle_interval, interval_time[REQ_TIME]);
+F2FS_SBI_RW_ATTR(discard_idle_interval, interval_time[DISCARD_TIME]);
+F2FS_SBI_RW_ATTR(gc_idle_interval, interval_time[GC_TIME]);
+F2FS_SBI_RW_ATTR(umount_discard_timeout, interval_time[UMOUNT_DISCARD_TIMEOUT]);
+F2FS_SBI_RW_ATTR(gc_pin_file_thresh, gc_pin_file_threshold);
+F2FS_SBI_RW_ATTR(gc_reclaimed_segments, gc_reclaimed_segs);
+F2FS_SBI_GENERAL_RW_ATTR(max_victim_search);
+F2FS_SBI_GENERAL_RW_ATTR(migration_granularity);
+F2FS_SBI_GENERAL_RW_ATTR(dir_level);
+#ifdef CONFIG_F2FS_IOSTAT
+F2FS_SBI_GENERAL_RW_ATTR(iostat_enable);
+F2FS_SBI_GENERAL_RW_ATTR(iostat_period_ms);
+#endif
+F2FS_SBI_GENERAL_RW_ATTR(readdir_ra);
+F2FS_SBI_GENERAL_RW_ATTR(max_io_bytes);
+F2FS_SBI_GENERAL_RW_ATTR(data_io_flag);
+F2FS_SBI_GENERAL_RW_ATTR(node_io_flag);
+F2FS_SBI_GENERAL_RW_ATTR(gc_remaining_trials);
+F2FS_SBI_GENERAL_RW_ATTR(seq_file_ra_mul);
+F2FS_SBI_GENERAL_RW_ATTR(gc_segment_mode);
+F2FS_SBI_GENERAL_RW_ATTR(max_fragment_chunk);
+F2FS_SBI_GENERAL_RW_ATTR(max_fragment_hole);
+#ifdef CONFIG_F2FS_FS_COMPRESSION
+F2FS_SBI_GENERAL_RW_ATTR(compr_written_block);
+F2FS_SBI_GENERAL_RW_ATTR(compr_saved_block);
+F2FS_SBI_GENERAL_RW_ATTR(compr_new_inode);
+F2FS_SBI_GENERAL_RW_ATTR(compress_percent);
+F2FS_SBI_GENERAL_RW_ATTR(compress_watermark);
+#endif
+/* atomic write */
+F2FS_SBI_GENERAL_RO_ATTR(current_atomic_write);
+F2FS_SBI_GENERAL_RW_ATTR(peak_atomic_write);
+F2FS_SBI_GENERAL_RW_ATTR(committed_atomic_block);
+F2FS_SBI_GENERAL_RW_ATTR(revoked_atomic_block);
+/* block age extent cache */
+F2FS_SBI_GENERAL_RW_ATTR(hot_data_age_threshold);
+F2FS_SBI_GENERAL_RW_ATTR(warm_data_age_threshold);
+F2FS_SBI_GENERAL_RW_ATTR(last_age_weight);
+#ifdef CONFIG_BLK_DEV_ZONED
+F2FS_SBI_GENERAL_RO_ATTR(unusable_blocks_per_sec);
+#endif
+
+/* STAT_INFO ATTR */
+#ifdef CONFIG_F2FS_STAT_FS
+STAT_INFO_RO_ATTR(cp_foreground_calls, cp_count);
+STAT_INFO_RO_ATTR(cp_background_calls, bg_cp_count);
+STAT_INFO_RO_ATTR(gc_foreground_calls, call_count);
+STAT_INFO_RO_ATTR(gc_background_calls, bg_gc);
+#endif
+
+/* FAULT_INFO ATTR */
 #ifdef CONFIG_F2FS_FAULT_INJECTION
-F2FS_RW_ATTR(FAULT_INFO_RATE, f2fs_fault_info, inject_rate, inject_rate);
-F2FS_RW_ATTR(FAULT_INFO_TYPE, f2fs_fault_info, inject_type, inject_type);
+FAULT_INFO_GENERAL_RW_ATTR(FAULT_INFO_RATE, inject_rate);
+FAULT_INFO_GENERAL_RW_ATTR(FAULT_INFO_TYPE, inject_type);
 #endif
-F2FS_RW_ATTR(F2FS_SBI, f2fs_sb_info, data_io_flag, data_io_flag);
-F2FS_RW_ATTR(F2FS_SBI, f2fs_sb_info, node_io_flag, node_io_flag);
-F2FS_RW_ATTR(F2FS_SBI, f2fs_sb_info, gc_remaining_trials, gc_remaining_trials);
-F2FS_RW_ATTR(CPRC_INFO, ckpt_req_control, ckpt_thread_ioprio, ckpt_thread_ioprio);
+
+/* RESERVED_BLOCKS ATTR */
+RESERVED_BLOCKS_GENERAL_RW_ATTR(reserved_blocks);
+
+/* CPRC_INFO ATTR */
+CPRC_INFO_GENERAL_RW_ATTR(ckpt_thread_ioprio);
+
+/* ATGC_INFO ATTR */
+ATGC_INFO_RW_ATTR(atgc_candidate_ratio, candidate_ratio);
+ATGC_INFO_RW_ATTR(atgc_candidate_count, max_candidate_count);
+ATGC_INFO_RW_ATTR(atgc_age_weight, age_weight);
+ATGC_INFO_RW_ATTR(atgc_age_threshold, age_threshold);
+
 F2FS_GENERAL_RO_ATTR(dirty_segments);
 F2FS_GENERAL_RO_ATTR(free_segments);
 F2FS_GENERAL_RO_ATTR(ovp_segments);
@@ -917,10 +1009,6 @@ F2FS_GENERAL_RO_ATTR(main_blkaddr);
 F2FS_GENERAL_RO_ATTR(pending_discard);
 F2FS_GENERAL_RO_ATTR(gc_mode);
 #ifdef CONFIG_F2FS_STAT_FS
-F2FS_STAT_ATTR(STAT_INFO, f2fs_stat_info, cp_foreground_calls, cp_count);
-F2FS_STAT_ATTR(STAT_INFO, f2fs_stat_info, cp_background_calls, bg_cp_count);
-F2FS_STAT_ATTR(STAT_INFO, f2fs_stat_info, gc_foreground_calls, call_count);
-F2FS_STAT_ATTR(STAT_INFO, f2fs_stat_info, gc_background_calls, bg_gc);
 F2FS_GENERAL_RO_ATTR(moved_blocks_background);
 F2FS_GENERAL_RO_ATTR(moved_blocks_foreground);
 F2FS_GENERAL_RO_ATTR(avg_vblocks);
@@ -935,8 +1023,6 @@ F2FS_FEATURE_RO_ATTR(encrypted_casefold);
 #endif /* CONFIG_FS_ENCRYPTION */
 #ifdef CONFIG_BLK_DEV_ZONED
 F2FS_FEATURE_RO_ATTR(block_zoned);
-F2FS_RO_ATTR(F2FS_SBI, f2fs_sb_info, unusable_blocks_per_sec,
-					unusable_blocks_per_sec);
 #endif
 F2FS_FEATURE_RO_ATTR(atomic_write);
 F2FS_FEATURE_RO_ATTR(extra_attr);
@@ -956,37 +1042,9 @@ F2FS_FEATURE_RO_ATTR(casefold);
 F2FS_FEATURE_RO_ATTR(readonly);
 #ifdef CONFIG_F2FS_FS_COMPRESSION
 F2FS_FEATURE_RO_ATTR(compression);
-F2FS_RW_ATTR(F2FS_SBI, f2fs_sb_info, compr_written_block, compr_written_block);
-F2FS_RW_ATTR(F2FS_SBI, f2fs_sb_info, compr_saved_block, compr_saved_block);
-F2FS_RW_ATTR(F2FS_SBI, f2fs_sb_info, compr_new_inode, compr_new_inode);
-F2FS_RW_ATTR(F2FS_SBI, f2fs_sb_info, compress_percent, compress_percent);
-F2FS_RW_ATTR(F2FS_SBI, f2fs_sb_info, compress_watermark, compress_watermark);
 #endif
 F2FS_FEATURE_RO_ATTR(pin_file);
 
-/* For ATGC */
-F2FS_RW_ATTR(ATGC_INFO, atgc_management, atgc_candidate_ratio, candidate_ratio);
-F2FS_RW_ATTR(ATGC_INFO, atgc_management, atgc_candidate_count, max_candidate_count);
-F2FS_RW_ATTR(ATGC_INFO, atgc_management, atgc_age_weight, age_weight);
-F2FS_RW_ATTR(ATGC_INFO, atgc_management, atgc_age_threshold, age_threshold);
-
-F2FS_RW_ATTR(F2FS_SBI, f2fs_sb_info, seq_file_ra_mul, seq_file_ra_mul);
-F2FS_RW_ATTR(F2FS_SBI, f2fs_sb_info, gc_segment_mode, gc_segment_mode);
-F2FS_RW_ATTR(F2FS_SBI, f2fs_sb_info, gc_reclaimed_segments, gc_reclaimed_segs);
-F2FS_RW_ATTR(F2FS_SBI, f2fs_sb_info, max_fragment_chunk, max_fragment_chunk);
-F2FS_RW_ATTR(F2FS_SBI, f2fs_sb_info, max_fragment_hole, max_fragment_hole);
-
-/* For atomic write */
-F2FS_RO_ATTR(F2FS_SBI, f2fs_sb_info, current_atomic_write, current_atomic_write);
-F2FS_RW_ATTR(F2FS_SBI, f2fs_sb_info, peak_atomic_write, peak_atomic_write);
-F2FS_RW_ATTR(F2FS_SBI, f2fs_sb_info, committed_atomic_block, committed_atomic_block);
-F2FS_RW_ATTR(F2FS_SBI, f2fs_sb_info, revoked_atomic_block, revoked_atomic_block);
-
-/* For block age extent cache */
-F2FS_RW_ATTR(F2FS_SBI, f2fs_sb_info, hot_data_age_threshold, hot_data_age_threshold);
-F2FS_RW_ATTR(F2FS_SBI, f2fs_sb_info, warm_data_age_threshold, warm_data_age_threshold);
-F2FS_RW_ATTR(F2FS_SBI, f2fs_sb_info, last_age_weight, last_age_weight);
-
 #define ATTR_LIST(name) (&f2fs_attr_##name.attr)
 static struct attribute *f2fs_attrs[] = {
 	ATTR_LIST(gc_urgent_sleep_time),
-- 
2.39.0



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
