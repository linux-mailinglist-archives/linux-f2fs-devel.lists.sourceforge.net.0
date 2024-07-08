Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id F10AF92A1F2
	for <lists+linux-f2fs-devel@lfdr.de>; Mon,  8 Jul 2024 14:04:54 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1sQn6j-0006NV-Rb;
	Mon, 08 Jul 2024 12:04:38 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <shengyong@oppo.com>) id 1sQn6i-0006NJ-G4
 for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 08 Jul 2024 12:04:36 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=MIME-Version:Content-Type:Content-Transfer-Encoding
 :Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=hYIGXcSa0SjG3Y2pLis/l7KVZCGB7POrkhR8Rwldd24=; b=f6l0Krp7z85B5KLT1uz5yTMX+X
 4xTRIERHiT5jY2AeqlnIVd0TuUOMHBydNT91Y8Nq/AG0+Tz1ZKcQnMYBtlthTwnqhrRimlVxN/bMk
 rFXtSfumnL+uD0oe0zURgWiG/KkIQiaDSDYmZxnJygS1VEn/NSRR4hWK8wz313VR/nGM=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:Date:
 Subject:Cc:To:From:Sender:Reply-To:Content-ID:Content-Description:Resent-Date
 :Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=hYIGXcSa0SjG3Y2pLis/l7KVZCGB7POrkhR8Rwldd24=; b=b
 thHLSM+7Lm+K/6MhfF9Nt2sjgm474yeY7Y7si6UVj+BHPyKznTtopvFd17lkAlqQOOLK6WUMXuVKr
 9pZri89GMqo3Avu64yYZ5kcJzgdtUG6NYl/Hohwq/bgfDaPycsIf959CVHoaSnTMSNhyTo55RyfAL
 QTrY1xWZ6Pmj4D0o=;
Received: from mail-psaapc01on2057.outbound.protection.outlook.com
 ([40.107.255.57] helo=APC01-PSA-obe.outbound.protection.outlook.com)
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1sQn6i-0005O6-C8 for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 08 Jul 2024 12:04:36 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=B+AvR3BkOxCWSOtRNBhsz3cXmJGMpV0BW+9dJOme/5DKP4ZUQQtvcThtsEhCxZSU/bAq6Ui5abM4HiNfMQ/vvcvAPfG1fkHANS4afwYSLIfjBVtJF1RT7aiQcw7cPEnFK0FpXzTU3qBV3TjEPnKBv3t76QgVfLPmfoKwT/hrKDskP0DPPZBQBkG3ZBxpYz3yaTwJVYjJkp8kmuGSm1LuZgPbtHVydYW7tSoutftL3BHCprrpryrDKDBP1PoclehHOdFF0nbNsV2ijfDpsxJ3K3VWvXnbp9v6DsHImCYt1G/QkON6CHVES39xvh7S6gSENtAa8mNuKRa5qkVk2FMOpA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hYIGXcSa0SjG3Y2pLis/l7KVZCGB7POrkhR8Rwldd24=;
 b=I/JCVNnm5oWZoMpGnsZzwCOUXrUjDGzF2uUfLdW5astUBmlgMLprXlZHFoVYQTONpbu6QrXJSceS1Q80sw26YbyhaF9VhldBQYt/Eu0jeY39S7qFQ+bZFpVNqzcf0R6AoTZP5cmDi/P2O/qhJwGW8LLSq2bauGfHEacSzb5JkgksEQWCoum6tQWmd5v9ogDUG1biwd8+ymLWXNe2YxdBZcw7mev95Ov7aB5Ew6c2KJrwBVfSBn80bA029qRKwR09s9/0vmhEz8I+u1Ei659ePYIYaQvyK1ByflAIUgsiXof87KGIjIOGJ+Qx0veTrYX4AzpL8/7UeLxq37/UX+ALBw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oppo.com; dmarc=pass action=none header.from=oppo.com;
 dkim=pass header.d=oppo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oppo.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hYIGXcSa0SjG3Y2pLis/l7KVZCGB7POrkhR8Rwldd24=;
 b=LouQ1DA5d0UMXwtNnl8y/MxbKWZk7CHNtmqETFbOC/OBmIVRrPWPPFSDzfnBLilchoe/aYdmbGsYgd1MPj39eH0dgxFCeTkvDYpJ+ERMbYbe/P5a1o+by+lHBjied30L2QV0m3sRMAJ5ZFpjQT8mQ//IMFe4BaUUYdT48akusiY=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oppo.com;
