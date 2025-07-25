Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 9CC8EB11937
	for <lists+linux-f2fs-devel@lfdr.de>; Fri, 25 Jul 2025 09:32:00 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:MIME-Version:Message-Id:Date:To:Sender:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=1eX/MBHMgUYAc5WSUEcSCk6Xs+ixWN9wAUgono7gUXU=; b=ObefiRrlThM9MVt8SLX6V3CaKp
	aA123fDNPxl/0MRWHVF/OJgmJu24yXxui/W1SE/x6Sm5yuDy8t9Dn4yCPT4QE05AZvNldE2KSDdb0
	mTk+WB2suLBX4ZwjuMbmdwnK8vI8YyX3zp8amADqwpNqct2KBcqVFRPe1SXILobNooRY=;
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1ufCu9-0003aP-Vt;
	Fri, 25 Jul 2025 07:31:46 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <hanqi@vivo.com>) id 1ufCu8-0003aG-0i
 for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 25 Jul 2025 07:31:45 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=MIME-Version:Content-Type:Content-Transfer-Encoding
 :Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=y401YSIaMKuD+uvlbsakPH/YwjVWE12wfWy0ouYyTxc=; b=Xzylp+cxsuy8a0lKt58Oxxwy/s
 WNwv+0Q15XcEMpPSyCxHIVoC6H1hEifrz2qUN2Oj+/twVJOrSwtENHrUbOfVdmhbBFlkVYNh+z4qD
 zH/DvGWMrgk48gtCNfG/X9KBaGYHgpRvM2PJm2GqmBTEMZ0xvmXMXeCtpFoLVm5ENzlk=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:Date:
 Subject:Cc:To:From:Sender:Reply-To:Content-ID:Content-Description:Resent-Date
 :Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=y401YSIaMKuD+uvlbsakPH/YwjVWE12wfWy0ouYyTxc=; b=Z
 wtEbRkp0R8ZBD4txhX60prCyEGSi3yF+Ttwu5Tv7Y3EL1ze6yPn7EKnOFYXcE6NE4l7wSt52zFFPh
 U6MHk2suJelMZ/iQQC5JywkhxdAF58pP1l8eMiUdbHCBMFikMQHaUCVIKR/Ol+jtbO7K8f0id4Fds
 xnnf/PgBhuv54H7I=;
Received: from mail-koreacentralazon11013045.outbound.protection.outlook.com
 ([40.107.44.45] helo=SEYPR02CU001.outbound.protection.outlook.com)
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1ufCu7-0005mU-L7 for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 25 Jul 2025 07:31:44 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=bIrE5cjLVUdun98by9yKvGv8eyh6bqSDESkPoxmKD77Ut8GitLjkBXk7hCuSHwuCoGWpm8Ss+UA3/mqq4m3EzUzRSYfY26JzP3xieUE83ZTDA5zIwNWNxFS2MEcXP5BPcyMtgStIFOQUsyQpClMId2O+UaHKDO2Hrz3DKtupXPVXkZW4QlT2tnnnbsJ1ULXnj/TtVLt73QjJBNl/O80sYKDonevfI0NAUmduKz5055Bu2uWGwjvtGWS9izwkdZHGUzpq8/EqjvGNOPru9R6WYCjRR54+HXLm3P/bXilvK/zaTAlEx9QO57KtG502AjOW6nfRcwbSey54EKVe6CrarA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=y401YSIaMKuD+uvlbsakPH/YwjVWE12wfWy0ouYyTxc=;
 b=SEvgaL+e/FwPdC4xlNklvqZ7pJzkMrMHHV6f+3HMbAq0ZQ6v3D8UDP/Io8moHviDEQs2r2kdepuSHrbDcIkgwVhA/gd51CnEyrJANkOtDVOSxHWO6QXkV3GM3BCE/dAxe/7QGXlF9rSk/ptR3CkT63vESzbwHnQo5G+HNtBQwerCxudri70uS7eIFoyf8s6CJ9QXzwk81E8P2aIoh3suIeRBXKBImQeZaWFbtsZlm4sZVcBT26k7MXHPQqWEiVUMBdVxgfR8J1UFx71jIkeHtVJf9F0LyX4GKJ27Hggx2zngCpEbojpIfDhd4BQG5XrTTqzu29dIMIwwgFG3ugNEfw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vivo.com; dmarc=pass action=none header.from=vivo.com;
 dkim=pass header.d=vivo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vivo.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=y401YSIaMKuD+uvlbsakPH/YwjVWE12wfWy0ouYyTxc=;
 b=cl+nKq17ZMqPZiP8j4zluPMrn0Si+xskw3mv0wozFTruN2X+OK6fDq2WlBYXjXJUpP9i5f3mQHibMFwUbRdzuYxImQ0qVbWI5GqHihlqEeSvJOHdRsWZ5xeyuaykLs5vUeW39HYDp3dxF1/yEO2xOqEtiSBEn1IkvxbgVkpoOYJDArjnSnAI7xhykt/O+olJpuMu4mpgcpTLMTDlUCJxM9tqXLncKm1aYvh3HMp7lvdNyv6dtk1gMcrvkipW2yL0oxDsOEP0TE+Pnrzb0qTaHu1YGfqKe6vCmiPp97MBep1kBQD5Gj4G0pdbtbXKc3OTu6RHXCICF0PZ21hM4/WMJg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=vivo.com;
