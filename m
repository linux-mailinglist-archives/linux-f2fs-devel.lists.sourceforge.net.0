Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 4963E6D658F
	for <lists+linux-f2fs-devel@lfdr.de>; Tue,  4 Apr 2023 16:39:06 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-3.v29.lw.sourceforge.com)
	by sfs-ml-3.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1pjhoN-0000Sj-6D;
	Tue, 04 Apr 2023 14:39:02 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-3.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <frank.li@vivo.com>) id 1pjhoK-0000SU-2b
 for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 04 Apr 2023 14:38:59 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=MIME-Version:Content-Type:Content-Transfer-Encoding
 :Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=nUetdZrDZs9U0PZAM+RGHLLjWMxadoogoOp+BD749nQ=; b=SQEC87c7XRyjAyHADGnzjViAsY
 YSKMI0ITveLmwdQT2Go11N90e53ZJ50HD0qPS2IYYZzJxNXIH76pEZHTUwe++6h7frAQuxohEtqtj
 +WVZRPgLb/pYO4gdUL2Xa7wF8qjgJZKxLHAMUJkRQGkZuxp4h/3dqFfXhhQoVCU52700=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:Date:
 Subject:Cc:To:From:Sender:Reply-To:Content-ID:Content-Description:Resent-Date
 :Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=nUetdZrDZs9U0PZAM+RGHLLjWMxadoogoOp+BD749nQ=; b=W
 zYsiwUbnyWaZtVqbBgfwQp1AmEDITfT6h7Tm7vDYCRy+NEU/yB2jLf8YKpS6t2xZqHdzk3uxenQk/
 xagx1nlZezyBOk3n9jwJ91zMv64rye8I/njKPQX9y+30ZJ9xDOZzDLP7tUykEzULqTPvCRVcwLLU0
 oJit+gATG5yCMU58=;
Received: from mail-sgaapc01on2123.outbound.protection.outlook.com
 ([40.107.215.123] helo=APC01-SG2-obe.outbound.protection.outlook.com)
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1pjhoE-00Ey6f-Qg for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 04 Apr 2023 14:38:59 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=TDlGjzFwJDt0YDM9j0k495bhufxysqrRv4oXZZJzrhKuJ4nLr/et5z2ws3/QWpzL7P86JVCNuYkpN3t6sFiWdWa/jeHgkhxD/YRFG6RmnAjktZFcDa8Kc2DL1wuVD1wqanVrVtlGX8MkWs4ghWCITf+YhvO2t2Qwf+j/aePzcB4L85MGnSULaLmkk6T+fYf76bdN6Q0Eg2JNBs3J32ux33SgivwWZrBJAOo0Eqlj4jKM/moAhkPWBv7ThF+52i3UfIlO80FXCqZoX8GKEKduezGASE66zhGa51l8zPCNkexGKYOI03U0j3QjUbmHmqTLOMStuDUnK+ifaZdefjXLBg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=nUetdZrDZs9U0PZAM+RGHLLjWMxadoogoOp+BD749nQ=;
 b=nMjYUu/srsnDFtYT4vwL9Qn8yvfaC4fqFJAFpi6WwvfUBMJ3tjLOsvCQcFiraDfBFwQDBgt202SHb0yd1xA94iUyX26OMwYGMIUfU/taFpzUaW/nSaWzcMnuq9GkrDWB8lzsSFDxmvvY4PUb5vnWfBJ6MoIV8c1Y/9TpFzB5GqtPa/bKY+MYfI3fmIh/HNrzs+atHfcPAtz4L0L6r5/1W3ShE4IUgzcVUEUVOl1jJFoAdYzbqaiY8TWXjFsRurh/ouIgu36NkJWfILK2qxVODaI6eyLi7ad420bW1dZsufxYfHvuq7S0snRb4Geehwri/huM3oE/chahwErtqXOvEg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vivo.com; dmarc=pass action=none header.from=vivo.com;
 dkim=pass header.d=vivo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vivo.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nUetdZrDZs9U0PZAM+RGHLLjWMxadoogoOp+BD749nQ=;
 b=QGnu6K2XZZEjg/PI4DneWyiKaCQw2W0cimMha1AMwRrXvBu2fl0OGU8Vc867FlJbtFGMi2Eb8d1ZLbRI1Nk8E1IuKYmaPIbE9COVRhA5ifqclEYnjdrDSseURfD2OADpGO1iyhr/pJ7Cz6cnECVEjpRi2uVZvRLKy1lLKRqCAiX5GW/4F9nH23UGX86oEU1X4hQNBvPzA1nHc7QGLYZPsWVeghBftovJO1WUPtpRflN+8HPrgLik3qhyYQVQaxI1By6JWd8gYMmngq7u9NNcBMHCWZPPyUXGrceigUc1sIlt9VUX98xIZYPMstagTCtzDAVx+VyfH0SjgpOAN4H2jQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=vivo.com;
