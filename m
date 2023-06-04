Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 508F9721485
	for <lists+linux-f2fs-devel@lfdr.de>; Sun,  4 Jun 2023 05:57:28 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-3.v29.lw.sourceforge.com)
	by sfs-ml-3.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1q5err-00068v-NL;
	Sun, 04 Jun 2023 03:57:24 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-3.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <shengyong@oppo.com>) id 1q5erq-00068p-JF
 for linux-f2fs-devel@lists.sourceforge.net;
 Sun, 04 Jun 2023 03:57:22 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=MIME-Version:Content-Type:Content-Transfer-Encoding
 :References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=ROGVLpFijJObeMmEpceZLA/lo/+mh2T4IRIiFIVK8lU=; b=DrzFpClR3q6puApsX2tSplo/RY
 DYUrU4gjNbIuV8d1NLukdRZ7/uT9Bn+8tfc0zSaph+1oVTSXmEIXxeXY+hUP81R7tWsNFKdhPgr6I
 bz+CPwnXDMrllUEANcNIRGFYXqVBCXrYrvssfEr/LO9SB/4RTgRey2El+B1wGMPhAuuE=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=MIME-Version:Content-Type:Content-Transfer-Encoding:References:
 In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=ROGVLpFijJObeMmEpceZLA/lo/+mh2T4IRIiFIVK8lU=; b=jjGjS2kELxiWSktex3B9lZlOGk
 q13afyrOaiZqW2LcLpcb5gKwsvkRRYSunmb6hGA6lKeNBj9I9JuhPnTbgOJCqICV7MwfWAdDo9CLH
 fdB/x+o01Xx/qN+FpSVhMKqaFuEw308dQq115fz/j9LDPVS2xJ9d9VoBLlfkybz4Q92w=;
Received: from mail-psaapc01on2050.outbound.protection.outlook.com
 ([40.107.255.50] helo=APC01-PSA-obe.outbound.protection.outlook.com)
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1q5erh-0000P8-NF for linux-f2fs-devel@lists.sourceforge.net;
 Sun, 04 Jun 2023 03:57:20 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=GABCzbQNL50WaPMMEXrZ5cP4uLzIioLSsq+aeg2X3MsjvgGshjR2rr2BNxUUAQn2XqvYNZPM+1Xkv9t3mOxA0AP4kTo/g4UcoD6jcRa2JE/ToIanY9W2Sp1uBfWTl+lG0LH/IGnJ5R+l581/mMQPkgZRqqj8td8De2Jp6plrAN28tyfF/bwLEASmNzRja9Gn95Zg+SsFnv0ARmOIAi4FaHgpA2PeqPaHTiSPq1p9MVn59dkXBeFOfZ916yv+67skI2YK8H9D1Rr5frrrlfR2aircmtG+/32/uAJTGIdosuCZ61y1ZmK4CLHOoRxpg7wVjuVLQq86ExqymRQHzgkR1g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ROGVLpFijJObeMmEpceZLA/lo/+mh2T4IRIiFIVK8lU=;
 b=hYP7POzwwv20cmDAPOvVWjfqNhrc/34zkbHggO+sk9Y8NIgsrdJpctYgNRQTjAtuaY2jfEKVvfjKedP8V+nmG3qNf0xQcOO5jkMmzzsB7otnwe2/puJkjNjt8ugQjXsEwQWJJMit0jWPzyuP349J5aa956WzoohaGAaxSG877hyLWkmYNN2KuSYllIThgDZM0pkw7nK0pSS8KKk+zQwZHIT9oHkPOjUttsHveJsjCRfaGJdyLvJ8X6dKbJLFx68JkkMGLrVhPbZ1o45GcenAVI+5XkfnB4AWpczU4Gs8VS27AyJ1c3VN2ABpWc4TEk19RTSyVxmArSvXtR4gGdOC0g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oppo.com; dmarc=pass action=none header.from=oppo.com;
 dkim=pass header.d=oppo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oppo.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ROGVLpFijJObeMmEpceZLA/lo/+mh2T4IRIiFIVK8lU=;
 b=YTJUIFQFSdiMeqSRk7X0d4p4kXHLdydY21VMVdEPW0EvFuhFSAIORsnB5C+rglDrqKliCviTxb2y0CmCBYWUJbLp/uP5ZsDCC4lHuq6ccHlHLPsyoJTKlL5wjHNYL/NiidLiAESFxCVaizGAwF4UEdDxM7vo+UIw2EbsZ7a7Oik=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oppo.com;
