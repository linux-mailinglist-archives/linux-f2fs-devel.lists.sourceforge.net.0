Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id B44B3969768
	for <lists+linux-f2fs-devel@lfdr.de>; Tue,  3 Sep 2024 10:41:22 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1slP6E-00085r-1L;
	Tue, 03 Sep 2024 08:41:18 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <bo.wu@vivo.com>) id 1slP6A-00085R-G3
 for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 03 Sep 2024 08:41:14 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=MIME-Version:Content-Type:Content-Transfer-Encoding
 :References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=zpt7hATAjsNzxEZ1b9rWksG+1m8LwfMM2LU47Jz15y0=; b=anesnj0fS9pNQURDLHgX+VAS/y
 a3SWxdsrtTO59EPOT10PBI+yM35tiysPrptkH5CCWCDOs0850TEGGWmiRDX8DBJlkD4NFRvbnTUDY
 BsHXYRz0F9QBL0sTZCaD8CNeu1Ewj8RwzMmxtazIAgDcunmLzexkQ39PxOnCQqcu7sdQ=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=MIME-Version:Content-Type:Content-Transfer-Encoding:References:
 In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=zpt7hATAjsNzxEZ1b9rWksG+1m8LwfMM2LU47Jz15y0=; b=fGPSzwfihj6EJAlGjhQeq1DKE7
 tMpgFrngLvppYBwiYNC47zhBF3sjDrfLMu81DZx90F3SYzO5ygqtFCUrJeZsmq7tXChwipmxIyMUp
 4BTuRgCpzf/GiZvgrY3JQTMmQ1DwHCLjSJoTonnzJ0l2rUQyxgKv+f456ZI3sQd4Q4ZQ=;
Received: from mail-sgaapc01on2060.outbound.protection.outlook.com
 ([40.107.215.60] helo=APC01-SG2-obe.outbound.protection.outlook.com)
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1slP69-0008VM-RH for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 03 Sep 2024 08:41:14 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=rNMy98Ur5ztuKYbYkrCeQImUel6oCOLQUaCnTpGnUaLJTkFy5pQjUFGu/C/a+nC6kYpCGZNTM7Jeb0h9Emnh8ACMJrk0I54DhjE9k0dP0TZZCXsyTm/EfarxypaSn+KZuF1GM5uUd64htog1cH1uJU5lFoW8Puis638V+IympCZNgvpA0FhKlCBslX+l43+CGWzxNKitlVe20jY91yDaUj9Ho0R1VMkWI7zznoYT5pEM49Kl4Vo1Cu6b22zQBrJd/ji4YmGj3o98korx7yVT7iArFI9xn64qtGCP2cv5OQbMytOdqFVPU1jCpaVlycAWPXA9+aHJedC6A9el1hJQXw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zpt7hATAjsNzxEZ1b9rWksG+1m8LwfMM2LU47Jz15y0=;
 b=YSSdYg9FH7znusin7Afi3+R7wwSHlQF4j0zR9shp5bbKgp7wwZkpAAI5MHahvqc0wex7b4MHt03FUyreUBUMoXzbOoBmQtfwGcAI8sl1TqAMgqNkUtyYJ33/IOXRIXNQ842R4imU4SuisFGqnTpoak3BzR7ole6/v/7v+4sTNSi/GofHU0vFFHJP5pjCtswY6oLSKMfH1BSvVE2aTCLOrOkLkrQ34hyfU4MP9Tf8MGYHtHM6ViN9uDvfDpA22GAOYlRjqOH4o0dcW9cInNEIf7dp6V0uuoKQ6VTXYSFDkZCGGYN/ODo+qrUNGUUBQ1ieg7s6ZxABSzUpz/7jiPjaEA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vivo.com; dmarc=pass action=none header.from=vivo.com;
 dkim=pass header.d=vivo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vivo.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zpt7hATAjsNzxEZ1b9rWksG+1m8LwfMM2LU47Jz15y0=;
 b=aWz2IRDnstSRiQfC3DLq3mapBl577CvIPNUEeuZQOdtBXQ2/PDM4RvI0ean25T063eJ6RueOXPofPZUjabTAhqcgGSw+N+PT9VE/kAwu5wedEYtaX+ho+arpO2qe9bzBB5FkJSs0fsYDpxIwciSKY6Y4UySpV85V51fwi01khoNuG5m+XR3DbHTQGqqCnvcMVWMZ25XAeqB3jwJQcP/5PG/RIVtvhFLdsSljCsgF00UkdpurHgrjSaasRZoGMwQwU+C0IxI2mImZVkI73hWkvn4g2Fi2e5TrgAVmxeD+FSGXduNon1/ocwJo2sPyJulSRua2A4ygGUv3kNbAJh2DoA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=vivo.com;