Received: from SEZPR06MB7140.apcprd06.prod.outlook.com (2603:1096:101:228::14)
 by TY2PPFA49BA585E.apcprd06.prod.outlook.com (2603:1096:408::79f)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8835.29; Fri, 25 Jul
 2025 07:31:27 +0000
Received: from SEZPR06MB7140.apcprd06.prod.outlook.com
 ([fe80::9eaf:17a9:78b4:67c0]) by SEZPR06MB7140.apcprd06.prod.outlook.com
 ([fe80::9eaf:17a9:78b4:67c0%5]) with mapi id 15.20.8964.019; Fri, 25 Jul 2025
 07:31:26 +0000
To: chao@kernel.org,
	jaegeuk@kernel.org
Date: Fri, 25 Jul 2025 01:53:10 -0600
Message-Id: <20250725075310.1614614-1-hanqi@vivo.com>
X-Mailer: git-send-email 2.34.1
X-ClientProxiedBy: TYCP286CA0073.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:31a::18) To SEZPR06MB7140.apcprd06.prod.outlook.com
 (2603:1096:101:228::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SEZPR06MB7140:EE_|TY2PPFA49BA585E:EE_
X-MS-Office365-Filtering-Correlation-Id: a5b61e6c-7715-4393-e5cb-08ddcb4d4348
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|376014|366016|52116014|38350700014; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?ktQD6q02DzY0rWxh8QhUHT1UQad58F+GvhOi9Bi9qrwVusf4P3BTHxF2L2so?=
 =?us-ascii?Q?aJo7zGdhVbfwXjRcZgrg7yPYpMdTAHdJVtzjprwduCzJRWviTH9lWDGOUEy5?=
 =?us-ascii?Q?r2KnhWl1QYkI7SvnpipBKrIbF1V7stuk7qlsSWkbyOKMcacoMEm9RXZfXWdk?=
 =?us-ascii?Q?GZR6QWylN7ZtSalVhHk6iKoPgq0vEejIEg76ctYrHdsutrh0CWomyOMd9cPD?=
 =?us-ascii?Q?KcJUCFoOQeLwq3qAuVuAGz/rdSD2CrXjTFLrSZW8iEIeKrL1QgbRwKhLeDwh?=
 =?us-ascii?Q?T+J40w6M9rzH9z9TmjM+WXH9eNxnQF9o52vqjR6O1uDDdXsspscWhgTlhtj9?=
 =?us-ascii?Q?KW9LywxbKUhybnrxpYnXfdUvk8EZYwdER197MpQLqHny43qsu7fonmxmOi8B?=
 =?us-ascii?Q?Si4dH/0opZEUdq7X9yq8548nB8OLl665qiLzesye6/IXoBPdRVdmlH8/cADw?=
 =?us-ascii?Q?txSd3KTwizOqFPapoRcRA2rQeujiDsbC1+hrGL7NbFaSBfLAlOwe1JC+fSpJ?=
 =?us-ascii?Q?vkcjnOjWvbc75JERB0fMVlO6H8fs5pzNSUwLXB9mjw+XO1NAwO0nz8KnNCum?=
 =?us-ascii?Q?kZ6VM9t/oC1vqahJYTaLAxow7NgPbFQQFLc7LFUb8PhUpxTq5V3S9Fx04URu?=
 =?us-ascii?Q?CkFJxj2vtnbKEJNs5rPHrjMmW/xtw6+ilUQlvNbvVG+ETlTsPDDBGGpLJnlz?=
 =?us-ascii?Q?1tLGzS3crK4XsuYss42lSqvwqgww8wzHlnhfwUi6m81fJZXL6pVChnfuCZDL?=
 =?us-ascii?Q?Y0SjyjQFlgL6gNj9sWK0snVYpxz6G52kGb3DBcULZoqaGA1wpGRwxdMam+WA?=
 =?us-ascii?Q?7rA5xRVx+SuNRC++LnU4s+ueHuVC9y3gZtdBLKlDxYj+IfMtKI3L6xjBvtpq?=
 =?us-ascii?Q?a3MDEiLbtmHdmZevG3kUkguAZJxfYLamT81SgGo0y/GaMlbw82AKq2s523pV?=
 =?us-ascii?Q?EDErKso8vnmgyUicmPcRS4skSBUBODJhYTIDVPc/jXG6TOa+JXi77cvfnTZ5?=
 =?us-ascii?Q?jk6VSiTmb96dSOodsvd1Jl3Vc0mZVzQUm8u3BUAvGRa77g03aP9QZx2uklOG?=
 =?us-ascii?Q?Ca1/cm40l9ghT/e97apuPOg2SmRNAaFLWTy9mPG+G+pgSXi6+tKe/QbnBvLC?=
 =?us-ascii?Q?Nki5xpfu/wjLmQ0TvYW2nSg0Yzqg5PNRtaVeMg0YnppHun8kvr0PwSkzOIxa?=
 =?us-ascii?Q?rLeImmYXEYDVTdyfA8JH20NDbDuKv00FLFZdGimJoaRNGkauEe3dAV/fyckc?=
 =?us-ascii?Q?E/YBJKZXehIu2Gq9rqWgrHr8+uDj04mhl0AnDBaBmYkCu/5HlW061URv5oYF?=
 =?us-ascii?Q?RfepIO8uXH5tky/rhE0hSmcAyzFTHB/vwpAHia1wxIhbRY0PlK9Joc08+DcC?=
 =?us-ascii?Q?KcIXX4aNzazvKvdSRPinq6eAnBUcsJ3TWwacIy2L7XHT8n3DmA=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SEZPR06MB7140.apcprd06.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016)(52116014)(38350700014); DIR:OUT;
 SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?KRPkWdaWYt0NCzwEo3hobIDC3+FXKRbhhha2PBvoqGicBCDgHPaEOwnBQI23?=
 =?us-ascii?Q?1x9sSdEEkFRWHwdhf06BUiNim64Sf5/HhRHO8aFrthQfH1Bwuijaf8nTZ6xd?=
 =?us-ascii?Q?6o2yMViJcVdNtoZ+AYHYbkqopaXIOo4ojj690kkhb5s/i+wklqp9TTLrTcow?=
 =?us-ascii?Q?1ooCP8Hzzgl8f8HsrH8+xKaiKS1uHwB6sGx9bHmH7utXI7xvjm1aXvZ4WS8c?=
 =?us-ascii?Q?qTvvcgU9rf8mjd8MmGaaVPs3XnaiO22i8+wDrjJmn4AiYoy6VVeUESmq+2id?=
 =?us-ascii?Q?qlT/pRxAI1onx9MGJGoZRxCcDYteqdX7AlhrvrRRpt7B1oD45M0+L/Tc6LWS?=
 =?us-ascii?Q?0yTgbUbFJpfEY6kvT/Q9R/60fR6hFMKNt/35bQuZrcYlUbQl/0ls8rqy3a5t?=
 =?us-ascii?Q?4a8RJKaY5Hk3s4hYbYHp7xALsDGZ9Ajvy9eM0uhg12guw8UTOR1j5UdNewBh?=
 =?us-ascii?Q?WutOj4BRm9g+JsRvQ89TtdEnw/UWLcbP6oMQ/jCmH1pevhYK0c/Lul/xdGAw?=
 =?us-ascii?Q?z0xr21mBfiGqcURD9d0JG5SUazF09P3U78Y2w0jzxU5Tul4SjihJCrN2AL62?=
 =?us-ascii?Q?OK1/BgGzTzr/IbnXBCqZtd4IYfYQMO35VJ7EuQaI+q60ER4K+o1oyVLng+HP?=
 =?us-ascii?Q?dffqOginhIYRZomRacKeGjbJ3R20VG6wO46jvtoIeXGSPm5HsXH9GkWVz0mR?=
 =?us-ascii?Q?dfSIs6xaxoXrvBpD54ADnMgm8X6zXUdqJPhMdUMyYWMaqSk594bBU6jqJaGu?=
 =?us-ascii?Q?8i9hBU/QrgXPwMBTVZ2FG4kZbHscECpZBU1C2IFp+CFpuDasRCIpT/wwJXh+?=
 =?us-ascii?Q?+ENIyy8bUMaGRv0Ru2d4zoAm8GV7+KjVz7iasJZRsIwv0B2pjIcrW7OjHfkG?=
 =?us-ascii?Q?ZcolkDLdI8SD1GA5qpYrxlRL15J5ZcDnFNFGTdJAqFvNXH5pjkZknXFHafKQ?=
 =?us-ascii?Q?Rpcb9t7/wWbTkxpwjmBJPZQda1Nuqr5dbnNNTn7sM/SbRF51QghD/7Xyk6Ks?=
 =?us-ascii?Q?+SZ0VgdPFSwLqVFkUXro9cTL6CDWHwLYDGYikCBiIlrOm+b2MjcyaDzsWWcK?=
 =?us-ascii?Q?Jh2DkLBQwF9A8U/zBZVESLRIuyt5/mtGN34GURfow3iwin52xTX/mZwCySrW?=
 =?us-ascii?Q?48JEh4GblCqEZ89oPDhNm6mFzbvFs8AjnY9MwLNb7IHuLXQV+5NBHkinyqlI?=
 =?us-ascii?Q?Wm6KDpJpnGOihHuxzY//k9+ekm0q4ey7TqPP8QO2HFFNnlucShWHFPnYs5iF?=
 =?us-ascii?Q?3e29ZB72WGgDvFIAg2GBmtqRoao5RT937CHwuKKzF/4kr5pi1V/X1Lluypet?=
 =?us-ascii?Q?JkJB/bUZxNEfdAX2H8PbKvDlQjgrYPqvqbNdDLNjPFv6fY9cq1FNnRO2nwT8?=
 =?us-ascii?Q?rGSNPCryW4Q2BELRSgB8dmHJCia+09Cxg1Jsw03oWq5QhWStH7IR1lOJvfW4?=
 =?us-ascii?Q?1wVFvn+N/ngLRajsvtdnTazVY4Lmpf4c0I7jaeNuD/u5iDhyq4PbRX0bFIvL?=
 =?us-ascii?Q?qTm9p1HCL+CNS06YcU2RwcwG5KtjzWLlrBZfAWxQfeLuJmEBpdlX0kzzqc7z?=
 =?us-ascii?Q?nthfgSeQCqZtrwdS5GU5B5fJpn4qDbWpLATS3q2C?=