Received: from SI2PR02MB5148.apcprd02.prod.outlook.com (2603:1096:4:153::6) by
 SG2PR02MB4314.apcprd02.prod.outlook.com (2603:1096:0:c::16) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6477.13; Sun, 4 Jun 2023 03:56:58 +0000
Received: from SI2PR02MB5148.apcprd02.prod.outlook.com
 ([fe80::1bc4:fbb5:b757:83ee]) by SI2PR02MB5148.apcprd02.prod.outlook.com
 ([fe80::1bc4:fbb5:b757:83ee%5]) with mapi id 15.20.6477.013; Sun, 4 Jun 2023
 03:56:58 +0000
To: jaegeuk@kernel.org,
	chao@kernel.org
Date: Sun,  4 Jun 2023 11:56:22 +0800
Message-Id: <20230604035623.58572-1-shengyong@oppo.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <e49e9c41-19c7-7cc5-897e-136ebc027f3e@kernel.org>
References: <e49e9c41-19c7-7cc5-897e-136ebc027f3e@kernel.org>
X-ClientProxiedBy: SG2P153CA0009.APCP153.PROD.OUTLOOK.COM (2603:1096::19) To
 SI2PR02MB5148.apcprd02.prod.outlook.com (2603:1096:4:153::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SI2PR02MB5148:EE_|SG2PR02MB4314:EE_
X-MS-Office365-Filtering-Correlation-Id: ae231d56-ff6a-4c13-f49a-08db64afbe2f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: n8cF94Z8MfLASOOmBWZmR5TL5Lz9yqqe1WTEIwthkIf4Twzbdp8zVkz1yHiN0HKQ3SRm1F6cERreiMhsq0xr3kj4LxwsWl4ua9HyAL8U7q0v8lFjGimZq8aVFu7QTCYhorqiDOn6ztTYYM3OhCiDAZr3CETJsdn+8+uoDYMwAAcOhS3PE2c7DQKWH6qWRRarKtutJbUCyFnSOPSn0mvaZpyavP7s1eKphg8TDN7phTf2Slbzrlg+D9fDVSAnXbSkhH4jRnUJpBWUvEj3LjP2iiuI7+zIzHyet+V2fDXAwI6UH7/yIcA/MATtw1FMBpAJyXGWXtPYUiVtqvs4Ien0WNHCUN+DMCgHL1YQcs++qQM+uKh3+jOXhai17aRBoOtW1zusi3gXHzt1Bl+8F7QFINsRTgzh8lV3veLDTuMvvGFzHzBAFd2o3YRo1yKgoVPH5eu/LuwgN9xDnAvvLkNctblWDoRZ3ndE9tTjrrbMd3bd4AyYMjIsvcB5JVjWCzEIcjL54tqqiTt9rKxI2ORBHOlDJ5RE1nZr1QeuNV2xMDayEu5aLTY6ZHqOqvVP8wFO573LpabaPzD4KNLIBC3lQgnep2+9UBeCe3WXvgbdS/WwDEd4n7S5Uq7CF6Bub+yY
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SI2PR02MB5148.apcprd02.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(4636009)(376002)(136003)(39860400002)(346002)(366004)(396003)(451199021)(38350700002)(478600001)(5660300002)(8936002)(8676002)(36756003)(86362001)(2906002)(66946007)(4326008)(66556008)(66476007)(316002)(38100700002)(41300700001)(83380400001)(6512007)(2616005)(6506007)(1076003)(26005)(186003)(107886003)(52116002)(6486002)(6666004);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?gyxHpZYWNl+312hQS/uvHFyqkG3YxiBnZrS78vh+kZBQ8oUASBu1iJeupNsj?=
 =?us-ascii?Q?SeSiVCN3qZ/RqVTdoaQ/VjNHco+xr7PpLz2cFoDmNpZDTI+6oyGkQngWCalQ?=
 =?us-ascii?Q?yLOi5ozJpaww+LRhLLGIo57dXMYpb+aiprLoFgJgfxGca8GRcBVP4VateTl+?=
 =?us-ascii?Q?h6NmJ09iKuTnAuepNzjn2gT799ohc6bGLCbPLZo23+oTSwSjidzZsad90rYH?=
 =?us-ascii?Q?STn3qlhFiyGJp1wq02ojPfIqPXKd9y/riYPn0JSycROosstzEGZsVNU2PNuj?=
 =?us-ascii?Q?Gmiw4MzheHrpwZ+4A9OjJS43RJBSrdJqoIPd0EswcjvWbPZtngypUMM6DvmM?=
 =?us-ascii?Q?HN5xzn6YDW0S94iPcBgyjqv4Bgafm6jYi1IDJ26szUOLAmMZFi3xJmlKQdjr?=
 =?us-ascii?Q?7QJL0u1odRh2t7nWVmYv13xE0cxuiZc8NyOqWhdpRUHuklB9uJEQcpTYLYzf?=
 =?us-ascii?Q?lFEI2QJyiz0R+T4/Y1FZKvt3tqOf1ckc4rSsR5S7Fi8JS6nrQzJx/pqE0Pw4?=
 =?us-ascii?Q?a0hITcjEWlVVjpVvdJGiZ0fyV5o5keCQzWNNJfQUneVAk7X8puvUWQjz0tsL?=
 =?us-ascii?Q?CJr1V2AaMGdc3BE+IFleqeZ498UgO7Ns9RRjdLdfxlZK5P8OVtisxelWwH3G?=
 =?us-ascii?Q?ouc3CejW2LiolM0TFSe+RItx5nvb7XNN/YBEsIJlwS9g10I50su0k8MBEE74?=
 =?us-ascii?Q?S9LDIGn0tzTN1HAUd8ibG+EvKN7VunyqWnG2jFKT2j6Fdv5jxoJF+GPD0ftB?=
 =?us-ascii?Q?RGAqAG17KH5tqVwvGkQadOTeY2ZSlTNlCSaGQQQ18+IMwvPr5r7SFeHXhQSG?=
 =?us-ascii?Q?ht3gIeikjrsvPyeYREAovV8/8peT9KCG7d4tbpCysZXETzjM9YXH29P959t+?=
 =?us-ascii?Q?CJkzt9mQU99rObfPm/4t2Yr/6Duhw4BN76LS+9CLnxjVN1CxL0q06Zh7adoD?=
 =?us-ascii?Q?CAExQ25F89Sxmi0Ye1TOR03SkNsRkKtuZHsME8b88I2BEUl/fYAafIykDpX6?=
 =?us-ascii?Q?IEIcmTaBKRJCyROJBUhS6ghGHeJBKSy7fRItm4nF0TvYz/tNxvBgNff8qLHQ?=
 =?us-ascii?Q?xU5ibpbhA1iRQWCjuy39hYsUCtQY6zNJnlHJRlPxiJqoRXnVG8mFKdeC5Yg3?=
 =?us-ascii?Q?uyYqMf9jYaZdvXMVDbS4Ds2nGsbYnvu2fxchuLSMNcTYxGGipXJi15Fo2ZKq?=
 =?us-ascii?Q?qTk2iwBsCP4nvn72N1gzWFn+u9PCxuRivsxn7naDmeIfcepYn+OCGoorwdnx?=
 =?us-ascii?Q?h1H7OdkmLzRn/jhEolwLtouy4dpTx3RkQb1SM0kHaMuxRimGKR2YbUPR2ScW?=
 =?us-ascii?Q?RhhXH91XBd2R+yTP7+xToEGiGdYI+1XG63V54uaklQNRFB2ujB7Tnvh1uzQt?=
 =?us-ascii?Q?RDKuwiDP8TWbPEhf9DaiOvrQiPKt3EDnNwugeBZ3eWu14K8mjpdJrjwIVl9i?=
 =?us-ascii?Q?PuChEE2E4nMaJxDNO12yzQklsVTrBoTAdNjDzACR802KoFHUljXQ0jh6nF0Y?=
 =?us-ascii?Q?1KMgOdrKJsxzWl7Hh0u5Mg3CGO2BFN8XEzLBjiruLjrhIJyH4sLcBL/RA2Y5?=
 =?us-ascii?Q?iwWXBFTYv+1AxJwXJqwgw49IDowrewLZ3JhRC6RB?=
X-OriginatorOrg: oppo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ae231d56-ff6a-4c13-f49a-08db64afbe2f
X-MS-Exchange-CrossTenant-AuthSource: SI2PR02MB5148.apcprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Jun 2023 03:56:57.7636 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f1905eb1-c353-41c5-9516-62b4a54b5ee6
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: hN8k6DNG8Vgy280quoqWOkp39pNmqGB08zWL8hXdoL68+mY+xhIBxHX+mXGZWjwrcdB7ioNGVoQmEMypmD7aUA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SG2PR02MB4314
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: This patch adds get_attr and set_attr to access inode's extra
 attributes. Signed-off-by: Sheng Yong <shengyong@oppo.com> --- v2: update
 manpage of f2fs_io --- man/f2fs_io.8 | 65 ++++++++++++++++
 tools/f2fs_io/f2fs_io.c
 | 165 ++++++++++++++++++++++++++++++++++++++++ tools/f2fs_io/f2fs_io.h |
 34 +++++++++ 3 files changed, 264 insertions(+) 
 Content analysis details:   (-0.2 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
 no trust [40.107.255.50 listed in list.dnswl.org]
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [40.107.255.50 listed in wl.mailspike.net]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.0 SPF_HELO_PASS          SPF: HELO matches SPF record
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
X-Headers-End: 1q5erh-0000P8-NF
Subject: [f2fs-dev] [PATCH v2 1/2] f2fs_io: add [get|set_attr] to access
 inode extra attributes
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

This patch adds get_attr and set_attr to access inode's extra
attributes.

Signed-off-by: Sheng Yong <shengyong@oppo.com>
---
v2: update manpage of f2fs_io

---
 man/f2fs_io.8           |  65 ++++++++++++++++
 tools/f2fs_io/f2fs_io.c | 165 ++++++++++++++++++++++++++++++++++++++++
 tools/f2fs_io/f2fs_io.h |  34 +++++++++
 3 files changed, 264 insertions(+)

diff --git a/man/f2fs_io.8 b/man/f2fs_io.8
index 33789c2..591599f 100644
--- a/man/f2fs_io.8
+++ b/man/f2fs_io.8
@@ -135,6 +135,71 @@ Reserve free blocks to prepare decompressing blocks in the file.
 .TP
 \fBgc\fR \fI[sync_mode] [file]\fR
 Trigger filesystem GC
+.TP
+\fBget_attr\fR \fI[field] [file]\fR
+Get value of an extra attribution from a f2fs inode. The
+.I field
+parameter can be:
+.RS 1.2in
+.TP
+.B total_size
+total size of extra attribution area
+.TP
+.B isize
+size of extra attribution area of the f2fs inode
+.TP
+.B inline_xattr_size
+size of inline xattr size
+.TP
+.B projid
+project quota ID
+.TP
+.B inode_chksum
+inode checksum
+.TP
+.B crtime
+inode create time
+.TP
+.B cblocks
+number of compressed blocks
+.TP
+.B coption
+options of compression
+.RE
+.TP
+\fBset_attr\fR \fI[field] [values] [file]\fR
+Set value of a writable extra attribution to a f2fs inode. The
+.I field
+and
+.I values
+can be:
+.RS 1.2in
+.TP
+.B inline_xattr_size
+.I values
+is \fI[size]\fR
+.TP
+.B coption
+.I values
+are \fI[algorithm] [log_cluster_size] [level] [flag]\fR
+.TP
+.RS
+.TP
+.I
+algorithm
+compression algorithm (0:lz0, 1:lz4: 2:zstd, 3:lzorle)
+.TP
+.I log_cluster_size
+compression cluster log size (2 <= log_cluster_size <= 8)
+.TP
+.I level
+compression level
+.TP
+.I flag
+compression flag (1:chksum)
+.RE 1
+.RE 2
+.TP
 .SH AUTHOR
 This version of
 .B f2fs_io
diff --git a/tools/f2fs_io/f2fs_io.c b/tools/f2fs_io/f2fs_io.c
index 5bc0baf..70e0347 100644
--- a/tools/f2fs_io/f2fs_io.c
+++ b/tools/f2fs_io/f2fs_io.c
@@ -1311,6 +1311,169 @@ static void do_gc(int argc, char **argv, const struct cmd_desc *cmd)
 	exit(0);
 }
 
+#define get_attr_desc "get inode extra attribute"
+#define get_attr_help "f2fs_io get_attr [field] [file_path]\n\n"	\
+"field can be\n"							\
+"  total_size\n"							\
+"  isize\n"								\
+"  inline_xattr_size\n"							\
+"  projid\n"								\
+"  inode_chksum\n"							\
+"  crtime\n"								\
+"  cblocks\n"								\
+"  coption\n"
+
+static const char *extra_attr_fields[] = {
+	[F2FS_EXTRA_ATTR_TOTAL_SIZE] = "total_size",
+	[F2FS_EXTRA_ATTR_ISIZE] = "isize",
+	[F2FS_EXTRA_ATTR_INLINE_XATTR_SIZE] = "inline_xattr_size",
+	[F2FS_EXTRA_ATTR_PROJID] = "projid",
+	[F2FS_EXTRA_ATTR_INODE_CHKSUM] = "inode_chksum",
+	[F2FS_EXTRA_ATTR_CRTIME] = "crtime",
+	[F2FS_EXTRA_ATTR_COMPR_BLOCKS] = "cblocks",
+	[F2FS_EXTRA_ATTR_COMPR_OPTION] = "coption",
+};
+
+static void do_get_attr(int argc, char **argv, const struct cmd_desc *cmd)
+{
+	struct f2fs_extra_attr attr = {0};
+	struct timespec ts = {0};
+	struct f2fs_comp_option_v2 coption = {0};
+	int ret, fd;
+
+	if (argc != 3) {
+		fputs("Excess arguments\n\n", stderr);
+		fputs(cmd->cmd_help, stderr);
+		exit(1);
+	}
+
+	for (attr.field = 0; attr.field < F2FS_EXTRA_ATTR_MAX; attr.field++) {
+		if (!strcmp(extra_attr_fields[attr.field], argv[1]))
+			break;
+	}
+
+	switch (attr.field) {
+	case F2FS_EXTRA_ATTR_TOTAL_SIZE:
+	case F2FS_EXTRA_ATTR_ISIZE:
+	case F2FS_EXTRA_ATTR_INLINE_XATTR_SIZE:
+	case F2FS_EXTRA_ATTR_PROJID:
+	case F2FS_EXTRA_ATTR_INODE_CHKSUM:
+	case F2FS_EXTRA_ATTR_COMPR_BLOCKS:
+		attr.attr_size = sizeof(attr.attr);
+		break;
+	case F2FS_EXTRA_ATTR_CRTIME:
+		attr.attr_size = sizeof(ts);
+		attr.attr = (unsigned long)&ts;
+		break;
+	case F2FS_EXTRA_ATTR_COMPR_OPTION:
+		attr.attr_size = sizeof(coption);
+		attr.attr = (unsigned long)&coption;
+		break;
+	default:
+		die("Unknown field");
+	}
+
+	fd = xopen(argv[2], O_RDONLY, 0);
+
+	ret = ioctl(fd, F2FS_IOC_GET_EXTRA_ATTR, &attr);
+	if (ret < 0)
+		die_errno("F2FS_IOC_GET_EXTRA_ATTR failed");
+
+	switch (attr.field) {
+	case F2FS_EXTRA_ATTR_TOTAL_SIZE:
+	case F2FS_EXTRA_ATTR_ISIZE:
+	case F2FS_EXTRA_ATTR_INLINE_XATTR_SIZE:
+	case F2FS_EXTRA_ATTR_PROJID:
+	case F2FS_EXTRA_ATTR_COMPR_BLOCKS:
+		printf("%"PRIu64"\n", attr.attr);
+		break;
+	case F2FS_EXTRA_ATTR_INODE_CHKSUM:
+		printf("0x%"PRIx64"\n", attr.attr);
+		break;
+	case F2FS_EXTRA_ATTR_CRTIME:
+		printf("sec: %lu\nnsec: %lu\n", ts.tv_sec, ts.tv_nsec);
+		break;
+	case F2FS_EXTRA_ATTR_COMPR_OPTION:
+		printf("compression algorithm:%u\n", coption.algorithm);
+		printf("compression cluster log size:%u\n", coption.log_cluster_size);
+		printf("compression level:%u\n", coption.level);
+		printf("compression flag:0x%x\n", coption.flag);
+		break;
+	default:
+		die("Unknown field");
+	}
+
+	exit(0);
+}
+
+#define set_attr_desc "set inode extra attribute"
+#define set_attr_help "f2fs_io set_attr [field] [values] [file_path]\n\n"	\
+"field can be\n"								\
+"  inline_xattr_size : [values] is [size]\n"					\
+"  coption : [values] are [algorithm] [log_cluster_size] [level] [flag]\n"	\
+"    algorithm        : compression algorithm (0:lzo, 1: lz4, 2:zstd, 3:lzorle)\n"	\
+"    log_cluster_size : compression cluster log size (2 <= log_size <= 8)\n"	\
+"    level            : compression level\n"					\
+"    flag             : compression flag (1:chksum)\n"
+
+static void do_set_attr(int argc, char **argv, const struct cmd_desc *cmd)
+{
+	struct f2fs_extra_attr attr = {0};
+	struct f2fs_comp_option_v2 coption = {0};
+	int i;
+	int ret, fd;
+
+	if (argc < 4)
+		goto out;
+
+	if (!strcmp(argv[1], extra_attr_fields[F2FS_EXTRA_ATTR_INLINE_XATTR_SIZE])) {
+		if (argc != 4)
+			goto out;
+		i = 2;
+		attr.field = F2FS_EXTRA_ATTR_INLINE_XATTR_SIZE;
+		attr.attr_size = sizeof(attr.attr);
+		attr.attr = atoi(argv[i++]);
+	} else if (!strcmp(argv[1], extra_attr_fields[F2FS_EXTRA_ATTR_COMPR_OPTION])) {
+		if (argc != 7)
+			goto out;
+		i = 2;
+		coption.algorithm = atoi(argv[i++]);
+		coption.log_cluster_size = atoi(argv[i++]);
+		coption.level = atoi(argv[i++]);
+		coption.flag = atoi(argv[i++]);
+		attr.field = F2FS_EXTRA_ATTR_COMPR_OPTION;
+		attr.attr_size = sizeof(coption);
+		attr.attr = (unsigned long)&coption;
+	} else {
+		die("Unknown or read only field");
+	}
+
+	fd = xopen(argv[i], O_WRONLY, 0);
+
+	ret = ioctl(fd, F2FS_IOC_SET_EXTRA_ATTR, &attr);
+	if (ret < 0)
+		die_errno("F2FS_IOC_SET_EXTRA_ATTR failed");
+
+	switch (attr.field) {
+	case F2FS_EXTRA_ATTR_INLINE_XATTR_SIZE:
+		printf("set inline_xattr_size:%"PRIu64"\n", attr.attr);
+		break;
+	case F2FS_EXTRA_ATTR_COMPR_OPTION:
+		printf("set compression option: algorithm=%u, "
+			"log_cluster_size=%u, level=%u, flag=0x%x\n",
+			coption.algorithm, coption.log_cluster_size,
+			coption.level, coption.flag);
+		break;
+	}
+
+	exit(0);
+out:
+	fputs("Excess arguments\n\n", stderr);
+	fputs(cmd->cmd_help, stderr);
+	exit(1);
+}
+
+
 #define CMD_HIDDEN 	0x0001
 #define CMD(name) { #name, do_##name, name##_desc, name##_help, 0 }
 #define _CMD(name) { #name, do_##name, NULL, NULL, CMD_HIDDEN }
@@ -1343,6 +1506,8 @@ const struct cmd_desc cmd_list[] = {
 	CMD(get_filename_encrypt_mode),
 	CMD(rename),
 	CMD(gc),
+	CMD(get_attr),
+	CMD(set_attr),
 	{ NULL, NULL, NULL, NULL, 0 }
 };
 
diff --git a/tools/f2fs_io/f2fs_io.h b/tools/f2fs_io/f2fs_io.h
index 58be8f8..2c181e5 100644
--- a/tools/f2fs_io/f2fs_io.h
+++ b/tools/f2fs_io/f2fs_io.h
@@ -91,6 +91,10 @@ typedef u32	__be32;
 #define F2FS_IOC_DECOMPRESS_FILE        _IO(F2FS_IOCTL_MAGIC, 23)
 #define F2FS_IOC_COMPRESS_FILE          _IO(F2FS_IOCTL_MAGIC, 24)
 #define F2FS_IOC_START_ATOMIC_REPLACE	_IO(F2FS_IOCTL_MAGIC, 25)
+#define F2FS_IOC_GET_EXTRA_ATTR		_IOR(F2FS_IOCTL_MAGIC, 26,	\
+						struct f2fs_extra_attr)
+#define F2FS_IOC_SET_EXTRA_ATTR		_IOW(F2FS_IOCTL_MAGIC, 27,	\
+						struct f2fs_extra_attr)
 
 #ifndef FSCRYPT_POLICY_V1
 #define FSCRYPT_POLICY_V1		0
