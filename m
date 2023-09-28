Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 850707B16EA
	for <lists+linux-f2fs-devel@lfdr.de>; Thu, 28 Sep 2023 11:13:32 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-3.v29.lw.sourceforge.com)
	by sfs-ml-3.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1qln5Q-0006Cs-P0;
	Thu, 28 Sep 2023 09:13:31 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-3.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <bo.wu@vivo.com>) id 1qln5P-0006Cl-EW
 for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 28 Sep 2023 09:13:30 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=MIME-Version:Content-Type:Content-Transfer-Encoding
 :References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=p3qYDJ0CPf3IYOOvsJ+LMmfAce2ZiCcVF2trmbUYWYo=; b=G/KLhXsqytFhAYrb46eOC/aLsV
 9rPWkZazGlDXrcmFMvuWIv8QusOqXy1JOL/kNE50PDiGZS0NM7RZ+lOdCkL1UJoZ9AWFEa7IO3nCn
 IozKRFKOsjCt0It5XC0ldCSSSegHhAqFLUNtsIBfwArn+ShtZHZS+z0Mo8vKseKqXkWg=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=MIME-Version:Content-Type:Content-Transfer-Encoding:References:
 In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=p3qYDJ0CPf3IYOOvsJ+LMmfAce2ZiCcVF2trmbUYWYo=; b=OTY+xnz6EoXPeiWI1sNAOcZEHQ
 n6nAxk0vlDMMFex6uTZtMY/499hJhKr4BfFLpJCpEVsMgmjeXC4HdB4pg6nYOFD5apYJ9yc9Mp1US
 ItbRQtCHvSHvO8j1dxi7qA+Lak7GFQsQvocF+6vhNor7cl3xyYteNReGUoXI/BdodCHg=;
Received: from mail-psaapc01on2099.outbound.protection.outlook.com
 ([40.107.255.99] helo=APC01-PSA-obe.outbound.protection.outlook.com)
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1qln5M-00050A-K9 for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 28 Sep 2023 09:13:29 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=DQtH6iCzXYRKO0nEuahrjw76Czw8U1cfO3/eNMQ3zwUflGjcY2ufuDl0qZC9zY8KvsjlPWc+pqIoYaoS2L+dDRtkEiRrGt1Ars9mbxbbWpFMoC5qYmH5wne6fTMsnHu7KVbKbHSfKtpj1ttxVmTaOyKE5OM3tCAsvuT+LvtprSBBJ/7/iYDU7B1jqw4fi5cTbjyY9qVZkv8UFS0OL19Es1YyD/8GoyZz6IFazoYxbyl+ldJlyQpND4bpQ94Ddlsh//VcLgWrS1MCTNVDbW14Haz/Sx1cTKZ3/Vy8+1e2AoMNBNWdrRC204RTRFODJsvzus0MwFRut7+kxpM/r7DqPA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=p3qYDJ0CPf3IYOOvsJ+LMmfAce2ZiCcVF2trmbUYWYo=;
 b=l5GbEVGXGL5M9jbTUld0T0MHvSYJprUYX9bmS8n0jbP+B0a6mXmcUgVs5nSRThPrYxebgL4CSgg9xR+S/c1C9k960bwV1Uu83V3jC8shMQDY0zesvgEGes8ifCMia1DE1qa8j0GAJCgxDMsXG9Ncu+RPmV1gZQ57zMSafqwNZbc31duUngzhX06IrsMXhcT4KM5DCHsOmmbxwhNOk5aEbSAKTsv82lYr+7PxBq2dnZPHJnhWoAJkBCZhTyExBzUFU/CNdYod9QOlJ7T/4ZdSg3d9Ji3JrSUrUKMjYitcszkK9WLYSD7cAuHXVnFmYHV1AMAQVRBxsRjFypMMto1W5w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vivo.com; dmarc=pass action=none header.from=vivo.com;
 dkim=pass header.d=vivo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vivo.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=p3qYDJ0CPf3IYOOvsJ+LMmfAce2ZiCcVF2trmbUYWYo=;
 b=nY0TCQqKwfdJj5nQOvtVMgOoA3CNvPxVjwmhcBTyvK5dT8uvrn6h7tC91SytYnq7gMT7hixi7t+ohB4YGJfZYCF4kUmyXgt7YZkcxgK8zOStIvOx5ZZV9psuERoNkwFBSFTcun8t0wBwxZdT+fkVT9/uu/uV+0vaneLyJq5zPVQyy9Q08k65r4iO1ZuYV1Gtgpp82dqs7t/+/ukENBqT4fXVg1/fLgqJ+hY6SYhxP75Xj4B6QAd22jffWOiTv3INCM5SIwiBeXuZEbEZynfMjNNqRtXxmoJANu69tnsMKpARDqv3kthssOrP0fGu7+i42jSZoiLC7ZAGnC3+I5nJ3w==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=vivo.com;
