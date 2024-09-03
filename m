Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 6828A9697F6
	for <lists+linux-f2fs-devel@lfdr.de>; Tue,  3 Sep 2024 10:56:40 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1slPL3-0001A9-O3;
	Tue, 03 Sep 2024 08:56:37 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <bo.wu@vivo.com>) id 1slPKv-00019Q-Rk
 for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 03 Sep 2024 08:56:29 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=MIME-Version:Content-Type:Content-Transfer-Encoding
 :References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=789fi2cjANDVURtNHSKg2uT0fvFJ1Bmx9d+l7fPmobM=; b=fIr3X/X3WN82YT1uK8xSAiie8u
 kEBjc0ly/kF5Inxz1qs2Sdn+LNyWobxGM3Jydrr/6XDFd4zFOG02JsQAy0HbT/XBYdjVfcUdJgjh2
 iGIdHORVixNjHJ0FJungYgazCw2sTYSkwjd1Gz4kTZCFzV5zS/IYrUR41Op5IGfboSXs=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=MIME-Version:Content-Type:Content-Transfer-Encoding:References:
 In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=789fi2cjANDVURtNHSKg2uT0fvFJ1Bmx9d+l7fPmobM=; b=Z2Y1Dc811NnW4TI+vP/SQkOhBU
 G0H48tIFbel/04Sb4DeW1u3p/w7PMwoCd8JSDFgk4LYvFCkRKl68mQrRWTjQGwmpSooJkBbkYmGKD
 C/tU4uQC5w8cB0KI6HNZm2wlopDFHYfZ/ZIFo1tZ6YTX6MIJveCoJAKRSqRh8PJiO2AE=;
Received: from mail-sgaapc01on2064.outbound.protection.outlook.com
 ([40.107.215.64] helo=APC01-SG2-obe.outbound.protection.outlook.com)
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1slPKv-0001Uz-42 for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 03 Sep 2024 08:56:29 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=YaTbhq5i3xtJqMgf9C8/qdTb/vC4Hn528HaMDgTFW7TtuZU1xgmNY1I7W+Fza0BelkjBlzwZvn+8qVva8O8OIQhM4otxNNrqgId7kwMhJWb6zZpsReGD7ZBgXi/Jpcs3RlmdFno62TrohBkYx6vPf4CNjSLtMQbDV7aKc3v1DmPyHcUNHOGpLHEUe1AC87rXP4YiPp5GYZjtC9FvrHQJLyiF1TBjrOY6cg8wRrUqActltdkYQ+ZGCCak32yllymXnKL1leakZmTCh4c7y8B/3sEg1OPTesGVx4HsAs1SkcopaUQGdqnz4EmKY+5bnwgzbCClc4/tEVFycVJokxD/OQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=789fi2cjANDVURtNHSKg2uT0fvFJ1Bmx9d+l7fPmobM=;
 b=MlqQtEQ7j7MHPoDnvLD7kVdEPGWJ3QVHqAleoSmrrruMGhFSZ0gYU148AzBqz+CmQJzbKKSJ6y9clbOJ3YJd+V55ehAHL2iDb0YzESTh6e3boCkqDzVS9tfYrq7qkU2S4+Ylbb+Gm6anWJYLFJJAcHGav+ZQQBcVAdRnI+F+TWSghtcxwdGkvYsiehUxDbvBYSQrh7SfMOx5MKI76z9yFbQYo5WFRAAlzRM/05A3m1LnojYPkpbwhcz6oUgP/VNMFFy++iDVLodKAXT4fOELe9Ui/i2Xc1rfFRbLbp1Z2EYiYhZDHJnd7lhZaK+fs30i9rJ+Cogjoh35M6znEO6UCg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vivo.com; dmarc=pass action=none header.from=vivo.com;
 dkim=pass header.d=vivo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vivo.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=789fi2cjANDVURtNHSKg2uT0fvFJ1Bmx9d+l7fPmobM=;
 b=WewX4qOdRSnb5QLSz05o1J7F/Qwjh/4M5lGrN6UjIHuDAnwvhp1odZLw1/j2WD3J2MH1FB1QchIc5bj88AKY1MLVBzf0Hv+2rCsBpyEBSw7lwaL88UvakD6SQJ+bPLbcu/f1LRqA7yFoOBM+vpzGwFP9aK9iy3OZmWiBMrczEfnaf14KOqWet9cqC7o6JdfnFCVNTg8vc1kz8qAtzZNglVySV0t/brb9bSD0GliMmle+0e1vbTzx1UniIuHQq7OR8RHe+aXinzQ5aFyV4f638gGPYoyEGA/5r1FIwHAWeDopMfcP9NTMNe0ZG80slrPGNgdn9qT9wVodWGYgNd3TXA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=vivo.com;
