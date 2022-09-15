Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 65B1F5B954A
	for <lists+linux-f2fs-devel@lfdr.de>; Thu, 15 Sep 2022 09:25:46 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1oYjFZ-0007O5-IP;
	Thu, 15 Sep 2022 07:25:42 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <bo.wu@vivo.com>) id 1oYjFX-0007Nx-Sa
 for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 15 Sep 2022 07:25:40 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=MIME-Version:Content-Type:Content-Transfer-Encoding
 :References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=ooFREpZ0BkrAH1uLn8FneRqUfoY4IHA8/w+MDAg0M/c=; b=gfoLiLd3Bf2aWC0TKkQ2oZ+TVI
 9Aick7y6RDuqxxHG7+8hna2UpI0L2m223NKxcVrb88I/i6oA+uXJde9+5DCiQmu9bePp8N25PfJjy
 oJGDIQHcv1JlIhljVRCDhu6lKS+1Pop2L2p2izgu9Dp1ob2ztYnEvKrmlhWKMxVo03Yg=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=MIME-Version:Content-Type:Content-Transfer-Encoding:References:
 In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=ooFREpZ0BkrAH1uLn8FneRqUfoY4IHA8/w+MDAg0M/c=; b=IqW59RDKHNen/5meoYfXqvc7cQ
 0EZKpJqwCLo0a/liwlRYo4rSZaRDh1eQaYA/HpdZm9w7t99KBiS82qBtMBa54WGMxcWtLJ72etPxt
 WpK+reDp7fX+8Zu9mTy1nEcahUJA3DRZ9Zo9HXX1eR8no1kDUYeZFrcOYxcsDYrcu6dM=;
Received: from mail-tyzapc01on2097.outbound.protection.outlook.com
 ([40.107.117.97] helo=APC01-TYZ-obe.outbound.protection.outlook.com)
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1oYjFf-008p49-7Q for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 15 Sep 2022 07:25:40 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=WrhgWK9/qkwThMYHbWgfvmrBOjH8mINEcpyZ41hsL9H6qBTl6qykgrEwayL9ksSB9k63Ry7a0ir5S23ZzERsmtd7Zza7BAzNjd+5nqVSNE4mHx4/3852sBV+mcFObKFQjAcQ34aOnidRHcf9dEVxzsNlZWKInzZDT0fNjQGeuEN8tiaEVxvAT119d9tksdohlU5CjG8hi/xy+HRm1dPGyRmBCgIEFOlXnYRKj0aPt67uAD8s+29ZWxB1+PKc3MkwJk6TXR9SPoBnjLKt6u0koGOTlL14B2N2NKqpYpy2/rGQHe0WylzNzpk94V40UxulbXNWprRY/hOMVsvbrOhW2A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ooFREpZ0BkrAH1uLn8FneRqUfoY4IHA8/w+MDAg0M/c=;
 b=Y4UtCXmogm50Q5OG2SAWgh9NzXiv+HUVWRJlF5LwAoNlPz9ZEf/WfL+kqb5vscW9wFq6JXlu+TWiLDsWEOcs1JtRIiYldhJB2+HEnyDIO3sv7xTA/81XhX/np5VDWkU4hK5RP6tvB6Xj/1e1df5t231fbo30Ma6inocLs8nWypN80B3j2UAivvFASGksj/bErO9S6jCCusCstiG+1bOC+stYeiKcm+phjI2hPvcbpCgSIzqmxiWW/WyWrCnXYXi8qrVQH2spCNzy9cyF6snd53r8dF8BOUZjTp2/vxASn7II7PkND7BIVLCe72vvyzJLIMuK/9Kd8hYwjgipW5bgbA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vivo.com; dmarc=pass action=none header.from=vivo.com;
 dkim=pass header.d=vivo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vivo.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ooFREpZ0BkrAH1uLn8FneRqUfoY4IHA8/w+MDAg0M/c=;
 b=DMK2C28BScn9zY2WzqeG4gqA0XW8+bjQqmWWsvqF6g44oiFql49sf5NzXvUI1uMQA02EnVKLwBYWq+e63V8nHx4QRJ9sNss+5XBFoWVIpRkzKjWABQtRAmLkF3eMQ+spmbiY1DfV1i1Xexb0Oy47KEmIs/qE2oW9WiS9VQpKzV0aJqJMqFizWwYoN1QLYZjUQ41LwDG+NZvKNYviKDNCcxruyNkto8mhgyqc3r3aeyeJzI5Z+3imchAYeMW+qdJ8LPV5CPq1srJj2YJaiE7v35b2fZ36ofZ8TYbBEAmLOCrr5+paCdlFtQ/XGHRzpBi4tTkJqlgPYRPjJbffB0cnZA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=vivo.com;
