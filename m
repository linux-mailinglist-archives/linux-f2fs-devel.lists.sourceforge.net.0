Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id C5AE37359AF
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 19 Jun 2023 16:35:26 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1qBFyQ-0001YV-Nn;
	Mon, 19 Jun 2023 14:35:18 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <heyunlei@oppo.com>) id 1qBFyF-0001YK-ME
 for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 19 Jun 2023 14:35:07 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=MIME-Version:Content-Type:Content-Transfer-Encoding
 :Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=kWez1aR3D4yyyHcSGxyBeKUSih9rxiGPCSwB34G0c6k=; b=G9hpnsFHcpT/Jpu93AjM6t2xEH
 k7Ab179NhH0FtUUifDKNQGjGfSJR4M0w43UldHzG5znJ462Ud9/JBV6ngpdBSyrKRSgxUKDDS8+jz
 9g0isgRYXt9vF6vyyeQPzlt28EZTYj5prYcZcJqMK0FjPPHT1BTN38lnwWdmpJAAz4G0=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:Date:
 Subject:Cc:To:From:Sender:Reply-To:Content-ID:Content-Description:Resent-Date
 :Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=kWez1aR3D4yyyHcSGxyBeKUSih9rxiGPCSwB34G0c6k=; b=K
 82TKNGyMaKT50KefOoLmck1vYfQQlYscWH+Vv2L6u/wM5pKaqoCzyfamgl5XVG9ng2vnABHcvHszZ
 FFLK/gaR4qWWDtnAPyPowcszhbh5EF5s3aIP/zjbYP+MCFpVIuE0Zre8djSIcB7yaLGYY7KpcrV7U
 z8dPcNbAOzGZYz2A=;
Received: from mail-tyzapc01on2044.outbound.protection.outlook.com
 ([40.107.117.44] helo=APC01-TYZ-obe.outbound.protection.outlook.com)
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1qBFy9-008jnI-MC for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 19 Jun 2023 14:35:07 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ENmSI/S33HGExbOCx0M8SqVYNPBypVK5TXiAmpsNeWcgf7qLGhJp83+iQGDJ7dJkLrUhYpf1BwD2XaGvFp/Eq6FlCZ2suDq94lj2dFspibPdAQm4hiw409hHhaElO8YDd0z78yie/z2Lbdg/j6CnRLL+VU5ntQovyuisQTIonfLKkibCY49/QJKcJu7enKAXto1oX/fVnDBQX+9FcdjsgmTucsQcdzyzD2KBZone0nOru/WBVSh9qwktRHWrcQE+QUzMdFo5Duyp5H/zYiJ6gSWb0z5BDxlt4YLmRXlrq/KUwRU7MLObgOx9LMe8CLFpFh+/rpBrS9o4aBU5dNWugQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kWez1aR3D4yyyHcSGxyBeKUSih9rxiGPCSwB34G0c6k=;
 b=QryHGUDPaNyH3VeqKz//EozQuvsCpT4FpTqtJCyXR0G4JueBh9tdBqSUFI9g9XUzG1iIlOO8qDFeadfyes9yBtnfWv3ChmebsJYKMliveWU3kVujSbmPngz5QAiFNwh01zLaK+6+FbR8E7ifSgmVNe29+93fVuhtPdrHbWGZUkiEetUEYjtZUhU9brhomN6ChgRojbU7wBGt1AcwUeucOQkaLOizOeHq1o1NGziN0z3LX1EimhC7weC3m8qIRRh2xAQSduH5dGywdRWfqSDHxl1YMdOy8TdjJ9TQIk9C3X8IEtAmnDCxaI5WdS3gqW+fdahTF78TEYSxMj24h8+BDQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oppo.com; dmarc=pass action=none header.from=oppo.com;
 dkim=pass header.d=oppo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oppo.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kWez1aR3D4yyyHcSGxyBeKUSih9rxiGPCSwB34G0c6k=;
 b=PYgbruJ+PIOQlJq0uFpAJO94ppcJzGnuOpeUjzdg5CZ99Eze7TZF7Si3zUXkX8S/VDQbBqQmGcwGKrusz/Ae6WDrcj9ROo0lDHRoxDKwTfD8x/0lEL/UPYyxKtPwzyJYQ8Pyt4Ovq70UI/lwBREL/0F5qECFm1v6ktzMCSTyH94=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oppo.com;
