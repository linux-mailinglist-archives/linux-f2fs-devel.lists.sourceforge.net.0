Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 56DA249BE26
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 25 Jan 2022 23:02:46 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.94.2)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1nCTtg-0000OL-Vq; Tue, 25 Jan 2022 22:02:39 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <harryausten@hotmail.co.uk>) id 1nCTtf-0000OF-5P
 for linux-f2fs-devel@lists.sourceforge.net; Tue, 25 Jan 2022 22:02:37 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=MIME-Version:Content-Type:Content-Transfer-Encoding
 :References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=gpeLw7yJwErO8PIWpxygPviWLz4GjlCFaSfQnCkD2u4=; b=Wfw0py0s8IKP2RxBfrl3L5SN7N
 HHfuLMb0R/dX8YdPN6NmBqepQuz3B9h7H5PRBZlGfIhSvkWw51FtApfU0r3Ir1lx1o0IakZkiemFg
 Vto9JOtpjXwRNcWLRUwW8knw3qgbTJPZWiqYPGgaEuzfUymUdTKGvnOohkC1lGYO5cgg=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=MIME-Version:Content-Type:Content-Transfer-Encoding:References:
 In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=gpeLw7yJwErO8PIWpxygPviWLz4GjlCFaSfQnCkD2u4=; b=ecc/uja4IGTKP7eT7zTvw3dXgj
 dSBSePmH131VQKiRRVajXfWDgE1Tr5Nq+tFPWVnDYfCCL6RICOYhFngVp2z5qf/GnKcJy21WX7vVf
 SU0A/ep01wV3kLezcrwc7wQtjc45PXPWv5VkOAFbWnQChyTULbLdQptFqdgAa11bgR4k=;
Received: from mail-am6eur05olkn2062.outbound.protection.outlook.com
 ([40.92.91.62] helo=EUR05-AM6-obe.outbound.protection.outlook.com)
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.3)
 id 1nCTtc-00D76Q-Ow
 for linux-f2fs-devel@lists.sourceforge.net; Tue, 25 Jan 2022 22:02:37 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Fea/Ou2LylKHDmVjj0AhRqLyX3jgHkvodZjydrtJsoguWKNqol9jNBKqxvuGXBcSzcTOBEW5gm2bg26m+wloB95SOxWouJh77Y3hhqSoyvHNdOFNDT6zcyVXWhggxheZbSKSR1umXJFAmqXivhkrvfPL5g1jMr3DmmAPmYQUPLt9Pfa/xJ3QlH0I9P9ZDpodNplOlls5bgQfJdmyMWTxap14HRrs50Zjnxi8L46uqXhf4fS8VHwf59fFZljU3RZUa4lDokpprvSTZ1r01AYSX+t/LvLerg7NKa8CUOKVWQQyKGwIxpGR8gM0PxfvvuhbxZkRR3C1mb3C/WWFI6qI9A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gpeLw7yJwErO8PIWpxygPviWLz4GjlCFaSfQnCkD2u4=;
 b=h8RjgzmzAQ79rb6l1Rysv2QtMTWPdswjFulFzKPY8Rm+pfhYpyWNZHJI8vll+z15nxGW+FPgDTV73WjiP6jXBqrqVCeiYCHJz3TPurOsc0ra12RCctHGlnArjsq0nYOGL4oQ84+vBjVNWpgK79aRmpc8IfkE+3VZ9JhW2wZcS7sZJJeMvLBUBpFqNKecWSsIHg49zA/bIhz2YYoxWCjK67VZHKYIYATgRSUlhWwwupvUhZB/UjWGi7wjJloFGtmLt3QHbC8AzkTsyc98puy9gIFwh3bVXlAnwWxNVlpPWyDJ2u5HUwQA3diqG8PUX1RNAVHQPM59rKYJCLvuY6vJCQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
Received: from AM6PR10MB2838.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:20b:a2::21)
 by DB6PR10MB1653.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:6:38::26) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4930.15; Tue, 25 Jan
 2022 22:02:28 +0000
