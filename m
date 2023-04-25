Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 74B1B6EE609
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 25 Apr 2023 18:47:43 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1prLpK-0003u3-JL;
	Tue, 25 Apr 2023 16:47:39 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <frank.li@vivo.com>) id 1prLpI-0003tv-VY
 for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 25 Apr 2023 16:47:37 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=MIME-Version:Content-Type:Content-Transfer-Encoding
 :Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=fOEMYFpnUf1+8VTxWdcAC6BmtS5NSP2nCuDrMYfzKiU=; b=amn8Uf4H+HEZUpnBjBun6c8tyI
 s7tfmi6l720/C2YlCp3RNCJN5y6DLV0dx5ijtSEy1ND68aHqWWBVl/BeZ0jTvebkp6fkgrRQFqQQT
 fkyh/lTXTywwpAQuky0Nte3IsAj+uMdMAxjv5XoBIDD5hQhri3KVP/JpBBjzpTxMRZ6c=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:Date:
 Subject:Cc:To:From:Sender:Reply-To:Content-ID:Content-Description:Resent-Date
 :Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=fOEMYFpnUf1+8VTxWdcAC6BmtS5NSP2nCuDrMYfzKiU=; b=N
 Np4c3bTk/ANnib4kzFQZIE3PBJo+WekQii6CvLvQGxOd5XZ4nkv8wufBXwdQVWXAaBxwvdK0bV9Ww
 ++cRVZDHrFynZmnGyyS2t93po6o0u/eJonZ6kxPRwbNDECnY0VuLVYj1oVdiEhhjk4aW2vijF/49O
 DhtJwnmGMkJx7I4I=;
Received: from mail-psaapc01on2118.outbound.protection.outlook.com
 ([40.107.255.118] helo=APC01-PSA-obe.outbound.protection.outlook.com)
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1prLpG-001LBT-Kg for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 25 Apr 2023 16:47:37 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=MWRhC4Xi/gfMttPAoYCpCwIRRtIr8wls16dbrOBCqGJCn/5dX8sWODJffQUAWnUv6s7UKd6Q0dMZeTIdlmyJX76cymDGD5R5BN53ZcyB/ChI7GI0tgjBVPDEnxWl51pnHtn1Wa87+uSyct/0Ob6scZvtz/CZZPfGHwxRWRh8LNaD7XWY6XzPqga2HgOw+VfjhRyLJ2ujGEvmuCo7uzxwhXPXOZ7mQy9oHsiLiuF+EBojAEs+Vw6joH7g9mmo1dYdYrjzg1iQFI6dc+3VobRKwoYQKVMSjm3nArlB5My6jPnERTuoxCtSJyE1br2C3g/sK3gW3jK3cR4mXVWOvgGylQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fOEMYFpnUf1+8VTxWdcAC6BmtS5NSP2nCuDrMYfzKiU=;
 b=QClBNZ6Q3XlA719Xwp+UhKObYNQLfpZ81MiB6huBLDfjvLV/QDWXTrzzFAgCRZgndrZc5OQczrMadtNcmGDlnx43Ewlk4atG6GkJpQlP+LpZ+GzOzntJV5Ss8QqYUjCt2HM9xUG9G+I+GKLK7BSccNtkpbcvQKfO+hJJ/PphSdCf0R5WumAs1+/UB6xiPSkVTw34IN4mAIFc/BMyyYFwh3ArQfa4mS15+CAiZ6fryNXMSPUz9iUw+a3uK6H9VoIjKG1pMvUzW8JrWUqI6i5wqkxC1VUb2tNqB+EDS6gKKxsU7QFaNUj6v5ub9Oaih6O594RxJ4NSzMSfTCRsxlLfxQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vivo.com; dmarc=pass action=none header.from=vivo.com;
 dkim=pass header.d=vivo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vivo.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fOEMYFpnUf1+8VTxWdcAC6BmtS5NSP2nCuDrMYfzKiU=;
 b=CcIfinkFJh6M1jrTwhzCuR1H9qn7/cUAkSzho9E2miSih7hwVaj4qGfFDT8XzkFKU6Efy4X8Cv6HG5RvRBRHEKIToKPcvAu6BxkHc1Y+zESHKg/hMN7Y25Sm8i3KkcEtM4mDecXyHBl1NYLdhGi4D0SboyruAo3a2tRdTNSMNBksyU2h6RihLIdUDsv/fNSuH4WRLzrqJLUr+dApoQDxpRSFqDAwPscM2JF1jZM+ednVGF0f3RG2RdnLjnB3VeLUjRGQRRG3Xd+KLwAh6OnSpdhplx4jZ+77klbvb3vjDRP+AaVn8CW+a6FlDVsOQbCJroAcvzr8kIp8pHKw90TSLA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=vivo.com;
