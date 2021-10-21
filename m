Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F26C43683E
	for <lists+linux-f2fs-devel@lfdr.de>; Thu, 21 Oct 2021 18:45:01 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1mdbBV-0007bj-EG; Thu, 21 Oct 2021 16:44:53 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <daeho43@gmail.com>) id 1mdbBU-0007bQ-3R
 for linux-f2fs-devel@lists.sourceforge.net; Thu, 21 Oct 2021 16:44:52 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:Cc:To:Subject:Message-ID:Date:From:
 In-Reply-To:References:MIME-Version:Sender:Reply-To:Content-Transfer-Encoding
 :Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=rSAcocb1DpnBRWVfk8RW3057aiiYng+OMM3MbVC7Tos=; b=QDVJMTM4TgGX0fTLNI+NxjNMiY
 clqLPfjleN7GMz2C2rg2PbvXBQSAB52abbWnKqF9XD60yZgO0Xu8XqgadFnJKokpqNiDwuH7ARqGH
 ebjHBn+BaoEVN4qQtFvIhMoEMRoZGVMzodKlyW3dYw5RgIXfeVNajzNJFGbKd4iztMSg=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
 MIME-Version:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=rSAcocb1DpnBRWVfk8RW3057aiiYng+OMM3MbVC7Tos=; b=gjrp2S0L2y6dD4KSB64pu9VC2F
 Qvt9A7ga+55A0IB2elN+zEiqXFMp0J72C3nL3E1wcHJ+ZXyUUOxElKz5S0vi+Wt0/23P1I+gUWgnA
 8UI2NysSG94Ag0zva08zHVtevPn36+Xi7lPaTaDAmZtlhUnBg0S2lCtLLuyUKfxuVxUU=;
Received: from mail-lf1-f53.google.com ([209.85.167.53])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.92.3)
 id 1mdbBT-00AXPF-BO
 for linux-f2fs-devel@lists.sourceforge.net; Thu, 21 Oct 2021 16:44:52 +0000
Received: by mail-lf1-f53.google.com with SMTP id y26so1579146lfa.11
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Thu, 21 Oct 2021 09:44:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=rSAcocb1DpnBRWVfk8RW3057aiiYng+OMM3MbVC7Tos=;
 b=kS5wsvBUxmJmOtn1/RXJwN3TZzeP3kBEraI2Yit+v+QTjMaxkrnthAm0qhawJY03Lb
 4x86yMCxq3DEQBcQF0sIhsa/2niqUCWDRmRL5osvkWllWWuXwTD+3/q1S5Y/RGwja1Jm
 DNkpT90I+HzdkMcRA1uV0Ar4d77vXPRignToKaNB6tvCgaxYGWagqvQ0ecdbhBtzs7X/
 zF7RQ2XxYIMy4WCSto4wNexakV+/z7KjYgQ8BPjKjBq9hUuK3Vin1hVTtLz0EabDbx2f
 Yfvqih+WQRVcB1sEau3rkLxnSI7WPGVicVDOOYT3pO5pzIyHtqnv0EReNYb4XGwotTkK
 1Xiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=rSAcocb1DpnBRWVfk8RW3057aiiYng+OMM3MbVC7Tos=;
 b=bFThay1fh7zgqqPch+jb+arKLsSqQLDVRML0bBf8mCoDrLaFdDOM4sHtQ5BGEeS7JE
 CauPB1ANSJdYns1RZ5VFbxrm8igTOIEoIbD7h7ZpwYikgOt6v4iYtLlZlxUZgQqcEfWH
 jX0J5OM6nLSrNZefikKoKmpMQKGWCLmz+Ys0qy6rEgaMCDLKITZMAcnzYKe3IoibAy2K
 iMW9pIbaQ/iAuw6S+hfZ5RxHh39LN41D2tgo1suhf0OsdmcarSx1u8Dkrwb/5K/GKDTN
 PPf7Zgik+PVY5D0lRo+lyyLlXnzvlYphfoDiXuTa3uTlDD4NCCJfeOAkZsNGg9HKoEfu
 AP4g==
X-Gm-Message-State: AOAM533PpZGbzOJ8eC2F97pYEGbkhNDGPR6tW4lSluuHbq3b17PttBtn
 NYe1JjUtaBYaWFLNDC9q7SOoa+H3eGQOmzw0G4c=
X-Google-Smtp-Source: ABdhPJyRNBXjn9wxdZ7MbFFAfuc7SgOiEXEZ1NEqOg8ud6/szO1n+6DKtP3IvN6ZfsIux+0s0nXk159Jadl1pvhoQhY=
X-Received: by 2002:a19:6742:: with SMTP id e2mr6220633lfj.568.1634834684740; 
 Thu, 21 Oct 2021 09:44:44 -0700 (PDT)
