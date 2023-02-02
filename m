Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A28C6877D0
	for <lists+linux-f2fs-devel@lfdr.de>; Thu,  2 Feb 2023 09:48:58 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1pNVH7-0006Rw-Iy;
	Thu, 02 Feb 2023 08:48:56 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <frank.li@vivo.com>) id 1pNVGy-0006RF-DP
 for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 02 Feb 2023 08:48:49 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=MIME-Version:Content-Type:Content-Transfer-Encoding
 :References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=abLHHZnqlBGrE6ZQZAOui0eS8X7sxC4va+1/7fk9Eug=; b=OX8sel5fZ0nFzViewR0BFT+esT
 y16/QOVZlpGKGBYGmpiSdYh5+qx41LZ4vAUrQw01iVRbzYbZdDPZSZ+VndNMk/W+sENmlxZqXoouK
 PGzVYdnIAM+QUi7q+ohmZZlI0Iax/6KXjEe/6DH2nZ0LFTsqOUL4faj+WweB3XTNZoYI=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=MIME-Version:Content-Type:Content-Transfer-Encoding:References:
 In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=abLHHZnqlBGrE6ZQZAOui0eS8X7sxC4va+1/7fk9Eug=; b=BICFo47sfhVj1OAPsnNeRnwSnU
 LQdba0L4yM3dF5hd4GkKaIZuMecDj67r8UAYpN3jz75X/5x7YjrIaYPvd3a971LJ/X9pwPLS8TAyV
 lLnH9e6Tuum8GwnLVmL9nYu6KDdsZxi3Dtab6cnE4YU2QVYq70ZOUaCpdfmVusllySGw=;
Received: from mail-psaapc01on2104.outbound.protection.outlook.com
 ([40.107.255.104] helo=APC01-PSA-obe.outbound.protection.outlook.com)
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1pNVGx-008Iir-03 for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 02 Feb 2023 08:48:47 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=OroH9k1OT77WW6Zumz1GMKapm2IE+YaNHvWVHTQBhpLgTLrvQdP/fgDIk0UqFDSBzW3xQis8WPHOJwEHFaZfTgM/W0YLvyZhWSzq5oFvca4BUDgzy2s4kGdMG7I0GkKHovnXJQ9NbCOsOHtmQo0KxCKdkAgjtakIubIWsV95/dg62bG30vpMJVrrsIp4IQuSfC1SRKT1ZEfKpYrwuUun3dgyYsTrJd/rqCt26zSM60+FQNHBwMicHthXMjgJT/Kdf2QmN0tHmJXES0rkUFgdU5mIPTB/rEmebp0u9AnU6oTNCxB91qoAfCouJC6zbB5mpP1BxPy4naEmERXPdw7JrQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=abLHHZnqlBGrE6ZQZAOui0eS8X7sxC4va+1/7fk9Eug=;
 b=VORg3+fl/u12xBsc10pzRfe/zB6uTeGs8jvD5UBb9roRzvzirLH8YQJxgmg0xusu4pFFdB9Zh4gZ6gjemOSqe7oy/2s5+iSj4ufkWDlnclwnK8CCT/NqHVx8ddwA9o1Z/78UjeViP9urEU9ddQ1huQ9x0JeqLZ0+3+n+xA8PKn3Je982bTn79KXkWHgbvQdjAac40o7qnbJgoC6GAAOPGTy5TnzklYTOurKjZYdT+OCZDp6ljkqOy6D7nz+srinCw3VbVhtGCcyjn8NLZAEHLtXl5bzvcHKfGF5iTkAdqXYagtIZ6WNLmu9Isywn973+nvgQdVN0euKHFY0S8OcXHQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vivo.com; dmarc=pass action=none header.from=vivo.com;
 dkim=pass header.d=vivo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vivo.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=abLHHZnqlBGrE6ZQZAOui0eS8X7sxC4va+1/7fk9Eug=;
 b=J+97mL1ePNQ5f9XieEmlD+xuJqBgTgaQDulGE04DvLTuR2jJXw1UveBV3l8R9EfsUpJp1nJkgjWo237moiDdgba5xpjUJpqVWS7EgLk985bLPR6w7Lk5ujaZyO+ixbRqaeAEYTN52fQsTKdt2YdYftsCfFCzu29Tn7vM9euPoM5S2FHVbB3Zq+dkaRJoqk5hpi0oeRHU2VywPQ6m0gFQWlpG9zK55tjUHI1yTwT/5zXRdivfE6cBZA+ti/UyuJJvXk43FhxJSysyfa7/rjAksOk9AfqHFnXxg5Xf+DD5zYnsFFnadvemd1lf4dCSNIE+xrNpNvLL0L1ZCJW8ME59Zg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=vivo.com;