Received: from SEZPR06MB5269.apcprd06.prod.outlook.com (2603:1096:101:78::6)
 by SEZPR06MB5522.apcprd06.prod.outlook.com (2603:1096:101:a6::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6319.32; Tue, 25 Apr
 2023 16:47:24 +0000
Received: from SEZPR06MB5269.apcprd06.prod.outlook.com
 ([fe80::76d6:4828:7e80:2965]) by SEZPR06MB5269.apcprd06.prod.outlook.com
 ([fe80::76d6:4828:7e80:2965%7]) with mapi id 15.20.6319.033; Tue, 25 Apr 2023
 16:47:24 +0000
To: Jaegeuk Kim <jaegeuk@kernel.org>, Chao Yu <chao@kernel.org>,
 Daeho Jeong <daehojeong@google.com>
Date: Wed, 26 Apr 2023 00:47:11 +0800
Message-Id: <20230425164711.19826-1-frank.li@vivo.com>
X-Mailer: git-send-email 2.39.0
X-ClientProxiedBy: SG2PR04CA0184.apcprd04.prod.outlook.com
 (2603:1096:4:14::22) To SEZPR06MB5269.apcprd06.prod.outlook.com
 (2603:1096:101:78::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SEZPR06MB5269:EE_|SEZPR06MB5522:EE_
X-MS-Office365-Filtering-Correlation-Id: 7d4a933a-0435-4eb7-d493-08db45acbeee
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: TLdg9D/6OK4+4QO2jKiucpan2N798vfnF8aJ3ZVq/DvOSidcL6HWnNXqvk4odJpv3yUNHf+FXwZrJ1d+55+wC+hFK3+YPu0I5DGOHy7FXeTMeTeAJYd6yyxhs2pWjLVpOyxUROz8XYfEKE5qt+azGg82nrT7cKFIlZnY55MQM6bZfaVg+LosdSF0gb78NYk+JmZgGcQHPqb3XqPD2avamrt2AqhdZLvBcuwWcsXwcEJICAHcmDSMabam6sDnay5JGflyIvpM5rc6cyCK7i3C/zjgwPYOBki78EXbZn/LcxGoTJlmoLFBIxPzXjqJLBklWe+d4k+W+aIZ6l+DFr+GUKaj+BkGCDJ0TODp23I1HJfPVus3B7JfOe4ChuiVzwzKAYvRbiEKGc8QQEs3eHXgyG18XGNO7Ol34n9YsOrlVaAt/7LcZAMW9kVtbKhi0fgItLz8HhSlWXv4gclBNhwfVgtMEPHDzq/OfJ8lJMheD9XKXaJCAnH0RXxEfPLM7Qz2Z+ywOdyRYrEwEk87sOKVZl+pCWdndF0RNBsCLSZ9hZZGuCobGnYJ7QEz73ospDq4jNkDYBjioSOChhaFH9RwATfJzRicknd+A/7mImsW34g=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SEZPR06MB5269.apcprd06.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(4636009)(366004)(39860400002)(136003)(346002)(396003)(376002)(451199021)(52116002)(4744005)(2906002)(6486002)(83380400001)(86362001)(36756003)(2616005)(8676002)(41300700001)(66946007)(66556008)(66476007)(478600001)(4326008)(6666004)(6512007)(26005)(1076003)(6506007)(186003)(8936002)(38350700002)(38100700002)(316002)(110136005)(5660300002)(54906003);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?lFjotm+2Ru7E6UfUrAw++kVH4ZRRiFNbBc/eQ2kiHLvYl74ls1yklMAU/HCh?=
 =?us-ascii?Q?Rr8B96yAB2uZdWjT8lmxFJLbQfsavXhfPoifL7V9DyPtDlQpWztvXCnCQOFF?=
 =?us-ascii?Q?XoOsqjqqIOlbJI5x0T8zqVBMxZmRrYY441rAzD4IilGklB0Yed/d0pnc9jFQ?=
 =?us-ascii?Q?EdaOvmOPzupvFoawXPs6x4gPzX/FZZvZKrLxO9gsXk4DRjWqP9ZNRsJM9y/6?=
 =?us-ascii?Q?1sUk/H3ki6s1qQSBusmbi67wIPQPP/oEp+Bnuqqd5/Jd2pmsRjFlE39qj3SI?=
 =?us-ascii?Q?SJBNEB7D67JZX5gjjGdUl5bS8YyZnKJtpYEdgyvEEammBf06CLnHTxoyxhS4?=
 =?us-ascii?Q?CPKs71pta6Zw0sG2uuRbhhf8TeX3bgx6a891gCv5486Y0gwAG83Rzh5VbmPi?=
 =?us-ascii?Q?yW4VoAW/U0KpaiDtbX7qQOezT+xqin/ZsFpKKRCwCu0sGUcS3C+iPpW0RTXT?=
 =?us-ascii?Q?CXsvNCaaPYrX7HycK1cnRarjhYh3j+n7pAjmkhr2OvJEqj8/aGJ5ARF14L9C?=
 =?us-ascii?Q?/t7QbnN6NMsWKkv73H9U38I+jd+1yT+s80T3kNN6uAZnFtmo9QRg1vQ3+arv?=
 =?us-ascii?Q?bw3azDiTb52aDP23OVawvIV9EfCEcc0lMloMXrbRIwp37hJZXOhepPtCV4+E?=
 =?us-ascii?Q?vQ6EHnSIhyhYyAgGXe1LYsPVrk8olZZq1qCR9Opkk6hv2UcfVq1dhvlRbDnL?=
 =?us-ascii?Q?Chetx18H1r90GvVz6TCLz3Sya2+tHj2YlniWdEQtP1tTrPFYds3gqtiSZirS?=
 =?us-ascii?Q?WtWaAlTe1BgObjJIkCV1wxP2KpeXXrtMVEEQ3jDOL76j5TTCwcugLm0t7dFD?=
 =?us-ascii?Q?vqIWI/UDOkxvpNdg5S1V1Da4fc3B7B2APqeh1R1UhBccSsQdUfhU1TbsQQyf?=
 =?us-ascii?Q?lwWRuHInaX7Qq1Ijg4+gfHjGV+P5RVIT79hXBszqIPPpJZFMiqMHhxLiyUTU?=
 =?us-ascii?Q?875StjODHXcUE3pinJ/izCOpZPDz1eQK2Mv8K1jVuU92sdUMm4znkaoKlFmA?=
 =?us-ascii?Q?v+zxSDra+RFNWrdVHsfwO+R24vbreJQIphBuCKWSbycGrdvoh62JV0+9qsfI?=
 =?us-ascii?Q?nLE4WyADssYwbuWKaD5o+KAi5a0+rYIbeITiuYlPdCeFCQfVJ0cytafWphxr?=
 =?us-ascii?Q?fY7Recre0NfeIBHDD8q+dy0DMu7NcEeDlMYgeDdesJR9TcOT44cg5Ev64jY9?=
 =?us-ascii?Q?sfLS1IijyuzdRvQQ/6VPIhEaAmEY19Bc6t2AM6fC/6CGIWjNH+OFxHUNnDWR?=
 =?us-ascii?Q?PlHpKUt25GqsCFyzJ0lU2QcgMcI6LlD3J29Wl1BtYmjIZGncZJ+dnCXrbjRH?=
 =?us-ascii?Q?B3oB5Qlf29i8IWdv4Ugu/EZrB92E8ZbtVSaSNnkUcN8eb3AdJhixL9Z8Ene4?=
 =?us-ascii?Q?Dytu0XIXbcR8zd1ykTfiXDqw2nEzl64RDDLTrK70zxxBm7iVjmGBLCROgTcL?=
 =?us-ascii?Q?E9wF99m8jJvm+Pt3KLlm5NzstGoDNoPrl8q/S5wjfraTJVSrFbVvVuKtzt35?=
 =?us-ascii?Q?I1CLt2eJIqvrxHjiyYF90jfru/u8Qai6FgUTMAPWWw80Hkvxgx8wSqxo1bRD?=
 =?us-ascii?Q?54wRQnTkGJUTcJp/jfQTrMaEzaZ5CKhM3InxAdra?=
X-OriginatorOrg: vivo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7d4a933a-0435-4eb7-d493-08db45acbeee
X-MS-Exchange-CrossTenant-AuthSource: SEZPR06MB5269.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Apr 2023 16:47:24.6175 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 923e42dc-48d5-4cbe-b582-1a797a6412ed
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: F4UR6Yut3mm83b1nmLujefW8dBERvxQv6bE4JvoiwuJZJU0TleTAHN09uANFfc581X6gKaH8eGQYf+7k36+/CA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SEZPR06MB5522
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  If a file has FI_COMPRESS_RELEASED, all writes for it should
 not be allowed. Fixes: 5fdb322ff2c2 ("f2fs: add F2FS_IOC_DECOMPRESS_FILE
 and F2FS_IOC_COMPRESS_FILE") Signed-off-by: Qi Han <hanqi@vivo.com>
 Signed-off-by:
 Yangtao Li <frank.li@vivo.com> --- fs/f2fs/file.c | 5 +++++ [...] 
 Content analysis details:   (-0.2 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
 no trust [40.107.255.118 listed in list.dnswl.org]
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [40.107.255.118 listed in wl.mailspike.net]
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
X-Headers-End: 1prLpG-001LBT-Kg
Subject: [f2fs-dev] [PATCH v2] f2fs: do not allow to defragment files have
 FI_COMPRESS_RELEASED
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
Cc: linux-f2fs-devel@lists.sourceforge.net, Qi Han <hanqi@vivo.com>,
 linux-kernel@vger.kernel.org, Yangtao Li <frank.li@vivo.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

If a file has FI_COMPRESS_RELEASED, all writes for it should not be
allowed.

Fixes: 5fdb322ff2c2 ("f2fs: add F2FS_IOC_DECOMPRESS_FILE and F2FS_IOC_COMPRESS_FILE")
Signed-off-by: Qi Han <hanqi@vivo.com>
Signed-off-by: Yangtao Li <frank.li@vivo.com>
---
 fs/f2fs/file.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/fs/f2fs/file.c b/fs/f2fs/file.c
index 5ac53d2627d2..46c62923f096 100644
--- a/fs/f2fs/file.c
+++ b/fs/f2fs/file.c
@@ -2593,6 +2593,11 @@ static int f2fs_defragment_range(struct f2fs_sb_info *sbi,
 
 	inode_lock(inode);
 
+	if (is_inode_flag_set(inode, FI_COMPRESS_RELEASED)) {
+		inode_unlock(inode);
+		return -EINVAL;
+	}
+
 	/* if in-place-update policy is enabled, don't waste time here */
 	set_inode_flag(inode, FI_OPU_WRITE);
 	if (f2fs_should_update_inplace(inode, NULL)) {
-- 
2.39.0



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
