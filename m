Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 871F6A6A01D
	for <lists+linux-f2fs-devel@lfdr.de>; Thu, 20 Mar 2025 08:07:55 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1tvA0H-0001Fc-Vr;
	Thu, 20 Mar 2025 07:07:46 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <weilongping@oppo.com>) id 1tvA0G-0001FV-Tn
 for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 20 Mar 2025 07:07:45 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=MIME-Version:Content-Type:Content-Transfer-Encoding
 :Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=ZORHhH/EtWKTBj37adbynxfN0wK4lQryfEbHsTvE9SQ=; b=Ol15gp1mwv4jm7fIZXk7TlW5WO
 Fit1iGf74FMbX/kSB932wuYV16GdZiNIs6TmuV7H9Xy2iRAwoakGnNtQvcNzjAj7wMZxMw5YXtITD
 hU6glqVz30nxBAdRyEo1JLUsK8nzMRcihNFHvOmW2OEmYy3GVudOa4z5PVhlJ214dtso=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:Date:
 Subject:Cc:To:From:Sender:Reply-To:Content-ID:Content-Description:Resent-Date
 :Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=ZORHhH/EtWKTBj37adbynxfN0wK4lQryfEbHsTvE9SQ=; b=c
 SKE1C6515rmaqmaUmhNUvCTvBfVwsvsnXqikRJD85Wu4RPiCVz+8sSH1t/2UpopwQbfUsPbw+7ziV
 ICzq2h77x001BFy9TT91NDXE4fR4gHHyXP5hBRSZeXPoCZN4xnpJHkXHXlcxx7r60KFUwFwVzVzuM
 9irVtL3BtEFpRRms=;
Received: from mail-sg2apc01on2055.outbound.protection.outlook.com
 ([40.107.215.55] helo=APC01-SG2-obe.outbound.protection.outlook.com)
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1tvA0G-0007T3-IC for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 20 Mar 2025 07:07:45 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=hu5QQ7em7vywwn7BOhdwZYVEgxoLhOghLQQvuvjxl37B5+fiVb+TR/GOswVoNC7aEF9Af5OD1e1MMtLavsFoR+xaBW71wtoWsDADFA+GroLIOrCsSuLrf0+vSdlhntr4ieufVUgvqJucptHqpW4XlKM/mG3L8D9idjfuCMM8+vP5nEXeTL+s98lRI6BMCZDnbM3DqrhvBRcp/rQydAZbrD5j3619HllNPtu0fjToFweWCmxot7w+VESQf4KWSbo66Yb0kjacUSY8g+73V75a9+lnYMuQJA8sTRuXxk/iUhIIKISTnVEKeBpdUtAu06jjxWWShz6R3YqPH0v6R0jY6Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ZORHhH/EtWKTBj37adbynxfN0wK4lQryfEbHsTvE9SQ=;
 b=c99o8n7NvF+2BXQ1rQkw/QxCAZqJFaGhUI9U+j5ANW6bSQzWcpNFjzQS5GLtPEF8QE7k3nQaAYv+HrJzzfGAJKj0O0LlJPsgaCH8CG7drvP30sSNvLaA+XBGvCtDZUwiA5nyNNQvX/6sfp5Nxi7YofRjAAFgBMe7n+6fmfJzECLZUs9Mo9Xag6DEy1nC6YuXXIZZmGjDjb9YrIN2lXP5vOXjPZEY0NjJ5VXcCkFg7zqj+X0HV4YMKKvwZ3X/bBXh0OlGRGZUdsatm2VE9UBZ4V1/EKsVPfUBsBWK08bbXyNDKhen154w7AEmw/gnFTrb36wn6VWSkGrW2Km9N8NTNg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oppo.com; dmarc=pass action=none header.from=oppo.com;
 dkim=pass header.d=oppo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oppo.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZORHhH/EtWKTBj37adbynxfN0wK4lQryfEbHsTvE9SQ=;
 b=feFnZ5o+2tyJrNJcPhRV7gISTkbSuuE9amzS5Z8GKnJKHaCFoIev+9OpMtCg4HAyhs/E/FPB4MQrJTtdZJ+Qr5rhoxQWTUdsrrr+UaquQXbbKsQZJTHxD8hAIAtFhdRDrTFcUvKvHHAzrTJx7XO4XoivuzliaU4+ZdbIZeVxq+Y=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oppo.com;
