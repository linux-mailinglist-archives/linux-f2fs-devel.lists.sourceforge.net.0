Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id DD9F872DA4E
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 13 Jun 2023 08:59:52 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1q8y0D-0006qe-Pr;
	Tue, 13 Jun 2023 06:59:42 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <frank.li@vivo.com>) id 1q8y0B-0006qW-Dz
 for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 13 Jun 2023 06:59:39 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=MIME-Version:Content-Type:Content-Transfer-Encoding
 :Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=1Oc4+e7EXhHKHV7K5cnyCAqrUF7nyWFB4xpnNKpo1xQ=; b=ezJ7I7w6ObyYpNmRYkm6f7FqQi
 qrlGrN9pYVjZbTHyXN83i6AqHLwk5oww6/BU76cm2AVuj03ZUa2jEuD7Fk3h4c0X4ED6QdvAveRdR
 FCi6mAMg8XeRYhH0ptWUCFm8WmzBtRZVKghxjSpTIwx/K8VXTJlAoFBN6C96MP/7gnMQ=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:Date:
 Subject:Cc:To:From:Sender:Reply-To:Content-ID:Content-Description:Resent-Date
 :Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=1Oc4+e7EXhHKHV7K5cnyCAqrUF7nyWFB4xpnNKpo1xQ=; b=h
 JlhaxRPSuPS+NzZmS/eSMO4zqxq6yS5Fv0HuSRHJgrG4riD8nPOWfAqA0HT1FyrBt7gVtjKIpwygR
 QJSnW42rucqUoi+wmuljM0eri3EPqBn2mIog0UJnKCOmrws3Kp+gyk6naolKAXf3CLiYSpQ+JE0j7
 CeK1P/w7ln8cGpL0=;
Received: from mail-tyzapc01on2091.outbound.protection.outlook.com
 ([40.107.117.91] helo=APC01-TYZ-obe.outbound.protection.outlook.com)
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1q8y07-0004tT-97 for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 13 Jun 2023 06:59:37 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Bnp7zlNQyOcaiQObXGltYOFLyaCSkMdRM4q9eR/hSAdxdzOMe/ym3xo4hIPToXU+Nh5HrUBws44rrH2bo8mjgjog/B8DdWBrdwRVxcnwBLeqkyFbGFX56S2KhS8HUpinEcmcy54aMcyeF4/Ax+Es/F10U+esf3vCnlBqN7SCKnHRbggPl/CU2GNcj5HGqJkYOHzAk88CyF4At06cbOTMeHCmZodgLLdjy9Q1mNq9n/tVOjp46HViCYvzyHotH7jAc4p6dBDUNsGnpr8/p+/oQLSHQeMI4tnwQZKPTRA1rFxGrLNJs2yxQJGnzGRXphvsrac+DsCo3U/UhrFSW7GEUA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1Oc4+e7EXhHKHV7K5cnyCAqrUF7nyWFB4xpnNKpo1xQ=;
 b=F4ASci7ZbQgQsGS+DB8o72a50gSjEN346lyp0uzKPSLZBVFc7+Si41xfZMtSCQmO4hVgWhcO47NBUrKHv8TMwcRt1vORTo6MDy8PhIQnY8Ql2Zf23Dtn36q4hPAXqL7Ara51B+yqIZwSIwT585RfcVjAUbk3+zTHTO2qt8qnRda0q0tDDFN1BfDhOCvDL+lSYlZyLyDeATCgRYzreFor5Q4V7fzyAQhyV4CCQP2AUi+lJ3ErNBjM2ft3LewbDeooCLNEeHx9Hmp3NQjKF3V/DstG83uSSDXKU09vegKnQKLMy/eP6xb/o/6PGYAS5QFHrBpMgEQyHJvz6a3CFi7Gzw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vivo.com; dmarc=pass action=none header.from=vivo.com;
 dkim=pass header.d=vivo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vivo.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1Oc4+e7EXhHKHV7K5cnyCAqrUF7nyWFB4xpnNKpo1xQ=;
 b=mGk7Zv3LW2fK3wFDqsss0s4uViZhfky7tQAF3RhSeYwdzwvrrHto7JYkDe8qJfwTe+GcUZFlTYkzPws2swUgxPi9Jy7QjDlVKh5JlnYWKj/18ND+JXisPKPH7+4qfDrC0SzkhcDiPbTRV/o3uLODG0t3aAxv51x+RA3DKYVEnSp4j7x7tBElYuJsLcJ71bz6xEH5qd3/VtNuuPUx6Z5lqRJCQ9t8pf3YQI3uA3IKpLC/08WG1QdUUEXEv5Yuj5x+3Dx431nKtd3hWZXBJ1CkEOcWKEyFO+zwjJuPlOJjMAxSZdIS6OFma9/EMgU2TaYS5xQzVIs8WUysoF7qt8Pmfw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=vivo.com;
