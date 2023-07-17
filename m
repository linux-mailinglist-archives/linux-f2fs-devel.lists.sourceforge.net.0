Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id A49EE755C7A
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 17 Jul 2023 09:11:46 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-3.v29.lw.sourceforge.com)
	by sfs-ml-3.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1qLIOO-0004fe-Oy;
	Mon, 17 Jul 2023 07:11:36 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-3.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <duminjie@vivo.com>) id 1qLION-0004fX-6i
 for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 17 Jul 2023 07:11:35 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=MIME-Version:Content-Type:Content-Transfer-Encoding
 :Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=d6g3PWpaR7m3kb0jhHCSFAy4Ehk5+QHW5NIED9aNkyk=; b=m+EqJb67lSQljZZGXWbz2/aUdD
 G7N0kaY1n2B117VB4w0HCwcoHHvWUWro0wZJWu/4HEh4/kPIr0/t3ZHH/2OZX0UWkyAKfwLC9yWOG
 xJTraq598uh673u388COhKeX05zeCufgFb4YoM/1Spmh3+arlPpQmtcCfrRT7k0n5ors=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:Date:
 Subject:Cc:To:From:Sender:Reply-To:Content-ID:Content-Description:Resent-Date
 :Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=d6g3PWpaR7m3kb0jhHCSFAy4Ehk5+QHW5NIED9aNkyk=; b=B
 qy76z3Q1u7aGtyxhj02/eOOE9oLgh7j1DHQtImq7Mmw5EY5DK1zqQvDTILwyfzq+5DP2h/29fOpYw
 LJdfJbSi8ihi8I+D4/KPb6keSt26IyKxRCPJ4ivNot2URnmYnN7j/CZMVkhOqAP9z6fTEWy6RUgPK
 9Dlls17A4r8qCP3U=;
Received: from mail-psaapc01on2100.outbound.protection.outlook.com
 ([40.107.255.100] helo=APC01-PSA-obe.outbound.protection.outlook.com)
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1qLIOH-00AIt5-IT for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 17 Jul 2023 07:11:35 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=FJ7UXIt+urtGEL9uhJOs1p8k4EmcUtA55aJ/jWCrrTcLGpWRGqMbAa37NTysAjDLn+R/1GdhwwmNUJBTlbNSo/QWUgnL4sbpWoW+EcedHjWXsch++X5dy4vq/VxZ9jK6R9X35pkc/R04rl8e1aQ6ud/Vne7T5mprp/rm0lI2mcMm9yGJpU3FUE2xgktzl90ohI+ounqM6rGUOBO3dD5MJyuhoTP083+rZ0t6BB44whGaUzLuXu9K2kAB8mzDNeim74gxIchROS8xHtrwE8ww0y95TjtYF5ScjesifVMQiGN84FVwgso6jdEVbd4YCtsulgjxkcxEbZw1/cp+mBFbNQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=d6g3PWpaR7m3kb0jhHCSFAy4Ehk5+QHW5NIED9aNkyk=;
 b=NJ7XR4a+yGdoO8wQul8v71nbfLbhytveraHzLojsJGn3u0qZ48W0dcCHtcm/u2799c/HdcD5y5SlWXKn1b8LKVgTZpHJdXfe5tGBRTOCutj8zPPta/cOIh+fhkVmevsUJQQTNkfCqDZmKgxUi6ZWDGu0GZt/rvX6i/MhDLGZo2JyF2mE0xVjG/wFS7x5KkpqitC2WfKB72qCcUEWVO4jnMrk6lalUmxMN6eadBNLT5RtnxjWn8lxIQfEKO3L7NSbVlCM9lpvYr1eM2WctxziDaEyZqm0/7CgIcLSjvxE39WG5d/BsD8odiutbiazhMsZ+vTa5MlkpJbRc0bf/LDx7g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vivo.com; dmarc=pass action=none header.from=vivo.com;
 dkim=pass header.d=vivo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vivo.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=d6g3PWpaR7m3kb0jhHCSFAy4Ehk5+QHW5NIED9aNkyk=;
 b=fEZcJYkkb2m18lwY5I1fd+Xsy3nZb1Cch9+rvSjLYugLJzhcUVctWLld4SHv0ZelfbDx7XRp7cOcwS4i0X1mLiIQ48OS1MJPHru7tT5LY9l47g5ujdiL8wPteMmUYhZxkKoNZjVoNdI1SPwHEqScOn2DAbSlSGCeOHACN+59zNPN54BbS8NGh8j1o7sZPfbt6edGiXdMtgOEJV1QFVY0NEoja6b5ODWb5vhcdPUOPkEo2GPtie3CwJE9PuS1f8ovm0VM81XJsBJbD/oMSb+xToDUwhOqOUgeOebRP3RrTLxljJlIQpPHj/UbMT3NZmclP+cpU6riI1PHC/ZHRkdJJA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=vivo.com;
