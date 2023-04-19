Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 6AF806E70C3
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 19 Apr 2023 03:32:47 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1powgb-0003Cq-2A;
	Wed, 19 Apr 2023 01:32:41 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <bo.wu@vivo.com>) id 1powgZ-0003Cj-CL
 for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 19 Apr 2023 01:32:40 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=MIME-Version:Content-Type:Content-Transfer-Encoding
 :References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=96T5WmEHCJBYVcJeMl678w15kvCq8emcKamJlX5LZk4=; b=mCvWQin6G/9EAoEB+pbKulf1rf
 bWRirRQqSBV2ANt/jJZM2I8zwgVwGbIOBETy0PTdVjaUnSG96cn3PgHUfd29G8fClPluuYv2sDboj
 1fFBsHkD0F8aeseCPNfoqYP70in8xPHlujf01NtitbCKitNnXpFP2z5tBLkS4JEKDP7E=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=MIME-Version:Content-Type:Content-Transfer-Encoding:References:
 In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=96T5WmEHCJBYVcJeMl678w15kvCq8emcKamJlX5LZk4=; b=SBsHkvmjY8NAF7clbKXKEEUcK3
 TlbVYVlch6xcOljKD8D4dEUJTDRc4XSVzoyMGJq7MwR2KbzCs6wKNxZ7lWdlirz3fgsYZcOzw4Npt
 L3OEWJvz8UojAI6pvRB7eY8fgv0TYt2vjZD8rJyUy3VdQr3b0LM/qalKXrKJdM9l/a2o=;
Received: from mail-sgaapc01on2138.outbound.protection.outlook.com
 ([40.107.215.138] helo=APC01-SG2-obe.outbound.protection.outlook.com)
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1powgW-00BvSy-RW for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 19 Apr 2023 01:32:40 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=kMULC+HTJmpzh4fx5sXofV6X6tYsoWGURJzDR91o/RaUX4n0Z0M5Jix8wl6DB7nl2Ilqmhb3V7HhGjVDu5htTYrVU8OaDmSuw+jILWFYahKChc8VBpzTijwtnV7Zpn4EV/LkP5mS1IdZQ/lq3KdyzmZsyf3q7gaLpSthOUt5SbIfgb4z6iwlcHWZVIjRZchDCo+GgzV+RRK0DW1HKU9+qSANjsYVCQjGhq8lof3YQU+BCNyAigG/GbDKu6vggWGro7csZeuZrP7Zs+idEbUUAbvbiLrbTeQBvUpnsW1H3SJAZ/yykjw0b6UjUIUFqGkdRBQ2UKTEbaw6+7x8YolJ5Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=96T5WmEHCJBYVcJeMl678w15kvCq8emcKamJlX5LZk4=;
 b=Lp3afQnWvUamtUbrq5pEy6fQ69f0rpO0vbMgYRD5Qi031uLgwUX1Lclvk34LAeN1C4AWzBzH8RagIw+D20NjZwfIkadFl0DvIPUFHr24dfEUxCM7zb9WiaHNMdZGLhJouACp6a0btIcSzk23EzDQ7t4zRNfn3cUAD+vIWStJpVerA2tNPYoEHKp/roj6FK737itkRAC6QR3TfKLIy0HU32GFSMQ6xmpGoQinAOdCsGEksnu33ZVCDUK44Y1Kq3w5fZwoGeqNKjCn/+UUVv0ybZwhtabjQTRVNApOtZ3JimWlWItVTG8uslwBfo9KvyTJ/YbS+HAumYSDdkvi3VCRbw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vivo.com; dmarc=pass action=none header.from=vivo.com;
 dkim=pass header.d=vivo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vivo.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=96T5WmEHCJBYVcJeMl678w15kvCq8emcKamJlX5LZk4=;
 b=o3lk2aurwuUjfPvNH4T7Th6XcKfs3/gleiDEHV+kqzbzzKnXC/NJugQRvOu7tC8dCNDZ8Odox6V4tOjTlyT8u67wnFk6eNPDLI8o5OcG8dcy2PQKhTkHH+GyPgc3nYaove9iDMGmz1sVxh/oABx4y75A46c4FwQ2QuatCuXH1Q3G0P0c5mMb4nlvg+sDiDIWvymoLPJgoi57gDS4opDTev41g2xvWjo1cVykOMxj8a4jn0H+c8KABxc6cAXRSUDyoaBB6WBaSELRYQTCY2msSyivy8g60fOEuyM1ZmYKyFDlRiCYCclJzIkVpOhr0C8WFMf6S/W4hwbdx1MRDPcbKQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=vivo.com;
