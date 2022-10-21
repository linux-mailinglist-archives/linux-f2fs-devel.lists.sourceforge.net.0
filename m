Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 51DDD607B34
	for <lists+linux-f2fs-devel@lfdr.de>; Fri, 21 Oct 2022 17:39:06 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1olu6y-0007Fr-TM;
	Fri, 21 Oct 2022 15:39:04 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <frank.li@vivo.com>) id 1olu6u-0007FX-5v
 for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 21 Oct 2022 15:39:00 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=MIME-Version:Content-Type:Content-Transfer-Encoding
 :References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=NExT4FRkyZFUrxhZxtNCHOqS0EYUzyU7WXYao/CG5tY=; b=e7Tb9wKPZ3QBaiDlbmP/ExU2Oo
 nPTN2ZUcmKxe4C/QTHbfBD/Tzubdb4zi0opEPrCG176LdytibJbHcoKAZ1LiFzRFjeuMWKBTLGun7
 D38LUb9K3sRZwwGeBAM1pRO7MinlZXn9wnPqQHZccajWIiy9lWy9D4bbI/96RNbFrUvA=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=MIME-Version:Content-Type:Content-Transfer-Encoding:References:
 In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=NExT4FRkyZFUrxhZxtNCHOqS0EYUzyU7WXYao/CG5tY=; b=b0jQuh1ARVTD/Utk/eeqnFmnMM
 pHGIZ8P9sgV3C4HZUfvUWVrZZBTimQq+40jdI7cQsxC6Hwm0Y2nBDR9h11CNekbsAcaJzZWjgLszq
 QPDIK4eO8ydKRnNDn9ELK4mbXo6ZhUQgXw07Om070UmrvAZq8L6DZl6Nmi6puX9m1gpk=;
Received: from mail-psaapc01on2115.outbound.protection.outlook.com
 ([40.107.255.115] helo=APC01-PSA-obe.outbound.protection.outlook.com)
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1olu6p-000566-PX for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 21 Oct 2022 15:38:59 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Z0g2mhDDNBq7IzSoulfI3sgMqXs8NXzZCS11KzsY9zKl6fl3wax5N3G0MEA0tmAbDHjp/QqfkXlbdP1ANy4JMUcevYssysiFryZVioOzvaWWL/Scw50BRWG7j9/kqYz2eWDS65m52tjwdauQXq24jPz+ZmDa4saqO92pFCoeSmoQAqhkhCT/+Ub8pMhE7ZN98RDSr+caIpICA1/b/OEn85T9Q6Md+zU3KKCVlfaVwwxtHAGfH9e5OgmkvHT7+3+VScNHp87pZblVei/JLfgt/WOiXVt6+NibXSjP+ZOnVsK8TYJpaOWKj7qA5pBb9ghc0VDmGuwEPxy8B7ejHy4jaQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=NExT4FRkyZFUrxhZxtNCHOqS0EYUzyU7WXYao/CG5tY=;
 b=Sx5LN7QKB8LcumrEq9dnyBFZ6k0EEXR9ImmQQV9elNT0jh/51sQbaVQjsdK+c7Bb1LQCToB+3gMTw1kbvY3tZKejVBug/XlFkfSBNTxpJumwN5nNOooVSTshv0SHe5s2lliz2zo3tqZn/n5GS4MSAOsRcWBzdSoYdeKLhsrS6BFJ6OFqM7vqUPRmhuGvEiSm7Io/KyEkkSTfDMo6ZdP6wncU1CG8hllWuZoMiRbxP993dRqDpLLZH45873WOI54qTuJgVWqx1aO/4L5WwOMttcHnODz9YX0b/r17BUTOINJMvqxcxozxtfIpDZ53RijchXOxUDDuJGORIalwz+jv6Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vivo.com; dmarc=pass action=none header.from=vivo.com;
 dkim=pass header.d=vivo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vivo.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NExT4FRkyZFUrxhZxtNCHOqS0EYUzyU7WXYao/CG5tY=;
 b=h3bheJ8O46av3eTi09NvVm6kW5YS8qnHMhnC0N1B5CDWuw3k0sBw517savtmKD9ITVwueWnFqrKL2a8ltqS1mYG/6Tua/EGrSPmdASkQ9hWxYY4A/PPx5lwtKe+c53slCOtzma957ja+tv5mHLMwULFoPH5/3vQCKazoNdTDcyMD9zBetyos6D1UA+j1KR4l77y3d3TeGzwTA/vygSUG48fsv2XwYW9vUEqHHA6FidXjKcLHS2coPWcdTMN3ohHSldbCfzU846zf+HS41eMgYPmq7o/AT9OK4K8UG7aKJfE//35ZGi9ejUH6Kvio0QPNfAhYVI/MF1yarEyVRzbh0w==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=vivo.com;
