Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 8278F70DABB
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 23 May 2023 12:41:37 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-3.v29.lw.sourceforge.com)
	by sfs-ml-3.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1q1PSP-0004ko-Lf;
	Tue, 23 May 2023 10:41:34 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-3.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <guochunhai@vivo.com>) id 1q1PSM-0004kf-KK
 for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 23 May 2023 10:41:31 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=MIME-Version:Content-Type:Content-Transfer-Encoding
 :Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=zZiMDkV/yiSot+uMyIwbgpFtsITwgA3+yJkdAUAMp6c=; b=jhOMm5MrgDedpMQk0CcJODq6YF
 uOepGG6VKs2Q9ZsYtJqYiNdS35bFYZ513POwJNJlM+KaJmbUclQprqaSYMFNaTJoiRPH3QsOsQkji
 /SdicLunyIotN+Ejfc+qM1kuzZo6DP5WsqGT6TeAPv2VMjJJUhbvh80JvjSL5zblhbno=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:Date:
 Subject:Cc:To:From:Sender:Reply-To:Content-ID:Content-Description:Resent-Date
 :Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=zZiMDkV/yiSot+uMyIwbgpFtsITwgA3+yJkdAUAMp6c=; b=G
 BWXzZ9Q8kBW+sp6wXyLlJ71ndDNfq4OjzBCFbTG+E5IWAI737tgQOBzR0oYPDesW7SzTEuvDy0qQo
 qscZmL2Qm+uk70WfvEFvzZB5zniKRf6e937wTa60+0kgpeXRkI4eET8cf7lYfbBaGw8G6s/ZK+jkW
 n+R0y+ZlzjC661wk=;
Received: from mail-psaapc01on2098.outbound.protection.outlook.com
 ([40.107.255.98] helo=APC01-PSA-obe.outbound.protection.outlook.com)
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1q1PSC-0002XI-DI for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 23 May 2023 10:41:30 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=CUbNWgbSvem9dfNelV+tFFjjKudZHKYaExvzZpyc7NQpz9Oh51TadNMJgdvN4TdF85FXWnWC3ymABxLhuvV/60z+NnPVfvNatdMoonuubnI6DFBsOAe7Z+l8ZBdJGCMDadxRyXOu4ppfejErI9u43PDSRJUQsVWewa28OF1x9ph5rh3k+KaDqPAmSXNOtp89KhgLTcbob2Jd4ZrcPc2dJlPZq/Z1iqKvnSTuq5bbfNsvkdnhrZAVMkvRw46pd9ZaocUoPXyzBZFIc8qe5S2OVx9mkMqfEiEPVJ7tfDS82OBxF7/n5/HlIBocPuTXqygGkPItBU/USyH6Q77AElBUZg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zZiMDkV/yiSot+uMyIwbgpFtsITwgA3+yJkdAUAMp6c=;
 b=Bb6LR+Yypp1QFBZG0ONspZTCYG9YkFoARt3bEcBBrKzqtjqJwrkoycXwtTvZov68Z+VPknn3aZhyNZXM+WwOSnXo/y5LVg+i7c/FmbM4lpTPbvVaNvEzL8KQnlSyVqVcs7VFtIi/NeLagkJGohHUlYY6M+FltxXWBSsz8G3v3GvGXq/RVgmpia7y2gpLQXTCj1PoicaFadyyJB4G4a7xK0WHyQN2Ie7dw2/8GLFTgBGn9G/mstchsPfR+RPcXorhS2SRrZuYW6Ywh39pyt4fuzjQrUtLzIk7zdedjryZDIIJBJqw3KACfBcSrtz9aDyvBd2sALN5A2r/c1JGgh4Csg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vivo.com; dmarc=pass action=none header.from=vivo.com;
 dkim=pass header.d=vivo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vivo.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zZiMDkV/yiSot+uMyIwbgpFtsITwgA3+yJkdAUAMp6c=;
 b=C9Y2ymSeiTvkW0ioYBgev2q/qcwrAM7msyNWRuIPEJGJ33zDG6ycpfUY/2rNbN2/6l2lUndnMeVs4E7vLySk+nG6x7N9ObkBmRNpK4cBB4OQwJ8wuXD6OFlxx3lL8nyisL9MUgr04DurjW/uKQ4DYkviNNPARNqNXWqAglyhQQXxCxmUiXEjCeEeKTqNRCuNsjNKF5yY7LoCODXwC1yxjHlCHp1NIgxD2BehN8iJXZLDfv2cfqy8IbnEUKPWtiaK2za59yC6pVoCzIyue4wzwu9sKJk3NBsjMQ9AMQNZavWg/zsghzlkMWsctDvakzcDNHOXtn5NM2L1Yi+BPqrePw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=vivo.com;
