Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 69AD9493F37
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 19 Jan 2022 18:43:24 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.94.2)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1nAEzP-0002K0-L2; Wed, 19 Jan 2022 17:43:18 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <guoweichao@msn.com>) id 1nAEzN-0002Jt-Ns
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 19 Jan 2022 17:43:16 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=MIME-Version:Content-Type:Message-ID:Date:Subject:
 Cc:To:From:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=rY4SxDrmOJrekNpJEkE5gQyPVGcpzZoxCY2FJGL38Lw=; b=SBIQukN7QhVTaBV+1Tt5kMmGNB
 nN0TyOOQGBgu/Xxh4DSHsMU5VRwBr17lOaTuP/3dmBqb6ZAhMsdl8Jb3qzldrDMVzljfEOQSSfq75
 FFNkwags5gMfr1M7WxGP4fxkiwShzVvFFyIaktX3KE1lfSQcejH7akgfIKynQqjneovM=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=MIME-Version:Content-Type:Message-ID:Date:Subject:Cc:To:From:Sender:
 Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
 :Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=rY4SxDrmOJrekNpJEkE5gQyPVGcpzZoxCY2FJGL38Lw=; b=C
 r9znLvuJTHYdznPbjBr7XALUzNdFAE/JK+1L+NBasgzXKY3lKu1MMHc0Y8e4ooVP7GLDvkCUmSZWM
 0cfAvXRApQ2Ah6R2omz82FZtaG23Rfn5APQymNuWNozNWy40oe5dq+0ciBzFX2uz5VIWPR6gK9DGJ
 Fml9EjolhuopAbec=;
Received: from mail-bn1nam07olkn2031.outbound.protection.outlook.com
 ([40.92.15.31] helo=NAM02-BN1-obe.outbound.protection.outlook.com)
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.3)
 id 1nAEzH-003yLZ-VY
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 19 Jan 2022 17:43:16 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Akjb1p/rx3+R9knRH8vK+epjj1W0/AnmbfPL7YFpEJMWoZKUzvfXU55/puDKoTxoRMUoWM8E6HvXIG/A1FYuhHmlGnr+LL2DtcaUwXCx82pCqAUZzcdJR8KEiUvtVbUy+HxN/hs4C54w8fwU+fIQ6kmOZ3+GOGMqQiuLsyGC4pGeY4tcLovUONJ9WiUF2vebI5O+yfHQRsV5s1oB8UaNw45Z/i6d8V3w1xZOpqu8DE/Eyuwsxbsa0ZTuz4Qrz1aJD9+Z16C1+BQWr7EZOEPkJjCqQNOTfKmoyjhdeSsdgxXWY2DSp7hejAp90ajxnsKjOdJv06JwAOfi/azYM1zHOw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rY4SxDrmOJrekNpJEkE5gQyPVGcpzZoxCY2FJGL38Lw=;
 b=c5HcuPb12BYmechDb/8IV34f1CVAZ6ajuh+I2R0JbXt1Sz2H601jkWdjgp/uO/OOM8u7k4oBPW2XZQI1MEM7p5+2ELZKZ7G0D/4SH7OGSjvkclFgZTFpQwMNIitGRQQV8LeZH8Sx1dGz716kJ+AFxRcuZsEMNrOv7i7caBdGMmVD/6sYMr7RMrcfG/ktWs0BwX4yNOJHTkU/9eFWp8/ye64h6k0U0cB8yx6zyM8vTD3/7yqtW0PbHRuBd1+3x3o1CLau2KFO1FaPW8rfLFrXrYRqhGUU9OpCOO4bQ0PZ3w+Lk9yQBCrvK/S3v9F1rG+2YuTXBGVf3OCA3hj1vkXacw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=msn.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rY4SxDrmOJrekNpJEkE5gQyPVGcpzZoxCY2FJGL38Lw=;
 b=MEouGQlYW78WmMc2ZGPdhOE7ltbzT2NSGKPNvAtoHWpib4QVfwYaO6NzzWGhQLaUxxBv1o3lr9EuTVIko4UABP/n7bKknUaRCrqaaxHVGQIpq4Ri9zvWBFbu2XyT6IOcsREkdW7sx2qqD3KeyIQR0KCjzowA8ToyvipuMa1qEe8dzc1PfLAIiPB7pQLLLByJ2oTZwjtwdBC596Sm3vnfybGhhfkkny8dhdZK+FkFteRBdLiLEKXQh19QP01sHhTxTRbxkS3vKhw1qe843gP48hue1urADcNDnI+wEO4X79BTv7Xyq8RM2QCaJQAuE+BuHQMIEd+6JpoPTCOHH9v5mg==
