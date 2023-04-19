Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 39EF56E7FAA
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 19 Apr 2023 18:31:59 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1ppAio-0002ks-N9;
	Wed, 19 Apr 2023 16:31:53 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <frank.li@vivo.com>) id 1ppAim-0002kk-2m
 for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 19 Apr 2023 16:31:52 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=MIME-Version:Content-Type:Content-Transfer-Encoding
 :Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=hsDVv1QyUDWIKAkxYo0tiCKgpgQh5t22baLlA02c5Ek=; b=LMfHfd+2Rg/EHZtmQW+N/qNfW4
 Y4kLfV4tzGhQd310S4DeF4XikWR8V/EI7AAJNNbpUK/39W9D7admM1G2ZapRp2a0FztxmphkP26S3
 ropd41nEsGrBYdb6cBoqvUhcJ1ZBZ2MilJkDxjYutZ/fP46JmHDroW/jmXSHQrEQZufo=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:Date:
 Subject:Cc:To:From:Sender:Reply-To:Content-ID:Content-Description:Resent-Date
 :Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=hsDVv1QyUDWIKAkxYo0tiCKgpgQh5t22baLlA02c5Ek=; b=g
 zHQ0PlCU361biDbsneto3d5PXJ9iA+R6UJha8A7qZ+e9zNBPby/BxB7heq8w5skkqmHlrsBkvyjAt
 EmKoLSfFt3+RHrnc77zs8zUr1RnRbSqD6mJau6pduZERuImu2yPXj5EnHrtHMjBi/ba0qfU3xlfkg
 Jv+CzHPIfVIuvHE8=;
Received: from mail-tyzapc01on2105.outbound.protection.outlook.com
 ([40.107.117.105] helo=APC01-TYZ-obe.outbound.protection.outlook.com)
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1ppAik-0007FX-66 for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 19 Apr 2023 16:31:51 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=lYVEzbng1D5dYKc5pRIdMSfstMmD2TqYZm01Uo8Yn+ip09bZ/3k9tcU4XoHiIZbFdTxDnJisunAVjSdKRiss2mXpWsDsrQpQSFHio/fbBuBGFCjc/aGV/OiC5FYKfLNiUPlI5kMGAE98kLWLEawQJsBUXyMuVc+q3+ZQyGxPBbu3bgTxqxgWMqnwUNRKxTQ9rHcNqewh9mrgxLKJgkWvv8OTlwCX3gpwILULTvF6wBwKLEgXlIhYsLyAdkuwUbfYfBIAby+emnTX/eyH4RHIKvjNoWm7zDi7JasW4LsmuS6rQU/HSo0ZiX+5NGuMB93Q/7uH+EdBwYFgexLHZTJmHA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hsDVv1QyUDWIKAkxYo0tiCKgpgQh5t22baLlA02c5Ek=;
 b=jYed7I36vADq/OkWdLvD5nBTCHpWg1PqkCUL8i9UAjMhgEk0SXsywwT9/vpX0rvgxUEsJLhoXsaoTtVItzhCG16RAPisxBROP2YS+rdVRvumpq5lmPr+NrYnRPLtjLmQYF1MWEb+7asu6rVCHc3gjn4CXWu5PxIjrk8f4WEO+LcCmuVzfALBPgvrwbGnDLB9HOwzJSWJjoWl/+x/3cv/cdA+Si4UReJGEwZW70DQy8rS1cMiIfsQzXsT8BqzmWBFsisKUHwstC2jQVdq0oELH0M9vrpiEHfgyCuJFpmlTNJCS71F2q7uHvHQydh6qludIfxg2wzF+hEOs2q0HzRXIQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vivo.com; dmarc=pass action=none header.from=vivo.com;
 dkim=pass header.d=vivo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vivo.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hsDVv1QyUDWIKAkxYo0tiCKgpgQh5t22baLlA02c5Ek=;
 b=qrik65swx+p2LB76QOjkQAkak5mktzGqIQDXPZ7/DAcJBiaL/cIZvjIv7EOe4RdcJi4+QOUF1JS/dbiwO5jsUelBj58Q73fLepv3/NyIlaOxjfk32thP5hJeFfsH37p9vF7UvNXICOOHvfiQ7l1OMefueDizr1ddIZ4QpouJhXNJCZgeOLjbhoQ2qZiRhzAf9p194tJHnmzZ3cJ+dWKwOb1okYWRvmA3FPsgaloJ7WPNS6PRiUVUPp2hqzeLWQnJfdgt87ju2LVDP56OQedzdCxbqrKPtc+YwseME1bP6fhQiQolK5ZyhZaXmIIACvHe9HY+37RVwa+MIoRuyXdAYA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=vivo.com;