Received: from SEZPR06MB5269.apcprd06.prod.outlook.com (2603:1096:101:78::6)
 by TY0PR06MB5354.apcprd06.prod.outlook.com (2603:1096:400:214::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6254.33; Tue, 4 Apr
 2023 14:38:46 +0000
Received: from SEZPR06MB5269.apcprd06.prod.outlook.com
 ([fe80::a3a1:af8e:be1e:437c]) by SEZPR06MB5269.apcprd06.prod.outlook.com
 ([fe80::a3a1:af8e:be1e:437c%6]) with mapi id 15.20.6254.028; Tue, 4 Apr 2023
 14:38:46 +0000
To: Jaegeuk Kim <jaegeuk@kernel.org>,
	Chao Yu <chao@kernel.org>
Date: Tue,  4 Apr 2023 22:38:31 +0800
Message-Id: <20230404143832.18234-1-frank.li@vivo.com>
X-Mailer: git-send-email 2.35.1
X-ClientProxiedBy: SI2PR01CA0035.apcprd01.prod.exchangelabs.com
 (2603:1096:4:192::13) To SEZPR06MB5269.apcprd06.prod.outlook.com
 (2603:1096:101:78::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SEZPR06MB5269:EE_|TY0PR06MB5354:EE_
X-MS-Office365-Filtering-Correlation-Id: 3b93f20e-90fa-4593-fb01-08db351a4b89
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: rZciRhES1LRMzUKGQpDbWaQHgHONQTEZZamb+8UYY0fAAl40Fx/cXEnL2402EYZ3MK0e+GKk33VJHXL11eNoaTglXFVHJDPoGW9HbzhCYgesA37r3T9UogZnSD6xohXVk9TgVFzxc+sQ0JcOFXEwITklNZ9N+a5GzeJzWMUbhshx3qM3FjURgMF01CYgyDMOS1PPg2Gr6Q1gO+M5qj0M5AyEkq6TOvuxMnGl7nYNMu6CthluVfM3Hs9gyVh1mae5bAm/D1oNYBv1ii1SXJ4LVafiNLXFrrO1hMy1f/kdGEkmMdjmbbRjDo9AaRtVChh+wCmxS6YxG8tevnDm1rPQHYFKqPUSkepplwiVHoz/l2pqKl70F9chUCM9I2XTvtWCviR8RFKHuxsE4wcVXQRhbttKXy0eBnFwOKNGYVukH0cn1XN5uHXhEzx2fsxwVTqJ5lkZMzM8vNFf0V18P/xgkV9fsfgIZ0E4VflAMEmmQD+D83HnWs2hudtHFQUsruDO9kIFfw9LJvkqaZnqBPd7a70fnx06Af50hHMwSr3WeHdulfBbP22P1E5VO0YqcBNB1iwk5CE8KX83xfbIg3AsW2fQXgQbc4ni489vYD8oEF8+aWRXhBbOA7RqwonaVnGh
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SEZPR06MB5269.apcprd06.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(4636009)(366004)(39860400002)(136003)(396003)(346002)(376002)(451199021)(26005)(186003)(6666004)(83380400001)(6506007)(8676002)(478600001)(41300700001)(2616005)(4326008)(1076003)(316002)(110136005)(66946007)(66556008)(19627235002)(66476007)(6486002)(38350700002)(38100700002)(36756003)(52116002)(86362001)(2906002)(8936002)(4744005)(6512007)(5660300002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?m+nY+EbMNFMZ9fKnwlAIAYWZn0yHw6/HkDKywusc9YcGL7j6JeBs7dW27CZQ?=
 =?us-ascii?Q?8V73THsbFNxQcKFxKf74q7pbG4Ngx6zsdzOVIff4yVxDp2hTpQKfs5cRBSX+?=
 =?us-ascii?Q?8o6xetV42sgYm//0fwY7YdH6UHt/RzcLVgskrULnnYotmo/N0HKc+6EC7Niz?=
 =?us-ascii?Q?9FOjOOaVIzJAwhk2Gdh9UYj4vZF9DdAqQ5jWR8tlVqlVyVxjza4S3JQOx0RR?=
 =?us-ascii?Q?VO2wJU0DluOpwhHdN7++XkVM/Po2WYetdRg+iJMaVS2T7Ek6fZxSWeBy6Yu5?=
 =?us-ascii?Q?wDTVLUeeBLqER1XaIb0A52k11qLx6DVUFBQkNu+hBP2OxsopMaO3CvmzhpO1?=
 =?us-ascii?Q?NoIPyYUSYHmLcKAsMIvl1GYcFF0YtP/8U0QBh02cYQcA1VcCnJArxgcikW/s?=
 =?us-ascii?Q?QauPYhhtxUlMXCc5Cfew4cV1yu2Ktr0lAzzM3qaq86qpU5m/cYSZDWU0CiNZ?=
 =?us-ascii?Q?7fnuBjzi1zBPug8K9H3BZJoLMjUkuyh1i9kYrWOmILBnvG/5z3kntlBMM0Oy?=
 =?us-ascii?Q?XHDcP01p0ifLr9ZXFgdRXlRkA5YYnriatg2aahzyb4Be2Df6Lh3kX3Ttsz1c?=
 =?us-ascii?Q?hNwBDBK3seCA/ABsPBQi2VeY/OYiE3PJZAyiD56NBe+G8EGdzUe02mO1bMEn?=
 =?us-ascii?Q?Ie2681erGXfp2CXNnx4vE1Rw7bgflrFvnfBCIGbyrssgJi82ifoT0lS1aP0F?=
 =?us-ascii?Q?ke8/sGCWwrNEiyVZmIVgiih/JBbvWldmWBa6blfoGU4GqdJVXGhnS1JHuIQl?=
 =?us-ascii?Q?tCPZnwItlndk5hLWk+IyLQvDCv2ZvqgRgBcrQkyln1zCRfb4nEGyoPkZ90tq?=
 =?us-ascii?Q?EsyyC/x2q4i6cyDHRnZHPzkTEjfZ+1qkhKTc9gdTNIrqPX8xqZNMLZ/3dmbw?=
 =?us-ascii?Q?zxryJZMa0u8iq+11GHlJN7MYP+s07ECNL0HMAbvlFL+nRTNg9vtD1Ljw9FPf?=
 =?us-ascii?Q?7JZxziAvOO0f3096f8oV+ObdonlUPQv6xcPtZkfCs9vw/x9YOjhhPl13TQd6?=
 =?us-ascii?Q?4AuWfu/Phc75BKrrcckumEhl9tSzvBoYWtaQd+qP6/NnXyuicYwjF3R7wqxH?=
 =?us-ascii?Q?SFMF8B9qffesWu88GYASzNp1kZxKboQtGzUwKVTvV382vmiqv1Qv6/cW9QPZ?=
 =?us-ascii?Q?nxlpQbEgag74JYV0JraoEyZujIj+BtWRTEEn3G8f8EaQIYntkspM0s6aqh88?=
 =?us-ascii?Q?fxdpUl0+qlbJfhO3N7uPoP3XWLDQhcMshAw3TdE1rXoFUF6kjw9GcLUSSHOV?=
 =?us-ascii?Q?N3gku7ebsVaPU5XxcLGr0x53xNOzOKXpge6IhNZD8eK1Xa5m8y9tKNLVq3HX?=
 =?us-ascii?Q?eImwqbcM6/ShY1eedt87/rz1PtPUy2eahsmFpDGG1Y15fEyyRZERvo0VWPvl?=
 =?us-ascii?Q?LC/S9hFX//kAdMbi0ZkCxO6mhs+EWKgET3Kj6tL3HIZoqjM0+6Me4hTj9sum?=
 =?us-ascii?Q?0mTpw7PDjCSEJ4v6A7tjSRP25vbtpSPz8CA+wIUzkZVO11v0qdWPnR3DoWer?=
 =?us-ascii?Q?bfb7atuQZ7amamNYXRXr9JCHts7Ck4nj7qj1Jw97iQvhQ9vYpxZSPHwBBYEx?=
 =?us-ascii?Q?uu5T0irtCHbCoZJadYrxDP3dQlXom0ZzgpBMm3J9?=
X-OriginatorOrg: vivo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3b93f20e-90fa-4593-fb01-08db351a4b89
X-MS-Exchange-CrossTenant-AuthSource: SEZPR06MB5269.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Apr 2023 14:38:45.8385 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 923e42dc-48d5-4cbe-b582-1a797a6412ed
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: LyiwZ2gDZD7Io1bCLSiTDiD6lPX8FYhlAKFWi/fNRjxNAUkQH/VMiwRwvNH6wVtZNRPsGV8h1XI0d0v5cYidlg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY0PR06MB5354
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: It's deprecated since commit 377224c47118 ("f2fs: don't split
 checkpoint in fstrim"). Signed-off-by: Yangtao Li <frank.li@vivo.com> ---
 Documentation/ABI/testing/sysfs-fs-f2fs | 6 ------ 1 file changed,
 6 deletions(-)
 Content analysis details:   (-0.2 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [40.107.215.123 listed in wl.mailspike.net]
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
 no trust [40.107.215.123 listed in list.dnswl.org]
 -0.0 SPF_HELO_PASS          SPF: HELO matches SPF record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
X-Headers-End: 1pjhoE-00Ey6f-Qg
Subject: [f2fs-dev] [PATCH] f2fs: remove batched_trim_sections node
 description
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

It's deprecated since commit 377224c47118 ("f2fs: don't split checkpoint
in fstrim").

Signed-off-by: Yangtao Li <frank.li@vivo.com>
---
 Documentation/ABI/testing/sysfs-fs-f2fs | 6 ------
 1 file changed, 6 deletions(-)

diff --git a/Documentation/ABI/testing/sysfs-fs-f2fs b/Documentation/ABI/testing/sysfs-fs-f2fs
index c1314b7fe544..8140fc98f5ae 100644
--- a/Documentation/ABI/testing/sysfs-fs-f2fs
+++ b/Documentation/ABI/testing/sysfs-fs-f2fs
@@ -190,12 +190,6 @@ Description:	Controls the memory footprint used by free nids and cached
 		nat entries. By default, 1 is set, which indicates
 		10 MB / 1 GB RAM.
 
-What:		/sys/fs/f2fs/<disk>/batched_trim_sections
-Date:		February 2015
-Contact:	"Jaegeuk Kim" <jaegeuk@kernel.org>
-Description:	Controls the trimming rate in batch mode.
-		<deprecated>
-
 What:		/sys/fs/f2fs/<disk>/cp_interval
 Date:		October 2015
 Contact:	"Jaegeuk Kim" <jaegeuk@kernel.org>
-- 
2.35.1



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