Received: from MW2PR0102MB3403.prod.exchangelabs.com (2603:10b6:302:2::32) by
 MWHPR01MB3263.prod.exchangelabs.com (2603:10b6:300:fd::10) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4888.11; Wed, 19 Jan 2022 17:27:17 +0000
Received: from MW2PR0102MB3403.prod.exchangelabs.com
 ([fe80::20bd:3b80:30a5:d66c]) by MW2PR0102MB3403.prod.exchangelabs.com
 ([fe80::20bd:3b80:30a5:d66c%4]) with mapi id 15.20.4888.014; Wed, 19 Jan 2022
 17:27:17 +0000
From: Weichao Guo <guoweichao@msn.com>
To: jaegeuk@kernel.org,
	chao@kernel.org
Date: Thu, 20 Jan 2022 01:27:07 +0800
Message-ID: <MW2PR0102MB34035F6BC03EB4A15C0A059AC6599@MW2PR0102MB3403.prod.exchangelabs.com>
X-Mailer: git-send-email 1.9.1
X-TMN: [HUS33oq3GWY7zJIAnw+oF8b9uAVVU7eO]
X-ClientProxiedBy: HK2PR04CA0085.apcprd04.prod.outlook.com
 (2603:1096:202:15::29) To MW2PR0102MB3403.prod.exchangelabs.com
 (2603:10b6:302:2::32)
X-Microsoft-Original-Message-ID: <1642613227-4566-1-git-send-email-guoweichao@msn.com>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: b51328aa-d998-4026-293b-08d9db70f076
X-MS-TrafficTypeDiagnostic: MWHPR01MB3263:EE_
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 1rOta0Wx556yX6UmM25pDrTgq+w1MsOM2JbT/04nv1p1d8lm1tt4UVt77cwN+HKDVY7EKe+Qb1n6iK/Smfwixo07yYD9+oQQth3VzqaZBNHCwUGBWcnpyviNoor+4KuCGpIZrqlCoTglnvi+ZWhSByYYrK+pR5egbxQcXnHxFyS97K+tMII6z8R6Rb604JeTDtTxPA4mj8xSRaHkXTliaGw7AbWOYPxhp49aIZiBQD44VZHbXVFKqeQW7oA2hoYvxp6XGYnkTgbiIG9NIBYTXropuwoaOlgrLfriB7RgOuQR3MuxSXXk8Diw5ntCkjedZ5VQbQ1iROdGtgEOfGYcxlOjM1S2/EqF+lugWF8wg8AIR2QZPLmWMuvO7f6gElyyi/QsfwaDhpcIHSOaY6QsWrnVKYASOi3e4rRBhtYaJVvt0E0Vep8gOeAMGTou47oGx416fpn2ybQ9WU8axQun32X7kpnwpfHJKN4rxT1pN68DKyofOrRrQR/12vDwqEtlW2hY0EEAdiZgyBJYLflOmyaInE4wPRr0Kpyo6XoMWhNlUpUUCwTogM31TnTCHoagIhDNDRZes2H/sOtGuSxnKg==
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?Pk/YNgqUnuC8Vv+Ly6gQ6nGJLBhKwbAnr5NtpZhc3AbUrJcBoJssnB7wS3nV?=
 =?us-ascii?Q?e39chdaDyEw86C2a7YOiqvLAXksjjEbruGctcjr5NrVlqYudKIQt5f/qc4Zd?=
 =?us-ascii?Q?n9k97AmBTeoU3ec4K8GCH8ejQIXhy5O5InXucAhYcDO3P+T+/5JZkCLKfxLj?=
 =?us-ascii?Q?HlcYcvzOtKt3xowvQt6UzJDnwZLj/p5lZTBua+/3jBZhC7LyXSuAEMMSqsbL?=
 =?us-ascii?Q?WUpZ9xGzOvIDxxg09UaCIqhD5onZNlahVoRkTnJsMJaWAQPv7brKmSdDruYV?=
 =?us-ascii?Q?/vuaGBQq5WxcFd7180nagNQNu4iyCdK6CEt5PCM7bAGIyY1mtSQA4Iccrl+o?=
 =?us-ascii?Q?1lTr3ATGT7rSOEZdUA7nxafRHedBPabYB0aM6uFkMYwL1cZMztqQqg9HudoB?=
 =?us-ascii?Q?DxVXOiLmDMAtjfMrAYJGAep8ilyp0OVHAA1Uf7w8Q+VpgWND7IVPQSHqIot9?=
 =?us-ascii?Q?5KSrXrXJbBmcLA8s8HmQj/4osnxcv6MB0PJVmLDUI9yggAuPhcv+Svxxdc0A?=
 =?us-ascii?Q?UfTNv+DPOyNv8z9FFbiGAVVcsGyo4jwa+E7wokVShtQyzSVnEXUAunryg/YH?=
 =?us-ascii?Q?pYdEoYbo+tFIz0xjhn+H2Ng/DefS8VCSGmbzLBCY4QE9o2flaOldlR+Ft7Yj?=
 =?us-ascii?Q?hdN8vBHonc+i68xRyxB7zXcLnC6LKwTzsBTSkze8xEZ/nm1MAdvNrmc0SN0z?=
 =?us-ascii?Q?ycATfApKwcnKpBtZVBzrGyR0+sOjnvsd3nKc6WeWYA052AtsZ4I35k5ya0Rn?=
 =?us-ascii?Q?v5AXF//W06SZj8+WKWcd2kqSdthPq6PhoKux6V4RHA6dvv6Zj0OYQOlBXqej?=
 =?us-ascii?Q?n74v9EysdOrUfQ+tCpZ2MqkRLjS1cbXcSkw33jCs9vBDcZHXFQLLSM6yGp23?=
 =?us-ascii?Q?4zmpb+lnZ7z8jeaJ+J4Zwft3d+drdo7ebYuMlSUJCDVudxDBdlCKCQf+R0qE?=
 =?us-ascii?Q?SC6gN0a4qACnrm8vYHP10A=3D=3D?=
