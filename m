Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id F19F56F9289
	for <lists+linux-f2fs-devel@lfdr.de>; Sat,  6 May 2023 16:43:36 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1pvJ8G-0006mY-12;
	Sat, 06 May 2023 14:43:32 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <frank.li@vivo.com>) id 1pvJ8B-0006m6-0k
 for linux-f2fs-devel@lists.sourceforge.net;
 Sat, 06 May 2023 14:43:27 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=MIME-Version:Content-Type:Content-Transfer-Encoding
 :References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=RMuSe6FEFxGDvX/sqWgJC3oZ5D78m4r6nwK/M2i36wM=; b=j/+cHnjae/b7XstuWIpKEAQK3h
 /HgOYU+V2xgmzJt8vwKbJuiYLqreYPkS6N4oScsm+B+2jG57msSW+ZW5M3fj3Ogn8JcFgigvbb+2y
 XbiWGAYFOcLmBw5mQ+aTM1OtEGaZsWn3mIGvqzUXwhUEqDdvgK3/4gTgdpVyfVjzZDd0=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=MIME-Version:Content-Type:Content-Transfer-Encoding:References:
 In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=RMuSe6FEFxGDvX/sqWgJC3oZ5D78m4r6nwK/M2i36wM=; b=Rkw7FoRxCtc6Ey16G0ueF6nfwi
 /LbBTChUthIscFv1fAiWERdocgYq7nfLcoB331rf7taaf9daSTzVbBh2gMiiMEMXJq/eyAfCEhT6U
 ryGJ+5WgCjVx3YXhrk1e0JRg6CJtquVcRfz09+N11VMWpU2A0eKi5CdtL9yHZd/6+mbI=;
Received: from mail-psaapc01on2133.outbound.protection.outlook.com
 ([40.107.255.133] helo=APC01-PSA-obe.outbound.protection.outlook.com)
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1pvJ8A-00GMfh-D3 for linux-f2fs-devel@lists.sourceforge.net;
 Sat, 06 May 2023 14:43:27 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=DB55EITw/PhE6n6DdsChgqpNCn5sNIImfl38ZDe2Z64fBIHET8HIgrlCU6QO9sMPY3t0qPvdRfrgqGiNMAbLl18Yf82yA1aWLv+drZj5Q7Qj01nccuHNcLn9JWgFtDRFt3HQuLLZDPIEkvD9usUE9oLrKeve4Cg0TQEOwzq+tovGIo4mqBFbQ3iLOVdZCuTOqUknJTkzcdDmCqv37nooCbNLLD1S8hRqZcpbL4sTtDd0t42A7CFI8nWYp/Ho079vBt6MpOntg9YgCUNdpF0TMMkSMvB8j7jtMd2uPRGkt/YiTjMvNb0xMLYV94qYIfex/iGwukYvRYwZiT+FPYyFmg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=RMuSe6FEFxGDvX/sqWgJC3oZ5D78m4r6nwK/M2i36wM=;
 b=ALHbEXxDgnOkYb9xRTWpZFoVg781ypFPZgMVerCpkkRPyyFHPH++PoY6BVUMZI66Fproi8KLZjQ6udVlWYt5U1KwfCmAFLnXp9UfBtbIYFax+NnyKnh/QMHgCsowDxmFRV0fkkEyYnIXKbw7OxBD0AhILoG87Nv8Yg96ZqP66yDy6kQchq0Lk5BNeE51lIjbiPhW16Kf269TgdAAYK1b/gsIs/JMdtbTP6XhH9YSYT+vnmBYxNBAWtSPmWWq9qEhRB+Qr1i96C+Mq3rrkhkMVDO3UdLNNFhsZU6kc4zjLa0EzQE0BTOWNT1vL1da7AOXLOSg+naDYFveMA30aTjdgA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vivo.com; dmarc=pass action=none header.from=vivo.com;
 dkim=pass header.d=vivo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vivo.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=RMuSe6FEFxGDvX/sqWgJC3oZ5D78m4r6nwK/M2i36wM=;
 b=g5dcgSVLGalWzUqV0st6jQfb12w7tQNbWKC0ne8AJGZjsgFPKFBc2op8GG0QKyUWLBZHqOKCHXn58pwpiV1hgdmA3IrPRstqWqZ5bexZ+1avFiWKp1QKqQaQKdadQlhFCQbZ1hdnFI22XU/ShfF4NiFFrhnDtKSq2DtpVtKRhQp2kXsNoZ1mQhvL0yMhnDvugBNDHTwz9zqdyAPFHFbX+LvFzxMJD76kgY0F1i6UKOP9mk/olzbn1Svx2y9l2ixP1ePxnSGJm6xn75rmKDVFk5M13EPBJh65z2kzuy3fY/O3jEaI1W7BSsbCGR20MVjOmf9LhuiLeQ98Faa6SQ8Z7Q==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=vivo.com;
