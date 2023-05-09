Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 9952A6FC351
	for <lists+linux-f2fs-devel@lfdr.de>; Tue,  9 May 2023 11:57:37 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1pwK69-0006sK-G9;
	Tue, 09 May 2023 09:57:34 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <frank.li@vivo.com>) id 1pwK66-0006rj-2S
 for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 09 May 2023 09:57:31 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=MIME-Version:Content-Type:Content-Transfer-Encoding
 :References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=6luf1sDdpq7vm+r+VRwsJaFqPhL7j1YIsUOYdY43Kko=; b=GcsChyLJSnP0UoyBybFKNStVVs
 CpXaBIEj/CNjm55MLLZsK68eXYsr9UayMoKkRA9YYlcAXnzzo/0t5B+/kBOayL7P4nyJK4/6u7nwW
 es/kDHHtmAu9CyfR/P2Jt/QUkU0Cdcjgm03e1yF4MaKMHp6BEmAloVRclMEWiJsVKlIY=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=MIME-Version:Content-Type:Content-Transfer-Encoding:References:
 In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=6luf1sDdpq7vm+r+VRwsJaFqPhL7j1YIsUOYdY43Kko=; b=cu64S4kKF06JEcqrgzxJ7gy48V
 5QqUui0Q/ZLZmrsdKwlJSeqH5nCRD2k4DmEJ8Hr0emGzEhZH7QO1ybP2Qwc7MFBjRjVI2DB7afyTU
 bqEi38LloMQ0f2CurwGOsNpmSN+bOa2Ml8VA53uleWcIw7vcyLYt+cLoDee2XMZ50w10=;
Received: from mail-sgaapc01on2107.outbound.protection.outlook.com
 ([40.107.215.107] helo=APC01-SG2-obe.outbound.protection.outlook.com)
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1pwK66-0002HH-Ax for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 09 May 2023 09:57:30 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ID9mqbrjWdGhvYaHk9rcAxiM5TP5aKs8rHXyvCYIw/ofNdJ/OtFYpFW2WOwaQUscwRsPtIsVr8EGoc6KmpoHq7e8vAxJsQgyOxiDUruDd3MBjmR6zytoB8adWr1J6Mp1CI0p4+c9Ges+oANbgoyNL+Nl3KArsBVXaBV9LQP4kJFOg2y3gvXYfAvqvbEcYtUrNYTOPq8yyvoCDHKVmbrAtxEal8ZBn7c9q+VtIgJPaBp9hCy3fr2DnPjSvm3hcez3Ozwb+gP4JVZ978SH98VGdLzp8W8pS9kOybI4JjHB872wEI+a2sfZL0LjwOU9v+coER6DhwTmIo8BH6BS07SPpg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6luf1sDdpq7vm+r+VRwsJaFqPhL7j1YIsUOYdY43Kko=;
 b=ZJdJo6ZOVE0Nw5icSlifCXkl7iEF7m5BzeRK3i5Ve2HVXWMVtiu8S7uGoxSpO9yBSpYo+6PcZt1KfEOEYl6YdKwYMs4JLmVS5JJen4SaXssmBbiizhYD5yPRR7dVtKgvCUwXakEZ9chu4PK/2PJIJ7Pmhu4Hfp9rjq7+1Gov28J7kPP2XMGf37q1XR4pk2Yjf6e24JHpdENWR2L1hexZlZ2czm1JU8jUtvwLHmYiiFX13YY1WcEIY47E+6c/8ALcPRugLKOiIxezPCt9mhjk2v6ja1Te6z3tGgo4Hzgn7vMvEwQHRc1Ri3Qw/jAuZXQCE1XCJJfUJ38aSWGYgH6TPw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vivo.com; dmarc=pass action=none header.from=vivo.com;
 dkim=pass header.d=vivo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vivo.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6luf1sDdpq7vm+r+VRwsJaFqPhL7j1YIsUOYdY43Kko=;
 b=dzvELX6wEDZKlg4rpMjLsJStToyfe+Cp7KAFnzyNm8oRsIHWGfMKXfvAWnOFJAJVOQhVYrQlk9tVDRGfykwK3hvqqIDEi4FmDoDtF2ssMq3Ur0DX0z5Q7DSWU1oT+dv2zQjkPasJyKEHXu+67ZEqGcwaABMNCN3kogpbnfouVCHhqpV88TfoLgcB0tAZXvo/9elrMolC6DzgNi/1J3rLtIRhS/F2UfbZSYztZdXu3lkotdHzyNj/JXRgxsOEX8gm+sMuG5WmAFDx0hw1Rkh0mtJAqv5guzw87++T4JGHd6B/Xf3d7INrQsXYgQCP3U6e1q7oZ80muVfZSIjDG0oN8g==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=vivo.com;
