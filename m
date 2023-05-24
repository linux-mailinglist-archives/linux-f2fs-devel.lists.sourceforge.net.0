Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 8AB5E70F118
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 24 May 2023 10:36:14 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1q1jyc-0004ds-Iu;
	Wed, 24 May 2023 08:36:11 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <guochunhai@vivo.com>) id 1q1jyX-0004dk-Jw
 for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 24 May 2023 08:36:07 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=MIME-Version:Content-Type:Content-Transfer-Encoding
 :Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=V2Or8q0lOLFo2kcrOMczh8JhrrJcmdu5pN2vwWH4EBg=; b=B5Dl335QdQID0R/HqsSXFHGRo8
 cfh89ES8x8Ww8NwwJEc0EYXVjE7qElt4eazIM+j981QHjc4taz1D2IQbLLuGhYg80S83sw/sXau3o
 QYQHcGpuJIIceA0vXNeUibRDn6UeKIaFK1Q3cADc6UXyX4sPeu9rL2NNHGj2aRnDQ6RI=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:Date:
 Subject:Cc:To:From:Sender:Reply-To:Content-ID:Content-Description:Resent-Date
 :Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=V2Or8q0lOLFo2kcrOMczh8JhrrJcmdu5pN2vwWH4EBg=; b=C
 kHCK07v8hnZplnT8z4xrH/mH2k9pL3gyxUIgrG4cxmACRW8TpEDcosy/fCM10PDsAEaGMJlf1BWl1
 ba9TbiNkoxJ5X0eHrBYOzyHC7s7rva+JEBAyxcxzcxO6VSc3uiCNwWwDteroInSNqAPYoS3idPCP4
 1oGJbGBR/f43t3ig=;
Received: from mail-sgaapc01on2112.outbound.protection.outlook.com
 ([40.107.215.112] helo=APC01-SG2-obe.outbound.protection.outlook.com)
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1q1jyS-0000nO-0N for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 24 May 2023 08:36:03 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=hNxrunrvui1ms5N7iSTdeLFGsPIzUhnjPlSeI1DI8KbUc2Eb+8LiiGtR9wUmlXam6d+aP19LrW+c0Kb2CYTmikndhf8/7ghCrqlnLLksj2vMyUmD26jCEinO9WTjoa7NsZBEBbpGXjwWEuP+ieVwgX38RM1qIVVwGbWXxF7mvDAqDvum6e7ru1D/LpyvTV14zY09FQ/LVFLIx/QX+wBWv4MSMu1lDJkBaYBk/B3uGFlbHOX6dYuNGupFk9nbsbPVO161XerzJlG+WQTmFTlJJAvhABQuaPt8gbuDsByOTpkuwv4FCjM1ahXIs2m7QtqLwbAwTlSi1BsnCZOn5z6S9A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=V2Or8q0lOLFo2kcrOMczh8JhrrJcmdu5pN2vwWH4EBg=;
 b=aOh74iNhglS7Y1+uqWKUPzYvSLI2MHXakeGCCLuSrPlU+BkfoteQ6gWF/Wul4k+WtwvzkAD8Ml9XCYCToTDBCIRm6dZNSfDrmz7wScdFeywAaX0lRp8qGQRowMAVTulEZLF7iJOKYAiqyTvRe1G1iUd+WBida7fAGXymQgox8jwHSSlVUk7mZSX3nVr6c/WZDkTXRRrmZSmg0BflNiEIwaZZDElX8v49IFbESZj/GWrtAu68AeF7l5jrkrqCuz21jLPqM235ce5Z6QNDH5qh+rmOuV9WLgi7Cc7l+ebRngtAOcx5sxblFcd+fwvvgNiZGodzwHva9p6Gn7oplqwFUw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vivo.com; dmarc=pass action=none header.from=vivo.com;
 dkim=pass header.d=vivo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vivo.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=V2Or8q0lOLFo2kcrOMczh8JhrrJcmdu5pN2vwWH4EBg=;
 b=K6fascW+DR3koHUZYD787oZ/SqZG9ABjus0ezcuMEViFJMFpppmuPoDMNAhngAMDTLCmYmKLfF2Pq/E98yv8QUNCuUkQvT9J79R45jPH6yMdE62oSAhwJSgTHZCfsPd4tcSNIHoc/R7thUpwtkh6BLWsIt4bPx/l6FqqjBinPP+laRn+aW0y/5IGeg61/WxFoHPst5HbdF9RYg9PpNBltUBNa8HQrMg0zxYcuZlSDwe9gw3nnS7GC2aHzLHUk+ekkHw6ptEW3YECFkF9EYhWZfsiJ6iFfp9CZse3RpeATWVf9wHBGEItPT61gwH3wSdJfDY1YTvAJUR2LJNYowzGFA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=vivo.com;
