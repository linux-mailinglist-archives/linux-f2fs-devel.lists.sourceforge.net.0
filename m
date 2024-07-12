Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 1110C92F3E5
	for <lists+linux-f2fs-devel@lfdr.de>; Fri, 12 Jul 2024 04:02:09 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1sS5bl-0007Gu-L5;
	Fri, 12 Jul 2024 02:02:01 +0000
Received: from [172.30.29.67] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <shengyong@oppo.com>) id 1sS5bk-0007Ge-BK
 for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 12 Jul 2024 02:02:00 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=MIME-Version:Content-Type:Content-Transfer-Encoding
 :References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=IJxfTfe6mQkZrq/UEGkBJ3GX8/LNTkk0o+/3H7UqDM8=; b=nI8uKSXWMYUf24wgD8mKXtvqYI
 i81rCPv+lKDBkhS705QKs6PZDt9yryJFTwcrAdCdy6qqCgfj/HhXNE4jGtHKDt+SbMr+hPRubQJjY
 2iu2JJP4oQ7M/YCwEQbTTqQbm5ETBt34LNel2D0g4syAJdRwdGLBxykYX5u1ndvEhWYQ=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=MIME-Version:Content-Type:Content-Transfer-Encoding:References:
 In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=IJxfTfe6mQkZrq/UEGkBJ3GX8/LNTkk0o+/3H7UqDM8=; b=M97S5KxW1JB5OtNDkW18tDU9fU
 +3Uj20Q1Tt/3q81Ptw97LtPEu98f4mkmX/8fUN+mD8erIx4Vb9gK4mXYOxadFmSPhWZK7KiVa091Z
 nLu7FrHfT1R6kytUXnQAdF63N9ZgWNTx9TSO+JR61Vagu8EsX+ibl5VU+MkKqvV8VIyA=;
Received: from mail-tyzapc01on2047.outbound.protection.outlook.com
 ([40.107.117.47] helo=APC01-TYZ-obe.outbound.protection.outlook.com)
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1sS5bk-0003QU-OY for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 12 Jul 2024 02:02:00 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=rZkAfF80z73l0Tzh0d9zAvDnRUKxhKGpc92ShXUx+tpju2erZ33VkBurlPDkO7gJaXuvOMVB0Jr7sSvauh/Hc55K7r87ZCdb8LNyDCGH72QuDGsv2Y77TcWWwGBnccNTX7JwIHEFwhJQVgVE48jtnJpLpZo6BduPBv0eeK67xS1stqGPfim3XegxGYty4ES3+3L5q+P0WhPI2OMnffFo1QIbRzWG2I6V+fhzIW/JlicFuxQnNzTwn/7M+5XTEsTXmMAS8L1iv3aVzQqehWyY8w0BsrXt9qsAJmbILS+NasYdZuUvFiDk6AtV3TGinojoF0EtXw4mMk/n7xmz+nX6hg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=IJxfTfe6mQkZrq/UEGkBJ3GX8/LNTkk0o+/3H7UqDM8=;
 b=tj/2I7dghvnQvl1VsY+1uDBxP2tqD2Nmc6YlEv7SpiWVX5a6b4Ex3KKn1pqMLtEm6g0HtYzFsjjHkehOThhVrNsabu2xtGv/RH/Ef9ugWPhfUey9FhU2DjLM7vVqzSiArFMaY5HVx1wKNYWP3JxILpQTVJqyIExLI0/WhGORmk0aYKY5xuxpRN9VyECMZ5Jhj0MbqkEPhFmYi2jG6lQNpdKnBiLLlLb9gRRrN71DnEW4OOLIn6159hP07hFqLVbiZ9o09z/hohWzKmDiR+rDktZaWEykYEMfTldusP3bnUMyCn9hsbDCPYhYugUqxAd+ZyeMfN8jVp3uP0CRACQO3g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oppo.com; dmarc=pass action=none header.from=oppo.com;
 dkim=pass header.d=oppo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oppo.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=IJxfTfe6mQkZrq/UEGkBJ3GX8/LNTkk0o+/3H7UqDM8=;
 b=Wi670/Q9HPEWpYVU1z2YtMUImQ6iR8CwChl+mZW343+zChlDZRCA+q73BvifJtRiuIsnKIsAh3kH/wust2UtfsbRK8Kp6u5AheAV2cdRzCqWg6D6a8i1OwHWcjKHfGyKPKzr5FMdYBwxpd/G+soFA/1WHCJnEZWYhfV4Zz1ii0g=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oppo.com;