Received: from TY2PR06MB3342.apcprd06.prod.outlook.com (2603:1096:404:fb::23)
 by TYUPR06MB6244.apcprd06.prod.outlook.com (2603:1096:400:35c::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6411.29; Tue, 23 May
 2023 10:41:11 +0000
Received: from TY2PR06MB3342.apcprd06.prod.outlook.com
 ([fe80::1e05:3b1e:35f9:87cd]) by TY2PR06MB3342.apcprd06.prod.outlook.com
 ([fe80::1e05:3b1e:35f9:87cd%4]) with mapi id 15.20.6411.029; Tue, 23 May 2023
 10:41:10 +0000
To: chao@kernel.org
Date: Tue, 23 May 2023 18:40:59 +0800
Message-Id: <20230523104059.78315-1-guochunhai@vivo.com>
X-Mailer: git-send-email 2.39.0
X-ClientProxiedBy: SI1PR02CA0024.apcprd02.prod.outlook.com
 (2603:1096:4:1f4::12) To TY2PR06MB3342.apcprd06.prod.outlook.com
 (2603:1096:404:fb::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TY2PR06MB3342:EE_|TYUPR06MB6244:EE_
X-MS-Office365-Filtering-Correlation-Id: dde0553a-7f63-499f-8e07-08db5b7a3917
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 49arjakxPSFONG/cN/I/kbQojVf+Rf2+g+j9YL/pWhHrY4UK7TSUSmGql8FWavH2AgW4DNMpLZW4ECTtb8UpixJtlh1jxIUroCKrss45U3cmlY7I72YZXzlSxmcWJ4WdIpD6Af/wuEvgRtZ/LvkyjmD+EcXR9TKLDK5uQMCXRPZ1zz8PfTPfvyOT1wwjAsmRSuw/uMK+Gf4M+xJAcu+IYeu0ta1SzhuirTA3U6S3H870Os3md6eaWt6q+XtYELJ5QRD8LKMeZC/1Z4br4REsq7IpEKJXlaARtAOl2X7xN2YD+o5WFGR+FXH4LoUfn0DkFAjrSiyeAS1OeSCYwGHdlNh04Fum5CVHVN59qwtjqFJwWicS+nlGXXrRm/wC1vZL4HWXzgE4ZfCBgx4Vzl7zgvb7UkfWHAIlrc0E9QxGAC8kt73fDDUVQ99YiPbrjL/pH4pZvAbqW9m0n4byFYbFhM16SEL6md+qGX7mNC4kCvHfqMxiUJFXbaiOe1w2kXj0p50HgGpswQVEaNgQbHSivRuuQpPgpssKFM2Rcd+716IkRxxC3GaPR6t7kLtJ/ocliJU5TQEXa3pRXiaqPPbKrJZK70jr+MSsgyiOK5p48HFLzYNd4E1hVqDA4TD1O1Rp
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:TY2PR06MB3342.apcprd06.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(4636009)(376002)(39860400002)(366004)(346002)(136003)(396003)(451199021)(41300700001)(52116002)(66556008)(66476007)(66946007)(2906002)(26005)(1076003)(186003)(478600001)(6486002)(316002)(4326008)(6666004)(6916009)(5660300002)(6512007)(8936002)(8676002)(107886003)(36756003)(2616005)(6506007)(83380400001)(86362001)(38100700002)(38350700002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?S4JQApnp1RGBXeg1Nuwo6ZZ659gMSwPkdJMjg1Jt/4gUkH3gKJW8hhOVu00W?=
 =?us-ascii?Q?QR7IT2WTCtM0ogCULAUudlT6PnNYhioyfm7AevpljXdpYWYPrIitmWqWXS69?=
 =?us-ascii?Q?6si4Z3BiSFJOMZRg87tKu6KJq/IBRNDdBEkiczweEIBMi0fCcY1TY22T9r5a?=
 =?us-ascii?Q?HAK07rBis+rQINNLmF0gdwYc+dtw09e5JqeN1LplvSfj8ERQJVBTW1jIEzvi?=
 =?us-ascii?Q?+b2akclvpj0CpFkA61OIKtr4ByhP192ng3+ugJfLsx2P+jwpbGjD0mmMZe89?=
 =?us-ascii?Q?+JR+a4VJZ7VMdF537w6MjPAG377gOOQldb47vJUAFL8g1NFu2zYg7aKQPlWW?=
 =?us-ascii?Q?KMnrMfrsaRPMMz/duxwUIwDgSqoscb9mReciQhbGeeIf5Ua1MyBD7igOv95S?=
 =?us-ascii?Q?NFiRt7GWqatXSRQ2wNIAb/+W/lNH6VZuGDbNk4sWHjsa1WFle0fokd+y0IGj?=
 =?us-ascii?Q?UnvHgPz7yOPc+lbXNq3x2y/tSLdXE3Zh+MV8cdZvBKL7ahySR5DsI6Kndeb3?=
 =?us-ascii?Q?JXtCjJqRakK8MupQ8UCPyQs9EWadvNO4iKHWKIKHN45eX5JF5qV+wOowREx8?=
 =?us-ascii?Q?KICCaTDrGmm7LblKeUrNND4dhVgqowHnoAFMa1nh3zfoF81T3H67UBLzwnF9?=
 =?us-ascii?Q?Z4m6IFCVuf7BvMFtxP4bEYZ3mhiy3co02ljWqiFvFoKQxGNfuq9WMs6chWYg?=
 =?us-ascii?Q?olFXBaWLW+13Ovj9L5wKfTRw858vZ2ImzrJCPHMW0B21RvSF8C5dURIJD6Ch?=
 =?us-ascii?Q?jIA9GPOVKP2UWYAlSf0YmzB0IKAq8ptOhtszEhb4iC7qNkctYDk4TUYMdyYd?=
 =?us-ascii?Q?6nQnnRtLawTvzb1O0kODAPsUM2atTsDPOalg+JSaI/oWl1k/dlDam7/zRMv4?=
 =?us-ascii?Q?7vVYTz52MQEZZ8Winb0hRDWC7pZpRkRfHLeUlP3HAQSuBGVqHsWXX6eKj/sC?=
 =?us-ascii?Q?LPCZeIdVgDs43pl8Zsl56Nvz7OwxWCOQ3BVlDIua7EXi0IB27eV0z4btngQj?=
 =?us-ascii?Q?UDfH1uYvBolUxj6sqAG2d6Ia+P/vkSvnUC2e7hGy3iXNA+APRkZ4rOAZDTGS?=
 =?us-ascii?Q?yT+5Pbk6URvuCXlJKz9jXQENx3+ATKo9s17Xmp53KBTGnsng8/dW908T82Hp?=
 =?us-ascii?Q?nathqpWm6GD93Vu8dX7aMCXYwz+INWACqNaPLKLuNvooHvTwmgCy2dPZiymM?=
 =?us-ascii?Q?zg59mFStd+yZyMN0jGxrhVT01aATJ7BmVH/ocgLaSy+9AjK1o22w8agON2W6?=
 =?us-ascii?Q?CMNlIrVAxR4P5IiEU9J6WIW8nRcO6qUafMr91wQC0QHWX9ki01q57pDDTICc?=
 =?us-ascii?Q?R+GALgMZCcXrxMxJ9r/YEwGpfvqG1Qe0BXa5EFZP/7mstrDTdyg50TTi6pLp?=
 =?us-ascii?Q?O+Vf6KbGQF2mGoD8xhQ6G7A6vMhPl11bsgsu43xsEkL9OPUOzkG2gZKdZIv/?=
 =?us-ascii?Q?WdbTQdwHTB+XEkPlSkLic81bARB5yupy5WfEyoVzemh3qh/I7YtIhZW8vajb?=
 =?us-ascii?Q?YLjKhYWVUVXnNpkn7EXLJH5TikrV8vPUnfD6ChuVxWyyqePPiloOMLMU4L7I?=
 =?us-ascii?Q?VrSXvKbEQ+UTiaTn2O0oHjoy2ZXgSugRcvL86ced?=
X-OriginatorOrg: vivo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: dde0553a-7f63-499f-8e07-08db5b7a3917
X-MS-Exchange-CrossTenant-AuthSource: TY2PR06MB3342.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 May 2023 10:41:10.6371 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 923e42dc-48d5-4cbe-b582-1a797a6412ed
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: uJ9nW+y2HlSMmQkDzfLbws/q8Ok5Ah5BIhoC+u8Jj25oHr92eAOt/BrBTx3mY2mc1O+YFM706KvYRaELeVES4A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYUPR06MB6244
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: find_fsync_inode() detect the looped node chain by comparing
 the loop counter with free blocks. While it may take tens of seconds to quit
 when the free blocks are large enough. We can use Floyd's cycl [...] 
 Content analysis details:   (-0.2 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
 no trust [40.107.255.98 listed in list.dnswl.org]
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [40.107.255.98 listed in wl.mailspike.net]
 -0.0 SPF_HELO_PASS          SPF: HELO matches SPF record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
X-Headers-End: 1q1PSC-0002XI-DI
Subject: [f2fs-dev] [PATCH v7] fsck.f2fs: Detect and fix looped node chain
 efficiently
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
Cc: jaegeuk@kernel.org, linux-f2fs-devel@lists.sourceforge.net,
 Chunhai Guo <guochunhai@vivo.com>, frank.li@vivo.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

find_fsync_inode() detect the looped node chain by comparing the loop
counter with free blocks. While it may take tens of seconds to quit when
the free blocks are large enough. We can use Floyd's cycle detection
algorithm to make the detection more efficient, and fix the issue by
filling a NULL address in the last node of the chain.

Below is the log we encounter on a 256GB UFS storage and it takes about
25 seconds to detect looped node chain. After changing the algorithm, it
takes about 20ms to finish the same job.

    [   10.822904] fsck.f2fs: Info: version timestamp cur: 17, prev: 430
    [   10.822949] fsck.f2fs: [update_superblock: 762] Info: Done to
update superblock
    [   10.822953] fsck.f2fs: Info: superblock features = 1499 :
encrypt verity extra_attr project_quota quota_ino casefold
    [   10.822956] fsck.f2fs: Info: superblock encrypt level = 0, salt =
00000000000000000000000000000000
    [   10.822960] fsck.f2fs: Info: total FS sectors = 59249811 (231444
MB)
    [   35.852827] fsck.f2fs:	detect looped node chain,
blkaddr:1114802, next:1114803
    [   35.852842] fsck.f2fs: [f2fs_do_mount:3846] record_fsync_data
failed
    [   35.856106] fsck.f2fs: fsck.f2fs terminated by exit(255)

Signed-off-by: Chunhai Guo <guochunhai@vivo.com>
---
v6 -> v7 : Correct logic error to handle is_detecting return by
	find_node_blk_fast().
v5 -> v6 : Simplify the code by removing unnecessary retry logic.
v4 -> v5 : Use IS_INODE() to make the code more clear.
v3 -> v4 : Set c.bug_on with ASSERT_MSG() when issue is detected and fix
	it only if c.fix_on is 1.
v2 -> v3 : Write inode with write_inode() to avoid chksum being broken.
v1 -> v2 : Fix looped node chain directly after it is detected.
---
 fsck/mount.c | 132 ++++++++++++++++++++++++++++++++++++++++++++-------
 1 file changed, 114 insertions(+), 18 deletions(-)

diff --git a/fsck/mount.c b/fsck/mount.c
index 4c7488840c7c..d7fa81f61cb7 100644
--- a/fsck/mount.c
+++ b/fsck/mount.c
@@ -3518,22 +3518,90 @@ static void destroy_fsync_dnodes(struct list_head *head)
 		del_fsync_inode(entry);
 }
 
+static int find_node_blk_fast(struct f2fs_sb_info *sbi, block_t *blkaddr_fast,
+		struct f2fs_node *node_blk_fast, bool *is_detecting)
+{
+	int i, err;
+
+	for (i = 0; i < 2; i++) {
+		if (!f2fs_is_valid_blkaddr(sbi, *blkaddr_fast, META_POR)) {
+			*is_detecting = false;
+			return 0;
+		}
+
+		err = dev_read_block(node_blk_fast, *blkaddr_fast);
+		if (err)
+			return err;
+
+		if (!is_recoverable_dnode(sbi, node_blk_fast)) {
+			*is_detecting = false;
+			return 0;
+		}
+
+		*blkaddr_fast = next_blkaddr_of_node(node_blk_fast);
+	}
+
+	return 0;
+}
+
+static int loop_node_chain_fix(struct f2fs_sb_info *sbi,
+		block_t blkaddr_fast, struct f2fs_node *node_blk_fast,
+		block_t blkaddr, struct f2fs_node *node_blk)
+{
+	block_t blkaddr_entry, blkaddr_tmp;
+	int err;
+
+	/* find the entry point of the looped node chain */
+	while (blkaddr_fast != blkaddr) {
+		err = dev_read_block(node_blk_fast, blkaddr_fast);
+		if (err)
+			return err;
+		blkaddr_fast = next_blkaddr_of_node(node_blk_fast);
+
+		err = dev_read_block(node_blk, blkaddr);
+		if (err)
+			return err;
+		blkaddr = next_blkaddr_of_node(node_blk);
+	}
+	blkaddr_entry = blkaddr;
+
+	/* find the last node of the chain */
+	do {
+		blkaddr_tmp = blkaddr;
+		err = dev_read_block(node_blk, blkaddr);
+		if (err)
+			return err;
+		blkaddr = next_blkaddr_of_node(node_blk);
+	} while (blkaddr != blkaddr_entry);
+
+	/* fix the blkaddr of last node with NULL_ADDR. */
+	node_blk->footer.next_blkaddr = NULL_ADDR;
+	if (IS_INODE(node_blk))
+		err = write_inode(node_blk, blkaddr_tmp);
+	else
+		err = dev_write_block(node_blk, blkaddr_tmp);
+	if (!err)
+		FIX_MSG("Fix looped node chain on blkaddr %u\n",
+				blkaddr_tmp);
+	return err;
+}
+
 static int find_fsync_inode(struct f2fs_sb_info *sbi, struct list_head *head)
 {
 	struct curseg_info *curseg;
-	struct f2fs_node *node_blk;
-	block_t blkaddr;
-	unsigned int loop_cnt = 0;
-	unsigned int free_blocks = MAIN_SEGS(sbi) * sbi->blocks_per_seg -
-						sbi->total_valid_block_count;
+	struct f2fs_node *node_blk, *node_blk_fast;
+	block_t blkaddr, blkaddr_fast;
+	bool is_detecting = true;
 	int err = 0;
 
+	node_blk = calloc(F2FS_BLKSIZE, 1);
+	node_blk_fast = calloc(F2FS_BLKSIZE, 1);
+	ASSERT(node_blk && node_blk_fast);
+
 	/* get node pages in the current segment */
 	curseg = CURSEG_I(sbi, CURSEG_WARM_NODE);
 	blkaddr = NEXT_FREE_BLKADDR(sbi, curseg);
-
-	node_blk = calloc(F2FS_BLKSIZE, 1);
-	ASSERT(node_blk);
+	blkaddr_fast = blkaddr;
 
 	while (1) {
 		struct fsync_inode_entry *entry;
@@ -3564,19 +3632,47 @@ static int find_fsync_inode(struct f2fs_sb_info *sbi, struct list_head *head)
 		if (IS_INODE(node_blk) && is_dent_dnode(node_blk))
 			entry->last_dentry = blkaddr;
 next:
-		/* sanity check in order to detect looped node chain */
-		if (++loop_cnt >= free_blocks ||
-			blkaddr == next_blkaddr_of_node(node_blk)) {
-			MSG(0, "\tdetect looped node chain, blkaddr:%u, next:%u\n",
-				    blkaddr,
-				    next_blkaddr_of_node(node_blk));
-			err = -1;
-			break;
-		}
-
 		blkaddr = next_blkaddr_of_node(node_blk);
+
+		/* sanity check to detect looped node chain with Floyd's cycle
+		 * detection algorithm
+		 */
+		if (is_detecting) {
+			err = find_node_blk_fast(sbi, &blkaddr_fast,
+					node_blk_fast, &is_detecting);
+			if (err)
+				break;
+
+			if (!is_detecting)
+				continue;
+
+			if (blkaddr_fast != blkaddr)
+				continue;
+
+			ASSERT_MSG("\tdetect looped node chain, blkaddr:%u\n",
+					blkaddr);
+
+			if (!c.fix_on) {
+				err = -1;
+				break;
+			}
+
+			err = loop_node_chain_fix(sbi,
+					NEXT_FREE_BLKADDR(sbi, curseg),
+					node_blk_fast, blkaddr, node_blk);
+			if (err)
+				break;
+
+			/* Since we call get_fsync_inode() to ensure there are
+			 * no duplicate inodes in the inode_list even if there
+			 * are duplicate blkaddr, we can continue running
+			 * after fixing the looped node chain.
+			 */
+			is_detecting = false;
+		}
 	}
 
+	free(node_blk_fast);
 	free(node_blk);
 	return err;
 }
-- 
2.25.1



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
