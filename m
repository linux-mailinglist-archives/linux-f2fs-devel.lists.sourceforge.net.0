Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 50368326CF0
	for <lists+linux-f2fs-devel@lfdr.de>; Sat, 27 Feb 2021 13:03:32 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:MIME-Version:References:In-Reply-To:
	Message-Id:Date:To:Sender:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=d5mtd98raZkR9D1AoObOTqGlIneHxn/bOtOyIHgTUzY=; b=hq/EQlk0njmG13h2+RXVf4NiT
	JSaBTlgx9bb1gn2gYwrx0YSKRWJj7q5zDnDXBmracomuHUy1MhLvfl8rNNCec+FzOH1par4bKBwvJ
	MaNhLxGlZxicRPgOH0C+obENEHIzfbMtbj/xl+Uw6ve2t6b52Tj2ttvZioSUJn7dG26mA=;
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1lFyJl-0005SC-I8; Sat, 27 Feb 2021 12:03:29 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <huangjianan@oppo.com>) id 1lFyJj-0005Ru-KZ
 for linux-f2fs-devel@lists.sourceforge.net; Sat, 27 Feb 2021 12:03:27 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=MIME-Version:Content-Type:Content-Transfer-Encoding
 :References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=zMqN7zfpQdops4F9/RNc1GzGdME3ocoafv7rzTbGEPU=; b=VkNzwNRMxfBIIVGMEKBQ4HHc31
 809rLWX8jLISUuvw/oAHBxqDFl0dr6k9E7EdTeW9JtPuq2t02Xq0azwXkDStIwoyVX+fVsVgn5CV/
 D7SSqdxCuiZAF4nIawTpW9lhC2+dw133GSc2xMxTk+9xLRrat+way98eUOmFhuCbPN+s=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=MIME-Version:Content-Type:Content-Transfer-Encoding:References:
 In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=zMqN7zfpQdops4F9/RNc1GzGdME3ocoafv7rzTbGEPU=; b=VLDle+cv+X4b0H1dYvjTrQS/q/
 7LOxKs5XO+//3ocwlxl5oUQ0vR65fquSSGBD9JWenLUAXUNGoh9CpAZxzmrPuVTIItWjeFMWsPU6z
 tmcWFXRyYU9vl50hr5MMwQXAs86GxKmaMgdEaNBgUBCoRvwKm/NtaFsrvFIAAysSgfd8=;
Received: from mail-eopbgr1320078.outbound.protection.outlook.com
 ([40.107.132.78] helo=APC01-PU1-obe.outbound.protection.outlook.com)
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.3)
 id 1lFyJc-0002Oa-TA
 for linux-f2fs-devel@lists.sourceforge.net; Sat, 27 Feb 2021 12:03:26 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=BilzyfLzU03lSyjWV1IE93JE1vrk0TGLkl7yk6Hlf2ffqeCWOD+aCkEmXDYep0RCsV5nVgUgbUdegk5gZTUklJkcFL8S31VVk5x/B7npLTQV6ur+aG8dX9533bvtpGVr5g0QhT39uloZZ3IyVaZDnbFeiGW29RK6L/9QdDRg3Ie1NK1BD5y3yUe1FKi/rVRBR8QXdFI0vGUQ/8xD2DtIJ3c4JcFSGhfg6vlsMc2K2sr2YWMPMSeWMTkCVu8dQOTK/zROh/0uSY3mKUqCoY1MtpWEbg0F/787sGGTjYKgBLOFQEWTIBS8iKqxkY2Sixmgzhl0NHuY6+6rqQClHojhlw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zMqN7zfpQdops4F9/RNc1GzGdME3ocoafv7rzTbGEPU=;
 b=EDxSQeN4D3vycbQfU1NEc6u5Nb0l1SKb9yT3zD3at1Ia8bI5lQ+RncyPO5KyFQ5LSm63s52JHfPnvj0baicznWxQ/658h9mmooKjbtdSxy8JOCqKS4cQxnolbw5lrPeS3URB+yUOwV//eGfCTw2ithCwI2lc6JGRrlqU6LWKPBGHmRQkBwkbN+/HIyPJYYoCTTCBjJev0s2wytXckv+AkqlLtfbn7IwcpW5UkQHmNUB7yzN3e73+2dP1nwFC0V13NfbCxxwYZKc6JV2SA3Pfvxu9sLw/ZJwPFwPWV59UqaPKxM/XC6TFXSgC0Phj+tsC16an0IDdjHvAqfG91ur3tA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oppo.com; dmarc=pass action=none header.from=oppo.com;
 dkim=pass header.d=oppo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oppo.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zMqN7zfpQdops4F9/RNc1GzGdME3ocoafv7rzTbGEPU=;
 b=K7mt9v6qU91q7dT1Nv+1Ds+FwKULjgRYA/xmWoiGDaET812xLllx/rsXTo6693V7wChViNgsHNrlJEG92LPeX6WXpcs/5Riob+TibnMtlpBtHXk7davpSOzUuDfQwPOVKsAdSzZQvXoQgvsJ5caAa+JbgFBKyyweWVYKawLAd/M=