Received: from SL2PR06MB3017.apcprd06.prod.outlook.com (2603:1096:100:3a::16)
 by TYZPR06MB4256.apcprd06.prod.outlook.com (2603:1096:400:89::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5612.14; Thu, 15 Sep
 2022 07:10:15 +0000
Received: from SL2PR06MB3017.apcprd06.prod.outlook.com
 ([fe80::495:fb84:3574:2518]) by SL2PR06MB3017.apcprd06.prod.outlook.com
 ([fe80::495:fb84:3574:2518%5]) with mapi id 15.20.5612.023; Thu, 15 Sep 2022
 07:10:15 +0000
To: phdm@macq.eu
Date: Thu, 15 Sep 2022 15:10:04 +0800
Message-Id: <20220915071004.23550-1-bo.wu@vivo.com>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220914080839.GA19067@172.21.0.10>
References: <20220914080839.GA19067@172.21.0.10>
X-ClientProxiedBy: SG2PR02CA0083.apcprd02.prod.outlook.com
 (2603:1096:4:90::23) To SL2PR06MB3017.apcprd06.prod.outlook.com
 (2603:1096:100:3a::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SL2PR06MB3017:EE_|TYZPR06MB4256:EE_
X-MS-Office365-Filtering-Correlation-Id: 69852c8e-31d2-47e9-5731-08da96e955a5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: M8JKCbXj97XRwGQ1JuERnIHYO/bxvtZYL+bgNOgOw8tdcDOR857VzX0jmZpVigtZOwDStoEDTq5zG9ZIYeNhxwflZ1Q0TCABbBT/Iuq+eSpgM7J+c3ir8ZcEGsYmWxBHsEFq+VkAyWXgfwbiHF4qH2Uqq+0Hr6lOmfdxTUNu5xcAg8XX6BRvt6vp9pDE+aSbGZZ8nD8bE0bVaCKgOHvLHKbUHdfSUtrsTIblCCjUid+hwQt227M6nqwThLBU58s3ZBARxI6DSIjJEsUyae5gJux2Pw9AMqUUKI3t050gMHw9AVeZM4rbb1WRr+Hd/hq415FiSY1Ow2l0TS7+vzd/pHdmKkSkRy6QFpozjrBKMe2MkidvUpV+KNG9wgCsfTNPmMgfte6EAOfAZdVoa1891cSMEpn/xjTiVqC8HY0efNEfAKHKF2Qm8AHveneUXZ27X+Yd4o7cPA0c8LqDH4ZGnRfnBChLvJkAuZosshHxSuhUjWh0kPUPnte4oTKxukQ0IgYGNxjOnUnXHftWyYYbGFoYj/YWWwHpWn+plXJNrQRgaiPEhWAph6RS0UGqo3KhurovPpUdN/kHK51WtxYQRDQDHxY8Itu+3xVEywNTuYoHCDetTtRy7iPSj61bvE3WahTOfkzoGksERNEgCCnNehxny3SmSaAiCMHtdakeXM82hYRlWhso3FR/QE1CpP1S9XGmG/g3h0fAjVRHUvboKjg8req8E5KdaGCrEe5LVw/rG3NiSbiylNUXQTFUAEut5VX8jrbUXz5gn95eWUU+TJKKucOJJ+0A13w1VyqGMhI8MiBAR3ni5rrfzp/3Z1FO
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SL2PR06MB3017.apcprd06.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(4636009)(366004)(39860400002)(376002)(136003)(396003)(346002)(451199015)(1076003)(186003)(83380400001)(38100700002)(2616005)(38350700002)(2906002)(5660300002)(8936002)(4326008)(66946007)(8676002)(478600001)(966005)(6486002)(26005)(52116002)(53546011)(6512007)(41300700001)(6666004)(6506007)(66556008)(66476007)(316002)(6916009)(36756003)(86362001)(47845001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?FXJy5wr5r7/WuET0ieFZoM+lkw7Vo3H2BRNa/6WdtHeV22it7+AFL+lMeC8P?=
 =?us-ascii?Q?+1jjT8dTERacMeuAbfHsp6DbkmFWCql/PBXpwFotmisHwrUg3aiHxfCWBGtL?=
 =?us-ascii?Q?OL9RFFDg4KmXlq0wuDfjX5hTPUryCLsCVhP7xhSTz+gEvxJn2fYhoZM9E3F0?=
 =?us-ascii?Q?CcWfaYXvixV9yZYz8YFtxl7Wa+2hnJxVAV7SaQqOpNir5K5c3cW1KcppLmhu?=
 =?us-ascii?Q?VI9rtHHOOGt/RcOd1UjialaLggn3Lqlt0c8hqcrFqj3udwBsTPQrAvXDZHgV?=
 =?us-ascii?Q?2jTEPyyydBGLC+9O60azPCJZ/IrkQ6BsuMb2iBiGPGZABqFuhCCfRk7CYzwy?=
 =?us-ascii?Q?t+1wPz5TnFjC6HHCbg7esZ0Pnip/RNsb2Dr391YZXUOLXZeITeFU0f+MoyoN?=
 =?us-ascii?Q?R+Y3vIEniZPZb16AL+Sm7Li9bZV32+8uSYaGRKlJOxPb12JDkGLa9v2LtUFM?=
 =?us-ascii?Q?lQOp6pxUquDROTLvDz2XLbi11aHTkC37F/Qiwm/sG7f2UVSYM1+CjgpdXA61?=
 =?us-ascii?Q?D7VmYw0+D6E20F1a0j3IsGb9H4rytf5yZZSHnRLpULdDt5w5oOzqy3YM3CvA?=
 =?us-ascii?Q?Z9AEqNie+yvAhdw13Yja/l+NnnLxlxNfQli+bI81jKZAKL2/nn6KQxNyKdSC?=
 =?us-ascii?Q?Z6+tJUyqtbTFIJ4wRqWU54ZPhSLvoyZecAPRQQZlvljdZFt1WRqunPJMSrpf?=
 =?us-ascii?Q?CCiiGmyJi8j4A0lnb0SRCCga+IsNTIjVJz0Cm/8k0NO5rNbocRTGH9gkhq7g?=
 =?us-ascii?Q?VnaJoDPDz5D6A14eEinHpdMupHvL7H6lII0971qeeHqY7pLvVQsGVssNWcMm?=
 =?us-ascii?Q?0X51a/1aTwhxOKXtT18q9xfIlCLlaDkErXeuX1mDkhF/Dp2EH7PwcdAUKqGM?=
 =?us-ascii?Q?Q2lMdc3VnrnVzqdlnSUq6t3PWJrxZErioRn+MVlqIUwNK7sSMNnwEjiRtxeK?=
 =?us-ascii?Q?2/BBBX+JFjOwpzBQMTAdP2baFTlXE10AObFIaucEPsMlo2nbZIU+3cfF6OL4?=
 =?us-ascii?Q?EJJxJ86xko7jCS3NHauui2WhZjnTfnj0Kav1otJifQH4PGqkabJVWyOZiAB6?=
 =?us-ascii?Q?rEAfwtZ3kiR9uux2xJ0u8rMSs317IPe1RkQjCOS9QKLq21nBqQmgfCOfihCW?=
 =?us-ascii?Q?d6oPu+ykr7y1liupP5CMYtQasgSxYozW5/gB0CMo9ydP7Yk+sj98dZLRGeFC?=
 =?us-ascii?Q?ggYkiVlFsWvrGmRHg9/fOWEEYqPXbml9xOpIaBaUYTEQzc1CMUlxHc0Cjmax?=
 =?us-ascii?Q?/vxDjiN+ksAWaE70kmVrW+H85ktJQUJJ6OHC7rcxnenLTwSESr4XZl9WmSX1?=
 =?us-ascii?Q?Io1KkSMWPti0kHwgcwQsJMAgZeu1uvpE239D/o27js1uT8P9a0FYNGwFhyLP?=
 =?us-ascii?Q?/JIGc12yoY7dvcXB7hG/+gEYomGiYh0lHip1XASWRamAxURiw1OMJjMVuOmN?=
 =?us-ascii?Q?8zTr7IiXUKzguLO9POVkV32WpikZgOft2WFtrb+0yw/R+SZDtxEgbnnJYZXV?=
 =?us-ascii?Q?BtxZJuWaK31DxRl3rvU/Le+Vdjt1Ih2sROauosHxtNWnmxmB0kVi3oMlUOXI?=
 =?us-ascii?Q?C6qeLbQlUWwykICOboN5SemMoqrOMATO7Aym+0Dc?=
X-OriginatorOrg: vivo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 69852c8e-31d2-47e9-5731-08da96e955a5
X-MS-Exchange-CrossTenant-AuthSource: SL2PR06MB3017.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Sep 2022 07:10:15.7134 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 923e42dc-48d5-4cbe-b582-1a797a6412ed
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Sd1D4mM5BvJ2P0g9Inp+pD+6tYDNM82T1oaZvpTZW1HHuFHJTXCFfSKoWavG8sd0xaQJasEAva5j4ugneZgVOg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYZPR06MB4256
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 2022/9/14 16:08, Philippe De Muyter wrote: > Hello Wu Bo, 
 > > On Wed, Sep 14, 2022 at 12:04:23PM +0800, Wu Bo wrote: >> As Philippe
 De Muyter reported: >> https://lore.kernel.org/linux-f2fs-devel/2 [...] 
 Content analysis details:   (-0.2 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 URIBL_BLOCKED          ADMINISTRATOR NOTICE: The query to URIBL was
 blocked.  See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URIs: vivo.com]
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [40.107.117.97 listed in wl.mailspike.net]
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
 no trust [40.107.117.97 listed in list.dnswl.org]
 -0.0 SPF_HELO_PASS          SPF: HELO matches SPF record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
X-Headers-End: 1oYjFf-008p49-7Q
Subject: Re: [f2fs-dev] [PATCH 1/1] f2fs: fix to check space of current
 segment journal
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
Cc: wubo.oduw@gmail.com, jaegeuk@kernel.org, linux-kernel@vger.kernel.org,
 bo.wu@vivo.com, linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On 2022/9/14 16:08, Philippe De Muyter wrote:
> Hello Wu Bo,
>
> On Wed, Sep 14, 2022 at 12:04:23PM +0800, Wu Bo wrote:
>> As Philippe De Muyter reported:
>> https://lore.kernel.org/linux-f2fs-devel/20220913224908.GA25100@172.21.0.10/T/#u
>>
>> The warning log showed that when finding a new space for nat the journal
>> space turned out to be full. This because the journal_rwsem is not
>> locked before the journal space checking. The journal space may become
>> full just after we check it.
>>
>> Reported-by: Philippe De Muyter <phdm@macq.eu>
>> Signed-off-by: Wu Bo <bo.wu@vivo.com>
>> ---
>>  fs/f2fs/node.c    |  6 +++---
>>  fs/f2fs/segment.c | 10 +++++-----
>>  2 files changed, 8 insertions(+), 8 deletions(-)
>>
>
> Thank you for your patch.
>
> Unfortunately it does not apply to my 4.1.15 or newer 4.1.y sources,
> and I do not have the knowledge of f2fs internals to modify your
> patch myself.  E.g. 4.1.y lacks the '.journal' field in the
> 'struct curseg_info'.
>
> Could you make a version suitable for 4.1.y ?

My patch is just try to fix the 'offset < 0' warning you have meet. The
probability of this is very low.

To the fsck fixed report you found when doing fsck.f2fs, 'reset
i_gc_failures' log seems normal. And 'Unreachable nat entries' maybe
caused by the 'offset < 0' exception.

If your filesystem doesn't report fsck failures after these 2 cases, I
think you don't need to worry about it too much.

Here is the patch for v4.1.y:

diff --git a/fs/f2fs/node.c b/fs/f2fs/node.c
index 8ab0cf1930bd..fc4d87a1ddf0 100644
--- a/fs/f2fs/node.c
+++ b/fs/f2fs/node.c
@@ -1837,12 +1837,12 @@ static void __flush_nat_entry_set(struct f2fs_sb_info *sbi,
 	 * #1, flush nat entries to journal in current hot data summary block.
 	 * #2, flush nat entries to nat page.
 	 */
+	mutex_lock(&curseg->curseg_mutex);
 	if (!__has_cursum_space(sum, set->entry_cnt, NAT_JOURNAL))
 		to_journal = false;
 
-	if (to_journal) {
-		mutex_lock(&curseg->curseg_mutex);
-	} else {
+	if (!to_journal) {
+		mutex_unlock(&curseg->curseg_mutex);
 		page = get_next_nat_page(sbi, start_nid);
 		nat_blk = page_address(page);
 		f2fs_bug_on(sbi, !nat_blk);
>
>
> Best regards
>
> Philippe
>
>


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