Received: from SEZPR06MB5269.apcprd06.prod.outlook.com (2603:1096:101:78::6)
 by TY0PR06MB5188.apcprd06.prod.outlook.com (2603:1096:400:21c::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6319.20; Wed, 19 Apr
 2023 16:31:41 +0000
Received: from SEZPR06MB5269.apcprd06.prod.outlook.com
 ([fe80::76d6:4828:7e80:2965]) by SEZPR06MB5269.apcprd06.prod.outlook.com
 ([fe80::76d6:4828:7e80:2965%6]) with mapi id 15.20.6298.045; Wed, 19 Apr 2023
 16:31:41 +0000
To: jaegeuk@kernel.org,
	chao@kernel.org
Date: Thu, 20 Apr 2023 00:31:31 +0800
Message-Id: <20230419163131.7682-1-frank.li@vivo.com>
X-Mailer: git-send-email 2.39.0
X-ClientProxiedBy: SI1PR02CA0013.apcprd02.prod.outlook.com
 (2603:1096:4:1f7::7) To SEZPR06MB5269.apcprd06.prod.outlook.com
 (2603:1096:101:78::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SEZPR06MB5269:EE_|TY0PR06MB5188:EE_
X-MS-Office365-Filtering-Correlation-Id: 3054f174-e770-4df2-d5c3-08db40f38e07
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: nwJhV38ilMsZrbujMQeWvqvb5ZK1cePimToR7hQsRMI9XgomvloMrzUd2WoTgzSodgwJsFm/TY7opnH7eLpKcmtuE8mATNiUMVEnOmkjwCjEp+eyYFjBF3LAPf32/FXq4/V7oXok+usnuGL7vqRsvxf3Hn4QhJLC3osujHsDqIxh6fZKIjSs3qRunReqtmu/icuobY6s92aMPaXTO4rNS506ZiYBRieMDPHgBgTx0eliLOmh+imGPV3AYMGauMhKAhsr4ZD4O3RJMbpYS2XDjOwmHA2gXjcWUa4ppF6StWE+PqyrWdhzL7zcRCSOERXU2TtJj3FiFh2FSEVm1dWGpeQtxcyVcD2ntk8+eBEPrhYeMeNcwR8Xtp/G7mjK0L/Y3f+HXgUK9DQVopOkMU55arml0kMuL6bGam7S65FTeZNGIktIw5YQjmW8s/gpjEn52S80/HH5gL/w0beAai1sOPPBJ4FjyJkNnVLKxB/m/y9TTGOFDM2dMMM3kCNsMU8sPmPuDgtDq6tlgb/vmQioVkM9uzL1CevySppkhlwmfVYFQWy0NGd/3lbYg4KJaZ0Md5Tt54AaKNr5CW1mhuPUfmzRGZ+cupvWC6A01Zltu2aP1eAFLQqVLlOmOTMcMTab
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SEZPR06MB5269.apcprd06.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(4636009)(396003)(376002)(39860400002)(366004)(346002)(136003)(451199021)(6666004)(6486002)(478600001)(86362001)(36756003)(2616005)(83380400001)(107886003)(6512007)(186003)(6506007)(38350700002)(26005)(38100700002)(52116002)(1076003)(316002)(66946007)(66476007)(66556008)(2906002)(8676002)(5660300002)(8936002)(41300700001)(4326008);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?Wa+NrcAVUSZBp4HX82p+It/esj8CPspfdadc+s8DDBdsLvEX3B1R6PyRhC9Q?=
 =?us-ascii?Q?VhogllHX2kfjlYUV70P0VA+ILKoCfbabD0YTwcsGZuxy5lcJnOYYJOS5KO33?=
 =?us-ascii?Q?8tqWQmEcUpzxaRYUm2AR/OjLp95H9Lln30Y5ttJ0UTST/RJl+0V8YK3JtdR9?=
 =?us-ascii?Q?5AGYAnC74UuuhsWRe/SwxA9foZubCxsz5LrE7BxEhoSouOZLt2OY1tMBIM8Q?=
 =?us-ascii?Q?MSfM+t62DZunGZP07EFlkNBFPuuYK4feOKlM5p9L1lZoL2wbLdopRqlaHmkN?=
 =?us-ascii?Q?Ll4Nx9EByIG4oS1zXpduhB4rsgxcAY82swEsC8uuGSMOWzGtJ3GhNy+Q+64w?=
 =?us-ascii?Q?e+nVhD5f4IcywAbBMucF8DtjyBy2XPMFlxLcYDA3aFhkNZMU6Jx561bz6l7H?=
 =?us-ascii?Q?f0mRATQxFngdx0J40REHXTlBD8jD4Mrzw+Hmpjz78o5JL7Ty/7M3VDCK++rN?=
 =?us-ascii?Q?S/XT3JAsHXk6fer6CbeGXxQkgfnL83qv3YXQhyDWhNOTv/g3OMZTktRGUoaC?=
 =?us-ascii?Q?jSygFNTJQxy+es59SVtyhpqFVA7Vn7x9sa6hKNu9hwpVSxnr6mD1BqKyu6AD?=
 =?us-ascii?Q?jEKf0F+vWZViT+hPXgIfebWCrrIY0BekmvXZtB5db7mYJr9fbd4N8a89euQk?=
 =?us-ascii?Q?ODKkQ/KopNaJQ55Ja3+zEl9TIpJCG4g9bJsJJUvVGUJ4zLG6O/gszEq2KOwE?=
 =?us-ascii?Q?iSd4xYYRHdt2pNY9WIJs51SW3dxTsq1t4fcPCLXVGAYap46KWVVvtmJ00exZ?=
 =?us-ascii?Q?TDv6cSZkwUKtvhNj7VhS8J7LsocHlyne2bRw0dsJb16dD8f5SYAOvj7u3lSE?=
 =?us-ascii?Q?R0IjVDX2NOeWwvvFNH8dIgA4vM5hpgP80RulEeS6clpLsDvibGvnWmHmfmgQ?=
 =?us-ascii?Q?IBvim+TKpMCfQrtNNtT7l7iktqvrSPbAP1Z2gl8hDnpDqRACekXpyduXthls?=
 =?us-ascii?Q?T2jISbBCKABYkEJSk5WIpVDyFZNNREhCGIGdgqJjTmUDulbpU243LkdZevke?=
 =?us-ascii?Q?Zwo8quEmptbDEB9ledZsJ4OOiU9G2KAwSWXad055w/cWZ5QeC+h4u6DrxWKB?=
 =?us-ascii?Q?1NdFdb1mKHa2fJqIaBRaSPYkaYwPD9eoFvC7L/mrdx356uPae71IDcrAD7dJ?=
 =?us-ascii?Q?MhSsDwPqX1dejAmYVj50jGzNwkXg2WqVwlMDuesfQvrwxGZgolumL1N4C0op?=
 =?us-ascii?Q?5MwOk4zWfB9sIq5TJRAEQFP+3YjYd/UuDiuwx9oBHaw/CocH2a3q24xaZheC?=
 =?us-ascii?Q?qox/xihXLZlKCcj+ziwlsMmJM9+gRHmPmTwlGYrFoBiR9IfK4DhSjgvUmzqp?=
 =?us-ascii?Q?9AmHJO09QsABYcxjv0mJxuHqeMyxi0oXrl5xwDL1D7dwiuSutwFGsWj3w1hK?=
 =?us-ascii?Q?j132nLtlESJz7nd7uJLK4SbloPyyZXZK45fFpzVPcZcYsm0u7wUk3NQhl2g1?=
 =?us-ascii?Q?YOPHQwdaGbZuajHBB3w06PfM+N6Vf3ySFKhKrSqm4PZZLAjJLcOsdYby4LqU?=
 =?us-ascii?Q?xrcjp9x67x0w4KETSTqBXbA1i3wJOmSC5pxGsjhXfDhzE70IjX078KuLSzbF?=
 =?us-ascii?Q?F/ZoboTqSTBmlazyB/K3YU8V/rvgaLd8vD104ol/?=
X-OriginatorOrg: vivo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3054f174-e770-4df2-d5c3-08db40f38e07
X-MS-Exchange-CrossTenant-AuthSource: SEZPR06MB5269.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Apr 2023 16:31:40.8625 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 923e42dc-48d5-4cbe-b582-1a797a6412ed
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: gF6PCBoSaIAO/E3jv4IIJi1/6Z90+RI3hdYybNLNyOl9a65+KlCQ5fmxrkmaOlmRqh5j/Yfq7AIgQ1geafaoxA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY0PR06MB5188
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: This patch introduces a tracepoint to monitor discard thread
 behaviors. Signed-off-by: Yangtao Li <frank.li@vivo.com> --- fs/f2fs/segment.c
 | 3 +++ include/trace/events/f2fs.h | 28 ++++++++++++++++++++++++++++ 2 files
 changed, 31 insertions(+) 
 Content analysis details:   (-0.2 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
 no trust [40.107.117.105 listed in list.dnswl.org]
 -0.0 SPF_HELO_PASS          SPF: HELO matches SPF record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [40.107.117.105 listed in wl.mailspike.net]
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
X-Headers-End: 1ppAik-0007FX-66
Subject: [f2fs-dev] [PATCH] f2fs: add a tracepoint for discard thread
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

This patch introduces a tracepoint to monitor discard thread behaviors.

Signed-off-by: Yangtao Li <frank.li@vivo.com>
---
 fs/f2fs/segment.c           |  3 +++
 include/trace/events/f2fs.h | 28 ++++++++++++++++++++++++++++
 2 files changed, 31 insertions(+)

diff --git a/fs/f2fs/segment.c b/fs/f2fs/segment.c
index 641bd8cc54da..e27ad310186c 100644
--- a/fs/f2fs/segment.c
+++ b/fs/f2fs/segment.c
@@ -1839,6 +1839,9 @@ static int issue_discard_thread(void *data)
 		if (!atomic_read(&dcc->discard_cmd_cnt))
 			wait_ms = dpolicy.max_interval;
 
+		trace_f2fs_discard_thread(sbi->sb, wait_ms, dcc->undiscard_blks,
+				atomic_read(&dcc->discard_cmd_cnt));
+
 		sb_end_intwrite(sbi->sb);
 
 	} while (!kthread_should_stop());
diff --git a/include/trace/events/f2fs.h b/include/trace/events/f2fs.h
index 99cbc5949e3c..e1939427deb2 100644
--- a/include/trace/events/f2fs.h
+++ b/include/trace/events/f2fs.h
@@ -1512,6 +1512,34 @@ DEFINE_EVENT(f2fs_discard, f2fs_remove_discard,
 	TP_ARGS(dev, blkstart, blklen)
 );
 
+TRACE_EVENT(f2fs_discard_thread,
+
+	TP_PROTO(struct super_block *sb, unsigned int wait_ms,
+			unsigned int undiscard_blks, unsigned int discard_cmd_cnt),
+
+	TP_ARGS(sb, wait_ms, undiscard_blks, discard_cmd_cnt),
+
+	TP_STRUCT__entry(
+		__field(dev_t,	dev)
+		__field(unsigned int, wait_ms)
+		__field(unsigned int, undiscard_blks)
+		__field(unsigned int, discard_cmd_cnt)
+	),
+
+	TP_fast_assign(
+		__entry->dev = sb->s_dev;
+		__entry->wait_ms = wait_ms;
+		__entry->undiscard_blks = undiscard_blks;
+		__entry->discard_cmd_cnt = discard_cmd_cnt;
+	),
+
+	TP_printk("dev = (%d,%d), wait_ms = %u, undiscard_blks = %u, discard_cmd_cnt = %u",
+		show_dev(__entry->dev),
+		__entry->wait_ms,
+		__entry->undiscard_blks,
+		__entry->discard_cmd_cnt)
+);
+
 TRACE_EVENT(f2fs_issue_reset_zone,
 
 	TP_PROTO(struct block_device *dev, block_t blkstart),
-- 
2.39.0



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
