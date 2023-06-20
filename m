Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 90A0A736E65
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 20 Jun 2023 16:11:38 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1qBc4r-0001II-Qx;
	Tue, 20 Jun 2023 14:11:26 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <guochunhai@vivo.com>) id 1qBc4q-0001IB-Sh
 for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 20 Jun 2023 14:11:25 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=MIME-Version:Content-Type:Content-Transfer-Encoding
 :Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=xAzGZufoO40ah7UUGIROaG3D56WzrA+mBLRLBHYhhJI=; b=YnOy8MPFpII//e6kiqJ3y6xb9u
 Y/c7x3i0nqu2WmC3BIVqiHZUDaA1tnBVtv5JpfsJSqJN6bLLyiUGy8IVLzW0q0al79eDuBJsKyltm
 Y+YpwhfMT/3nHHz676k/vokg4Z8i4eeCrx8k9J6umT+qqyIhblchFoN4O+Pus8MhGMJw=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:Date:
 Subject:Cc:To:From:Sender:Reply-To:Content-ID:Content-Description:Resent-Date
 :Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=xAzGZufoO40ah7UUGIROaG3D56WzrA+mBLRLBHYhhJI=; b=J
 li+7rY0eHc3oBUDvT7woR0J1YVNptIRb6l8cAFRMefxcP1RHdMT52LCMUgya8fkEXGx2ohYZFJm6I
 iEyYhIam+MMC9O+4BJYqpnDVMQyC/ziUrNkq8wVl5oViXa9xNYU/SEXmEzCXgcRQZxFgD0zgSZyDA
 0f+TazPboh6x1whw=;
Received: from mail-sgaapc01on2134.outbound.protection.outlook.com
 ([40.107.215.134] helo=APC01-SG2-obe.outbound.protection.outlook.com)
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1qBc4p-009no3-5T for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 20 Jun 2023 14:11:25 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=VUDX7eCsd8/GGSLQoE3ohztzo9B8DO0XRNOq1v3YrWUCA0AyHoogtzVBOzMHeHmjyRlfZp3URXBt7eHrhRwdkerQDEpt285L2k3Dtl05UU+t5SDpB1nfFqKhCAcb+Ciz0gRjQoaXvHE0xsQbS6MBWWu9fq7xtXPQFf3OWfQZ/siafUvHr/uGC7K/rjUvgRhTi3CtKcRFogNbk2+AZtov39rz1TLDmH9y40jqznk0vSV75DsplT2OnGk9qubQU7Re6CKwIgZIvLYQ/nuAjVRQ2iBXK8PStmZXQ8dhJd7EnYhlwwVMyMY3oDUWId1oXDYv0g5mATFKuyW792OQzBjuvg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xAzGZufoO40ah7UUGIROaG3D56WzrA+mBLRLBHYhhJI=;
 b=Q+I0EPSof530hqXS77CmGMKdOo8fWffYde8lH8aY6BIRm0CsYYBADr3ljJADJbtGgbS5dE/81mCXNf7FY2k+9C5bEiKY7mScOWQkotv6MnFKiETGc6e0d7dnSWWVKhTl4MvKCc+1pmOp4qMBs1bkU+WepvV0vQmieFc9T8h44+zBps0DctFEr5sAbZDUYa0nlDn2oHWserGPxhjvVjDGZKPkN+E6m5JZyqYQ/HwIAMR1hj+SBqslaozMIEovNlnwWexdRhFS52kuchNcdwnesrIi1LGM1pVnVZM/XZ9zGPJnWeoijtx5zG9sd4ODGKg7twM9PcyFpqDGG8RcD+PLOA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vivo.com; dmarc=pass action=none header.from=vivo.com;
 dkim=pass header.d=vivo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vivo.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xAzGZufoO40ah7UUGIROaG3D56WzrA+mBLRLBHYhhJI=;
 b=IAqMAKqdHTnh5Dt4Ha2MK291wYhxYQqle4GQmvBS67Dn9YjxvMLbp5ZpV2jTSrLfeECmaZfMbUX4toA6gQNZU4DZtJdAdHxwFKMeJ2jQF5UHm2MEEYpbi5uvd7kSLcNQyLQIBD3U7E+mKSV/mc13SN7A/gtpwv71vYfTB7DKWuNJX4Gn7IzTm20XVEtt+VWr1ZN1MDv1+2I72knujszI2OubAkcXu4qaLRgcMlazJnfEQ+wrKXYTZmfOlU0KaXwtQMXjiEHVmO85jf2fJgKT81OBlg+Did1k4V2G9+/AO25CV/aX0Hd1srYDG1lyLe6RQjov70tDhNw7FcmEyZt92w==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=vivo.com;