Received: from TY2PR06MB3342.apcprd06.prod.outlook.com (2603:1096:404:fb::23)
 by PSAPR06MB3878.apcprd06.prod.outlook.com (2603:1096:301:37::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6433.15; Wed, 24 May
 2023 08:35:45 +0000
Received: from TY2PR06MB3342.apcprd06.prod.outlook.com
 ([fe80::1e05:3b1e:35f9:87cd]) by TY2PR06MB3342.apcprd06.prod.outlook.com
 ([fe80::1e05:3b1e:35f9:87cd%4]) with mapi id 15.20.6411.029; Wed, 24 May 2023
 08:35:45 +0000
To: jaegeuk@kernel.org
Date: Wed, 24 May 2023 16:33:29 +0800
Message-Id: <20230524083329.10494-1-guochunhai@vivo.com>
X-Mailer: git-send-email 2.39.0
X-ClientProxiedBy: SG2PR06CA0235.apcprd06.prod.outlook.com
 (2603:1096:4:ac::19) To TY2PR06MB3342.apcprd06.prod.outlook.com
 (2603:1096:404:fb::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TY2PR06MB3342:EE_|PSAPR06MB3878:EE_
X-MS-Office365-Filtering-Correlation-Id: a8629337-30f4-4fc5-e9c3-08db5c31de49
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 426M/5S2Krhr1wbPhGdl7ahT5L0nLOLX7x6/YIlTHpDcUJVqlcGJuTZdWwlXT2e7tuL1LWp/SWCI+eX/e5yXmpXeR2bg6MOVRnHuid1gwWP0zpV7y60fj8I6BEJ5YD6t+lwNlU88YveXMmRNmUVk4ep1DCC4sF/pexP+QRppOXkpvvQo4B+eF6IZ3/E5SF3NaVgxqbDRUh+xLZg7EcCy83AGXL80TCfQgZ92V/DCmXRt+bI/8XNjhzswakGUqCMPQp3wFU6iMUh4/m3HnUARhuxP/nD0ztoG9y4w1fhSgLG2S4ggYukMVVwZ1Y+QIB2MkZFDWhkhpgDhOlboKbEHIO4W3c6wtXITW/mMJGVf0XOEXXnzJ2/DoY08KjXyLJ5kPkgNmqHQ9bE1dN2LGJiTUP2AxQfl+r5hWHIB8K8bMmt2iv1g+i+nkjbqjE/bCazPsRV5ckDBYGT0zBl03mt7OUAoUpTziplGu5HSC4RabaOB39kgJCatFXXWjTrr65f19urgO9pIviXg9EsWQG1LjLf9QkPtXKcUjbHPoNbGWeZjigy1feuiyUJFaBlPsD4rXInUTUe1Tihm2DalzahDcUcg1GVZAB3ZrEyjubFoP+t7k19kHcVsTs581RZw5Xs+
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:TY2PR06MB3342.apcprd06.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(4636009)(39860400002)(136003)(346002)(396003)(366004)(376002)(451199021)(2906002)(5660300002)(478600001)(8936002)(8676002)(41300700001)(66946007)(6916009)(66476007)(66556008)(4326008)(316002)(36756003)(6666004)(52116002)(6486002)(6512007)(2616005)(1076003)(6506007)(26005)(38100700002)(38350700002)(86362001)(107886003)(83380400001)(186003);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?P2FknNEkysK91OQLLjqrgNVObCrcUiuKVU+Hui1RGX0glRkWFdHP9X6GjuvG?=
 =?us-ascii?Q?FiqpPI4uzzqGvGQPhfT5g7MuS2KCR5YwPDx8JOtCi9fK2L794pcYR15srXCT?=
 =?us-ascii?Q?rC5jvCrLFFc5FEZilexFl8Fzcyl90YmA1LSuDopOWAJfYJrgp0/0q/5fmnYe?=
 =?us-ascii?Q?PRvrTiiEY2RNbFwCMIsKbuCAISyhkEqYMSNGQe4Kp/vIW8RaF1Z4e8JIHW6v?=
 =?us-ascii?Q?mXiGRaW/4hADtCCdf4FmTG850j05ICJvpDWmsINOQvA7akOonkIWgVUjQoz0?=
 =?us-ascii?Q?yOPIMREeFIl6Y0CpgWEf+Eaq/Y2cBzpQL0qVX2CSlGdNtXUOo4rpwCcfXJvL?=
 =?us-ascii?Q?/iSFhQKwZDvFVLbqGSRfx7IsNQnKbQu0HLuzQEZUchMuVbcNY7hFTGw67h/u?=
 =?us-ascii?Q?N/tk4GvYwknB+2Kh4e1e/yZiz8ux565bvXX9OvEPn2Elf1vN2pPsqNlsukkF?=
 =?us-ascii?Q?IDSr8S8R/VrmvNJZ2SlJD5QkNJVWVuXFicDgtKR3R1+UqnGyeJ6f/H7I0jZB?=
 =?us-ascii?Q?k+Yq887OfSoHk95s37iCHcz8bePZfhpf2WmvWLiajDVX0rX46hqxpQhvXh5o?=
 =?us-ascii?Q?wnDHiKEPIyU9EdRrkBsDTMmMcIb/HV/CyqpUzp4HtX9trCoYxtMHfLLK/Fk0?=
 =?us-ascii?Q?bpey8A7Tgx/aSFiIWqXkGm/Z/swCqmhhAbKW4MBYHGURg407mH5dMnage8iW?=
 =?us-ascii?Q?h0cS0Q57CvW+PM1TazLBurEjN2+ZiwE0/VDoF1jnNMBXA2Jr1aE7AIw6afEJ?=
 =?us-ascii?Q?6qpPzVp+TWmb/T6ItOxCVClufzTX+FSsjZ2lDFROKF2eEbOpu7SmFTQyrl6W?=
 =?us-ascii?Q?Xa/2jJ83MJUOWuuYuDlZU5ci0tyrwcA8WyfC3hyet0HNCVuAOQbYQwGNhHIE?=
 =?us-ascii?Q?cko1JPnbFzNFDqv+mzQlMJZ9SBJfLu7ySUdRBFFAb/fY0QQqi91Ca1cpxu9g?=
 =?us-ascii?Q?Du5Gbv25SmwjmZF3r5WILZE/ChzOdhV15dNhQkUqo2akThuI8NhnHrAq93NA?=
 =?us-ascii?Q?xSoAvthhRgm20NETxTf0nI2tySh+iiuCwl5kcWlzJwoCVi/3ONPb8MOvnmbE?=
 =?us-ascii?Q?zHFubtrYemojSKOJD5d4/q91YSj0K/NFRbArZD4qOJ9o7z5PbU5yP6m/lhDn?=
 =?us-ascii?Q?BzZ7XSJeo6NmdFomJkfxXoqRw5Jo7dRjhQK0gbiGFfBAD4cr3U1cuPLtAvXV?=
 =?us-ascii?Q?VEKq1Azzb805NeRsX8Zf1DhbJcilAMT9UKlEKCR+0d4o1qifTMfoLyxYKTql?=
 =?us-ascii?Q?RB8cB7o4EXH+5UjEVgjs4TFdfEAT0z8PyxqlxcBJyfGaUYJcshPm+VfY0a3B?=
 =?us-ascii?Q?3zous+QnJmQLniwZBMbmS2I7Ihn3bmF2cpjQrNZMmNNaW1rdRrH8JnjSeVe5?=
 =?us-ascii?Q?romlqoSsY555y5eSw3xFRHak7lIWfNu8jorpGARoyIEl/rEpOusRCibvBK60?=
 =?us-ascii?Q?h4vQO2jTjfmVQgk7AklJuHJKM5kUT3/tt5MCtbFDNv1odedHn6idRdyoayYx?=
 =?us-ascii?Q?JUh82himjqPPJGqA5pzI7UbZTcasLQ4hHXH0bMmLe8gg/AZHHg5z69OQEsCK?=
 =?us-ascii?Q?+E4t3Kfm0yW4rcFATKeW0BVtrC05XHR8eX3RogEh?=
X-OriginatorOrg: vivo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a8629337-30f4-4fc5-e9c3-08db5c31de49
X-MS-Exchange-CrossTenant-AuthSource: TY2PR06MB3342.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 May 2023 08:35:45.7153 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 923e42dc-48d5-4cbe-b582-1a797a6412ed
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: t0TDjntmZKgfoDhnSv3l97PpuuWb2Vxo0UWpi1sdEsPz2hR/60G9ZqYq/QES38pQELtHjSQG0wP69tQA42XqBw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PSAPR06MB3878
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: find_fsync_dnodes() detect the looped node chain by comparing
 the loop counter with free blocks. While it may take tens of seconds to quit
 when the free blocks are large enough. We can use Floyd's cyc [...] 
 Content analysis details:   (-0.2 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [40.107.215.112 listed in wl.mailspike.net]
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
 no trust [40.107.215.112 listed in list.dnswl.org]
 -0.0 SPF_HELO_PASS          SPF: HELO matches SPF record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
X-Headers-End: 1q1jyS-0000nO-0N
Subject: [f2fs-dev] [PATCH] f2fs: Detect and fix looped node chain
 efficiently
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
From: Chunhai Guo via Linux-f2fs-devel <linux-f2fs-devel@lists.sourceforge.net>
Reply-To: Chunhai Guo <guochunhai@vivo.com>
Cc: Chunhai Guo <guochunhai@vivo.com>, linux-f2fs-devel@lists.sourceforge.net,
 frank.li@vivo.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

find_fsync_dnodes() detect the looped node chain by comparing the loop
counter with free blocks. While it may take tens of seconds to quit when
the free blocks are large enough. We can use Floyd's cycle detection
algorithm to make the detection more efficient, and fix the issue by
filling a NULL address in the last node of the chain.

Signed-off-by: Chunhai Guo <guochunhai@vivo.com>
---
 fs/f2fs/recovery.c | 135 ++++++++++++++++++++++++++++++++++++++-------
 1 file changed, 116 insertions(+), 19 deletions(-)

diff --git a/fs/f2fs/recovery.c b/fs/f2fs/recovery.c
index 58c1a0096f7d..1b94078947cb 100644
--- a/fs/f2fs/recovery.c
+++ b/fs/f2fs/recovery.c
@@ -360,21 +360,98 @@ static unsigned int adjust_por_ra_blocks(struct f2fs_sb_info *sbi,
 	return ra_blocks;
 }
 
+static int find_node_blk_fast(struct f2fs_sb_info *sbi, block_t *blkaddr_fast,
+		bool *is_detecting)
+{
+	unsigned int ra_blocks = RECOVERY_MAX_RA_BLOCKS;
+	struct page *page = NULL;
+	int i;
+
+	for (i = 0; i < 2; i++) {
+		if (!f2fs_is_valid_blkaddr(sbi, *blkaddr_fast, META_POR)) {
+			*is_detecting = false;
+			return 0;
+		}
+
+		page = f2fs_get_tmp_page(sbi, *blkaddr_fast);
+		if (IS_ERR(page))
+			return PTR_ERR(page);
+
+		if (!is_recoverable_dnode(page)) {
+			f2fs_put_page(page, 1);
+			*is_detecting = false;
+			return 0;
+		}
+
+		ra_blocks = adjust_por_ra_blocks(sbi, ra_blocks, *blkaddr_fast,
+						next_blkaddr_of_node(page));
+
+		*blkaddr_fast = next_blkaddr_of_node(page);
+		f2fs_put_page(page, 1);
+
+		f2fs_ra_meta_pages_cond(sbi, *blkaddr_fast, ra_blocks);
+	}
+
+	return 0;
+}
+
+static int loop_node_chain_fix(struct f2fs_sb_info *sbi, block_t blkaddr_fast,
+		block_t blkaddr)
+{
+	struct page *page = NULL;
+	block_t blkaddr_entry, blkaddr_tmp;
+	struct f2fs_node *rn;
+
+	/* find the entry point of the looped node chain */
+	while (blkaddr_fast != blkaddr) {
+		page = f2fs_get_tmp_page(sbi, blkaddr_fast);
+		if (IS_ERR(page))
+			return PTR_ERR(page);
+		blkaddr_fast = next_blkaddr_of_node(page);
+		f2fs_put_page(page, 1);
+
+		page = f2fs_get_tmp_page(sbi, blkaddr);
+		if (IS_ERR(page))
+			return PTR_ERR(page);
+		blkaddr = next_blkaddr_of_node(page);
+		f2fs_put_page(page, 1);
+	}
+	blkaddr_entry = blkaddr;
+
+	/* find the last node of the chain */
+	do {
+		blkaddr_tmp = blkaddr;
+		page = f2fs_get_tmp_page(sbi, blkaddr);
+		if (IS_ERR(page))
+			return PTR_ERR(page);
+		blkaddr = next_blkaddr_of_node(page);
+		if (blkaddr != blkaddr_entry)
+			f2fs_put_page(page, 1);
+	} while (blkaddr != blkaddr_entry);
+
+	/* fix the blkaddr of last node with NULL_ADDR. */
+	rn = F2FS_NODE(page);
+	rn->footer.next_blkaddr = NULL_ADDR;
+	f2fs_inode_chksum_set(sbi, page);
+	set_page_dirty(page);
+	f2fs_put_page(page, 1);
+	f2fs_notice(sbi, "Fix looped node chain on blkaddr %u\n", blkaddr_tmp);
+	return 0;
+}
+
 static int find_fsync_dnodes(struct f2fs_sb_info *sbi, struct list_head *head,
 				bool check_only)
 {
 	struct curseg_info *curseg;
 	struct page *page = NULL;
-	block_t blkaddr;
-	unsigned int loop_cnt = 0;
-	unsigned int ra_blocks = RECOVERY_MAX_RA_BLOCKS;
-	unsigned int free_blocks = MAIN_SEGS(sbi) * sbi->blocks_per_seg -
-						valid_user_blocks(sbi);
+	block_t blkaddr, blkaddr_fast;
+	bool is_detecting = true;
 	int err = 0;
 
 	/* get node pages in the current segment */
 	curseg = CURSEG_I(sbi, CURSEG_WARM_NODE);
 	blkaddr = NEXT_FREE_BLKADDR(sbi, curseg);
+	blkaddr_fast = blkaddr;
 
 	while (1) {
 		struct fsync_inode_entry *entry;
@@ -431,25 +508,45 @@ static int find_fsync_dnodes(struct f2fs_sb_info *sbi, struct list_head *head,
 		if (IS_INODE(page) && is_dent_dnode(page))
 			entry->last_dentry = blkaddr;
 next:
-		/* sanity check in order to detect looped node chain */
-		if (++loop_cnt >= free_blocks ||
-			blkaddr == next_blkaddr_of_node(page)) {
-			f2fs_notice(sbi, "%s: detect looped node chain, blkaddr:%u, next:%u",
-				    __func__, blkaddr,
-				    next_blkaddr_of_node(page));
-			f2fs_put_page(page, 1);
+		/* check next segment */
+		blkaddr = next_blkaddr_of_node(page);
+		f2fs_put_page(page, 1);
+
+		/* Below we will detect looped node chain with Floyd's cycle
+		 * detection algorithm.
+		 */
+		if (!is_detecting)
+			continue;
+
+		err = find_node_blk_fast(sbi, &blkaddr_fast, &is_detecting);
+		if (err)
+			break;
+
+		if (!is_detecting)
+			continue;
+
+		if (blkaddr_fast != blkaddr)
+			continue;
+
+		f2fs_notice(sbi, "%s: detect looped node chain, blkaddr:%u",
+				__func__, blkaddr);
+
+		if (check_only) {
 			err = -EINVAL;
 			break;
 		}
 
-		ra_blocks = adjust_por_ra_blocks(sbi, ra_blocks, blkaddr,
-						next_blkaddr_of_node(page));
-
-		/* check next segment */
-		blkaddr = next_blkaddr_of_node(page);
-		f2fs_put_page(page, 1);
+		err = loop_node_chain_fix(sbi, blkaddr,
+				NEXT_FREE_BLKADDR(sbi, curseg));
+		if (err)
+			break;
 
-		f2fs_ra_meta_pages_cond(sbi, blkaddr, ra_blocks);
+		/* Since we call get_fsync_inode() to ensure there are
+		 * no duplicate inodes in the inode_list even if there
+		 * are duplicate blkaddr, we can continue running
+		 * after fixing the looped node chain.
+		 */
+		is_detecting = false;
 	}
 	return err;
 }
-- 
2.25.1



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