Received: from PSAPR06MB4486.apcprd06.prod.outlook.com (2603:1096:301:89::11)
 by KL1PR0601MB5536.apcprd06.prod.outlook.com (2603:1096:820:bd::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7918.24; Tue, 3 Sep
 2024 08:40:46 +0000
Received: from PSAPR06MB4486.apcprd06.prod.outlook.com
 ([fe80::43cb:1332:afef:81e5]) by PSAPR06MB4486.apcprd06.prod.outlook.com
 ([fe80::43cb:1332:afef:81e5%6]) with mapi id 15.20.7918.024; Tue, 3 Sep 2024
 08:40:46 +0000
To: linux-kernel@vger.kernel.org
Date: Tue,  3 Sep 2024 02:54:45 -0600
Message-Id: <c25172e16dead5d956b0ad43201ca17a7553344e.1725334811.git.bo.wu@vivo.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1725334811.git.bo.wu@vivo.com>
References: <cover.1725334811.git.bo.wu@vivo.com>
X-ClientProxiedBy: SI2PR02CA0008.apcprd02.prod.outlook.com
 (2603:1096:4:194::12) To PSAPR06MB4486.apcprd06.prod.outlook.com
 (2603:1096:301:89::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PSAPR06MB4486:EE_|KL1PR0601MB5536:EE_
X-MS-Office365-Filtering-Correlation-Id: c70d39a8-6e71-46b9-e93a-08dccbf41ad6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|52116014|376014|1800799024|38350700014; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?bWBE0kUhf+9e/UevVquHW6mKy+EGI1G72ekas64zTtjE5XJIMmkTuR2hXhlx?=
 =?us-ascii?Q?Ks/UNCiXeEo0/EKJILJiSmwCvIHA9lVj3/Xo30neIzxmJRxIXUp77qD3ZdSn?=
 =?us-ascii?Q?71ehzj3+lLSOC/cfpZCngs3qQVDX+U9E1Q59e5+bsvBlblzDaI1JwIJ32rIy?=
 =?us-ascii?Q?C1lahKaJIyB6tApjPA2JpUdbvqqvGwdnbVWVKgqPJ5b1miL2wjRtgUg+0VLC?=
 =?us-ascii?Q?v3QVlnTpfU58sNwb9g9Oy4KDc6U7rWXnE0n/VCJuFAwqxP0k0oT+wTcCg7tp?=
 =?us-ascii?Q?qbSNCOy8x8Jrp6lBdeWQUwF/RjUdypvYEFzWWDzeXat+QRUheE3D4DHqsaRz?=
 =?us-ascii?Q?bl4aRudEo7jwzonF/TQbTdxGm1rJmbwLv1rrbyW2c0+wjE7aL4ULSvqyVS5Z?=
 =?us-ascii?Q?Typ7GZ2YIRkdKNzJn41sD+YE95NkwF7P9YOnYJnlQhtUz0h5pkCpL/MLDVVd?=
 =?us-ascii?Q?WJsipA2U6WaNA8G43MNb/uv1+GI1qPgLSepdFCSm2LWyAsoUrHcA3Jea3cr7?=
 =?us-ascii?Q?KeNrz4I5rcg1eHvAVyDzx9+oznaY3n/t5OLPOYdipsk5Xl7F++Lpu6mqwrsV?=
 =?us-ascii?Q?CSLaEtTqQdDkExyUwa9g5+Vb85X4ljHKX/WkrZUYoTvQ5a22HYiyXnYzLWtO?=
 =?us-ascii?Q?XDiTHv7HEmHxINKiEjoyeNJs11+s7ySAFkpeUFG5cYfhL+v0wKUcjlekuNuy?=
 =?us-ascii?Q?qcSnxFU1wT0gmMJVXjEmUJZOxVoTt6jKFZUN02op+6o1t792MiYrTPhZXIvU?=
 =?us-ascii?Q?bmmlmqe+6DcKWn9nf434Qrm9W1Sh8SG6Lp5J2Dqnvo2ifxqYjN/m9PMDrkIh?=
 =?us-ascii?Q?glyKQe8azWA1lGvI+oSmA0YaHm8xpkQAM9k/h2SVIqImZnn3By6s8njf8vtv?=
 =?us-ascii?Q?Mse86G4hywAhoDJsv/AEmmsw0HN+vw+ZYfjZy6ZSJ4C9LErVsDpvIAFX57iP?=
 =?us-ascii?Q?GMAR4rfMOc96wrg5K9T01ZpChmOQ1sA+8Xo18erGbIop4yNCfvjAupff0s5o?=
 =?us-ascii?Q?E99RgVecUV07ZkanD2lzqh5n8IOpRyrTY47//hCStjwjRfzWuf87hhIJYo8W?=
 =?us-ascii?Q?nFwXo5+IxZtfJyCRyNZcW4iZ4DwQVcP0nD3R84L2Oqqiml4+0WJlUXwc1Xe1?=
 =?us-ascii?Q?4sfCUyPTmh1f8xxWdfcGxTaRJA9XO1VOuwADeo0qKC1CcrYFGUfv1qPyJ+Ed?=
 =?us-ascii?Q?OxuqNq1I9Q6xI/WsSHdMyZpD2kSD/5ooNKYoydC1rTWlvH3Lp6UgDXF5uRmQ?=
 =?us-ascii?Q?whts4xCpu1r2UBdeL0Oj2ZAvdldSU/Hz2te5RI+U/Yndom4rUdzvDGWS7HDZ?=
 =?us-ascii?Q?47+6QANWDDbqPXpGuJjdtArzzPyZsTkuct7WHHzbabsAMJ8xlie/NLhzKhQl?=
 =?us-ascii?Q?v/JN7RaqB974xKyv0nJDE1qE6bzSoGJPaQ9mlO6mCPm3I+Vz3g=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PSAPR06MB4486.apcprd06.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(52116014)(376014)(1800799024)(38350700014); DIR:OUT;
 SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?vIOmbTNxLUIKDjxfM0jiJ63skSLME2TCKre5tDlCaB3LcycUcCFk+WU4I+/O?=
 =?us-ascii?Q?1WM2eFXsVk6kQEa/fsQwWcQMGl1ElPWTBcXaG906pe9P6Hu1wnaJg/qY5U63?=
 =?us-ascii?Q?TWHRoZhVDCV6tF4KspecYVHJ/cXmGAY4iM1o/xIBI3t0b7pXrfZfByACxLEQ?=
 =?us-ascii?Q?wsqKXCW9FIFDCxmFx4qROMgxtn4MBbdVdZxiObiyV51T18LytwGPYv0EpDjR?=
 =?us-ascii?Q?mwQ0k6UxmovU24DppFOfizYYTTXQFvKK7j1E6bV1CMWrhIC/g64Q9VkOclaU?=
 =?us-ascii?Q?L1S+sTq2XqEGZF3Ez+BLvyZoNRh0ZgrL9Tz2I1pkb+/UFh37qvntmxjr6rDW?=
 =?us-ascii?Q?6aQ6DCyUJvzJycXftAqBOfSo82WCJlx/UGv2+t9dDDBKUGMIrxFrqMw8kk1x?=
 =?us-ascii?Q?RgYy1ZtLTkKby2BkqX1Uj0enzUsCZg1svO4ySHssbxI3Y1Fx67GxObdPSUyw?=
 =?us-ascii?Q?ywy5ObywXI2CXjK/L0youBlw94KF5SQP00HgE2EHfv0YlowhYByZXb18tQhh?=
 =?us-ascii?Q?xyiM3esPsNIFsaB6Vt8gjFwkm5wQL5X50PgP3DDYNcuQFESvI91OEOWpIu7E?=
 =?us-ascii?Q?XeAerRcKy8mDvyxImvLe6g+I7TpPjaEJC6l6s+nEP0uqDzoANf9xRbAWx4Jt?=
 =?us-ascii?Q?sT9jSMJE1A+LjSEQGv4DUIDHCm2q3BJJcMSc+RarNiMJ5kDB1W7x/n+XwhQJ?=
 =?us-ascii?Q?y9tthUf4kgH/D1r+iUPZonn/dwC3Px2ClqCQs0ngzi3b/yTGZHRpT1k7l1iC?=
 =?us-ascii?Q?UPLJNnQikyLWNtlWhenRIBXU+L48cSW++MWZZQDL76sDwZZlPIqXAOtwTQSL?=
 =?us-ascii?Q?GUDhyeWWZcUkfPEmKHFjepxF3Q/IsDlJL4J/Hyn5YziwvklTHXwh2tIOAYNB?=
 =?us-ascii?Q?1i+1T7FqN1EBe5XBsEAcEG7/eTzbgsyEhEQSYvIGLEGAjtodpP1gsFu9EUFT?=
 =?us-ascii?Q?jHZkk/ZbBaNvG3zVmVhNAoVd9R+/N1OG/X9yXyCCoC7aIJ0Fk8HVdnjhOuiA?=
 =?us-ascii?Q?ToKW1ZyG+8J9fO671x88ZtqoZpv715+yODJ4efmXtxDt9G/npfuZ7djyJooq?=
 =?us-ascii?Q?tv6cxAwM5otgczcBUVZCWdMGXjnwYcf7xsIShuF+ovFW+sEuODZLWzOiMgJt?=
 =?us-ascii?Q?RWldROlfEjZhC6qQwMPCsKOz53HKIT6qfBBgscNbNGWrlb3dtSmC07o7idhd?=
 =?us-ascii?Q?JobZ/j3CTJ/7au8M3K+oIFRHqYwJ3bDIus1fzCRtvEgFzLC76Bc8lAOlADKz?=
 =?us-ascii?Q?fyn3UPV/1siHg1vfXNP5dmxDCQUAfk2h87WZES2rJpYlfF4N7atEYR7c7zQt?=
 =?us-ascii?Q?cdXNTSy5G5C5ubtwouUoOK9BTPEvJiFjcvMygh85oZzlEMXW3hOLP2lacj+O?=
 =?us-ascii?Q?HuFjG9azaipDs8Eg2jA+fOE5BbkEp5XzfrWuqRD11nSOAhf8UZMUxYHeNiXI?=
 =?us-ascii?Q?4M3g+gBho3K0IDLdxsrWWwZ5g7XhQ0q7Rn0KuI6B9LZFiHqth3oXd3hlFieL?=
 =?us-ascii?Q?2oZrXrw+zUs3EurVFNGFFt3sSTQfHZw/pNm47w3pCBC36o7gu/I4w3g3Xlpe?=
 =?us-ascii?Q?xGHq697Fx9brJDXIalMDNdwaa04v+57B6YEZysn1?=
X-OriginatorOrg: vivo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c70d39a8-6e71-46b9-e93a-08dccbf41ad6
X-MS-Exchange-CrossTenant-AuthSource: PSAPR06MB4486.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Sep 2024 08:40:46.4027 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 923e42dc-48d5-4cbe-b582-1a797a6412ed
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 3Mo7xzBAP/KjcWAvfiTqwf3KmS88Nts0d6UC9SeThksik2TMPTPcvQPq+E4AsV+/xqV3ebU7/ttoTv+uexghCA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: KL1PR0601MB5536
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  Same as inline data, use mount option to control inline tail
 enable or disable. And enable inline tail as default. Signed-off-by: Wu Bo
 <bo.wu@vivo.com> --- fs/f2fs/f2fs.h | 1 + fs/f2fs/super.c | 15 +++++++++++++++
 2 files changed, 16 insertions(+) 
 Content analysis details:   (-0.2 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.0 SPF_HELO_PASS          SPF: HELO matches SPF record
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [40.107.215.64 listed in wl.mailspike.net]
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.0 T_SCC_BODY_TEXT_LINE   No description available.
X-Headers-End: 1slPKv-0001Uz-42
Subject: [f2fs-dev] [PATCH 01/13] f2fs: add inline tail mount option
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

Same as inline data, use mount option to control inline tail enable or
disable. And enable inline tail as default.

Signed-off-by: Wu Bo <bo.wu@vivo.com>
---
 fs/f2fs/f2fs.h  |  1 +
 fs/f2fs/super.c | 15 +++++++++++++++
 2 files changed, 16 insertions(+)

diff --git a/fs/f2fs/f2fs.h b/fs/f2fs/f2fs.h
index ac19c61f0c3e..3956740ca7e2 100644
--- a/fs/f2fs/f2fs.h
+++ b/fs/f2fs/f2fs.h
@@ -116,6 +116,7 @@ extern const char *f2fs_fault_name[FAULT_MAX];
 #define	F2FS_MOUNT_GC_MERGE		0x02000000
 #define F2FS_MOUNT_COMPRESS_CACHE	0x04000000
 #define F2FS_MOUNT_AGE_EXTENT_CACHE	0x08000000
+#define F2FS_MOUNT_INLINE_TAIL		0x10000000
 
 #define F2FS_OPTION(sbi)	((sbi)->mount_opt)
 #define clear_opt(sbi, option)	(F2FS_OPTION(sbi).opt &= ~F2FS_MOUNT_##option)
diff --git a/fs/f2fs/super.c b/fs/f2fs/super.c
index 3959fd137cc9..d4ec32ba6cad 100644
--- a/fs/f2fs/super.c
+++ b/fs/f2fs/super.c
@@ -136,6 +136,7 @@ enum {
 	Opt_inline_data,
 	Opt_inline_dentry,
 	Opt_noinline_dentry,
+	Opt_inline_tail,
 	Opt_flush_merge,
 	Opt_noflush_merge,
 	Opt_barrier,
@@ -144,6 +145,7 @@ enum {
 	Opt_extent_cache,
 	Opt_noextent_cache,
 	Opt_noinline_data,
+	Opt_noinline_tail,
 	Opt_data_flush,
 	Opt_reserve_root,
 	Opt_resgid,
@@ -212,6 +214,7 @@ static match_table_t f2fs_tokens = {
 	{Opt_inline_data, "inline_data"},
 	{Opt_inline_dentry, "inline_dentry"},
 	{Opt_noinline_dentry, "noinline_dentry"},
+	{Opt_inline_tail, "inline_tail"},
 	{Opt_flush_merge, "flush_merge"},
 	{Opt_noflush_merge, "noflush_merge"},
 	{Opt_barrier, "barrier"},
@@ -220,6 +223,7 @@ static match_table_t f2fs_tokens = {
 	{Opt_extent_cache, "extent_cache"},
 	{Opt_noextent_cache, "noextent_cache"},
 	{Opt_noinline_data, "noinline_data"},
+	{Opt_noinline_tail, "noinline_tail"},
 	{Opt_data_flush, "data_flush"},
 	{Opt_reserve_root, "reserve_root=%u"},
 	{Opt_resgid, "resgid=%u"},
@@ -811,6 +815,9 @@ static int parse_options(struct super_block *sb, char *options, bool is_remount)
 		case Opt_noinline_dentry:
 			clear_opt(sbi, INLINE_DENTRY);
 			break;
+		case Opt_inline_tail:
+			set_opt(sbi, INLINE_TAIL);
+			break;
 		case Opt_flush_merge:
 			set_opt(sbi, FLUSH_MERGE);
 			break;
@@ -835,6 +842,9 @@ static int parse_options(struct super_block *sb, char *options, bool is_remount)
 		case Opt_noinline_data:
 			clear_opt(sbi, INLINE_DATA);
 			break;
+		case Opt_noinline_tail:
+			clear_opt(sbi, INLINE_DATA);
+			break;
 		case Opt_data_flush:
 			set_opt(sbi, DATA_FLUSH);
 			break;
@@ -1989,6 +1999,10 @@ static int f2fs_show_options(struct seq_file *seq, struct dentry *root)
 		seq_puts(seq, ",inline_data");
 	else
 		seq_puts(seq, ",noinline_data");
+	if (test_opt(sbi, INLINE_TAIL))
+		seq_puts(seq, ",inline_tail");
+	else
+		seq_puts(seq, ",noinline_tail");
 	if (test_opt(sbi, INLINE_DENTRY))
 		seq_puts(seq, ",inline_dentry");
 	else
@@ -2138,6 +2152,7 @@ static void default_options(struct f2fs_sb_info *sbi, bool remount)
 	set_opt(sbi, INLINE_XATTR);
 	set_opt(sbi, INLINE_DATA);
 	set_opt(sbi, INLINE_DENTRY);
+	set_opt(sbi, INLINE_TAIL);
 	set_opt(sbi, MERGE_CHECKPOINT);
 	F2FS_OPTION(sbi).unusable_cap = 0;
 	sbi->sb->s_flags |= SB_LAZYTIME;
-- 
2.35.3



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
