Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 268966F919F
	for <lists+linux-f2fs-devel@lfdr.de>; Sat,  6 May 2023 13:40:57 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1pvGHV-0001Cz-4H;
	Sat, 06 May 2023 11:40:53 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <frank.li@vivo.com>) id 1pvGHU-0001Cm-8S
 for linux-f2fs-devel@lists.sourceforge.net;
 Sat, 06 May 2023 11:40:53 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=MIME-Version:Content-Type:Content-Transfer-Encoding
 :Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=a+mL6onjwYJFYgpqq2TyBD9eQM5EOD34JMpHoZzZFIk=; b=bsFlFZ5i64G4iygJxFzmacBDf5
 Q6m40jNngc0RZzZU28reWWIGD2Czn7OWPdwB+uakAN8fnS30o47f/DDK2+75HhDT6gBb2L9yftQgu
 7VPyv3u/K2rxdG2dzZVAfvwXAVQW2PuqCDeCTtB5qHtTbooJFqne4DerHddi5cgCxHiE=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:Date:
 Subject:Cc:To:From:Sender:Reply-To:Content-ID:Content-Description:Resent-Date
 :Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=a+mL6onjwYJFYgpqq2TyBD9eQM5EOD34JMpHoZzZFIk=; b=T
 AML9unkwxbVD0cUrHG80v64ouzbJ8L1PuF63IiiEG4rxdytvFjxnQZ8CKYCdhMn9HPTp28vE0X0aF
 fCeT2ifXy5HMGeuUJstnqB7d//xKdP5kywQef3nqA6ldOyXIBs88GwStKi8J3b/5xTHI7w4XNkvsE
 oanbQzR38Te36W0c=;
Received: from mail-psaapc01on2139.outbound.protection.outlook.com
 ([40.107.255.139] helo=APC01-PSA-obe.outbound.protection.outlook.com)
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1pvGHU-00GF5z-K8 for linux-f2fs-devel@lists.sourceforge.net;
 Sat, 06 May 2023 11:40:53 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=W8FLliVo5YUd7lgzFlAVWeE6Ua36Z2XCH1AX4yqhb1A3VX9kFyFyfeme8z/ZN1/CT61ivzCpVuoSpC8jaIsA6WXJc+pHEwgbPk2I4OIrfR5PhuxrIRn16fJsGNEWbgiQb8kzcleMshzBW36Pr1QsGHQHzicTaVoxncghsdO8yJoSHDwYnjRcGi4gXJn7WCXDSlUEyB8TYCVPk1ZvKSMAX2N80M2PFFEFgUXy55Ovjep7oU2e1cwDZmrFpU4X9fLCwbnAq4P/7Pd9Ujbo3jTLo+Sz7w4Un/NG77JVD7b/V3StgeSzIaZniSZORpknOaLcme1ot9IfGLA+dV3nYHnzUA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=a+mL6onjwYJFYgpqq2TyBD9eQM5EOD34JMpHoZzZFIk=;
 b=IdtQESIdNjqHGZU+TWr7A9Brr9mKhxI63ZrsprmftFcUNpTbCoQLc0j9tL15J0cFGPzPmXHv+jmeA9PN+6hkOeNzq6NMD2OG9nTj0KxDaK5YzlW4kziRUJ7RCyq3rNUwhVOdmXSWcaG38vZ4eLNS2oE6a8KqpIjYJyyrAdCbYOj6WDcDBhuPLJiLiBdDjQ/UDnr7YZDCz5Zqy88byzmC1SoUoMRQ/8ypOUhM+MlgWpeDBEfyjK6aAjxHOiQIbjUyLI/ZnEVqz5ZEiuSOikyLJRUOzHXHPG1qJn9C1vpUyPpOAtWy7fc2ufg+QIlrxDnBcdRYewYFUDZoyBmMd8RQLQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vivo.com; dmarc=pass action=none header.from=vivo.com;
 dkim=pass header.d=vivo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vivo.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=a+mL6onjwYJFYgpqq2TyBD9eQM5EOD34JMpHoZzZFIk=;
 b=ly4mqEAMqy0KdHA7N0nM82QoAFQvDlWHBLp1j7AWcwtZ+OMw4GcxzuIxIFC4bGnVHYPcf5Xrbt01FSmoXeImJ+NjeJoQiwaAvSk46q6ZIV+te7hAM4vo2tL83FXgXp0i92Ob2INapTT/Nq2re/nBBKfLB+BGdsmr/Hn2SlUCaX2w76P/6+5EsAH8Za9TB1i/njdzE1bUmzMlKRC5iyx/KvNevmDh1sDnrS9CGNXQ40SlMFh88YY1VWmVwmgNWSusn+RbYSOVPyA6bGEA1ZtdmS04Hp5fv+2S09sbLq8fvaQ7AjfckS3lDNnfXQj/h3luLQdblwaxrJxckXrhYezYJA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=vivo.com;
