Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id WC4jC/KeHWqWcgkAu9opvQ
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 01 Jun 2026 17:02:10 +0200
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 85B096214AC
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 01 Jun 2026 17:01:59 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:MIME-Version:References:In-Reply-To:
	Message-Id:Date:To:Sender:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=LZv2+4e4irzIqrtN1sU/CgwVk5smPRMvEbxm8+Uja/U=; b=XklpdwEo877x53duTxY6mKdfmo
	JVrPcJyNtIoleFfSzbpgYPnhF4n9zjmqIU8D+g8j8k60pqjELdmDxvjGRcy87yr7bOQSdMkFniE5b
	n4xv7xBps+kdf5SpHzpgrdpmEthF3QZCMWYXpMo026JtYL1C3dsfcFM6miafZtXWCsJc=;
Received: from [127.0.0.1] (helo=sfs-ml-3.v29.lw.sourceforge.com)
	by sfs-ml-3.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1wU499-0007e9-F5;
	Mon, 01 Jun 2026 15:01:44 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-3.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <liaoyuanhong@vivo.com>) id 1wU497-0007dy-By
 for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 01 Jun 2026 15:01:42 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=MIME-Version:Content-Type:Content-Transfer-Encoding
 :References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=hryDbLuo2gsMXs8ywO37i6j8EBDv7DL1o4w2kUC5EdM=; b=Bk0lY+pcytaK6riFgIYSI5JqTj
 nU+RU/8l+Yv7KRHgqrdVdCGMVpts5RRkktNtGJZR2JrC/lY7GjNH1ulQPvmIH+evjF2zHSTiOjpyM
 YeqskhZ/UKaSQFuq3VA0N0AHmsbaHDDxswR1wKGPB7Vt4S3yjGsjb23JkCBZ1EFQi6aA=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=MIME-Version:Content-Type:Content-Transfer-Encoding:References:
 In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=hryDbLuo2gsMXs8ywO37i6j8EBDv7DL1o4w2kUC5EdM=; b=JR1BtLZe9+3xPB1DNgRNWdu0Hz
 9gMhuxHUKMr0aXzTTa6mcdiTAmIZPzXO7Gv/HiNvenRvjPhZnRKEZg0EssPqA8ML5nFAPDWRUE5ii
 rUDT7wACwSlHBvL69dYlcF23DwOX1pTErMqtn5UkxItHnaTfZjIzYWYJjsj6jqdXJ3g8=;
Received: from mail-japaneastazon11012022.outbound.protection.outlook.com
 ([52.101.126.22] helo=TYPPR03CU001.outbound.protection.outlook.com)
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1wU48x-00061r-Kv for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 01 Jun 2026 15:01:34 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=w4KGBBXEh29GmJPhWMeiqqLZZWUCMg8MiZO0IyClm3o81tQiLl/K+2e0Gw2xvF/ZFCKbZQu+jwIJoF+B3bOIPh/YImVqJbANJhzRam8b0wQTSbQCdKvGPs27nrjoWnq1fphcuGYr5vEQQm/D+w4mWu7wwbvJkVvNiK85aZsikSoJpWfzXQEZ19Y2OSJn+7P+d6NB/K/Nzt3jPIzj8HDH0OvGHA9i6m1MOaUAXsXDu591AkGb6xmgVBj43eeYFMfFRRzRiAayGXjJmQIuZAtGV0u6oXTjwrcbf0ERQUT7rWcK7hB4RknTdahz5Tti57uPP267Lmnh8by+mARv1uONiA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hryDbLuo2gsMXs8ywO37i6j8EBDv7DL1o4w2kUC5EdM=;
 b=ZkBJ90G+o6Wa8TAQCjrw9TIvNF+RzFcc80N5lmbtjlkdiFOmhJejpAk0Atz2x8dn5lQnlDc8Hht0KfXH/lRTZNkxIPKSHu49O4o5I1NzzRdKWmxmjEHzQOrPy2AFvk/DhOZ7i7Sgz7oAGFGVgVd1INSkNy8EUbFgii+S2Zry+ryn0d3dc93czQ8+Sl/SHos0+mZblOHcbON1l5AHhRsIJjIKORScLkefRdtQpce0Cu1tOWhpJxCdyO6b88q1izhgpbtd8JSvk2lPSomDxvHitTUS6NOdVIqE65mqGMdaJ8bm6EdhNOR8bLKQh8qfP1s2l43+QBEFPbdaKx/MAQLBtQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vivo.com; dmarc=pass action=none header.from=vivo.com;
 dkim=pass header.d=vivo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vivo.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hryDbLuo2gsMXs8ywO37i6j8EBDv7DL1o4w2kUC5EdM=;
 b=eNg5aHKaGrfh83ul2FZkacxc4bL1M2mRm3VZsIXkF+8h2kdONV0oz1I4V1maWYm3X0FOQ5XPwtmV4kIFbZDOiye9BbGihbVXGdbDblpx+nh3eh0pUc0jXIMG/QbATpV95HiIxzrGjCC+pj6DLhDpk6RpWjhS9snWY24vvwFJW0hkT6AZXvO6eEQFPEQZ/0XT8v/huk18E6IRlo1iHaVUFaF/bBA067ho3fsJl45UTzwNTbAYO/uqp1dSZaDczstE0zyhBWODYt8Jwk5hy2i8GMzuLFJugGJvVOYrjxbQk9rR1nS1IvnUyUpy+5Cc9+6CLh6gISJRqWp0Br1Ogf/IdA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=vivo.com;