Received: from SL2PR06MB3017.apcprd06.prod.outlook.com (2603:1096:100:3a::16)
 by KL1PR0601MB3875.apcprd06.prod.outlook.com (2603:1096:820:21::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6319.20; Wed, 19 Apr
 2023 01:32:24 +0000
Received: from SL2PR06MB3017.apcprd06.prod.outlook.com
 ([fe80::4d33:acf:26b3:3d4a]) by SL2PR06MB3017.apcprd06.prod.outlook.com
 ([fe80::4d33:acf:26b3:3d4a%7]) with mapi id 15.20.6298.045; Wed, 19 Apr 2023
 01:32:24 +0000
To: chao@kernel.org
Date: Wed, 19 Apr 2023 09:32:15 +0800
Message-Id: <20230419013215.28663-1-bo.wu@vivo.com>
X-Mailer: git-send-email 2.35.3
In-Reply-To: <e2ec7e19-634c-a065-fe7a-b052d02d4752@kernel.org>
References: <e2ec7e19-634c-a065-fe7a-b052d02d4752@kernel.org>
X-ClientProxiedBy: SG2PR03CA0125.apcprd03.prod.outlook.com
 (2603:1096:4:91::29) To SL2PR06MB3017.apcprd06.prod.outlook.com
 (2603:1096:100:3a::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SL2PR06MB3017:EE_|KL1PR0601MB3875:EE_
X-MS-Office365-Filtering-Correlation-Id: a7c88992-ab1b-452f-7bdf-08db4075ed39
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: BJsLXzxomyse54x0Hm0ONM2c1mSaQLdKQOdzN3FcVNZ8oHA/XSzLILWFa3nBag/LW8r2+/O6kt1wxKVZGDpeVIxCk9sp8Bq9A/CMObpQRldaxGKQz1O2jANfQYTQBpq3ZKmT8rE2u0/+cS6S/OxWdIGaBtgaLLJnN+e0cYgVGgbDg+xIi53Rti82EXsh7/rlRompd04veWA5s9Xgpb/XGsFpDsY/QzZXCIe/Pbvy7DSDdvKJoCKXBcmtiasBPjkP996QyICYC07LpZcy47rmrTQhnjSJFByMAD/v/j77Fex8UZjOW+mqSkETy6Wh/ijhAuBPgItUaqVXshltO9KBoZVMF5WLVJ4/TJmqHkFZO/eD0/FqcpDPycDPwfpyax6DoBeUiVy6R9usdEmt5xOS084nDA6Ejx98oHu81nAU5/ikUFb2wlQtWvUELKDhJVH/9D7xCUmU89fIQfL+X8TF+zDplCp67tTn/XIw1jeDzbsv2F59QBMrgamVjsKkLlpeohyvkf3DQZAEKAqOxpESGXDzTmHI7mngrUf0wjbEH5Mo1+ziCGsV3MZcUG3RMaOXi5jZCFe8Cn6c3voswjlhGlnyK0a1yyLpMKQBgv7QCc0=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SL2PR06MB3017.apcprd06.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(4636009)(376002)(346002)(396003)(39860400002)(136003)(366004)(451199021)(66476007)(316002)(4326008)(66556008)(6916009)(478600001)(66946007)(8676002)(8936002)(41300700001)(38350700002)(38100700002)(53546011)(83380400001)(6666004)(2616005)(6486002)(186003)(52116002)(1076003)(26005)(6512007)(6506007)(966005)(86362001)(36756003)(2906002)(5660300002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?bpjtD/fReXf2Lfq+pg/hY5q5ePsI4Oh0WYD44VmlabnfzpkFrKpANuam+zyW?=
 =?us-ascii?Q?F9Ul13nt3C9GPJ7Vtt5tI/oDCqA3AkKmWaLsysgJ7H0SRsoD8EBXXQp9/dNu?=
 =?us-ascii?Q?PVtyUqhJm4uI/CNkfcaxf+JQ0ZPl2DBqfAN95miOPe8rVf+3DUmgGSe/PjC0?=
 =?us-ascii?Q?b5u88F0gocSHvCNggIJ6HNEiz5/1UE2+rISieJ1pxmH84MjzLsivNcYgpigo?=
 =?us-ascii?Q?of2ctd4bcijADzDCzVTaUiMZHAdn6LInWzMzyqw4pfkAphed4tbx8dYor4uF?=
 =?us-ascii?Q?rIGCYqcsc8eVQo8EHVLkgB4ArLoIe3Ck9nkQ4Q/H6Q7blWVqMyxKMNRii/8Z?=
 =?us-ascii?Q?jeseSnREFAiz9YtBasymeNCES8IgOo+4qdTR5j243RYDNOP6BSF2Y3mZRI6u?=
 =?us-ascii?Q?tYHJcaekxMfj7haZzTPaMTS5ITGy+BOBjbVHrrpWahyQNLtwKDAVGrZ7qLvO?=
 =?us-ascii?Q?aAFpjWdqNyjA4DNCOISqoBgpHatHn/NKI8h0/aWW3rulmj6GUHG3FPNZCEdQ?=
 =?us-ascii?Q?lCdvi4lIvgw5WssRBMtEePZVolTN6prQeokCH+RUsb4FmODcbx3Q1CsN+5i0?=
 =?us-ascii?Q?Lv0t0ft/YjzkUBnNEixaqcYBUezjM3QLB5PtT+YWwZAK9iagBTOd02jyw8Mt?=
 =?us-ascii?Q?YTfeadXVO4X1ptp/G1KYxTeDYCA+9rggDDKEDE0V7AzvJY0MgYzTnrX6WDiW?=
 =?us-ascii?Q?eJc2+AkVBmkN3Yi9MlbtVUR9S1ZNijZOJVyniLYd/PnGKJshqR/zXmQxhj6C?=
 =?us-ascii?Q?bra6DpF9B+60/2z5jwQVLrM1p5lkNbu5bq+vJlvDZQ7f6JSpUEiyjyXLTd3Z?=
 =?us-ascii?Q?2+7fsqiINIPaPOtO6Ce6/OV3ILfHOsgWvPQxPAZlty4fFf0MB52HnzrnpaCS?=
 =?us-ascii?Q?7xLXiifEHA1jOO19YVSQbzzWsJDoJkixGJMH73WfFFXvV6WpPJUkuuTGJfxR?=
 =?us-ascii?Q?u8H2JcMwAch7ZxEMuAXIyq4XS9ixuji3NT/M/r5Qm1MFkkPt126z791Rv8Xp?=
 =?us-ascii?Q?RPgBFAGF/mhf+uU9i2ot/eX1g+J6nOC6vteaHLB4h2fs+uQaznG54te3ipby?=
 =?us-ascii?Q?NHYGkCDpyBsWGRSTIJ4Bc2I1ylEnsXoeOyuEiZH2Cb00z5boJyTaitMOQKQA?=
 =?us-ascii?Q?+C1Q6rWnGi9FeVrumoAfdN6E3KRAQG3tvp2HbDNlnva6lW0NRhbSI+Dq3uhv?=
 =?us-ascii?Q?gW13rR1hsC8+Rt5Ng2i8dloMQFDbM/AcwVAKyI34XmT+67lFTuNNMFpAaPZh?=
 =?us-ascii?Q?faO7iD07xXZMNP6tfXPuYFOWCRLOAaVq5ac+oK/xEC9SlR5kS2SwL4Y5o+Mp?=
 =?us-ascii?Q?cCWcI++vwTXFUZHgVvU/KvzHGJcnHWLnVSAhqjoCoBsVU4J8XgJdCSsXIj/V?=
 =?us-ascii?Q?29GmgSHaHNSSwoYxko8U5MB2ZuKxgpgSc/gVDOiu126YXyCU4OHCLseh10KE?=
 =?us-ascii?Q?hcUIB/DvAVb0jOTFyoEM+cbB5vbGgUiqb75Ty6pRF5zHsv1mHRmuOw37CDKg?=
 =?us-ascii?Q?fvgUuYEzu5gURwx4pw45VhdG9N09cONhh/Z8np51zRSzgag4tGsscFtSRzet?=
 =?us-ascii?Q?0vdiz6PeXXL/NozS1SgqfEXfR4nFKa46MygVqNqh?=
X-OriginatorOrg: vivo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a7c88992-ab1b-452f-7bdf-08db4075ed39
X-MS-Exchange-CrossTenant-AuthSource: SL2PR06MB3017.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Apr 2023 01:32:24.0656 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 923e42dc-48d5-4cbe-b582-1a797a6412ed
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: xI7iB1OwuGQ54al+DrQIvfBkLA9WWVDIw1b883T81u3SS+MkM9Nf75xTByDj41vvNA57jEgyHGRhdWYjYXjSDA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: KL1PR0601MB3875
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 2023/4/18 23:51, Chao Yu wrote: > On 2023/4/14 18:43, Wu
 Bo wrote: >> It would be better to use the dedicated slab to store path.
 >> >> Signed-off-by: Wu Bo <bo.wu@vivo.com> >> --- >> fs/f2fs/file. [...] 
 Content analysis details:   (-0.2 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
 no trust [40.107.215.138 listed in list.dnswl.org]
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [40.107.215.138 listed in wl.mailspike.net]
 -0.0 SPF_HELO_PASS          SPF: HELO matches SPF record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
X-Headers-End: 1powgW-00BvSy-RW
Subject: Re: [f2fs-dev] [PATCH 1/1] f2fs: allocate trace path buffer from
 names_cache
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

On 2023/4/18 23:51, Chao Yu wrote:
> On 2023/4/14 18:43, Wu Bo wrote:
>> It would be better to use the dedicated slab to store path.
>>
>> Signed-off-by: Wu Bo <bo.wu@vivo.com>
>> ---
>>   fs/f2fs/file.c | 4 ++--
>>   1 file changed, 2 insertions(+), 2 deletions(-)
>>
>> diff --git a/fs/f2fs/file.c b/fs/f2fs/file.c
>> index 15dabeac4690..27137873958f 100644
>> --- a/fs/f2fs/file.c
>> +++ b/fs/f2fs/file.c
>> @@ -4361,7 +4361,7 @@ static void f2fs_trace_rw_file_path(struct
>> kiocb *iocb, size_t count, int rw)
>>       struct inode *inode = file_inode(iocb->ki_filp);
>>       char *buf, *path;
>>   -    buf = f2fs_kmalloc(F2FS_I_SB(inode), PATH_MAX, GFP_KERNEL);
>> +    buf = __getname();
>
> How about:
>
> buf = f2fs_kmem_cache_alloc(names_cachep, GFP_KERNEL, NULL,
> F2FS_I_SB(inode));

Using f2fs_kmem_cache_alloc is able to inject malloc error.
But here is a trace event, is it ok to inject error in a trace path?

>
>>       if (!buf)
>>           return;
>>       path = dentry_path_raw(file_dentry(iocb->ki_filp), buf, PATH_MAX);
>> @@ -4374,7 +4374,7 @@ static void f2fs_trace_rw_file_path(struct
>> kiocb *iocb, size_t count, int rw)
>>           trace_f2fs_dataread_start(inode, iocb->ki_pos, count,
>>                   current->pid, path, current->comm);
>>   free_buf:
>> -    kfree(buf);
>> +    __putname(buf);
>
> kmem_cache_free(names_cachep, buf);
>
> Thanks,
>
>>   }
>>     static ssize_t f2fs_file_read_iter(struct kiocb *iocb, struct
>> iov_iter *to)
>
>
> _______________________________________________
> Linux-f2fs-devel mailing list
> Linux-f2fs-devel@lists.sourceforge.net
> https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
>


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
