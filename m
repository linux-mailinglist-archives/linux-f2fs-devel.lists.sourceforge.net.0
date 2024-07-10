Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 5929B92C7DA
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 10 Jul 2024 03:19:35 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-3.v29.lw.sourceforge.com)
	by sfs-ml-3.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1sRLzQ-00035F-CX;
	Wed, 10 Jul 2024 01:19:23 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-3.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <bo.wu@vivo.com>) id 1sRLzO-000358-8V
 for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 10 Jul 2024 01:19:21 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=MIME-Version:Content-Type:Content-Transfer-Encoding
 :References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=8AKRQcvo5J4iDqXd1yESKVO4LUEpAwanjBrOyPziXNM=; b=Qp5a/53uwysxx2i0tbkspP9fxr
 2mpe9Pqt8B8qnZcy2GWCNB1R8VuUb+UIgIXctaiVs5OX0ktq2MWIPWRA0u8y9aM3poU6w1CuqXarA
 NvYPk+GIcSpfN/Xaq+bM5ftCTZDR2rLgFks+JCNw7YHpU3Ntp8vA3pvlCgcGsc1qnEjs=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=MIME-Version:Content-Type:Content-Transfer-Encoding:References:
 In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=8AKRQcvo5J4iDqXd1yESKVO4LUEpAwanjBrOyPziXNM=; b=PYXRI9ETMz5b8rv7bVAYS2VAY9
 CWFtnd28BxiwvMjp8ZVB17DL5Nb0UBsleH2ZRy9CKDQlWAlwUSlBa/dPLu0qX0wwwHWMWDjn5gEtV
 Q9B5oQhsQnrMAsr6+7b55p9ryCCvCnSH0/bmHxAAwl9vO8Lk4MJ0TigIkm9Zd1X3ceGg=;
Received: from mail-tyzapc01on2079.outbound.protection.outlook.com
 ([40.107.117.79] helo=APC01-TYZ-obe.outbound.protection.outlook.com)
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1sRLzN-0004qO-JZ for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 10 Jul 2024 01:19:21 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Fs92WSpC7V30ml0IohReshDJ/DnAm+7OnSELJA1SfsVDOiquw+q4TlpApsq9I7hiv8+lia2bIXsya0ndpOHirlBnmm/pLV8XaQLK0L2zq7ONfTD1HAzXhD6eJUUffBJfQTpR5XqwMbgBtqnkMeXDIFCCadOGrsMID69Ynq7EaHPJV3Lp4VetNANFAsUKBOe46k/AIY3V4h930Lj56seTbtSAD3czeuDwlDtsyUoiwspTgKHpllvNRFhGXHgtbyTuXas0n/cDn75J3mRhHS9MEoeJML+hOCjizZT7h+j3felfAuhnihhSY2eV9I3qFAtGykOp+PO7MQvQrnPUxbseGQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8AKRQcvo5J4iDqXd1yESKVO4LUEpAwanjBrOyPziXNM=;
 b=Pqbni5IwPDV5iLsFDeoMDS5FiN2Y40vFVuOip/2JYkH5w0Y2bUFrYxi8ZWYLwZyWESrTMcDwGwWp4/hntdwtcyFj9RnfPl38v/Fpg+AFW9VNjMddM54mLjfkp7QuDHWpFN07/kuTteX353wLLGto5bNwHh894xlaQVRN8r1FIfwo4puK22DFnOKLcAFNF/P8DhsBAavErW8na8nsQwbqU1ELESBYY0h8c6YPjq37JanQhSJSsBPfYruSOAaw4wRzi4W+CipKfCuESw/YTErlglol0gG3beFbp6ZHJafTf1T5yajstxFd6q3TluJOVG8DNnuUagWYrrL1cZ4cZ73ExQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vivo.com; dmarc=pass action=none header.from=vivo.com;
 dkim=pass header.d=vivo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vivo.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8AKRQcvo5J4iDqXd1yESKVO4LUEpAwanjBrOyPziXNM=;
 b=KbxRgJxvqGCc5Q+tX2yg7L8NETo7ou7AQxGsKUoxtlodDJY2Xzdgik0UtHd95vw+Y5foX4cEdcU6RzXt7WSvfV0oXUxqfwtHbVBova3g6X7FkfBqpTQziq/sdBCA3pgtTKcaL9MG1+Kd5MRy9Nb5jEfwPYXnB35viXA+5KAc7ewZigApwyTpmkKVIMXBebK2RVX/HZMg7P5JZHrKA87MPoqPeg/3UZpAh6pVgls4Ms3wqeVhRslWNuBUhobOahdiLF8zQHefBJOjN0jHTya4f3nKduBXvfsObLzQ6SjECgJ8og3pjfFhZY6iauzkEXEjTUqUhmwr0yX218ElPSKn9w==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=vivo.com;