Received: from AM6PR10MB2838.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::29d8:5a1d:50be:a0b6]) by AM6PR10MB2838.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::29d8:5a1d:50be:a0b6%6]) with mapi id 15.20.4909.017; Tue, 25 Jan 2022
 22:02:27 +0000
From: Harry Austen <harryausten@hotmail.co.uk>
To: Harry Austen <harryausten@hotmail.co.uk>,
 Eric Biggers <ebiggers@kernel.org>
Date: Tue, 25 Jan 2022 22:01:49 +0000
Message-ID: <AM6PR10MB2838705554FCB6ACE86F12BBFA5F9@AM6PR10MB2838.EURPRD10.PROD.OUTLOOK.COM>
In-Reply-To: <Ye79OLCFLR3H+GnY@gmail.com>
References: <AM6PR10MB2838873D61CE1C0DB91EEDB9FA5C9@AM6PR10MB2838.EURPRD10.PROD.OUTLOOK.COM>
 <Ye79OLCFLR3H+GnY@gmail.com>
X-TMN: [uvzwg11jerwOnBqCsa8BE52wtgSSAWpJ]
X-ClientProxiedBy: LO2P265CA0262.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:8a::34) To AM6PR10MB2838.EURPRD10.PROD.OUTLOOK.COM
 (2603:10a6:20b:a2::21)
