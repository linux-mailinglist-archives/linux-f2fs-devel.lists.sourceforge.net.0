Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 75E0569E298
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 21 Feb 2023 15:46:28 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1pUTuP-0001kh-CC;
	Tue, 21 Feb 2023 14:46:20 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <frank.li@vivo.com>) id 1pUTuM-0001kZ-T0
 for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 21 Feb 2023 14:46:18 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=MIME-Version:Content-Type:Content-Transfer-Encoding
 :Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=6CAgJ0RCr7zliEbWYAvawyfjQijB5EsAOpDsyPVGK80=; b=MTeP9u+8ytq8pelJGzamynLBI7
 SyDK5arSPRVLF6s6ia1elaAYUmKPaYuIcNUciPq4sdeOBC0YLcH+xmuIqcjaVfEq3wShK2UuRIKvN
 I4jPH1zPOK41kKx3Rda3FByd0gN1SdLXpTZ/XHHiYrmYqgybY0N52aMM1v5oMcfOhlJY=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:Date:
 Subject:Cc:To:From:Sender:Reply-To:Content-ID:Content-Description:Resent-Date
 :Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=6CAgJ0RCr7zliEbWYAvawyfjQijB5EsAOpDsyPVGK80=; b=T
 DBSPRTYtl9EkVGb/4UiLslLHnhZByc78ddZSbiFYyRdAG4Kpj3gdoBv3hofQSlzA5OlmSsrauD2ef
 kEVBWwIbAFFewWhiaGrK0iNEIs5pZZvj93MNCLdFOgjlLqAV+IgGWwsaidSSa+DS1TFSbERvUlFEP
 C+fL2shp6kOvX0jM=;
Received: from mail-tyzapc01on2109.outbound.protection.outlook.com
 ([40.107.117.109] helo=APC01-TYZ-obe.outbound.protection.outlook.com)
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1pUTuD-00CX2r-LS for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 21 Feb 2023 14:46:18 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=hbkfXl917kkeGCgqfXguj3tsXPZfz9YyWnYpHKz3Y8IFAfBec4CSg2+uWJb4Xru1xuVTPqU5owpMJ2mSOjAcVz8xp1ulnlpKIFxO7aLHpDvjJ+f7tqqnRp5K5vuPtOuvl6iXbxLQkA+Sr4Tpz6CFmPMbFF7Du07iVdLpCrssQLt4xTnDqdVnGv4XUo4AiSaMgg+6AlJLXLAqFJKtErTRs7Cx5zXO9wSvac04SsJgAbTNQwDjf9xc9vPviEuQEU9jxUQ+4w4BY9CJ96/iFPHT5Cdicx14g2iTU5FXDt4183owVCh68YhtAFA1AmuwDhd3wE0UWIxC/nGU7HId6YFZRQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6CAgJ0RCr7zliEbWYAvawyfjQijB5EsAOpDsyPVGK80=;
 b=gH57L/b8rFOj3rutlxOjBI1/uZyIKkVxBe/xXN8Vf941ihHH4dnekkEVXxs2ENBbmCPbIebTU4ZBhI49JNFaLA3fE88VaEsfGr8ItaaEw4+IRMYjyRCASI5pbUtK4YuSnwOkGhN/lLVTiNhNrlhm8huJdBUXi/oBGcNB7DwdMNqjWTe2Do0gRdhiX0w5TJehNIVtOhL2am7IUTdQbk9Hb4CCWpDk6e896caFi4JQllMGDqj8WQ2I5OB5Sl5VA7jhfFJ0QekHN/V4IvVePXAQBV2nTwgIlO8ocWZ9SYjUVZ1X5XGSLthn4GAeQESFCkW0buIPxe0q/n3VxD/c9jyJOQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vivo.com; dmarc=pass action=none header.from=vivo.com;
 dkim=pass header.d=vivo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vivo.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6CAgJ0RCr7zliEbWYAvawyfjQijB5EsAOpDsyPVGK80=;
 b=nlj61ufm0QFSRaj17FiTR8SpnVUKTktLZFoBcAH+YxcenE+d/df68sQS0Y9V+bcCMpOxAt5NxYy5YhlylKqVRCANfxBucpD6anUD8wvGVnoS18GfwGMhF08Dv/AB+YvAma3ShCOK947NmhhzDMbu6K7woXpfDE8/c9TAWtXaaQFaHG102bJcPeuLY7+m3CqFqsasHCN75NU9a5MnQdKKE93lewR2du0UkQ6+EGjjmzWp1yWYTGwBcEH90Wjm6jZljbZVxHZTB/rrGSDNtyVtiobVaiye6OLyeO19Z0J+Dt0ejCGpkvtj3nwxaQkt2fItAcj0n3I0MsKeuVAGl1p6ZQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=vivo.com;
