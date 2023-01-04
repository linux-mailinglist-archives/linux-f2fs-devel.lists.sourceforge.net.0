Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id CC9CD65D1A2
	for <lists+linux-f2fs-devel@lfdr.de>; Wed,  4 Jan 2023 12:41:01 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1pD28g-0001rD-23;
	Wed, 04 Jan 2023 11:40:58 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <frank.li@vivo.com>) id 1pD28e-0001r4-L1
 for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 04 Jan 2023 11:40:56 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=MIME-Version:Content-Type:Content-Transfer-Encoding
 :Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=scDXDqAaEpLxasyItCxa8IjvlNAlqhRTvXaleMAqtcg=; b=W2attImYdN4MLNrFW9ltR/xeFA
 m6vG//40MBj7lzcbQbu15XwL8zI9VjaGW3LdhjU7+QLRQP5b3DvxU2UhPQCR2/dCYEFpZJ7ojI2tb
 joASLEbflItRzo//1IAwTCIwYPt4ttKz/7uc2+ZJmFHTmwb+ZKmDdk/Tv7jhEAL+W9Mw=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:Date:
 Subject:Cc:To:From:Sender:Reply-To:Content-ID:Content-Description:Resent-Date
 :Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=scDXDqAaEpLxasyItCxa8IjvlNAlqhRTvXaleMAqtcg=; b=e
 f1M0+OudmV8djSBOE1gt7eqksuXXH3+sgKVxjVEp2ZixHDzZljPfSM5xuH26rCoI+QlatzDXF31Oj
 lmvfCcXBTgoB/0RBnKs7C8LjovUKT3sF7GC/lN52Xce+HIbqnNfgTJOc1ol6kokAxCaqy80Ehs6YH
 +6SoKNrKq2WEO+Fc=;
Received: from mail-tyzapc01on2110.outbound.protection.outlook.com
 ([40.107.117.110] helo=APC01-TYZ-obe.outbound.protection.outlook.com)
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1pD28W-0003xp-Sh for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 04 Jan 2023 11:40:56 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=IMU/GyH/dCvxqc0FISEoIFuZtJsOF1asFeEpVzlck6cSvXKHz9cZHno6JuJuzpQpgljKici7/AEoBQsNrstcvy92mdgxVsZbAN9f+7SvlFj5kEoGgjFAIKNwVONgM1gOiJ3bITzhYGFbCb2Eydzg3EEsgb03Xu8yZkznW0FWNX8fixtlj7fh+8D7/ysR6EoHcarZVlIpMeUvI87XG24S4oJGGTwQwt7Iv2Y9sMT2eJCefgtRijEWTTYzPD6HZ8y0DpSkPh7NqpiDP1kbLCSr9ihrzCUOpDwsumcUW0XqFItueR1nmVmzRutoxPXvH13X/H8CF0i8YELMaMKFyLbdrQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=scDXDqAaEpLxasyItCxa8IjvlNAlqhRTvXaleMAqtcg=;
 b=IHSm22VOcH5HgGMph0z5Tb4RmLsnp4IKsiqEsIjhioQa/erFASg5kniVqTthJIxVufUiI7djZL/J6L9Q36awyxMy0kQi6fcx8ZWQiZTzr6ylriitO30ECsslaE7N+fUyVhLTx34+mGXKtUirsXTG3fDZX6dQbe9V4OsxQc6CnKBcPeO9UI3oGa7bKUSjAMHpoKlJspPtr1dNm7yjmJbz7weZWvd06p/kXpXNU+IhNSAeEoGSlunSR20tIQm+zKXs7Z1lenAshY2nWIVsCjlA2SphrOcLKYcvTrwux1UGTFegwkACEAsG//jYLKYjHL8CgRbTVgJjduLwvORjMjtUqA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vivo.com; dmarc=pass action=none header.from=vivo.com;
 dkim=pass header.d=vivo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vivo.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=scDXDqAaEpLxasyItCxa8IjvlNAlqhRTvXaleMAqtcg=;
 b=dVYESvP8gi1u2dh4nEi5051PgY9Oh4SRKTs+jcEkU1BYB5eA20xizl3roZ8JdGmSrliD46ZA9J/5qi4S1zS/TwJg08vYKoZi1cAPxCyr817GG95+NbrD5TU9FvlOdQn1z4rCvTTvRQ0rxK4vsRhtTVRjZO8xcANoh8gcbTgCMonhXDEq0E0jf9x4TmTEp6F1psRa5sLcA+ptkOvoISPoCjgwV/9AaX9dhVwGLCVohmUotItp5cD1i2xgjkBU01d5hBVzochTfrMHumhHK9SRayMXrWnSeErnk/OYAc+EC5wNEO18emYhFnL9ga9InQW7koC0NPKx5/NR+KllkiCDUg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=vivo.com;
