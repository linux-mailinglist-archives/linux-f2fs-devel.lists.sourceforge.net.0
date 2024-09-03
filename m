Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B9219697FF
	for <lists+linux-f2fs-devel@lfdr.de>; Tue,  3 Sep 2024 10:56:59 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1slPLO-0002UK-3g;
	Tue, 03 Sep 2024 08:56:58 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <bo.wu@vivo.com>) id 1slPLK-0002U7-BW
 for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 03 Sep 2024 08:56:54 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=MIME-Version:Content-Type:Content-Transfer-Encoding
 :References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=6YkUHWkSyaZim2/FraKiN+n8vb8EDsmqhJ3U8NImOxA=; b=G4a18MLXMXDrxk8Rw/OYCNL6m/
 Z2yIo/57xJ0oB3Swtj/aijAqCSoPOnYPt3Hj92RSa3ZFRfWSLTUxpTWHLJIZaZ/AJYbdAsA20FMQd
 420NMl62ZGBzvUJvBJyM/9JCxbWtEYsNww/7m6O/AEI7raq2V8Ad6EhkR743So3c1fB8=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=MIME-Version:Content-Type:Content-Transfer-Encoding:References:
 In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=6YkUHWkSyaZim2/FraKiN+n8vb8EDsmqhJ3U8NImOxA=; b=AYYGcVlXB6LERded5F8S8RuyTC
 0HiZ3+KY353JX5gRcpCzR4WGICca6aMbxRdNz0iA2xjhK5Rc+GE/Pr56AN+ZadT7ID6/9ZsZJ7jC1
 74pacbEoxTpBt5AwMyrqP1jtmtsbK+puY5lEsT4sDyL8NSqVczyllKFdMNen/FQ0kpWQ=;
Received: from mail-psaapc01on2076.outbound.protection.outlook.com
 ([40.107.255.76] helo=APC01-PSA-obe.outbound.protection.outlook.com)
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1slPLJ-0001Z9-MI for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 03 Sep 2024 08:56:54 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=rbFheJlEDdFnDlnwf8a19hADcu3pB7mJ1WNAff48ChAjTyGDaLtLy2mKLoYtlXCOzPxV8Fw/4qB1t4gaMJEEQOvcQQajmyKbRBQ//B44XMv+hVsjEEmHIYHfSq279bcYhMpF/7WQTHnV+5DE52Ngpj/CXGoeJ7uC0jRGWhJH55jIzle/ixj43SfBGmdbfG8zyl8lA+hEJCxyIAMuI5LJYIq+C2Yr43/sUWLOBkq7oxkFpiQ6zuU70vCE7C2AR5zR0U+jlfm1IScJHFsu/e65m4e/+5qcH3E6UTQEbEaKgKw02Cii5eIr+u0J/tpqIZu89JVPsu8geJ9vpuBLjrju2w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6YkUHWkSyaZim2/FraKiN+n8vb8EDsmqhJ3U8NImOxA=;
 b=sLfKd9fBbl4mbK0B5mHH+Ch/uzvKZZ6FVwG2yZHXIe6pxVMNhxpqU77sSkez1HPfCdb2VDXkBRBwrtvsvsFXTFUJ8Hlkp4dwpvC06baEf8uyMXbVlr0h76SUg4Y13g7u5xu9xFVREmSywl+Hmy+up3OTdKMR6IlwsQ/RvBu1AqnSopRQb90ahLJUlwdn5SCNs8Tr+0RdHqrHt97zZK4JVdrtkXp3jHkQlsSWeYZGbwEWVuqfGrSli9uoFbWG0ERCz9tIyOXONtV3P9HLR4LXQOWhuK1/dwr73HbwY7CLr2oWotAJkoH4Nlhtf8414Hj6EavSxVI5X0dlQx1T8haFAg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vivo.com; dmarc=pass action=none header.from=vivo.com;
 dkim=pass header.d=vivo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vivo.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6YkUHWkSyaZim2/FraKiN+n8vb8EDsmqhJ3U8NImOxA=;
 b=VjYup4e9dI6RuPcbU0kyiWBHTzPnlfVfTxpIBiMQu/E+lPhV3SZVX86HDE5RSGi8EiJN6Vuxi+1KNohdUdV3fKN4wA5HjxrOK2Uozdp1wQkfHIPe7ZwTucAtJilzjJCRd8a6saw8u7D/lZJUeTkNhcFU1i5rIGV2DAXpnzfcFtJ0LucM7rltTCdaif3N+b7AhY7fFJSjog6vTQXi6TQDobGIwWQBvsSEB31sHecW5rWnLfxKwfPw9kwo1FTFOeC8E8g9WZ+6quraKZaWgAcqYBJRo3CBiO0oBpHC+f3QiXEtIhQzoiW5UUXWHyQqeucPYVxp6eOfYLnCtGAuIYQdHQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=vivo.com;
