Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 3292B6C2043
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 20 Mar 2023 19:48:01 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1peKY1-00025R-Lg;
	Mon, 20 Mar 2023 18:47:58 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <frank.li@vivo.com>) id 1peKY0-00025J-7n
 for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 20 Mar 2023 18:47:57 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=MIME-Version:Content-Type:Content-Transfer-Encoding
 :Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=sX4N8DgWgxcksV62oYRh79eSYh7nL6ePu6WISP6rzL0=; b=cN+5rX/0E9pjoG+4lWVpdvUfvQ
 OEfpR6FWS1Ll8OBMvdpzKxhU//5JOvBd3LjvFDsTx5GckpNFhSWshlU7GVzJGr8aVQs055FADpfPW
 NaZhReXa9SKo7WHd1QDu7xNvqalKaAhJkgLNjvUSvc/laWikK8SLJHXmtzoCCJT6aEE8=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:Date:
 Subject:Cc:To:From:Sender:Reply-To:Content-ID:Content-Description:Resent-Date
 :Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=sX4N8DgWgxcksV62oYRh79eSYh7nL6ePu6WISP6rzL0=; b=P
 sSODrIiLlDB/9ZKg8KQKWh5QZPWYq0sxZ5IgTpw32q18LBotPdBxKEthqUjCHHddkY76G9H3gLHhC
 A1CIW5hmdnjRA6aTfLrXCvlxSl5H4Ng1hvV8vJhkX3YVE9BQwygo7bqmXe+waes832lzY4TJ5aJD/
 76zDjDpvz6T51H1g=;
Received: from mail-psaapc01on2107.outbound.protection.outlook.com
 ([40.107.255.107] helo=APC01-PSA-obe.outbound.protection.outlook.com)
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1peKXy-0002FN-Hy for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 20 Mar 2023 18:47:55 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=bw9RQJbCcrL8A2VIpLhdRjEaRg5qr2LePu7/l46bvJ7GaFxWto5Xb9aH6z75uawnwwpBnJ7568N9qn+DBorSPsz26vb5bFLc6Ucd3eaWddjpHC6R/UZ3arTzxfShSVRRDm49PyHoHVVmHUa3eFt2Kp6jusj+jpCxQi0uNaLdDf167I5Gnc5SwbjTQcqCpAbzXaqFDeqNDGGctfL8YI2rwzNOupNniNd4g1JicKa7g/My1k5cnem8+1v94QDZZ/6/8mjHIpQhiCJtnBUQDA7GgFm6WRHdOcydNQBFUFdW8o3IS8eGjax6pcnL3yvzjKNlqpMK2zJF2R+XoXBcGFO7iw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=sX4N8DgWgxcksV62oYRh79eSYh7nL6ePu6WISP6rzL0=;
 b=nPLV0YsYO+vuB7QlG39hjqIzpihr/KrpMeM/S3cU5U16NRoDjNL/7Vf6MRWtcyb1zzNyQyzcOaBz5MPNXwT2vyffS0F0vIaZ22MN6DJ24pOGJsxsipC2zv+iTmUXu+3tkN+BXY/Ze2pqZK8+L1TrslIPqURX3pdZLrwb/IuWRWQ3et8hR034WcDladPEtSot6Y5HB8Ffjzq+I56i+f68dsgVMXts9foLTmbAdprIlomNWfS1MI0ufN11mtnYLCmYKWxqYZDAQuk93q55cPqgak0uNKFn19xZH1Cq0LxcfEDG/WrBCU+f2v+xitxiQkwjpPYcXyf8fWzpC1feCWEv4w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vivo.com; dmarc=pass action=none header.from=vivo.com;
 dkim=pass header.d=vivo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vivo.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=sX4N8DgWgxcksV62oYRh79eSYh7nL6ePu6WISP6rzL0=;
 b=Htc4RuG5f6btDTujdEYvIPBJrbBW/ySupVG3WJk3jkYoQNiWRbuSeCzGpfjals9gpcEUS//N7EnnzLh97XlZFuZ09dRljDpLRSiMp37ayZ1IjhzIJrxEbuZlQwHqR+nvPJTu7+TwTcW+oleTetdrExGtAUU+hVOTkUhb+4NK1w6AlEHPwuf0kLE5ZYbypwYXmMXsth6MHFHjxrF+bi2AeYN9KGNqCV0Ip/MM6ZepvLkmckrPL+C9LR6eAk/qAXL8RnvjOW5gyjB3Fk7Vh6qaCEwlsReaxKT02hgnlMjsy7g7LLAfjEWOf05+EJNsaBhY1+DOmLEORdRXjslZQkdhKA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=vivo.com;
