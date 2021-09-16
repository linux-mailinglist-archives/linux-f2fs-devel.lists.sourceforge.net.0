Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 7559840DA68
	for <lists+linux-f2fs-devel@lfdr.de>; Thu, 16 Sep 2021 14:55:57 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:MIME-Version:References:In-Reply-To:
	Message-Id:Date:To:Sender:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=Hyh59mKuJYx3j4pjpzPXMUzK/6zuzFwrPjnWKIxGXpU=; b=JaOAT4OWEtPB7CmfnrPcAVeDX
	/ux1OmJ3prq5qjW3lzKh0W88HDKDn27QPKr2Xhr0b8EXUnvqOfLMrf1MiNfSrCIbtEsjKDqKGk0aE
	ONtAXyQ8XDNZRjUMvpzp6bOeMkb7mlbhMn8apiMQHfMRgK4Cj7K5ykMqwVWNf+fl8TOcI=;
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.92.3)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1mQqvg-0006ax-Nn; Thu, 16 Sep 2021 12:55:52 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.3)
 (envelope-from <changfengnan@vivo.com>) id 1mQqve-0006an-8K
 for linux-f2fs-devel@lists.sourceforge.net; Thu, 16 Sep 2021 12:55:50 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=MIME-Version:Content-Type:Content-Transfer-Encoding
 :References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=3Y0un+PVCR9ybh9n+F5C4Fw0dEzrEi1PENhPurN3Tzc=; b=Ps0qZGelGQc6loCxdCDNr4Vde8
 NJWsnciwV9WzMMB2+yCek67Bc68Ilw/3/58kZHfb4F4LTcLX3nmTfjWJm+alp62umaHP+Wr7Y10RH
 flC3jEmYba4A5wJvJQtOtgk9GKcJyIpyxxpwAzlSW2j0p6btXKC0Vur75uJZFGrjc7ZU=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=MIME-Version:Content-Type:Content-Transfer-Encoding:References:
 In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=3Y0un+PVCR9ybh9n+F5C4Fw0dEzrEi1PENhPurN3Tzc=; b=f0apbZHB1mKHD0cUcioYojm5rB
 o5sMwhAjmQRZ2SUaubj9XJCh9QmNV+nAMJYGPvS9Jb5X+OjtOD2g18oRh96Z7KcoB2MKtARMKm9wQ
 0J0Mz5tB/VoY2sJunKR9knTtWmSHAO6z9eFQZMUoQ3zHJc3vWBkniLvpR6VortdYHGFQ=;
Received: from mail-eopbgr1320110.outbound.protection.outlook.com
 ([40.107.132.110] helo=APC01-PU1-obe.outbound.protection.outlook.com)
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.3)
 id 1mQqvd-00Ck9a-DV
 for linux-f2fs-devel@lists.sourceforge.net; Thu, 16 Sep 2021 12:55:50 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=oTVZTJ6tK6Dv5PtOdWipjlNI73M+QTn7TXrwjzyuCsl0FLbXGb13wAkiGd/Cd0K697prwdJtR2x4h906TgefNaBVZuGKvZ+1TUQaYMjB4VGLv4pUQAAmJdhvBF9IKpCYq/PqI5vra+hE7yfyWW6dPpeCwjjhN5ZKHxvcHnma4hAIIW1bE5CGpvToydGIeirMYWXQmZBzF5syH905FhGGGUV/58hgHHZGBdmGOdLuf/zMQkwYnvAdEQhkzDgglg78s3pWwhKmpX4b2F76eR6f4e6aJxmc+UyncEbInqWpTJDfzJWusVpyjkVVEdreN3qmDqt35w4SZpuNZCQSIDRZ9w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version; 
 bh=3Y0un+PVCR9ybh9n+F5C4Fw0dEzrEi1PENhPurN3Tzc=;
 b=MwlxMgYj9npmLFrrl0pVzPnMzbWL1aOiRQkVGq9awHBUoj5/Y9I7DVFcgy2lIFGzLAITOP7kf0mR4ncxrrkUmRt5NjtzSicFsqMvvguVVn1yGW9wBLZAvF1Mfgn4KX3FwVbdKE+NP9xytuHz+z+dtFCqsLSZtosh5oDkH2264+8VawDS6EEOWLKQ6WSmifXVFKbnVDQvQmRJOMzldmaTZ+qPFCC9bcfCjarGlaejQr2nD4KGEC2wieVmv9b3RzVhgNY1d++iSW52NZdX2xCGD6ca9A0FVvQ2cOYtrjt/2/60Vt2g++FGJTn6QpFbcOCSV00WlRQOjBy0vR/wKXljdw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vivo.com; dmarc=pass action=none header.from=vivo.com;
 dkim=pass header.d=vivo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vivo0.onmicrosoft.com; 
 s=selector2-vivo0-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3Y0un+PVCR9ybh9n+F5C4Fw0dEzrEi1PENhPurN3Tzc=;
 b=bI95UCe9pTYP3HUmX7Hy6zIwHjDGq5IeawXKfaoMO4GXuxE2Cg+8PAUYoKoCWM39Ot7KJdpdY9wYqRdroT2HEJF8ykvYlDyH6K1lVIZuQ3ogOPD8unglw2D6Jq/DBbW/Hl0Rie9mBSaYGpRbXF3Fij9SPPxo8paq76D3T+eZI30=