Received: from PSAPR06MB4486.apcprd06.prod.outlook.com (2603:1096:301:89::11)
 by SEZPR06MB6253.apcprd06.prod.outlook.com (2603:1096:101:e6::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7918.25; Tue, 3 Sep
 2024 08:41:02 +0000
Received: from PSAPR06MB4486.apcprd06.prod.outlook.com
 ([fe80::43cb:1332:afef:81e5]) by PSAPR06MB4486.apcprd06.prod.outlook.com
 ([fe80::43cb:1332:afef:81e5%6]) with mapi id 15.20.7918.024; Tue, 3 Sep 2024
 08:41:02 +0000
To: linux-kernel@vger.kernel.org
Date: Tue,  3 Sep 2024 02:54:55 -0600
Message-Id: <64857ac35515abdb00cfad877094131b471a8776.1725334811.git.bo.wu@vivo.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1725334811.git.bo.wu@vivo.com>
References: <cover.1725334811.git.bo.wu@vivo.com>
X-ClientProxiedBy: SI2PR02CA0008.apcprd02.prod.outlook.com
 (2603:1096:4:194::12) To PSAPR06MB4486.apcprd06.prod.outlook.com
 (2603:1096:301:89::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PSAPR06MB4486:EE_|SEZPR06MB6253:EE_
X-MS-Office365-Filtering-Correlation-Id: b05251c6-8a05-4229-6a71-08dccbf42420
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|366016|52116014|376014|38350700014; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?9HLbtpGoWatf0EAjJJAbKtiUPN964yabSqYXeD07Q+/ejkPmAzG5u9SApPyt?=
 =?us-ascii?Q?RMFwjEk6iL5uvqMxjriAbMcehVCaOlwSp9dFUvc/Okh/IXkkscDf8eY/dU3g?=
 =?us-ascii?Q?ovS8rquN+njijAHQWDm/YdpMVEiMrGKSKPnwECyK9zsVrgBm4eTJ1aXrUnow?=
 =?us-ascii?Q?/8Rpo+nQ82qmke1Ixdq9WG30R+doTq2lHWcAdncZikBnPtJPnzBYmzlUO7P6?=
 =?us-ascii?Q?lx3gT2smAVSCG9Wlg9Zi5yK/Xb9A2utZULLQKHJ+3G+Ea71NOa+Zsw/Qkzzx?=
 =?us-ascii?Q?3p4U+GfCcTNPTybxeFTjbVFDnnDktUDEYzh97t6KQvRhEmKY+rQcQDMciO6T?=
 =?us-ascii?Q?JqIdMDw81u10BHeqpVZVZzJ+sl0lvXDHvSB0tO83wqyxW/4WeIUP9UliBdea?=
 =?us-ascii?Q?UtyAy6fm+oV7zmiOsLdXljWM/lbG8lISk50JKku+j08F9O/k77+RXii6rlQY?=
 =?us-ascii?Q?JOpDhqcB1vNFjVuOSpk/7lv29B7xljabJRnIyJYZ6dRVRjzlvwzwIJLJM70N?=
 =?us-ascii?Q?rqOgHI7A7yzgSBgPQC0YjjXNlbpmhXuYumEqSTVrwkMOWU73rBYMAnwtHQFE?=
 =?us-ascii?Q?UvTeE+g9nXaxMt72slycJPxL+/f7MxA8VK+JxfSwJKlDOD8VF6yCkpR6Pyg5?=
 =?us-ascii?Q?9/RCZOlFhJ2VcsS8LI38ica+kvojfqaySj39wEBQCivxWasAV3fw/cSXcaw6?=
 =?us-ascii?Q?ZEHrGMvBDzW4MSPaP0rzcOE9FVKIp+IZ96Ifjrcw0tjygnS9qur32q34JT4G?=
 =?us-ascii?Q?7S/8k9QCepcBvB9WRanHYu9fruwL8JXoTFYKqxPbuLW+bim24QhUbhME4WBK?=
 =?us-ascii?Q?LYPZJac6O3KdQsQqUozElMdN0jWnbh1b+TJi1MaV9gpaKVbpF9jSyYqAVuTj?=
 =?us-ascii?Q?nASyQOc4yfFbJ/x/KYKOAuVxsFuNXRIgzwKgUMh/9SbC+Fc+tw5P1XktIjCU?=
 =?us-ascii?Q?XDlrV6ItCVF/yDpkD1meqsIyetkKIIWFmmwTaymIW/R3p2ctbIypnmQWpdHe?=
 =?us-ascii?Q?Kg1J8mCNi9ic4GTVKTvie5RZ9xXniCbagxGX9qK8yug77VE+B645oC9IswG5?=
 =?us-ascii?Q?2eGyjTVkaZ+NgXawUDq+qz8CKbowHq0dXSuWFU0y7xhkT0oI0irM6yZ8TdOC?=
 =?us-ascii?Q?iKiS2B8ZcFEXwR7cXEH3asvbxTfvZXzjsaG1gTfAfLEsmNTvcKtqPMS1bbSy?=
 =?us-ascii?Q?4aFzlyb+G5aNc1vsUYA4Qqm2jFwv+dCkDdZ8Zr2YuR3eQ4mbJpIrx7KF8aSF?=
 =?us-ascii?Q?TKXO+QSmdcwUPRi24YZcBEk+xK3E9oM2ez0+qK5dron3Fd1ViRdm+8oMeZ7N?=
 =?us-ascii?Q?ZT/ObWZbX16YueCmTmbJ2eSo/WDsaKJLTAspbNrilemnb/SCCztp/Iec26v/?=
 =?us-ascii?Q?UFxg2YRoaoa0KyeDNV5gG0XIpmR+0J6SB5g75g9PHwsz5ICthg=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PSAPR06MB4486.apcprd06.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(52116014)(376014)(38350700014); DIR:OUT;
 SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?R1DDRNrlbHZUq7q1aM79V8WUgWXLESyEuvoNYX7AWIm3ERT3MWzZh1acwwRp?=
 =?us-ascii?Q?wfPTaS+KhL6zDiAG6UYi8A9xfc3T1UF1kG1q6XtSWgwfNMnbo8TV5Xc/0YrG?=
 =?us-ascii?Q?IodzdMPKqOb9xhcUU/dEk4r85PUkUUTCoIY0by2gC2Sw36jK4HwHsTjmVrv+?=
 =?us-ascii?Q?yOYPej8rRpUSA8lBy2+cJ6u63GNJRQuEy+6bn0ylARXHDIZaaH6tI0YauiDe?=
 =?us-ascii?Q?v+PT8za1AwVoYEN6OtEZGnEWPRekHuhKkOAYCwTVKG1p0OrYo7uFceET0FWa?=
 =?us-ascii?Q?lq9FxtPuaaA1zWtKacrUt/AF/5yfXkiim5TfqRiFE8+71j5JoE/+kt4j94aI?=
 =?us-ascii?Q?3LP8QI3Vu3oguqfg91guVsG/FkRMuHgNgZyufwxMsh+7mKuG8Z0CxdfMcZIf?=
 =?us-ascii?Q?aqsJHSeWwrvIlVpj3S37e7/GqCkPS8L/cEmnSrM1rI8ZkWn9v6Ievbzxm64I?=
 =?us-ascii?Q?vr/fz/l2VTvYXppM4nV7BdaI8tYsV9aICuH6zFH+PeA9qSgZpjAeZmm82pN4?=
 =?us-ascii?Q?Px970533TUwhYO1qDMu0MWoW5Rgc+/zO0BJvOXhRKG9IS/O8sdJydP0BDhJU?=
 =?us-ascii?Q?gPQKbi10PEQl3DMwE7djOe7/Cj6d5U4FpgbpjxYinpKnD/F+gRzp8/b6lFbm?=
 =?us-ascii?Q?SfDRYidrqzBwt76n/IsKin9IY9ecC/IZ3kflnfJYqSu5QpJnXHqvnl/Q4j0b?=
 =?us-ascii?Q?Wy7Czn76zJJFQMm3zh08ZHucWTb5ej0im5F5vq/IMQWJJKFekygFbtbpQkmF?=
 =?us-ascii?Q?l/QL19x8QA28AR3+JRpWV4DcTRUgwqZ3sRzvojB03eq1to524eZ8S09hnbFo?=
 =?us-ascii?Q?ieGXVc3felzsMmU6Cggc1zFr6hYdpg1HvuQRkAUaBAFnNJLq1ySz8iwAd1qm?=
 =?us-ascii?Q?KSyAcjGEjkvMFd51zO1fqWcY6c/IKeOd/wJnTgr8zH7VomjfqfdoTwglgeVX?=
 =?us-ascii?Q?oWhlJHPTMHYOR1YGhIad9/K7AhizFwD2BKff5PYlm5CXEuXW9tanXnX3YA21?=
 =?us-ascii?Q?WTLRxCiHwy2sHcXtf9FYBMqILricjAyxmDrk8uvKqTCUstZn8a0SGXkKwrHG?=
 =?us-ascii?Q?d478fGfnZkfVeIqJUNOVDPIazoVmdLqi2u0SuXpeL5eTL1Pw0zRvVxmRjTL9?=
 =?us-ascii?Q?V21gMt8FposQfIxbyPKw/QacamZJ86SNsuJz+gQCfgsAujAf5djC1+n/MQMn?=
 =?us-ascii?Q?LymuYcBkGuW3snFKObccnpeei3Hu+fxq2m5fKSIr27jauw26fMdHLe27vxbY?=
 =?us-ascii?Q?ifnW5REvHt02nfLUtIb/2v1LieAYQQYYHHtIdKMe28f+VXxGE49Tifbmofa8?=
 =?us-ascii?Q?w5i9xeQ5NG8NqhNDlnMZ5DgqfNsE8eVtRHve5hhMfjxczavoAPWtvK/PBoI0?=
 =?us-ascii?Q?c5Sa0oylFIAHnILUOA5CBjxV3DV35BYcmVgXSnMEBHRXVuJHOeZzrDVQnhEH?=
 =?us-ascii?Q?KxczL8S1n9Ol1Ld8Uc5SC8veOU5C8/eb6hAmzysYZWb4Opxg2zBQCEvrcErm?=
 =?us-ascii?Q?Z3cz7jzfVh/sgPRo4LbCUou7xmEA6B9ONV+7lPdsNCPtAyvEG2wKL5w1UEJ4?=
 =?us-ascii?Q?UyQHeRlQL/kkZ+uMNYBSz0M3ZN2T8rVi9HgKE460?=
X-OriginatorOrg: vivo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b05251c6-8a05-4229-6a71-08dccbf42420
X-MS-Exchange-CrossTenant-AuthSource: PSAPR06MB4486.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Sep 2024 08:41:01.9840 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 923e42dc-48d5-4cbe-b582-1a797a6412ed
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: HO2CqehOjqQJwIVvlMS4X4uxOCCe8oR5V8nxoejEtCIqk5C5tRPBH81XtvpEx248dDTQfzuykZD3uE1NmGl93g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SEZPR06MB6253
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  Before adding a new page to the tail, the old inlined tail
 page must be converted first; otherwise, the data on that page could be lost.
 Signed-off-by: Wu Bo <bo.wu@vivo.com> --- fs/f2fs/data.c | 26
 +++++++++++++++++++++-----
 1 file changed, 21 insertions(+), 5 deletions(-) 
 Content analysis details:   (-0.2 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.0 SPF_HELO_PASS          SPF: HELO matches SPF record
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [40.107.255.76 listed in wl.mailspike.net]
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.0 T_SCC_BODY_TEXT_LINE   No description available.
X-Headers-End: 1slPLJ-0001Z9-MI
Subject: [f2fs-dev] [PATCH 11/13] f2fs: fix inline tail data lost
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

Before adding a new page to the tail, the old inlined tail page must be
converted first; otherwise, the data on that page could be lost.

Signed-off-by: Wu Bo <bo.wu@vivo.com>
---
 fs/f2fs/data.c | 26 +++++++++++++++++++++-----
 1 file changed, 21 insertions(+), 5 deletions(-)

diff --git a/fs/f2fs/data.c b/fs/f2fs/data.c
index 6d7b6074763f..f52834c1cacd 100644
--- a/fs/f2fs/data.c
+++ b/fs/f2fs/data.c
@@ -3418,7 +3418,9 @@ static int prepare_write_begin(struct f2fs_sb_info *sbi,
 			block_t *blk_addr, bool *node_changed)
 {
 	struct inode *inode = page->mapping->host;
+	loff_t i_size = i_size_read(inode);
 	pgoff_t index = page->index;
+	pgoff_t end_index = i_size >> PAGE_SHIFT;
 	struct dnode_of_data dn;
 	struct page *ipage;
 	bool locked = false;
@@ -3438,12 +3440,12 @@ static int prepare_write_begin(struct f2fs_sb_info *sbi,
 			flag = F2FS_GET_BLOCK_DEFAULT;
 		f2fs_map_lock(sbi, flag);
 		locked = true;
-	} else if (f2fs_has_inline_tail(inode)) {
+	} else if (f2fs_has_inline_tail(inode) && index >= end_index) {
 		if (!support_tail_inline(inode, pos + len)) {
 			f2fs_map_lock(sbi, flag);
 			locked = true;
 		}
-	} else if ((pos & PAGE_MASK) >= i_size_read(inode)) {
+	} else if ((pos & PAGE_MASK) >= i_size) {
 		f2fs_map_lock(sbi, flag);
 		locked = true;
 	}
@@ -3471,14 +3473,28 @@ static int prepare_write_begin(struct f2fs_sb_info *sbi,
 			goto out;
 	}
 
-	if (f2fs_has_inline_tail(inode)) {
+	if (f2fs_has_inline_tail(inode) && index >= end_index) {
+		if (index > end_index && f2fs_exist_data(inode)) {
+			struct page *tail_page = f2fs_grab_cache_page(
+					inode->i_mapping, end_index, false);
+			if (!page) {
+				err = -ENOMEM;
+				goto out;
+			}
+			err = f2fs_convert_inline_page(&dn, tail_page);
+			f2fs_put_page(tail_page, 1);
+			if (err || dn.data_blkaddr != NULL_ADDR)
+				goto out;
+		}
 		if (support_tail_inline(inode, pos + len)) {
 			f2fs_do_read_inline_data(page_folio(page), ipage);
 			if (inode->i_nlink)
 				set_page_private_inline(ipage);
 			goto out;
-		} else if (f2fs_exist_data(inode))
-			f2fs_do_read_inline_data(page_folio(page), ipage);
+		}
+		err = f2fs_convert_inline_page(&dn, page);
+		if (err || dn.data_blkaddr != NULL_ADDR)
+			goto out;
 	}
 
 	if (!f2fs_lookup_read_extent_cache_block(inode, index,
-- 
2.35.3



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