Received: from SEZPR06MB5576.apcprd06.prod.outlook.com (2603:1096:101:c9::14)
 by SEYPR06MB6335.apcprd06.prod.outlook.com (2603:1096:101:13c::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.71.16; Mon, 1 Jun 2026
 15:01:17 +0000
Received: from SEZPR06MB5576.apcprd06.prod.outlook.com
 ([fe80::24bc:5613:3ffa:cb96]) by SEZPR06MB5576.apcprd06.prod.outlook.com
 ([fe80::24bc:5613:3ffa:cb96%6]) with mapi id 15.21.0071.015; Mon, 1 Jun 2026
 15:01:17 +0000
To: ebiggers@kernel.org
Date: Mon,  1 Jun 2026 23:01:05 +0800
Message-Id: <20260601150105.350833-1-liaoyuanhong@vivo.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260515184124.GA4903@quark>
References: <20260515184124.GA4903@quark>
X-ClientProxiedBy: SI1PR02CA0056.apcprd02.prod.outlook.com
 (2603:1096:4:1f5::7) To SEZPR06MB5576.apcprd06.prod.outlook.com
 (2603:1096:101:c9::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SEZPR06MB5576:EE_|SEYPR06MB6335:EE_
X-MS-Office365-Filtering-Correlation-Id: 8bdae4f2-466f-4140-4ec8-08debfeea1a3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|52116014|376014|7416014|366016|38350700014|22082099003|18002099003|56012099006|6133799003|11063799006;
X-Microsoft-Antispam-Message-Info: YJcHNOX+q2RLayg9DQdXOpxYzwR73ZxJkXiVcx1o/2iN6YRRRYpMdFo0iqEV26meFAiXBLKX0PUKdR6fMtXqpXL0Q6oO+j14jAYKcl8KlQyzAqsvV64IwX09+ShAyIedAfsjwjpSsylgo1gLCiCrESCHs8HGe+acjXkXvtbe8uGssIrPdyd1kcngtyKBYuhZBAUqShpvhZlEACWZ+/Y753OSXp6fDekJaMszwTErbuuNNR/zd1CwyNrjJgrXbH/wJehgB2t8lbIlvfdXt2S1ZU/nKafHs44bRoQB1GumFVE8DBSoXTMrpCQ7fPsnXy6PoWBXS+K56/wRcWSXU3QNQjMn61SfXWbv4oaS6FpGq/tl+kLT4FPJTPixm+pm+ajuNz1cUYCUGZDKvUwfa2s6apTg27J6UrT66BLmQtJTKcWhirVyAz969zRSMPka1NnnTN60yeZ9UWVLYNzMRt7Up6GeDwBHZHD8VsEmkAcZ9jzXuXJys/OZb5AhhT+IMnREVOGIULuw0/A/3l5Hzrsdf1rv8iDjW+Ei2PzAH76sZZuBAryp48kATJS/pqSxmyWxLaXG+XrN7bTiVOwh88LDwNrT61EvgPPrwcWejToe/c1ksaylyTGD6sxTreBkyVODM1mOCAf5oNm8uvi1Lkstte5UAPgCKMOYMajfjSgSuZE9pk00HUK8ki0uNsZPReEu
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SEZPR06MB5576.apcprd06.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(52116014)(376014)(7416014)(366016)(38350700014)(22082099003)(18002099003)(56012099006)(6133799003)(11063799006);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?7J6EZZg1Ab7X0SumqIb/fBah9muEL3a07cyc1SOSORznZHFXVattO9olApxa?=
 =?us-ascii?Q?rev2bj/97cKOTxMObmqnQE3XP3OsuLfx/PWVqfcFGHa+wOegWMvrzYM8Nkxq?=
 =?us-ascii?Q?J6MsoHHHnnyYMwJhZ5HN3A3CErVU8rBhM8SinQpF5tGWG3KLdlxSXr07qJ1x?=
 =?us-ascii?Q?mTTn4Ir0sW3MWFBjtGIK4p1QckQyOwjTNW4B8dZePg40AY1XkwcKZG2qnVlx?=
 =?us-ascii?Q?eWVxOMOxbU9i7ckumcTzdG5JSi8B5c7qwb/JHiLwQiPUCZRhGGpWOPEQIk71?=
 =?us-ascii?Q?IiJgaz1g0Ca2XcMCxIp3KH6NbCOD/bQFi7I9kuuFYaQwGLuY8G8z7xETUW78?=
 =?us-ascii?Q?n89wfIjkXr0w5HTg3AUfXQ3EzgE9Acf7vnPuqXmVG834nQQKNR0otqEDX51R?=
 =?us-ascii?Q?GGhCBVHHc9m5V0zJHhv6kNvefKa1ruOw3oJWHitKK5OL1bFU1ubrBru7LvfO?=
 =?us-ascii?Q?a5pt5X1hszy9y3HvSw3/XsY76HBsL53ud6qQqzQgIAftK/9QnuV8LqQOJeyF?=
 =?us-ascii?Q?mwQ1B3/xtZfMEmgdlLTBsgPG8VyOk4CR00mceHxPbp5tyQLyX4J4rhOILMQf?=
 =?us-ascii?Q?BWf867TEQ495VwPed11bz8zNADZ4tzDwOctzAiTMHLhxAQqRTEQMrD+dGrT0?=
 =?us-ascii?Q?y564xbBFOJQIQS/05qBPK5IkU7F3alu91bs7qri3GBbxh9mQ+R4rQXOQsoEU?=
 =?us-ascii?Q?O5I0DTODDQF3WU4Z/x3HUn3B26D0o4DbpBcg9gK2eIJvq/y9JM7Q8uaKmCZR?=
 =?us-ascii?Q?YY8vKDzL50J8ckapyShygVSzSK99IWn8yMHta97OUVUYbA/S7akzhFYlhl9k?=
 =?us-ascii?Q?A3qJDMO+d5F1PYy1hc8bEN1A66pSBtcR1hElP/qVSxbMEJ5HtHWJsdthfrrB?=
 =?us-ascii?Q?xlBK0ohM9X31xccyykyVyBA947cltK1yTh82US8sw2VC6qzmAwY8RsPIHU6/?=
 =?us-ascii?Q?AWEvSfUM0tZsxXySNCK3zXjgObhJyAFcXRD2bXS7iIrt8EIPx2V1yDbbNY8a?=
 =?us-ascii?Q?x/OuFhtoMYZVj/x+J7uJ0q3ds3pAVRaB71fY56cZrGfHZkLRX66alNL/zBiS?=
 =?us-ascii?Q?tAfQ75bUuTbqsGE3/1VsiRsTGk2WS2oS/kuZs0mkvu+LEJ7mC01ktQa/3LQj?=
 =?us-ascii?Q?aZ/Qv92d3tNaJ2FANVlQUZ0DZWgBH0eC3sHaE5+8oclKWcv6OoTYq8hVH0sA?=
 =?us-ascii?Q?nMIJXzn4k+D9jQVY1NhBQtb2OvpUvIczpNbjLx9FxKOT9lh/XC7icWj2zjmQ?=
 =?us-ascii?Q?n+gYATSPGvULjGkBwDuYHexio3PrqpW/7U9W5lYSIKA3JkojJTJwaOTusVOy?=
 =?us-ascii?Q?bRXsdIKiHEQdCa7SXMPquOkSaWGxYTBMpYJaxc8PsUvGDPXfud8MQSJ/RpCm?=
 =?us-ascii?Q?1MesZfb33IdAiI7+W3lWJTaC+9Sc1HwQqsOKt2wLVN4/OncEbT4EWV7XaSDS?=
 =?us-ascii?Q?90T/4S/Rty0R3E9X5wAhYs5USzxnO61bespR896xXCIJrX1zEtadjJFjuOX1?=
 =?us-ascii?Q?LwxgsPvTgaJj3yUbzdDlXcjEXo3C2rMwrseJ5le4+bWS3Zd4IB1Ky2+Ku9Eg?=
 =?us-ascii?Q?jW7Y4315H2LQJeURanCbMdAfxWfRiwc/qiTDnzvHVJbvQLJ1pGaU6Deckm9L?=
 =?us-ascii?Q?kXrvDXA8Z8N5AxEKmfaNtM1nIInQ6B8U7ND4F7/vHcVIyJuUmvCMBut9U1NB?=
 =?us-ascii?Q?NFJBkiyju4zCDIZ5ijsNWRJ7qvPqi7k4B1vOahrBZXtk1Rgv7QcXsd18A9kM?=
 =?us-ascii?Q?W3N4tCrY4g=3D=3D?=
X-OriginatorOrg: vivo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8bdae4f2-466f-4140-4ec8-08debfeea1a3
X-MS-Exchange-CrossTenant-AuthSource: SEZPR06MB5576.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Jun 2026 15:01:17.0804 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 923e42dc-48d5-4cbe-b582-1a797a6412ed
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: xvwia7YrtpYnJznxlYRmpLnfXt44738SXMmhkwi0vuOULn1U5B/mdRplTUR+n7Y/t1ecktTK4UHrevx+CT9DfQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SEYPR06MB6335
X-Spam-Score: 1.8 (+)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-1.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 5/16/2026 2:41 AM, Eric Biggers wrote: > On Wed, May 13, 
 2026 at 06:04:27PM +0800, LiaoYuanhong-vivo wrote: >> From: Liao Yuanhong
 <liaoyuanhong@vivo.com> >> >> F2FS currently avoids inline data fo [...] 
 Content analysis details:   (1.8 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [52.101.126.22 listed in wl.mailspike.net]
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 1.0 HK_RANDOM_ENVFROM      Envelope sender username looks random
 1.0 HK_RANDOM_FROM         From username looks random
X-Headers-End: 1wU48x-00061r-Kv
Subject: Re: [f2fs-dev] [PATCH 0/3] f2fs: support encrypted inline data
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
From: LiaoYuanhong-vivo via Linux-f2fs-devel
 <linux-f2fs-devel@lists.sourceforge.net>
Reply-To: LiaoYuanhong-vivo <liaoyuanhong@vivo.com>
Cc: corbet@lwn.net, tytso@mit.edu, liaoyuanhong@vivo.com,
 linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net, linux-fscrypt@vger.kernel.org,
 skhan@linuxfoundation.org, jaegeuk@kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net
X-Spamd-Result: default: False [-7.61 / 15.00];
	WHITELIST_DMARC(-7.00)[sourceforge.net:D:+];
	ARC_REJECT(1.00)[signature check failed: fail, {[1] = sig:microsoft.com:reject}];
	DMARC_POLICY_ALLOW_WITH_FAILURES(-0.50)[];
	RWL_MAILSPIKE_EXCELLENT(-0.40)[216.105.38.7:from];
	R_DKIM_ALLOW(-0.20)[lists.sourceforge.net:s=beta];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:216.105.38.7];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DMARC_POLICY_ALLOW(0.00)[lists.sourceforge.net,none];
	DKIM_MIXED(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:ebiggers@kernel.org,m:corbet@lwn.net,m:tytso@mit.edu,m:liaoyuanhong@vivo.com,m:linux-doc@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-f2fs-devel@lists.sourceforge.net,m:linux-fscrypt@vger.kernel.org,m:skhan@linuxfoundation.org,m:jaegeuk@kernel.org,s:lists@lfdr.de];
	R_DKIM_REJECT(0.00)[sourceforge.net:s=x,sf.net:s=x,vivo.com:s=selector2];
	MIME_TRACE(0.00)[0:+];
	ASN_FAIL(0.00)[7.38.105.216.asn.rspamd.com:query timed out];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORWARDED(0.00)[linux-f2fs-devel@lists.sourceforge.net];
	FORGED_SENDER(0.00)[linux-f2fs-devel@lists.sourceforge.net,linux-f2fs-devel-bounces@lists.sourceforge.net];
	FORGED_SENDER_MAILLIST(0.00)[];
	REPLYTO_DOM_NEQ_FROM_DOM(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[lists.sourceforge.net:+,sourceforge.net:-,sf.net:-,vivo.com:-];
	RCVD_COUNT_FIVE(0.00)[5];
	TO_DN_NONE(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[linux-f2fs-devel@lists.sourceforge.net,linux-f2fs-devel-bounces@lists.sourceforge.net];
	REPLYTO_DOM_NEQ_TO_DOM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[10];
	HAS_REPLYTO(0.00)[liaoyuanhong@vivo.com];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RSPAMD_EMAILBL_FAIL(0.00)[linux-f2fs-devel.lists.sourceforge.net:query timed out];
	TAGGED_RCPT(0.00)[linux-f2fs-devel];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sashiko.dev:url]
X-Rspamd-Queue-Id: 85B096214AC
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 5/16/2026 2:41 AM, Eric Biggers wrote:
> On Wed, May 13, 2026 at 06:04:27PM +0800, LiaoYuanhong-vivo wrote:
>> From: Liao Yuanhong <liaoyuanhong@vivo.com>
>>
>> F2FS currently avoids inline data for encrypted regular files.  This is
>> because inline data is stored in the inode block, outside the regular
>> bio-based data path where fscrypt and blk-crypto normally operate.
>> As a result, devices that enable blk-crypto for encrypted file contents
>> cannot use F2FS inline data for encrypted regular files, which wastes
>> space for small files.
>>
>> This series adds support for keeping small encrypted regular-file
>> contents as inline data.  The f2fs side defines a new on-disk feature,
>> encrypted_inline_data, under which inline payloads of encrypted regular
>> files are interpreted as ciphertext.  The payload is encrypted before
>> being stored in the inode block and decrypted back into page-cache
>> plaintext on read.
>>
>> The fscrypt side prepares a software contents-key transform even when
>> normal file contents use blk-crypto, so filesystems can encrypt
>> filesystem-managed data regions that do not go through bio submission.
>> The new fscrypt helper operates on fscrypt data units and leaves the
>> filesystem responsible for deciding which filesystem-managed byte ranges
>> need this treatment.
>>
>> The software crypto operation is limited to the inline payload.  Since
>> these files are small enough to remain inline, the expected read/write
>> performance difference between hardware and software crypto is small,
>> while the space saving from keeping the data inline is significant.
>>
>> The feature is guarded by CONFIG_F2FS_FS_ENCRYPTED_INLINE_DATA and by the
>> F2FS encrypted_inline_data on-disk feature bit.  Filesystems with this
>> feature set are rejected if the kernel lacks the config option.
>>
>> Hardware-wrapped keys are not supported by this initial version. I would
>> like to discuss whether this feature should remain disabled for
>> hardware-wrapped keys, or whether there is an acceptable way to support the
>> combination in the future.
>>
>> The f2fs-tools support for formatting filesystems with this feature will be
>> submitted separately.
>>
>> Basic testing passed.  Encrypted small files can be kept as inline data,
>> and read/write verification succeeded.
> Honestly, I'm not convinced this is worth the complexity and the
> additional memory use.
>
> First, it works only in the combination: 'f2fs && inlinecrypt &&
> !hw_wrapped_keys'.  That really limits how many users would use this.
> 'f2fs && inlinecrypt' de facto targets it to Android devices rather than
> "regular" Linux systems.  But at the same time, the "best practice" on
> such devices is to use HW-wrapped keys, which has already been widely
> adopted.  So this would be useful only on devices where the SoC doesn't
> support HW-wrapped keys.  Its usefulness will go away when support for
> HW-wrapped keys is added.
>
> Second, in the per-file key case this makes every file use an additional
> 1 KiB of memory or so (assuming AES-XTS) to hold the "software key",
> just in case the file ever has inline data.  That seems problematic, and
> maybe not a great direction to be going in right now, given the ongoing
> RAM shortage.
>
> There also seem to be quite a few bugs/issues.  Sashiko found quite a
> few
> (https://sashiko.dev/#/message/20260513100431.299904-1-liaoyuanhong%40vivo.com).
> But just from a quick readthrough, anything that calls
> fscrypt_is_key_prepared() seems to be broken now, as that function isn't
> aware that both fields of fscrypt_prepared_key can be needed.
>
> I'm also not seeing what differentiates the new
> fscrypt_{en,decrypt}_data_unit_inplace() from the existing
> fscrypt_{en,decrypt}_block_inplace().  They seem redundant.
>
> There's already a lot of complexity in fscrypt, with the different
> settings and the different ways the filesystems do en/decryption.  With
> this, plus the concurrent work to add support for extent-based
> encryption (for btrfs), it's really quite hard to keep track of
> everything.  So I have to wonder if this patchset is really worth it.
>
> So, overall, I think this would need a bit more work.  But also I'm
> wondering if it's actually worthwhile.  Do you plan to never enable
> HW-wrapped keys, for example?  And you're fine with using more RAM?
>
> - EricThanks for the feedback. I reworked the crypto part to reduce the
memory concern. The inlinecrypt data-block path still uses
ci_enc_key.blk_key, and the software tfm is prepared only for the
encrypted inline_data path. So this no longer adds an extra software
tfm for every encrypted inlinecrypt inode.

I also ran a small-file workload on an Android F2FS /data device
with inlinecrypt. The test created 10000 encrypted files under the
same fscrypt policy.

Results:
- 1K files, encrypted inline_data enabled:
  inline sample 200/200
  fs_used_delta_kb 46344
  avg bytes/file 4745.63
  time 430.23s

- 4K files, encrypted inline_data enabled:
  inline sample 0/200
  fs_used_delta_kb 85280
  avg bytes/file 8732.67
  time 435.06s

- 1K files, encrypted inline_data disabled:
  inline sample 0/200
  fs_used_delta_kb 88808
  avg bytes/file 9093.94
  time 429.37s

- 4K files, encrypted inline_data disabled:
  inline sample 0/200
  fs_used_delta_kb 80728
  avg bytes/file 8266.55
  time 430.78s

For the 1K workload, encrypted inline_data saved 42464 KiB across
10000 files, which is about 4348 bytes per file, or a 47.8%
reduction in filesystem used space. A raw inode check of a sampled
file also confirmed that the inline region did not contain
plaintext.

To check the memory concern, I added temporary counters for software
tfm allocations. Under this Android policy, I observed 3 per-mode
tfms and 0 per-file tfms. Creating the 10000-file workload did not
increase the tfm allocation counters, so in this setup the extra
memory cost is a small per-mode cost rather than something that
grows with the number of files.

For the 4K control workload, inline_data was not retained and no
extra tfm was allocated.

This is Android-focused, but I think the use case is still
meaningful. Real phones can have more than 200000 encrypted files
smaller than 4K under /data. Avoiding one 4K data block for a large
fraction of those files can save several hundred MiB, and in some
cases close to 1 GiB. That seems worth considering if the
implementation stays simple and does not introduce per-file memory
growth for common Android policies.

_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