Received: from SEZPR06MB5269.apcprd06.prod.outlook.com (2603:1096:101:78::6)
 by KL1PR0601MB4514.apcprd06.prod.outlook.com (2603:1096:820:72::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6064.22; Thu, 2 Feb
 2023 08:48:32 +0000
Received: from SEZPR06MB5269.apcprd06.prod.outlook.com
 ([fe80::3e52:d08c:ecf4:d572]) by SEZPR06MB5269.apcprd06.prod.outlook.com
 ([fe80::3e52:d08c:ecf4:d572%5]) with mapi id 15.20.6064.022; Thu, 2 Feb 2023
 08:48:32 +0000
To: jaegeuk@kernel.org,
	chao@kernel.org
Date: Thu,  2 Feb 2023 16:48:15 +0800
Message-Id: <20230202084815.70791-3-frank.li@vivo.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20230202084815.70791-1-frank.li@vivo.com>
References: <20230202084815.70791-1-frank.li@vivo.com>
X-ClientProxiedBy: SG2PR04CA0184.apcprd04.prod.outlook.com
 (2603:1096:4:14::22) To SEZPR06MB5269.apcprd06.prod.outlook.com
 (2603:1096:101:78::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SEZPR06MB5269:EE_|KL1PR0601MB4514:EE_
X-MS-Office365-Filtering-Correlation-Id: ea3e8357-23d9-4e21-a0b5-08db04fa43b6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: KPwc9QVnCJgOmmyXW0gLMvoZOLCuQDSxdKzufQ5p1SI5myRQlM2uy9NZ9BOkpfXbbQK48J9iME67jxgn81GXD/Fmy3WiZ5LsQo9tcHUfsWUV+F9yUna/uJlEQB0R3WyCGGX+VhKxlhtjwMFwgAEv0WemvcC802OPmjAySQq6po65Veox4FFMqrq7AqjWXLVHOOgKw3Gj8DpkTugvpiRY/GffhCOh3U+Q0JupzehJiueirIiktfSuwNCAfwuD80J4tYB0AU64eEKiOrDIiEvrth0+PILv/7j+s3I7RNZUM3DHIn88sYDAUYZfG689DjuKK3PEXmfwPls6n9tQXTOqf9OJS5JUZCt6WFW9zYqpSbBj238cLGWqi7TK9dSEyU8dcU5wDGZGePowSvNED9YcVVvOE2Il0v8DKSKqVUcEfWKlvfpyp0uo+DjH5E9RDH9CpDi6MkVEEhQDzi/B1nB/UFJdSoQyVwjkWvrwBpbQfG82sInBtRei5WE0vKbNNy6og2kQDS12XxhMEFDu5CgLI3UIK/iE8XHQgXl8mDN6pKmjKq0MUKJIXykQFJ8pgKIwMisWb2P0aPN+Qjj/IGW5jb5tlyBKeGp+4lyppH22tIw86OiMrgTWKT+SiDbea9McqM67fGGd5D0Llpu3JKmJqR8ufLhIb4gggoGzOmzg0RELBdaazXrq6X0+gEFr1+liKDAEMxjGNUL6IVqPiOy+5Q==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SEZPR06MB5269.apcprd06.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230025)(4636009)(376002)(396003)(346002)(39860400002)(136003)(366004)(451199018)(6512007)(1076003)(478600001)(8936002)(186003)(2906002)(107886003)(26005)(6666004)(52116002)(6506007)(2616005)(6486002)(86362001)(8676002)(5660300002)(83380400001)(4326008)(41300700001)(38350700002)(38100700002)(316002)(19627235002)(66556008)(66946007)(66476007)(36756003);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?0ZW58v8Bx1DpDrPS8UlzVzgCk6m0VQ1imj8pYVSJkz+9E2OVWQTi2Y8SR0Di?=
 =?us-ascii?Q?SCHIROo9DI/xDe+NRZrI9O7sSdYNE1ysGnlmrRjrqwvSkvCX0HVfFkFKdvXI?=
 =?us-ascii?Q?cJnz0ly7DqUBed85n5m8aynW10m7MpIPJjjrTTM4zshFYfKI0vrVlH5paFkR?=
 =?us-ascii?Q?j0L5mnythz6gKzhwbLq3ScVlTjOdqILqG6pUTc6Krv5IPUQdECzVeQsk1EUo?=
 =?us-ascii?Q?yys+oAFdIYWBvQ5oU48W17FBB7GL+QFbTTludEiAAC47WJbX4aGC9lbuZMRn?=
 =?us-ascii?Q?iarkiLY4Kzfd5iyI01fp7sXw12jqOhJS7mUvrmg3Sn1YNmU4Rmb+vx3TUprJ?=
 =?us-ascii?Q?8DAEpLbvDn9WtZmvLPB40aTrpjgHSLV9sWkqTEz5Mby4Gxe8cQC/txBTZ3U2?=
 =?us-ascii?Q?cj75ez0g2O/5tobbVpd9zY4HDM/XqlJwE/DqT7fOekXCPK4tftB7vmVSQvtG?=
 =?us-ascii?Q?V9ogVt1yIT0/efwOgaGm8v1pveSBwOr9/QAVePdNSSoqAWD1uvChPm/XbymG?=
 =?us-ascii?Q?5FDGaNL75lLsTdv5Jkt3jkKrjn8m/9dEcKKrjEGlYjNYmtZd98aCA0CII3qa?=
 =?us-ascii?Q?CV1yTJuizhJOOz0bPOKUNSmOzSQuuACQh8Oj0CafOrTgC/dQoS1PDa2RScnI?=
 =?us-ascii?Q?096jcmxIYvYMjOEvs7XosLhB9+3hYS5/V8BTtnr6XEDJGVAr1jT+eRjYi/u2?=
 =?us-ascii?Q?LIioOGzV84tpFVGY4lsC0j99MXuOUU8lrAG14a9P0L5it094RPu4ZrVoAtu8?=
 =?us-ascii?Q?56AqrqbeUY+l1oSiRiDzQptTTokLHx0mQFjnQKROMewotaGj9uwdSARBT0ln?=
 =?us-ascii?Q?xE2DfLmJTosmqb3CimJkaD20oqHZ+XGFEjAo81LHwXrf5kEhQWX2ityVrbBI?=
 =?us-ascii?Q?CXr4C3BWdmbyUNC5GG1pYGXmHBDv/dYYjHlmVAwgiytylPZnw5l8VdgfRhtr?=
 =?us-ascii?Q?en81iHDaeOm1cxzEBQgRBMPr1Aq9WaOcTFyGBrWKpxSZuiHYA6ACfZSj3wWe?=
 =?us-ascii?Q?CA3h/fmyQkdawB+6iYtVqkFdaDhT6uW7EFO6Z5Q0Rn/iZ5/v2fqxh6LosGQZ?=
 =?us-ascii?Q?5NaM7VoAL/d74QYctgJjf0hD7ttcoCiEif2I0OSnhU0PCVEIwrfacrJAjvDd?=
 =?us-ascii?Q?vj6+B1iBUfGWcm6lMkdfF/mKu0n9GYPeMTCEztCChhn3Y4TXIdGiaiFeO7oJ?=
 =?us-ascii?Q?xytmzCI9WBZb9mpyh2chn8OiYhWpPonLgx8neYLKsGcksdobCBJyAcJg11en?=
 =?us-ascii?Q?ChORFzVhfXGpSrJ10BMYaFATT5R9IVCwDpNpZi/L1oQenHhgY0ynS/Z4h6LY?=
 =?us-ascii?Q?a8lXfzXexBStbR7jCTBpRmXfJWLKv4cVIFyM6jn0QWNxAMuCYQ1TTB+IDcvC?=
 =?us-ascii?Q?KltCdElr6brSGQBY8YDr5xrVsN6019W09k5btLZcyQQgsEhve4xJMmn8if7M?=
 =?us-ascii?Q?uGFpraRVd+UIuF2PdZBML4vaKMSfWSjyHz2uf+xDp85pAcM3QairwUAwJ2uZ?=
 =?us-ascii?Q?7C6Oqy/AFku8b84veJZoKdjeqvwSSjcLqgqhBbpjyBEAfvg/aDWrzNzoecia?=
 =?us-ascii?Q?yyfVXB6aaMZS8j8R9KWkTssua5FfLwfMngBNUgbt?=
X-OriginatorOrg: vivo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ea3e8357-23d9-4e21-a0b5-08db04fa43b6
X-MS-Exchange-CrossTenant-AuthSource: SEZPR06MB5269.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Feb 2023 08:48:32.8840 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 923e42dc-48d5-4cbe-b582-1a797a6412ed
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: WfwH8791XEUTaq+Zp4VShho2qHc9G0MnOX+cjzIaT/1NurgVfptLHiQABU83253fTFDAkWb8osEtr5dyyRpNAg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: KL1PR0601MB4514
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: Add a ipu_mode sysfs node to show the current ipu policy as
 a string for readability, like we do in commit a3951cd199a5 ("f2fs: introduce
 gc_mode sysfs node"). Since we use ipu_policy as a bitmap, and the bitmap
 API parameter is unsigned long type data, let's change ipu_policy to unsigned
 long type. 
 Content analysis details:   (-0.2 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [40.107.255.104 listed in wl.mailspike.net]
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
 no trust [40.107.255.104 listed in list.dnswl.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.0 SPF_HELO_PASS          SPF: HELO matches SPF record
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
X-Headers-End: 1pNVGx-008Iir-03
Subject: [f2fs-dev] [PATCH v3 3/3] f2fs: introduce ipu_mode sysfs node
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
From: Yangtao Li via Linux-f2fs-devel <linux-f2fs-devel@lists.sourceforge.net>
Reply-To: Yangtao Li <frank.li@vivo.com>
Cc: Yangtao Li <frank.li@vivo.com>, linux-kernel@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

Add a ipu_mode sysfs node to show the current ipu policy as a string
for readability, like we do in commit a3951cd199a5 ("f2fs: introduce
gc_mode sysfs node").

Since we use ipu_policy as a bitmap, and the bitmap API parameter is
unsigned long type data, let's change ipu_policy to unsigned long type.

Signed-off-by: Yangtao Li <frank.li@vivo.com>
---
v3:
-drop old_ipu_policy type conversion
 Documentation/ABI/testing/sysfs-fs-f2fs |  6 ++++++
 fs/f2fs/f2fs.h                          |  4 ++--
 fs/f2fs/segment.h                       |  1 +
 fs/f2fs/sysfs.c                         | 28 ++++++++++++++++++++++++-
 4 files changed, 36 insertions(+), 3 deletions(-)

diff --git a/Documentation/ABI/testing/sysfs-fs-f2fs b/Documentation/ABI/testing/sysfs-fs-f2fs
index 8a71397fa060..10e34753d246 100644
--- a/Documentation/ABI/testing/sysfs-fs-f2fs
+++ b/Documentation/ABI/testing/sysfs-fs-f2fs
@@ -724,3 +724,9 @@ Description:	Controls background discard granularity of inner discard thread
 		is smaller than granularity. The unit size is one block(4KB), now only
 		support configuring in range of [0, 512].
 		Default: 512
+
+What:		/sys/fs/f2fs/<disk>/ipu_mode
+Date:		February 2023
+Contact:	"Yangtao Li" <frank.li@vivo.com>
+Description:	Show the current ipu policy as a string.
+		This is a read-only entry.
diff --git a/fs/f2fs/f2fs.h b/fs/f2fs/f2fs.h
index 08dc64c5050e..066cd497be09 100644
--- a/fs/f2fs/f2fs.h
+++ b/fs/f2fs/f2fs.h
@@ -1070,7 +1070,7 @@ struct f2fs_sm_info {
 
 	struct list_head sit_entry_set;	/* sit entry set list */
 
-	unsigned int ipu_policy;	/* in-place-update policy */
+	unsigned long ipu_policy;	/* in-place-update policy */
 	unsigned int min_ipu_util;	/* in-place-update threshold */
 	unsigned int min_fsync_blocks;	/* threshold for fsync */
 	unsigned int min_seq_blocks;	/* threshold for sequential blocks */
@@ -1322,7 +1322,7 @@ enum {
 	MAX_TIME,
 };
 
-/* Note that you need to keep synchronization with this gc_mode_names array */
+/* Modification on enum should be synchronized with gc_mode_names array */
 enum {
 	GC_NORMAL,
 	GC_IDLE_CB,
diff --git a/fs/f2fs/segment.h b/fs/f2fs/segment.h
index 8ee5e5db9287..92c8be00d396 100644
--- a/fs/f2fs/segment.h
+++ b/fs/f2fs/segment.h
@@ -672,6 +672,7 @@ static inline int utilization(struct f2fs_sb_info *sbi)
 
 #define F2FS_IPU_DISABLE	0
 
+/* Modification on enum should be synchronized with ipu_mode_names array */
 enum {
 	F2FS_IPU_FORCE,
 	F2FS_IPU_SSR,
diff --git a/fs/f2fs/sysfs.c b/fs/f2fs/sysfs.c
index e1f1ebfa59d6..2a95545b2938 100644
--- a/fs/f2fs/sysfs.c
+++ b/fs/f2fs/sysfs.c
@@ -51,6 +51,17 @@ static const char *gc_mode_names[MAX_GC_MODE] = {
 	"GC_URGENT_MID"
 };
 
+static const char *ipu_mode_names[F2FS_IPU_MAX] = {
+	"FORCE",
+	"SSR",
+	"UTIL",
+	"SSR_UTIL",
+	"FSYNC",
+	"ASYNC",
+	"NOCACHE",
+	"HONOR_OPU_WRITE",
+};
+
 struct f2fs_attr {
 	struct attribute attr;
 	ssize_t (*show)(struct f2fs_attr *a, struct f2fs_sb_info *sbi, char *buf);
@@ -149,6 +160,19 @@ static ssize_t gc_mode_show(struct f2fs_attr *a,
 	return sysfs_emit(buf, "%s\n", gc_mode_names[sbi->gc_mode]);
 }
 
+static ssize_t ipu_mode_show(struct f2fs_attr *a,
+		struct f2fs_sb_info *sbi, char *buf)
+{
+	int len = 0, i = 0;
+
+	if (SM_I(sbi)->ipu_policy == F2FS_IPU_DISABLE)
+		return sysfs_emit(buf, "DISABLE\n");
+
+	for_each_set_bit(i, &SM_I(sbi)->ipu_policy, F2FS_IPU_MAX)
+		len += scnprintf(buf + len, PAGE_SIZE - len, "%s\n", ipu_mode_names[i]);
+	return len;
+}
+
 static ssize_t features_show(struct f2fs_attr *a,
 		struct f2fs_sb_info *sbi, char *buf)
 {
@@ -702,7 +726,7 @@ static ssize_t __sbi_store(struct f2fs_attr *a,
 			return -EINVAL;
 		if (t >= BIT(F2FS_IPU_MAX))
 			return -EINVAL;
-		SM_I(sbi)->ipu_policy = (unsigned int)t;
+		SM_I(sbi)->ipu_policy = t;
 		return count;
 	}
 
@@ -898,6 +922,7 @@ F2FS_GENERAL_RO_ATTR(mounted_time_sec);
 F2FS_GENERAL_RO_ATTR(main_blkaddr);
 F2FS_GENERAL_RO_ATTR(pending_discard);
 F2FS_GENERAL_RO_ATTR(gc_mode);
+F2FS_GENERAL_RO_ATTR(ipu_mode);
 #ifdef CONFIG_F2FS_STAT_FS
 F2FS_STAT_ATTR(STAT_INFO, f2fs_stat_info, cp_foreground_calls, cp_count);
 F2FS_STAT_ATTR(STAT_INFO, f2fs_stat_info, cp_background_calls, bg_cp_count);
@@ -987,6 +1012,7 @@ static struct attribute *f2fs_attrs[] = {
 	ATTR_LIST(max_ordered_discard),
 	ATTR_LIST(pending_discard),
 	ATTR_LIST(gc_mode),
+	ATTR_LIST(ipu_mode),
 	ATTR_LIST(ipu_policy),
 	ATTR_LIST(min_ipu_util),
 	ATTR_LIST(min_fsync_blocks),
-- 
2.25.1



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
