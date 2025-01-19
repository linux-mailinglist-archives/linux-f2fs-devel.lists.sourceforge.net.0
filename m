Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 01691A16214
	for <lists+linux-f2fs-devel@lfdr.de>; Sun, 19 Jan 2025 14:51:16 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1tZVho-0004NR-SO;
	Sun, 19 Jan 2025 13:51:12 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <guochunhai@vivo.com>) id 1tZVhn-0004ND-A5
 for linux-f2fs-devel@lists.sourceforge.net;
 Sun, 19 Jan 2025 13:51:11 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=MIME-Version:Content-Type:Content-Transfer-Encoding
 :Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=uomzGJNUj1qirrzt+vLSWu2hlqJtxtk7N1b6UpF8aPg=; b=RglTtKTaGj87+JCrSuBjxlT6YX
 D3WmgyxwWY8WMAgZyz4kD65ZSXPJ1QTSqBNZHu3mqrTb4qeBe/3lx0naSVdtrTwSocMBC6IIcuQoL
 JEsFyBFamwhon0tDBptf1TMT3uZ7MyxaHy6IfRZ1EeSUO1TstFge0QpERNOf0r9LLePk=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:Date:
 Subject:Cc:To:From:Sender:Reply-To:Content-ID:Content-Description:Resent-Date
 :Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=uomzGJNUj1qirrzt+vLSWu2hlqJtxtk7N1b6UpF8aPg=; b=B
 5Emp5/vJxbfuMYw236enOksCwtk3UjVRn19WQsEleuyo53BZMTIc/UetDcVmqVJ5MLurr4UC0+/4X
 yBy941fZ97oD2z/8pKaeL8C9jHNEiAG0eNgyYmQ40NpnA4ssjn+CDbrbelp/50YO3cSTE6nEM62hr
 j4O+8e2Pw4cRZaF8=;
Received: from mail-sg2apc01on2081.outbound.protection.outlook.com
 ([40.107.215.81] helo=APC01-SG2-obe.outbound.protection.outlook.com)
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1tZVhm-0003Ji-Kz for linux-f2fs-devel@lists.sourceforge.net;
 Sun, 19 Jan 2025 13:51:11 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=btipi7DwerreJ3yX6EEbHgCWzzdpf3IGiSxm3DH+K8/MTyx3/qvvWz7QV10DRvDxv2uAD8W84vBDAYzL6IdUmI1FMLsagyKmwEddFCH4JPymvF6ybLjXdgVINId/WXuYCshmtP5vxNhqyIEI2POfltEIn1fc6m2e5NsTn6JpPiBh387cI1Rg6fzue8acW7yHPBoHb1LWVgImSwuwF3LbbJypdpOEIG+pcYzWq4gvJVvS8/A+jIEfCqvrDrYLJfu41kMNYYH9FJCDNNz0bX5no/gC3/Rh3BdOs3MrwWy7xUI9aiw+9ZsusZJbw+ljq8Gq3e9YBjYz488DJJZaOCNGlQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=uomzGJNUj1qirrzt+vLSWu2hlqJtxtk7N1b6UpF8aPg=;
 b=Pp9KzyGz5/Z6chU5PSI/kCnimY2iavsQq1qs4vsI9nrJWdMZyGrhbsNhMeZimIcynpxLAZnyXFzfYtUExTBsYa6kEth+1gdfkoLONM6Ex5gsBfEMQexugsq6fNPU/MQhfX9rFZIJmK/JzX/DBV6I27JhYppC1cCHFVr0xkZh0/7tiIegd0jDLfd3AebXCYTuQdYWsoDwB0IqKZM+eaieXOiCvMnALJQ3ojoriRAS6sortU8Z197JB8Di/BqJ4xz65wTYbhcI6cSkHTYpHdTGD7YrUxBTSePKMGQjfoRkhN5sJXtJW+Lk+70Qu2lahuGI8QlL+P7Q0ALht1dy/0ga/A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vivo.com; dmarc=pass action=none header.from=vivo.com;
 dkim=pass header.d=vivo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vivo.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=uomzGJNUj1qirrzt+vLSWu2hlqJtxtk7N1b6UpF8aPg=;
 b=EoTopP4CHl36d96vyXh47a1NP4w0Oo6b2XAGb5Opa0YSn3aosuO67NPVQh/AkkOfBqEQVnqgRfXGNQSxHAMUhzsidYYKvOSrffhMdKEh4K7zsU7H0cNmzkmVLrsJrQEghTEV/HnyuFa+gy0E9EUqVs9RNBp/QkeHY5B1S4NdCI2dFJsQfP3WR4XhAQ9R8hAIHOiIZjjjlzcKzCaRmVKfrZesgpSvencuxfxBoqrIn4gw4HlXvpnw4uAWLDkiW4mD+dYxPeOZ75K8VDjQdjr3r8luQSYi3+yNBfiw0QzJVXl3oL4lVP4tKKXAmagbO+dnQv3bokr2THWIaEvUvRrmAA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=vivo.com;
