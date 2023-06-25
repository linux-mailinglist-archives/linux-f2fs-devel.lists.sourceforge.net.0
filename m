Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F54573D1F4
	for <lists+linux-f2fs-devel@lfdr.de>; Sun, 25 Jun 2023 18:07:24 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1qDSGn-0004oo-Dj;
	Sun, 25 Jun 2023 16:07:21 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <heyunlei@oppo.com>) id 1qDSGT-0004o0-9Q
 for linux-f2fs-devel@lists.sourceforge.net;
 Sun, 25 Jun 2023 16:07:02 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=MIME-Version:Content-Type:Content-Transfer-Encoding
 :Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=wpLEVI6/bI32qr0raUjTydbTK5PnWSM46q9Onm8g7hM=; b=KELCaRmnjBbplHl+UXH+KB648W
 BKMWx5yFL6zY5x3bGIAKhtthucXlR90way7S9PP70tbv82+FJzr1l3+hKuCgjfcvk1eESi/4o8ScR
 i5BWoTh1zdCFIp7tDzj3oY8JluGFqdDu3ofR+D/Pnb4R59ju7TooCPaaOm5fhmaeuXd4=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:Date:
 Subject:Cc:To:From:Sender:Reply-To:Content-ID:Content-Description:Resent-Date
 :Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=wpLEVI6/bI32qr0raUjTydbTK5PnWSM46q9Onm8g7hM=; b=f
 T58NSmGKVhHG5lbtPkKTia+jXjhrnbSD9oX3x2bssPUVTVDq4BZRnKHRgwn0YT3qzar9h23Isc2dR
 KEopUHbC2HaDyuCajteftOxWzWtwT5XPLTnMjFPfoGEMg8FrYw+34lEdYurbfN6ByGnJKWqeW8Azn
 DOMKp9wE6L4KH2Iw=;
Received: from mail-sgaapc01on2077.outbound.protection.outlook.com
 ([40.107.215.77] helo=APC01-SG2-obe.outbound.protection.outlook.com)
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1qDSGL-0004T4-MT for linux-f2fs-devel@lists.sourceforge.net;
 Sun, 25 Jun 2023 16:06:56 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=QZKa+1LIkkct3zhtELEucrFyJ1ybBNBffugidS6x4MaXFphyyUGUlHU4N0wVgNug0cI0qsbdoTjG5S8KW82TX9qhCVQ/tJYTd5xix7jhSAEqGly+XV2QiDTdv1Jvsf6WNflDc+oV6GLxZGlrqgspQFMbalWmzGD8cXTZLHtNRutPJMuUpfYaBKKcYEQ1QycfJ+BH25WktUjhCMenLOeNmfOsavHwPlRCFHS2cmGqBt2gChkkw3wW0NEsz1t23ergXsoIZro04Tp3q0iVrEzDn+/i84TrlOX9VqJPJuuRXk/6KYtrEjitJPHyotAIwktqDs5O4KztBcAY9KLa39bGTw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wpLEVI6/bI32qr0raUjTydbTK5PnWSM46q9Onm8g7hM=;
 b=cAAAKR6tA0Y4PDhSvYm92OnpwpKhh0Eb22KY+rz3Oi075raowshNmOmMkRlYdH1a1dqT+413fcGFKlHn6IJfCoiIzk5r6loUeD64FqE2isE6YTpob6Ix0rl1NPa6Qm0mArjdb0HS3p8pt8eGI3EESzpT43SHmbj/RTNw9nsW8mXYl7jWf7YxbFynSRjr3bO8Lj5JUlrDusPJ4n5uYMU2wCukVf+IRN9O3Hk2zaBwriZm+eZp7lCtQnMt6xBeM+RFllZo0+dYxuWJw6CzODukMNrx6o3RDZAQvE3CHN2AymsF0NnZeAGK/mQahhsnIGuTL7o17qrTgVlZ8RK6SYkCxA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oppo.com; dmarc=pass action=none header.from=oppo.com;
 dkim=pass header.d=oppo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oppo.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wpLEVI6/bI32qr0raUjTydbTK5PnWSM46q9Onm8g7hM=;
 b=viFf/3+AjjhOZfSNtV0Nfz3S3kiLhVdwHBbQNWX6zAn6Pru2Xjvyl9RQERwEJqgcqVtF7JOAYQC4OWlGCF8bBqzW+FN34dif8Q/VXeTUrdiGXeyO+Z/IAO0SOY/5KXeBxW6HiVhrhpi72EMN2SM+0Fu7EAXariDAsotkslSEHfQ=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oppo.com;
