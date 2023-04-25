Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 8695C6EE749
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 25 Apr 2023 20:03:12 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1prN0N-0004dU-0q;
	Tue, 25 Apr 2023 18:03:07 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <frank.li@vivo.com>) id 1prN0L-0004dN-33
 for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 25 Apr 2023 18:03:06 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=MIME-Version:Content-Type:Content-Transfer-Encoding
 :Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=G4KJ4WThwLq2cocKaOEx7oU6Zfzf1j5Y5+VfMZmDTB4=; b=V4ZrqrNSlYSoKLM5MtxrFEkO0U
 9N+R0NiEtGKwl56optN7qNyda5WlBLe+q64gY8ivo9cblo4G81MtxEviubgUicC/dGx3JhfOesMat
 5dmEItap+9XaNQWI4ChhNFio7R9p8cSMoRkxMpI/iK5XNIP6rFtrlo0F5FGYorhelhck=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:Date:
 Subject:Cc:To:From:Sender:Reply-To:Content-ID:Content-Description:Resent-Date
 :Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=G4KJ4WThwLq2cocKaOEx7oU6Zfzf1j5Y5+VfMZmDTB4=; b=X
 otbUVUpBrNpogXsug0b08tulYh0w/08umr5U/i7UO1okerpeslvxHosw+2VfgruWDG1diZV5Jyh86
 xjf1ibH37227LCqvB21CdidH5J58klCxtLy8PvKUFHNG6/gr4kl2y+l+O+rZG1vdhCx0O54cj9MZq
 dKICGm7j5js27PKE=;
Received: from mail-psaapc01on2114.outbound.protection.outlook.com
 ([40.107.255.114] helo=APC01-PSA-obe.outbound.protection.outlook.com)
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1prN0L-0006vl-4a for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 25 Apr 2023 18:03:05 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=I/DWDayLGr35P+lI54/5MIf0dORsl2Rmdd/pEK51E9ZJBcmSB40RZ7JUlMiP5elNZilF0Wkgeua9IT1AMa9Sn9AJfrVaH9oM1JdAAYw1Vhovtoo+VA+T4EA4BAw5bDi/Z0YwUOwp0QFxPcO+kKrQUwptpqpxPqlzsJC1Vw3+q2nZKRvt99frSknKpuryARTqvHB0orBKS9YNM2euP9azJtFfRZ8688Jh8DUUX6mzEyUTsRSCn8zJa0WqCjzAvcXkqoBe0mBNq2ALiCCa1hd8bGpMBvYfq40q68XBLQA4dMMhgLbf7AxLjCL8zBTLpzBAmY8wgwoF9JeGwmkiHlMrdg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=G4KJ4WThwLq2cocKaOEx7oU6Zfzf1j5Y5+VfMZmDTB4=;
 b=eka31/Iebm17hKIxc67Z32N8OUWsv0h0zOwZ52DWwIbpwypHS6baYcM49tGX6mnzDR+9HK58K51pOLEFH+zKDMEd8tji72s5mXVqOkbcL4h3+ttZmGxMCoA51azPH1vcYXce7Y/U0DGIBgrsl0ieX7wGV7fW2eZ9a1boUKWVRsVcloJkYOTH9Ba8cNMPiKygMt7x54FJOENIKmqVBacnAohPwNQkhM/Ker9T7XZ+WQuZ7lECCfcCCbKV0gX6F1vsEx1H6g1i31YArZ1+ZbrsPumigJyjwDAQ+G4KuXxFbzlhPuDC9GlN+0nj4OZlxjjeB8CWGMwLW0Lq8o1tKaqMpA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vivo.com; dmarc=pass action=none header.from=vivo.com;
 dkim=pass header.d=vivo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vivo.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=G4KJ4WThwLq2cocKaOEx7oU6Zfzf1j5Y5+VfMZmDTB4=;
 b=JsdWvpjI3FcCJS9JpxyMeiOkOROo7DWYhYs2Y4SsBXu22DKauXU9T00iBzwKHMCY1UXW1YeCMl84tJ896JlJIk4YK/njHAEc3ozvdIGxp7sU3e58dT6EAAY5cVZRdsyXCvCzHFGOlERmhGJKqyWWFAz6flY7V5LpG/TVGBHvQddKlPUaYJNdlLZVSHG51GVjCNU6kFgYcnkVebrpp5o4K79o1C/wYvlbeLlcLsjDzmPUkTBfgKMW4qjamomTJNKDOJXiLX82TbrYYppgcpDgH5NiWUdxN4HAh63d6BJwqBnIDk9M9wn+yG4nxHC3VwLNzkN7bffPAsw6p3SF02hWaA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=vivo.com;
