Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 1AE9A6536EE
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 21 Dec 2022 20:20:33 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1p84df-0005As-Kc;
	Wed, 21 Dec 2022 19:20:27 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <frank.li@vivo.com>) id 1p84de-0005Ag-8f
 for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 21 Dec 2022 19:20:26 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=MIME-Version:Content-Type:Content-Transfer-Encoding
 :Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=manLWJpBlusLkA5eGLaVDFvtlKx1XkR7w9uvnNCgAlk=; b=dx/ZMpHWIz2tBVGhgXYu2Z5Afa
 cPvVeyRbI/LqA49nHNCi6/V7cGpqGs07EQ5hX+w5POiAZShDuiYG9pPqW2+4mowHaWi1xNCPlk71g
 2W6IRfEhoKZIZ7NtM1VrEcC0aTR6mioOY/A2cfNNfaNWfpHPjM8sxJRzms/ORF+kJmJE=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:Date:
 Subject:Cc:To:From:Sender:Reply-To:Content-ID:Content-Description:Resent-Date
 :Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=manLWJpBlusLkA5eGLaVDFvtlKx1XkR7w9uvnNCgAlk=; b=i
 Y0wy8CgcnhUjwRFnpeOt1BT1+1Bk1Rhhc2ztFarcezIQPrGOwszOZVR964l+jj7ewB/4xRrEEA7XX
 WRDcajAy3oEApl+NdLawJT+647Cn5YpD/4krIo7v6cNf7auruXHFLqAxZIXkVn2fBdEkZ3HWjagyY
 gBsPgWCApO+5ZDVA=;
Received: from mail-psaapc01on2120.outbound.protection.outlook.com
 ([40.107.255.120] helo=APC01-PSA-obe.outbound.protection.outlook.com)
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1p84da-0075gx-Dh for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 21 Dec 2022 19:20:26 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=eSImNqJ9VM5LeThka0V5HF+oFr1XSFaamYGKMD0NVvYtkHqXm6wC2DHyVG8BlqFNkZTTXCYMBxKDNu2iQYJZMvgjGRVgXTvZa//zD9WSVEo7/B5HS5b0I8qghnmWAVHKUChexl7haCFeX9Hm604/R1Cfb9NMivPkOWD0YTdCtjSwSyxQGKOipDHN+zRgVPXs3tSq5PWpvqZ69nHFEhk0Y/BFVYoBA1Yj8BF5YgS21MKRAgG4ZMc16d1NCUIPJHtC8vWafKfN+Hq2XW0xi1T7wpNAdWunGpgqSewt010/LMtTcco6pCfFsU3GhDNY80yvo/SUJIs+rpCi5KQceJISPA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=manLWJpBlusLkA5eGLaVDFvtlKx1XkR7w9uvnNCgAlk=;
 b=XNSjVoA4NXvzEGZrruHULuExJimy5lahN1y/KU2jVTdgb/ZchOSSmezqkDy2A+L4/GXTR2LV7clQ88XeXOUxmjyODGXH9X/edVMGOQXUTrfEvWNYLoWDl7JFV1BMlrzj/VGZB7wHnluv5seTakXZcvI7g2NoBzSjnkU1BvApU388qa9PGPM3aDT8uRyhB5jwIj2tgGBZQKvaVrVUnYkGl5dIEKhTar694PLdhS38tACWEzydQiJYCAyx7UlANJ4+5PmDFoP8D8BSBcVPNC56ycMntkpaLVoZVELKGUUAHnumn2XcsADMuyo785HVCOZhkttnb9+UjuR/1VOh1iyLrw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vivo.com; dmarc=pass action=none header.from=vivo.com;
 dkim=pass header.d=vivo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vivo.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=manLWJpBlusLkA5eGLaVDFvtlKx1XkR7w9uvnNCgAlk=;
 b=Da0Y5g786ZkiGyxpaqY2dlTqxR3/KkcnrF/itZjoSLcvdLws3TWhaXHJ2FZlpUpWupIVRydi9mRE355LAhyJSuL1hJWN4WckG0znwtW543C66wu5YZWy8D21IWFI6pQnMx6OcqwTTrf8Tq9pEQEHAn4kw+QrWjbVr50HHm4PBOmWaSni47AceSAGQzGzMuK/WaaJR+bbtFKE8x71ZUjQZNcw0HHWNQOFBL7zv2wFcfwDJ1YGoWb+Vx3HyE+Aa1meskWhA1l+vRTbrx15KoUGC3kXLs3bUhoEoZJiVWZX5k3c7IOH4Aa2RDy0pA7/cAJY1Tbk5NaiQfrIYv24bFbZbw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=vivo.com;
