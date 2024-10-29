Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 652809B493A
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 29 Oct 2024 13:11:57 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-3.v29.lw.sourceforge.com)
	by sfs-ml-3.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1t5l4i-0007yS-2K;
	Tue, 29 Oct 2024 12:11:51 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-3.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <shengyong@oppo.com>) id 1t5l4g-0007yL-93
 for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 29 Oct 2024 12:11:49 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=MIME-Version:Content-Type:Content-Transfer-Encoding
 :Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=eZzNuU+F9sEszcO3TobWIhbBX4S8xVz53g0egORUd7Y=; b=DVdMTRTcTmuTY8ThbcxWI4/v4j
 6Vobw3ZwZryv0k4+OxEfjdCgKZ/CqAnD2t2CwHTw0Yn3lPSV7Z0w2dlIJCzqzbyT3gGzinqOAVcH9
 S/WyDVdNv2fASd8nw3fPmINnQrSdjpZ2Y/EP5H42YBKeJlghJxLHtfYskJ7qcf9xsZ8k=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:Date:
 Subject:Cc:To:From:Sender:Reply-To:Content-ID:Content-Description:Resent-Date
 :Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=eZzNuU+F9sEszcO3TobWIhbBX4S8xVz53g0egORUd7Y=; b=S
 shrsrE0CV1zS69aWaVd95gOv8J+mj9nC3/7QWP/NazlDLMHIp3JXVsP68OsPMKfxVXhIt1aMWL2a0
 tk8BwSQS18HAOtlfbrDCPbsjECwY5L5MLnh/YhbgabfJtUXD7HDNqPwt4dQseIQIO4CIaTID6nLgM
 QNoV0ZO/ioGGfw1w=;
Received: from mail-psaapc01on2084.outbound.protection.outlook.com
 ([40.107.255.84] helo=APC01-PSA-obe.outbound.protection.outlook.com)
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1t5l4d-0007Qb-Sa for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 29 Oct 2024 12:11:49 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=BIMf9mx5tNcvfgWlb9X4T1X52d6k/tonYiw8I5XZoq5bRmV529PZHIFK4+C8hr7sNjRFBD182oBs0PBPe3qX2iY5ZseSEEmhTeEpm/V1GH9RSYxwezlBBF0uJE2MehT8pkbbNj0shh8E5I6SI4LW0tqU6FQTVwnC3p8PsgpctVl7CY0U0n/ifGtMnOZfUTeKd2L4XXUDf1cf0pGQUxJp1xilRNrR8Im8h2ytozUnA8vemE4MTLMn7T8c4SQzfo8viAyno8th/Tv2j8cLqJhXyVgucsD/XV9wHmHgMVRqLhmH0akLnXb8yyHxq6vO056ipgIuq1rGBspJfCX2CYMNIg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=eZzNuU+F9sEszcO3TobWIhbBX4S8xVz53g0egORUd7Y=;
 b=xiDLDKU38Lk5lMjsRKT3fp/OxrexLjXRnvUepQq/A05260wHb23gBdBnFBm0veoiCiFX+CmdIYduwFiUaK6qaLgi6T75zqUsw3nCSLmSlZj8XV07GTu3cXi3dgse+bMtMo72EFMtpn/CpN3HE/LfFGZ9E2BPnAn82natVYDufLl+BRw6wz3DyXhFSUjR5oP8z7LP0rGkoWiIKhCrfOoip3NLce+kMrzS0L4VjnfCkDxVkYrNUqf6fJ0zLbPIcIrXYINuWWAQGD5ZleCUnPkXM4XFuNbmcPLdJ3heM6f2IGWoUQbH4/5Sr/8MbBpl6fJB1wX0pcFIT497mK3nX37/1A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oppo.com; dmarc=pass action=none header.from=oppo.com;
 dkim=pass header.d=oppo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oppo.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=eZzNuU+F9sEszcO3TobWIhbBX4S8xVz53g0egORUd7Y=;
 b=ffAYg1MEKF7vUa2wpkdlZ+wHv1L/mELnBvOluaRZqMQSDM4ysGTANfyeL3peLy2PiK8ev1h7S3aEEa4wTjawPa3x9nUlrQ8rB0bCE21H05CCyFT8GfuhaXty5uk3QoVffoxKfnEXKBcOHP/hRcyvs6rd0vrogrpSCMg7wc5JrS0=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oppo.com;