Received: from TY2PR02MB4479.apcprd02.prod.outlook.com (2603:1096:404:800e::7)
 by TYZPR02MB4526.apcprd02.prod.outlook.com (2603:1096:400:3b::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6521.20; Mon, 19 Jun
 2023 14:34:53 +0000
Received: from TY2PR02MB4479.apcprd02.prod.outlook.com
 ([fe80::bc4a:4d7a:4c73:76eb]) by TY2PR02MB4479.apcprd02.prod.outlook.com
 ([fe80::bc4a:4d7a:4c73:76eb%4]) with mapi id 15.20.6521.020; Mon, 19 Jun 2023
 14:34:53 +0000
To: jaegeuk@kernel.org,
	chao@kernel.org
Date: Mon, 19 Jun 2023 22:34:36 +0800
Message-Id: <20230619143436.2105775-1-heyunlei@oppo.com>
X-Mailer: git-send-email 2.40.1
X-ClientProxiedBy: SGBP274CA0011.SGPP274.PROD.OUTLOOK.COM (2603:1096:4:b0::23)
 To TY2PR02MB4479.apcprd02.prod.outlook.com
 (2603:1096:404:800e::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TY2PR02MB4479:EE_|TYZPR02MB4526:EE_
X-MS-Office365-Filtering-Correlation-Id: e511e1e7-bc3f-42d1-00fe-08db70d25885
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: HN5FqU47W47zPVoRfKugIOPDKpkKlK8YbVAGVdzB6N8CnhG1LpioGgM7VfH6ryaGS10t9/9AiJE/er6e883CBhW2iCVSxGAAOnKsS50APJAlRaPU5t+DpQPblCM5Sp8hx7f+d7HVi+0F6q06oKjpsfWre1T+iHDoJvFhQbOlpQ4dlNPwn8HGAZb5HBHBHCKO0nWp9zbH8pJaAH7S0U9xN7BJUHxOgK5YY8Gp1sABu6UBzEh5vlmLVOWJsVugm4DTLqQs1z2ovNEDo/mZIBMUQcusUcOS7+oUGPiYL8TEt2KYB2lv6WGb2eQBFwcFhSZCFyJ7XD9umfj88DZIgK4nqS4hUdpvXSmFRZctmz1PzngP7RA2kMun295+PCXnVRNxz+fuwWvsLFjfqokfXSFnIjnSk1TibXAEZ6+v3g4Opv5dk6LJz+KZ9wOXY3G4ze8+wYdo47aUMSBKkANdibecNhjNrQPRW1JqeZTP8+DqKIQa/lT/fAZO0D8RCRYVaG71CkDGAFBFbXbltEbaghX4N4X19TH+9PdAxZsvhi7W/HlMcl8RXZoMAeO4zVGSf/TIFIAZzRU13NZl3aY3qR3E9Gunpk7DyD+sbfY8qJOv3HZVTBixFk6+w1P3AvdI1BVa
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:TY2PR02MB4479.apcprd02.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(4636009)(136003)(346002)(366004)(396003)(39860400002)(376002)(451199021)(107886003)(2616005)(86362001)(15650500001)(4744005)(2906002)(83380400001)(5660300002)(66476007)(66946007)(8936002)(186003)(8676002)(66556008)(36756003)(26005)(41300700001)(38100700002)(478600001)(4326008)(6512007)(1076003)(6506007)(52116002)(6486002)(6666004)(38350700002)(316002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?EKqWaqd4vYU4uJzWK3fUvOX9TmXGqFotdRuAvO8280yIBqMuNLhgNXSAp9Zf?=
 =?us-ascii?Q?GBuc61ebo3wjpJ6eW2IWb50zWfDeL1EeVaymNWn4FH2ereDFuiTN8e+KKnQZ?=
 =?us-ascii?Q?jH9zUGzvN6Do7s+RFY6C4ZZqBRJM6R2FzBIJVn8rPyxgPVxZE1pAj70jl7cF?=
 =?us-ascii?Q?b3RWNOvZDwP6kNbND7qVZyRG6X067WmQKBUDacqeNQHGQSnUlI/C03NTDEWS?=
 =?us-ascii?Q?kR6+pIAPWYfaABAAOKopY9C3FDjg5xS2BMey0eYq9U6uttC2Z3lmTj+500IS?=
 =?us-ascii?Q?rkG0Q/c59xlnszxEx6hxvSJ/qdrq+Bc9E6pEPOP+KBIlGBfFvIjCpor3HRL7?=
 =?us-ascii?Q?yvW/0/nZyEukohSUvrtm60UKV6vVdBSReWxRKoPckiQgobMTCxv3nPP41Vwe?=
 =?us-ascii?Q?PLsiO/Ep4v3mq69yJfoHFh5gS3XXW0jj4BiwquAUPJ+JQOOoaYqYJa2fMFrD?=
 =?us-ascii?Q?qaQ1YoryIvstSHoBpQ5H+ndBnXVcHgCNvw1PirHMNz/vFZYCE/4M2tJRPHry?=
 =?us-ascii?Q?AzhjSUVSFO5ZdNbv0YeCg9ShxCwR83BIMabkbkPcn7Nic+78mSLmVgqDBUcB?=
 =?us-ascii?Q?MXzRLvpoRZFnZtKNwkNRtfI+oaaPhZjVJ1FjO1/ctPW8ffdiqsD0HHSFEgyl?=
 =?us-ascii?Q?EoIatB3TZFDZu4DMJtnK7buam8y2fYHQMk7tEhpii/CKhzQUyCm/o5a6nZsp?=
 =?us-ascii?Q?030VjPe1bVp/HRh5d+STEOQ3TF+68MDZS6dAzKOC6p44BWBtndvWpamd73R2?=
 =?us-ascii?Q?XiAmAifXdaAkTNMGbKywYctn4zMmDJRpJIt8klgSYj6tUj4dgskg2WoVfWIs?=
 =?us-ascii?Q?wp+9aBabrUrssZ+eftMDt59nG4TSKdxJvdEmy2NUKHm9isnu5GgBZmOQhUOO?=
 =?us-ascii?Q?MKntrkI3bJRPU2ASmG+OstLhJWJJCEeNHb58YI62jCs0cAosLNrIQSlt0lyw?=
 =?us-ascii?Q?Lqjr1hl294g1jp9VKYOBxHTtkjrg3OQxhBIRRBhONjJ62od+i1DTd1MOw4xJ?=
 =?us-ascii?Q?PQ+iI2VIBbxBdcFWjKtPkhxqEsKUMCKQES4bhaTAzXkql4fDy3SyyS6DiZSO?=
 =?us-ascii?Q?QeMVxLAipKGffZ/bWin/TdYGum21K8PSH/AAYmDOy+fpSt60qFV3PpQH3Xqv?=
 =?us-ascii?Q?05ey5pEICdJLeDevy8zi3hLwkqOEe6DLaLGFVn9NaLraqqhJ9P4PatdlTqVQ?=
 =?us-ascii?Q?H6xsoDW9oad4iZG94Gu6niV4XHJxNrZk4KlYNXV0ZjeQZEJes1abO91A1WVH?=
 =?us-ascii?Q?9sIOlY04i4PY3mQyxzpy8Sgv6JCv+ZkCLrsNfzD+nSO+pHpC7DycS13bULX9?=
 =?us-ascii?Q?1QWsaZhs8S/q8vJ5YmZiq2mc0ukguhxSBK0lpq+3YAFjbe8TCgpOUWXcKMhA?=
 =?us-ascii?Q?4rF5gs07vMAJUAk/aAyhhn+7p439dK4V3bPr9vJ1HMJJVaZrExOoS2phTRkK?=
 =?us-ascii?Q?R97q9UsDkm2wGrMoAyKmdDfr5gW445TLqGlIaS6WgOhq2fpX9q/SGiv0l2Ca?=
 =?us-ascii?Q?7USbZ91Hpg3mqUzrikCUg/9Eg/E3sFy7eBs9Cpvyu6E8Lk3CMVRFjYVRnlwd?=
 =?us-ascii?Q?F6dkNkQCN1ShAKmHdJAhhKnOEBjWVWMYAXFdQiR6?=
X-OriginatorOrg: oppo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e511e1e7-bc3f-42d1-00fe-08db70d25885
X-MS-Exchange-CrossTenant-AuthSource: TY2PR02MB4479.apcprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Jun 2023 14:34:53.6109 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f1905eb1-c353-41c5-9516-62b4a54b5ee6
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: InIl84tS10/w//wicsxoAhEtWFJBcz++0hx8HGl3hHzTVWZpOi2EssYE8gJpVHe3lHHjh4vJ+KtsAk3YmSGMFg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYZPR02MB4526
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: Mtime and ctime stay old value without update after move file
 range ioctl,
 This patch add time update. Signed-off-by: Yunlei He <heyunlei@oppo.com>
 --- fs/f2fs/file.c | 7 +++++++ 1 file changed, 7 insertions(+) 
 Content analysis details:   (-0.2 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
 no trust [40.107.117.44 listed in list.dnswl.org]
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [40.107.117.44 listed in wl.mailspike.net]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.0 SPF_HELO_PASS          SPF: HELO matches SPF record
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
X-Headers-End: 1qBFy9-008jnI-MC
Subject: [f2fs-dev] [PATCH] f2fs: update mtime and ctime in move file range
 method
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
file range ioctl, This patch add time update.

Signed-off-by: Yunlei He <heyunlei@oppo.com>
---
 fs/f2fs/file.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/fs/f2fs/file.c b/fs/f2fs/file.c
index 34a6177c64a4..81e4b85fe805 100644
--- a/fs/f2fs/file.c
+++ b/fs/f2fs/file.c
@@ -2881,6 +2881,13 @@ static int f2fs_move_file_range(struct file *file_in, loff_t pos_in,
 
 	if (src != dst)
 		f2fs_up_write(&F2FS_I(dst)->i_gc_rwsem[WRITE]);
+
+	if (!ret) {
+		dst->i_mtime = dst->i_ctime = current_time(dst);
+		f2fs_mark_inode_dirty_sync(dst, false);
+		f2fs_update_time(F2FS_I_SB(dst), REQ_TIME);
+	}
+
 out_src:
 	f2fs_up_write(&F2FS_I(src)->i_gc_rwsem[WRITE]);
 out_unlock:
-- 
2.40.1



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
