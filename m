Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id E0731969802
	for <lists+linux-f2fs-devel@lfdr.de>; Tue,  3 Sep 2024 10:57:03 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-3.v29.lw.sourceforge.com)
	by sfs-ml-3.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1slPLT-0007LN-9u;
	Tue, 03 Sep 2024 08:57:02 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-3.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <bo.wu@vivo.com>) id 1slPLO-0007L1-Ip
 for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 03 Sep 2024 08:56:58 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=MIME-Version:Content-Type:Content-Transfer-Encoding
 :References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=zV/wxBoWCpRDMX0E9pav3c5V0+kf6YRvt/E5k66a+Hw=; b=DQ4g9mkR3rLmnM7gsPNeZSvgld
 0YHCoT3muBE0S5y/6p6ZWVaK32eh+CCug2a1gUPntjvmLipE+thYJmR8EOlviVlNyGvANaC9dBw/A
 I8bd4kDtx/i1tkk/jkMeH1CaF/B3rDqKuSBUz4oAxRXCD4Sfx47BhwJ1LbI2SP5xvjKc=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=MIME-Version:Content-Type:Content-Transfer-Encoding:References:
 In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=zV/wxBoWCpRDMX0E9pav3c5V0+kf6YRvt/E5k66a+Hw=; b=bvroiQY+CTgIE7B9sVVqi3iU85
 G25ZRV9vyY2ePRrQEGMM1uz2cRjW/BnWNQrQYiqCe6EMB+ZOVo4LXr/NJdVgeoA76n2SpZkZzcv1y
 o2XNdA/InUraNUs3iJjn8LHS/X4xFdZ+tCP9JfUcfzOLS292sIiiDaF5xXfVk2V8mmPE=;
Received: from mail-psaapc01on2067.outbound.protection.outlook.com
 ([40.107.255.67] helo=APC01-PSA-obe.outbound.protection.outlook.com)
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1slPLK-0001ZA-VZ for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 03 Sep 2024 08:56:55 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=S3WLT1WbSB/ornFLzvioDvc4bwxx6GZdhYRl5EolU3likt/jogFLJswM8k28XSQJR/1BOsBO07OgAgzPtk5o21WKJJ7gwGqHsHvwREahvsF7UHjpKzo3Li/pQB2pjqRIg7RsZwYVaaybbIZno4yhw3lZsXPxGw1mHPIx4lskWi9azBNW6+M1Ks4wKOavs9spL3i0TlC2lNv/xEiyX10doVmpTvLKoWKOfSUwiT5FauEDk9bB/EPt17bd16LXp4XVApTD+I3rWLO1OJ/C5qgMYqzH/fUVEdPyfB/LwJfBi1XG68ewDOcNmb4w78j/KM7ayHHq9obRLLSpZaNQ3xP/Ng==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zV/wxBoWCpRDMX0E9pav3c5V0+kf6YRvt/E5k66a+Hw=;
 b=bd9liCJh6cjMOsRuh9W+DINAYboeG2eyCUIgBA0DLNqr2l6lNhIU5vLK82R3ickBm0SEDG6TeYlpo7DJp6BDAPb1tx3lhJfRlzYlovTRX0XejQUjZQrkWknnp4P8ofkg1FxDEmh5OQ/JFM/FC6tN3Jolt5rzFmu9HGt0z3o/RCAUY+TMD7pKcjJXXXm+L3WksBvmUR1Ocp/AhxSxR7f9ircABOlC53Y29XNz1Piny6dh6WnhMncGFbuFvskWbKWRpoB9F5cyROIFzEJyTc52/7iyrR+qOVSTE1vVBbbc3FoZwBCHLDedZSDDUZgQHFovHFfnwOippNPzZVG4u60u1A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vivo.com; dmarc=pass action=none header.from=vivo.com;
 dkim=pass header.d=vivo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vivo.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zV/wxBoWCpRDMX0E9pav3c5V0+kf6YRvt/E5k66a+Hw=;
 b=W1003AVsPhq4g8w7i+uqAmWXft+n5QFZEzMCSucozxtQhVujdBPn6kc1qvInDl8gm710Y3ptx6IzL4nao8xTxiVG6RJApN4ZuAn/M3WqBPfArz/OUI5kmULla/WbibDWfdz93uKL0Y5eoniuLn3vrdwuBvvJxlLE+fNAbzv0Uhikh4OM+bMDYXMNJP2n88BRU0TavIFAjPuHUUd/ZZirsVtQ65WuV3nVyp3g2G2Y9viPOvOADsi2E2/NSpvVuny0+Nr5a7PNkg8IRRrYBJQy4bm6BFQTvodkLkkXw6HflEeCkd+fZNB5na499t++WVfEiDh3sC17zrUVG57teic8Uw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=vivo.com;
