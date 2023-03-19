Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 5FC2F6BFFEC
	for <lists+linux-f2fs-devel@lfdr.de>; Sun, 19 Mar 2023 08:58:49 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1pdnwD-0001HY-Fu;
	Sun, 19 Mar 2023 07:58:46 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <frank.li@vivo.com>) id 1pdnwC-0001HL-2J
 for linux-f2fs-devel@lists.sourceforge.net;
 Sun, 19 Mar 2023 07:58:45 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=MIME-Version:Content-Type:Content-Transfer-Encoding
 :Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=HZj7GllAx5VkrmUMnGUuYCkj0Yg8o8LmwJ/Vu2W/RIA=; b=EmB6pdKyRGxD0mVPEGsQJuHSey
 yY26ewTFVvSg+JAYZ7NxgAqJ0u2bQ3Vngxm3GGztEOA08CfiDhWaFZl8ynvAo4se9kKwpJIRktEB3
 k2Lalwr+ubufPxNBvdCR1lAC5jFv/zYZ/SoA+6Wu6fCxgRSETfCcyZ4+HBWf+c1GKiq8=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:Date:
 Subject:Cc:To:From:Sender:Reply-To:Content-ID:Content-Description:Resent-Date
 :Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=HZj7GllAx5VkrmUMnGUuYCkj0Yg8o8LmwJ/Vu2W/RIA=; b=m
 +wKHCuxh0WsctdUOTqm2btLygHcK5LEw+tqHMI6imnjLowMNT36H4NoQaVRYRE1s+d0hrKas7HcZk
 2TAcSbwLb7/A4LgHm9dQ7uSf6Mfy7xsJDC72+ASd5nhUg5wiZYY+/1Pnj98sb9aSkhVwYzMh2rKqn
 PQnbQQUaVbR1aiN0=;
Received: from mail-tyzapc01on2092.outbound.protection.outlook.com
 ([40.107.117.92] helo=APC01-TYZ-obe.outbound.protection.outlook.com)
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1pdnwB-0003wq-E9 for linux-f2fs-devel@lists.sourceforge.net;
 Sun, 19 Mar 2023 07:58:45 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=DBbd1gKy+/HjqtPnrr+ZDmFcu+f89jryYEWfuSBcAcDtce0dhYME8bylUrY0nMmWpVG0QlsVC50Wbtus+roSs2iQjDVwT8Irmi6KxE5Ko7JdzVtrYjSczw3FNVj46XUo7UjPpNYKapP7r5mgX7Ua7h/BJ2Cae1KWAqBkZpxuHoWBQmc5EaHpe8EvCVcib2H9tM63Tn5Pg9nD6Jo9PXhsA6RBO8YiWtRertzJseTJAoqtKTJ3yTML1/gcsWyT/UtQb00koVpzXOTdzXqtmmKlTzq4Z/DfGSc2xrWqPrMIy+D8snKLV/oCM8wrBXW291rLB9xWlMqnf7q1HKkJWA77Mg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=HZj7GllAx5VkrmUMnGUuYCkj0Yg8o8LmwJ/Vu2W/RIA=;
 b=c8acfh/2J1riDBIbQYrwGm0lMXIH2qMBr+UrFcg7m7k+A6DqM53DNZskPRfJMGABBeDJTaKKTk28k7e+7mOuZTBkDYVbyxX3X99QPgPhvoZtZ/Xe5+k1dZ8xiF1Lw2SoXRLtusiwaJtmFDYT26Edh2/QSDZLCmVmR6ZFQrkboyAT+Sceir76izVxpZdJ39aVHEN+Kfi+3Pf7V4JuDx/A67E4a2oaE/ZrWJxdrV2wBjiVn/AMG19RFlrThi3+Y+jteBfpUKqT4cvQsGHPZfqDVdszYLPvVw8XdAKVIkWWE7nxsu07pGa/kp/ComrrH4PNxLrwoNNglLZ21AGKyH3Opg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vivo.com; dmarc=pass action=none header.from=vivo.com;
 dkim=pass header.d=vivo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vivo.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HZj7GllAx5VkrmUMnGUuYCkj0Yg8o8LmwJ/Vu2W/RIA=;
 b=a1c7tPR24HeQUOWDF3WR4dl8C3Ue6i4VMC6KeTWcvEBZoeJu7tl6LiLOux6wAtN61dYkUjcVb3TMbFAhD6HNwWYxwA3Cs/1eMRXg26C9IJR04f2SqzjndIVK3VnLZF7CIbdnr9Gl/b7L3T1P7B8o6qdpjGByxrh+Lu9KsenmwCG7cSY4bO+M0msErgH4o9JghOm9mNFQ04dhZ6AzPW4+DwRiqDmHuJQWFM/OayT9hNYHovFudZ4ilVwPZcRWGGI1Ru3MVnhtfkkghTxIEReTCDJyqKXTTIkxbq6RuUUytCO2VaKehLzmv0R1+5XQx4iKT4BrKVTJrgHHd40PZPfOuw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=vivo.com;