Authentication-Results: kernel.org; dkim=none (message not signed)
 header.d=none;kernel.org; dmarc=none action=none header.from=vivo.com;
Received: from KL1PR0601MB4003.apcprd06.prod.outlook.com (2603:1096:820:26::6)
 by KL1PR0601MB3969.apcprd06.prod.outlook.com (2603:1096:820:27::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4523.16; Thu, 16 Sep
 2021 12:55:39 +0000
Received: from KL1PR0601MB4003.apcprd06.prod.outlook.com
 ([fe80::fcd1:f2b4:cfa6:6970]) by KL1PR0601MB4003.apcprd06.prod.outlook.com
 ([fe80::fcd1:f2b4:cfa6:6970%7]) with mapi id 15.20.4523.015; Thu, 16 Sep 2021
 12:55:39 +0000
To: jaegeuk@kernel.org,
	chao@kernel.org
Date: Thu, 16 Sep 2021 20:55:20 +0800
Message-Id: <20210916125520.118196-2-changfengnan@vivo.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20210916125520.118196-1-changfengnan@vivo.com>
References: <20210916125520.118196-1-changfengnan@vivo.com>
X-ClientProxiedBy: HK2P15301CA0019.APCP153.PROD.OUTLOOK.COM
 (2603:1096:202:1::29) To KL1PR0601MB4003.apcprd06.prod.outlook.com
 (2603:1096:820:26::6)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from comdg01144017.vivo.xyz (203.90.234.88) by
 HK2P15301CA0019.APCP153.PROD.OUTLOOK.COM (2603:1096:202:1::29) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id
 15.20.4544.0 via Frontend Transport; Thu, 16 Sep 2021 12:55:38 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: c06b8840-9b19-4ef9-27cf-08d979114898
X-MS-TrafficTypeDiagnostic: KL1PR0601MB3969:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <KL1PR0601MB3969A4492312A1B7F4A29C82BBDC9@KL1PR0601MB3969.apcprd06.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:741;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: FTQwdU9FemvyBUACADzHtlJtLD85/FKJ3QZGU0pQ/bojg6yf3/001QiIQCxehKw/RFdhX5F6TLl6ag5/TgSIihWbYmbxpg/to4ZNgcmy4CpEE+Yb+TQuiFQcVn4tu5liAx6qGa/oVz2Z+FXQdh4iaOY1XbBPWhB1uoysph6tY2IUEZPqz7rQmH4g/tpiYU6S5uYV2ua0DH/VAkrxJBCEnTJBnb7pmn1jobbgVA/ym/4XxhInuJONhnLH4DCAqL/GFHwBN6C/jksSPge2mn4U8lFf7jofQH+5I16jpH6bdkLqlgfIUwXqulqyeLYyt3tK9cTAXJF0yhtyjOB6MJPN2tqB/OFHm+oViF+ZrpZ92vTlUFNSuqoaeNfi4c+TjihPywYaEe+JCLaW2C3ySc61piu5P+zHK53QOMSjMiy1XaG4gXqhnPxJtN4abXzONCosgj+Zvz2yjLaoQhamd/tXHyJ50aA5NRt5pr8aLZCjjr1QoUSETl01Gr5D+SIZvsGu//WF5jMS5xEouvEomuDOVau09iTiQGC3lCulZMNEVHzFw7ZxjS9Ul4/k9CZQZbTYGtLfYEkOmHFZYmviBVXR7cF/+Wuow0Lzsa+n1gSW5nCPImqShg3x4KS57uSsHQn/z+leS6ouLoYXmq6YVFDwTO9wVi26CqmFBNn/c6sMuHOUeidOzov5uRQZU2MNe0YuJleCB7BU80uq1kQVdlQa3gnSPYzJSDQxHJElwv7cuM0=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:KL1PR0601MB4003.apcprd06.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(39860400002)(346002)(396003)(376002)(136003)(6666004)(66946007)(66476007)(5660300002)(956004)(2616005)(66556008)(6486002)(36756003)(6512007)(26005)(186003)(83380400001)(1076003)(8936002)(2906002)(86362001)(38100700002)(38350700002)(478600001)(6506007)(52116002)(316002)(8676002)(4326008)(107886003)(4730100016);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?fZbfwZwRc1FzavvXryESzUGzhHPdJFyBZA/xXGg2rmismKAzTyV2WeRpUMIf?=
 =?us-ascii?Q?CG3G2uD0s+Yf1z7UhjXWFwcFZHEo0dtwEC/zd5dWGqGOq5RPj1Hu4+R/QZkT?=
 =?us-ascii?Q?ft1z6Mb1MvSv7L+hIzGBaMUSFljViVldg6pWqmPh9IK5s6uEvHS9vtPDQqtV?=
 =?us-ascii?Q?gFnJKaoqKJxnFNnY1NZleMDRg3LusQhorVylq+cdKEVEunewtcYEr2pZ0C0w?=
 =?us-ascii?Q?vn5fkFDH3VrmAgGPba/xAhkRSMD3GLk8M8MYlaol0TcfTSfDe6W2xYX59GRQ?=
 =?us-ascii?Q?Y8Ob6ah44lFnaqqp3sNRLhiSGeeGvBvx98FDfMb49jHyhDfj4cw6IwSia35l?=
 =?us-ascii?Q?ybUtBWPSbJ60L1RSb71Cc6Ngim1aZZ0UbRn6tNvFHn7bkGssNvoq785a0s4s?=
 =?us-ascii?Q?dgSREVSkBv0c5KySboCD8AejLOzE+RPl7SEF4TYnZQKpp6l5r1vkhKTVVTMh?=
 =?us-ascii?Q?KY+mJ60Nvqncc6wAJE+//8ZFQse+17gQqus2KffdjHdZzsXueRLbapX6SsSv?=
 =?us-ascii?Q?WhXGIteXpt9ZbbDa8IOYKfUNkUDR8A6mqmojGzhfr+14f5eix9yslP6bdv87?=
 =?us-ascii?Q?99YbaF9gUuyC9y0+BExJ4koz01tVPiujk6VR2IDcbJpoJcRloO6u5FZa3UdU?=
 =?us-ascii?Q?PsauYKjnqX4Og8Nbe8IBThtEJWOOPimFobg7b4tXo6jtdYw9jD3UYfCk5VcB?=
 =?us-ascii?Q?A9Tr51+WJ1mCFPlBNA4WkyBavW4I33sBxuTnq73UUdxuYpEG2SvMD0PDogVw?=
 =?us-ascii?Q?aOrzISu+QBFlRixU0vpdRs8prLLxp/R2JqnSCRZZiUKyEDG2mU5F7CGEm+Up?=
 =?us-ascii?Q?2Av1fgMFZJD9xTrnvve4/FwLa3dnkx7Rs0egKeQwsLFlb9GfSGbtvUwoUfzY?=
 =?us-ascii?Q?r26gdNm+n/HPiqOV0wrIwaFpMfIDABG/niUaIUoy5bEVc4rURHpDEerV/XJl?=
 =?us-ascii?Q?4vOX9Y/kohPY9RglK/GT9brL2v4m0dMcTM5mWBHlPHgsVDbtsTAenAtSSGMT?=
 =?us-ascii?Q?7mxcPi9jZLGyp3d5N60vEWGg45gictdmliDweARvXC22FxlsfBLuiCoCfnV7?=
 =?us-ascii?Q?mAMTcl2lyzdMTEmKaEkgacSMLqnuaLpMxvXE3Kt0kqfHUvLdSWE3ba8Fs4Ut?=
 =?us-ascii?Q?p9M6/x1Wfj39EJgC1c+D+csgmrfFgPB7sF8PFKuYYowi7ETgPuLjurhLu70l?=
 =?us-ascii?Q?ZE3NKmWh+KyD+yv6ZN6XvGfjBmS8V3JZpYOYfaUJsODMQry5mJFYZ8f03BZa?=
 =?us-ascii?Q?BKk4RRlN+CAYS14hMWY0+Q0UB54PqLmxR6GcIosS7NTVkfwxP55hQmoPpFeK?=
 =?us-ascii?Q?aXa0o8tKoikldsM2ahcprWS6?=
X-OriginatorOrg: vivo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c06b8840-9b19-4ef9-27cf-08d979114898
X-MS-Exchange-CrossTenant-AuthSource: KL1PR0601MB4003.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Sep 2021 12:55:39.0624 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 923e42dc-48d5-4cbe-b582-1a797a6412ed
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: YL9WDJaAh7Ag0kib3sHkmwkwJWcxDO2nFrXbIOSmUeUZZiDTeXtA+ZxiMdtfle0X1ubv09RkXwvU1iJ4tMU8vw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: KL1PR0601MB3969
X-Spam-Score: -0.0 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  For now, overwrite file with direct io use inplace policy,
 but not counted, fix it. And use stat_add_inplace_blocks(sbi, 1, ) instead
 of stat_inc_inplace_blocks(sb,
 ). Signed-off-by: Fengnan Chang <changfengnan@vivo.com>
 --- fs/f2fs/data.c | 7 ++++++- fs/f2fs/f2fs.h | 8 ++++---- fs/f2fs/segment.c
 | 2 +- 3 files changed, 11 insertions(+), 6 deletions(-) 
 Content analysis details:   (-0.0 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [40.107.132.110 listed in wl.mailspike.net]
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
 no trust [40.107.132.110 listed in list.dnswl.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.0 SPF_HELO_PASS          SPF: HELO matches SPF record
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid 0.0 MSGID_FROM_MTA_HEADER  Message-Id was added by a relay
X-Headers-End: 1mQqvd-00Ck9a-DV
Subject: [f2fs-dev] [PATCH v3 2/2] f2fs: fix missing inplace count in
 overwrite with direct io
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
From: Fengnan Chang via Linux-f2fs-devel
 <linux-f2fs-devel@lists.sourceforge.net>
Reply-To: Fengnan Chang <changfengnan@vivo.com>
Cc: Fengnan Chang <changfengnan@vivo.com>,
 linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

For now, overwrite file with direct io use inplace policy, but
not counted, fix it. And use stat_add_inplace_blocks(sbi, 1, )
instead of stat_inc_inplace_blocks(sb, ).

Signed-off-by: Fengnan Chang <changfengnan@vivo.com>
---
 fs/f2fs/data.c    | 7 ++++++-
 fs/f2fs/f2fs.h    | 8 ++++----
 fs/f2fs/segment.c | 2 +-
 3 files changed, 11 insertions(+), 6 deletions(-)

diff --git a/fs/f2fs/data.c b/fs/f2fs/data.c
index c1490b9a1345..a65e7a165609 100644
--- a/fs/f2fs/data.c
+++ b/fs/f2fs/data.c
@@ -1491,6 +1491,9 @@ int f2fs_map_blocks(struct inode *inode, struct f2fs_map_blocks *map,
 		if (flag == F2FS_GET_BLOCK_DIO)
 			f2fs_wait_on_block_writeback_range(inode,
 						map->m_pblk, map->m_len);
+		if (!f2fs_lfs_mode(sbi) && flag == F2FS_GET_BLOCK_DIO &&
+				map->m_may_create)
+			stat_add_inplace_blocks(sbi, map->m_len, true);
 		goto out;
 	}
 
@@ -1553,7 +1556,9 @@ int f2fs_map_blocks(struct inode *inode, struct f2fs_map_blocks *map,
 				goto sync_out;
 			blkaddr = dn.data_blkaddr;
 			set_inode_flag(inode, FI_APPEND_WRITE);
-		}
+		} else if (!f2fs_lfs_mode(sbi) && flag == F2FS_GET_BLOCK_DIO &&
+				map->m_may_create)
+			stat_add_inplace_blocks(sbi, 1, true);
 	} else {
 		if (create) {
 			if (unlikely(f2fs_cp_error(sbi))) {
diff --git a/fs/f2fs/f2fs.h b/fs/f2fs/f2fs.h
index 3d4ee444db27..2d81e9f0a0ee 100644
--- a/fs/f2fs/f2fs.h
+++ b/fs/f2fs/f2fs.h
@@ -3785,12 +3785,12 @@ static inline struct f2fs_stat_info *F2FS_STAT(struct f2fs_sb_info *sbi)
 		else								\
 			((sbi)->block_count[1][(curseg)->alloc_type]++);	\
 	} while (0)
-#define stat_inc_inplace_blocks(sbi, direct_io)					\
+#define stat_add_inplace_blocks(sbi, count, direct_io)			\
 	do {								\
 		if (direct_io)						\
-			(atomic_inc(&(sbi)->inplace_count[0]));		\
+			(atomic_add(count, &(sbi)->inplace_count[0]));  \
 		else								\
-			(atomic_inc(&(sbi)->inplace_count[1]));		\
+			(atomic_add(count, &(sbi)->inplace_count[1]));	\
 	} while (0)
 #define stat_update_max_atomic_write(inode)				\
 	do {								\
@@ -3877,7 +3877,7 @@ void f2fs_update_sit_info(struct f2fs_sb_info *sbi);
 #define stat_inc_meta_count(sbi, blkaddr)		do { } while (0)
 #define stat_inc_seg_type(sbi, curseg)			do { } while (0)
 #define stat_inc_block_count(sbi, curseg)		do { } while (0)
-#define stat_inc_inplace_blocks(sbi)			do { } while (0)
+#define stat_add_inplace_blocks(sbi, count, direct_io)		do { } while (0)
 #define stat_inc_seg_count(sbi, type, gc_type)		do { } while (0)
 #define stat_inc_tot_blk_count(si, blks)		do { } while (0)
 #define stat_inc_data_blk_count(sbi, blks, gc_type)	do { } while (0)
diff --git a/fs/f2fs/segment.c b/fs/f2fs/segment.c
index ded744e880d0..c542c4b687ca 100644
--- a/fs/f2fs/segment.c
+++ b/fs/f2fs/segment.c
@@ -3611,7 +3611,7 @@ int f2fs_inplace_write_data(struct f2fs_io_info *fio)
 		goto drop_bio;
 	}
 
-	stat_inc_inplace_blocks(fio->sbi, false);
+	stat_add_inplace_blocks(sbi, 1, false);
 
 	if (fio->bio && !(SM_I(sbi)->ipu_policy & (1 << F2FS_IPU_NOCACHE)))
 		err = f2fs_merge_page_bio(fio);
-- 
2.32.0



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