Received: from SEYPR02MB6014.apcprd02.prod.outlook.com (2603:1096:101:6b::10)
 by TYZPR02MB6621.apcprd02.prod.outlook.com (2603:1096:405:28::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7762.20; Fri, 12 Jul
 2024 02:01:47 +0000
Received: from SEYPR02MB6014.apcprd02.prod.outlook.com
 ([fe80::bb06:c283:a50:7796]) by SEYPR02MB6014.apcprd02.prod.outlook.com
 ([fe80::bb06:c283:a50:7796%7]) with mapi id 15.20.7762.020; Fri, 12 Jul 2024
 02:01:47 +0000
To: chao@kernel.org,
	jaegeuk@kernel.org
Date: Fri, 12 Jul 2024 10:01:31 +0800
Message-Id: <20240712020133.140148-3-shengyong@oppo.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20240712020133.140148-1-shengyong@oppo.com>
References: <20240712020133.140148-1-shengyong@oppo.com>
X-ClientProxiedBy: SG2PR02CA0009.apcprd02.prod.outlook.com
 (2603:1096:3:17::21) To SEYPR02MB6014.apcprd02.prod.outlook.com
 (2603:1096:101:6b::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SEYPR02MB6014:EE_|TYZPR02MB6621:EE_
X-MS-Office365-Filtering-Correlation-Id: aa187afa-a392-468f-159b-08dca2169602
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|52116014|376014|366016|1800799024|38350700014; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?HtmLA+ARLbNaDSfBNXRN5QueZfnSAItRKp72gm+7QwwB66RJAAaFfSHgX70V?=
 =?us-ascii?Q?ZBp91CX7F91pzy9BQuX1HfQWSvp1ONnwX2OthVK4gIdhIdeQXKHV2q8UtHU5?=
 =?us-ascii?Q?qkkbpH3gClwEdllEWEVAVFA1+bHLa1Wis9dgLhSPPUf+p5LDxr3Inn7HqhZa?=
 =?us-ascii?Q?I6NTkc0haOPy7pHm4oNmfs4cUB3n9wH/vnSEsJUk3DVv57LJrkDkYw9Q+G2Q?=
 =?us-ascii?Q?5j5+PuGBf9wXKGwkNlXQ9Fkmv8gVpbD8qz8ZICllYo4G0wzm3Mp4bHvrdEo+?=
 =?us-ascii?Q?I3H9DaP0LTx/0Rx7SQGVt6hZnwVrqYk4p5jdwKEdh62AmRl6oWOjz8cCze2Y?=
 =?us-ascii?Q?a3agZIK0apVumfnxFWuWhVdg/a79MwS3VrkfzET9LugEdVHs6p3gn1bta/Fw?=
 =?us-ascii?Q?Y8sHDyOA1ckSAMBseDKmQiB7PERknZEPa8EeTz4OnPCMRQqXgxFRnHzhkXY0?=
 =?us-ascii?Q?BYdhtGbr/SwZKNt/XDDoH9n6QQ5Pwe5u+HTcSbEOeV6GexPs9+kDZmPiqpN+?=
 =?us-ascii?Q?jvjFCVr6wXAqshFa44UcCYhhS5luz1KFgRMgNs+FbGpXhKVYtNokvWAujXNw?=
 =?us-ascii?Q?jnafwMFZSb//gzApeZBK9CuqZ32EZFPzmwqJy2c15G+CTDc2PRaUJ3t8s12t?=
 =?us-ascii?Q?OYU7pnWqchbP+79oobcJPH70fsYqXE3HEWJr+ZlCsseP+WOXEN01NI/tsPtj?=
 =?us-ascii?Q?61NwEgBVGP41f6BzcW7PMDJf2exRCoWIe8vi/L0GZn/megwd7UbQ388ajSCt?=
 =?us-ascii?Q?sDHPrUftjUaHEBym9cWULuTH3Q3gE3LVNlZzxMQC08NehDNG1N0glU0yHHgk?=
 =?us-ascii?Q?EtN4ctg73Ky9486QE3dW/hDCjU6XLrhuYqpfif8DkVbCbzHvBPYv0UJ/liy2?=
 =?us-ascii?Q?D3doBQ51ux2fHb5GCyD7K5J1oKIrBGc+417XAeKwK1hiKtE/GDZ926suxy1B?=
 =?us-ascii?Q?owGoIarET1m6/biiInOUKP7A77MxB0WKBr+FRe0p3tsSRsN3pYaVCgobj0qX?=
 =?us-ascii?Q?fvSn2kwT3YFu5yixf27JANfelURk/YNrj36W2r6m5TIExyDxJw0db8Pb+FuY?=
 =?us-ascii?Q?MHTdADXcsUx5DN21ot1QJwKhupMEM1vvzPxnJGdleKSu1jgI9TnLopDXs7Zs?=
 =?us-ascii?Q?OUxoZrA9ZdwbUaYez+Z5VEcFpa1fah2V+eOk0Qj14CtljUQ42zuWOrOTmNTL?=
 =?us-ascii?Q?f3Z2HsDfJ8nvpM96MkZSr6sW/RfKfGSsjpiDTOrQH2sftSwsbA5nDSIB5JSX?=
 =?us-ascii?Q?r3+fMg2LGmwj8QDQUzyqfWLSePuOuxsElfKMqY+0lT/nGnnuj6t94fmsfp1h?=
 =?us-ascii?Q?ZkvlhfJJBNO8XecezSJIDcrRLxYa6xzx/o7LD90opRhMJnOEih0jGOtPQ0Vp?=
 =?us-ascii?Q?fSnCxH1v6B1z8OkllMbYLQkerKe1G363NrqFCDzw+W7UGh0Ozw=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SEYPR02MB6014.apcprd02.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(52116014)(376014)(366016)(1800799024)(38350700014); DIR:OUT;
 SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?YzkSuGD65AAPyGBcWRl/S457Wit7jY14j5XfEtKAVDOYgB5BykRXdo/63r4y?=
 =?us-ascii?Q?YgVNpQeITgCoeexEuk19r29QA7HPYWc2EWO1qIb28bpyKEs/5uCvuUkQwwO0?=
 =?us-ascii?Q?VY3Pwuyt9emUU44Ako9c/L/bQauc4BgQBL5t+JbQ8aJtjKnq8Yn5qKJvp4E8?=
 =?us-ascii?Q?RpSw+FWCXlJjIfd/bjZrSEg/9moJ2aZALSC/w7uCxpLmwPH3RKqIozA1/eXU?=
 =?us-ascii?Q?BGt5Uy71niKLdn+d25Thmrt3he70CJ+miV9WFxioIwXbmMaBLgyk6cY8i1KE?=
 =?us-ascii?Q?/teVFJE1g/Oi8QEAlIxJ0tAJ6990BKVAudeHyCUpX7G3spkR7AGhCn0MKXQv?=
 =?us-ascii?Q?4mo6+AbPi7vb7iD9eVur5X1kheeHBvZbRqIE1Jw08Jl60pzFd+sy9ZpHFrs4?=
 =?us-ascii?Q?+8n98BsBUD1V/yNvwYV9QC0f7gfjcAqHy8IhlDKz+UeeamSIOhgraA6tIB/y?=
 =?us-ascii?Q?VO/Z2ZoEpjtK+AiOf4yAz6K7pmKHsIV7qwnlFbUIxsOqlp12Vw/K4XZrVLDv?=
 =?us-ascii?Q?7O364sJfRQxNBUBrPOE1KVIgJ6GnitNbNQq87xxDvd2MBzU52qT9Av3ckavn?=
 =?us-ascii?Q?yTvhLOYQ8zLMIfnBoRAgJWxKLoWukLDXzZyfMZETPwIl14tbwAAT16zN7Cnd?=
 =?us-ascii?Q?yMdu3oh7kZ8SG0UZ/qsgnwzt0qBOrrSq7PNVCcYK9Rs68im32HXpwdl3M5x+?=
 =?us-ascii?Q?udnFqEYaqTy8oU2M/jLEIhR+mYNJE9NQPPpZGnHR09iho6twzPpx7BS0BIDk?=
 =?us-ascii?Q?J8tPvhDa57mhDWYqbhpgR6+MqAbl3hft+gGMV3xLQvBSgLPJzK4Yg9CpK8IT?=
 =?us-ascii?Q?qj5U26CLplaT9eOQMJU23vF5/yvF9f8vQaMOCZ8subc0jNwIA1pMmfHDdIn6?=
 =?us-ascii?Q?pi1MDi5qZTktqma0PWLupTuWeu6e/dKkV7J4Xe22YGZf3QEmftp+4Vn/DtwG?=
 =?us-ascii?Q?V0P+0u8WUymCLnMbEB8jovyzmRKzFidQg2jxvJBYA9Q7b29GYl455022N/C+?=
 =?us-ascii?Q?6HHZ2FH3rPaIxymVr52/5PBel+Z3UyQRmrGG5F2g8VhLDD/za91WR0hhHxRK?=
 =?us-ascii?Q?Iv055bdGPWrW4yj9fdLA93Z20Ticka9Cqb7TSZBz+IaCKEp1hcQ2zcjTjKmv?=
 =?us-ascii?Q?WHXvrD5g7j8D0iCuID5wyo/mUH4LMySfZBn4nWjEoOi+yOuXm1tMWEqeqRWa?=
 =?us-ascii?Q?bm0A7ns6Hg7f+h18V6oEaCvEa9Z7v1Gf2p7dOypOjXr0bZS+htI+qBD973cW?=
 =?us-ascii?Q?K26gGLPrYbc2iCeCKHZoJve1ZGtwkEaG4ygMJPLSmVl4VRDFLR+aTE+ebIWT?=
 =?us-ascii?Q?LWGYQB6mS6lCafrrqwuKGtSYfzwUtx6/7ffYqI0KfT99d01g/c3X79nHGqQC?=
 =?us-ascii?Q?N/mVwh0Zo7lHDHuxc5aiqQ6W2xliQwlEhpGcwvYdx42MKovQolI/G+gHqsbA?=
 =?us-ascii?Q?wh+eNSA7lB90Gi2M3huqhf0yQXiOKt29hBpqH59I/2pGoqQ5wZZii3MMd37y?=
 =?us-ascii?Q?pGz9OUbu5mRazpPV3pLa7gD1hz62UTSB+OKBARyBbUDqdg5IsZrMG96+0H0d?=
 =?us-ascii?Q?tSp7kXJ+nvPVhokkvPHmKQ4qCR6O4kRAV6pvD1dG?=
X-OriginatorOrg: oppo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: aa187afa-a392-468f-159b-08dca2169602
X-MS-Exchange-CrossTenant-AuthSource: SEYPR02MB6014.apcprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Jul 2024 02:01:47.2035 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f1905eb1-c353-41c5-9516-62b4a54b5ee6
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 9atHxk4X3eSbKa9hP86HmVmzSIzHHVvgFW8K8ZK2NsDQX1D+V+Qva1D53nez4Lo5f2F40VGRcXt5NEsJlxR0iQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYZPR02MB6621
X-Spam-Score: -5.2 (-----)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: Signed-off-by: Sheng Yong <shengyong@oppo.com> ---
 fsck/fsck.c | 5 +---- 1 file changed, 1 insertion(+),
 4 deletions(-) diff --git a/fsck/fsck.c
 b/fsck/fsck.c index e2fb042d3dec..6cb02729aec7 100644 --- a/fsck/fsck.c +++
 b/fsck/fsck.c @@ -1081, 10 +1081,
 7 @@ check_next: } } if (!(node_blk->i.i_inline
 & F2FS_DATA_EXIST)) [...] 
 Content analysis details:   (-5.2 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [40.107.117.47 listed in list.dnswl.org]
 0.0 RCVD_IN_VALIDITY_SAFE_BLOCKED RBL: ADMINISTRATOR NOTICE: The
 query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [40.107.117.47 listed in sa-trusted.bondedsender.org]
 0.0 RCVD_IN_VALIDITY_RPBL_BLOCKED RBL: ADMINISTRATOR NOTICE: The
 query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [40.107.117.47 listed in bl.score.senderscore.com]
 -0.0 SPF_HELO_PASS          SPF: HELO matches SPF record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [40.107.117.47 listed in wl.mailspike.net]
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
X-Headers-End: 1sS5bk-0003QU-OY
Subject: [f2fs-dev] [PATCH] fsck.f2fs: check all-zero inline data with
 helper is_zeroed
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

Signed-off-by: Sheng Yong <shengyong@oppo.com>
---
 fsck/fsck.c | 5 +----
 1 file changed, 1 insertion(+), 4 deletions(-)

diff --git a/fsck/fsck.c b/fsck/fsck.c
index e2fb042d3dec..6cb02729aec7 100644
--- a/fsck/fsck.c
+++ b/fsck/fsck.c
@@ -1081,10 +1081,7 @@ check_next:
 			}
 		}
 		if (!(node_blk->i.i_inline & F2FS_DATA_EXIST)) {
-			char buf[MAX_INLINE_DATA(node_blk)];
-			memset(buf, 0, MAX_INLINE_DATA(node_blk));
-
-			if (memcmp(buf, inline_data_addr(node_blk),
+			if (!is_zeroed(inline_data_addr(node_blk),
 						MAX_INLINE_DATA(node_blk))) {
 				ASSERT_MSG("[0x%x] junk inline data", nid);
 				if (c.fix_on) {
-- 
2.40.1



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