Received: from SEZPR06MB5269.apcprd06.prod.outlook.com (2603:1096:101:78::6)
 by TY0PR06MB5626.apcprd06.prod.outlook.com (2603:1096:400:31f::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6178.36; Sun, 19 Mar
 2023 07:58:33 +0000
Received: from SEZPR06MB5269.apcprd06.prod.outlook.com
 ([fe80::daf6:5ebb:a93f:1869]) by SEZPR06MB5269.apcprd06.prod.outlook.com
 ([fe80::daf6:5ebb:a93f:1869%9]) with mapi id 15.20.6178.037; Sun, 19 Mar 2023
 07:58:33 +0000
To: Jaegeuk Kim <jaegeuk@kernel.org>,
	Chao Yu <chao@kernel.org>
Date: Sun, 19 Mar 2023 15:58:22 +0800
Message-Id: <20230319075822.79337-1-frank.li@vivo.com>
X-Mailer: git-send-email 2.35.1
X-ClientProxiedBy: SI2PR02CA0028.apcprd02.prod.outlook.com
 (2603:1096:4:195::8) To SEZPR06MB5269.apcprd06.prod.outlook.com
 (2603:1096:101:78::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SEZPR06MB5269:EE_|TY0PR06MB5626:EE_
X-MS-Office365-Filtering-Correlation-Id: 8c3c7489-edc3-4170-4e87-08db284fbc7d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: R5mZBE8V3cWZvkf1cFYd87ZqYVGUD+ExlZD1sUSrVAqrjzo4sQpnqF5lb80DoN85Vh6fiK4m3JFcPuJMgxH4cOlxtTJxH6MLcALE/dilxJMufWScYmf9IfyE+utMxP7sb3yzyhuSwgcqSEvKmYUgVtZanYsSMoudhllX51Z4ZGN2MAQP4Q/u8+lbJnphhyUDUPoH4eAVMpsIQNCNHTJUlEGvCofY9DxbBNLBAhSglT8viVdzkmMaa/U6KkhbtbdDcYVj+xktrUOS3J06QivP9iMp7YzNNpHhf+71yIaQSRTxbruJeQ8xxxOegGSvDN6oqHStyJNkl6KvkXmg8RDguM9MldB4u2nb4+NgGwbxGRqzIcek3pAG3aJ/qCEs19lIVB8qOEOb5x5zUFDkf2DNwhn7eFhQ0SYYTBvz2bW9K4qtQnWzJVysAY9Bt4v0gG+CH/EGD3wGneaF9Paekk2YImkraC1wqVwu4q8ox47mVXISVAVZjLPwclftsLp2xKau0Yj52sqMCqw82y9h7fhkvf7/kRfezfIn2O8dIxmbnXsmUMmHvwLF+bD6iLhBPproU4rC6Ymb4GJdFWLhklpCJkRui+PkIHeQZGkg6T+OogR/nGfKx1mIWborrcCwZpqvFiDADiPJZRcZCyGV3R2klMEBjXQnORc0FPYERsPOmIncg/hjr594XSc607herCDoNIYQZ0qzH3CymOr5HUorVg==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SEZPR06MB5269.apcprd06.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230025)(4636009)(376002)(396003)(136003)(39850400004)(346002)(366004)(451199018)(316002)(110136005)(66556008)(66946007)(66476007)(478600001)(4326008)(41300700001)(8936002)(5660300002)(8676002)(36756003)(86362001)(52116002)(6512007)(1076003)(6506007)(6486002)(186003)(26005)(6666004)(2616005)(2906002)(83380400001)(38100700002)(38350700002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?iysuEVQDl22kmE+HiZ4HZesLuzceWfzZ9vm5kevLLqiLqn8GlKKjLf5ASKZt?=
 =?us-ascii?Q?Lahyao/IvQAEnOtceS9O71IR8SvUg2ipOSWyoQzoA3xBaT4ahCIs2SBtdjcf?=
 =?us-ascii?Q?P+83CYoB2YwfnutPBhYkuo46SC+K7dsFdCNjY7OgSZqEwgiJYZxqbQsNBW32?=
 =?us-ascii?Q?TvdVzqGo6A65wSAQLwFx5v75IEyCpPY0ISQxdl89Dy6q62Jz3WfummlGw+uo?=
 =?us-ascii?Q?nLwgoARYLaad3GuLquFNCP0H2iHsVACjFjjTqXGPjnJ2Tl0qevtwg/XW7ynS?=
 =?us-ascii?Q?MfOagRETZcCOdCA49qddYBYWU3LowpJ9ug/eECT+IQPcl0D46eVac0tTKN6R?=
 =?us-ascii?Q?USNDkS6Ftwv1XQ3cMbtSJX7Ie8m6X00kqQn6RyNCrOWN7Rczd4/u2gy1vu3J?=
 =?us-ascii?Q?mBYmWyxnPY0i5fmz2kSyiYDbeXmetUw3L3iHQi79clCY6BVHNXLTD/+i1T29?=
 =?us-ascii?Q?6QaaDEi2gLfpUms+G2xpRd+1K/uQp1F/rQfErsZeCnFjdrbM5bbQikW8Mc7J?=
 =?us-ascii?Q?ATPLw8qWlBpBxhduHOtPpVBswdMlPgjFk4uqCa/eN96giemLi2020bUj2dNf?=
 =?us-ascii?Q?z8uo781NM9ej91OtaOXHlyabqK8j/7Cb6Pvwqg+S/n4cUW7a1R8CjmPBgVyr?=
 =?us-ascii?Q?3s/CwJWdreAMMPoQZY36Ass32+TR/pXzNlZdVeDcpvBwUORDKP24+L6LZ5q3?=
 =?us-ascii?Q?cmNV9fy1YMgNr0xlKF5/YMONEPA3KXDcSWbJKBOmTKOgSkc1rgXrv/dYsedj?=
 =?us-ascii?Q?6AvKi/ZPfhyqqgQOiY4BzfigOx+WHFbL4Fjh8ACfBDoSg/P/L4xsTxNXDnXG?=
 =?us-ascii?Q?OdVC39hPbwJjYRBMaH+pMwoau0XlsBjo/Rof/2kkls7CJ84wZHOeC2Hu9ffz?=
 =?us-ascii?Q?F6E40SZim24kjAAK5RuU46f7z2cvPcmPwtj/3GqRNYQ1JJL9+e7Qle3pKrSn?=
 =?us-ascii?Q?6goYmt7f/ZEiICu2ifE5bHZd/nDgLvfONBnGDag3aagYe3tvC5wK/HxfiVu2?=
 =?us-ascii?Q?AzcLgRTmJtQ/+N60G9Gp9Fh/SY2yJwFjZ9y42bUGzDAwAvT8VnWicpZ3KG14?=
 =?us-ascii?Q?H97X9/BjZ4cJBQNcRDlzTBP8h9EktRJ+8bFcb1k4WLTFp6dR99nWcdh2OXeR?=
 =?us-ascii?Q?f8UTDnwrzaT9OOvT0DcUkQ/45nn0r0lw+DLpLlfBVrXsbu5ZlEX0W/3giTnw?=
 =?us-ascii?Q?5j72Lsjf+mix0sUgql+OwNPB5fQ5xZ856AK8Ml+9TSZLaiFN3WDAVaA+et7k?=
 =?us-ascii?Q?IZpNAFEpnj3vk9MT3CTy2fWlkir5CCxFAktAeAB85Y+ceFB9nVOxCvei7x+q?=
 =?us-ascii?Q?lisYyTNTpV41vP1BfW2+343rD3oBWGzZ410qZ8TU1gHSp6QP1pNRqck+M2vN?=
 =?us-ascii?Q?U/o+gZu0WE9jp36s2Ey4g9hdVUGcB0OKH7Y7T1Woeg+XW8dUgIEdPCFTe2D3?=
 =?us-ascii?Q?c2mGm16fjbKMglX4V/8uBSlPtDqkfEKLsG7uZuigNVw3OU7xQTqxRNRchFCp?=
 =?us-ascii?Q?j2iEFVB7ucOYaP3GQgUdOicD6d3Q3a4o0W2vPdPuqukJflx32fu7HpXRAEEB?=
 =?us-ascii?Q?DmFPGU47jDil35O5seUgHYBSfekjo6tY7YzZXu4m?=
X-OriginatorOrg: vivo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8c3c7489-edc3-4170-4e87-08db284fbc7d
X-MS-Exchange-CrossTenant-AuthSource: SEZPR06MB5269.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Mar 2023 07:58:33.7300 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 923e42dc-48d5-4cbe-b582-1a797a6412ed
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: hdynMuH3XRbo7vGkmckWsVPFbqvsCXGk197iBmAfZM+Rks6c4uzAJFGboDuIlgKhi2sjYiArBh50qEYJubz7Pw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY0PR06MB5626
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  is_extension_exist() only return two values, 0 or 1. So there
 is no need to use int type. Signed-off-by: Yangtao Li <frank.li@vivo.com>
 --- Resend this patch because there is no similar patch to merge in this
 time. fs/f2fs/namei.c | 12 ++++++------ 1 file changed, 6 insertions(+), 6
 deleti [...] 
 Content analysis details:   (-0.2 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
 no trust [40.107.117.92 listed in list.dnswl.org]
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [40.107.117.92 listed in wl.mailspike.net]
 -0.0 SPF_HELO_PASS          SPF: HELO matches SPF record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
X-Headers-End: 1pdnwB-0003wq-E9
Subject: [f2fs-dev] [RESEND] f2fs: convert is_extension_exist() to return
 bool type
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

is_extension_exist() only return two values, 0 or 1.
So there is no need to use int type.

Signed-off-by: Yangtao Li <frank.li@vivo.com>
---
Resend this patch because there is no similar patch to merge in this time.
 fs/f2fs/namei.c | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/fs/f2fs/namei.c b/fs/f2fs/namei.c
index 11fc4c8036a9..ad597b417fea 100644
--- a/fs/f2fs/namei.c
+++ b/fs/f2fs/namei.c
@@ -22,7 +22,7 @@
 #include "acl.h"
 #include <trace/events/f2fs.h>
 
-static inline int is_extension_exist(const unsigned char *s, const char *sub,
+static inline bool is_extension_exist(const unsigned char *s, const char *sub,
 						bool tmp_ext)
 {
 	size_t slen = strlen(s);
@@ -30,19 +30,19 @@ static inline int is_extension_exist(const unsigned char *s, const char *sub,
 	int i;
 
 	if (sublen == 1 && *sub == '*')
-		return 1;
+		return true;
 
 	/*
 	 * filename format of multimedia file should be defined as:
 	 * "filename + '.' + extension + (optional: '.' + temp extension)".
 	 */
 	if (slen < sublen + 2)
-		return 0;
+		return false;
 
 	if (!tmp_ext) {
 		/* file has no temp extension */
 		if (s[slen - sublen - 1] != '.')
-			return 0;
+			return false;
 		return !strncasecmp(s + slen - sublen, sub, sublen);
 	}
 
@@ -50,10 +50,10 @@ static inline int is_extension_exist(const unsigned char *s, const char *sub,
 		if (s[i] != '.')
 			continue;
 		if (!strncasecmp(s + i + 1, sub, sublen))
-			return 1;
+			return true;
 	}
 
-	return 0;
+	return false;
 }
 
 int f2fs_update_extension_list(struct f2fs_sb_info *sbi, const char *name,
-- 
2.35.1



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