Received: from PSBPR02MB4471.apcprd02.prod.outlook.com (2603:1096:301:2::12)
 by TYZPR02MB6524.apcprd02.prod.outlook.com (2603:1096:400:363::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6521.21; Sun, 25 Jun
 2023 16:06:43 +0000
Received: from PSBPR02MB4471.apcprd02.prod.outlook.com
 ([fe80::8d7f:e42e:6212:882f]) by PSBPR02MB4471.apcprd02.prod.outlook.com
 ([fe80::8d7f:e42e:6212:882f%4]) with mapi id 15.20.6521.023; Sun, 25 Jun 2023
 16:06:43 +0000
To: jaegeuk@kernel.org,
	chao@kernel.org
Date: Mon, 26 Jun 2023 00:06:26 +0800
Message-Id: <20230625160627.4112651-1-heyunlei@oppo.com>
X-Mailer: git-send-email 2.40.1
X-ClientProxiedBy: SGAP274CA0006.SGPP274.PROD.OUTLOOK.COM (2603:1096:4:b6::18)
 To PSBPR02MB4471.apcprd02.prod.outlook.com
 (2603:1096:301:2::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PSBPR02MB4471:EE_|TYZPR02MB6524:EE_
X-MS-Office365-Filtering-Correlation-Id: 6d50e506-7da1-4927-3f49-08db75962ae9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: jTcsE+Ehe3EcNCAQ5gwk1MEo2Ewzw4wox6ZByascAsrpF2yfV7U+GNm/1ts0kWNfXfDFp424Wg2vLI8uQmjY2dCUmHj79tQY1qe6rOUprg2QCQY7j2xP/xkFZPIHjkSsOHhXf4Budbb45ur3z6qZnIUHGhnmfw7jbNmA+1IQ0bOQr7NiQkeLFQPc4K3ITnvW6zIZPhVFqXBmfMqnpNdj4qHNZ7Hi9aCwMQvr9vetCElLFvZFmPCUFC7DCUM/u9B4hBNkVFJMu3cgb6s+CaM1p13rmKKWlz7AyNSOxN77xNBFT9Zeybe6bC4hJLo1wThT13ZdXY7t2jXG7jWAoe5DoqRng9jAHncJWL1jze0dCCAQt/OGbRIvJL7H0vfuvJ76Kj2RTGXNTw0nzOmxUugtSr8wPBFY8/IjuNdFDcY476taYFuo2igZI2fLfXfa3AQS7c1/FSrXOntkhv/zbHo8txxG5/hQpzKTFI3ifgf+EjsTpAmaT+A867nX8wamSTwv9gZ28WyzBdiCEU8juYWoysl9wt/ld6qtzk06lKeMkMEi2jPsZqE5sj2oFUoqBRMXCcChZGuQAFqDmb0XHToVNVuO9Mh9BbwI7PihETOEXCxmF37iLcDQl1UZUeK9BKti
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PSBPR02MB4471.apcprd02.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(4636009)(39860400002)(376002)(396003)(136003)(346002)(366004)(451199021)(4744005)(2906002)(4326008)(15650500001)(41300700001)(8936002)(5660300002)(8676002)(316002)(66476007)(66946007)(66556008)(478600001)(6666004)(52116002)(6486002)(107886003)(186003)(6506007)(1076003)(83380400001)(26005)(2616005)(6512007)(36756003)(38100700002)(86362001)(38350700002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?X/S3B9AhWLWGc7XXKOWJIRa2cyIXSGF5vKNePbN8a8w3tahFgxSqrJDcdHf7?=
 =?us-ascii?Q?/IZa31d3eTJGr+/ZMqMZ2fRvpMVYK7VD3qHFf6b1YfYymu6r86zMWsqAR8o9?=
 =?us-ascii?Q?5x/pxjWv/98Ifk+1YhSw7dXWKXbEZRlTRjRgeuSsZKMqpSmurGu9otRzLVZU?=
 =?us-ascii?Q?bxfVh6F/mJhAZuBle8tL2JOeXP8E9n+d32Qk6c+99RRRnPFrg/qeHbyYw4ze?=
 =?us-ascii?Q?lS/Od9EgzPR2EmSDEk9wDpaALJ14vDEEjy8i3TnwWhSccJJoTMR3/z3iUd9N?=
 =?us-ascii?Q?uH/0rUBlfXQsggjG3fV9POSzm5a9dK2RVnKUmSxVCHOpxPd7dji/toU+QiIq?=
 =?us-ascii?Q?z9lwoKT8Ss7mKzlOC4CpdNs9DuXC/goO+KmLNNPWr0CqTA/zrw3IFpW8cHSE?=
 =?us-ascii?Q?9+AL2fklCaaK/D73AVWyjZVT7z9T2PXe6QPF6ka2DRBcberKe4JRWjEzMjci?=
 =?us-ascii?Q?474ZEE+BD/ez8lumF19AWywd25V40dVBdWao74lWc40hJpZm6JX4ol0Rah9Z?=
 =?us-ascii?Q?V+w7DAqM/Q3D/dtiq/nlOOJsiec/fbx2mRhl6Go0mIRSArjQwYKS02ni0cKg?=
 =?us-ascii?Q?0uWDevdpBFFFKK4Vrg80Iw5cx2BTNhv46TDj4al7gAdGVH/cX9Kr09Gj69bp?=
 =?us-ascii?Q?w47Wqhb9XGRhQh0aTnfr+cR1EqWoGhORWsj3v0dZSVUVp7n5SAVf9sV8ySM6?=
 =?us-ascii?Q?RJukTQ1giUWVIK9oF1R2EGtC8xudIOf77h408YGDhcmkBepA8DvQZ/4mbehI?=
 =?us-ascii?Q?ufaVlnd1B64dMGrS+yxIJTEvp8dIGuG6g6yof1jsDIsTb3j6+bIr7wtF0Jv3?=
 =?us-ascii?Q?iJXYypcpiec9fBUKpNXN01WL9XF9kISeRu1SPqstg5BGRWhmEL6diTmPCquc?=
 =?us-ascii?Q?7q51DaqbPYlEFMc1yRq5bBQ7a9gU0LELELKCJHPFnUxvpVJ//uYiYtTMEECf?=
 =?us-ascii?Q?sQMUwOgjN9cY1+ocenL+lUJhrD6TLNKw5NRqRczUYpol3HK0BQK0eixWXoG2?=
 =?us-ascii?Q?6W0seVw4BL3bINOz6e0mfSeDdx7KCwQL9ds969FIl3Oc2n84k1mXncshDWDr?=
 =?us-ascii?Q?D3DXW/sQF0bw/7H6NusE2BZG+ixfF+lXzamEpOKhK6U/ZJYlygRBVzt+TiXL?=
 =?us-ascii?Q?9YJrCsYNAdhU54jqGMWs0QDQW1J3Rwt5vHsIk2SmkSP1EEyF44R12jgF073G?=
 =?us-ascii?Q?uAVJU3bX05sg4juyFDXRv3q5iRV+p7j8qJPJccLCGRI195JSJFQdHvbWvi6z?=
 =?us-ascii?Q?9w6pJGgqnl+YjLA0Srysu9u8M9wHGskGlZqeP0EkUWSl8k77dxa03jlLZRLL?=
 =?us-ascii?Q?qGrBAeL6XMm0tPiSxHGWzXAJ1rwOlYQ7JaaLcdz09nV6liK/1kcHiwegfzho?=
 =?us-ascii?Q?dzfIXSBbD/4bqOC8tUZ52X4EofAiDxOSUXmPeT5R2U9gQ2Fvlr19EuUbmcdR?=
 =?us-ascii?Q?abvdlE/KNNyo8sBQYeHL3s9HaBpS/AAITbwADegvoCEsGeOZ9yBIXo+Ph87V?=
 =?us-ascii?Q?cHbpeSly1CJrwGKu5wedYZ/45YgoXyTn1KLfsUSRXj8PJWDmZYaYjtrH4kdI?=
 =?us-ascii?Q?rI8pinYpkWFyolAnZtdTcrZf4rOlahRB+ocRvG09?=
X-OriginatorOrg: oppo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6d50e506-7da1-4927-3f49-08db75962ae9
X-MS-Exchange-CrossTenant-AuthSource: PSBPR02MB4471.apcprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Jun 2023 16:06:43.2791 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f1905eb1-c353-41c5-9516-62b4a54b5ee6
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: rSMWmgA4tQzlfoZLDhCdD6553yz/4wve27NXFzDbHNn8hxRef2It4QS7A+9zC+Er2lxbrrqqIN11V/CyQOIEJg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYZPR02MB6524
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: Mtime and ctime stay old value without update after move file
 range ioctl. This patch add time update. Signed-off-by: Yunlei He
 <heyunlei@oppo.com>
 --- v2: -update both src and dst inode fs/f2fs/file.c | 11 +++++++++++ 1
 file changed, 11 insertions(+) 
 Content analysis details:   (-0.2 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
 no trust [40.107.215.77 listed in list.dnswl.org]
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [40.107.215.77 listed in wl.mailspike.net]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.0 SPF_HELO_PASS          SPF: HELO matches SPF record
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
X-Headers-End: 1qDSGL-0004T4-MT
Subject: [f2fs-dev] [PATCH 1/2 v2] f2fs: update mtime and ctime in move file
 range method
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

Mtime and ctime stay old value without update after move
file range ioctl. This patch add time update.

Signed-off-by: Yunlei He <heyunlei@oppo.com>
---
v2:
-update both src and dst inode
 fs/f2fs/file.c | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/fs/f2fs/file.c b/fs/f2fs/file.c
index cb42d8464ad9..5af7e57b6140 100644
--- a/fs/f2fs/file.c
+++ b/fs/f2fs/file.c
@@ -2886,6 +2886,17 @@ static int f2fs_move_file_range(struct file *file_in, loff_t pos_in,
 		f2fs_up_write(&F2FS_I(dst)->i_gc_rwsem[WRITE]);
 out_src:
 	f2fs_up_write(&F2FS_I(src)->i_gc_rwsem[WRITE]);
+	if (ret)
+		goto out_unlock;
+
+	src->i_mtime = src->i_ctime = current_time(src);
+	f2fs_mark_inode_dirty_sync(src, false);
+	if (src != dst) {
+		dst->i_mtime = dst->i_ctime = current_time(dst);
+		f2fs_mark_inode_dirty_sync(dst, false);
+	}
+
+	f2fs_update_time(sbi, REQ_TIME);
 out_unlock:
 	if (src != dst)
 		inode_unlock(dst);
-- 
2.40.1



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
