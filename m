Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D19992C7DB
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 10 Jul 2024 03:19:35 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-3.v29.lw.sourceforge.com)
	by sfs-ml-3.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1sRLza-00035k-OZ;
	Wed, 10 Jul 2024 01:19:34 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-3.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <bo.wu@vivo.com>) id 1sRLzZ-00035d-6k
 for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 10 Jul 2024 01:19:32 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=MIME-Version:Content-Type:Content-Transfer-Encoding
 :References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=CDHRGeYMIYMR3MKuYJG5LMrqEXmMvyMMMZn0tdgP8z8=; b=DzM6l/9J9rCmVxuTM1yoDO4NUA
 OfLooOjDdHTRdrXCMmkogPRrcd/K+vwK+4vhxM65+Co2/tg6IpbzojGwup/creYx2dBkOK1IrPWNQ
 BtICuu5jURj7lWdgdpZttzVyoWKU1LIB2jMfJz8JPkhODIbN7GUt1Xz2ilMnkZ0UYc1Y=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=MIME-Version:Content-Type:Content-Transfer-Encoding:References:
 In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=CDHRGeYMIYMR3MKuYJG5LMrqEXmMvyMMMZn0tdgP8z8=; b=APUeOg1cROkFccAidO5SEqZeqM
 X+H88vsfJeu3WxC6mGLZCFj4kmFCLuzt1ZobpeXT7YVSz7gxcUtsyd8mHaIN4yvzVkJXn7q+/uJLd
 SB0oEQRq7o9iBgmfRifniKzSA2fNHJrFCSwnrzwsSnRbPjDSb7BtjSLyVnJBBL9mlVGA=;
Received: from mail-tyzapc01on2049.outbound.protection.outlook.com
 ([40.107.117.49] helo=APC01-TYZ-obe.outbound.protection.outlook.com)
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1sRLzY-0004qo-O5 for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 10 Jul 2024 01:19:32 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=QzPrBJwGevlhuApPbB9JrJmGUvFoSLIddRQJE83pJdXr9gKZO3jcMRVxMrMsDRlAx4yK5f3Wt6qQOmm74b+2rOLRY8KXn18oOT9ik6Xj2geHqk29xu+d4lt3Q32NHNi4bDrwN/vBiKnhngH514wP5SII2jJXc2LkFEtoDcdIcWk2obMnLNoZv5mO8Z/lGnqvZ5DJ3++++KNoVkbj5R8DloQAw57fyGCtz9XSybiVw+TGvJBQE0IUraUYLziCCl3BeHMXly+z4AEiUp+U/+D6cDcpdgDEhTwvKed4VeW8e+BO9baKXl0aoLkViC75ddYOcA1fYtRwfiSQw24wgl9bBQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=CDHRGeYMIYMR3MKuYJG5LMrqEXmMvyMMMZn0tdgP8z8=;
 b=hGa8G7GVPNSIRet7AXfcNkesHA+COwdMeyunQJis6lzZIrdjE4y/Y7hVi7P+GYEdS8BrRx8ky/FAo0/D3w9tbsJXzWApDL7BlGkL50MrKQnWgXESrLVJ6IsdNkEl9bRBwcphC7goN/mx3ahL+nBjDQRaIC/q07y3W8kdo4vI2nUNAUnkn1wgra0BvM9B0Qe82m3sirsSidtVUFgktr1zzrdIDuWL3+3EohdI7pd8KiFg07vEpRIbXz2T5T3KyyTbFKXu7bJ7WMeZUtqolaUig57FLWXby6fQlyt+rdmIOYCLsvCMMkhRhQkbcIB/RXPijIiF7/zD1XjWrwGD6bKOrA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vivo.com; dmarc=pass action=none header.from=vivo.com;
 dkim=pass header.d=vivo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vivo.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CDHRGeYMIYMR3MKuYJG5LMrqEXmMvyMMMZn0tdgP8z8=;
 b=NvKMFIUdQuljtOocgp8S7UO2o4Lfu/iKfDZkD5zqwTVnwzOepjwJ89IiI+FMxsMRAk/If1HY8RJtj0aoRSymhTlDDzJslcBUxTQKWEF6tkiuctX9tf/091eXHtRAdvVvMvmk3eXzsIVG10BwQLcYgCTVc9DX4CfXO/pBs+CLQW8CC3HXxg3RKMy+Dk5c6eAaS+4Y/1TEoBDAuzGtrBwxh6jes97RyrGf3fuq74G6jer+MJqBQ4S043RBE1M2KIxgZEo0+AeOgjXEQ7jz+T7dX93XZl+ktie65GZ/vrbjLyDuuQED7HfYUm2+btzNCWxx8xtyVv1JU9ukXR2ohBISBg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=vivo.com;