Received: from SEZPR06MB5269.apcprd06.prod.outlook.com (2603:1096:101:78::6)
 by SEYPR06MB6035.apcprd06.prod.outlook.com (2603:1096:101:d9::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5723.34; Fri, 21 Oct
 2022 15:38:39 +0000
Received: from SEZPR06MB5269.apcprd06.prod.outlook.com
 ([fe80::c84b:5a6c:d66f:c0fd]) by SEZPR06MB5269.apcprd06.prod.outlook.com
 ([fe80::c84b:5a6c:d66f:c0fd%3]) with mapi id 15.20.5723.034; Fri, 21 Oct 2022
 15:38:39 +0000
To: jaegeuk@kernel.org,
	chao@kernel.org
Date: Fri, 21 Oct 2022 23:38:25 +0800
Message-Id: <20221021153825.79614-2-frank.li@vivo.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20221021153825.79614-1-frank.li@vivo.com>
References: <20221021153825.79614-1-frank.li@vivo.com>
X-ClientProxiedBy: SG2PR02CA0006.apcprd02.prod.outlook.com
 (2603:1096:3:17::18) To SEZPR06MB5269.apcprd06.prod.outlook.com
 (2603:1096:101:78::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SEZPR06MB5269:EE_|SEYPR06MB6035:EE_
X-MS-Office365-Filtering-Correlation-Id: be9bda02-b75a-4d61-82f2-08dab37a53af
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 8XVLlaKityQdEo5PXLw7W8/KYJIP3id1F+MeCCh6mS0HbwKh+ONCBJ4v1Tmfwgy3mDm1ZpH071ZfsAsNlZh2C0t2M+BopGJQPycQlVFxAhCFyJTp4R6NT6IS10P17F75Jy5phomEG/+3dVkzTIUoAX+i5TnIxLD0CE+XH8oQNH6juR5omLN/y2+70oiee2WNO9rUDb/kthTBPIjHu49zB/0068IYIHyih1I36q0N/x/mCy4bQiAtiX88bQfpJsbXKUElknwqBhzAcaC+hiYP+AdvN8k/lA5bSfsJPMKw6mDrSxHhqm+OZz6NofmrJwWrDJnpTNu+ONors0XZrJyg++WFnAlUpXH/BGRl2cnuX3UIbdYOe3a2do+JXpZJPKeUwvPAGOL08exB9DAQ46W7tqu3eaM3a6vDJHJ9zFXCfbHNCSwlw81O2ukqP0rKQN8qhR/poKbxdFfrXyLV6twOLXapyb+e/ctvVRGK55QYcdXsGR3mFYSNv7uKr+xOOBw8lx7yUuHHh9dUGyCmMpTNU+sZYXPxygZEDQIErlfqo5U+grIlY0b7Ht8ofAFLQYVOng69+nVO9ioNrHCfd2s+9fMoBwSXPI6Jk65jaY3V0DguWOd6m5bPAII79Q2nnOJgVWPVsSZAGN1xjDFF1/73D5DZTzjc2EzvOX1FV6ckHGf+Dhqb7Se6epdTo8wAm9nklrEGG5tkaJSvkZTGQoLsWIKYAWP8fdV8dDuaxj7yE5E9kDG7Mj/Sj5CwHTtsdbPmeAV7HhIx20VFDtd89wfPMA==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SEZPR06MB5269.apcprd06.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(4636009)(366004)(376002)(136003)(346002)(39860400002)(396003)(451199015)(26005)(2906002)(6512007)(8936002)(6506007)(1076003)(36756003)(38350700002)(2616005)(83380400001)(38100700002)(5660300002)(41300700001)(186003)(478600001)(6486002)(316002)(6666004)(107886003)(52116002)(66946007)(66556008)(66476007)(8676002)(86362001)(4326008);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?gqCjYoy/zu8y1U7AgYXMHJNt67nZnudb4RpAPKf4UHJVHE+2AbPNwVOKVPUL?=
 =?us-ascii?Q?whDhhMta2JyfFrdcclNgS+Rgys9gV/MZBDh5cKw7lqUOjiUpwRs3wMDWUMYc?=
 =?us-ascii?Q?XouQgzk3FtOujriDn8uZBwO6Rc3y5gdFnuD8+/wraw+FfvPgTR31QAIDtkvM?=
 =?us-ascii?Q?UKKQ8ZKnzJnr++DOZ539mjLg2WBdXHIB2JuGERf5iLpoDzTUHYBjjMaE65yQ?=
 =?us-ascii?Q?f9E0sqB2BZabg7xCejEKyx13vshDVQEjP07dsrTIVEEQPSd9lhOkYUVCNc+b?=
 =?us-ascii?Q?tiPS+C7BO3dwmUgDJVAkielji3mUPJgHvjhEaiVF2++kaPMJKSTXtSJyU5ic?=
 =?us-ascii?Q?filfAjAzeeSJai3+ZAYcKCxIaUPD3y7hz7MbHVSN9GSk01EDgfOiGVNIZeEA?=
 =?us-ascii?Q?1X8ExeVWpiOS87CIKzKVfk+20OrBu+oMt/1i73vK0e4ynoyERl+z5x/7IAhL?=
 =?us-ascii?Q?Bd39mdiT444Yg03NYJ9tH2BxuKUAIBQy7fh+gFmbDpjJBN+ZBTFA9KZq+Mdc?=
 =?us-ascii?Q?GGqvIgMkCDKgj84oiK9jTGfDlagIxtiIkdgABSjXrR1nBPrg6vhhLmlRiI9A?=
 =?us-ascii?Q?zzthe5SLELRrSGQdDbDGPJNeK2sgL7b7EFhFd5lm5NmOkUyrulZZXaQNjful?=
 =?us-ascii?Q?gvfGEwIbw04Ix3OKqhJBSTEYIEH1BgzyZ3d/Wp46wBUA7mA79lG5NHN0GYB+?=
 =?us-ascii?Q?pYTGgQzs+L82etNFL90gvXQDEFgChuQphPMffYs96tSgvjDpm1Qz6ki39eqq?=
 =?us-ascii?Q?q650irK30foD4bPl/vvn15FwB+Lt59jfHkxTteAdbFsZFN8T2WmUkjnXFy8u?=
 =?us-ascii?Q?Im6JdMwitNOIxUXWvSxMbqUDbAxRo0VD0JSg8BVpY12QdLNjZsFYjE9rsxNw?=
 =?us-ascii?Q?ttootoXGTnI696GFgZrH3pXWniMc/xegGpvPkyxvqbCAnpm3ylvJEmCPfnFU?=
 =?us-ascii?Q?L1ExUgSa8qphux9Aoe36JLzFbv4i5seaWqlMhxNv5Or9kEQ1OhtoYbQm36Zr?=
 =?us-ascii?Q?8gLZqGI85BfucjA8u4MmS7gev/4f7pEULyMt/7jrdocvYZ9T2fTgH8iRn4M9?=
 =?us-ascii?Q?zdUE/CrmC0V11pxkHg8cgjI15lQjW+vbNfHt0YmHsubImW0mTuTeSjCXqPF4?=
 =?us-ascii?Q?PHpSKiA1wzyzc6jREa0icFUHbsFfYTIjqIT//ophSI0/9gUr+x09oOx9WfI+?=
 =?us-ascii?Q?w8M8up+X5wYlCJTTtGSM8ubMhJjV8e7UiMIZ2OkVSqL/r8g2fI7pKcDcjiik?=
 =?us-ascii?Q?taM4X1o+FYcAk4MyCbT4OVTlfpDSqWSrAx0LWEXvf++TD99c5m/5UJom2tQg?=
 =?us-ascii?Q?+def8joh0oS15WL6A2xMlgEEEfdTyXc+kJrNyv9Q7vp9Lu7+GdZxunDVMrZx?=
 =?us-ascii?Q?M48lgyxYTzvSgoh5J8HenFZau9qWmIEOLrJ5V3yNyyiLiJqI/QUjVV0lxLpf?=
 =?us-ascii?Q?xJ0N/ioTBaWIwhUkkHRSGTEUkLxjCl1DkAkzItyGjnVZpIV4C56b1ZsOz4qD?=
 =?us-ascii?Q?55ho+Imwxx7QFopbxSrF63XRh3/YaiqIZBzAzradtQBYFjaItGgPW9WSYzf3?=
 =?us-ascii?Q?MfOZN8CYy1o+L4i9wi847ONbyYMZqsSoBEsauNCa?=
X-OriginatorOrg: vivo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: be9bda02-b75a-4d61-82f2-08dab37a53af
X-MS-Exchange-CrossTenant-AuthSource: SEZPR06MB5269.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Oct 2022 15:38:39.8520 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 923e42dc-48d5-4cbe-b582-1a797a6412ed
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: snBhESYUWPRWqqHKKLKNQBgLA4pjG98ezrBg+ppQ/O1zftWWRCIoRBrzohu70ekHtI1o0hheegpLt2Gs5cfWqA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SEYPR06MB6035
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  This testing sysfs node has been deprecated for a long time, 
 let's remove it. Signed-off-by: Yangtao Li <frank.li@vivo.com> ---
 fs/f2fs/f2fs.h
 | 3 --- fs/f2fs/sysfs.c | 5 ----- 2 files changed, 8 deletions(-) 
 Content analysis details:   (-0.2 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
 no trust [40.107.255.115 listed in list.dnswl.org]
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [40.107.255.115 listed in wl.mailspike.net]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.0 SPF_HELO_PASS          SPF: HELO matches SPF record
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
X-Headers-End: 1olu6p-000566-PX
Subject: [f2fs-dev] [PATCH 2/2] f2fs: remove batched_trim_sections node
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

This testing sysfs node has been deprecated for a long time,
let's remove it.

Signed-off-by: Yangtao Li <frank.li@vivo.com>
---
 fs/f2fs/f2fs.h  | 3 ---
 fs/f2fs/sysfs.c | 5 -----
 2 files changed, 8 deletions(-)

diff --git a/fs/f2fs/f2fs.h b/fs/f2fs/f2fs.h
index e6355a5683b7..9c480835adab 100644
--- a/fs/f2fs/f2fs.h
+++ b/fs/f2fs/f2fs.h
@@ -1062,9 +1062,6 @@ struct f2fs_sm_info {
 	/* a threshold to reclaim prefree segments */
 	unsigned int rec_prefree_segments;
 
-	/* for batched trimming */
-	unsigned int trim_sections;		/* # of sections to trim */
-
 	struct list_head sit_entry_set;	/* sit entry set list */
 
 	unsigned int ipu_policy;	/* in-place-update policy */
diff --git a/fs/f2fs/sysfs.c b/fs/f2fs/sysfs.c
index 3005e2783a25..926b7a844362 100644
--- a/fs/f2fs/sysfs.c
+++ b/fs/f2fs/sysfs.c
@@ -488,9 +488,6 @@ static ssize_t __sbi_store(struct f2fs_attr *a,
 			return -EINVAL;
 	}
 
-	if (!strcmp(a->attr.name, "batched_trim_sections"))
-		return -EINVAL;
-
 	if (!strcmp(a->attr.name, "gc_urgent")) {
 		if (t == 0) {
 			sbi->gc_mode = GC_NORMAL;
@@ -790,7 +787,6 @@ F2FS_RW_ATTR(DCC_INFO, discard_cmd_control, mid_discard_issue_time, mid_discard_
 F2FS_RW_ATTR(DCC_INFO, discard_cmd_control, max_discard_issue_time, max_discard_issue_time);
 F2FS_RW_ATTR(DCC_INFO, discard_cmd_control, discard_granularity, discard_granularity);
 F2FS_RW_ATTR(RESERVED_BLOCKS, f2fs_sb_info, reserved_blocks, reserved_blocks);
-F2FS_RW_ATTR(SM_INFO, f2fs_sm_info, batched_trim_sections, trim_sections);
 F2FS_RW_ATTR(SM_INFO, f2fs_sm_info, ipu_policy, ipu_policy);
 F2FS_RW_ATTR(SM_INFO, f2fs_sm_info, min_ipu_util, min_ipu_util);
 F2FS_RW_ATTR(SM_INFO, f2fs_sm_info, min_fsync_blocks, min_fsync_blocks);
@@ -919,7 +915,6 @@ static struct attribute *f2fs_attrs[] = {
 	ATTR_LIST(max_discard_issue_time),
 	ATTR_LIST(discard_granularity),
 	ATTR_LIST(pending_discard),
-	ATTR_LIST(batched_trim_sections),
 	ATTR_LIST(ipu_policy),
 	ATTR_LIST(min_ipu_util),
 	ATTR_LIST(min_fsync_blocks),
-- 
2.25.1



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
