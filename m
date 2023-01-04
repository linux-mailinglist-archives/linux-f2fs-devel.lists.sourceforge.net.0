Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 50B8A65D14D
	for <lists+linux-f2fs-devel@lfdr.de>; Wed,  4 Jan 2023 12:22:44 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1pD1qs-0000uV-VJ;
	Wed, 04 Jan 2023 11:22:34 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <frank.li@vivo.com>) id 1pD1qq-0000uO-TP
 for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 04 Jan 2023 11:22:32 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=MIME-Version:Content-Type:Content-Transfer-Encoding
 :Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=71nsvQsvnmS4DY1mivaFbSp5zykYRpJPABqQ4hhf7Q0=; b=aPJr5ZVY93D6rm0GRHUPeQ267q
 Z8E2k/4ibVF5SozZO4/U9TIpM74OVqnzqtMI3f9mky785xgK+qbotuIC00L2ng7rpOC99R7SkIuUp
 eE99mA/o7hHMHEqZd6QN0//At0zsZT+SP1paobLTsLgjtVSmmWrImoPtVGwtCr9UaNQc=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:Date:
 Subject:Cc:To:From:Sender:Reply-To:Content-ID:Content-Description:Resent-Date
 :Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=71nsvQsvnmS4DY1mivaFbSp5zykYRpJPABqQ4hhf7Q0=; b=W
 EmRuMi33eV6k9dYK/O4XOkM3miltA9LAMggO5zDzvKJfkhFCHK7VOWxeqk0oc29hm/VGxBgmKr/TF
 Fi5XjVkelNAq7hlH2RYMaK+EDxjgTVCGiu6DaEOw1mXHeng5eYt81fljGA4/8HRT9kAD7DbN+IFuN
 s6+UmQeeD68txg6g=;
Received: from mail-sgaapc01on2121.outbound.protection.outlook.com
 ([40.107.215.121] helo=APC01-SG2-obe.outbound.protection.outlook.com)
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1pD1ql-004Li3-3e for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 04 Jan 2023 11:22:32 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ZmX4pPpAjnJYPoiApretbi1LvnwCAaw6PGzZ5kOEfXhDa0yrzSWxdTjVVzPJ5LpKN4utOfOTrRg5RxYE2xz0ERg5GwXtTqxRZP2hTncaVRVqUWVw3A5wP/Hq7uwoT8ZxHy97pcmgUj1n4HRtyNjse12hthsJ29AeU0CfBDa/or2yo3F8IN4ZY67DVpRMRDtpeZ0Rgw5giHeLBHSGkRyJ9wM8EbKH2yeiye535cNMd/JTESLOgh62YObSo2I2XHWl9np0590pZqLSYcwzF2bYMmQQPzvPvzR3kTaW+o4ziJxGkNF5ZdOatDqTiL0sGmE4rgzY5Exz/ZDF4HJXrZlUnQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=71nsvQsvnmS4DY1mivaFbSp5zykYRpJPABqQ4hhf7Q0=;
 b=XQ4E7w+yLafwZO2S/P2h3VCf+woror0Bfvy30JcVhdfZcK6YunL+gDZpCLmZ7kDx/xmi2u2zWkLGh399zNqg3HTZhMd3xLAYEPeVKsDL1RoR+3iyNWtVRkxpkOCPZC2wiJ7JOcEp/M/B36XH7jExvh1AnqJw45c+4F9Fd1w5SIhT08y+SKom1gbGQmtSRIGEexBFb0SEaGUlpHIUCqAB4RkMJMMfF/7g+WzieII/I3oHgh0uFFP737Oyi7/m6T+oyoTDz60kl4klq0JdBA7UJKTK+8aDs8Fr0wcLOdGDFyGuw+I317bV2fW799Gw1ZwXQleLoZIoeXKZ3GCR3//jWQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vivo.com; dmarc=pass action=none header.from=vivo.com;
 dkim=pass header.d=vivo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vivo.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=71nsvQsvnmS4DY1mivaFbSp5zykYRpJPABqQ4hhf7Q0=;
 b=mieebBRtYzM7lZeTb9iKiPEothINfnz1ydPW8mn/YJjZ5A0gZ46ndXHvk6HrhQOKYKGH/PrIMmvE5IUGk4kl2WeSQHan6d3HHpcJxR1fR3RzkvO1v7UVOSZbsmMVahISgFCRJszEggnbIO8Ukqv7fZrbwL/hMbqNVjdtm/o0sHGq3up9/hbFQvOGq3lOn02kWSfhMarRCkAq+oWTkUP6cooW5oRAWD1Uh3LIorKmRJoJ75fCkLrv4ravH5HGEvGCVvBAUh1uP9X/qOcTlxv4/vlp7EFt6ZLfkIEkSlAf2sP0p4C8x2cmCyIAVB2igyLiwYv1sd4KLZ1i3v95Cr6olg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=vivo.com;
