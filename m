Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 49E69926DB3
	for <lists+linux-f2fs-devel@lfdr.de>; Thu,  4 Jul 2024 04:58:31 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1sPCg0-0001BO-Sd;
	Thu, 04 Jul 2024 02:58:30 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <shengyong@oppo.com>) id 1sPCfy-0001BC-Pc
 for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 04 Jul 2024 02:58:28 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=MIME-Version:Content-Type:Content-Transfer-Encoding
 :References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=k+tXib1XiY4++hXja8zoXeb2PNj4SrDnA7nNa6syYOo=; b=E+EO6FPqSFvgdxC9B6tGwt1A0I
 oeU1IyopS1tdqSHnMUR3pizlfF5hIkBj/q/BN6j/gNSEGSwFzjvqjiV34A9moYBPUfvitsYMdwrGU
 IgY4u7VdHOea/BXvY46I4t1NSl+AdkxnU/5ZKgKRgvgsiahB2EV+zvP1cZpcx9nKm2to=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=MIME-Version:Content-Type:Content-Transfer-Encoding:References:
 In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=k+tXib1XiY4++hXja8zoXeb2PNj4SrDnA7nNa6syYOo=; b=QxxuGRW5HRXy+4j4rdCdioJiO8
 aVqxlYmB8/E027/r3wpnNQZdLP/1vf6yZNmFEioInmjhTUsg25dHElBtIgttWBMLWVkpDWSf6Ie96
 eJZbtlt1BaINNVVigbDnozSGtwHmgSw5NlFw70EXOPWGwEIGHiHZblzHh/VJj8N9pB30=;
Received: from mail-sgaapc01on2054.outbound.protection.outlook.com
 ([40.107.215.54] helo=APC01-SG2-obe.outbound.protection.outlook.com)
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1sPCg0-00011d-22 for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 04 Jul 2024 02:58:27 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=EaP4bdtSGOUPCnC0qsMiTrzTtXxAVdBzVxZz/2FIR1MEqYGGRK6zzl4ntvN4JSE/1tYhHzNivQBXcxvb/P1YPvPxaQKheX/LzMp0vAkLZuJdGfs8D9Df6m8yXzK9DVSlj7ELwKsM13wu7mZRfFqBfcNCtCfs5SetD9OuXfVpR9ylCrmNuCk/bLH5itRMtfjWCkxlQ/DyNr6XSYt5i0C2Cnc/zEiLOg+v3xBrjITZ3S6edGZwo/OxT6F1lWEJ8pnxnz+N3wXfbME1+rfRaZdYy74d2ezKNzCjoNItJSLGSY4IFCzF3xa22+g295mFZLE8NU223MWubzjjh5FIy+l+HA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=k+tXib1XiY4++hXja8zoXeb2PNj4SrDnA7nNa6syYOo=;
 b=LlXEPjXDfmG2gpW6MH0Hrw2gM9ymOWH+sOqmWa0PUjNBHyGVyNAWN8qyCDGpgCHoC4JYfH8BFi8q3haN7O2sUiFxLChrqLUo6fFvrbnWkdAk9HMMyHk/vt2LnPgKOdQnZ7IVuEo4O/RE6ObjzaeCY68IcRfu0kQP0OEHFo2TQ8d2hB/vs8gwD3FjtEdGDidpDg++9TFmufXs5m/h18GYvJJWJSgn4hE/uY+Hb8AB6wkTFGqkmZMNOOVnu2PrlSzv9SVK2Hw0HTH81BDrf3o3nQ0utZHMR9An8V49tEFjE+9WpA6S9ASA7QQbasAEn4lO3JiheqBID/VPLTYZf2rxtQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oppo.com; dmarc=pass action=none header.from=oppo.com;
 dkim=pass header.d=oppo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oppo.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=k+tXib1XiY4++hXja8zoXeb2PNj4SrDnA7nNa6syYOo=;
 b=gNgL5klbu1a0/3Iwjcgds8Dm/8Qrc19bglmVonKObrav+NLs9tAKn1Jkr8UVy3i1855H2gqnKtKrGVxonuXxPidAPwF+XN725d/WEAeW9UMI8zB87XcZNSnt6HfdJFoUUgRh5p/k+UEqISWB8/mMRYEKVvdFn6fBVUDY9hEgeFU=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oppo.com;