Received: from SEZPR06MB5269.apcprd06.prod.outlook.com (2603:1096:101:78::6)
 by SI2PR06MB4106.apcprd06.prod.outlook.com (2603:1096:4:f7::8) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5924.16; Wed, 21 Dec 2022 19:20:11 +0000
Received: from SEZPR06MB5269.apcprd06.prod.outlook.com
 ([fe80::ef03:cbfb:f8ef:d88b]) by SEZPR06MB5269.apcprd06.prod.outlook.com
 ([fe80::ef03:cbfb:f8ef:d88b%9]) with mapi id 15.20.5924.016; Wed, 21 Dec 2022
 19:20:11 +0000
To: jaegeuk@kernel.org,
	chao@kernel.org
Date: Thu, 22 Dec 2022 03:20:01 +0800
Message-Id: <20221221192001.17290-1-frank.li@vivo.com>
X-Mailer: git-send-email 2.35.1
X-ClientProxiedBy: SI2PR02CA0010.apcprd02.prod.outlook.com
 (2603:1096:4:194::15) To SEZPR06MB5269.apcprd06.prod.outlook.com
 (2603:1096:101:78::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SEZPR06MB5269:EE_|SI2PR06MB4106:EE_
X-MS-Office365-Filtering-Correlation-Id: 621f440f-c62f-4221-1775-08dae388614f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: XeiASiP38B2BjTsoinkKmsKzcuSgBjqjTfLjuJCztTL3PFqas1PgIqErzkMvCef4w8QCXWODipYv079yUz9q9tcvVB+mptN9l1MiPPz1lRQs3qEFzUWCUdIXD/lLBibA0giiTkxEk6xGGY5xklwr4w8k6hmM6bdoAu/kvWyeCYeD71fuMFolOlV0whaeguj2xXmfTG2poUE6HvQJQDYsiPTkaWb3aEyX3HU30qMWccmU5M6qofNHw4xJKm3QjbsIjy8fgnOtF47N0385WhyzFaGI94cpO9f3CLEYSmrUs90roIFwZWio0lQCxnZq1oxgORkVtzBAxkHWPaSiQrBqsAiy0c0Y3j2ffek9FX1rio1YXDvlYz2A46qlEYabRxHIhwG6fUkju84OXLqhnOqc0wReMbtixFvlGWxb2gVV/MQNsIYBszrj7rrKj0KVhFfGa5AvOz7KQeu3PMzu2EQICD/zHcXgw7WIfhPgwtJg3Sd4lfU3kbV1yDBwLpwQmeFEsut+CY3cd2KhOE646+a9Vk+LdDtQrHyVwuvwwJDfKuuKjKPuDrGwcE1I2UhgWNbpxqO8pi0kzY7TJW5CbS64s4gveXxzdHny07201TaprBq3fLZyPWZNE5qZTQNs0lz5r4pZgHkmz8Z7E2PSmKChshBSFPcW6VozckHF5uKx9NmIJtCXOW5uEAxujAVX1760
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SEZPR06MB5269.apcprd06.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(4636009)(39860400002)(136003)(376002)(396003)(346002)(366004)(451199015)(36756003)(26005)(186003)(6512007)(6506007)(107886003)(8936002)(6486002)(6666004)(5660300002)(52116002)(83380400001)(316002)(2616005)(66476007)(1076003)(8676002)(4326008)(66946007)(86362001)(66556008)(41300700001)(2906002)(38350700002)(478600001)(38100700002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?1kp1/UB9fp86FheWukMODvDeZ21UYND1f7BoxEfyjNOuJ4FHuvmovacgEk0h?=
 =?us-ascii?Q?BynwCSbQt3PUipf6Y9wQmBjN1IpkyD/UdQ+P0gSjTu3uARYEYI2XKb3y/XgL?=
 =?us-ascii?Q?W/+1GmFGmYlb4TkYsCEgkagTIWzRTJ/PTT0nST3Ho5s2UQeazpIzcv8/60LZ?=
 =?us-ascii?Q?5WVTR8BNnTc+hkaDzRa1/tthka5XXdrOuVO35JHLTQTknie6f/hIp/5jQo2L?=
 =?us-ascii?Q?xmZOKY/qxFFf/dwcc8Ug8cOI/RBsb8CbM/cDave370gyMqEQj5n6guAlmfPF?=
 =?us-ascii?Q?3m6uQpAuswZJEbl4vNQllw3w8TY6fq10KFtpnw8pdUkOTuufkYt8RBudu0cu?=
 =?us-ascii?Q?sVgT3SmMkE4+Ogve5KQIkaDK8EugsJP699BC47hC9CcybhW76OkkdRv0aa2r?=
 =?us-ascii?Q?UYZQcRaxRXGgwA5XdB8D1uygrKrgzfAxKPwUHVRm7JCUSwJi2Y3lXdpOeVXK?=
 =?us-ascii?Q?PART28M5/jANrhZtjV7JnJdQeuNymuyPLaub6QAwmwOBXsmeKFUo+3d7Nlit?=
 =?us-ascii?Q?DWYzXZoYxbaBm2aOjFlvnXwWA46jAvVXfMAa9Eh991R6dteYeZ7UU5DFRcIf?=
 =?us-ascii?Q?2fPXXldNzN/HaOxOeCiNq88F5klpwPvyz8+7FXXxF13t+JKZCEHEwecMM3k7?=
 =?us-ascii?Q?Jct76fT8w0x5Yw6tPpejO4+kLV17NAimu5C3PLfLUrQ0YMbVTJW/jZq20HG9?=
 =?us-ascii?Q?nFIoBC0jisxfKyqCNw2U25A35hh1cay2inU78JByYS8UaTUpF0Cu0EdB9NlP?=
 =?us-ascii?Q?ihsalNU2/muOYGYSYqBjcmejCaHhPyRl8aGpyr7+YV+JwNGxT/Kd1L13/2Ad?=
 =?us-ascii?Q?yG67GzMiSuvLXsg8+3c5ZYO2HvMLAtMtwCMt1nMt5MKxvoeWjwi9RmCW7tlJ?=
 =?us-ascii?Q?X0SKuTc8pSj/Bl9JYHmULTIPBZ+NluEDkYvTFst6MAco38DjZbMwYxAjTGfW?=
 =?us-ascii?Q?aBvrorsBgEV7wVHtRE+avWyeZcoMn2jOPu1jbEgQjF7eLjXOQmKfu1esVjG5?=
 =?us-ascii?Q?QSDBLGK0ipZmePT+gz23aOINYuBLN6K7sVeIGbN+5vOmXvErMSKbZh5+8GV2?=
 =?us-ascii?Q?eYyhL+0lniIOtcfe4rZVyVVsbRMepAHZgVCmFb3mYTdvQpxgI1Laoel5tVqs?=
 =?us-ascii?Q?E1Z39T91OuDKec3abOGRuVILVfWOYVnseyXrvuCtGBREiankcQIz6EQsUisi?=
 =?us-ascii?Q?ABbV1xNCqi8oyPWNxgOkhNdfcA9wwlwFCtswCRU51iynlzBaBzvgSgkJ4xdg?=
 =?us-ascii?Q?A35qaNCbQYsneMD42krntlETMsf9Qv4pGt4k72Brh0B408XNAiz4IrT2MHI9?=
 =?us-ascii?Q?DzMaWOFRQk2ZXECUVTlkQFwDyL+VwkkGm/eT1aa579arj0/6jJoWcMb3qSzG?=
 =?us-ascii?Q?mhsNxS1s+fVXxS2YYVtCxt9ItM1PozkOZJ5/PnOHBU2gq+h9vMKsPK4taqHi?=
 =?us-ascii?Q?LjlBlPwRvdQyusXUS5M3uQRGiqOddgrBTM9iHZl6euDytgemKhdue019D2k4?=
 =?us-ascii?Q?gCmHkVRKfS2UIhewnSJnM4WwIQwgRNDljxodm5MqepkvCBnxBr0ah7aLTBHw?=
 =?us-ascii?Q?CV+lUxEwOWKfLsU2ah+KKc/09ENGDqtk0Lo7qi3d?=
X-OriginatorOrg: vivo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 621f440f-c62f-4221-1775-08dae388614f
X-MS-Exchange-CrossTenant-AuthSource: SEZPR06MB5269.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Dec 2022 19:20:11.4915 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 923e42dc-48d5-4cbe-b582-1a797a6412ed
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 6bgBH3IFvpzogj+oBgrBn0ArSbHI/u+JZnzOMtmJ8GvmgJG8hIbkoXyynyiUo2o/CGsukRx6oV19Bw8zawVN4Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SI2PR06MB4106
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  In this patch, it adds to account flush count. Signed-off-by:
 Yangtao Li <frank.li@vivo.com> --- fs/f2fs/f2fs.h | 1 + fs/f2fs/iostat.c
 | 4 ++++ fs/f2fs/segment.c | 2 ++ 3 files changed, 7 insertions(+) 
 Content analysis details:   (-0.2 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
 no trust [40.107.255.120 listed in list.dnswl.org]
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [40.107.255.120 listed in wl.mailspike.net]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.0 SPF_HELO_PASS          SPF: HELO matches SPF record
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
X-Headers-End: 1p84da-0075gx-Dh
Subject: [f2fs-dev] [PATCH 2/2] f2fs: add iostat support for flush
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

In this patch, it adds to account flush count.

Signed-off-by: Yangtao Li <frank.li@vivo.com>
---
 fs/f2fs/f2fs.h    | 1 +
 fs/f2fs/iostat.c  | 4 ++++
 fs/f2fs/segment.c | 2 ++
 3 files changed, 7 insertions(+)

diff --git a/fs/f2fs/f2fs.h b/fs/f2fs/f2fs.h
index b116c778fce6..7d7b96d1e1d2 100644
--- a/fs/f2fs/f2fs.h
+++ b/fs/f2fs/f2fs.h
@@ -1194,6 +1194,7 @@ enum iostat_type {
 
 	/* other */
 	FS_DISCARD,			/* discard */
+	FS_FLUSH,			/* flush */
 	NR_IO_TYPE,
 };
 
diff --git a/fs/f2fs/iostat.c b/fs/f2fs/iostat.c
index 3d4503fef183..721294c40399 100644
--- a/fs/f2fs/iostat.c
+++ b/fs/f2fs/iostat.c
@@ -150,6 +150,10 @@ int __maybe_unused iostat_info_seq_show(struct seq_file *seq, void *offset)
 				sbi->rw_iostat[FS_DISCARD],
 				sbi->iostat_count[FS_DISCARD],
 				iostat_get_avg_bytes(sbi, FS_DISCARD));
+	seq_printf(seq, "fs flush:		%-16llu %-16llu %-16llu\n",
+				sbi->rw_iostat[FS_FLUSH],
+				sbi->iostat_count[FS_FLUSH],
+				iostat_get_avg_bytes(sbi, FS_FLUSH));
 
 	return 0;
 }
diff --git a/fs/f2fs/segment.c b/fs/f2fs/segment.c
index af2d522b1a89..ec4ed7603d1f 100644
--- a/fs/f2fs/segment.c
+++ b/fs/f2fs/segment.c
@@ -505,6 +505,8 @@ static int __submit_flush_wait(struct f2fs_sb_info *sbi,
 				struct block_device *bdev)
 {
 	int ret = blkdev_issue_flush(bdev);
+	if (!ret)
+		f2fs_update_iostat(sbi, NULL, FS_FLUSH, 0);
 
 	trace_f2fs_issue_flush(bdev, test_opt(sbi, NOBARRIER),
 				test_opt(sbi, FLUSH_MERGE), ret);
-- 
2.25.1



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