@@ -216,3 +220,33 @@ struct f2fs_comp_option {
 	u8 algorithm;
 	u8 log_cluster_size;
 };
+
+struct f2fs_comp_option_v2 {
+	u8 algorithm;
+	u8 log_cluster_size;
+	u8 level;
+	u8 flag;
+};
+
+enum {
+	F2FS_EXTRA_ATTR_TOTAL_SIZE,		/* ro, size of extra attr area */
+	F2FS_EXTRA_ATTR_ISIZE,			/* ro, i_extra_isize */
+	F2FS_EXTRA_ATTR_INLINE_XATTR_SIZE,	/* rw, i_inline_xattr_size */
+	F2FS_EXTRA_ATTR_PROJID,			/* ro, i_projid */
+	F2FS_EXTRA_ATTR_INODE_CHKSUM,		/* ro, i_inode_chksum */
+	F2FS_EXTRA_ATTR_CRTIME,			/* ro, i_crtime, i_crtime_nsec */
+	F2FS_EXTRA_ATTR_COMPR_BLOCKS,		/* ro, i_compr_blocks */
+	F2FS_EXTRA_ATTR_COMPR_OPTION,		/* rw, i_compress_algorithm,
+						 * i_log_cluster_size,
+						 * i_compress_flag
+						 */
+	F2FS_EXTRA_ATTR_MAX,
+};
+
+struct f2fs_extra_attr {
+	u8 field;	/* F2FS_EXTRA_ATTR_* */
+	u8 rsvd1;
+	u16 attr_size;	/* size of @attr */
+	u32 rsvd2;
+	u64 attr;	/* attr value or pointer */
+};
-- 
2.40.1



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