Received: from TY2PR06MB3342.apcprd06.prod.outlook.com (2603:1096:404:fb::23)
 by TYZPR06MB5347.apcprd06.prod.outlook.com (2603:1096:400:1f0::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6521.21; Tue, 20 Jun
 2023 14:11:14 +0000
Received: from TY2PR06MB3342.apcprd06.prod.outlook.com
 ([fe80::e008:38cc:5ce6:769a]) by TY2PR06MB3342.apcprd06.prod.outlook.com
 ([fe80::e008:38cc:5ce6:769a%3]) with mapi id 15.20.6500.036; Tue, 20 Jun 2023
 14:11:14 +0000
To: chao@kernel.org,
	jaegeuk@kernel.org
Date: Tue, 20 Jun 2023 22:10:35 +0800
Message-Id: <20230620141035.69782-1-guochunhai@vivo.com>
X-Mailer: git-send-email 2.39.0
X-ClientProxiedBy: SI2PR01CA0024.apcprd01.prod.exchangelabs.com
 (2603:1096:4:192::20) To TY2PR06MB3342.apcprd06.prod.outlook.com
 (2603:1096:404:fb::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TY2PR06MB3342:EE_|TYZPR06MB5347:EE_
X-MS-Office365-Filtering-Correlation-Id: 3cd12cf6-f30a-4ed5-d70c-08db719834f3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: yTeeps8TKUXAlNckT2qrTDMq4zhJ+V5d+HKMAT6kT3r/Vn84BLXqQinG6pzkMQttWcoVZ0l2U6SHpoOZ3VOtXHW7oUhZqqrf6EtvA42lEdfZgT0c07nhDGmhtoanHMdMeZycQHzK0L6BBQd0+NoaehcdAXflnL3/ObBGv4jVueiTXoQNIsnoYe39WJIoflZTSjx0+AGNtNURdNoaOFnwUC4b9nqurXmQa6/dsV5dJl01VAKHGcBT60CveyFp2HkyVnGhq6VFHH7DzMFH+KRCoZizeM+FQ8YuCmwOBnRg2gkUAnYD5c2C7vy8mITjcg5jG1h8o6UamWMWXBpCV5WlZEuMJCGxRCAaorGqmGq5mnWzMsTlQ6Ma6rO7T6FpTHPOOrEbnQp03Rqvj9gXcw1GpLu1nRgVfD5bzro18kjHzHB5NVO7cQ2evqcy/HnLLer6EqjBhM6nwmQQtJ1iKN9CCrn2jIC1/50amvP7+vmjXjQtpWP8b9E4j3KxXpJ4VG59e4ozLq5ppJe0Yb/8iPuNPhO8VdcTlYmQ+66H1eA7SpJO7X7TK3Pz+UoWi7RHK+668GVIPjQTDOfu87wfNObjb0my0QZmuYJqsC50Jgu61zTo5kIp6pD0ySTkCIkfYZXH
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:TY2PR06MB3342.apcprd06.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(4636009)(39860400002)(136003)(366004)(376002)(346002)(396003)(451199021)(52116002)(6666004)(6486002)(478600001)(186003)(6512007)(6506007)(1076003)(26005)(83380400001)(36756003)(2616005)(86362001)(38350700002)(38100700002)(107886003)(4326008)(66556008)(66476007)(66946007)(316002)(8936002)(8676002)(5660300002)(41300700001)(2906002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?zQ93fICyvlG0EQZZ1rA17zYNDwptCeKyjAK4xMs1/QUMoaadw/AeeNiQrnCg?=
 =?us-ascii?Q?oIYA8P0I7z56SGLfEe6cNP8s0GvautvEH0AkqypXtU2Qq96WK0CLcnHLOSoL?=
 =?us-ascii?Q?BU19tN3mOqRlAVPkhSOmM9D9EYRlvuMFwbyH2flzLBh/ayfO7gBmYKmhzHCK?=
 =?us-ascii?Q?K7ySxZOMqhHnHgUhvJu+he9KdB0BGL3d4J5O8LDkPXo91Wz1XD58uNBAJ/kK?=
 =?us-ascii?Q?8sQ/JjzFNjBqhvqxKsJiILzc/SVxaVDU9mbVVR/NNP7JJJuEuWiB71XC0Pnc?=
 =?us-ascii?Q?6aBBa2qiPZkXEoEwqtFXSP9JVxL3w9NQMby0CWcutkI1TtKbCtFj8+FipBun?=
 =?us-ascii?Q?zUVOkhy/4jLcbV7Rg0LrmUg16RyeMv/PCZn6wLJ1vUjRT0KJ7hUrcpB2bFQU?=
 =?us-ascii?Q?Q2a5UzpeEmDbk2eUieVOL6xe2w6ZjirR3hJgfhoMZu4puUkXHC+A8vJDs0rq?=
 =?us-ascii?Q?RwLTq7NOpmeqyvbngi4LXhjI5bX5K4gKMOSFTvMtsyqsSAsWPU8DSG/T7fYy?=
 =?us-ascii?Q?9G7vTyRC81D6cVZ5V5EazoZyoO2wgtE5HOq605rt7WqxtJDngVWjL5nmG9ZS?=
 =?us-ascii?Q?He1CmXgT7duMjJr+xVMY3DfxIzWzQJYBCmjl6iYLII8CnUeEmX5wbFZNpWGN?=
 =?us-ascii?Q?oHwJ7ScmFjn1omgKPrWiViV0hMba5QbeoUFFXX6JIbwV+HNa6sQZzUZ1ZOgh?=
 =?us-ascii?Q?oWci6dYkSRUoVNNgrZr+cLuCeeRFh+KOH/8FrEpDr05qDBqS+XS9ByBGgLs2?=
 =?us-ascii?Q?KZkCzh26vTVI5b3nfoOjxgmZjB2YI/biM8urI+m/ifmOVjUWvU9DyEiwBKTk?=
 =?us-ascii?Q?e1OZ3wM/hP+9Gh8oVKQFIDX4vKfo5tbkbQgWfVEU4+5EpsjAEnuLVLhX5QMV?=
 =?us-ascii?Q?7szs0h2sQXwggZRm+b0ZaLsFWGPxzR2C2yaHbDrFzYj0/PlGTyA1lxr9Zjvt?=
 =?us-ascii?Q?BNtz4qPMOm0gPst4NFl2hbNeLvRwmKZVI5x9BXXWgbTviCJlfQ/7O9rGU6s2?=
 =?us-ascii?Q?N4UYM5W/htAQUVmQTpDyTQJZFXhaTPYMB0vP+hZRZjp6MQjA6imoZroW1Qg0?=
 =?us-ascii?Q?GXuoxPNvPGTGL6l1WfIVKTlo2y9yZGbzwR9n/AB8m4WRWnbX9XfxGqTKzWmH?=
 =?us-ascii?Q?1XEhzA6+Rd/ReZZII82bwy4sXsqWn6wlfSq7tdny8Y9f7bonW/moCwI9Hl6O?=
 =?us-ascii?Q?k/Tw8AbBicpmd9XHvFSabfhjxvaXg1SOwRY+fSdTxAC43ldIiXwnKSEoXTdA?=
 =?us-ascii?Q?TthqGxGcU7YOVYHr+gzv6ZW6cweqsP1cNeYeKN7o4pLxVuw26SrKrLAQFd1t?=
 =?us-ascii?Q?sTq0lLqoA/feMDhvbosdalKJDArtwLfPQkE725GBlU5PzDfc2dHb7Z+p0vvi?=
 =?us-ascii?Q?1LVdXYfyU42apenOaYzoIwnth0bz/1oedF1JEuKlol2ajCMTJc84Atv4b0Uk?=
 =?us-ascii?Q?AdqXxA1ST2c5UCC0qIs9K7eGpAzwCv7aD1F29uMgnxZmyF+jL7vMyQfX3woP?=
 =?us-ascii?Q?xbVw+2nmTQLNfMdzusas4uzVNWofPQjupTOu/E4po75+5ISkMe8VndIUZA/z?=
 =?us-ascii?Q?D4rcNSbd2W+4CAJxKRLRAx/29+RO9EzI/wuqgnYw?=
X-OriginatorOrg: vivo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3cd12cf6-f30a-4ed5-d70c-08db719834f3
X-MS-Exchange-CrossTenant-AuthSource: TY2PR06MB3342.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Jun 2023 14:11:14.2564 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 923e42dc-48d5-4cbe-b582-1a797a6412ed
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: tSNJSQkWiXAcQVWjFiVjZV87puubzSMTRfB6PGqe/JqWcJJYt5nfI3HhA5AAuK0Qh2K3aCaCLhCzDqeHBQjhsg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYZPR06MB5347
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  Now f2fs support four block allocation modes: lfs, adaptive, 
 fragment:segment, fragment:block. Only lfs mode is allowed with zoned block
 device feature. Signed-off-by: Chunhai Guo <guochunhai@vivo.com> ---
 fs/f2fs/super.c
 | 12 +++++++----- 1 file changed, 7 insertions(+), 5 deletions(-) 
 Content analysis details:   (-0.2 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
 no trust [40.107.215.134 listed in list.dnswl.org]
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [40.107.215.134 listed in wl.mailspike.net]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.0 SPF_HELO_PASS          SPF: HELO matches SPF record
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
X-Headers-End: 1qBc4p-009no3-5T
Subject: [f2fs-dev] [PATCH] f2fs: Only lfs mode is allowed with zoned block
 device feature
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
Cc: Chunhai Guo <guochunhai@vivo.com>, linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

Now f2fs support four block allocation modes: lfs, adaptive,
fragment:segment, fragment:block. Only lfs mode is allowed with zoned block
device feature.

Signed-off-by: Chunhai Guo <guochunhai@vivo.com>
---
 fs/f2fs/super.c | 12 +++++++-----
 1 file changed, 7 insertions(+), 5 deletions(-)

diff --git a/fs/f2fs/super.c b/fs/f2fs/super.c
index c917fa771f0e..6249483be905 100644
--- a/fs/f2fs/super.c
+++ b/fs/f2fs/super.c
@@ -861,12 +861,14 @@ static int parse_options(struct super_block *sb, char *options, bool is_remount)
 
 			if (!name)
 				return -ENOMEM;
+
+			if (strcmp(name, "lfs") && f2fs_sb_has_blkzoned(sbi)) {
+				f2fs_warn(sbi, "Only lfs mode is allowed with zoned block device feature");
+				kfree(name);
+				return -EINVAL;
+			}
+
 			if (!strcmp(name, "adaptive")) {
-				if (f2fs_sb_has_blkzoned(sbi)) {
-					f2fs_warn(sbi, "adaptive mode is not allowed with zoned block device feature");
-					kfree(name);
-					return -EINVAL;
-				}
 				F2FS_OPTION(sbi).fs_mode = FS_MODE_ADAPTIVE;
 			} else if (!strcmp(name, "lfs")) {
 				F2FS_OPTION(sbi).fs_mode = FS_MODE_LFS;
-- 
2.25.1



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