Received: from SEYPR02MB6014.apcprd02.prod.outlook.com (2603:1096:101:6b::10)
 by SEZPR02MB7326.apcprd02.prod.outlook.com (2603:1096:101:1f4::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8093.32; Tue, 29 Oct
 2024 12:11:27 +0000
Received: from SEYPR02MB6014.apcprd02.prod.outlook.com
 ([fe80::bb06:c283:a50:7796]) by SEYPR02MB6014.apcprd02.prod.outlook.com
 ([fe80::bb06:c283:a50:7796%7]) with mapi id 15.20.8093.023; Tue, 29 Oct 2024
 12:11:27 +0000
To: jaegeuk@kernel.org,
	chao@kernel.org
Date: Tue, 29 Oct 2024 20:09:32 +0800
Message-Id: <20241029120956.4186731-1-shengyong@oppo.com>
X-Mailer: git-send-email 2.40.1
X-ClientProxiedBy: SG2PR01CA0175.apcprd01.prod.exchangelabs.com
 (2603:1096:4:28::31) To SEYPR02MB6014.apcprd02.prod.outlook.com
 (2603:1096:101:6b::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SEYPR02MB6014:EE_|SEZPR02MB7326:EE_
X-MS-Office365-Filtering-Correlation-Id: e63e7976-8e89-4a06-d727-08dcf812d07f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|52116014|376014|1800799024|38350700014; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?Tl5Wnua4lOPBDmIbXBDMnc7VyjWKBhY5kOIG96rKJ7CNXTL/3HvhplUe5ovX?=
 =?us-ascii?Q?xxyLyhIEd05UikMDiw1ZJ9rLIOVyAIZFtT1YtsNtqcanQBoJJLVyXoLGLnl2?=
 =?us-ascii?Q?9zDz+42bHnopM8SlOWCjqNBT6g6YlVQ0DZAMbTRe/WQ7wNXyPjxePFPbRl9i?=
 =?us-ascii?Q?aB4r9t0mAGAmZo6/8DaHB4sD1RHAKqEEBf+5LOKRACnaXB2nDDxwS2L7dlaY?=
 =?us-ascii?Q?SJAt5yRvDuuApN0/RKmu03VBVdKaC9MrOi4JyICGQPmuMtUqiOX7fQRd+ovz?=
 =?us-ascii?Q?F+jtJ+6xTK0jHtFvVQk+G2Dngmh4eyejRY0s+dvnpqc5gSyDLACkNeIexxAk?=
 =?us-ascii?Q?+jF045Dvresuau8KrUDwpJrOKWQ6TFmCT+RKYDU7Nc+1BRiA/9bRroNPxVaI?=
 =?us-ascii?Q?/AWKNjAHe/2PL6I+zuEQc5RPek4uJrviCXM0zg5xVhlJfFbFEKHQRZ6IFyz3?=
 =?us-ascii?Q?cKVmx2RkUX41rc/Ayfd7NiH7tL3SmLJFzsQGQbfWVvOfXrm6dFrRTt/uqVak?=
 =?us-ascii?Q?NG6lZ7NVurVIlc8F7WuhPdGjMZcK28qwMf/g4GlrdQZXrqx4xUNmpik9KSD6?=
 =?us-ascii?Q?yBzWz83C4bEy2d6v2+PKOOzGN6r05AfbDIP2E+xaIX42p4zQ+k3B1BugTaLy?=
 =?us-ascii?Q?lxjjX1Fe5Rrawk650YXWP4ICd6wqvbjMT2jD+eKpzFXzyexw81bsmDFd1UnV?=
 =?us-ascii?Q?hV0BCXN5nAEdwjdIDNEWcHVtQNnoKv1E717KWSfVxCPHxcINfomEZ3BbgvtH?=
 =?us-ascii?Q?Jk848jIwXPngOxmslceEH2hhEqhZo/F7+MF41vDxNSx3EllKguHlCAQLeixD?=
 =?us-ascii?Q?Qi1kMKHXYDWNY+jUHnGdIIM9uPXqeYbc4EDa4Pv5IdqOXJ/I2gpKs3vF6Qz0?=
 =?us-ascii?Q?t2kVS64faniM6z5OW7U7jBxOeHNXBfhy0f/LaszQNVdllvugeIBxib92rOKQ?=
 =?us-ascii?Q?LZ09+a6ZWwPz9mWkEFNO4zByWrFQewWtjhxtzsNb5tm5IFJHdmY4SmYSz76f?=
 =?us-ascii?Q?jheAikTDpuUHETE8t0nbqptHCg8CDaHm0VTB2DUpiWB5g/34TY5StdHxmg1o?=
 =?us-ascii?Q?lwUZHMOySDPpC5Q+nLU7jK45Mm8IoL6xtgx3FrRxZY0uK0obDm+O6YvFDNdU?=
 =?us-ascii?Q?J1xWIPwz0Q53hqTB/jl6pXhlvLXqmzFOIUYVTteWNL6qtA3mgzEU6bDAjCjh?=
 =?us-ascii?Q?odJehIkuXrh5ITFi1V/Gx2vvvgFfKmixR4YHgBWaWrplcW2/jfm/pd5kIOvu?=
 =?us-ascii?Q?AirFZUXivFyahZNqIIdW/3fYuqPB/rEbC3n8iZBIP64cG3tPx1v1sT/WmN61?=
 =?us-ascii?Q?2h3Gk6Adh1n+2I5CwAVNMwgfU03nEJhKDvlIPINquRIJ6mjDqfxWPtjL8Cdd?=
 =?us-ascii?Q?ljzif4U=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SEYPR02MB6014.apcprd02.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(52116014)(376014)(1800799024)(38350700014); DIR:OUT;
 SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?x+t3eWTTwTPkWSdoxa3OxZWCiRYDBdDX4nNeWExJMdpwVySbi2f63lePb8Sf?=
 =?us-ascii?Q?YpT8nljAzyKtDrWK5T+SZRbl7elVTIGfSaP3D4jufNfEzVlP+TJEsj+mkBBU?=
 =?us-ascii?Q?hl3t8oMnBJG2a0+4i5nsdaZAyS4VFC9ZBlZfBr0ld7UMCR4k24KsXCgHail/?=
 =?us-ascii?Q?KXrscKyTAKnzaeTXF67yVU62DyOrXdZuHT92uFFsvMJrmZ6258zw3pKMcQPn?=
 =?us-ascii?Q?aIVAQQI3m1loKRtdKEXqBdbs8Mm8Z5OlqS9LrkvpQiP5jm1chfBcioXzqpOT?=
 =?us-ascii?Q?grNinlTT37ZznUkSnZe0W7U1i/uNaJTNOXF29MFMnmlX+U6MXaG6iaxHmlpq?=
 =?us-ascii?Q?3TVih7N7K1spwJuYRxQQ9OYHH2dqQhXI9T52aOvFmTg7MketFWm02N995BB8?=
 =?us-ascii?Q?r6si+4zn06+AAdaTZ8QLwrWtCK6AOl0//Kv0wlyShFp8EOJO5lajBUBx6THQ?=
 =?us-ascii?Q?F+044XVxnp7ESIx2JdfO4YU0F+B+bJGE4SoOcZlsIi/liCvSDsqNBa2SW06l?=
 =?us-ascii?Q?Q9f78B/ipDgGK5JDAdGl8xnOdm62ki40KfY+tVKmvYaL6DAoZdc9CMzpD2vE?=
 =?us-ascii?Q?FFLwKvXeNAKDFRJcXvXTALa+zIhh8TijEueEF8EB2s+efCclz9OWsVZdF0Am?=
 =?us-ascii?Q?3tj6kP9ms+rocRnbB4604s+NvhIMPid2M/S6jdtcz+mEa0qe8oa760axWavV?=
 =?us-ascii?Q?1QJmHOYXL11ekyxJmuDCNi4evbN71gJZg7FrdrWBUpPhGV6IVaN6ZVE0ZLR5?=
 =?us-ascii?Q?aiXlNQrE8sfCNahmQFcUjPYEbj3fH/InRcX8WVl20wO8X6bXzIRW1tAj65Bf?=
 =?us-ascii?Q?i4kUavkM1VPRraZSIo49JcdQXjB3vIacMd4yS0bHXxd4EXTC5OMG8mUDzCUa?=
 =?us-ascii?Q?oF/NoX0jASf0b5dFZG3VUj8Qiy6Of3+fgn6eKq6GgIZ4R9JSqTbgtLL3jFEX?=
 =?us-ascii?Q?jrga+lFw9MGV8H5P+RywkgxFZObOwAlb2idaUUMBL5Ow2VUy4ntaW5psujSx?=
 =?us-ascii?Q?VNkrMlMNjI3M6oyruQi1XweEgi1wAAzS8nMdmauarZAPo0YSOy1fysf39hHg?=
 =?us-ascii?Q?1/RirDuY5PYp2sTdveuS2mSby8SDUbdxpca3N2xKo0pVE3qQLo0s1DhQv2gQ?=
 =?us-ascii?Q?1XkFAb4nUCe9887EBZ7CsMU5+h5aKypchrSQbwplBrphi2QSVSzg+sr/BlbI?=
 =?us-ascii?Q?i7hIuOst3yKJC7emMWVoqQ1aTM/tWIEw2cFnKOWnlnDDh5wcUODnGUQ2FL9o?=
 =?us-ascii?Q?GJw8aU6UD4kh9wrM2nCMf+oe0DihUc2VJdGxkGo0neTlAQYHRQlSseK1BIwb?=
 =?us-ascii?Q?dauRkBliI1MKkCrnmit+okIUHXtcf1EscW16vMeUYPPkcKfgJeV45kEansiE?=
 =?us-ascii?Q?Uq+Ss+s5itbNrpSJTDkK2qcwh3ijaWV4qM5vxKEs+j9SchHZK8Cz4zJVpgtp?=
 =?us-ascii?Q?CkW1RxBC0GUJZNp1bepNhaWAvi7PbikfFjdDlC1kkSJR+GAhImnmVzPKqEQe?=
 =?us-ascii?Q?gxv/Ula/BDsysUu5xunCN8yGX7QXecj2m6D0FkN0UWmM0bJ7p/OapeDKCYjO?=
 =?us-ascii?Q?Ljtvlayp0t846RWbbd6TXQQaYdjNEVWnzicehk4q?=
X-OriginatorOrg: oppo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e63e7976-8e89-4a06-d727-08dcf812d07f
X-MS-Exchange-CrossTenant-AuthSource: SEYPR02MB6014.apcprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Oct 2024 12:11:27.3199 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f1905eb1-c353-41c5-9516-62b4a54b5ee6
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: IqLW9/fhIzyOxNWwS3yvj9JHaoh0UhVUgIT/TkzlQOkE8KEkYxdQZDk8BHZ2UVdbUv5ehvFV0YhCPQzUoEdmhg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SEZPR02MB7326
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  Hi,
 all This patchset tries to add an auto testsuit for f2fs-tools
 (fsck only for now). The basic idea of these testcases are: 1. create f2fs
 image 2. corrupt the image by inject specific fields 3. fsck fixes the image
 4. verify fsck output with expected message 
 Content analysis details:   (-0.2 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
 no trust [40.107.255.84 listed in list.dnswl.org]
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [40.107.255.84 listed in wl.mailspike.net]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.0 SPF_HELO_PASS          SPF: HELO matches SPF record
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
X-Headers-End: 1t5l4d-0007Qb-Sa
Subject: [f2fs-dev] [RFC PATCH 00/24] f2fs-tools: add testcases
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

Hi, all

This patchset tries to add an auto testsuit for f2fs-tools (fsck only
for now).

The basic idea of these testcases are:
 1. create f2fs image
 2. corrupt the image by inject specific fields
 3. fsck fixes the image
 4. verify fsck output with expected message

Some helper scripts are provided:
 * test_config.in: is used to derive basic configurations of all
                   testcases.
 * runtests.in: is used to derive `runtests' which is used to run
                testcases.
 * filter.sed: removes unnecessary messages and cleanup arbitrary
               values.
 * helpers: provides helper functions

The usage of `runtests':
 * run all testcases:
     runtests
 * run one testcase:
     runtests <testcase directory path>
 * cleanup previous results:
     runtests clean

Some testcase requires root permission to mount the image and create
files.

Each testcase should have a sub-directory, where three files are needed:
 * README: describe information of the testcase
 * script: testcase itself
 * expect.in: is used to derive expected output message
an optional file is:
 * img.tar.gz: if some scenario is too complex to create by script, the
               gz file could be prepared in advance, and the operations
               of how to create the image should be described in README

New files are generated in the testcase directory after test:
 * log: output in detail
 * expect: derived from expect.in
 * out: output that will be compared with expect
 * PASS: testcase is passed
 * FAIL: testcase is failed, in which differ of out and expect is saved

The name of testcase directory has some optional prefix:
 * f_: fsck testcase
 * m_: mkfs testcase
But there are only fsck testcases for now.

To run testcases, it's better to compile fsck.f2fs as statically linked
executable, or `make install' installs tools and libraries. Otherwise,
libtool compiles f2fs-tools in debug mode and create a wrapper script
to locate elf executable and libraries. However, dump.f2fs and inject.f2fs
cannot be used in the wrapper way.

PATCH 1,2: change dump.f2fs 
PATCH 3: overwrite invalid cp with backup cp
PATCH 4~7: allow inject.f2fs to corrupt more fields
PATCH 8: add helper scripts for test
PATCH 9~end: add testcases

Sheng Yong (24):
  f2fs-tools: add option N to answer no for all questions
  dump.f2fs: print checkpoint crc
  fsck.f2fs: fix invalidate checkpoint
  inject.f2fs: add members in inject_cp
  inject.f2fs: add member `feature' in inject_sb
  inject.f2fs: add members in inject_node
  inject.f2fs: add member `filename' in inject_dentry
  tests: prepare helper scripts for testcases
  tests: add fsck testcase of fixing bad super magic
  tests: add fsck testcase of fixing errors recorded in sb
  tests: add fsck testcase of fixing cp crc
  tests: add fsck testcase of fixing nat entry with invalid ino
  tests: add fsck testcase of fixing nat entry with invalid blkaddr
  tests: add fsck testcase of fixing sit entry type
  tests: add fsck testcase of fixing sit entry vblocks
  tests: add fsck testcase of fixing sit entry valid_map
  tests: add fsck testcase of fixing sum entry nid
  tests: add fsck testcase of fixing sum footer type
  tests: add fsck testcase of fixing sum entry ofs_in_node
  tests: add fsck testcase of fixing invalid i_addr
  tests: add fsck testcase of fixing dentry hash code
  tests: add fsck testcase of fixing lost dots
  tests: add fsck testcase of fixing duplicated dots
  tests: add fsck testcase of fixing loop fsync dnodes

 .gitignore                            |  13 ++
 Makefile.am                           |   2 +-
 configure.ac                          |   1 +
 fsck/dump.c                           |   3 +
 fsck/f2fs.h                           |   6 +
 fsck/fsck.c                           |   2 +-
 fsck/fsck.h                           |   3 +-
 fsck/inject.c                         | 207 ++++++++++++++++++++++++--
 fsck/inject.h                         |   1 +
 fsck/main.c                           |  14 +-
 fsck/mount.c                          |  32 +++-
 include/f2fs_fs.h                     |   1 +
 man/inject.f2fs.8                     |  37 ++++-
 tests/Makefile.am                     |  28 ++++
 tests/f_cp_bad_crc/README             |   5 +
 tests/f_cp_bad_crc/expect.in          |  22 +++
 tests/f_cp_bad_crc/script             |  46 ++++++
 tests/f_dentry_bad_hash/README        |   8 +
 tests/f_dentry_bad_hash/expect.in     |  62 ++++++++
 tests/f_dentry_bad_hash/script        |  71 +++++++++
 tests/f_dentry_dup_dots/README        |  11 ++
 tests/f_dentry_dup_dots/expect.in     | 150 +++++++++++++++++++
 tests/f_dentry_dup_dots/script        |  58 ++++++++
 tests/f_dentry_lost_dots/README       |   7 +
 tests/f_dentry_lost_dots/expect.in    |  74 +++++++++
 tests/f_dentry_lost_dots/script       |  46 ++++++
 tests/f_inode_bad_iaddr/README        |   6 +
 tests/f_inode_bad_iaddr/expect.in     |  38 +++++
 tests/f_inode_bad_iaddr/script        |  58 ++++++++
 tests/f_loop_fsync_dnodes/README      |  39 +++++
 tests/f_loop_fsync_dnodes/expect.in   |  40 +++++
 tests/f_loop_fsync_dnodes/imgs.tar.gz | Bin 0 -> 173228 bytes
 tests/f_loop_fsync_dnodes/script      |  16 ++
 tests/f_nat_bad_blkaddr/README        |   4 +
 tests/f_nat_bad_blkaddr/expect.in     |  39 +++++
 tests/f_nat_bad_blkaddr/script        |  35 +++++
 tests/f_nat_bad_ino/README            |   4 +
 tests/f_nat_bad_ino/expect.in         |  39 +++++
 tests/f_nat_bad_ino/script            |  39 +++++
 tests/f_sb_bad_magic/README           |   3 +
 tests/f_sb_bad_magic/expect.in        |  40 +++++
 tests/f_sb_bad_magic/script           |  16 ++
 tests/f_sb_errors/README              |   5 +
 tests/f_sb_errors/expect.in           |  59 ++++++++
 tests/f_sb_errors/script              |  23 +++
 tests/f_sit_bad_type/README           |   5 +
 tests/f_sit_bad_type/expect.in        |  34 +++++
 tests/f_sit_bad_type/script           |  45 ++++++
 tests/f_sit_bad_valid_map/README      |   5 +
 tests/f_sit_bad_valid_map/expect.in   |  35 +++++
 tests/f_sit_bad_valid_map/script      |  50 +++++++
 tests/f_sit_bad_vblocks/README        |   5 +
 tests/f_sit_bad_vblocks/expect.in     |  34 +++++
 tests/f_sit_bad_vblocks/script        |  45 ++++++
 tests/f_ssa_bad_nid/README            |   5 +
 tests/f_ssa_bad_nid/expect.in         |  34 +++++
 tests/f_ssa_bad_nid/script            |  44 ++++++
 tests/f_ssa_bad_ofs_in_node/README    |   5 +
 tests/f_ssa_bad_ofs_in_node/expect.in |  34 +++++
 tests/f_ssa_bad_ofs_in_node/script    |  44 ++++++
 tests/f_ssa_bad_type/README           |   5 +
 tests/f_ssa_bad_type/expect.in        |  34 +++++
 tests/f_ssa_bad_type/script           |  39 +++++
 tests/filter.sed                      |  60 ++++++++
 tests/helpers                         | 157 +++++++++++++++++++
 tests/runtests.in                     |  46 ++++++
 tests/test_config.in                  |  47 ++++++
 67 files changed, 2196 insertions(+), 29 deletions(-)
 create mode 100644 tests/Makefile.am
 create mode 100644 tests/f_cp_bad_crc/README
 create mode 100644 tests/f_cp_bad_crc/expect.in
 create mode 100644 tests/f_cp_bad_crc/script
 create mode 100644 tests/f_dentry_bad_hash/README
 create mode 100644 tests/f_dentry_bad_hash/expect.in
 create mode 100644 tests/f_dentry_bad_hash/script
 create mode 100644 tests/f_dentry_dup_dots/README
 create mode 100644 tests/f_dentry_dup_dots/expect.in
 create mode 100644 tests/f_dentry_dup_dots/script
 create mode 100644 tests/f_dentry_lost_dots/README
 create mode 100644 tests/f_dentry_lost_dots/expect.in
 create mode 100644 tests/f_dentry_lost_dots/script
 create mode 100644 tests/f_inode_bad_iaddr/README
 create mode 100644 tests/f_inode_bad_iaddr/expect.in
 create mode 100644 tests/f_inode_bad_iaddr/script
 create mode 100644 tests/f_loop_fsync_dnodes/README
 create mode 100644 tests/f_loop_fsync_dnodes/expect.in
 create mode 100644 tests/f_loop_fsync_dnodes/imgs.tar.gz
 create mode 100644 tests/f_loop_fsync_dnodes/script
 create mode 100644 tests/f_nat_bad_blkaddr/README
 create mode 100644 tests/f_nat_bad_blkaddr/expect.in
 create mode 100644 tests/f_nat_bad_blkaddr/script
 create mode 100644 tests/f_nat_bad_ino/README
 create mode 100644 tests/f_nat_bad_ino/expect.in
 create mode 100644 tests/f_nat_bad_ino/script
 create mode 100644 tests/f_sb_bad_magic/README
 create mode 100644 tests/f_sb_bad_magic/expect.in
 create mode 100644 tests/f_sb_bad_magic/script
 create mode 100644 tests/f_sb_errors/README
 create mode 100644 tests/f_sb_errors/expect.in
 create mode 100644 tests/f_sb_errors/script
 create mode 100644 tests/f_sit_bad_type/README
 create mode 100644 tests/f_sit_bad_type/expect.in
 create mode 100644 tests/f_sit_bad_type/script
 create mode 100644 tests/f_sit_bad_valid_map/README
 create mode 100644 tests/f_sit_bad_valid_map/expect.in
 create mode 100644 tests/f_sit_bad_valid_map/script
 create mode 100644 tests/f_sit_bad_vblocks/README
 create mode 100644 tests/f_sit_bad_vblocks/expect.in
 create mode 100644 tests/f_sit_bad_vblocks/script
 create mode 100644 tests/f_ssa_bad_nid/README
 create mode 100644 tests/f_ssa_bad_nid/expect.in
 create mode 100644 tests/f_ssa_bad_nid/script
 create mode 100644 tests/f_ssa_bad_ofs_in_node/README
 create mode 100644 tests/f_ssa_bad_ofs_in_node/expect.in
 create mode 100644 tests/f_ssa_bad_ofs_in_node/script
 create mode 100644 tests/f_ssa_bad_type/README
 create mode 100644 tests/f_ssa_bad_type/expect.in
 create mode 100644 tests/f_ssa_bad_type/script
 create mode 100644 tests/filter.sed
 create mode 100644 tests/helpers
 create mode 100644 tests/runtests.in
 create mode 100644 tests/test_config.in

-- 
2.40.1



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