Received: from PSAPR06MB4486.apcprd06.prod.outlook.com (2603:1096:301:89::11)
 by KL1PR0601MB5536.apcprd06.prod.outlook.com (2603:1096:820:bd::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7918.24; Tue, 3 Sep
 2024 08:40:55 +0000
Received: from PSAPR06MB4486.apcprd06.prod.outlook.com
 ([fe80::43cb:1332:afef:81e5]) by PSAPR06MB4486.apcprd06.prod.outlook.com
 ([fe80::43cb:1332:afef:81e5%6]) with mapi id 15.20.7918.024; Tue, 3 Sep 2024
 08:40:55 +0000
To: linux-kernel@vger.kernel.org
Date: Tue,  3 Sep 2024 02:54:51 -0600
Message-Id: <b469bd6ecbb015b02b7a89b4f8110cf2c09f4275.1725334811.git.bo.wu@vivo.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1725334811.git.bo.wu@vivo.com>
References: <cover.1725334811.git.bo.wu@vivo.com>
X-ClientProxiedBy: SI2PR02CA0008.apcprd02.prod.outlook.com
 (2603:1096:4:194::12) To PSAPR06MB4486.apcprd06.prod.outlook.com
 (2603:1096:301:89::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PSAPR06MB4486:EE_|KL1PR0601MB5536:EE_
X-MS-Office365-Filtering-Correlation-Id: da211acf-c9a6-44cd-e705-08dccbf42023
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|52116014|376014|1800799024|38350700014; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?kKfi6SD/4Gb1t0CyMHKiqNYCGjzcVOQWAcEuLrAiSfBUSriKH1JXGr16Ye3J?=
 =?us-ascii?Q?kGhHQsSu6hHEYF+2B7Wstm/Om5YsAJ+K8wmdwyNGQNbbyTPFGQMDxE2dYAyv?=
 =?us-ascii?Q?cs5llaUyMjxxjqeuzcmy6tIQJfSdHOXp0BvjbvI8N+vh+dpdDuoaadbeYAzZ?=
 =?us-ascii?Q?vF73qXq+aTtAMkUASNnYH6vhXXS4yE7GnU/uljYFljPNvPNf3CTk+yIA9nYZ?=
 =?us-ascii?Q?yUorKu4wFDb8rP06DMKPfLKHhuahIkrpN2h++ZD1kURrR2zkp89Fv0J6y9Uq?=
 =?us-ascii?Q?pKvQ2N4oyko9Lhq8c8K5ckohUS4ynG+6O3J8AI3dOPRiKxH49rxmQOKwUsEk?=
 =?us-ascii?Q?gyqIyl7yboCARixnBsv9sRHR1VWbVTLDh5qwqLewPCIe05f1xAbDkCIiAyL2?=
 =?us-ascii?Q?zyHdbOx0Jc8hDQ0bgxUr1Z//rfLGldNt1z9pY/uqeC7vXw1PgEO0WraBHWrk?=
 =?us-ascii?Q?bZ2yE4xuSdMcsq0ZhUZZ9pX4MXcAgf8ga+sWQZ4ZrT9axKLueX7iHcVDK0Oo?=
 =?us-ascii?Q?3UEkcx7IqAQTmiBRIr+cuExJN6/dDxR/J1zJbW33uZQM6mYJ51UVouyObrOV?=
 =?us-ascii?Q?WbHtAAp0z0PGTKHV9OaOcpOd7gkjJZpkuWK0L6CttKwq1HwegKgqfE9PFzDz?=
 =?us-ascii?Q?9pnblDQAa6jJZHY0Qa6bjsUCIPkbZ3NvqEAHt/cmp7XMD35tYIy3qwo2TAnK?=
 =?us-ascii?Q?5XhUjbr9VjrDwlOYZ+twbfdI0YCcb7O4yZVbsd9qc0KmE++8XlN2IkMYD/0J?=
 =?us-ascii?Q?EGpX7m1LSXfq/+E9E59Mv6F6BE/Ymfpzou0TtN2OO6A2KnHHqU2EjaesmLzm?=
 =?us-ascii?Q?MWEAGvQZgRtGb9rRtIOuwWBFIT9gsBPHh0gYcK8agbxltMly02TH6tUQxgZx?=
 =?us-ascii?Q?TpzgECueVYoIDcNsNzgyZcdA0A9RmO69IYVOwyn0by+AJ7O4GgTeRdolAQAL?=
 =?us-ascii?Q?b+mqdAjhVIFNNRC12hvsiKLGks7kTHoDkxh3N+tIeIRUcJhsIsAl3IovJr6u?=
 =?us-ascii?Q?Dh6IZQBrNj6mozOYGMjsX7IXQ+oo4AylWN0CgHk/ggnayCdvGpizxt0LWTJg?=
 =?us-ascii?Q?NfskB92g7fuuLPihzx6zh73ph2dr2uqWtDSOO0LZwa0uWslaIgIiqSjANHjL?=
 =?us-ascii?Q?b1QhGI85lsqlrWcIpxCqdm2ZkW1NumD4FWpvIXNCLS1MBirA0KutkaVM4603?=
 =?us-ascii?Q?Ud9YsygqoyQHNPRRCfUdS35hamdgnqMuCZiJifXN5vKsjMvNBOO/PaUkFO6D?=
 =?us-ascii?Q?6GhtiINJJahrEO0a6ZMx4xEMg8pBOXFcRgqnWSBa17JpqrieW17keVKt6nuE?=
 =?us-ascii?Q?UfoQ6wNn4cKbl3WeDTCQtkBfQILlJZc8RsUuRV3WCeQct0h8Jswb8f6j5DPI?=
 =?us-ascii?Q?NV6ZrEsa2tlC2/MlYXYmWiO9AvwwHLvovuYuj83o58G0NGqvKA=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PSAPR06MB4486.apcprd06.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(52116014)(376014)(1800799024)(38350700014); DIR:OUT;
 SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?loSpHskOmpHJ7fUJaPxK0xIC/PnFrzHxRwUjbWThWnkn7bPQxpaMf0XgRTlv?=
 =?us-ascii?Q?o38N3GsUO78IeyzXCCyuF7IxKhEqAbnyESwxW95ICE9XWW//CI7eugGoV4D9?=
 =?us-ascii?Q?JndzRMFfXMMBtzflCL1lO9jGoV0YCBbIlwaiQ82oW2IY0GLz2UBFmifbbIB4?=
 =?us-ascii?Q?DBZ6QFqBp1g7TJFoYffYSVSxsQzBAOOIgvnLVMJs4ezol9lmpCVSITOFEFoF?=
 =?us-ascii?Q?a/cEdNbYJQYGO7X07RsT4h6FYGoUkBLQXdC3T48sCIljUfWR5lxTvdWPGB4u?=
 =?us-ascii?Q?7Z1TFbY4G/2cPR8xF6evDcOA2lx4M7+vj08truM7zk7DizgStc8SYulZRtvy?=
 =?us-ascii?Q?frmJmYl8Wj0ALgThUhE8X68i9OOCWbAt3GSSeSIIWoMmPzffhq7C2Ppp9fHn?=
 =?us-ascii?Q?nnV6YvMJmRqdsFUFX3r2AyubVSwZqTDuyMM99nHlL/YBJUB5WgayVUxLFTTw?=
 =?us-ascii?Q?IVckhWWneQKewYGCU8+eFe/VMVigv/ympkk73didhoG3UJxLk7XaylpEonhu?=
 =?us-ascii?Q?ykqVV2M+kxl92mtUOjmS0uE2/XhlHkcvGyHGpll+r0Jf06RfYm724yVhUf1/?=
 =?us-ascii?Q?BYiKO6gBzDmjchJarpq2ad0TsdQQ6KtumKnmAqr53bhqG8wmLwz2z4K5oB8W?=
 =?us-ascii?Q?nmMFjB4VXLzvNoxcS2PjXk76+DyAFO0GmNOT5rfYDUnUct63efANps65k9mS?=
 =?us-ascii?Q?LYvmVnJxFETAc7fa3kg/O0UPQgsPVRqvez3mYC2fhZ7QrpijFQtdpQQEUOxY?=
 =?us-ascii?Q?tmtMxi+5is/N3ZlYExsVgjCrgr+K0iJgVnY/MNPfsnRkf5og+TAkGAOBQstS?=
 =?us-ascii?Q?e8yY/IB0Vx5YbB6VBwc9nsVjcbAiSMPwU/pMBtiDOFxYXrn9jEwi/lZ4A2az?=
 =?us-ascii?Q?y9vtSHGT5dIEt11l2fid2lKEp94Py4BDmbQOixB17WPE8En/1f+jU+ea3j6Z?=
 =?us-ascii?Q?ZNJNIZd/35FmdT400kV2d1VhCO0/dhdEjO8YtWfzJhVQGSGRNyNaO+v/sdN9?=
 =?us-ascii?Q?k5uur4vJ1ceGCgjTShjcRsRhSdDZlyCrkYh0ELsC5XJCE2s/V7tzWRJg2L6+?=
 =?us-ascii?Q?pMqnq2mVw/OMhO7vM9A19426mSRrl9o8EGE5laBQf+c2wbeGRgBpTyJ9txQt?=
 =?us-ascii?Q?y06wbrw2xSwNfteD7jn/1NhV77HzaLX0KemsBVWKZhvpWqyvHA+bxXl5P3Z+?=
 =?us-ascii?Q?nxeyaGkJA1HTPm4eYv2F0jSE6UWKgxC5e8v0LU1B9nG8+nm3xQtjinBGYYWD?=
 =?us-ascii?Q?KTsjMufT7rCtdu3IRvREun+C1CPGiOWqPsHviHh3D69ppAh+NLZlDhgc/p2G?=
 =?us-ascii?Q?JpoLMCrRLDq7+6Jsm4V71rVKCOcq+jQtdzSIJ0pGC6WZbghsjI0X56xXtc7T?=
 =?us-ascii?Q?3Uc8sEt7IsYFqmqBg3D8NnqBwC1DYA/xijSaoK00dyk2duSQUKsjVamcRlM3?=
 =?us-ascii?Q?mGdTqppDqx94YYXIRJbuCeO+iFbLkA47LhbVs7RMV+VX3eCztFLlum5wUo19?=
 =?us-ascii?Q?VlVBnDjMLjRa68REp54g8do+9PFtC8WirNfJBvJD3v9CZMNgzjiIs0W5hLCW?=
 =?us-ascii?Q?bXbCkxRN8hp89mQPAT/uP8hBOuD+OjYrXywdPDc9?=
X-OriginatorOrg: vivo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: da211acf-c9a6-44cd-e705-08dccbf42023
X-MS-Exchange-CrossTenant-AuthSource: PSAPR06MB4486.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Sep 2024 08:40:55.2816 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 923e42dc-48d5-4cbe-b582-1a797a6412ed
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 78JUgF+9SK8W+VPdr7Np0qGcRC6hwomxyB805/iEtcRix/5wrGnaenQ9HJoLQgMvEpP9dTAM/gcMkIQyltCx3g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: KL1PR0601MB5536
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: Fix to support seek for inline tail files Signed-off-by: Wu
 Bo <bo.wu@vivo.com> --- fs/f2fs/file.c | 17 ++++++++++++++++- 1 file changed, 
 16 insertions(+), 1 deletion(-) diff --git a/fs/f2fs/file.c b/fs/f2fs/file.c
 index 957d1ff55350..dda4cf6d7325 100644 --- a/fs/f2fs/file.c +++
 b/fs/f2fs/file.c
 @@ -400,6 +400,7 @@ static bool __found_offset(struct address_space *mapp
 [...] Content analysis details:   (-0.2 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [40.107.215.60 listed in wl.mailspike.net]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.0 SPF_HELO_PASS          SPF: HELO matches SPF record
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.0 T_SCC_BODY_TEXT_LINE   No description available.
X-Headers-End: 1slP69-0008VM-RH
Subject: [f2fs-dev] [PATCH 07/13] f2fs: support seek for inline tail
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
From: Wu Bo via Linux-f2fs-devel <linux-f2fs-devel@lists.sourceforge.net>
Reply-To: Wu Bo <bo.wu@vivo.com>
Cc: Wu Bo <wubo.oduw@gmail.com>, Jaegeuk Kim <jaegeuk@kernel.org>,
 Wu Bo <bo.wu@vivo.com>, linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

Fix to support seek for inline tail files

Signed-off-by: Wu Bo <bo.wu@vivo.com>
---
 fs/f2fs/file.c | 17 ++++++++++++++++-
 1 file changed, 16 insertions(+), 1 deletion(-)

diff --git a/fs/f2fs/file.c b/fs/f2fs/file.c
index 957d1ff55350..dda4cf6d7325 100644
--- a/fs/f2fs/file.c
+++ b/fs/f2fs/file.c
@@ -400,6 +400,7 @@ static bool __found_offset(struct address_space *mapping,
 	block_t blkaddr = f2fs_data_blkaddr(dn);
 	struct inode *inode = mapping->host;
 	bool compressed_cluster = false;
+	bool inline_tail = false;
 
 	if (f2fs_compressed_file(inode)) {
 		block_t first_blkaddr = data_blkaddr(dn->inode, dn->node_page,
@@ -408,6 +409,14 @@ static bool __found_offset(struct address_space *mapping,
 		compressed_cluster = first_blkaddr == COMPRESS_ADDR;
 	}
 
+	if (f2fs_has_inline_tail(inode)) {
+		loff_t isize = i_size_read(inode);
+		if ((isize >> PAGE_SHIFT == index) &&
+		    (f2fs_exist_data(inode) ||
+		     xa_get_mark(&mapping->i_pages, index, PAGECACHE_TAG_DIRTY)))
+			inline_tail = true;
+	}
+
 	switch (whence) {
 	case SEEK_DATA:
 		if (__is_valid_data_blkaddr(blkaddr))
@@ -417,11 +426,13 @@ static bool __found_offset(struct address_space *mapping,
 			return true;
 		if (compressed_cluster)
 			return true;
+		if (inline_tail)
+			return true;
 		break;
 	case SEEK_HOLE:
 		if (compressed_cluster)
 			return false;
-		if (blkaddr == NULL_ADDR)
+		if (blkaddr == NULL_ADDR && !inline_tail)
 			return true;
 		break;
 	}
@@ -473,6 +484,8 @@ static loff_t f2fs_seek_block(struct file *file, loff_t offset, int whence)
 		}
 
 		end_offset = ADDRS_PER_PAGE(dn.node_page, inode);
+		if (f2fs_has_inline_tail(inode))
+			end_offset = COMPACT_ADDRS_PER_INODE + 1;
 
 		/* find data/hole in dnode block */
 		for (; dn.ofs_in_node < end_offset;
@@ -496,6 +509,8 @@ static loff_t f2fs_seek_block(struct file *file, loff_t offset, int whence)
 			}
 		}
 		f2fs_put_dnode(&dn);
+		if (f2fs_has_inline_tail(inode) && dn.ofs_in_node == end_offset)
+			goto fail;
 	}
 
 	if (whence == SEEK_DATA)
-- 
2.35.3



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