Received: from SEYPR02MB6014.apcprd02.prod.outlook.com (2603:1096:101:6b::10)
 by SEYPR02MB7733.apcprd02.prod.outlook.com (2603:1096:101:20c::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7741.25; Thu, 4 Jul
 2024 02:58:08 +0000
Received: from SEYPR02MB6014.apcprd02.prod.outlook.com
 ([fe80::bb06:c283:a50:7796]) by SEYPR02MB6014.apcprd02.prod.outlook.com
 ([fe80::bb06:c283:a50:7796%7]) with mapi id 15.20.7719.029; Thu, 4 Jul 2024
 02:58:08 +0000
To: chao@kernel.org,
	jaegeuk@kernel.org
Date: Thu,  4 Jul 2024 10:57:31 +0800
Message-Id: <20240704025740.527171-2-shengyong@oppo.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20240704025740.527171-1-shengyong@oppo.com>
References: <20240704025740.527171-1-shengyong@oppo.com>
X-ClientProxiedBy: TYAPR01CA0220.jpnprd01.prod.outlook.com
 (2603:1096:404:11e::16) To SEYPR02MB6014.apcprd02.prod.outlook.com
 (2603:1096:101:6b::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SEYPR02MB6014:EE_|SEYPR02MB7733:EE_
X-MS-Office365-Filtering-Correlation-Id: c7cc720f-78a3-40da-4ddc-08dc9bd520f5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|52116014|366016|1800799024|38350700014; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?q3mPhi5hQgw3DEUcqPH9JR+2qfDSGoUdbylkvvYIBuKwTl4HT9QPtAFbMG7Q?=
 =?us-ascii?Q?wSY54/mpHRbOzwcFU7mo/0SnQG8Pjg7qaXtSepHPkEplFSyyTLuK8c4f3qTZ?=
 =?us-ascii?Q?qEpiGtMl+31RVsBB7ppW22l64fQ2vn0R6jdZtrWSR/e8cIEcp4S8bDxvixGC?=
 =?us-ascii?Q?Gw32VM0xysXAPOay+SX0r4meFNErCSqPSSQSrxxhKtsZEPs8Aa03iSlUsr/F?=
 =?us-ascii?Q?LsxcSP+/vUlmLLSuzOuOrjtlw58n96kQcgySVU4BYm+sRGwX3zl3tUaOL9t7?=
 =?us-ascii?Q?3d2LOGcVrgekzYbzkdbWo9ac2GgYzpZyHrCmEFZOC24AeovxDOaNJPFwCYRX?=
 =?us-ascii?Q?lSn10x7c0PavpsHyfi3ttUcNWp4AQaLgch6RqdCqVEalnn3yKG7hDdLT5Sno?=
 =?us-ascii?Q?oBjLXhXfjVd3bbxXyqTKN72ZNJ/zgT4yNxiYLWyk4Q4KhUPSHK6jmnIhZmdJ?=
 =?us-ascii?Q?N08V+4zdDGnsipDrjZ2/o23RJlbT7H8GxgsAm5F+lmXU6amrcPMiLitIhr23?=
 =?us-ascii?Q?LnUSk3HgqApvfIOSCEigrdoFSSm2RDZnpdrOG5NDXY0a1CVVZOfVvu0Dfnnu?=
 =?us-ascii?Q?5u+pRmlGy1fTx3wJMIuxoi2cHLU3NBgFgqYnyPu1j2V230IMaCuRIKfhyQZ4?=
 =?us-ascii?Q?IZaQxp/jEHz5P86fEV4IoVQsAh77832zRcVj/SdrcsDJVgaBvhGu3vSpIMfo?=
 =?us-ascii?Q?tYRcr910OUHaOwJ0qFJKl2ac/xcN4lruUBS60WnSkrNUFbE+nmSFRz10s5fl?=
 =?us-ascii?Q?4RXJQeek4tkGWKE7eO5nPkQGLX6VH0VZT1HYY56ETK8LsfOYXF4ztW/kLvaY?=
 =?us-ascii?Q?mJX9EgaO7PcJYkrC27zPR+NREKo01eUV2o42j8V8TP12IoKVEWd4WuYlaXqv?=
 =?us-ascii?Q?Ok4oGtgKI1L3wnDhiqwSSdXptRt/XKahEJoIa1ai94o2O8HcI4U7y/F20RGB?=
 =?us-ascii?Q?ZWo53mLlQdrKav+Dz85QhdMRfVNkSO05gig/OQeY0u0XhRXdsl48/ZoP/U4c?=
 =?us-ascii?Q?nAKbx/4i9WSEHjvPk34MPWfLqQ5G6gKU9l/2Wk/kv6Z5zTIx8d5ED6y32wHh?=
 =?us-ascii?Q?kfVr4rNsC5H/u4iX6sZXy/rLk9xSeoY6WoChjjPcsLGe9eFn/zAWkdBj9uvC?=
 =?us-ascii?Q?Ztl0W00YdwR1+Z6w+TlciG2kw0dWKThg71j/sVcoKKabkzWAAFvomMHmRig4?=
 =?us-ascii?Q?1vdhPxxxqmc8/OJotvGOZj8VfHqi+pF7kQBtmeMcgAWZAHD0ehYxrkFW3K7u?=
 =?us-ascii?Q?AbD6qfUohkMabPLZBMD2aWNKen1LWpig1v+u0mBzHKTzVdcBfdQMt+kHfmHP?=
 =?us-ascii?Q?qnsxo/WCgHDnlqVM5t8TIboxXY0t/SNqwUInnRFAzByWx+FhptPhzmFF6fWY?=
 =?us-ascii?Q?5tAh7qg7QlAcawsYMNClf/fsM8cJAngXZlTQIaiKNSgu9ji8VA=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SEYPR02MB6014.apcprd02.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(52116014)(366016)(1800799024)(38350700014); DIR:OUT;
 SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?b7NRamK7o+xJ0USARBjtNPqgpgAwopAKojyjKlln/80UDjOJEfD4pGpuqfZM?=
 =?us-ascii?Q?PXU5dTioTKOKsDx17r6aGKtcgjXPibgs8hrG9wwTON6E3lTl9EfbHDWNx8tR?=
 =?us-ascii?Q?MZtBkYCqtSweigADomnalXREA60xkRQEMwWhZBammL+/LNuDttEF66hwXEui?=
 =?us-ascii?Q?NFXN9ldHjU2Lpl5IjQs2lpwjoAdcTh7mrufBgxJhKjjAn/bIUmkNfpFbIwzQ?=
 =?us-ascii?Q?s3mL+ocP98ZRRfDJnEIp2kdRNalcO9a0eXj4S/RZLsc1xueFcQ79lMgS90cn?=
 =?us-ascii?Q?QUq88NJP/1d4K4XTD4yyWoJ5d/VS1BegneyVJKOxGSx/F1eZdTPWMteadiXL?=
 =?us-ascii?Q?AAekzIMFkf0ZH3GHvkjulS/Vt+GNmkP9hLdxL+Ts7hh1N/7lNEiN8NLtqq65?=
 =?us-ascii?Q?pXCx0jW4wZVCeE452RqLwvoyECCthbndfu/4XM8Wp2x8kPZrICO/R8zbReQ6?=
 =?us-ascii?Q?EbkGn0BvMhrAY16T/1oxSBVU/OD5WdxoYhwdFpfN3EuSF2toA1LSQ5Dd1SSa?=
 =?us-ascii?Q?lD76iyr4aDynsgpUCBF2y+NeJyBySJkGkCqRfPLcoIu1Q9de5NB4UrDIhR/a?=
 =?us-ascii?Q?attP/UfpEzC3K6N1LimgQUwvCGEiDu0A+n3uiNFO1+VuPu41vNiPmK7Ept9H?=
 =?us-ascii?Q?QkoYCnFW95ZZnHmegDu1YMGSB4yhLDbXyihgGmr0opBBJqiTa674vzG2FcQa?=
 =?us-ascii?Q?u2Mk7bjLv/zqNMzLQdU1y5+rA0Tec4sY7LFGcumU0eCmPWj8cuMUR3XCp0JK?=
 =?us-ascii?Q?1N91Prq/n9zhFA4GfmXLjsspPAa5cv81bcE9Z3+weUc7XKvFwb53RuZUjN4f?=
 =?us-ascii?Q?H03a4Sp7pov46TUJwklSNmvffmlAurdWNY7V2ISdfd/idV1TEdoltis2FIJt?=
 =?us-ascii?Q?GA7uPzRxqc/WPTI8LyFIZITSan847Clzi+vgJV2ERYAahIsiqF+P/t/o73u5?=
 =?us-ascii?Q?uG9qzZKZRrq7OovD8oYJ5xsfCrK/TsWUHPB6KvugTWywWysVZWYZ6S2n36Nb?=
 =?us-ascii?Q?seTk9WhcJPyx/Mv1Cvb7B8x5x0P+uxD/FMfQ7v7EYoEpw02CrnPSLs76AlmT?=
 =?us-ascii?Q?R8gZl3YUSdYtgvdc5d4qk7fbHl8bKsYBNZidtkY5MqJPsm+M4ZzRljW2DmPV?=
 =?us-ascii?Q?N7I6WDlnERPJXWwwbRak8lX8AGKihhK6Xwa5iNm4mws/a/TwiHCmWsLhWWxZ?=
 =?us-ascii?Q?v6Ic5n4WpW0d9Q4iUFebGhY8tuhkeM4qCWpqQeVkHRHAAyjMQiwRab1+gpZu?=
 =?us-ascii?Q?EmqsVD2LGwCB+SKzRnsbp6FJ47XCIG/Dph4UA6LDinHpv/GjYv1k4b6M8Y8z?=
 =?us-ascii?Q?u+D0I1OB5gv8FoVr32KdlkF3DZWOnh9xtZ/uN2DCan+oGJ9Z/EIIgy9bPvhk?=
 =?us-ascii?Q?9Pg7H6wSCUdml1h3NkKwGVUEi030A6Gj1CoAI0DlyvJ+AURC8XXZm5837119?=
 =?us-ascii?Q?FRCNBadkzsKiCrLna0IKBFe9a39t73EiQ0RMMWk6OpDNIl7g8Ddn+jbIN/Fs?=
 =?us-ascii?Q?rPzMN3nvUVIgArS5T9CzWCe4EPc5k9/n9Qxjpi/U3jv8evLdCBe7wf5sKLFp?=
 =?us-ascii?Q?7RNgKSHuzHX2LR6e3BUNuXRtDgOI+WRW4HdzfaEW?=
X-OriginatorOrg: oppo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c7cc720f-78a3-40da-4ddc-08dc9bd520f5
X-MS-Exchange-CrossTenant-AuthSource: SEYPR02MB6014.apcprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Jul 2024 02:58:08.0460 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f1905eb1-c353-41c5-9516-62b4a54b5ee6
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: mG+NAjWKYzAXe1GByAgwFAzLw05uapmvpM7o1feY4tUBJscH3Rfnsz2m88sDmBXVrbVG6Pkfb33uSftkvKw/WQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SEYPR02MB7733
X-Spam-Score: -5.2 (-----)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: Reviewed-by: Chao Yu <chao@kernel.org> Signed-off-by: Sheng
 Yong <shengyong@oppo.com> --- fsck/fsck.h | 3 +++ fsck/main.c | 2 +- 2 files
 changed, 4 insertions(+), 1 deletion(-) diff --git a/fsck/fsck.h b/fsck/fsck.h
 index 6cac926..4ca75b3 100644 --- a/fsck/fsck.h +++ b/fsck/fsck.h @@ -353,4
 +353, 7 @@ int update_inode(struct f2fs_sb_info *sbi, struct f2fs_node *inode, 
 int flu [...] 
 Content analysis details:   (-5.2 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 URIBL_BLOCKED          ADMINISTRATOR NOTICE: The query to URIBL was
 blocked.  See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URIs: oppo.com]
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [40.107.215.54 listed in list.dnswl.org]
 0.0 RCVD_IN_VALIDITY_CERTIFIED_BLOCKED RBL: ADMINISTRATOR NOTICE:
 The query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [40.107.215.54 listed in sa-trusted.bondedsender.org]
 0.0 RCVD_IN_VALIDITY_RPBL_BLOCKED RBL: ADMINISTRATOR NOTICE: The
 query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [40.107.215.54 listed in bl.score.senderscore.com]
 -0.0 SPF_HELO_PASS          SPF: HELO matches SPF record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [40.107.215.54 listed in wl.mailspike.net]
X-Headers-End: 1sPCg0-00011d-22
Subject: [f2fs-dev] [RCF PATCH v3 01/10] f2fs-tools: export is_digits
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
From: Sheng Yong via Linux-f2fs-devel <linux-f2fs-devel@lists.sourceforge.net>
Reply-To: Sheng Yong <shengyong@oppo.com>
Cc: linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

Reviewed-by: Chao Yu <chao@kernel.org>
Signed-off-by: Sheng Yong <shengyong@oppo.com>
---
 fsck/fsck.h | 3 +++
 fsck/main.c | 2 +-
 2 files changed, 4 insertions(+), 1 deletion(-)

diff --git a/fsck/fsck.h b/fsck/fsck.h
index 6cac926..4ca75b3 100644
--- a/fsck/fsck.h
+++ b/fsck/fsck.h
@@ -353,4 +353,7 @@ int update_inode(struct f2fs_sb_info *sbi, struct f2fs_node *inode,
 int flush_nat_journal_entries(struct f2fs_sb_info *sbi);
 int flush_sit_journal_entries(struct f2fs_sb_info *sbi);
 
+/* main.c */
+int is_digits(char *optarg);
+
 #endif /* _FSCK_H_ */
diff --git a/fsck/main.c b/fsck/main.c
index c13e287..c8469cd 100644
--- a/fsck/main.c
+++ b/fsck/main.c
@@ -171,7 +171,7 @@ void label_usage()
 	exit(1);
 }
 
-static int is_digits(char *optarg)
+int is_digits(char *optarg)
 {
 	unsigned int i;
 
-- 
2.40.1



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