Received: from SEZPR06MB5269.apcprd06.prod.outlook.com (2603:1096:101:78::6)
 by SI2PR06MB4267.apcprd06.prod.outlook.com (2603:1096:4:15e::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6363.29; Sat, 6 May
 2023 11:40:43 +0000
Received: from SEZPR06MB5269.apcprd06.prod.outlook.com
 ([fe80::76d6:4828:7e80:2965]) by SEZPR06MB5269.apcprd06.prod.outlook.com
 ([fe80::76d6:4828:7e80:2965%7]) with mapi id 15.20.6363.029; Sat, 6 May 2023
 11:40:43 +0000
To: jaegeuk@kernel.org,
	chao@kernel.org
Date: Sat,  6 May 2023 19:40:33 +0800
Message-Id: <20230506114033.23908-1-frank.li@vivo.com>
X-Mailer: git-send-email 2.39.0
X-ClientProxiedBy: SG2P153CA0023.APCP153.PROD.OUTLOOK.COM (2603:1096:4:c7::10)
 To SEZPR06MB5269.apcprd06.prod.outlook.com
 (2603:1096:101:78::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SEZPR06MB5269:EE_|SI2PR06MB4267:EE_
X-MS-Office365-Filtering-Correlation-Id: f6ae0b3b-672c-43bf-1748-08db4e26b97c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 3s1OXUyG11T8Nbc0kqREN5C9DbwxT+t++zCc1w4H2z4GOihTiNv+9vo9MBFUxNbmYhic5QlleevxsTAFcbJPpIwektH8VweJ+3X8C2UaAi+qAmgrBDPfLSozwRuChKBWUEKJbFDZxLHRWEfPoHdW1FJa6q3M8E/IeuDRyy4OScrqkMSE+sKYSFmV2ZzsbPyIv0wURNeY1khgdvfKGzQjA5uyIb4HPDQkxyHrs8cSZWGS/qmD+y9Yi+y59iO15eL0HrBYgmTo26KJpWpwWgI0/XAVIxcW/3CNvA6mksfRTjf81cvKnrz9qSacYwKx23daIyXMVjKnnnOv0Qd1+wmEp+jsrnB7vEVvTa8dgd+eAFjbn/tpP9bG36yDQAtqntPYW0MCUDdIXsUk448dhPWX11YfgY3oAUD2zA9ST+0sj/F3HS6weWVAZsTspzcDV2XUaxt8qg69UTc2c39hjNWRmxcyK/BWr6uHSpZvSENSouLczJl4OLvG01Y/+6Qkgk2CAX/GhFgSUa22PJ6pcv96wu2XjKiB10eT2dmQvgcQWYz4iZJU43e501g6ZpxY+xywf4OK+x6iTbkFv6fsW5iErWBJOI7KVuK0sAVP8vhkgnzYNX4JzeIqqh/88wPCiUgS
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SEZPR06MB5269.apcprd06.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(4636009)(39860400002)(396003)(376002)(346002)(136003)(366004)(451199021)(86362001)(8676002)(8936002)(6486002)(52116002)(66946007)(66476007)(66556008)(4326008)(5660300002)(36756003)(38100700002)(38350700002)(478600001)(83380400001)(2616005)(26005)(107886003)(41300700001)(2906002)(186003)(316002)(6512007)(6506007)(1076003)(6666004);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?O3uCt/znlm2VovrEeZartlhp/FXn++rMCQP8wthnoojZG4buaC0TYGjr+l0r?=
 =?us-ascii?Q?IJPY+iAC/M3DO+6tE2aRKttbKdsjp4GCpN3OZmgHMytQz7NqiRBS7ypMVbtX?=
 =?us-ascii?Q?V3Sp3vHQbd7WcKYzuiW2qmm2YldUghYLtIAX141AJCkfBWuF1SEia6buJNXd?=
 =?us-ascii?Q?7GonhV7VC6CitKKq0SpNpkbF2Xu7lyD82x16AOPf5fq2NdQMx3QolU1cBWDP?=
 =?us-ascii?Q?1s8ypug7sWPR6kpKHPukvKZ/SlpNuEUWlfL61hYmEwiT62noQkLmD0lzIZ9h?=
 =?us-ascii?Q?celfYFj33TFdKwBkpSr6XCGUe6GFL8V6cdyAxAPLdeXY+EoB9USauqrwF5Nf?=
 =?us-ascii?Q?4vf0Iw3qjx+/Zj/V8OgQS2CxbvUp9ay6tIM7VcLwcDiYDCARutlu6qKifI20?=
 =?us-ascii?Q?hMO/zLjuePJBtS98k0cYmzyIZ/dFc44ScbiYjUoM20wJeUwIGDZyBbtfJM0H?=
 =?us-ascii?Q?2Gw9jqphg1buCdJrXw5ru5LYsAYt6um/xIay772Hh+Wpiyz+25HA/S/Th0SK?=
 =?us-ascii?Q?pRDgE4I1P6EutTMtUOaIgQEC/+b4OGC1ZxF/hczqRjiKbQpv8I3/f91otwcj?=
 =?us-ascii?Q?8AgpkWli4GaTXuX+s7t7G9SiUtGLbVn6FNLZkrp5QtQTvLzJl+RnWEh5Lhr5?=
 =?us-ascii?Q?8g2XWSuoWfmU/CScI/jruNmk4MjVkKBdTN45RG4RCDAwF2+a7tqZNgb0BL7T?=
 =?us-ascii?Q?KVRLfiu9cVT4BNMkM2m4y/4aWzLzDBbng54oc9qsmwRCqcSFek4Ja7Ba2fSk?=
 =?us-ascii?Q?HQmGlckiohacoxFEh1hZ2Na+cFAlOo7GD5JRU2eB9XuvSXF3EcULxcNCQBE+?=
 =?us-ascii?Q?AyXWPgpFC/bY7qFvP7z0egTc1+SUKpyQhoTGwfui7xkwe7MTavTXjQyhOXyU?=
 =?us-ascii?Q?cD/PeajXWtB2Urn7EeyXOpnF7W2y4jl6M/RTEEdS6HHDx0GT3p9Oq6Nulee2?=
 =?us-ascii?Q?+DwyJkXgzYm7LjRFd2r45iPyrT1dlyNEFtCZ6A6a0uPn6CHsWZk3CGV3C7Aw?=
 =?us-ascii?Q?Iudffpi5JAyUFu3mnimcy/ZvTcp8jVbdd85treUggX5ekiOo6CXKy0pi8jVl?=
 =?us-ascii?Q?9AV+hcXs8nVxg0q+g9FJGMK8rbT3izcC4ZZGehUJdXo/NTJrTs0wR2H+STOW?=
 =?us-ascii?Q?tI18R/zpV7cSKIioP56vS1bllZ5s7wr25pDSDXqBklWW/wUZ9dcbvLoV9dtF?=
 =?us-ascii?Q?b3MP9Nwjbg3RfcKaqibaszWqUpiqfSMukIbngrGPFFaBAG6YGMeHObe7l3RF?=
 =?us-ascii?Q?ZLpr7b9vtZxprCAAWuXSxbno2Ovid6zqKftQ2ArSBF7XQhcsCtPaXnz9q84a?=
 =?us-ascii?Q?RtblbqjAwPATSOYmkoO4G2+U18i4jvJW3MOx6V93qVzneo2D33V2RYc0wrOh?=
 =?us-ascii?Q?mLXKg3uYoCNaL/+XONARnuFGDg+9agCaRIUZcfiiR+7ZGp0+bQDYVEGXxZiJ?=
 =?us-ascii?Q?LexViP+njZ5I8F7YaZg0gN//64hqd9hhvAzKlc3JMzwTmxL5fLFgkFhPvguT?=
 =?us-ascii?Q?N+cyuFADJbl3Z+mK/kDg3syH1GuO3P945g1Cx9NlR0z3Nc7gu8vsoTjhYxBx?=
 =?us-ascii?Q?zbeNpRhjbXQCDdiufuY5b5TK8mnlV/amYM4dun8Z?=
X-OriginatorOrg: vivo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f6ae0b3b-672c-43bf-1748-08db4e26b97c
X-MS-Exchange-CrossTenant-AuthSource: SEZPR06MB5269.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 May 2023 11:40:43.2974 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 923e42dc-48d5-4cbe-b582-1a797a6412ed
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: F+1QFZ+OQJ76Xpsn9c66cPfQKEm/BjPfTzrlL1cQU1NEgWq6FMuIJuccb8lls2Sz6WF1DEUoJdDDwIgGDNSTpA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SI2PR06MB4267
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  For judging the inode flag state,
 the inode lock must be held.
 Fixes: fcc85a4d86b5 ("f2fs crypto: activate encryption support for fs APIs")
 Signed-off-by: Yangtao Li <frank.li@vivo.com> --- fs/f2fs/file.c | 14
 +++++++------- 1 file changed, 7 insertions(+), 7 del [...] 
 Content analysis details:   (-0.2 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 SPF_HELO_PASS          SPF: HELO matches SPF record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
 no trust [40.107.255.139 listed in list.dnswl.org]
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [40.107.255.139 listed in wl.mailspike.net]
 -0.0 T_SCC_BODY_TEXT_LINE   No description available.
X-Headers-End: 1pvGHU-00GF5z-K8
Subject: [f2fs-dev] [PATCH 2/2] f2fs: move the conditional statement after
 holding the inode lock in f2fs_fallocate()
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

For judging the inode flag state, the inode lock must be held.

Fixes: fcc85a4d86b5 ("f2fs crypto: activate encryption support for fs APIs")
Signed-off-by: Yangtao Li <frank.li@vivo.com>
---
 fs/f2fs/file.c | 14 +++++++-------
 1 file changed, 7 insertions(+), 7 deletions(-)

diff --git a/fs/f2fs/file.c b/fs/f2fs/file.c
index 850e745ecf88..0837c500b990 100644
--- a/fs/f2fs/file.c
+++ b/fs/f2fs/file.c
@@ -1801,6 +1801,13 @@ static long f2fs_fallocate(struct file *file, int mode,
 	if (!S_ISREG(inode->i_mode))
 		return -EINVAL;
 
+	if (mode & ~(FALLOC_FL_KEEP_SIZE | FALLOC_FL_PUNCH_HOLE |
+			FALLOC_FL_COLLAPSE_RANGE | FALLOC_FL_ZERO_RANGE |
+			FALLOC_FL_INSERT_RANGE))
+		return -EOPNOTSUPP;
+
+	inode_lock(inode);
+
 	if (IS_ENCRYPTED(inode) &&
 		(mode & (FALLOC_FL_COLLAPSE_RANGE | FALLOC_FL_INSERT_RANGE)))
 		return -EOPNOTSUPP;
@@ -1814,13 +1821,6 @@ static long f2fs_fallocate(struct file *file, int mode,
 			FALLOC_FL_ZERO_RANGE | FALLOC_FL_INSERT_RANGE)))
 		return -EOPNOTSUPP;
 
-	if (mode & ~(FALLOC_FL_KEEP_SIZE | FALLOC_FL_PUNCH_HOLE |
-			FALLOC_FL_COLLAPSE_RANGE | FALLOC_FL_ZERO_RANGE |
-			FALLOC_FL_INSERT_RANGE))
-		return -EOPNOTSUPP;
-
-	inode_lock(inode);
-
 	ret = file_modified(file);
 	if (ret)
 		goto out;
-- 
2.39.0



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
