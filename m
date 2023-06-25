Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A6B273D1F5
	for <lists+linux-f2fs-devel@lfdr.de>; Sun, 25 Jun 2023 18:07:24 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-3.v29.lw.sourceforge.com)
	by sfs-ml-3.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1qDSGe-0004rX-Cg;
	Sun, 25 Jun 2023 16:07:13 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-3.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <heyunlei@oppo.com>) id 1qDSGU-0004rQ-4o
 for linux-f2fs-devel@lists.sourceforge.net;
 Sun, 25 Jun 2023 16:07:03 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=MIME-Version:Content-Type:Content-Transfer-Encoding
 :References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=iNBihyaceJnXBqNKlZm3oWM9ToYbC2/QSty5I7E97ZI=; b=QofelY4rpyixj5Dv96oXKmk2oS
 aW4ZRmBrgrhTGsN8QfJ8X+uiGhmCvyfF+1A8+PglyShS8LK5LLkO7+jUSJKBGOREtGv3V+vRCKjo6
 nf0XhUVhMmtBz1LOluLxxVA0GndiD8i3G0nEXyqlQX69tsH9PQDakDhYOACLCHdDiCU4=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=MIME-Version:Content-Type:Content-Transfer-Encoding:References:
 In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=iNBihyaceJnXBqNKlZm3oWM9ToYbC2/QSty5I7E97ZI=; b=jcTCCyoY6zUlD1dcLky9GIy0tU
 hXUVeWLc4bRAU/vfxKgEqI2iW8yr+d5PNwf6grVA5hZ+DgR1YUZAmS0tij8JwelVMp0K/kTHvKTDk
 zsUFHfP2LX7L8xb45+mObluI69pDXpokuk/MQ/hsTZqu/Dx+nqqqUp8G891hTeZi2WAU=;
Received: from mail-sgaapc01on2077.outbound.protection.outlook.com
 ([40.107.215.77] helo=APC01-SG2-obe.outbound.protection.outlook.com)
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1qDSGS-0004T4-UL for linux-f2fs-devel@lists.sourceforge.net;
 Sun, 25 Jun 2023 16:07:01 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=nFKSXBa7NBcweyZgwls7l//EqSO/zk7jlStkrnSDelgrtHTkPFDnFQv19fbFHTOb8M9hq6M3XiWqzWtcjiITqarSUrtiaWoa4H25zTC8mRBzLy7F3HA36TNhzkhUy0hSGOqUFS517ABER32N9Rfau0rY8MSJNXEpGECXgLFCRdrrv06PWY9Iu1BAZ4goIpEB62CNY5L2cl7bjy/388LBuHp7Ne7r3VmUwQcjclzXbWkij9ugQliZvHxOTTX9bq3ICjZp9A+47BPFZj75B55ET0wBlqTInHsLHzuu5bREpL5G20WleuYi6xQrWoomu1RkzXKDq0sdNzsQo/nc1gfCKA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=iNBihyaceJnXBqNKlZm3oWM9ToYbC2/QSty5I7E97ZI=;
 b=KgVivBV88tLX9TeHHTnUI7qjOfPmMoNHEMcrGONAIJuMLAnjCgZf07L2xnAxnIbnrsBe7HSUCWFoJGFk2Ojb5u9I9MJkKBbZgO318JP+M8uaSdaca+25c0qVFRfvGCXOIMf38l6opQM/oD3s91dkshMKK0zIC78phFcjFw8FYImau4LdGv66dI1WdH+cEnY/ji/cZbky4K6ssinH4koDkuC/W0cMOXs0nk0FZJUYFUbGVp2EVhdF5bhHe+IxSuj9mlyIjult45rgVS+x2zaB1zSko6tA6hHT/XZGYFLJm4lyJtU8E1XUvpTS3YzvgL3l1fXGZ2d1NYXm/k3KcRpLuQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oppo.com; dmarc=pass action=none header.from=oppo.com;
 dkim=pass header.d=oppo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oppo.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=iNBihyaceJnXBqNKlZm3oWM9ToYbC2/QSty5I7E97ZI=;
 b=OS3VLcncvy98/OazcyHH+vV1Rma3WPxPISbQ3D9hwBqIoJL1cDKSn4e4hTOeTcn0JkXH9kEr6K8Ku2ESi/w7MJTONECMQDxgEfD6M01pTurRDtI42RteSEKQ3JHBAUjagiBhlkavVLJkB7mdqUtlTI4Y0H01rLbm3AZFBPUT7LA=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oppo.com;