Received: from PSAPR06MB4486.apcprd06.prod.outlook.com (2603:1096:301:89::11)
 by JH0PR06MB6889.apcprd06.prod.outlook.com (2603:1096:990:46::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7741.35; Wed, 10 Jul
 2024 01:19:18 +0000
Received: from PSAPR06MB4486.apcprd06.prod.outlook.com
 ([fe80::43cb:1332:afef:81e5]) by PSAPR06MB4486.apcprd06.prod.outlook.com
 ([fe80::43cb:1332:afef:81e5%5]) with mapi id 15.20.7741.033; Wed, 10 Jul 2024
 01:19:18 +0000
To: Jaegeuk Kim <jaegeuk@kernel.org>,
	Chao Yu <chao@kernel.org>
Date: Tue,  9 Jul 2024 19:33:04 -0600
Message-Id: <24fd8ff68cec7e8bfa1f6d3a676425044e21acb2.1720515215.git.bo.wu@vivo.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1720515215.git.bo.wu@vivo.com>
References: <cover.1720515215.git.bo.wu@vivo.com>
X-ClientProxiedBy: SI2PR01CA0030.apcprd01.prod.exchangelabs.com
 (2603:1096:4:192::15) To PSAPR06MB4486.apcprd06.prod.outlook.com
 (2603:1096:301:89::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PSAPR06MB4486:EE_|JH0PR06MB6889:EE_
X-MS-Office365-Filtering-Correlation-Id: bc23e70a-bd73-42d9-4fd9-08dca07e5206
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|52116014|366016|1800799024|38350700014; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?nDxQlQzz9OkFOc7YUcvFyDJrWPoI8iNnrWry4IHvAtEyfHGW0FtzFBPDVyuJ?=
 =?us-ascii?Q?EFxLK4/KzRTvtH648Z/1c6DvbKZq6E6SIwa5/wO1vtGv57UcG9tK8Fq8hNI2?=
 =?us-ascii?Q?376fb6I2ZXqVtjqpdAyBwNOX73KBF3L25gqTpz1v2Eyp4swh/A6dA5XnUP1K?=
 =?us-ascii?Q?a1j0raNV5vyhWbD04ZDmwxhP9Tq990dK5e+gFggmAI3LFnxwZLbdJ616rDHD?=
 =?us-ascii?Q?mR0ndrGxc0sKZByMwqF1wAgpp8ga0BnpFm+LwJprSaq5HntcoNW62hhfSL+h?=
 =?us-ascii?Q?Iczfg0CXipUmQASISHdnidUp1Db3J/uxw3hhF7zy2rKxfmWTPvK1LoDBUHJJ?=
 =?us-ascii?Q?ps2zEC3bgr3rxAxKwAC27W9olBdcuh50iovcPBf4crwLCDbIO+sKyXlAT1q+?=
 =?us-ascii?Q?IlmCrcxsxNq5k9b8HqGUM53Aha5ItjwaMZfckoC7qUcVpRqomAywxBkG00YB?=
 =?us-ascii?Q?UwQCqJV79YpuoLWQ1H+cwmuDHa3cTGOZWj0RDl1IgsV0q57q0QwqEIyPVQj2?=
 =?us-ascii?Q?SR3anWZ/QFiJZLDqxi39QjD9sYEMZRV0OpBewq49zafskUnTACSQQU1onlEN?=
 =?us-ascii?Q?xRG+pLIahs9jVebO9zrLy4DzmIZve/8tqe0o0hz5JqENjgNZJJW9T2ZGLyYU?=
 =?us-ascii?Q?xDCQtiv6cb3PrfrsRf4dN7qj4sBuGZCb81KTXWE81hrJHKfB2Ajb02dFe8jC?=
 =?us-ascii?Q?p3RMa6Z70y7mSm9VgqDf7d+jm30BNMLTfxoXyTPSFo71svqO9rz+Y3bY3xYe?=
 =?us-ascii?Q?o9EP0Q01LIDEyOVwWbcnLAGvcMmYFdJ6mn4dqybEzHX876o+uq0iHtEtJuv4?=
 =?us-ascii?Q?U2QMwU/YWTXQh8C0daRuXIztlXTfWeo3osRUHmYwkEZtOUVbgrTcS6HrpTAY?=
 =?us-ascii?Q?byNVALicF7ktT7z58alEahovEo34l/iJnmWJStgchIHbYDGajuZe/dOneViT?=
 =?us-ascii?Q?Ij3aGgS239Rx0WKw6Syp2WKCtFD7PbhJsEYBeCBJqBEix+IC9Zh8jssyqhCH?=
 =?us-ascii?Q?n+0FHwuh+ofWTD2bqHOnowIEuVa835+T88SXPhoA8Eo9rfqvsjpBvHgv12/2?=
 =?us-ascii?Q?7V0nolVZjeiTuhomiW1QJMKgJmTHu6mqtqSpXVSzNp5mgcGZArwXPvcDweow?=
 =?us-ascii?Q?pPrnQlbfYy0QqiSV3y20e5DTFLRRrpl2uL72IkmRgP91vVWOkdrJc47dt8wF?=
 =?us-ascii?Q?Wc/hlUHGgpkc9f6de4A94JjGga9V6qSHRj/7ri+OrhfgStwx67ygm/X0QpqP?=
 =?us-ascii?Q?5gFMkoSKVxqq+O3WCPQCcp72eAIxcWWA1KFrNvqEes+zmCXixyQkl6pkbQJ5?=
 =?us-ascii?Q?AiYsAxJ3h9MsNZqYtrJOH+CRCnIsptipgTQRSx5ZI8PIYFim2IZRrfwpNsrz?=
 =?us-ascii?Q?DguUEL7B6MJV+XbY2ck25rDBrgFgeDPyzUbMZvWuZXofHkdS8w=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PSAPR06MB4486.apcprd06.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(52116014)(366016)(1800799024)(38350700014); DIR:OUT;
 SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?Na3ncw6t6svnO5tRoSioyCCy6wK4P5bRnQCxjeqmgVC0bcXqlxEhh+M5+uoC?=
 =?us-ascii?Q?3I++mAC5VylI8eZQaUUTiQWymSXbZPuY27mxSbzk8cBZ4ue6wFDFOIOFwumQ?=
 =?us-ascii?Q?3fkizzuGhtFB9Ok1htkuaRQN8vdf0s0gifHmEP0McxvSn8YM54MYppOVbUbJ?=
 =?us-ascii?Q?c7qWKMrU5IRiJQuCOOfBirJ6bV20Kx7OJgDPf7NXISiwYXuC60CPfwwcPZue?=
 =?us-ascii?Q?CMlAkELUoR3wP3S2r9puGSNhNTgsz80SCMBK6UP09YeZtjqAa9LxuNuFcbdV?=
 =?us-ascii?Q?LXbVBLF+ALWLVr/KiEB1pupkvg7RPpqlGwgxIXfwPvVGZwFPDu9n/2QdkJ6P?=
 =?us-ascii?Q?wHxOtwIIqHXx+dmw77n/Nef/z8lCF17BrODn6haw6otIYyzFSzn3tlKMSqBj?=
 =?us-ascii?Q?TIoKKhY7BZwgpm2lmHNGIyKZbAn70k50Kh8ozAou/AjOWixFU8fEMbEvinLn?=
 =?us-ascii?Q?GB0CROv44bQjBtb5UDId+O0AkaYkXcrvTt2UA28BqWNHlm8ClY89Zu2WEJA9?=
 =?us-ascii?Q?PVDNtHuO3KPax5FYvVQSDRsTUyo40GLX3BvMixtWkOFE755QwLEFASnJ9duI?=
 =?us-ascii?Q?ECaHe6bzQzhWuep+dZLeh/59Qk09fyLjbomv95S30ynFqZsaDylWlcXh3S2c?=
 =?us-ascii?Q?rS/5ON3gRv00aa1Kla/X6fVgD1yECVZfe4MdrvjhR9fGwdfOVdm2NPmHZydT?=
 =?us-ascii?Q?6xgbWQocOgLPEh8X+UysDKTtB/Q9tkmGMiOSOJ1y+eYC1IMq4VI8/tibL53V?=
 =?us-ascii?Q?9Dlb+LhI06fPPS5XmDDtQxcvucaKuTggKIbtN0XMs6kgSBfqF+V0qteexjhr?=
 =?us-ascii?Q?HTs+ZzrZshP5ByCYLUVkQC6qS3xQi4c4wHk6cbhq02cbmZozLUdXw8Z9lOAb?=
 =?us-ascii?Q?5iZqeHc7LjNkqiUyldFpR+BlIPgii35UhsDM6GJr2cOsMc1F0uvVJm/WhzwF?=
 =?us-ascii?Q?LbctrzcaLVbF6apGwg32KCqG1012948AkSgHa/RNvX/p/4NF24lahuGrb26k?=
 =?us-ascii?Q?/csmNdjfIo4YQ2Hm2q8OgTwc/gkP7dMUb+h493TT97Aba5qG600n3oX6lZwv?=
 =?us-ascii?Q?QxGifjJD4mY/E4TjKl1o1RfZrpmQTgaauYa1m4i421AR9k5CxGxa0hp9Fdl+?=
 =?us-ascii?Q?ENJMs7GUMrXNKF1Qaod6G1vQJEuRuMGn9raUe5t3lRQu4L4YVcdqaOLR8oxV?=
 =?us-ascii?Q?h90XLlzA4Y9ySIfuqf6/pSHi7qUnpUrUr8OZn1eO8jvvUWneFitrwaAxBXwi?=
 =?us-ascii?Q?+fVHbc+aWORhBumRbYVz0g0+3way+f2I8t/LczaGS/rnbtUQaRMx2EVrUjF2?=
 =?us-ascii?Q?CCcDkR/WY2zdC2C8L/wyV6bzF7Jx5H+UgsDgQHwxFr/NqrbbfRQUjPBoXmBh?=
 =?us-ascii?Q?qG+KyVeA0JiWP9TniGhcwTX8/9XR+xTUZJb7ce5dJPqXVYXZ91HfMPwezgWj?=
 =?us-ascii?Q?rB/3yGb40kKGwzTFlNJGH0IFiZonR8O9tzfTiQEPruriYcv/stqymi3Cibq4?=
 =?us-ascii?Q?BM+YEVnXveDx44W4rjl+M6iRmZ3W2av6pyQmF2QcOmwy/pgn+MIaot0Z61xV?=
 =?us-ascii?Q?gHqcC64ShfY5pmrWJgu7UiQZwxHuoSOLQnJ3ycxr?=
X-OriginatorOrg: vivo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bc23e70a-bd73-42d9-4fd9-08dca07e5206
X-MS-Exchange-CrossTenant-AuthSource: PSAPR06MB4486.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Jul 2024 01:19:18.3494 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 923e42dc-48d5-4cbe-b582-1a797a6412ed
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Z34lMab2MmVUfY5h+EjoCQmKGw8nXLiEDiTeYaPJAeBJz4YtOG/X8Iqnto9VIIhXp6tJ/MsJzzgJr8RN1T/SoQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: JH0PR06MB6889
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  When inline tail is enabled,
 use a compact block address array.
 And the rest space is used to save file tail data. The layout of an inode
 block as following: | inode block | 4096 | inline tail enable | | | ----
 | | | inode info | 360 | | | | ---- | | | | | extra info | 0~36 [...] 
 Content analysis details:   (-0.2 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 URIBL_BLOCKED          ADMINISTRATOR NOTICE: The query to URIBL was
 blocked.  See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URIs: vivo.com]
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [40.107.117.79 listed in wl.mailspike.net]
 0.0 RCVD_IN_VALIDITY_CERTIFIED_BLOCKED RBL: ADMINISTRATOR NOTICE:
 The query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [40.107.117.79 listed in sa-trusted.bondedsender.org]
 0.0 RCVD_IN_VALIDITY_RPBL_BLOCKED RBL: ADMINISTRATOR NOTICE: The
 query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [40.107.117.79 listed in bl.score.senderscore.com]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.0 SPF_HELO_PASS          SPF: HELO matches SPF record
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
X-Headers-End: 1sRLzN-0004qO-JZ
Subject: [f2fs-dev] [RFC PATCH 2/5] f2fs: add inline tail disk layout
 definition
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
Cc: Wu Bo <wubo.oduw@gmail.com>, linux-kernel@vger.kernel.org,
 Wu Bo <bo.wu@vivo.com>, linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

When inline tail is enabled, use a compact block address array. And the
rest space is used to save file tail data. The layout of an inode block
as following:

| inode block     | 4096 |     inline tail enable    |
| --------------- | ---- | --------------------------|
| inode info      | 360  |                           |
| --------------- | ---- | --------------------------|
|                 |      | extra info         | 0~36 |
|                 |      | **compact_addr[16] | 64   |
| addr table[923] | 3692 | reserved           | 4    |
|                 |      | **tail data        |      |
|                 |      | inline_xattr       | 200  |
| --------------- | ---- | --------------------------|
| nid table[5]    | 20   |
| node footer     | 24   |

So if we define compact address array size is 16, then we can have
3392~3428 bytes to store tail data.

Signed-off-by: Wu Bo <bo.wu@vivo.com>
---
 fs/f2fs/f2fs.h  | 27 ++++++++++++++++++++++++++-
 fs/f2fs/inode.c |  6 ++++++
 2 files changed, 32 insertions(+), 1 deletion(-)

diff --git a/fs/f2fs/f2fs.h b/fs/f2fs/f2fs.h
index a1d8d8e0a49a..4595b6fa3714 100644
--- a/fs/f2fs/f2fs.h
+++ b/fs/f2fs/f2fs.h
@@ -476,12 +476,17 @@ static inline bool __has_cursum_space(struct f2fs_journal *journal,
 
 /* for inline stuff */
 #define DEF_INLINE_RESERVED_SIZE	1
+#define COMPACT_ADDRS_PER_INODE		16
 static inline int get_extra_isize(struct inode *inode);
 static inline int get_inline_xattr_addrs(struct inode *inode);
+static inline int get_reserved_addrs(struct inode *inode);
 #define MAX_INLINE_DATA(inode)	(sizeof(__le32) *			\
 				(CUR_ADDRS_PER_INODE(inode) -		\
 				get_inline_xattr_addrs(inode) -	\
-				DEF_INLINE_RESERVED_SIZE))
+				get_reserved_addrs(inode)))
+
+#define MAX_INLINE_TAIL(inode)	(MAX_INLINE_DATA(inode) + \
+		(PAGE_SIZE * COMPACT_ADDRS_PER_INODE))
 
 /* for inline dir */
 #define NR_INLINE_DENTRY(inode)	(MAX_INLINE_DATA(inode) * BITS_PER_BYTE / \