Authentication-Results: lists.sourceforge.net; dkim=none (message not signed)
 header.d=none; lists.sourceforge.net;
 dmarc=none action=none header.from=oppo.com;
Received: from SG2PR02MB4108.apcprd02.prod.outlook.com (2603:1096:4:96::19) by
 SG2PR02MB3369.apcprd02.prod.outlook.com (2603:1096:4:43::9) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3890.19; Sat, 27 Feb 2021 12:02:50 +0000
Received: from SG2PR02MB4108.apcprd02.prod.outlook.com
 ([fe80::1143:a7b7:6bd4:83b3]) by SG2PR02MB4108.apcprd02.prod.outlook.com
 ([fe80::1143:a7b7:6bd4:83b3%7]) with mapi id 15.20.3890.023; Sat, 27 Feb 2021
 12:02:50 +0000
To: linux-f2fs-devel@lists.sourceforge.net
Date: Sat, 27 Feb 2021 20:02:30 +0800
Message-Id: <20210227120231.136559-2-huangjianan@oppo.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210227120231.136559-1-huangjianan@oppo.com>
References: <20210227120231.136559-1-huangjianan@oppo.com>
X-Originating-IP: [58.252.5.72]
X-ClientProxiedBy: HK0PR01CA0050.apcprd01.prod.exchangelabs.com
 (2603:1096:203:a6::14) To SG2PR02MB4108.apcprd02.prod.outlook.com
 (2603:1096:4:96::19)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from localhost.localdomain (58.252.5.72) by
 HK0PR01CA0050.apcprd01.prod.exchangelabs.com (2603:1096:203:a6::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3890.19 via Frontend
 Transport; Sat, 27 Feb 2021 12:02:49 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 0ab4be34-69c0-43cd-d950-08d8db179b14
X-MS-TrafficTypeDiagnostic: SG2PR02MB3369:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <SG2PR02MB3369B79840A89861709E1364C39C9@SG2PR02MB3369.apcprd02.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:826;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: aff3C5aNOowY6oLObFaaL9xgZVWUW7K2pzSdxc54GmuKdc3RejmJvi5g/jF6zOzBr3ge8NMyzXjzso5eH1TmJBrU8HDoLwtDMYDKTxXVDzyO/UusYmqF4jza9W9U1iaciuwk7CIk2AqdAEcvmnX9BF+3+ZgiPLI7Lqiqrjh/i+kM3/p5I/H4oeWhpbbGvnkoPe5ysUF5fFPgPg6UWOZdNnMYBWxjFWpAvLC39mIAMSkub2wLGFG2+0GPC3thjcb9oW0xGY8DnbtEsTXoUptYhobnwaa1acbxED4uNNB/hkVoyT1Exd/KJRIyrNoI1UU5RTSUGY05AXSjxP3ekeao7z6Z21FPUtG5cvlUtREbD9R7jXB7EM0+mu9dq9dj2fI+fNBRotfrG6l3/2nUpES4fuI+0RcY4VsL4gtbpFvq9H6+6C5KuOQpOX9M9nOBbjlBIplhNEOyE46sT1zG0lz3iDzRY6voaEAYFH/iV5ag27XmkbEZbvOZA7BCT2jIQ3+kZi9QQ1xgmwEyUch6yXzRZkSUTtcb95kocrfT9+iwMah/j+8asRHv6dBqznL8B9Dmnkg6CWW0IhCkWfLcsPjW8EVvYvAQzinstAuN4MQml3g=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SG2PR02MB4108.apcprd02.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(39850400004)(346002)(136003)(396003)(366004)(376002)(66946007)(83380400001)(2616005)(86362001)(956004)(66556008)(316002)(4326008)(66476007)(52116002)(2906002)(8676002)(6512007)(16526019)(186003)(26005)(8936002)(69590400012)(36756003)(6666004)(478600001)(6916009)(6506007)(6486002)(1076003)(5660300002)(4744005)(11606007);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?HOWr131FlKrVoQxLg3bi48OHz0hlOEjMiBPnZ+rDDN1R7ATR6pjCS9g5j8Mf?=
 =?us-ascii?Q?MDhpml38IKje0qHSLQOzPsFRMGY+2Vl1Uzpb6VqywXxDlotdHVljXa4HzAx3?=
 =?us-ascii?Q?p5uomn96SUJtWq4sIci5wRIooNmUVEFGJHrhpFFOa+jybuJ6Np7mfj43jwbr?=
 =?us-ascii?Q?k9hrgyuEwoVtD79S1PdfLrGr8LG7WkN1UT9jfdPiQJa83Xc3zF+nNruxhDP6?=
 =?us-ascii?Q?YcDpFlHfuH0nur5oOIAU9lRlXqVmEIbnnLI2uboY6dinixlZePoVZhBxSnxK?=
 =?us-ascii?Q?KtnEfAZ1fl15hpfSzC14ITw700OkEJ2UDJRsL2zu+XIn3Zko/80UoLvwW8sP?=
 =?us-ascii?Q?ASOQ+4ETzC5XnTnynguP15tCW1pGLeE76zB7emIPtecXW9q+/rkFkmn3R2HW?=
 =?us-ascii?Q?3PaPVbu+3Jd1bjfjrZMDx+SThXNXLUBu/Kq2Iei5cEIsbIi3NMIAJuZX++Me?=
 =?us-ascii?Q?Z/90AqoNs3Q/D60QubLiTHEEFn6VEssiPKYCk036DWooXEgT0hHSxO+F6xdW?=
 =?us-ascii?Q?9TUw//T2ORLib5TMMqpwhBdZLR/I/SKQ4+QcXTWarJZxB562ed++rA4ejNqa?=
 =?us-ascii?Q?FWADEvIe08KRgc/DZ2/399nuwWknAhAJibvXNTBnyrc/HkH7pn79lPouI6N2?=
 =?us-ascii?Q?EU51XLXhWgegjFARnqQnDHIrPzayI+6tR+pnqPRx7Ixtwv9eZl3iw6+b6VPs?=
 =?us-ascii?Q?582s5kuwg2AOn94eDhTJrkBFnoqy4izS79a/NOG+/ry93ljN1rwwH3JZQ9dQ?=
 =?us-ascii?Q?PsrV/yCKcB3DpSbXKQdlljKDq9Wzph7NlRgU0aZ0rPo+suPg0P7ObBSIeHmh?=
 =?us-ascii?Q?/9C0KThQymrKOQ/ZvGMy34BGMYuHzqIcLoe5WfGQ268mJ9J0+hP8xNzYllZx?=
 =?us-ascii?Q?EliSkEV6e96c59WKwk0ui/wDwnEh+BvbNtVRCIqGYF52JYUF9oIePsrm02xI?=
 =?us-ascii?Q?zOdztItwfAWtJMTdB7pbUNiUW2M00RnjYv3/Pex0ugnAeY+Z1/+SuFtihyYR?=
 =?us-ascii?Q?8TmhNqYn6Vyr8SfYCQoKiJhjhKqVmUowk6Bzh/sKBYqaOyN5BYrXk4On90Iq?=
 =?us-ascii?Q?38ghXu5QwOuSVKaxhII+q8QXHXtPZlTsNaJUXpLu1bDsv6L9uqFS98iZhQDA?=
 =?us-ascii?Q?uBvqXeer01nAwK30YsVFxA04EUWbCO8MiREBleVubZkZQgURvy9cAC6Lzb8W?=
 =?us-ascii?Q?thSR6PQdNUdZzQ0v9lf5DHwNbXL6krS2aJ+RsvSoBJ19zFAoKtdrFt7MXMGI?=
 =?us-ascii?Q?iB+TBQn0M3qzmyR9olWav9fArk56L+sH6XJAPwD9AEKkEemQ4aH5uGarJLcz?=
 =?us-ascii?Q?FpzA90IriDWLHux+CJ9Zk3cK?=
X-OriginatorOrg: oppo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0ab4be34-69c0-43cd-d950-08d8db179b14
X-MS-Exchange-CrossTenant-AuthSource: SG2PR02MB4108.apcprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Feb 2021 12:02:50.7729 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f1905eb1-c353-41c5-9516-62b4a54b5ee6
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: nerfKI0on9G7TuUmC5w4GGfUEfPSAkvyYXFFCaSw2kS1OViNVcasO6LYvKy7LazGk2X7L9xuiFDkTPKR6tVhuA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SG2PR02MB3369
X-Spam-Score: -0.1 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 0.0 URIBL_BLOCKED ADMINISTRATOR NOTICE: The query to URIBL was blocked.
 See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URIs: oppo.com]
 -0.0 SPF_HELO_PASS          SPF: HELO matches SPF record
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [40.107.132.78 listed in wl.mailspike.net]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 0.0 MSGID_FROM_MTA_HEADER  Message-Id was added by a relay
X-Headers-End: 1lFyJc-0002Oa-TA
Subject: [f2fs-dev] [PATCH 2/3] f2fs: fix last_lblock check in
 check_swap_activate_fast
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
From: Huang Jianan via Linux-f2fs-devel
 <linux-f2fs-devel@lists.sourceforge.net>
Reply-To: Huang Jianan <huangjianan@oppo.com>
Cc: linux-kernel@vger.kernel.org, zhangshiming@oppo.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

Because page_no < sis->max guarantees that the while loop break out 
normally, the wrong check contidion here doesn't cause a problem.

Signed-off-by: Huang Jianan <huangjianan@oppo.com>
Signed-off-by: Guo Weichao <guoweichao@oppo.com>
---
 fs/f2fs/data.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/fs/f2fs/data.c b/fs/f2fs/data.c
index a1498a1a345c..4dbc1cafc55d 100644
--- a/fs/f2fs/data.c
+++ b/fs/f2fs/data.c
@@ -3804,7 +3804,7 @@ static int check_swap_activate_fast(struct swap_info_struct *sis,
 	last_lblock = bytes_to_blks(inode, i_size_read(inode));
 	len = i_size_read(inode);
 
-	while (cur_lblock <= last_lblock && cur_lblock < sis->max) {
+	while (cur_lblock + 1 <= last_lblock && cur_lblock < sis->max) {
 		struct f2fs_map_blocks map;
 		pgoff_t next_pgofs;
 
-- 
2.25.1



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