Received: from SEZPR06MB5269.apcprd06.prod.outlook.com (2603:1096:101:78::6)
 by SEZPR06MB6137.apcprd06.prod.outlook.com (2603:1096:101:ec::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5944.19; Wed, 4 Jan
 2023 11:40:40 +0000
Received: from SEZPR06MB5269.apcprd06.prod.outlook.com
 ([fe80::7969:5a45:8509:7d80]) by SEZPR06MB5269.apcprd06.prod.outlook.com
 ([fe80::7969:5a45:8509:7d80%4]) with mapi id 15.20.5944.019; Wed, 4 Jan 2023
 11:40:40 +0000
To: jaegeuk@kernel.org,
	chao@kernel.org
Date: Wed,  4 Jan 2023 19:40:29 +0800
Message-Id: <20230104114029.25689-1-frank.li@vivo.com>
X-Mailer: git-send-email 2.35.1
X-ClientProxiedBy: SG2PR03CA0093.apcprd03.prod.outlook.com
 (2603:1096:4:7c::21) To SEZPR06MB5269.apcprd06.prod.outlook.com
 (2603:1096:101:78::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SEZPR06MB5269:EE_|SEZPR06MB6137:EE_
X-MS-Office365-Filtering-Correlation-Id: 30f9feda-8378-4925-b008-08daee488159
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: mD9qsM3l812W5RprIa7GCxkhVw7tIt2fvMgqJzIM18qDkSlkJkNcOWO53VAqJTU/5sCOrhS9gg8QziTrU6y79FpjhDRJZBkhpZwOSySSoREaqAggN/y1ZmE9Sw0K82dsCY7y1mMwsfF/xSbxif+Ygo7++wTpX8rXT5+2t63e1WM3G3sXqBnkgm5k/zsw0LOQ1Pn5BhcQFsOKw73Rc8Om5qgkjNlRE/BouxPfVYvSPD2na189eYHmEIhr9hFen+IoXOQ8iQKACRFl8gV68Zlm1SI0cVqgH7ZKgglPjDC33VIo2AkNNIYNYpUiBX0O+elQOto57VomktlGF4StYAeLr1drZAekf5YncOnqLQEjMVAKE6TI0+CO6CsgT+t6rBZiNRxwqc+EB+WRRRFf+GoM7uE5REuExyXE65ObcpBAcI/F159YEkKErR+K28eO7MI5u0wU+DqTTfsynxECpkvXRQAFVYxUx8PW6qbXc6u+HK8NdD4eJAX8S29uURwSJ+gp/yHEAjw7znckRTwuCuNg7xGbdHQ2bO2lCtbPQ0hsaeGbqwfKeFB92c8CJN0OtSRQ+LfaNrMTHdCGxPOalaGZiF3BiUfW7z1WrrpPMe6YZPAViKg1L14cfTvpTfb7GyE8mB0TZ/R9njWlikjgDVq0/jheYsoEzYJdXcVbuD6rdz1zQazifvG5zpHjX23rX1So
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SEZPR06MB5269.apcprd06.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(4636009)(39860400002)(376002)(396003)(366004)(346002)(136003)(451199015)(36756003)(66476007)(86362001)(4326008)(41300700001)(66556008)(66946007)(8676002)(38100700002)(38350700002)(26005)(186003)(6486002)(107886003)(478600001)(6512007)(52116002)(6666004)(5660300002)(6506007)(8936002)(316002)(19627235002)(2906002)(83380400001)(2616005)(1076003);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?kxXZUf0XZYMuMdEwmZIE7hjlGUQPVDua6F8/fOM2TRIMG3bwAUqEKokcfZrN?=
 =?us-ascii?Q?wnnv8XCt+emOV3YTaJXsLbfwisarILpDMNx5RKOZ7Px4Y5f5g6N5F8x3ifhw?=
 =?us-ascii?Q?l1yHsjI38AQLDjszj39wjAeivTM7xrrBwaT+XqbPbaL+7/uNrrRJ03J6xnhW?=
 =?us-ascii?Q?36J0f6S4IjP9KtZfuTxMaVvyaAVJKCtcPyiWACoKRlsNo3viTF5JDr5L/9P2?=
 =?us-ascii?Q?no7uajsJ41Ci8B9ayoCX6R9eQm1eW3UJ4u7x5HbYyYmIv8rCNF3KW0WrZ+hw?=
 =?us-ascii?Q?S77G0K+9CP8TjHAH8DnwK/i6iGWXe0gguiQSlPFp1WedRWyuXtAZMQbewu1q?=
 =?us-ascii?Q?4xePoRclpX/uM/RRV4htNHxpjboDY8Dz7LY4qqqgdYFIOYJpTyrti1Z8Bd5d?=
 =?us-ascii?Q?ygis4fIaMV2CFtBYLJJrY82ldZYnpEixC6O//Bq5kJ2WFsYjoKNmcT9oeJco?=
 =?us-ascii?Q?9nHVMFXk9HM9jiBN4SaotlhbD8JpnsPgQV2rhViEYK0oSapwmeRY2Yy1i9Q6?=
 =?us-ascii?Q?rV6Cj22N40esySEUcx7f/XBDTri4ZID5t0gKEyT/crA3YQ12+Z9I/9XAUsDO?=
 =?us-ascii?Q?UulHf3N3cE2yk3130x9H6rO5EP9V+U+5pyO5s1/u9+WLnjgMVy7pVvt2GYFA?=
 =?us-ascii?Q?VE9x6+Thq99Tc4DAMeeeSCuMzEGtOClbTqzvMyhfY3/pde2rCZxj+JhYSuBn?=
 =?us-ascii?Q?K8qxvb/Ko5XhIILkTWoTZZ6rwpE9dit6VRQ4FXaKZBX4B8sE6vwb60zkou/g?=
 =?us-ascii?Q?Bj7TPern5hENTOV4SUGDN0Jndg5QhQKXcKCvbOHlx02/o2U5PpMGYnaGJ9Ei?=
 =?us-ascii?Q?2xmEiaE9H6lttUc+eKA5Xn5CjTgV2YKTYRBlrSd9X4fBoN3b8k2jvTdBsM4m?=
 =?us-ascii?Q?+to4bKyZbFy4ob9A0cddr4vVLzUFAddtEHRrK9waggBjcb46FT8OPWfnrmxA?=
 =?us-ascii?Q?qBHTo56WuyXS4Ua9MSEeODIcCapH1c/DkDKzYd5Ws1w1FFMCYTX7cEFqK+B3?=
 =?us-ascii?Q?4+XnlFS3J91Q33DiP5mDpfjGbaQx+iUOMEJR4ymwJLaDjHSzSd0Kxl+Nb2P/?=
 =?us-ascii?Q?oKT3JmNHZuwS5YLMu3TdyHjnpD1OvH4anMiEaBGFAxlg4lCYQu869sAoxoAE?=
 =?us-ascii?Q?WVV3pM5QXKpQaq2QNm+zVqWxc4jUqFyPUJUdb5kzZyFDZhJ5zqTexs0btrNU?=
 =?us-ascii?Q?/qOzKZ7A4gdGrpZRyezfojZTG4DNGLykiBsdh/3Jms/bh+3XgS4I5vl/UY45?=
 =?us-ascii?Q?6JrNYBnNjjLni9iCGsXk97w5svEObWykdrTaEayMHZzWa25G/LsIHQfOAVN2?=
 =?us-ascii?Q?8hw7lwT0PBWocxJVBiKlO7AF0DbEWmsyId5L9MJ9v67CMJD1tvr9pVQEyd+P?=
 =?us-ascii?Q?8z52wt5zndNEF0wEAAwUiaF4Fo9uWdlckx4oCGI5Xcj7uywmtZzbgnRuInBQ?=
 =?us-ascii?Q?wjzqBDpfEEGLEExM1CNDvTqzxCeP5fwijsrPTp4F5QcYIPUck/L+C1hcct8P?=
 =?us-ascii?Q?sQlpNhkG+Tr+bqk76gO82vQAPUZkuIGE51NgfDKpLDJhvpEqOjGMAtrdSbwX?=
 =?us-ascii?Q?hzjtJoMIzTVZaM1kgGJv6oNFE4hCDrwmSBPzFRWF?=
X-OriginatorOrg: vivo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 30f9feda-8378-4925-b008-08daee488159
X-MS-Exchange-CrossTenant-AuthSource: SEZPR06MB5269.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Jan 2023 11:40:40.3572 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 923e42dc-48d5-4cbe-b582-1a797a6412ed
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: /xmGCJrzfvjUYkX1L1FwojylK/oZSdTiW2p5M52V9auJ354YbOT6Mt9pSs+8n2MyoE5vNv6VGCaeRWanX5vYmQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SEZPR06MB6137
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  The current discard_io_aware_gran is a fixed value, change
 it to be configurable through the sys node. Signed-off-by: Yangtao Li
 <frank.li@vivo.com>
 --- v3: remove DEFAULT_IO_AWARE_DISCARD_GRANULARITY
 Documentation/ABI/testing/sysfs-fs-f2fs
 | 9 +++++++++ fs/f2fs/f2fs.h | 1 + fs/f2fs/segment.c | 3 ++- f [...] 
 Content analysis details:   (-0.2 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
 no trust [40.107.117.110 listed in list.dnswl.org]
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [40.107.117.110 listed in wl.mailspike.net]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.0 SPF_HELO_PASS          SPF: HELO matches SPF record
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
X-Headers-End: 1pD28W-0003xp-Sh
Subject: [f2fs-dev] [PATCH v3] f2fs: introduce discard_io_aware_gran sysfs
 node
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

The current discard_io_aware_gran is a fixed value, change it to be
configurable through the sys node.

Signed-off-by: Yangtao Li <frank.li@vivo.com>
---
v3: remove DEFAULT_IO_AWARE_DISCARD_GRANULARITY
 Documentation/ABI/testing/sysfs-fs-f2fs |  9 +++++++++
 fs/f2fs/f2fs.h                          |  1 +
 fs/f2fs/segment.c                       |  3 ++-
 fs/f2fs/sysfs.c                         | 13 +++++++++++++
 4 files changed, 25 insertions(+), 1 deletion(-)

diff --git a/Documentation/ABI/testing/sysfs-fs-f2fs b/Documentation/ABI/testing/sysfs-fs-f2fs
index aaa379bb8a8f..75420c242cc4 100644
--- a/Documentation/ABI/testing/sysfs-fs-f2fs
+++ b/Documentation/ABI/testing/sysfs-fs-f2fs
@@ -708,3 +708,12 @@ Description:	Support configuring fault injection type, should be
 		FAULT_LOCK_OP            0x000020000
 		FAULT_BLKADDR            0x000040000
 		===================      ===========
+
+What:		/sys/fs/f2fs/<disk>/discard_io_aware_gran
+Date:		January 2023
+Contact:	"Yangtao Li" <frank.li@vivo.com>
+Description:	Controls background discard granularity of inner discard thread
+		when is not in idle. Inner thread will not issue discards with size that
+		is smaller than granularity. The unit size is one block(4KB), now only
+		support configuring in range of [0, 512].
+		Default: 512
diff --git a/fs/f2fs/f2fs.h b/fs/f2fs/f2fs.h
index 0a24447472db..cf60221d084e 100644
--- a/fs/f2fs/f2fs.h
+++ b/fs/f2fs/f2fs.h
@@ -409,6 +409,7 @@ struct discard_cmd_control {
 	unsigned int min_discard_issue_time;	/* min. interval between discard issue */
 	unsigned int mid_discard_issue_time;	/* mid. interval between discard issue */
 	unsigned int max_discard_issue_time;	/* max. interval between discard issue */
+	unsigned int discard_io_aware_gran; /* minimum discard granularity not be aware of I/O */
 	unsigned int discard_urgent_util;	/* utilization which issue discard proactively */
 	unsigned int discard_granularity;	/* discard granularity */
 	unsigned int max_ordered_discard;	/* maximum discard granularity issued by lba order */
diff --git a/fs/f2fs/segment.c b/fs/f2fs/segment.c
index 34e9dc4df5bb..d988d83108b2 100644
--- a/fs/f2fs/segment.c
+++ b/fs/f2fs/segment.c
@@ -1059,7 +1059,7 @@ static void __init_discard_policy(struct f2fs_sb_info *sbi,
 	dpolicy->granularity = granularity;
 
 	dpolicy->max_requests = dcc->max_discard_request;
-	dpolicy->io_aware_gran = MAX_PLIST_NUM;
+	dpolicy->io_aware_gran = dcc->discard_io_aware_gran;
 	dpolicy->timeout = false;
 
 	if (discard_type == DPOLICY_BG) {
@@ -2063,6 +2063,7 @@ static int create_discard_cmd_control(struct f2fs_sb_info *sbi)
 	if (!dcc)
 		return -ENOMEM;
 
+	dcc->discard_io_aware_gran = MAX_PLIST_NUM;
 	dcc->discard_granularity = DEFAULT_DISCARD_GRANULARITY;
 	dcc->max_ordered_discard = DEFAULT_MAX_ORDERED_DISCARD_GRANULARITY;
 	if (F2FS_OPTION(sbi).discard_unit == DISCARD_UNIT_SEGMENT)
diff --git a/fs/f2fs/sysfs.c b/fs/f2fs/sysfs.c
index 805b632a3af0..e396851a6dd1 100644
--- a/fs/f2fs/sysfs.c
+++ b/fs/f2fs/sysfs.c
@@ -473,6 +473,17 @@ static ssize_t __sbi_store(struct f2fs_attr *a,
 		return count;
 	}
 
+	if (!strcmp(a->attr.name, "discard_io_aware_gran")) {
+		if (t > MAX_PLIST_NUM)
+			return -EINVAL;
+		if (!f2fs_block_unit_discard(sbi))
+			return -EINVAL;
+		if (t == *ui)
+			return count;
+		*ui = t;
+		return count;
+	}
+
 	if (!strcmp(a->attr.name, "discard_granularity")) {
 		if (t == 0 || t > MAX_PLIST_NUM)
 			return -EINVAL;
@@ -825,6 +836,7 @@ F2FS_RW_ATTR(DCC_INFO, discard_cmd_control, max_discard_request, max_discard_req
 F2FS_RW_ATTR(DCC_INFO, discard_cmd_control, min_discard_issue_time, min_discard_issue_time);
 F2FS_RW_ATTR(DCC_INFO, discard_cmd_control, mid_discard_issue_time, mid_discard_issue_time);
 F2FS_RW_ATTR(DCC_INFO, discard_cmd_control, max_discard_issue_time, max_discard_issue_time);
+F2FS_RW_ATTR(DCC_INFO, discard_cmd_control, discard_io_aware_gran, discard_io_aware_gran);
 F2FS_RW_ATTR(DCC_INFO, discard_cmd_control, discard_urgent_util, discard_urgent_util);
 F2FS_RW_ATTR(DCC_INFO, discard_cmd_control, discard_granularity, discard_granularity);
 F2FS_RW_ATTR(DCC_INFO, discard_cmd_control, max_ordered_discard, max_ordered_discard);
@@ -960,6 +972,7 @@ static struct attribute *f2fs_attrs[] = {
 	ATTR_LIST(min_discard_issue_time),
 	ATTR_LIST(mid_discard_issue_time),
 	ATTR_LIST(max_discard_issue_time),
+	ATTR_LIST(discard_io_aware_gran),
 	ATTR_LIST(discard_urgent_util),
 	ATTR_LIST(discard_granularity),
 	ATTR_LIST(max_ordered_discard),
-- 
2.25.1



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
