Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id OK6/DuhMBGrhGwIAu9opvQ
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 13 May 2026 12:05:28 +0200
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id A73EB53119F
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 13 May 2026 12:05:27 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:MIME-Version:Message-Id:Date:To:Sender:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=HpXEvvwJiCRJjCWru7NEXTHJ5lkI6f9uPCdF9Qsu6Q4=; b=SwckoJjogTaKf8xAic/aiAoBVS
	P9gq0RAvtXdBXr4wycVkVpFZXa/mpaufonSchzs6/PsWHH8NU77j+IDl2bYzyun9CbQtlbiKEy4MV
	8ymnsRJVw29Ex1NNTsMAlBml4fRC4JAXoJlifXTzh/lh9EMFCzqsLuggJF0B3KvBPezI=;
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1wN6Sr-0004CC-2k;
	Wed, 13 May 2026 10:05:17 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <liaoyuanhong@vivo.com>) id 1wN6Sa-0004BI-Pd
 for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 13 May 2026 10:05:01 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=MIME-Version:Content-Type:Content-Transfer-Encoding
 :Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=EfgLXHdcpZsz3Mfp7svLEyc2zEQGQ9Lvjes6ICsyHC4=; b=Tllx6mlivVQEhDAEPGIm/ga9Ig
 tz5CtGByoT1aLSKOoilFGH4oEW55n6TEn7nt4mX7Myj9Pl9oVnQzykpU8LYL9kRiDdf+bTi5wNBL9
 mcNdMbYr8iNWb7fB7Djf5yjl3EpqYcz5h6+1C7SS8Ium5t1P/clP5LYXPRs0UaF0J3VY=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:Date:
 Subject:Cc:To:From:Sender:Reply-To:Content-ID:Content-Description:Resent-Date
 :Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=EfgLXHdcpZsz3Mfp7svLEyc2zEQGQ9Lvjes6ICsyHC4=; b=K
 j0aByopJmf5ngqpshJ6A+RTzy1qYIsEXlgv2mmDXlxPxdL16KGxIutxpdOoqdNZkaHP0dYCt7rHG1
 S14FgvHi1PCaZrMNiE8MVuA3S00soja+8Qj+hS5wt1YYP6h3L98+UK2FSMMQguZ0wLTYWzzx9UbP2
 C6I7cAqRcjBqQanM=;
Received: from mail-japaneastazon11012009.outbound.protection.outlook.com
 ([52.101.126.9] helo=TYPPR03CU001.outbound.protection.outlook.com)
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1wN6SY-00060O-N4 for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 13 May 2026 10:05:00 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=APF6lA0hjUtImtXJatFHAHPCgKygBvv4Xp7RB0A8sgoooQDfrqCJgKMqu469nqehAQWhXJPIuu45VYs7sz5hNBBZtJ5FRq8AT+pceZHS8TpVHmetKPwSg+f6OOrdS2uTJf+W15KPvqJV7GIr2dg8LDs1uZLzfIw1cJDpFLqeQ0OvfdnHeL6k4uFezlWdEiWLKhWojvgpKOLtp2bZSyUYZfJdWA65PI5wBe08bNHTf2I7uhpzCIxEvKj7sVVC+9P3Vs6z7Q5smSeZFil7wV17hI6HuWVPROegaposo5wrLKYVbRIgY7nGW3UvzEajvph8R5GxZZZy3apMLkt7xANZ+w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=EfgLXHdcpZsz3Mfp7svLEyc2zEQGQ9Lvjes6ICsyHC4=;
 b=FEM6ag+lgEAXfj+XN2QZgfndEgiPA3k4rLJ6OFUgSGSQ+rVyYDmy4BGvLuOWZwNl+AVVBLr4SHIDHh8uXxn8R93oodaKztHYjxoo5pRn8VwDdcMRvznoaCzzbhbg06FyLSrrqIJnt0ZXq/DXp5NmQPrD5rTPq3uaS4dRwjCoxk9Ss7lKVds0Mqj/gmUkIoKmX5pd5fVbpYgiAflaUVRs3OLEpi9p0vM537Lj9Gfm3H0zjNzAo+HhwcTQi+FbJbam/Uj07ujzum4VMouCvKyKMPHusTvf50Zxz0DEYfF/hoOlRj6sALDsR4PhfLj+KD9a9w5IsFM2dfrqUfuyVyIA0w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vivo.com; dmarc=pass action=none header.from=vivo.com;
 dkim=pass header.d=vivo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vivo.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=EfgLXHdcpZsz3Mfp7svLEyc2zEQGQ9Lvjes6ICsyHC4=;
 b=EimOGjRCTeaORQU8PYxAQie15oebA2uEIZlQ9hcZiIskp5Lg4eUllUuKNAio8tiVKG8B3AZR/FdHzsyKZr5Q3ASAJUczcSDQdkemjGSTYDxM2kXR6W9G3Ju7bVMah0TfrtKxDsjhGtF9L2HCzqe01+cwuDvJVExeQKgVoG3dm0A6FuyTwR0h9q3w5hqMmC9wpjQfvz940ClJOohH2xtDMNvT4PCS/VS4V8YnPcPR0HytHEl5UafXYNnjqkihv0acGP4AQ3nh9XBrP+3/I0iQ7jA7ha+mS5tgYhG6iv+Tf7gwqTtWVba9j/Krmy8U5k1qC3MGw6jqyLxRegjI5o2DMA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=vivo.com;
