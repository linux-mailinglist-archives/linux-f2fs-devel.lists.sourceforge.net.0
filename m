Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 3FD5565D14E
	for <lists+linux-f2fs-devel@lfdr.de>; Wed,  4 Jan 2023 12:22:46 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1pD1r1-0000uz-9H;
	Wed, 04 Jan 2023 11:22:43 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <frank.li@vivo.com>) id 1pD1qy-0000up-7u
 for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 04 Jan 2023 11:22:40 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=MIME-Version:Content-Type:Content-Transfer-Encoding
 :References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=aTwZm2+h36fEdJFVdOIECscrmn5oM/ndZ/c6/wSyopw=; b=lkD+C7xZFfuIKs64/UyRaszrrk
 VrLRulFSCRQrzcMH697g7wHXdZSnWGsyarNgmEnkgP3+6rgCKru4ai5MvnZGpWmT+GnqWmLHY8oT/
 kOGyXEWe0cixFGNDMTXkgE8n4xJ4XsVSA4hCxdDcpsuUc7CMfZXOdsGXWnZl9Y+hxTl8=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=MIME-Version:Content-Type:Content-Transfer-Encoding:References:
 In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=aTwZm2+h36fEdJFVdOIECscrmn5oM/ndZ/c6/wSyopw=; b=gZCwW+i0hUGIYSc+EmipMniBOM
 U5VhCG1epho5LSF1QdCtyOAdEt4xW02k1UYwGqBNVlmDbM92/l+07p0NPqxLF0Y34IIBwPHoc7e42
 rgrRj8+xPAQKSvOFQqgfqvYkkJM/2T2bcs8nwVzcyQ/WzFt/H+ZMWOJEVC2cobs5fc90=;
Received: from mail-sgaapc01on2121.outbound.protection.outlook.com
 ([40.107.215.121] helo=APC01-SG2-obe.outbound.protection.outlook.com)
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1pD1qx-004Li3-Ii for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 04 Jan 2023 11:22:40 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=iU2qA4BZGeMWZ1gWC9PlU7x6QYD5Y0lj78Bru1q/mkKESwRVx6Fjv+11pnq6ON/TQ+ZE/73bP4LBAMy4hhCasUbvtu0H9u/99b2oOOjf/9ica7fNfKxS4+7hURbvsmeUFJrsKXPP176vCB4a7LWGCaajOJguRvcrDBsXoqmTLEw0OjqaQrLmIOlxIUrGOP8N7IUPhUVoRxPIfX/v8rPEzE35n/oC1d9Nv+MZmZ3rcbaR/wQQdV+PhlXcdX6Oq31QBdAC1AJBBnRhYrwgaboHCqa0Swr9lcPRUtC7/b77VR9EWwcBLPzfMIg2sqjQcHYjMofgvt3XkvyAdtML5loIJw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=aTwZm2+h36fEdJFVdOIECscrmn5oM/ndZ/c6/wSyopw=;
 b=k94Fc4xCkIbKCtd6hxAtx9IjtE5akF+FUI+rZ+DmQ07tjhZI9LsR2g+BO/GKFl0UExW+eLGmFWIjerL+PFbAn0uUFBUtAfpCT0SnzjmQG+Ar7gPAOXhD4dXkN+McU0Zotz33wfjBThW1hfn1SjP0PiLkzKqAo3tIrt76Ek6ByLX1GeZKyCBEZGkF0pBuPhL0kGJ6IkO9TzAdlpoaRzvbFLe5rajt2hjDbUeQPMbwx32v0FS/2VP+SDTacXdHgJn9MhdFiqi7DG3N7LeyPldnevESTgmXQRWKtpf4k3beIEGOSLxv/fyTXt/zP/8xOofYqCOEJPx78NL4Z/c3GgNw3w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vivo.com; dmarc=pass action=none header.from=vivo.com;
 dkim=pass header.d=vivo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vivo.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=aTwZm2+h36fEdJFVdOIECscrmn5oM/ndZ/c6/wSyopw=;
 b=dRe38ct97em4M7l0cfgrb4NGo1inpUVTioAtTYt0poavt8mqFf3fRTAvEpQEoZvdF6SzRuB+JQjq4nqNxA/hV5cK3jzqypCs+s+vI1LaDdBvZ1g+GZH5rd8ORQd01bZO1m/+9mi8egm28TCOdMphi19lKma/Yg6vMr0jcIq1RuZ6mEEP9OGeAUNaD65Yu12HwFfv4T4xYbDrtyY20y/jU0NcQzLLIqGelpqszqqAMgnn0aX2bv1QWAmbx80hf0s0eHFPWjqbmN2TQJNNDtvbOf/rm9ndy6CmS3oOC/I4eJpBxVRp22QiJilItHst90rWnJzrFjuIeXNe7oT/zvqH6g==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=vivo.com;