X-Microsoft-Original-Message-ID: <5424699.vVTlMVzpOe@harry-linuxpc>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 6c8131e1-80fc-47ee-9e1b-08d9e04e6014
X-MS-Exchange-SLBlob-MailProps: S/btQ8cKWiQenZB4DUk7DorRi9oy43xdUPAaBiiV1Z2nZWdOyrxe5ia1KChvwMPz8paj/kntkMwYtMxTeifkvf2Evtfv37DEM3LTYlJsf1AZZh5yDoz6BnCCacfyA3wJs19J0TUFx6FqXnyHptdHEaJNpPtL8Is45KDLkqkglWefJGb9vZ/9IoUCl/I+wn5di8NEgstQ5aH3TPwW4uryjAb78WMIJnboAq9AlZak9DKTxx4wKZTRxT5YbU/lE0pkNF4lnjhrffMszKEdaKXf27n/fzLiLVMx4Kbjv9kGGE8PfiZ47hYz6pDH7UIFZs57mvzTcZE1mciUCDwSBkpDOCjAUwzvRav99c1thQ7XUBfqhZwDJhzz9QSo2yMeixTxI4hR6AvEw00pI8C8DfHHTsZT725hor78wWKgHchGZ9ML9QehlVtFn0bBV4BbeVbCY+FyYU6IYKLucYZzofHO7Azv5OZn4C9INjHUi3INYU1AbJFrWA9AdmGeKHXRIbr82fDaSnJyoyYcRbsnOVeyOsUPwv5PdhDPHm1PRxUFTJv5xSd+xpEkgINRf/+zU8+YqRA6Td4e2sfzAlHrAr7WH8F3ju1PtZnn3Z1CW7IY/KPxq/go2K0ADV5RqY31Qzdw8DMhBkvK7MQzv6JbzHk9LMIetJcwTRa53tjrmf3Hdw7OdrrBCmezTzQUMCMHwRbB3d7tDt685gaXS0qXvvDr550CHeLXGnoqv3QqU6zc127VjHxFfeyWT4mUDw6vCbx9vgonOBvtTXA=
X-MS-TrafficTypeDiagnostic: DB6PR10MB1653:EE_
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Q3qFY1f1ywh37XnmU4DBj81Bq9p75OLx7vIsDZqBEkfE0eDzQ2uTwlQxLUiNfIiMYscCv55chjbEjwLv0o9vp99z8Q50fp6Rq8IE1QjKi+szlwoxVKPP0Rhd0mZ0nIg+Wv0Vt8N1tUWDjUBCO8veDKLIX05AIlRKgvz/yXWk+v4fcipWgbpS0QCLoFexNwatqLWL7npkmju2s5BHLC+z5TDAA9O7MsJ4FhoUTh6JENBmqmK4+zAd3FtIeZbTceboHNh11Z1EpkBSMhdR1czkUShJlMwl4tu8bcKN2IwdNDsSYzuP83Fh0VIj18vqgL4N7cLitjy3Xa36YxHEnFe5wb++buYG9fjtVv/P+7BfhHLPOUKXUHUWy6bGqbuLUL/Tp/i8IYK4s1OBz1Y6QKRDyewsS/mONdRvaDV+NQg88VHoRhWqqs04h9hwcfcrB6zSUr7tqG6PjEg4U8Zff5fPnW5+L8HNhOerb6czwrgfhLiISoxAFqIgUKufsodXjcIcOhSz8DgQet3CueU1gjOqEo6y/UMy6UeDym9thxkcFSmnefowWglTkDoTysed7qe+vVU6Zihpuw80zVMe2kKTMg==
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?Z4v4o6elpD9fR96iax47dUN4RBCm+x7EXW4CCgBGkwVBW5/fw0eCss97AmJB?=
 =?us-ascii?Q?4+lJqqoQnCDf2LcjAGO6j4mBhin2NA472e9NU/xtl1ldEMO8kx7xiNmp920A?=
 =?us-ascii?Q?xaB5e8+gfcBhXzyDKfwPiKI+eslJ+PWvyWJe5SGWF9DCGVdtdmyVdIzRX0cs?=
 =?us-ascii?Q?+JYbejRXohtG1mfMLcsqyO9593NrppADnirTmeS0mHDmR+zmPYe7s88NLxkQ?=
 =?us-ascii?Q?+EFoXO7cuDbPKiglE/+42xZGhiRgCui9ndmqKyKYJOv103V1Q+BtWOut2qWH?=
 =?us-ascii?Q?uoRKIDnQV9nGf7LaWA22+qymRIgFSbb89rcRJiGr1v9sKuVUs6rGjjZAz0xs?=
 =?us-ascii?Q?hFyHSzSaDEklwzsJI0y7kdCtBhOwhZC6NK9KLy05ipQYxvN4EulnWsl0vrZ0?=
 =?us-ascii?Q?2b31WZ1J56hwl8aXxiT70xeED4/X9FQqHOhawgONl7RB5mxycb1ZCpU3qu78?=
 =?us-ascii?Q?LvxoW+EZVKFVErIw01iGIA5+D+Z3j90AJnEUx/eRpmBeAhiERgaLz9aZGxX7?=
 =?us-ascii?Q?Wk2Fztxxdw9ZchCkpuGiBGG5UIcGhsBsF4R5nIqE96+b2EDHXbY5/dgyOdYc?=
 =?us-ascii?Q?K2280Vxkjkpo53cMoGBFXm6P+fWtW8DBBxIosBb+UL1o8t9Jr1lYhQ4ZmBdR?=
 =?us-ascii?Q?wF6jRIBsnf3plIfoIpPln/SI5rmBBZuAH5S+7c3zsqmaXzsguztRmv972qyK?=
 =?us-ascii?Q?Ug4MVHl8VZ9XszqXHC9Z6WAcdCMGCXYFW2PWPN82cMWR3A4MHR/tRWwHFU1c?=
 =?us-ascii?Q?2RyFGNXapZdX+r8hTZuy1upG2f0YTWVKNHnKQvM4o8c0qARMsxjnEXS/aPwm?=
 =?us-ascii?Q?AMY7/RH3B2cgdDGl8oWcJ3WGYI5pJ1DfDwtgOoInROTcm0czi4YZuEuPSZD0?=
 =?us-ascii?Q?O0Y4GupiqAYujS4xfPHD5K3y7k2zgNcQ81mZE/+6oVu8p/iKbST42IEA82A1?=
 =?us-ascii?Q?JeagEfwUKm0MASBA5K+nCw=3D=3D?=