Received: from SEZPR02MB7967.apcprd02.prod.outlook.com (2603:1096:101:22a::14)
 by SEYPR02MB6505.apcprd02.prod.outlook.com (2603:1096:101:148::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8534.34; Thu, 20 Mar
 2025 06:53:05 +0000
Received: from SEZPR02MB7967.apcprd02.prod.outlook.com
 ([fe80::5723:5b88:ed4c:d49b]) by SEZPR02MB7967.apcprd02.prod.outlook.com
 ([fe80::5723:5b88:ed4c:d49b%5]) with mapi id 15.20.8534.034; Thu, 20 Mar 2025
 06:53:05 +0000
To: linux-f2fs-devel@lists.sourceforge.net, jaegeuk@kernel.org, chao@kernel.org
Date: Thu, 20 Mar 2025 14:52:47 +0800
Message-Id: <20250320065247.2364883-1-weilongping@oppo.com>
X-Mailer: git-send-email 2.34.1
X-ClientProxiedBy: TYCP286CA0016.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:263::6) To SEZPR02MB7967.apcprd02.prod.outlook.com
 (2603:1096:101:22a::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SEZPR02MB7967:EE_|SEYPR02MB6505:EE_
X-MS-Office365-Filtering-Correlation-Id: cdf90ac8-f972-4dbd-96af-08dd677bdda5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|366016|376014|52116014|38350700014; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?V7OY14+bW/wGtuvgYhSPlV+XN8ukn+mGeMLQmsGvgypICE6jhT2Fg7rLx8/h?=
 =?us-ascii?Q?hALebBhMpZNEzbCxQXC6TASfVhoXDbMjJyQRa6IJeeoWqJwojlLhkIFX2YVj?=
 =?us-ascii?Q?2jsoNgbACOwy7c2ad1XICOaogakDpbwOvTu2SOusXub5tX/OUwVHodS4h59l?=
 =?us-ascii?Q?/scivqGUQCj2fGWY9TOaD67L8xqg4yvVg+QEZrV6OD8SFmsZUayzodgW2yu5?=
 =?us-ascii?Q?inura4RC3CFqD+3TDNZWvCDjigzAVEmwbSNsnWaRcPAoxVqO05jnA9i6aEtd?=
 =?us-ascii?Q?GxfLfZJGgwaPUWVkQbt2O1HnIoN4MQTyDWNSrdoj1u3mtRZKT7TNXV716MLt?=
 =?us-ascii?Q?TTwuDzL7r70ctMvbCSn/xaLaWVRDaN4NlRT2+o8NNNBCDZvOOGdAgz1mbWzQ?=
 =?us-ascii?Q?cdCDhxUF1+k6drXmIuqrPG3oWp8+MdsCDx88XL8vxwkOyoHfxLBOg32/gTLw?=
 =?us-ascii?Q?rEKyyRHNrEEbWK8QABBtoEQPEN6oAc0+zrsaxfprSpH6b2D7Yuc2CMUb8ceL?=
 =?us-ascii?Q?v/cfHgk94GDLP/fsTXsECeb67GoWe1MX8sBZkCUEH9R+tdzjHQ2oBTE5O9xZ?=
 =?us-ascii?Q?V6KWCX0B4fWOHbWxjt985mL6bPCLCDuLEmFq/coxkGhYhlqFJi+Eem0IKAp+?=
 =?us-ascii?Q?K8fsJwS3GyQFrhYYFF4O3t+ZHnohnsfi1mVXuVVJcb8G3h08Cj5erebZgsDO?=
 =?us-ascii?Q?AAbsLX/onWaI5uLqs5WZnjJvCch9NH3FcyB5ZTOr4EEbFf217QzWXHYnhrQ5?=
 =?us-ascii?Q?uTxXKIhetmL2QKD7RZH73iiyzxGPrc95mJLSqrnmxDZunKKGHXlD4FRuC3JX?=
 =?us-ascii?Q?xf3/6uY5DXF7YFqtYBp8iUTdnD3LKy0z0umbBIrOebW3wRXbDK29R/2uSAQa?=
 =?us-ascii?Q?2BIUeE22SJ8OoXpXNHWFOalmZDVZ/l7CbNpmAmSP/e1ZUYu3Qcyletdnjo8D?=
 =?us-ascii?Q?aTwhtys9nHC+yEH6nQwoGgwcTwMoF41WOrvE+SQx7BFiAtRkMbH/0qQb3HRu?=
 =?us-ascii?Q?HjJ7+XdZ3tynn9LcfiJZTKS4OWv0Q9VyNtTcWZVz+oBzObsfm4PzxAwGIpkk?=
 =?us-ascii?Q?W/KAKJvL3SOQkgQ+8lps+I/d1fHK3ZyD7i3BE73ybqahmHW8Z++d1WV01kd5?=
 =?us-ascii?Q?bzq0dNrmBOTf3N9xwMi2Srquui0RxKdmVq8f9rNwN4wc3APD+XqTrZ1X0WyH?=
 =?us-ascii?Q?HVGfvyupRWXptECbHMCXA8BrmfwGgaM5rlCz7eIRMhJRcKaD8G5Q6r9Pp73J?=
 =?us-ascii?Q?hK2MxKmPQSEwTXjDlJvq8Yfjyz9lTjUJ8SrXJbOvG6w6EKxdefVA601s1Lob?=
 =?us-ascii?Q?iJuy68s7nowbl2jqoiCjgClZZKjw9gTE/y4Uwxwa2omzHyhnGC5hVqPimWhI?=
 =?us-ascii?Q?u7rcMo9HrgXdRO1vzNgilgDr7ECJoR8GMcUt7NIZirBKrpT3oUvdsl3Hf043?=
 =?us-ascii?Q?mQifiuOnWgAD5Ek7nTp8JQG+si4EM1km?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SEZPR02MB7967.apcprd02.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014)(52116014)(38350700014); DIR:OUT;
 SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?BOyZJkViucO7YdwyJnbwlKv2R4dQYJmjMmI+iRFaGd4FzafNm1JQ3obqI35B?=
 =?us-ascii?Q?kHLx73fXNb5rgwTjjR6H+3x1KinhosQjYEQ6n1GimKNILqr3ObBJooMtnSIx?=
 =?us-ascii?Q?fAyv89gSYbLyXUddwFoMgE5vvPKl5sY73jRuWL8h9dedoqRsTkl0za4dPMmp?=
 =?us-ascii?Q?JqyI9Bf6dECPHNkt3B9a/xJ1Le3tq0rkVkPGjmuNWucHErHKmp/sGGz5pAhB?=
 =?us-ascii?Q?MvuxIjW52WCt1hgctVc1WO765ULDtl8awbKsw2wNdfLLDim/JuBj1wE6jqUS?=
 =?us-ascii?Q?9jibqrIfTCyXHe2tKS26Ycw7eh5MVHKQ0bgTqUhCgH0gfqYZaydsSN8KE7+d?=
 =?us-ascii?Q?alzFU+DnB2DCoRbdJfzJnWaV2eL1KObElkNv4qxlgE7vI94sD6uwcMkQLWtK?=
 =?us-ascii?Q?kwioA9DG4ac7sxsXT+V1RTFTVvndYAHlVUeDS6QeJifrOeBPHwKFeIOeZEjq?=
 =?us-ascii?Q?6EnN12CPHw5K+Y4hsEPT5pTc8Hh9sJz5ucGvHHtg+MqeRwTiOWJmNw++Qdlq?=
 =?us-ascii?Q?TqkkaoPkjDFD+t3bwSPUmqi7knKqkBwo4zE5oGgjm5iaAxgwNhoHBX4Ty32N?=
 =?us-ascii?Q?i4Qdb+iBeXMkflNb3P/bvjxJL3PZfbxpS3D3rL8y5850S4i7DcMjwi3BrNln?=
 =?us-ascii?Q?FtB8JWWnORUNxFyBqJG12zZ30aUxbUCXh3ARsp4Dy/18RYBa9rEugSdO5jM9?=
 =?us-ascii?Q?/nHkJWEfczIJ/vPo4TCS+a66pQl/O7kLlxSqUCWfYnlgjUgECiKng4Xj69Z1?=
 =?us-ascii?Q?RXl7WfhcQlFXLrwCpLCE+uLJ1IfoO+fxbvyvia7i7o0a46AAWC9SjyHlpcLo?=
 =?us-ascii?Q?2E6qyQPgrFWuUydN8rQtdQYcKFIb8cIKl+YB0zYjWOkJjvpZNEYtd2atbbqY?=
 =?us-ascii?Q?nzPUCCCiKhLouljs1rPXcD8mMgVgE03K1sHbtlMf6+9kkcgnlpYKwjrD1XQq?=
 =?us-ascii?Q?lcpQ6u3MSkuE7AAfhvNf1tmMrVwugurHVHzrC1FaN0nTxZSn0RxZ5utJ6upH?=
 =?us-ascii?Q?Gj6JL5nhZsS1V9i34GzALIa2vzSt2Rx+YPN35em3Becgsik6qwES4+tTIT3F?=
 =?us-ascii?Q?euc34onLcyvEUaZAdVnuRESKhi0ZE4SlSzIdAxBraIdZVp32nd6PRtEYp9Eg?=
 =?us-ascii?Q?zv/pUwU361VZC2JfmPvSABogqF6qx9PfnGUM5JlcHqBlzX5Jm6JGso9IibC1?=
 =?us-ascii?Q?5XHyGq40iZ2WKeIvNfZpyHzjjxordTJg1+kD/HvxJRvEa3aK+zlANwAznj+k?=
 =?us-ascii?Q?yia0fh5jvICFQmQfaRfY8DgyoMfCvq7Da5x17KCoNHcD+Qe6OkI350Vi3C/F?=
 =?us-ascii?Q?/O+3/9iLy1k6VAZpaon9WElfUtTehB3qiMwPL0dMe/kauzopG8VbnQZOZe5d?=
 =?us-ascii?Q?/h+eJ4lwbNJIZobwyYwyEWp0mjvVVL04luQBz6JS9cNZduKxDSC40HdcPBSq?=
 =?us-ascii?Q?+EtUYbVIFZWq56EYQzz0VNhaDV+RtowZnPAAWgsZlqzH78jD7vp5JZKP4Xd0?=
 =?us-ascii?Q?W/ciUK/Ll4EQoW2QMBYGs2v2yGhJftwCjdjKhadq1OpxxPKf4NYaB1JJz/nq?=
 =?us-ascii?Q?S3SKnhy9YkLv153v9oymoJy/3D59J0nTWvQt8Lq+2hELVdqmfGfn3xmaEXIb?=
 =?us-ascii?Q?gg=3D=3D?=