Received: from PSAPR06MB4486.apcprd06.prod.outlook.com (2603:1096:301:89::11)
 by KL1PR0601MB5536.apcprd06.prod.outlook.com (2603:1096:820:bd::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7918.24; Tue, 3 Sep
 2024 08:40:50 +0000
Received: from PSAPR06MB4486.apcprd06.prod.outlook.com
 ([fe80::43cb:1332:afef:81e5]) by PSAPR06MB4486.apcprd06.prod.outlook.com
 ([fe80::43cb:1332:afef:81e5%6]) with mapi id 15.20.7918.024; Tue, 3 Sep 2024
 08:40:50 +0000
To: linux-kernel@vger.kernel.org
Date: Tue,  3 Sep 2024 02:54:48 -0600
Message-Id: <e010cbd19a2aadf8d152e43867b9bad98567624b.1725334811.git.bo.wu@vivo.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1725334811.git.bo.wu@vivo.com>
References: <cover.1725334811.git.bo.wu@vivo.com>
X-ClientProxiedBy: SI2PR02CA0008.apcprd02.prod.outlook.com
 (2603:1096:4:194::12) To PSAPR06MB4486.apcprd06.prod.outlook.com
 (2603:1096:301:89::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PSAPR06MB4486:EE_|KL1PR0601MB5536:EE_
X-MS-Office365-Filtering-Correlation-Id: 5aa681ee-5f54-4db0-eadf-08dccbf41d63
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|52116014|376014|1800799024|38350700014; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?jxtvMRSi3/2ZflBTNdlD3Vy6wqYGk04y5dFusvwau2evd1dvrQgNc1uuFoAz?=
 =?us-ascii?Q?+Wxp1Gu6MJJ5RaJEwVToMTUuN1I8j9WRQ1lRDrRDZ4X/72j8VT2ddQXAPsI9?=
 =?us-ascii?Q?2SZqZJcLrB1brDiBe9fV7nYQsCLv65t1btN1uhgC/dz2O7VNo998tZDBesxj?=
 =?us-ascii?Q?2SDQUlyXxfnQbVfmelcwLsIQ7UBzKjQiWkgzFAk+r7B6l2OL4F0btKHDE3Bk?=
 =?us-ascii?Q?2EvhlGlS1O+yIqiDC9FZ/EbV/DnxL+n3RWRJ7LHirc/LMrDZwpKdQWE/jPa9?=
 =?us-ascii?Q?ZlOcK3TLJgI6vRpk7Yeu9UBBLEgcT7eLs3YtB4TfCQLBrQI12LIVacly29QD?=
 =?us-ascii?Q?4YoqNDaqBgx61IvpkO+sRyLLP6KZzxnhUktSxZYLEBpE27FTStUAgJC0FC/c?=
 =?us-ascii?Q?c+h/+6scciLc3lM5mSS9THY/oGTOwrBaBfsBd3gWfY6xYnl7BqvUg0zmNcU3?=
 =?us-ascii?Q?eMvmMUgM1x6NB4IkJpdnEKkzVbFtP2Rdn9+SSWLgIjTZKzBk1EfUIboAJH39?=
 =?us-ascii?Q?W9B6a7XynBpZAAXKNHSQqTk7WdlhzE+R0jZzLqX98rAyl24iVIlpF+fu1KSd?=
 =?us-ascii?Q?crv5RC4hcPHDRgkkXGjtIJgE0LcJNp60TnbPqn9nmHw/40m3D/MbdioINqRp?=
 =?us-ascii?Q?QfFOaCdWZTnaxJ0sTLx88gVMI0+Y70Ah3Sa81u9AOP0kaK8J2tiVqZV9eWAF?=
 =?us-ascii?Q?IKvzMavpCLX02qobf0zDbZtbjNCyCjup1TKGgdNkiY/wD6EKGw179jsDRIyV?=
 =?us-ascii?Q?OB5lOXhR3plT0gcnWMvBcgYNgmc9ypPVqHRjpt8inF3seK2yEg1SMkE7OBVa?=
 =?us-ascii?Q?8FSS3PpFy8eZvRl0vgFCs6Eq2nmdZGWvX7gUTqcs/+7RGtxbnTsz77uo6Val?=
 =?us-ascii?Q?R+261kifL0wNN/e3UuIf9igaHHuDsMXxy4zG10qsqDPgUK5dCvBtSslVN9yc?=
 =?us-ascii?Q?4/4pJoXJdte0fb9mNUc6HHwLCoKc0tlMlQ9ifDzXhKabd1V0XPFClLBLXxjc?=
 =?us-ascii?Q?MmQ3+gwJAIuvtBrqqvGT9vstWMlyOf3WhzMwaz+VLK8l4WRV24D2CdQV16s2?=
 =?us-ascii?Q?3KMcnw5qf/J+N5ea4a+RXVbjRtjyXIz5mP64Vt7NKnN3mHU7DMYbSyan2R4v?=
 =?us-ascii?Q?k3v88RjM21Ez7i3dONkiFDu9Zvw0cHxGbAZhGk0snJmC5sMuyeMnz6gBhKFr?=
 =?us-ascii?Q?lFe6Y0UmXKsEvGLE9XYhq4m5wLQhMO8HrJlcUNSOWIuqg2ryGCV1qQo9uGfI?=
 =?us-ascii?Q?2MxzeRyX/rvfMf596W+whnON2dkss6YiuE35xwf9ZP9M/swHuRa8Wk6RILYw?=
 =?us-ascii?Q?K4PZt5QIST19eSInQUT8Q7LtE6fWeQbxSO3dsNHxUR0Jc42FfJPVJMFLUrz6?=
 =?us-ascii?Q?6mdaJdSaC/lQwLjizYNjs/5kqKMxvM/EKGowkpDpJTMqhaDJmg=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PSAPR06MB4486.apcprd06.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(52116014)(376014)(1800799024)(38350700014); DIR:OUT;
 SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?kuolJJfL+zlLFetG9L5amaCKVk3LgMm6C+KIFYeh2bgyaOLMx480YNVeAXxc?=
 =?us-ascii?Q?Db5pNEk8h+cGM4T4VnJySmkhTBQIFEehQmsXeJ2DGF4CiLpO1VDAn912bFbf?=
 =?us-ascii?Q?m9MWljJArytIFPSjc9ups6igUry4luRQc18aD88fmOtyVY1nEuv33dBrXiKr?=
 =?us-ascii?Q?UH8C4Dg4ZeXJuIN2RUxf2Wwphd6D0rXKlhSuPR3r7XPorhTBEhRipKZvQ0Hs?=
 =?us-ascii?Q?zoQlUTK+bkfsA1P0sqa2hFCt1g0mg5ZJ7dM+4zjPVIPh5sOe8cnnY/XDc7jN?=
 =?us-ascii?Q?TBhOOO1J/DddsgN3mxMqoDn0cZzLsvnuXRMpI0gXB3NYU47561zr9FmoeT+D?=
 =?us-ascii?Q?h6o+dXvieJ5/b9Nn3N79nK1ajFKWR53mP17lLMNagNB4MzD+heHnk4PSC30/?=
 =?us-ascii?Q?P/mnUwgqIV4H5NT39tbHTFLW7Imazgs4WhRdO4r7mz85ziAeHJN2BmOy6LMs?=
 =?us-ascii?Q?rUFEVwTZI72ioyYA2RsQz2hVvaP7b1rs10gxiF2nn57rkRKd/TfykemEE6CN?=
 =?us-ascii?Q?airIsVsEyvSJQc7n6+oLWVky+LAaVAc3p6tZ2k0kJRSJcpMcQ90mDeT4h0nl?=
 =?us-ascii?Q?FsBXmASsKvrDFbchCMfmuSlAJjZEMSkZ6D3r5PY5n1LWpitkn/msXu+ShDIc?=
 =?us-ascii?Q?UQ5SDjQjqvYNFQaxB4KC6v5iUw4oF2a5XD0zW3yxtScrvJrVnyDJzmD/1+ZD?=
 =?us-ascii?Q?jwMz2i9jJEvS4i7OqFd6PsFf4+vTHBmvipYiu5rZR5334UTnbuqD208h4dpF?=
 =?us-ascii?Q?eetRTDLuCyfoG048VJKqsEffaEYdqHEL56mGZ4uX3SQSG3gJqGqNDHgyy1Qi?=
 =?us-ascii?Q?Bf7Cm1wPs0cGpakLxpT6PNyPv2Ni+Uq9jqzLiWG40E+KMIZU7mZWlaqwaERw?=
 =?us-ascii?Q?jyIVXyNv7/OpJk2aMR4kOSCk33w5CUnawCJEnFJ272yFjmTPC/6l0gsVfA9w?=
 =?us-ascii?Q?gz9pgzFlGYmEPPoI+GOD3BO92123SNxW6d1uHYbyieY37LvwMh0x72rW8PWG?=
 =?us-ascii?Q?ea0Yc06Y4eAyGaHh3IbMN3lU5lG5tg7faB7PG7DS13BH/Qz9EhWFOIPhMEjC?=
 =?us-ascii?Q?+8SK6i8mpwYYZs+B53Uiqr3uPvQ5oMHEMnYdYBdDLkv7eoQytqNZRwue8Sj8?=
 =?us-ascii?Q?sOBVtvcC1hDy1ydNxGdjR0lVUFS+RJ16D5Rw4MEfWbFvku0TZStVb362bP5n?=
 =?us-ascii?Q?FDVWC5nB+y2e5gsX2hB+voewP4dE90P9ClGWl5Ynx0HAwr3JbcDdNvEGzuDb?=
 =?us-ascii?Q?EDiP9wPg7Ejfwo/tOd1QKImYMbXO6jhws4ZBBHIX+0wCetIsr7+UC9SSiqaJ?=
 =?us-ascii?Q?a8bQ/jvfiI8rkRE2+HBS/KYWiXc61WcKeBTvm4D9TeUlrGfBLeuMmPgNIygf?=
 =?us-ascii?Q?14Df41lmjQ0iS9RIoCdusrQNZuIO25ZY3rzUcgcqhc1evF7QYg0GrPs1z9rJ?=
 =?us-ascii?Q?vmvVMsRz5tmtc36X7pthy75ypqc6rN3Voef2GH9jWH2XljdG/Vap3hKBfxCl?=
 =?us-ascii?Q?PgHY2ZJ4evS2RQTltczMaMWo0x/ZSv8Hsf8Mhn15Z0E9H/A2goq9lqR4slL3?=
 =?us-ascii?Q?UGGiQnrSaFz9jVsPQi4mfEe00Yuij96cw/gLFPdH?=
X-OriginatorOrg: vivo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5aa681ee-5f54-4db0-eadf-08dccbf41d63
X-MS-Exchange-CrossTenant-AuthSource: PSAPR06MB4486.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Sep 2024 08:40:50.6561 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 923e42dc-48d5-4cbe-b582-1a797a6412ed
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: +z9U/wHB3saOYY+znAw42x3ITst/+riE/lFsifYUxyuNpAnGRcPffuuVfo+bxF+XVAJl9T3VqGMFDvCkPTsLZw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: KL1PR0601MB5536
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: Expand the inline data read & fiemap to support inline tail.
 Signed-off-by: Wu Bo <bo.wu@vivo.com> --- fs/f2fs/data.c | 31
 ++++++++++++++++++++++++++++++-
 fs/f2fs/inline.c | 26 ++++++++++++ 2 files changed, 42 insertions(+), 15
 deletions(-) 
 Content analysis details:   (-0.2 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [40.107.255.67 listed in wl.mailspike.net]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.0 SPF_HELO_PASS          SPF: HELO matches SPF record
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.0 T_SCC_BODY_TEXT_LINE   No description available.
X-Headers-End: 1slPLK-0001ZA-VZ
Subject: [f2fs-dev] [PATCH 04/13] f2fs: implement inline tail read & fiemap
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

Expand the inline data read & fiemap to support inline tail.

Signed-off-by: Wu Bo <bo.wu@vivo.com>
---
 fs/f2fs/data.c   | 31 ++++++++++++++++++++++++++++++-
 fs/f2fs/inline.c | 26 ++++++++++++--------------
 2 files changed, 42 insertions(+), 15 deletions(-)

diff --git a/fs/f2fs/data.c b/fs/f2fs/data.c
index cd13b5703228..476325a26d4e 100644
--- a/fs/f2fs/data.c
+++ b/fs/f2fs/data.c
@@ -1922,9 +1922,11 @@ int f2fs_fiemap(struct inode *inode, struct fiemap_extent_info *fieinfo,
 	u64 logical = 0, phys = 0, size = 0;
 	u32 flags = 0;
 	int ret = 0;
-	bool compr_cluster = false, compr_appended;
+	bool compr_cluster = false, compr_appended, inline_tail = false;
 	unsigned int cluster_size = F2FS_I(inode)->i_cluster_size;
 	unsigned int count_in_cluster = 0;
+	loff_t i_size = i_size_read(inode);
+	pgoff_t end_index = i_size >> PAGE_SHIFT;
 	loff_t maxbytes;
 
 	if (fieinfo->fi_flags & FIEMAP_FLAG_CACHE) {
@@ -1983,6 +1985,16 @@ int f2fs_fiemap(struct inode *inode, struct fiemap_extent_info *fieinfo,
 
 	/* HOLE */
 	if (!compr_cluster && !(map.m_flags & F2FS_MAP_FLAGS)) {
+		/*
+		 * There is a reserved space between address array and inline
+		 * data. So it must meet this hole state before inline data.
+		 */
+		if (f2fs_has_inline_tail(inode) && start_blk == end_index
+				&& f2fs_exist_data(inode)) {
+			inline_tail = true;
+			goto fill_extent;
+		}
+
 		start_blk = next_pgofs;
 
 		if (blks_to_bytes(inode, start_blk) < blks_to_bytes(inode,
@@ -2000,6 +2012,7 @@ int f2fs_fiemap(struct inode *inode, struct fiemap_extent_info *fieinfo,
 		goto skip_fill;
 	}
 
+fill_extent:
 	if (size) {
 		flags |= FIEMAP_EXTENT_MERGED;
 		if (IS_ENCRYPTED(inode))
@@ -2013,6 +2026,13 @@ int f2fs_fiemap(struct inode *inode, struct fiemap_extent_info *fieinfo,
 		size = 0;
 	}
 
+	if (inline_tail) {
+		start = blks_to_bytes(inode, start_blk);
+		ret = f2fs_inline_data_fiemap(inode, fieinfo, start, len);
+		if (ret != -EAGAIN)
+			goto out;
+	}
+
 	if (start_blk > last_blk)
 		goto out;
 
@@ -2377,6 +2397,8 @@ static int f2fs_mpage_readpages(struct inode *inode,
 #endif
 	unsigned nr_pages = rac ? readahead_count(rac) : 1;
 	unsigned max_nr_pages = nr_pages;
+	loff_t i_size = i_size_read(inode);
+	pgoff_t end_index = i_size >> PAGE_SHIFT;
 	pgoff_t index;
 	int ret = 0;
 
@@ -2397,6 +2419,12 @@ static int f2fs_mpage_readpages(struct inode *inode,
 
 		index = folio_index(folio);
 
+		if (f2fs_has_inline_tail(inode) && index == end_index &&
+				f2fs_exist_data(inode)) {
+			ret = f2fs_read_inline_data(inode, folio);
+			goto out;
+		}
+
 #ifdef CONFIG_F2FS_FS_COMPRESSION
 		if (!f2fs_compressed_file(inode))
 			goto read_single_page;
@@ -2462,6 +2490,7 @@ static int f2fs_mpage_readpages(struct inode *inode,
 		}
 #endif
 	}
+out:
 	if (bio)
 		f2fs_submit_read_bio(F2FS_I_SB(inode), bio, DATA);
 	return ret;
diff --git a/fs/f2fs/inline.c b/fs/f2fs/inline.c
index 2e63e9389fd7..30b18053e784 100644
--- a/fs/f2fs/inline.c
+++ b/fs/f2fs/inline.c
@@ -86,8 +86,6 @@ void f2fs_do_read_inline_data(struct folio *folio, struct page *ipage)
 	if (folio_test_uptodate(folio))
 		return;
 
-	f2fs_bug_on(F2FS_I_SB(inode), folio_index(folio));
-
 	folio_zero_segment(folio, MAX_INLINE_DATA(inode), folio_size(folio));
 
 	/* Copy the whole inline data block */
@@ -126,15 +124,12 @@ int f2fs_read_inline_data(struct inode *inode, struct folio *folio)
 		return PTR_ERR(ipage);
 	}
 
-	if (!f2fs_has_inline_data(inode)) {
+	if (!f2fs_has_inline_data(inode) && !f2fs_has_inline_tail(inode)) {
 		f2fs_put_page(ipage, 1);
 		return -EAGAIN;
 	}
 
-	if (folio_index(folio))
-		folio_zero_segment(folio, 0, folio_size(folio));
-	else
-		f2fs_do_read_inline_data(folio, ipage);
+	f2fs_do_read_inline_data(folio, ipage);
 
 	if (!folio_test_uptodate(folio))
 		folio_mark_uptodate(folio);
@@ -814,7 +809,7 @@ int f2fs_read_inline_dir(struct file *file, struct dir_context *ctx,
 int f2fs_inline_data_fiemap(struct inode *inode,
 		struct fiemap_extent_info *fieinfo, __u64 start, __u64 len)
 {
-	__u64 byteaddr, ilen;
+	__u64 byteaddr, ilen, offset;
 	__u32 flags = FIEMAP_EXTENT_DATA_INLINE | FIEMAP_EXTENT_NOT_ALIGNED |
 		FIEMAP_EXTENT_LAST;
 	struct node_info ni;
@@ -826,7 +821,8 @@ int f2fs_inline_data_fiemap(struct inode *inode,
 		return PTR_ERR(ipage);
 
 	if ((S_ISREG(inode->i_mode) || S_ISLNK(inode->i_mode)) &&
-				!f2fs_has_inline_data(inode)) {
+				!f2fs_has_inline_data(inode) &&
+				!f2fs_has_inline_tail(inode)) {
 		err = -EAGAIN;
 		goto out;
 	}
@@ -836,12 +832,14 @@ int f2fs_inline_data_fiemap(struct inode *inode,
 		goto out;
 	}
 
-	ilen = min_t(size_t, MAX_INLINE_DATA(inode), i_size_read(inode));
-	if (start >= ilen)
+	ilen = min_t(size_t, MAX_INLINE_DATA(inode),
+			i_size_read(inode) & (PAGE_SIZE - 1));
+	offset = start & (PAGE_SIZE - 1);
+	if (offset >= ilen)
 		goto out;
-	if (start + len < ilen)
-		ilen = start + len;
-	ilen -= start;
+	if (offset + len < ilen)
+		ilen = offset + len;
+	ilen -= offset;
 
 	err = f2fs_get_node_info(F2FS_I_SB(inode), inode->i_ino, &ni, false);
 	if (err)
-- 
2.35.3



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