X-OriginatorOrg: sct-15-20-4755-11-msonline-outlook-6b909.templateTenant
X-MS-Exchange-CrossTenant-Network-Message-Id: 6c8131e1-80fc-47ee-9e1b-08d9e04e6014
X-MS-Exchange-CrossTenant-AuthSource: AM6PR10MB2838.EURPRD10.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Jan 2022 22:02:27.8670 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB6PR10MB1653
X-Spam-Score: -0.0 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On Monday, 24 January 2022 19:25:44 GMT Eric Biggers wrote:
 > On Sat, Jan 22, 2022 at 12:59:03PM +0000,
 Harry Austen wrote: > > FS_IOC_SETFLAGS
 ioctl should return EOPNOTSUPP if the file attribute > > [...] 
 Content analysis details:   (-0.0 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
 no trust [40.92.91.62 listed in list.dnswl.org]
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [40.92.91.62 listed in wl.mailspike.net]
 -0.0 SPF_HELO_PASS          SPF: HELO matches SPF record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 FREEMAIL_FROM          Sender email is commonly abused enduser mail
 provider [harryausten[at]hotmail.co.uk]
X-Headers-End: 1nCTtc-00D76Q-Ow
Subject: Re: [f2fs-dev] [PATCH] f2fs: fix fileattr_set unsupported attribute
 handling
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
Cc: jaegeuk@kernel.org, linux-kernel@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On Monday, 24 January 2022 19:25:44 GMT Eric Biggers wrote:
> On Sat, Jan 22, 2022 at 12:59:03PM +0000, Harry Austen wrote:
> > FS_IOC_SETFLAGS ioctl should return EOPNOTSUPP if the file attribute
> > (e.g. FS_NOCOW_FL) is not supported, rather than silently ignoring it
> > and returning success.
> > 
> > Fixes: 9b1bb01c8ae7 (f2fs: convert to fileattr)
> > Signed-off-by: Harry Austen <harryausten@hotmail.co.uk>
> > ---
> > 
> >  fs/f2fs/file.c | 3 +--
> >  1 file changed, 1 insertion(+), 2 deletions(-)
> > 
> > diff --git a/fs/f2fs/file.c b/fs/f2fs/file.c
> > index 92ec2699bc85..061bf35c2582 100644
> > --- a/fs/f2fs/file.c
> > +++ b/fs/f2fs/file.c
> > @@ -3085,9 +3085,8 @@ int f2fs_fileattr_set(struct user_namespace
> > *mnt_userns,> 
> >  		return -EIO;
> >  	
> >  	if (!f2fs_is_checkpoint_ready(F2FS_I_SB(inode)))
> >  	
> >  		return -ENOSPC;
> > 
> > -	if (fsflags & ~F2FS_GETTABLE_FS_FL)
> > +	if (fsflags & ~F2FS_SETTABLE_FS_FL)
> > 
> >  		return -EOPNOTSUPP;
> > 
> > -	fsflags &= F2FS_SETTABLE_FS_FL;
> > 
> >  	if (!fa->flags_valid)
> >  	
> >  		mask &= FS_COMMON_FL;
> 
> This is intentional, and matches what ext4 does; see the comment in the ext4
> implementation of this:
> 
>         /*
>          * chattr(1) grabs flags via GETFLAGS, modifies the result and
>          * passes that to SETFLAGS. So we cannot easily make SETFLAGS
>          * more restrictive than just silently masking off visible but
>          * not settable flags as we always did.
>          */

Ah, my apologies. I thought it looked a little too obvious. Clearly I
should have looked at the ext4 code. Please disregard this patch.

Is there anything else that could be done to improve unsettable
attribute handling? For example, is there a reason FS_NOCOW_FL is
gettable but not settable? Could it be added to the settable list?

> 
> Also, even if this patch was correct, the Fixes tag is wrong.

Having looked at this a bit more, I assume you are saying this due to
the missing double quotes around the commit summary? (just so I know for
next time as this is my first attempt at sending a kernel patch)

> 
> - Eric

Many thanks for your help Eric,
Harry




_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