Received: from SEZPR06MB5269.apcprd06.prod.outlook.com (2603:1096:101:78::6)
 by SEYPR06MB6130.apcprd06.prod.outlook.com (2603:1096:101:db::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6363.33; Tue, 9 May
 2023 09:57:20 +0000
Received: from SEZPR06MB5269.apcprd06.prod.outlook.com
 ([fe80::76d6:4828:7e80:2965]) by SEZPR06MB5269.apcprd06.prod.outlook.com
 ([fe80::76d6:4828:7e80:2965%3]) with mapi id 15.20.6363.033; Tue, 9 May 2023
 09:57:20 +0000
To: jaegeuk@kernel.org,
	chao@kernel.org
Date: Tue,  9 May 2023 17:57:04 +0800
Message-Id: <20230509095706.17844-2-frank.li@vivo.com>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20230509095706.17844-1-frank.li@vivo.com>
References: <20230509095706.17844-1-frank.li@vivo.com>
X-ClientProxiedBy: SI2PR04CA0017.apcprd04.prod.outlook.com
 (2603:1096:4:197::15) To SEZPR06MB5269.apcprd06.prod.outlook.com
 (2603:1096:101:78::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SEZPR06MB5269:EE_|SEYPR06MB6130:EE_
X-MS-Office365-Filtering-Correlation-Id: 97c37b63-ab5f-4a0d-c806-08db5073c781
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 6l99tE5w3DDX9R3o0uriggDGr7khTXWrjryU48YwNGEi6pHmk6MjLns+A0K57Q7aWLjV1FBN91ESJgxPwGUOyzAi5itCf4SF4U+bXgcjAK5VETxMCtw+8eFs8LTHz4VSvQlxLBfqfsafr55VI+k+2PurARZe7h66LWfqqphWuAu7IXNKksWAjNhR86xwygB4cs01PIeoKc2zdLjVi6K4iRKjT93O+exsddiPwKVqxrGm9IhSq9XQcTdA7zmxmUSuASYHdb0WyQ0rsuNtu+tyvZRAYU8Ry0wYqhtMHpZnFovUQ6fPdpK9nh1hywyUhQ5thcO1trBeu3xt6CKLwqjfmZK/AqYic4OszEmmpueCEF7hDIUMDU1tDB2kOMok5u+IviXR7XpZfwrDJiC7QB5VBnddBKOTeOveLdB0SpI5lpTJ4aTeyTHADvdpp8sMo1VK3jrz/Q2aAx5Z4rMCbkQWSJB0pjsamuENRN4ES25Wbnfk1SP1FHYswc9iHQOouok0vPjLQ3pZZhHaMdQWbmkQACd4qOTMMDONr2FiIN/1T9F495F9SBpjHnbcWmxRuOA4mujDlNmwahV4ZwoNF4iJBY34IGOI8mgXRZ6QJxm+n6OYSB2wfACq9CoYwXMVLWJD
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SEZPR06MB5269.apcprd06.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(4636009)(396003)(346002)(39860400002)(136003)(376002)(366004)(451199021)(6486002)(83380400001)(316002)(66946007)(66476007)(66556008)(4326008)(478600001)(6666004)(52116002)(2616005)(6506007)(6512007)(1076003)(26005)(107886003)(186003)(2906002)(86362001)(36756003)(41300700001)(5660300002)(8676002)(8936002)(38100700002)(38350700002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?n/15Gt9E5lmgjRW/p1l5QBAqVrRUMZBfY7E2Elo1lNkO0xYCqb+Ov6SAwRpe?=
 =?us-ascii?Q?U0a4VHcF80f9AiCBbN88HWHDat0f8h7DKsU7OobRnfbzSgN/QsJTxJzsvXpG?=
 =?us-ascii?Q?UOgZK0M8bSbM7xPk1c2UeNlIgwhYzIizIywjdJ9mzugLiLIPV5P6LFDj4OSk?=
 =?us-ascii?Q?WSROOw+O/FXq+TuOt48EuSIBnvCPZ2iaejXJK9uMl8E5jsRg4+t7UdKol0+7?=
 =?us-ascii?Q?hN2+yP7IfGuUIIdMuPbOswUr6q+oWo1N3LccF8trKZHNHyLSom2dKl5rIXaW?=
 =?us-ascii?Q?ZYnVYCUk4wJB0/nhgL9H1b5SOWr8XIxYdKGrbdS6VdihX/PCGrPzXq/yMh6y?=
 =?us-ascii?Q?YuJJs99F6XZBnXZmj8Z9pNS2OVjaG92HCvVYgvCiPBRVQ5fpTNrYZ1pdYAEF?=
 =?us-ascii?Q?DmgEb7P6FbLP2NkOK0s0aI6pK/QV2+L33RuRep7HaR+UNUBnHkEFYMrfGosv?=
 =?us-ascii?Q?PbN/pB7DwLEnH2TdzfH4SwzE/gM/QHjZljFdHBMZMIfWYBwr+B+27OlNEqk4?=
 =?us-ascii?Q?hzBEYLT7L9/GR4qAp7671wAEDTaxvWf07G8Lfn9cl5RJn8EcFB1wm8wxtdym?=
 =?us-ascii?Q?fHKrtuf1ryw/GHUIHNe2yoxs6zuKW4GF3NmShFaN7G0uN8nOadFFx6Sten5s?=
 =?us-ascii?Q?D9pBIaDaBjQ8hMhXfNBnofs/dbl/fLAEGlfkmQ4i3Zx0ewjXCwQDid5Xjbco?=
 =?us-ascii?Q?K+RhD/LHSRqJqCFuyr0x0Gqwwso6AnEff3c91fWkaXYjftwOCaLLG/y2DGkb?=
 =?us-ascii?Q?Tl/D/tCMji3VIy/lLeMfBsOo8LEv67+9zGDM4hli+tK5Egsgvfx3xdDzDb3H?=
 =?us-ascii?Q?o9sxttSjsl2sLLjKCxbBHdA1/fwVSrUBaMeT4TKNEw9sgirnzEgWGwbkCa1k?=
 =?us-ascii?Q?C3APZ4SQCfRGGF2bGZA8ooTFzm0doHgoHCBk3H2n0j/1TzifUanvGdbyqgxl?=
 =?us-ascii?Q?e4tTMWMibBij3a52XoPcVIxCobNeky/IL+DgOHNqvAxk3BTuvmf4JrvowXrv?=
 =?us-ascii?Q?JYJ2ZVkA+6TwoygKJ473UstzipEmlKDWB9w1UJLRA/JfFHtnl5eDLD5Wgtue?=
 =?us-ascii?Q?6oeLikcsHXR99B15Qn7rmItqYxYof327ygauI/WIkXoWswyvDHcUFDx5a9YT?=
 =?us-ascii?Q?nrNC5y6lO8wU9fQP9lg27Nvt341fvOHNMLVqsxh1buWDbAKTXofEsb0aD6Ma?=
 =?us-ascii?Q?iWwVKyXGJYU8sQ2upH5gXBCcxagnMnvRlVAGCNOVVqwddmrwa9LHUUqAhoyc?=
 =?us-ascii?Q?lFrSbocb7jLUYbk+RMHTDDFr/XSpRbCZ5AbPH3G7RvpgK5EeGPnujzYqDZd5?=
 =?us-ascii?Q?+MkZSIFoswCTrJ5N5egAqesMxhZ4VkyfR/X4Hn4EqrJPPZFbM1eQfpzkf12O?=
 =?us-ascii?Q?W+CvrHlRVT+SLBhgUKM4IphXb/0RG/9Fo8UWdnOYlH6wQ5LwzbjpsYgegbqA?=
 =?us-ascii?Q?UYt6uK2oj15mQLfXNbD5W+YXuzFTfIhUTCV+MpcdiiC6BK3AxHrn+W6oxDB+?=
 =?us-ascii?Q?nUTbtikYhesP3EXFxM7hHizH60FS+2gKic9gsnDFA0spUU5WxvaeAYR911yY?=
 =?us-ascii?Q?vh9g0Ct7Ohosz34xr4hHAvr622DVYLJKbjS7d4kc?=
X-OriginatorOrg: vivo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 97c37b63-ab5f-4a0d-c806-08db5073c781
X-MS-Exchange-CrossTenant-AuthSource: SEZPR06MB5269.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 May 2023 09:57:20.3153 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 923e42dc-48d5-4cbe-b582-1a797a6412ed
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: OuQiTvc/rfSNjWP4ofBTNSMcOsguGSk4W0+8GL2gzPs81gHEieU3+1gu5h+sGpeqGqjEhaHO0pRauaekR5ThwQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SEYPR06MB6130
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  For judging the inode flag state,
 the inode lock must be held.
 Fixes: 5fdb322ff2c2 ("f2fs: add F2FS_IOC_DECOMPRESS_FILE and
 F2FS_IOC_COMPRESS_FILE")
 Signed-off-by: Yangtao Li <frank.li@vivo.com> --- fs/f2fs/file.c | 16
 ++++++++++------ 1 file changed, 10 insertio [...] 
 Content analysis details:   (-0.2 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [40.107.215.107 listed in wl.mailspike.net]
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
 no trust [40.107.215.107 listed in list.dnswl.org]
 -0.0 SPF_HELO_PASS          SPF: HELO matches SPF record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
X-Headers-End: 1pwK66-0002HH-Ax
Subject: [f2fs-dev] [PATCH 2/4] f2fs: move the conditional statement to hold
 the inode lock in f2fs_ioc_decompress_file() and f2fs_ioc_compress_file()
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

Fixes: 5fdb322ff2c2 ("f2fs: add F2FS_IOC_DECOMPRESS_FILE and F2FS_IOC_COMPRESS_FILE")
Signed-off-by: Yangtao Li <frank.li@vivo.com>
---
 fs/f2fs/file.c | 16 ++++++++++------
 1 file changed, 10 insertions(+), 6 deletions(-)

diff --git a/fs/f2fs/file.c b/fs/f2fs/file.c
index 6f8936ec689c..a6180d4d94cb 100644
--- a/fs/f2fs/file.c
+++ b/fs/f2fs/file.c
@@ -4043,14 +4043,16 @@ static int f2fs_ioc_decompress_file(struct file *filp)
 	if (!(filp->f_mode & FMODE_WRITE))
 		return -EBADF;
 
-	if (!f2fs_compressed_file(inode))
-		return -EINVAL;
-
 	f2fs_balance_fs(sbi, true);
 
 	file_start_write(filp);
 	inode_lock(inode);
 
+	if (!f2fs_compressed_file(inode)) {
+		ret = -EINVAL;
+		goto out;
+	}
+
 	if (!f2fs_is_compress_backend_ready(inode)) {
 		ret = -EOPNOTSUPP;
 		goto out;
@@ -4118,14 +4120,16 @@ static int f2fs_ioc_compress_file(struct file *filp)
 	if (!(filp->f_mode & FMODE_WRITE))
 		return -EBADF;
 
-	if (!f2fs_compressed_file(inode))
-		return -EINVAL;
-
 	f2fs_balance_fs(sbi, true);
 
 	file_start_write(filp);
 	inode_lock(inode);
 
+	if (!f2fs_compressed_file(inode)) {
+		ret = -EINVAL;
+		goto out;
+	}
+
 	if (!f2fs_is_compress_backend_ready(inode)) {
 		ret = -EOPNOTSUPP;
 		goto out;
-- 
2.39.0



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