Received: from PSAPR06MB4486.apcprd06.prod.outlook.com (2603:1096:301:89::11)
 by JH0PR06MB6889.apcprd06.prod.outlook.com (2603:1096:990:46::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7741.35; Wed, 10 Jul
 2024 01:19:28 +0000
Received: from PSAPR06MB4486.apcprd06.prod.outlook.com
 ([fe80::43cb:1332:afef:81e5]) by PSAPR06MB4486.apcprd06.prod.outlook.com
 ([fe80::43cb:1332:afef:81e5%5]) with mapi id 15.20.7741.033; Wed, 10 Jul 2024
 01:19:27 +0000
To: Jaegeuk Kim <jaegeuk@kernel.org>,
	Chao Yu <chao@kernel.org>
Date: Tue,  9 Jul 2024 19:33:07 -0600
Message-Id: <3ae7c67217cfa89d6e152853071fef4adfdc4766.1720515215.git.bo.wu@vivo.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1720515215.git.bo.wu@vivo.com>
References: <cover.1720515215.git.bo.wu@vivo.com>
X-ClientProxiedBy: SI2PR01CA0030.apcprd01.prod.exchangelabs.com
 (2603:1096:4:192::15) To PSAPR06MB4486.apcprd06.prod.outlook.com
 (2603:1096:301:89::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PSAPR06MB4486:EE_|JH0PR06MB6889:EE_
X-MS-Office365-Filtering-Correlation-Id: 7d5c315c-b40f-4426-ac08-08dca07e579b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|52116014|366016|1800799024|38350700014; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?Q0hd2Pf4yy8SJYeAyRpV8gnc32Fdst/UsKkp5JOk7pwUM39I4WZ1pzOL8NZX?=
 =?us-ascii?Q?jNhXDUCb15A0DMVYLGB3PdduY0+fYrUo2hiEBMhgw40fYWaREdnoFk59UNlk?=
 =?us-ascii?Q?lT6/kOOtdMluj6q99UPAD3iN2LNN89+26h7oHjFXARpzEekdO/+C7EtgEx5m?=
 =?us-ascii?Q?f7h+wousRujT+oAd/5SSEUOFMqI0nlM1hsVHlZF2+egu0my0TvUATTvlSVnA?=
 =?us-ascii?Q?pzV6/0eZLWN1o9kx0ykYNL/kNfIGrS2UDLnHirOEJeLngvpRqUUgGHD9ADLx?=
 =?us-ascii?Q?g2YxjywmMx4ojGeztgtRUeTOnGpKpyT1Qv/AqR4zlM+5d3X1HkoNVx+Dc9uU?=
 =?us-ascii?Q?NtExyL1+F7ERlcrmdMw1dT5V6+bjf2zKRX+DJfHaTYiwyviy8mjTmb8YNOOP?=
 =?us-ascii?Q?JEN+7315xxqA44nRz3W2C78z5NXhKD0n9AhAXvmIAMVnPaT6ho95QCSJZGs4?=
 =?us-ascii?Q?l02jTLaz1er4qL+WC8sLshdDTKC1vd2XdZCih/WFFDycOKWkldXn8cZqYdKC?=
 =?us-ascii?Q?o34U8pWF0oveqVb8raQz3j/nuSJpjSLLxOrISiYaKW0h1iwYtOhBhgNAayY7?=
 =?us-ascii?Q?jAb2FHlTJ8oye4p1y0iZRnD+aSbine5C3Lvw25T9zC6/eeUtdDeTgv7z0x3k?=
 =?us-ascii?Q?RMIsn5FEfMjISSC++V2Ljv3VP/BaS1GI487Ez/YWq3X/rKmN02AKlFAAHVUg?=
 =?us-ascii?Q?6RjW6bPi+jgFx1eKZdR8rWN+6CP5RNE9S3T3dm2RBRYD59wQut3MBXfv+8Tz?=
 =?us-ascii?Q?iBrEYVGZm6000Ka253Vbm3/L75FUEgIvLpL0BhXUXN6sdIjniETObrMn1A8F?=
 =?us-ascii?Q?FrUCkc++onuOc6qswPWfqZO7WAkQiCeiu5MO8Rocpg2YZZXsI24e2PCw4Z4n?=
 =?us-ascii?Q?VLKr++ZeBj7tuv5ya/xkC8FQK+8JrHg2FAORq9gWs4I8rkM6N40NhZvlRBUU?=
 =?us-ascii?Q?CZi+uBrTkMIPOaVlmxbHh2zRTa+RObhhAlyP5x7p8RRJsRLJXIJcdkLs0tI+?=
 =?us-ascii?Q?3hkPapxe4jKICtUKgIL5X5eMr+LBkP7k8wh27Ye8wvueKabKaGjEEBClja8y?=
 =?us-ascii?Q?R/JZlVREssxA/Yb9WXJ30DQy0ywd7yK9vF80vihnP9vAMypvQOYQqe6gOJ07?=
 =?us-ascii?Q?zwNkLBn+RuqRo7E3XM4xpUnYgGO6OuR38tUzMUzzy4NCm/F63uBIZjPIsDuV?=
 =?us-ascii?Q?zSQLnL6mEenvx6kD2XhA9a3a3niZ7f7nfLqXSUVoKqqab7ODijYKdtjV97Z1?=
 =?us-ascii?Q?vUpKSh++00wCsupAqE94zUWmmg3E/7Hn1RG8mXsEHcqTgXZRGHNcn3098yes?=
 =?us-ascii?Q?zKBBFE9v9uktETLziLEv2Qvp03tWeTW/yDfLR+58+fLrXu0zmzYfeO+2G5eq?=
 =?us-ascii?Q?20922X1sDttV7y8VxVSenBl8TmTxItz7cHMe5yGuZXsXT6SNZQ=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PSAPR06MB4486.apcprd06.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(52116014)(366016)(1800799024)(38350700014); DIR:OUT;
 SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?jwBaedmmEJqVDHC92voV9Zr3xxVGE4mlnHvdKf0kuP362k3QVnVWuRQjQSCJ?=
 =?us-ascii?Q?mNpHLHomGimdP1mkjf10hyLpEGNnxV5LcWO3TXP8ugG3Xy0EnIpbzsbhmT+l?=
 =?us-ascii?Q?KLYItybVy9tACYUZJnrbADIxNLaF0BUULCNqzO1nFtXWt+J/c34DP515uQ9K?=
 =?us-ascii?Q?BkO4bdJszojhC81q85V1pkrWDNXsidAMaoBFa0LWa3RLHUD153Dty10i/QZt?=
 =?us-ascii?Q?pkxvyjWJmURtNm4KX66y5mJSxixCqX6dWOiAiuDg9ndhf6YL2vJ8whYd+aAS?=
 =?us-ascii?Q?0ek6jt5OfenNi8CRgXiea3/1eiBD19Wo99MTeE2HNhro8LX8LNE1XXr8Voes?=
 =?us-ascii?Q?k6lHsWJDOuiELC2S+I0vJuCKoQW+kqiIdhId1W0P1JQdimJZKHwiJUohhVfq?=
 =?us-ascii?Q?W7oQb51fvWI2EZKP9GTeg8lcg5yCRBXb7uap/8+XhtgHmLpIOTgPXj39XIu2?=
 =?us-ascii?Q?lFB9JXphctqCmY7ATt8UENT24AhF/knEAPPC7xjp/mV5ts71mUOzrYAfeg60?=
 =?us-ascii?Q?KSnQ0LfuP2K6DQWrPyMI/ymNB084ppv+dx10gy95D1+AJWeFvkg+H6GEZMek?=
 =?us-ascii?Q?pAWIrBhxoGs6/fuumv3kNOibCp3puoblsn4XRTFhYa7Q1nZMQIf+z3Qd9zdj?=
 =?us-ascii?Q?4obot+B9UhSfdrJZg4lda3XUoJkuKw27zhd+y2uAYCzOmqvjo7fKGDm4K1xJ?=
 =?us-ascii?Q?CXqhan46fTU8eL3/eDEUqvJYdRC+R5Kvv1jm3/5ekxSJYmGk7KuBfwhrHr5q?=
 =?us-ascii?Q?8QS78ANBpOXh7vjaI7WtG7tHKdPk/5VYxfnnzTDuozYxHuCFTtb7jNjCEfE0?=
 =?us-ascii?Q?awbZ4/+Fj9RXQRe1FZk/QnHwQlei/j1etVsyPFE59IpHckv/9qHniOvwqSCF?=
 =?us-ascii?Q?MUX8pVjdYvZ5WdQE5OzV+rKgqEuV9WoDlRZsxwJDsnM9dXEdIUqys5BPvgZ8?=
 =?us-ascii?Q?oayI3Er4m+T1TFmX0bjEvQaS46yZwhlxtnf1HEcyKRaZP4Nu/nTBdIIjPK/5?=
 =?us-ascii?Q?+U3o4FfkgYe/GizQn2wAYmwyQW5BDeib9hLyZJA7MqNg45Fx/beN+KDKmIna?=
 =?us-ascii?Q?RINV4HU6koJ6Kg6YyeYzS5iD/BGhCw72+joKWkYFUh/i2YYfNDGMOHxFFyxK?=
 =?us-ascii?Q?fgEzO5oFpvTDUHxv+nLJasDz96I47hspY9l8dBZeAdoTp1F8YBFT9+ugsUXb?=
 =?us-ascii?Q?gL++ubMuqFLNYnZYKG6/I4O2o/6Ltor2YdRXlplOPebflnz3TlQTDXg6myBN?=
 =?us-ascii?Q?zUA1Z2pwglwxl0yRlHuxxhb2BfV8gKKhKNZciSajhrAKvv8Bsyk2tjUkW2RJ?=
 =?us-ascii?Q?sFcB0vDTj3U+fR+ZYEyHL/JSbfOPh2XkXc5rHoY2EKW9m/0E6b01O94mWDBu?=
 =?us-ascii?Q?mlWeLHu1oEnZbmGZIDt5Whxi7FvD1IkqeDk5ZPdzGxMg4tJyQbwajfOqkPD8?=
 =?us-ascii?Q?YMMYGt8LrKjWrQNTW6rC3BtWGRPBkEgBxvPuMSAgStTrBC10qdl7y2rXieJ9?=
 =?us-ascii?Q?NTokAm2llACMI3KlLMB9C9u0GZ8A+++3ZBGsHBJrdU85rDQ77p7LlNAK6cCM?=
 =?us-ascii?Q?C1yifWXIdfyYQJouWjgDSdYI1v2nvHGxAuLhfC91?=
X-OriginatorOrg: vivo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7d5c315c-b40f-4426-ac08-08dca07e579b
X-MS-Exchange-CrossTenant-AuthSource: PSAPR06MB4486.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Jul 2024 01:19:27.7787 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 923e42dc-48d5-4cbe-b582-1a797a6412ed
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: wnw04RpFJGLko8vXsijqAyoQZgvhId+t6MpRtyiCLhvmET1xGd/MuU6MqSapHjOe2uPy/UHJnD92DplooBWpSQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: JH0PR06MB6889
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  Set inline tail flag to enable this feature when new inode
 is created. Inherit the conditions from inline data. Signed-off-by: Wu Bo
 <bo.wu@vivo.com> --- fs/f2fs/namei.c | 3 +++ 1 file changed, 3 insertions(+)
 Content analysis details:   (-0.2 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 URIBL_BLOCKED          ADMINISTRATOR NOTICE: The query to URIBL was
 blocked.  See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URIs: vivo.com]
 0.0 RCVD_IN_VALIDITY_RPBL_BLOCKED RBL: ADMINISTRATOR NOTICE: The
 query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [40.107.117.49 listed in bl.score.senderscore.com]
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [40.107.117.49 listed in wl.mailspike.net]
 0.0 RCVD_IN_VALIDITY_CERTIFIED_BLOCKED RBL: ADMINISTRATOR NOTICE:
 The query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [40.107.117.49 listed in sa-accredit.habeas.com]
 -0.0 SPF_HELO_PASS          SPF: HELO matches SPF record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
X-Headers-End: 1sRLzY-0004qo-O5
Subject: [f2fs-dev] [RFC PATCH 5/5] f2fs: set inline tail flag when create
 inode
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

Set inline tail flag to enable this feature when new inode is created.
Inherit the conditions from inline data.

Signed-off-by: Wu Bo <bo.wu@vivo.com>
---
 fs/f2fs/namei.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/fs/f2fs/namei.c b/fs/f2fs/namei.c
index e54f8c08bda8..ef5111420524 100644
--- a/fs/f2fs/namei.c
+++ b/fs/f2fs/namei.c
@@ -313,6 +313,9 @@ static struct inode *f2fs_new_inode(struct mnt_idmap *idmap,
 	/* Should enable inline_data after compression set */
 	if (test_opt(sbi, INLINE_DATA) && f2fs_may_inline_data(inode))
 		set_inode_flag(inode, FI_INLINE_DATA);
+	/* Inherit the conditions from inline data */
+	if (test_opt(sbi, INLINE_TAIL) && f2fs_has_inline_data(inode))
+		set_inode_flag(inode, FI_INLINE_TAIL);
 
 	if (name && !test_opt(sbi, DISABLE_EXT_IDENTIFY))
 		set_file_temperature(sbi, inode, name);
-- 
2.35.3



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
