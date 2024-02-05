Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 738258492A5
	for <lists+linux-f2fs-devel@lfdr.de>; Mon,  5 Feb 2024 04:03:42 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1rWpGd-0005c2-GE;
	Mon, 05 Feb 2024 03:03:31 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <bo.wu@vivo.com>) id 1rWpGY-0005bv-Ir
 for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 05 Feb 2024 03:03:27 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=MIME-Version:Content-Type:Content-Transfer-Encoding
 :Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=Pms2M3dtDRmLboEFI2NobDfl+l2d9SdMHXt6gMaUlyA=; b=XQCFeVEvXqMNiMXxpNA1bS1TAV
 uKnX5LK9L52j4bvXJByHnMbbmuYFrLfRgqpA3BoXE+snuYKrwJ/xxR43Q/JcRfLNSRUVx74gxLmqv
 zpVjxRuW/QLanXLctMBhF42NDACAAJRBUbokylUnDk4yA+GwUqB31YOpjmCSyZf6Wwuw=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:Date:
 Subject:Cc:To:From:Sender:Reply-To:Content-ID:Content-Description:Resent-Date
 :Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=Pms2M3dtDRmLboEFI2NobDfl+l2d9SdMHXt6gMaUlyA=; b=W
 yKCYPsP8/t8KfcfsJFF1xPtk8GE16HoNb0TXniUWc8PFNJiIxLp96RxeUBZMfMhSIfPIEWkmFa+sr
 /UHPJdT+p9Bm49r5DOCcLQSSXs2Go0qtDjSyMIPpOT0TVJYqJN3Ni6/w9PHNBDdvwEm4RZf01p2XA
 PiVc2z+IENn7C7ZE=;
Received: from mail-tyzapc01on2085.outbound.protection.outlook.com
 ([40.107.117.85] helo=APC01-TYZ-obe.outbound.protection.outlook.com)
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1rWpGW-00048K-G9 for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 05 Feb 2024 03:03:26 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=jKvo7k5aGRTLsxKwKT5QeLeShIqsbhAxl3wV4sa2UENQOuvhfBGCkHZBsh0hNlndUs7pJhVMQZ7ZMMtNRhVo4c5CGxAPm9ik9UJhmj9PeDRYcfNmYo/DzZvLGvM1ZwTkcxv8jhPbYb5YpsbWgJ00RB75xHdVldTYGyoOiAGGmub2Yscq7/uisfGz2PoMtlt4YpbrJfjEprr6dbbMWwwO3/mytZdm3NA8c0fZr0kvkngGSQPFCX66ZKMLeQbvAa1K17w7gmRkOIIf4R8qNZdHp+jitCbLp72b9RDcme+jDTS1UNIR3M4NsYwQiiuyGQd05yQjuKL2qcyCFOVsbftZeQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Pms2M3dtDRmLboEFI2NobDfl+l2d9SdMHXt6gMaUlyA=;
 b=XVfwIteaFjxjXAh8e03NNONP739JXCKM3GTXoN4AUNInLhYh9gooNPhSnEAwrHoKdv9aUtHE6bdXIFSeUxmUI7vo1c05gcAQE5jaTiB7NHXqOl/JIp++mGxk53u2yEcN+xRMNObYGdKCDZ9iHp9oadF5TGNVR2OmbLoufOE+9xKtWNv/5XoqXd6VFOt5LhMWlzabbkzLF+48hMWDaPApfHbDIJR5GycdYZTfqoWlbv52nfo06AUiDXEDaJtljYB6vipIyC10Q2xFCPKq6rLCvijfiznxu1bIV35GIXz3xW9KlWFfVM72F9vidr6pZpItS+NHkyTGHY0fzVr2nmfchw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vivo.com; dmarc=pass action=none header.from=vivo.com;
 dkim=pass header.d=vivo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vivo.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Pms2M3dtDRmLboEFI2NobDfl+l2d9SdMHXt6gMaUlyA=;
 b=n3SBa6YXYHoh2eEqe1h1s5t2niGott69oqLzfBU2kqd3rsuxC88E/1vGWH/vNS1KIoEZc3SF3EwES0gY7RomSSSNa8ZLiUg8zsOB/RprG1UqDJbky4w9g+uW4E8yseYZy+4/88R2IyIigRhJtI3KoSCc9iZs12PakPtiNj8lwc0/8X/Iva4eRgICdDQa0TfQKyzrLoTgk+N7Ggx54jtENwy+2F/Ra0I1ZhO7ky/mMyAU+mdVKbZ/sPk01MtdD4oXuns1P8HDrEb1GVew7ME0If1X+QZ3xG8SHT95ObJbSHqXsRk0kQ+omsdl0RxapQMwWFHCKuC16asNgAJUf1dhJQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=vivo.com;