Received: from SEZPR06MB5269.apcprd06.prod.outlook.com (2603:1096:101:78::6)
 by TYZPR06MB5844.apcprd06.prod.outlook.com (2603:1096:400:284::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5944.19; Wed, 4 Jan
 2023 11:22:15 +0000
Received: from SEZPR06MB5269.apcprd06.prod.outlook.com
 ([fe80::7969:5a45:8509:7d80]) by SEZPR06MB5269.apcprd06.prod.outlook.com
 ([fe80::7969:5a45:8509:7d80%4]) with mapi id 15.20.5944.019; Wed, 4 Jan 2023
 11:22:15 +0000
To: jaegeuk@kernel.org,
	chao@kernel.org
Date: Wed,  4 Jan 2023 19:21:55 +0800
Message-Id: <20230104112158.15844-1-frank.li@vivo.com>
X-Mailer: git-send-email 2.35.1
X-ClientProxiedBy: SI1PR02CA0002.apcprd02.prod.outlook.com
 (2603:1096:4:1f7::16) To SEZPR06MB5269.apcprd06.prod.outlook.com
 (2603:1096:101:78::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SEZPR06MB5269:EE_|TYZPR06MB5844:EE_
X-MS-Office365-Filtering-Correlation-Id: 81279f4c-cbf7-455b-b6c6-08daee45ee5a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: SzRPpLJfn35lmAH+wsiT8w8kvZGb3TgVaw6z3V0h9lKROKdAmZaGVFLRfIgGMRjvs70AiIgLKi0ij9dN/4aRZ0MJPDD4NoSz0G17JU7xET36ErA1iLe+/u7HWGtkvJ2z7qBql5XAbPuPeSEUxikl4+0HOoZ1rGclzRVbMOB1RD/GKQxbS+CUy/ABQk81Q1v2RTuDR6qRf/VYYy28h45fXO/OwEG4Txx/kb9pRedh9MPIPOjNk/WlQWWrb7US1lcndAn00zBgV+1aprnk/Qi/B6FNnqlGop6HqPn3bgjNkmhgIfLZDG9UX544RIjR4l7hQLyhBjgaj+UNuid4ytOFpOOpPiJ+QViSDXRpSu7Zgtaosu9PDSv/2XtQyTl5baRrmyc6aZHcbYv9I7qxynglbMgkesmAZXeUZg/nlNZKmUwmnewfWBAg0Lvzsg6+hDuFZ2naIlmLV6iOaM75jD4+7nVY1/aQqDycvH2k75v91g5RRn+8DsFxFv+E83BL+zCP9K7NbOudImmDXmDyxbHOhFmFk2eLlKE0t/l0T63WmtEYkIZXbnRr/4W5AOWZ+jNdhUApaUzcxCINR27gNmemWcAtv70tBee7FA1eUkgJTmi68eTY+K+pbcWp3IA2STrC4nzfDbM9ePupdl+WM5iPfw2tteN8+5RkygKzEg2a0SeOs0pSt0FrzUDPVZGy2V0K
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SEZPR06MB5269.apcprd06.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(4636009)(376002)(346002)(366004)(39860400002)(396003)(136003)(451199015)(2616005)(1076003)(83380400001)(186003)(26005)(6512007)(86362001)(36756003)(38100700002)(38350700002)(2906002)(5660300002)(316002)(8676002)(66556008)(66476007)(66946007)(4326008)(4744005)(8936002)(107886003)(6666004)(41300700001)(6506007)(478600001)(52116002)(6486002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?rMy43p+ufMFGmGeBcoOrg6vbIJBdAKLQ7dDmu1LwZ3FXCWta5nrygEB0wTjO?=
 =?us-ascii?Q?CGNq8fHFrxeCMq+JGKxqmvmMVNP3yo7Ib/v8bkwR0RPQ5sfvvMk7Qgyb8H5r?=
 =?us-ascii?Q?pL/oS2hA6ptd82x3JkYXZwin6dAuBotGTMtlFu6wITwJoTj1v1W8Jh+m013U?=
 =?us-ascii?Q?klmzkTXCCeFEKL4uPMndEGSSoaNcSS0rFEyUgs0MNDciJ0yWqwYcSS/pbmWy?=
 =?us-ascii?Q?O9Onk9eUSKyH+KedShl3pFF2oxq4I6OpREN83YLviyeh9/yEdXPEaehnN2Qx?=
 =?us-ascii?Q?4tEl8+8A+1tf278Uh8cR9L0jG+MLD/BWDvSFdLuh0t2a2hg/RKVa6+GzMfld?=
 =?us-ascii?Q?JhB71nMCoq6iJFRhkqxnQsiEMm3c8jHJex6EB1PZpeyzrhKM0/R6mO8Dcb0f?=
 =?us-ascii?Q?zhvoKbNQTZeDUmwfuQsoUtTYNPp4tqgu0U7CCmoDGnWoNz+Gr9kPdbqrYb5i?=
 =?us-ascii?Q?9gtJr4MOBVlJt30c3FMLK0hibqFOeHbl5cEBrO14G5mnFcuTDm07VTJwS9lH?=
 =?us-ascii?Q?Ry2GlkdEtAr7hAq+3nZKIqmLvGIIpuBx3QdGPT7Zjju1iHZfD4RioNus0T90?=
 =?us-ascii?Q?FPXSTZy6bRxWXGk5jZtNfY80m2SQjl9zIFSAohG80lYfoTUVGd44ZUBp8h83?=
 =?us-ascii?Q?1wZNpZR1mFXWuPx1c0sixHb9wSP3uw5AnTgeMijYEL2ZCoSnSxE1bajBKLgr?=
 =?us-ascii?Q?CbomkzzDiolXv0qwQMPoMQ0MUVj7IQzg01f1KQ4RWYzaAmYv32Qb5l/5X+ge?=
 =?us-ascii?Q?GIzA5bGZfBUQ/1eZb7El5SVO14HZ8lwYrtoH2wR8m8kxOlSb7+2i+z/7SR1P?=
 =?us-ascii?Q?J2KC6A/SGs9IVR5kpt2IYL0m8LNC/798adSyTV0jI5jmLcBxadcu0JQgG0KQ?=
 =?us-ascii?Q?QdmJs2/cfBAs4kCMBxVVnavEOL5Nt7ndxWN/YRd2MA3hbR9n8iUPuxstjwCp?=
 =?us-ascii?Q?cdDn7SAtYkf1Ysq9KAIg//tujIRqHkrhG/EZCm5SPTx0n5mXfiIh7Niv7Anf?=
 =?us-ascii?Q?VXnop9QGf47JYwmh4pcI6AbDOtD8TfwkejJVMZUoVm9vlve3hULPqNw9YNR5?=
 =?us-ascii?Q?SjPs9C78XClSuOWbw/NfTYpc4qc3zCcXfh5+h7OeZi/gdAxLFiVnyy5xTpP9?=
 =?us-ascii?Q?yB9R37NE77BREZ0fV9flxXQB/DSaYDfdD2UrBaYyIDy9OFLQzSEUvfY5X5GF?=
 =?us-ascii?Q?EjYwrGsmKhNnVrSVtwFU8OZ2nSGP80qO7cYKOf/lExa+xSvOo8KO0jV5UT3x?=
 =?us-ascii?Q?3gGajA3fYYwfpyQ0lKNRsXGixRxOKt4GfPFefQVqtxWydSmHBhklpvoBDcyE?=
 =?us-ascii?Q?Z4VXOqqG/tU7Dg80t7cND6pOctzCnYc2XHUCscbNQ96DhNOthtZF/FUDYQU2?=
 =?us-ascii?Q?pfA/Pbgrnne0PGnq2q6cI5A9NwwM5ZQB/M5sIt+MTjPVGb0t53ATaXxKztUK?=
 =?us-ascii?Q?DrBBoxiKh1GZvphzjtLI23d7J2VJ5Eg9joD+fINKUkFhaO0ZV5B8s1h+3qZd?=
 =?us-ascii?Q?leimDLOrSq9qFMJdPCCdreN7LFH47c2tVeO7XUpgfOLkv76ttNctoklQTtYx?=
 =?us-ascii?Q?rBICygEbq5SqWgVzL5JqdvmkN1wA6bnw0zamd+KX?=
X-OriginatorOrg: vivo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 81279f4c-cbf7-455b-b6c6-08daee45ee5a
X-MS-Exchange-CrossTenant-AuthSource: SEZPR06MB5269.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Jan 2023 11:22:14.8405 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 923e42dc-48d5-4cbe-b582-1a797a6412ed
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: eMQWu53Ux8Cyomj2AyKD7iTIlmrUq4Rqo4igYx+D2JaYge3Q4JGh9Nx3STPHsFqHFXTEkB+bHRE15UqOlLS42Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYZPR06MB5844
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: Commit 8754b465c249 ("f2fs: support accounting iostat count
 and avg_bytes") forgot to reset iostat count in f2fs_reset_iostat(), let's
 fix it. Signed-off-by: Yangtao Li <frank.li@vivo.com> --- fs/f2fs/iostat.c
 | 1 + 1 file changed, 1 insertion(+) 
 Content analysis details:   (-0.2 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
 no trust [40.107.215.121 listed in list.dnswl.org]
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [40.107.215.121 listed in wl.mailspike.net]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.0 SPF_HELO_PASS          SPF: HELO matches SPF record
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
X-Headers-End: 1pD1ql-004Li3-3e
Subject: [f2fs-dev] [PATCH 1/4] f2fs: reset iostat_count in
 f2fs_reset_iostat()
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

Commit 8754b465c249 ("f2fs: support accounting iostat count and avg_bytes")
forgot to reset iostat count in f2fs_reset_iostat(), let's fix it.

Signed-off-by: Yangtao Li <frank.li@vivo.com>
---
 fs/f2fs/iostat.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/fs/f2fs/iostat.c b/fs/f2fs/iostat.c
index c53b62a7ca71..8460989e9bab 100644
--- a/fs/f2fs/iostat.c
+++ b/fs/f2fs/iostat.c
@@ -220,6 +220,7 @@ void f2fs_reset_iostat(struct f2fs_sb_info *sbi)
 
 	spin_lock_irq(&sbi->iostat_lock);
 	for (i = 0; i < NR_IO_TYPE; i++) {
+		sbi->iostat_count[i] = 0;
 		sbi->rw_iostat[i] = 0;
 		sbi->prev_rw_iostat[i] = 0;
 	}
-- 
2.25.1



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