Received: from PSBPR02MB4471.apcprd02.prod.outlook.com (2603:1096:301:2::12)
 by TYZPR02MB6524.apcprd02.prod.outlook.com (2603:1096:400:363::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6521.21; Sun, 25 Jun
 2023 16:06:45 +0000
Received: from PSBPR02MB4471.apcprd02.prod.outlook.com
 ([fe80::8d7f:e42e:6212:882f]) by PSBPR02MB4471.apcprd02.prod.outlook.com
 ([fe80::8d7f:e42e:6212:882f%4]) with mapi id 15.20.6521.023; Sun, 25 Jun 2023
 16:06:45 +0000
To: jaegeuk@kernel.org,
	chao@kernel.org
Date: Mon, 26 Jun 2023 00:06:27 +0800
Message-Id: <20230625160627.4112651-2-heyunlei@oppo.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230625160627.4112651-1-heyunlei@oppo.com>
References: <20230625160627.4112651-1-heyunlei@oppo.com>
X-ClientProxiedBy: SGAP274CA0006.SGPP274.PROD.OUTLOOK.COM (2603:1096:4:b6::18)
 To PSBPR02MB4471.apcprd02.prod.outlook.com
 (2603:1096:301:2::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PSBPR02MB4471:EE_|TYZPR02MB6524:EE_
X-MS-Office365-Filtering-Correlation-Id: e886c4b3-6b5e-45aa-3ecc-08db75962bd5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: jZu26Spd3t3mQaNs9JPNJoaW8o0clAuEgbxVQ4qoLz9E//0CkipzgWLK56bd3MAjxy1b23EG/1k49weBsIXeFXT0iKEOibEx9qsRDvWXLNxS7qrUf4Qd4cbIWvKtid9+gIcJc6QrCZzSotcYTciCEvNQXk8nqzgKmLfq+N09TDCBHLAoi0UqYFzpZtwQeHtnG/EhZZvJG3a0V5Nz1veD/q3SJi+fSZd5fHGNzcMZHQkg5CcOa3z1CTcVc8Y7yVJUfV97G+SK1z4fx1gst9fhPOFmDSszr3McphQ4Wf1zADYNHOxmxfwt8Tybkqz1BgK3xj+iWVQTlNvoaMAQzwcgldjewlZn2mJqHRsaIhOVN3d2J5Ehwq48Zt+QUGaZo2Xkt39mc9PK2TzP2zb8okpNh2lY6I4kMsU8fb3A6H3soKkNtfLeRiLPqpizzvRk6Bm4HA5Ox21D8TAwXNgRs8ODMOaD+CCWsu/wN7Tsr2YAxnFBAt82JMpU4OWfSHv7epBZsmIs0xEuyn92HC+iOuMyPIdvxUVIt/wnb7UqU+fhIarZdZZSEdARe4WxQPUmYrfQB66T4a2DvUZ2BJRYT3yksVwkcw9KG8cwUA7lwIBSEYdH74gJT7GJvNeOOyEOVuAJ
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PSBPR02MB4471.apcprd02.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(4636009)(39860400002)(376002)(396003)(136003)(346002)(366004)(451199021)(2906002)(4326008)(41300700001)(8936002)(5660300002)(8676002)(316002)(66476007)(66946007)(66556008)(478600001)(6666004)(52116002)(6486002)(107886003)(186003)(6506007)(1076003)(83380400001)(26005)(2616005)(6512007)(36756003)(38100700002)(86362001)(38350700002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?scQZtEya1H9Zt+HGww62l7U7CjTL5cyw40s5Saj8YmYurBXCpT0aNtJpvlTh?=
 =?us-ascii?Q?r4m2gZm59OCu8UdHbtR4AG/YOrbfDohzXMmhM/4HePgBZF6AJD4zsnW/DKr7?=
 =?us-ascii?Q?TLSNH4ajw2boCwv1klaisU9dZNqo1GP+7n9Kj5u2X4fdjNzLKDig1xK4q+Js?=
 =?us-ascii?Q?sH3PVIbInbpvZMsShMY4QLLX4bYVm34lw3Zsu0hE0rJDChj/duh9YOsfvf1+?=
 =?us-ascii?Q?T0DMTQn3RbQ0F+lIK5NY1qmDSKFmBCLpnRgC+CjruvjBLUIamLWCpt5JTEcd?=
 =?us-ascii?Q?8De1G7To57b8n27+wSsDzKLpOZ+FdJRPpttx3yK6wTWiq1e7RH/L3lFBvQTu?=
 =?us-ascii?Q?OeCMlqocofUuYxBjsea9Q40leZLab7KE6LxhdBXPFR+anslTTBY67YbP/Faz?=
 =?us-ascii?Q?VGTUZvMmuklgnRsDm3pReESXKuIwDp933TZGWQ1rYkKJYQ+9cKeeEmz6+PaU?=
 =?us-ascii?Q?cipmTdcuSG4gqb9ZnGE9gl8bjt42EMCCPft5PmBB1MkDbB951CKbSWcA0lXJ?=
 =?us-ascii?Q?FwCzd7Innl1Q+V7B1KsAjk/tTYXlqvNeR5RBUfhpco3ZB9qXw50lIuEswSUM?=
 =?us-ascii?Q?TZocVtt6tCW5OuZ6Ka4c9XaCPAKdX1leNQL5oUwgERtT7lLFkz5U3zpneURi?=
 =?us-ascii?Q?kLqu4BVRFg2BdhAWAAhEObRdiNYU+Q42T0yzvztUQThinMRdyJExFQky9pHq?=
 =?us-ascii?Q?kPxsS5lW/zh8AUrYQeOQIj+cSaNC0IEM/3nTnHslA6s4PGR5tTs1MvTYEGB5?=
 =?us-ascii?Q?QTv2XNI4A+AWEC04CE3E8npG2UHKLG8YmSBSuStNj+P5GaUjNUdQthwB9Ezs?=
 =?us-ascii?Q?uudHvh0kCJt17mkTQUaAFIxiOe7FWU1ilNcZtMqC1qZ4BOxsmlDySy1VVbh6?=
 =?us-ascii?Q?WcRkSaKLiMPqZkkXVBs2DxdpSd+GCOZj4ENHwSku0aMANpFFqM6NYGxRRyMH?=
 =?us-ascii?Q?WMCvUe5hUH/vN0jqGgOJzC9T73ovCC9HnOdo/IkLWn3g+HyUum9I3ka9QZmO?=
 =?us-ascii?Q?OcXocYXjwxBxeM425K3IccKuHSiSiVIUvHHJYJQdi4uo60TpOcq2A72a8dd1?=
 =?us-ascii?Q?1ise39wTA30R5o8GpxPtP36T5VghHnisyZw+c4uwnfElLUVfk5xFaAu4qDzE?=
 =?us-ascii?Q?6KcJk6Gx5cEpomYX9QTCKXx2xHxdTkzO0p6e7hF9vpoFAMlSAI+kI3PQFFgT?=
 =?us-ascii?Q?NrSSkUkV+51aZGd7P6uXUS2XLKZMGjjrwubBhgdV4LbTSpLS6A6YHju66SOd?=
 =?us-ascii?Q?dRMPZuP49Yl+j3GiFsRX0jm3q220QBahRZ2FJ366T7h0n7VyTywiX6PyYd0m?=
 =?us-ascii?Q?lT4ShpWy20vEz6p/ZKY/jk8gHk96riWrO+a34aA8m/U3Fygf7oSRbe8Mbzo9?=
 =?us-ascii?Q?EyRpud51W8SUzkjcgX2O0O9XUJ5mAfHUS12DNCoeQyS/drp/p6Z64oexcUtf?=
 =?us-ascii?Q?+F3eUJUexq3HIuhB/Df/AYwIp35I4YPzZdJB2vK+Xf8eEXX4u4457oj4oVoF?=
 =?us-ascii?Q?sNPvhLjqkg7Z7TlbD2UGjOnjdjg6NdpjCUBZ7ZA/m6RX/djFczjsdcpiJ0Tw?=
 =?us-ascii?Q?v9HhzEO8Y3bkiW0gmrtFMpEWAwohzzm2VyAMh2Jb?=
X-OriginatorOrg: oppo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e886c4b3-6b5e-45aa-3ecc-08db75962bd5
X-MS-Exchange-CrossTenant-AuthSource: PSBPR02MB4471.apcprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Jun 2023 16:06:45.0158 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f1905eb1-c353-41c5-9516-62b4a54b5ee6
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: YfUCXUDZuzWvCZs/bf/qVDyNyy+1NXf+fTq8NCMtUZDILwi2JKSTNuiObxIco2cdkd9X2lWVW8ZKsxRPRtdsFg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYZPR02MB6524
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  If move file range success, it should remove old data from
 src and dst page cache. Signed-off-by: Yunlei He <heyunlei@oppo.com> ---
 v2: -truncate pages with filemap invalidate lock -should drop extent cache
 fs/f2fs/file.c | 16 ++++++++++++++++ 1 file changed, 16 insertions(+) 
 Content analysis details:   (-0.2 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [40.107.215.77 listed in wl.mailspike.net]
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
 no trust [40.107.215.77 listed in list.dnswl.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.0 SPF_HELO_PASS          SPF: HELO matches SPF record
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
X-Headers-End: 1qDSGS-0004T4-UL
Subject: [f2fs-dev] [PATCH 2/2 v2] f2fs: truncate pages if move file range
 success
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
From: Yunlei He via Linux-f2fs-devel <linux-f2fs-devel@lists.sourceforge.net>
Reply-To: Yunlei He <heyunlei@oppo.com>
Cc: linux-kernel@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

If move file range success, it should remove old data from
src and dst page cache.

Signed-off-by: Yunlei He <heyunlei@oppo.com>
---
v2:
-truncate pages with filemap invalidate lock
-should drop extent cache
 fs/f2fs/file.c | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)

diff --git a/fs/f2fs/file.c b/fs/f2fs/file.c
index 5af7e57b6140..7b3b333f96f5 100644
--- a/fs/f2fs/file.c
+++ b/fs/f2fs/file.c
@@ -2869,7 +2869,13 @@ static int f2fs_move_file_range(struct file *file_in, loff_t pos_in,
 			goto out_src;
 	}
 
+	filemap_invalidate_lock_two(src->i_mapping, dst->i_mapping);
+	truncate_pagecache_range(src, pos_in, pos_in + len - 1);
+	truncate_pagecache_range(dst, pos_out, pos_out + len - 1);
+
 	f2fs_lock_op(sbi);
+	f2fs_drop_extent_tree(src);
+	f2fs_drop_extent_tree(dst);
 	ret = __exchange_data_block(src, dst, pos_in >> F2FS_BLKSIZE_BITS,
 				pos_out >> F2FS_BLKSIZE_BITS,
 				len >> F2FS_BLKSIZE_BITS, false);
@@ -2881,14 +2887,24 @@ static int f2fs_move_file_range(struct file *file_in, loff_t pos_in,
 			f2fs_i_size_write(dst, dst_osize);
 	}
 	f2fs_unlock_op(sbi);
+	filemap_invalidate_unlock_two(src->i_mapping, dst->i_mapping);
 
 	if (src != dst)
 		f2fs_up_write(&F2FS_I(dst)->i_gc_rwsem[WRITE]);
 out_src:
 	f2fs_up_write(&F2FS_I(src)->i_gc_rwsem[WRITE]);
+
 	if (ret)
 		goto out_unlock;
 
+	/* write out all moved pages, if possible */
+	filemap_invalidate_lock_two(src->i_mapping, dst->i_mapping);
+	filemap_write_and_wait_range(dst->i_mapping,
+					pos_out, pos_out + len);
+	truncate_pagecache_range(dst, pos_out, pos_out + len - 1);
+	truncate_pagecache_range(src, pos_in, pos_in + len - 1);
+	filemap_invalidate_unlock_two(src->i_mapping, dst->i_mapping);
+
 	src->i_mtime = src->i_ctime = current_time(src);
 	f2fs_mark_inode_dirty_sync(src, false);
 	if (src != dst) {
-- 
2.40.1



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