Received: from SI6PR06MB7103.apcprd06.prod.outlook.com (2603:1096:4:24e::14)
 by TYUPR06MB5928.apcprd06.prod.outlook.com (2603:1096:400:35f::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8377.11; Sun, 19 Jan
 2025 13:51:00 +0000
Received: from SI6PR06MB7103.apcprd06.prod.outlook.com
 ([fe80::b34a:c5ea:54cb:7bf9]) by SI6PR06MB7103.apcprd06.prod.outlook.com
 ([fe80::b34a:c5ea:54cb:7bf9%4]) with mapi id 15.20.8377.004; Sun, 19 Jan 2025
 13:51:00 +0000
To: chao@kernel.org,
	jaegeuk@kernel.org
Date: Sun, 19 Jan 2025 07:08:34 -0700
Message-Id: <20250119140834.1061145-1-guochunhai@vivo.com>
X-Mailer: git-send-email 2.34.1
X-ClientProxiedBy: SGXP274CA0021.SGPP274.PROD.OUTLOOK.COM (2603:1096:4:b8::33)
 To SI6PR06MB7103.apcprd06.prod.outlook.com
 (2603:1096:4:24e::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SI6PR06MB7103:EE_|TYUPR06MB5928:EE_
X-MS-Office365-Filtering-Correlation-Id: 1a5cea6b-e8a3-49a2-def1-08dd38904ed5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|1800799024|376014|52116014|38350700014; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?hvU1n7WOQY8gww1UdJYhij3+UIlCiUVtgWAN0IpWkoBkPTx5cZZ5Uvz/7hYz?=
 =?us-ascii?Q?UfkqzszED+FoUVfsFNruyQqcWPZIkxtRtv5UWtvENUeiuaww9g5mQfE58PX2?=
 =?us-ascii?Q?DWu//yxnwGcFtizqkh+W9fT3HqZMrlwT0aFZ0SrlSI0NH3X9DhWIttGRoZ4Z?=
 =?us-ascii?Q?uTe3g9RRF00hWBeKNW4knzgsN6PFy6j8rmZQYPS5OYGgPPepcqYPlcFUZtVC?=
 =?us-ascii?Q?Ygh/38qmTI4ZYMjLGJCxNTXq3bPV4LH8qh65B64wNMghpLhfybw+gWUvLA+n?=
 =?us-ascii?Q?rbS/4oJ6mGAee1UIphUioDvi2rF3oYwINJu3Vpn6gnnFWm/h8CRhzC7t7hMs?=
 =?us-ascii?Q?1BnCkXG9XPT2YVN0sLHIW/JF6y129VLehcupzs0k3FR5TPPO8bpCzLH5YvWT?=
 =?us-ascii?Q?X/qbeD9uZ5r+x0ZPC3VP8b1yjPFbMvUBLVWukKLEk21DKKW4a12JCMLixUuA?=
 =?us-ascii?Q?w96tyU0SIvkduvrsltLtPG5V+2P3PHxWxzp9jdSWUf4Ttipstsr8ksMiqtxe?=
 =?us-ascii?Q?SHUDnAbX9zNvzxnrvZhsfMALDjcIC5ZYWQK4hkHcdenPO7tSdzouq/rhYTX3?=
 =?us-ascii?Q?LinvDS/+BlgcNeATmzEsPGqDrVXEtJ7a6WVVewb9YWaBKLnjtuuIcFQ53c/p?=
 =?us-ascii?Q?uHIVMVGOkaR4AkrCv08g+LOLG7UZPY6kL3FG/fhXa8kx0QnZQGuGGEnMdLSY?=
 =?us-ascii?Q?z+VsKPU2oU4+LFuNFz0ZfXe7QQvjq6AOs0b9LrMSOieB+3zOOQ1hsoUcdOG6?=
 =?us-ascii?Q?uh+brnJBHXt1o2UrP3tu1jXhI9sVx6C+47KItM/+zG5jR4o65tZSmsdkQ4vb?=
 =?us-ascii?Q?sQiQpAYnJjoXGJkj+jT5UZuf0owdThPmV4c9KA3BlhluY+xjtqBmdIyagNA9?=
 =?us-ascii?Q?XB35RZV40plHq4B65Fs1usO2u6jLmsmUhPbjivXmhmEat8X/f+qOBUkFQeLE?=
 =?us-ascii?Q?qGV0XAdAYHNZtFCkL49b64GQ9YRAQE60kwbQNyPxJNYKJN4lCZZ9PlXStMAE?=
 =?us-ascii?Q?EAPYvc0nPRi+93oLinelP0fcB80ydMeCI10jKrisuZ8A3xsyXT78JVNundAY?=
 =?us-ascii?Q?WXTtNux6WAqsI+cNgE03DlxnqDgakxuOVDnV0jwZLP1jaG6C47vcYUN5Gqx8?=
 =?us-ascii?Q?6FEQ6zCCELJJYd84VfGhdqMuFy8YcwbjZSM87Vykdn7VdTxl4FgwbR8PiDN/?=
 =?us-ascii?Q?a8x1UPD/yFNl/D77wavbLFKIsrMPCFRyrogMyB916dvr16aO35L02w+r+pOC?=
 =?us-ascii?Q?R0dz2fIqaJfFKdUDoXWI0EY0elYkvUwBczOmlDt6/0bnmhZbBtACY2jyp6Hk?=
 =?us-ascii?Q?g4n4Br/XXH0Xv3pZxBrA27dr7XIKCqrwJwDYuX4xVufyNWAI/60Fq7vqY3kC?=
 =?us-ascii?Q?ZVUoo1xhg8aKHZfBrz6RlolZDS6zVVYyslEyZTrmB7kkJ/jMd0sQ4l0S155S?=
 =?us-ascii?Q?gaOb0zAga9O144ARA6XDrvVSuKfjHoo6?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SI6PR06MB7103.apcprd06.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014)(52116014)(38350700014); DIR:OUT;
 SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?36pfM3ygNhphO1bsMADL3lyLDtYq4QgNXF6kA8Dx6PUEJNZRhdZHEwIMKKAb?=
 =?us-ascii?Q?rw5U8Ekdd5bQbaeDiqKVuJv8Yabm8GBYYpCGK6zwLYbe50Wu/zbvyzdd1NJF?=
 =?us-ascii?Q?IFCexNZQCCO9h6czlBLk8rjcP4181hoq0gxZBAyHHkCyB68Vd1/La6Cw3d78?=
 =?us-ascii?Q?oQzg0K8zC0Xb4VoGtRcJBU71zqYUf8GQQHCNayrnSs6pCP2V3v171TlshAQR?=
 =?us-ascii?Q?Ikkvs+7CimwPGMrZJovH6eXM5L4rDjtHi0AaRnlZG22FQJXizsKWvplXcJ49?=
 =?us-ascii?Q?eC6Z7eLMRZY0QkQ7tcsGphLaaXTKPTisbf2QQ17lEwzXzUXXB8mmEa4XSOiY?=
 =?us-ascii?Q?T0DVNJs+6xk5eAGiShr+K/PiI2pSeGtHzlirOjk73ULwiQ0CrxmGIXrEfthV?=
 =?us-ascii?Q?j3qXzYHgJCdaASc2lDxeEAlGqfU+hX1PFhCO1a21rTd0cj+2L1qvfkkb6Mck?=
 =?us-ascii?Q?dtuq+fwfUogsGXZMIE6CnKUzyO9mDvjuVW4m8iW9tfDVsKlymddeh8+V9wDV?=
 =?us-ascii?Q?sz3hnkppc8DhBlFm6NTYoElxlqquBojWRj12eeH0MMnPaYovA8A6I3yReCB9?=
 =?us-ascii?Q?lHmmQD2mZfesETEO+mbYhmoqlI1gBuPV6q2/3Tg9p8uJ5Bw5k7zoV4cChgo5?=
 =?us-ascii?Q?7Xx5HCsYjgwZ2Gm3DN4zd6bF2uLmP7jqsgfMgaMDaKRXGzN86YOUx/rjQjFK?=
 =?us-ascii?Q?NZnjjLJvpyFVveiNwOVnhjRoIh70cLwF1cvBKTqIWzZRhHkAKL3RuEXaASpY?=
 =?us-ascii?Q?Nps7y5nPW10BMuCYKYdAFj9vroVDvhM/0RwEF6T0haaGsWIQzWDsEbNuVkgS?=
 =?us-ascii?Q?bIxsoHaARcbuTrIp8p4gmkgdiDyCE/gOg44DY96ljO3pibbXBEh42Lmetzqm?=
 =?us-ascii?Q?Rj5thsOdYD9wGBDAgzIhIjKooGjfMnQbxiey9Cw7mZmjtHFgphbqRjWShxtU?=
 =?us-ascii?Q?Y2gWfQvupWNoI7XG2y4YspvfjKIM4twLVoaazJE+uEUWgFbqczskoqkQ0mpo?=
 =?us-ascii?Q?ea2ZYB5V1BZwblnSWK2NMxyGRtMLqNV59rUuJ1++tRj1cJVf473JJjF3PU9D?=
 =?us-ascii?Q?68ehTNv75YVg4FvNBr1g7nUkESc/Aso9HBGB0KSJdhxZPWnl0dQP1pYq6FCC?=
 =?us-ascii?Q?mMOB2/ERltzyeUY9as1NWUL8EfTkb1eWnbmlc8IciiCDLksEqmPHIz7kwzBQ?=
 =?us-ascii?Q?87P9Q4UJS8JejEbGs17Y7QbqkHoU1il7bPovYIb7fxA7TbWNkrxv1Pbl2GRv?=
 =?us-ascii?Q?5CDoS0wv2xf8bNBaAREcNIan6Vef0PC4pOl1ceTkAu2RCOYYKYZcN0c7FUlv?=
 =?us-ascii?Q?ky8seTLi6ekZUNvlfNXUnfJ1DYpNbtssAbk0jo0Cg/qZAMHiX1+Lx5Vu0Y/y?=
 =?us-ascii?Q?7xRF22mfNpC15Aj4CbkzbAZHMAbmgg5Cl4iXaU4HbA8jCM2btzgETY715E1P?=
 =?us-ascii?Q?hYSSfsryfYStXKEsG46TPQzwJlo5VLOOy/OUi1A+VdbkBGecYPZRADDd0rqU?=
 =?us-ascii?Q?Ka3dzOhMuDXEByXBhi5kVgX52+D5MKcaAwRJi/dVuCOYFx70soXHI39EqWWr?=
 =?us-ascii?Q?D3MqP1e7kmt5tU0NY/APFUN6hnEqKt7K8snKHGOM?=
X-OriginatorOrg: vivo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1a5cea6b-e8a3-49a2-def1-08dd38904ed5
X-MS-Exchange-CrossTenant-AuthSource: SI6PR06MB7103.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Jan 2025 13:51:00.7121 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 923e42dc-48d5-4cbe-b582-1a797a6412ed
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: xr/zBOefd7uOATlw3BJXWU4O3sHsmXQt+UkjHQsV0Kc1HZjT94nHcPCzh57kYQiHx/o3j2C+LAdyyYV+yKxAIA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYUPR06MB5928
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  fstrim may miss candidates that need to be discarded,
 as shown
 in the examples below. The root cause is that when cpc->reason is set with
 CP_DISCARD, add_discard_addrs() expects that ckpt_valid_map and cur_valid_map
 have been synced by seg_info_to_raw_sit() [1], and it tries to find th [...]
 Content analysis details:   (-0.2 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 RCVD_IN_VALIDITY_RPBL_BLOCKED RBL: ADMINISTRATOR NOTICE: The
 query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [40.107.215.81 listed in bl.score.senderscore.com]
 0.0 RCVD_IN_VALIDITY_CERTIFIED_BLOCKED RBL: ADMINISTRATOR NOTICE:
 The query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [40.107.215.81 listed in sa-accredit.habeas.com]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.0 SPF_HELO_PASS          SPF: HELO matches SPF record
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
 no trust [40.107.215.81 listed in list.dnswl.org]
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [40.107.215.81 listed in wl.mailspike.net]
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
X-Headers-End: 1tZVhm-0003Ji-Kz
Subject: [f2fs-dev] [PATCH v2] f2fs: fix missing discard candidates in fstrim
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
From: Chunhai Guo via Linux-f2fs-devel <linux-f2fs-devel@lists.sourceforge.net>
Reply-To: Chunhai Guo <guochunhai@vivo.com>
Cc: Chunhai Guo <guochunhai@vivo.com>, linux-kernel@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

fstrim may miss candidates that need to be discarded, as shown in the
examples below.

The root cause is that when cpc->reason is set with CP_DISCARD,
add_discard_addrs() expects that ckpt_valid_map and cur_valid_map have
been synced by seg_info_to_raw_sit() [1], and it tries to find the
candidates based on ckpt_valid_map and discard_map. However,
seg_info_to_raw_sit() does not actually run before
f2fs_exist_trim_candidates(), resulting in the failure.

The code logic can be simplified for all cases by finding all the
discard blocks based only on discard_map. This might result in more
discard blocks being sent for the segment during the first checkpoint
after mounting, which were originally expected to be sent only in
fstrim. Regardless, these discard blocks should eventually be sent, and
the simplified code makes sense in this context.

root# cp testfile /f2fs_mountpoint

root# f2fs_io fiemap 0 1 /f2fs_mountpoint/testfile
Fiemap: offset = 0 len = 1
        logical addr.    physical addr.   length           flags
0       0000000000000000 0000000406a00000 000000003d800000 00001000

root# rm /f2fs_mountpoint/testfile

root# fstrim -v -o 0x406a00000 -l 1024M /f2fs_mountpoint -- no candidate is found
/f2fs_mountpoint: 0 B (0 bytes) trimmed

Relevant code process of the root cause:
f2fs_trim_fs()
    f2fs_write_checkpoint()
        ...
        if (cpc->reason & CP_DISCARD) {
                if (!f2fs_exist_trim_candidates(sbi, cpc)) {
                    unblock_operations(sbi);
                    goto out; // No candidates are found here, and it exits.
                }
            ...
        }

[1] Please refer to commit d7bc2484b8d4 ("f2fs: fix small discards not
to issue redundantly") for the relationship between
seg_info_to_raw_sit() and add_discard_addrs().

Fixes: 25290fa5591d ("f2fs: return fs_trim if there is no candidate")
Signed-off-by: Chunhai Guo <guochunhai@vivo.com>
---
v1: https://lore.kernel.org/linux-f2fs-devel/20250102101310.580277-1-guochunhai@vivo.com/
v1->v2: Find all the discard blocks based only on discard_map in add_discard_addrs().
---
 fs/f2fs/segment.c | 5 +----
 1 file changed, 1 insertion(+), 4 deletions(-)

diff --git a/fs/f2fs/segment.c b/fs/f2fs/segment.c
index 13ee73a3c481..25ea892a42dd 100644
--- a/fs/f2fs/segment.c
+++ b/fs/f2fs/segment.c
@@ -2074,8 +2074,6 @@ static bool add_discard_addrs(struct f2fs_sb_info *sbi, struct cp_control *cpc,
 {
 	int entries = SIT_VBLOCK_MAP_SIZE / sizeof(unsigned long);
 	struct seg_entry *se = get_seg_entry(sbi, cpc->trim_start);
-	unsigned long *cur_map = (unsigned long *)se->cur_valid_map;
-	unsigned long *ckpt_map = (unsigned long *)se->ckpt_valid_map;
 	unsigned long *discard_map = (unsigned long *)se->discard_map;
 	unsigned long *dmap = SIT_I(sbi)->tmp_map;
 	unsigned int start = 0, end = -1;
@@ -2100,8 +2098,7 @@ static bool add_discard_addrs(struct f2fs_sb_info *sbi, struct cp_control *cpc,
 
 	/* SIT_VBLOCK_MAP_SIZE should be multiple of sizeof(unsigned long) */
 	for (i = 0; i < entries; i++)
-		dmap[i] = force ? ~ckpt_map[i] & ~discard_map[i] :
-				(cur_map[i] ^ ckpt_map[i]) & ckpt_map[i];
+		dmap[i] = ~discard_map[i];
 
 	while (force || SM_I(sbi)->dcc_info->nr_discards <=
 				SM_I(sbi)->dcc_info->max_discards) {
-- 
2.34.1



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