@@ -804,6 +809,7 @@ enum {
 	FI_COW_FILE,		/* indicate COW file */
 	FI_ATOMIC_COMMITTED,	/* indicate atomic commit completed except disk sync */
 	FI_ATOMIC_REPLACE,	/* indicate atomic replace */
+	FI_INLINE_TAIL,		/* used for inline tail */
 	FI_MAX,			/* max flag, never be used */
 };
 
@@ -2997,6 +3003,7 @@ static inline void f2fs_change_bit(unsigned int nr, char *addr)
 #define F2FS_DIRSYNC_FL			0x00010000 /* dirsync behaviour (directories only) */
 #define F2FS_PROJINHERIT_FL		0x20000000 /* Create with parents projid */
 #define F2FS_CASEFOLD_FL		0x40000000 /* Casefolded file */
+#define F2FS_INLINE_TAIL		0x80000000 /* Has inline tail */
 
 #define F2FS_QUOTA_DEFAULT_FL		(F2FS_NOATIME_FL | F2FS_IMMUTABLE_FL)
 
@@ -3264,6 +3271,11 @@ static inline int f2fs_has_inline_data(struct inode *inode)
 	return is_inode_flag_set(inode, FI_INLINE_DATA);
 }
 
+static inline int f2fs_has_inline_tail(struct inode *inode)
+{
+	return is_inode_flag_set(inode, FI_INLINE_TAIL);
+}
+
 static inline int f2fs_exist_data(struct inode *inode)
 {
 	return is_inode_flag_set(inode, FI_DATA_EXIST);
@@ -3300,6 +3312,9 @@ static inline void *inline_data_addr(struct inode *inode, struct page *page)
 {
 	__le32 *addr = get_dnode_addr(inode, page);
 
+	if (f2fs_has_inline_tail(inode))
+		addr += COMPACT_ADDRS_PER_INODE;
+
 	return (void *)(addr + DEF_INLINE_RESERVED_SIZE);
 }
 
@@ -3429,6 +3444,16 @@ static inline int get_extra_isize(struct inode *inode)
 	return F2FS_I(inode)->i_extra_isize / sizeof(__le32);
 }
 