Received: from SL2PR06MB3017.apcprd06.prod.outlook.com (2603:1096:100:3a::16)
 by SEYPR06MB5867.apcprd06.prod.outlook.com (2603:1096:101:d0::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6813.28; Thu, 28 Sep
 2023 09:13:19 +0000
Received: from SL2PR06MB3017.apcprd06.prod.outlook.com
 ([fe80::e1e6:c2aa:6b5b:bc1c]) by SL2PR06MB3017.apcprd06.prod.outlook.com
 ([fe80::e1e6:c2aa:6b5b:bc1c%6]) with mapi id 15.20.6813.027; Thu, 28 Sep 2023
 09:13:19 +0000
To: Jaegeuk Kim <jaegeuk@kernel.org>,
	Chao Yu <chao@kernel.org>
Date: Thu, 28 Sep 2023 03:20:51 -0600
Message-Id: <188b05d1764d1ba48f9c704ff28df853f3094f67.1695890686.git.bo.wu@vivo.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1695890686.git.bo.wu@vivo.com>
References: <cover.1695890686.git.bo.wu@vivo.com>
X-ClientProxiedBy: SG3P274CA0020.SGPP274.PROD.OUTLOOK.COM (2603:1096:4:be::32)
 To SL2PR06MB3017.apcprd06.prod.outlook.com
 (2603:1096:100:3a::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SL2PR06MB3017:EE_|SEYPR06MB5867:EE_
X-MS-Office365-Filtering-Correlation-Id: ef1e40fa-4ed1-4d8c-516d-08dbc0032853
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: IjpqzL790SUgxGnobOdklGbcM5FvItWPbPCbYzqoKzgX09/Ng0F8ws4356NrtSSUBJDIR6ugM0Cd+agFukcXHHGkZF5Zhk7q08UBjL3/y1aeECROd4Q1dtd6OhTFsgyot9YCCXkTpjoC5fjBWFfGwyT9orEI+4xeDAiiZP0wrQgho/Gv9fxUxBo5IIj/zbIkIIphhN3B2458TuqV81Dtkotbtddspu0gIQLF4mYPvVpX6cwGlS9v4/y5EblaC+NZSxPJax9cRe4MmmBRghPj4JSQsK+9rIGXYWZzULm2we8KkXrAU5i1Y1Qw5CbZHpm9lse0oM7RU10YcgF64e78Levwt/G1J1A0fRy0y0ALGZ8M1Dm+vixKxfNt9OQofvLRpFQfQMfxEsl3dJBlOQKTzk+Yua4SS2usPdDBnoidHzJVUR4Vdh0Q44eeyHbHn1jCwtqta5SVmeTi9WSGFOdbPYZs7svokmejbPZdlbYZbNVYk75iSKEsu7GqaHzgX/wcWuYaQeVwlRODzYDGV3vw8gQKOjkxGrxPigPGlgixu6SKpc5/8lCCYaDDtI0H1nPKOYAvBKHhadKGXgVrTnasOKZkcMAKeKopxaRAHIyzvRyCVW9EP1mefzd9P7MS9zqn
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SL2PR06MB3017.apcprd06.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(396003)(136003)(39860400002)(346002)(366004)(376002)(230922051799003)(64100799003)(1800799009)(186009)(451199024)(2616005)(2906002)(6506007)(52116002)(38350700002)(38100700002)(86362001)(6486002)(110136005)(6512007)(54906003)(83380400001)(26005)(478600001)(316002)(4326008)(107886003)(5660300002)(66556008)(66476007)(36756003)(8676002)(8936002)(41300700001)(6666004)(66946007);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?hWCnAU7NzJfIng46OdW4vVju+1batKJ0lvlWQulsZVNCiuc23w/hKuKa+R1A?=
 =?us-ascii?Q?I6UgjOwk438KprF0V1sevrIMTKrcgjygRxtuShcXByYkmnN2k7XSy9tuwT4m?=
 =?us-ascii?Q?E5xm6xV9zih+4z6SYzR6Xi9Swsf041i0QYYj32n65qg7ZgOIv4gixBxLLzEA?=
 =?us-ascii?Q?O48ifFcROmGCadWH7O8gAlxx/B9sBeYuRid9qqhyLStFc0XqJFMoP5POvWl7?=
 =?us-ascii?Q?Z2lfndnhte+oTJKzImorUjxMfHWZ/DpJyNZBpBp1BA/qewwCya9sj3MXkXu9?=
 =?us-ascii?Q?OJQ7fdR/JA9rDK7GW8ozWjp5oRk4n2gprgdiWCrq/UWjK9mRFEhGkaMLnBqN?=
 =?us-ascii?Q?cC9h21Ih/en7U4NpSnujhfZJ+LC5pXYuomcCgViFBRaJtZdjbGu1lm71lEBW?=
 =?us-ascii?Q?he7W1RfpEN7+w4QVcCB8R8HtEqgXYqyLPgfza8bGB9iB2b2zsEEaebJOdA5q?=
 =?us-ascii?Q?LQ+lcOUl7PO1wpiLqpLHVru+8VIDbjqmwErLqeWQcv8ARFWXYrRm9CXasnIR?=
 =?us-ascii?Q?ChN2gTDLDb/V0F2SUXBUQQC/nEl5lFINcPN64scSZpa9BfWWV68cuhTDp5ny?=
 =?us-ascii?Q?qYwN42hwjm3bXbpi18Bm+49Or7O+AVt3C2AqQZcd81uChmc9eJtM8v77ZOMx?=
 =?us-ascii?Q?4Ew4OSkaqs3DJXdWpnJmgK6gqVLCAbtVdJAD64lXUmoxh5hm2xtG6KUgnefx?=
 =?us-ascii?Q?S8uklkJJ0qctuKl/XbnQNaT1ZLDZe7QhfmNLBeGuHKjBU1k1pHPaBsnpZK4x?=
 =?us-ascii?Q?2EibfbLdIB31nr7fFfBLTitgRXX1QsxrOsCU82Ucw6OUYQ5YqyDzB+XXqODH?=
 =?us-ascii?Q?CtQReSMdVS9+CJA0dW4giw+csDHTLZyoAlZS56iNhLnQXbwbeHxJJS+KG8I9?=
 =?us-ascii?Q?OlXIMUcuw1+KcUnR74gQCjOzhH3I6B9fJbUFJJZ0tqhEFTX/lyMlDSo+QzeU?=
 =?us-ascii?Q?VvQE8nrDD0bYnLIh+vg7/AEAbRC9lbwEk6C/wJAbieweXym1Fs+0eR7w46Ht?=
 =?us-ascii?Q?izt5gAdIrViq7eEarhWXkjZs75ZM3u+SkYP90DplmroEO5xXjD5/4B782VFu?=
 =?us-ascii?Q?rAakuvx28hWImKy5V1uLC9Xz9F4DgHpgbHKFXz+DGjZy0EM64AscdQ50nJ4u?=
 =?us-ascii?Q?UkffopTaxMMdw+72H9V9rYb+L3GJcb+aaC5GzVjtxYP1lBU+CDyltF4z6cKr?=
 =?us-ascii?Q?ZqafBgm+N7DWjewvYAL7kij/XeU2WyCzv9p+tdQajEIVoqZkMEnYAzytcr/f?=
 =?us-ascii?Q?7VQXhdMh1JhXaTOw+IoFhs9GEd90wlkYNg75Sc/fccY656QpaxTx7DmJVo61?=
 =?us-ascii?Q?/unC5oYASIOiMPEC4VIAAvtNamWQAWZLqMe0wl6pbuC5PE4CoQJ9a4t+fatO?=
 =?us-ascii?Q?vk6m1RZ1LhzsMkI0/0GQHXyfAtD3DsQvTT+PNA+Uv/JIclp0ivZwoL31MtPO?=
 =?us-ascii?Q?DzojG0Doo5Kxjebeu05A115b1yJ885lYU1advDnHxqSzWSyAY3gr2PXP72mj?=
 =?us-ascii?Q?Wgwl4qU73315RgQjcgXH25AXWlhIlNvVGTqIUT0fCdgw2eTxXHFzaJrYbqc9?=
 =?us-ascii?Q?A9nxidQHFLASJLQ6c8lTiwcEcCsbf/iaaMTZveZv?=
X-OriginatorOrg: vivo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ef1e40fa-4ed1-4d8c-516d-08dbc0032853
X-MS-Exchange-CrossTenant-AuthSource: SL2PR06MB3017.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Sep 2023 09:13:19.8543 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 923e42dc-48d5-4cbe-b582-1a797a6412ed
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: y6ZhYeVakilDcM58w4JyeEp8GLFss7k2XI1fIwqYQ9kEwkhy+alS4WFnTRWpMMcOcmzTGluY4ut21ECO6CUfEg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SEYPR06MB5867
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: 'get_free_segments()' is implemented by traversing all
 segments
 to calculate the total free segments. It cosume much time. Every time when
 call 'find_next_free_block()' this calculation will do it again. So if we
 cache the free segments count, it will greatly improve performance of dfrag
 & resize & sload. --- fsck/f2fs.h [...] 
 Content analysis details:   (-0.2 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
 no trust [40.107.255.99 listed in list.dnswl.org]
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [40.107.255.99 listed in wl.mailspike.net]
 -0.0 SPF_HELO_PASS          SPF: HELO matches SPF record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
X-Headers-End: 1qln5M-00050A-K9
Subject: [f2fs-dev] [PATCH v2 3/3] f2fs-tools: cache free segments count to
 improve perfmance
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
From: Wu Bo via Linux-f2fs-devel <linux-f2fs-devel@lists.sourceforge.net>
Reply-To: Wu Bo <bo.wu@vivo.com>
Cc: Wu Bo <wubo.oduw@gmail.com>, Wu Bo <bo.wu@vivo.com>,
 linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

'get_free_segments()' is implemented by traversing all segments to
calculate the total free segments. It cosume much time.

Every time when call 'find_next_free_block()' this calculation will
do it again. So if we cache the free segments count, it will greatly
improve performance of dfrag & resize & sload.
---
 fsck/f2fs.h    | 1 +
 fsck/mount.c   | 9 +++++++--
 fsck/segment.c | 2 ++
 3 files changed, 10 insertions(+), 2 deletions(-)

diff --git a/fsck/f2fs.h b/fsck/f2fs.h
index e65644e..a7cdc4c 100644
--- a/fsck/f2fs.h
+++ b/fsck/f2fs.h
@@ -197,6 +197,7 @@ struct f2fs_sm_info {
 	unsigned int main_segments;
 	unsigned int reserved_segments;
 	unsigned int ovp_segments;
+	unsigned int free_segments;
 };
 
 struct f2fs_dentry_ptr {
diff --git a/fsck/mount.c b/fsck/mount.c
index 098e73d..0a37bc4 100644
--- a/fsck/mount.c
+++ b/fsck/mount.c
@@ -123,7 +123,7 @@ void update_free_segments(struct f2fs_sb_info *sbi)
 	if (c.dbg_lv)
 		return;
 
-	MSG(0, "\r [ %c ] Free segments: 0x%x", progress[i % 5], get_free_segments(sbi));
+	MSG(0, "\r [ %c ] Free segments: 0x%x", progress[i % 5], SM_I(sbi)->free_segments);
 	fflush(stdout);
 	i++;
 }
@@ -2430,6 +2430,10 @@ static int build_sit_entries(struct f2fs_sb_info *sbi)
 
 			check_block_count(sbi, segno, &sit);
 			seg_info_from_raw_sit(sbi, se, &sit);
+			if (se->valid_blocks == 0x0 &&
+				is_usable_seg(sbi, segno) &&
+				!IS_CUR_SEGNO(sbi, segno))
+				SM_I(sbi)->free_segments++;
 		}
 		start_blk += readed;
 	} while (start_blk < sit_blk_cnt);
@@ -2485,6 +2489,7 @@ static int early_build_segment_manager(struct f2fs_sb_info *sbi)
 	sm_info->ovp_segments = get_cp(overprov_segment_count);
 	sm_info->main_segments = get_sb(segment_count_main);
 	sm_info->ssa_blkaddr = get_sb(ssa_blkaddr);
+	sm_info->free_segments = 0;
 
 	if (build_sit_info(sbi) || build_curseg(sbi)) {
 		free(sm_info);
@@ -2806,7 +2811,7 @@ int find_next_free_block(struct f2fs_sb_info *sbi, u64 *to, int left,
 
 	if (*to > 0)
 		*to -= left;
-	if (get_free_segments(sbi) <= SM_I(sbi)->reserved_segments + 1)
+	if (SM_I(sbi)->free_segments <= SM_I(sbi)->reserved_segments + 1)
 		not_enough = 1;
 
 	while (*to >= SM_I(sbi)->main_blkaddr && *to < end_blkaddr) {
diff --git a/fsck/segment.c b/fsck/segment.c
index 0307bdd..1cb7d02 100644
--- a/fsck/segment.c
+++ b/fsck/segment.c
@@ -77,6 +77,8 @@ int reserve_new_block(struct f2fs_sb_info *sbi, block_t *to,
 	se = get_seg_entry(sbi, GET_SEGNO(sbi, blkaddr));
 	offset = OFFSET_IN_SEG(sbi, blkaddr);
 	se->type = type;
+	if (se->valid_blocks == 0)
+		SM_I(sbi)->free_segments--;
 	se->valid_blocks++;
 	f2fs_set_bit(offset, (char *)se->cur_valid_map);
 	if (need_fsync_data_record(sbi)) {
-- 
2.25.1



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