X-OriginatorOrg: sct-15-20-4755-11-msonline-outlook-24fb5.templateTenant
X-MS-Exchange-CrossTenant-Network-Message-Id: b51328aa-d998-4026-293b-08d9db70f076
X-MS-Exchange-CrossTenant-AuthSource: MW2PR0102MB3403.prod.exchangelabs.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Jan 2022 17:27:17.2043 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR01MB3263
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  From: Weichao Guo When first time pinning a file with size
 0, and SBI_NEED_FSCK is set, we still got EINVAL after this fix: 19bdba5
 (f2fs: avoid EINVAL by SBI_NEED_FSCK when pinning a file). Let's avoid it
 since this n [...] 
 Content analysis details:   (-0.2 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [40.92.15.31 listed in wl.mailspike.net]
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
 no trust [40.92.15.31 listed in list.dnswl.org]
 -0.0 SPF_HELO_PASS          SPF: HELO matches SPF record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 FREEMAIL_FROM          Sender email is commonly abused enduser mail
 provider [guoweichao[at]msn.com]
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
X-Headers-End: 1nAEzH-003yLZ-VY
Subject: [f2fs-dev] [PATCH] f2fs: avoid EINVAL by SBI_NEED_FSCK when first
 time pinning a file
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
Cc: zhoulei3@oppo.com, linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

From: Weichao Guo <guoweichao@oppo.com>

When first time pinning a file with size 0, and SBI_NEED_FSCK is set,
we still got EINVAL after this fix:
19bdba5 (f2fs: avoid EINVAL by SBI_NEED_FSCK when pinning a file).
Let's avoid it since this new created file can do in-place-update.

Signed-off-by: Weichao Guo <guoweichao@oppo.com>
---
 fs/f2fs/data.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/fs/f2fs/data.c b/fs/f2fs/data.c
index 0fc6e02..0f07ec9 100644
--- a/fs/f2fs/data.c
+++ b/fs/f2fs/data.c
@@ -2526,7 +2526,7 @@ bool f2fs_should_update_outplace(struct inode *inode, struct f2fs_io_info *fio)
 	struct f2fs_sb_info *sbi = F2FS_I_SB(inode);
 
 	/* The below cases were checked when setting it. */
-	if (f2fs_is_pinned_file(inode))
+	if (f2fs_is_pinned_file(inode) || inode->i_size == 0)
 		return false;
 	if (fio && is_sbi_flag_set(sbi, SBI_NEED_FSCK))
 		return true;
-- 
1.9.1



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