Received: from SEZPR06MB5269.apcprd06.prod.outlook.com (2603:1096:101:78::6)
 by SI2PR06MB4121.apcprd06.prod.outlook.com (2603:1096:4:fe::9) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6178.37; Mon, 20 Mar 2023 18:47:46 +0000
Received: from SEZPR06MB5269.apcprd06.prod.outlook.com
 ([fe80::daf6:5ebb:a93f:1869]) by SEZPR06MB5269.apcprd06.prod.outlook.com
 ([fe80::daf6:5ebb:a93f:1869%9]) with mapi id 15.20.6178.037; Mon, 20 Mar 2023
 18:47:46 +0000
To: Jaegeuk Kim <jaegeuk@kernel.org>,
	Chao Yu <chao@kernel.org>
Date: Tue, 21 Mar 2023 02:47:21 +0800
Message-Id: <20230320184730.56475-1-frank.li@vivo.com>
X-Mailer: git-send-email 2.35.1
X-ClientProxiedBy: SG2PR06CA0215.apcprd06.prod.outlook.com
 (2603:1096:4:68::23) To SEZPR06MB5269.apcprd06.prod.outlook.com
 (2603:1096:101:78::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SEZPR06MB5269:EE_|SI2PR06MB4121:EE_
X-MS-Office365-Filtering-Correlation-Id: feda5d6a-c008-4f4c-0b8b-08db29739856
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: IjsTnVmEtYu9pWz8JA0OgzjJw10X0FlLZsRogOTOfpO1NhsoG5ipgeciQIhrc5S/dom8l1G54hHLZMvRfv37/mSeSKd2QPW5IJpfnhX0UPk4yoqTUCTrIh+L+slGCIVVgu8G0QE5rzHVtZ5t6EVUciQ8sklImjMqvgmHn5I4sXjRaiVOATzIiMV+GAWEd66rAyCZHmJdeQ6Yn+XrLNW8tRs9E8LrJ3vbJSvrtSaMJ+7UJd9IFAb9z8TgM5zlv65s762wOfhsjeva05TrU6HXYFwwho3g94EfiZ1rb2SZ/0CUjKTNS0qHyEGO20wVltLzL7dJ4NIuR6RVrQPYxSEbvnwcAnpdGLSOpjOZMB7qPcdjWL4EH+zLyao/ixNq1+CDZyELaeTiGIJZ2VlK6YGx4+2hszx77eEgsFYrIvIiB4cAh2ebNvhqXKrDC9ofpvRl8UTYDV/bBxZuUIhx7g7JGK8eh9ja6zzRkJ09aCw1ISajZD7++7b6zmqj17PqPO4t6GU8+Mu16aAvM7JEESdEpcyh8FDiG6K+cAY6ymCKQXZfsc7SfQ4Mjuvm/xbEOlo3mtCynV+HQvLcL+bdfu4FRpAQpIrcfuhsrHUxSXwVKz8iAOBX+5bKrkqam9Usui5hPrIUPSZQn8KE4jVLAteOS6uqxMLnUKRjuWG3VI/H7wj3sWz4dmYoX7SFrOSkeQUbTpg4bcu6fYbi263ORhevpw==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SEZPR06MB5269.apcprd06.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230025)(4636009)(376002)(136003)(396003)(39860400002)(366004)(346002)(451199018)(86362001)(36756003)(52116002)(316002)(4326008)(83380400001)(66946007)(478600001)(66556008)(110136005)(54906003)(8676002)(186003)(66476007)(6486002)(26005)(6506007)(6512007)(2616005)(6666004)(1076003)(38350700002)(38100700002)(5660300002)(8936002)(41300700001)(2906002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?e9jh+SgG9exosHxb7pcsbKogVUwx2hGcwMYXYGwQyF1ZfB1UPKywmixJdiE4?=
 =?us-ascii?Q?UFWZxLJhkFv6+iAZEgxPwJ1gkqqz+HF47scmVv7UZK89m6CItbQP97wT3jEi?=
 =?us-ascii?Q?mZnavFHFjK2/bJb2ZKdoF9xVrx5XzuGRpYAQkNPzmNDMlNnGAy9AoBonzvOY?=
 =?us-ascii?Q?uB6fc8QFXq9pACR2NF+BzXL5xbqcgv93WVHr8atJG7IZF6VT7Ihx1YbJyBMG?=
 =?us-ascii?Q?+BkN6eTqoA2hMtdTcbVTZWmBwURyLXr85e1FHcAdke54bK4W7Xof1MVUINmv?=
 =?us-ascii?Q?MlGlx9POmooXe98AHReClHkRBl7w3/MrW53SVH4ydMV1YvG/Tw7d6Gu3WvQf?=
 =?us-ascii?Q?AmHs1GWnkzJJi1M/SwVTGEGedOhqrBckPtHhbIdcjFJixfguPZCRp+FYZn/O?=
 =?us-ascii?Q?gxAUIiFQO8eFb4wJpFEFJmTQO/xLuNoEKv3x+07EDAvQcwaRwZDNSOWqzbvm?=
 =?us-ascii?Q?e9+oxogd4OJ7+VLjnPpDduRajgyAM84cF0i+4qm3oykBtBErE80PTkYpEKQP?=
 =?us-ascii?Q?PZcR/FaIbrKZm8soMnuO7xav8TRpCbTRwa12dcTKazRkwXLcjKLVvCUhFeZE?=
 =?us-ascii?Q?tYGHSBXwpyqha/1jf8rYTurkTYS9cUdAdn4S0l3x5fjNH9+yAGfmZbSlWA7h?=
 =?us-ascii?Q?Wsw7qEgXqF2fLxyAE6WaSm0cSD2YAQRfQnWPDVhTNomQqX50b8z4bhAOFPMC?=
 =?us-ascii?Q?NETRsA9FATBlaoFhUwRSNsep90pOXD7IFNscZ60fhzwSs45d3kSMvyQo0NMH?=
 =?us-ascii?Q?BjnZgGHb1C3aawzPha66XBakvPbIIkvtk7jZkv2iTyY0Xvux2y4LchfmbAgn?=
 =?us-ascii?Q?9mpeqInCijn1akSxq1IhxDALOShfu5IJjg/8EgcuBThDiiwzTvSh0IpVkaEZ?=
 =?us-ascii?Q?4lM9x3mhkMjzZPGbZRlsiYhakCEQ691stsTIdrvSfOXnS1CkmHOuqs4on1In?=
 =?us-ascii?Q?dYQ5zN13uSPZF/jI51whzQxM5Eq4iT85aEn4w7eEHT1rreMwxscTNROTL7sW?=
 =?us-ascii?Q?UIXX4IbWEk9XGoNW45RZvxlQ9qwM2AdhMcRIJZ43tZKimj0B6UqlKF3Bodd8?=
 =?us-ascii?Q?SP4UpD/qd9CnsPWxAqougE2hPLH6/t0j0vJNrRW/aubuW+1NSKQtdqyw27LX?=
 =?us-ascii?Q?v05qF1JihDDirLCK3deq4J21OHdNXV//2RoDjApWTJJ2kX9t/EP6Ho/40/eh?=
 =?us-ascii?Q?IcQWwbBI0AEmMQG4NuLH+pNmb15RWaH451c724/eL9fnkEUc63kYdTOnY8X9?=
 =?us-ascii?Q?ITUGl/+/VlhJ7CbRJ5sKEG0ki+81VJGZEddRIDcenc1t9h7EyoB9ar/TYfo0?=
 =?us-ascii?Q?A95RWiWqba2PnPhqscB+ERi4qK+Pht25SdlEL6SGJ636qHu0t/9lU3EkmosC?=
 =?us-ascii?Q?i0ffNdlfXI3EdcOZfPWs+K0wyiPuoSK4YvxRoQ4uh4RArX5ivNe4ErlgM6ls?=
 =?us-ascii?Q?CHv0Y49Fhu7XPyTu7ECTFNMxLiJG6GQiMRZPxZ1BeBGz48wRiF5k8jgSGsvQ?=
 =?us-ascii?Q?mI2ZFfB/BFwqgwKvbVOxzk2qjMxqXpLPz+f1g4kf/2zwo8rCYAU/dZ2ktHz7?=
 =?us-ascii?Q?4PqeAR6xDVqHxEulKxGA+zIO941nYMLuDxGQTRBz?=
X-OriginatorOrg: vivo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: feda5d6a-c008-4f4c-0b8b-08db29739856
X-MS-Exchange-CrossTenant-AuthSource: SEZPR06MB5269.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Mar 2023 18:47:45.8842 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 923e42dc-48d5-4cbe-b582-1a797a6412ed
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: +FGC51j7KVLLFcNxOoe3ciV7Di2ri5lcCQqycldo3uXBpNOeD1akGplzyvJuPVUwBmY1cr3Hs8a/7dMVWbh4mg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SI2PR06MB4121
X-Spam-Score: 1.1 (+)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: Use kobject_del_and_put() to simplify code. Cc: Greg
 Kroah-Hartman
 <gregkh@linuxfoundation.org> Cc: "Rafael J. Wysocki" <rafael@kernel.org>
 Cc: Damien Le Moal <damien.lemoal@opensource.wdc.com> Signed-off-by: Yangtao
 Li <frank.li@vivo.com> --- [...] 
 Content analysis details:   (1.1 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 1.3 RCVD_IN_VALIDITY_RPBL  RBL: Relay in Validity RPBL,
 https://senderscore.org/blocklistlookup/
 [40.107.255.107 listed in bl.score.senderscore.com]
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
 no trust [40.107.255.107 listed in list.dnswl.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.0 SPF_HELO_PASS          SPF: HELO matches SPF record
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [40.107.255.107 listed in wl.mailspike.net]
X-Headers-End: 1peKXy-0002FN-Hy
Subject: [f2fs-dev] [RESEND,
 PATCH v2 02/10] f2fs: convert to kobject_del_and_put()
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
Cc: "Rafael J. Wysocki" <rafael@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Damien Le Moal <damien.lemoal@opensource.wdc.com>,
 Yangtao Li <frank.li@vivo.com>, linux-kernel@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

Use kobject_del_and_put() to simplify code.

Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: "Rafael J. Wysocki" <rafael@kernel.org>
Cc: Damien Le Moal <damien.lemoal@opensource.wdc.com>
Signed-off-by: Yangtao Li <frank.li@vivo.com>
---
 fs/f2fs/sysfs.c | 9 +++------
 1 file changed, 3 insertions(+), 6 deletions(-)

diff --git a/fs/f2fs/sysfs.c b/fs/f2fs/sysfs.c
index 9ddc6ee19433..b455afc12cfc 100644
--- a/fs/f2fs/sysfs.c
+++ b/fs/f2fs/sysfs.c
@@ -1478,14 +1478,11 @@ void f2fs_unregister_sysfs(struct f2fs_sb_info *sbi)
 		remove_proc_entry(sbi->sb->s_id, f2fs_proc_root);
 	}
 
-	kobject_del(&sbi->s_stat_kobj);
-	kobject_put(&sbi->s_stat_kobj);
+	kobject_del_and_put(&sbi->s_stat_kobj);
 	wait_for_completion(&sbi->s_stat_kobj_unregister);
-	kobject_del(&sbi->s_feature_list_kobj);
-	kobject_put(&sbi->s_feature_list_kobj);
+	kobject_del_and_put(&sbi->s_feature_list_kobj);
 	wait_for_completion(&sbi->s_feature_list_kobj_unregister);
 
-	kobject_del(&sbi->s_kobj);
-	kobject_put(&sbi->s_kobj);
+	kobject_del_and_put(&sbi->s_kobj);
 	wait_for_completion(&sbi->s_kobj_unregister);
 }
-- 
2.35.1



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