Received: from PSAPR06MB4486.apcprd06.prod.outlook.com (2603:1096:301:89::11)
 by TYZPR06MB4159.apcprd06.prod.outlook.com (2603:1096:400:2c::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7249.34; Mon, 5 Feb
 2024 03:03:11 +0000
Received: from PSAPR06MB4486.apcprd06.prod.outlook.com
 ([fe80::256c:56b4:d404:efd4]) by PSAPR06MB4486.apcprd06.prod.outlook.com
 ([fe80::256c:56b4:d404:efd4%5]) with mapi id 15.20.7249.032; Mon, 5 Feb 2024
 03:03:10 +0000
To: Jaegeuk Kim <jaegeuk@kernel.org>,
	Chao Yu <chao@kernel.org>
Date: Sun,  4 Feb 2024 20:14:15 -0700
Message-Id: <20240205031415.557879-1-bo.wu@vivo.com>
X-Mailer: git-send-email 2.25.1
X-ClientProxiedBy: SGXP274CA0021.SGPP274.PROD.OUTLOOK.COM (2603:1096:4:b8::33)
 To PSAPR06MB4486.apcprd06.prod.outlook.com
 (2603:1096:301:89::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PSAPR06MB4486:EE_|TYZPR06MB4159:EE_
X-MS-Office365-Filtering-Correlation-Id: 5aa687d8-885e-43e6-2ce6-08dc25f6fc32
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Pg51Kh0AcHytjpTVsomvDtUiEpYdtlEVc6YYEE8fauKb4uKwvrbSohA1hIc3qOTZg2TlvIlylbJwg2Onu/EQb47bTBrmEz7pJLLVu6ZDzTrM4Y5FW9L2qE3LLMXOdlX6PN3sQqVmEgJs203EZVNv7YbsLaL5WiTI8rpVJKfFsi7ZO3FpDWASmCxhnca0cvZd1vRNRP8Hx0oZFI/Rg3m+qIAD9+7+fDpUEqtPdfLN5uuNp/oxGczVioQ9mO/+HW7wkHT2bZyGwFhKvi3l13TbBcfkEvCjpaP+GB5b049AsByiobUi41DYeH1wBKEzRWW1/eFlV5JJJ8MQhvuZareYdQCqKa5VMKXtA6Xc5ht+VR9F4QpAO/L5FV301kh8P+VyHcBcHBF+eLQWOzDYYrCMmowgp/NRDShtFc7eHunimkXYGkwIF5sCxzcpuYJYoArGqkxPz/jR/JfQbEDP6OMj+wiQT7mzfZfffigr/wQ1qpJWNgMVtl2JSB3Ml6nJSMYE1JQKs2m5N9H8WY3sCHpelCtY2inaeKL5KQoLnMTbJlDbbZR4Qp+rAR5LdN/ACi2rNtrZn8o62FLZmMXd367WLEBmi6ZKuZ8Y4P47QmvHYEA=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PSAPR06MB4486.apcprd06.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(376002)(136003)(346002)(39850400004)(396003)(366004)(230922051799003)(1800799012)(186009)(451199024)(64100799003)(41300700001)(38350700005)(110136005)(54906003)(66556008)(66476007)(66946007)(36756003)(316002)(2906002)(5660300002)(4326008)(8676002)(8936002)(83380400001)(38100700002)(6506007)(6512007)(52116002)(478600001)(6486002)(966005)(2616005)(26005)(1076003)(86362001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?4Qrd2WrLOGLBvPqKZ7oml2+fSDCK3zuvQzgUaj7pRcHeUOAOCyFuCJq+rkAo?=
 =?us-ascii?Q?t6uaOujlNegjw2FDcoCHlnnLyVLcec7ErbzzO0RDOVB9EZ7lGYqiAbtvQryC?=
 =?us-ascii?Q?Wz88JJ+eLe94XJx8kLbIKld0yxar141ksZ2Sg4jlt6grC/2MTafdRJR5zDAL?=
 =?us-ascii?Q?7I6fWHfY1qwypYZcQTUUM6XQuyGtKtmvJurdK0xkpG9aohHyhhNyu7ARWCA7?=
 =?us-ascii?Q?DWpgJ2HVDxwsE4a8Q56ombeF4pZiTPR5TZz3TL2poGI1KXmkkKJAKq2d9rKj?=
 =?us-ascii?Q?VWJUhCPB1DXdkVUo2eNP4Wkq4BMk7bjS46x3RFtr4WmcEvn+tm3NEDF7F9zL?=
 =?us-ascii?Q?blvsOoTgwphfvmDKzOCNxijF87yNlKytEzkwgdb6OSInOVDNIemsB4OWJJWy?=
 =?us-ascii?Q?C/hzr28qxnXRNvN7RhA5J8pRI1PMQl+hB/yinbp8Pqbw9YhDgmMHxz0CwEz0?=
 =?us-ascii?Q?U3QvNRbeiDWsfLEyKSLKAOF9H6GTx/fuA1UFLAyKIXM/b7X08fWnahqM3V7+?=
 =?us-ascii?Q?03WAAh9ZcVsBL95B1VQg4uPoXxB/L7vbKdfJevaplJkiEbeOhjIU02/bsstw?=
 =?us-ascii?Q?McR7OZBaz3Xt7LsOJvtHsmtBR2OLRMElKxfxxamgKDUmtfHhTiKFxB1HXStI?=
 =?us-ascii?Q?UBS0syW2+aDzS7NG0pfXr5zmg4FctRFIgIQwyiFt2WMFnkOODeJz5cE7jqu6?=
 =?us-ascii?Q?pc0pNHZU+OlnNo8MYnkIRrdKvGGuR4SZJI8eBaK3+mnu0BeUoIwQlRTnvK/C?=
 =?us-ascii?Q?hmLNnvkzDYTews98dxx8ldNdSVx+Vdw8nHX65LgzC6CFWJis06z/W2wYH4yx?=
 =?us-ascii?Q?WzZZPcOxji5xbizaja4Hr2uMVXlmttbMZRXqpYmDBJqmnFYT6jZ51lGclt1D?=
 =?us-ascii?Q?GETXWKMO0M1kt/gihgfWlcEFDqe6VNcTPm38zT8kQMflpY2FbT52qxkC079W?=
 =?us-ascii?Q?1c0QyI4QY4Lot4HDOTsxmtIZZQkauOYC4t3YCvkHrnQLEM3LuX8UWPMoKtus?=
 =?us-ascii?Q?3KBjfeU5S1iWwdVlv/rOAeJin7If0Y9vGfWU+naaZAA8OR4tcaTD6fiYi/Ey?=
 =?us-ascii?Q?rKUTcROPsJ5/PYYCoTGXcv/6vmvXw1eY0QXWr9uBxVrtuVIJgm4EF0lGrJeq?=
 =?us-ascii?Q?BL5dU7n0mfJJSJucsvL5zj7T1qwz9+Y4V6PMswmRe8aBHWVzo0kaliGHMluT?=
 =?us-ascii?Q?CvURLa+0fDNFLTbeK8bzJ4jsdFj52WE922Sun1aL9uAINV2TLQLnkHv7Jmc0?=
 =?us-ascii?Q?CgvoMd/nUkRkmg4wJGcfZWnR+V5j+xJQiBNkQFWzrSSl/8Tl3W1aCVBffSGQ?=
 =?us-ascii?Q?xBzqvEJcq15Nf2HKoTzEpWdim8IFAccl1MDtooeEUzXwJmvFa19Df4aBv6lF?=
 =?us-ascii?Q?Qf1sOgGptNq1IaKYHQTtNWRpzzUDamzKUcz3W9J8hTsXkfnfhd5iF74UwSVg?=
 =?us-ascii?Q?hVy5pr6U4Cfhn7DKA+HLxrwgAtBYaWtHCjg57lTV5nKuMhFbKPReQS4bcKP0?=
 =?us-ascii?Q?chFSbQY9JG4HV2dBgfKhmuPQYroYrV3kkocjv+UWbOkLGbexoSwEsIFIY/KK?=
 =?us-ascii?Q?b8N6jzvRbupomvnrNKjgOmR5lAs39AejLW3d7nB1?=
X-OriginatorOrg: vivo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5aa687d8-885e-43e6-2ce6-08dc25f6fc32
X-MS-Exchange-CrossTenant-AuthSource: PSAPR06MB4486.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Feb 2024 03:03:10.6119 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 923e42dc-48d5-4cbe-b582-1a797a6412ed
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: DHtb/8Qcbz822mZjZybMOZmHeA9khcG8wSJU/H/Kl2+aMfyzh/vot/NatHYSs2xx/1f4aKWNfE9CtcYo7tcH8Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYZPR06MB4159
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: This reverts commit 2e42b7f817acd6e8d78226445eb6fe44fe79c12a.
 If the GC victim section has a pinned block when fallocate() trigger FG_GC,
 the section is not able to be recycled. And this will return -EAGAIN cause
 fallocate() failed, even though there are much sp [...] 
 Content analysis details:   (-0.2 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
 no trust [40.107.117.85 listed in list.dnswl.org]
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [40.107.117.85 listed in wl.mailspike.net]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.0 SPF_HELO_PASS          SPF: HELO matches SPF record
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.0 T_SCC_BODY_TEXT_LINE   No description available.
X-Headers-End: 1rWpGW-00048K-G9
Subject: [f2fs-dev] [PATCH] Revert "f2fs: stop allocating pinned sections if
 EAGAIN happens"
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
Cc: Wu Bo <wubo.oduw@gmail.com>, stable@vger.kernel.org,
 linux-kernel@vger.kernel.org, Wu Bo <bo.wu@vivo.com>,
 linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

This reverts commit 2e42b7f817acd6e8d78226445eb6fe44fe79c12a.

If the GC victim section has a pinned block when fallocate() trigger
FG_GC, the section is not able to be recycled. And this will return
-EAGAIN cause fallocate() failed, even though there are much spare space
as user see. As the GC policy prone to chose the same victim,
fallocate() may not successed at a long period.

This scenario has been found during Android OTA.

Link: https://lore.kernel.org/linux-f2fs-devel/20231030094024.263707-1-bo.wu@vivo.com/t/#u

CC: stable@vger.kernel.org
Signed-off-by: Wu Bo <bo.wu@vivo.com>
---
 fs/f2fs/file.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/fs/f2fs/file.c b/fs/f2fs/file.c
index b58ab1157b7e..19915faccee9 100644
--- a/fs/f2fs/file.c
+++ b/fs/f2fs/file.c
@@ -1725,7 +1725,7 @@ static int f2fs_expand_inode_data(struct inode *inode, loff_t offset,
 			f2fs_down_write(&sbi->gc_lock);
 			stat_inc_gc_call_count(sbi, FOREGROUND);
 			err = f2fs_gc(sbi, &gc_control);
-			if (err && err != -ENODATA)
+			if (err && err != -ENODATA && err != -EAGAIN)
 				goto out_err;
 		}
 
-- 
2.25.1



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