Received: from SEZPR06MB5576.apcprd06.prod.outlook.com (2603:1096:101:c9::14)
 by KL1PR06MB5884.apcprd06.prod.outlook.com (2603:1096:820:dd::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9913.11; Wed, 13 May
 2026 10:04:43 +0000
Received: from SEZPR06MB5576.apcprd06.prod.outlook.com
 ([fe80::24bc:5613:3ffa:cb96]) by SEZPR06MB5576.apcprd06.prod.outlook.com
 ([fe80::24bc:5613:3ffa:cb96%6]) with mapi id 15.20.9913.009; Wed, 13 May 2026
 10:04:43 +0000
To: Jaegeuk Kim <jaegeuk@kernel.org>, Chao Yu <chao@kernel.org>,
 Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>,
 Eric Biggers <ebiggers@kernel.org>, "Theodore Y. Ts'o" <tytso@mit.edu>,
 linux-f2fs-devel@lists.sourceforge.net (open list:F2FS FILE SYSTEM),
 linux-kernel@vger.kernel.org (open list),
 linux-doc@vger.kernel.org (open list:DOCUMENTATION),
 linux-fscrypt@vger.kernel.org (open list:FSCRYPT: FILE SYSTEM LEVEL ENCRYPTION
 SUPPORT)
Date: Wed, 13 May 2026 18:04:27 +0800
Message-Id: <20260513100431.299904-1-liaoyuanhong@vivo.com>
X-Mailer: git-send-email 2.34.1
X-ClientProxiedBy: TP0P295CA0031.TWNP295.PROD.OUTLOOK.COM
 (2603:1096:910:4::12) To SEZPR06MB5576.apcprd06.prod.outlook.com
 (2603:1096:101:c9::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SEZPR06MB5576:EE_|KL1PR06MB5884:EE_
X-MS-Office365-Filtering-Correlation-Id: 62f40f44-8edf-4f2d-36ed-08deb0d70e0a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|1800799024|52116014|7416014|376014|18002099003|11063799003|56012099003|921020|38350700014;
X-Microsoft-Antispam-Message-Info: W+Sw+Gpnf/RZB1scd1qqKj6KbrpFNgKcc4k7agNEuTuIMRvg74hJwHe61gLCbPK8pnxQf2QF7jug65LJJy9od6/jAWCXSwqQlP8pEVp22cZhMfLsMDc+pdP7yYrEk9oqATrqCr4S0Oq7/e54L2qPFnc6GZmZ78HIon8I1sa8QkucCwiaWCCPexrPIczlAmfg4aRK2qt8EX0joX+uyof1xNXlSaGkon7sf1GDR/Ae18WyKm/mp/cNcpSvUXkLdxQPT9w9rJrdLeE6emL2uIxvc30rQElg5TIyflRd6M6MrhYPaOUD0/EaqYLqlEuBS7qsllatPL0Bg5T7tD66WwjiOp5Jp82siXNwVSXK+8MDTs8ETyHjrwBFxhIGfooLs7TRuWcBpVuFPJhbPotlygqM1auVNSrHLRJ5B8WQMzKJBaGqEKogeqUM0RE7Hf6JxIepjpopqo/HMf3AC36Ui5xqAHmlqC4wQ3YnMScJJpMsxLs4zkP18sG2K5qZvnEMFKK+bvTpF3zJMh+8HHa7qSu8LBzwUTGmSKCpF2KE483Bdlpa+d/PZOrXVWHT1/DxVOVLJfEDA1NreYUGo0zNsIYjeUxL53XAzV65mhul3gm6cQK/zd0C06J00q5TYILGJPgEKiTSm3ceMQI84O/D9cWfGruJpgB1QDXVdvOtFN0Ayl2YyOsmTTGg0VyLKkRJBEsfJT5Hi36i127g8W+PrrT2FRJ9i0oYVqe2mm/YYqfCVDVbY5prko9B2Pg8zi3YmBgSb2WwNqcKEU6AoEWppLSXlA==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SEZPR06MB5576.apcprd06.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(52116014)(7416014)(376014)(18002099003)(11063799003)(56012099003)(921020)(38350700014);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?RMbQy9kayRVkk4Neg3UvjdVKuTy0pfHlp+z4RvI+AHAkhGVvZfN4a+9g3ImT?=
 =?us-ascii?Q?rCjoLfINY51p3RiG5EnWR5IfXX1mbSWX0eg5UOZ+RwJQHCMPEkC4ZvX0RbqW?=
 =?us-ascii?Q?ZDv1VDy5U3x26ZCQ6P1lFIJ6kas6S8rjtpuotGL43QwV/7NKKNwt71JdN/+w?=
 =?us-ascii?Q?nXnDEja/Y9TVBMeBGkj2DPTtSyKWXgrqpszyO12e7lBT+vJzvwdEKvjYDpQR?=
 =?us-ascii?Q?p9bhRH6mQHoI0LWSrGlMWBFvCeSsZn977uUu7qGVXmW4B2XlPM+nWzDXjQw8?=
 =?us-ascii?Q?h0oLC2zsbHr6lm35WteCE/wudh/BJYBYa4eAaWQj82II3n0mb+5Wa5sXyQ1d?=
 =?us-ascii?Q?drK4MAXYgmV2GdhttsPgMwrJRSim2x34VZgLXLhd29nB9pMlyNCn7plkVVJh?=
 =?us-ascii?Q?t/WbIRIPnNM+3MRS3bmgcQ8dQjkO8CDcpStR+lUSbVT1j6krkXT+MP8E+aY0?=
 =?us-ascii?Q?q2fNItCs+iHKOgFePFqbmw1ml2rLRYIUZ24PfS6HqHQ2tdC0MZd8FbGLFL+7?=
 =?us-ascii?Q?U9KDJVIdfQMFqMrX+4Gyf+e5phAN4M9+KL/WFj5FzwJv03cJ9Lh24rwBUwO9?=
 =?us-ascii?Q?GjWTBBLkxGK6f4pjCGB5y5orssndB3FqiA0Kp+FVV5qPy442uHmQ+zSrzx10?=
 =?us-ascii?Q?DvOpD81ImvJYrBR4noSobS9ln+svY7w2tftqKYxTDj25MmbvW1BK4BjjrPMk?=
 =?us-ascii?Q?xcPqbIefYqtNdFns5G2eV9t0HNqIfZRh/8rlfE9wSot5jzcINMgr5P3wZvLi?=
 =?us-ascii?Q?/OPPQ7NExrOW3TtRjr0hxmG8dw50oor6wIdedDssmxSQX4OqUIab/ERgrwYq?=
 =?us-ascii?Q?j9AZiQMwiD9bD8YDew62pynJLnR3IykCGhR+ANfAp3mOszKe4anGT8T5ZxaM?=
 =?us-ascii?Q?mSInnOHGAS66cGkPuahG4DpmhmPwKuReke3QuW/omgIjzA7qV8ouE92DGPwx?=
 =?us-ascii?Q?ivsJCPJiJqaWLNCML4IABRCVJyWhmlXSqahmcWCPT4obOA2YWws5zxtDmNnS?=
 =?us-ascii?Q?OyimS0ggdUgaI3cI4iA5w9pN/IDF+HHDec6DkdLSeK+L4yEm+EmOHUyexpZz?=
 =?us-ascii?Q?UdYG0P7hZLNa6g3okuAY2BsTe324T0jz+x4xHlNIbqV9GU+PnwYZn21fpZyW?=
 =?us-ascii?Q?W9FapYAiuKBrdb1NtoBo79geZVdaLPXx+OQzUZ+kYJotoC3gGjdvX61Ohjrm?=
 =?us-ascii?Q?ANNWz5m/VCjYmHY/bjB+sO4zB8RwcDSo1zEB5SJArNsLmQr8F+LQR6N66lJj?=
 =?us-ascii?Q?kVgXXWXtuoQ99LKBbfgETLFAUQ2wo+nSlSm89LN12vD/IS5ssWoY0T8+fBD6?=
 =?us-ascii?Q?WmsgR4yTls28+PrgOAUcbDrLXzZzbWYkAdHVn3J34KWEc9KXc9c1zZ6P0vA1?=
 =?us-ascii?Q?zx4AqboP+gU5w46JWy6nPvoubsqOg7+bU5iLDzz2N6OWCrEf73VoX83mBl1x?=
 =?us-ascii?Q?sTzln4SB+EsSf7nNpECFzU89+jnYFFzsixUeN74iyZMgv0ySyiXL2oaYTSda?=
 =?us-ascii?Q?Rz7+KiP6XKW0+24l9srIZcIWHjC1gH+G2/JWU1BElks6tgLBc/N+xv1f+a8P?=
 =?us-ascii?Q?L2mmufnBgkkPA1lhd/oM7Yy1xz/jFQ5J3Aiinyz7gCWnCmcvsolX2bX5Gs7w?=
 =?us-ascii?Q?cwn7H/rgAC3lOUpCZqkQZouBQxCQZLkbgbiEixBUOGACgqpkm5tK8NrbD48s?=
 =?us-ascii?Q?4lfRB/PRIVgtK/bmIhVYmTayBeLg82qIxFOVtpTxypyyWuLDNN+Lk5jC6/oe?=
 =?us-ascii?Q?9ooJQDHBlQ=3D=3D?=
X-OriginatorOrg: vivo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 62f40f44-8edf-4f2d-36ed-08deb0d70e0a
X-MS-Exchange-CrossTenant-AuthSource: SEZPR06MB5576.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 May 2026 10:04:43.5145 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 923e42dc-48d5-4cbe-b582-1a797a6412ed
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: oE6evvToBBIWGicIFqisk0qobIHTwN68dxv2JK1qdkASByv4ccaCYtjVltbBtDWCtpv/ol9kkp3+TQdIW+JBXw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: KL1PR06MB5884
X-Spam-Score: 1.8 (+)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-2.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  From: Liao Yuanhong <liaoyuanhong@vivo.com> F2FS currently
 avoids inline data for encrypted regular files. This is because inline data
 is stored in the inode block, outside the regular bio-based data path where
 fscrypt and blk-crypto normally o [...] 
 Content analysis details:   (1.8 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 1.0 HK_RANDOM_FROM         From username looks random
 1.0 HK_RANDOM_ENVFROM      Envelope sender username looks random
 0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [52.101.126.9 listed in wl.mailspike.net]
X-Headers-End: 1wN6SY-00060O-N4
Subject: [f2fs-dev] [PATCH 0/3] f2fs: support encrypted inline data
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
Cc: Liao Yuanhong <liaoyuanhong@vivo.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net
X-Rspamd-Queue-Id: A73EB53119F
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-7.61 / 15.00];
	WHITELIST_DMARC(-7.00)[sourceforge.net:D:+];
	ARC_REJECT(1.00)[signature check failed: fail, {[1] = sig:microsoft.com:reject}];
	DMARC_POLICY_ALLOW_WITH_FAILURES(-0.50)[];
	RWL_MAILSPIKE_EXCELLENT(-0.40)[216.105.38.7:from];
	R_SPF_ALLOW(-0.20)[+ip4:216.105.38.7:c];
	MAILLIST(-0.20)[mailman];
	R_DKIM_ALLOW(-0.20)[lists.sourceforge.net:s=beta];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DKIM_MIXED(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:jaegeuk@kernel.org,m:chao@kernel.org,m:corbet@lwn.net,m:skhan@linuxfoundation.org,m:ebiggers@kernel.org,m:tytso@mit.edu,m:linux-f2fs-devel@lists.sourceforge.net,m:linux-kernel@vger.kernel.org,m:linux-doc@vger.kernel.org,m:linux-fscrypt@vger.kernel.org,m:liaoyuanhong@vivo.com,s:lists@lfdr.de];
	DMARC_POLICY_ALLOW(0.00)[lists.sourceforge.net,none];
	MIME_TRACE(0.00)[0:+];
	TO_DN_SOME(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORWARDED(0.00)[linux-f2fs-devel@lists.sourceforge.net];
	FORGED_SENDER(0.00)[linux-f2fs-devel@lists.sourceforge.net,linux-f2fs-devel-bounces@lists.sourceforge.net];
	FORGED_SENDER_MAILLIST(0.00)[];
	R_DKIM_REJECT(0.00)[sourceforge.net:s=x,sf.net:s=x,vivo.com:s=selector2];
	DKIM_TRACE(0.00)[lists.sourceforge.net:+,sourceforge.net:-,sf.net:-,vivo.com:-];
	REPLYTO_DOM_NEQ_TO_DOM(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[linux-f2fs-devel@lists.sourceforge.net,linux-f2fs-devel-bounces@lists.sourceforge.net];
	REPLYTO_DOM_NEQ_FROM_DOM(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TAGGED_RCPT(0.00)[linux-f2fs-devel];
	HAS_REPLYTO(0.00)[liaoyuanhong@vivo.com];
	RCPT_COUNT_SEVEN(0.00)[11];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:11320, ipnet:216.105.32.0/21, country:US];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vivo.com:email,vivo.com:mid,vivo.com:replyto]
X-Rspamd-Action: no action

From: Liao Yuanhong <liaoyuanhong@vivo.com>

F2FS currently avoids inline data for encrypted regular files.  This is
because inline data is stored in the inode block, outside the regular
bio-based data path where fscrypt and blk-crypto normally operate.
As a result, devices that enable blk-crypto for encrypted file contents
cannot use F2FS inline data for encrypted regular files, which wastes
space for small files.

This series adds support for keeping small encrypted regular-file
contents as inline data.  The f2fs side defines a new on-disk feature,
encrypted_inline_data, under which inline payloads of encrypted regular
files are interpreted as ciphertext.  The payload is encrypted before
being stored in the inode block and decrypted back into page-cache
plaintext on read.

The fscrypt side prepares a software contents-key transform even when
normal file contents use blk-crypto, so filesystems can encrypt
filesystem-managed data regions that do not go through bio submission.
The new fscrypt helper operates on fscrypt data units and leaves the
filesystem responsible for deciding which filesystem-managed byte ranges
need this treatment.

The software crypto operation is limited to the inline payload.  Since
these files are small enough to remain inline, the expected read/write
performance difference between hardware and software crypto is small,
while the space saving from keeping the data inline is significant.

The feature is guarded by CONFIG_F2FS_FS_ENCRYPTED_INLINE_DATA and by the
F2FS encrypted_inline_data on-disk feature bit.  Filesystems with this
feature set are rejected if the kernel lacks the config option.

Hardware-wrapped keys are not supported by this initial version. I would
like to discuss whether this feature should remain disabled for
hardware-wrapped keys, or whether there is an acceptable way to support the
combination in the future.

The f2fs-tools support for formatting filesystems with this feature will be
submitted separately.

Basic testing passed.  Encrypted small files can be kept as inline data,
and read/write verification succeeded.

Liao Yuanhong (3):
  fscrypt: prepare software keys for filesystem-managed data units
  f2fs: support encrypted inline data
  Documentation: f2fs: document encrypted inline data

 Documentation/ABI/testing/sysfs-fs-f2fs |   5 +-
 Documentation/filesystems/f2fs.rst      |  27 ++++++
 fs/crypto/crypto.c                      |  63 +++++++++++++
 fs/crypto/fscrypt_private.h             |   3 +-
 fs/crypto/keysetup.c                    |  59 +++++++++---
 fs/f2fs/Kconfig                         |  14 +++
 fs/f2fs/data.c                          |   8 +-
 fs/f2fs/f2fs.h                          |  37 +++++++-
 fs/f2fs/file.c                          |  24 ++++-
 fs/f2fs/inline.c                        | 119 +++++++++++++++++++++---
 fs/f2fs/super.c                         |  12 +++
 fs/f2fs/sysfs.c                         |   8 ++
 include/linux/fscrypt.h                 |  28 ++++++
 13 files changed, 370 insertions(+), 37 deletions(-)

-- 
2.34.1


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