X-OriginatorOrg: vivo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a5b61e6c-7715-4393-e5cb-08ddcb4d4348
X-MS-Exchange-CrossTenant-AuthSource: SEZPR06MB7140.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Jul 2025 07:31:26.2154 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 923e42dc-48d5-4cbe-b582-1a797a6412ed
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: FIfDCkoy8WevkczOOnvU1tDiCPtMGnPZbw7ehLgv8rexPjUmca439ytOnrEyaEaa0C6L/R80cNqTlyJHH41xqA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY2PPFA49BA585E
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-1.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: Jens has already completed the development of uncached
 buffered
 I/O in git [1], and in f2fs, uncached buffered I/O read can be enabled simply
 by setting the FOP_DONTCACHE flag in f2fs_file_operations. 
 Content analysis details:   (-0.2 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [40.107.44.45 listed in wl.mailspike.net]
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.0 ARC_VALID              Message has a valid ARC signature
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.0 ARC_SIGNED             Message has a ARC signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
X-Headers-End: 1ufCu7-0005mU-L7
Subject: [f2fs-dev] [PATCH] f2fs: f2fs supports uncached buffered I/O read
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
From: Qi Han via Linux-f2fs-devel <linux-f2fs-devel@lists.sourceforge.net>
Reply-To: Qi Han <hanqi@vivo.com>
Cc: axboe@kernel.dk, Qi Han <hanqi@vivo.com>, linux-kernel@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

Jens has already completed the development of uncached buffered I/O
in git [1], and in f2fs, uncached buffered I/O read can be enabled
simply by setting the FOP_DONTCACHE flag in f2fs_file_operations.

I have been testing a use case locally, which aligns with Jens' test
case [2]. In the read scenario, using uncached buffer I/O results in
more stable read performance and a lower load on the background memory
reclaim thread (kswapd). So let's enable uncached buffer I/O reads on
F2FS.

Read test data without using uncached buffer I/O:
reading bs 32768, uncached 0
   1s: 1856MB/sec, MB=1856
   2s: 1907MB/sec, MB=3763
   3s: 1830MB/sec, MB=5594
   4s: 1745MB/sec, MB=7333
   5s: 1829MB/sec, MB=9162
   6s: 1903MB/sec, MB=11075
   7s: 1878MB/sec, MB=12942
   8s: 1763MB/sec, MB=14718
   9s: 1845MB/sec, MB=16549
  10s: 1915MB/sec, MB=18481
  11s: 1831MB/sec, MB=20295
  12s: 1750MB/sec, MB=22066
  13s: 1787MB/sec, MB=23832
  14s: 1913MB/sec, MB=25769
  15s: 1898MB/sec, MB=27668
  16s: 1795MB/sec, MB=29436
  17s: 1812MB/sec, MB=31248
  18s: 1890MB/sec, MB=33139
  19s: 1880MB/sec, MB=35020
  20s: 1754MB/sec, MB=36810

08:36:26      UID       PID    %usr %system  %guest   %wait    %CPU   CPU  Command
08:36:27        0        93    0.00    0.00    0.00    0.00    0.00     7  kswapd0
08:36:28        0        93    0.00    0.00    0.00    0.00    0.00     7  kswapd0
08:36:29        0        93    0.00    0.00    0.00    0.00    0.00     7  kswapd0
08:36:30        0        93    0.00   56.00    0.00    0.00   56.00     7  kswapd0
08:36:31        0        93    0.00   73.00    0.00    0.00   73.00     7  kswapd0
08:36:32        0        93    0.00   83.00    0.00    0.00   83.00     7  kswapd0
08:36:33        0        93    0.00   75.00    0.00    0.00   75.00     7  kswapd0
08:36:34        0        93    0.00   81.00    0.00    0.00   81.00     7  kswapd0
08:36:35        0        93    0.00   54.00    0.00    1.00   54.00     2  kswapd0
08:36:36        0        93    0.00   61.00    0.00    0.00   61.00     0  kswapd0
08:36:37        0        93    0.00   68.00    0.00    0.00   68.00     7  kswapd0
08:36:38        0        93    0.00   53.00    0.00    0.00   53.00     2  kswapd0
08:36:39        0        93    0.00   82.00    0.00    0.00   82.00     7  kswapd0
08:36:40        0        93    0.00   77.00    0.00    0.00   77.00     1  kswapd0
08:36:41        0        93    0.00   74.00    0.00    1.00   74.00     7  kswapd0
08:36:42        0        93    0.00   71.00    0.00    0.00   71.00     7  kswapd0
08:36:43        0        93    0.00   78.00    0.00    0.00   78.00     7  kswapd0
08:36:44        0        93    0.00   85.00    0.00    0.00   85.00     7  kswapd0
08:36:45        0        93    0.00   83.00    0.00    0.00   83.00     7  kswapd0
08:36:46        0        93    0.00   70.00    0.00    0.00   70.00     7  kswapd0
08:36:47        0        93    0.00   78.00    0.00    1.00   78.00     2  kswapd0
08:36:48        0        93    0.00   81.00    0.00    0.00   81.00     3  kswapd0
08:36:49        0        93    0.00   54.00    0.00    0.00   54.00     7  kswapd0
08:36:50        0        93    0.00   76.00    0.00    0.00   76.00     1  kswapd0
08:36:51        0        93    0.00   75.00    0.00    0.00   75.00     0  kswapd0
08:36:52        0        93    0.00   73.00    0.00    0.00   73.00     7  kswapd0
08:36:53        0        93    0.00   61.00    0.00    1.00   61.00     7  kswapd0
08:36:54        0        93    0.00   80.00    0.00    0.00   80.00     7  kswapd0
08:36:55        0        93    0.00   64.00    0.00    0.00   64.00     7  kswapd0
08:36:56        0        93    0.00   56.00    0.00    0.00   56.00     7  kswapd0
08:36:57        0        93    0.00   26.00    0.00    0.00   26.00     2  kswapd0
08:36:58        0        93    0.00   24.00    0.00    1.00   24.00     3  kswapd0
08:36:59        0        93    0.00   22.00    0.00    1.00   22.00     3  kswapd0
08:37:00        0        93    0.00   15.84    0.00    0.00   15.84     3  kswapd0
08:37:01        0        93    0.00    0.00    0.00    0.00    0.00     3  kswapd0
08:37:02        0        93    0.00    0.00    0.00    0.00    0.00     3  kswapd0

Read test data after using uncached buffer I/O:
reading bs 32768, uncached 1
   1s: 1863MB/sec, MB=1863
   2s: 1903MB/sec, MB=3766
   3s: 1860MB/sec, MB=5627
   4s: 1864MB/sec, MB=7491
   5s: 1860MB/sec, MB=9352
   6s: 1854MB/sec, MB=11206
   7s: 1874MB/sec, MB=13081
   8s: 1874MB/sec, MB=14943
   9s: 1840MB/sec, MB=16798
  10s: 1849MB/sec, MB=18647
  11s: 1863MB/sec, MB=20511
  12s: 1798MB/sec, MB=22310
  13s: 1897MB/sec, MB=24207
  14s: 1817MB/sec, MB=26025
  15s: 1893MB/sec, MB=27918
  16s: 1917MB/sec, MB=29836
  17s: 1863MB/sec, MB=31699
  18s: 1904MB/sec, MB=33604
  19s: 1894MB/sec, MB=35499
  20s: 1907MB/sec, MB=37407

08:38:00      UID       PID    %usr %system  %guest   %wait    %CPU   CPU  Command
08:38:01        0        93    0.00    0.00    0.00    0.00    0.00     4  kswapd0
08:38:02        0        93    0.00    0.00    0.00    0.00    0.00     4  kswapd0
08:38:03        0        93    0.00    0.00    0.00    0.00    0.00     4  kswapd0
08:38:04        0        93    0.00    0.00    0.00    0.00    0.00     4  kswapd0
08:38:05        0        93    0.00    0.00    0.00    0.00    0.00     4  kswapd0
08:38:06        0        93    0.00    1.00    0.00    1.00    1.00     0  kswapd0
08:38:07        0        93    0.00    0.00    0.00    0.00    0.00     0  kswapd0
08:38:08        0        93    0.00    0.00    0.00    0.00    0.00     0  kswapd0
08:38:09        0        93    0.00    1.00    0.00    0.00    1.00     1  kswapd0
08:38:10        0        93    0.00    0.00    0.00    0.00    0.00     1  kswapd0
08:38:11        0        93    0.00    0.00    0.00    0.00    0.00     1  kswapd0
08:38:12        0        93    0.00    0.00    0.00    0.00    0.00     1  kswapd0
08:38:13        0        93    0.00    0.00    0.00    0.00    0.00     1  kswapd0
08:38:14        0        93    0.00    0.00    0.00    0.00    0.00     1  kswapd0
08:38:15        0        93    0.00    3.00    0.00    0.00    3.00     0  kswapd0
08:38:16        0        93    0.00    0.00    0.00    0.00    0.00     0  kswapd0
08:38:17        0        93    0.00    0.00    0.00    0.00    0.00     0  kswapd0
08:38:18        0        93    0.00    0.00    0.00    0.00    0.00     0  kswapd0
08:38:19        0        93    0.00    0.00    0.00    0.00    0.00     0  kswapd0
08:38:20        0        93    0.00    0.00    0.00    0.00    0.00     0  kswapd0
08:38:21        0        93    0.00    0.00    0.00    0.00    0.00     0  kswapd0
08:38:22        0        93    0.00    0.00    0.00    0.00    0.00     0  kswapd0
08:38:23        0        93    0.00    3.00    0.00    0.00    3.00     4  kswapd0
08:38:24        0        93    0.00    0.00    0.00    0.00    0.00     4  kswapd0
08:38:25        0        93    0.00    0.00    0.00    0.00    0.00     4  kswapd0
08:38:26        0        93    0.00    4.00    0.00    0.00    4.00     3  kswapd0
08:38:27        0        93    0.00    0.00    0.00    0.00    0.00     3  kswapd0
08:38:28        0        93    0.00    0.00    0.00    0.00    0.00     3  kswapd0
08:38:29        0        93    0.00    0.00    0.00    0.00    0.00     3  kswapd0
08:38:30        0        93    0.00    0.00    0.00    0.00    0.00     3  kswapd0
08:38:31        0        93    0.00    0.00    0.00    0.00    0.00     3  kswapd0
08:38:32        0        93    0.00    0.00    0.00    0.00    0.00     3  kswapd0
08:38:33        0        93    0.00    0.00    0.00    0.00    0.00     3  kswapd0

[1]
https://lore.kernel.org/all/20241220154831.1086649-10-axboe@kernel.dk/T/#m58520a94b46f543d82db3711453dfc7bb594b2b0

[2]
https://pastebin.com/u8eCBzB5

Signed-off-by: Qi Han <hanqi@vivo.com>
---
 fs/f2fs/file.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/fs/f2fs/file.c b/fs/f2fs/file.c
index 696131e655ed..d8da1fc2febf 100644
--- a/fs/f2fs/file.c
+++ b/fs/f2fs/file.c
@@ -5425,5 +5425,5 @@ const struct file_operations f2fs_file_operations = {
 	.splice_read	= f2fs_file_splice_read,
 	.splice_write	= iter_file_splice_write,
 	.fadvise	= f2fs_file_fadvise,
-	.fop_flags	= FOP_BUFFER_RASYNC,
+	.fop_flags	= FOP_BUFFER_RASYNC | FOP_DONTCACHE,
 };
-- 
2.48.1



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