Received: from SEZPR06MB5269.apcprd06.prod.outlook.com (2603:1096:101:78::6)
 by TY0PR06MB5848.apcprd06.prod.outlook.com (2603:1096:400:275::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6134.15; Tue, 21 Feb
 2023 14:46:01 +0000
Received: from SEZPR06MB5269.apcprd06.prod.outlook.com
 ([fe80::daf6:5ebb:a93f:1869]) by SEZPR06MB5269.apcprd06.prod.outlook.com
 ([fe80::daf6:5ebb:a93f:1869%9]) with mapi id 15.20.6111.010; Tue, 21 Feb 2023
 14:46:01 +0000
To: jaegeuk@kernel.org,
	chao@kernel.org
Date: Tue, 21 Feb 2023 22:45:50 +0800
Message-Id: <20230221144550.46557-1-frank.li@vivo.com>
X-Mailer: git-send-email 2.35.1
X-ClientProxiedBy: SI2PR04CA0001.apcprd04.prod.outlook.com
 (2603:1096:4:197::12) To SEZPR06MB5269.apcprd06.prod.outlook.com
 (2603:1096:101:78::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SEZPR06MB5269:EE_|TY0PR06MB5848:EE_
X-MS-Office365-Filtering-Correlation-Id: c8e9ae1a-a28f-4710-eddc-08db141a5996
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: qQnvZhhwEcgdHMpHd8A6IafIGSltIqmdiRVCmUEMPSV6BOIj/XYOOoMjK5P7cWBlcm4Wiy1N31wLdVe8PWn+UausNY0ghH926uyJrRdzErFR6ZQBWZt7Mdae9Fo7uHFCEcO6yrEY8qSA1kfqizkaTtdgMvbj/Vqh7ghpkfvydnrgwRpD9Empu5flbZ1EikmEWgqrkou6YrxjcdFVv6q+AqNcXBO6iQPSbtuGz+B1Yvm5hFfQ4LskVufJVc6abQrnHNKRME8OgUno46F2ukQ6Eo+4SNTeII6qPOHaNBXRo9IaAWWMwHFKt03sfLJhEjpaLW2+r+q45OEpO7D62TKldFXoaZPG/KYtwb3f5b5CvdDegfRAkpkGa34BMuf9on2QCzRDayDtS8qpkhweKNN4RUZFgpHNFchz6+npP1DsGqfnhRPAovujDJ0pv3uonkh4yA9eWzLIwSutxLLzfuDCpIYso0dhla8TkR9XcReNgUYEmapGaCxoZ0WPmnNP67mHPyxxavN2QvrqIdX7gfajLRpwDbyAtkPvOzRIE8+OyoDajLGYiEtM2G0aPlE3FKDeG7vSqD4sux9uKRsHR1OTcu7ts5xelZUKQw6YmLLbCz4P2HSCq3/GA/c+pG/RIvuha+o/5C/STlgcfDGQPpDsdAQih8T6XU+oJiwDleUo0dbQ/sUNjrCjK8R1pD4zmoh0APg/+2+ohfwilHCzGpKhfA==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SEZPR06MB5269.apcprd06.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230025)(4636009)(366004)(346002)(39860400002)(396003)(136003)(376002)(451199018)(4326008)(52116002)(66556008)(66476007)(6486002)(316002)(41300700001)(66946007)(8936002)(5660300002)(36756003)(86362001)(478600001)(186003)(26005)(6666004)(38100700002)(107886003)(1076003)(6512007)(6506007)(38350700002)(8676002)(2616005)(2906002)(83380400001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?Q1N1oF2CtSd8oWurM/VVV/ojPVdtEbqmIW3pJ2j8y/kF5TsoqaMARImMDF0R?=
 =?us-ascii?Q?HLiVJB2J+ZaNN2FJORI7AnTP0lc5O8fZuE03UMKh5HifynAeZgl9vvDghGii?=
 =?us-ascii?Q?kXD/cFZJUbP8rz06+ybpwRtZRj9rKMYmwcXkgf0cHE/l5VWlt5+QXII8Comq?=
 =?us-ascii?Q?YC9wKbhr3hbXh8FpiniZ4dkDLMVtTnPE55KeQl/92E8D+6bQ/GESE+ceR1DF?=
 =?us-ascii?Q?l4hGofxBGMObEMlriQgNhWxvaSe+MOhGAWpfmcsGAOh/+Ku1eQ5p1ayiFlBI?=
 =?us-ascii?Q?PcUek5HAANm0DJKg9fwj+pDXx0ZI9l2+eGVCOAtkc/CFGPGHijC15+G3MGRF?=
 =?us-ascii?Q?sRaE5dnAXnlracMMAvFcKP2R8/Fh98Lj3L1KIQhBa5G+gwt7qK7kxKDoDWLl?=
 =?us-ascii?Q?b0JmGE4UbdcgOQnZsbveP7qXKItkH1cIOGYpoVT2RCIZykzMwMnsva+JE/J9?=
 =?us-ascii?Q?r126UlratG3g9WuVp2RbF9J/neajPqVMI8vD65eJVAf8eB2b7Nqbj/w1PLzZ?=
 =?us-ascii?Q?+4TTGGRBuVem9M4HG31x22lHNM2BRvSec9O5+Msq0gFoIwQIOFopBCIhtzt/?=
 =?us-ascii?Q?+zNuCx6xE5gxB0b8F1pvHke/qERgoej4csH85CeNZsvCQqTMrv1RqozH2cRD?=
 =?us-ascii?Q?iGbU04RtvLzUq2suax+mQbxpfnToPeUTppqwsOtpG1H9HLUqhMYDntXv/EDq?=
 =?us-ascii?Q?Xvz+sjyLQ63QE2d6oniG1bArlKrAtkTMnhDlvn/1MF0CBBfd5C7GnYo7dLGS?=
 =?us-ascii?Q?equP7rpbCp+mtOiV60vqtvXnohJBcna/TRqd39da2B7bP5Y/X+CpFKdjHvaY?=
 =?us-ascii?Q?70Apphp18RA/c7H0fb/eA2CnAwxqVi5SN/cfrSzuAn6FCdhdXGI8RA5sjdOE?=
 =?us-ascii?Q?oTRKW/efd5e8pxcTZVlU5I2xNIIN/vwbSYuolcjT6p0w5UhQpPWfP7Z5/j4z?=
 =?us-ascii?Q?dnwcR+UMPDHsZ9HodAdUIUXIYd9B++uLQzfmbf38dAe6E9lMfLxr0scvpWFK?=
 =?us-ascii?Q?Qpoa2J5LKbWoVjAeKYqtL8pMyYco1trmqMW67ZbJ+nNlA1AJSi45fX6SaBkT?=
 =?us-ascii?Q?bho5TV8mMEEBwcMBoWQlt2C9tDXd2ppkKxOawxz0P+vNAgUhglOB+N++kMWb?=
 =?us-ascii?Q?4Sd8tXmseQmaoRDBPRzagEULvBNZeCXL3FTUheJlqBxHhT1CQtZimEYCYC+R?=
 =?us-ascii?Q?/OZQTw2BtykXn5WcFyd0Kt/EjRlWwwlqNuuLcKNccTooUgBBePNbF8p6gQ8E?=
 =?us-ascii?Q?ArK9hrQDz0ek7YJpN3bnwRJxg+DXA1zvuNO3TQSerWXL7gwXG8oWcaZC8KOF?=
 =?us-ascii?Q?r48emKQ3Kn3rfSCyUsuZfpD8id7+yit6HL1lDFHZTTK1vpVfkZnHKy0M6yA8?=
 =?us-ascii?Q?/6CS9xlRTxfdsW1gGHcqb61CnBGhne/d2l3Mmm2BgCSqdxd608bfhjYnvits?=
 =?us-ascii?Q?r1yrdS+IcTpx673WLfhLoluKVmzIuutxbG1qgKcTcuOnU0S1tV0rAmngmWrV?=
 =?us-ascii?Q?VS4UJr5VM2ldldR4iOr6rvoMiCpjpkvJbPPJBrA5eXq6UlxaVVk6LsMFfuAE?=
 =?us-ascii?Q?TLr9P2iiWaYTWgYnXcQaNc0ryK/WCqX7uJd5xq2K?=
X-OriginatorOrg: vivo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c8e9ae1a-a28f-4710-eddc-08db141a5996
X-MS-Exchange-CrossTenant-AuthSource: SEZPR06MB5269.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Feb 2023 14:46:01.0481 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 923e42dc-48d5-4cbe-b582-1a797a6412ed
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 1+aFgqDrvDxBP8xCs3O98HmTz4CkeOppQ2yvNaaPub+Mrbxkl6z0aQ0Yve28+pg6fyoVydbpL+rqeEiHdRoQbg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY0PR06MB5848
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: We should set the error code when dqget() failed. Fixes:
 2c1d03056991 ("f2fs: support F2FS_IOC_FS{GET,
 SET}XATTR") Signed-off-by: Yangtao Li <frank.li@vivo.com>
 --- fs/f2fs/file.c | 15 ++++++++------- 1 file changed, 8 insertions(+),
 7 deletions(-) 
 Content analysis details:   (-0.2 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [40.107.117.109 listed in wl.mailspike.net]
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
 no trust [40.107.117.109 listed in list.dnswl.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.0 SPF_HELO_PASS          SPF: HELO matches SPF record
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
X-Headers-End: 1pUTuD-00CX2r-LS
Subject: [f2fs-dev] [PATCH] f2fs: handle dqget error in
 f2fs_transfer_project_quota()
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

We should set the error code when dqget() failed.

Fixes: 2c1d03056991 ("f2fs: support F2FS_IOC_FS{GET,SET}XATTR")
Signed-off-by: Yangtao Li <frank.li@vivo.com>
---
 fs/f2fs/file.c | 15 ++++++++-------
 1 file changed, 8 insertions(+), 7 deletions(-)

diff --git a/fs/f2fs/file.c b/fs/f2fs/file.c
index ca1720fc1187..f25e58680984 100644
--- a/fs/f2fs/file.c
+++ b/fs/f2fs/file.c
@@ -3009,15 +3009,16 @@ int f2fs_transfer_project_quota(struct inode *inode, kprojid_t kprojid)
 	struct dquot *transfer_to[MAXQUOTAS] = {};
 	struct f2fs_sb_info *sbi = F2FS_I_SB(inode);
 	struct super_block *sb = sbi->sb;
-	int err = 0;
+	int err;
 
 	transfer_to[PRJQUOTA] = dqget(sb, make_kqid_projid(kprojid));
-	if (!IS_ERR(transfer_to[PRJQUOTA])) {
-		err = __dquot_transfer(inode, transfer_to);
-		if (err)
-			set_sbi_flag(sbi, SBI_QUOTA_NEED_REPAIR);
-		dqput(transfer_to[PRJQUOTA]);
-	}
+	if (IS_ERR(transfer_to[PRJQUOTA]))
+		return PTR_ERR(transfer_to[PRJQUOTA]);
+
+	err = __dquot_transfer(inode, transfer_to);
+	if (err)
+		set_sbi_flag(sbi, SBI_QUOTA_NEED_REPAIR);
+	dqput(transfer_to[PRJQUOTA]);
 	return err;
 }
 
-- 
2.25.1



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