Received: from SG2PR06MB5288.apcprd06.prod.outlook.com (2603:1096:4:1dc::9) by
 KL1PR0601MB5565.apcprd06.prod.outlook.com (2603:1096:820:c2::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6588.32; Mon, 17 Jul
 2023 07:11:21 +0000
Received: from SG2PR06MB5288.apcprd06.prod.outlook.com
 ([fe80::f9b8:80b5:844e:f49a]) by SG2PR06MB5288.apcprd06.prod.outlook.com
 ([fe80::f9b8:80b5:844e:f49a%6]) with mapi id 15.20.6565.037; Mon, 17 Jul 2023
 07:11:20 +0000
To: Jaegeuk Kim <jaegeuk@kernel.org>, Chao Yu <chao@kernel.org>,
 linux-f2fs-devel@lists.sourceforge.net (open list:F2FS FILE SYSTEM),
 linux-kernel@vger.kernel.org (open list)
Date: Mon, 17 Jul 2023 15:11:09 +0800
Message-Id: <20230717071109.5663-1-duminjie@vivo.com>
X-Mailer: git-send-email 2.39.0
X-ClientProxiedBy: SG2PR01CA0166.apcprd01.prod.exchangelabs.com
 (2603:1096:4:28::22) To SG2PR06MB5288.apcprd06.prod.outlook.com
 (2603:1096:4:1dc::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SG2PR06MB5288:EE_|KL1PR0601MB5565:EE_
X-MS-Office365-Filtering-Correlation-Id: bc8a7291-95ac-4109-8248-08db8695056a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: l42iGBW17ct8rT32zFiqg8MI8aVhChghrZdr13tqS8KcGOZMvTdoQS6ADulRUiifSRM3UIbodlrpy+ZE6eyyyokVbqc1oeUzJmOhrwPShq1LQ6M+gju1bgbeSJooDoOjEE7VduYJA6D5N5KTXvUyVYBYbbbPZipeBVPSP4RwSGmZbsvhrV6xV3o3GfEl5rZrm4h3S8/dYAlNn2pjr24GPT3rMvmaWZf3912MMbexH3zOIBf5dPu7hQ1Pl9pZ3hr3bsH63Thu2S4o9WadDyMsogXIeMoW5UIeic3SWd1p19/ZSCaslqjfUMJRdnRT2l6U9fjlxo2JE1V1BxaG/ElIt5Xg8/AWHFnUDeLKfsW3DoVdnzm3dusZyquD96+0FQH+X1IMxPgmiE0VFJlV0LQWwmRA1/tXlTmJ68DJByMbeZSRiLRrmWBfIq/7cMlnV3kZdXOdkrQejtjwS1Xr8vu0NDmVaXFoKANarFcnTOq1UGjhH1uIfLi0CvdSAITiTF1oJr+AKO+dFfp/b9MxI5buJS3G5dommuf2NyGhY163oA0z346/NM9FvkGoriRJGgWEMkcBvgqCCZ9X1vj7Zm3TwE0Qs4smXMNV5AQ8MhasmdXLAL5uBRXPg5cPcBf5yeIU
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SG2PR06MB5288.apcprd06.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(4636009)(396003)(366004)(39860400002)(376002)(346002)(136003)(451199021)(478600001)(66946007)(66556008)(66476007)(4326008)(5660300002)(316002)(8676002)(8936002)(2906002)(41300700001)(4744005)(6666004)(110136005)(6512007)(26005)(1076003)(6506007)(6486002)(52116002)(107886003)(38100700002)(186003)(2616005)(83380400001)(36756003)(38350700002)(86362001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?1CEM+5i9R1jnT9cV6VlBr3P3fVWcIBBJE2ryN0OH5qlhBd4V/bBSjfnWSi1X?=
 =?us-ascii?Q?EMVs0gaelvdwCFJp2fEsckExb66pFxoWyvJUrvjuGZB2+/F6lDFit3LgGA7A?=
 =?us-ascii?Q?IjBxuOoT+XoZGd7pgXkcVbyeEV5ABJdWjb9cZddKKcU7dXUD1YDRvdjNLJ7T?=
 =?us-ascii?Q?NQRHEAKkfssnFldQQ8FjtISx841JohhIISP+fLm1KSA9DeaIZijmCPzjfMkD?=
 =?us-ascii?Q?a2RvQ44/OKVxpOppfPWWo5ORXPNMM6GMEjzzxlgaMp+ymifWvsYH9D1WIx4t?=
 =?us-ascii?Q?AFK6bdJxBDS9d/wLxORVQLRqDM2KFhK5uNQuzMRiSA5TaPbhCY15bwMtham6?=
 =?us-ascii?Q?krJTvI79ZzpYUSvm8cbuxcHDdCunuvRWFmviORX4PlhlxRNp7YBpdIVblbn8?=
 =?us-ascii?Q?CTV/8gI5VExmy7/jlp32550aMpm/R9YtTbhdPkQwDwuLE5Yk6bGOCyqmrxRa?=
 =?us-ascii?Q?sbmtYrB4JaTdlBMFHPkUnQ902hJZSGOzg2kAo20V/fkCmOPYkeSpz9DBFFDX?=
 =?us-ascii?Q?yoRNFUo3pC1rPayjxNh3mdv8K2CoaDG2B3T6+e/I/w+cHBH9kUf0ZjplI8WT?=
 =?us-ascii?Q?d9rElCI5+mXLn1+5+H9psocYktbyVeQw8wEl/NMer+XF4fIdfVONBI/q6HvB?=
 =?us-ascii?Q?KHe1FbpXWvdGR4X1nZwZUvG3lWx7oEVL6pyfakdilPkNerPtzvPB+C2Y/uQw?=
 =?us-ascii?Q?PmiPWmsbEFt/e/5O2/ulL44lJxKOU8cCaRsEBPVcECzN7eGXI7FXinMzb3EB?=
 =?us-ascii?Q?ciP1Y5T6h/2pOOuL8A2zQMPc/Pb6zqEEG2mXXTKbzYZ6Y/Oey9pesL0F8y8K?=
 =?us-ascii?Q?BXPys/Dk+ne6ME82VZiDj4mRvcHaqaJO2Lt/4ziqxJFG2DZurcyxjdcH1faX?=
 =?us-ascii?Q?enQbPIpkNbX8Jt1sizSY21HjIgr6dVzVg9Wu13TBsSQg9fU2AD207VA7JRtq?=
 =?us-ascii?Q?pSHzZTGmmEHDHgou3hVc/6s9n3gUiEs0vQjOhDhrBX3nRZjobmLk+DJi0mn0?=
 =?us-ascii?Q?KzoNsS2jDJ6clefA12gGnyO3K/YBnakGyNcya9aT5gcRopECpbE1o0DYYisb?=
 =?us-ascii?Q?7T+b1YTr2bLGDieN7wZAkJj6KLDGgVucPOhkfCTdkw/hiX/tjW7nyLeZQbB5?=
 =?us-ascii?Q?fuUVrHyv7VZKXW/DCSZiiqT8/+F0nTUlCmVCt1g/+irByisCXrFKvz/P2xpG?=
 =?us-ascii?Q?AT/gsBOZMnmlnkkSkRq8rn50hg9630KtKwhW9Lq5Fy6ssrglXJCIxM59QjYd?=
 =?us-ascii?Q?kAG7X/ppMXUP4UDZlcRBOE4NytNQpq1RD6r7knQny/NUh4cgey5LE9kCHO3q?=
 =?us-ascii?Q?nZem6fA2JSLqfDDEE6AJt/7uxa6rfTuqLuR0mDpH/e+OlrhFan6P15vRMmR9?=
 =?us-ascii?Q?zqQ2H5zUSiz6lyvBLAkQbxDw+hkr0mDS9GsahHJ+Ni9jjivr8UniVIG3hCAt?=
 =?us-ascii?Q?+O/X0/VqiDc28Xs+NY2dxs/grOIn0L6/hVuSF2UmqeJjG4c886BQEtxJGf5C?=
 =?us-ascii?Q?ieWsY2KsGwZX8V9WEzFtiIz+ARZpuPk8QxvFsOrTl1RK1gQuJWUEt6cveLNA?=
 =?us-ascii?Q?r1t8YsSdsHbc7arXnau/cdict7iEaYhkdCnqXLWW?=
X-OriginatorOrg: vivo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bc8a7291-95ac-4109-8248-08db8695056a
X-MS-Exchange-CrossTenant-AuthSource: SG2PR06MB5288.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Jul 2023 07:11:20.4394 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 923e42dc-48d5-4cbe-b582-1a797a6412ed
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: efPVZjQbuD0bF5jhvnMN+LVDHEzJync6vDU36yscLgTsygOmPv4j45pHnTAIQwA2j7s0VwwfUVGp3E+cwSRKvQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: KL1PR0601MB5565
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: Simplify code pattern of 'folio->index +
 folio_nr_pages(folio)'
 by using the existing helper folio_next_index(). Signed-off-by: Minjie Du
 <duminjie@vivo.com> --- fs/f2fs/data.c | 3 +-- 1 file changed, 1 insertion(+), 
 2 deletions(-) 
 Content analysis details:   (-0.2 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
 no trust [40.107.255.100 listed in list.dnswl.org]
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [40.107.255.100 listed in wl.mailspike.net]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.0 SPF_HELO_PASS          SPF: HELO matches SPF record
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid -0.0 T_SCC_BODY_TEXT_LINE   No description available.
X-Headers-End: 1qLIOH-00AIt5-IT
Subject: [f2fs-dev] [PATCH v1] f2fs: increase usage of folio_next_index()
 helper
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
From: Minjie Du via Linux-f2fs-devel <linux-f2fs-devel@lists.sourceforge.net>
Reply-To: Minjie Du <duminjie@vivo.com>
Cc: opensource.kernel@vivo.com, Minjie Du <duminjie@vivo.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

Simplify code pattern of 'folio->index + folio_nr_pages(folio)' by using
the existing helper folio_next_index().

Signed-off-by: Minjie Du <duminjie@vivo.com>
---
 fs/f2fs/data.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/fs/f2fs/data.c b/fs/f2fs/data.c
index 5882afe71..298024b07 100644
--- a/fs/f2fs/data.c
+++ b/fs/f2fs/data.c
@@ -3236,8 +3236,7 @@ static int f2fs_write_cache_pages(struct address_space *mapping,
 					}
 					goto next;
 				}
-				done_index = folio->index +
-					folio_nr_pages(folio);
+				done_index = folio_next_index(folio);
 				done = 1;
 				break;
 			}
-- 
2.39.0



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