+static inline int get_reserved_addrs(struct inode *inode)
+{
+	int size = DEF_INLINE_RESERVED_SIZE;
+
+	if (f2fs_has_inline_tail(inode))
+		size += COMPACT_ADDRS_PER_INODE;
+
+	return size;
+}
+
 static inline int get_inline_xattr_addrs(struct inode *inode)
 {
 	return F2FS_I(inode)->i_inline_xattr_size;
diff --git a/fs/f2fs/inode.c b/fs/f2fs/inode.c
index 005dde72aff3..4bb098af4742 100644
--- a/fs/f2fs/inode.c
+++ b/fs/f2fs/inode.c
@@ -426,6 +426,8 @@ static int do_read_inode(struct inode *inode)
 	fi->i_dir_level = ri->i_dir_level;
 
 	get_inline_info(inode, ri);
+	if (fi->i_flags & F2FS_INLINE_TAIL)
+		set_bit(FI_INLINE_TAIL, fi->flags);
 
 	fi->i_extra_isize = f2fs_has_extra_attr(inode) ?
 					le16_to_cpu(ri->i_extra_isize) : 0;
@@ -674,6 +676,10 @@ void f2fs_update_inode(struct inode *inode, struct page *node_page)
 		memset(&ri->i_ext, 0, sizeof(ri->i_ext));
 	}
 	set_raw_inline(inode, ri);
+	if (is_inode_flag_set(inode, FI_INLINE_TAIL))
+		F2FS_I(inode)->i_flags |= F2FS_INLINE_TAIL;
+	else
+		F2FS_I(inode)->i_flags &= ~F2FS_INLINE_TAIL;
 
 	ri->i_atime = cpu_to_le64(inode_get_atime_sec(inode));
 	ri->i_ctime = cpu_to_le64(inode_get_ctime_sec(inode));
-- 
2.35.3



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