X-OriginatorOrg: oppo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: cdf90ac8-f972-4dbd-96af-08dd677bdda5
X-MS-Exchange-CrossTenant-AuthSource: SEZPR02MB7967.apcprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Mar 2025 06:53:05.6516 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f1905eb1-c353-41c5-9516-62b4a54b5ee6
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 2dE/PMQV5CdrAHSUZUI4OS9vIKDp+bqCBoKoQbH6ri4Dq93IunF0GBdTVkOgQYWfJ3m0mXNmX4ZsONj/EZhEtg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SEYPR02MB6505
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: An error occurs when the file length exceeds 4 GiB. For
 example:
 touch test.img truncate -s 10G test.img mkfs.f2fs test.img mkdir mnt mount
 -t f2fs -o loop test.img mnt dd if=/dev/zero of=mnt/testfile [...] 
 Content analysis details:   (-0.2 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 RCVD_IN_VALIDITY_RPBL_BLOCKED RBL: ADMINISTRATOR NOTICE: The
 query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [40.107.215.55 listed in bl.score.senderscore.com]
 -0.0 SPF_HELO_PASS          SPF: HELO matches SPF record
 0.0 RCVD_IN_VALIDITY_SAFE_BLOCKED RBL: ADMINISTRATOR NOTICE: The
 query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [40.107.215.55 listed in sa-trusted.bondedsender.org]
 0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [40.107.215.55 listed in wl.mailspike.net]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
X-Headers-End: 1tvA0G-0007T3-IC
Subject: [f2fs-dev] [PATCH] f2fs-tools: fix incorrect return type of
 f2fs_max_file_offset
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
From: LongPing Wei via Linux-f2fs-devel
 <linux-f2fs-devel@lists.sourceforge.net>
Reply-To: LongPing Wei <weilongping@oppo.com>
Cc: LongPing Wei <weilongping@oppo.com>, zhengliang@oppo.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

An error occurs when the file length exceeds 4 GiB.
For example:
touch test.img
truncate -s 10G test.img
mkfs.f2fs test.img
mkdir mnt
mount -t f2fs -o loop test.img mnt
dd if=/dev/zero of=mnt/testfile bs=1G count=5
sync
umount mnt
fsck.f2fs -M test.img

/testfile 1319936-1320447[ASSERT] (dump_data_blk: 285) blkaddr == NULL_ADDR

Signed-off-by: Zheng Liang <zhengliang@oppo.com>
Signed-off-by: LongPing Wei <weilongping@oppo.com>
---
 include/f2fs_fs.h | 2 +-
 lib/libf2fs.c     | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/include/f2fs_fs.h b/include/f2fs_fs.h
index bb40adc..f206994 100644
--- a/include/f2fs_fs.h
+++ b/include/f2fs_fs.h
@@ -1610,7 +1610,7 @@ extern int utf8_to_utf16(char *, const char *, size_t, size_t);
 extern int utf16_to_utf8(char *, const char *, size_t, size_t);
 extern int log_base_2(uint32_t);
 extern unsigned int addrs_per_page(struct f2fs_inode *, bool);
-extern unsigned int f2fs_max_file_offset(struct f2fs_inode *);
+extern u64 f2fs_max_file_offset(struct f2fs_inode *);
 extern __u32 f2fs_inode_chksum(struct f2fs_node *);
 extern __u32 f2fs_checkpoint_chksum(struct f2fs_checkpoint *);
 extern int write_inode(struct f2fs_node *, u64, enum rw_hint);
diff --git a/lib/libf2fs.c b/lib/libf2fs.c
index ecd22d4..d2579d7 100644
--- a/lib/libf2fs.c
+++ b/lib/libf2fs.c
@@ -527,7 +527,7 @@ unsigned int addrs_per_page(struct f2fs_inode *i, bool is_inode)
 	return ALIGN_DOWN(addrs, 1 << i->i_log_cluster_size);
 }
 
-unsigned int f2fs_max_file_offset(struct f2fs_inode *i)
+u64 f2fs_max_file_offset(struct f2fs_inode *i)
 {
 	if (!LINUX_S_ISREG(le16_to_cpu(i->i_mode)) ||
 			!(le32_to_cpu(i->i_flags) & F2FS_COMPR_FL))
-- 
2.34.1



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