Received: from SEZPR06MB5269.apcprd06.prod.outlook.com (2603:1096:101:78::6)
 by PUZPR06MB5818.apcprd06.prod.outlook.com (2603:1096:301:f1::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6363.29; Sat, 6 May
 2023 14:43:11 +0000
Received: from SEZPR06MB5269.apcprd06.prod.outlook.com
 ([fe80::76d6:4828:7e80:2965]) by SEZPR06MB5269.apcprd06.prod.outlook.com
 ([fe80::76d6:4828:7e80:2965%7]) with mapi id 15.20.6363.029; Sat, 6 May 2023
 14:43:11 +0000
To: jaegeuk@kernel.org,
	chao@kernel.org
Date: Sat,  6 May 2023 22:42:57 +0800
Message-Id: <20230506144257.9611-2-frank.li@vivo.com>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20230506144257.9611-1-frank.li@vivo.com>
References: <20230506144257.9611-1-frank.li@vivo.com>
X-ClientProxiedBy: SI1PR02CA0058.apcprd02.prod.outlook.com
 (2603:1096:4:1f5::9) To SEZPR06MB5269.apcprd06.prod.outlook.com
 (2603:1096:101:78::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SEZPR06MB5269:EE_|PUZPR06MB5818:EE_
X-MS-Office365-Filtering-Correlation-Id: 1ef9b1c1-268b-4ce7-90db-08db4e403716
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: SPEGXC3cvuV/dwoYYMEROvgvnBJtstvMElx8U2mxXtg1ry4T7B7z30VKR4/+VKLio0wim9csHrOnpRKEza9vgOuMz2Hds1EsbxBEyiXAHv4BtoCcxArQ7TkKM4O125R85TteGMfo6edvzsbWFtMqEB3q/TCjkhYsE3a2MPL8gucjA7iQAkjzoOAQfbiRS3k5Meb1mfxtVn+SMXPXjrWF2Ww5RB3l0YfiZuIKmnKvUxtTAjHULZ7BiWSUqt4Uo7mYdvpFFXdAoz50qmc9zt7dFctBqqaBUgQDCCZuiG8Ot5dwbd24e24uaT0JzJnO4fEJNVBiN6mvlyhKR0iWzR8rsq2IZnuk0TgfbeEGv13stna7ZDVQdBhN0f8z+RJR20BpMMaZu1uZjC6Jpmwc3NRX9gZjP3mnHunZfBTiZsF9LCRmSOJdKxWfAh+wj4EJen8v+rWtT1ZbIZK0VzrVKdiuSL9SuthdvmDLI3AsiCnA5nftPLz4SVXP94ZHlztLM/NGAQxOUpC4VuuK1zSrpxqSy9U+BLu6YZY9zFgzs3cnmpwWtB8S6LPhL3o1ezCdnh0EdkhMI7F0kkkDMHgKImVZbM9a+OPdG0Ni3ddmqMACtdqmgUAA8IdGe7bXt5BXDJd3
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SEZPR06MB5269.apcprd06.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(4636009)(39860400002)(366004)(376002)(136003)(346002)(396003)(451199021)(8936002)(41300700001)(8676002)(5660300002)(2906002)(54906003)(66476007)(66946007)(66556008)(4326008)(316002)(478600001)(6486002)(52116002)(6666004)(83380400001)(6506007)(6512007)(1076003)(26005)(36756003)(86362001)(2616005)(186003)(38100700002)(38350700002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?K7A6gPUT0wrpTxGSiiVutqxu/Sj6Vjy5lHVsuybi/trTUwM+2c8eU8i2+Urs?=
 =?us-ascii?Q?sC4tVI2ZTeEeZ8yBYy/gFBSDRTiZd7qh1PVqDtCYHhpcmV6H/dUiAVDzPoiS?=
 =?us-ascii?Q?GNwjbgcJQhE2qPc3Bj3OKyMoTpykpTSxIno6fTgRHxaovwEtBtTEqMAXVQGp?=
 =?us-ascii?Q?m4QulQrvozxmS8+0tsgMoFr1i8prw5e19xo5d3K2YmnHzDRC7caOOCis1kFe?=
 =?us-ascii?Q?Ut8wBQP4nc4b5HgZI6ItADdrb8C8VzZNdKH++nhL/zC2zL6oc0ZOe8PGgBwA?=
 =?us-ascii?Q?Zwy0o2U91SDAZF4oRTOqjXvNQKWHS7hbwheEIZYpkYv/YJs4abm07L4wZhHV?=
 =?us-ascii?Q?bmmKI2Njee+tt1lHsoER97UHV4gLLpoVDUhqsDEBD40fqyCFnZuN4fRAqFmE?=
 =?us-ascii?Q?+JiShbTbgqPqktVmwN4xXEhMT7v5NhtO0RXlC26WGe4tuInG24EA+LNOQFkd?=
 =?us-ascii?Q?Ld+qsICyeFuvTGl05LeEfMNLaRRU+OX5hUSEl6L4uFLFJyFkWjNLEiJbH0D1?=
 =?us-ascii?Q?O6I7vm9z60qf3uoi7vUzmiG9IxIHzf/TZhcupNlh/KiL1tddO9v7mgUqtcyc?=
 =?us-ascii?Q?3X2wwUUs7jw9HuRxT4tMLUcLZjV1IzLqhhuI/PsVDps2ejK5m5UbtIg6yNYC?=
 =?us-ascii?Q?3RmbRjdEYXtIW3taeLCDFEXJITvrGwiGsg1o86LEqc3dqmAczGsDyFnOaNxR?=
 =?us-ascii?Q?GR9jMhbPY6aGKztudkFcTVamIek9nbBTRwlp+dYAQ/NFC99cYb1IQ/FtdhkW?=
 =?us-ascii?Q?iiZBiNCsoZbtIiqFVjQT/i3ag7ahAt37Ln/hMZYrQ7BYIXhNNeWRAikLlnLu?=
 =?us-ascii?Q?V4YH7BraUZ7t6htagkAcWvqisaoJ2twNcI3aDaH7zIGf5hGFC2+X/Sa4oL+f?=
 =?us-ascii?Q?FeomrIQ/y/YlPT0mkkuA0wlqCf3DPHtqhq3E6f8euhOKfNksrbLGsMbfDw+O?=
 =?us-ascii?Q?FSkdbCk4j16TPneG0+gapXimRvvtGXQHKdghSGE5kRyUVRv6BcKmDzhDKSu7?=
 =?us-ascii?Q?UnsxcuVejL31UOksF7FbfYuZTo4dompg0EIsxiItnU/kPwAMS1WB4Ct4kA3O?=
 =?us-ascii?Q?Sy2DRJXm60aV0q/248eJf+ak17uOa+9bdrDMcPS9HYx8NebQkBrRDWraUiq0?=
 =?us-ascii?Q?aOC0yOkThof2ksB7aw8ji2WObbVrh3kBYSTvnsdMLrFy5t7FsFqdfgakMLfS?=
 =?us-ascii?Q?NlO3Dkr37ej5x4RxqUo0Aqr1u4hSDHcO2875kKPIFILd4fU5R2qu+CRWy+gz?=
 =?us-ascii?Q?S0DFsgUifeY9NjL0vI8k8/e/N7yQG0H7O5VbqLEgaOphZKqovbx00FoT46D4?=
 =?us-ascii?Q?rYVIuJcn4z9GmZ1irMvFGbQmfy3SPp1dZxIy1vEuwCkYNqm1BLowfV7xPZmA?=
 =?us-ascii?Q?1D0MnzonQx9gkdeB+HmNoUrIti9vIQNqMBzxiyUVFbkpiyrpxb+xnlkK3YNL?=
 =?us-ascii?Q?UZzc2mCdaKK5PIxV05YL9f3QjRqwO+9W23RJK2yUsTdBPNarxtr3YzWbK+Mr?=
 =?us-ascii?Q?g0RPQQboKqeAxzztsiRS5jfQE8Rxvy8S2/0bVxSl+hlEVuWQEZjtcd+ln9p+?=
 =?us-ascii?Q?hdH6Vq3Yw+HjvSDgaP4ycwuysg8YkOzVIb+x+C9G?=
X-OriginatorOrg: vivo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1ef9b1c1-268b-4ce7-90db-08db4e403716
X-MS-Exchange-CrossTenant-AuthSource: SEZPR06MB5269.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 May 2023 14:43:11.3666 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 923e42dc-48d5-4cbe-b582-1a797a6412ed
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: EjKB1tBwy1Y4JyibvcTFKWNr32UDbFjbr85gkYI+anEYWXQlf6dLgxs2ZrI/KYy3Tr479qn91dblGl4eoJxFGA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PUZPR06MB5818
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  For judging the inode flag state,
 the inode lock must be held.
 Cc: Christophe JAILLET <christophe.jaillet@wanadoo.fr> Fixes: fcc85a4d86b5
 ("f2fs crypto: activate encryption support for fs APIs") Signed-off-by:
 Yangtao Li <frank.li@vivo.com> --- v2: -add unlock fs [...] 
 Content analysis details:   (-0.2 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [40.107.255.133 listed in wl.mailspike.net]
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
 no trust [40.107.255.133 listed in list.dnswl.org]
 -0.0 SPF_HELO_PASS          SPF: HELO matches SPF record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid -0.0 T_SCC_BODY_TEXT_LINE   No description available.
X-Headers-End: 1pvJ8A-00GMfh-D3
Subject: [f2fs-dev] [PATCH v2 2/2] f2fs: move the conditional statement
 after holding the inode lock in f2fs_fallocate()
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
Cc: Yangtao Li <frank.li@vivo.com>,
 Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
 linux-kernel@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

For judging the inode flag state, the inode lock must be held.

Cc: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Fixes: fcc85a4d86b5 ("f2fs crypto: activate encryption support for fs APIs")
Signed-off-by: Yangtao Li <frank.li@vivo.com>
---
v2:
-add unlock
 fs/f2fs/file.c | 22 +++++++++++++---------
 1 file changed, 13 insertions(+), 9 deletions(-)

diff --git a/fs/f2fs/file.c b/fs/f2fs/file.c
index 42a9b683118c..0dbbcb406d3f 100644
--- a/fs/f2fs/file.c
+++ b/fs/f2fs/file.c
@@ -1801,9 +1801,18 @@ static long f2fs_fallocate(struct file *file, int mode,
 	if (!S_ISREG(inode->i_mode))
 		return -EINVAL;
 
+	if (mode & ~(FALLOC_FL_KEEP_SIZE | FALLOC_FL_PUNCH_HOLE |
+			FALLOC_FL_COLLAPSE_RANGE | FALLOC_FL_ZERO_RANGE |
+			FALLOC_FL_INSERT_RANGE))
+		return -EOPNOTSUPP;
+
+	inode_lock(inode);
+
 	if (IS_ENCRYPTED(inode) &&
-		(mode & (FALLOC_FL_COLLAPSE_RANGE | FALLOC_FL_INSERT_RANGE)))
+		(mode & (FALLOC_FL_COLLAPSE_RANGE | FALLOC_FL_INSERT_RANGE))) {
+		inode_unlock(inode);
 		return -EOPNOTSUPP;
+	}
 
 	/*
 	 * Pinned file should not support partial truncation since the block
@@ -1811,15 +1820,10 @@ static long f2fs_fallocate(struct file *file, int mode,
 	 */
 	if ((f2fs_compressed_file(inode) || f2fs_is_pinned_file(inode)) &&
 		(mode & (FALLOC_FL_PUNCH_HOLE | FALLOC_FL_COLLAPSE_RANGE |
-			FALLOC_FL_ZERO_RANGE | FALLOC_FL_INSERT_RANGE)))
-		return -EOPNOTSUPP;
-
-	if (mode & ~(FALLOC_FL_KEEP_SIZE | FALLOC_FL_PUNCH_HOLE |
-			FALLOC_FL_COLLAPSE_RANGE | FALLOC_FL_ZERO_RANGE |
-			FALLOC_FL_INSERT_RANGE))
+			FALLOC_FL_ZERO_RANGE | FALLOC_FL_INSERT_RANGE))) {
+		inode_unlock(inode);
 		return -EOPNOTSUPP;
-
-	inode_lock(inode);
+	}
 
 	ret = file_modified(file);
 	if (ret)
-- 
2.39.0



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