Received: from SEZPR06MB5269.apcprd06.prod.outlook.com (2603:1096:101:78::6)
 by TYZPR06MB5844.apcprd06.prod.outlook.com (2603:1096:400:284::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5944.19; Wed, 4 Jan
 2023 11:22:22 +0000
Received: from SEZPR06MB5269.apcprd06.prod.outlook.com
 ([fe80::7969:5a45:8509:7d80]) by SEZPR06MB5269.apcprd06.prod.outlook.com
 ([fe80::7969:5a45:8509:7d80%4]) with mapi id 15.20.5944.019; Wed, 4 Jan 2023
 11:22:22 +0000
To: jaegeuk@kernel.org,
	chao@kernel.org
Date: Wed,  4 Jan 2023 19:21:58 +0800
Message-Id: <20230104112158.15844-4-frank.li@vivo.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20230104112158.15844-1-frank.li@vivo.com>
References: <20230104112158.15844-1-frank.li@vivo.com>
X-ClientProxiedBy: SI1PR02CA0002.apcprd02.prod.outlook.com
 (2603:1096:4:1f7::16) To SEZPR06MB5269.apcprd06.prod.outlook.com
 (2603:1096:101:78::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SEZPR06MB5269:EE_|TYZPR06MB5844:EE_
X-MS-Office365-Filtering-Correlation-Id: d24588b3-2ed3-4492-1f40-08daee45f30a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: mp9fTtMY6lu5xh2d7fk5cInns8XG51nVJDTyOVx88LkARXBHvqZ+rge5AtPfKc3V/myLibbnzYVNAsHCwMeE6lTq9+Mud761x9pE+AS4t0OE4xx040ZtcZUPWKsEG05Zq/ax7yzAzK30I1zRC+SoxABftJfYpr9BXx/bFBzPp17ssI7C+fiH74uErirnME9HbAnBmTVbe9JPDUpUfuPDPwoBxiE/yuDdcCxwjo1AB+s9H4T83khFrjypnhF9MTyNdig4enAV9GHRvtTa9/gapm40TjaiCt2AbF1J1DdYwLZDVnOmz3G0vvGRO4pylmwSvN2r2TTuNPdL6BKu7OKE2GFj1iWqTs7X1caS9VRpZUPFMcV9SVi0HxfT1d6TjP9wV3AgE7Km+v3B4ELdz1QCP8k4fuUENMSSuvDPF1b8Ui3Yo5YobeduwTCeXNCnF5WaFKrUfwrpUK5DJUiGqKZKQvxlft3O+9FwqGTeJbGsFuG28MDsgEPHXjGST167pY5CbNT/GWNpHSqcZbxtY/FWbZxJch/4DBmfqNRwdAAm99TpoFbJmtHaZVSXu8X+Heau1yPbvTFdI2qYBX6bU+kHIdt8zh3ZysqqQ0vDsQZU7Tbt+RIv36Gflw6VKraiTBzYC0ZL/LWwNBC71frxV9Kh7HHQKrjiQ8nzxgIIZhsHa3rzGA88LjvpBJnPaq+hvqyU
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SEZPR06MB5269.apcprd06.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(4636009)(376002)(346002)(366004)(39860400002)(396003)(136003)(451199015)(2616005)(1076003)(83380400001)(186003)(26005)(6512007)(86362001)(36756003)(38100700002)(38350700002)(2906002)(5660300002)(316002)(8676002)(66556008)(66476007)(66946007)(4326008)(8936002)(107886003)(6666004)(41300700001)(6506007)(478600001)(52116002)(6486002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?A44h1MyPUepfoCn29VAkrq/QRoPbNwNmcpQR2JfHYWcLs23B63rPsuTnE5CS?=
 =?us-ascii?Q?t0YQPjAomEt+cd5thxOjcDBT2HZ9kzIFCSX6O16t9SMliqS4ufAtfE+ePuoS?=
 =?us-ascii?Q?bjO6iXFoCoFMM5i4mLshct5leppuweCQh7SDcIUnUJ0V1rYTxDMyPHUsO6VE?=
 =?us-ascii?Q?1TD0pE4fD+Liosln4YtmnV/tCqEB/Hc4TY27iaCbp71WBo2KYHQTd0GpxF7j?=
 =?us-ascii?Q?2ZKMrlJswzPBXMDVheyRcvpzQdOFcfX8S/v5zC/aQdkbyTiqO0cU60oZECAO?=
 =?us-ascii?Q?C+JFvTe78XJfNKwh+qdk70jiQWLRAH13m1Dw7EIOE56Se/EYPQDl+K1i3IQb?=
 =?us-ascii?Q?XGqvMTibufwEVSINjta150PoKtLSUoANP5KZ/jjqCKU7/g1WMhgiDZebQ1AF?=
 =?us-ascii?Q?z0fiUm/Ao3zN90Iey+ZYj9iJ2NjqqpgTUnq/Dv5MRRYrWFcm4BzZvar1DDDQ?=
 =?us-ascii?Q?2yFZaMrKpJsAcTolCeWb0wvL4S/SGGShIvxUX1czZSaxIpqUn+a2udn2aS68?=
 =?us-ascii?Q?83w011PWTwv92ma1KvMKjB1x7DEd7FZBTGjnfiAbBmDd8DwlXMuHPTUoQ0S4?=
 =?us-ascii?Q?1zD7t2xTHLg95opAufMwyXnsHIpuuCTHEZodbmC7HkuHjQKk+EyVxSMjiHxn?=
 =?us-ascii?Q?mAI5aZFvh6mtE/EeodUN/NH2Dylx/zov04WNEq2VT4lyIoeKaJcBA0ozsK4K?=
 =?us-ascii?Q?64r23Y59GGTiXszQd3GePQ0m6lfK7YgYYIoG9mtoOHY+4S+Qvq52Ik5LeH0a?=
 =?us-ascii?Q?OepG/qVPcDG32eAA+stou7I9wDMuftaDRLTkhaqdg33kbeAyRAg4sMGKb6x3?=
 =?us-ascii?Q?oQV5sO15oXQ1XKx7bHEj76dyUTQ6re1rzqRPi+x71IFPqOUpxiysU5M3Jmcj?=
 =?us-ascii?Q?bVy++ftJ9D79oirVR4y8D2/mnpJxAgsnLWwpM7ub77DVJxcA7tcGSyGM3PkM?=
 =?us-ascii?Q?ielaE30lYamCsCEkkAwN7MaqOZS6vEh29P43jr0FcW+XKJihNp2WHvlvxOmR?=
 =?us-ascii?Q?xB3CnNUU5aezOAdxAnpeiLd00/vnZRNACcN+ZdDcp4txhvkcmEI4V9caG6IH?=
 =?us-ascii?Q?sEGlybPAQ2kB2OLfHRd42+mJn3tZij53EYn6ijQOA5HWJ+zfIw5b3np/8mEG?=
 =?us-ascii?Q?fP291OveqoBKpdO8EO3+mdNh6T54xfCeKVqJlx4ILtZXskhYiUO+vNYGIkSl?=
 =?us-ascii?Q?zAzfTH82hc054FmbPsIQcYkYULrc4RyDW4lunm95AVczuo2EqUnR6SFQ4/ed?=
 =?us-ascii?Q?9LRNfhillzZ87osvifiSX6MwZTpaJW46sNgTx3Es2mFpbF+Bh6I6o3i8UVyz?=
 =?us-ascii?Q?XzxOSoE77uiTbdk+olr/0mvvWwgs4YwKC7GNKbgjFxqGvcQw4wajrkziRDLo?=
 =?us-ascii?Q?m2Vh/li51YqTgLQ/oFNvruMfNBr+SsDbQBa+RErApzG2l6hXmcAm3T40pSq7?=
 =?us-ascii?Q?tJZw33EdDNyzngc8my44lWkuKADfLM4bacTY7lVCxnkWawMTmHU3rqMaRp2f?=
 =?us-ascii?Q?PBO9xksWY2yv4Bw8GCXat107jFXK7jYqyR4kXqvuNt0LB8XsZrZS6mT2YZrL?=
 =?us-ascii?Q?LJgFwW6USpwIqFCxiGk5GkBu3WrvJhFRaCgoV/+L?=
X-OriginatorOrg: vivo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d24588b3-2ed3-4492-1f40-08daee45f30a
X-MS-Exchange-CrossTenant-AuthSource: SEZPR06MB5269.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Jan 2023 11:22:22.5746 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 923e42dc-48d5-4cbe-b582-1a797a6412ed
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Sp8VHFMUzicHRKoUzKuHb+Df9il9SOe9p9WBNmpyHwtKspsfohfcpsoqyxKxheL+bVkhq6bK9xo3ff7bbyKMyA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYZPR06MB5844
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: The contents stored in the rw_iostat and prev_rw_iostat
 arrays
 do not quite match the meaning of the names. In fact, array storage is not
 only read, write io, but also discard and flush. In addition, [...] 
 Content analysis details:   (-0.2 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
 no trust [40.107.215.121 listed in list.dnswl.org]
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [40.107.215.121 listed in wl.mailspike.net]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.0 SPF_HELO_PASS          SPF: HELO matches SPF record
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
X-Headers-End: 1pD1qx-004Li3-Ii
Subject: [f2fs-dev] [PATCH 4/4] f2fs: rename rw_iostat to iostat_bytes
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

The contents stored in the rw_iostat and prev_rw_iostat arrays do not
quite match the meaning of the names. In fact, array storage is not
only read, write io, but also discard and flush. In addition, in order
to better distinguish it from the iostat_count array, it is more accurate
to say that io bytes are stored in it. Also, the FS_DISCARD and FS_FLUSH_IO
names are less harmonious than others. Let's change to new names.

Signed-off-by: Yangtao Li <frank.li@vivo.com>
---
 fs/f2fs/f2fs.h              |  8 ++++----
 fs/f2fs/iostat.c            | 20 ++++++++++----------
 fs/f2fs/segment.c           |  4 ++--
 include/trace/events/f2fs.h |  2 +-
 4 files changed, 17 insertions(+), 17 deletions(-)

diff --git a/fs/f2fs/f2fs.h b/fs/f2fs/f2fs.h
index 0a24447472db..331c330ea31d 100644
--- a/fs/f2fs/f2fs.h
+++ b/fs/f2fs/f2fs.h
@@ -1191,8 +1191,8 @@ enum iostat_type {
 	FS_META_READ_IO,		/* meta read IOs */
 
 	/* other */
-	FS_DISCARD,			/* discard */
-	FS_FLUSH,			/* flush */
+	FS_DISCARD_IO,			/* discard */
+	FS_FLUSH_IO,			/* flush */
 	NR_IO_TYPE,
 };
 
@@ -1856,8 +1856,8 @@ struct f2fs_sb_info {
 	/* For app/fs IO statistics */
 	spinlock_t iostat_lock;
 	unsigned long long iostat_count[NR_IO_TYPE];
-	unsigned long long rw_iostat[NR_IO_TYPE];
-	unsigned long long prev_rw_iostat[NR_IO_TYPE];
+	unsigned long long iostat_bytes[NR_IO_TYPE];
+	unsigned long long prev_iostat_bytes[NR_IO_TYPE];
 	bool iostat_enable;
 	unsigned long iostat_next_period;
 	unsigned int iostat_period_ms;
diff --git a/fs/f2fs/iostat.c b/fs/f2fs/iostat.c
index 991605fcfe0b..59c72f92191a 100644
--- a/fs/f2fs/iostat.c
+++ b/fs/f2fs/iostat.c
@@ -21,13 +21,13 @@ static mempool_t *bio_iostat_ctx_pool;
 static inline unsigned long long iostat_get_avg_bytes(struct f2fs_sb_info *sbi,
 	enum iostat_type type)
 {
-	return sbi->iostat_count[type] ? div64_u64(sbi->rw_iostat[type],
+	return sbi->iostat_count[type] ? div64_u64(sbi->iostat_bytes[type],
 		sbi->iostat_count[type]) : 0;
 }
 
 #define IOSTAT_INFO_SHOW(name, type)					\
 	seq_printf(seq, "%-23s %-16llu %-16llu %-16llu\n",	\
-			name":", sbi->rw_iostat[type],				\
+			name":", sbi->iostat_bytes[type],			\
 			sbi->iostat_count[type],					\
 			iostat_get_avg_bytes(sbi, type))			\
 
@@ -79,8 +79,8 @@ int __maybe_unused iostat_info_seq_show(struct seq_file *seq, void *offset)
 
 	/* print other IOs */
 	seq_puts(seq, "[OTHER]\n");
-	IOSTAT_INFO_SHOW("fs discard", FS_DISCARD);
-	IOSTAT_INFO_SHOW("fs flush", FS_FLUSH);
+	IOSTAT_INFO_SHOW("fs discard", FS_DISCARD_IO);
+	IOSTAT_INFO_SHOW("fs flush", FS_FLUSH_IO);
 
 	return 0;
 }
@@ -129,9 +129,9 @@ static inline void f2fs_record_iostat(struct f2fs_sb_info *sbi)
 				msecs_to_jiffies(sbi->iostat_period_ms);
 
 	for (i = 0; i < NR_IO_TYPE; i++) {
-		iostat_diff[i] = sbi->rw_iostat[i] -
-				sbi->prev_rw_iostat[i];
-		sbi->prev_rw_iostat[i] = sbi->rw_iostat[i];
+		iostat_diff[i] = sbi->iostat_bytes[i] -
+				sbi->prev_iostat_bytes[i];
+		sbi->prev_iostat_bytes[i] = sbi->iostat_bytes[i];
 	}
 	spin_unlock_irqrestore(&sbi->iostat_lock, flags);
 
@@ -148,8 +148,8 @@ void f2fs_reset_iostat(struct f2fs_sb_info *sbi)
 	spin_lock_irq(&sbi->iostat_lock);
 	for (i = 0; i < NR_IO_TYPE; i++) {
 		sbi->iostat_count[i] = 0;
-		sbi->rw_iostat[i] = 0;
-		sbi->prev_rw_iostat[i] = 0;
+		sbi->iostat_bytes[i] = 0;
+		sbi->prev_iostat_bytes[i] = 0;
 	}
 	spin_unlock_irq(&sbi->iostat_lock);
 
@@ -161,7 +161,7 @@ void f2fs_reset_iostat(struct f2fs_sb_info *sbi)
 static inline void __f2fs_update_iostat(struct f2fs_sb_info *sbi,
 			enum iostat_type type, unsigned long long io_bytes)
 {
-	sbi->rw_iostat[type] += io_bytes;
+	sbi->iostat_bytes[type] += io_bytes;
 	sbi->iostat_count[type]++;
 }
 
diff --git a/fs/f2fs/segment.c b/fs/f2fs/segment.c
index 34e9dc4df5bb..38bae9107a3b 100644
--- a/fs/f2fs/segment.c
+++ b/fs/f2fs/segment.c
@@ -504,7 +504,7 @@ static int __submit_flush_wait(struct f2fs_sb_info *sbi,
 {
 	int ret = blkdev_issue_flush(bdev);
 	if (!ret)
-		f2fs_update_iostat(sbi, NULL, FS_FLUSH, 0);
+		f2fs_update_iostat(sbi, NULL, FS_FLUSH_IO, 0);
 
 	trace_f2fs_issue_flush(bdev, test_opt(sbi, NOBARRIER),
 				test_opt(sbi, FLUSH_MERGE), ret);
@@ -1184,7 +1184,7 @@ static int __submit_discard_cmd(struct f2fs_sb_info *sbi,
 
 		atomic_inc(&dcc->issued_discard);
 
-		f2fs_update_iostat(sbi, NULL, FS_DISCARD, len * F2FS_BLKSIZE);
+		f2fs_update_iostat(sbi, NULL, FS_DISCARD_IO, len * F2FS_BLKSIZE);
 
 		lstart += len;
 		start += len;
diff --git a/include/trace/events/f2fs.h b/include/trace/events/f2fs.h
index 9183a0a11e26..3852085198fb 100644
--- a/include/trace/events/f2fs.h
+++ b/include/trace/events/f2fs.h
@@ -1972,7 +1972,7 @@ TRACE_EVENT(f2fs_iostat,
 		__entry->fs_cdrio	= iostat[FS_CDATA_READ_IO];
 		__entry->fs_nrio	= iostat[FS_NODE_READ_IO];
 		__entry->fs_mrio	= iostat[FS_META_READ_IO];
-		__entry->fs_discard	= iostat[FS_DISCARD];
+		__entry->fs_discard	= iostat[FS_DISCARD_IO];
 	),
 
 	TP_printk("dev = (%d,%d), "
-- 
2.25.1



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