Received: from SEYPR02MB6014.apcprd02.prod.outlook.com (2603:1096:101:6b::10)
 by TY0PR02MB5947.apcprd02.prod.outlook.com (2603:1096:400:205::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7741.35; Mon, 8 Jul
 2024 12:04:27 +0000
Received: from SEYPR02MB6014.apcprd02.prod.outlook.com
 ([fe80::bb06:c283:a50:7796]) by SEYPR02MB6014.apcprd02.prod.outlook.com
 ([fe80::bb06:c283:a50:7796%7]) with mapi id 15.20.7741.033; Mon, 8 Jul 2024
 12:04:26 +0000
To: jaegeuk@kernel.org,
	chao@kernel.org
Date: Mon,  8 Jul 2024 20:04:07 +0800
Message-Id: <20240708120407.2807639-1-shengyong@oppo.com>
X-Mailer: git-send-email 2.40.1
X-ClientProxiedBy: TY2PR01CA0020.jpnprd01.prod.outlook.com
 (2603:1096:404:a::32) To SEYPR02MB6014.apcprd02.prod.outlook.com
 (2603:1096:101:6b::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SEYPR02MB6014:EE_|TY0PR02MB5947:EE_
X-MS-Office365-Filtering-Correlation-Id: f4151172-422c-4419-ff10-08dc9f461cf5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|52116014|1800799024|366016|38350700014; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?1qUJWFt8SESCWr+5Elo7MEo2dP6IF9CwzoK3BOObxkwOfy/tPVGJI5TaTmqT?=
 =?us-ascii?Q?8c4yqdlMLXP39y4Oy4Ip3ZJhp4DQBwnY32/W8zDlDMqBG3T1T13b6JeedU2H?=
 =?us-ascii?Q?zGgzifjMiCdf077neXB1Hlnd7AVw7jPhZG09T/1vrje9fAtmu3SuQ/2ZXcPb?=
 =?us-ascii?Q?55ATOz48VxmJAaHZvrUKLsHqvaRontxg0bYnqrqx2DjFT69RroeVtR00CMC4?=
 =?us-ascii?Q?tzlkQlj4e9vSc2Lc49frMWs7IsZck/SpzIA7CeTD7cqbBUJcAifdyx6iCI8R?=
 =?us-ascii?Q?+8VHY/mW423VEXqUsVBHqQiEva6Ln7A0BfRXirXkEKp/eixneU65SqBDVIZ9?=
 =?us-ascii?Q?VhJ21DvxI/19TglEnwGgwsnIHeAMRld3GTP6D4dOcnJo4yxerBBTe9mB2vXy?=
 =?us-ascii?Q?Km+G+Qub0AOnmtpkwKsAvw5nHOi2pbD4Pv4VfEX8owXsd60bqdNWv5o8umjJ?=
 =?us-ascii?Q?+qabXfm8vqBEdJEvEQMhr2on7x1Ye1fRZRmqI3RZw5LrYjNDM5tzsMCWBH0z?=
 =?us-ascii?Q?JrvSpxdOFV7U1n0hGLefYUbYg4hZcF4chJSCqAgjlQECnIjfpTTcxqtkgvKo?=
 =?us-ascii?Q?sYUf+pLc9p9QGaWUAhSUXr4M27tH+7/GL6lIbdcgzHacsUV/m3R6RdZrU7m+?=
 =?us-ascii?Q?5EZB947crMpu6BDNmQVzBgfvkDKOB2h5wpWdyROeGUbwvO7egsjvSjSFTKjk?=
 =?us-ascii?Q?PIOjJHUboGvqvbSff89XJ4pN6wPuZ48qQ0ILfnn30NUXDgTRhAan5qPGMtO+?=
 =?us-ascii?Q?41qZuJV5zvXVpEvPkVj0yyfvi5mMwoWbazWa3NJJ55w7E6NNgl643H/XSKRr?=
 =?us-ascii?Q?5raK/aajsl+lgsPqIp/WqT0jpvF5ebo0BYifplSC0FnLmALE/0mFvuLrXCoM?=
 =?us-ascii?Q?RKRMW96rIswV2rL/9Cke8IXh5ZNl9SLXPh3jSTQFyeLYl5lqArioHRKYxVag?=
 =?us-ascii?Q?zqe5W6OjP9O9SfLroZ0MAtoyA3DcpmfQOOXd5lDe3xn2XEUADtcR5fKGbXSy?=
 =?us-ascii?Q?nUmCvhEsSLIVquw52h7PHgk/ynTjM+2utFDrS6BrTGrg97isMk9+JEj2mb3g?=
 =?us-ascii?Q?AGj1IAkEs5+yUEK3xycWF1wJdRjfXxKoWoImt59KoHdE0w1jB+qnJpynnTrF?=
 =?us-ascii?Q?yvDdRcPeRa+bozxvUDr8Qth6wBD9Ux7jmzUjLYnTxYRO5qa2Ll+xZ2p91ncz?=
 =?us-ascii?Q?O2saLy1Q9frcjZjt9D1doHddS55pPIY9+dY0HpTTE0BI50osj1Iqvq+ZWgSL?=
 =?us-ascii?Q?uB+xFgxgcMPtddMu5Lr65FTg2tTdjfxwT4uzio5Yraa2X9HQs2QM5nc2G1Wj?=
 =?us-ascii?Q?woSV+WP5wZjjOb/7IYxT6TuD/5NO0DAlrzsyTXOFOibz71w+14WSdKgR9wOU?=
 =?us-ascii?Q?LCxAwwpflsDgLa7BNwOwcmNi1ICA4PcM2Uwd95KdnNHV7csIOQ=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SEYPR02MB6014.apcprd02.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(52116014)(1800799024)(366016)(38350700014); DIR:OUT;
 SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?oYyuaPkDTFs+V8riRDrlZ2Jw0ypMWdozz7K9kBhWuoZAWBTYS1+HHVkhdDfJ?=
 =?us-ascii?Q?KXz4GtCErZy1JHSW62OXfU1dmpJIWc96oCyhuWFmjP0PPEGDd7BzZqspGu5T?=
 =?us-ascii?Q?aife2Gt5XWbEi8XYdzGNaIYSo0UX+cACgTeYKw5EleiSmbKzMnDqWix5n1P4?=
 =?us-ascii?Q?Jaf16YGFfZK4CpQkh1OfpUq1YC3Dr/u0awtbgro7UD1GHDmyz3PLwUa/Sfqh?=
 =?us-ascii?Q?UXhoA53cllsx7thQrEZ4r2pQYw8iTTtYn08APHcR+OyudJpVEMwnXNqqToB5?=
 =?us-ascii?Q?SQdwyzzdybtm9wqgFRDO/6ZcrkCGH6jP+yKGiDJlsQT19UE4GFOt6UJOgTGd?=
 =?us-ascii?Q?Pb70YHg5y8diZT2QBqMsQZs3dZwS2mqaGErbXw/JYbLonIbxEn1LCQSzAKDQ?=
 =?us-ascii?Q?fVrwPUXYEyZEMy0gGj++WzGdr0LE0AN0mSmgA0ZbjRKJk7dWUwMGrex+QFOd?=
 =?us-ascii?Q?LeNlPrBRWR+Z2evsBbupfBhjiHPZGATNORBS5/ljENz8Ul/KdcLUwDZbQ5Rt?=
 =?us-ascii?Q?h6beIJ2qbv5+8aJ5lYPibtmJi9Hdr1lONTGCoHqQXX4UP7q41Om14EU1yfIW?=
 =?us-ascii?Q?2SwzPGFBSOSPguaSmBPaXsfykfchSIiNaTtKMgBK5KIPKeHppY6q4S9rSanD?=
 =?us-ascii?Q?bb+F3c/Hc90UDgbvsgtLQTz8d+LqV8cOkVQ1rjx/Zce2GNskV1+qPb8J6g1Z?=
 =?us-ascii?Q?tfDTCJ/hZaWR/quYHlVizIljbKa0AiNp5J2SDzO/gTMitcIUPt1HqzYs/zkL?=
 =?us-ascii?Q?NgPO99h9wI44I09zGNi4c+DNX24663KVQITHbFPHo3FMNiT2+9SRafNCaB/D?=
 =?us-ascii?Q?U57kuD4cv62SZ21dVMCHYyrfp4jdycQ9K3UVNoiE1IBsHD/Xzhw0yGZnUwbH?=
 =?us-ascii?Q?Pyax/rOA1Gx1n7axNkYtGzP012zUOIgk7oRI5H3DfdnAJe4ZccxlokGEPLj5?=
 =?us-ascii?Q?KVxDDCteS8dEsjGvbocU5isOvI/nR1Pqy+p5u0DIlZILvUKUkzGVKuUyTnam?=
 =?us-ascii?Q?tCorACKfWYtviBEGvaXugzs4hMOugVM9UlrMwrBSMWCW3TguiZOpus8UeB9h?=
 =?us-ascii?Q?vb27zK/3wBXrblqBTFMHOI/xyapk3v4SKMgaXp030U1lBkR0ju+RVMwkZ5t0?=
 =?us-ascii?Q?JmqKiX8hE5gD3aDADvyeTIR2KCbNq4R6wILeCOgXz/EJq9w0Im9bnt6u7Fhf?=
 =?us-ascii?Q?gQXKx+nbJLk7LbxRLE+qM/v9nocofsj0O8p0MD/LCy2GnRgd8L3C+zBUQm6B?=
 =?us-ascii?Q?qbAiOa0Z9xmFNioKeRgcJsItlpD94pYSUqLL+8Eleb5sWygly1sZ0YyejAt0?=
 =?us-ascii?Q?9EkYB+ZTRPxh/Y3VF508w/ycDzPAThmvA8EkDle/uMNBCpir5X7fP+MPmUh9?=
 =?us-ascii?Q?dx+qBgmW77KkJloWKRUfWiI3vo+UcXxQe/i/wZX4M7cQn0+vnbK48A9jR2YC?=
 =?us-ascii?Q?iVPuCk2E0ozGyZIaa6uC7GAMANl+h22wfsy+GVoARhEGfbn+YK8RIljsEmtG?=
 =?us-ascii?Q?UPXh9Tz9z3LnOniawtlCn04UBM6rPYjNaQ7wZwaUA0gvtrfRXncIImXWtX+m?=
 =?us-ascii?Q?J6RgchToXDMlX6IHD/e96oZuaXFV3O37Cd9Zpthq?=
X-OriginatorOrg: oppo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f4151172-422c-4419-ff10-08dc9f461cf5
X-MS-Exchange-CrossTenant-AuthSource: SEYPR02MB6014.apcprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Jul 2024 12:04:26.4062 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f1905eb1-c353-41c5-9516-62b4a54b5ee6
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: e5CluB/So/y3SvzP0fd39FbC748S4oKOYF40TdNz0TeDNCqVBSuED7jGaM/1mI3+wa7kcLJe/A5t3F9e7BdrcA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY0PR02MB5947
X-Spam-Score: -5.2 (-----)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: get_ckpt_valid_blocks() checks valid ckpt blocks in current
 section. It counts all vblocks from the first to the last segment in the
 large section. However, START_SEGNO() is used to get the first segn [...] 
 Content analysis details:   (-5.2 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 URIBL_BLOCKED          ADMINISTRATOR NOTICE: The query to URIBL was
 blocked.  See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URIs: oppo.com]
 0.0 RCVD_IN_VALIDITY_CERTIFIED_BLOCKED RBL: ADMINISTRATOR NOTICE:
 The query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [40.107.255.57 listed in sa-trusted.bondedsender.org]
 0.0 RCVD_IN_VALIDITY_RPBL_BLOCKED RBL: ADMINISTRATOR NOTICE: The
 query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [40.107.255.57 listed in bl.score.senderscore.com]
 -0.0 SPF_HELO_PASS          SPF: HELO matches SPF record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [40.107.255.57 listed in wl.mailspike.net]
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [40.107.255.57 listed in list.dnswl.org]
X-Headers-End: 1sQn6i-0005O6-C8
Subject: [f2fs-dev] [PATCH v2] f2fs: fix start segno of large section
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
Cc: linux-kernel@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

get_ckpt_valid_blocks() checks valid ckpt blocks in current section.
It counts all vblocks from the first to the last segment in the
large section. However, START_SEGNO() is used to get the first segno
in an SIT block. This patch fixes that to get the correct start segno.

Fixes: 61461fc921b7 ("f2fs: fix to avoid touching checkpointed data in get_victim()")
Signed-off-by: Sheng Yong <shengyong@oppo.com>
---
v2: use GET_SEC_FROM_SEG and GET_SEG_FROM_SEC to get start segno of section
---
 fs/f2fs/segment.h | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/fs/f2fs/segment.h b/fs/f2fs/segment.h
index e1c0f418aa11..bfc01a521cb9 100644
--- a/fs/f2fs/segment.h
+++ b/fs/f2fs/segment.h
@@ -347,7 +347,8 @@ static inline unsigned int get_ckpt_valid_blocks(struct f2fs_sb_info *sbi,
 				unsigned int segno, bool use_section)
 {
 	if (use_section && __is_large_section(sbi)) {
-		unsigned int start_segno = START_SEGNO(segno);
+		unsigned int secno = GET_SEC_FROM_SEG(sbi, segno);
+		unsigned int start_segno = GET_SEG_FROM_SEC(sbi, secno);
 		unsigned int blocks = 0;
 		int i;
 
-- 
2.40.1



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