Received: from SEZPR06MB5269.apcprd06.prod.outlook.com (2603:1096:101:78::6)
 by TYZPR06MB4096.apcprd06.prod.outlook.com (2603:1096:400:2e::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6477.29; Tue, 13 Jun
 2023 06:59:26 +0000
Received: from SEZPR06MB5269.apcprd06.prod.outlook.com
 ([fe80::76d6:4828:7e80:2965]) by SEZPR06MB5269.apcprd06.prod.outlook.com
 ([fe80::76d6:4828:7e80:2965%3]) with mapi id 15.20.6455.039; Tue, 13 Jun 2023
 06:59:26 +0000
To: jaegeuk@kernel.org,
	chao@kernel.org
Date: Tue, 13 Jun 2023 14:59:10 +0800
Message-Id: <20230613065911.4304-1-frank.li@vivo.com>
X-Mailer: git-send-email 2.39.0
X-ClientProxiedBy: SG2PR01CA0117.apcprd01.prod.exchangelabs.com
 (2603:1096:4:40::21) To SEZPR06MB5269.apcprd06.prod.outlook.com
 (2603:1096:101:78::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SEZPR06MB5269:EE_|TYZPR06MB4096:EE_
X-MS-Office365-Filtering-Correlation-Id: 90e894af-606f-472a-74cb-08db6bdbb993
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: /lybIc3rqWhSKofmo0h721qXtTTRmE44UkP6fsNyD7ScNxhLnLFckjbv3rlc49sQ/ea4Jj1yat1Y47lwM+Pg3jkTx4I+7u+8VFcI5yYXhxEGjbLzMNLjOT+BtvXcf4Pos2pVH93FPTqaE9loAcaD+fNcQpu2+U+1RfrRq4m09ifJ+j4vI7v/141CqSuDv3bk/N7o8Fk4r9gnUICaOYes0gfoAFjwsQrwk3cVcipC/t3afFjW1r8UYq5Cc8rqdBK/du6Ae3sOnyKrlQ32LJuTIbJaXZf+a0QnnhTQ/cSlxrNTbctQ60WGuFTtRaOrlmYXZGyYZMOZnGqYvoug4YkN30TPaRHscFkG3UQqGZXmX3rKKzEoIb85jkiMCaqvEFvVtwkenMK9Xfd+a0uxZmgxRaiuQV0KShEqi0BMFnO+EBJUu1rjDtY3Bz9GOki9VEd2we9dike55Fy0TBLKvtL+/F4CNOWnh4woasJV+6NaDAWw54HwKp8pCNIwMwniYGghPy6UCXrCL5pOtz6eGF5Ca3WvfXD6NGfkmQRbPD28Qdnh0c57hCIThntRu64IJBOTFE2FHuRI85xNDwxqPRbp95dsPFwLl2ncENjJhlRIp09v66FblcDwTfduacFd9Jml
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SEZPR06MB5269.apcprd06.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(4636009)(366004)(376002)(39850400004)(346002)(396003)(136003)(451199021)(2616005)(83380400001)(86362001)(38100700002)(38350700002)(36756003)(478600001)(4326008)(6486002)(6666004)(8936002)(8676002)(2906002)(5660300002)(52116002)(66556008)(66946007)(66476007)(41300700001)(316002)(186003)(107886003)(6506007)(6512007)(1076003)(26005);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?zbE4BA2Mk84uk+vmNR5RGrOF5m3ml0baLjBQs0a2aNI2xPYzVJRg4swvGewX?=
 =?us-ascii?Q?1Drs2madEOl+l4YXksZwB6VO4lEITlC0EP8WyIMe1D6SUW5uWUjlUIecMbC5?=
 =?us-ascii?Q?KRtEo4upXoI4wAopRVbrf9IcHMUgV/VRwsFxuRvOSPjRwh8zzAAj6A95geVT?=
 =?us-ascii?Q?+us0UEn7DgruTbG3qz4TJO4TXCFdsKQbT6TLCvoQQg3eNUh5mz1uDERcLD09?=
 =?us-ascii?Q?yDiVwA0HM4WJfLBmGXTPf1IyvCkdd1jHfL85PPRth0vawe2qCrBHj2dc1A5T?=
 =?us-ascii?Q?QzVu3mY4hei7Z3ynj2ePcDyiDihxGvit2v5cSty54/G1Cv9m57U1O8uUp/oW?=
 =?us-ascii?Q?ZWB+om3SUxFo5GtOHSfHd2GxICbructgrOZ3Mv2ZmZN+FL/g5QeudsXxNezU?=
 =?us-ascii?Q?O875Equti2pE7m7/qq5mGB3QOUpm476kTBi8d/blJH86uxmTGOVoz/0quoaR?=
 =?us-ascii?Q?jci9P0noofjRFKsbo77Fs3C/zvnMRZdRTgHkXnWM1jj/hLpOhNIsw5xUzna+?=
 =?us-ascii?Q?HQfZefXrDLCL6eZgdTL5+IjxWygIDrt/yx8tPXtUx/4yzrlQLzA6dxb06O/p?=
 =?us-ascii?Q?DylwjkOKJP8MqHrzvwUSDcQ7MTHGEQAhJX3MmwjjJvvEBTPnAIF6YISPLTRb?=
 =?us-ascii?Q?X8U6LHL4OfuI4N0NZC0tiKZ4HF5kzdRNLvYBzjjkeidpPiU6akpLLYCyRXr2?=
 =?us-ascii?Q?dYpDj8DgWuEb+Sn8K01pNd9ucYGD+9930FP8PS7J/N0qSuPNg38XoLoVC3iv?=
 =?us-ascii?Q?Uh3lm5V8Atpyj+2t+xqBMetkTz1HmcQe4uuOLyB1bDQdxpdkK8OnUHKGJvX+?=
 =?us-ascii?Q?286EqB5NVBdKrqT8K7Wh8j3QluxUoXLqkSg+XSHOZY/jOw4+HQwR68OTSRWG?=
 =?us-ascii?Q?Q75UAMo4vmsZsvSU5jGKMOhdGs95BdCntqh72UxVNdhZ9R2j/o9nug+lRbyk?=
 =?us-ascii?Q?GJZfTxw+Um++RmT4GdelXcdKnrmciFlqPCPy87ZXwVoi/dYWDM+z20nlpJfJ?=
 =?us-ascii?Q?FUdPepTk6r23zVQv1bVrZviTlUeZYZ4lf3TViXezSgkMqa/uSSghcNd9NZMV?=
 =?us-ascii?Q?j/r5STnqHLKzsEoK7I/jFvkPm+Gu1xsT+GJb/p9uxivOx1RtKuMPwRO8n8Q1?=
 =?us-ascii?Q?HQ2C4eRQpAeTn4+0ScVJi+L5DOeRN3kaDAccKdDheb2NWvIVTuJXX1JFB+BX?=
 =?us-ascii?Q?f/Q7FEYOFqHjvYW+WhA9fFTNO843guzszJSICcIonCPQGV5UmeUQEzFZHJVP?=
 =?us-ascii?Q?wecxYpifeHSVV6Acu4XhNUOq6eotWWjdee3xJlTEYzVUF9vOxqE6Z0HNq2ZR?=
 =?us-ascii?Q?t9P8MxFinUE4BWsscVNZHx6UpIJMcGMX1vuImwTYiGYvcs6vvMt8lKL3Ywt7?=
 =?us-ascii?Q?NS/o4lwBMrn6iPR6BAEBKCltnjp5+GY9ib6DUVkXBorjfreB+kMPGSf+Kn7r?=
 =?us-ascii?Q?GBGL4No54HaQv0PbmOfK86ghijalpb2rdECyWBkPL8lJFn/2it3lOF3YYAOu?=
 =?us-ascii?Q?o9oFvD0n/dR2rz9UJYceufMSf/QNpPEf2kLL3iZnqZOGlxOvJtJxBp69n24+?=
 =?us-ascii?Q?Wk/PNODN8YeEp4fwiywSBK97iRSX8vNSGArSeEjU?=
X-OriginatorOrg: vivo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 90e894af-606f-472a-74cb-08db6bdbb993
X-MS-Exchange-CrossTenant-AuthSource: SEZPR06MB5269.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Jun 2023 06:59:26.0968 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 923e42dc-48d5-4cbe-b582-1a797a6412ed
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: STmn6fwZXErJFRlZigRVXqtuqAsCflwHZpm0LmjYq8sPnhkL9BMY2+kRE5aZKrMZCAHuiRK3NNUoM3MwwR/zBg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYZPR06MB4096
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: Expend fallocate command to support more flags.
 Signed-off-by:
 Yangtao Li <frank.li@vivo.com> --- v3: -update man/f2fs_io.8 man/f2fs_io.8
 | 19 ++++++++++++++++++- tools/f2fs_io/f2fs_io.c | 39
 +++++++++++++++++++++++++++++++++------ 2 files changed, [...] 
 Content analysis details:   (-0.2 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
 no trust [40.107.117.91 listed in list.dnswl.org]
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [40.107.117.91 listed in wl.mailspike.net]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.0 SPF_HELO_PASS          SPF: HELO matches SPF record
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.0 T_SCC_BODY_TEXT_LINE   No description available.
X-Headers-End: 1q8y07-0004tT-97
Subject: [f2fs-dev] [PATCH v3] f2fs_io: expend fallocate command
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

Expend fallocate command to support more flags.

Signed-off-by: Yangtao Li <frank.li@vivo.com>
---
v3:
-update man/f2fs_io.8
 man/f2fs_io.8           | 19 ++++++++++++++++++-
 tools/f2fs_io/f2fs_io.c | 39 +++++++++++++++++++++++++++++++++------
 2 files changed, 51 insertions(+), 7 deletions(-)

diff --git a/man/f2fs_io.8 b/man/f2fs_io.8
index c5eadde..450f1b7 100644
--- a/man/f2fs_io.8
+++ b/man/f2fs_io.8
@@ -43,10 +43,27 @@ going down with fsck mark
 \fBpinfile\fR \fI[get|set] [file]\fR
 Get or set the pinning status on a file.
 .TP
-\fBfallocate\fR \fI[keep_size] [offset] [length] [file]\fR
+\fBfallocate\fR \fI[-c] [-i] [-p] [-z] [keep_size] [offset] [length] [file]\fR
 Request that space be allocated on a file.  The
 .I keep_size
 parameter can be either 1 or 0.
+The
+.I pattern
+parameter can be:
+.RS 1.2in
+.TP
+.B -c
+collapse range
+.TP
+.B -i
+insert range
+.TP
+.B -p
+punch hole
+.TP
+.B -z
+zero range
+.RE
 .TP
 \fBwrite\fR \fI[chunk_size in 4kb] [offset in chunk_size] [count] [pattern] [IO] [file_path]\fR
 Write a given pattern to
diff --git a/tools/f2fs_io/f2fs_io.c b/tools/f2fs_io/f2fs_io.c
index 1774eca..b4e7307 100644
--- a/tools/f2fs_io/f2fs_io.c
+++ b/tools/f2fs_io/f2fs_io.c
@@ -413,9 +413,13 @@ static void do_pinfile(int argc, char **argv, const struct cmd_desc *cmd)
 
 #define fallocate_desc "fallocate"
 #define fallocate_help						\
-"f2fs_io fallocate [keep_size] [offset] [length] [file]\n\n"	\
+"f2fs_io fallocate [-c] [-i] [-p] [-z] [keep_size] [offset] [length] [file]\n\n"	\
 "fallocate given the file\n"					\
 " [keep_size] : 1 or 0\n"					\
+" -c : collapse range\n"					\
+" -i : insert range\n"						\
+" -p : punch hole\n"						\
+" -z : zero range\n"						\
 
 static void do_fallocate(int argc, char **argv, const struct cmd_desc *cmd)
 {
@@ -423,20 +427,43 @@ static void do_fallocate(int argc, char **argv, const struct cmd_desc *cmd)
 	off_t offset, length;
 	struct stat sb;
 	int mode = 0;
+	int c;
 
-	if (argc != 5) {
+	while ((c = getopt(argc, argv, "cipz")) != -1) {
+		switch (c) {
+		case 'c':
+			mode |= FALLOC_FL_COLLAPSE_RANGE;
+			break;
+		case 'i':
+			mode |= FALLOC_FL_INSERT_RANGE;
+			break;
+		case 'p':
+			mode |= FALLOC_FL_PUNCH_HOLE;
+			break;
+		case 'z':
+			mode |= FALLOC_FL_ZERO_RANGE;
+			break;
+		default:
+			fputs(cmd->cmd_help, stderr);
+			exit(2);
+		}
+	}
+	argc -= optind;
+	argv += optind;
+
+	if (argc != 4) {
 		fputs("Excess arguments\n\n", stderr);
 		fputs(cmd->cmd_help, stderr);
 		exit(1);
 	}
 
-	if (!strcmp(argv[1], "1"))
+	if (!strcmp(argv[0], "1"))
 		mode |= FALLOC_FL_KEEP_SIZE;
 
-	offset = atoi(argv[2]);
-	length = atoll(argv[3]);
+	offset = atoi(argv[1]);
+	length = atoll(argv[2]);
 
-	fd = xopen(argv[4], O_RDWR, 0);
+	fd = xopen(argv[3], O_RDWR, 0);
 
 	if (fallocate(fd, mode, offset, length) != 0)
 		die_errno("fallocate failed");
-- 
2.39.0



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