Received: from SEZPR06MB5269.apcprd06.prod.outlook.com (2603:1096:101:78::6)
 by SEZPR06MB5967.apcprd06.prod.outlook.com (2603:1096:101:e7::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6319.32; Tue, 25 Apr
 2023 18:02:54 +0000
Received: from SEZPR06MB5269.apcprd06.prod.outlook.com
 ([fe80::76d6:4828:7e80:2965]) by SEZPR06MB5269.apcprd06.prod.outlook.com
 ([fe80::76d6:4828:7e80:2965%7]) with mapi id 15.20.6319.033; Tue, 25 Apr 2023
 18:02:54 +0000
To: Jaegeuk Kim <jaegeuk@kernel.org>,
	Chao Yu <chao@kernel.org>
Date: Wed, 26 Apr 2023 02:02:43 +0800
Message-Id: <20230425180243.9030-1-frank.li@vivo.com>
X-Mailer: git-send-email 2.39.0
X-ClientProxiedBy: SI2PR04CA0013.apcprd04.prod.outlook.com
 (2603:1096:4:197::6) To SEZPR06MB5269.apcprd06.prod.outlook.com
 (2603:1096:101:78::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SEZPR06MB5269:EE_|SEZPR06MB5967:EE_
X-MS-Office365-Filtering-Correlation-Id: abd394e6-8b2a-4221-11c3-08db45b74aae
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: j6wWqfHntFjdI7i3hqABYcE5HYIBZaISHU7+SVjYBybJDFNPe+K/IAjXSlpOX9dnSRyJyj5l0UMOAkZi9UvLdrLsFDAWfcrkUInsPvIb4fHuvnfyzHphwTl1VOhi/mAf3WxW0EoWRUDgAcRIAwaTmSc0SLjzKbfPSeUTMXFbvh6AY3QFGjydPJ1LnpoQrKgNwO3CQmu2X0CQQJvlkYwd3BAvGr2vhoJtjdINCriIES8LayzvvWWZcJ6HVnl+6PBz1rE+tJo4wZTtp877jwfqZPC9rI2Gwf7gBgTiO5qiJeis40Yfk6TcPgjad8/0wn0OYWskAnRv832o8Y/3MnDXn6IbIAl2tgxVx0Ne1VarcxQROj0+SNfQNTXWCr31eL1Rm2mmQ9NXalnJIAr0ZsFohZ/PvzbMO4tFKHmMQYgkCnBYYMD63eMA5wazroe3NAhCmP59LaUS7BwiWpZCQADjWuDjAJwvbvdypsYxVQ6B5qUhj0gfnDI0oIvoO2dL++MydGnvig1V9Kb82a8iGVJSSFtfR3b6qt0uy3qzj2iR/zmATvMA1uZzp6+kwjyDysuIFWKJF8VAS4VWHP2Povf5PGKMmGVa5GF11pLk3MR8yRH9v6AqLvd2AQOXb4Mmg0om
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SEZPR06MB5269.apcprd06.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(4636009)(136003)(376002)(346002)(39860400002)(396003)(366004)(451199021)(38350700002)(38100700002)(6506007)(6512007)(26005)(1076003)(186003)(2616005)(8936002)(83380400001)(2906002)(8676002)(5660300002)(36756003)(478600001)(6486002)(52116002)(110136005)(316002)(6666004)(4326008)(66556008)(41300700001)(66946007)(86362001)(66476007);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?5Y/MSXrGXao//Row3UttJgT1yIMBeFsWye2R8O7xo/i4RKnZvL2jLwIWJowR?=
 =?us-ascii?Q?YpKcSwTulOY8RHWTHtfKkVVZIXDNMTiWDuu35bk4Xn4Kddm62t8vtoQZzWxa?=
 =?us-ascii?Q?MX5ya8SPjk8wv7w4Paiy6hN+PhK0emrexUY6evsMYrvYeRg0C3SvaaNAmsLy?=
 =?us-ascii?Q?tne91FkdvaIGKbjzdP4/u4mRRoxF1mZ16b+BLvR9sRE2Tn9tr1aOwaehEO2r?=
 =?us-ascii?Q?vLmQwYVMxApV7v02L7rhL6OW/MiPVSK/IDj/wmhZN/KlpMEWyngDNUcf58ex?=
 =?us-ascii?Q?0Z3gwz1bpAEXCowEYm2z0wrvKsj3oVDThQi0Q/YrAHHfG8QWgbE5QRZcUVKN?=
 =?us-ascii?Q?648sIEEXSDlav6Z2KpnGWOLOfJtko5XZgbULPaHEaVIFr8WZ0oI+mjWBQIt6?=
 =?us-ascii?Q?z5sPQwC2Qtk1GVMhYqRWsZcsWjJewt6F0tJb1HHB1OkwvtbMlT0NzsThcR2Z?=
 =?us-ascii?Q?mhNVPR2PgTomauIDnvXtMoW/o38pO9uDbxmzmQNz6bDKF9xm439/ahuPm525?=
 =?us-ascii?Q?hAVpj2AQ4mkuq96fqIsDef92sqku27q/38ZHKhJt/t2e4Of4e4qJeZg+QYYR?=
 =?us-ascii?Q?Z6b0TQKirV5Xr7FpLNoABroNAUQjX8u0NH4pR4Y58mPab3KJj046o8feULGA?=
 =?us-ascii?Q?BeVShIM5feUvT8iwKb1gQiqPZcj74XwfX+wx3rL4LyzjXE5S0O5sj+/KvqOj?=
 =?us-ascii?Q?mYJp1fbY3L3AGwCoMztZ+FTA8piXE3hw+sj52OWdmw8OZdHTugv52lp8fsJS?=
 =?us-ascii?Q?wsfMNr6yq+i7QXxhMMUcQtQ+FhquomJn2ZXhDH6reR42svTTGCNLmf++3uCt?=
 =?us-ascii?Q?4G0lduC0G/qxGKJlfHn8gs0XOpxSRHFy68ATy9yvqZ6pWPXncH3JPj2CIjbp?=
 =?us-ascii?Q?gcQFVokxfpd8I5hSkgGEcPBCIe0EeyVlUAl1lVgWayDjnKWtnc2WswesFJhQ?=
 =?us-ascii?Q?wRjihfHP5c8ueNc3iVTWhroPFBLTOPFaHgNcbImIEMSV4yPGJqHWKw7S7zjl?=
 =?us-ascii?Q?UufUQV3ZF/0as7Orrhv/tZ7SxYSAlYJzmN2azBylPDg3hU8mPJi9WvFyaRH4?=
 =?us-ascii?Q?C/B/qjDToKLeXz7t0K2q7ZnUP5DqCL1+wxeNOPFmilhlghK9nUT1nQGSFctj?=
 =?us-ascii?Q?Xt9sCOC7W9xJEFHEQfw9R1wqmyBguWGDwQ++Ui2cm4gfVot3g9Bj8ORlDtKb?=
 =?us-ascii?Q?UwNVIYz12YpEkNNH5J+gpxE1tTe5gndO1/ThdoSxOqaS3OXVMFb21osaECdX?=
 =?us-ascii?Q?oltmTnTQ9SzosQcqy6URVSDuzl5bsP6lSxZInt84IE5A76SIRaeRBCMvTfg4?=
 =?us-ascii?Q?JucpuRASfNWkqbD6+dJ0x7rM+IBZHcaj1V/nXQw+atRRTdnrYl5oAMZwVWFu?=
 =?us-ascii?Q?6hAaU34ZBoGDJutEdznb4sKtRxcUUsde04LWXsQI0raODjgu+3cs5kvVylCa?=
 =?us-ascii?Q?xz+tXEwkBKQwlZpl9X3jz6Dfkf2w6MMzJ0HBT8r2LkBtLY7iPv+ZEz46oX6P?=
 =?us-ascii?Q?XTPJAAdmdzyIixS4yqvNFT8t3mNS5CNRn7VHy92KDeWw8C1AwbujFyVo2IMi?=
 =?us-ascii?Q?5YYst/+HY28acZdcv3WL7nhzG67lB+YuLgbJ/NBE?=
X-OriginatorOrg: vivo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: abd394e6-8b2a-4221-11c3-08db45b74aae
X-MS-Exchange-CrossTenant-AuthSource: SEZPR06MB5269.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Apr 2023 18:02:53.8566 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 923e42dc-48d5-4cbe-b582-1a797a6412ed
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: OTclPY805kkDuXa0d7bGlwBwLDZWu9vX5x+TOBhPQyDB6N9DxoZIg+W3/Rm5zldgeaT09d86EJUXe8lgiv56qg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SEZPR06MB5967
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  This patch introduces mount_errors related api and uses it
 in code. Signed-off-by: Yangtao Li <frank.li@vivo.com> --- fs/f2fs/data.c
 | 2 +- fs/f2fs/f2fs.h | 15 +++++++++++++++ fs/f2fs/node.c | 2 +-
 fs/f2fs/super.c
 | 11 +++++------ 4 files changed, 22 insertions(+), 8 [...] 
 Content analysis details:   (-0.2 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [40.107.255.114 listed in wl.mailspike.net]
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
 no trust [40.107.255.114 listed in list.dnswl.org]
 -0.0 SPF_HELO_PASS          SPF: HELO matches SPF record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.0 T_SCC_BODY_TEXT_LINE   No description available.
X-Headers-End: 1prN0L-0006vl-4a
Subject: [f2fs-dev] [PATCH] f2fs: introduce mount_errors related api
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

This patch introduces mount_errors related api and uses it in code.

Signed-off-by: Yangtao Li <frank.li@vivo.com>
---
 fs/f2fs/data.c  |  2 +-
 fs/f2fs/f2fs.h  | 15 +++++++++++++++
 fs/f2fs/node.c  |  2 +-
 fs/f2fs/super.c | 11 +++++------
 4 files changed, 22 insertions(+), 8 deletions(-)

diff --git a/fs/f2fs/data.c b/fs/f2fs/data.c
index f26eac327d6e..475635c0a905 100644
--- a/fs/f2fs/data.c
+++ b/fs/f2fs/data.c
@@ -2809,7 +2809,7 @@ int f2fs_write_single_data_page(struct page *page, int *submitted,
 			goto redirty_out;
 
 		/* keep data pages in remount-ro mode */
-		if (F2FS_OPTION(sbi).errors == MOUNT_ERRORS_READONLY)
+		if (mount_errors_readonly(sbi))
 			goto redirty_out;
 		goto out;
 	}
diff --git a/fs/f2fs/f2fs.h b/fs/f2fs/f2fs.h
index 7afc9aef127a..d75f58851b58 100644
--- a/fs/f2fs/f2fs.h
+++ b/fs/f2fs/f2fs.h
@@ -4456,6 +4456,21 @@ static inline bool f2fs_dev_is_readonly(struct f2fs_sb_info *sbi)
 	return f2fs_sb_has_readonly(sbi) || f2fs_hw_is_readonly(sbi);
 }
 
+static inline bool mount_errors_readonly(struct f2fs_sb_info *sbi)
+{
+	return F2FS_OPTION(sbi).errors == MOUNT_ERRORS_READONLY;
+}
+
+static inline bool mount_errors_continue(struct f2fs_sb_info *sbi)
+{
+	return F2FS_OPTION(sbi).errors == MOUNT_ERRORS_CONTINUE;
+}
+
+static inline bool mount_errors_panic(struct f2fs_sb_info *sbi)
+{
+	return F2FS_OPTION(sbi).errors == MOUNT_ERRORS_PANIC;
+}
+
 static inline bool f2fs_lfs_mode(struct f2fs_sb_info *sbi)
 {
 	return F2FS_OPTION(sbi).fs_mode == FS_MODE_LFS;
diff --git a/fs/f2fs/node.c b/fs/f2fs/node.c
index 834c6f099c95..168dbd884631 100644
--- a/fs/f2fs/node.c
+++ b/fs/f2fs/node.c
@@ -1597,7 +1597,7 @@ static int __write_node_page(struct page *page, bool atomic, bool *submitted,
 
 	if (unlikely(f2fs_cp_error(sbi))) {
 		/* keep node pages in remount-ro mode */
-		if (F2FS_OPTION(sbi).errors == MOUNT_ERRORS_READONLY)
+		if (mount_errors_readonly(sbi))
 			goto redirty_out;
 		ClearPageUptodate(page);
 		dec_page_count(sbi, F2FS_DIRTY_NODES);
diff --git a/fs/f2fs/super.c b/fs/f2fs/super.c
index 51812f459581..107585797ffa 100644
--- a/fs/f2fs/super.c
+++ b/fs/f2fs/super.c
@@ -2076,11 +2076,11 @@ static int f2fs_show_options(struct seq_file *seq, struct dentry *root)
 	else if (F2FS_OPTION(sbi).memory_mode == MEMORY_MODE_LOW)
 		seq_printf(seq, ",memory=%s", "low");
 
-	if (F2FS_OPTION(sbi).errors == MOUNT_ERRORS_READONLY)
+	if (mount_errors_readonly(sbi))
 		seq_printf(seq, ",errors=%s", "remount-ro");
-	else if (F2FS_OPTION(sbi).errors == MOUNT_ERRORS_CONTINUE)
+	else if (mount_errors_continue(sbi))
 		seq_printf(seq, ",errors=%s", "continue");
-	else if (F2FS_OPTION(sbi).errors == MOUNT_ERRORS_PANIC)
+	else if (mount_errors_panic(sbi))
 		seq_printf(seq, ",errors=%s", "panic");
 
 	return 0;
@@ -4049,8 +4049,7 @@ void f2fs_handle_critical_error(struct f2fs_sb_info *sbi, unsigned char reason,
 {
 	struct super_block *sb = sbi->sb;
 	bool shutdown = reason == STOP_CP_REASON_SHUTDOWN;
-	bool continue_fs = !shutdown &&
-			F2FS_OPTION(sbi).errors == MOUNT_ERRORS_CONTINUE;
+	bool continue_fs = !shutdown && mount_errors_continue(sbi);
 
 	set_ckpt_flags(sbi, CP_ERROR_FLAG);
 
@@ -4068,7 +4067,7 @@ void f2fs_handle_critical_error(struct f2fs_sb_info *sbi, unsigned char reason,
 	 * could panic during 'reboot -f' as the underlying device got already
 	 * disabled.
 	 */
-	if (F2FS_OPTION(sbi).errors == MOUNT_ERRORS_PANIC &&
+	if (mount_errors_panic(sbi) &&
 				!shutdown && !system_going_down() &&
 				!is_sbi_flag_set(sbi, SBI_IS_SHUTDOWN))
 		panic("F2FS-fs (device %s): panic forced after error\n",
-- 
2.39.0



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