MIME-Version: 1.0
References: <20211014190503.717830-1-daeho43@gmail.com>
 <e8b106fb-2878-2fa9-788f-965eef179a85@kernel.org>
In-Reply-To: <e8b106fb-2878-2fa9-788f-965eef179a85@kernel.org>
From: Daeho Jeong <daeho43@gmail.com>
Date: Thu, 21 Oct 2021 09:44:33 -0700
Message-ID: <CACOAw_yupuz+Xx-z9V0UaExuARHd8H9rruWCa2yj5-mgkeuUtQ@mail.gmail.com>
To: Chao Yu <chao@kernel.org>
X-Spam-Score: 0.1 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: There is a deadlock between sb_internal lock
 (sb_start_intwrite())
 and dquot related lock. It's because we call f2fs_truncate(), which eventually
 calls dquot_initialize(), while holding sb_internal lo [...] 
 Content analysis details:   (0.1 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
 no trust [209.85.167.53 listed in list.dnswl.org]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 0.0 FREEMAIL_FROM          Sender email is commonly abused enduser mail
 provider [daeho43[at]gmail.com]
 0.2 FREEMAIL_ENVFROM_END_DIGIT Envelope-from freemail username ends
 in digit [daeho43[at]gmail.com]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [209.85.167.53 listed in wl.mailspike.net]
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
X-Headers-End: 1mdbBT-00AXPF-BO
Subject: Re: [f2fs-dev] [PATCH] f2fs: remove circular locking between
 sb_internal and fs_reclaim
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
Cc: Daeho Jeong <daehojeong@google.com>, kernel-team@android.com,
 linux-kernel@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

There is a deadlock between sb_internal lock (sb_start_intwrite()) and
dquot related lock.
It's because we call f2fs_truncate(), which eventually calls
dquot_initialize(), while holding sb_internal lock.
So, I called dquot_initialize() in advance to make the 2nd calling of
it in f2fs_truncate() ineffective.
This is similar with the thing in f2fs_evict_inode() in inode.c

Thanks,

On Thu, Oct 21, 2021 at 5:11 AM Chao Yu <chao@kernel.org> wrote:
>
> On 2021/10/15 3:05, Daeho Jeong wrote:
> > From: Daeho Jeong <daehojeong@google.com>
> >
> > We detected the below circular locking dependency between sb_internal
> > and fs_reclaim. So, removed it by calling dquot_initialize() before
> > sb_start_intwrite().
> >
> >   ======================================================
> >   WARNING: possible circular locking dependency detected
> >   ------------------------------------------------------
> >   kswapd0/133 is trying to acquire lock:
> > ffffff80d5fb9680 (sb_internal#2){.+.+}-{0:0}, at: evict+0xd4/0x2f8
> >
> > but task is already holding lock:
> > ffffffda597c93a8 (fs_reclaim){+.+.}-{0:0}, at:
> > __fs_reclaim_acquire+0x4/0x50
> >
> > which lock already depends on the new lock.
> > ...
> > other info that might help us debug this:
> >
> >   Chain exists of:
> >
> > sb_internal#2 --> &s->s_dquot.dqio_sem --> fs_reclaim
> >
> >    Possible unsafe locking scenario:
> >
> >          CPU0                    CPU1
> >          ----                    ----
> >     lock(fs_reclaim);
> >                                  lock(&s->s_dquot.dqio_sem);
> >                                  lock(fs_reclaim);
> >     lock(sb_internal#2);
>
> Sorry, I still didn't get the root cause of this deadlock issue, could
> you please explain more about this?
>
> And why calling dquot_initialize() in drop_inode() could break the
> circular locking dependency?
>
> Thanks,
>
> >
> > Signed-off-by: Daeho Jeong <daehojeong@google.com>
> > ---
> >   fs/f2fs/super.c | 2 ++
> >   1 file changed, 2 insertions(+)
> >
> > diff --git a/fs/f2fs/super.c b/fs/f2fs/super.c
> > index 86eeb019cc52..a133932333c5 100644
> > --- a/fs/f2fs/super.c
> > +++ b/fs/f2fs/super.c
> > @@ -1370,6 +1370,8 @@ static int f2fs_drop_inode(struct inode *inode)
> >                       /* should remain fi->extent_tree for writepage */
> >                       f2fs_destroy_extent_node(inode);
> >
> > +                     dquot_initialize(inode);
> > +
> >                       sb_start_intwrite(inode->i_sb);
> >                       f2fs_i_size_write(inode, 0);
> >
> >


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
